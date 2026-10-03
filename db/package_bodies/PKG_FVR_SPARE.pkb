CREATE OR REPLACE
"PACKAGE BODY pkg_fvr_spare
"
"AS
"
"  PROCEDURE proc_cre_stk_decr_new_fvr(p_bu    fld_visit_rpt_hd.fvrh_bu%TYPE,
"
"                      p_plnt    prod_plants.prodplnt_plnt%TYPE,
"
"                      p_plnt_loc_id      fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                      p_plnt_loc_name      fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                      p_doc_no    fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                      p_user    fld_visit_rpt_hd.fvrh_cre_by%TYPE
"
"                     )
"
"  AS
"
"
"
"  CURSOR c0 IS
"
"    SELECT *
"
"      FROM fld_visit_rpt_hd
"
"     WHERE fvrh_bu = p_bu
"
"       AND fvrh_doc_no = p_doc_no;
"
"
"
"  CURSOR c1
"
"      IS
"
"  SELECT *
"
"    FROM fld_visit_rpt_hd,
"
"         fld_visit_rpt_spare_repl,
"
"         products
"
"   WHERE fvrh_bu = fvrsr_bu
"
"     AND fvrh_doc_no = fvrsr_doc_no
"
"     AND fvrsr_bu = prod_bu
"
"     AND fvrsr_prod_id = prod_id
"
"     AND fvrsr_prod_rev = prod_rev
"
"     AND fvrsr_bu = p_bu
"
"     AND fvrsr_doc_no = p_doc_no;
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
" CURSOR c_prod(c_prod_id    VARCHAR2,
"
"                c_prod_rev    NUMBER)
"
"       IS
"
"    SELECT prod_uom,prod_hsn_code,
"
"           prodplnt_cls prod_cls,
"
"          (SELECT class_desc1
"
"             FROM classes
"
"            WHERE class_bu = prod_bu
"
"              AND class_id = prodplnt_cls)prod_cls_desc,
"
"          prodplnt_sub_cls prod_sub_cls,
"
"          (SELECT subcls_desc1
"
"             FROM sub_classes
"
"            WHERE subcls_bu = prod_bu
"
"              AND subcls_id = prodplnt_sub_cls)prod_subcls_desc,
"
"          prod_group_id,
"
"         (SELECT pgrp_group_desc1
"
"            FROM prod_group
"
"           WHERE pgrp_bu = prod_bu
"
"             AND pgrp_group_id = prod_group_id) prod_grp_desc,
"
"          prod_subgroup_id,
"
"        (SELECT psgrp_subgroup_desc1
"
"           FROM prod_sub_group
"
"          WHERE psgrp_bu = prod_bu
"
"            AND psgrp_subgroup_id = prod_subgroup_id) prod_subgrp_desc,
"
"         (SELECT class_type
"
"            FROM classes
"
"           WHERE class_bu = prod_bu
"
"             AND class_id = prodplnt_cls)prod_cls_type
"
"     FROM prod_plants,products
"
"    WHERE prodplnt_bu = prod_bu
"
"      AND prodplnt_prod_id = prod_id
"
"      AND prodplnt_prod_rev = prod_rev
"
"      AND prodplnt_bu = p_bu
"
"      AND prodplnt_plnt = p_plnt
"
"      AND prodplnt_prod_id = c_prod_id
"
"      AND prodplnt_prod_rev = c_prod_rev;
"
"
"
"
"
"v_store_id        VARCHAR2(100);
"
"v_emp_defect_store    VARCHAR2(10);
"
"v_prod_cls        VARCHAR2(100);
"
"v_ref            VARCHAR2(500);
"
"var_sys_ls_no        NUMBER;
"
"var_bal_qty        NUMBER;
"
"var_upd_qty        NUMBER;
"
"p_trans_doc_no    VARCHAR2(15);
"
"v_batch_no    NUMBER(15);
"
"
"
"v_ser_sys_ls_no NUMBER;
"
"
"
"
"
"cr3        c3%ROWTYPE;
"
"cr0        c0%ROWTYPE;
"
"r_prod        c_prod%ROWTYPE;
"
"v_date      date;
"
"BEGIN
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"     v_date := sysdate;--cr1.fvrh_doc_date;
"
"
"
"      BEGIN
"
"
"
"       SELECT store_id
"
"     INTO v_store_id
"
"     FROM stores
"
"    WHERE store_bu = p_bu
"
"      AND store_plnt = p_plnt
"
"      AND store_inv_id = cr1.fvrh_csr_emp_id
"
"      AND store_physical = 'L';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20270,'ICM '||'~'||p_bu||'~'||p_plnt||'~'||cr1.fvrh_csr_emp_id);
"
"      END;
"
"
"
"      BEGIN
"
"
"
"        SELECT prodplnt_cls
"
"            INTO v_prod_cls
"
"            FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"             AND prodplnt_plnt = p_plnt
"
"             AND prodplnt_prod_id = cr1.fvrsr_prod_id
"
"             AND prodplnt_prod_rev = cr1.fvrsr_prod_rev;
"
"
"
"      END;
"
"
"
"      OPEN c_prod(cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev);
"
"      FETCH c_prod INTO r_prod;
"
"      CLOSE c_prod;
"
"
"
"        proc_upd_stocks(p_bu,
"
"                      v_store_id,
"
"                      NULL,
"
"                      cr1.fvrsr_prod_id,
"
"                      cr1.fvrsr_prod_rev,
"
"                      0,
"
"                      0,
"
"                      -cr1.fvrsr_repl_qty,
"
"                      0,
"
"                      0,
"
"                      '0.001',
"
"                      '0.001',
"
"                      0,
"
"                      'N',
"
"                      0,
"
"                      0,
"
"                      0,
"
"                      cr1.fvrsr_seq_no,
"
"                      cr1.fvrsr_seq_no,
"
"                      NULL,
"
"                      p_doc_no,
"
"                      NULL,
"
"                      p_doc_no,
"
"                      NULL,
"
"                      func_find_year(p_bu,v_date),
"
"                      func_find_period(p_bu,v_date),
"
"                      v_date,
"
"                      NULL,
"
"                      'CRM',
"
"                      'CMR',
"
"                      NULL,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      NULL,
"
"                      v_prod_cls,
"
"                      NULL,
"
"                      'FV',
"
"                      NULL,
"
"                      0,
"
"                      0,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      NULL,
"
"                      cr1.fvrsr_seq_no,
"
"                      NULL,
"
"                      0,
"
"                      0,
"
"                      'FIELD VISIT SPARES DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                      'FIELD VISIT SPARES DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"            p_prod_cls_desc     => r_prod.prod_cls_desc,
"
"                        p_prod_sub_cls_id   => r_prod.prod_sub_cls,
"
"                        p_prod_sub_cls_desc => r_prod.prod_subcls_desc,
"
"                        p_prod_grp_id       => r_prod.prod_group_id,
"
"                        p_prod_grp_desc     => r_prod.prod_grp_desc,
"
"                        p_prod_sub_grp_id   => r_prod.prod_subgroup_id,
"
"                        p_prod_sub_grp_desc => r_prod.prod_subgrp_desc,
"
"                        p_prod_cls_type     => r_prod.prod_cls_type
"
"                 );
"
"
"
"      IF func_find_prod_ser_lot_type(p_bu,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev) IN ('L','O','S') THEN
"
"
"
"        IF cr1.fvrsr_sys_ls_no IS NULL THEN
"
"          BEGIN
"
"            SELECT lss_sys_ls_no
"
"              INTO v_ser_sys_ls_no
"
"              FROM lot_ser_stocks
"
"             WHERE lss_bu = p_bu
"
"               AND lss_prod_id = cr1.fvrsr_prod_id
"
"               AND lss_prod_rev = cr1.fvrsr_prod_rev
"
"               AND lss_ser_no = cr1.fvrsr_serial_no
"
"               AND lss_Store_id = v_store_id
"
"               AND lss_qty_hand > 0;
"
"          END;
"
"        ELSE
"
"          v_ser_sys_ls_no := cr1.fvrsr_sys_ls_no;
"
"        END IF;
"
"
"
"        proc_upd_lot_ser_stocks(p_bu,
"
"                    v_store_id,
"
"                    cr1.fvrsr_prod_id,
"
"                    cr1.fvrsr_prod_rev,
"
"                    v_ser_sys_ls_no,--cr1.fvrsr_sys_ls_no,
"
"                    -cr1.fvrsr_repl_qty,
"
"                    0,
"
"                    0,
"
"                    '0.001',
"
"                    cr1.prod_ser_lot_opt,
"
"                    NULL,
"
"                    cr1.fvrsr_serial_no,
"
"                    'S',
"
"                            v_store_id,
"
"                                func_find_prod_expiry_date(p_bu,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev,TRUNC(v_date)),
"
"                                TRUNC(v_date),
"
"                                'CMR',
"
"                                NULL,
"
"                                cr1.fvrsr_doc_no,
"
"                                cr1.fvrsr_seq_no,
"
"                                'CRM',
"
"                                'FIELD VISIT SPARES DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                                'FIELD VISIT SPARES DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                                p_user
"
"                               );
"
"
"
"      END IF;
"
"
"
"        IF func_find_prod_cost_method(p_bu,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev) NOT IN ('MAC') THEN
"
"
"
"     var_bal_qty := cr1.fvrsr_repl_qty;
"
"
"
"     FOR cr3 IN c3(v_store_id,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev)
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
"         proc_upd_stock_batches(p_bu,
"
"                    v_store_id,
"
"                    cr1.fvrsr_prod_id,
"
"                    cr1.fvrsr_prod_rev,
"
"                    cr3.sb_batch_id,
"
"                    0,
"
"                    var_upd_qty,
"
"                    0,
"
"                    0,
"
"                    '0.001',
"
"                    '0.001',
"
"                    0,
"
"                    0 ,
"
"                    0 ,
"
"                    0,
"
"                    'N',
"
"                    v_date,
"
"                    NULL      ,
"
"                    p_doc_no       ,
"
"                    cr1.fvrsr_seq_no,
"
"                    NULL,
"
"                    NULL,
"
"                    p_doc_no,
"
"                    cr1.fvrsr_seq_no  ,
"
"                    NULL,
"
"                    func_find_product_class(p_bu,p_plnt,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev),
"
"                    'CMR',
"
"                    'ICM',
"
"                    p_doc_no,
"
"                    v_date,
"
"                    NULL,
"
"                    NULL,
"
"                    p_user,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    'FIELD VISIT SPARES DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                    'FIELD VISIT SPARES DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                    p_prod_cls_desc     => r_prod.prod_cls_desc,
"
"                                        p_prod_subcls   => r_prod.prod_sub_cls,
"
"                                        p_prod_subcls_desc => r_prod.prod_subcls_desc,
"
"                                        p_prod_grp       => r_prod.prod_group_id,
"
"                                        p_prod_grp_desc     => r_prod.prod_grp_desc,
"
"                                        p_prod_subgrp   => r_prod.prod_subgroup_id,
"
"                                        p_prod_subgrp_desc => r_prod.prod_subgrp_desc,
"
"                                        p_prod_cls_type     => r_prod.prod_cls_type
"
"                    );
"
"
"
"
"
"          IF var_bal_qty = 0 THEN
"
"            EXIT;
"
"              END IF;
"
"
"
"            END LOOP c3;
"
"
"
"        END IF;
"
"
"
"         BEGIN
"
"           SELECT store_id
"
"         INTO v_emp_defect_store
"
"         FROM stores
"
"        WHERE store_bu = p_bu
"
"          AND store_plnt = p_plnt
"
"          AND store_inv_id = cr1.fvrh_csr_emp_id
"
"          AND store_physical = 'N';
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20270,'ICM '||'~'||p_bu||'~'||p_plnt||'~'||cr1.fvrh_csr_emp_id);
"
"          END;
"
"
"
"            proc_upd_stocks(p_bu,
"
"                    v_emp_defect_store,
"
"                    NULL,
"
"                    cr1.fvrsr_prod_id,
"
"                    cr1.fvrsr_prod_rev,
"
"                    0,
"
"                    0,
"
"                    cr1.fvrsr_repl_qty,
"
"                    0,
"
"                    0,
"
"                    '0.001',
"
"                    '0.001',
"
"                    0,
"
"                    'N',
"
"                    0,
"
"                    0,
"
"                    0,
"
"                    cr1.fvrsr_seq_no,
"
"                    cr1.fvrsr_seq_no,
"
"                    NULL,
"
"                    p_doc_no,
"
"                    NULL,
"
"                    p_doc_no,
"
"                    NULL,
"
"                    func_find_year(p_bu,v_date),
"
"                    func_find_period(p_bu,v_date),
"
"                    v_date,
"
"                    NULL,
"
"                    'CRM',
"
"                    'CMR',
"
"                    NULL,
"
"                    p_user,
"
"                    SYSDATE,
"
"                    NULL,
"
"                    v_prod_cls,
"
"                    NULL,
"
"                    'FV',
"
"                    NULL,
"
"                    0,
"
"                    0,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    cr1.fvrsr_seq_no,
"
"                    NULL,
"
"                    0,
"
"                    0,
"
"                    'FIELD VISIT SPARES INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                    'FIELD VISIT SPARES INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                  p_prod_cls_desc     => r_prod.prod_cls_desc,
"
"                              p_prod_sub_cls_id   => r_prod.prod_sub_cls,
"
"                              p_prod_sub_cls_desc => r_prod.prod_subcls_desc,
"
"                              p_prod_grp_id       => r_prod.prod_group_id,
"
"                              p_prod_grp_desc     => r_prod.prod_grp_desc,
"
"                              p_prod_sub_grp_id   => r_prod.prod_subgroup_id,
"
"                              p_prod_sub_grp_desc => r_prod.prod_subgrp_desc,
"
"                              p_prod_cls_type     => r_prod.prod_cls_type
"
"                   );
"
"      IF func_find_prod_ser_lot_type(p_bu,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev) IN ('L','O','S') THEN
"
"
"
"          IF (cr1.fvrsr_old_serial_no IS NULL AND cr1.fvrsr_serial_no IS NOT NULL) OR (cr1.fvrsr_old_serial_no IS NOT NULL AND cr1.fvrsr_serial_no IS NULL) THEN
"
"            Raise_Application_Error(-20999,'HRM');
"
"          END IF;
"
"
"
"      var_sys_ls_no := NULL;
"
"
"
"            proc_lot_ser_operation(p_bu,
"
"                                  v_emp_defect_store,
"
"                                  cr1.fvrsr_prod_id,
"
"                                  cr1.fvrsr_prod_rev,
"
"                                  cr1.prod_ser_lot_opt,
"
"                                  var_sys_ls_no,
"
"                                  NULL,
"
"                                  cr1.fvrsr_old_serial_no,
"
"                                  'S',
"
"                                  v_emp_defect_store,
"
"                                  v_date,
"
"                                  NULL,
"
"                                  cr1.fvrsr_repl_qty,
"
"                                  '0.001',
"
"                                  1,
"
"                                  'I',
"
"                                  v_date,
"
"                                  'CMR',
"
"                                  NULL,
"
"                                  cr1.fvrh_doc_no,
"
"                                  cr1.fvrsr_seq_no,
"
"                                  1,
"
"                                  'CRM',
"
"                            'FIELD VISIT SPARES INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                          'FIELD VISIT SPARES INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                                  p_user
"
"                                 );
"
"
"
"         BEGIN
"
"
"
"          SELECT plsn_sys_ls_no
"
"            INTO var_sys_ls_no
"
"            FROM prod_lot_ser_nos
"
"           WHERE plsn_bu  = p_bu
"
"             AND plsn_prod_id = cr1.fvrsr_prod_id
"
"             AND plsn_prod_rev = cr1.fvrsr_prod_rev
"
"             AND plsn_ser_no = cr1.fvrsr_old_serial_no
"
"             AND rownum = 1;
"
"
"
"     EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       Raise_Application_Error(-20970,'ICM '||p_bu||'~'||cr1.fvrsr_prod_id||'~'||cr1.fvrsr_prod_rev||'~'||cr1.fvrsr_old_serial_no);
"
"     END;
"
"
"
"         DBMS_OUTPUT.PUT_LINE(cr1.fvrsr_prod_id||'-'||cr1.fvrsr_prod_rev||'-'||cr1.fvrsr_old_serial_no||'-'||var_sys_ls_no);
"
"
"
"    --Raise_APplication_Error(-20999,'HRM'||'~'||cr1.fvrsr_prod_id||'-'||cr1.fvrsr_prod_rev||'-'||cr1.fvrsr_old_serial_no||'-'||var_sys_ls_no);
"
"
"
"      UPDATE fld_visit_rpt_spare_repl
"
"         SET fvrsr_old_sys_ls_no = var_sys_ls_no
"
"       WHERE fvrsr_bu = p_bu
"
"         AND fvrsr_doc_no = p_doc_no
"
"         AND fvrsr_seq_no = cr1.fvrsr_seq_no;
"
"
"
"    END IF;
"
"
"
"         IF func_find_prod_cost_method(p_bu,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev) IN ('LIFO','FIFO') THEN
"
"
"
"           /*    proc_upd_stock_batches(p_bu,
"
"                    v_emp_defect_store,
"
"                    cr1.fvrsr_prod_id,
"
"                    cr1.fvrsr_prod_rev,
"
"                    null,
"
"                    cr1.fvrsr_repl_qty,
"
"                    0,
"
"                    0,
"
"                    0,
"
"                    '0.001',
"
"                    '0.001',
"
"                    0,
"
"                    0 ,
"
"                    0 ,
"
"                    0,
"
"                    'N',
"
"                    cr1.fvrh_doc_date,
"
"                    NULL      ,
"
"                    p_doc_no       ,
"
"                    cr1.fvrsr_seq_no,
"
"                    NULL,
"
"                    NULL,
"
"                    p_doc_no,
"
"                    cr1.fvrsr_seq_no  ,
"
"                    NULL,
"
"                    func_find_product_class(p_bu,p_plnt,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev),
"
"                    'CMR',
"
"                    'ICM',
"
"                    p_doc_no,
"
"                    cr1.fvrh_doc_date,
"
"                    NULL,
"
"                    NULL,
"
"                    p_user,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    'FIELD VISIT SPARES INCREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                    'FIELD VISIT SPARES INCREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                    p_prod_cls_desc     => r_prod.prod_cls_desc,
"
"                                        p_prod_subcls   => r_prod.prod_sub_cls,
"
"                                        p_prod_subcls_desc => r_prod.prod_subcls_desc,
"
"                                        p_prod_grp       => r_prod.prod_group_id,
"
"                                        p_prod_grp_desc     => r_prod.prod_grp_desc,
"
"                                        p_prod_subgrp   => r_prod.prod_subgroup_id,
"
"                                        p_prod_subgrp_desc => r_prod.prod_subgrp_desc,
"
"                                        p_prod_cls_type     => r_prod.prod_cls_type
"
"                    );
"
"                    */
"
"                    v_batch_no := func_find_batch_nextno(p_bu,v_emp_defect_store,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev,p_user);
"
"
"
"                 INSERT INTO stocks_batches(sb_bu,
"
"                                            sb_store_id,
"
"                                            sb_prod_id,
"
"                                            sb_prod_rev,
"
"                                            sb_cost_method,
"
"                                            sb_batch_id,
"
"                                            sb_qty_in,
"
"                                            sb_bc_unit_cost,
"
"                                            sb_upd_bc_cost,
"
"                                            sb_fc_unit_cost,
"
"                                            sb_bc_chrg_cost,
"
"                                            sb_bc_non_chrg_cost,
"
"                                            sb_bc_land_cost,
"
"                                            sb_bc_disc_amt,
"
"                                            sb_bc_net_disc_flag,
"
"                                            sb_receipt_pfx,
"
"                                            sb_po_no,
"
"                                            sb_receipt_seq_no,
"
"                                            sb_upd_vou_pfx,
"
"                                            sb_upd_vou_no,
"
"                                            sb_upd_vou_line_no,
"
"                                            sb_ord_type,
"
"                                            sb_ord_pfx,
"
"                                            sb_ord_no,
"
"                                            sb_ord_seq_no,
"
"                                            sb_ord_sub_seq_no,
"
"                                            sb_source_doc,
"
"                                            sb_appl,
"
"                                            sb_ord_year,
"
"                                            sb_ord_period,
"
"                                            sb_trans_date,
"
"                                            sb_class_id,
"
"                                            sb_cre_by,
"
"                                            sb_cre_date,
"
"                                            sb_grn_bill_no,
"
"                                            sb_grn_bill_date,
"
"                                            sb_grn_dc_no,
"
"                                            sb_grn_dc_date,
"
"                                            sb_upd_cost_flag,
"
"                                            sb_suplr_id,
"
"                                            sb_cust_id,
"
"                                            sb_stock_adj_pfx,
"
"                                            sb_upd_ref1,
"
"                                            sb_upd_ref2,
"
"                                     sb_rcpt_unit_cost,
"
"                                     sb_store_plnt
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            v_emp_defect_store,
"
"                                            cr1.fvrsr_prod_id,
"
"                                            cr1.fvrsr_prod_rev,
"
"                                            func_find_prod_cost_method(p_bu,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev),
"
"                                            v_batch_no,
"
"                                            cr1.fvrsr_repl_qty,
"
"                                            '0.001',
"
"                                            '0.001',
"
"                                            '0.001',
"
"                                            0,
"
"                                            0,
"
"                                            0,
"
"                                            0,
"
"                                            'N',
"
"                                            NULL,
"
"                                            p_doc_no,
"
"                                            cr1.fvrsr_seq_no,
"
"                                            NULL,
"
"                                            p_doc_no,
"
"                                            cr1.fvrsr_seq_no,
"
"                                            'PO',
"
"                                            NULL,
"
"                                            p_doc_no,
"
"                                            cr1.fvrsr_seq_no,
"
"                                            NULL,
"
"                                            'CMR',
"
"                                            'ICM',
"
"                                            func_find_year(p_bu,v_date),
"
"                                            func_find_period(p_bu,v_date),
"
"                                            v_date,
"
"                                            func_find_product_class(p_bu,p_plnt,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev),
"
"                                            p_user,
"
"                                            SYSDATE,
"
"                                            NULL,
"
"                                            v_date,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            'Y',
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            'FIELD VISIT SPARES INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                                            'FIELD VISIT SPARES INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrsr_seq_no||')',
"
"                                0.001,
"
"                                cr1.fvrh_csr_assign_to_plnt
"
"                                            );
"
"
"
"    UPDATE fld_visit_rpt_spare_repl
"
"         SET fvrsr_batch_no = v_batch_no
"
"       WHERE fvrsr_bu = p_bu
"
"         AND fvrsr_doc_no = p_doc_no
"
"         AND fvrsr_seq_no = cr1.fvrsr_seq_no;
"
"
"
"    --Raise_Application_Error(-20999,'HRM Batch'||'-'||v_emp_defect_store||'-'||cr1.fvrsr_prod_id||'-'||v_batch_no||'-'||cr1.fvrsr_repl_qty);
"
"          END IF;
"
"
"
"     SELECT NVL(MAX(TO_NUMBER(cmt_doc_no)),0) + 1
"
"       INTO p_trans_doc_no
"
"           FROM csd_mtrl_trckg
"
"          WHERE cmt_bu = p_bu;
"
"
"
"     INSERT INTO csd_mtrl_trckg(cmt_bu,
"
"                    cmt_doc_no,
"
"                    cmt_trans_date,
"
"                    cmt_store_id,
"
"                    cmt_prod_id,
"
"                    cmt_prod_rev,
"
"                    cmt_serial_no,
"
"                    cmt_csr_id,
"
"                    cmt_serv_wo_no,
"
"                    cmt_wo_asgn_unit,
"
"                    cmt_csr_no,
"
"                    cmt_trans_qty,
"
"                    cmt_tranit_qty,
"
"                    cmt_wo_qty,
"
"                    cmt_buf_stk_qty,
"
"                    cmt_rpr_comp_flag,
"
"                    cmt_cre_by,
"
"                    cmt_cre_date,
"
"                    cmt_sys_ls_no,
"
"                    cmt_source_type,
"
"                    cmt_source_id,
"
"                    cmt_batch_no,
"
"                    cmt_bucket_type,
"
"                    cmt_fv_type,
"
"                    cmt_fvr_no,
"
"                    cmt_fvr_seq_no,
"
"                    cmt_unit_cost,
"
"                    cmt_sou_plnt,
"
"                    cmt_cust_id,
"
"                    cmt_prod_cls_id,
"
"                    cmt_prod_cls_desc,
"
"                    cmt_prod_subcls_id,
"
"                    cmt_prod_subcls_desc,
"
"                    cmt_prod_grp_id,
"
"                    cmt_prod_grp_desc,
"
"                    cmt_prod_subgrp_id,
"
"                    cmt_prod_subgrp_desc,
"
"                    cmt_prod_cls_type
"
"                    )
"
"                        VALUES (p_bu,
"
"                    p_trans_doc_no,
"
"                            cr1.fvrh_doc_date,
"
"                            v_emp_defect_store,
"
"                            cr1.fvrsr_prod_id,
"
"                            cr1.fvrsr_prod_rev,
"
"                            cr1.fvrsr_old_serial_no,
"
"                            cr1.fvrh_csr_id,
"
"                            cr1.fvrh_swo_no,
"
"                            cr1.fvrh_csr_assign_to_plnt,
"
"                            cr1.fvrh_csr_doc_no,
"
"                            cr1.fvrsr_repl_qty,
"
"                            0,
"
"                            0,
"
"                            0,
"
"                            'N',
"
"                            p_user,
"
"                            SYSDATE,
"
"                    var_sys_ls_no,
"
"                    'S',
"
"                    v_emp_defect_store,
"
"                    v_batch_no,
"
"                    'QOH',
"
"                    'FR',
"
"                    p_doc_no,
"
"                    cr1.fvrsr_seq_no,
"
"                    0.001,
"
"                    cr1.fvrh_csr_assign_to_plnt,
"
"                    cr1.fvrh_cust_id,
"
"                                    (SELECT prodplnt_cls
"
"                                       FROM prod_plants
"
"                                      WHERE prodplnt_bu = p_bu
"
"                        AND prodplnt_plnt = cr1.fvrh_csr_assign_to_plnt
"
"                                        AND prodplnt_prod_id = cr1.fvrsr_prod_id
"
"                                        AND prodplnt_prod_rev = cr1.fvrsr_prod_rev),
"
"                                    (SELECT class_desc1
"
"                                       FROM classes
"
"                                      WHERE class_bu = p_bu
"
"                                        AND class_id = (SELECT prodplnt_cls
"
"                                                          FROM prod_plants
"
"                                                         WHERE prodplnt_bu = p_bu
"
"                               AND prodplnt_plnt = cr1.fvrh_csr_assign_to_plnt
"
"                                                           AND prodplnt_prod_id = cr1.fvrsr_prod_id
"
"                                                           AND prodplnt_prod_rev = cr1.fvrsr_prod_rev)),
"
"                                    (SELECT prodplnt_sub_cls
"
"                                       FROM prod_plants
"
"                                      WHERE prodplnt_bu = p_bu
"
"                        AND prodplnt_plnt = cr1.fvrh_csr_assign_to_plnt
"
"                                        AND prodplnt_prod_id = cr1.fvrsr_prod_id
"
"                                        AND prodplnt_prod_rev = cr1.fvrsr_prod_rev),
"
"                                    (SELECT subcls_desc1
"
"                                       FROM sub_classes
"
"                                      WHERE subcls_bu = p_bu
"
"                                        AND subcls_id = (SELECT prodplnt_sub_cls
"
"                                                           FROM prod_plants
"
"                                                          WHERE prodplnt_bu = p_bu
"
"                                AND prodplnt_plnt = cr1.fvrh_csr_assign_to_plnt
"
"                                                            AND prodplnt_prod_id = cr1.fvrsr_prod_id
"
"                                                            AND prodplnt_prod_rev = cr1.fvrsr_prod_rev)) ,
"
"                                    (SELECT prod_group_id
"
"                                       FROM products
"
"                                      WHERE prod_bu = p_bu
"
"                                        AND prod_id = cr1.fvrsr_prod_id
"
"                                        AND prod_rev = cr1.fvrsr_prod_rev),
"
"                                    (SELECT pgrp_group_desc1
"
"                                       FROM prod_group
"
"                                      WHERE pgrp_bu = p_bu
"
"                                        AND pgrp_group_id = (SELECT prod_group_id
"
"                                                               FROM products
"
"                                                              WHERE prod_bu = p_bu
"
"                                                                AND prod_id = cr1.fvrsr_prod_id
"
"                                                                AND prod_rev = cr1.fvrsr_prod_rev)),
"
"                                    (SELECT prod_subgroup_id
"
"                                       FROM products
"
"                                      WHERE prod_bu = p_bu
"
"                                        AND prod_id = cr1.fvrsr_prod_id
"
"                                        AND prod_rev = cr1.fvrsr_prod_rev),
"
"                    (SELECT psgrp_subgroup_desc1
"
"                       FROM prod_sub_group
"
"                      WHERE psgrp_bu = p_bu
"
"                        AND psgrp_subgroup_id = (SELECT prod_subgroup_id
"
"                                                   FROM products
"
"                                                  WHERE prod_bu = p_bu
"
"                                                    AND prod_id = cr1.fvrsr_prod_id
"
"                                                    AND prod_rev = cr1.fvrsr_prod_rev)),
"
"                                    func_find_prod_class_type(p_bu,cr1.fvrh_csr_assign_to_plnt,cr1.fvrsr_prod_id,cr1.fvrsr_prod_rev)
"
"                    );
"
"
"
"   UPDATE fld_visit_rpt_spare_repl
"
"      SET fvrsr_cmt_doc_no = p_trans_doc_no
"
"    WHERE fvrsr_bu = p_bu
"
"      AND fvrsr_doc_no = p_doc_no
"
"      AND fvrsr_seq_no = cr1.fvrsr_seq_no;
"
"
"
"   END LOOP c1;
"
"
"
"
"
"     IF v_emp_defect_store IS NOT NULL THEN
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||v_emp_defect_store);
"
"   OPEN c0;
"
"   FETCH c0 INTO cr0;
"
"     IF c0%FOUND THEN
"
"
"
"     proc_cre_mi_frm_fvr_rplce(p_bu,
"
"                   p_plnt,
"
"                   p_plnt_loc_id,
"
"                   p_plnt_loc_name,
"
"                   v_date,--cr0.fvrh_doc_date,
"
"                   p_doc_no,
"
"                   v_emp_defect_store,
"
"                   p_user,
"
"                   1
"
"                   );
"
"
"
"     END IF;
"
"   CLOSE c0;
"
"   END IF;
"
"
"
"
"
"  proc_validate_stocks(p_bu);
"
"END proc_cre_stk_decr_new_fvr;
"
"
"
"
"
"PROCEDURE proc_cre_mi_frm_fvr_rplce(p_bu        business_units.bu_id%TYPE,
"
"                                    p_plnt        bus_unit_plants.bup_plant_id%TYPE,
"
"                                    p_plnt_loc_id      fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                                    p_plnt_loc_name      fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                                    p_date        DATE,
"
"                                    p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                                    p_frm_store_id    stores.store_id%TYPE,
"
"                                    p_user        VARCHAR2,
"
"                                    p_lang        NUMBER
"
"                    )
"
"IS
"
"
"
"CURSOR c11 IS
"
"  SELECT fvrsr_prod_id,
"
"         fvrsr_prod_rev,
"
"         fvrsr_cmt_doc_no,
"
"         fvrsr_serial_no,
"
"         SUM(fvrsr_repl_qty) fvrsr_repl_qty
"
"    FROM fld_visit_rpt_hd,
"
"         fld_visit_rpt_spare_repl
"
"   WHERE fvrh_bu = fvrsr_bu
"
"     AND fvrh_doc_no = fvrsr_doc_no
"
"     AND fvrsr_bu = p_bu
"
"     AND fvrsr_doc_no = p_doc_no
"
"     GROUP BY fvrsr_prod_id,
"
"              fvrsr_prod_rev,
"
"              fvrsr_cmt_doc_no,
"
"              fvrsr_serial_no;
"
"
"
"/*fvrsr_old_serial_no,fvrsr_old_sys_ls_no;*/
"
"
"
"CURSOR c2(c_store_id VARCHAR2,c_prod_id VARCHAR2,c_prod_rev NUMBER) IS
"
"  SELECT batch_id,sb_avail_qty,sb_bc_unit_cost
"
"    FROM (SELECT sb_batch_id batch_id,(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) sb_avail_qty,
"
"                 sb_bc_unit_cost
"
"            FROM stocks_batches,products
"
"           WHERE sb_bu = prod_bu
"
"             AND sb_prod_id = prod_id
"
"             AND sb_prod_rev = prod_rev
"
"             AND prod_cost_method = 'FIFO'
"
"             AND sb_bu = p_bu
"
"             AND sb_store_id = c_store_id
"
"             AND sb_prod_id = c_prod_id
"
"             AND sb_prod_rev = c_prod_rev
"
"             AND sb_cost_method = 'FIFO'
"
"             AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_defect + sb_qty_picked)) > 0)
"
"   ORDER BY batch_id ASC;
"
"
"
"CURSOR c3(c_store_id VARCHAR2,c_prod_id VARCHAR2,c_prod_rev NUMBER) IS
"
"  SELECT batch_id,sb_avail_qty,sb_bc_unit_cost
"
"    FROM (SELECT sb_batch_id batch_id,(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) sb_avail_qty,
"
"                 sb_bc_unit_cost
"
"            FROM stocks_batches,products
"
"           WHERE sb_bu = prod_bu
"
"             AND sb_prod_id = prod_id
"
"             AND sb_prod_rev = prod_rev
"
"             AND prod_cost_method = 'LIFO'
"
"             AND sb_bu = p_bu
"
"             AND sb_store_id = c_store_id
"
"             AND sb_prod_id = c_prod_id
"
"             AND sb_prod_rev = c_prod_rev
"
"             AND sb_cost_method = 'LIFO'
"
"             AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0)
"
"   ORDER BY batch_id DESC;
"
"
"
"CURSOR c4(c_store_id VARCHAR2,c_prod_id VARCHAR2,c_prod_rev NUMBER,c_batch_id VARCHAR2) IS
"
"  SELECT SUM(batch_qty) batch_qty
"
"    FROM (SELECT NVL(SUM(istcb_trans_qty),0) batch_qty
"
"            FROM inv_stock_trans_hd,
"
"           inv_stock_trans_ln,
"
"           inv_stock_trans_cost_batch,
"
"           stocks_batches
"
"           WHERE isthd_bu = istln_bu
"
"         AND isthd_doc_no = istln_doc_no
"
"         AND istln_bu = istcb_bu
"
"         AND istln_doc_no = istcb_doc_no
"
"         AND istln_seq_no = istcb_seq_no
"
"         AND istln_status IN ('N','T')
"
"         AND istcb_bu = p_bu
"
"         AND istcb_bu = sb_bu
"
"         AND sb_prod_id = c_prod_id
"
"         AND sb_prod_rev = c_prod_rev
"
"         AND sb_store_id = c_store_id
"
"         --AND sb_batch_id = c_batch_id
"
"         AND (sb_batch_id = istcb_batch_no OR istcb_batch_no IS NULL)
"
"         AND istln_prod_id = sb_prod_id
"
"         AND istln_prod_rev = sb_prod_rev
"
"         AND isthd_issuefm_store_id = sb_store_id
"
"        );
"
"
"
"  v_issdoc_no        VARCHAR2(30);
"
"  v_seq_no        NUMBER    := 0;
"
"  v_issuer_id        VARCHAR2(30);
"
"  v_issuer_name        VARCHAR2(60);
"
"  v_issuer_pos_id    VARCHAR2(30);
"
"  v_issuer_pos_name    VARCHAR2(60);
"
"  dummy1        VARCHAR2(100);
"
"  dummy2        VARCHAR2(100);
"
"  v_year        NUMBER;
"
"  v_period        NUMBER;
"
"
"
"  var_dc_no        VARCHAR2(1000);
"
"  var_pack_no        VARCHAR2(1000);
"
"
"
"  var_qty        NUMBER;
"
"  v_sum_qty        NUMBER;
"
"  v_cnt            NUMBER;
"
"  var_elg_qty        NUMBER;
"
"  v_avail_qty        NUMBER;
"
"  v_flag        VARCHAR2(1);
"
"  v_msg_cnt        NUMBER;
"
"
"
"  var_lot_bal_qty    NUMBER;
"
"  var_lot_proc_qty    NUMBER;
"
"  v_cust_defect_wh    VARCHAR2(10);
"
"  var_lot_seq_no     NUMBER(5);
"
"  var_lot_seq_no1    NUMBER(5);
"
"  v_sys_ls_no         NUMBER(20);
"
"  v_source_type     VARCHAR2(10);
"
"  v_source_id         VARCHAR2(30);
"
"  v_ser_lot_opt        VARCHAR2(1);
"
"  v_inv_batch_qty   NUMBER;
"
"  v_date        date;
"
"  var_doc_pfx   VARCHAR2(10);
"
"BEGIN
"
"
"
"  proc_get_emp_det(p_bu,
"
"             p_user,
"
"             v_issuer_id,
"
"             v_issuer_name,
"
"             v_issuer_pos_id,
"
"             v_issuer_pos_name,
"
"             dummy1,
"
"             dummy2,
"
"             p_lang
"
"          );
"
"  v_date := sysdate;--p_date;
"
"  v_year := func_find_year(p_bu,v_date);
"
"  v_period := func_find_period(p_bu,v_date);
"
"
"
"  var_doc_pfx := func_find_vou_dflt_pfx(p_bu,p_plnt,p_plnt_loc_id,'MIV','MIV');
"
"  v_issdoc_no := func_find_pfx_nextno(p_bu,v_date,var_doc_pfx,p_user);
"
"
"
"
"
"  IF func_find_store_bin_flag(p_bu,p_frm_store_id) = 'Y' THEN
"
"    Raise_Application_Error(-20999,'HRM');
"
"  END IF;
"
"
"
"  BEGIN
"
"    SELECT store_id
"
"      INTO v_cust_defect_wh
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = p_plnt
"
"       AND store_physical = 'E';
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    Raise_Application_Error(-20768,'ICM '||'Cust. Serv. (DC) W/H Need to Create'||p_bu);
"
"  END;
"
"
"
"  INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"                 isthd_plnt,
"
"                 isthd_ref_unit,
"
"                 isthd_doc_pfx,
"
"                 isthd_doc_no,
"
"                 isthd_doc_oper,
"
"                 isthd_issuefm_store_id,
"
"                 isthd_issueto_type,
"
"                 isthd_issueto_id,
"
"                 isthd_trans_date,
"
"                 isthd_year,
"
"                 isthd_period,
"
"                 isthd_status,
"
"                 isthd_reference,
"
"                 isthd_issuer_id,
"
"                 isthd_issuer_name,
"
"                 isthd_issuer_pos_id,
"
"                 isthd_issuer_pos_name,
"
"                 isthd_cre_by,
"
"                 isthd_cre_ip_addr,
"
"                 isthd_cre_os_user,
"
"                 isthd_cre_emp_id,
"
"                 isthd_cre_date,
"
"                 isthd_rec_src_flag,
"
"                 isthd_plnt_loc_id,
"
"                 isthd_plnt_loc_name,
"
"                 isthd_issueto_plnt,
"
"                 isthd_issueto_plnt_loc_id
"
"                )
"
"              VALUES(p_bu,
"
"                 p_plnt,
"
"                 p_plnt,
"
"                 var_doc_pfx,
"
"                 v_issdoc_no,
"
"                 'T',
"
"                 p_frm_store_id,
"
"                 'S',
"
"                 v_cust_defect_wh,
"
"                 v_date,
"
"                 v_year,
"
"                 v_period,
"
"                 'N',
"
"                 'MATERIAL ISSUANCE CREATED FROM FVR - REPLACE MATERIAL',
"
"                 v_issuer_id,
"
"                 v_issuer_name,
"
"                 v_issuer_pos_id,
"
"                 v_issuer_pos_name,
"
"                 p_user,
"
"                 Audit_Info.Get_IP_Address,
"
"                 Audit_Info.Get_OS_User,
"
"                 func_find_emp_id(p_bu,p_user),
"
"                 SYSDATE,
"
"                 'M',
"
"                 p_plnt_loc_id,
"
"                 p_plnt_loc_name,
"
"                 p_plnt,
"
"                 p_plnt_loc_id
"
"                );
"
"
"
"  v_seq_no := 1;
"
"
"
"  FOR cr11 IN c11
"
"  LOOP
"
"
"
"  --Raise_application_Error(-20999,'HRM'||'~'||var_qty||'~'||cr11.fvrsr_repl_qty);
"
"    INSERT INTO inv_stock_trans_ln(istln_bu,
"
"                   istln_doc_no,
"
"                   istln_seq_no,
"
"                   istln_prod_id,
"
"                   istln_prod_rev,
"
"                   istln_uom,
"
"                   istln_prod_uom,
"
"                   istln_conv_factor,
"
"                   istln_prod_cls,
"
"                   istln_rqst_qty,
"
"                   istln_trans_qty,
"
"                   istln_accepted_qty,
"
"                   istln_unit_cost,
"
"                   istln_reference,
"
"                   istln_status,
"
"                   istln_ord_qty,
"
"                   istln_mat_type,
"
"                   istln_cre_by,
"
"                   istln_cre_ip_addr,
"
"                   istln_cre_os_user,
"
"                   istln_cre_emp_id,
"
"                   istln_cre_date,
"
"                   istln_type,
"
"                   istln_ord_type,
"
"                   istln_ord_pfx,
"
"                   istln_ord_no,
"
"                   istln_ord_seq_no,
"
"                   istln_ord_sub_seq_no,
"
"           istln_stk_trans_qty
"
"                  )
"
"                VALUES(p_bu,
"
"                   v_issdoc_no,
"
"                   v_seq_no,
"
"                   cr11.fvrsr_prod_id,
"
"                   cr11.fvrsr_prod_rev,
"
"                   func_find_product_uom(p_bu,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev),
"
"                   func_find_product_uom(p_bu,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev),
"
"                   1,
"
"                   func_find_product_class(p_bu,p_plnt,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev),
"
"                   cr11.fvrsr_repl_qty,
"
"                   cr11.fvrsr_repl_qty,
"
"                   cr11.fvrsr_repl_qty,
"
"                   0.001,
"
"                   'MATERIAL ISSUANCE CREATED FROM FVR - REPLACE MATERIAL',
"
"                   'N',
"
"                   0,
"
"                   'S',
"
"                   p_user,
"
"                 Audit_Info.Get_IP_Address,
"
"                 Audit_Info.Get_OS_User,
"
"                 func_find_emp_id(p_bu,p_user),
"
"                   SYSDATE,
"
"                   'NA',
"
"                   'FR',--Field Visit Replace
"
"                   NULL,
"
"                   cr11.fvrsr_cmt_doc_no,
"
"                   NULL,
"
"                   NULL,
"
"           cr11.fvrsr_repl_qty
"
"                  );
"
"
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
"                          cr11.fvrsr_prod_id,
"
"                          cr11.fvrsr_prod_rev,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          cr11.fvrsr_repl_qty,
"
"                          0.001,
"
"                          0.001,
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
"                          v_date,
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
"                          func_find_product_class(p_bu,p_plnt,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev),
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
"
"
"    IF func_find_prod_ser_lot_type(p_bu,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev) <> 'N' THEN
"
"
"
"    FOR cr_ln IN (SELECT  fvrsr_old_serial_no,fvrsr_old_sys_ls_no
"
"                   FROM fld_visit_rpt_spare_repl
"
"                  WHERE fvrsr_bu = p_bu
"
"                    AND fvrsr_doc_no = p_doc_no
"
"                    AND fvrsr_prod_id  = cr11.fvrsr_prod_id
"
"                    AND fvrsr_prod_rev  = cr11.fvrsr_prod_rev
"
"                    AND (fvrsr_serial_no = cr11.fvrsr_serial_no OR (fvrsr_serial_no IS NULL AND cr11.fvrsr_serial_no IS NULL))
"
"                    )
"
"    LOOP
"
"       SELECT plsn_sys_ls_no,
"
"              plsn_source_type,
"
"              plsn_source_id
"
"         INTO v_sys_ls_no,
"
"              v_source_type,
"
"              v_source_id
"
"         FROM prod_lot_ser_nos
"
"        WHERE plsn_bu = p_bu
"
"          AND plsn_prod_id = cr11.fvrsr_prod_id
"
"          AND plsn_prod_rev = cr11.fvrsr_prod_rev
"
"          AND plsn_ser_no = cr_ln.fvrsr_old_serial_no
"
"          aND rOWNUM = 1;
"
"
"
"       SELECT NVL(MAX(isbd_sub_seq_no),0) + 1
"
"         INTO var_lot_seq_no
"
"         FROM inv_stock_batch_details
"
"        WHERE isbd_bu = p_bu
"
"        AND isbd_issue_doc_no = v_issdoc_no
"
"        AND isbd_seq_no = v_seq_no;
"
"
"
"       INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                       isbd_issue_doc_no,
"
"                       isbd_seq_no,
"
"                       isbd_sub_seq_no,
"
"                       isbd_sys_ls_no,
"
"                       isbd_lot_no,
"
"                       isbd_serial_no,
"
"                       isbd_source_type,
"
"                       isbd_source_id,
"
"                       isbd_trans_qty,
"
"                       isbd_excs_qty,
"
"                       isbd_trnf_acpt_qty,
"
"                       isbd_ins_rec,
"
"                       isbd_cre_by,
"
"                       isbd_cre_ip_addr,
"
"                       isbd_cre_os_user,
"
"                       isbd_cre_emp_id,
"
"                       isbd_cre_date,
"
"                       isbd_stk_trans_qty
"
"                      )
"
"                    VALUES(p_bu,
"
"                       v_issdoc_no,
"
"                       v_seq_no,
"
"                       var_lot_seq_no,
"
"                       cr_ln.fvrsr_old_sys_ls_no,
"
"                       NULL,
"
"                       cr_ln.fvrsr_old_serial_no,
"
"                       v_source_type,
"
"                       v_source_id,
"
"                       1,
"
"                       0,
"
"                       1,
"
"                       'Y',
"
"                       p_user,
"
"                 Audit_Info.Get_IP_Address,
"
"                 Audit_Info.Get_OS_User,
"
"                 func_find_emp_id(p_bu,p_user),
"
"                       SYSDATE,
"
"                       1
"
"                      );
"
"    END LOOP c_ln;
"
"    END IF;
"
"
"
"    IF func_find_prod_cost_method(p_bu,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev) <> 'MAC'
"
"    AND func_find_prod_ser_lot_type(p_bu,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev) = 'N'  THEN
"
"
"
"      var_qty := cr11.fvrsr_repl_qty;
"
"     v_sum_qty := 0;
"
"      v_cnt := 0;
"
"
"
"      FOR cr2 IN c2(p_frm_store_id,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev)
"
"      LOOP
"
"
"
"        FOR cr4 IN c4(p_frm_store_id,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev,cr2.batch_id)
"
"    LOOP
"
"
"
"      v_avail_qty := (cr2.sb_avail_qty - cr4.batch_qty);
"
"--      raise_application_error(-20999,'HRM'||cr2.sb_avail_qty ||'~'|| cr4.batch_qty||'/'||p_frm_store_id||'/'||cr11.fvrsr_prod_id||'/'||cr11.fvrsr_prod_rev);
"
"
"
"          IF (var_qty - v_sum_qty) <= v_avail_qty AND var_qty > 0 THEN
"
"
"
"        var_elg_qty := (var_qty - v_sum_qty);
"
"        v_sum_qty := v_sum_qty + var_elg_qty;
"
"        v_flag := 'Y';
"
"        v_cnt := 0;
"
"
"
"          ELSE
"
"
"
"        var_elg_qty := v_avail_qty;
"
"        v_sum_qty := v_sum_qty + var_elg_qty;
"
"        v_flag := 'N';
"
"        v_cnt := v_cnt + 1;
"
"
"
"          END IF;
"
"
"
"--Raise_Application_Error(-20999,'HRM'||'-'||p_frm_store_id||'-'||cr1.fvrsr_prod_id||'-'||cr1.fvrsr_prod_rev||'-'||cr2.batch_id||'-'||v_avail_qty||'-'||cr2.sb_avail_qty||'-'||cr4.batch_qty);
"
"
"
"      IF ((v_flag = 'Y' AND v_cnt = 0) OR (v_flag = 'N' AND v_cnt <> 0)) AND var_elg_qty > 0  THEN
"
"
"
"
"
"            SELECT NVL(MAX(istcb_sub_seq_no),0) + 1
"
"          INTO var_lot_seq_no1
"
"          FROM inv_stock_trans_cost_batch
"
"         WHERE istcb_bu = p_bu
"
"           AND istcb_doc_no = v_issdoc_no
"
"           AND istcb_seq_no = v_seq_no;
"
"
"
"
"
"        INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"                           istcb_doc_no,
"
"                           istcb_seq_no,
"
"                           istcb_sub_seq_no,
"
"                           istcb_batch_no,
"
"                           istcb_trans_qty,
"
"                           istcb_unit_cost,
"
"                           istcb_cre_by,
"
"                           istcb_cre_date,
"
"                           istcb_ins_rec,
"
"                           istcb_stk_trans_qty
"
"                          )
"
"                        VALUES(p_bu,
"
"                               v_issdoc_no,
"
"                               v_seq_no,
"
"                               var_lot_seq_no1,
"
"                               cr2.batch_id,
"
"                               var_elg_qty,
"
"                               cr2.sb_bc_unit_cost,
"
"                               'P',
"
"                               SYSDATE,
"
"                               'Y',
"
"                               var_elg_qty
"
"                              );
"
"
"
"
"
"      END IF;
"
"
"
"      v_msg_cnt := 1;
"
"
"
"      IF var_qty = v_sum_qty THEN
"
"         EXIT;
"
"      END IF;
"
"
"
"        EXIT when func_find_prod_ser_lot_type(p_bu,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev)  = 'S';
"
"
"
"        END LOOP;
"
"
"
"      --  EXIT when func_find_prod_ser_lot_type(p_bu,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev)  = 'S';
"
"
"
"      END LOOP;
"
"
"
"
"
"      FOR cr3 IN c3(p_frm_store_id,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev)
"
"      LOOP
"
"
"
"        FOR cr4 IN c4(p_frm_store_id,cr11.fvrsr_prod_id,cr11.fvrsr_prod_rev,cr3.batch_id)
"
"    LOOP
"
"
"
"      v_avail_qty := (cr3.sb_avail_qty - cr4.batch_qty);
"
"
"
"          IF (var_qty - v_sum_qty) <= v_avail_qty AND var_qty > 0 THEN
"
"
"
"        var_elg_qty := (var_qty - v_sum_qty);
"
"        v_sum_qty := v_sum_qty + var_elg_qty;
"
"        v_flag := 'Y';
"
"        v_cnt := 0;
"
"
"
"          ELSE
"
"
"
"        var_elg_qty := v_avail_qty;
"
"        v_sum_qty := v_sum_qty + var_elg_qty;
"
"        v_flag := 'N';
"
"        v_cnt := v_cnt + 1;
"
"
"
"          END IF;
"
"
"
"      IF ((v_flag = 'Y' AND v_cnt = 0) OR (v_flag = 'N' AND v_cnt <> 0)) AND var_elg_qty > 0  THEN
"
"
"
"
"
"        INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"                           istcb_doc_no,
"
"                           istcb_seq_no,
"
"                           istcb_sub_seq_no,
"
"                           istcb_batch_no,
"
"                           istcb_trans_qty,
"
"                           istcb_unit_cost,
"
"                           istcb_cre_by,
"
"                           istcb_cre_date,
"
"                           istcb_ins_rec,
"
"                           istcb_stk_trans_qty
"
"                          )
"
"                        VALUES(p_bu,
"
"                               v_issdoc_no,
"
"                               v_seq_no,
"
"                               1,
"
"                               cr3.batch_id,
"
"                               var_elg_qty,
"
"                               cr3.sb_bc_unit_cost,
"
"                               'P1',
"
"                               SYSDATE,
"
"                               'Y',
"
"                               var_elg_qty
"
"                              );
"
"      END IF;
"
"
"
"      v_msg_cnt := 1;
"
"      IF var_qty = v_sum_qty THEN
"
"         EXIT;
"
"      END IF;
"
"        END LOOP;
"
"      END LOOP;
"
"
"
"
"
"
"
"     BEGIN
"
"        SELECT SUM(istcb_stk_trans_qty)
"
"          INTO v_inv_batch_qty
"
"          FROM inv_stock_trans_cost_batch
"
"         WHERE istcb_bu = p_bu
"
"           AND istcb_doc_no = v_issdoc_no
"
"           AND istcb_seq_no = v_seq_no;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_inv_batch_qty := 0;
"
"      END;
"
"
"
"      IF var_qty <> v_inv_batch_qty THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||var_qty||'~'||v_inv_batch_qty||'~'||p_frm_store_id||'-'||cr11.fvrsr_prod_id||'-'||cr11.fvrsr_prod_rev||'-'||p_doc_no||'-'||v_issdoc_no||'-'||v_seq_no);
"
"      END IF;
"
"
"
"    END IF;
"
"    v_seq_no := v_seq_no + 1;
"
"
"
"  END LOOP;
"
"
"
"  proc_issue_mat_frm_mi(p_bu,
"
"                p_plnt,
"
"                v_issdoc_no,
"
"                p_user,
"
"                func_find_emp_id(p_bu,p_user),
"
"                p_lang,
"
"                var_dc_no,
"
"                var_pack_no
"
"                    );
"
"
"
"  proc_validate_stocks(p_bu);
"
"END proc_cre_mi_frm_fvr_rplce;
"
"
"
"PROCEDURE proc_cre_post_quote_frm_fvr(p_bu    fld_visit_rpt_hd.fvrh_bu%TYPE,
"
"                      p_plnt    prod_plants.prodplnt_plnt%TYPE,
"
"                      p_plnt_loc_id      fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                      p_plnt_loc_name      fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                      p_doc_no    fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                      p_user    fld_visit_rpt_hd.fvrh_cre_by%TYPE
"
"                      )
"
"AS
"
"  CURSOR c2 IS
"
"    SELECT *
"
"      FROM fld_visit_rpt_hd
"
"     WHERE fvrh_bu = p_bu
"
"       AND fvrh_csr_assign_to_plnt = p_plnt
"
"       AND fvrh_doc_no = p_doc_no
"
"       AND fvrh_w_wo_mtrl_type = 'WO'
"
"       AND fvrh_ord_type = 'CS';
"
"
"
"  CURSOR c3 (c_rqst_no VARCHAR2)IS
"
"    SELECT *
"
"      FROM cust_service_req_hist_view
"
"     WHERE csr_bu = p_bu
"
"       AND csr_rqst_no = c_rqst_no;
"
"
"
"   v_pfx              VARCHAR2(5);
"
"   v_no            VARCHAR2(15);
"
"
"
"   v_serv_prod_id    VARCHAR2(25);
"
"   v_serv_prod_rev    NUMBER;
"
"
"
"   v_addr1        VARCHAR2(50);
"
"   v_addr2        VARCHAR2(50);
"
"   v_addr3        VARCHAR2(50);
"
"   v_addr4        VARCHAR2(50);
"
"   v_city        VARCHAR2(5);
"
"   v_state        VARCHAR2(5);
"
"   v_country        VARCHAR2(5);
"
"   v_dummy        VARCHAR2(1000);
"
"   v_quote_pfx        VARCHAR2(5);
"
"   v_quote_no        VARCHAR2(15);
"
"   v_quote_seq_no    NUMBER(5);
"
"   v_sub_seq_no        NUMBER(5);
"
"   v_prod_seq_no    NUMBER(5);
"
"   v_con_seq_no        NUMBER(5);
"
"
"
"   v_term_seq_no    NUMBER(5);
"
"   v_term_val_seq_no    NUMBER(5);
"
"   v_val_days        NUMBER(5);
"
"   v_exp_date        DATE;
"
"
"
"   v_quote_pfx_no     VARCHAR2(500);
"
"
"
"BEGIN
"
"  FOR cr2 IN c2
"
"  LOOP
"
"
"
"  BEGIN
"
"    SELECT adp_pfx
"
"      INTO v_pfx
"
"      FROM appl_doc_prefixes
"
"     WHERE adp_bu = p_bu
"
"       AND adp_plnt = cr2.fvrh_csr_assign_to_plnt
"
"       AND adp_doc_type = 'CSOQ';
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    Raise_Application_Error(-20190,'POM '||'~'||cr2.fvrh_csr_assign_to_plnt);
"
"  END;
"
"
"
"  v_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),v_pfx,p_user);
"
"
"
"  v_quote_pfx_no := v_pfx ||'-'||v_no;
"
"
"
"  proc_find_addr (p_bu,
"
"          cr2.fvrh_csr_assign_to_plnt,
"
"          'C',
"
"          cr2.fvrh_cust_id,
"
"          v_addr1,
"
"          v_addr2,
"
"          v_addr3,
"
"          v_city,
"
"          v_state,
"
"          v_country,
"
"          v_dummy,
"
"          v_dummy,
"
"          v_dummy,
"
"          v_dummy,
"
"          v_dummy,
"
"          v_dummy,
"
"          v_dummy
"
"          );
"
"
"
"   BEGIN
"
"     SELECT csr_quote_pfx,
"
"            csr_quote_no,
"
"        csr_quote_seq_no
"
"       INTO v_quote_pfx,
"
"            v_quote_no,
"
"        v_quote_seq_no
"
"       FROM cust_service_req_hist_view
"
"      WHERE csr_bu = p_bu
"
"        AND csr_rqst_no = cr2.fvrh_csr_doc_no;
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_quote_pfx := NULL;
"
"     v_quote_no := NULL;
"
"     v_quote_seq_no := NULL;
"
"   END;
"
"
"
"   IF v_quote_pfx IS NOT  NULL AND v_quote_no IS NOT NULL THEN
"
"
"
"   BEGIN
"
"    SELECT csqh_val_days,
"
"           csqh_exp_date
"
"      INTO v_val_days,
"
"           v_exp_date
"
"      FROM cust_suprt_quote_hd
"
"     WHERE csqh_bu = p_bu
"
"       AND csqh_plnt = cr2.fvrh_csr_assign_to_plnt
"
"       AND csqh_quote_pfx = v_quote_pfx
"
"       AND csqh_quote_no = v_quote_no;
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_val_days := 15;
"
"     v_exp_date := SYSDATE + 15;
"
"   END;
"
"
"
"    INSERT INTO cust_suprt_quote_hd (csqh_bu,
"
"                     csqh_plnt,
"
"                     csqh_quote_pfx,
"
"                     csqh_quote_no,
"
"                     csqh_quote_date,
"
"                     csqh_val_days,
"
"                     csqh_exp_date,
"
"                     csqh_cust_id,
"
"                     csqh_cust_name,
"
"                     csqh_cust_addr1,
"
"                     csqh_cust_addr2,
"
"                     csqh_cust_addr3,
"
"                     csqh_cust_addr4,
"
"                     csqh_city_id,
"
"                     csqh_state_id,
"
"                     csqh_cntry_id,
"
"                     csqh_status,
"
"                     csqh_cre_by,
"
"                     csqh_cre_date,
"
"                     csqh_quote_type)
"
"                             VALUES (p_bu,
"
"                     cr2.fvrh_csr_assign_to_plnt,
"
"                     v_pfx,
"
"                     v_no,
"
"                     TRUNC(SYSDATE),
"
"                     v_val_days,
"
"                     v_exp_date,
"
"                     cr2.fvrh_cust_id,
"
"                     func_find_party_name(p_bu,cr2.fvrh_cust_id,1),
"
"                     v_addr1,
"
"                     v_addr2,
"
"                     v_addr3,
"
"                     v_addr4,
"
"                     v_city,
"
"                     v_state,
"
"                     v_country,
"
"                     'N',
"
"                     p_user,
"
"                     SYSDATE,
"
"                     'OQ');
"
"      FOR c_con IN (SELECT *
"
"                   FROM cust_suprt_quote_cont_pers
"
"              WHERE csqcp_bu = p_bu
"
"            AND csqcp_quote_pfx = v_quote_pfx
"
"            AND csqcp_quote_no = v_quote_no)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(csqcp_seq_no),0) + 1
"
"      INTO v_con_seq_no
"
"      FROM cust_suprt_quote_cont_pers
"
"     WHERE csqcp_bu = p_bu
"
"       AND csqcp_plnt = cr2.fvrh_csr_assign_to_plnt
"
"       AND csqcp_quote_pfx = v_pfx
"
"       AND csqcp_quote_no = v_no;
"
"
"
"        INSERT INTO cust_suprt_quote_cont_pers (csqcp_bu,
"
"                        csqcp_plnt,
"
"                        csqcp_quote_pfx,
"
"                        csqcp_quote_no,
"
"                        csqcp_seq_no,
"
"                        csqcp_cp_name,
"
"                        csqcp_cp_desgn,
"
"                        csqcp_tel_no,
"
"                        csqcp_mob_no,
"
"                        csqcp_email_id,
"
"                        csqcp_cre_by,
"
"                        csqcp_cre_date)
"
"                        VALUES (p_bu,
"
"                                cr2.fvrh_csr_assign_to_plnt,
"
"                            v_pfx,
"
"                            v_no,
"
"                            v_con_seq_no,
"
"                            c_con.csqcp_cp_name,
"
"                            c_con.csqcp_cp_desgn,
"
"                            c_con.csqcp_tel_no,
"
"                            c_con.csqcp_mob_no,
"
"                            c_con.csqcp_email_id,
"
"                            p_user,
"
"                            SYSDATE);
"
"
"
"      END LOOP;
"
"
"
"      FOR c_term IN (SELECT *
"
"                   FROM cust_suprt_quote_tnc_attr
"
"              WHERE csqtnc_bu = p_bu
"
"            AND csqtnc_quote_pfx = v_quote_pfx
"
"            AND csqtnc_quote_no = v_quote_no)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(csqtnc_seq_no),0) + 1
"
"      INTO v_term_seq_no
"
"      FROM cust_suprt_quote_tnc_attr
"
"     WHERE csqtnc_bu = p_bu
"
"       AND csqtnc_quote_pfx = v_pfx
"
"       AND csqtnc_quote_no = v_no;
"
"
"
"        INSERT INTO cust_suprt_quote_tnc_attr (csqtnc_bu,
"
"                               csqtnc_quote_pfx,
"
"                               csqtnc_quote_no,
"
"                               csqtnc_seq_no,
"
"                               csqtnc_attr_id,
"
"                               csqtnc_print_seq,
"
"                               csqtnc_cre_by,
"
"                               csqtnc_cre_date)
"
"                       VALUES (p_bu,
"
"                           v_pfx,
"
"                           v_no,
"
"                           v_term_seq_no,
"
"                           c_term.csqtnc_attr_id,
"
"                           v_term_seq_no,
"
"                           p_user,
"
"                           SYSDATE);
"
"          FOR c_term_val IN (SELECT *
"
"                   FROM cust_suprt_quote_tnc_val
"
"                  WHERE csqtncv_bu = p_bu
"
"                    AND csqtncv_quote_pfx = v_quote_pfx
"
"                    AND csqtncv_quote_no = v_quote_no
"
"                    AND csqtncv_seq_no = c_term.csqtnc_seq_no)
"
"          LOOP
"
"        SELECT NVL(MAX(csqtncv_sub_seq_no),0) + 1
"
"          INTO v_term_val_seq_no
"
"          FROM cust_suprt_quote_tnc_val
"
"         WHERE csqtncv_bu = p_bu
"
"           AND csqtncv_quote_pfx = v_pfx
"
"           AND csqtncv_quote_no = v_no
"
"           AND csqtncv_seq_no = v_term_seq_no;
"
"
"
"        INSERT INTO cust_suprt_quote_tnc_val (csqtncv_bu,
"
"                              csqtncv_quote_pfx,
"
"                              csqtncv_quote_no,
"
"                              csqtncv_seq_no,
"
"                              csqtncv_sub_seq_no,
"
"                              csqtncv_attr_val,
"
"                              csqtncv_cre_by,
"
"                              csqtncv_cre_date)
"
"                          VALUES (p_bu,
"
"                              v_pfx,
"
"                              v_no,
"
"                              v_term_seq_no,
"
"                              v_term_val_seq_no,
"
"                              c_term_val.csqtncv_attr_val,
"
"                              p_user,
"
"                              SYSDATE);
"
"          END LOOP;
"
"      END LOOP;
"
"  ELSE
"
"    INSERT INTO cust_suprt_quote_hd (csqh_bu,
"
"                     csqh_plnt,
"
"                     csqh_quote_pfx,
"
"                     csqh_quote_no,
"
"                     csqh_quote_date,
"
"                     csqh_val_days,
"
"                     csqh_exp_date,
"
"                     csqh_cust_id,
"
"                     csqh_cust_name,
"
"                     csqh_cust_addr1,
"
"                     csqh_cust_addr2,
"
"                     csqh_cust_addr3,
"
"                     csqh_cust_addr4,
"
"                     csqh_city_id,
"
"                     csqh_state_id,
"
"                     csqh_cntry_id,
"
"                     csqh_status,
"
"                     csqh_cre_by,
"
"                     csqh_cre_date,
"
"                     csqh_quote_type)
"
"                             VALUES (p_bu,
"
"                     cr2.fvrh_csr_assign_to_plnt,
"
"                     v_pfx,
"
"                     v_no,
"
"                     TRUNC(SYSDATE),
"
"                     0,
"
"                     NULL,
"
"                     cr2.fvrh_cust_id,
"
"                     func_find_party_name(p_bu,cr2.fvrh_cust_id,1),
"
"                     v_addr1,
"
"                     v_addr2,
"
"                     v_addr3,
"
"                     v_addr4,
"
"                     v_city,
"
"                     v_state,
"
"                     v_country,
"
"                     'N',
"
"                     p_user,
"
"                     SYSDATE,
"
"                     'OQ');
"
"  END IF;
"
"
"
"    FOR cr3 IN c3(cr2.fvrh_csr_doc_no)
"
"    LOOP
"
"
"
"      SELECT crmctrl_prod_id,
"
"         crmctrl_prod_rev
"
"    INTO v_serv_prod_id,
"
"         v_serv_prod_rev
"
"    FROM crm_control
"
"       WHERE crmctrl_bu = p_bu;
"
"
"
"      SELECT NVL(MAX(csqp_seq_no),0) + 1
"
"        INTO v_prod_seq_no
"
"        FROM cust_suprt_quote_prod
"
"       WHERE csqp_bu = p_bu
"
"         AND csqp_plnt = cr2.fvrh_csr_assign_to_plnt
"
"         AND csqp_quote_pfx = v_pfx
"
"     AND csqp_quote_no = v_no;
"
"
"
"      INSERT INTO cust_suprt_quote_prod(csqp_bu,
"
"                        csqp_plnt,
"
"                        csqp_quote_pfx,
"
"                        csqp_quote_no,
"
"                        csqp_seq_no,
"
"                        csqp_prod_id,
"
"                        csqp_prod_rev,
"
"                        csqp_prod_desc,
"
"                        csqp_serial_no,
"
"                        csqp_sys_ls_no,
"
"                        csqp_quote_price,
"
"                        csqp_disc_pct,
"
"                        csqp_cre_by,
"
"                        csqp_cre_date,
"
"                        csqp_reason,
"
"                        csqp_ge_no,
"
"                        csqp_ge_seq_no,
"
"                        csqp_ge_sub_seq_no,
"
"                        csqp_csr_no,
"
"                    csqp_pre_quote_pfx,
"
"                    csqp_pre_quote_no,
"
"                    csqp_pre_quote_seq_no)
"
"                                 VALUES(p_bu,
"
"                        cr2.fvrh_csr_assign_to_plnt,
"
"                        v_pfx,
"
"                        v_no,
"
"                        v_prod_seq_no,
"
"                        cr3.csr_prod_id,
"
"                        cr3.csr_prod_rev,
"
"                        cr3.csr_prod_desc,
"
"                        NULL,
"
"                        NULL,
"
"                        '0.001',
"
"                        0,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        'Document Created From Field Visit:'||cr2.fvrh_csr_doc_no,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        cr2.fvrh_csr_doc_no,
"
"                    cr3.csr_quote_pfx,
"
"                    cr3.csr_quote_no,
"
"                    cr3.csr_quote_seq_no
"
"                    );
"
"
"
"  IF cr3.csr_quote_pfx IS NOT NULL AND cr3.csr_quote_no IS NOT NULL THEN
"
"
"
"      FOR c_ln IN (SELECT *
"
"                 FROM cust_suprt_quote_ln
"
"            WHERE csql_bu = p_bu
"
"              AND csql_plnt = cr2.fvrh_csr_assign_to_plnt
"
"                  AND csql_quote_pfx = cr3.csr_quote_pfx
"
"              AND csql_quote_no = cr3.csr_quote_no
"
"              AND csql_seq_no = cr3.csr_quote_seq_no)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(csql_sub_seq_no),0) + 1
"
"      INTO v_sub_seq_no
"
"      FROM cust_suprt_quote_ln
"
"     WHERE csql_bu = p_bu
"
"       AND csql_plnt = cr2.fvrh_csr_assign_to_plnt
"
"       AND csql_quote_pfx = v_pfx
"
"       AND csql_quote_no = v_no
"
"       AND csql_seq_no = v_prod_seq_no;
"
"
"
"        INSERT INTO cust_suprt_quote_ln(csql_bu,
"
"                        csql_plnt,
"
"                        csql_quote_pfx,
"
"                        csql_quote_no,
"
"                        csql_seq_no,
"
"                        csql_sub_seq_no,
"
"                        csql_srv_prod_id,
"
"                        csql_srv_prod_rev,
"
"                        csql_quote_qty,
"
"                        csql_quote_price,
"
"                        csql_disc_pct,
"
"                        csql_cre_by,
"
"                        csql_cre_date)
"
"                             VALUES(p_bu,
"
"                        cr2.fvrh_csr_assign_to_plnt,
"
"                        v_pfx,
"
"                        v_no,
"
"                        v_prod_seq_no,
"
"                        v_sub_seq_no,
"
"                        c_ln.csql_srv_prod_id,
"
"                        c_ln.csql_srv_prod_rev,
"
"                        c_ln.csql_quote_qty,
"
"                        c_ln.csql_quote_price,
"
"                        c_ln.csql_disc_pct,
"
"                        p_user,
"
"                        SYSDATE
"
"                    );
"
"      END LOOP;
"
"  ELSE
"
"
"
"    BEGIN
"
"      SELECT crmctrl_prod_id,
"
"         crmctrl_prod_rev
"
"    INTO v_serv_prod_id,
"
"         v_serv_prod_rev
"
"    FROM crm_control
"
"       WHERE crmctrl_bu = p_bu;
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20999,'APM '||'~'||p_bu);
"
"    END;
"
"
"
"        SELECT NVL(MAX(csql_sub_seq_no),0) + 1
"
"      INTO v_sub_seq_no
"
"      FROM cust_suprt_quote_ln
"
"     WHERE csql_bu = p_bu
"
"       AND csql_plnt = cr2.fvrh_csr_assign_to_plnt
"
"       AND csql_quote_pfx = v_pfx
"
"       AND csql_quote_no = v_no
"
"       AND csql_seq_no = v_prod_seq_no;
"
"
"
"        INSERT INTO cust_suprt_quote_ln(csql_bu,
"
"                        csql_plnt,
"
"                        csql_quote_pfx,
"
"                        csql_quote_no,
"
"                        csql_seq_no,
"
"                        csql_sub_seq_no,
"
"                        csql_srv_prod_id,
"
"                        csql_srv_prod_rev,
"
"                        csql_quote_qty,
"
"                        csql_quote_price,
"
"                        csql_disc_pct,
"
"                        csql_cre_by,
"
"                        csql_cre_date)
"
"                             VALUES(p_bu,
"
"                        cr2.fvrh_csr_assign_to_plnt,
"
"                        v_pfx,
"
"                        v_no,
"
"                        v_prod_seq_no,
"
"                        v_sub_seq_no,
"
"                        v_serv_prod_id,
"
"                        v_serv_prod_rev,
"
"                        1,
"
"                        0,
"
"                        0,
"
"                        p_user,
"
"                        SYSDATE
"
"                    );
"
"  END IF;
"
"    END LOOP c3;
"
"  END LOOP c2;
"
"
"
"END proc_cre_post_quote_frm_fvr;
"
"
"
"
"
"END pkg_fvr_spare;"
/
