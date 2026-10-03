CREATE OR REPLACE
"PACKAGE BODY pkg_fvr_spare_restore
"
"AS
"
"  PROCEDURE proc_cre_restore_decr_new_fvr(p_bu         fld_visit_rpt_hd.fvrh_bu%TYPE,
"
"                           p_plnt     prod_plants.prodplnt_plnt%TYPE,
"
"                          p_doc_no   fld_visit_rpt_hd.fvrh_doc_no%TYPE,
"
"                          p_user     fld_visit_rpt_hd.fvrh_cre_by%TYPE
"
"                         )
"
"  AS
"
"  CURSOR c1
"
"      IS
"
"  SELECT *
"
"    FROM fld_visit_rpt_hd,
"
"         fld_visit_rpt_spare_standby,
"
"         products
"
"   WHERE fvrh_bu = fvrss_bu
"
"     AND fvrh_doc_no = fvrss_doc_no
"
"     AND fvrh_bu = prod_bu
"
"     AND fvrh_prod_id = prod_id
"
"     AND fvrh_prod_rev = prod_rev
"
"     AND fvrss_bu = p_bu
"
"     AND fvrss_doc_no = p_doc_no
"
"     AND fvrss_type = 'R';
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
"
"
" CURSOR c_prod(c_prod_id    VARCHAR2,
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
"
"
"v_emp_good_wh    VARCHAR2(10);
"
"v_cust_good_wh    VARCHAR2(10);
"
"v_prod_cls    VARCHAR2(100);
"
"v_ref        VARCHAR2(500);
"
"v_sys_ls_no    NUMBER;
"
"
"
"r_prod        c_prod%ROWTYPE;
"
"cr3    c3%ROWTYPE;
"
"v_date date;
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
"  v_date := sysdate;--cr1.fvrh_doc_date
"
"      OPEN c_prod(cr1.fvrss_prod_id,cr1.fvrss_prod_rev);
"
"      FETCH c_prod INTO r_prod;
"
"      CLOSE c_prod;
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
"        Raise_Application_Error(-20768,'ICM '||'Emp. (GC) W/H Need to Create'||p_bu||'~'||p_plnt||'~'||cr1.fvrh_csr_emp_id);
"
"      END;
"
"
"
"      BEGIN
"
"        SELECT prodplnt_cls
"
"          INTO v_prod_cls
"
"          FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"           AND prodplnt_plnt = p_plnt
"
"           AND prodplnt_prod_id = cr1.fvrss_prod_id
"
"           AND prodplnt_prod_rev = cr1.fvrss_prod_rev;
"
"      END;
"
"
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
"                      NVL(func_find_unitcost(p_bu,cr1.fvrss_prod_id,cr1.fvrss_prod_rev,v_emp_good_wh),0.001),
"
"                      NVL(func_find_unitcost(p_bu,cr1.fvrss_prod_id,cr1.fvrss_prod_rev,v_emp_good_wh),0.001),
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
"                      'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                      'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
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
"    IF func_find_prod_ser_lot_type(p_bu,cr1.fvrss_prod_id,cr1.fvrss_prod_rev) IN ('L','O','S') THEN
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
"                    NVL(func_find_unitcost(p_bu,cr1.fvrss_prod_id,cr1.fvrss_prod_rev,v_emp_good_wh),0.001),
"
"                    cr1.prod_ser_lot_opt,
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
"                                'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                                'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                                p_user
"
"                               );
"
"    END IF;
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
"                                        NULL,
"
"                        'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                    'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                            p_prod_cls_desc     => r_prod.prod_cls_desc,
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
"
"
"
"
"    IF cr1.fvrss_rcvd_prod_id IS NOT NULL THEN
"
"/*Given Standby Material Receive */
"
"
"
"      BEGIN
"
"        SELECT prodplnt_cls
"
"          INTO v_prod_cls
"
"          FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"           AND prodplnt_plnt = p_plnt
"
"           AND prodplnt_prod_id = cr1.fvrss_rcvd_prod_id
"
"           AND prodplnt_prod_rev = cr1.fvrss_rcvd_prod_rev;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20260,'ICM '||p_bu||'/'||p_plnt||'/'||cr1.fvrss_rcvd_prod_id||'/'||cr1.fvrss_rcvd_prod_rev);
"
"      END;
"
"
"
"            proc_upd_stocks(p_bu,
"
"                    v_emp_good_wh,
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
"                    cr1.fvrss_seq_no,
"
"                    NULL,
"
"                    0,
"
"                    0,
"
"                    'FIELD VISIT MATERIAL RESTORE TO EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                    'FIELD VISIT MATERIAL RESTORE TO EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
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
"                          );
"
"
"
"   IF func_find_prod_ser_lot_type(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev) IN ('L','O','S') THEN
"
"
"
"            v_sys_ls_no := NULL;
"
"
"
"        proc_upd_lot_ser_stocks(p_bu,
"
"                    v_emp_good_wh,
"
"                    cr1.fvrss_rcvd_prod_id,
"
"                    cr1.fvrss_rcvd_prod_rev,
"
"                    cr1.fvrss_old_sys_ls_no,
"
"                    1,
"
"                    0,
"
"                    0,
"
"                    NVL(func_find_unitcost(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev,v_emp_good_wh),0.001),
"
"                    cr1.prod_ser_lot_opt,
"
"                    NULL,
"
"                    cr1.fvrss_old_serial_no,
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
"                                'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                                'FIELD VISIT MATERIAL RESTORE FROM EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                                p_user
"
"                               );
"
"    END IF;
"
"
"
"    IF func_find_prod_cost_method(p_bu,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev) NOT IN ('MAC') THEN
"
"
"
"         OPEN c3(v_emp_good_wh,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev);
"
"         FETCH c3 INTO cr3;
"
"
"
"         proc_upd_stock_batches(p_bu,
"
"                    v_emp_good_wh,
"
"                    cr1.fvrss_rcvd_prod_id,
"
"                    cr1.fvrss_rcvd_prod_rev,
"
"                    NULL,
"
"                    1,
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
"                    func_find_product_class(p_bu,p_plnt,cr1.fvrss_rcvd_prod_id,cr1.fvrss_rcvd_prod_rev),
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
"                                        NULL,
"
"                        'FIELD VISIT MATERIAL RESTORE TO EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
"
"                    'FIELD VISIT MATERIAL RESTORE TO EMP. GC('||p_doc_no||'/'||cr1.fvrss_seq_no||')',
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
"    END IF;
"
"
"
"     END IF;
"
"
"
"   END LOOP c1;
"
"END proc_cre_restore_decr_new_fvr;
"
"
"
"END pkg_fvr_spare_restore;"
/
