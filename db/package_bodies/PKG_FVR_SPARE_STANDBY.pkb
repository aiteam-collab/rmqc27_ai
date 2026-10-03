CREATE OR REPLACE
"PACKAGE BODY        pkg_fvr_spare_standby
"
"AS
"
"
"
"PROCEDURE proc_cre_stndby_decr_new_fvr(p_bu            business_units.bu_id%TYPE,
"
"                       p_plnt            bus_unit_plants.bup_plant_id%TYPE,
"
"                       p_plnt_loc_id    fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                       p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                       p_doc_no         fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                       p_user           VARCHAR2
"
"                       )
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
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM fld_visit_rpt_hd,
"
"         fld_visit_rpt_spare_standby
"
"   WHERE fvrh_bu = fvrss_bu
"
"     AND fvrh_doc_no = fvrss_doc_no
"
"     AND fvrss_bu = p_bu
"
"     AND fvrss_doc_no = p_doc_no
"
"     AND fvrss_type IN ('W','X');
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
"  SELECT SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) qty,sb_batch_id
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
"  CURSOR c_prod(c_prod_id   VARCHAR2,
"
"                c_prod_rev  NUMBER)
"
"  IS
"
"  SELECT prod_cls,
"
"         (SELECT class_desc1
"
"            FROM classes
"
"           WHERE class_bu = p_bu
"
"             AND class_id = prod_cls ) prod_cls_desc,
"
"         prod_sub_cls,
"
"         (SELECT subcls_desc1
"
"            FROM sub_classes
"
"           WHERE subcls_bu = p_bu
"
"             AND subcls_id = prod_sub_cls ) prod_subcls_desc  ,
"
"         prod_group_id,
"
"        (SELECT pgrp_group_desc1
"
"       FROM prod_group
"
"      WHERE pgrp_bu = p_bu
"
"        AND pgrp_group_id = prod_group_id ) prod_grp_desc,
"
"         prod_subgroup_id,
"
"      (SELECT psgrp_subgroup_desc1
"
"         FROM prod_sub_group
"
"        WHERE psgrp_bu = p_bu
"
"          AND psgrp_subgroup_id = prod_subgroup_id ) prod_subgrp_desc,
"
"         (SELECT class_type
"
"            FROM classes
"
"           WHERE class_bu = p_bu
"
"             AND class_id = prod_cls) prod_cls_type
"
"   FROM products
"
"  WHERE prod_bu = p_bu
"
"    AND prod_id = c_prod_id
"
"    AND prod_rev = c_prod_rev
"
"    AND prod_status = 'A';
"
"v_prod_cls    VARCHAR2(100);
"
"v_ref        VARCHAR2(500);
"
"var_sys_ls_no    NUMBER;
"
"v_ls_type_gc    VARCHAR2(1);
"
"v_ls_type_dc    VARCHAR2(1);
"
"v_emp_good_wh    VARCHAR2(10);
"
"v_emp_defect_wh    VARCHAR2(10);
"
"p_trans_doc_no    VARCHAR2(15);
"
"v_batch_no    NUMBER(15);
"
"v_ser_lot_opt    VARCHAR2(1);
"
"
"
"cr0        c0%ROWTYPE;
"
"cr3        c3%ROWTYPE;
"
"r_prod        c_prod%ROWTYPE;
"
"
"
"v_date      date;
"
"
"
"BEGIN
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"    v_date := sysdate;--cr1.fvrh_doc_date;
"
"  OPEN c_prod(cr1.fvrss_prod_id,cr1.fvrss_prod_rev);
"
"  FETCH c_prod INTO r_prod;
"
"  CLOSE c_prod;
"
"  IF cr1.fvrss_prod_id IS NOT NULL THEN
"
"      BEGIN
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
"             AND prodplnt_prod_id = cr1.fvrss_prod_id
"
"             AND prodplnt_prod_rev = cr1.fvrss_prod_rev;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20260,'ICM '||p_bu||'~'||p_plnt||'~'||cr1.fvrss_prod_id||'~'||cr1.fvrss_prod_rev);
"
"      END;
"
"
"
"      BEGIN
"
"        SELECT store_id
"
"      INTO v_emp_good_wh
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = p_plnt
"
"       AND store_inv_id = cr1.fvrh_csr_emp_id
"
"       AND store_physical = 'L';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20768,'ICM '||'Emp. (GC) W/H Need to Create'||p_bu);
"
"      END;
"
"
"
"      v_ls_type_gc := func_find_prod_ser_lot_type(p_bu,cr1.fvrss_prod_id,cr1.fvrss_prod_rev);
"
"
"
"      /*Standy From Emp. (GC) - Stock Decrease*/
"
"      IF cr1.fvrss_type IN ('W') THEN
"
"      DBMS_OUTPUT.PUT_LINE(cr1.fvrss_rcvd_prod_id||'-'||cr1.fvrss_rcvd_prod_rev);
"
"        proc_upd_stocks(p_bu,
"
"                      v_emp_good_wh,
"
"                      NULL,
"
"                      cr1.fvrss_prod_id,
"
"                      cr1.fvrss_prod_rev,
"
"                      0,
"
"                      0,
"
"                      -1,
"
"                      0,
"
"                      0,
"
"                      0.001,
"
"                      0.001,
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
"                      cr1.fvrss_seq_no,
"
"                      cr1.fvrss_seq_no,
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
"                      'FS',
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
"                      cr1.fvrss_seq_no,
"
"                      NULL,
"
"                      0,
"
"                      0,
"
"                      'FIELD VISIT SPARES STAND BY DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                      'FIELD VISIT SPARES STAND BY DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
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
"
"
"    /*Standy By Emp. (GC) - Lot / Serial Decrease*/
"
"
"
"    IF v_ls_type_gc IN ('L','O','S') THEN
"
"
"
"      SELECT prod_ser_lot_opt
"
"        INTO v_ser_lot_opt
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = cr1.fvrss_prod_id
"
"         AND prod_rev = cr1.fvrss_prod_rev;
"
"
"
"        proc_upd_lot_ser_stocks(p_bu,
"
"                    v_emp_good_wh,
"
"                    cr1.fvrss_prod_id,
"
"                    cr1.fvrss_prod_rev,
"
"                    cr1.fvrss_sys_ls_no,
"
"                    -1,
"
"                    0,
"
"                    0,
"
"                    0.001,
"
"                    v_ser_lot_opt,
"
"                    NULL,
"
"                    cr1.fvrss_serial_no,
"
"                    'S',
"
"                            v_emp_good_wh,
"
"                                NULL,
"
"                                v_date,
"
"                                'CMR',
"
"                                NULL,
"
"                                cr1.fvrss_doc_no,
"
"                                cr1.fvrss_seq_no,
"
"                                'CRM',
"
"                                NULL,
"
"                                'FIELD VISIT SPARES STAND BY DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                                p_user
"
"                               );
"
"    END IF;
"
"
"
"    /*Standy By Emp. (GC) - Lot / Batch Decrease*/
"
"
"
"        IF func_find_prod_cost_method(p_bu,cr1.fvrss_prod_id,cr1.fvrss_prod_rev) NOT IN ('MAC') THEN
"
"
"
"         OPEN c3(v_emp_good_wh,cr1.fvrss_prod_id,cr1.fvrss_prod_rev);
"
"         FETCH c3 INTO cr3;
"
"
"
"         proc_upd_stock_batches(p_bu,
"
"                    v_emp_good_wh,
"
"                    cr1.fvrss_prod_id,
"
"                    cr1.fvrss_prod_rev,
"
"                    cr3.sb_batch_id,
"
"                    0,
"
"                    1,
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
"                    cr1.fvrss_seq_no,
"
"                    NULL,
"
"                    NULL,
"
"                    p_doc_no,
"
"                    cr1.fvrss_seq_no  ,
"
"                    NULL,
"
"                    func_find_product_class(p_bu,p_plnt,cr1.fvrss_prod_id,cr1.fvrss_prod_rev),
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
"                                        NULL,
"
"                        'FIELD VISIT SPARES STAND BY DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                    'FIELD VISIT SPARES STAND BY DECREASE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
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
"       CLOSE c3;
"
"
"
"        END IF;
"
"     END IF;
"
"     END IF;
"
"
"
"     IF cr1.fvrss_rcvd_prod_id IS NOT NULL THEN
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
"             AND prodplnt_prod_id = cr1.fvrss_rcvd_prod_id
"
"             AND prodplnt_prod_rev = cr1.fvrss_rcvd_prod_rev;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20260,'ICM '||p_bu||'~'||p_plnt||'~'||cr1.fvrss_prod_id||'~'||cr1.fvrss_prod_rev);
"
"      END;
"
"
"
"      BEGIN
"
"        SELECT store_id
"
"      INTO v_emp_defect_wh
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = p_plnt
"
"       AND store_inv_id = cr1.fvrh_csr_emp_id
"
"       AND store_physical = 'N';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20768,'ICM '||'Emp. (DC) W/H Need to Create'||p_bu||'~'||p_plnt||'~'||cr1.fvrh_csr_emp_id);
"
"      END;
"
"
"
"      v_ls_type_dc := func_find_prod_ser_lot_type(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev);
"
"
"
"        /*Standy By Emp. (DC) - Stock Increase*/
"
"             proc_upd_stocks(p_bu,
"
"                    v_emp_defect_wh,
"
"                    NULL,
"
"                    cr1.fvrss_rcvd_prod_id,
"
"                    cr1.fvrss_rcvd_prod_rev,
"
"                    0,
"
"                    0,
"
"                    1,
"
"                    0,
"
"                    0,
"
"                    0.001,
"
"                    0.001,
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
"                    cr1.fvrss_seq_no,
"
"                    cr1.fvrss_seq_no,
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
"                    'FS',
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
"                    cr1.fvrss_seq_no,
"
"                    NULL,
"
"                    0,
"
"                    0,
"
"                    'FIELD VISIT DEFECTIVE MATERIAL INCREASE TO EMP. W/H('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                    'FIELD VISIT DEFECTIVE MATERIAL INCREASE TO EMP. W/H('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
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
"
"
"        /*Standy By Emp. (DC) - Lot Serial Stock Increase*/
"
"        IF v_ls_type_dc IN ('L','O','S') THEN
"
"
"
"      SELECT prod_ser_lot_opt
"
"        INTO v_ser_lot_opt
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = cr1.fvrss_rcvd_prod_id
"
"         AND prod_rev = cr1.fvrss_rcvd_prod_rev;
"
"
"
"             var_sys_ls_no := NULL;
"
"
"
"            proc_lot_ser_operation(p_bu,
"
"                   v_emp_defect_wh,
"
"                   cr1.fvrss_rcvd_prod_id,
"
"                   cr1.fvrss_rcvd_prod_rev,
"
"                   v_ser_lot_opt,
"
"                   var_sys_ls_no,
"
"                   NULL,
"
"                   cr1.fvrss_old_serial_no,
"
"                   'S',
"
"                   v_emp_defect_wh,
"
"                   TRUNC(SYSDATE),
"
"                   NULL,
"
"                   1,--cr1.fvrss_repl_qty,
"
"                   0.001,
"
"                   1,
"
"                   'I',
"
"                   TRUNC(v_date),
"
"                   'CMR',
"
"                   NULL,
"
"                   cr1.fvrh_doc_no,
"
"                   cr1.fvrss_seq_no,
"
"                   NULL,
"
"                   'CRM',
"
"                   'FIELD VISIT DEFECTIVE MATERIAL INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                   'FIELD VISIT DEFECTIVE MATERIAL INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                   p_user,
"
"                   NULL,
"
"                   NULL,
"
"                   0,
"
"                   0
"
"                                  );
"
"
"
"          SELECT MAX(plsn_sys_ls_no)
"
"            INTO var_sys_ls_no
"
"            FROM prod_lot_ser_nos
"
"           WHERE plsn_bu  = p_bu
"
"             AND plsn_prod_id = cr1.fvrss_rcvd_prod_id
"
"             AND plsn_prod_rev = cr1.fvrss_rcvd_prod_rev
"
"             AND plsn_ser_no = cr1.fvrss_old_serial_no;
"
"
"
"         DBMS_OUTPUT.PUT_LINE(cr1.fvrss_rcvd_prod_id||'-'||cr1.fvrss_rcvd_prod_rev||'-'||cr1.fvrss_old_serial_no||'-'||var_sys_ls_no);
"
"
"
"      UPDATE fld_visit_rpt_spare_standby
"
"         SET fvrss_old_sys_ls_no = var_sys_ls_no
"
"       WHERE fvrss_bu =p_bu
"
"         AND fvrss_doc_no = p_doc_no
"
"         AND fvrss_seq_no = cr1.fvrss_seq_no;
"
"
"
"        END IF;
"
"        /*Standy By Emp. (DC) - Batch Stock Increase*/
"
"    IF func_find_prod_cost_method(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev) NOT IN ('MAC') THEN
"
"
"
"              v_batch_no := func_find_batch_nextno(p_bu,v_emp_defect_wh,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev,p_user);
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
"                                            v_emp_defect_wh,
"
"                                            cr1.fvrss_rcvd_prod_id,
"
"                                            cr1.fvrss_rcvd_prod_rev,
"
"                                            func_find_prod_cost_method(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev),
"
"                                            v_batch_no,
"
"                                            1,
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
"                                            cr1.fvrss_seq_no,
"
"                                            NULL,
"
"                                            p_doc_no,
"
"                                            cr1.fvrss_seq_no,
"
"                                            'PO',
"
"                                            NULL,
"
"                                            p_doc_no,
"
"                                            cr1.fvrss_seq_no,
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
"                                            func_find_product_class(p_bu,p_plnt,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev),
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
"                                            'FIELD VISIT DEFECTIVE MATERIAL INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                                            'FIELD VISIT DEFECTIVE MATERIAL INCREASE TO EMP. DC W/H('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                                 0.001,
"
"                                 func_find_store_plnt(p_bu,v_emp_defect_wh)
"
"
"
"                                            );
"
"
"
"      UPDATE fld_visit_rpt_spare_standby
"
"         SET fvrss_batch_no = v_batch_no
"
"       WHERE fvrss_bu =p_bu
"
"         AND fvrss_doc_no = p_doc_no
"
"         AND fvrss_seq_no = cr1.fvrss_seq_no;
"
"
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
"         DBMS_OUTPUT.PUT_LINE(p_bu||'-'||p_plnt||'-'||p_trans_doc_no||'-'||p_doc_no);
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
"                            v_emp_defect_wh,
"
"                            cr1.fvrss_rcvd_prod_id,
"
"                            cr1.fvrss_rcvd_prod_rev,
"
"                            cr1.fvrss_old_serial_no,
"
"                            cr1.fvrh_csr_id,
"
"                            cr1.fvrh_swo_no,
"
"                            cr1.fvrh_csr_assign_to_plnt,
"
"                            cr1.fvrh_csr_doc_no,
"
"                            1,
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
"                    v_emp_defect_wh,
"
"                    v_batch_no,
"
"                    'QOH',
"
"                    'FS',
"
"                    p_doc_no,
"
"                    cr1.fvrss_seq_no,
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
"                                        AND prodplnt_prod_id = cr1.fvrss_rcvd_prod_id
"
"                                        AND prodplnt_prod_rev = cr1.fvrss_rcvd_prod_rev),
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
"                                                           AND prodplnt_prod_id = cr1.fvrss_rcvd_prod_id
"
"                                                           AND prodplnt_prod_rev = cr1.fvrss_rcvd_prod_rev)),
"
"                                    (SELECT prodplnt_sub_cls
"
"                                       FROM prod_plants
"
"                                      WHERE prodplnt_bu = p_bu
"
"                        AND prodplnt_plnt = cr1.fvrh_csr_assign_to_plnt
"
"                                        AND prodplnt_prod_id = cr1.fvrss_rcvd_prod_id
"
"                                        AND prodplnt_prod_rev = cr1.fvrss_rcvd_prod_rev),
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
"                                                            AND prodplnt_prod_id = cr1.fvrss_rcvd_prod_id
"
"                                                            AND prodplnt_prod_rev = cr1.fvrss_rcvd_prod_rev)) ,
"
"                                    (SELECT prod_group_id
"
"                                       FROM products
"
"                                      WHERE prod_bu = p_bu
"
"                                        AND prod_id = cr1.fvrss_rcvd_prod_id
"
"                                        AND prod_rev = cr1.fvrss_rcvd_prod_rev),
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
"                                                                AND prod_id = cr1.fvrss_rcvd_prod_id
"
"                                                                AND prod_rev = cr1.fvrss_rcvd_prod_rev)),
"
"                                    (SELECT prod_subgroup_id
"
"                                       FROM products
"
"                                      WHERE prod_bu = p_bu
"
"                                        AND prod_id = cr1.fvrss_rcvd_prod_id
"
"                                        AND prod_rev = cr1.fvrss_rcvd_prod_rev),
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
"                                                    AND prod_id = cr1.fvrss_rcvd_prod_id
"
"                                                    AND prod_rev = cr1.fvrss_rcvd_prod_rev)),
"
"                                    func_find_prod_class_type(p_bu,cr1.fvrh_csr_assign_to_plnt,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev)
"
"                    );
"
"
"
"       UPDATE fld_visit_rpt_spare_standby
"
"          SET fvrss_cmt_doc_no = p_trans_doc_no
"
"        WHERE fvrss_bu = p_bu
"
"          AND fvrss_doc_no = p_doc_no
"
"          AND fvrss_seq_no = cr1.fvrss_seq_no;
"
"
"
"       END IF;
"
"   END LOOP c1;
"
"
"
"   IF v_emp_defect_wh IS NOT NULL THEN
"
"
"
"   OPEN c0;
"
"   FETCH c0 INTO cr0;
"
"     IF c0%FOUND THEN
"
"
"
"       proc_cre_mi_frm_fvr_stdby(p_bu,
"
"                 p_plnt,
"
"                 p_plnt_loc_id,
"
"                 p_plnt_loc_name,
"
"                 cr0.fvrh_doc_date,
"
"                 p_doc_no,
"
"                 v_emp_defect_wh,
"
"                 p_user,
"
"                 1
"
"                 );
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
"  --proc_validate_stocks(p_bu);
"
"END proc_cre_stndby_decr_new_fvr;
"
"
"
"
"
"PROCEDURE proc_cre_mi_frm_fvr_stdby(p_bu        business_units.bu_id%TYPE,
"
"                                    p_plnt        bus_unit_plants.bup_plant_id%TYPE,
"
"                                    p_plnt_loc_id    fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                    p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
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
"CURSOR c1 IS
"
"  SELECT *
"
"    FROM fld_visit_rpt_hd,
"
"         fld_visit_rpt_spare_standby,products
"
"   WHERE fvrh_bu = fvrss_bu
"
"     AND fvrh_doc_no = fvrss_doc_no
"
"     AND fvrss_bu = prod_bu
"
"     AND fvrss_rcvd_prod_id = prod_id
"
"     AND fvrss_rcvd_prod_rev = prod_rev
"
"     AND fvrss_bu = p_bu
"
"     AND fvrss_doc_no = p_doc_no;
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
"         AND sb_batch_id = c_batch_id
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
"CURSOR c5(c_seq_no    fld_visit_rpt_spare_standby.fvrss_seq_no%TYPE) IS
"
"  SELECT fvrss_serial_no,
"
"         fvrss_old_serial_no,
"
"         fvrss_repl_qty,
"
"         fvrss_rcvd_prod_id,
"
"         fvrss_rcvd_prod_rev,
"
"         fvrss_sys_ls_no,
"
"         fvrss_old_sys_ls_no
"
"    FROM fld_visit_rpt_spare_standby
"
"   WHERE fvrss_bu = p_bu
"
"     AND fvrss_doc_no = p_doc_no
"
"     AND fvrss_seq_no = c_seq_no;
"
"
"
"CURSOR c_prod(c_prod_id    VARCHAR2,
"
"               c_prod_rev    NUMBER)
"
"      IS
"
"   SELECT prod_uom,prod_hsn_code,
"
"          prodplnt_cls prod_cls,
"
"         (SELECT class_desc1
"
"            FROM classes
"
"           WHERE class_bu = prod_bu
"
"             AND class_id = prodplnt_cls)prod_cls_desc,
"
"         prodplnt_sub_cls prod_sub_cls,
"
"         (SELECT subcls_desc1
"
"            FROM sub_classes
"
"           WHERE subcls_bu = prod_bu
"
"             AND subcls_id = prodplnt_sub_cls)prod_subcls_desc,
"
"         prod_group_id,
"
"        (SELECT pgrp_group_desc1
"
"           FROM prod_group
"
"          WHERE pgrp_bu = prod_bu
"
"            AND pgrp_group_id = prod_group_id) prod_grp_desc,
"
"         prod_subgroup_id,
"
"       (SELECT psgrp_subgroup_desc1
"
"          FROM prod_sub_group
"
"         WHERE psgrp_bu = prod_bu
"
"           AND psgrp_subgroup_id = prod_subgroup_id) prod_subgrp_desc,
"
"        (SELECT class_type
"
"           FROM classes
"
"          WHERE class_bu = prod_bu
"
"            AND class_id = prodplnt_cls)prod_cls_type
"
"    FROM prod_plants,products
"
"   WHERE prodplnt_bu = prod_bu
"
"     AND prodplnt_prod_id = prod_id
"
"     AND prodplnt_prod_rev = prod_rev
"
"     AND prodplnt_bu = p_bu
"
"     AND prodplnt_plnt = p_plnt
"
"     AND prodplnt_prod_id = c_prod_id
"
"     AND prodplnt_prod_rev = c_prod_rev;
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
"  var_cost_sub_seq_no     NUMBER(5);
"
"  var_cost_sub_seq_no1  NUMBER(5);
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
"  v_chk_cnt NUMBER;
"
"  r_prod        c_prod%ROWTYPE;
"
"  v_date        date;
"
"
"
"v_emp_id    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"v_ip_addr   VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user   VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
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
"  /*v_issdoc_no := func_find_icm_next_id(p_bu,
"
"                                       v_date,
"
"                                       'MI',
"
"                                       p_frm_store_id,
"
"                                       p_user
"
"                                      );*/
"
"
"
" v_issdoc_no := func_find_pfx_nextno(p_bu,v_date,'MIV',p_user);
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
"
"
"    SELECT COUNT(*)
"
"      INTO v_chk_cnt
"
"      FROM inv_stock_trans_hd_vw
"
"     WHERE isthd_bu = p_bu
"
"       AND isthd_status NOT IN ('C')
"
"       AND isthd_fvr_doc_no = p_doc_no
"
"       AND isthd_issuefm_store_id = p_frm_store_id
"
"       AND isthd_issueto_id = func_find_store_fr_type(p_bu,p_plnt,NULL,'E');
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_chk_cnt := 0;
"
"  END;
"
"
"
"  IF v_chk_cnt > 0 THEN
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
"         isthd_cre_ip_addr,
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
"                 isthd_issueto_plnt_loc_id,
"
"                 isthd_rqstby_entity,
"
"                 isthd_fvr_doc_no
"
"                )
"
"              VALUES(p_bu,
"
"                 p_plnt,
"
"                 p_plnt,
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
"                 'MATERIAL ISSUANCE CREATED FROM FVR NEW - STANDBY MATERIAL',
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
"         v_ip_addr,
"
"         v_os_user,
"
"         v_emp_id,
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
"                 p_plnt_loc_id,
"
"                 p_bu,
"
"                 p_doc_no
"
"                );
"
"
"
"  v_seq_no := 1;
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"      OPEN c_prod(cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev);
"
"    FETCH c_prod INTO r_prod;
"
"    CLOSE c_prod;
"
"
"
"
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
"           istln_cre_ip_addr,
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
"                   istln_csr_doc_no,
"
"                   istln_stk_trans_qty
"
"                  )
"
"                VALUES(p_bu,
"
"                   v_issdoc_no,
"
"                   v_seq_no,
"
"                   cr1.fvrss_rcvd_prod_id,
"
"                   cr1.fvrss_rcvd_prod_rev,
"
"                   func_find_product_uom(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev),
"
"                   func_find_product_uom(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev),
"
"                   1,
"
"                   func_find_product_class(p_bu,p_plnt,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev),
"
"                   1,--cr1.fvrss_repl_qty,
"
"                   1,--cr1.fvrss_repl_qty,
"
"                   1,--cr1.fvrss_repl_qty,
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
"           v_ip_addr,
"
"           v_os_user,
"
"           v_emp_id,
"
"                   SYSDATE,
"
"                   'NA',
"
"                   'FS',--Field Visit Stand by
"
"                   NULL,
"
"                   cr1.fvrss_cmt_doc_no,
"
"                   NULL,
"
"                   NULL,
"
"                   cr1.fvrh_csr_doc_no,
"
"                   1
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
"                          cr1.fvrss_rcvd_prod_id,
"
"                          cr1.fvrss_rcvd_prod_rev,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          1,
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
"                          func_find_product_class(p_bu,p_plnt,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev),
"
"                          NULL,
"
"                          'PO',
"
"                          NULL,
"
"                          NULL,
"
"                          0,
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
"              p_prod_cls_type => r_prod.prod_cls_type
"
"                         );
"
"    IF func_find_prod_ser_lot_type(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev) <> 'N' THEN
"
"
"
"     SELECT plsn_sys_ls_no,
"
"                   plsn_source_type,
"
"               plsn_source_id
"
"              INTO v_sys_ls_no,
"
"               v_source_type,
"
"               v_source_id
"
"          FROM prod_lot_ser_nos
"
"         WHERE plsn_bu = p_bu
"
"           AND plsn_prod_id = cr1.fvrss_rcvd_prod_id
"
"           AND plsn_prod_rev = cr1.fvrss_rcvd_prod_rev
"
"           AND plsn_ser_no = cr1.fvrss_old_serial_no
"
"           and plsn_sys_ls_no = (SELECT Max(plsn_sys_ls_no)
"
"                                   FROM prod_lot_ser_nos
"
"                                  WHERE plsn_bu = p_bu
"
"                                    AND plsn_prod_id = cr1.fvrss_rcvd_prod_id
"
"                                    AND plsn_prod_rev = cr1.fvrss_rcvd_prod_rev
"
"                                    AND plsn_ser_no = cr1.fvrss_old_serial_no);
"
"
"
"
"
"       SELECT NVL(MAX(isbd_sub_seq_no),0) + 1
"
"     INTO var_lot_seq_no
"
"     FROM inv_stock_batch_details
"
"    WHERE isbd_bu = p_bu
"
"      AND isbd_issue_doc_no = v_issdoc_no
"
"      AND isbd_seq_no = v_seq_no;
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
"               isbd_cre_ip_addr,
"
"               isbd_cre_os_user,
"
"               isbd_cre_emp_id,
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
"                       cr1.fvrss_old_sys_ls_no,
"
"                       NULL,
"
"                       cr1.fvrss_old_serial_no,
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
"               v_ip_addr,
"
"               v_os_user,
"
"               v_emp_id,
"
"                       SYSDATE,
"
"                       1
"
"                      );
"
"    END IF;
"
"
"
"    IF func_find_prod_cost_method(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev) <> 'MAC' THEN
"
"
"
"      BEGIN
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
"      var_qty := 1;
"
"      v_sum_qty := 0;
"
"      v_cnt := 0;
"
"
"
"    IF NVL(v_inv_batch_qty,0) <> var_qty THEN
"
"
"
"
"
"      FOR cr2 IN c2(p_frm_store_id,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev)
"
"      LOOP
"
"
"
"        FOR cr4 IN c4(p_frm_store_id,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev,cr2.batch_id)
"
"    LOOP
"
"
"
"      v_avail_qty := (cr2.sb_avail_qty - cr4.batch_qty);
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
"           SELECT NVL(MAX(istcb_sub_seq_no),0) + 1
"
"            INTO var_cost_sub_seq_no
"
"            FROM inv_stock_trans_cost_batch
"
"           WHERE istcb_bu = p_bu
"
"             AND istcb_doc_no = v_issdoc_no
"
"              AND istcb_seq_no = v_seq_no;
"
"
"
"      /*IF var_cost_sub_seq_no <> 1 THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||var_qty||'-'||var_elg_qty||'-'||v_sum_qty||'-'||v_avail_qty||'-'||v_flag||'-'||v_cnt||'-'||p_frm_store_id||'-'||cr1.fvrss_rcvd_prod_id||'-'||cr1.fvrss_rcvd_prod_rev||'-'||v_seq_no);
"
"      END IF;*/
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
"                               var_cost_sub_seq_no,
"
"                               cr2.batch_id,
"
"                               var_elg_qty,
"
"                               cr2.sb_bc_unit_cost,
"
"                               p_user,
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
"
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
"      FOR cr3 IN c3(p_frm_store_id,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev)
"
"      LOOP
"
"
"
"        FOR cr4 IN c4(p_frm_store_id,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev,cr3.batch_id)
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
"          SELECT NVL(MAX(istcb_sub_seq_no),0) + 1
"
"             INTO var_cost_sub_seq_no1
"
"             FROM inv_stock_trans_cost_batch
"
"            WHERE istcb_bu = p_bu
"
"              AND istcb_doc_no = v_issdoc_no
"
"               AND istcb_seq_no = v_seq_no;
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
"                               var_cost_sub_seq_no1,
"
"                               cr3.batch_id,
"
"                               var_elg_qty,
"
"                               cr3.sb_bc_unit_cost,
"
"                               p_user,
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
"    END IF;
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
"      IF var_qty <> v_inv_batch_qty THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||var_qty||'-'||v_inv_batch_qty||'-'||p_frm_store_id||'-'||cr1.fvrss_rcvd_prod_id||'-'||cr1.fvrss_rcvd_prod_rev||'-'||v_seq_no);
"
"      END IF;
"
"
"
"      /*IF var_qty <> v_sum_qty THEN
"
"         RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"      END IF;*/
"
"    END IF;
"
"
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
"  --proc_validate_stocks(p_bu);
"
"END proc_cre_mi_frm_fvr_stdby;
"
"
"
"PROCEDURE proc_cre_mi_frm_cust_gc(p_bu            business_units.bu_id%TYPE,
"
"                                  p_plnt        bus_unit_plants.bup_plant_id%TYPE,
"
"                                  p_plnt_loc_id         fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                  p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                                  p_date        DATE,
"
"                                  p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                                  p_user        VARCHAR2,
"
"                                  p_lang        NUMBER,
"
"                  p_res        OUT    VARCHAR2
"
"                  )
"
"IS
"
"
"
"CURSOR c0 IS
"
"
"
"  SELECT cmt_store_id,
"
"         cmt_csr_id
"
"    FROM csd_mtrl_trckg
"
"   WHERE cmt_bu = p_bu
"
"    -- AND cmt_doc_no = p_doc_no
"
"     AND cmt_sel_flag = 'Y'
"
"     AND cmt_sel_user = p_user
"
"     AND cmt_sou_plnt = cmt_wo_asgn_unit
"
"     AND EXISTS (SELECT 1
"
"                   FROM stores
"
"                  WHERE store_bu = p_bu
"
"                    AND store_id = cmt_store_id
"
"                    AND store_physical = 'G')
"
"GROUP BY cmt_store_id,cmt_csr_id;
"
"
"
"
"
"CURSOR c1 (c_store_id VARCHAR2,c_csr_id VARCHAR2) IS
"
"
"
"  SELECT *
"
"    FROM csd_mtrl_trckg
"
"   WHERE cmt_bu = p_bu
"
"    -- AND cmt_doc_no = p_doc_no
"
"     AND cmt_sel_flag = 'Y'
"
"     AND cmt_sel_user = p_user
"
"     AND cmt_store_id = c_store_id
"
"     AND cmt_csr_id = c_csr_id
"
"     AND cmt_sou_plnt = cmt_wo_asgn_unit
"
"     AND EXISTS (SELECT 1
"
"                   FROM stores
"
"                  WHERE store_bu = p_bu
"
"                    AND store_id = cmt_store_id
"
"                    AND store_physical = 'G');
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
"         AND sb_batch_id = c_batch_id
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
"  v_emp_gc_wh        VARCHAR2(10);
"
"  var_lot_seq_no     NUMBER(5);
"
"  v_sys_ls_no         NUMBER(20);
"
"  v_source_type     VARCHAR2(10);
"
"  v_source_id         VARCHAR2(30);
"
"  v_csr_emp_id        VARCHAR2(10);
"
"  v_ser_lot_opt        VARCHAR2(1);
"
"  var_res        VARCHAR2(1);
"
"  v_date date;
"
"
"
"BEGIN
"
"
"
"  FOR cr0 IN c0
"
"  LOOP
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
"   v_date := sysdate;--p_date;
"
"  v_year := func_find_year(p_bu,v_date);
"
"  v_period := func_find_period(p_bu,v_date);
"
"
"
"  v_issdoc_no := func_find_icm_next_id(p_bu,
"
"                                       v_date,
"
"                                       'MI',
"
"                                       cr0.cmt_store_id,
"
"                                       p_user
"
"                                      );
"
"
"
"  IF func_find_store_bin_flag(p_bu,cr0.cmt_store_id) = 'Y' THEN
"
"    Raise_Application_Error(-20999,'HRM');
"
"  END IF;
"
"
"
"  BEGIN
"
"
"
"    SELECT cusr_emp_id
"
"      INTO v_csr_emp_id
"
"      FROM cust_supp_rep
"
"     WHERE cusr_bu = p_bu
"
"       AND cusr_assign_to_unit = p_plnt
"
"       AND cusr_type = 'E'
"
"       AND cusr_rep_id = cr0.cmt_csr_id;
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"   Raise_Application_Error(-20821,'HRM '||'~'||p_bu||'~'||p_plnt||'~'||cr0.cmt_csr_id);
"
"  END;
"
"
"
"  BEGIN
"
"    SELECT store_id
"
"      INTO v_emp_gc_wh
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = p_plnt
"
"       AND store_physical = 'L'
"
"       AND store_inv_id = v_csr_emp_id;
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
"                 isthd_issueto_plnt_loc_id,
"
"                 isthd_rqstby_entity
"
"                )
"
"              VALUES(p_bu,
"
"                 p_plnt,
"
"                 p_plnt,
"
"                 v_issdoc_no,
"
"                 'T',
"
"                 cr0.cmt_store_id,
"
"                 'S',
"
"                 v_emp_gc_wh,
"
"                 v_date,
"
"                 v_year,
"
"                 v_period,
"
"                 'N',
"
"                 'MATERIAL ISSUANCE CREATED FROM REPAIR COMP. MAT. CUST. GC TO EMP. GC',
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
"                 SYSDATE,
"
"                 'I',
"
"                 p_plnt_loc_id,
"
"                 p_plnt_loc_name,
"
"                 p_plnt,
"
"                 p_plnt_loc_id,
"
"                 p_bu
"
"                );
"
"
"
"  v_seq_no := 1;
"
"
"
"  FOR cr1 IN c1(cr0.cmt_store_id,cr0.cmt_csr_id)
"
"  LOOP
"
"
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
"                   istln_csr_doc_no
"
"                  )
"
"                VALUES(p_bu,
"
"                   v_issdoc_no,
"
"                   v_seq_no,
"
"                   cr1.cmt_prod_id,
"
"                   cr1.cmt_prod_rev,
"
"                   func_find_product_uom(p_bu,cr1.cmt_prod_id,cr1.cmt_prod_rev),
"
"                   func_find_product_uom(p_bu,cr1.cmt_prod_id,cr1.cmt_prod_rev),
"
"                   1,
"
"                   func_find_product_class(p_bu,p_plnt,cr1.cmt_prod_id,cr1.cmt_prod_rev),
"
"                   1,
"
"                   1,
"
"                   1,
"
"                   0.001,
"
"                   'MATERIAL ISSUANCE CREATED FROM REPAIR COMP. MAT. CUST. GC TO EMP. GC',
"
"                   'N',
"
"                   0,
"
"                   'S',
"
"                   p_user,
"
"                   SYSDATE,
"
"                   'NA',
"
"                   cr1.cmt_fv_type, --Field Visit
"
"                   NULL,
"
"                   cr1.cmt_doc_no,
"
"                   NULL,
"
"                   NULL,
"
"                   cr1.cmt_csr_no
"
"                  );
"
"    IF func_find_prod_ser_lot_type(p_bu,cr1.cmt_prod_id,cr1.cmt_prod_rev) <> 'N' THEN
"
"
"
"       SELECT plsn_sys_ls_no,
"
"              plsn_source_type,
"
"          plsn_source_id
"
"         INTO v_sys_ls_no,
"
"          v_source_type,
"
"          v_source_id
"
"     FROM prod_lot_ser_nos
"
"    WHERE plsn_bu = p_bu
"
"      AND plsn_prod_id = cr1.cmt_prod_id
"
"      AND plsn_prod_rev = cr1.cmt_prod_rev
"
"      AND plsn_ser_no = cr1.cmt_serial_no;
"
"
"
"
"
"       SELECT NVL(MAX(isbd_sub_seq_no),0) + 1
"
"     INTO var_lot_seq_no
"
"     FROM inv_stock_batch_details
"
"    WHERE isbd_bu = p_bu
"
"      AND isbd_issue_doc_no = v_issdoc_no
"
"      AND isbd_seq_no = v_seq_no;
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
"                       isbd_cre_date
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
"                       v_sys_ls_no,
"
"                       NULL,
"
"                       cr1.cmt_serial_no,
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
"                       'N',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    v_seq_no := v_seq_no + 1;
"
"
"
"       UPDATE csd_mtrl_trckg
"
"       SET cmt_status = 'T',
"
"           cmt_sel_flag = 'N',
"
"           cmt_sel_user = NULL
"
"     WHERE cmt_bu = p_bu
"
"       AND cmt_doc_no = cr1.cmt_doc_no
"
"       AND cmt_sel_flag = 'Y'
"
"       AND cmt_sel_user = p_user
"
"       AND cmt_store_id = cr0.cmt_store_id
"
"       AND cmt_csr_id = cr0.cmt_csr_id;
"
"
"
"  END LOOP c1;
"
"     proc_alloc_direct_mat_issue(p_bu,
"
"                  v_issdoc_no,
"
"                  v_date,
"
"                  'R',
"
"                  p_user,
"
"                  var_res
"
"                 );
"
"
"
"  IF var_res = 'Y' THEN
"
"
"
"    proc_issue_mat_frm_mi(p_bu,
"
"                  p_plnt,
"
"                  v_issdoc_no,
"
"                  p_user,
"
"                  func_find_emp_id(p_bu,p_user),
"
"                  p_lang,
"
"                  var_dc_no,
"
"                  var_pack_no
"
"                     );
"
"
"
"
"
"
"
"     p_res := v_issdoc_no;
"
"  ELSE
"
"    Raise_Application_Error(-20999,'HRM');
"
"  END IF;
"
"
"
"  END LOOP c0;
"
"  --proc_validate_stocks(p_bu);
"
"END proc_cre_mi_frm_cust_gc;
"
"
"
"PROCEDURE proc_cre_mi_frm_toplnt_cust_gc(p_bu            business_units.bu_id%TYPE,
"
"                                         p_plnt            bus_unit_plants.bup_plant_id%TYPE,
"
"                                         p_plnt_loc_id        fld_visit_rpt_hd.fvrh_plnt_loc_id%TYPE,
"
"                         p_plnt_loc_name    fld_visit_rpt_hd.fvrh_plnt_loc_name%TYPE,
"
"                                         p_date            DATE,
"
"                                         p_doc_no        fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                                         p_user            VARCHAR2,
"
"                                         p_lang            NUMBER,
"
"                         p_res        OUT    VARCHAR2
"
"                         )
"
"IS
"
"
"
"CURSOR c0 IS
"
"
"
"  SELECT cmt_store_id,cmt_sou_plnt
"
"    FROM csd_mtrl_trckg
"
"   WHERE cmt_bu = p_bu
"
"    -- AND cmt_doc_no = p_doc_no
"
"     AND cmt_sel_flag = 'Y'
"
"     AND cmt_sel_user = p_user
"
"     AND cmt_sou_plnt <> cmt_wo_asgn_unit
"
"     AND EXISTS (SELECT 1
"
"                   FROM stores
"
"                  WHERE store_bu = p_bu
"
"                    AND store_id = cmt_store_id
"
"                    AND store_physical = 'G')
"
"GROUP BY cmt_store_id,cmt_sou_plnt;
"
"
"
"
"
"CURSOR c1 (c_store_id VARCHAR2,c_sou_plnt VARCHAR2) IS
"
"
"
"  SELECT *
"
"    FROM csd_mtrl_trckg
"
"   WHERE cmt_bu = p_bu
"
"    -- AND cmt_doc_no = p_doc_no
"
"     AND cmt_sel_flag = 'Y'
"
"     AND cmt_sel_user = p_user
"
"     AND cmt_store_id = c_store_id
"
"     AND cmt_sou_plnt = c_sou_plnt
"
"     AND cmt_sou_plnt <> cmt_wo_asgn_unit
"
"     AND EXISTS (SELECT 1
"
"                   FROM stores
"
"                  WHERE store_bu = p_bu
"
"                    AND store_id = cmt_store_id
"
"                    AND store_physical = 'G');
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
"         AND sb_batch_id = c_batch_id
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
"  v_cust_gc_wh        VARCHAR2(10);
"
"  var_lot_seq_no     NUMBER(5);
"
"  v_sys_ls_no         NUMBER(20);
"
"  v_source_type     VARCHAR2(10);
"
"  v_source_id         VARCHAR2(30);
"
"  v_csr_emp_id        VARCHAR2(10);
"
"  v_ser_lot_opt        VARCHAR2(1);
"
"  var_res        VARCHAR2(1);
"
"
"
"BEGIN
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"  FOR cr0 IN c0
"
"  LOOP
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
"
"
"  v_year := func_find_year(p_bu,p_date);
"
"  v_period := func_find_period(p_bu,p_date);
"
"
"
"  v_issdoc_no := func_find_icm_next_id(p_bu,
"
"                                       p_date,
"
"                                       'MI',
"
"                                       cr0.cmt_store_id,
"
"                                       p_user
"
"                                      );
"
"
"
"  IF func_find_store_bin_flag(p_bu,cr0.cmt_store_id) = 'Y' THEN
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
"      INTO v_cust_gc_wh
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = cr0.cmt_sou_plnt
"
"       AND store_physical = 'G';
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    Raise_Application_Error(-20768,'ICM '||'Cust. Serv. (GC) W/H Need to Create'||p_bu||'~'||cr0.cmt_sou_plnt);
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
"                 isthd_issueto_plnt_loc_id,
"
"                 isthd_rqstby_entity
"
"                )
"
"              VALUES(p_bu,
"
"                 p_plnt,
"
"                 cr0.cmt_sou_plnt ,
"
"                 v_issdoc_no,
"
"                 'T',
"
"                 cr0.cmt_store_id,
"
"                 'I',
"
"                 v_cust_gc_wh,
"
"                 p_date,
"
"                 v_year,
"
"                 v_period,
"
"                 'N',
"
"                 'MATERIAL ISSUANCE CREATED FROM BRANCH REPAIR COMP. MAT. CUST. GC TO CUST. GC',
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
"                 SYSDATE,
"
"                 'I',
"
"                 p_plnt_loc_id,
"
"                 p_plnt_loc_name,
"
"                 p_plnt,
"
"                 p_plnt_loc_id,
"
"                 p_bu
"
"                );
"
"
"
"  v_seq_no := 1;
"
"
"
"  FOR cr1 IN c1(cr0.cmt_store_id,cr0.cmt_sou_plnt)
"
"  LOOP
"
"
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
"                   istln_csr_Doc_no
"
"                  )
"
"                VALUES(p_bu,
"
"                   v_issdoc_no,
"
"                   v_seq_no,
"
"                   cr1.cmt_prod_id,
"
"                   cr1.cmt_prod_rev,
"
"                   func_find_product_uom(p_bu,cr1.cmt_prod_id,cr1.cmt_prod_rev),
"
"                   func_find_product_uom(p_bu,cr1.cmt_prod_id,cr1.cmt_prod_rev),
"
"                   1,
"
"                   func_find_product_class(p_bu,p_plnt,cr1.cmt_prod_id,cr1.cmt_prod_rev),
"
"                   1,
"
"                   1,
"
"                   1,
"
"                   0.001,
"
"                   'MATERIAL ISSUANCE CREATED FROM BRANCH REPAIR COMP. MAT. CUST. GC TO CUST. GC',
"
"                   'N',
"
"                   0,
"
"                   'S',
"
"                   p_user,
"
"                   SYSDATE,
"
"                   'NA',
"
"                   'FB', -- Field Visit Branch
"
"                   NULL,
"
"                   cr1.cmt_doc_no,
"
"                   NULL,
"
"                   NULL,
"
"                   cr1.cmt_csr_no
"
"                  );
"
"    IF func_find_prod_ser_lot_type(p_bu,cr1.cmt_prod_id,cr1.cmt_prod_rev) <> 'N' THEN
"
"    begin
"
"      SELECT plsn_sys_ls_no,
"
"              plsn_source_type,
"
"          plsn_source_id
"
"         INTO v_sys_ls_no,
"
"          v_source_type,
"
"          v_source_id
"
"       FROM (
"
"       SELECT plsn_sys_ls_no,
"
"              plsn_source_type,
"
"          plsn_source_id
"
"     FROM prod_lot_ser_nos
"
"    WHERE plsn_bu = p_bu
"
"      AND plsn_prod_id = cr1.cmt_prod_id
"
"      AND plsn_prod_rev = cr1.cmt_prod_rev
"
"      --AND plsn_ser_no = cr1.cmt_serial_no
"
"      AND plsn_sys_ls_no = cr1.cmt_sys_ls_no
"
"      ORDER BY plsn_sys_ls_no DESC)
"
"      WHERE ROWNUM = 1;
"
"    exception when NO_DATA_FOUND THEN
"
"    raise_application_error(-20999,'HRM'||'/'||cr1.cmt_prod_id||'/'||cr1.cmt_sys_ls_no||'/'||cr1.cmt_serial_no);
"
"    end;
"
"
"
"       SELECT NVL(MAX(isbd_sub_seq_no),0) + 1
"
"     INTO var_lot_seq_no
"
"     FROM inv_stock_batch_details
"
"    WHERE isbd_bu = p_bu
"
"      AND isbd_issue_doc_no = v_issdoc_no
"
"      AND isbd_seq_no = v_seq_no;
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
"                       isbd_cre_date
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
"                       v_sys_ls_no,
"
"                       NULL,
"
"                       cr1.cmt_serial_no,
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
"                       'N',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    v_seq_no := v_seq_no + 1;
"
"
"
"    proc_ins_cmt_hist (p_bu,
"
"                       cr1.cmt_doc_no,
"
"                       p_date,
"
"                       cr0.cmt_store_id,
"
"                       cr1.cmt_prod_id,
"
"                       cr1.cmt_prod_rev,
"
"                       cr1.cmt_serial_no,
"
"                       cr1.cmt_csr_id,
"
"                       cr1.cmt_serv_wo_no,
"
"                       cr1.cmt_wo_asgn_unit,
"
"                       cr1.cmt_csr_no,
"
"                       -cr1.cmt_trans_qty,
"
"                       0,
"
"                       cr1.cmt_wo_qty,
"
"                       0,
"
"                       cr1.cmt_rpr_comp_flag,
"
"                       p_user,
"
"                       v_sys_ls_no,
"
"                       v_source_type,
"
"                       v_source_id,
"
"                       cr1.cmt_batch_no,
"
"                       'QOH',
"
"                       cr1.cmt_fvr_no,
"
"                       cr1.cmt_fvr_seq_no,
"
"                       cr1.cmt_rwk_ord_no,
"
"                       cr1.cmt_type,
"
"                       cr1.cmt_status,
"
"                       'STOCK DECREASE - BRANCH TO BRANCH',
"
"                       cr1.cmt_unit_cost,
"
"                       cr1.cmt_branch_miv_no,
"
"                       cr1.cmt_sou_plnt,
"
"                       cr1.cmt_fv_type
"
"               );
"
"
"
"
"
"    proc_ins_cmt_hist (p_bu,
"
"                       cr1.cmt_doc_no,
"
"                       p_date,
"
"                       cr0.cmt_store_id,
"
"                       cr1.cmt_prod_id,
"
"                       cr1.cmt_prod_rev,
"
"                       cr1.cmt_serial_no,
"
"                       cr1.cmt_csr_id,
"
"                       cr1.cmt_serv_wo_no,
"
"                       cr1.cmt_wo_asgn_unit,
"
"                       cr1.cmt_csr_no,
"
"                       0,
"
"                       cr1.cmt_trans_qty,
"
"                       cr1.cmt_wo_qty,
"
"                       0,
"
"                       cr1.cmt_rpr_comp_flag,
"
"                       p_user,
"
"                       v_sys_ls_no,
"
"                       v_source_type,
"
"                       v_source_id,
"
"                       cr1.cmt_batch_no,
"
"                       'SIT',
"
"                       cr1.cmt_fvr_no,
"
"                       cr1.cmt_fvr_seq_no,
"
"                       cr1.cmt_rwk_ord_no,
"
"                       cr1.cmt_type,
"
"                       cr1.cmt_status,
"
"                       'TRANSIT STOCK INCREASE - BRANCH TO BRANCH',
"
"                       cr1.cmt_unit_cost,
"
"                       cr1.cmt_branch_miv_no,
"
"                       cr1.cmt_sou_plnt,
"
"                       cr1.cmt_fv_type
"
"               );
"
"
"
"     UPDATE csd_mtrl_trckg
"
"    SET cmt_status = 'T',
"
"        cmt_sel_flag = 'N',
"
"        cmt_sel_user = NULL
"
"    WHERE cmt_bu = p_bu
"
"      AND cmt_doc_no = cr1.cmt_doc_no
"
"    AND cmt_sel_flag = 'Y'
"
"    AND cmt_sel_user = p_user
"
"    AND cmt_store_id = cr0.cmt_store_id
"
"    AND cmt_sou_plnt = cr0.cmt_sou_plnt;
"
"
"
"    END LOOP c1;
"
"
"
"
"
"  proc_alloc_direct_mat_issue(p_bu,
"
"                  v_issdoc_no,
"
"                  p_date,
"
"                  'R',
"
"                  p_user,
"
"                  var_res
"
"                 );
"
"
"
"  IF var_res = 'Y' THEN
"
"
"
"    proc_issue_mat_frm_mi(p_bu,
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
"
"
"
"
"     p_res := v_issdoc_no;
"
"  ELSE
"
"    Raise_Application_Error(-20999,'HRM');
"
"  END IF;
"
"
"
"  END LOOP c0;
"
"
"
"  --proc_validate_stocks(p_bu);
"
"END proc_cre_mi_frm_toplnt_cust_gc;
"
"
"
"
"
"  PROCEDURE proc_ins_cmt_hist (p_bu               VARCHAR2,
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
"                p_fv_type       VARCHAR2)
"
"   IS
"
"
"
"      v_trans_no   VARCHAR2 (15);
"
"
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
"                                       cmth_branch_miv_no)
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
"                   p_branch_miv_no);
"
"
"
"   END proc_ins_cmt_hist;
"
"
"
"
"
"
"
"END pkg_fvr_spare_standby;"
/
