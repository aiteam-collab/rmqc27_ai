CREATE OR REPLACE
"PACKAGE BODY        pkg_mat_rcpt
"
"AS
"
"
"
"  PROCEDURE proc_cre_ge_frm_mat_trf_dc(p_bu        IN    business_units.bu_id%TYPE,
"
"                                       p_date       IN     DATE,
"
"                                       p_user        IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                       p_res        OUT    VARCHAR2
"
"                                      )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT store_plnt,store_plnt_loc_id,store_plnt_loc_name,dchd_plnt
"
"    FROM mat_trf_pend_dc_view,stores
"
"   WHERE dchd_bu = store_bu
"
"     AND dchd_suplr_id = store_id
"
"     AND dchd_bu = p_bu
"
"     AND dcln_trf_sel_flag = 'Y'
"
"     AND dcln_trf_sel_user = p_user
"
"     AND dcln_proc_qty > 0
"
"     AND dchd_itr_compl_flag = 'Y'
"
"   GROUP BY store_plnt,store_plnt_loc_id,store_plnt_loc_name,dchd_plnt
"
"   ORDER BY store_plnt;
"
"
"
"  CURSOR c2(c_sou_plnt        VARCHAR2,
"
"            c_plnt        VARCHAR2,
"
"        c_plnt_loc_id    VARCHAR2) IS
"
"  SELECT dchd_dc_no,dchd_date,dchd_source_frm,
"
"         (SELECT store_desc1 FROM stores WHERE store_bu = dchd_bu AND store_id = dchd_source_frm) store_desc1
"
"    FROM mat_trf_pend_dc_view,stores
"
"   WHERE dchd_bu = store_bu
"
"     AND dchd_suplr_id = store_id
"
"     AND dchd_bu = p_bu
"
"     AND dcln_trf_sel_flag = 'Y'
"
"     AND dcln_trf_sel_user = p_user
"
"     AND dcln_proc_qty > 0
"
"     AND dchd_plnt = c_sou_plnt
"
"     AND store_plnt = c_plnt
"
"     AND store_plnt_loc_id = c_plnt_loc_id
"
"   GROUP BY dchd_bu,dchd_dc_no,dchd_date,dchd_source_frm
"
"   ORDER BY dchd_dc_no;
"
"
"
"  CURSOR c3(c_sou_plnt        VARCHAR2,
"
"            c_plnt        VARCHAR2,
"
"        c_plnt_loc_id    VARCHAR2,
"
"            c_dc_no        VARCHAR2,
"
"        c_store_id        VARCHAR2) IS
"
"  SELECT *
"
"    FROM mat_trf_pend_dc_view,stores
"
"   WHERE dchd_bu = store_bu
"
"     AND dchd_suplr_id = store_id
"
"     AND dchd_bu = p_bu
"
"     AND dcln_trf_sel_flag = 'Y'
"
"     AND dcln_trf_sel_user = p_user
"
"     AND dcln_proc_qty > 0
"
"     AND dchd_plnt = c_sou_plnt
"
"     AND store_plnt = c_plnt
"
"     AND store_plnt_loc_id = c_plnt_loc_id
"
"     AND dchd_dc_no = c_dc_no
"
"     AND dchd_source_frm = c_store_id
"
"   ORDER BY dchd_doc_no,dcln_seq_no;
"
"
"
"  CURSOR c_ls(c_plnt        VARCHAR2,
"
"              c_doc_no        VARCHAR2,
"
"          c_doc_seq_no    NUMBER) IS
"
"  SELECT *
"
"    FROM dc_lot_serial_dtls
"
"   WHERE dclsd_bu = p_bu
"
"     AND dclsd_plnt = c_plnt
"
"     AND dclsd_doc_no = c_doc_no
"
"     AND dclsd_seq_no = c_doc_seq_no
"
"     AND dclsd_trf_sel_flag = 'Y'
"
"     AND dclsd_trf_sel_user = p_user
"
"     AND dclsd_proc_qty > 0
"
"     AND dclsd_qty - (dclsd_compld_qty + dclsd_inproc_qty) > 0
"
"   ORDER BY dclsd_sub_seq_no;
"
"
"
"  CURSOR c4 IS
"
"  SELECT *
"
"    FROM mat_trf_pend_dc_view
"
"   WHERE dchd_bu = p_bu
"
"     AND dcln_trf_sel_flag = 'Y'
"
"     AND dcln_trf_sel_user = p_user
"
"     AND dcln_proc_qty > 0
"
"     AND dchd_itr_compl_flag = 'N';
"
"
"
"  v_doc_pfx        VARCHAR2(5);
"
"  v_doc_no        VARCHAR2(15);
"
"  v_doc_no1        VARCHAR2(500);
"
"  v_ln_seq_no        NUMBER(5) := 0;
"
"  v_dtl_seq_no        NUMBER(5) := 0;
"
"  v_ls_seq_no        NUMBER(5) := 0;
"
"  v_auto_mtr_compl_flag VARCHAR2(1);
"
"  v_dummy           VARCHAR2(100);
"
"  v_mr_doc_no         VARCHAR2(100);
"
"  v_jrnl_res            VARCHAR2(1);
"
"
"
"  BEGIN
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_doc_pfx := func_find_ge_in_pfx(p_bu,cr1.store_plnt,cr1.store_plnt_loc_id,'MT');
"
"      v_doc_no := func_find_pfx_nextno(p_bu,p_date,v_doc_pfx,p_user);
"
"
"
"      v_doc_no1 := v_doc_no1||v_doc_no||' ';
"
"      --Raise_Application_Error(-20999,'HRM '||v_doc_pfx||'/'||v_doc_no);
"
"      INSERT INTO gate_entry_hd(gehd_bu,
"
"                                gehd_doc_no,
"
"                gehd_plnt,
"
"                gehd_ref_unit,
"
"                gehd_date,
"
"                gehd_status,
"
"                gehd_type,
"
"                gehd_gk_id,
"
"                gehd_vehicle_no,
"
"                gehd_driver_name,
"
"                gehd_mode,
"
"                gehd_ret_flag,
"
"                gehd_gate,
"
"                gehd_vehicle_in,
"
"                gehd_vehicle_out,
"
"                gehd_entry_ref,
"
"                gehd_cre_by,
"
"                gehd_cre_date,
"
"                gehd_plnt_loc_id,
"
"                gehd_plnt_loc_name,
"
"                gehd_act
"
"                   )
"
"             VALUES(p_bu,
"
"                    v_doc_no,
"
"                cr1.store_plnt,
"
"                cr1.dchd_plnt,
"
"                p_date,
"
"                'N',
"
"                'I',
"
"                func_find_emp_id(p_bu,p_user),
"
"                NULL,
"
"                NULL,
"
"                'MT',
"
"                'N',
"
"                NULL,
"
"                NULL,
"
"                NULL,
"
"                'Material Receipt',
"
"                p_user,
"
"                SYSDATE,
"
"                cr1.store_plnt_loc_id,
"
"                cr1.store_plnt_loc_name,
"
"                'U'
"
"                   );
"
"
"
"      FOR cr2 IN c2(cr1.dchd_plnt,cr1.store_plnt,cr1.store_plnt_loc_id)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(geln_seq_no),0)+1
"
"      INTO v_ln_seq_no
"
"      FROM gate_entry_ln
"
"         WHERE geln_bu = p_bu
"
"       AND geln_plnt = cr1.store_plnt
"
"       AND geln_doc_no = v_doc_no;
"
"
"
"        INSERT INTO gate_entry_ln(geln_bu,
"
"                  geln_doc_no,
"
"                  geln_seq_no,
"
"                  geln_status,
"
"                                  geln_party_type,
"
"                  geln_suplr_id,
"
"                  geln_suplr_name,
"
"                  geln_dc_no,
"
"                  geln_dc_date,
"
"                  geln_dc_flag,
"
"                  geln_dc_rtn_flag,
"
"                  geln_plnt,
"
"                  geln_cre_by,
"
"                  geln_cre_date
"
"                     )
"
"               VALUES(p_bu,
"
"                  v_doc_no,
"
"                  v_ln_seq_no,
"
"                  'N',
"
"                  'W',
"
"                  cr2.dchd_source_frm,
"
"                  cr2.store_desc1,
"
"                  cr2.dchd_dc_no,
"
"                  cr2.dchd_date,
"
"                  'N',
"
"                  'N',
"
"                  cr1.store_plnt,
"
"                  p_user,
"
"                  SYSDATE
"
"                     );
"
"
"
"        FOR cr3 IN c3(cr1.dchd_plnt,cr1.store_plnt,cr1.store_plnt_loc_id,cr2.dchd_dc_no,cr2.dchd_source_frm)
"
"    LOOP
"
"
"
"      SELECT NVL(MAX(gedl_sub_seq_no),0)+1
"
"            INTO v_dtl_seq_no
"
"            FROM gate_entry_details
"
"       WHERE gedl_bu = p_bu
"
"             AND gedl_plnt = cr1.store_plnt
"
"         AND gedl_doc_no = v_doc_no
"
"         AND gedl_seq_no = v_ln_seq_no;
"
"
"
"      INSERT INTO gate_entry_details(gedl_bu,
"
"                     gedl_plnt,
"
"                     gedl_doc_no,
"
"                     gedl_seq_no,
"
"                     gedl_sub_seq_no,
"
"                     gedl_mat_type,
"
"                     gedl_prod_id,
"
"                     gedl_prod_rev,
"
"                     gedl_uom,
"
"                     gedl_prod_uom,
"
"                     gedl_conv_factor,
"
"                     gedl_qty,
"
"                     gedl_unit_cost,
"
"                     gedl_status,
"
"                     gedl_prod_desc1,
"
"                     gedl_store_id,
"
"                     gedl_prod_ord_no,
"
"                     gedl_sf_code,
"
"                     gedl_dc_doc_no,
"
"                     gedl_dc_no,
"
"                     gedl_dc_seq_no,
"
"                     gedl_cre_by,
"
"                     gedl_cre_date,
"
"                     gedl_sou_doc_no,
"
"                     gedl_sou_doc_seq_no,
"
"                     gedl_oprn_ln_seq_no,
"
"                     gedl_process_id,
"
"                     gedl_po_plnt,
"
"                                         gedl_po_plnt_loc_id
"
"                    )
"
"                      VALUES(p_bu,
"
"                     cr1.store_plnt,
"
"                     v_doc_no,
"
"                     v_ln_seq_no,
"
"                     v_dtl_seq_no,
"
"                     NVL(cr3.dcln_mat_type,'PR'),
"
"                     cr3.dcln_prod_id,
"
"                     cr3.dcln_prod_rev,
"
"                     cr3.dcln_uom,
"
"                     cr3.dcln_uom,
"
"                     1,
"
"                     cr3.dcln_proc_qty,
"
"                     cr3.dcln_sc_unit_cost,
"
"                     'N',
"
"                     cr3.dcln_prod_desc1,
"
"                     cr3.dchd_suplr_id,
"
"                     cr3.dcln_prod_ord_no,
"
"                     cr3.dcln_sf_code,
"
"                     cr3.dchd_doc_no,
"
"                     cr3.dchd_dc_no,
"
"                     cr3.dcln_seq_no,
"
"                     p_user,
"
"                     SYSDATE,
"
"                     cr3.dcln_mi_doc_no,
"
"                     cr3.dcln_mi_seq_no,
"
"                     cr3.dcln_oprn_ln_seq_no,
"
"                     cr3.dcln_process_id,
"
"                     cr1.store_plnt,
"
"                                         cr1.store_plnt_loc_id
"
"                    );
"
"
"
"      UPDATE dc_ln
"
"         SET dcln_cons_inproc_qty = dcln_cons_inproc_qty + cr3.dcln_proc_qty,
"
"             dcln_proc_qty = dcln_proc_qty - cr3.dcln_proc_qty,
"
"         dcln_trf_sel_flag = 'N',
"
"         dcln_trf_sel_user = NULL
"
"           WHERE dcln_bu = p_bu
"
"         AND dcln_plnt = cr3.dchd_plnt
"
"         AND dcln_doc_no = cr3.dchd_doc_no
"
"         AND dcln_seq_no = cr3.dcln_seq_no
"
"         AND dcln_prod_id = cr3.dcln_prod_id
"
"         AND dcln_prod_rev = cr3.dcln_prod_rev;
"
"
"
"      FOR r_ls IN c_ls(cr3.dchd_plnt,cr3.dchd_doc_no,cr3.dcln_seq_no)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(gelsd_seq_no),0)+1
"
"          INTO v_ls_seq_no
"
"          FROM gate_enrty_lot_ser_dtls
"
"         WHERE gelsd_bu = p_bu
"
"           AND gelsd_plnt = cr1.store_plnt
"
"           AND gelsd_doc_no = v_doc_no
"
"           AND gelsd_ln_seq_no = v_ln_seq_no
"
"           AND gelsd_dtl_seq_no = v_dtl_seq_no;
"
"
"
"            INSERT INTO gate_enrty_lot_ser_dtls(gelsd_bu,
"
"                                            gelsd_plnt,
"
"                        gelsd_doc_no,
"
"                        gelsd_ln_seq_no,
"
"                        gelsd_dtl_seq_no,
"
"                        gelsd_seq_no,
"
"                        gelsd_batch_id,
"
"                            gelsd_sys_ls_no,
"
"                        gelsd_lot_no,
"
"                        gelsd_ser_no,
"
"                        gelsd_source_type,
"
"                        gelsd_source_id,
"
"                        gelsd_trans_qty,
"
"                        gelsd_cre_by,
"
"                        gelsd_cre_date,
"
"                        gelsd_mfg_date,
"
"                        gelsd_expiry_date
"
"                           )
"
"                     VALUES(p_bu,
"
"                            cr1.store_plnt,
"
"                        v_doc_no,
"
"                        v_ln_seq_no,
"
"                        v_dtl_seq_no,
"
"                        v_ls_seq_no,
"
"                        NULL,
"
"                        r_ls.dclsd_sys_ls_no,
"
"                        r_ls.dclsd_lot_no,
"
"                        r_ls.dclsd_serial_no,
"
"                        r_ls.dclsd_source_type,
"
"                        r_ls.dclsd_source_id,
"
"                        r_ls.dclsd_proc_qty,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        r_ls.dclsd_mfg_date,
"
"                        r_ls.dclsd_expiry_date
"
"                           );
"
"
"
"         UPDATE dc_lot_serial_dtls
"
"            SET dclsd_proc_qty = dclsd_proc_qty - r_ls.dclsd_proc_qty,
"
"            dclsd_inproc_qty = dclsd_inproc_qty + r_ls.dclsd_proc_qty
"
"          WHERE dclsd_bu = p_bu
"
"                AND dclsd_plnt = cr3.dchd_plnt
"
"                AND dclsd_doc_no = cr3.dchd_doc_no
"
"                AND dclsd_seq_no = cr3.dcln_seq_no
"
"        AND dclsd_sub_seq_no = r_ls.dclsd_sub_seq_no;
"
"
"
"      END LOOP c_ls;
"
"
"
"    END LOOP c3;
"
"
"
"      END LOOP c2;
"
"
"
"      BEGIN
"
"        SELECT icmctrl_auto_mtr_compl_flag
"
"          INTO v_auto_mtr_compl_flag
"
"          FROM icm_control
"
"         WHERE icmctrl_bu = p_bu;
"
"      END;
"
"
"
"      IF v_auto_mtr_compl_flag = 'Y' THEN
"
"
"
"        proc_approve_ge_doc(p_bu,
"
"                               cr1.store_plnt,
"
"                               v_doc_no,
"
"                               p_user,
"
"                               v_dummy
"
"                              );
"
"
"
"        UPDATE gate_entry_details
"
"           SET gedl_trf_sel_flag = 'Y',
"
"               gedl_trf_sel_user = p_user
"
"         WHERE gedl_bu = p_bu
"
"           AND gedl_doc_no = v_doc_no;
"
"
"
"        proc_cre_mr_frm_mat_trf_ge(p_bu,
"
"                               p_date,
"
"                                   p_user,
"
"                   p_user_emp,
"
"                     v_mr_doc_no
"
"                    );
"
"     /*
"
"        IF  func_find_inv_method(p_bu) IN ('T') THEN
"
"
"
"      proc_ins_mat_iss_appl_jrnl(p_bu,
"
"                     cr1.dchd_ref_unit,
"
"                     TRIM(v_mr_doc_no),
"
"                     p_user,
"
"                     1,
"
"                     v_jrnl_res
"
"                     );
"
"
"
"          IF v_jrnl_res = 'N' THEN
"
"        Raise_Application_Error(-20999,'HRM');
"
"      ELSE
"
"        UPDATE inv_stock_trans_hd
"
"               SET isthd_jrnl_flag = 'Y'
"
"             WHERE isthd_bu = p_bu
"
"           AND isthd_plnt = cr1.dchd_ref_unit
"
"               AND isthd_doc_no = TRIM(v_mr_doc_no);
"
"          END IF;
"
"        END IF;
"
"
"
"          proc_recv_rcpt_frm_mat_rcpt(p_bu,
"
"                                      TRIM(v_mr_doc_no),
"
"                                      p_user
"
"                       );
"
"
"
"        IF  func_find_inv_method(p_bu) IN ('T') THEN
"
"
"
"          proc_ins_gl_jrnl(p_bu,
"
"                   cr1.dchd_ref_unit,
"
"                   p_date,
"
"                   func_find_year(p_bu,p_date),
"
"                   func_find_period(p_bu,p_date),
"
"                   NULL,
"
"                   TRIM(v_mr_doc_no),
"
"                   NULL,
"
"                   'ICM',
"
"                   p_user,
"
"                   1,
"
"                   'MATERIAL TRANSFER FROM ' ||cr1.dchd_plnt ||' TO ' || cr1.dchd_ref_unit
"
"                   );
"
"        END IF;
"
"*/
"
"      END IF;
"
"
"
"    END LOOP c1;
"
"
"
"    FOR cr4 IN c4
"
"    LOOP
"
"
"
"    --Raise_Application_Error(-20999,'HRM Flow Error - Inform SCM Team');
"
"
"
"      IF v_doc_no IS NULL THEN
"
"      v_doc_no := func_find_pfx_nextno(p_bu,p_date,
"
"                                       func_find_ge_in_pfx(p_bu,cr4.dchd_plnt,NULL,'MT'),p_user);
"
"
"
"      v_doc_no1 := v_doc_no1||v_doc_no||' ';
"
"
"
"      INSERT INTO gate_entry_hd(gehd_bu,
"
"                                gehd_doc_no,
"
"                gehd_plnt,
"
"                gehd_ref_unit,
"
"                gehd_date,
"
"                gehd_status,
"
"                gehd_type,
"
"                gehd_gk_id,
"
"                gehd_vehicle_no,
"
"                gehd_driver_name,
"
"                gehd_mode,
"
"                gehd_ret_flag,
"
"                gehd_gate,
"
"                gehd_vehicle_in,
"
"                gehd_vehicle_out,
"
"                gehd_entry_ref,
"
"                gehd_cre_by,
"
"                gehd_cre_date,
"
"                gehd_itr_compl_flag,
"
"                gehd_prod_id,
"
"                gehd_prod_rev,
"
"                gehd_prod_desc1,
"
"                gehd_fr_store_id,
"
"                gehd_to_store_id,
"
"                gehd_plnt_loc_id,
"
"                gehd_plnt_loc_name
"
"                   )
"
"             VALUES(p_bu,
"
"                    v_doc_no,
"
"                cr4.dchd_plnt,
"
"                cr4.dchd_plnt,
"
"                p_date,
"
"                'N',
"
"                'I',
"
"                func_find_emp_id(p_bu,p_user),
"
"                NULL,
"
"                NULL,
"
"                'MT',
"
"                'N',
"
"                NULL,
"
"                NULL,
"
"                NULL,
"
"                'Material Receipt',
"
"                p_user,
"
"                SYSDATE,
"
"                cr4.dchd_itr_compl_flag,
"
"                cr4.dcln_prod_id,
"
"                cr4.dcln_prod_rev,
"
"                cr4.dcln_prod_desc1,
"
"                cr4.dchd_suplr_id,
"
"                cr4.dchd_source_frm,
"
"                cr4.dchd_plnt_loc_id,
"
"                cr4.dchd_plnt_loc_name
"
"                   );
"
"
"
"      v_ln_seq_no := v_ln_seq_no + 1;
"
"
"
"      INSERT INTO gate_entry_ln(geln_bu,
"
"                geln_doc_no,
"
"                geln_seq_no,
"
"                geln_status,
"
"                geln_suplr_id,
"
"                geln_suplr_name,
"
"                geln_dc_no,
"
"                geln_dc_date,
"
"                geln_dc_flag,
"
"                geln_dc_rtn_flag,
"
"                geln_plnt,
"
"                geln_cre_by,
"
"                geln_cre_date
"
"                   )
"
"             VALUES(p_bu,
"
"                v_doc_no,
"
"                v_ln_seq_no,
"
"                'N',
"
"                cr4.dchd_source_frm,
"
"                (SELECT store_desc1
"
"                   FROM stores
"
"                  WHERE store_bu = p_bu
"
"                    AND store_id = cr4.dchd_source_frm),
"
"                cr4.dchd_dc_no,
"
"                cr4.dchd_date,
"
"                'N',
"
"                'N',
"
"                cr4.dchd_plnt,
"
"                p_user,
"
"                SYSDATE
"
"                   );
"
"
"
"      END IF;
"
"
"
"      v_dtl_seq_no := v_dtl_seq_no + 1;
"
"
"
"      INSERT INTO gate_entry_details(gedl_bu,
"
"                     gedl_plnt,
"
"                     gedl_doc_no,
"
"                     gedl_seq_no,
"
"                     gedl_sub_seq_no,
"
"                     gedl_mat_type,
"
"                     gedl_prod_id,
"
"                     gedl_prod_rev,
"
"                     gedl_uom,
"
"                     gedl_prod_uom,
"
"                     gedl_conv_factor,
"
"                     gedl_qty,
"
"                     gedl_unit_cost,
"
"                     gedl_status,
"
"                     gedl_prod_desc1,
"
"                     gedl_store_id,
"
"                     gedl_prod_ord_no,
"
"                     gedl_sf_code,
"
"                     gedl_dc_doc_no,
"
"                     gedl_dc_no,
"
"                     gedl_dc_seq_no,
"
"                     gedl_cre_by,
"
"                     gedl_cre_date
"
"                    )
"
"                  VALUES(p_bu,
"
"                     cr4.dchd_plnt,
"
"                     v_doc_no,
"
"                     v_ln_seq_no,
"
"                     v_dtl_seq_no,
"
"                     NVL(cr4.dcln_mat_type,'PR'),
"
"                     cr4.dcln_prod_id,
"
"                     cr4.dcln_prod_rev,
"
"                     cr4.dcln_uom,
"
"                     cr4.dcln_uom,
"
"                     1,
"
"                     cr4.dcln_proc_qty,
"
"                     cr4.dcln_sc_unit_cost,
"
"                     'N',
"
"                     cr4.dcln_prod_desc1,
"
"                     cr4.dcln_store_id,
"
"                     --cr4.dchd_suplr_id,
"
"                     cr4.dcln_prod_ord_no,
"
"                     cr4.dcln_sf_code,
"
"                     cr4.dchd_doc_no,
"
"                     cr4.dchd_dc_no,
"
"                     cr4.dcln_seq_no,
"
"                     p_user,
"
"                     SYSDATE
"
"                    );
"
"
"
"      FOR r_ls IN c_ls(cr4.dchd_plnt,cr4.dchd_doc_no,cr4.dcln_seq_no)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(gelsd_seq_no),0)+1
"
"          INTO v_ls_seq_no
"
"          FROM gate_enrty_lot_ser_dtls
"
"         WHERE gelsd_bu = p_bu
"
"           AND gelsd_plnt = cr4.dchd_plnt
"
"           AND gelsd_doc_no = v_doc_no
"
"           AND gelsd_ln_seq_no = v_ln_seq_no
"
"           AND gelsd_dtl_seq_no = v_dtl_seq_no;
"
"
"
"            INSERT INTO gate_enrty_lot_ser_dtls(gelsd_bu,
"
"                                                gelsd_plnt,
"
"                                                gelsd_doc_no,
"
"                                                gelsd_ln_seq_no,
"
"                                                gelsd_dtl_seq_no,
"
"                                                gelsd_seq_no,
"
"                                                gelsd_batch_id,
"
"                                                gelsd_sys_ls_no,
"
"                                                gelsd_lot_no,
"
"                                                gelsd_ser_no,
"
"                                                gelsd_source_type,
"
"                                                gelsd_source_id,
"
"                                                gelsd_trans_qty,
"
"                                                gelsd_cre_by,
"
"                                                gelsd_cre_date,
"
"                                                gelsd_mfg_date,
"
"                                                gelsd_expiry_date)
"
"                                         VALUES(p_bu,
"
"                                                cr4.dchd_plnt,
"
"                                                v_doc_no,
"
"                                                v_ln_seq_no,
"
"                                                v_dtl_seq_no,
"
"                                                v_ls_seq_no,
"
"                                                NULL,
"
"                                                r_ls.dclsd_sys_ls_no,
"
"                                                r_ls.dclsd_lot_no,
"
"                                                r_ls.dclsd_serial_no,
"
"                                                r_ls.dclsd_source_type,
"
"                                                r_ls.dclsd_source_id,
"
"                                                r_ls.dclsd_proc_qty,
"
"                                                p_user,
"
"                                                SYSDATE,
"
"                                                r_ls.dclsd_mfg_date,
"
"                                                r_ls.dclsd_expiry_date
"
"                           );
"
"
"
"         UPDATE dc_lot_serial_dtls
"
"            SET dclsd_proc_qty = dclsd_proc_qty - r_ls.dclsd_proc_qty,
"
"            dclsd_inproc_qty = dclsd_inproc_qty + r_ls.dclsd_proc_qty
"
"          WHERE dclsd_bu = p_bu
"
"                AND dclsd_plnt = cr4.dchd_plnt
"
"                AND dclsd_doc_no = cr4.dchd_doc_no
"
"                AND dclsd_seq_no = cr4.dcln_seq_no
"
"        AND dclsd_sub_seq_no = r_ls.dclsd_sub_seq_no;
"
"
"
"      END LOOP c_ls;
"
"
"
"      UPDATE dc_ln
"
"         SET dcln_cons_inproc_qty = dcln_cons_inproc_qty + cr4.dcln_proc_qty,
"
"         dcln_proc_qty = dcln_proc_qty - cr4.dcln_proc_qty,
"
"         dcln_trf_sel_flag = 'N',
"
"         dcln_trf_sel_user = NULL
"
"       WHERE dcln_bu = p_bu
"
"     AND dcln_plnt = cr4.dchd_plnt
"
"     AND dcln_doc_no = cr4.dchd_doc_no
"
"     AND dcln_seq_no = cr4.dcln_seq_no
"
"     AND dcln_prod_id = cr4.dcln_prod_id
"
"     AND dcln_prod_rev = cr4.dcln_prod_rev;
"
"
"
"    END LOOP c4;
"
"
"
"    p_res := func_find_order_no_substr(v_doc_no1);
"
"
"
"  END proc_cre_ge_frm_mat_trf_dc;
"
"
"
"  PROCEDURE proc_cre_mrv_frm_miv(p_bu        IN    business_units.bu_id%TYPE,
"
"                                 p_date        IN     DATE,
"
"                                 p_user        IN    appl_users.appluser_id%TYPE,
"
"                 p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                                 p_res        OUT    VARCHAR2,
"
"                 p_mi_doc_no    IN    VARCHAR2    DEFAULT NULL
"
"                                )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT isthdh_issueto_plnt,isthdh_issueto_plnt_loc_id,isthdh_issueto_type,isthdh_issueto_id,isthdh_iss_code,isthdh_vou_oper,isthdh_vou_type,
"
"         isthdh_cust_id
"
"    FROM inv_stock_trans_vw
"
"   WHERE isthdh_bu = p_bu
"
"     AND ((istlnh_sel_flag = 'Y' AND istlnh_sel_user = p_user AND p_mi_doc_no IS NULL) OR isthdh_doc_no = p_mi_doc_no)
"
"     AND istlnh_proc_qty > 0
"
"   GROUP BY isthdh_issueto_plnt,isthdh_issueto_plnt_loc_id,isthdh_issueto_type,isthdh_issueto_id,isthdh_iss_code,isthdh_vou_oper,isthdh_cust_id,isthdh_vou_type
"
"   ORDER BY isthdh_issueto_plnt_loc_id,isthdh_issueto_plnt,isthdh_issueto_type,isthdh_issueto_id,isthdh_iss_code,isthdh_cust_id,isthdh_vou_type;
"
"
"
"  CURSOR c2(c_rcpt_plnt        VARCHAR2,
"
"            c_rcpt_plnt_loc_id    VARCHAR2,
"
"        c_rcpt_type        VARCHAR2,
"
"        c_rcpt_store_id    VARCHAR2,
"
"        c_vou_oper        VARCHAR2,
"
"        c_iss_code        VARCHAR2) IS
"
"  SELECT *
"
"    FROM inv_stock_trans_vw,products
"
"   WHERE prod_bu = istlnh_bu
"
"     AND prod_id = istlnh_prod_id
"
"     AND prod_rev = istlnh_prod_rev
"
"     AND isthdh_bu = p_bu
"
"     AND ((istlnh_sel_flag = 'Y' AND istlnh_sel_user = p_user) OR isthdh_doc_no = p_mi_doc_no)
"
"     AND istlnh_proc_qty > 0
"
"     AND isthdh_issueto_plnt = c_rcpt_plnt
"
"     AND isthdh_issueto_plnt_loc_id = c_rcpt_plnt_loc_id
"
"     AND isthdh_issueto_type = c_rcpt_type
"
"     AND isthdh_issueto_id = c_rcpt_store_id
"
"     AND isthdh_vou_oper = c_vou_oper
"
"     AND (isthdh_iss_code = c_iss_code OR (c_iss_code IS NULL));
"
"
"
"
"
"    TYPE typ_ls IS TABLE OF inv_stock_batch_details_hist%ROWTYPE INDEX BY PLS_INTEGER;
"
"
"
"    r_ls_blk        typ_ls;
"
"
"
"    v_req_id    VARCHAR2(10);
"
"    v_store_id  VARCHAR2(50);
"
"    v_req_name    VARCHAR2(100);
"
"    v_pos_id    VARCHAR2(10);
"
"    v_pos_name    VARCHAR2(100);
"
"    v_dummy    VARCHAR2(100);
"
"
"
"    v_year    NUMBER(6);
"
"    v_period    NUMBER(2);
"
"
"
"    v_mr_doc_no        VARCHAR2(30);
"
"    v_mr_doc_no1    VARCHAR2(100);
"
"
"
"    v_seq_no        NUMBER;
"
"    v_ls_seq_no        NUMBER;
"
"    v_roll_seq_no    NUMBER;
"
"
"
"    v_mrv_post_flag    VARCHAR2(1);
"
"    v_mrv_post_flag_grn VARCHAR2(1);
"
"    v_bin_flag        VARCHAR2(1);
"
"
"
"    v_emp_id        VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr        VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user        VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"    v_so_seq_no        NUMBER;
"
"
"
"  BEGIN
"
"
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_req_id,v_req_name,v_pos_id,v_pos_name,v_dummy,v_dummy,1);
"
"
"
"    proc_find_year_period(p_bu,p_date,v_year,v_period);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"
"
"
"
"      v_mr_doc_no := func_find_pfx_nextno(p_bu,p_date,func_find_vou_dflt_pfx(p_bu,cr1.isthdh_issueto_plnt,cr1.isthdh_issueto_plnt_loc_id,'MRV','MRV'),p_user);
"
"      v_mr_doc_no1 := v_mr_doc_no1||v_mr_doc_no||' ';
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"                                     isthd_plnt,
"
"                     isthd_plnt_loc_id,
"
"                     isthd_plnt_loc_name,
"
"                                     isthd_doc_no,
"
"                                     isthd_doc_oper,
"
"                                     isthd_issuefm_store_id,
"
"                                     isthd_issueto_type,
"
"                                     isthd_issueto_id,
"
"                     isthd_issueto_plnt,
"
"                     isthd_issueto_plnt_loc_id,
"
"                                     isthd_trans_date,
"
"                                     isthd_year,
"
"                                     isthd_period,
"
"                                     isthd_status,
"
"                                     isthd_reference,
"
"                                     isthd_issuer_id,
"
"                                     isthd_issuer_name,
"
"                                     isthd_issuer_pos_id,
"
"                                     isthd_issuer_pos_name,
"
"                                     isthd_cre_by,
"
"                     isthd_cre_emp_id,
"
"                     isthd_cre_ip_addr,
"
"                     isthd_cre_os_user,
"
"                                     isthd_cre_date,
"
"                     isthd_iss_code,
"
"                     isthd_vou_oper,
"
"                     isthd_doc_pfx,
"
"                     isthd_cust_id,
"
"                                     isthd_rqstby_entity
"
"                                    )
"
"                              VALUES(p_bu,
"
"                                     cr1.isthdh_issueto_plnt,
"
"                     cr1.isthdh_issueto_plnt_loc_id,
"
"                     (SELECT bupld_loc_name FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu AND bupld_loc_id = cr1.isthdh_issueto_plnt_loc_id),
"
"                                     v_mr_doc_no,
"
"                                     'R',
"
"                                     NULL,--cr1.isthdh_issueto_id,
"
"                     cr1.isthdh_issueto_type,
"
"                                     cr1.isthdh_issueto_id,--cr1.istlnh_store_id,
"
"                     cr1.isthdh_issueto_plnt,--cr1.isthdh_plnt,
"
"                     cr1.isthdh_issueto_plnt_loc_id,--cr1.isthdh_plnt_loc_id,
"
"                                     p_date,
"
"                                     v_year,
"
"                                     v_period,
"
"                                     'N',
"
"                                     'MRV #'||v_mr_doc_no,
"
"                                     v_req_id,
"
"                                     v_req_name,
"
"                                     v_pos_id,
"
"                                     v_pos_name,
"
"                                     p_user,
"
"                     v_emp_id,
"
"                     v_ip_addr,
"
"                     v_os_user,
"
"                                     SYSDATE,
"
"                     cr1.isthdh_iss_code,
"
"                     cr1.isthdh_vou_oper,
"
"                     func_find_vou_dflt_pfx(p_bu,cr1.isthdh_issueto_plnt,cr1.isthdh_issueto_plnt_loc_id,'MRV','MRV'),
"
"                     cr1.isthdh_cust_id,
"
"                     p_bu
"
"                                    );
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.isthdh_issueto_plnt,cr1.isthdh_issueto_plnt_loc_id,cr1.isthdh_issueto_type,cr1.isthdh_issueto_id,cr1.isthdh_vou_oper,cr1.isthdh_iss_code)
"
"      LOOP
"
"      --  Raise_Application_Error(-20999,'HRM2'||'-'||cr2.istlnh_vou_type);
"
"
"
"
"
"        v_seq_no := v_seq_no + 1;
"
"
"
"    INSERT INTO inv_stock_trans_ln(istln_bu,
"
"                           istln_doc_no,
"
"                           istln_seq_no,
"
"                           istln_mat_type,
"
"                           istln_prod_id,
"
"                           istln_prod_rev,
"
"                           istln_uom,
"
"                           istln_prod_uom,
"
"                           istln_conv_factor,
"
"                           istln_prod_cls,
"
"                           istln_trans_qty,
"
"                       istln_stk_trans_qty,
"
"                           istln_unit_cost,
"
"                           istln_status,
"
"                           istln_po_ord_no,
"
"                           istln_sf_code,
"
"                       istln_reference,
"
"                           istln_cre_by,
"
"                       istln_cre_emp_id,
"
"                       istln_cre_ip_addr,
"
"                       istln_cre_os_user,
"
"                           istln_cre_date,
"
"                       istln_store_id,
"
"                       istln_rcpt_store_id,
"
"                       istln_prod_subcls,
"
"                       istln_prod_cls_desc,
"
"                       istln_prod_subcls_desc,
"
"                       istln_prod_grp,
"
"                       istln_prod_grp_desc,
"
"                       istln_prod_subgrp,
"
"                       istln_prod_subgrp_desc,
"
"                       istln_mi_doc_no,
"
"                       istln_mi_seq_no,
"
"                       istln_oprn_ln_seq_no,
"
"                       istln_process_id,
"
"                       istln_vou_type,
"
"                       istln_vou_no,
"
"                       istln_vou_seq_no,
"
"                       istln_type,
"
"                       istln_so_pfx,
"
"                       istln_so_no,
"
"                       istln_so_seq_no,
"
"                       istln_proj_id,
"
"                       istln_task_id,
"
"                       istln_ord_type,
"
"                       istln_ord_no,
"
"                       istln_ord_pfx,
"
"                       istln_sou_oprn_seq,
"
"                       istln_sou_proc_id,
"
"                       istln_rwk_vou_type,
"
"                       istln_so_schld_desc,
"
"                       istln_ge_doc_no,
"
"                       istln_dc_no,
"
"                                       istln_dc_seq_no,
"
"                                       istln_dc_doc_no,
"
"                       istln_par_prod_id,
"
"                       istln_par_prod_rev,
"
"                     --  istln_rqst_no,
"
"                                      -- istln_rqst_seq_no,
"
"                      --istln_fab_item_type,
"
"                                      istln_thickness,
"
"                                      istln_width,
"
"                                      istln_length,
"
"                                      istln_height,
"
"                                      istln_inner_dia,
"
"                                      istln_outer_dia,
"
"                                      istln_density
"
"                          )
"
"                    VALUES(p_bu,
"
"                           v_mr_doc_no,
"
"                           v_seq_no,
"
"                           cr2.istlnh_mat_type,
"
"                           cr2.istlnh_prod_id,
"
"                           cr2.istlnh_prod_rev,
"
"                           cr2.istlnh_uom,
"
"                           cr2.istlnh_prod_uom,
"
"                           cr2.istlnh_conv_factor,
"
"                           cr2.istlnh_prod_cls,
"
"                           cr2.istlnh_proc_qty,
"
"                       cr2.istlnh_stk_trans_qty,--cr2.istlnh_proc_qty / cr2.istlnh_conv_factor,
"
"                           cr2.istlnh_unit_cost,
"
"                           'N',
"
"                           cr2.istlnh_po_ord_no,
"
"                           cr2.istlnh_sf_code,
"
"                       'MRV #'||v_mr_doc_no||'/'||v_seq_no||'/MIV #'||cr2.istlnh_doc_no||'/'||cr2.istlnh_seq_no,
"
"                           p_user,
"
"                       v_emp_id,
"
"                       v_ip_addr,
"
"                       v_os_user,
"
"                           SYSDATE,
"
"                       cr2.istlnh_store_id,
"
"                       cr1.isthdh_issueto_id,
"
"                       cr2.istlnh_prod_subcls,
"
"                       cr2.istlnh_prod_cls_desc,
"
"                       cr2.istlnh_prod_subcls_desc,
"
"                       cr2.istlnh_prod_grp,
"
"                       cr2.istlnh_prod_grp_desc,
"
"                       cr2.istlnh_prod_subgrp,
"
"                       cr2.istlnh_prod_subgrp_desc,
"
"                       cr2.istlnh_doc_no,
"
"                       cr2.istlnh_seq_no,
"
"                       cr2.istlnh_oprn_ln_seq_no,
"
"                       cr2.istlnh_process_id,
"
"                       cr2.istlnh_vou_type,
"
"                       cr2.istlnh_vou_no,
"
"                       cr2.istlnh_vou_seq_no,
"
"                       cr2.istlnh_type,
"
"                       cr2.istlnh_so_pfx,
"
"                       cr2.istlnh_so_no,
"
"                       cr2.istlnh_so_seq_no,
"
"                       cr2.istlnh_proj_id,
"
"                       cr2.istlnh_task_id,
"
"                       cr2.istlnh_ord_type,
"
"                       cr2.istlnh_ord_no,
"
"                       cr2.istlnh_ord_pfx,
"
"                       cr2.istlnh_sou_oprn_seq,
"
"                       cr2.istlnh_sou_proc_id,
"
"                       cr2.istlnh_rwk_vou_type,
"
"                       cr2.istlnh_so_schld_desc,
"
"                       cr2.istlnh_ge_doc_no,
"
"                       cr2.istlnh_dc_no,
"
"                       cr2.istlnh_dc_seq_no,
"
"                       cr2.istlnh_dc_doc_no,
"
"                       cr2.istlnh_par_prod_id,
"
"                       cr2.istlnh_par_prod_rev,
"
"                      -- cr2.istlnh_rqst_no,
"
"                       --cr2.istlnh_rqst_seq_no,
"
"                      --cr2.istln_fab_item_type,
"
"                      cr2.istlnh_thickness,
"
"                                      cr2.istlnh_width,
"
"                                      cr2.istlnh_length,
"
"                                      cr2.istlnh_height,
"
"                                      cr2.istlnh_inner_dia,
"
"                                      cr2.istlnh_outer_dia,
"
"                                      cr2.istlnh_density
"
"                          );
"
"
"
"    UPDATE inv_stock_trans_ln_hist
"
"       SET istlnh_proc_qty = istlnh_proc_qty - cr2.istlnh_proc_qty,
"
"           istlnh_inproc_qty = istlnh_inproc_qty + cr2.istlnh_proc_qty,
"
"           istlnh_sel_flag = 'N',
"
"           istlnh_sel_user = NULL
"
"     WHERE istlnh_bu = p_bu
"
"       AND istlnh_doc_no = cr2.istlnh_doc_no
"
"       ANd istlnh_seq_no = cr2.istlnh_seq_no;
"
"
"
"        v_so_seq_no := 0;
"
"
"
"    FOR r_so IN (SELECT *
"
"                   FROM inv_stk_trans_mrp_so_alloc
"
"              WHERE istmsa_bu = p_bu
"
"                AND istmsa_doc_no = cr2.istlnh_doc_no
"
"            AND istmsa_seq_no = cr2.istlnh_seq_no)
"
"    LOOP
"
"
"
"      v_so_seq_no := v_so_seq_no + 1;
"
"
"
"      INSERT INTO inv_stk_trans_mrp_so_alloc(istmsa_bu,
"
"                             istmsa_doc_no,
"
"                             istmsa_seq_no,
"
"                             istmsa_sub_seq_no,
"
"                             istmsa_so_prj_ref,
"
"                             istmsa_mrp_alloc_qty,
"
"                             istmsa_cre_by,
"
"                             istmsa_cre_emp_id,
"
"                             istmsa_cre_ip_addr,
"
"                             istmsa_cre_os_user,
"
"                             istmsa_cre_date
"
"                            )
"
"                      VALUES(p_bu,
"
"                             v_mr_doc_no,
"
"                         v_seq_no,
"
"                         v_so_seq_no,
"
"                         r_so.istmsa_so_prj_ref,
"
"                         r_so.istmsa_mrp_alloc_qty,
"
"                         p_user,
"
"                         v_emp_id,
"
"                         v_ip_addr,
"
"                         v_os_user,
"
"                         SYSDATE
"
"                        );
"
"
"
"    END LOOP;
"
"
"
"    v_ls_seq_no := 0;
"
"
"
"    IF cr2.prod_ser_lot_opt = 'S' THEN
"
"
"
"      SELECT *
"
"        BULK COLLECT INTO r_ls_blk
"
"        FROM inv_stock_batch_details_hist
"
"       WHERE isbdh_bu = p_bu
"
"         AND isbdh_issue_doc_no = cr2.istlnh_doc_no
"
"         AND isbdh_seq_no = cr2.istlnh_seq_no
"
"       ORDER BY isbdh_sub_seq_no;
"
"
"
"          FORALL i IN 1..r_ls_blk.COUNT
"
"      INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                                          isbd_issue_doc_no,
"
"                          isbd_seq_no,
"
"                          isbd_sub_seq_no,
"
"                          isbd_sys_ls_no,
"
"                          isbd_lot_no,
"
"                          isbd_serial_no,
"
"                          isbd_source_id,
"
"                          isbd_source_type,
"
"                          isbd_trans_qty,
"
"                          isbd_stk_trans_qty,
"
"                          isbd_expiry_date,
"
"                          isbd_ins_rec,
"
"                          isbd_cre_by,
"
"                          isbd_cre_emp_id,
"
"                          isbd_cre_ip_addr,
"
"                          isbd_cre_os_user,
"
"                          isbd_cre_date,
"
"                          isbd_test_no,
"
"                          isbd_heat_no,
"
"                          isbd_batch_no,
"
"                          isbd_unit_cost
"
"                         )
"
"                                   VALUES(p_bu,
"
"                                  v_mr_doc_no,
"
"                                  v_seq_no,
"
"                          r_ls_blk(i).isbdh_sub_seq_no,
"
"                          r_ls_blk(i).isbdh_sys_ls_no,
"
"                          r_ls_blk(i).isbdh_lot_no,
"
"                          r_ls_blk(i).isbdh_serial_no,
"
"                          r_ls_blk(i).isbdh_source_id,
"
"                          r_ls_blk(i).isbdh_source_type,
"
"                          r_ls_blk(i).isbdh_trans_qty,
"
"                          r_ls_blk(i).isbdh_stk_trans_qty,
"
"                          r_ls_blk(i).isbdh_expiry_date,
"
"                          'N',
"
"                          p_user,
"
"                              v_emp_id,
"
"                              v_ip_addr,
"
"                              v_os_user,
"
"                          SYSDATE,
"
"                          r_ls_blk(i).isbdh_test_no,
"
"                          r_ls_blk(i).isbdh_heat_no,
"
"                          r_ls_blk(i).isbdh_batch_no,
"
"                          r_ls_blk(i).isbdh_unit_cost
"
"                         );
"
"    ELSE
"
"
"
"      v_ls_seq_no := 0;
"
"
"
"      FOR r_ls IN (SELECT *
"
"                     FROM inv_stock_batch_details_hist
"
"                WHERE isbdh_bu = p_bu
"
"              AND isbdh_issue_doc_no = cr2.istlnh_doc_no
"
"              AND isbdh_seq_no = cr2.istlnh_seq_no
"
"                    ORDER BY isbdh_sub_seq_no)
"
"          LOOP
"
"
"
"        v_ls_seq_no := v_ls_seq_no + 1;
"
"
"
"        INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                                            isbd_issue_doc_no,
"
"                            isbd_seq_no,
"
"                            isbd_sub_seq_no,
"
"                            isbd_sys_ls_no,
"
"                            isbd_lot_no,
"
"                            isbd_serial_no,
"
"                            isbd_source_id,
"
"                            isbd_source_type,
"
"                            isbd_trans_qty,
"
"                            isbd_stk_trans_qty,
"
"                            isbd_expiry_date,
"
"                            isbd_ins_rec,
"
"                            isbd_cre_by,
"
"                            isbd_cre_emp_id,
"
"                            isbd_cre_ip_addr,
"
"                            isbd_cre_os_user,
"
"                            isbd_cre_date,
"
"                            isbd_test_no,
"
"                            isbd_heat_no,
"
"                            isbd_batch_no,
"
"                        isbd_unit_cost
"
"                           )
"
"                         VALUES(p_bu,
"
"                                    v_mr_doc_no,
"
"                                    v_seq_no,
"
"                            v_ls_seq_no,
"
"                            r_ls.isbdh_sys_ls_no,
"
"                            r_ls.isbdh_lot_no,
"
"                            r_ls.isbdh_serial_no,
"
"                            r_ls.isbdh_source_id,
"
"                            r_ls.isbdh_source_type,
"
"                            r_ls.isbdh_trans_qty,
"
"                            r_ls.isbdh_stk_trans_qty,
"
"                            r_ls.isbdh_expiry_date,
"
"                            'N',
"
"                            p_user,
"
"                                v_emp_id,
"
"                                v_ip_addr,
"
"                                v_os_user,
"
"                            SYSDATE,
"
"                            r_ls.isbdh_test_no,
"
"                            r_ls.isbdh_heat_no,
"
"                            r_ls.isbdh_batch_no,
"
"                        r_ls.isbdh_unit_cost
"
"                           );
"
"
"
"            SELECT NVL(MAX(istlrd_seq_no),0) INTO v_roll_seq_no
"
"              FROM inv_stock_trans_lot_roll_dtls
"
"             WHERE istlrd_bu = p_bu
"
"               AND istlrd_doc_no = v_mr_doc_no
"
"           AND istlrd_doc_seq_no = v_seq_no
"
"           AND istlrd_lot_seq_no = v_ls_seq_no;
"
"
"
"            FOR r_roll IN (SELECT *
"
"                             FROM inv_stock_trans_lot_roll_dtls
"
"                        WHERE istlrd_bu = p_bu
"
"                              AND istlrd_doc_no = cr2.istlnh_doc_no
"
"                              AND istlrd_doc_seq_no = cr2.istlnh_seq_no
"
"                              AND istlrd_lot_seq_no = r_ls.isbdh_sub_seq_no
"
"                              AND istlrd_sys_ls_no = r_ls.isbdh_sys_ls_no
"
"                ORDER BY istlrd_roll_no)
"
"            LOOP
"
"
"
"          v_roll_seq_no := v_roll_seq_no + 1;
"
"
"
"          INSERT INTO inv_stock_trans_lot_roll_dtls(istlrd_bu,
"
"                                istlrd_doc_no,
"
"                                istlrd_doc_seq_no,
"
"                                istlrd_lot_seq_no,
"
"                                istlrd_seq_no,
"
"                                istlrd_sys_ls_no,
"
"                                istlrd_lot_no,
"
"                                istlrd_roll_no,
"
"                                istlrd_roll_qty,
"
"                                istlrd_cre_by,
"
"                                istlrd_cre_emp_id,
"
"                                istlrd_cre_ip_addr,
"
"                                istlrd_cre_os_user,
"
"                                istlrd_cre_date
"
"                               )
"
"                                             VALUES(p_bu,
"
"                                v_mr_doc_no,
"
"                                v_seq_no,
"
"                                v_ls_seq_no,
"
"                                v_roll_seq_no,
"
"                                r_ls.isbdh_sys_ls_no,
"
"                                r_ls.isbdh_lot_no,
"
"                                r_roll.istlrd_roll_no,
"
"                                r_roll.istlrd_roll_qty,
"
"                                p_user,
"
"                                v_emp_id,
"
"                                v_ip_addr,
"
"                                v_os_user,
"
"                                SYSDATE
"
"                               );
"
"
"
"        END LOOP;
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
"      END LOOP;
"
"
"
"      BEGIN
"
"        SELECT icmctrl_auto_mtr_compl_flag,
"
"           icmctrl_auto_mrv_comp_flag_grn
"
"      INTO v_mrv_post_flag,v_mrv_post_flag_grn
"
"      FROM icm_control
"
"     WHERE icmctrl_bu = p_bu;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20999,'HRM ');
"
"      END;
"
"
"
"
"
"     IF cr1.isthdh_issueto_type = 'E' THEN
"
"
"
"       proc_cre_suplr_whr(p_bu,cr1.isthdh_issueto_plnt,cr1.isthdh_issueto_plnt_loc_id,cr1.isthdh_issueto_id,'L',p_user);
"
"
"
"      BEGIN
"
"        SELECT store_id INTO v_store_id
"
"          FROM stores
"
"             WHERE store_bu = p_bu
"
"               AND store_plnt = cr1.isthdh_issueto_plnt
"
"           AND store_plnt_loc_id = cr1.isthdh_issueto_plnt_loc_id
"
"           AND store_physical = 'L'
"
"           AND store_inv_id = cr1.isthdh_issueto_id;
"
"      END;
"
"
"
"       BEGIN
"
"        SELECT store_bin_flag INTO v_bin_flag
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = v_store_id;
"
"      END;
"
"
"
"    ELSE
"
"
"
"        BEGIN
"
"       SELECT store_bin_flag INTO v_bin_flag
"
"         FROM stores
"
"        WHERE store_bu = p_bu
"
"      AND store_id = cr1.isthdh_issueto_id;
"
"    EXCEPTION WHEN OTHERS THEN
"
"     Raise_Application_Error(-20999,'HRM'||'-'||cr1.isthdh_issueto_id);
"
"      END;
"
"
"
"    END IF;
"
"
"
"
"
"
"
"      IF ((cr1.isthdh_vou_type <> 'GRN' AND v_mrv_post_flag = 'Y') OR (cr1.isthdh_vou_type = 'GRN' AND v_mrv_post_flag_grn = 'Y')) AND v_bin_flag = 'N' THEN
"
"
"
"        DECLARE
"
"          v_jrnl_res    VARCHAR2(1);
"
"        BEGIN
"
"
"
"          IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"            proc_ins_mat_iss_appl_jrnl(p_bu,cr1.isthdh_issueto_plnt,v_mr_doc_no,p_user,1,v_jrnl_res);
"
"
"
"        UPDATE inv_stock_trans_hd
"
"           SET isthd_jrnl_flag = 'Y'
"
"         WHERE isthd_bu = p_bu
"
"           AND isthd_doc_no = v_mr_doc_no;
"
"
"
"          END IF;
"
"
"
"        END;
"
"
"
"        proc_recv_rcpt_frm_mat_rcpt(p_bu,v_mr_doc_no,p_user,p_user_emp);
"
"
"
"      END IF;
"
"
"
"
"
"    END LOOP;
"
"
"
"    IF v_mr_doc_no1 IS NOT NULL THEN
"
"      p_res := func_find_order_no_substr(v_mr_doc_no1);
"
"    END IF;
"
"
"
"    --Raise_Application_Error(-20999,'Bala Testing - End');
"
"  END proc_cre_mrv_frm_miv;
"
"
"
"   PROCEDURE proc_cre_mrv_frm_sa(p_bu        IN    business_units.bu_id%TYPE,
"
"                                 p_date        IN     DATE,
"
"                                 p_user        IN    appl_users.appluser_id%TYPE,
"
"                 p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                                 p_res        OUT    VARCHAR2
"
"                                )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT sathd_plnt,sathd_plnt_loc_id,sathd_store_id
"
"    FROM sa_final_proc_compld_vw
"
"   WHERE sathd_bu = p_bu
"
"     AND satln_sel_flag = 'Y' AND satln_sel_user = p_user
"
"     AND satln_trans_qty > 0
"
"   GROUP BY sathd_plnt,sathd_plnt_loc_id,sathd_store_id
"
"   ORDER BY sathd_plnt,sathd_plnt_loc_id,sathd_store_id;
"
"
"
"  CURSOR c2(c_rcpt_plnt        VARCHAR2,
"
"            c_rcpt_plnt_loc_id    VARCHAR2,
"
"        c_rcpt_store_id    VARCHAR2) IS
"
"  SELECT *
"
"    FROM sa_final_proc_compld_vw
"
"   WHERE sathd_bu = p_bu
"
"     AND satln_sel_flag = 'Y' AND satln_sel_user = p_user
"
"     AND satln_trans_qty > 0
"
"     AND sathd_plnt = c_rcpt_plnt
"
"     AND sathd_plnt_loc_id = c_rcpt_plnt_loc_id
"
"     AND sathd_store_id = c_rcpt_store_id;
"
"
"
"    v_req_id    VARCHAR2(10);
"
"    v_store_id  VARCHAR2(50);
"
"    v_req_name    VARCHAR2(100);
"
"    v_pos_id    VARCHAR2(10);
"
"    v_pos_name    VARCHAR2(100);
"
"    v_dummy    VARCHAR2(100);
"
"
"
"    v_year    NUMBER(6);
"
"    v_period    NUMBER(2);
"
"
"
"    v_mr_doc_no        VARCHAR2(30);
"
"    v_mr_doc_no1    VARCHAR2(100);
"
"
"
"    v_seq_no        NUMBER;
"
"    v_ls_seq_no        NUMBER;
"
"
"
"    v_mrv_post_flag    VARCHAR2(1);
"
"    v_bin_flag        VARCHAR2(1);
"
"
"
"    v_emp_id        VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr        VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user        VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_req_id,v_req_name,v_pos_id,v_pos_name,v_dummy,v_dummy,1);
"
"
"
"    proc_find_year_period(p_bu,p_date,v_year,v_period);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_mr_doc_no := func_find_pfx_nextno(p_bu,p_date,func_find_vou_dflt_pfx(p_bu,cr1.sathd_plnt,cr1.sathd_plnt_loc_id,'MRV','MRV'),p_user);
"
"      v_mr_doc_no1 := v_mr_doc_no1||v_mr_doc_no||' ';
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"                                     isthd_plnt,
"
"                     isthd_plnt_loc_id,
"
"                     isthd_plnt_loc_name,
"
"                                     isthd_doc_no,
"
"                                     isthd_doc_oper,
"
"                                     isthd_issuefm_store_id,
"
"                                     isthd_issueto_type,
"
"                                     isthd_issueto_id,
"
"                     isthd_issueto_plnt,
"
"                     isthd_issueto_plnt_loc_id,
"
"                                     isthd_trans_date,
"
"                                     isthd_year,
"
"                                     isthd_period,
"
"                                     isthd_status,
"
"                                     isthd_reference,
"
"                                     isthd_issuer_id,
"
"                                     isthd_issuer_name,
"
"                                     isthd_issuer_pos_id,
"
"                                     isthd_issuer_pos_name,
"
"                                     isthd_cre_by,
"
"                     isthd_cre_emp_id,
"
"                     isthd_cre_ip_addr,
"
"                     isthd_cre_os_user,
"
"                                     isthd_cre_date,
"
"                     isthd_iss_code,
"
"                     isthd_vou_oper,
"
"                     isthd_doc_pfx
"
"                                    )
"
"                              VALUES(p_bu,
"
"                                     cr1.sathd_plnt,
"
"                     cr1.sathd_plnt_loc_id,
"
"                     (SELECT bupld_loc_name FROM bus_unit_plants_loc_dtls WHERE bupld_bu = p_bu AND bupld_loc_id = cr1.sathd_plnt_loc_id),
"
"                                     v_mr_doc_no,
"
"                                     'R',
"
"                                     NULL,--cr1.isthdh_issueto_id,
"
"                     'S',
"
"                                     cr1.sathd_store_id,--cr1.istlnh_store_id,
"
"                     cr1.sathd_plnt,--cr1.isthdh_plnt,
"
"                     cr1.sathd_plnt_loc_id,--cr1.isthdh_plnt_loc_id,
"
"                                     p_date,
"
"                                     v_year,
"
"                                     v_period,
"
"                                     'N',
"
"                                     'MRV #'||v_mr_doc_no,
"
"                                     v_req_id,
"
"                                     v_req_name,
"
"                                     v_pos_id,
"
"                                     v_pos_name,
"
"                                     p_user,
"
"                     v_emp_id,
"
"                     v_ip_addr,
"
"                     v_os_user,
"
"                                     SYSDATE,
"
"                     NULL,
"
"                     'A',
"
"                     func_find_vou_dflt_pfx(p_bu,cr1.sathd_plnt,cr1.sathd_plnt_loc_id,'MRV','MRV')
"
"                                    );
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.sathd_plnt,cr1.sathd_plnt_loc_id,cr1.sathd_store_id)
"
"      LOOP
"
"
"
"        v_seq_no := v_seq_no + 1;
"
"
"
"    INSERT INTO inv_stock_trans_ln(istln_bu,
"
"                           istln_doc_no,
"
"                           istln_seq_no,
"
"                           istln_mat_type,
"
"                           istln_prod_id,
"
"                           istln_prod_rev,
"
"                           istln_uom,
"
"                           istln_prod_uom,
"
"                           istln_conv_factor,
"
"                           istln_prod_cls,
"
"                           istln_trans_qty,
"
"                       istln_stk_trans_qty,
"
"                           istln_unit_cost,
"
"                           istln_status,
"
"                           istln_po_ord_no,
"
"                           istln_sf_code,
"
"                       istln_reference,
"
"                           istln_cre_by,
"
"                       istln_cre_emp_id,
"
"                       istln_cre_ip_addr,
"
"                       istln_cre_os_user,
"
"                           istln_cre_date,
"
"                       istln_store_id,
"
"                       istln_rcpt_store_id,
"
"                       istln_prod_subcls,
"
"                       istln_prod_cls_desc,
"
"                       istln_prod_subcls_desc,
"
"                       istln_prod_grp,
"
"                       istln_prod_grp_desc,
"
"                       istln_prod_subgrp,
"
"                       istln_prod_subgrp_desc,
"
"                       istln_mi_doc_no,
"
"                       istln_mi_seq_no,
"
"                       istln_oprn_ln_seq_no,
"
"                       istln_process_id,
"
"                       istln_vou_type,
"
"                       istln_vou_no,
"
"                       istln_vou_seq_no,
"
"                       istln_type,
"
"                       istln_so_pfx,
"
"                       istln_so_no,
"
"                       istln_so_seq_no,
"
"                       istln_proj_id,
"
"                       istln_task_id,
"
"                       istln_ord_type,
"
"                       istln_ord_no,
"
"                       istln_ord_pfx,
"
"                       istln_sou_oprn_seq,
"
"                       istln_sou_proc_id,
"
"                       istln_so_schld_desc,
"
"                       istln_dc_no
"
"                                    --   istln_dc_seq_no,
"
"                                 --      istln_dc_doc_no
"
"                     --  istln_rqst_no,
"
"                                      -- istln_rqst_seq_no
"
"                          )
"
"                    VALUES(p_bu,
"
"                           v_mr_doc_no,
"
"                           v_seq_no,
"
"                           cr2.satln_mat_type,
"
"                           cr2.satln_prod_id,
"
"                           cr2.satln_prod_rev,
"
"                           cr2.satln_uom,
"
"                           cr2.satln_prod_uom,
"
"                           cr2.satln_conv_factor,
"
"                           cr2.satln_class_id,
"
"                           cr2.satln_trans_qty,
"
"                       cr2.satln_trans_qty,--cr2.istlnh_proc_qty / cr2.istlnh_conv_factor,
"
"                           cr2.satln_unit_cost,
"
"                           'N',
"
"                           cr2.satln_po_ord_no,
"
"                           cr2.satln_sf_code,
"
"                       'MRV #'||v_mr_doc_no||'/'||v_seq_no||'/Stock Adj. #'||cr2.satln_ord_no||'/'||cr2.satln_seq_no,
"
"                           p_user,
"
"                       v_emp_id,
"
"                       v_ip_addr,
"
"                       v_os_user,
"
"                           SYSDATE,
"
"                       cr2.sathd_store_id,
"
"                       cr2.sathd_store_id,
"
"                       (SELECT prod_sub_cls FROM products WHERE prod_bu = p_bu AND prod_id = cr2.satln_prod_id AND prod_rev = cr2.satln_prod_rev),
"
"                       func_find_class_qry_desc(p_bu,cr2.satln_class_id,1),
"
"                       NULL,
"
"                       (SELECT prod_group_id FROM products WHERE prod_bu = p_bu AND prod_id = cr2.satln_prod_id AND prod_rev = cr2.satln_prod_rev),
"
"                       NULL,
"
"                       (SELECT prod_subgroup_id FROM products WHERE prod_bu = p_bu AND prod_id = cr2.satln_prod_id AND prod_rev = cr2.satln_prod_rev),
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       cr2.satln_oprn_ln_seq_no,
"
"                       cr2.satln_process_id,
"
"                       'SA',
"
"                       cr2.satln_ord_no,
"
"                       cr2.satln_seq_no,
"
"                       cr2.satln_so_type,
"
"                       cr2.satln_so_pfx,
"
"                       cr2.satln_so_no,
"
"                       cr2.satln_so_seq_no,
"
"                       cr2.satln_proj_id,
"
"                       cr2.satln_proj_task_id,
"
"                       cr2.satln_ord_type,
"
"                       cr2.satln_os_ord_no,
"
"                       cr2.satln_os_ord_pfx,
"
"                       cr2.satln_oprn_ln_seq_no,
"
"                       cr2.satln_process_id,
"
"                       cr2.satln_so_schld_desc,
"
"                       cr2.satln_dc_no
"
"                      -- cr2.istlnh_dc_seq_no,
"
"                      -- cr2.istlnh_dc_doc_no
"
"                      -- cr2.istlnh_rqst_no,
"
"                       --cr2.istlnh_rqst_seq_no
"
"                          );
"
"
"
"    UPDATE stock_adj_trans_ln
"
"       SET /*satln_trans_qty = satln_trans_qty - cr2.satln_trans_qty,
"
"           */satln_rcpt_qty = satln_rcpt_qty + cr2.satln_trans_qty,
"
"           satln_sel_flag = 'N',
"
"           satln_sel_user = NULL
"
"     WHERE satln_bu = p_bu
"
"       AND satln_ord_no = cr2.satln_ord_no
"
"       ANd satln_seq_no = cr2.satln_seq_no;
"
"
"
"        v_ls_seq_no := 0;
"
"
"
"    FOR r_ls IN (SELECT *
"
"                   FROM stock_adj_trans_bin
"
"              WHERE satb_bu = p_bu
"
"            AND satb_ord_no = cr2.satln_ord_no
"
"            AND satb_seq_no = cr2.satln_seq_no
"
"                  ORDER BY satb_sub_seq_no)
"
"        LOOP
"
"
"
"      v_ls_seq_no := v_ls_seq_no + 1;
"
"
"
"      INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                                          isbd_issue_doc_no,
"
"                          isbd_seq_no,
"
"                          isbd_sub_seq_no,
"
"                          isbd_sys_ls_no,
"
"                          isbd_lot_no,
"
"                          isbd_serial_no,
"
"                          isbd_source_id,
"
"                          isbd_source_type,
"
"                          isbd_trans_qty,
"
"                          isbd_stk_trans_qty,
"
"                          isbd_expiry_date,
"
"                          isbd_ins_rec,
"
"                          isbd_cre_by,
"
"                          isbd_cre_emp_id,
"
"                          isbd_cre_ip_addr,
"
"                          isbd_cre_os_user,
"
"                          isbd_cre_date,
"
"                          isbd_test_no,
"
"                          isbd_heat_no
"
"                         )
"
"                       VALUES(p_bu,
"
"                                  v_mr_doc_no,
"
"                                  v_seq_no,
"
"                          v_ls_seq_no,
"
"                          r_ls.satb_sys_ls_no,
"
"                          r_ls.satb_lot_no,
"
"                          r_ls.satb_ser_no,
"
"                          r_ls.satb_source_id,
"
"                          r_ls.satb_source_type,
"
"                          r_ls.satb_trans_qty,
"
"                          r_ls.satb_trans_qty,
"
"                          r_ls.satb_expiry_date,
"
"                          'N',
"
"                          p_user,
"
"                              v_emp_id,
"
"                              v_ip_addr,
"
"                              v_os_user,
"
"                          SYSDATE,
"
"                          r_ls.satb_test_no,
"
"                          r_ls.satb_heat_no
"
"                         );
"
"    END LOOP;
"
"
"
"      END LOOP;
"
"
"
"      BEGIN
"
"        SELECT icmctrl_auto_mtr_compl_flag INTO v_mrv_post_flag
"
"      FROM icm_control
"
"     WHERE icmctrl_bu = p_bu;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20999,'HRM ');
"
"      END;
"
"
"
"
"
"
"
"
"
"        BEGIN
"
"       SELECT store_bin_flag INTO v_bin_flag
"
"         FROM stores
"
"        WHERE store_bu = p_bu
"
"      AND store_id = cr1.sathd_store_id;
"
"      END;
"
"
"
"
"
"      IF v_mrv_post_flag = 'Y' AND v_bin_flag = 'N' THEN
"
"
"
"        DECLARE
"
"          v_jrnl_res    VARCHAR2(1);
"
"        BEGIN
"
"
"
"          IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"            proc_ins_mat_iss_appl_jrnl(p_bu,cr1.sathd_plnt,v_mr_doc_no,p_user,1,v_jrnl_res);
"
"
"
"        UPDATE inv_stock_trans_hd
"
"           SET isthd_jrnl_flag = 'Y'
"
"         WHERE isthd_bu = p_bu
"
"           AND isthd_doc_no = v_mr_doc_no;
"
"
"
"          END IF;
"
"
"
"        END;
"
"
"
"        proc_recv_rcpt_frm_mat_rcpt(p_bu,v_mr_doc_no,p_user,p_user_emp);
"
"
"
"      END IF;
"
"
"
"    END LOOP;
"
"
"
"    IF v_mr_doc_no1 IS NOT NULL THEN
"
"      p_res := func_find_order_no_substr(v_mr_doc_no1);
"
"    END IF;
"
"
"
"    --Raise_Application_Error(-20999,'Bala Testing - End');
"
"  END proc_cre_mrv_frm_sa;
"
"
"
"  PROCEDURE proc_cre_mr_frm_mat_trf_dc(p_bu        IN    business_units.bu_id%TYPE,
"
"                       p_date       IN     DATE,
"
"                                       p_user        IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                       p_res        OUT    VARCHAR2
"
"                      )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT dchd_bu,dchd_plnt,
"
"        CASE WHEN dchd_type = 'DI' THEN dcln_dry_trans_store_id ELSE dchd_suplr_id END dchd_suplr_id,
"
"        CASE WHEN dchd_type = 'DI' THEN dcln_store_id ELSE dchd_source_frm END dchd_source_frm,
"
"        dchd_itr_compl_flag,dchd_other_type,
"
"         dchd_plnt_loc_id,dchd_plnt_loc_name,dchd_veh_cap,dchd_ewb_trnsp_id,dchd_veh_no,dchd_driv_name,
"
"     dchd_mobile_no,dchd_veh_cap_tons,dchd_trans_chrg_amt,dchd_trnsp_req_flag,
"
"     dchd_type,dcln_dry_trans_plnt_loc_id,dcln_dry_trans_plnt
"
"    FROM mat_trf_pend_dc_view
"
"   WHERE dchd_rqstby_entity = p_bu
"
"     AND dcln_trf_sel_flag = 'Y'
"
"     AND dcln_trf_sel_user = p_user
"
"     AND dcln_proc_qty > 0
"
"   GROUP BY dchd_bu,dchd_plnt,CASE WHEN dchd_type = 'DI' THEN dcln_dry_trans_store_id ELSE dchd_suplr_id END,
"
"   CASE WHEN dchd_type = 'DI' THEN dcln_store_id ELSE dchd_source_frm END,dchd_itr_compl_flag,dchd_other_type,
"
"            dchd_plnt_loc_id,dchd_plnt_loc_name,dchd_veh_cap,dchd_ewb_trnsp_id,dchd_veh_no,
"
"        dchd_driv_name,dchd_mobile_no,dchd_veh_cap_tons,dchd_trans_chrg_amt,dchd_trnsp_req_flag,
"
"        dchd_type,dcln_dry_trans_store_id,dcln_dry_trans_plnt_loc_id,dcln_dry_trans_plnt
"
"   ORDER BY dchd_plnt;
"
"
"
"  CURSOR c2(c_type         VARCHAR2,
"
"            c_plnt         VARCHAR2,
"
"        c_to_store         VARCHAR2,
"
"        c_frm_store         VARCHAR2,
"
"        c_plnt_loc_id    VARCHAR2,
"
"        c_plnt_loc_name  VARCHAR2) IS
"
"  SELECT *
"
"    FROM mat_trf_pend_dc_view
"
"   WHERE dchd_rqstby_entity = p_bu
"
"     AND dcln_trf_sel_flag = 'Y'
"
"     AND dcln_trf_sel_user = p_user
"
"     AND dcln_proc_qty > 0
"
"     AND dchd_other_type = c_type
"
"     AND dchd_plnt = c_plnt
"
"     AND CASE WHEN dchd_type = 'DI' THEN dcln_dry_trans_store_id ELSE dchd_suplr_id END = c_to_store
"
"     AND ((CASE WHEN dchd_type = 'DI' THEN dcln_store_id ELSE dchd_source_frm END = c_frm_store) OR (dchd_type <> 'DI' AND (dchd_source_frm = c_frm_store OR (dchd_source_frm IS NULL AND c_frm_store IS NULL))))
"
"     AND dchd_plnt_loc_id = c_plnt_loc_id
"
"     AND dchd_plnt_loc_name = c_plnt_loc_name
"
"    -- AND (dchd_trans_id = c_trans_id OR (dchd_trans_id IS NULL AND c_trans_id IS NULL))
"
"     --AND dchd_veh_cap = c_veh_cap
"
"   ORDER BY ROWID;
"
"
"
"  CURSOR c_ls(c_bu        VARCHAR2,
"
"              c_plnt        VARCHAR2,
"
"              c_doc_no        VARCHAR2,
"
"          c_doc_seq_no    NUMBER) IS
"
"  SELECT *
"
"    FROM dc_lot_serial_dtls
"
"   WHERE dclsd_bu = c_bu
"
"     AND dclsd_plnt = c_plnt
"
"     AND dclsd_doc_no = c_doc_no
"
"     AND dclsd_seq_no = c_doc_seq_no
"
"     AND dclsd_trf_sel_flag = 'Y'
"
"     AND dclsd_trf_sel_user = p_user
"
"     AND dclsd_proc_qty > 0
"
"     AND dclsd_qty - (dclsd_compld_qty + dclsd_inproc_qty) > 0
"
"   ORDER BY dclsd_sub_seq_no;
"
"
"
"CURSOR c_prod(c_plnt        VARCHAR2,
"
"              c_prod_id        VARCHAR2,
"
"              c_prod_rev    NUMBER)
"
"IS
"
"SELECT prod_uom,
"
"       prod_hsn_code,
"
"       prodplnt_cls prod_cls,
"
"       (SELECT class_desc1
"
"          FROM classes
"
"         WHERE class_bu = prod_bu
"
"           AND class_id = prodplnt_cls)prod_cls_desc,
"
"       prodplnt_sub_cls prod_sub_cls,
"
"       (SELECT subcls_desc1
"
"          FROM sub_classes
"
"         WHERE subcls_bu = prod_bu
"
"           AND subcls_id = prodplnt_sub_cls)prod_subcls_desc,
"
"       prod_group_id,
"
"       (SELECT pgrp_group_desc1
"
"          FROM prod_group
"
"         WHERE pgrp_bu = prod_bu
"
"           AND pgrp_group_id = prod_group_id) prod_grp_desc,
"
"        prod_subgroup_id,
"
"       (SELECT psgrp_subgroup_desc1
"
"          FROM prod_sub_group
"
"         WHERE psgrp_bu = prod_bu
"
"           AND psgrp_subgroup_id = prod_subgroup_id) prod_subgrp_desc,
"
"       (SELECT class_type
"
"          FROM classes
"
"         WHERE class_bu = prod_bu
"
"           AND class_id = prodplnt_cls)prod_cls_type
"
"  FROM prod_plants,products
"
" WHERE prodplnt_bu = prod_bu
"
"   AND prodplnt_prod_id = prod_id
"
"   AND prodplnt_prod_rev = prod_rev
"
"   AND prodplnt_bu = p_bu
"
"   AND prodplnt_plnt = c_plnt
"
"   AND prodplnt_prod_id = c_prod_id
"
"   AND prodplnt_prod_rev = c_prod_rev;
"
"
"
"r_prod        c_prod%ROWTYPE;
"
"
"
"  v_req_id    VARCHAR2(10);
"
"  v_req_name    VARCHAR2(100);
"
"  v_pos_id    VARCHAR2(10);
"
"  v_pos_name    VARCHAR2(100);
"
"  v_dummy    VARCHAR2(100);
"
"
"
"  v_year    NUMBER(6);
"
"  v_period    NUMBER(2);
"
"
"
"  v_doc_no    VARCHAR2(15);
"
"  v_doc_no1    VARCHAR2(500);
"
"  v_seq_no    NUMBER(5);
"
"  v_ls_seq_no    NUMBER(5);
"
"  v_lc_seq_no    NUMBER(5);
"
"  v_auto_mtr_compl_flag    VARCHAR2(1);
"
"  v_inv_method  VARCHAR2(1);
"
"  v_jrnl_res    VARCHAR2(1);
"
"  v_jrnl_wh_req_flag    VARCHAR2(1);
"
"
"
"  v_issueto_plnt    VARCHAR2(10);
"
"  v_issueto_plnt_loc_id    VARCHAR2(10);
"
"
"
"  v_mi_lc_res        VARCHAR2(1);
"
"  v_trnf_bin_res    VARCHAR2(1);
"
"  v_dc_bin_cnt        NUMBER(5);
"
"
"
"  v_emp_id        VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr        VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"  v_os_user        VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"    proc_get_emp_det(p_bu,
"
"                     p_user,
"
"                     v_req_id,
"
"                     v_req_name,
"
"                     v_pos_id,
"
"                     v_pos_name,
"
"                     v_dummy,
"
"                     v_dummy,
"
"                     1
"
"                    );
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      proc_find_year_period(p_bu,p_date,v_year,v_period);
"
"
"
"     -- v_doc_no := func_find_icm_next_id(p_bu,p_date,'MRV',cr1.dchd_suplr_id,p_user);
"
"
"
"     v_doc_no := func_find_pfx_nextno(p_bu,
"
"                                          p_date,
"
"                      func_find_vou_dflt_pfx(p_bu,
"
"                                          cr1.dchd_plnt,
"
"                                          cr1.dchd_plnt_loc_id,
"
"                                          'MRV',
"
"                                          'MRV' ),
"
"                    p_user);
"
"
"
"
"
"      v_doc_no1 := v_doc_no1||v_doc_no||' ';
"
"
"
"      IF cr1.dchd_type <> 'DI' THEN
"
"      BEGIN
"
"      SELECT store_plnt,store_plnt_loc_id
"
"        INTO v_issueto_plnt,v_issueto_plnt_loc_id
"
"        FROM stores
"
"       WHERE store_bu = p_bu
"
"         AND store_id = cr1.dchd_suplr_id;
"
"      EXCEPTION WHEN OTHERS THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||cr1.dchd_suplr_id);
"
"      END;
"
"      ELSE
"
"        v_issueto_plnt := cr1.dcln_dry_trans_plnt;
"
"        v_issueto_plnt_loc_id := cr1.dcln_dry_trans_plnt_loc_id;
"
"      END IF;
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"                                     isthd_plnt,
"
"                                     isthd_ref_unit,
"
"                                     isthd_doc_no,
"
"                                     isthd_doc_oper,
"
"                                     isthd_issuefm_store_id,
"
"                                     isthd_issueto_type,
"
"                                     isthd_issueto_id,
"
"                                     isthd_trans_date,
"
"                                     isthd_year,
"
"                                     isthd_period,
"
"                                     isthd_status,
"
"                                     isthd_reference,
"
"                                     isthd_issuer_id,
"
"                                     isthd_issuer_name,
"
"                                     isthd_issuer_pos_id,
"
"                                     isthd_issuer_pos_name,
"
"                                     isthd_cre_by,
"
"                                     isthd_cre_date,
"
"                     isthd_itr_compl_flag,
"
"                     isthd_rqstby_entity,
"
"                     isthd_plnt_loc_id,
"
"                     isthd_plnt_loc_name,
"
"                     isthd_issueto_plnt,
"
"                     isthd_issueto_plnt_loc_id,
"
"                     isthd_veh_cap,
"
"                     isthd_trans_id,
"
"                     isthd_veh_no,
"
"                     isthd_driv_name,
"
"                                     isthd_driv_mobile,
"
"                     isthd_veh_cap_tons,
"
"                     isthd_trnsp_req_flag
"
"                                    )
"
"                              VALUES(p_bu,
"
"                                     v_issueto_plnt,--cr1.dchd_ref_unit,
"
"                                     v_issueto_plnt,--cr1.dchd_plnt,
"
"                                     v_doc_no,
"
"                                     'R',
"
"                                     cr1.dchd_source_frm,
"
"                                     CASE WHEN cr1.dchd_type IN ('DI') THEN 'I' ELSE CASE WHEN cr1.dchd_other_type = 'W' THEN 'S' ELSE cr1.dchd_other_type END END,
"
"                                     cr1.dchd_suplr_id,
"
"                                     p_date,
"
"                                     v_year,
"
"                                     v_period,
"
"                                     'N',
"
"                                     'Material Receipt',
"
"                                     v_req_id,
"
"                                     v_req_name,
"
"                                     v_pos_id,
"
"                                     v_pos_name,
"
"                                     p_user,
"
"                                     SYSDATE,
"
"                     cr1.dchd_itr_compl_flag,
"
"                     cr1.dchd_bu,
"
"                     v_issueto_plnt_loc_id,--cr1.dchd_plnt_loc_id,
"
"                     (SELECT bupld_loc_name
"
"                        FROM bus_unit_plants_loc_dtls
"
"                    WHERE bupld_bu = p_bu
"
"                      AND bupld_loc_id = v_issueto_plnt_loc_id),--cr1.dchd_plnt_loc_name,
"
"                     v_issueto_plnt,v_issueto_plnt_loc_id,
"
"                     cr1.dchd_veh_cap,
"
"                     cr1.dchd_ewb_trnsp_id,
"
"                     cr1.dchd_veh_no,
"
"                     cr1.dchd_driv_name,
"
"                     cr1.dchd_mobile_no,
"
"                     cr1.dchd_veh_cap_tons,
"
"                     cr1.dchd_trnsp_req_flag
"
"                                    );
"
"
"
"      FOR cr2 IN c2(cr1.dchd_other_type,cr1.dchd_plnt,cr1.dchd_suplr_id,cr1.dchd_source_frm,cr1.dchd_plnt_loc_id,cr1.dchd_plnt_loc_name)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(istln_seq_no),0)+1
"
"          INTO v_seq_no
"
"          FROM inv_stock_trans_ln
"
"         WHERE istln_bu = p_bu
"
"           AND istln_doc_no = v_doc_no;
"
"
"
"    OPEN c_prod(cr1.dchd_plnt,cr2.dcln_prod_id,cr2.dcln_prod_rev);
"
"        FETCH c_prod  INTO r_prod;
"
"    CLOSE c_prod;
"
"
"
"    INSERT INTO inv_stock_trans_ln(istln_bu,
"
"                           istln_doc_no,
"
"                           istln_seq_no,
"
"                           istln_mat_type,
"
"                           istln_prod_id,
"
"                           istln_prod_rev,
"
"                           istln_uom,
"
"                           istln_prod_uom,
"
"                           istln_conv_factor,
"
"                           istln_prod_cls,
"
"                           istln_rqst_qty,
"
"                           istln_trans_qty,
"
"                       istln_stk_trans_qty,
"
"                           istln_excs_qty,
"
"                           istln_accepted_qty,
"
"                           istln_trnf_acpt_qty,
"
"                           istln_unit_cost,
"
"                           istln_status,
"
"                           istln_po_ord_no,
"
"                           istln_sf_code,
"
"                       istln_dc_doc_no,
"
"                       istln_dc_no,
"
"                       istln_dc_seq_no,
"
"                       istln_reference,
"
"                           istln_cre_by,
"
"                           istln_cre_date,
"
"                       istln_store_id,
"
"                       istln_rcpt_store_id,
"
"                       istln_prod_subcls,
"
"                       istln_prod_cls_desc,
"
"                       istln_prod_subcls_desc,
"
"                       istln_prod_grp,
"
"                       istln_prod_grp_desc,
"
"                       istln_prod_subgrp,
"
"                       istln_prod_subgrp_desc,
"
"                       istln_mi_doc_no,
"
"                       istln_mi_seq_no,
"
"                       istln_oprn_ln_seq_no,
"
"                       istln_process_id,
"
"                       istln_mostr_qty,
"
"                       istln_short_qty,
"
"                       istln_remarks,
"
"                       istln_gr_wght,
"
"                       istln_tr_wght,
"
"                       istln_nt_wght,
"
"                       istln_tot_bags
"
"                          )
"
"                    VALUES(p_bu,
"
"                           v_doc_no,
"
"                           v_seq_no,
"
"                           CASE WHEN cr2.dcln_sf_code IS NULL THEN 'S' ELSE 'F' END,
"
"                           cr2.dcln_prod_id,
"
"                           cr2.dcln_prod_rev,
"
"                           cr2.dcln_uom,
"
"                           cr2.dcln_uom,
"
"                           1,
"
"                           func_find_product_class(p_bu,v_issueto_plnt,cr2.dcln_prod_id,cr2.dcln_prod_rev),
"
"                           cr2.dcln_proc_qty,
"
"                           cr2.dcln_proc_qty,
"
"                       CASE WHEN cr1.dchd_type = 'DI' THEN cr2.dcln_dry_stk_qty ELSE cr2.dcln_proc_qty END,
"
"                           0,
"
"                           cr2.dcln_proc_qty,
"
"                           cr2.dcln_proc_qty,
"
"                           cr2.dcln_sc_unit_cost,
"
"                           'N',
"
"                           cr2.dcln_prod_ord_no,
"
"                           cr2.dcln_sf_code,
"
"                       cr2.dchd_doc_no,
"
"                       cr2.dchd_dc_no,
"
"                       cr2.dcln_seq_no,
"
"                       'Material Receipt '||cr2.dcln_mi_doc_no||'/'||cr2.dcln_mi_seq_no,
"
"                           p_user,
"
"                           SYSDATE,
"
"                       cr2.dcln_store_id,
"
"                       cr1.dchd_suplr_id,
"
"                       r_prod.prod_sub_cls,
"
"                       r_prod.prod_cls_desc,
"
"                       r_prod.prod_subcls_desc,
"
"                       r_prod.prod_group_id,
"
"                       r_prod.prod_grp_desc,
"
"                       r_prod.prod_subgroup_id,
"
"                       r_prod.prod_subgrp_desc,
"
"                       cr2.dcln_mi_doc_no,
"
"                       cr2.dcln_mi_seq_no,
"
"                       cr2.dcln_oprn_ln_seq_no,
"
"                       cr2.dcln_process_id,
"
"                       cr2.dcln_mostr_qty,
"
"                       cr2.dcln_short_qty,
"
"                       cr2.dcln_remarks,
"
"                       cr2.dcln_gr_wght,
"
"                       cr2.dcln_tr_wght,
"
"                       cr2.dcln_nt_wght,
"
"                       cr2.dcln_tot_bags
"
"                          );
"
"
"
"        UPDATE dc_ln
"
"       SET dcln_cons_inproc_qty = dcln_cons_inproc_qty + cr2.dcln_proc_qty,
"
"           dcln_proc_qty = dcln_proc_qty - cr2.dcln_proc_qty,
"
"           dcln_trf_sel_flag = 'N',
"
"           dcln_trf_sel_user = NULL
"
"         WHERE dcln_bu = cr1.dchd_bu
"
"       AND dcln_plnt = cr2.dchd_plnt
"
"       AND dcln_doc_no = cr2.dchd_doc_no
"
"       AND dcln_seq_no = cr2.dcln_seq_no
"
"       AND dcln_prod_id = cr2.dcln_prod_id
"
"       AND dcln_prod_rev = cr2.dcln_prod_rev;
"
"
"
"        FOR r_ls IN c_ls(cr2.dchd_bu,cr2.dchd_plnt,cr2.dchd_doc_no,cr2.dcln_seq_no)
"
"    LOOP
"
"
"
"      SELECT NVL(MAX(isbd_sub_seq_no),0)+1
"
"        INTO v_ls_seq_no
"
"        FROM inv_stock_batch_details
"
"       WHERE isbd_bu = p_bu
"
"         AND isbd_issue_doc_no = v_doc_no
"
"         AND isbd_seq_no = v_seq_no;
"
"
"
"      INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                                          isbd_issue_doc_no,
"
"                          isbd_seq_no,
"
"                          isbd_sub_seq_no,
"
"                          isbd_sys_ls_no,
"
"                          isbd_lot_no,
"
"                          isbd_serial_no,
"
"                          isbd_source_id,
"
"                          isbd_source_type,
"
"                          isbd_trans_qty,
"
"                          isbd_stk_trans_qty,
"
"                          isbd_expiry_date,
"
"                          isbd_ins_rec,
"
"                          isbd_cre_by,
"
"                          isbd_cre_date,
"
"                          isbd_mostr_qty,
"
"                              isbd_short_qty
"
"                         )
"
"                       VALUES(p_bu,
"
"                                  v_doc_no,
"
"                                  v_seq_no,
"
"                          v_ls_seq_no,
"
"                          r_ls.dclsd_sys_ls_no,
"
"                          r_ls.dclsd_lot_no,
"
"                          r_ls.dclsd_serial_no,
"
"                          r_ls.dclsd_source_id,
"
"                          r_ls.dclsd_source_type,
"
"                          CASE WHEN cr1.dchd_type = 'DI' THEN r_ls.dclsd_qty ELSE r_ls.dclsd_proc_qty END,
"
"                          CASE WHEN cr1.dchd_type = 'DI' THEN r_ls.dclsd_qty ELSE r_ls.dclsd_proc_qty END,
"
"                          r_ls.dclsd_expiry_date,
"
"                          'N',
"
"                          p_user,
"
"                          SYSDATE,
"
"                          r_ls.dclsd_mostr_qty,
"
"                              r_ls.dclsd_short_qty
"
"                         );
"
"
"
"    UPDATE dc_lot_serial_dtls
"
"       SET dclsd_proc_qty = CASE WHEN (dclsd_proc_qty - (CASE WHEN cr1.dchd_type = 'DI' THEN r_ls.dclsd_qty ELSE r_ls.dclsd_proc_qty END)) < 0 THEN 0 ELSE (dclsd_proc_qty - CASE WHEN cr1.dchd_type = 'DI' THEN r_ls.dclsd_qty ELSE r_ls.dclsd_proc_qty END) END,
"
"           dclsd_inproc_qty = dclsd_inproc_qty + (CASE WHEN cr1.dchd_type = 'DI' THEN r_ls.dclsd_qty ELSE r_ls.dclsd_proc_qty END)
"
"         WHERE dclsd_bu = cr1.dchd_bu
"
"       AND dclsd_plnt = cr2.dchd_plnt
"
"       AND dclsd_doc_no = cr2.dchd_doc_no
"
"       AND dclsd_seq_no = cr2.dcln_seq_no
"
"       AND dclsd_sub_seq_no = r_ls.dclsd_sub_seq_no;
"
"
"
"    END LOOP c_ls;
"
"
"
"    FOR r_loc IN (SELECT *
"
"                    FROM dc_mat_rcpt_bin_dtls
"
"               WHERE dmrbd_bu = cr2.dchd_bu
"
"                         AND dmrbd_plnt = cr2.dchd_plnt
"
"                         AND dmrbd_doc_no = cr2.dchd_doc_no
"
"                         AND dmrbd_seq_no = cr2.dcln_seq_no)
"
"        LOOP
"
"
"
"      INSERT INTO inv_mat_transfer_bin(imtb_bu,
"
"                       imtb_doc_no,
"
"                       imtb_seq_no,
"
"                       imtb_store_id,
"
"                       imtb_prod_id,
"
"                       imtb_prod_rev,
"
"                       imtb_lot_no,
"
"                       imtb_ser_no,
"
"                       imtb_bin_id,
"
"                       imtb_trans_qty,
"
"                       imtb_source_id,
"
"                       imtb_source_type,
"
"                       imtb_sys_ls_no,
"
"                       imtb_hist_flag,
"
"                       imtb_trnf_acpt_qty,
"
"                       imtb_cre_by,
"
"                       imtb_cre_emp_id,
"
"                       imtb_cre_ip_addr,
"
"                       imtb_cre_os_user,
"
"                       imtb_cre_date,
"
"                       imtb_stk_trans_qty
"
"                      )
"
"                        VALUES(p_bu,
"
"                       v_doc_no,
"
"                       v_seq_no,
"
"                       r_loc.dmrbd_store_id,
"
"                       r_loc.dmrbd_prod_id,
"
"                       r_loc.dmrbd_prod_rev,
"
"                       r_loc.dmrbd_lot_no,
"
"                       r_loc.dmrbd_ser_no,
"
"                       r_loc.dmrbd_bin_id,
"
"                       r_loc.dmrbd_trans_qty,
"
"                       r_loc.dmrbd_source_id,
"
"                       r_loc.dmrbd_source_type,
"
"                       r_loc.dmrbd_sys_ls_no,
"
"                       'N',
"
"                       r_loc.dmrbd_trans_qty,
"
"                       p_user,
"
"                       v_emp_id,
"
"                       v_ip_addr,
"
"                       v_os_user,
"
"                       SYSDATE,
"
"                       r_loc.dmrbd_trans_qty
"
"                      );
"
"          END LOOP;
"
"
"
"      END LOOP c2;
"
"
"
"      BEGIN
"
"        SELECT icmctrl_auto_mtr_compl_flag
"
"          INTO v_auto_mtr_compl_flag
"
"          FROM icm_control
"
"         WHERE icmctrl_bu = p_bu;
"
"      END;
"
"
"
"      IF (v_auto_mtr_compl_flag = 'Y' AND cr1.dchd_itr_compl_flag = 'Y') OR p_bu = 'POP' THEN
"
"
"
"    /*IF cr1.dchd_trans_chrg_amt > 0 THEN
"
"
"
"      FOR r_lc IN (SELECT fott_suplr_id,fott_prod_id,fott_prod_rev,suplr_currency,prod_hsn_code
"
"                     FROM farm_one_time_transporter,suppliers,products
"
"            WHERE suplr_bu = fott_bu
"
"              AND suplr_suplr_id = fott_suplr_id
"
"              AND prod_bu = fott_bu
"
"              AND prod_id = fott_prod_id
"
"              AND prod_rev = fott_prod_rev
"
"              AND fott_bu = p_bu
"
"              AND fott_plnt = cr1.dchd_plnt
"
"              AND fott_suplr_id = cr1.dchd_ewb_trnsp_id)
"
"      LOOP
"
"        INSERT INTO pur_rcpt_land_costs(prlc_bu,
"
"                                            prlc_rcpt_no,
"
"                                            prlc_seq_no,
"
"                            prlc_sub_seq_no,
"
"                                            prlc_tc_id,
"
"                                            prlc_assbl_val,
"
"                                            prlc_tc_pct,
"
"                                            prlc_tc_amt,
"
"                                            prlc_suplr_id,
"
"                                            prlc_chrg_flag,
"
"                                            prlc_pts_flag,
"
"                                            prlc_type,
"
"                                            prlc_hsn_code,
"
"                                            prlc_tc_type,
"
"                                            prlc_tc_rev,
"
"                                            prlc_rec_source,
"
"                                            prlc_doc_type,
"
"                                            prlc_lc_import_flag,
"
"                                            prlc_currency,
"
"                                            prlc_exchange_rate,
"
"                                            prlc_tax_type,
"
"                                            prlc_cre_by,
"
"                                            prlc_cre_ip_addr,
"
"                                            prlc_cre_os_user,
"
"                                            prlc_cre_date,
"
"                                            prlc_cre_emp_id
"
"                           )
"
"                         VALUES(p_bu,
"
"                                            v_doc_no,
"
"                                            1,
"
"                            0,
"
"                                            r_lc.fott_prod_id,
"
"                                            cr1.dchd_trans_chrg_amt,
"
"                                            0,
"
"                                            cr1.dchd_trans_chrg_amt,
"
"                                            r_lc.fott_suplr_id,
"
"                                            'N',
"
"                                            'Y',
"
"                                            'S',
"
"                                            r_lc.prod_hsn_code,
"
"                                            'C',
"
"                                            r_lc.fott_prod_rev,
"
"                                            'S',
"
"                                            'MIV',
"
"                                            'Y',
"
"                                            r_lc.suplr_currency,
"
"                                            1,
"
"                                            'Z',
"
"                                            p_user,
"
"                                            v_ip_addr,
"
"                                            v_os_user,
"
"                                            SYSDATE,
"
"                                            v_emp_id
"
"                           );
"
"      END LOOP;
"
"    END IF;*/
"
"
"
"    --proc_load_trnsp_frm_mi(p_bu,v_doc_no,p_user,v_mi_lc_res); BY Mohamed Yasir.N
"
"
"
"        SELECT store_perp_jrnl_req_flag
"
"            INTO v_jrnl_wh_req_flag
"
"            FROM stores
"
"           WHERE store_bu = p_bu
"
"       AND store_id = cr1.dchd_suplr_id;
"
"
"
"        IF (func_find_inv_method(p_bu) IN ('T') OR
"
"       (func_find_inv_method(p_bu) = 'D' AND v_jrnl_wh_req_flag = 'Y')) THEN
"
"
"
"          proc_ins_mat_iss_appl_jrnl(p_bu,
"
"                                     v_issueto_plnt,--cr1.dchd_ref_unit,
"
"                                     v_doc_no,
"
"                                     p_user,
"
"                                     1,
"
"                                     v_jrnl_res
"
"                                     );
"
"          IF v_jrnl_res = 'N' THEN
"
"        Raise_Application_Error(-20999,'HRM');
"
"      ELSE
"
"        UPDATE inv_stock_trans_hd
"
"               SET isthd_jrnl_flag = 'Y'
"
"             WHERE isthd_bu = p_bu
"
"           AND isthd_plnt = v_issueto_plnt--cr1.dchd_ref_unit
"
"               AND isthd_doc_no = v_doc_no;
"
"          END IF;
"
"        END IF;
"
"
"
"    --pkg_mat_rcpt.proc_alloc_bin_frm_mat_rcpt(p_bu,v_doc_no,p_user,v_trnf_bin_res);
"
"
"
"        proc_recv_rcpt_frm_mat_rcpt(p_bu,v_doc_no,p_user,p_user_emp);
"
"
"
"        IF (func_find_inv_method(p_bu) IN ('T') OR
"
"       (func_find_inv_method(p_bu) = 'D' AND v_jrnl_wh_req_flag = 'Y')) THEN
"
"
"
"          proc_ins_gl_jrnl(p_bu,
"
"                   v_issueto_plnt,--cr1.dchd_ref_unit,
"
"                   p_date,
"
"                   func_find_year(p_bu,p_date),
"
"                   func_find_period(p_bu,p_date),
"
"                   NULL,
"
"                   v_doc_no,
"
"                   NULL,
"
"                   'ICM',
"
"                   p_user,
"
"                   1,
"
"                   'MATERIAL TRANSFER FROM ' ||cr1.dchd_plnt ||' TO ' || v_issueto_plnt--cr1.dchd_ref_unit
"
"                   );
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"    END LOOP c1;
"
"
"
"    IF v_doc_no1 IS NOT NULL THEN
"
"      p_res := func_find_order_no_substr(v_doc_no1);
"
"    END IF;
"
"
"
"  END proc_cre_mr_frm_mat_trf_dc;
"
"
"
"  PROCEDURE proc_cre_mr_frm_mat_trf_ge(p_bu    IN    business_units.bu_id%TYPE,
"
"                       p_date   IN     DATE,
"
"                                       p_user    IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE,
"
"                       p_res    OUT    VARCHAR2
"
"                      )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT gehd_plnt,gehd_ref_unit,NVL(gehd_fr_store_id,gedl_store_id) gedl_store_id,geln_suplr_id,gehd_plnt_loc_id,gehd_plnt_loc_name
"
"    FROM mat_trf_pend_ge_view
"
"   WHERE gehd_bu = p_bu
"
"     AND gedl_trf_sel_flag = 'Y'
"
"     AND gedl_trf_sel_user = p_user
"
"     AND gedl_qty > 0
"
"   GROUP BY gehd_plnt,gehd_ref_unit,NVL(gehd_fr_store_id,gedl_store_id),geln_suplr_id,gehd_plnt_loc_id,gehd_plnt_loc_name
"
"   ORDER BY gehd_plnt;
"
"
"
"  CURSOR c2(c_plnt    VARCHAR2,
"
"            c_ref_plnt    VARCHAR2,
"
"        c_to_store    VARCHAR2,
"
"        c_frm_store    VARCHAR2,
"
"        c_plnt_loc_id VARCHAR2,
"
"        c_plnt_loc_name VARCHAR2) IS
"
"  SELECT *
"
"    FROM mat_trf_pend_ge_view
"
"   WHERE gehd_bu = p_bu
"
"     AND gedl_trf_sel_flag = 'Y'
"
"     AND gedl_trf_sel_user = p_user
"
"     AND gedl_qty > 0
"
"     AND gehd_plnt = c_plnt
"
"     AND gehd_ref_unit = c_ref_plnt
"
"     AND NVL(gehd_fr_store_id,gedl_store_id) = c_to_store
"
"     AND geln_suplr_id = c_frm_store
"
"     AND gehd_plnt_loc_id = c_plnt_loc_id
"
"     AND gehd_plnt_loc_name = c_plnt_loc_name;
"
"
"
"  CURSOR c_ls(c_plnt        VARCHAR2,
"
"              c_doc_no        VARCHAR2,
"
"          c_seq_no        NUMBER,
"
"          c_sub_seq_no    NUMBER) IS
"
"  SELECT *
"
"    FROM gate_enrty_lot_ser_dtls
"
"   WHERE gelsd_bu = p_bu
"
"     AND gelsd_plnt = c_plnt
"
"     AND gelsd_doc_no = c_doc_no
"
"     AND gelsd_ln_seq_no = c_seq_no
"
"     AND gelsd_dtl_seq_no = c_sub_seq_no
"
"   ORDER BY gelsd_seq_no;
"
"
"
"  CURSOR c_dc(c_dc_no        VARCHAR2,
"
"              c_dc_doc_no    VARCHAR2,
"
"          c_dc_seq_no    NUMBER) IS
"
"  SELECT *
"
"    FROM dc_hd,dc_ln
"
"   WHERE dchd_bu = dcln_bu
"
"     AND dchd_plnt = dcln_plnt
"
"     AND dchd_doc_no = dcln_doc_no
"
"     AND dchd_bu = p_bu
"
"     AND dchd_dc_no = c_dc_no
"
"     AND dchd_doc_no = c_dc_doc_no
"
"     AND dcln_seq_no = c_dc_seq_no;
"
"
"
"  r_dc        c_dc%ROWTYPE;
"
"
"
"  v_req_id    VARCHAR2(10);
"
"  v_req_name    VARCHAR2(100);
"
"  v_pos_id    VARCHAR2(10);
"
"  v_pos_name    VARCHAR2(100);
"
"  v_dummy    VARCHAR2(100);
"
"
"
"  v_year    NUMBER(6);
"
"  v_period    NUMBER(2);
"
"
"
"  v_doc_no    VARCHAR2(15);
"
"  v_doc_no1    VARCHAR2(500);
"
"  v_seq_no    NUMBER(5);
"
"  v_ls_seq_no    NUMBER;
"
"
"
"  v_auto_mtr_compl_flag    VARCHAR2(1);
"
"  v_inv_method  VARCHAR2(1);
"
"  v_jrnl_res    VARCHAR2(1);
"
"  v_doc_plnt    VARCHAR2(10);
"
"
"
"  v_so_pfx            VARCHAR2(5);
"
"  v_so_no             VARCHAR2(15);
"
"  v_so_seq_no         NUMBER(5);
"
"  v_so_sub_seq_no    NUMBER(5);
"
"  v_so_schd_desc    VARCHAR2(200);
"
"  v_so_type                VARCHAr2(2);
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,
"
"                     p_user,
"
"                     v_req_id,
"
"                     v_req_name,
"
"                     v_pos_id,
"
"                     v_pos_name,
"
"                     v_dummy,
"
"                     v_dummy,
"
"                     1
"
"                    );
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      proc_find_year_period(p_bu,p_date,v_year,v_period);
"
"
"
"      --IF func_find_mr_pfx_source(p_bu) = 'W' THEN
"
"        --v_doc_no := func_find_icm_next_id(p_bu,p_date,'MRV',cr1.gedl_store_id,p_user);
"
"
"
"    v_doc_no := func_find_pfx_nextno(p_bu,
"
"                                          p_date,
"
"                      func_find_vou_dflt_pfx(p_bu,
"
"                                          cr1.gehd_plnt,
"
"                                          cr1.gehd_plnt_loc_id,
"
"                                          'MRV',
"
"                                          'MRV' ),
"
"                    p_user);
"
"
"
"      --ELSE
"
"      --v_doc_no := func_find_mat_rcpt_pfx_no(p_bu,cr1.geln_suplr_id,cr1.gedl_store_id,p_date,p_user);
"
"      --END IF;
"
"
"
"      v_doc_no1 := v_doc_no1||v_doc_no||' ';
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"                                     isthd_plnt,
"
"                                     isthd_ref_unit,
"
"                                     isthd_doc_no,
"
"                                     isthd_doc_oper,
"
"                                     isthd_issuefm_store_id,
"
"                                     isthd_issueto_type,
"
"                                     isthd_issueto_id,
"
"                                     isthd_trans_date,
"
"                                     isthd_year,
"
"                                     isthd_period,
"
"                                     isthd_status,
"
"                                     isthd_reference,
"
"                                     isthd_issuer_id,
"
"                                     isthd_issuer_name,
"
"                                     isthd_issuer_pos_id,
"
"                                     isthd_issuer_pos_name,
"
"                                     isthd_cre_by,
"
"                                     isthd_cre_date,
"
"                     isthd_plnt_loc_id,
"
"                     isthd_plnt_loc_name
"
"                                    )
"
"                              VALUES(p_bu,
"
"                                     cr1.gehd_plnt,
"
"                                     cr1.gehd_ref_unit,
"
"                                     v_doc_no,
"
"                                     'R',
"
"                                     cr1.geln_suplr_id,
"
"                                     CASE WHEN cr1.gehd_plnt = cr1.gehd_ref_unit THEN 'S' ELSE 'I' END,
"
"                                     cr1.gedl_store_id,
"
"                                     p_date,
"
"                                     v_year,
"
"                                     v_period,
"
"                                     'N',
"
"                                     'Material Receipt',
"
"                                     v_req_id,
"
"                                     v_req_name,
"
"                                     v_pos_id,
"
"                                     v_pos_name,
"
"                                     p_user,
"
"                                     SYSDATE,
"
"                     cr1.gehd_plnt_loc_id,
"
"                     cr1.gehd_plnt_loc_name
"
"                                    );
"
"
"
"      FOR cr2 IN c2(cr1.gehd_plnt,cr1.gehd_ref_unit,cr1.gedl_store_id,cr1.geln_suplr_id,cr1.gehd_plnt_loc_id,cr1.gehd_plnt_loc_name)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(istln_seq_no),0)+1
"
"          INTO v_seq_no
"
"          FROM inv_stock_trans_ln
"
"         WHERE istln_bu = p_bu
"
"           AND istln_doc_no = v_doc_no;
"
"
"
"        OPEN c_dc(cr2.gedl_dc_no,cr2.gedl_dc_doc_no,cr2.gedl_dc_seq_no);
"
"    FETCH c_dc INTO r_dc;
"
"    CLOSE c_dc;
"
"
"
"    BEGIN
"
"     SELECT prohd_so_pfx,prohd_so_no,prohd_so_seq_no,prohd_so_sub_seq_no,prohd_so_schld_desc,'SO'
"
"       INTO v_so_pfx,v_so_no,v_so_seq_no,v_so_sub_seq_no,v_so_schd_desc,v_so_type
"
"       FROM prod_order_hd
"
"      WHERE prohd_bu = p_bu
"
"        AND prohd_plnt = cr1.gehd_plnt
"
"        AND prohd_ord_no = cr2.gedl_prod_ord_no;
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_so_pfx := NULL;
"
"      v_so_no := NULL;
"
"      v_so_seq_no := NULL;
"
"      v_so_sub_seq_no := NULL;
"
"      v_so_schd_desc := NULL;
"
"      v_so_type := 'NA';
"
"    END;
"
"
"
"
"
"    INSERT INTO inv_stock_trans_ln(istln_bu,
"
"                           istln_doc_no,
"
"                           istln_seq_no,
"
"                           istln_mat_type,
"
"                           istln_prod_id,
"
"                           istln_prod_rev,
"
"                           istln_uom,
"
"                           istln_prod_uom,
"
"                           istln_conv_factor,
"
"                           istln_prod_cls,
"
"                           istln_rqst_qty,
"
"                           istln_trans_qty,
"
"                           istln_excs_qty,
"
"                           istln_accepted_qty,
"
"                           istln_trnf_acpt_qty,
"
"                           istln_unit_cost,
"
"                           istln_status,
"
"                           istln_po_ord_no,
"
"                           istln_sf_code,
"
"                       istln_dc_doc_no,
"
"                       istln_dc_no,
"
"                       istln_dc_seq_no,
"
"                       istln_reference,
"
"                           istln_cre_by,
"
"                           istln_cre_date,
"
"                       istln_store_id,
"
"                       istln_type,
"
"                       istln_so_pfx,
"
"                       istln_so_no,
"
"                       istln_so_seq_no,
"
"                       istln_so_sub_seq_no,
"
"                       istln_so_schld_desc,
"
"                       istln_ge_doc_no,
"
"                       istln_ge_seq_no,
"
"                       istln_ge_sub_seq_no,
"
"                       istln_mi_doc_no,
"
"                       istln_mi_seq_no,
"
"                       istln_oprn_ln_seq_no,
"
"                       istln_process_id
"
"                          )
"
"                    VALUES(p_bu,
"
"                           v_doc_no,
"
"                           v_seq_no,
"
"                           CASE WHEN cr2.gedl_sf_code IS NULL THEN 'S' ELSE 'F' END,
"
"                           cr2.gedl_prod_id,
"
"                           cr2.gedl_prod_rev,
"
"                           cr2.gedl_uom,
"
"                           cr2.gedl_uom,
"
"                           1,
"
"                           func_find_product_class(p_bu,cr1.gehd_plnt,cr2.gedl_prod_id,cr2.gedl_prod_rev),
"
"                           cr2.gedl_qty,
"
"                           cr2.gedl_qty,
"
"                           0,
"
"                           cr2.gedl_qty,
"
"                           cr2.gedl_qty,
"
"                           cr2.gedl_unit_cost,
"
"                           'N',
"
"                           cr2.gedl_prod_ord_no,
"
"                           cr2.gedl_sf_code,
"
"                       cr2.gedl_dc_doc_no,
"
"                       cr2.gedl_dc_no,
"
"                       cr2.gedl_dc_seq_no,
"
"                       'Material Receipt '||r_dc.dcln_mi_doc_no||'/'||r_dc.dcln_mi_seq_no,
"
"                           p_user,
"
"                           SYSDATE,
"
"                       r_dc.dcln_store_id,
"
"                       v_so_type,
"
"                       v_so_pfx,
"
"                       v_so_no,
"
"                       v_so_seq_no,
"
"                       v_so_sub_seq_no,
"
"                       v_so_schd_desc,
"
"                       cr2.gedl_doc_no,
"
"                       cr2.gedl_seq_no,
"
"                       cr2.gedl_sub_seq_no,
"
"                       cr2.gedl_sou_doc_no,
"
"                       cr2.gedl_sou_doc_seq_no,
"
"                       cr2.gedl_oprn_ln_seq_no,
"
"                       cr2.gedl_process_id
"
"                          );
"
"
"
"        UPDATE gate_entry_details
"
"       SET gedl_match_qty = gedl_match_qty + cr2.gedl_qty,
"
"           gedl_trf_sel_flag = 'N',
"
"           gedl_trf_sel_user = NULL
"
"     WHERE gedl_bu = p_bu
"
"       AND gedl_plnt = cr2.gehd_plnt
"
"       AND gedl_doc_no = cr2.gehd_doc_no
"
"       AND gedl_seq_no = cr2.gedl_seq_no
"
"       AND gedl_sub_seq_no = cr2.gedl_sub_seq_no;
"
"
"
"        FOR r_ls IN c_ls(cr2.gehd_plnt,cr2.gehd_doc_no,cr2.gedl_seq_no,cr2.gedl_sub_seq_no)
"
"    LOOP
"
"
"
"      SELECT NVL(MAX(isbd_sub_seq_no),0)+1
"
"        INTO v_ls_seq_no
"
"        FROM inv_stock_batch_details
"
"       WHERE isbd_bu = p_bu
"
"         AND isbd_issue_doc_no = v_doc_no
"
"         AND isbd_seq_no = v_seq_no;
"
"
"
"      INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                                          isbd_issue_doc_no,
"
"                          isbd_seq_no,
"
"                          isbd_sub_seq_no,
"
"                          isbd_sys_ls_no,
"
"                          isbd_lot_no,
"
"                          isbd_serial_no,
"
"                          isbd_source_id,
"
"                          isbd_source_type,
"
"                          isbd_trans_qty,
"
"                          isbd_expiry_date,
"
"                          isbd_ins_rec,
"
"                          isbd_cre_by,
"
"                          isbd_cre_date
"
"                         )
"
"                       VALUES(p_bu,
"
"                                  v_doc_no,
"
"                                  v_seq_no,
"
"                          v_ls_seq_no,
"
"                          r_ls.gelsd_sys_ls_no,
"
"                          r_ls.gelsd_lot_no,
"
"                          r_ls.gelsd_ser_no,
"
"                          r_ls.gelsd_source_id,
"
"                          r_ls.gelsd_source_type,
"
"                          r_ls.gelsd_trans_qty,
"
"                          r_ls.gelsd_expiry_date,
"
"                          'N',
"
"                          p_user,
"
"                          SYSDATE
"
"                         );
"
"    END LOOP c_ls;
"
"
"
"      END LOOP c2;
"
"
"
"      BEGIN
"
"        SELECT icmctrl_auto_mtr_compl_flag
"
"          INTO v_auto_mtr_compl_flag
"
"          FROM icm_control
"
"         WHERE icmctrl_bu = p_bu;
"
"      END;
"
"
"
"      IF v_auto_mtr_compl_flag = 'Y' THEN
"
"
"
"        IF  func_find_inv_method(p_bu) IN ('T') THEN
"
"
"
"      SELECT isthd_plnt
"
"        INTO v_doc_plnt
"
"        FROM inv_stock_trans_hd
"
"       WHERE isthd_bu = p_bu
"
"         AND isthd_doc_no = v_doc_no;
"
"
"
"          proc_ins_mat_iss_appl_jrnl(p_bu,
"
"                                     v_doc_plnt,--cr1.gehd_ref_unit,
"
"                                     v_doc_no,
"
"                                     p_user,
"
"                                     1,
"
"                                     v_jrnl_res
"
"                                     );
"
"
"
"          IF v_jrnl_res = 'N' THEN
"
"        Raise_Application_Error(-20999,'HRM '||p_bu||'/'||v_doc_plnt||'/'||v_doc_no);
"
"      ELSE
"
"        UPDATE inv_stock_trans_hd
"
"               SET isthd_jrnl_flag = 'Y'
"
"             WHERE isthd_bu = p_bu
"
"           AND isthd_plnt = v_doc_plnt--cr1.gehd_ref_unit
"
"               AND isthd_doc_no = v_doc_no;
"
"          END IF;
"
"
"
"        END IF;
"
"
"
"          proc_recv_rcpt_frm_mat_rcpt(p_bu,v_doc_no,p_user,p_user_emp);
"
"
"
"        IF  func_find_inv_method(p_bu) IN ('T') THEN
"
"
"
"          proc_ins_gl_jrnl(p_bu,
"
"                   v_doc_plnt,--cr1.gehd_ref_unit,
"
"                   p_date,
"
"                   func_find_year(p_bu,p_date),
"
"                   func_find_period(p_bu,p_date),
"
"                   NULL,
"
"                   v_doc_no,
"
"                   NULL,
"
"                   'ICM',
"
"                   p_user,
"
"                   1,
"
"                   'MATERIAL TRANSFER FROM ' ||cr1.gehd_plnt ||' TO ' || cr1.gehd_ref_unit
"
"                   );
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"    END LOOP c1;
"
"
"
"    IF v_doc_no1 IS NOT NULL THEN
"
"      p_res := func_find_order_no_substr(v_doc_no1);
"
"    END IF;
"
"
"
"  END proc_cre_mr_frm_mat_trf_ge;
"
"
"
"  PROCEDURE proc_recv_rcpt_frm_mat_rcpt(p_bu        IN    business_units.bu_id%TYPE,
"
"                                        p_doc_no    IN    inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                        p_user        IN    appl_users.appluser_id%TYPE,
"
"                    p_user_emp    IN    employees.emp_emp_id%TYPE
"
"                       )
"
"  AS
"
"
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM inv_stock_trans_hd,inv_stock_trans_ln,products
"
"   WHERE isthd_bu = istln_bu
"
"     AND isthd_doc_no = istln_doc_no
"
"     AND istln_bu = prod_bu
"
"     AND istln_prod_id = prod_id
"
"     AND istln_prod_rev = prod_rev
"
"     AND isthd_bu = p_bu
"
"     AND isthd_doc_no = p_doc_no
"
"   ORDER BY istln_seq_no;
"
"
"
"  CURSOR c_ls(c_seq_no    inv_stock_trans_ln.istln_seq_no%TYPE) IS
"
"  SELECT *
"
"    FROM inv_stock_batch_details
"
"   WHERE isbd_bu = p_bu
"
"     AND isbd_issue_doc_no = p_doc_no
"
"     AND isbd_seq_no = c_seq_no
"
"   ORDER BY isbd_sub_seq_no;
"
"
"
"   CURSOR c_stk(c_store_id    VARCHAR2,
"
"                c_prod_id     VARCHAR2,
"
"        c_prod_rev    NUMBER)IS
"
"   SELECT *
"
"     FROM stocks
"
"    WHERE stock_bu = p_bu
"
"      AND stock_store_id = c_store_id
"
"      AND stock_prod_id = c_prod_id
"
"      AND stock_prod_rev = c_prod_rev;
"
"
"
"  v_ref            VARCHAR2(100);
"
"  v_fpi_flag    prod_plants.prodplnt_fpi_flag%TYPE;
"
"  v_frm_plnt_cmt_doc_no    VARCHAR2(15);
"
"  v_frm_store_plnt    VARCHAR2(10);
"
"  v_frm_store_type    VARCHAR2(1);
"
"  v_to_store_plnt    VARCHAR2(10);
"
"  v_to_store_type    VARCHAR2(1);
"
"  v_doc_no        VARCHAR2(15);
"
"  v_sys_ls_no             NUMBER(15);
"
"  v_source_id             VARCHAR2(10);
"
"  v_source_type           VARCHAR2(1);
"
"  v_cmt_status        VARCHAR2(1);
"
"  v_sou_plnt        VARCHAR2(10);
"
"  v_trans_type         VARCHAR2(2);
"
"  v_mi_doc_no        VARCHAR2(20);
"
"  v_mi_seq_no        NUMBER;
"
"
"
"  r_ls        c_ls%ROWTYPE;
"
"
"
"  v_rcpt_unitcost    NUMBER(17,5);
"
"  v_trans_qty        NUMBER(12,3);
"
"  v_bin_trans_qty    NUMBER(12,3);
"
"  v_mr_no        VARCHAR2(30);
"
"  v_store_id        VARCHAR2(30);
"
"  v_dflt_store_id       VARCHAR2(30);
"
"
"
"  v_new_sys_ls_no    prod_lot_ser_nos.plsn_sys_ls_no%TYPE;
"
"
"
"  v_stk_batch_no    stocks_batches.sb_batch_id%TYPE;
"
"
"
"  v_lot_sys_ls_no    NUMBER;
"
"  v_fpi_mi_doc_no    VARCHAR2(100);
"
"  r_stk            c_stk%ROWTYPE;
"
"  v_qc_no        VARCHAR2(30);
"
"  v_rwk_doc_no        VARCHAR2(100);
"
"  v_mi_qc_no        VARCHAR2(100);
"
"  v_lab_cust_flag       VARCHAR2(5);
"
"  v_po_ord_type         VARCHAR2(5);
"
"  v_cust_id        VARCHAR2(10);
"
"  TYPE typ_ls IS TABLE OF inv_stock_batch_details%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_ls_blk        typ_ls;
"
"
"
"  v_ip_addr        VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"  v_os_user        VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      BEGIN
"
"        SELECT dcln_mi_doc_no,dcln_mi_seq_no INTO v_mi_doc_no,v_mi_seq_no
"
"          FROM dc_ln
"
"         WHERE dcln_bu = cr1.isthd_bu
"
"       AND dcln_plnt = cr1.isthd_ref_unit
"
"           AND dcln_doc_no = cr1.istln_dc_doc_no
"
"           AND dcln_seq_no = cr1.istln_dc_seq_no;
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN
"
"         v_mi_doc_no := NULL;
"
"         v_mi_seq_no := NULL;
"
"       END;
"
"
"
"      /* IF v_mi_doc_no IS NULL THEN
"
"          Raise_Application_Error(-20999,'HRM'||'~'||cr1.isthd_rqstby_entity||'~'||cr1.istln_dc_no||'~'||cr1.istln_dc_seq_no);
"
"       END IF;*/
"
"     -- Raise_Application_Error(-20999,'HRM '||'-'||cr1.istln_vou_type);
"
"
"
"      v_ref := ('MRV#('||cr1.istln_doc_no||'/'||cr1.istln_seq_no||') DC#('||cr1.istln_dc_no||'/'||cr1.istln_dc_seq_no||')');
"
"
"
"      OPEN c_stk(cr1.istln_store_id,cr1.istln_prod_id,cr1.istln_prod_rev);
"
"      FETCH c_stk INTO r_stk;
"
"         IF c_stk%NOTFOUND THEN
"
"        proc_cre_stocks(p_bu,cr1.istln_prod_id,cr1.istln_prod_rev,cr1.istln_store_id,p_user);
"
"     END IF;
"
"      CLOSE c_stk;
"
"
"
"      IF cr1.istln_mat_type = 'S' THEN
"
"
"
"        v_rcpt_unitcost := cr1.istln_unit_cost;
"
"
"
"        proc_upd_stocks(p_bu,
"
"                        --cr1.isthd_issuefm_store_id,
"
"            cr1.istln_store_id,
"
"                        NULL,
"
"                        cr1.istln_prod_id,
"
"                        cr1.istln_prod_rev,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        v_rcpt_unitcost,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        cr1.istln_seq_no,
"
"                        0,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.isthd_year,
"
"                        cr1.isthd_period,
"
"                        cr1.isthd_trans_date,
"
"                        NULL,
"
"                        'ICM',
"
"                        'MR',
"
"                        NULL,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        NULL,
"
"                        cr1.istln_prod_cls,
"
"                        cr1.istln_ord_no,
"
"                        cr1.istln_ord_type,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        cr1.istln_mfg_date,
"
"                        cr1.istln_expiry_date,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        0,
"
"                        cr1.istln_reference,
"
"                        v_ref,
"
"                        -cr1.istln_stk_trans_qty,
"
"                        0,
"
"                        NULL,
"
"                        'S',
"
"                        p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"            p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"            p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"            p_prod_grp_id => cr1.istln_prod_grp,
"
"            p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"            p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                        p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                       );
"
"
"
"      IF cr1.prod_indicator = 'I' THEN
"
"
"
"        proc_upd_so_stocks(p_bu,
"
"                 cr1.istln_store_id,
"
"                 cr1.istln_prod_id,
"
"                 cr1.istln_prod_rev,
"
"                 0,
"
"                 0,
"
"                 v_rcpt_unitcost,
"
"                 cr1.istln_so_pfx,
"
"                 cr1.istln_so_no,
"
"                 cr1.istln_so_seq_no,
"
"                 cr1.istln_so_sub_seq_no,
"
"                 cr1.isthd_trans_date,
"
"                 NVL(cr1.istln_ord_type,'MI'),
"
"                 cr1.istln_ord_pfx,
"
"                 NVL(cr1.istln_ord_no,p_doc_no),
"
"                 NULL,
"
"                 NULL,
"
"                 p_doc_no,
"
"                 cr1.istln_seq_no,
"
"                 cr1.istln_vou_type,
"
"                 'ICM',
"
"                 cr1.istln_reference,
"
"                 v_ref,
"
"                 p_user,
"
"                 cr1.istln_type,
"
"                 cr1.istln_proj_id,
"
"                 cr1.istln_task_id,
"
"                 p_qty_transit => -cr1.istln_stk_trans_qty,
"
"               p_so_prj_schld_desc => cr1.istln_so_schld_desc
"
"                );
"
"      END IF;
"
"
"
"        FOR r_ls IN c_ls(cr1.istln_seq_no)
"
"    LOOP
"
"
"
"    IF r_ls.isbd_sys_ls_no IS NOT NULL THEN
"
"
"
"      v_sys_ls_no := r_ls.isbd_sys_ls_no;
"
"          v_source_type := r_ls.isbd_source_type;
"
"          v_source_id := r_ls.isbd_source_id;
"
"
"
"      proc_upd_lot_ser_stocks(p_bu,
"
"                              --cr1.isthd_issuefm_store_id,
"
"                  cr1.istln_store_id,
"
"                              cr1.istln_prod_id,
"
"                              cr1.istln_prod_rev,
"
"                              r_ls.isbd_sys_ls_no,
"
"                              0,
"
"                              0,
"
"                              -r_ls.isbd_stk_trans_qty, /*-r_ls.isbd_trans_qty/cr1.istln_conv_factor,*/
"
"                              v_rcpt_unitcost,
"
"                              cr1.prod_ser_lot_opt,
"
"                              r_ls.isbd_lot_no,
"
"                              r_ls.isbd_serial_no,
"
"                              r_ls.isbd_source_type,
"
"                              r_ls.isbd_source_id,
"
"                              r_ls.isbd_expiry_date,
"
"                              cr1.isthd_trans_date,
"
"                              'MR',
"
"                              NULL,
"
"                              cr1.istln_doc_no,
"
"                              cr1.istln_seq_no,
"
"                              'ICM',
"
"                              cr1.istln_reference,
"
"                              v_ref,
"
"                              p_user,
"
"                  p_so_pfx => cr1.istln_so_pfx,
"
"                  p_so_no => cr1.istln_so_no,
"
"                  p_so_seq_no => cr1.istln_so_seq_no,
"
"                  p_so_sub_seq_no => cr1.istln_so_sub_seq_no,
"
"                  p_so_ref => cr1.istln_so_schld_desc,
"
"                  p_batch_no => r_ls.isbd_batch_no
"
"                             );
"
"
"
"          FOR r_roll IN (SELECT *
"
"                           FROM inv_stock_trans_lot_roll_dtls
"
"                      WHERE istlrd_bu = p_bu
"
"                            AND istlrd_doc_no = cr1.istln_doc_no
"
"                            AND istlrd_doc_seq_no = cr1.istln_seq_no
"
"                            AND istlrd_lot_seq_no = r_ls.isbd_sub_seq_no
"
"                            AND istlrd_sys_ls_no = r_ls.isbd_sys_ls_no
"
"              ORDER BY istlrd_roll_no)
"
"          LOOP
"
"            proc_upd_lot_roll_stocks(p_bu,
"
"                                     cr1.istln_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_roll.istlrd_roll_no,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             -r_roll.istlrd_roll_qty,
"
"                             cr1.istln_vou_type,
"
"                             cr1.isthd_trans_date,
"
"                     cr1.istln_vou_no,
"
"                     cr1.istln_vou_seq_no,
"
"                     p_user
"
"                            );
"
"          END LOOP;
"
"
"
"    END IF;
"
"    END LOOP c_ls;
"
"
"
"    BEGIN
"
"          SELECT store_plnt,store_physical INTO v_frm_store_plnt,v_frm_store_type
"
"            FROM stores
"
"           WHERE store_bu = p_bu
"
"             AND store_id = cr1.istln_store_id;
"
"    END;
"
"
"
"
"
"          IF cr1.isthd_issueto_type = 'E' THEN
"
"      BEGIN
"
"        SELECT store_id INTO v_store_id
"
"          FROM stores
"
"             WHERE store_bu = p_bu
"
"               AND store_plnt = cr1.isthd_plnt
"
"           AND store_plnt_loc_id = cr1.isthd_plnt_loc_id
"
"           AND store_physical = 'L'
"
"           AND store_inv_id = cr1.isthd_issueto_id;
"
"      END;
"
"    ELSE
"
"      v_store_id := cr1.isthd_issueto_id;
"
"    END IF;
"
"
"
"    BEGIN
"
"         SELECT store_plnt,store_physical
"
"       INTO v_to_store_plnt,v_to_store_type
"
"           FROM stores
"
"          WHERE store_bu = p_bu
"
"            AND store_id = v_store_id;
"
"     END;
"
"
"
"
"
"        IF v_frm_store_type = 'E' AND v_to_store_type = 'E' THEN
"
"      v_cmt_status := 'N';
"
"      v_sou_plnt := v_frm_store_plnt;
"
"      v_trans_type := 'FB';
"
"    ELSIF v_frm_store_type = 'G' AND v_to_store_type = 'G' THEN
"
"      v_cmt_status := 'C';
"
"      v_sou_plnt := v_to_store_plnt;
"
"      v_trans_type := 'FS';
"
"    END IF;
"
"
"
"    v_rcpt_unitcost := cr1.istln_unit_cost + cr1.istln_chrg_amt + cr1.istln_moist_chrg_amt;
"
"
"
"
"
"    OPEN c_stk(v_store_id,cr1.istln_prod_id,cr1.istln_prod_rev);
"
"        FETCH c_stk INTO r_stk;
"
"         IF c_stk%NOTFOUND THEN
"
"        proc_cre_stocks(p_bu,cr1.istln_prod_id,cr1.istln_prod_rev,v_store_id,p_user);
"
"     END IF;
"
"        CLOSE c_stk;
"
"
"
"    proc_upd_stocks(p_bu,
"
"                        v_store_id,
"
"                        NULL,
"
"                        cr1.istln_prod_id,
"
"                        cr1.istln_prod_rev,
"
"                        0,
"
"                        0,
"
"                        cr1.istln_stk_trans_qty,--(cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty) / cr1.istln_conv_factor,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        v_rcpt_unitcost,
"
"                        0,
"
"                        'N',
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        cr1.istln_seq_no,
"
"                        0,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.isthd_year,
"
"                        cr1.isthd_period,
"
"                        cr1.isthd_trans_date,
"
"                        NULL,
"
"                        'ICM',
"
"                        'MR',
"
"                        NULL,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        NULL,
"
"                        cr1.istln_prod_cls,
"
"                        cr1.istln_ord_no,
"
"                        cr1.istln_ord_type,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        p_ref1 => cr1.istln_reference,
"
"                        p_ref2 => v_ref,
"
"                p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"            p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"            p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"            p_prod_grp_id => cr1.istln_prod_grp,
"
"            p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"            p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                        p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                       );
"
"
"
"      IF cr1.prod_indicator = 'I' THEN
"
"
"
"        proc_upd_so_stocks(p_bu,
"
"                 v_store_id,
"
"                 cr1.istln_prod_id,
"
"                 cr1.istln_prod_rev,
"
"                 cr1.istln_stk_trans_qty,
"
"                 0,
"
"                 cr1.istln_unit_cost,
"
"                 cr1.istln_so_pfx,
"
"                 cr1.istln_so_no,
"
"                 cr1.istln_so_seq_no,
"
"                 cr1.istln_so_sub_seq_no,
"
"                 cr1.isthd_trans_date,
"
"                 NVL(cr1.istln_ord_type,'MI'),
"
"                 cr1.istln_ord_pfx,
"
"                 NVL(cr1.istln_ord_no,p_doc_no),
"
"                 NULL,
"
"                 NULL,
"
"                 p_doc_no,
"
"                 cr1.istln_seq_no,
"
"                 'MR',
"
"                 'ICM',
"
"                 cr1.istln_reference,
"
"                 v_ref,
"
"                 p_user,
"
"                 cr1.istln_type,
"
"                 cr1.istln_proj_id,
"
"                 cr1.istln_task_id,
"
"               p_so_prj_schld_desc => cr1.istln_so_schld_desc
"
"                );
"
"      END IF;
"
"
"
"    --Raise_Application_Error(-20999,'HRM ');
"
"--Raise_Application_Error(-20999,'Bala Testing - 1'||cr1.istln_so_no||'/'||cr1.istln_proj_id);
"
"    IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt IN ('N','S') THEN
"
"
"
"      proc_upd_stock_batches(p_bu,
"
"                     v_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     NULL,
"
"                     cr1.istln_stk_trans_qty,
"
"                     0,
"
"                     0,
"
"                     0,
"
"                     v_rcpt_unitcost,
"
"                     v_rcpt_unitcost,
"
"                     0,
"
"                     0,
"
"                     0,
"
"                     0    ,
"
"                     'N',
"
"                     cr1.isthd_trans_date,
"
"                     NULL,
"
"                     cr1.istln_doc_no,
"
"                     cr1.istln_seq_no,
"
"                     'MR',
"
"                     NULL,
"
"                     cr1.istln_doc_no,
"
"                     cr1.istln_seq_no,
"
"                     NULL,
"
"                     cr1.istln_prod_cls,
"
"                     'MR',
"
"                     'ICM',
"
"                     NULL,
"
"                     NULL,
"
"                     NULL,
"
"                     NULL,
"
"                     p_user,
"
"                 p_ref1 => cr1.istln_reference,
"
"                 p_ref2 => v_ref,
"
"                 p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                 p_prod_subcls => cr1.istln_prod_subcls,
"
"                 p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                 p_prod_grp => cr1.istln_prod_grp,
"
"                 p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                 p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                 p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                 p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                     );
"
"
"
"          v_stk_batch_no := NULL;
"
"
"
"    END IF;
"
"
"
"    IF cr1.prod_ser_lot_opt <> 'N' THEN
"
"
"
"          FOR r_ls IN c_ls(cr1.istln_seq_no)
"
"      LOOP
"
"
"
"        proc_upd_lot_ser_stocks(p_bu,
"
"                                v_store_id,
"
"                                cr1.istln_prod_id,
"
"                                cr1.istln_prod_rev,
"
"                                r_ls.isbd_sys_ls_no,
"
"                                r_ls.isbd_stk_trans_qty,
"
"                                0,
"
"                                0,
"
"                                v_rcpt_unitcost,
"
"                                cr1.prod_ser_lot_opt,
"
"                                r_ls.isbd_lot_no,
"
"                                r_ls.isbd_serial_no,
"
"                                r_ls.isbd_source_type,
"
"                                r_ls.isbd_source_id,
"
"                                r_ls.isbd_expiry_date,
"
"                                cr1.isthd_trans_date,
"
"                                'MR',
"
"                                NULL,
"
"                                cr1.istln_doc_no,
"
"                                cr1.istln_seq_no,
"
"                                'ICM',
"
"                                cr1.istln_reference,
"
"                                v_ref,
"
"                                p_user,
"
"                    p_so_pfx => cr1.istln_so_pfx,
"
"                    p_so_no => cr1.istln_so_no,
"
"                    p_so_seq_no => cr1.istln_so_seq_no,
"
"                    p_so_sub_seq_no => cr1.istln_so_sub_seq_no,
"
"                    p_so_ref => cr1.istln_so_schld_desc,
"
"                    p_batch_no => r_ls.isbd_batch_no
"
"                               );
"
"
"
"          FOR r_roll IN (SELECT *
"
"                           FROM inv_stock_trans_lot_roll_dtls
"
"                      WHERE istlrd_bu = p_bu
"
"                            AND istlrd_doc_no = cr1.istln_doc_no
"
"                            AND istlrd_doc_seq_no = cr1.istln_seq_no
"
"                            AND istlrd_lot_seq_no = r_ls.isbd_sub_seq_no
"
"                            AND istlrd_sys_ls_no = r_ls.isbd_sys_ls_no
"
"              ORDER BY istlrd_roll_no)
"
"          LOOP
"
"            proc_upd_lot_roll_stocks(p_bu,
"
"                                     v_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_roll.istlrd_roll_no,
"
"                             r_roll.istlrd_roll_qty,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             cr1.istln_vou_type,
"
"                             cr1.isthd_trans_date,
"
"                     cr1.istln_vou_no,
"
"                     cr1.istln_vou_seq_no,
"
"                     p_user
"
"                            );
"
"          END LOOP;
"
"
"
"      IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt = 'L' THEN
"
"
"
"        proc_upd_stock_batches(p_bu,
"
"                       v_store_id,
"
"                       cr1.istln_prod_id,
"
"                       cr1.istln_prod_rev,
"
"                       NULL,
"
"                       r_ls.isbd_stk_trans_qty,
"
"                       0,
"
"                       0,
"
"                       0,
"
"                       v_rcpt_unitcost,
"
"                       v_rcpt_unitcost,
"
"                       0,
"
"                       0,
"
"                       0,
"
"                       0    ,
"
"                       'N',
"
"                       cr1.isthd_trans_date,
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       'MR',
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       NULL,
"
"                       cr1.istln_prod_cls,
"
"                       'MR',
"
"                       'ICM',
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       p_user,
"
"                   p_ref1 => cr1.istln_reference,
"
"                   p_ref2 => v_ref,
"
"                   p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                   p_prod_subcls => cr1.istln_prod_subcls,
"
"                   p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                   p_prod_grp => cr1.istln_prod_grp,
"
"                   p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                   p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                   p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                   p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                   p_sys_ls_no => r_ls.isbd_sys_ls_no
"
"                      );
"
"
"
"            SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"              FROM stocks_batches
"
"             WHERE sb_bu = p_bu
"
"               AND sb_store_id = v_store_id
"
"               AND sb_prod_id = cr1.istln_prod_id
"
"               AND sb_prod_rev = cr1.istln_prod_rev
"
"               AND sb_po_no = cr1.istln_doc_no
"
"               AND sb_receipt_seq_no = cr1.istln_seq_no
"
"           AND sb_sys_ls_no = r_ls.isbd_sys_ls_no;
"
"
"
"          IF cr1.prod_cb_level = 'L' THEN
"
"
"
"            proc_upd_ls_stk_batch(p_bu,
"
"                              v_store_id,
"
"                      cr1.istln_prod_id,
"
"                      cr1.istln_prod_rev,
"
"                      r_ls.isbd_sys_ls_no,
"
"                      v_stk_batch_no,
"
"                      r_ls.isbd_stk_trans_qty,
"
"                      p_user
"
"                     );
"
"          END IF;
"
"
"
"      ELSIF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt = 'S' THEN
"
"
"
"        SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"          FROM stocks_batches
"
"         WHERE sb_bu = p_bu
"
"           AND sb_store_id = v_store_id
"
"           AND sb_prod_id = cr1.istln_prod_id
"
"           AND sb_prod_rev = cr1.istln_prod_rev
"
"           AND sb_po_no = cr1.istln_doc_no
"
"           AND sb_receipt_seq_no = cr1.istln_seq_no;
"
"
"
"      ELSE
"
"
"
"        v_stk_batch_no := NULL;
"
"
"
"      END IF;
"
"
"
"
"
"        IF cr1.isthd_issueto_type = 'W' AND cr1.prod_cons_type = 'P' THEN
"
"
"
"              proc_insrupd_wip(p_bu,
"
"                     v_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_ls.isbd_lot_no,
"
"                     r_ls.isbd_serial_no,
"
"                     r_ls.isbd_expiry_date,
"
"                     r_ls.isbd_source_type,
"
"                     r_ls.isbd_source_id,
"
"                     r_ls.isbd_stk_trans_qty,
"
"                     0,
"
"                     cr1.istln_ord_type,
"
"                     cr1.istln_ord_pfx,
"
"                     cr1.istln_ord_no,
"
"                     cr1.istln_ord_seq_no,
"
"                     cr1.istln_ord_sub_seq_no,
"
"                     p_user,
"
"                     v_stk_batch_no,
"
"                     cr1.istln_so_pfx,
"
"                     cr1.istln_so_no,
"
"                     cr1.istln_so_seq_no,
"
"                     cr1.istln_so_sub_seq_no,
"
"                     p_proc_id => cr1.istln_process_id,
"
"                     p_prod_ord_no => cr1.istln_po_ord_no,
"
"                     p_type => cr1.istln_type,
"
"                     p_proj_id => cr1.istln_proj_id,
"
"                     p_task_id => cr1.istln_task_id,
"
"                   p_ord_trans_no => cr1.istln_trans_no,
"
"                   p_par_batch_no => cr1.istln_par_batch_no,
"
"                   p_so_schld_ref => cr1.istln_so_schld_desc,
"
"                   p_oprn_ln_seq_no => cr1.istln_oprn_ln_seq_no,
"
"                   p_test_no => r_ls.isbd_test_no
"
"                    );
"
"
"
"            END IF;
"
"      END LOOP c_ls;
"
"    END IF;
"
"
"
"    IF cr1.prod_ser_lot_opt = 'N' AND cr1.isthd_issueto_type = 'W' AND cr1.prod_cons_type = 'P' THEN
"
"
"
"      proc_insrupd_wip(p_bu,
"
"           v_store_id,
"
"           cr1.istln_prod_id,
"
"           cr1.istln_prod_rev,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           cr1.istln_stk_trans_qty,
"
"           0,
"
"           cr1.istln_ord_type,
"
"           cr1.istln_ord_pfx,
"
"           cr1.istln_ord_no,
"
"           cr1.istln_ord_seq_no,
"
"           cr1.istln_ord_sub_seq_no,
"
"           p_user,
"
"           NULL,
"
"           cr1.istln_so_pfx,
"
"           cr1.istln_so_no,
"
"           cr1.istln_so_seq_no,
"
"           cr1.istln_so_sub_seq_no,
"
"           p_proc_id => cr1.istln_process_id,
"
"           p_prod_ord_no => cr1.istln_po_ord_no,
"
"           p_type => cr1.istln_type,
"
"           p_proj_id => cr1.istln_proj_id,
"
"           p_task_id => cr1.istln_task_id,
"
"           p_ord_trans_no => cr1.istln_trans_no,
"
"           p_par_batch_no => cr1.istln_par_batch_no,
"
"           p_so_schld_ref => cr1.istln_so_schld_desc,
"
"           p_oprn_ln_seq_no => cr1.istln_oprn_ln_seq_no
"
"          );
"
"
"
"    END IF;
"
"
"
"    IF func_find_store_bin_flag(p_bu,v_store_id) = 'Y' THEN
"
"
"
"      v_trans_qty := (cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty);
"
"
"
"      SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"        FROM inv_mat_transfer_bin
"
"       WHERE imtb_bu = p_bu
"
"         AND imtb_doc_no = cr1.istln_doc_no
"
"         AND imtb_seq_no = cr1.istln_seq_no;
"
"
"
"      IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"        Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"      END IF;
"
"
"
"      FOR r_bin IN (SELECT *
"
"                      FROM inv_mat_transfer_bin
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no)
"
"      LOOP
"
"        proc_upd_bin_stocks(p_bu,
"
"                      v_store_id,
"
"                      r_bin.imtb_prod_id,
"
"                      r_bin.imtb_prod_rev,
"
"                      r_bin.imtb_bin_id,
"
"                      r_bin.imtb_sys_ls_no,
"
"                      r_bin.imtb_lot_no,
"
"                      r_bin.imtb_ser_no,
"
"                      r_bin.imtb_source_type,
"
"                      r_bin.imtb_source_id,
"
"                      r_bin.imtb_stk_trans_qty,--(r_bin.imtb_trans_qty/cr1.istln_conv_factor),
"
"                      0,
"
"                      0,
"
"                      0,
"
"                      v_rcpt_unitcost,
"
"                      cr1.isthd_trans_date,
"
"                      'MR',
"
"                      NULL,
"
"                      cr1.istln_doc_no,
"
"                      cr1.istln_seq_no,
"
"                      'ICM',
"
"                      p_user,
"
"                p_crate_id => r_bin.imtb_crate_id
"
"                   );
"
"      END LOOP;
"
"    END IF;
"
"
"
"      ELSE
"
"
"
"    OPEN c_ls(cr1.istln_seq_no);
"
"        FETCH c_ls INTO r_ls;
"
"      IF c_ls%NOTFOUND THEN
"
"
"
"        proc_upd_sf_stocks(p_bu,
"
"                               cr1.istln_po_ord_no,
"
"                               NULL,
"
"                               cr1.istln_sf_code,
"
"                               cr1.istln_store_id,
"
"                               cr1.istln_prod_id,
"
"                               cr1.istln_prod_rev,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               CASE WHEN cr1.istln_vou_type = 'SA' THEN - cr1.istln_stk_trans_qty ELSE 0 END,
"
"                               0,
"
"                               cr1.istln_unit_cost,
"
"                               func_find_store_plnt(p_bu,cr1.istln_store_id),
"
"                               NULL,
"
"                               NULL,
"
"                               cr1.istln_so_pfx,
"
"                               cr1.istln_so_no,
"
"                               cr1.istln_so_seq_no,
"
"                               cr1.istln_so_sub_seq_no,
"
"                               cr1.istln_ord_pfx,
"
"                               cr1.istln_ord_no,
"
"                               NULL,
"
"                               cr1.istln_doc_no,
"
"                               cr1.istln_seq_no,
"
"                               cr1.istln_seq_no,
"
"                               cr1.isthd_trans_date,
"
"                               cr1.isthd_year,
"
"                               cr1.isthd_period,
"
"                               cr1.prod_cost_method,
"
"                               'MR',
"
"                               'ICM',
"
"                               func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                               cr1.istln_reference,
"
"                               v_ref,
"
"                               cr1.istln_unit_cost,
"
"                               cr1.istln_unit_cost,
"
"                               cr1.istln_ord_type,
"
"                               p_user,
"
"                               p_trans_in_qty => CASE WHEN cr1.istln_vou_type = 'SA' THEN 0 ELSE -cr1.istln_stk_trans_qty END,
"
"                   p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                   p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                   p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                   p_prod_grp_id => cr1.istln_prod_grp,
"
"                   p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                   p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                   p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                   p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                   p_so_schld_desc => cr1.istln_so_schld_desc
"
"                               );
"
"
"
"        IF cr1.istln_vou_type <> 'SA' AND NOT(INSTR(cr1.istln_sf_code,'0') = 0 AND
"
"           func_find_store_type(p_bu,cr1.istln_rcpt_store_id) = 'Y') THEN
"
"
"
"          proc_upd_sf_stocks(p_bu,
"
"                                 cr1.istln_po_ord_no,
"
"                                 cr1.istln_process_id,
"
"                                 cr1.istln_sf_code,
"
"                                 cr1.istln_rcpt_store_id,
"
"                                 cr1.istln_prod_id,
"
"                                 cr1.istln_prod_rev,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 cr1.istln_stk_trans_qty,
"
"                                 0,
"
"                                 cr1.istln_unit_cost,
"
"                                 func_find_store_plnt(p_bu,cr1.istln_rcpt_store_id),
"
"                                 NULL,
"
"                                 NULL,
"
"                                 cr1.istln_so_pfx,
"
"                                 cr1.istln_so_no,
"
"                                 cr1.istln_so_seq_no,
"
"                                 cr1.istln_so_sub_seq_no,
"
"                                 cr1.istln_ord_pfx,
"
"                                 cr1.istln_ord_no,
"
"                                 NULL,
"
"                                 cr1.istln_doc_no,
"
"                                 cr1.istln_seq_no,
"
"                                 cr1.istln_seq_no,
"
"                                 cr1.isthd_trans_date,
"
"                                 cr1.isthd_year,
"
"                                 cr1.isthd_period,
"
"                                 cr1.prod_cost_method,
"
"                                 'MR',
"
"                                 'ICM',
"
"                                 func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                                 cr1.istln_reference,
"
"                                 v_ref,
"
"                                 cr1.istln_unit_cost,
"
"                                 cr1.istln_unit_cost,
"
"                                 cr1.istln_ord_type,
"
"                                 p_user,
"
"                     p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                     p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                     p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                     p_prod_grp_id => cr1.istln_prod_grp,
"
"                     p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                     p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                     p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                     p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                 p_oprn_ln_seq => cr1.istln_oprn_ln_seq_no,
"
"                 p_so_schld_desc => cr1.istln_so_schld_desc
"
"                                );
"
"
"
"          IF func_find_store_bin_flag(p_bu,cr1.istln_rcpt_store_id) = 'Y' THEN
"
"
"
"            v_trans_qty := (cr1.istln_trans_qty);
"
"
"
"            SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"              FROM inv_mat_transfer_bin
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no;
"
"
"
"            IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"              Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"            END IF;
"
"
"
"            FOR r_bin IN (SELECT *
"
"                            FROM inv_mat_transfer_bin
"
"                   WHERE imtb_bu = p_bu
"
"                     AND imtb_doc_no = cr1.istln_doc_no
"
"                     AND imtb_seq_no = cr1.istln_seq_no)
"
"            LOOP
"
"              proc_upd_bin_stocks(p_bu,
"
"                            cr1.istln_rcpt_store_id,
"
"                            r_bin.imtb_prod_id,
"
"                            r_bin.imtb_prod_rev,
"
"                            r_bin.imtb_bin_id,
"
"                            NULL,
"
"                            NULL,
"
"                            NULL,
"
"                            NULL,
"
"                            NULL,
"
"                            r_bin.imtb_stk_trans_qty,
"
"                            0,
"
"                            0,
"
"                            0,
"
"                            v_rcpt_unitcost,
"
"                            cr1.isthd_trans_date,
"
"                            'MR',
"
"                            NULL,
"
"                            cr1.istln_doc_no,
"
"                            cr1.istln_seq_no,
"
"                            'ICM',
"
"                            p_user,
"
"                      p_crate_id => r_bin.imtb_crate_id,
"
"                      p_prod_ord_no => cr1.istln_po_ord_no,
"
"                      p_sf_code => cr1.istln_sf_code
"
"                         );
"
"            END LOOP;
"
"
"
"          END IF;
"
"
"
"            END IF;
"
"
"
"      ELSE
"
"
"
"        IF cr1.istln_vou_type IN ('SFR','GRN') THEN
"
"
"
"          SELECT prodplnt_fpi_flag INTO v_fpi_flag
"
"            FROM prod_plants
"
"           WHERE prodplnt_bu = p_bu
"
"             AND prodplnt_plnt = cr1.isthd_plnt
"
"             AND prodplnt_prod_id = cr1.istln_prod_id
"
"             AND prodplnt_prod_rev = cr1.istln_prod_rev;
"
"
"
"        ELSE
"
"              v_fpi_flag := 'N';
"
"            END IF;
"
"
"
"
"
"        IF cr1.prod_ser_lot_opt = 'S' THEN
"
"
"
"        SELECT *
"
"          BULK COLLECT INTO r_ls_blk
"
"          FROM inv_stock_batch_details
"
"         WHERE isbd_bu = p_bu
"
"           AND isbd_issue_doc_no = p_doc_no
"
"           AND isbd_seq_no = cr1.istln_seq_no
"
"         ORDER BY isbd_sub_seq_no;
"
"
"
"        FORALL i IN 1..r_ls_blk.COUNT
"
"        UPDATE store_sf_stocks
"
"               SET stsfs_qty = stsfs_qty + CASE WHEN cr1.istln_vou_type = 'SA' THEN -r_ls_blk(i).isbd_stk_trans_qty ELSE 0 END,
"
"                   stsfs_qty_transit_in = stsfs_qty_transit_in + CASE WHEN cr1.istln_vou_type = 'SA' THEN 0 ELSE -r_ls_blk(i).isbd_stk_trans_qty END,
"
"                   stsfs_upd_receipt_pfx = NULL,
"
"                   stsfs_upd_receipt_no = cr1.istln_doc_no,
"
"                   stsfs_upd_receipt_seq_no = cr1.istln_seq_no,
"
"                   stsfs_upd_seq_no = cr1.istln_seq_no,
"
"                   stsfs_trans_date = TRUNC(cr1.isthd_trans_date),
"
"                   stsfs_trans_year = cr1.isthd_year,
"
"                   stsfs_trans_period = cr1.isthd_period,
"
"                   stsfs_cost_method = cr1.prod_cost_method,
"
"                   stsfs_upd_source_doc = 'MR',
"
"                   stsfs_upd_appl = 'ICM',
"
"                   stsfs_upd_ref1 = cr1.istln_reference,
"
"                   stsfs_upd_ref2 = v_ref,
"
"                   stsfs_upd_fc_cost = r_ls_blk(i).isbd_unit_cost,
"
"                   stsfs_upd_bc_cost = r_ls_blk(i).isbd_unit_cost,
"
"                   stsfs_upd_class_id = cr1.istln_prod_cls,
"
"                   stsfs_upd_ord_type = cr1.istln_ord_type,
"
"                   stsfs_upd_by = p_user,
"
"                   stsfs_upd_emp_id = p_user_emp,
"
"                   stsfs_upd_ip_addr = v_ip_addr,
"
"                   stsfs_upd_os_user = v_os_user,
"
"                   stsfs_upd_date = SYSDATE,
"
"                   stsfs_upd_adj_pfx = NULL,
"
"                   stsfs_upd_prod_cls_desc = cr1.istln_prod_cls_desc,
"
"                   stsfs_upd_prod_subcls_id = cr1.istln_prod_subcls,
"
"                   stsfs_upd_prod_subcls_desc = cr1.istln_prod_subcls_desc,
"
"                   stsfs_upd_prod_grp_id = cr1.istln_prod_grp,
"
"                   stsfs_upd_prod_grp_desc = cr1.istln_prod_grp_desc,
"
"                   stsfs_upd_prod_subgrp_id = cr1.istln_prod_subgrp,
"
"                   stsfs_upd_prod_subgrp_desc = cr1.istln_prod_subgrp_desc
"
"             WHERE stsfs_bu = p_bu
"
"           AND stsfs_store_id = cr1.istln_store_id
"
"           AND stsfs_prod_id = cr1.istln_prod_id
"
"           AND stsfs_prod_rev = cr1.istln_prod_rev
"
"           AND NVL(stsfs_ord_no,'0') = NVL(cr1.istln_po_ord_no,'0')
"
"           AND stsfs_sf_code = cr1.istln_sf_code
"
"           AND NVL(stsfs_sys_ls_no,'0') = NVL(r_ls_blk(i).isbd_sys_ls_no,'0');
"
"
"
"        IF cr1.istln_vou_type <> 'SA' AND NOT(INSTR(cr1.istln_sf_code,'0') = 0 AND func_find_store_type(p_bu,cr1.istln_rcpt_store_id) NOT IN ('J','I') AND v_fpi_flag = 'N') THEN
"
"
"
"          FORALL i IN 1..r_ls_blk.COUNT
"
"            INSERT INTO store_sf_stocks(stsfs_bu,
"
"                                  stsfs_trans_no,
"
"                                stsfs_store_id,
"
"                                stsfs_store_plnt,
"
"                                stsfs_prod_id,
"
"                                stsfs_prod_rev,
"
"                                stsfs_ord_no,
"
"                                stsfs_process_id,
"
"                                stsfs_sf_code,
"
"                                stsfs_expiry_date,
"
"                                stsfs_sys_ls_no,
"
"                                stsfs_lot_no,
"
"                                stsfs_serial_no,
"
"                                stsfs_qty,
"
"                                stsfs_alloc_qty,
"
"                                stsfs_unit_cost,
"
"                                stsfs_source_id,
"
"                                stsfs_source_type,
"
"                                stsfs_os_ord_pfx,
"
"                                stsfs_os_ord_no,
"
"                                stsfs_cre_by,
"
"                            stsfs_cre_emp_id,
"
"                            stsfs_cre_ip_addr,
"
"                            stsfs_cre_os_user,
"
"                                stsfs_cre_date,
"
"                                stsfs_upd_receipt_pfx,
"
"                                stsfs_upd_receipt_no,
"
"                                stsfs_upd_receipt_seq_no ,
"
"                                stsfs_upd_seq_no,
"
"                                stsfs_trans_date,
"
"                                            stsfs_trans_year,
"
"                                            stsfs_trans_period,
"
"                                            stsfs_cost_method,
"
"                                stsfs_upd_source_doc,
"
"                                stsfs_upd_appl,
"
"                                stsfs_qty_qc,
"
"                                stsfs_upd_ref1,
"
"                                stsfs_upd_ref2,
"
"                                stsfs_upd_fc_cost,
"
"                                stsfs_upd_bc_cost,
"
"                                stsfs_upd_class_id,
"
"                                stsfs_upd_ord_type,
"
"                                stsfs_qty_transit_in,
"
"                                            stsfs_upd_prod_cls_desc,
"
"                                            stsfs_upd_prod_subcls_id,
"
"                                            stsfs_upd_prod_subcls_desc,
"
"                                            stsfs_upd_prod_grp_id,
"
"                                            stsfs_upd_prod_grp_desc,
"
"                                            stsfs_upd_prod_subgrp_id,
"
"                                            stsfs_upd_prod_subgrp_desc,
"
"                            stsfs_oprn_ln_seq_no,
"
"                            stsfs_so_type,
"
"                            stsfs_so_pfx,
"
"                            stsfs_so_no,
"
"                            stsfs_so_seq_no,
"
"                            stsfs_proj_id,
"
"                            stsfs_task_id,
"
"                            stsfs_so_schld_desc
"
"                               )
"
"                     VALUES(p_bu,
"
"                                  func_find_stock_trans_nextno(p_bu,'SFS',p_user),
"
"                                cr1.istln_rcpt_store_id,
"
"                                func_find_store_plnt(p_bu,cr1.istln_rcpt_store_id),
"
"                                cr1.istln_prod_id,
"
"                                cr1.istln_prod_rev,
"
"                                cr1.istln_po_ord_no,
"
"                                cr1.istln_sou_proc_id,
"
"                                cr1.istln_sf_code,
"
"                                r_ls_blk(i).isbd_expiry_date,
"
"                                r_ls_blk(i).isbd_sys_ls_no,
"
"                                r_ls_blk(i).isbd_lot_no,
"
"                                r_ls_blk(i).isbd_serial_no,
"
"                                r_ls_blk(i).isbd_stk_trans_qty,
"
"                                0,
"
"                                r_ls_blk(i).isbd_unit_cost,
"
"                                r_ls_blk(i).isbd_source_id,
"
"                                r_ls_blk(i).isbd_source_type,
"
"                                cr1.istln_ord_pfx,
"
"                                cr1.istln_ord_no,
"
"                                p_user,
"
"                            p_user_emp,
"
"                            v_ip_addr,
"
"                            v_os_user,
"
"                                SYSDATE,
"
"                                NULL,
"
"                                cr1.istln_doc_no,
"
"                                cr1.istln_seq_no,
"
"                                cr1.istln_seq_no,
"
"                                cr1.isthd_trans_date,
"
"                                            cr1.isthd_year,
"
"                                            cr1.isthd_period,
"
"                                            cr1.prod_cost_method,
"
"                                'MR',
"
"                                'ICM',
"
"                                0,
"
"                                cr1.istln_reference,
"
"                                v_ref,
"
"                                r_ls_blk(i).isbd_unit_cost,
"
"                                r_ls_blk(i).isbd_unit_cost,
"
"                                cr1.istln_prod_cls,
"
"                                cr1.istln_ord_type,
"
"                                0,
"
"                                            cr1.istln_prod_cls_desc,
"
"                                            cr1.istln_prod_subcls,
"
"                                            cr1.istln_prod_subcls_desc,
"
"                                            cr1.istln_prod_grp,
"
"                                            cr1.istln_prod_grp_desc,
"
"                                            cr1.istln_prod_subgrp,
"
"                                            cr1.istln_prod_subgrp_desc,
"
"                            cr1.istln_sou_oprn_seq,
"
"                        cr1.istln_type,
"
"                                            cr1.istln_so_pfx,
"
"                                            cr1.istln_so_no,
"
"                                            cr1.istln_so_seq_no,
"
"                                            cr1.istln_proj_id,
"
"                                            cr1.istln_task_id,
"
"                        cr1.istln_so_schld_desc
"
"                       );
"
"
"
"        END IF;
"
"
"
"        END IF;
"
"
"
"        IF cr1.prod_ser_lot_opt <> 'S' THEN
"
"        LOOP
"
"
"
"          proc_upd_sf_stocks(p_bu,
"
"                         cr1.istln_po_ord_no,
"
"                         cr1.istln_sou_proc_id,
"
"                           cr1.istln_sf_code,
"
"                         cr1.istln_store_id,
"
"                           cr1.istln_prod_id,
"
"                         cr1.istln_prod_rev,
"
"                           r_ls.isbd_sys_ls_no,
"
"                         r_ls.isbd_lot_no,
"
"                           r_ls.isbd_serial_no,
"
"                         r_ls.isbd_expiry_date,
"
"                         CASE WHEN cr1.istln_vou_type = 'SA' THEN -r_ls.isbd_stk_trans_qty ELSE 0 END,
"
"                           0,
"
"                         cr1.istln_unit_cost,
"
"                         func_find_store_plnt(p_bu,cr1.istln_store_id),
"
"                         r_ls.isbd_source_id,
"
"                         r_ls.isbd_source_type,
"
"                         cr1.istln_so_pfx,
"
"                         cr1.istln_so_no,
"
"                         cr1.istln_so_seq_no,
"
"                         cr1.istln_so_sub_seq_no,
"
"                         cr1.istln_ord_pfx,
"
"                         cr1.istln_ord_no,
"
"                         NULL,
"
"                         cr1.istln_doc_no,
"
"                         cr1.istln_seq_no,
"
"                         cr1.istln_seq_no,
"
"                         cr1.isthd_trans_date,
"
"                         cr1.isthd_year,
"
"                         cr1.isthd_period,
"
"                         cr1.prod_cost_method,
"
"                         'MR',
"
"                         'ICM',
"
"                         func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                         cr1.istln_reference,
"
"                         v_ref,
"
"                         cr1.istln_unit_cost,
"
"                         cr1.istln_unit_cost,
"
"                         cr1.istln_ord_type,
"
"                         p_user,
"
"                         p_type => cr1.istln_type,
"
"                         p_proj => cr1.istln_proj_id,
"
"                         p_task => cr1.istln_task_id,
"
"                         p_trans_in_qty => CASE WHEN cr1.istln_vou_type = 'SA' THEN 0 ELSE -r_ls.isbd_stk_trans_qty END,
"
"                     p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                     p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                     p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                     p_prod_grp_id => cr1.istln_prod_grp,
"
"                     p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                     p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                     p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                     p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                 p_oprn_ln_seq => cr1.istln_sou_oprn_seq,
"
"                 p_so_schld_desc => cr1.istln_so_schld_desc
"
"                        );
"
"
"
"              IF cr1.istln_vou_type <> 'SA' AND NOT(INSTR(cr1.istln_sf_code,'0') = 0 AND func_find_store_type(p_bu,cr1.istln_rcpt_store_id) NOT IN ('J','I') AND v_fpi_flag = 'N') THEN
"
"
"
"            proc_upd_sf_stocks(p_bu,
"
"                     cr1.istln_po_ord_no,
"
"                     cr1.istln_sou_proc_id,
"
"                     cr1.istln_sf_code,
"
"                     cr1.istln_rcpt_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_ls.isbd_lot_no,
"
"                     r_ls.isbd_serial_no,
"
"                     r_ls.isbd_expiry_date,
"
"                     r_ls.isbd_stk_trans_qty,
"
"                     0,
"
"                     cr1.istln_unit_cost,
"
"                     func_find_store_plnt(p_bu,cr1.istln_rcpt_store_id),
"
"                     r_ls.isbd_source_id,
"
"                     r_ls.isbd_source_type,
"
"                     cr1.istln_so_pfx,
"
"                     cr1.istln_so_no,
"
"                     cr1.istln_so_seq_no,
"
"                     cr1.istln_so_sub_seq_no,
"
"                     cr1.istln_ord_pfx,
"
"                     cr1.istln_ord_no,
"
"                     NULL,
"
"                     cr1.istln_doc_no,
"
"                     cr1.istln_seq_no,
"
"                     cr1.istln_seq_no,
"
"                     cr1.isthd_trans_date,
"
"                     cr1.isthd_year,
"
"                     cr1.isthd_period,
"
"                     cr1.prod_cost_method,
"
"                     'MR',
"
"                     'ICM',
"
"                     func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                     cr1.istln_reference,
"
"                     v_ref,
"
"                     cr1.istln_unit_cost,
"
"                     cr1.istln_unit_cost,
"
"                     cr1.istln_ord_type,
"
"                     p_user,
"
"                     p_type => cr1.istln_type,
"
"                     p_proj => cr1.istln_proj_id,
"
"                     p_task => cr1.istln_task_id,
"
"                       p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                       p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                       p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                       p_prod_grp_id => cr1.istln_prod_grp,
"
"                       p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                       p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                       p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                       p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                   p_oprn_ln_seq => cr1.istln_sou_oprn_seq,
"
"                   p_so_schld_desc => cr1.istln_so_schld_desc
"
"                    );
"
"
"
"      IF func_find_store_bin_flag(p_bu,cr1.istln_rcpt_store_id) = 'Y' THEN
"
"
"
"        v_trans_qty := (cr1.istln_trans_qty);
"
"
"
"        SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"          FROM inv_mat_transfer_bin
"
"         WHERE imtb_bu = p_bu
"
"           AND imtb_doc_no = cr1.istln_doc_no
"
"           AND imtb_seq_no = cr1.istln_seq_no
"
"           --AND (imtb_sys_ls_no = r_ls.isbd_sys_ls_no OR (imtb_sys_ls_no IS NULL AND r_ls.isbd_sys_ls_no IS NULL))
"
"           ;
"
"
"
"        IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"          Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"        END IF;
"
"
"
"        FOR r_bin IN (SELECT *
"
"                      FROM inv_mat_transfer_bin
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no
"
"               AND (imtb_sys_ls_no = r_ls.isbd_sys_ls_no OR (imtb_sys_ls_no IS NULL AND r_ls.isbd_sys_ls_no IS NULL))
"
"               )
"
"        LOOP
"
"          proc_upd_bin_stocks(p_bu,
"
"                        cr1.istln_rcpt_store_id,
"
"                        r_bin.imtb_prod_id,
"
"                        r_bin.imtb_prod_rev,
"
"                        r_bin.imtb_bin_id,
"
"                        r_bin.imtb_sys_ls_no,
"
"                        r_bin.imtb_lot_no,
"
"                        r_bin.imtb_ser_no,
"
"                        r_bin.imtb_source_type,
"
"                        r_bin.imtb_source_id,
"
"                        r_bin.imtb_stk_trans_qty,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        cr1.isthd_trans_date,
"
"                        'MR',
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        cr1.istln_seq_no,
"
"                        'ICM',
"
"                        p_user,
"
"                  p_crate_id => r_bin.imtb_crate_id,
"
"                  p_prod_ord_no => cr1.istln_po_ord_no,
"
"                  p_sf_code => cr1.istln_sf_code
"
"                     );
"
"        END LOOP;
"
"
"
"      END IF;
"
"
"
"          END IF;
"
"
"
"          FETCH c_ls INTO r_ls;
"
"          EXIT WHEN c_ls%NOTFOUND;
"
"
"
"        END LOOP;
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"    CLOSE c_ls;
"
"
"
"    IF cr1.istln_sf_code IS NOT NULL AND INSTR(cr1.istln_sf_code,'0') = 0 AND
"
"       func_find_store_type(p_bu,cr1.istln_rcpt_store_id) NOT IN ('J','I') AND
"
"       (v_fpi_flag = 'N' OR cr1.istln_vou_type = 'SA') THEN
"
"
"
"
"
"
"
"    IF cr1.istln_po_ord_no IS NOT NULL THEN
"
"
"
"     SELECT planctrl_cust_mat_cons_at INTO v_lab_cust_flag
"
"           FROM planning_control
"
"          WHERE planctrl_bu = p_bu
"
"            AND planctrl_plnt = cr1.isthd_plnt;
"
"
"
"      SELECT prohd_type,prohd_cust_id INTO v_po_ord_type,v_cust_id
"
"        FROM prod_order_hd_hist_view
"
"       WHERE prohd_bu = p_bu
"
"         AND prohd_ord_no = cr1.istln_po_ord_no;
"
"
"
"    END IF;
"
"
"
"        IF v_po_ord_type = 'O' AND v_lab_cust_flag = 'C' THEN
"
"
"
"      BEGIN
"
"        SELECT store_id INTO v_dflt_store_id
"
"              FROM stores
"
"             WHERE store_bu = p_bu
"
"           AND store_plnt = cr1.isthd_plnt
"
"           AND store_plnt_loc_id = cr1.isthd_plnt_loc_id
"
"           AND store_inv_id = v_cust_id--cr1.isthd_cust_id
"
"           AND store_physical = 'C';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       Raise_Application_Error(-20999,'HRM'||'~'||'Customer W/H not found.');
"
"      END;
"
"
"
"    ELSE
"
"      BEGIN
"
"      SELECT ppl_dflt_store_id
"
"        INTO v_dflt_store_id
"
"        FROM prod_plants_loc
"
"       WHERE ppl_bu = p_bu
"
"         AND ppl_plnt = cr1.isthd_plnt
"
"         AND ppl_plnt_loc_id = cr1.isthd_plnt_loc_id
"
"             AND ppl_prod_id = cr1.istln_prod_id
"
"             AND ppl_prod_rev = cr1.istln_prod_rev;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"         v_dflt_store_id := cr1.istln_rcpt_store_id;
"
"      END;
"
"
"
"    END IF;
"
"      v_rcpt_unitcost := cr1.istln_unit_cost;
"
"
"
"      proc_upd_stocks(p_bu,
"
"                          v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                          NULL,
"
"                          cr1.istln_prod_id,
"
"                          cr1.istln_prod_rev,
"
"                          0,
"
"                          0,
"
"                          cr1.istln_stk_trans_qty,
"
"                          0,
"
"                          0,
"
"                          v_rcpt_unitcost,
"
"                          v_rcpt_unitcost,
"
"                          0,
"
"                          'N',
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          cr1.istln_seq_no,
"
"                          0,
"
"                          NULL,
"
"                          cr1.istln_doc_no,
"
"                          NULL,
"
"                          cr1.istln_doc_no,
"
"                          NULL,
"
"                          cr1.isthd_year,
"
"                          cr1.isthd_period,
"
"                          cr1.isthd_trans_date,
"
"                          NULL,
"
"                          'ICM',
"
"                          'MR',
"
"                          NULL,
"
"                          p_user,
"
"                          SYSDATE,
"
"                          NULL,
"
"                          cr1.istln_prod_cls,
"
"                          cr1.istln_ord_no,
"
"                          cr1.istln_ord_type,
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          p_ref1 => cr1.istln_reference,
"
"                          p_ref2 => v_ref,
"
"                  p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"              p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"              p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"              p_prod_grp_id => cr1.istln_prod_grp,
"
"              p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"              p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                          p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                          p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                         );
"
"
"
"          IF cr1.prod_indicator = 'I' THEN
"
"
"
"        proc_upd_so_stocks(p_bu,
"
"                         v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                         cr1.istln_prod_id,
"
"                         cr1.istln_prod_rev,
"
"                         cr1.istln_stk_trans_qty,
"
"                         0,
"
"                   v_rcpt_unitcost,
"
"                         cr1.istln_so_pfx,
"
"                         cr1.istln_so_no,
"
"                         cr1.istln_so_seq_no,
"
"                         NULL,
"
"                         cr1.isthd_trans_date,
"
"                         'MR',
"
"                         NULL,
"
"                         cr1.istln_doc_no,
"
"                         NULL,
"
"                         NULL,
"
"                         cr1.istln_doc_no,
"
"                         cr1.istln_seq_no,
"
"                         'MR',
"
"                         'ICM',
"
"                         cr1.istln_vou_type||'/'||cr1.istln_vou_appl,
"
"                         cr1.istln_vou_type||'/'||cr1.istln_vou_appl,
"
"                         p_user,
"
"                         cr1.istln_type,
"
"                         cr1.istln_proj_id,
"
"                         cr1.istln_task_id,
"
"                   p_so_prj_schld_desc => cr1.istln_so_schld_desc
"
"                        );
"
"
"
"      END IF;
"
"
"
"      IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt IN ('N','S') THEN
"
"
"
"        proc_upd_stock_batches(p_bu,
"
"                       v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                       cr1.istln_prod_id,
"
"                       cr1.istln_prod_rev,
"
"                       NULL,
"
"                       cr1.istln_stk_trans_qty,
"
"                       0,
"
"                       0,
"
"                       0,
"
"                       v_rcpt_unitcost,
"
"                       v_rcpt_unitcost,
"
"                       0,
"
"                       0,
"
"                       0,
"
"                       0    ,
"
"                       'N',
"
"                       cr1.isthd_trans_date,
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       'MR',
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       NULL,
"
"                       cr1.istln_prod_cls,
"
"                       'MR',
"
"                       'ICM',
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       p_user,
"
"                   p_ref1 => cr1.istln_reference,
"
"                   p_ref2 => v_ref,
"
"                   p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                   p_prod_subcls => cr1.istln_prod_subcls,
"
"                   p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                   p_prod_grp => cr1.istln_prod_grp,
"
"                   p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                   p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                   p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                   p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                      );
"
"
"
"          END IF;
"
"
"
"      IF cr1.prod_ser_lot_opt = 'L' THEN
"
"
"
"            FOR r_ls IN c_ls(cr1.istln_seq_no)
"
"        LOOP
"
"
"
"          IF cr1.istln_vou_type = 'SFR' AND cr1.prod_ser_lot_opt = 'L' THEN
"
"
"
"            v_new_sys_ls_no := NULL;
"
"
"
"            proc_lot_ser_operation(p_bu,
"
"                                       v_dflt_store_id,--cr1.isthd_issueto_id,
"
"                                       cr1.istln_prod_id,
"
"                                       cr1.istln_prod_rev,
"
"                                       'L',
"
"                                       v_new_sys_ls_no,
"
"                                       r_ls.isbd_lot_no,
"
"                                       r_ls.isbd_serial_no,
"
"                                       'S',
"
"                                       r_ls.isbd_source_id,
"
"                                       TRUNC(cr1.isthd_trans_date),
"
"                                       NULL,
"
"                                       r_ls.isbd_stk_trans_qty,
"
"                                       v_rcpt_unitcost,
"
"                                       1,
"
"                                       'G',
"
"                                       TRUNC(cr1.isthd_trans_date),
"
"                                       'SFR',
"
"                                       NULL,
"
"                                       cr1.istln_doc_no,
"
"                                       cr1.istln_seq_no,
"
"                                       cr1.istln_seq_no,
"
"                                       'ICM',
"
"                                       'Material Receipt',
"
"                                       'Material Receipt - '||cr1.istln_doc_no,
"
"                                       p_user,
"
"                                       p_test_no => r_ls.isbd_lot_no,
"
"                                       p_heat_no => r_ls.isbd_lot_no,
"
"                                       p_org_lot_no => r_ls.isbd_lot_no,
"
"                       p_so_no => cr1.istln_so_no
"
"                                      );
"
"          ELSE
"
"            v_new_sys_ls_no := r_ls.isbd_sys_ls_no;
"
"          END IF;
"
"
"
"          UPDATE inv_stock_batch_details
"
"                 SET isbd_new_sys_ls_no = v_new_sys_ls_no
"
"               WHERE isbd_bu = p_bu
"
"                 AND isbd_issue_doc_no = cr1.istln_doc_no
"
"                 AND isbd_seq_no = cr1.istln_seq_no
"
"                 AND isbd_sys_ls_no = r_ls.isbd_sys_ls_no
"
"                 AND (isbd_lot_no = r_ls.isbd_lot_no OR r_ls.isbd_lot_no IS NULL);
"
"
"
"          proc_upd_lot_ser_stocks(p_bu,
"
"                                  v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                                  cr1.istln_prod_id,
"
"                                  cr1.istln_prod_rev,
"
"                                  v_new_sys_ls_no,
"
"                                  r_ls.isbd_stk_trans_qty,
"
"                                  0,
"
"                                  0,
"
"                                  v_rcpt_unitcost,
"
"                                  cr1.prod_ser_lot_opt,
"
"                                  r_ls.isbd_lot_no,
"
"                                  r_ls.isbd_serial_no,
"
"                                  r_ls.isbd_source_type,
"
"                                  r_ls.isbd_source_id,
"
"                                  r_ls.isbd_expiry_date,
"
"                                  cr1.isthd_trans_date,
"
"                                  'MR',
"
"                                  NULL,
"
"                                  cr1.istln_doc_no,
"
"                                  cr1.istln_seq_no,
"
"                                  'ICM',
"
"                                  cr1.istln_reference,
"
"                                  v_ref,
"
"                                  p_user,
"
"                      p_so_pfx => cr1.istln_so_pfx,
"
"                                      p_so_no => cr1.istln_so_no,
"
"                                      p_so_seq_no => cr1.istln_so_seq_no,
"
"                                      p_so_ref => cr1.istln_so_schld_desc,
"
"                      p_batch_no => r_ls.isbd_batch_no
"
"                                 );
"
"
"
"          IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt = 'L' THEN
"
"
"
"            proc_upd_stock_batches(p_bu,
"
"                           v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                           cr1.istln_prod_id,
"
"                           cr1.istln_prod_rev,
"
"                           NULL,
"
"                           r_ls.isbd_stk_trans_qty,
"
"                           0,
"
"                           0,
"
"                           0,
"
"                           v_rcpt_unitcost,
"
"                           v_rcpt_unitcost,
"
"                           0,
"
"                           0,
"
"                           0,
"
"                           0    ,
"
"                           'N',
"
"                           cr1.isthd_trans_date,
"
"                           NULL,
"
"                           cr1.istln_doc_no,
"
"                           cr1.istln_seq_no,
"
"                           'MR',
"
"                           NULL,
"
"                           cr1.istln_doc_no,
"
"                           cr1.istln_seq_no,
"
"                           NULL,
"
"                           cr1.istln_prod_cls,
"
"                           'MR',
"
"                           'ICM',
"
"                           NULL,
"
"                           NULL,
"
"                           NULL,
"
"                           NULL,
"
"                           p_user,
"
"                       p_ref1 => cr1.istln_reference,
"
"                       p_ref2 => v_ref,
"
"                       p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                       p_prod_subcls => cr1.istln_prod_subcls,
"
"                       p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                       p_prod_grp => cr1.istln_prod_grp,
"
"                       p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                       p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                       p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                       p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                       p_sys_ls_no => v_new_sys_ls_no
"
"                          );
"
"
"
"        IF cr1.prod_cb_level = 'L' THEN
"
"
"
"              SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"                FROM stocks_batches
"
"               WHERE sb_bu = p_bu
"
"                 AND sb_store_id = v_dflt_store_id--cr1.istln_rcpt_store_id
"
"                 AND sb_prod_id = cr1.istln_prod_id
"
"                 AND sb_prod_rev = cr1.istln_prod_rev
"
"                 AND sb_po_no = cr1.istln_doc_no
"
"                 AND sb_receipt_seq_no = cr1.istln_seq_no
"
"             AND sb_sys_ls_no = v_new_sys_ls_no;
"
"
"
"              proc_upd_ls_stk_batch(p_bu,
"
"                                    v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                        cr1.istln_prod_id,
"
"                        cr1.istln_prod_rev,
"
"                        v_new_sys_ls_no,
"
"                        v_stk_batch_no,
"
"                        r_ls.isbd_stk_trans_qty,
"
"                        p_user
"
"                       );
"
"
"
"            END IF;
"
"
"
"          END IF;
"
"
"
"        END LOOP c_ls;
"
"      END IF;
"
"
"
"      IF cr1.prod_ser_lot_opt = 'S' THEN
"
"
"
"        UPDATE inv_stock_batch_details
"
"               SET isbd_new_sys_ls_no = isbd_sys_ls_no
"
"             WHERE isbd_bu = p_bu
"
"               AND isbd_issue_doc_no = cr1.istln_doc_no
"
"               AND isbd_seq_no = cr1.istln_seq_no
"
"           AND isbd_new_sys_ls_no IS NULL;
"
"
"
"        SELECT *
"
"          BULK COLLECT INTO r_ls_blk
"
"          FROM inv_stock_batch_details
"
"         WHERE isbd_bu = p_bu
"
"           AND isbd_issue_doc_no = p_doc_no
"
"           AND isbd_seq_no = cr1.istln_seq_no
"
"         ORDER BY isbd_sub_seq_no;
"
"
"
"        FORALL i IN 1..r_ls_blk.COUNT
"
"        DELETE FROM lot_ser_stocks
"
"         WHERE lss_bu = p_bu
"
"           AND lss_store_id = v_dflt_store_id--cr1.istln_rcpt_store_id
"
"           AND lss_prod_id = cr1.istln_prod_id
"
"           AND lss_prod_rev = cr1.istln_prod_rev
"
"           AND lss_qty_hand = 0
"
"           AND lss_qty_transit_in = 0
"
"           AND lss_ser_no = r_ls_blk(i).isbd_serial_no;
"
"
"
"        FORALL i IN 1..r_ls_blk.COUNT
"
"        INSERT INTO lot_ser_stocks(lss_bu,
"
"                               lss_store_id,
"
"                               lss_prod_id,
"
"                               lss_prod_rev,
"
"                               lss_sys_ls_no,
"
"                               lss_qty_hand,
"
"                               lss_qty_allocated,
"
"                               lss_qty_transit_in,
"
"                               lss_expiry_date,
"
"                               lss_seq_no,
"
"                               lss_prod_type,
"
"                               lss_lot_no,
"
"                               lss_ser_no,
"
"                               lss_source_type,
"
"                               lss_source_id,
"
"                               lss_vou_date,
"
"                               lss_vou_type,
"
"                               lss_vou_pfx,
"
"                               lss_vou_no,
"
"                               lss_vou_line_no,
"
"                               lss_unit_cost,
"
"                               lss_upd_vou_date,
"
"                               lss_upd_vou_type,
"
"                               lss_upd_vou_pfx,
"
"                               lss_upd_vou_no,
"
"                               lss_upd_vou_line_no,
"
"                               lss_upd_unit_cost,
"
"                               lss_appl,
"
"                               lss_ref1,
"
"                               lss_ref2,
"
"                               lss_cre_by,
"
"                           lss_cre_emp_id,
"
"                           lss_cre_ip_addr,
"
"                           lss_cre_os_user,
"
"                               lss_cre_date,
"
"                           lss_so_pfx,
"
"                           lss_so_no,
"
"                           lss_so_seq_no,
"
"                           lss_so_ref,
"
"                           lss_run_seq_no
"
"                              )
"
"                        VALUES(p_bu,
"
"                               v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                               cr1.istln_prod_id,
"
"                               cr1.istln_prod_rev,
"
"                               r_ls_blk(i).isbd_sys_ls_no,
"
"                               r_ls_blk(i).isbd_stk_trans_qty,
"
"                               0,
"
"                               0,
"
"                               r_ls_blk(i).isbd_expiry_date,
"
"                               func_find_ls_seq_nextno(p_bu,cr1.istln_rcpt_store_id,cr1.istln_prod_id,cr1.istln_prod_rev,p_user),
"
"                           'S',
"
"                               r_ls_blk(i).isbd_lot_no,
"
"                               r_ls_blk(i).isbd_serial_no,
"
"                               r_ls_blk(i).isbd_source_type,
"
"                               r_ls_blk(i).isbd_source_id,
"
"                               TRUNC(cr1.isthd_trans_date),
"
"                               'MR',
"
"                               NULL,
"
"                               cr1.istln_doc_no,
"
"                               cr1.istln_seq_no,
"
"                               NVL(v_rcpt_unitcost,0),
"
"                               TRUNC(cr1.isthd_trans_date),
"
"                               'MR',
"
"                               NULL,
"
"                               cr1.istln_doc_no,
"
"                               cr1.istln_seq_no,
"
"                               NVL(v_rcpt_unitcost,0),
"
"                               'ICM',
"
"                               cr1.istln_reference,
"
"                               v_ref,
"
"                               p_user,
"
"                           p_user_emp,
"
"                           v_ip_addr,
"
"                           v_os_user,
"
"                               SYSDATE,
"
"                           cr1.istln_so_pfx,
"
"                           cr1.istln_so_no,
"
"                           cr1.istln_so_seq_no,
"
"                           cr1.istln_so_schld_desc,
"
"                           lss_run_seq.NEXTVAL
"
"                              );
"
"     --Raise_Application_Error(-20999,'Tescom-Start'||cr1.istln_vou_type);
"
"      END IF;
"
"
"
"      IF func_find_store_bin_flag(p_bu,v_dflt_store_id/*cr1.istln_rcpt_store_id*/) = 'Y'   THEN
"
"
"
"        v_trans_qty := (cr1.istln_trans_qty);
"
"
"
"        SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"          FROM inv_mat_transfer_bin
"
"         WHERE imtb_bu = p_bu
"
"           AND imtb_doc_no = cr1.istln_doc_no
"
"           AND imtb_seq_no = cr1.istln_seq_no;
"
"
"
"        IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"          Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"        END IF;
"
"
"
"      FOR r_bin IN (SELECT DISTINCT imtb_sys_ls_no,imtb_lot_no
"
"                      FROM inv_mat_transfer_bin
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no)
"
"      LOOP
"
"
"
"    IF cr1.prod_ser_lot_opt NOT IN ('N','S') THEN
"
"
"
"        BEGIN
"
"          SELECT isbd_new_sys_ls_no INTO v_lot_sys_ls_no
"
"            FROM inv_stock_batch_details
"
"           WHERE isbd_bu = p_bu
"
"                 AND isbd_issue_doc_no = cr1.istln_doc_no
"
"                 AND isbd_seq_no = cr1.istln_seq_no
"
"                 AND isbd_sys_ls_no = r_bin.imtb_sys_ls_no
"
"                 AND isbd_lot_no = r_bin.imtb_lot_no;
"
"        EXCEPTION WHEN OTHERS THEN
"
"            Raise_Application_error(-20999,'HRM '||r_bin.imtb_sys_ls_no||'='||r_bin.imtb_lot_no||'='||v_lot_sys_ls_no);
"
"        END;
"
"
"
"              IF v_lot_sys_ls_no IS NULL THEN
"
"            Raise_Application_error(-20999,'HRM '||r_bin.imtb_sys_ls_no);
"
"          END IF;
"
"
"
"              UPDATE inv_mat_transfer_bin
"
"                 SET imtb_sys_ls_no = v_lot_sys_ls_no
"
"           WHERE imtb_bu = p_bu
"
"             AND imtb_doc_no = cr1.istln_doc_no
"
"             AND imtb_seq_no = cr1.istln_seq_no
"
"             AND imtb_sys_ls_no = r_bin.imtb_sys_ls_no;
"
"
"
"        END IF;
"
"
"
"        END LOOP;
"
"
"
"        FOR r_bin IN (SELECT *
"
"                      FROM inv_mat_transfer_bin
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no)
"
"        LOOP
"
"          proc_upd_bin_stocks(p_bu,
"
"                        v_dflt_store_id,--cr1.istln_rcpt_store_id,
"
"                        r_bin.imtb_prod_id,
"
"                        r_bin.imtb_prod_rev,
"
"                        r_bin.imtb_bin_id,
"
"                        r_bin.imtb_sys_ls_no,
"
"                        r_bin.imtb_lot_no,
"
"                        r_bin.imtb_ser_no,
"
"                        r_bin.imtb_source_type,
"
"                        r_bin.imtb_source_id,
"
"                        r_bin.imtb_stk_trans_qty,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        cr1.isthd_trans_date,
"
"                        'MR',
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        cr1.istln_seq_no,
"
"                        'ICM',
"
"                        p_user,
"
"                  p_crate_id => r_bin.imtb_crate_id
"
"                     );
"
"        END LOOP;
"
"
"
"      END IF;
"
"
"
"    END IF;
"
"
"
"      END IF;
"
"
"
"     UPDATE inv_stock_trans_ln
"
"         SET istln_status = 'I',
"
"         istln_upd_by = p_user,
"
"         istln_upd_date = SYSDATE
"
"       WHERE istln_bu = p_bu
"
"         AND istln_doc_no = p_doc_no
"
"     AND istln_seq_no = cr1.istln_seq_no;
"
"
"
"      IF cr1.istln_vou_type = 'GRN' THEN
"
"
"
"        UPDATE pur_ord_receipt_ln
"
"       SET porl_accepted_qty = CASE WHEN cr1.isthd_vou_oper = 'A' THEN cr1.istln_trans_qty ELSE 0 END,
"
"           porl_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN cr1.istln_trans_qty ELSE 0 END,
"
"           porl_rejected_qty = CASE WHEN cr1.isthd_vou_oper = 'R' THEN cr1.istln_trans_qty ELSE 0 END,
"
"           porl_stk_accepted_qty = CASE WHEN cr1.isthd_vou_oper = 'A' THEN cr1.istln_stk_trans_qty ELSE 0 END,
"
"           porl_stk_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN cr1.istln_stk_trans_qty ELSE 0 END,
"
"           porl_stk_rejected_qty = CASE WHEN cr1.isthd_vou_oper = 'R' THEN cr1.istln_stk_trans_qty ELSE 0 END
"
"     WHERE porl_bu = p_bu
"
"       AND porl_receipt_no = cr1.istln_vou_no
"
"       AND porl_seq_no = cr1.istln_vou_seq_no;
"
"
"
"    UPDATE pur_rcpt_lot_serial
"
"       SET prcls_qty_accepted = 0,
"
"           prcls_stk_acpt_qty = 0,
"
"           prcls_aod_qty = 0,
"
"           prcls_stk_aod_qty = 0,
"
"           prcls_qty_rejected = 0,
"
"           prcls_stk_rej_qty = 0
"
"     WHERE prcls_bu = p_bu
"
"           AND prcls_doc_no = cr1.istln_vou_no
"
"           AND prcls_doc_seq_no = cr1.istln_vou_seq_no;
"
"
"
"    IF cr1.prod_ser_lot_opt = 'N' THEN
"
"   -- Raise_Application_error(-20999,'HRM');
"
"      UPDATE pur_rcpt_lot_serial
"
"         SET prcls_qty_accepted = CASE WHEN cr1.isthd_vou_oper = 'A' THEN cr1.istln_trans_qty ELSE 0 END,
"
"             prcls_stk_acpt_qty = CASE WHEN cr1.isthd_vou_oper = 'A' THEN cr1.istln_stk_trans_qty ELSE 0 END,
"
"         prcls_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN cr1.istln_trans_qty ELSE 0 END,
"
"         prcls_stk_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN cr1.istln_stk_trans_qty ELSE 0 END,
"
"         prcls_qty_rejected = CASE WHEN cr1.isthd_vou_oper = 'R' THEN cr1.istln_trans_qty ELSE 0 END,
"
"         prcls_stk_rej_qty = CASE WHEN cr1.isthd_vou_oper = 'R' THEN cr1.istln_stk_trans_qty ELSE 0 END
"
"           WHERE prcls_bu = p_bu
"
"             AND prcls_doc_no = cr1.istln_vou_no
"
"             AND prcls_doc_seq_no = cr1.istln_vou_seq_no;
"
"    ELSE
"
"
"
"        SELECT *
"
"          BULK COLLECT INTO r_ls_blk
"
"          FROM inv_stock_batch_details
"
"         WHERE isbd_bu = p_bu
"
"           AND isbd_issue_doc_no = p_doc_no
"
"           AND isbd_seq_no = cr1.istln_seq_no
"
"         ORDER BY isbd_sub_seq_no;
"
"
"
"      FORALL i IN 1..r_ls_blk.COUNT
"
"          UPDATE pur_rcpt_lot_serial
"
"             SET prcls_qty_accepted = CASE WHEN cr1.isthd_vou_oper = 'A' THEN r_ls_blk(i).isbd_trans_qty ELSE 0 END,
"
"             prcls_stk_acpt_qty = CASE WHEN cr1.isthd_vou_oper = 'A' THEN r_ls_blk(i).isbd_stk_trans_qty ELSE 0 END,
"
"         prcls_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN r_ls_blk(i).isbd_trans_qty ELSE 0 END,
"
"         prcls_stk_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN r_ls_blk(i).isbd_stk_trans_qty ELSE 0 END,
"
"         prcls_qty_rejected = CASE WHEN cr1.isthd_vou_oper = 'R' THEN r_ls_blk(i).isbd_trans_qty ELSE 0 END,
"
"         prcls_stk_rej_qty = CASE WHEN cr1.isthd_vou_oper = 'R' THEN r_ls_blk(i).isbd_stk_trans_qty ELSE 0 END
"
"           WHERE prcls_bu = p_bu
"
"             AND prcls_doc_no = cr1.istln_vou_no
"
"             AND prcls_doc_seq_no = cr1.istln_vou_seq_no
"
"         AND prcls_sys_ls_no = r_ls_blk(i).isbd_sys_ls_no;
"
"
"
"      /*FOR r_ls IN (SELECT *
"
"                     FROM inv_stock_batch_details
"
"            WHERE isbd_bu = p_bu
"
"                          AND isbd_issue_doc_no = cr1.istln_doc_no
"
"                          AND isbd_seq_no = cr1.istln_seq_no)
"
"      LOOP
"
"        UPDATE pur_rcpt_lot_serial
"
"           SET prcls_qty_accepted = CASE WHEN cr1.isthd_vou_oper = 'A' THEN r_ls.isbd_trans_qty ELSE 0 END,
"
"               prcls_stk_acpt_qty = CASE WHEN cr1.isthd_vou_oper = 'A' THEN r_ls.isbd_stk_trans_qty ELSE 0 END,
"
"           prcls_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN r_ls.isbd_trans_qty ELSE 0 END,
"
"           prcls_stk_aod_qty = CASE WHEN cr1.isthd_vou_oper = 'D' THEN r_ls.isbd_stk_trans_qty ELSE 0 END,
"
"           prcls_qty_rejected = CASE WHEN cr1.isthd_vou_oper = 'R' THEN r_ls.isbd_trans_qty ELSE 0 END,
"
"           prcls_stk_rej_qty = CASE WHEN cr1.isthd_vou_oper = 'R' THEN r_ls.isbd_stk_trans_qty ELSE 0 END
"
"             WHERE prcls_bu = p_bu
"
"               AND prcls_doc_no = cr1.istln_vou_no
"
"               AND prcls_doc_seq_no = cr1.istln_vou_seq_no
"
"           AND prcls_sys_ls_no = r_ls.isbd_sys_ls_no;
"
"      END LOOP;*/
"
"
"
"
"
"    END IF;
"
"
"
"        proc_recv_grn_doc(p_bu,cr1.istln_vou_no,cr1.istln_vou_seq_no,p_user,1,cr1.isthd_vou_oper);
"
"    --Raise_Application_Error(-20999,'Tescom-Start'||cr1.isthd_vou_oper);
"
"    IF cr1.isthd_vou_oper = 'R' THEN
"
"
"
"      BEGIN
"
"      SELECT tqln_qc_no INTO v_qc_no
"
"        FROM tqm_qc_ln
"
"       WHERE tqln_bu = p_bu
"
"         AND tqln_vou_no = cr1.istln_vou_no
"
"         AND tqln_vou_line_no = cr1.istln_vou_seq_no
"
"         AND tqln_status = 'A'
"
"         AND ROWNUM = 1;
"
"    EXCEPTION WHEN  NO_DATA_FOUND THEN
"
"          v_qc_no := NULL;
"
"      END;
"
"
"
"          proc_cre_rework_rej_comp(p_bu,cr1.isthd_plnt,v_qc_no,cr1.isthd_trans_date,p_user,v_rwk_doc_no,v_mi_qc_no);
"
"    END IF;
"
"
"
"      ELSIF cr1.istln_vou_type = 'ME' THEN
"
"
"
"        proc_recv_mat_rtn_doc(p_bu,cr1.isthd_plnt,cr1.istln_vou_no,cr1.istln_vou_seq_no,p_user,cr1.isthd_vou_oper);
"
"
"
"      ELSIF cr1.istln_vou_type = 'SFR' THEN
"
"
"
"        proc_upd_mfg_proc_status(p_bu,cr1.isthd_plnt,cr1.istln_po_ord_no,cr1.istln_vou_no,cr1.istln_doc_no,cr1.istln_seq_no,p_user,1);
"
"
"
"    proc_prod_rwk_auto_comp(p_bu,cr1.isthd_plnt,cr1.istln_vou_no,cr1.istln_doc_no,p_user);
"
"
"
"    IF cr1.isthd_vou_oper = 'R' THEN
"
"
"
"      BEGIN
"
"      SELECT tqln_qc_no
"
"        INTO v_qc_no
"
"        FROM tqm_qc_ln
"
"       WHERE tqln_bu = p_bu
"
"         AND tqln_vou_no = cr1.istln_vou_no
"
"         AND tqln_vou_line_no = cr1.istln_vou_seq_no
"
"         AND tqln_status ='A'
"
"         AND ROWNUM = 1;
"
"      END;
"
"
"
"           proc_cre_rework_rej_comp(p_bu,cr1.isthd_plnt,v_qc_no,cr1.isthd_trans_date,p_user,v_rwk_doc_no,v_mi_qc_no);
"
"    END IF;
"
"
"
"      ELSIF cr1.istln_vou_type = 'SR'  THEN
"
"
"
"    proc_sales_rtn_auto_comp(p_bu,cr1.isthd_plnt,cr1.istln_vou_no,cr1.istln_doc_no,p_user);
"
"
"
"      ELSIF cr1.istln_vou_type = 'RR'  THEN
"
"
"
"        proc_upd_rwk_status_frm_mrv(p_bu,cr1.isthd_plnt,cr1.istln_po_ord_no,cr1.istln_vou_no,cr1.istln_doc_no,p_user,1,cr1.istln_rwk_vou_type,cr1.istln_seq_no);
"
"
"
"      ELSIF cr1.istln_vou_type = 'CMR'  THEN
"
"    -- Raise_Application_Error(-20999,'HRM'||'-'||cr1.isthd_plnt||'-'||cr1.istln_vou_no||'-'||cr1.istln_vou_seq_no||'-'||cr1.isthd_vou_oper);
"
"        proc_recv_cust_mat_rcpt(p_bu,cr1.isthd_plnt,cr1.istln_vou_no,cr1.istln_vou_seq_no,p_user,cr1.isthd_vou_oper);
"
"
"
"      ELSIF cr1.istln_vou_type = 'PD'  THEN
"
"
"
"        UPDATE sales_invoices_hd
"
"           SET sihd_status = 'D'
"
"         WHERE sihd_bu = p_bu
"
"           AND sihd_plant = cr1.isthd_plnt
"
"           AND sihd_doc_no = cr1.istln_vou_no
"
"           AND NOT EXISTS (SELECT 1
"
"                         FROM sales_invoices_ln
"
"                        WHERE siln_bu = sihd_bu
"
"                          AND siln_plnt = sihd_plant
"
"                          AND siln_doc_no = sihd_doc_no
"
"                          AND siln_matl_type = 'P'
"
"                          AND siln_inv_qty <> siln_pre_disp_qty);
"
"
"
"      ELSIF cr1.istln_vou_type = 'SA' THEN
"
"
"
"        UPDATE prod_order_hd
"
"       SET prohd_received_qty = prohd_received_qty + cr1.istln_trans_qty
"
"     WHERE prohd_bu = p_bu
"
"       AND prohd_plnt = cr1.isthd_plnt
"
"       AND prohd_ord_no = cr1.istln_po_ord_no;
"
"
"
"      END IF;
"
"
"
"    END LOOP c1;
"
"
"
"    /* Field Visit Receipt - Material Request For CSR Emp. */
"
"    proc_cre_mr_frm_rcpt_fr_emp(p_bu,p_doc_no,p_user,1,v_mr_no);
"
"
"
"    UPDATE inv_stock_trans_hd
"
"       SET isthd_status = 'I',
"
"       isthd_upd_by = p_user,
"
"       isthd_upd_date = SYSDATE
"
"     WHERE isthd_bu = p_bu
"
"       AND isthd_doc_no = p_doc_no;
"
"
"
"    proc_cre_stk_adj_frm_mrv(p_bu,p_doc_no,p_user);
"
"
"
"    pkg_mat_iss.proc_cre_miv_doc_frm_mrv(p_bu,p_doc_no,p_user,p_user_emp,1,v_fpi_mi_doc_no);
"
"
"
"    --Raise_Application_Error(-20999,'Tescom-End');
"
"
"
"    BEGIN
"
"      FOR r_mi IN (SELECT *
"
"                     FROM inv_stock_trans_hd
"
"                    WHERE isthd_bu = p_bu
"
"              AND isthd_doc_oper = 'R'
"
"                      AND isthd_status IN ('I','C')
"
"              AND isthd_doc_no = p_doc_no)
"
"      LOOP
"
"
"
"      IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         r_mi.isthd_plnt,
"
"                 r_mi.isthd_trans_date,
"
"                 r_mi.isthd_year,
"
"                 r_mi.isthd_period,
"
"                 NULL,
"
"                 p_doc_no,
"
"                 NULL,
"
"                 'ICM',
"
"                 p_user,
"
"                 1,
"
"                 'MRV '||p_doc_no
"
"                );
"
"      END IF;
"
"        pkg_inv_hist.proc_ins_mi_hist(r_mi.isthd_bu,r_mi.isthd_doc_no);
"
"      END LOOP;
"
"
"
"    EXCEPTION
"
"      WHEN OTHERS THEN NULL;
"
"    END;
"
"
"
"  END proc_recv_rcpt_frm_mat_rcpt;
"
"
"
"
"
"  PROCEDURE proc_rev_rcpt_frm_mat_rcpt(p_bu        IN    business_units.bu_id%TYPE,
"
"                                       p_doc_no        IN    inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                       p_user        IN    appl_users.appluser_id%TYPE,
"
"                       p_user_emp    IN    employees.emp_emp_id%TYPE
"
"                      )
"
"  AS
"
"
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM inv_stock_trans_hd,inv_stock_trans_ln,products
"
"   WHERE isthd_bu = istln_bu
"
"     AND isthd_doc_no = istln_doc_no
"
"     AND istln_bu = prod_bu
"
"     AND istln_prod_id = prod_id
"
"     AND istln_prod_rev = prod_rev
"
"     AND isthd_bu = p_bu
"
"     AND isthd_doc_no = p_doc_no
"
"     AND isthd_status = 'I'
"
"   ORDER BY istln_seq_no;
"
"
"
"  CURSOR c_ls(c_seq_no    inv_stock_trans_ln.istln_seq_no%TYPE) IS
"
"  SELECT *
"
"    FROM inv_stock_batch_details
"
"   WHERE isbd_bu = p_bu
"
"     AND isbd_issue_doc_no = p_doc_no
"
"     AND isbd_seq_no = c_seq_no
"
"   ORDER BY isbd_sub_seq_no;
"
"
"
"  v_ref            VARCHAR2(100);
"
"  v_fpi_flag    prod_plants.prodplnt_fpi_flag%TYPE;
"
"  v_frm_plnt_cmt_doc_no    VARCHAR2(15);
"
"  v_frm_store_plnt    VARCHAR2(10);
"
"  v_frm_store_type    VARCHAR2(1);
"
"  v_to_store_plnt    VARCHAR2(10);
"
"  v_to_store_type    VARCHAR2(1);
"
"  v_doc_no        VARCHAR2(15);
"
"  v_sys_ls_no             NUMBER(15);
"
"  v_source_id             VARCHAR2(10);
"
"  v_source_type           VARCHAR2(1);
"
"  v_cmt_status        VARCHAR2(1);
"
"  v_sou_plnt        VARCHAR2(10);
"
"  v_trans_type         VARCHAR2(2);
"
"  v_mi_doc_no        VARCHAR2(20);
"
"  v_mi_seq_no        NUMBER;
"
"
"
"  r_ls        c_ls%ROWTYPE;
"
"
"
"  v_rcpt_unitcost    NUMBER(17,5);
"
"  v_trans_qty        NUMBER(12,3);
"
"  v_bin_trans_qty    NUMBER(12,3);
"
"  v_mr_no        VARCHAR2(30);
"
"  v_store_id        VARCHAR2(30);
"
"
"
"  v_new_sys_ls_no    prod_lot_ser_nos.plsn_sys_ls_no%TYPE;
"
"
"
"  v_stk_batch_no    stocks_batches.sb_batch_id%TYPE;
"
"
"
"  v_lot_sys_ls_no    NUMBER;
"
"  v_fpi_mi_doc_no    VARCHAR2(100);
"
"
"
"  BEGIN
"
"
"
"    pkg_inv_hist.proc_rev_mi_hist(p_bu,p_doc_no);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      --Raise_Application_Error(-20999,'HRM ');
"
"
"
"      v_ref := ('MRV#('||cr1.istln_doc_no||'/'||cr1.istln_seq_no||') DC#('||cr1.istln_dc_no||'/'||cr1.istln_dc_seq_no||')');
"
"
"
"      IF cr1.istln_mat_type = 'S' THEN
"
"
"
"    v_rcpt_unitcost := cr1.istln_unit_cost;
"
"
"
"        proc_upd_stocks(p_bu,
"
"            cr1.istln_store_id,
"
"                        NULL,
"
"                        cr1.istln_prod_id,
"
"                        cr1.istln_prod_rev,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        v_rcpt_unitcost,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        cr1.istln_seq_no,
"
"                        0,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.isthd_year,
"
"                        cr1.isthd_period,
"
"                        cr1.isthd_trans_date,
"
"                        NULL,
"
"                        'ICM',
"
"                        'MR',
"
"                        NULL,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        NULL,
"
"                        cr1.istln_prod_cls,
"
"                        cr1.istln_ord_no,
"
"                        cr1.istln_ord_type,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        cr1.istln_mfg_date,
"
"                        cr1.istln_expiry_date,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        0,
"
"                        cr1.istln_reference,
"
"                        v_ref,
"
"                        cr1.istln_stk_trans_qty,
"
"                        0,
"
"                        NULL,
"
"                        'S',
"
"                        p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"            p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"            p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"            p_prod_grp_id => cr1.istln_prod_grp,
"
"            p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"            p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                        p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                       );
"
"
"
"        IF cr1.prod_indicator = 'I' THEN
"
"
"
"          proc_upd_so_stocks(p_bu,
"
"                 cr1.istln_store_id,
"
"                 cr1.istln_prod_id,
"
"                 cr1.istln_prod_rev,
"
"                 0,
"
"                 0,
"
"                 v_rcpt_unitcost,
"
"                 cr1.istln_so_pfx,
"
"                 cr1.istln_so_no,
"
"                 cr1.istln_so_seq_no,
"
"                 cr1.istln_so_sub_seq_no,
"
"                 cr1.isthd_trans_date,
"
"                 NVL(cr1.istln_ord_type,'MI'),
"
"                 cr1.istln_ord_pfx,
"
"                 NVL(cr1.istln_ord_no,p_doc_no),
"
"                 NULL,
"
"                 NULL,
"
"                 p_doc_no,
"
"                 cr1.istln_seq_no,
"
"                 cr1.istln_vou_type,
"
"                 'ICM',
"
"                 cr1.istln_reference,
"
"                 v_ref,
"
"                 p_user,
"
"                 cr1.istln_type,
"
"                 cr1.istln_proj_id,
"
"                 cr1.istln_task_id,
"
"                 p_qty_transit => cr1.istln_stk_trans_qty,
"
"               p_so_prj_schld_desc => cr1.istln_so_schld_desc
"
"                );
"
"        END IF;
"
"
"
"        FOR r_ls IN c_ls(cr1.istln_seq_no)
"
"    LOOP
"
"
"
"    IF r_ls.isbd_sys_ls_no IS NOT NULL THEN
"
"
"
"      proc_upd_lot_ser_stocks(p_bu,
"
"                  cr1.istln_store_id,
"
"                              cr1.istln_prod_id,
"
"                              cr1.istln_prod_rev,
"
"                              r_ls.isbd_sys_ls_no,
"
"                              0,
"
"                              0,
"
"                              r_ls.isbd_trans_qty/cr1.istln_conv_factor,
"
"                              v_rcpt_unitcost,
"
"                              cr1.prod_ser_lot_opt,
"
"                              r_ls.isbd_lot_no,
"
"                              r_ls.isbd_serial_no,
"
"                              r_ls.isbd_source_type,
"
"                              r_ls.isbd_source_id,
"
"                              r_ls.isbd_expiry_date,
"
"                              cr1.isthd_trans_date,
"
"                              'MR',
"
"                              NULL,
"
"                              cr1.istln_doc_no,
"
"                              cr1.istln_seq_no,
"
"                              'ICM',
"
"                              cr1.istln_reference,
"
"                              v_ref,
"
"                              p_user,
"
"                  p_so_pfx => cr1.istln_so_pfx,
"
"                  p_so_no => cr1.istln_so_no,
"
"                  p_so_seq_no => cr1.istln_so_seq_no,
"
"                  p_so_sub_seq_no => cr1.istln_so_sub_seq_no,
"
"                  p_so_ref => cr1.istln_so_schld_desc
"
"                             );
"
"
"
"          FOR r_roll IN (SELECT *
"
"                           FROM inv_stock_trans_lot_roll_dtls
"
"                      WHERE istlrd_bu = p_bu
"
"                            AND istlrd_doc_no = cr1.istln_doc_no
"
"                            AND istlrd_doc_seq_no = cr1.istln_seq_no
"
"                            AND istlrd_lot_seq_no = r_ls.isbd_sub_seq_no
"
"                            AND istlrd_sys_ls_no = r_ls.isbd_sys_ls_no
"
"              ORDER BY istlrd_roll_no)
"
"          LOOP
"
"            proc_upd_lot_roll_stocks(p_bu,
"
"                                     cr1.istln_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_roll.istlrd_roll_no,
"
"                             0,
"
"                             0,
"
"                             0,
"
"                             r_roll.istlrd_roll_qty,
"
"                             cr1.istln_vou_type,
"
"                             cr1.isthd_trans_date,
"
"                     cr1.istln_vou_no,
"
"                     cr1.istln_vou_seq_no,
"
"                     p_user
"
"                            );
"
"          END LOOP;
"
"
"
"    END IF;
"
"    END LOOP c_ls;
"
"
"
"    BEGIN
"
"          SELECT store_plnt,store_physical INTO v_frm_store_plnt,v_frm_store_type
"
"            FROM stores
"
"           WHERE store_bu = p_bu
"
"             AND store_id = cr1.istln_store_id;
"
"    END;
"
"
"
"
"
"          IF cr1.isthd_issueto_type = 'E' THEN
"
"      BEGIN
"
"        SELECT store_id INTO v_store_id
"
"          FROM stores
"
"             WHERE store_bu = p_bu
"
"               AND store_plnt = cr1.isthd_plnt
"
"           AND store_plnt_loc_id = cr1.isthd_plnt_loc_id
"
"           AND store_physical = 'L'
"
"           AND store_inv_id = cr1.isthd_issueto_id;
"
"      END;
"
"    ELSE
"
"      v_store_id := cr1.isthd_issueto_id;
"
"    END IF;
"
"
"
"    BEGIN
"
"         SELECT store_plnt,store_physical
"
"       INTO v_to_store_plnt,v_to_store_type
"
"           FROM stores
"
"          WHERE store_bu = p_bu
"
"            AND store_id = v_store_id;
"
"     END;
"
"
"
"
"
"        IF v_frm_store_type = 'E' AND v_to_store_type = 'E' THEN
"
"      v_cmt_status := 'N';
"
"      v_sou_plnt := v_frm_store_plnt;
"
"      v_trans_type := 'FB';
"
"    ELSIF v_frm_store_type = 'G' AND v_to_store_type = 'G' THEN
"
"      v_cmt_status := 'C';
"
"      v_sou_plnt := v_to_store_plnt;
"
"      v_trans_type := 'FS';
"
"    END IF;
"
"
"
"    v_rcpt_unitcost := cr1.istln_unit_cost + cr1.istln_chrg_amt + cr1.istln_moist_chrg_amt;
"
"
"
"    proc_upd_stocks(p_bu,
"
"                        v_store_id,
"
"                        NULL,
"
"                        cr1.istln_prod_id,
"
"                        cr1.istln_prod_rev,
"
"                        0,
"
"                        0,
"
"                        -(cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty) / cr1.istln_conv_factor,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        v_rcpt_unitcost,
"
"                        0,
"
"                        'N',
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        cr1.istln_seq_no,
"
"                        0,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        NULL,
"
"                        cr1.isthd_year,
"
"                        cr1.isthd_period,
"
"                        cr1.isthd_trans_date,
"
"                        NULL,
"
"                        'ICM',
"
"                        'MR',
"
"                        NULL,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        NULL,
"
"                        cr1.istln_prod_cls,
"
"                        cr1.istln_ord_no,
"
"                        cr1.istln_ord_type,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        p_ref1 => cr1.istln_reference,
"
"                        p_ref2 => v_ref,
"
"                p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"            p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"            p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"            p_prod_grp_id => cr1.istln_prod_grp,
"
"            p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"            p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                        p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                       );
"
"
"
"      IF cr1.prod_indicator = 'I' THEN
"
"
"
"        proc_upd_so_stocks(p_bu,
"
"                 v_store_id,
"
"                 cr1.istln_prod_id,
"
"                 cr1.istln_prod_rev,
"
"                 -cr1.istln_stk_trans_qty,
"
"                 0,
"
"                 cr1.istln_unit_cost,
"
"                 cr1.istln_so_pfx,
"
"                 cr1.istln_so_no,
"
"                 cr1.istln_so_seq_no,
"
"                 cr1.istln_so_sub_seq_no,
"
"                 cr1.isthd_trans_date,
"
"                 NVL(cr1.istln_ord_type,'MI'),
"
"                 cr1.istln_ord_pfx,
"
"                 NVL(cr1.istln_ord_no,p_doc_no),
"
"                 NULL,
"
"                 NULL,
"
"                 p_doc_no,
"
"                 cr1.istln_seq_no,
"
"                 'MR',
"
"                 'ICM',
"
"                 cr1.istln_reference,
"
"                 v_ref,
"
"                 p_user,
"
"                 cr1.istln_type,
"
"                 cr1.istln_proj_id,
"
"                 cr1.istln_task_id,
"
"               p_so_prj_schld_desc => cr1.istln_so_schld_desc
"
"                );
"
"      END IF;
"
"
"
"    --Raise_Application_Error(-20999,'HRM ');
"
"--Raise_Application_Error(-20999,'Bala Testing - 1'||cr1.istln_so_no||'/'||cr1.istln_proj_id);
"
"    IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt IN ('N','S') THEN
"
"
"
"      FOR r_cb IN (SELECT sttr_batch_no,sttr_trans_qty
"
"                     FROM stock_trans
"
"            WHERE sttr_bu = p_bu
"
"              AND sttr_store_id = v_store_id
"
"              AND sttr_prod_id = cr1.istln_prod_id
"
"              AND sttr_prod_rev = cr1.istln_prod_rev
"
"              AND sttr_vou_no = p_doc_no
"
"              AND sttr_vou_line_no = cr1.istln_seq_no
"
"              AND sttr_bucket_type = 'QOH'
"
"              AND sttr_batch_no IS NOT NULL)
"
"      LOOP
"
"      proc_upd_stock_batches(p_bu,
"
"                     v_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_cb.sttr_batch_no,
"
"                     0,
"
"                     r_cb.sttr_trans_qty,--cr1.istln_stk_trans_qty,
"
"                     0,
"
"                     0,
"
"                     v_rcpt_unitcost,
"
"                     v_rcpt_unitcost,
"
"                     0,
"
"                     0,
"
"                     0,
"
"                     0    ,
"
"                     'N',
"
"                     cr1.isthd_trans_date,
"
"                     NULL,
"
"                     cr1.istln_doc_no,
"
"                     cr1.istln_seq_no,
"
"                     'MR',
"
"                     NULL,
"
"                     cr1.istln_doc_no,
"
"                     cr1.istln_seq_no,
"
"                     NULL,
"
"                     cr1.istln_prod_cls,
"
"                     'MR',
"
"                     'ICM',
"
"                     NULL,
"
"                     NULL,
"
"                     NULL,
"
"                     NULL,
"
"                     p_user,
"
"                 p_ref1 => cr1.istln_reference,
"
"                 p_ref2 => v_ref,
"
"                 p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                 p_prod_subcls => cr1.istln_prod_subcls,
"
"                 p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                 p_prod_grp => cr1.istln_prod_grp,
"
"                 p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                 p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                 p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                 p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                     );
"
"
"
"          END LOOP;
"
"
"
"    END IF;
"
"
"
"    IF cr1.prod_ser_lot_opt <> 'N' THEN
"
"
"
"          FOR r_ls IN c_ls(cr1.istln_seq_no)
"
"      LOOP
"
"
"
"        proc_upd_lot_ser_stocks(p_bu,
"
"                                v_store_id,
"
"                                cr1.istln_prod_id,
"
"                                cr1.istln_prod_rev,
"
"                                r_ls.isbd_sys_ls_no,
"
"                                -r_ls.isbd_stk_trans_qty,
"
"                                0,
"
"                                0,
"
"                                v_rcpt_unitcost,
"
"                                cr1.prod_ser_lot_opt,
"
"                                r_ls.isbd_lot_no,
"
"                                r_ls.isbd_serial_no,
"
"                                r_ls.isbd_source_type,
"
"                                r_ls.isbd_source_id,
"
"                                r_ls.isbd_expiry_date,
"
"                                cr1.isthd_trans_date,
"
"                                'MR',
"
"                                NULL,
"
"                                cr1.istln_doc_no,
"
"                                cr1.istln_seq_no,
"
"                                'ICM',
"
"                                cr1.istln_reference,
"
"                                v_ref,
"
"                                p_user,
"
"                    p_so_pfx => cr1.istln_so_pfx,
"
"                    p_so_no => cr1.istln_so_no,
"
"                    p_so_seq_no => cr1.istln_so_seq_no,
"
"                    p_so_sub_seq_no => cr1.istln_so_sub_seq_no,
"
"                    p_so_ref => cr1.istln_so_schld_desc
"
"                               );
"
"
"
"          FOR r_roll IN (SELECT *
"
"                           FROM inv_stock_trans_lot_roll_dtls
"
"                      WHERE istlrd_bu = p_bu
"
"                            AND istlrd_doc_no = cr1.istln_doc_no
"
"                            AND istlrd_doc_seq_no = cr1.istln_seq_no
"
"                            AND istlrd_lot_seq_no = r_ls.isbd_sub_seq_no
"
"                            AND istlrd_sys_ls_no = r_ls.isbd_sys_ls_no
"
"              ORDER BY istlrd_roll_no)
"
"          LOOP
"
"            proc_upd_lot_roll_stocks(p_bu,
"
"                                     v_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_roll.istlrd_roll_no,
"
"                             0,
"
"                             r_roll.istlrd_roll_qty,
"
"                             0,
"
"                             0,
"
"                             cr1.istln_vou_type,
"
"                             cr1.isthd_trans_date,
"
"                     cr1.istln_vou_no,
"
"                     cr1.istln_vou_seq_no,
"
"                     p_user
"
"                            );
"
"          END LOOP;
"
"
"
"      IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt IN ('L') THEN
"
"
"
"        FOR r_cb IN (SELECT sttr_batch_no,sttr_trans_qty
"
"                     FROM stock_trans
"
"            WHERE sttr_bu = p_bu
"
"              AND sttr_store_id = v_store_id
"
"              AND sttr_prod_id = cr1.istln_prod_id
"
"              AND sttr_prod_rev = cr1.istln_prod_rev
"
"              AND sttr_vou_no = p_doc_no
"
"              AND sttr_vou_line_no = cr1.istln_seq_no
"
"              AND sttr_bucket_type = 'QOH'
"
"              AND sttr_batch_no IS NOT NULL)
"
"        LOOP
"
"        proc_upd_stock_batches(p_bu,
"
"                       v_store_id,
"
"                       cr1.istln_prod_id,
"
"                       cr1.istln_prod_rev,
"
"                       r_cb.sttr_batch_no,
"
"                       0,
"
"                       r_ls.isbd_stk_trans_qty,
"
"                       0,
"
"                       0,
"
"                       v_rcpt_unitcost,
"
"                       v_rcpt_unitcost,
"
"                       0,
"
"                       0,
"
"                       0,
"
"                       0    ,
"
"                       'N',
"
"                       cr1.isthd_trans_date,
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       'MR',
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       NULL,
"
"                       cr1.istln_prod_cls,
"
"                       'MR',
"
"                       'ICM',
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       p_user,
"
"                   p_ref1 => cr1.istln_reference,
"
"                   p_ref2 => v_ref,
"
"                   p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                   p_prod_subcls => cr1.istln_prod_subcls,
"
"                   p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                   p_prod_grp => cr1.istln_prod_grp,
"
"                   p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                   p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                   p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                   p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                   p_sys_ls_no => r_ls.isbd_sys_ls_no
"
"                      );
"
"
"
"          END LOOP;
"
"        END IF;
"
"
"
"
"
"        IF cr1.isthd_issueto_type = 'W' AND cr1.prod_cons_type = 'P' THEN
"
"
"
"          IF cr1.prod_ser_lot_opt = 'S' THEN
"
"
"
"            SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"              FROM stocks_batches
"
"             WHERE sb_bu = p_bu
"
"               AND sb_store_id = v_store_id
"
"               AND sb_prod_id = cr1.istln_prod_id
"
"               AND sb_prod_rev = cr1.istln_prod_rev
"
"               AND sb_po_no = cr1.istln_doc_no
"
"               AND sb_receipt_seq_no = cr1.istln_seq_no;
"
"
"
"          END IF;
"
"
"
"              proc_insrupd_wip(p_bu,
"
"                     v_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_ls.isbd_lot_no,
"
"                     r_ls.isbd_serial_no,
"
"                     r_ls.isbd_expiry_date,
"
"                     r_ls.isbd_source_type,
"
"                     r_ls.isbd_source_id,
"
"                     -r_ls.isbd_stk_trans_qty,
"
"                     0,
"
"                     cr1.istln_ord_type,
"
"                     cr1.istln_ord_pfx,
"
"                     cr1.istln_ord_no,
"
"                     cr1.istln_ord_seq_no,
"
"                     cr1.istln_ord_sub_seq_no,
"
"                     p_user,
"
"                     v_stk_batch_no,
"
"                     cr1.istln_so_pfx,
"
"                     cr1.istln_so_no,
"
"                     cr1.istln_so_seq_no,
"
"                     cr1.istln_so_sub_seq_no,
"
"                     p_proc_id => cr1.istln_process_id,
"
"                     p_prod_ord_no => cr1.istln_po_ord_no,
"
"                     p_type => cr1.istln_type,
"
"                     p_proj_id => cr1.istln_proj_id,
"
"                     p_task_id => cr1.istln_task_id,
"
"                   p_ord_trans_no => cr1.istln_trans_no,
"
"                   p_par_batch_no => cr1.istln_par_batch_no,
"
"                   p_so_schld_ref => cr1.istln_so_schld_desc,
"
"                   p_oprn_ln_seq_no => cr1.istln_oprn_ln_seq_no,
"
"                   p_test_no => r_ls.isbd_test_no
"
"                    );
"
"
"
"            END IF;
"
"      END LOOP c_ls;
"
"    END IF;
"
"
"
"    IF cr1.prod_ser_lot_opt = 'N' AND cr1.isthd_issueto_type = 'W' AND cr1.prod_cons_type = 'P' THEN
"
"
"
"      proc_insrupd_wip(p_bu,
"
"           v_store_id,
"
"           cr1.istln_prod_id,
"
"           cr1.istln_prod_rev,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           NULL,
"
"           -cr1.istln_stk_trans_qty,
"
"           0,
"
"           cr1.istln_ord_type,
"
"           cr1.istln_ord_pfx,
"
"           cr1.istln_ord_no,
"
"           cr1.istln_ord_seq_no,
"
"           cr1.istln_ord_sub_seq_no,
"
"           p_user,
"
"           NULL,
"
"           cr1.istln_so_pfx,
"
"           cr1.istln_so_no,
"
"           cr1.istln_so_seq_no,
"
"           cr1.istln_so_sub_seq_no,
"
"           p_proc_id => cr1.istln_process_id,
"
"           p_prod_ord_no => cr1.istln_po_ord_no,
"
"           p_type => cr1.istln_type,
"
"           p_proj_id => cr1.istln_proj_id,
"
"           p_task_id => cr1.istln_task_id,
"
"           p_ord_trans_no => cr1.istln_trans_no,
"
"           p_par_batch_no => cr1.istln_par_batch_no,
"
"           p_so_schld_ref => cr1.istln_so_schld_desc,
"
"           p_oprn_ln_seq_no => cr1.istln_oprn_ln_seq_no
"
"          );
"
"
"
"    END IF;
"
"
"
"    IF func_find_store_bin_flag(p_bu,v_store_id) = 'Y' THEN
"
"
"
"      v_trans_qty := (cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty);
"
"
"
"      SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"        FROM inv_mat_transfer_bin_vw
"
"       WHERE imtb_bu = p_bu
"
"         AND imtb_doc_no = cr1.istln_doc_no
"
"         AND imtb_seq_no = cr1.istln_seq_no;
"
"
"
"      IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"        Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"      END IF;
"
"
"
"      FOR r_bin IN (SELECT *
"
"                      FROM inv_mat_transfer_bin_vw
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no)
"
"      LOOP
"
"        proc_upd_bin_stocks(p_bu,
"
"                      v_store_id,
"
"                      r_bin.imtb_prod_id,
"
"                      r_bin.imtb_prod_rev,
"
"                      r_bin.imtb_bin_id,
"
"                      r_bin.imtb_sys_ls_no,
"
"                      r_bin.imtb_lot_no,
"
"                      r_bin.imtb_ser_no,
"
"                      r_bin.imtb_source_type,
"
"                      r_bin.imtb_source_id,
"
"                      -(r_bin.imtb_trans_qty/cr1.istln_conv_factor),
"
"                      0,
"
"                      0,
"
"                      0,
"
"                      v_rcpt_unitcost,
"
"                      cr1.isthd_trans_date,
"
"                      'MR',
"
"                      NULL,
"
"                      cr1.istln_doc_no,
"
"                      cr1.istln_seq_no,
"
"                      'ICM',
"
"                      p_user,
"
"                p_crate_id => r_bin.imtb_crate_id
"
"                   );
"
"      END LOOP;
"
"    END IF;
"
"
"
"      ELSE
"
"
"
"    OPEN c_ls(cr1.istln_seq_no);
"
"        FETCH c_ls INTO r_ls;
"
"      IF c_ls%NOTFOUND THEN
"
"
"
"        proc_upd_sf_stocks(p_bu,
"
"                               cr1.istln_po_ord_no,
"
"                               NULL,
"
"                               cr1.istln_sf_code,
"
"                               cr1.istln_store_id,
"
"                               cr1.istln_prod_id,
"
"                               cr1.istln_prod_rev,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               CASE WHEN cr1.istln_vou_type = 'SA' THEN (cr1.istln_trans_qty / cr1.istln_conv_factor) ELSE 0 END,
"
"                               0,
"
"                               cr1.istln_unit_cost,
"
"                               func_find_store_plnt(p_bu,cr1.istln_store_id),
"
"                               NULL,
"
"                               NULL,
"
"                               cr1.istln_so_pfx,
"
"                               cr1.istln_so_no,
"
"                               cr1.istln_so_seq_no,
"
"                               cr1.istln_so_sub_seq_no,
"
"                               cr1.istln_ord_pfx,
"
"                               cr1.istln_ord_no,
"
"                               NULL,
"
"                               cr1.istln_doc_no,
"
"                               cr1.istln_seq_no,
"
"                               cr1.istln_seq_no,
"
"                               cr1.isthd_trans_date,
"
"                               cr1.isthd_year,
"
"                               cr1.isthd_period,
"
"                               cr1.prod_cost_method,
"
"                               'MR',
"
"                               'ICM',
"
"                               func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                               cr1.istln_reference,
"
"                               v_ref,
"
"                               cr1.istln_unit_cost,
"
"                               cr1.istln_unit_cost,
"
"                               cr1.istln_ord_type,
"
"                               p_user,
"
"                               p_trans_in_qty => CASE WHEN cr1.istln_vou_type = 'SA' THEN 0 ELSE (cr1.istln_trans_qty / cr1.istln_conv_factor) END,
"
"                   p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                   p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                   p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                   p_prod_grp_id => cr1.istln_prod_grp,
"
"                   p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                   p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                   p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                   p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                   p_so_schld_desc => cr1.istln_so_schld_desc
"
"                               );
"
"
"
"        IF cr1.istln_vou_type <> 'SA' AND NOT(INSTR(cr1.istln_sf_code,'0') = 0 AND
"
"           func_find_store_type(p_bu,cr1.istln_rcpt_store_id) = 'Y') THEN
"
"
"
"          proc_upd_sf_stocks(p_bu,
"
"                                 cr1.istln_po_ord_no,
"
"                                 NULL,
"
"                                 cr1.istln_sf_code,
"
"                                 cr1.istln_rcpt_store_id,
"
"                                 cr1.istln_prod_id,
"
"                                 cr1.istln_prod_rev,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 -cr1.istln_trans_qty/cr1.istln_conv_factor,
"
"                                 0,
"
"                                 cr1.istln_unit_cost,
"
"                                 func_find_store_plnt(p_bu,cr1.istln_rcpt_store_id),
"
"                                 NULL,
"
"                                 NULL,
"
"                                 cr1.istln_so_pfx,
"
"                                 cr1.istln_so_no,
"
"                                 cr1.istln_so_seq_no,
"
"                                 cr1.istln_so_sub_seq_no,
"
"                                 cr1.istln_ord_pfx,
"
"                                 cr1.istln_ord_no,
"
"                                 NULL,
"
"                                 cr1.istln_doc_no,
"
"                                 cr1.istln_seq_no,
"
"                                 cr1.istln_seq_no,
"
"                                 cr1.isthd_trans_date,
"
"                                 cr1.isthd_year,
"
"                                 cr1.isthd_period,
"
"                                 cr1.prod_cost_method,
"
"                                 'MR',
"
"                                 'ICM',
"
"                                 func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                                 cr1.istln_reference,
"
"                                 v_ref,
"
"                                 cr1.istln_unit_cost,
"
"                                 cr1.istln_unit_cost,
"
"                                 cr1.istln_ord_type,
"
"                                 p_user,
"
"                     p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                     p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                     p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                     p_prod_grp_id => cr1.istln_prod_grp,
"
"                     p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                     p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                     p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                     p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                                );
"
"
"
"          IF func_find_store_bin_flag(p_bu,cr1.istln_rcpt_store_id) = 'Y' THEN
"
"
"
"            v_trans_qty := (cr1.istln_trans_qty);
"
"
"
"            SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"              FROM inv_mat_transfer_bin_vw
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no;
"
"
"
"            IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"              Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"            END IF;
"
"
"
"            FOR r_bin IN (SELECT *
"
"                            FROM inv_mat_transfer_bin_vw
"
"                   WHERE imtb_bu = p_bu
"
"                     AND imtb_doc_no = cr1.istln_doc_no
"
"                     AND imtb_seq_no = cr1.istln_seq_no)
"
"            LOOP
"
"              proc_upd_bin_stocks(p_bu,
"
"                            cr1.istln_rcpt_store_id,
"
"                            r_bin.imtb_prod_id,
"
"                            r_bin.imtb_prod_rev,
"
"                            r_bin.imtb_bin_id,
"
"                            NULL,
"
"                            NULL,
"
"                            NULL,
"
"                            NULL,
"
"                            NULL,
"
"                            -(r_bin.imtb_trans_qty/cr1.istln_conv_factor),
"
"                            0,
"
"                            0,
"
"                            0,
"
"                            v_rcpt_unitcost,
"
"                            cr1.isthd_trans_date,
"
"                            'MR',
"
"                            NULL,
"
"                            cr1.istln_doc_no,
"
"                            cr1.istln_seq_no,
"
"                            'ICM',
"
"                            p_user,
"
"                      p_crate_id => r_bin.imtb_crate_id,
"
"                      p_prod_ord_no => cr1.istln_po_ord_no,
"
"                      p_sf_code => cr1.istln_sf_code
"
"                         );
"
"            END LOOP;
"
"
"
"          END IF;
"
"
"
"            END IF;
"
"
"
"      ELSE
"
"
"
"        IF cr1.istln_vou_type = 'SFR' THEN
"
"        SELECT prodplnt_fpi_flag INTO v_fpi_flag
"
"          FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"           AND prodplnt_plnt = cr1.isthd_plnt
"
"           AND prodplnt_prod_id = cr1.istln_prod_id
"
"           AND prodplnt_prod_rev = cr1.istln_prod_rev;
"
"        ELSE
"
"              v_fpi_flag := 'N';
"
"            END IF;
"
"
"
"        LOOP
"
"
"
"          proc_upd_sf_stocks(p_bu,
"
"                         cr1.istln_po_ord_no,
"
"                         cr1.istln_sou_proc_id,
"
"                           cr1.istln_sf_code,
"
"                         cr1.istln_store_id,
"
"                           cr1.istln_prod_id,
"
"                         cr1.istln_prod_rev,
"
"                           r_ls.isbd_sys_ls_no,
"
"                         r_ls.isbd_lot_no,
"
"                           r_ls.isbd_serial_no,
"
"                         r_ls.isbd_expiry_date,
"
"                         CASE WHEN cr1.istln_vou_type = 'SA' THEN (r_ls.isbd_trans_qty/cr1.istln_conv_factor) ELSE 0 END,
"
"                           0,
"
"                         cr1.istln_unit_cost,
"
"                         func_find_store_plnt(p_bu,cr1.istln_store_id),
"
"                         r_ls.isbd_source_id,
"
"                         r_ls.isbd_source_type,
"
"                         cr1.istln_so_pfx,
"
"                         cr1.istln_so_no,
"
"                         cr1.istln_so_seq_no,
"
"                         cr1.istln_so_sub_seq_no,
"
"                         cr1.istln_ord_pfx,
"
"                         cr1.istln_ord_no,
"
"                         NULL,
"
"                         cr1.istln_doc_no,
"
"                         cr1.istln_seq_no,
"
"                         cr1.istln_seq_no,
"
"                         cr1.isthd_trans_date,
"
"                         cr1.isthd_year,
"
"                         cr1.isthd_period,
"
"                         cr1.prod_cost_method,
"
"                         'MR',
"
"                         'ICM',
"
"                         func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                         cr1.istln_reference,
"
"                         v_ref,
"
"                         cr1.istln_unit_cost,
"
"                         cr1.istln_unit_cost,
"
"                         cr1.istln_ord_type,
"
"                         p_user,
"
"                         p_type => cr1.istln_type,
"
"                         p_proj => cr1.istln_proj_id,
"
"                         p_task => cr1.istln_task_id,
"
"                         p_trans_in_qty => CASE WHEN cr1.istln_vou_type = 'SA' THEN 0 ELSE (r_ls.isbd_trans_qty/cr1.istln_conv_factor) END,
"
"                     p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                     p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                     p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                     p_prod_grp_id => cr1.istln_prod_grp,
"
"                     p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                     p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                     p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                     p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                 p_oprn_ln_seq => cr1.istln_sou_oprn_seq,
"
"                 p_so_schld_desc => cr1.istln_so_schld_desc
"
"                        );
"
"
"
"              IF cr1.istln_vou_type <> 'SA' AND NOT(INSTR(cr1.istln_sf_code,'0') = 0 AND func_find_store_type(p_bu,cr1.istln_rcpt_store_id) NOT IN ('J','I') AND v_fpi_flag = 'N') THEN
"
"
"
"            proc_upd_sf_stocks(p_bu,
"
"                     cr1.istln_po_ord_no,
"
"                     cr1.istln_sou_proc_id,
"
"                     cr1.istln_sf_code,
"
"                     cr1.istln_rcpt_store_id,
"
"                     cr1.istln_prod_id,
"
"                     cr1.istln_prod_rev,
"
"                     r_ls.isbd_sys_ls_no,
"
"                     r_ls.isbd_lot_no,
"
"                     r_ls.isbd_serial_no,
"
"                     r_ls.isbd_expiry_date,
"
"                     -r_ls.isbd_trans_qty/cr1.istln_conv_factor,
"
"                     0,
"
"                     cr1.istln_unit_cost,
"
"                     func_find_store_plnt(p_bu,cr1.istln_rcpt_store_id),
"
"                     r_ls.isbd_source_id,
"
"                     r_ls.isbd_source_type,
"
"                     cr1.istln_so_pfx,
"
"                     cr1.istln_so_no,
"
"                     cr1.istln_so_seq_no,
"
"                     cr1.istln_so_sub_seq_no,
"
"                     cr1.istln_ord_pfx,
"
"                     cr1.istln_ord_no,
"
"                     NULL,
"
"                     cr1.istln_doc_no,
"
"                     cr1.istln_seq_no,
"
"                     cr1.istln_seq_no,
"
"                     cr1.isthd_trans_date,
"
"                     cr1.isthd_year,
"
"                     cr1.isthd_period,
"
"                     cr1.prod_cost_method,
"
"                     'MR',
"
"                     'ICM',
"
"                     func_find_product_class(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                     cr1.istln_reference,
"
"                     v_ref,
"
"                     cr1.istln_unit_cost,
"
"                     cr1.istln_unit_cost,
"
"                     cr1.istln_ord_type,
"
"                     p_user,
"
"                     p_type => cr1.istln_type,
"
"                     p_proj => cr1.istln_proj_id,
"
"                     p_task => cr1.istln_task_id,
"
"                       p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                       p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"                       p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"                       p_prod_grp_id => cr1.istln_prod_grp,
"
"                       p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                       p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                       p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                       p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                   p_oprn_ln_seq => cr1.istln_sou_oprn_seq,
"
"                   p_so_schld_desc => cr1.istln_so_schld_desc
"
"                    );
"
"
"
"      IF func_find_store_bin_flag(p_bu,cr1.istln_rcpt_store_id) = 'Y' THEN
"
"
"
"        v_trans_qty := (cr1.istln_trans_qty);
"
"
"
"        SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"          FROM inv_mat_transfer_bin_vw
"
"         WHERE imtb_bu = p_bu
"
"           AND imtb_doc_no = cr1.istln_doc_no
"
"           AND imtb_seq_no = cr1.istln_seq_no
"
"           --AND (imtb_sys_ls_no = r_ls.isbd_sys_ls_no OR (imtb_sys_ls_no IS NULL AND r_ls.isbd_sys_ls_no IS NULL))
"
"           ;
"
"
"
"        IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"          Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"        END IF;
"
"
"
"        FOR r_bin IN (SELECT *
"
"                      FROM inv_mat_transfer_bin_vw
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no
"
"               AND (imtb_sys_ls_no = r_ls.isbd_sys_ls_no OR (imtb_sys_ls_no IS NULL AND r_ls.isbd_sys_ls_no IS NULL))
"
"               )
"
"        LOOP
"
"          proc_upd_bin_stocks(p_bu,
"
"                        cr1.istln_rcpt_store_id,
"
"                        r_bin.imtb_prod_id,
"
"                        r_bin.imtb_prod_rev,
"
"                        r_bin.imtb_bin_id,
"
"                        r_bin.imtb_sys_ls_no,
"
"                        r_bin.imtb_lot_no,
"
"                        r_bin.imtb_ser_no,
"
"                        r_bin.imtb_source_type,
"
"                        r_bin.imtb_source_id,
"
"                        -(r_bin.imtb_trans_qty/cr1.istln_conv_factor),
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        cr1.isthd_trans_date,
"
"                        'MR',
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        cr1.istln_seq_no,
"
"                        'ICM',
"
"                        p_user,
"
"                  p_crate_id => r_bin.imtb_crate_id,
"
"                  p_prod_ord_no => cr1.istln_po_ord_no,
"
"                  p_sf_code => cr1.istln_sf_code
"
"                     );
"
"        END LOOP;
"
"
"
"      END IF;
"
"
"
"          END IF;
"
"
"
"          FETCH c_ls INTO r_ls;
"
"          EXIT WHEN c_ls%NOTFOUND;
"
"
"
"        END LOOP;
"
"
"
"      END IF;
"
"
"
"    CLOSE c_ls;
"
"
"
"    IF cr1.istln_sf_code IS NOT NULL AND INSTR(cr1.istln_sf_code,'0') = 0 AND
"
"       func_find_store_type(p_bu,cr1.istln_rcpt_store_id) NOT IN ('J','I') AND
"
"       (v_fpi_flag = 'N' OR cr1.istln_vou_type = 'SA') THEN
"
"
"
"      v_rcpt_unitcost := cr1.istln_unit_cost;
"
"
"
"      proc_upd_stocks(p_bu,
"
"                          cr1.istln_rcpt_store_id,
"
"                          NULL,
"
"                          cr1.istln_prod_id,
"
"                          cr1.istln_prod_rev,
"
"                          0,
"
"                          0,
"
"                          -(cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty) / cr1.istln_conv_factor,
"
"                          0,
"
"                          0,
"
"                          v_rcpt_unitcost,
"
"                          v_rcpt_unitcost,
"
"                          0,
"
"                          'N',
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          cr1.istln_seq_no,
"
"                          0,
"
"                          NULL,
"
"                          cr1.istln_doc_no,
"
"                          NULL,
"
"                          cr1.istln_doc_no,
"
"                          NULL,
"
"                          cr1.isthd_year,
"
"                          cr1.isthd_period,
"
"                          cr1.isthd_trans_date,
"
"                          NULL,
"
"                          'ICM',
"
"                          'MR',
"
"                          NULL,
"
"                          p_user,
"
"                          SYSDATE,
"
"                          NULL,
"
"                          cr1.istln_prod_cls,
"
"                          cr1.istln_ord_no,
"
"                          cr1.istln_ord_type,
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          p_ref1 => cr1.istln_reference,
"
"                          p_ref2 => v_ref,
"
"                  p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"              p_prod_sub_cls_id => cr1.istln_prod_subcls,
"
"              p_prod_sub_cls_desc => cr1.istln_prod_subcls_desc,
"
"              p_prod_grp_id => cr1.istln_prod_grp,
"
"              p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"              p_prod_sub_grp_id => cr1.istln_prod_subgrp,
"
"                          p_prod_sub_grp_desc => cr1.istln_prod_subgrp_desc,
"
"                          p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                         );
"
"
"
"          IF cr1.prod_indicator = 'I' THEN
"
"
"
"        proc_upd_so_stocks(p_bu,
"
"                         cr1.istln_rcpt_store_id,
"
"                         cr1.istln_prod_id,
"
"                         cr1.istln_prod_rev,
"
"                         -(cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty) / cr1.istln_conv_factor,
"
"                         0,
"
"                   v_rcpt_unitcost,
"
"                         cr1.istln_so_pfx,
"
"                         cr1.istln_so_no,
"
"                         cr1.istln_so_seq_no,
"
"                         NULL,
"
"                         cr1.isthd_trans_date,
"
"                         'MR',
"
"                         NULL,
"
"                         cr1.istln_doc_no,
"
"                         NULL,
"
"                         NULL,
"
"                         cr1.istln_doc_no,
"
"                         cr1.istln_seq_no,
"
"                         'MR',
"
"                         'ICM',
"
"                         cr1.istln_vou_type||'/'||cr1.istln_vou_appl,
"
"                         cr1.istln_vou_type||'/'||cr1.istln_vou_appl,
"
"                         p_user,
"
"                         cr1.istln_type,
"
"                         cr1.istln_proj_id,
"
"                         cr1.istln_task_id,
"
"                   p_so_prj_schld_desc => cr1.istln_so_schld_desc
"
"                        );
"
"
"
"      END IF;
"
"
"
"      IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt IN ('N','S') THEN
"
"
"
"        proc_upd_stock_batches(p_bu,
"
"                       cr1.istln_rcpt_store_id,
"
"                       cr1.istln_prod_id,
"
"                       cr1.istln_prod_rev,
"
"                       NULL,
"
"                       (cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty) / cr1.istln_conv_factor,
"
"                       0,
"
"                       0,
"
"                       0,
"
"                       v_rcpt_unitcost,
"
"                       v_rcpt_unitcost,
"
"                       0,
"
"                       0,
"
"                       0,
"
"                       0    ,
"
"                       'N',
"
"                       cr1.isthd_trans_date,
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       'MR',
"
"                       NULL,
"
"                       cr1.istln_doc_no,
"
"                       cr1.istln_seq_no,
"
"                       NULL,
"
"                       cr1.istln_prod_cls,
"
"                       'MR',
"
"                       'ICM',
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       NULL,
"
"                       p_user,
"
"                   p_ref1 => cr1.istln_reference,
"
"                   p_ref2 => v_ref,
"
"                   p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                   p_prod_subcls => cr1.istln_prod_subcls,
"
"                   p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                   p_prod_grp => cr1.istln_prod_grp,
"
"                   p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                   p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                   p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                   p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev)
"
"                      );
"
"
"
"          END IF;
"
"
"
"      IF cr1.prod_ser_lot_opt <> 'N' THEN
"
"
"
"            FOR r_ls IN c_ls(cr1.istln_seq_no)
"
"        LOOP
"
"
"
"          proc_upd_lot_ser_stocks(p_bu,
"
"                                  cr1.istln_rcpt_store_id,
"
"                                  cr1.istln_prod_id,
"
"                                  cr1.istln_prod_rev,
"
"                                  r_ls.isbd_new_sys_ls_no,
"
"                                  -r_ls.isbd_stk_trans_qty,
"
"                                  0,
"
"                                  0,
"
"                                  v_rcpt_unitcost,
"
"                                  cr1.prod_ser_lot_opt,
"
"                                  r_ls.isbd_lot_no,
"
"                                  r_ls.isbd_serial_no,
"
"                                  r_ls.isbd_source_type,
"
"                                  r_ls.isbd_source_id,
"
"                                  r_ls.isbd_expiry_date,
"
"                                  cr1.isthd_trans_date,
"
"                                  'MR',
"
"                                  NULL,
"
"                                  cr1.istln_doc_no,
"
"                                  cr1.istln_seq_no,
"
"                                  'ICM',
"
"                                  cr1.istln_reference,
"
"                                  v_ref,
"
"                                  p_user,
"
"                      p_so_pfx => cr1.istln_so_pfx,
"
"                                      p_so_no => cr1.istln_so_no,
"
"                                      p_so_seq_no => cr1.istln_so_seq_no,
"
"                                      p_so_ref => cr1.istln_so_schld_desc
"
"                                 );
"
"
"
"          IF cr1.prod_cost_method IN ('FIFO','LIFO') AND cr1.prod_ser_lot_opt = 'L' THEN
"
"
"
"            proc_upd_stock_batches(p_bu,
"
"                           cr1.istln_rcpt_store_id,
"
"                           cr1.istln_prod_id,
"
"                           cr1.istln_prod_rev,
"
"                           NULL,
"
"                           (cr1.istln_trans_qty - cr1.istln_mostr_qty - cr1.istln_short_qty) / cr1.istln_conv_factor,
"
"                           0,
"
"                           0,
"
"                           0,
"
"                           v_rcpt_unitcost,
"
"                           v_rcpt_unitcost,
"
"                           0,
"
"                           0,
"
"                           0,
"
"                           0    ,
"
"                           'N',
"
"                           cr1.isthd_trans_date,
"
"                           NULL,
"
"                           cr1.istln_doc_no,
"
"                           cr1.istln_seq_no,
"
"                           'MR',
"
"                           NULL,
"
"                           cr1.istln_doc_no,
"
"                           cr1.istln_seq_no,
"
"                           NULL,
"
"                           cr1.istln_prod_cls,
"
"                           'MR',
"
"                           'ICM',
"
"                           NULL,
"
"                           NULL,
"
"                           NULL,
"
"                           NULL,
"
"                           p_user,
"
"                       p_ref1 => cr1.istln_reference,
"
"                       p_ref2 => v_ref,
"
"                       p_prod_cls_desc => cr1.istln_prod_cls_desc,
"
"                       p_prod_subcls => cr1.istln_prod_subcls,
"
"                       p_prod_subcls_desc => cr1.istln_prod_subcls_desc,
"
"                       p_prod_grp => cr1.istln_prod_grp,
"
"                       p_prod_grp_desc => cr1.istln_prod_grp_desc,
"
"                       p_prod_subgrp => cr1.istln_prod_subgrp,
"
"                       p_prod_subgrp_desc => cr1.istln_prod_subgrp_desc,
"
"                       p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr1.istln_prod_id,cr1.istln_prod_rev),
"
"                       p_sys_ls_no => r_ls.isbd_new_sys_ls_no
"
"                          );
"
"
"
"        IF cr1.prod_cb_level = 'L' THEN
"
"
"
"              SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"                FROM stocks_batches
"
"               WHERE sb_bu = p_bu
"
"                 AND sb_store_id = cr1.istln_rcpt_store_id
"
"                 AND sb_prod_id = cr1.istln_prod_id
"
"                 AND sb_prod_rev = cr1.istln_prod_rev
"
"                 AND sb_po_no = cr1.istln_doc_no
"
"                 AND sb_receipt_seq_no = cr1.istln_seq_no
"
"             AND sb_sys_ls_no = v_new_sys_ls_no;
"
"
"
"              proc_upd_ls_stk_batch(p_bu,
"
"                                    cr1.istln_rcpt_store_id,
"
"                        cr1.istln_prod_id,
"
"                        cr1.istln_prod_rev,
"
"                        v_new_sys_ls_no,
"
"                        v_stk_batch_no,
"
"                        -(r_ls.isbd_trans_qty - r_ls.isbd_mostr_qty - r_ls.isbd_short_qty)/cr1.istln_conv_factor,
"
"                        p_user
"
"                       );
"
"
"
"            END IF;
"
"
"
"          END IF;
"
"
"
"        END LOOP c_ls;
"
"      END IF;
"
"
"
"      IF func_find_store_bin_flag(p_bu,cr1.istln_rcpt_store_id) = 'Y'   THEN
"
"
"
"        v_trans_qty := (cr1.istln_trans_qty);
"
"
"
"        SELECT SUM(imtb_trans_qty) INTO v_bin_trans_qty
"
"          FROM inv_mat_transfer_bin_vw
"
"         WHERE imtb_bu = p_bu
"
"           AND imtb_doc_no = cr1.istln_doc_no
"
"           AND imtb_seq_no = cr1.istln_seq_no;
"
"
"
"        IF v_trans_qty <> NVL(v_bin_trans_qty,0) THEN
"
"          Raise_Application_Error(-20999,'HRM '||v_trans_qty||'/'||NVL(v_bin_trans_qty,0));
"
"        END IF;
"
"
"
"      FOR r_bin IN (SELECT DISTINCT imtb_sys_ls_no,imtb_lot_no
"
"                      FROM inv_mat_transfer_bin_vw
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no)
"
"      LOOP
"
"
"
"    IF cr1.prod_ser_lot_opt NOT IN ('N','S') THEN
"
"
"
"        BEGIN
"
"          SELECT isbd_new_sys_ls_no INTO v_lot_sys_ls_no
"
"            FROM inv_stock_batch_details
"
"           WHERE isbd_bu = p_bu
"
"                 AND isbd_issue_doc_no = cr1.istln_doc_no
"
"                 AND isbd_seq_no = cr1.istln_seq_no
"
"                 AND isbd_sys_ls_no = r_bin.imtb_sys_ls_no
"
"                 AND isbd_lot_no = r_bin.imtb_lot_no;
"
"        EXCEPTION WHEN OTHERS THEN
"
"            Raise_Application_error(-20999,'HRM '||r_bin.imtb_sys_ls_no||'='||r_bin.imtb_lot_no||'='||v_lot_sys_ls_no);
"
"        END;
"
"
"
"              IF v_lot_sys_ls_no IS NULL THEN
"
"            Raise_Application_error(-20999,'HRM '||r_bin.imtb_sys_ls_no);
"
"          END IF;
"
"
"
"              UPDATE inv_mat_transfer_bin
"
"                 SET imtb_sys_ls_no = v_lot_sys_ls_no
"
"           WHERE imtb_bu = p_bu
"
"             AND imtb_doc_no = cr1.istln_doc_no
"
"             AND imtb_seq_no = cr1.istln_seq_no
"
"             AND imtb_sys_ls_no = r_bin.imtb_sys_ls_no;
"
"
"
"        END IF;
"
"
"
"        END LOOP;
"
"
"
"        FOR r_bin IN (SELECT *
"
"                      FROM inv_mat_transfer_bin_vw
"
"             WHERE imtb_bu = p_bu
"
"               AND imtb_doc_no = cr1.istln_doc_no
"
"               AND imtb_seq_no = cr1.istln_seq_no)
"
"        LOOP
"
"          proc_upd_bin_stocks(p_bu,
"
"                        cr1.istln_rcpt_store_id,
"
"                        r_bin.imtb_prod_id,
"
"                        r_bin.imtb_prod_rev,
"
"                        r_bin.imtb_bin_id,
"
"                        r_bin.imtb_sys_ls_no,
"
"                        r_bin.imtb_lot_no,
"
"                        r_bin.imtb_ser_no,
"
"                        r_bin.imtb_source_type,
"
"                        r_bin.imtb_source_id,
"
"                        -(r_bin.imtb_trans_qty/cr1.istln_conv_factor),
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        v_rcpt_unitcost,
"
"                        cr1.isthd_trans_date,
"
"                        'MR',
"
"                        NULL,
"
"                        cr1.istln_doc_no,
"
"                        cr1.istln_seq_no,
"
"                        'ICM',
"
"                        p_user,
"
"                  p_crate_id => r_bin.imtb_crate_id
"
"                     );
"
"        END LOOP;
"
"
"
"      END IF;
"
"
"
"    END IF;
"
"
"
"      END IF;
"
"
"
"      UPDATE inv_stock_trans_ln
"
"         SET istln_status = 'N',
"
"         istln_upd_by = p_user,
"
"         istln_upd_date = SYSDATE
"
"       WHERE istln_bu = p_bu
"
"         AND istln_doc_no = p_doc_no
"
"     AND istln_seq_no = cr1.istln_seq_no;
"
"
"
"    END LOOP c1;
"
"
"
"    UPDATE inv_stock_trans_hd
"
"       SET isthd_status = 'N',
"
"       isthd_upd_by = p_user,
"
"       isthd_upd_date = SYSDATE
"
"     WHERE isthd_bu = p_bu
"
"       AND isthd_doc_no = p_doc_no;
"
"
"
"    DELETE FROM appl_journals
"
"     WHERE aj_bu = p_bu
"
"       AND aj_appl = 'ICM'
"
"       AND aj_vou_pfx IS NULL
"
"       AND aj_vou_no = p_doc_no;
"
"
"
"    DELETE FROM appl_journals_hist
"
"     WHERE ajh_bu = p_bu
"
"       AND ajh_appl = 'ICM'
"
"       AND ajh_vou_pfx IS NULL
"
"       AND ajh_vou_no = p_doc_no;
"
"
"
"    DELETE FROM gl_jrnl_ln_hist
"
"     WHERE gjlh_bu = p_bu
"
"       AND gjlh_appl = 'ICM'
"
"       AND gjlh_vou_pfx IS NULL
"
"       AND gjlh_vou_no = p_doc_no;
"
"
"
"    DELETE FROM gl_jrnl_hd_hist
"
"     WHERE gjhh_bu = p_bu
"
"       AND gjhh_appl = 'ICM'
"
"       AND gjhh_vou_pfx IS NULL
"
"       AND gjhh_vou_no = p_doc_no;
"
"
"
"    /*DELETE FROM stock_trans
"
"     WHERE sttr_bu = p_bu
"
"       AND sttr_vou_pfx IS NULL
"
"       AND sttr_vou_no = p_doc_no
"
"       AND sttr_appl = 'ICM';
"
"
"
"    DELETE FROM lot_ser_stock_trans
"
"     WHERE lsst_bu = p_bu
"
"       AND lsst_vou_pfx IS NULL
"
"       AND lsst_vou_no = p_doc_no
"
"       AND lsst_appl = 'ICM';
"
"
"
"    DELETE FROM stock_so_trans
"
"     WHERE sstr_bu = p_bu
"
"       AND sstr_rcpt_pfx IS NULL
"
"       AND sstr_rcpt_no = p_doc_no
"
"       AND sstr_appl = 'ICM';*/
"
"
"
"    proc_validate_stocks(p_bu);
"
"
"
"  END proc_rev_rcpt_frm_mat_rcpt;
"
"
"
"  PROCEDURE proc_alloc_bin_frm_mat_rcpt(p_bu        IN    business_units.bu_id%TYPE,
"
"                                        p_doc_no    IN    inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                        p_user        IN    appl_users.appluser_id%TYPE,
"
"                    p_res        OUT    VARCHAR2
"
"                       )
"
"  AS
"
"    CURSOR c_mr IS
"
"    SELECT isthd_issueto_id,istln_seq_no,istln_prod_id,istln_prod_rev,
"
"           isbd_sys_ls_no,isbd_lot_no,isbd_serial_no,isbd_source_id,isbd_source_type,
"
"       NVL(isbd_trans_qty - (isbd_mostr_qty + isbd_short_qty),istln_trans_qty - (istln_mostr_qty + istln_short_qty)) istln_trans_qty,NVL(isbd_stk_trans_qty,istln_stk_trans_qty) istln_stk_trans_qty,
"
"       istln_conv_factor
"
"      FROM inv_stock_trans_hd,
"
"           inv_stock_trans_ln,
"
"       inv_stock_batch_details,
"
"       stores
"
"     WHERE isthd_bu = istln_bu
"
"       AND isthd_doc_no = istln_doc_no
"
"       AND isbd_bu(+) = istln_bu
"
"       AND isbd_issue_doc_no(+) = istln_doc_no
"
"       AND isbd_seq_no(+) = istln_seq_no
"
"       AND store_bu = isthd_bu
"
"       AND store_id = isthd_issueto_id
"
"       AND isthd_bu = p_bu
"
"       AND isthd_doc_no = p_doc_no
"
"       AND store_bin_flag = 'Y'
"
"     ORDER BY istln_seq_no,isbd_sub_seq_no;
"
"
"
"    CURSOR c_bin(c_store_id    VARCHAR2,
"
"                 c_prod_id    VARCHAR2,
"
"         c_prod_rev    NUMBER) IS
"
"    SELECT *
"
"      FROM (
"
"    SELECT stbin_type,bpa_bin_id,
"
"           (SELECT (bpa_capacity - NVL(SUM(binstk_bin_qoh + binstk_tmp_qty),0))
"
"              FROM bin_stocks
"
"             WHERE binstk_bu = bpa_bu
"
"               AND binstk_store_id = bpa_store_id
"
"               AND binstk_prod_id = bpa_prod_id
"
"               AND binstk_prod_rev = bpa_prod_rev
"
"               AND binstk_bin_id = bpa_bin_id) avail_qty
"
"      FROM (SELECT bpa_bu,bpa_bin_id,bpa_prod_id,bpa_prod_rev,bpa_store_id,bpa_capacity,stbin_type
"
"              FROM bin_prod_ass,store_bins
"
"             WHERE bpa_bu = stbin_bu
"
"               AND bpa_bin_id = stbin_bin_id
"
"               AND bpa_store_id =  stbin_store_id
"
"               AND stbin_type <> 'B'
"
"               AND bpa_bu = p_bu
"
"               AND bpa_store_id = c_store_id
"
"               AND bpa_prod_id = c_prod_id
"
"               AND bpa_prod_rev = c_prod_rev
"
"               AND bpa_status = 'A'
"
"            UNION ALL
"
"            SELECT stbin_bu,stbin_bin_id bpa_bin_id,c_prod_id bpa_prod_id,
"
"               c_prod_rev bpa_prod_rev,c_store_id bpa_store_id,
"
"               CASE WHEN stbin_chk_cpcy_flag = 'Y' THEN stbin_capacity ELSE 99999999 END bpa_capacity,
"
"                   stbin_type
"
"              FROM store_bins
"
"             WHERE stbin_bu = p_bu
"
"               AND stbin_bin_id IS NOT NULL
"
"               AND stbin_store_id = c_store_id
"
"               AND stbin_type = 'B'))
"
"      WHERE avail_qty > 0
"
"     ORDER BY DECODE(stbin_type,'S',1,'D',2,'B',3,4),bpa_bin_id;
"
"
"
"    r_bin        c_bin%ROWTYPE;
"
"
"
"    v_bal_qty        NUMBER(12,3);
"
"    v_upd_qty        NUMBER(12,3);
"
"
"
"  BEGIN
"
"
"
"    p_res := 'N';
"
"
"
"    DELETE FROM inv_mat_transfer_bin
"
"     WHERE imtb_bu = p_bu
"
"       AND imtb_doc_no = p_doc_no;
"
"
"
"    FOR r_mr IN c_mr
"
"    LOOP
"
"
"
"      v_bal_qty := r_mr.istln_trans_qty;
"
"
"
"      OPEN c_bin(r_mr.isthd_issueto_id,
"
"                   r_mr.istln_prod_id,
"
"                   r_mr.istln_prod_rev);
"
"      FETCH c_bin INTO r_bin;
"
"        IF c_bin%NOTFOUND THEN
"
"          Raise_Application_Error(-20284,'ICM '||'~'||r_mr.isthd_issueto_id||'~'||r_mr.istln_prod_id||'~'||r_mr.istln_prod_rev);
"
"        END IF;
"
"      CLOSE c_bin;
"
"
"
"      FOR r_bin IN c_bin(r_mr.isthd_issueto_id,r_mr.istln_prod_id,r_mr.istln_prod_rev)
"
"      LOOP
"
"
"
"    IF v_bal_qty > r_bin.avail_qty THEN
"
"      v_upd_qty := r_bin.avail_qty;
"
"      v_bal_qty := v_bal_qty - r_bin.avail_qty;
"
"    ELSE
"
"      v_upd_qty := v_bal_qty;
"
"      v_bal_qty := 0;
"
"    END IF;
"
"
"
"    --IF v_upd_qty > 0 THEN
"
"    INSERT INTO inv_mat_transfer_bin(imtb_bu,
"
"                                     imtb_doc_no,
"
"                     imtb_seq_no,
"
"                     imtb_store_id,
"
"                     imtb_prod_id,
"
"                     imtb_prod_rev,
"
"                     imtb_sys_ls_no,
"
"                     imtb_lot_no,
"
"                     imtb_ser_no,
"
"                     imtb_bin_id,
"
"                     imtb_trans_qty,
"
"                     imtb_stk_trans_qty,
"
"                     imtb_source_id,
"
"                     imtb_source_type,
"
"                     imtb_cre_by,
"
"                     imtb_cre_date
"
"                    )
"
"                  VALUES(p_bu,
"
"                         p_doc_no,
"
"                     r_mr.istln_seq_no,
"
"                     r_mr.isthd_issueto_id,
"
"                     r_mr.istln_prod_id,
"
"                     r_mr.istln_prod_rev,
"
"                     r_mr.isbd_sys_ls_no,
"
"                     r_mr.isbd_lot_no,
"
"                     r_mr.isbd_serial_no,
"
"                     r_bin.bpa_bin_id,
"
"                     v_upd_qty,
"
"                     v_upd_qty/r_mr.istln_conv_factor,
"
"                     r_mr.isbd_source_id,
"
"                     NVL(r_mr.isbd_source_type,'N'),
"
"                     p_user,
"
"                     SYSDATE
"
"                    );
"
"
"
"    --END IF;
"
"
"
"    IF v_bal_qty = 0 THEN
"
"      p_res := 'Y';
"
"      EXIT;
"
"    ELSE
"
"      p_res := 'N';
"
"    END IF;
"
"
"
"      END LOOP;
"
"
"
"    END LOOP c_mr;
"
"
"
"  END proc_alloc_bin_frm_mat_rcpt;
"
"
"
"END pkg_mat_rcpt;"
/
