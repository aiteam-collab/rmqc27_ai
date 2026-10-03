CREATE OR REPLACE
"PACKAGE BODY pkg_rework_mat_cons_ln
"
"IS
"
"
"
"PROCEDURE proc_delete_exceptions_ln(p_bu          VARCHAR2,
"
"                                 p_plnt        VARCHAR2,
"
"                                 p_doc_no       VARCHAR2
"
"                                )
"
"IS
"
"--PRAGMA AUTONOMOUS_TRANSACTION;
"
"BEGIN
"
"
"
"    DELETE
"
"      FROM rework_ord_comp_exceptions
"
"     WHERE roce_bu = p_bu
"
"       AND roce_plnt = p_plnt
"
"       AND roce_doc_no = p_doc_no;
"
"
"
"--COMMIT;
"
"END proc_delete_exceptions_ln;
"
"
"
"PROCEDURE proc_cre_mr_frm_rwk_comp_ln(
"
"                                    p_bu          VARCHAR2,
"
"                                    p_plnt        VARCHAR2,
"
"                                    p_ord_no      VARCHAR2,
"
"                                    p_ord_date    DATE,
"
"                                    p_user        VARCHAR2,
"
"                                    p_lang        NUMBER,
"
"                                    p_mr_no   OUT VARCHAR2,
"
"                                    p_mi_no   OUT VARCHAR2
"
"                                    )
"
"IS
"
"
"
"CURSOR c0
"
"IS
"
"SELECT rocmrd_sou_store_id
"
"  FROM rework_order_comp_dtl,
"
"       rework_ord_comp_mat_req_dtls
"
" WHERE rwocd_bu         = rocmrd_bu
"
"   AND rwocd_plnt       = rocmrd_plnt
"
"   AND rwocd_doc_no     = rocmrd_doc_no
"
"   AND rocmrd_bu        = p_bu
"
"   AND rocmrd_plnt      = p_plnt
"
"   AND rocmrd_doc_no    = p_ord_no
"
"   AND rocmrd_rwk_seq_no = rwocd_seq_no
"
"   AND rocmrd_cons_qty  > 0
"
"   ANd rocmrd_mr_qty    > 0
"
"   AND ((rocmrd_cons_qty - rocmrd_rqrd_qty ) - rocmrd_mr_qty) > 0
"
"   AND rocmrd_mr_req_no IS NULL
"
"   AND rocmrd_var_prod_id IS NULL
"
"   AND NOT EXISTS(SELECT 1
"
"                    FROM inv_material_request_hd
"
"                   WHERE imrhd_bu      = rocmrd_bu
"
"                     AND imrhd_rqst_no = rocmrd_mr_req_no
"
"                     AND imrhd_status  = 'E')
"
"GROUP BY rocmrd_sou_store_id
"
"UNION ALL
"
"SELECT rocmrd_sou_store_id
"
"  FROM rework_order_comp_dtl,
"
"       rework_ord_comp_mat_req_dtls
"
" WHERE rwocd_bu         = rocmrd_bu
"
"   AND rwocd_plnt       = rocmrd_plnt
"
"   AND rwocd_doc_no     = rocmrd_doc_no
"
"   AND rocmrd_rwk_seq_no = rwocd_seq_no
"
"   AND rocmrd_bu = p_bu
"
"   AND rocmrd_plnt = p_plnt
"
"   AND rocmrd_doc_no = p_ord_no
"
"   AND rocmrd_cons_qty > 0
"
"   ANd rocmrd_mr_qty = 0
"
"   AND ((rocmrd_cons_qty ) - rocmrd_mr_qty) > 0
"
"   AND rocmrd_mr_req_no IS NULL
"
"    AND rocmrd_var_prod_id IS NULL
"
"   AND NOT EXISTS(SELECT 1
"
"                    FROM inv_material_request_hd
"
"                   WHERE imrhd_bu      = rocmrd_bu
"
"                     AND imrhd_rqst_no = rocmrd_mr_req_no
"
"                     AND imrhd_status  = 'E')
"
"GROUP BY rocmrd_sou_store_id;
"
"
"
"CURSOR c1(c_store_id VARCHAR2)
"
"IS
"
"SELECT     rocmrd_prod_id      ,
"
"    rocmrd_prod_rev   ,
"
"    rocmrd_cons_qty   ,
"
"    rocmrd_rqrd_qty   ,
"
"    rocmrd_mr_qty     ,
"
"    rocmrd_seq_no,
"
"    rwocd_seq_no,
"
"    rwocd_rw_ord_no,
"
"    rwocd_prod_ord_no
"
"  FROM rework_order_comp_dtl,rework_ord_comp_mat_req_dtls
"
" WHERE rwocd_bu         = rocmrd_bu
"
"   AND rwocd_plnt       = rocmrd_plnt
"
"   AND rwocd_doc_no     = rocmrd_doc_no
"
"   AND rocmrd_rwk_seq_no = rwocd_seq_no
"
"   AND rocmrd_bu = p_bu
"
"   AND rocmrd_plnt = p_plnt
"
"   AND rocmrd_doc_no = p_ord_no
"
"   AND rocmrd_sou_store_id = c_store_id
"
"   AND rocmrd_cons_qty > 0
"
"   AND rocmrd_mr_qty > 0
"
"   AND ((rocmrd_cons_qty - rocmrd_rqrd_qty ) - rocmrd_mr_qty) > 0
"
"   AND rocmrd_mr_req_no IS NULL
"
"   AND rocmrd_var_prod_id IS NULL
"
"UNION ALL
"
"SELECT     rocmrd_prod_id      ,
"
"    rocmrd_prod_rev   ,
"
"    rocmrd_cons_qty   ,
"
"    rocmrd_rqrd_qty   ,
"
"    rocmrd_mr_qty     ,
"
"    rocmrd_seq_no,
"
"    rwocd_seq_no,
"
"    rwocd_rw_ord_no,
"
"    rwocd_prod_ord_no
"
"  FROM rework_order_comp_dtl, rework_ord_comp_mat_req_dtls
"
" WHERE rwocd_bu         = rocmrd_bu
"
"   AND rwocd_plnt       = rocmrd_plnt
"
"   AND rwocd_doc_no     = rocmrd_doc_no
"
"   AND rocmrd_rwk_seq_no = rwocd_seq_no
"
"   and rocmrd_bu = p_bu
"
"   AND rocmrd_plnt = p_plnt
"
"   AND rocmrd_doc_no = p_ord_no
"
"   AND rocmrd_sou_store_id = c_store_id
"
"   AND rocmrd_cons_qty > 0
"
"   AND rocmrd_mr_qty = 0
"
"   AND ((rocmrd_cons_qty ) - rocmrd_mr_qty) > 0
"
"   AND rocmrd_mr_req_no IS NULL
"
"   AND rocmrd_var_prod_id IS NULL
"
"  ORDER BY  rocmrd_seq_no;
"
"
"
"CURSOR c2(c_loc_id     VARCHAR2)
"
"IS
"
"SELECT store_id
"
"  FROM stores
"
" WHERE store_bu          = p_bu
"
"   AND store_plnt        = p_plnt
"
"   AND store_physical    = 'R'
"
"   AND store_plnt_loc_id = c_loc_id;
"
"
"
"CURSOR c3(c_prod_id        VARCHAR2,
"
"      c_prod_rev        NUMBER)
"
"    IS
"
"SELECT prodplnt_mi_method
"
"  FROM products,
"
"       prod_plants
"
" WHERE prod_bu          = prodplnt_bu
"
"   AND prod_id           = prodplnt_prod_id
"
"   AND prod_rev      = prodplnt_prod_rev
"
"   AND prod_status       = 'A'
"
"   AND prodplnt_status   = 'A'
"
"   AND prodplnt_bu       = p_bu
"
"   AND prodplnt_prod_id  = c_prod_id
"
"   AND prodplnt_prod_rev = c_prod_rev;
"
"
"
"CURSOR c4
"
"    IS
"
"SELECT icmctrl_auto_mr_issue_flag
"
"  FROM icm_control
"
" WHERE icmctrl_bu = p_bu;
"
"
"
"CURSOR c5(c_doc_no         VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM inv_stock_trans_hd
"
" WHERE isthd_bu     = p_bu
"
"   AND isthd_doc_no = c_doc_no;
"
"
"
" CURSOR c6
"
" IS
"
" SELECT *
"
"   FROM rework_order_comp_hd
"
"  WHERE rwochd_bu = p_bu
"
"    AND rwochd_plnt = p_plnt
"
"    AND rwochd_doc_no = p_ord_no;
"
"
"
" CURSOR c7(c_seq_no     NUMBER)
"
" IS
"
" SELECT *
"
"   FROM rework_order_comp_dtl
"
"  WHERE rwocd_bu     = p_bu
"
"    AND rwocd_plnt   = p_plnt
"
"    AND rwocd_doc_no = p_ord_no;
"
"
"
"   v_year            NUMBER;
"
"   v_period            NUMBER;
"
"   v_emp_id                 employees.emp_emp_id%TYPE;
"
"   v_pos_id                 hr_positions.hrpos_pos_id%TYPE;
"
"   v_pos_desc               hr_positions.hrpos_pos_name1%TYPE;
"
"   v_dept_id                departments.dept_id%TYPE;
"
"   v_emp_name               VARCHAR2 (100);
"
"   v_dummy                  VARCHAR2 (50);
"
"   v_seq_no            NUMBER;
"
"   v_rqst_no            VARCHAR2 (30);
"
"   v_mi_method            VARCHAR2 (5);
"
"   v_unit_cost            NUMBER (17,5);
"
"   v_appr_res1            VARCHAR2 (100);
"
"   v_appr_res2            VARCHAR2 (100);
"
"   v_iss_doc_no            VARCHAR2 (100);
"
"   v_dc_no            VARCHAR2 (100);
"
"   v_pack_dc_no            VARCHAR2 (100);
"
"   v_dc_doc_no            VARCHAR2 (4000);
"
"   v_dc_pack_no                VARCHAR2 (4000);
"
"
"
"   v_rqst_no1            VARCHAR2 (4000);
"
"   v_iss_doc_no1        VARCHAR2 (4000);
"
"   v_pfx                VARCHAR2(10);
"
"
"
"   cr2                c2%ROWTYPE;
"
"   cr3                c3%ROWTYPE;
"
"   cr4                c4%ROWTYPE;
"
"   cr5                c5%ROWTYPE;
"
"   cr6                c6%ROWTYPE;
"
"   cr7                c7%ROWTYPE;
"
"
"
"   v_frm_store_id             VARCHAR2(10);
"
"   v_to_store                 VARCHAR2(10);
"
"
"
"   v_so_pfx       VARCHAR2(5);
"
"   v_so_no        VARCHAR2(15);
"
"   v_so_seq_no    NUMBER(5);
"
"   v_so_sub_seq   NUMBER(5);
"
"   v_so_schld_desc    VARCHAR2(200);
"
"      v_cons_qty                 NUMBER(12,3) := 0;
"
"   v_lo_no   VARCHAR2(1000);
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
"BEGIN
"
"         UPDATE rework_ord_comp_mat_req_dtls
"
"            SET rocmrd_mr_req_no = NULL,
"
"                rocmrd_mr_qty    = 0,
"
"                rocmrd_upd_by = p_user,
"
"                rocmrd_upd_date = SYSDATE
"
"          WHERE rocmrd_bu = p_bu
"
"            AND rocmrd_plnt = p_plnt
"
"            AND rocmrd_doc_no    = p_ord_no
"
"            AND rocmrd_mr_req_no IS NULL ;
"
"
"
"         OPEN c6;
"
"         FETCH c6 INTO cr6;
"
"         CLOSE c6;
"
"
"
"
"
"
"
"
"
"   proc_find_year_period(p_bu,
"
"                p_ord_date,
"
"                v_year,
"
"                v_period);
"
"
"
"  proc_get_emp_det(p_bu,
"
"                     p_user,
"
"                     v_emp_id,
"
"                     v_emp_name,
"
"                     v_pos_id,
"
"                     v_pos_desc,
"
"                     v_dept_id,
"
"                     v_dummy,
"
"                     p_lang);
"
"--  RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||P_BU||'/'||p_plnt||'/'||p_ord_no);
"
"   FOR cr0 IN c0
"
"   LOOP
"
"
"
"
"
"
"
"
"
"       OPEN c2(cr6.rwochd_plnt_loc_id);
"
"       FETCH c2 INTO cr2;
"
"
"
"
"
"       IF c2%NOTFOUND OR cr2.store_id IS NULL THEN
"
"         raise_application_error(-20768,'ICM');
"
"       ELSE
"
"         v_to_store :=  cr2.store_id;
"
"       END IF;
"
"      CLOSE c2;
"
"
"
"      v_frm_store_id := cr0.rocmrd_sou_store_id;
"
"    --  v_rqst_no := func_find_icm_next_id(p_bu, p_ord_date, 'MR', cr0.rocmrd_sou_store_id, p_user);
"
"
"
"
"
"
"
"
"
"                        BEGIN
"
"                        SELECT adp_pfx
"
"                           INTO v_pfx
"
"                           FROM appl_doc_prefixes,appl_users,appl_doc_pfx_loc
"
"                          WHERE adp_bu = p_bu
"
"                        AND adp_plnt = p_plnt
"
"                        AND appluser_bu = adp_bu
"
"                        AND adp_bu = adpl_bu
"
"                            AND adp_pfx = adpl_pfx
"
"                            AND adpl_loc_id = cr6.rwochd_plnt_loc_id
"
"                        AND appluser_id = p_user
"
"                        AND adp_doc_type = 'MR'
"
"                        AND ROWNUM = 1;
"
"                        EXCEPTION
"
"                            WHEN NO_DATA_FOUND THEN
"
"                              raise_application_error(-20853,'ADM' || 'Prefix not defined');
"
"                        END ;
"
"
"
"                           v_rqst_no := func_find_pfx_nextno(p_bu,p_ord_date,v_pfx,p_user);
"
"--    Raise_application_Error(-20999,v_emp_id);
"
"      INSERT INTO inv_material_request_hd (imrhd_bu        ,
"
"                                           imrhd_rqst_no    ,
"
"                                           imrhd_rqstto_store_id,
"
"                                           imrhd_rqst_date    ,
"
"                                           imrhd_year        ,
"
"                                           imrhd_period        ,
"
"                                           imrhd_rqstby_type    ,
"
"                                           imrhd_rqstby_id    ,
"
"                                           imrhd_status        ,
"
"                                           imrhd_reference    ,
"
"                                           imrhd_control_person    ,
"
"                                           imrhd_reqstr_id    ,
"
"                                           imrhd_reqstr_name    ,
"
"                                           imrhd_reqstr_pos_id    ,
"
"                                           imrhd_reqstr_pos_name,
"
"                                           imrhd_rqst_dept_id    ,
"
"                                           imrhd_appr_flag    ,
"
"                                           imrhd_no_of_try    ,
"
"                                           imrhd_no_of_issues    ,
"
"                                           imrhd_rec_source    ,
"
"                                           imrhd_cre_by        ,
"
"                                           imrhd_cre_date    ,
"
"                                           imrhd_plnt        ,
"
"                                           imrhd_source_flag    ,
"
"                                           imrhd_ref_unit    ,
"
"                                           imrhd_plnt_loc_id,
"
"                                           imrhd_plnt_loc_name,
"
"                                           imrhd_emp_id)
"
"                         VALUES (p_bu            ,
"
"                             v_rqst_no        ,
"
"                             v_frm_store_id    ,
"
"                             p_ord_date        ,
"
"                             v_year        ,
"
"                             v_period        ,
"
"                             'W'            ,
"
"                             v_to_store    ,
"
"                             DECODE(func_find_matreq_type (p_bu), 'Y', 'N', 'E'),
"
"                             'MATERIAL REQUEST FOR REWORK COMPLETION ',
"
"                             p_user        ,
"
"                             v_emp_id        ,
"
"                             v_emp_name        ,
"
"                             v_pos_id        ,
"
"                             v_pos_desc        ,
"
"                             v_dept_id        ,
"
"                             DECODE(func_find_matreq_type (p_bu), 'Y', 'Y', 'N'),
"
"                             0            ,
"
"                             0            ,
"
"                             'S'            ,
"
"                             p_user        ,
"
"                             SYSDATE        ,
"
"                             p_plnt    ,
"
"                             'S'            ,
"
"                             p_plnt    ,
"
"                          cr6.rwochd_plnt_loc_id,
"
"                           func_find_plnt_loc_qry_desc(p_bu,cr6.rwochd_plnt_loc_id),
"
"                           v_emp_id
"
"                           );
"
"
"
"
"
"      FOR cr1 IN c1(v_frm_store_id)
"
"      LOOP
"
"
"
"--         OPEN c7(cr1.rwocd_seq_no);
"
"--         FETCH c7 INTO cr7;
"
"--         CLOSE c7;
"
"
"
"
"
"       -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||cr0.rocmrd_sou_store_id);
"
"
"
"          OPEN c3(cr1.rocmrd_prod_id, cr1.rocmrd_prod_rev);
"
"          FETCH c3 INTO cr3;
"
"
"
"            IF c3%FOUND THEN
"
"               v_mi_method := cr3.prodplnt_mi_method;
"
"            ELSE
"
"               v_mi_method := 'N';
"
"            END IF;
"
"
"
"         CLOSE c3;
"
"
"
"    IF cr1.rocmrd_mr_qty > 0 THEN
"
"        v_cons_qty := ((cr1.rocmrd_cons_qty - cr1.rocmrd_rqrd_qty) - cr1.rocmrd_mr_qty);
"
"    ELSE
"
"        v_cons_qty := (cr1.rocmrd_cons_qty  - cr1.rocmrd_mr_qty);
"
"    END IF;
"
"
"
"         IF func_find_prod_indicator_type(p_bu,cr1.rocmrd_prod_id,cr1.rocmrd_prod_rev) = 'I' THEN
"
"           v_so_pfx       := cr6.rwochd_so_pfx  ;
"
"           v_so_no        := cr6.rwochd_so_no;
"
"           v_so_seq_no    := cr6.rwochd_so_seq_no;
"
"           v_so_sub_seq   :=  cr6.rwochd_so_sub_seq_no;
"
"           v_so_schld_desc:= cr6.rwochd_so_schld_desc;
"
"         ELSE
"
"                    v_so_pfx       :=  NULL;
"
"                v_so_no        :=  NULL;
"
"                v_so_seq_no    :=  NULL;
"
"                v_so_sub_seq   :=  NULL;
"
"                    v_so_schld_desc:=  NULL;
"
"
"
"         END IF;
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
"         UPDATE inv_material_request_ln
"
"            SET imrln_requested_qty     = imrln_requested_qty    + v_cons_qty,
"
"                imrln_to_allocated_qty     = imrln_to_allocated_qty + v_cons_qty,
"
"                imrln_upd_by         = p_user,
"
"                imrln_upd_date         = SYSDATE
"
"          WHERE imrln_bu         = p_bu
"
"            AND imrln_plnt              = p_plnt
"
"            AND imrln_rqst_no         = v_rqst_no
"
"            AND imrln_prod_id         = cr1.rocmrd_prod_id
"
"            AND imrln_prod_rev         = cr1.rocmrd_prod_rev
"
"        AND imrln_ord_no        = cr1.rwocd_rw_ord_no;
"
"
"
"            IF SQL%FOUND THEN
"
"
"
"                DBMS_OUTPUT.PUT_LINE('Outside'||' ' ||cr1.rocmrd_prod_id||' ' ||cr1.rocmrd_rqrd_qty);
"
"            END IF;
"
"
"
"     IF SQL%NOTFOUND THEN
"
"
"
"        DBMS_OUTPUT.PUT_LINE('Inside'||' ' ||cr1.rocmrd_prod_id||' ' ||cr1.rocmrd_rqrd_qty);
"
"
"
"            SELECT NVL(MAX(imrln_seq_no),0) + 1
"
"              INTO v_seq_no
"
"              FROM inv_material_request_ln
"
"             WHERE imrln_bu     = p_bu
"
"              AND imrln_rqst_no = v_rqst_no;
"
"
"
"        v_unit_cost := func_find_unitcost(p_bu,cr1.rocmrd_prod_id,cr1.rocmrd_prod_rev,v_frm_store_id);
"
"
"
"   -- if v_cons_qty = 4   THEN
"
"    --  RAISE_APPLICATION_ERROR(-20999,'HRM 1'||'/'||cr1.rocmrd_prod_id||'/'||cr1.rocmrd_prod_rev||'/'||cr1.rwocd_rw_ord_no);
"
"   -- END IF;
"
"
"
"    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||cr1.rocmrd_prod_id||'/'||cr1.rocmrd_prod_rev||'/'||cr7.rwocd_rw_ord_no);
"
"
"
"         INSERT INTO inv_material_request_ln (imrln_bu        ,
"
"                                              imrln_plnt             ,
"
"                                                 imrln_rqst_no        ,
"
"                                                 imrln_seq_no        ,
"
"                                                 imrln_prod_id        ,
"
"                                                 imrln_prod_rev        ,
"
"                         imrln_prod_subcls,
"
"                                                 imrln_prod_cls        ,
"
"                                                 imrln_unit_cost    ,
"
"                                                 imrln_requested_qty    ,
"
"                                                 imrln_ord_qty        ,
"
"                                                 imrln_uom        ,
"
"                                                 imrln_prod_uom        ,
"
"                                                 imrln_conv_factor    ,
"
"                                                 imrln_mi_allocated_qty    ,
"
"                                                 imrln_issued_qty    ,
"
"                                                 imrln_to_allocated_qty    ,
"
"                                                 imrln_reference    ,
"
"                                                 imrln_substiute    ,
"
"                                                 imrln_rqrd_date    ,
"
"                                                 imrln_rqrd_year    ,
"
"                                                 imrln_rqrd_period    ,
"
"                                                 imrln_proj_task_id    ,
"
"                                                 imrln_status        ,
"
"                                                 imrln_process_id    ,
"
"                                                 imrln_work_center    ,
"
"                                                 imrln_sf_code        ,
"
"                                                 imrln_mat_type        ,
"
"                                                 imrln_cre_by        ,
"
"                                                 imrln_cre_date        ,
"
"                                                 imrln_ord_type        ,
"
"                                                 imrln_po_ord_no    ,
"
"                                                 imrln_ord_no        ,
"
"                                                 imrln_ord_pfx,
"
"                                                 imrln_mi_method    ,
"
"                                                 imrln_par_prod_id    ,
"
"                                                 imrln_par_prod_rev    ,
"
"                                                 imrln_type        ,
"
"                         imrln_so_pfx        ,
"
"                         imrln_so_no        ,
"
"                         imrln_so_seq_no    ,
"
"                         imrln_so_sub_seq_no    ,
"
"                         imrln_so_schld_desc     ,
"
"                         imrln_proj_id        ,
"
"                         imrln_task_id        ,
"
"                         imrln_sys_ls_no    ,
"
"                         imrln_lot_no        ,
"
"                         imrln_ser_no        ,
"
"                         imrln_expiry_date   ,
"
"                         imrln_store_id )
"
"                     VALUES (p_bu            ,
"
"                             p_plnt         ,
"
"                         v_rqst_no        ,
"
"                         v_seq_no        ,
"
"                         cr1.rocmrd_prod_id    ,
"
"                         cr1.rocmrd_prod_rev    ,
"
"                         func_find_product_subclass(p_bu, p_plnt, cr1.rocmrd_prod_id, cr1.rocmrd_prod_rev),
"
"                         func_find_product_class(p_bu, p_plnt, cr1.rocmrd_prod_id, cr1.rocmrd_prod_rev),
"
"                         v_unit_cost        ,
"
"                         v_cons_qty    ,
"
"                         v_cons_qty   ,
"
"                         func_find_product_uom(p_bu,cr1.rocmrd_prod_id, cr1.rocmrd_prod_rev),
"
"                         func_find_product_uom(p_bu,cr1.rocmrd_prod_id, cr1.rocmrd_prod_rev),
"
"                         1            ,
"
"                         0            ,
"
"                         0            ,
"
"                         v_cons_qty   ,
"
"                         'MATERIAL REQUEST FOR REWORK ORDER ' ||p_ord_no ,
"
"                         'N'            ,
"
"                         p_ord_date            ,
"
"                         v_year            ,
"
"                         v_period        ,
"
"                         NULL            ,
"
"                         DECODE(func_find_matreq_type(p_bu), 'Y', 'N', 'E'),
"
"                         NULL    ,
"
"                         NULL    ,
"
"                         NULL    ,
"
"                          'S'   ,
"
"                         p_user            ,
"
"                         SYSDATE        ,
"
"                         'RW'            ,
"
"                        cr1.rwocd_prod_ord_no,-- cr6.rwochd_prod_ord_no,
"
"                        cr1.rwocd_rw_ord_no, -- cr6.rwochd_rw_ord_no,
"
"                         (SELECT rwohd_ord_pfx
"
"                            FROM rework_order_hd
"
"                           WHERE rwohd_bu       = p_bu
"
"                             AND rwohd_plnt     = p_plnt
"
"                             AND rwohd_ord_no   = cr1.rwocd_rw_ord_no),--cr6.rwochd_rw_ord_no),
"
"                         v_mi_method        ,
"
"                         NULL            ,
"
"                         NULL            ,
"
"                         CASE WHEN v_so_pfx IS NOT NULL THEN 'SO' ELSE 'NA' END,
"
"                         v_so_pfx    ,
"
"                         v_so_no    ,
"
"                         v_so_seq_no    ,
"
"                         v_so_sub_seq,
"
"                         v_so_schld_desc,
"
"                         NULL    ,
"
"                         NULL    ,
"
"                         NULL    ,
"
"                         NULL    ,
"
"                         NULL    ,
"
"                         NULL      ,
"
"                         v_frm_store_id      );
"
"
"
"         END IF;
"
"
"
"         UPDATE rework_ord_comp_mat_req_dtls
"
"            SET rocmrd_mr_req_no = v_rqst_no,
"
"                rocmrd_mr_qty    = v_cons_qty,
"
"                rocmrd_upd_by = p_user,
"
"                rocmrd_upd_date = SYSDATE
"
"          WHERE rocmrd_bu = p_bu
"
"            AND rocmrd_plnt = p_plnt
"
"            AND rocmrd_doc_no = p_ord_no
"
"            AND rocmrd_seq_no = cr1.rocmrd_seq_no
"
"            AND rocmrd_rwk_seq_no = cr1.rwocd_seq_no;
"
"
"
"      END LOOP;  --c1 End loop
"
"
"
"      proc_pom_icm_doc_approve (p_bu        ,
"
"                      'MR'        ,
"
"                      p_user        ,
"
"                      v_rqst_no    ,
"
"                      NULL        ,
"
"                      p_plnt    ,
"
"                      v_appr_res1    ,
"
"                      v_appr_res2    ,
"
"                      v_lo_no         ,
"
"                      p_lang        );
"
"
"
"      OPEN c4;
"
"      FETCH c4 INTO cr4;
"
"
"
"         IF c4%FOUND THEN
"
"
"
"            IF cr4.icmctrl_auto_mr_issue_flag = 'Y' THEN
"
"
"
"           UPDATE inv_material_request_ln
"
"              SET imrln_sel_flag = 'Y',
"
"                  imrln_sel_user = p_user,
"
"                  imrln_upd_by   = p_user,
"
"                  imrln_upd_date = SYSDATE
"
"            WHERE imrln_bu       = p_bu
"
"              AND imrln_plnt     = p_plnt
"
"              AND imrln_rqst_no  = v_rqst_no;
"
"
"
"           proc_alloc_frm_mat_req(p_bu        ,
"
"                             p_ord_date,
"
"                          p_user        ,
"
"                          null,
"
"                          p_lang        ,
"
"                          v_iss_doc_no  ,
"
"                          v_dc_doc_no,
"
"                          v_dc_pack_no
"
"                          );
"
"
"
"               IF v_iss_doc_no IS NOT NULL THEN
"
"
"
"                  OPEN c5(v_iss_doc_no);
"
"                  FETCH c5 INTO cr5;
"
"
"
"                     IF c5%FOUND THEN
"
"
"
"                        proc_issue_mat_frm_mi(p_bu,
"
"                          cr5.isthd_plnt,
"
"                          cr5.isthd_doc_no,
"
"                          p_user,
"
"                          null,
"
"                          p_lang,
"
"                          v_dc_no,
"
"                          v_pack_dc_no);
"
"                     END IF;
"
"
"
"                  CLOSE c5;
"
"
"
"                  v_iss_doc_no1 := v_iss_doc_no1||v_iss_doc_no||' ';
"
"
"
"               END IF;  --End of v_iss_doc_no IS NOT NULL
"
"
"
"            END IF;  --End of Control flag
"
"
"
"         END IF;  --End of c3 Found
"
"
"
"      CLOSE c4;
"
"
"
"      v_rqst_no1 := v_rqst_no1||v_rqst_no||' ';
"
"
"
"   END LOOP;  --c0 End loop
"
"
"
"
"
"   /*IF v_rqst_no1 IS NOT NULL THEN
"
"
"
"        UPDATE rework_order_hd
"
"           SET rwohd_mr_cre_flag = 'Y',
"
"               rwohd_mr_no = v_rqst_no
"
"         WHERE rwohd_bu = p_bu
"
"           AND rwohd_plnt = p_plnt
"
"           AND rwohd_ord_no = p_ord_no;
"
"
"
"   END IF;*/
"
"
"
"   IF v_iss_doc_no1 IS NOT NULL THEN
"
"      p_mi_no := func_find_order_no_substr(v_iss_doc_no1);
"
"   END IF;
"
"
"
"   IF v_rqst_no1 IS NOT NULL THEN
"
"      p_mr_no := func_find_order_no_substr(v_rqst_no1);
"
"   END IF;
"
"
"
"    -- RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"END proc_cre_mr_frm_rwk_comp_ln;
"
"
"
"PROCEDURE proc_ins_mat_req_ln(p_bu          VARCHAR2,
"
"                           p_plnt        VARCHAR2,
"
"                           p_doc_no         VARCHAR2,
"
"                           p_user         VARCHAR2
"
"                       )
"
"IS
"
"
"
"CURSOR c2
"
"IS
"
"SELECT store_id
"
"  FROM stores
"
" WHERE store_bu     = p_bu
"
"   AND store_plnt     = p_plnt
"
"   AND store_physical     = 'R';
"
"
"
"
"
"v_seq_no    NUMBER := 0;
"
"v_cnt        NUMBER ;
"
"v_loc_id     VARCHAR2(10);
"
"cr2    c2%ROWTYPE;
"
"
"
"
"
"
"
"BEGIN
"
"OPEN c2;
"
"FETCH c2 INTO cr2;
"
"IF c2%NOTFOUND THEN
"
"  raise_application_error(-20270,'ICM');
"
"END IF;
"
"CLOSE c2;
"
"
"
"    SELECT COUNT(1)
"
"      INTO v_cnt
"
"      FROM rework_ord_mat_req_dtls
"
"     WHERE romrd_bu              = p_bu
"
"       AND romrd_plnt            = p_plnt
"
"       AND EXISTS (SELECT 1
"
"             FROM rework_order_comp_dtl
"
"            WHERE rwocd_bu    = p_bu
"
"              AND rwocd_plnt    = p_plnt
"
"              AND rwocd_doc_no    = p_doc_no
"
"              AND romrd_rwk_ord_no = rwocd_rw_ord_no);
"
"
"
"
"
"   BEGIN
"
"     SELECT rwochd_plnt_loc_id
"
"       INTO v_loc_id
"
"       FROM rework_order_comp_hd
"
"      WHERE rwochd_bu            =    p_bu
"
"        AND rwochd_plnt            =    p_plnt
"
"        AND rwochd_doc_no     =    p_doc_no;
"
"
"
"   EXCEPTION WHEN OTHERS THEN
"
"     Raise_application_error(-20999,'HRM'||'/'||v_loc_id||'/'||p_plnt);
"
"   END;
"
"
"
"
"
"                   UPDATE rework_ord_comp_mat_req_dtls
"
"                      SET rocmrd_sou_store_id = func_find_deflt_storeid(p_bu,p_plnt,v_loc_id, rocmrd_prod_id,rocmrd_prod_rev,'N'),
"
"                          rocmrd_upd_by = p_user,
"
"                          rocmrd_upd_date = SYSDATE
"
"                   WHERE rocmrd_bu = p_bu
"
"                     AND rocmrd_plnt = p_plnt
"
"                     AND rocmrd_doc_no = p_doc_no;
"
"
"
"    IF v_cnt  = 0 THEN
"
"
"
"      DELETE rework_ord_mat_req_dtls
"
"       WHERE romrd_bu         = p_bu
"
"         AND romrd_plnt     = p_plnt
"
"         AND EXISTS (SELECT 1
"
"             FROM rework_order_comp_dtl
"
"            WHERE rwocd_bu    = p_bu
"
"              AND rwocd_plnt    = p_plnt
"
"              AND rwocd_doc_no    = p_doc_no
"
"              AND romrd_rwk_ord_no = rwocd_rw_ord_no);
"
"
"
"        FOR r_mat IN (SELECT *
"
"            FROM rework_ord_comp_mat_req_dtls,
"
"                 rework_order_comp_dtl
"
"               WHERE rwocd_bu    = rocmrd_bu
"
"              AND rwocd_plnt    = rocmrd_plnt
"
"              AND rwocd_doc_no    = rocmrd_doc_no
"
"              AND rocmrd_rwk_seq_no = rwocd_seq_no
"
"                 AND rocmrd_bu    = p_bu
"
"             AND rocmrd_plnt  = p_plnt
"
"             AND rocmrd_doc_no = p_doc_no
"
"                 )
"
"        LOOP
"
"
"
"        UPDATE rework_ord_mat_req_dtls
"
"                SET romrd_rqrd_qty = romrd_rqrd_qty + r_mat.rocmrd_rqrd_qty
"
"              WHERE romrd_bu    = p_bu
"
"                AND romrd_plnt   = p_plnt
"
"                AND romrd_rwk_ord_no   = r_mat.rwocd_rw_ord_no
"
"                AND romrd_prod_id   = r_mat.rocmrd_prod_id
"
"                AND romrd_prod_rev  = r_mat.rocmrd_prod_rev
"
"                AND romrd_sou_store_id = func_find_deflt_storeid(p_bu,p_plnt,V_LOC_ID, r_mat.rocmrd_prod_id,r_mat.rocmrd_prod_rev,'N') ;
"
"
"
"                IF SQL%NOTFOUND THEN
"
"
"
"                v_seq_no := v_seq_no + 1;
"
"
"
"                     INSERT INTO rework_ord_mat_req_dtls(
"
"                                    romrd_bu                  ,
"
"                                    romrd_plnt                ,
"
"                                    romrd_rwk_ord_no          ,
"
"                                    romrd_seq_no              ,
"
"                                    romrd_prod_id             ,
"
"                                    romrd_prod_rev            ,
"
"                                    romrd_sou_store_id        ,
"
"                                    romrd_uom                 ,
"
"                                    romrd_rqrd_qty            ,
"
"                                    romrd_cre_by              ,
"
"                                    romrd_cre_date            ,
"
"                                    romrd_upd_by              ,
"
"                                    romrd_upd_date  ,
"
"                                    romrd_cons_store
"
"                                    )
"
"                             VALUES(p_bu                  ,
"
"                                    p_plnt                ,
"
"                                    r_mat.rwocd_rw_ord_no          ,
"
"                                    v_seq_no              ,
"
"                                    r_mat.rocmrd_prod_id             ,
"
"                                    r_mat.rocmrd_prod_rev            ,
"
"                                    func_find_deflt_storeid(p_bu,p_plnt,v_loc_id, r_mat.rocmrd_prod_id,r_mat.rocmrd_prod_rev,'N')         ,
"
"                                    func_find_product_uom(p_bu,r_mat.rocmrd_prod_id,r_mat.rocmrd_prod_rev)                 ,
"
"                                    r_mat.rocmrd_rqrd_qty            ,
"
"                                    p_user              ,
"
"                                    SYSDATE            ,
"
"                                    NULL              ,
"
"                                    NULL            ,
"
"                                    cr2.store_id
"
"                                    );
"
"             END IF;
"
"
"
"            UPDATE rework_ord_comp_mat_req_dtls
"
"               SET rocmrd_cons_store = cr2.store_id,
"
"                   rocmrd_sou_store_id = func_find_deflt_storeid(p_bu,p_plnt,v_loc_id, r_mat.rocmrd_prod_id,r_mat.rocmrd_prod_rev,'N'),
"
"                   rocmrd_upd_by = p_user,
"
"                   rocmrd_upd_date = SYSDATE
"
"            WHERE rocmrd_bu = p_bu
"
"              AND rocmrd_plnt = p_plnt
"
"              AND rocmrd_doc_no = p_doc_no
"
"              AND rocmrd_seq_no = r_mat.rocmrd_seq_no
"
"          and rocmrd_rwk_seq_no = r_mat.rwocd_seq_no;
"
"
"
"IF func_find_prod_var_group_type(p_bu,r_mat.rocmrd_prod_id,r_mat.rocmrd_prod_rev) IN('Y') THEN
"
"
"
"           FOR c_vi IN (SELECT *
"
"                  FROM prod_variant_group_asso
"
"                 WHERE pvga_bu = p_bu
"
"                   AND pvga_var_group_id = r_mat.rocmrd_prod_id
"
"                   AND pvga_var_group_rev = r_mat.rocmrd_prod_rev
"
"               )
"
"           LOOP
"
"                  SELECT NVL(MAX(rocmrd_seq_no),0)+ 1
"
"                    INTO v_seq_no
"
"                    FROM rework_ord_comp_mat_req_dtls
"
"                    WHERE rocmrd_bu = p_bu
"
"                 AND rocmrd_plnt = p_plnt
"
"                 AND rocmrd_doc_no = p_doc_no;
"
"
"
"           INSERT INTO rework_ord_comp_mat_req_dtls(rocmrd_bu              ,
"
"                            rocmrd_plnt            ,
"
"                            rocmrd_doc_no          ,
"
"                            rocmrd_seq_no          ,
"
"                            rocmrd_prod_id         ,
"
"                            rocmrd_prod_rev        ,
"
"                            rocmrd_cons_store      ,
"
"                            rocmrd_rqrd_qty        ,
"
"                            rocmrd_cons_qty        ,
"
"                            rocmrd_alloc_qty       ,
"
"                            rocmrd_unit_cost       ,
"
"                            rocmrd_ext_cost        ,
"
"                            rocmrd_cre_by          ,
"
"                            rocmrd_cre_date        ,
"
"                            rocmrd_upd_by          ,
"
"                            rocmrd_upd_date        ,
"
"                            rocmrd_sou_store_id,
"
"                            rocmrd_mr_req_no       ,
"
"                            rocmrd_var_prod_id     ,
"
"                            rocmrd_var_prod_rev,
"
"                rocmrd_rwk_seq_no)
"
"                         VALUES(p_bu              ,
"
"                            p_plnt            ,
"
"                            p_doc_no          ,
"
"                            v_seq_no          ,
"
"                            c_vi.pvga_var_item         ,
"
"                            c_vi.pvga_var_rev        ,
"
"                            cr2.store_id      ,
"
"                            0        ,
"
"                            0        ,
"
"                            0       ,
"
"                            r_mat.rocmrd_unit_cost       ,
"
"                            0        ,
"
"                            p_user,
"
"                            SYSDATE        ,
"
"                            NULL          ,
"
"                            NULL        ,
"
"                            func_find_deflt_storeid(p_bu,p_plnt,v_loc_id, c_vi.pvga_var_item,c_vi.pvga_var_rev,'N'),
"
"                            NULL       ,
"
"                            r_mat.rocmrd_prod_id     ,
"
"                            r_mat.rocmrd_prod_rev,
"
"                r_mat.rwocd_seq_no
"
"                );
"
"       END LOOP;
"
"END IF;
"
"
"
"        END LOOP r_mat;
"
"
"
"    END IF;
"
"END proc_ins_mat_req_ln;
"
"
"
"PROCEDURE proc_chk_exception_ln(p_bu          VARCHAR2,
"
"                             p_plnt        VARCHAR2,
"
"                             p_doc_no       VARCHAR2,
"
"                             p_user           VARCHAR2
"
"                             )
"
"  IS
"
"CURSOR c_mat_req
"
"  IS
"
"SELECT (rocmrd_cons_qty - rocmrd_alloc_qty) rocmrd_cons_qty,
"
"       rocmrd_prod_id,rocmrd_prod_rev,rocmrd_cons_store,rocmrd_seq_no,rwocd_rw_ord_no
"
"  FROM rework_order_comp_hd,
"
"       rework_order_comp_dtl,
"
"       rework_ord_comp_mat_req_dtls
"
" WHERE rwochd_bu        = rwocd_bu
"
"   AND rwochd_plnt      = rwocd_plnt
"
"   AND rwochd_doc_no    = rwocd_doc_no
"
"   AND rwochd_bu        = rocmrd_bu
"
"   AND rwochd_plnt      = rocmrd_plnt
"
"   AND rwochd_doc_no    = rocmrd_doc_no
"
"   AND rwocd_seq_no     = rocmrd_rwk_seq_no
"
"   AND rwochd_bu        = p_bu
"
"   AND rwochd_plnt      = p_plnt
"
"   AND rwochd_doc_no    = p_doc_no
"
"   AND rocmrd_var_prod_id IS NULL
"
"   AND func_find_prod_var_group_type(p_bu,rocmrd_prod_id,rocmrd_prod_rev) NOT IN ('Y')
"
"   AND rwochd_status = 'N';
"
"
"
"CURSOR c_chk(c_store_id     VARCHAR2,
"
"             c_prod_id      VARCHAR2,
"
"             c_prod_rev     NUMBER,
"
"             c_rw_ord_no    VARCHAR2)
"
"IS
"
"SELECT NVL(SUM(avail_qty),0) avail_qty
"
"  FROM (
"
"SELECT (stock_qty_hand - stock_qty_mi_allocated) avail_qty
"
"  FROM stocks
"
" WHERE stock_bu        = p_bu
"
"   AND stock_store_id    = c_store_id
"
"   AND stock_prod_id    = c_prod_id
"
"   AND stock_prod_rev    = c_prod_rev
"
"   AND (stock_qty_hand - stock_qty_mi_allocated) > 0
"
"   AND func_find_prod_cons_method(stock_bu,stock_prod_id,stock_prod_rev) = 'L'
"
"   AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('N')
"
" UNION ALL
"
"SELECT (swoq_qty - swoq_qty_allocated) avail_qty
"
"  FROM stock_wip_order_qty
"
" WHERE swoq_bu        = p_bu
"
"   AND swoq_store_id    = c_store_id
"
"   AND swoq_prod_id    = c_prod_id
"
"   AND swoq_prod_rev    = c_prod_rev
"
"   AND swoq_order_no    = c_rw_ord_no
"
"   AND swoq_order_type     = 'RW'
"
"   AND (swoq_qty - swoq_qty_allocated) > 0
"
"   AND func_find_prod_cons_method(swoq_bu,swoq_prod_id,swoq_prod_rev) = ('P')
"
"   UNION ALL
"
"   SELECT (lss_qty_hand - lss_qty_allocated) avail_qty
"
"     FROM lot_ser_stocks
"
"     WHERE lss_bu = p_bu
"
"     AND lss_prod_id = c_prod_id
"
"     AND lss_prod_rev = c_prod_rev
"
"     AND lss_store_id = c_store_id
"
"     AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) NOT IN ('N')
"
"     AND func_find_prod_cons_method(lss_bu,lss_prod_id,lss_prod_rev) = 'L'
"
" AND (lss_qty_hand - lss_qty_allocated) > 0);
"
"
"
"CURSOR c_mat
"
"  IS
"
"SELECT rwochd_prod_id,
"
"       rwochd_prod_Rev,
"
"       rwocd_rwk_comp_qty rwochd_trans_qty,
"
"       rwochd_sou_store,
"
"       rwocd_sou_sys_ls_no rwochd_sys_ls_no,
"
"       rwocd_sou_sf_code rwochd_sf_code,
"
"       rwocd_prod_ord_no rwochd_prod_ord_no,
"
"       rwochd_ord_type,
"
"       rwocd_rw_ord_no
"
"  FROM rework_order_comp_hd,
"
"       rework_order_comp_dtl
"
" WHERE rwochd_bu        = rwocd_bu
"
"   AND rwochd_plnt      = rwocd_plnt
"
"   AND rwochd_doc_no    = rwocd_doc_no
"
"   AND rwochd_bu        = p_bu
"
"   AND rwochd_plnt      = p_plnt
"
"   AND rwochd_doc_no    = p_doc_no
"
"   AND rwochd_status    = 'N'
"
"   AND func_find_prod_ser_lot_type(p_bu,rwochd_prod_id,rwochd_prod_Rev) IN ('N','L')
"
" UNION ALL
"
" SELECT rwochd_prod_id,
"
"       rwochd_prod_Rev,
"
"       rwocd_rwk_comp_qty rwochd_trans_qty,
"
"       rwochd_sou_store,
"
"       rocsd_sys_ls_no rwochd_sys_ls_no,
"
"       rwocd_sou_sf_code rwochd_sf_code,
"
"       rwocd_prod_ord_no rwochd_prod_ord_no,
"
"       rwochd_ord_type,
"
"       rwocd_rw_ord_no
"
"  FROM rework_order_comp_hd,
"
"       rework_order_comp_dtl,
"
"       rework_order_comp_ser_dtls
"
" WHERE rwochd_bu        = rwocd_bu
"
"   AND rwochd_plnt      = rwocd_plnt
"
"   AND rwochd_doc_no    = rwocd_doc_no
"
"   AND rwochd_bu         = rocsd_bu
"
"   AND rwochd_plnt       = rocsd_plnt
"
"   AND rwochd_doc_no     = rocsd_doc_no
"
"   AND rwocd_seq_no      = rocsd_rw_seq_no
"
"   AND rwochd_bu            = p_bu
"
"   AND rwochd_plnt          = p_plnt
"
"   AND rwochd_doc_no        = p_doc_no
"
"   AND func_find_prod_ser_lot_type(p_bu,rwochd_prod_id,rwochd_prod_rev) IN ('S')
"
"   AND rwochd_status    = 'N';
"
"
"
"CURSOR c_mat_chk( c_store_id VARCHAR2,
"
"          c_prod_id VARCHAR2,
"
"          c_prod_rev NUMBER,
"
"          c_sys_ls_no NUMBER,
"
"          c_sf_code VARCHAR2,
"
"          c_prod_ord_no VARCHAR2,
"
"          c_source_type    VARCHAR2,
"
"          c_rwk_ord_no  VARCHAR2)
"
"IS
"
"SELECT NVL(SUM(avail_qty),0) avail_qty
"
"  FROM (
"
"SELECT (stock_qty_hand - stock_qty_mi_allocated) avail_qty
"
"  FROM stocks
"
" WHERE stock_bu        = p_bu
"
"   AND stock_store_id    = c_store_id
"
"   AND stock_prod_id    = c_prod_id
"
"   AND stock_prod_rev    = c_prod_rev
"
"   AND c_sf_code IS NULL
"
"   AND (stock_qty_hand - stock_qty_mi_allocated) > 0
"
"   AND func_find_prod_cons_method(stock_bu,stock_prod_id,stock_prod_rev) = 'L'
"
"   AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('N')
"
"UNION ALL
"
"SELECT (stock_qty_hand - stock_qty_mi_allocated) avail_qty
"
"  FROM stocks
"
" WHERE stock_bu        = p_bu
"
"   AND stock_store_id    = c_store_id
"
"   AND stock_prod_id    = c_prod_id
"
"   AND stock_prod_rev    = c_prod_rev
"
"   AND c_sf_code IS NULL
"
"   AND (stock_qty_hand - stock_qty_mi_allocated) > 0
"
"   AND func_find_prod_cons_method(stock_bu,stock_prod_id,stock_prod_rev) = 'P'
"
"   AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('N')
"
"    AND c_source_type IN ('RCSR','RCST','RCWS')
"
" UNION ALL
"
"SELECT (swoq_qty - swoq_qty_allocated) avail_qty
"
"  FROM stock_wip_order_qty
"
" WHERE swoq_bu        = p_bu
"
"   AND swoq_store_id    = c_store_id
"
"   AND swoq_prod_id    = c_prod_id
"
"   AND swoq_prod_rev    = c_prod_rev
"
"   AND swoq_order_no    = c_rwk_ord_no
"
"   AND swoq_order_type     = 'RW'
"
"   AND c_sf_code IS NULL
"
"   AND (swoq_qty - swoq_qty_allocated) > 0
"
"   AND func_find_prod_cons_method(swoq_bu,swoq_prod_id,swoq_prod_rev) = ('P')
"
"   AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('N')
"
" UNION ALL
"
"SELECT (swoq_qty - swoq_qty_allocated) avail_qty
"
"  FROM stock_wip_order_qty
"
" WHERE swoq_bu        = p_bu
"
"   AND swoq_store_id    = c_store_id
"
"   AND swoq_prod_id    = c_prod_id
"
"   AND swoq_prod_rev    = c_prod_rev
"
"   AND swoq_order_no    = c_rwk_ord_no
"
"   AND swoq_order_type     = 'RW'
"
"   AND swoq_sys_ls_no    = c_sys_ls_no
"
"   AND c_sf_code IS NULL
"
"   AND (swoq_qty - swoq_qty_allocated) > 0
"
"   AND func_find_prod_cons_method(swoq_bu,swoq_prod_id,swoq_prod_rev) = ('P')
"
"   AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) NOT IN ('N')
"
"   UNION ALL
"
"SELECT (lss_qty_hand - lss_qty_allocated) avail_qty
"
" FROM lot_ser_stocks
"
" WHERE lss_bu = p_bu
"
" AND lss_prod_id = c_prod_id
"
" AND lss_prod_rev = c_prod_rev
"
" AND lss_store_id = c_store_id
"
" AND lss_sys_ls_no= c_sys_ls_no
"
" AND c_sf_code IS NULL
"
" AND c_source_type IN ('RCSR','RCST','RCWS')
"
" AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) NOT IN ('N')
"
" AND func_find_prod_cons_method(lss_bu,lss_prod_id,lss_prod_rev) = 'P'
"
" AND (lss_qty_hand - lss_qty_allocated) > 0
"
"   UNION ALL
"
"SELECT (lss_qty_hand - lss_qty_allocated) avail_qty
"
" FROM lot_ser_stocks
"
" WHERE lss_bu = p_bu
"
" AND lss_prod_id = c_prod_id
"
" AND lss_prod_rev = c_prod_rev
"
" AND lss_store_id = c_store_id
"
" AND lss_sys_ls_no= c_sys_ls_no
"
" AND c_sf_code IS NULL
"
" AND c_source_type IN ('RCSR','RCST','RCWS')
"
" AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('S')
"
" AND func_find_prod_cons_method(lss_bu,lss_prod_id,lss_prod_rev) = 'L'
"
" AND (lss_qty_hand - lss_qty_allocated) > 0
"
" UNION ALL
"
" SELECT (stsfs_qty - stsfs_alloc_qty) avail_qty
"
"   FROM store_sf_Stocks
"
"  WHERE stsfs_bu    = p_bu
"
"    AND stsfs_prod_id    = c_prod_id
"
"    AND stsfs_prod_Rev    = c_prod_rev
"
"    AND stsfs_store_id    = c_store_id
"
"    AND stsfs_sys_ls_no    = c_sys_ls_no
"
"    AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) NOT IN ('N')
"
"    AND stsfs_ord_no    = c_prod_ord_no
"
"    AND c_sf_code IS NOT NULL
"
"    and stsfs_ord_no is not null
"
"    AND (stsfs_qty - stsfs_alloc_qty) > 0
"
" UNION ALL
"
" SELECT (stsfs_qty - stsfs_alloc_qty) avail_qty
"
"   FROM store_sf_Stocks
"
"  WHERE stsfs_bu    = p_bu
"
"    AND stsfs_prod_id    = c_prod_id
"
"    AND stsfs_prod_Rev    = c_prod_rev
"
"    AND stsfs_store_id    = c_store_id
"
"    AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('N')
"
"    AND stsfs_ord_no    = c_prod_ord_no
"
"    and stsfs_ord_no is not null
"
"    AND c_sf_code IS NOT NULL
"
"    AND (stsfs_qty - stsfs_alloc_qty) > 0
"
"  UNION ALL
"
"   SELECT (stsfs_qty - stsfs_alloc_qty) avail_qty
"
"   FROM store_sf_Stocks
"
"  WHERE stsfs_bu    = p_bu
"
"    AND stsfs_prod_id    = c_prod_id
"
"    AND stsfs_prod_Rev    = c_prod_rev
"
"    AND stsfs_store_id    = c_store_id
"
"    AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) IN ('N')
"
"    AND stsfs_ord_no    is null
"
"    AND c_sf_code IS NOT NULL
"
"    AND (stsfs_qty - stsfs_alloc_qty) > 0
"
"     UNION ALL
"
"   SELECT (stsfs_qty - stsfs_alloc_qty) avail_qty
"
"   FROM store_sf_Stocks
"
"  WHERE stsfs_bu    = p_bu
"
"    AND stsfs_prod_id    = c_prod_id
"
"    AND stsfs_prod_Rev    = c_prod_rev
"
"    AND stsfs_store_id    = c_store_id
"
"    AND func_find_prod_ser_lot_type(p_bu,c_prod_id,c_prod_rev) not IN ('N')
"
"    AND stsfs_ord_no    is null
"
"    AND c_sf_code IS NOT NULL
"
"    AND (stsfs_qty - stsfs_alloc_qty) > 0);
"
"
"
" r_mat_chk              c_mat_chk%ROWTYPE;
"
" r_chk                  c_chk%ROWTYPE;
"
"
"
" v_seq_no               NUMBER := 0;
"
"
"
" --PRAGMA AUTONOMOUS_TRANSACTION;
"
"
"
"BEGIN
"
"   FOR r_mat_req IN c_mat_req
"
"      LOOP
"
"
"
"            OPEN c_chk(r_mat_req.rocmrd_cons_store,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev,r_mat_req.rwocd_rw_ord_no);
"
"            FETCH c_chk INTO r_chk;
"
"
"
"               IF r_mat_req.rocmrd_cons_qty > r_chk.avail_qty THEN
"
"--                   raise_application_error(-20999,'HRM'||'/'||r_mat_req.rocmrd_cons_qty||'/'||r_chk.avail_qty);
"
"                    v_seq_no := v_seq_no + 1;
"
"
"
"                      INSERT INTO rework_ord_comp_exceptions(roce_bu            ,
"
"                                                               roce_plnt          ,
"
"                                                               roce_doc_no        ,
"
"                                                               roce_seq_no        ,
"
"                                                               roce_prod_id       ,
"
"                                                               roce_prod_rev      ,
"
"                                                               roce_store_id      ,
"
"                                                               roce_rqrd_qty      ,
"
"                                                               roce_shtge_qty     ,
"
"                                                               roce_cre_by        ,
"
"                                                               roce_cre_date      ,
"
"                                                               roce_upd_by        ,
"
"                                                               roce_upd_date
"
"                                                               )
"
"                                                            VALUES(p_bu            ,
"
"                                                                   p_plnt          ,
"
"                                                                   p_doc_no        ,
"
"                                                                   v_seq_no        ,
"
"                                                                   r_mat_req.rocmrd_prod_id       ,
"
"                                                                   r_mat_req.rocmrd_prod_rev      ,
"
"                                                                   r_mat_req.rocmrd_cons_store      ,
"
"                                                                   r_mat_req.rocmrd_cons_qty      ,
"
"                                                                   (r_mat_req.rocmrd_cons_qty - r_chk.avail_qty)     ,
"
"                                                                   p_user        ,
"
"                                                                   SYSDATE      ,
"
"                                                                   NULL        ,
"
"                                                                   NULL
"
"                                                                   );
"
"
"
"                END IF;
"
"
"
"            CLOSE c_chk;
"
"
"
"
"
"      END LOOP ;
"
"
"
"   /* FOR r_mat IN c_mat
"
"        LOOP
"
"
"
"
"
"      -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||r_mat.rwochd_sou_Store||'/'||r_mat.rwochd_prod_id||'/'||r_mat.rwochd_prod_Rev||'/'||
"
"               --                   r_mat.rwochd_sys_ls_no||'/'|| r_mat.rwochd_sf_code||'/'|| r_mat.rwochd_prod_ord_no||'/'||r_mat.rwochd_ord_type);
"
"            ----
"
"            OPEN c_mat_chk(r_mat.rwochd_sou_Store,r_mat.rwochd_prod_id,r_mat.rwochd_prod_Rev, r_mat.rwochd_sys_ls_no, r_mat.rwochd_sf_code, r_mat.rwochd_prod_ord_no,r_mat.rwochd_ord_type,r_mat.rwocd_rw_ord_no);
"
"            FETCH c_mat_chk INTO r_mat_chk;
"
"--                RAISE_APPLICATION_eRROR(-20999,r_mat.rwochd_trans_qty||'>'||r_mat_chk.avail_qty||r_mat.rwochd_sou_Store||','||r_mat.rwochd_prod_id||','||r_mat.rwochd_prod_Rev||','||r_mat.rwochd_sys_ls_no||','||r_mat.rwochd_sf_code||','||r_mat.rwochd_prod_ord_no||','||r_mat.rwochd_ord_type||','||r_mat.rwocd_rw_ord_no);
"
"                IF r_mat.rwochd_trans_qty > r_mat_chk.avail_qty THEN
"
"--RAISE_APPLICATION_eRROR(-20999,r_mat.rwochd_trans_qty||'/'||r_mat_chk.avail_qty||'/'||r_mat.rwochd_sou_Store||'/'||r_mat.rwochd_prod_id||'/'||r_mat.rwochd_prod_Rev||'/'||r_mat.rwochd_sys_ls_no||'/'||r_mat.rwochd_sf_code||'/'||r_mat.rwochd_prod_ord_no||'/'||r_mat.rwochd_ord_type||'/'||r_mat.rwocd_rw_ord_no||'/'||
"
"--r_mat.rwochd_sys_ls_no);
"
"                    v_seq_no:= v_seq_no + 1;
"
"                      --raise_application_error(-20999,'HRM');
"
"                        INSERT INTO rework_ord_comp_exceptions(roce_bu            ,
"
"                                                               roce_plnt          ,
"
"                                                               roce_doc_no        ,
"
"                                                               roce_seq_no        ,
"
"                                                               roce_prod_id       ,
"
"                                                               roce_prod_rev      ,
"
"                                                               roce_store_id      ,
"
"                                                               roce_rqrd_qty      ,
"
"                                                               roce_shtge_qty     ,
"
"                                                               roce_cre_by        ,
"
"                                                               roce_cre_date      ,
"
"                                                               roce_upd_by        ,
"
"                                                               roce_upd_date
"
"                                                               )
"
"                                                        VALUES(p_bu            ,
"
"                                                               p_plnt          ,
"
"                                                               p_doc_no        ,
"
"                                                               v_seq_no        ,
"
"                                                               r_mat.rwochd_prod_id       ,
"
"                                                               r_mat.rwochd_prod_Rev      ,
"
"                                                               r_mat.rwochd_sou_Store      ,
"
"                                                               r_mat.rwochd_trans_qty      ,
"
"                                                               (r_mat.rwochd_trans_qty - r_mat_chk.avail_qty)     ,
"
"                                                               p_user        ,
"
"                                                               SYSDATE      ,
"
"                                                               NULL        ,
"
"                                                               NULL
"
"                                                               );
"
"                END IF;
"
"
"
"            CLOSE c_mat_chk;
"
"
"
"        END LOOP c_mat;    */
"
"
"
"
"
"END proc_chk_exception_ln;
"
"
"
"PROCEDURE proc_alloc_rwk_mat_cons_ln(p_bu                VARCHAR2,
"
"                                  p_plnt            VARCHAR2,
"
"                                  p_doc_no            VARCHAR2,
"
"                                  p_doc_date        DATE,
"
"                                  p_lang            NUMBER,
"
"                                  p_type            VARCHAR2,
"
"                                  p_user            VARCHAR2,
"
"                                  p_res        OUT        VARCHAR2
"
"                                  )
"
"IS
"
"CURSOR c_mat_cons
"
"IS
"
"SELECT (rocmrd_cons_qty - rocmrd_alloc_qty) rocmrd_cons_qty,rocmrd_rwk_seq_no,
"
"       rocmrd_prod_id,rocmrd_prod_rev,rocmrd_cons_store,rocmrd_seq_no
"
"  FROM rework_order_comp_hd,rework_order_comp_dtl,
"
"       rework_ord_comp_mat_req_dtls
"
" WHERE rwochd_bu        = rwocd_bu
"
"   AND rwochd_plnt      = rwocd_plnt
"
"   AND rwochd_doc_no    = rwocd_doc_no
"
"   AND rwochd_bu        = rocmrd_bu
"
"   AND rwochd_plnt      = rocmrd_plnt
"
"   AND rwochd_doc_no    = rocmrd_doc_no
"
"   AND rwocd_seq_no     = rocmrd_rwk_seq_no
"
"   AND rwochd_bu          = p_bu
"
"   AND rwochd_plnt        = p_plnt
"
"   AND rwochd_doc_no      = p_doc_no
"
"   AND rocmrd_var_prod_id IS NULL
"
"   AND func_find_prod_var_group_type(rocmrd_bu,rocmrd_prod_id,rocmrd_prod_rev) NOT IN('Y')
"
"   AND rwochd_status = 'N';
"
"
"
"CURSOR c_stock(c_prod_id VARCHAR2,c_prod_rev NUMBER,c_store_id VARCHAR2)
"
"IS
"
"SELECT (stock_qty_hand - stock_qty_mi_allocated) stock_qty_hand
"
"  FROM stocks
"
" WHERE stock_bu        = p_bu
"
"   AND stock_prod_id   = c_prod_id
"
"   AND stock_prod_rev  = c_prod_rev
"
"   AND stock_store_id  = c_store_id
"
"   AND (stock_qty_hand - stock_qty_mi_allocated) > 0;
"
"
"
"CURSOR c6(c_rwk_seq_no      NUMBER)
"
"IS
"
"SELECT rwochd_prod_id,
"
"       rwochd_prod_Rev,
"
"       rwocd_rwk_comp_qty rwochd_trans_qty,
"
"       rwochd_sou_store,
"
"       rwocd_sou_sys_ls_no rwochd_sys_ls_no,
"
"       rwocd_sou_sf_code rwochd_sf_code,
"
"       rwocd_prod_ord_no rwochd_prod_ord_no,
"
"       rwochd_ord_type,
"
"       rwocd_rw_ord_no rwochd_rw_ord_no,
"
"       rwocd_so_pfx rwochd_so_pfx,
"
"       rwocd_so_no rwochd_so_no,
"
"       rwocd_so_seq_no  rwochd_so_seq_no,
"
"       rwocd_so_sub_seq_no rwochd_so_sub_seq_no,
"
"       rwocd_so_schld_desc rwochd_so_schld_desc
"
"  FROM rework_order_comp_hd,
"
"       rework_order_comp_dtl
"
" WHERE rwochd_bu        = rwocd_bu
"
"   AND rwochd_plnt      = rwocd_plnt
"
"   AND rwochd_doc_no    = rwocd_doc_no
"
"   AND rwochd_bu        = p_bu
"
"   AND rwochd_plnt      = p_plnt
"
"   AND rwochd_doc_no    = p_doc_no
"
"   AND rwocd_seq_no     = c_rwk_seq_no
"
"   AND rwochd_status    = 'N';
"
"
"
"
"
"
"
" CURSOR c7  (c_prod_id VARCHAR2, c_prod_rev NUMBER, c_store_id VARCHAR2,
"
"               c_prod_ord_no VARCHAR2, c_sf_code VARCHAR2,c_lot_no VARCHAR2,
"
"               c_ser_no VARCHAR2, c_sys_ls_no NUMBER,c_crate_id VARCHAR2
"
"               )
"
"               IS
"
"     SELECT binstk_bin_id       ,
"
"        (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked)) binstk_avbl,
"
"        binstk_crate_id    ,
"
"        binstk_prod_ord_no ,
"
"        binstk_sf_code
"
"       FROM bin_stocks
"
"      WHERE binstk_bu = p_bu
"
"    AND binstk_prod_id = c_prod_id
"
"    AND binstk_prod_rev = c_prod_rev
"
"    AND binstk_store_id = c_store_id
"
"    --AND ((binstk_prod_ord_no = c_prod_ord_no) OR (binstk_prod_ord_no IS NULL AND  c_prod_ord_no IS NULL))
"
"    --AND (binstk_sf_code = c_sf_code OR c_sf_code IS NULL)
"
"    AND c_lot_no IS NULL
"
"    AND c_ser_no IS NULL
"
"    AND c_sys_ls_no IS NULL
"
"    AND (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked))  > 0
"
"    AND ((binstk_crate_id = c_crate_id AND c_crate_id IS NOT NULL) OR (c_crate_id IS NULL))
"
"   UNION ALL
"
"   SELECT bsld_bin_id         ,
"
"      bsld_qoh - (bsld_qty_allocated + bsld_qty_picked) bsld_avbl,
"
"      bsld_crate_id ,
"
"      bsld_prod_ord_no,
"
"      bsld_sf_code
"
"     FROM bin_serial_lot_details
"
"    WHERE bsld_bu = p_bu
"
"      AND bsld_prod_id = c_prod_id
"
"      AND bsld_prod_rev = c_prod_rev
"
"      AND bsld_store_id = c_store_id
"
"      --AND ((bsld_prod_ord_no = c_prod_ord_no) OR (bsld_prod_ord_no IS NULL AND c_prod_ord_no IS NULL))
"
"      --AND (bsld_sf_code = c_sf_code OR c_sf_code IS NULL)
"
"      AND (c_lot_no IS NOT NULL OR c_ser_no IS NOT NULL OR c_sys_ls_no IS NOT NULL )
"
"      AND (bsld_lot_no = c_lot_no OR c_lot_no IS NULL)
"
"      AND (bsld_ser_no  = c_ser_no OR c_ser_no IS NULL)
"
"      AND (bsld_sys_ls_no = c_sys_ls_no OR c_sys_ls_no IS NULL)
"
"      AND ((bsld_crate_id = c_crate_id AND c_crate_id IS NOT NULL) OR (c_crate_id IS NULL))
"
"      AND (bsld_qoh - (bsld_qty_allocated + bsld_qty_picked)) > 0;
"
"
"
"        v_rem_qty            stocks.stock_qty_hand%TYPE;
"
"        v_elg_qty            stocks.stock_qty_hand%TYPE;
"
"        v_req_qty            stocks.stock_qty_hand%TYPE;
"
"        v_rem_batch_qty      stocks.stock_qty_hand%TYPE;
"
"        v_elg_batch_qty      stocks.stock_qty_hand%TYPE;
"
"        v_req_batch_qty      stocks.stock_qty_hand%TYPE;
"
"        r_stock                c_stock%ROWTYPE;
"
"        v_req_so_push_qty         NUMBER(12,3):=0;
"
"        v_rem_so_push_qty         NUMBER(12,3):=0;
"
"        v_elg_so_push_qty         NUMBER(12,3):=0;
"
"        v_req_so_pull_qty         NUMBER(12,3):=0;
"
"        v_rem_so_pull_qty         NUMBER(12,3):=0;
"
"        v_elg_so_pull_qty         NUMBER(12,3):=0;
"
"        v_req_lot_qty                NUMBER(12,3):=0;
"
"        v_elg_lot_qty             NUMBER(12,3):=0;
"
"        v_rem_lot_qty             NUMBER(12,3):=0;
"
"        v_unit_cost                NUMBER(17,5):=0;
"
"        v_batch_seq_no              NUMBER;
"
"        v_lot_seq_no                NUMBER;
"
"        v_prod_cls_desc                 VARCHAR2(200)   ;
"
"        v_prod_subcls                     VARCHAR2(10)    ;
"
"        v_prod_subcls_desc            VARCHAR2(200)   ;
"
"        v_prod_grp                    VARCHAR2(10)    ;
"
"        v_prod_grp_desc               VARCHAR2(50)    ;
"
"        v_prod_subgrp                 VARCHAR2(10)    ;
"
"        v_prod_subgrp_desc            VARCHAR2(50)    ;
"
"        v_prod_cls_type                 VARCHAR2(10)    ;
"
"
"
"           v_so_pfx       VARCHAR2(5);
"
"           v_so_no        VARCHAR2(15);
"
"           v_so_seq_no    NUMBER(5);
"
"           v_so_sub_seq   NUMBER(5);
"
"   v_so_schld_desc    VARCHAR2(200);
"
"
"
"   cr6    c6%ROWTYPE;
"
"
"
"
"
"   v_crate_rqrd_qty        NUMBER(12,3);
"
"      v_crate_rem_qty        NUMBER(12,3);
"
"      v_crate_elg_qty        NUMBER(12,3);
"
"   v_bin_seq_no                NUMBER;
"
"   v_vg_cons_qty    NUMBER(12,3);
"
"
"
"   v_total_alloc_qty NUMBER(12,3);
"
"   v_group_rqrd_qty    NUMBER(12,3);
"
"
"
"
"
"
"
"BEGIN
"
"
"
"    p_res := 'N';
"
"
"
"    IF p_type = 'A' THEN
"
"
"
"        FOR r_mat_cons IN c_mat_cons
"
"        LOOP
"
"
"
"            v_rem_qty := r_mat_cons.rocmrd_cons_qty;
"
"            v_req_qty := r_mat_cons.rocmrd_cons_qty;
"
"            v_elg_qty := 0;
"
"
"
"            proc_get_prod_param_det(p_bu           ,
"
"                        p_plnt                 ,
"
"                        r_mat_cons.rocmrd_prod_id        ,
"
"                        r_mat_cons.rocmrd_prod_rev        ,
"
"                        v_prod_cls_desc        ,
"
"                        v_prod_subcls          ,
"
"                        v_prod_subcls_desc     ,
"
"                        v_prod_grp             ,
"
"                        v_prod_grp_desc        ,
"
"                        v_prod_subgrp          ,
"
"                        v_prod_subgrp_desc     ,
"
"                        v_prod_cls_type        ,
"
"                        p_user                 ,
"
"                        p_lang                 );
"
"
"
"
"
"                OPEN c_stock(r_mat_cons.rocmrd_prod_id, r_mat_cons.rocmrd_prod_rev, r_mat_cons.rocmrd_cons_store);
"
"                FETCH c_stock INTO r_stock;
"
"                    IF c_stock%NOTFOUND THEN
"
"                       RAISE_APPLICATION_ERROR(-20251,'ICM'||' ' ||r_mat_cons.rocmrd_prod_id||' ' ||r_mat_cons.rocmrd_prod_rev||' '  || r_mat_cons.rocmrd_cons_store);
"
"                    END IF;
"
"                CLOSE c_stock;
"
"
"
"                IF r_stock.stock_qty_hand > 0 THEN
"
"
"
"                        IF r_stock.stock_qty_hand  >= v_rem_qty THEN
"
"                            v_elg_qty := v_rem_qty;
"
"                            v_rem_qty := v_rem_qty - v_elg_qty;
"
"                        ELSIF r_stock.stock_qty_hand  < v_rem_qty THEN
"
"                            v_elg_qty := r_stock.stock_qty_hand;
"
"                            v_rem_qty := v_rem_qty - v_elg_qty;
"
"                        END IF;
"
"
"
"                        v_unit_cost := func_find_unitcost(p_bu ,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev,r_mat_cons.rocmrd_cons_store);
"
"
"
"                        IF v_elg_qty > 0 THEN
"
"
"
"                            proc_upd_stocks(
"
"                                            p_bu           ,
"
"                                            r_mat_cons.rocmrd_cons_store,
"
"                                            NULL      ,
"
"                                            r_mat_cons.rocmrd_prod_id,
"
"                                            r_mat_cons.rocmrd_prod_rev     ,
"
"                                            0      ,
"
"                                            0      ,
"
"                                            0      ,
"
"                                            0     ,
"
"                                            v_elg_qty  , --p_alloc_Qty
"
"                                            func_find_unitcost(p_bu ,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev,r_mat_cons.rocmrd_cons_store)      ,
"
"                                            func_find_unitcost(p_bu ,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev,r_mat_cons.rocmrd_cons_store)      ,
"
"                                            0 ,
"
"                                            'N',
"
"                                            0    ,
"
"                                            0   ,
"
"                                            0,
"
"                                            r_mat_cons.rocmrd_seq_no            ,
"
"                                            r_mat_cons.rocmrd_seq_no      ,
"
"                                            NULL       ,
"
"                                            p_doc_no        ,
"
"                                            NULL   ,
"
"                                            p_doc_no     ,
"
"                                            NULL      ,
"
"                                            func_find_year(p_bu,TRUNC(p_doc_date))          ,
"
"                                            func_find_period(p_bu,TRUNC(p_doc_date))        ,
"
"                                            TRUNC(p_doc_date)          ,
"
"                                            NULL       ,
"
"                                            'SFM'          ,
"
"                                            'MCM'        ,
"
"                                            NULL          ,
"
"                                            p_user        ,
"
"                                            SYSDATE      ,
"
"                                            NULL    ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev)      ,
"
"                                            NULL         ,
"
"                                            NULL    ,
"
"                                            NULL       ,
"
"                                            0   ,
"
"                                            0     ,
"
"                                            TRUNC(p_doc_date)       ,
"
"                                            NULL   ,
"
"                                            NULL,
"
"                                            0,
"
"                                            0,
"
"                                            r_mat_cons.rocmrd_seq_no ,
"
"                                            NULL        ,
"
"                                            0       ,
"
"                                            0         ,
"
"                                            'MATERIAL ALLOCATED FOR REWORK COMPLETION'           ,
"
"                                            'MATERIAL ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,r_mat_cons.rocmrd_cons_store,1),
"
"                                            0,
"
"                                            0,
"
"                                            NULL         ,
"
"                                            'S',
"
"                                            p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                            p_prod_sub_cls_id      => v_prod_subcls   ,
"
"                                            p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"                                            p_prod_grp_id          => v_prod_grp,
"
"                                            p_prod_grp_desc        => v_prod_grp_desc,
"
"                                            p_prod_sub_grp_id      => v_prod_subgrp,
"
"                                            p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"                                            p_prod_cls_type        => v_prod_cls_type
"
"                                               );
"
"                        ELSE
"
"                            RAISE_APPLICATION_ERROR(-20251,'ICM'||r_mat_cons.rocmrd_cons_store||' ' ||r_mat_cons.rocmrd_prod_id||' ' ||r_mat_cons.rocmrd_prod_rev);
"
"                        END IF;
"
"
"
"                        OPEN c6(r_mat_cons.rocmrd_rwk_seq_no);
"
"                        FETCH c6 INTO cr6;
"
"                        CLOSE c6;
"
"
"
"                        --raise_application_error(-20999,'HRM' || cr6.rwochd_so_no ||'/'||cr6.rwochd_so_pfx);
"
"
"
"                                IF func_find_prod_indicator_type(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) = 'I' THEN
"
"                                    v_so_pfx       := cr6.rwochd_so_pfx  ;
"
"                                    v_so_no        := cr6.rwochd_so_no;
"
"                                    v_so_seq_no    := cr6.rwochd_so_seq_no;
"
"                                    v_so_sub_seq   :=  cr6.rwochd_so_sub_seq_no;
"
"                                    v_so_schld_desc:= cr6.rwochd_so_schld_desc;
"
"                                 ELSE
"
"                                v_so_pfx       :=  NULL;
"
"                                v_so_no        :=  NULL;
"
"                                v_so_seq_no    :=  NULL;
"
"                                v_so_sub_seq   :=  NULL;
"
"                                v_so_schld_desc:=  NULL;
"
"
"
"                                                         END IF;
"
"
"
"                            IF v_so_pfx IS NOT NULL AND func_find_prod_indicator_type(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) = 'I' THEN
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
"                                                           proc_upd_so_stocks(p_bu,
"
"                                                                    r_mat_cons.rocmrd_cons_store,
"
"                                                                    r_mat_cons.rocmrd_prod_id,
"
"                                                                    r_mat_cons.rocmrd_prod_rev,
"
"                                                                    0,
"
"                                                                    v_elg_qty,
"
"                                                                    func_find_unitcost(p_bu ,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev,r_mat_cons.rocmrd_cons_store) ,
"
"                                                                    v_so_pfx,
"
"                                                                    v_so_no,
"
"                                                                    v_so_seq_no,
"
"                                                                    v_so_sub_seq,
"
"                                                                    TRUNC(p_doc_date) ,
"
"                                                                    'RW',
"
"                                                                    NULL,
"
"                                                                    p_doc_no,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    'MA',
"
"                                                                    'SFM',
"
"                                                                    'MATERIAL ALLOCATED FOR REWORK COMPLETION',
"
"                                                                    'MATERIAL ALLOCATED FOR REWORK COMPLETION',
"
"                                                                    p_user,
"
"                                                                    'SO',
"
"                                                                    NULL,
"
"                                                                    NULL
"
"                                                                 );
"
"                                                                END IF;
"
"
"
"    /*        IF (func_find_prod_ser_lot_type(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('N')
"
"            AND func_find_prod_cons_method(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('L')
"
"                    AND (func_find_prod_crate_rqrd_flag(p_bu,p_plnt,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('Y')
"
"                         OR func_find_store_bin_flag(p_bu,r_mat_cons.rocmrd_cons_store) IN('Y'))
"
"                         ) THEN
"
"
"
"                         v_crate_rqrd_qty := v_elg_qty;
"
"                         v_crate_rem_qty := v_elg_qty;
"
"                         v_crate_elg_qty := 0;
"
"
"
"
"
"FOR cr7 IN c7(r_mat_cons.rocmrd_prod_id, r_mat_cons.rocmrd_prod_rev, r_mat_cons.rocmrd_cons_store,
"
"                                       NULL , NULL,NULL,
"
"                                     NULL, NULL,NULL
"
"                                 )
"
"                                 LOOP
"
"                                     IF cr7.binstk_avbl >= v_crate_rem_qty THEN
"
"                                        v_crate_elg_qty := v_crate_rem_qty;
"
"                                        v_crate_rem_qty := v_crate_rem_qty - v_crate_elg_qty;
"
"                                     ELSIF cr7.binstk_avbl < v_crate_rem_qty THEN
"
"                                        v_crate_elg_qty := cr7.binstk_avbl;
"
"                                        v_crate_rem_qty := v_crate_rem_qty - v_crate_elg_qty;
"
"                                     END IF;
"
"
"
"                                     IF v_crate_elg_qty > 0 THEN
"
"
"
"                                        proc_upd_bin_stocks(
"
"                                    p_bu           ,
"
"                                    r_mat_cons.rocmrd_cons_store     ,
"
"                                    r_mat_cons.rocmrd_prod_id     ,
"
"                                    r_mat_cons.rocmrd_prod_rev    ,
"
"                                    cr7.binstk_bin_id       ,
"
"                                    NULL    ,
"
"                                    NULL       ,
"
"                                    NULL       ,
"
"                                    NULL     ,
"
"                                    NULL       ,
"
"                                    0     ,
"
"                                    v_crate_elg_qty    ,
"
"                                    0     ,
"
"                                    0     ,
"
"                                    func_find_unitcost(p_bu ,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev,r_mat_cons.rocmrd_cons_store)     ,
"
"                                    TRUNC(p_doc_date)    ,
"
"                                    'MCM'     ,
"
"                                    NULL      ,
"
"                                    p_doc_no      ,
"
"                                    r_mat_cons.rocmrd_seq_no,
"
"                                    'SFM'         ,
"
"                                    p_user         ,
"
"                                    0  ,
"
"                                    cr7.binstk_crate_id     ,
"
"                                    NULL,
"
"                                    NULL
"
"                                                          );
"
"
"
"
"
"
"
"                           SELECT NVL(MAX(rcccd_sub_seq_no),0) + 1
"
"                              INTO v_bin_seq_no
"
"                              FROM rwk_cmp_cons_crate_dtl
"
"                             WHERE rcccd_bu = p_bu
"
"                               AND rcccd_plnt = p_plnt
"
"                               AND rcccd_doc_no = p_doc_no
"
"                               AND rcccd_seq_no = r_mat_cons.rocmrd_seq_no;
"
"
"
"                                     INSERT INTO rwk_cmp_cons_crate_dtl(
"
"                                        rcccd_bu             ,
"
"                                        rcccd_plnt           ,
"
"                                        rcccd_doc_no         ,
"
"                                        rcccd_seq_no         ,
"
"                                        rcccd_sub_seq_no     ,
"
"                                        rcccd_bin_id         ,
"
"                                        rcccd_lot_no         ,
"
"                                        rcccd_ser_no         ,
"
"                                        rcccd_sys_ls_no      ,
"
"                                        rcccd_source_id      ,
"
"                                        rcccd_source_type,
"
"                                        rcccd_crate_id       ,
"
"                                        rcccd_alloc_qty      ,
"
"                                        rcccd_cre_by         ,
"
"                                        rcccd_cre_date       ,
"
"                                        rcccd_upd_by         ,
"
"                                        rcccd_upd_date
"
"                                                                    )
"
"                                                               VALUES(
"
"                                        p_bu            ,
"
"                                        p_plnt          ,
"
"                                        p_doc_no      ,
"
"                                        r_mat_cons.rocmrd_seq_no        ,
"
"                                        v_bin_seq_no    ,
"
"                                        cr7.binstk_bin_id  ,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        'P',
"
"                                        cr7.binstk_crate_id ,
"
"                                        v_crate_elg_qty,
"
"                                        p_user        ,
"
"                                        SYSDATE      ,
"
"                                        NULL        ,
"
"                                        NULL  );
"
"
"
"                                     END IF;
"
"
"
"
"
"                                 END LOOP;
"
"
"
"                                 IF v_crate_rem_qty > 0 THEN
"
"                                    RAISE_APPLICATION_ERROR(-20251,'ICM');
"
"                                 END IF;
"
"            END IF;
"
"            */
"
"
"
"
"
"
"
"
"
"                    IF func_find_prod_ser_lot_type(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('L','S','O') AND func_find_prod_cons_method(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('L') THEN
"
"
"
"                            v_req_lot_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                            v_elg_lot_qty := 0;
"
"                            v_rem_lot_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"
"
"                                    FOR cr_lot IN (SELECT lss_sys_ls_no,
"
"                                                          lss_lot_no,
"
"                                                          lss_ser_no,
"
"                                                          lss_source_type,
"
"                                                          lss_source_id,
"
"                                                          NVL(SUM((lss_qty_hand - lss_qty_allocated)),0) lss_qty_hand
"
"                                                      FROM lot_ser_stocks
"
"                                                     WHERE lss_bu       = p_bu
"
"                                                       AND lss_prod_id  = r_mat_cons.rocmrd_prod_id
"
"                                                       AND lss_prod_rev = r_mat_cons.rocmrd_prod_rev
"
"                                                       AND lss_store_id = r_mat_cons.rocmrd_cons_store
"
"                                                       AND (lss_qty_hand - lss_qty_allocated) > 0
"
"                                                      GROUP BY lss_sys_ls_no,
"
"                                                               lss_lot_no,
"
"                                                               lss_ser_no,
"
"                                                               lss_source_type,
"
"                                                               lss_source_id
"
"                                                     ORDER BY lss_sys_ls_no
"
"                                                     )
"
"                                    LOOP
"
"
"
"
"
"                                    IF  cr_lot.lss_qty_hand  >= v_rem_lot_qty THEN
"
"                                           v_elg_lot_qty := v_rem_lot_qty;
"
"                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                    ELSIF  cr_lot.lss_qty_hand  <  v_rem_lot_qty THEN
"
"                                           v_elg_lot_qty := cr_lot.lss_qty_hand;
"
"                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                    END IF;
"
"
"
"                                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_elg_lot_qty||'~'||:NEW.sccmc_prod_id );
"
"
"
"                                        IF v_elg_lot_qty > 0 THEN
"
"
"
"                                         proc_upd_lot_ser_stocks(
"
"                                                                p_bu             ,
"
"                                                                r_mat_cons.rocmrd_cons_store ,
"
"                                                                r_mat_cons.rocmrd_prod_id          ,
"
"                                                                r_mat_cons.rocmrd_prod_rev ,
"
"                                                                cr_lot.lss_sys_ls_no         ,
"
"                                                                0          ,
"
"                                                                v_elg_lot_qty         ,
"
"                                                                0       ,
"
"                                                                func_find_unitcost(p_bu ,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_Rev,r_mat_cons.rocmrd_cons_store)   ,
"
"                                                                func_find_prod_ser_no_opt(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev),
"
"                                                                cr_lot.lss_lot_no            ,
"
"                                                                cr_lot.lss_ser_no            ,
"
"                                                                cr_lot.lss_source_type          ,
"
"                                                                cr_lot.lss_source_id            ,
"
"                                                                NULL          ,
"
"                                                                p_doc_date          ,
"
"                                                                'MCM'          ,
"
"                                                                NULL           ,
"
"                                                                p_doc_no            ,
"
"                                                                r_mat_cons.ROCMRD_SEQ_NO        ,
"
"                                                                'SFM'              ,
"
"                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION'                 ,
"
"                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,r_mat_cons.rocmrd_cons_store,1),
"
"                                                                p_user
"
"                                                                );
"
"
"
"                                              SELECT NVL(MAX(rocmrl_sub_seq_no),0) + 1
"
"                                                INTO v_lot_seq_no
"
"                                                FROM rework_ord_comp_mat_req_lot
"
"                                               WHERE rocmrl_bu         = p_bu
"
"                                                 AND rocmrl_plnt       = p_plnt
"
"                                                 AND rocmrl_doc_no     = p_doc_no
"
"                                                 AND rocmrl_seq_no     = r_mat_cons.rocmrd_seq_no;
"
"
"
"
"
"
"
"                                            INSERT INTO rework_ord_comp_mat_req_lot(
"
"                                                                                rocmrl_bu             ,
"
"                                                                                rocmrl_plnt     ,
"
"                                                                                rocmrl_doc_no    ,
"
"                                                                                rocmrl_seq_no     ,
"
"                                                                                rocmrl_sub_seq_no  ,
"
"                                                                                rocmrl_lot_no        ,
"
"                                                                                rocmrl_sys_ls_no      ,
"
"                                                                                rocmrl_source_id       ,
"
"                                                                                rocmrl_source_type     ,
"
"                                                                                rocmrl_lot_qty  ,
"
"                                                                                rocmrl_cre_by    ,
"
"                                                                                rocmrl_cre_date   ,
"
"                                                                                rocmrl_upd_by      ,
"
"                                                                                rocmrl_upd_date,
"
"                                                                                rocmrl_ser_no,
"
"                                        rocmrl_rw_seq_no
"
"                                                                                )
"
"                                                                           VALUES(p_bu                   ,
"
"                                                                                  p_plnt                 ,
"
"                                                                                  p_doc_no               ,
"
"                                                                                  r_mat_cons.rocmrd_seq_no       ,
"
"                                                                                  v_lot_seq_no  ,
"
"                                                                                  cr_lot.lss_lot_no         ,
"
"                                                                                  cr_lot.lss_sys_ls_no      ,
"
"                                                                                  cr_lot.lss_source_id  ,
"
"                                                                                  cr_lot.lss_source_type,
"
"                                                                                  v_elg_lot_qty  ,
"
"                                                                                  p_user      ,
"
"                                                                                  SYSDATE                ,
"
"                                                                                  NULL,
"
"                                                                                  NULL,
"
"                                                                                  cr_lot.lss_ser_no,
"
"                                          r_mat_cons.rocmrd_rwk_seq_no
"
"                                                                                  );
"
"
"
"
"
"
"
"                                           END IF; --Lot
"
"
"
"                                        EXIT WHEN v_rem_lot_qty = 0;
"
"
"
"                                   END LOOP cr_lot; --Lot
"
"
"
"                            IF v_rem_lot_qty > 0 THEN
"
"                                RAISE_APPLICATION_ERROR(-20251,'ICM'||r_mat_cons.rocmrd_prod_id||'~'||r_mat_cons.rocmrd_prod_rev||'~'||r_mat_cons.rocmrd_cons_store||'~'||v_rem_lot_qty);
"
"                            END IF;
"
"
"
"                        END IF; --Finish of Lot/Serial(Pull)
"
"
"
"
"
"                        IF func_find_prod_cost_method(p_bu, r_mat_cons.rocmrd_prod_id, r_mat_cons.rocmrd_prod_rev) NOT IN ('MAC') THEN
"
"
"
"                               v_req_batch_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                               v_rem_batch_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                               v_elg_batch_qty := 0;
"
"
"
"                                       FOR cr_batch IN (SELECT sb_batch_id,sb_bc_unit_cost,ROUND(sb_qty,3)sb_qty
"
"                                                          FROM (
"
"                                                        SELECT sb_batch_id,
"
"                                                               sb_bc_unit_cost,
"
"                                                               NVL(SUM((sb_qty_in - (sb_qty_out+sb_qty_allocated + sb_qty_picked))),0) sb_qty
"
"                                                          FROM stocks_batches
"
"                                                         WHERE sb_bu       = p_bu
"
"                                                           AND sb_prod_id  = r_mat_cons.rocmrd_prod_id
"
"                                                           AND sb_prod_rev = r_mat_cons.rocmrd_prod_rev
"
"                                                           AND sb_store_id = r_mat_cons.rocmrd_cons_store
"
"                                                           AND sb_cost_method = 'FIFO'
"
"                                                           AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                                                         GROUP BY sb_batch_id,
"
"                                                                  sb_bc_unit_cost
"
"                                                         ORDER BY sb_batch_id ASC
"
"                                                            )
"
"                                                         UNION ALL
"
"                                                        SELECT sb_batch_id,sb_bc_unit_cost,sb_qty
"
"                                                          FROM(
"
"                                                        SELECT sb_batch_id,
"
"                                                               sb_bc_unit_cost,
"
"                                                               NVL(SUM((sb_qty_in - (sb_qty_out + sb_qty_allocated+sb_qty_picked))),0) sb_qty
"
"                                                          FROM stocks_batches
"
"                                                         WHERE sb_bu          = p_bu
"
"                                                           AND sb_prod_id     = r_mat_cons.rocmrd_prod_id
"
"                                                           AND sb_prod_rev    = r_mat_cons.rocmrd_prod_rev
"
"                                                           AND sb_store_id    = r_mat_cons.rocmrd_cons_store
"
"                                                           AND sb_cost_method = 'LIFO'
"
"                                                           AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                                                         GROUP BY sb_batch_id,
"
"                                                                  sb_bc_unit_cost
"
"                                                         ORDER BY sb_batch_id DESC
"
"                                                            ))
"
"                                    LOOP
"
"
"
"
"
"                                          IF cr_batch.sb_qty  >= v_rem_batch_qty THEN
"
"                                             v_elg_batch_qty := v_rem_batch_qty;
"
"                                             v_rem_batch_qty := v_rem_batch_qty - v_elg_batch_qty;
"
"                                          ELSIF cr_batch.sb_qty  < v_rem_batch_qty THEN
"
"                                             v_elg_batch_qty := cr_batch.sb_qty;
"
"                                             v_rem_batch_qty := v_rem_batch_qty - v_elg_batch_qty;
"
"                                          END IF;
"
"
"
"                                --v_err := cr_batch.sb_batch_id||' ' ||r_mat_cons.rocmrd_prod_id ||' ' ||v_elg_batch_qty;
"
"
"
"
"
"
"
"                                            IF v_elg_batch_qty > 0 THEN
"
"
"
"                                          --dbms_output.put_line('Batch '||' Line'||' ' || r_mat_cons.ROCMRD_SEQ_NO ||' ' ||r_mat_cons.rocmrd_prod_id ||' Batch id' ||cr_batch.sb_batch_id ||' Qty' ||v_elg_batch_qty);
"
"
"
"                                                  proc_upd_stock_batches(
"
"                                                                         p_bu          ,
"
"                                                                         r_mat_cons.rocmrd_cons_store  ,
"
"                                                                         r_mat_cons.rocmrd_prod_id   ,
"
"                                                                         r_mat_cons.rocmrd_prod_rev   ,
"
"                                                                         cr_batch.sb_batch_id     ,
"
"                                                                         0       ,
"
"                                                                         0      ,
"
"                                                                         v_elg_batch_qty    ,
"
"                                                                         0     ,
"
"                                                                         cr_batch.sb_bc_unit_cost ,
"
"                                                                         cr_batch.sb_bc_unit_cost ,
"
"                                                                         0    ,
"
"                                                                         0 ,
"
"                                                                         0    ,
"
"                                                                         0     ,
"
"                                                                         'N',
"
"                                                                         p_doc_date   ,
"
"                                                                         NULL      ,
"
"                                                                         p_doc_no       ,
"
"                                                                         r_mat_cons.rocmrd_seq_no  ,
"
"                                                                         NULL     ,
"
"                                                                         NULL      ,
"
"                                                                         p_doc_no       ,
"
"                                                                         r_mat_cons.rocmrd_seq_no  ,
"
"                                                                         r_mat_cons.rocmrd_seq_no ,
"
"                                                                         func_find_product_class(p_bu, p_plnt, r_mat_cons.rocmrd_prod_id, r_mat_cons.rocmrd_prod_rev)      ,
"
"                                                                         'MCM'    ,
"
"                                                                         'SFM'          ,
"
"                                                                         p_doc_no   ,
"
"                                                                         p_doc_date ,
"
"                                                                         NULL     ,
"
"                                                                         NULL   ,
"
"                                                                         p_user         ,
"
"                                                                         NULL    ,
"
"                                                                         NULL,
"
"                                                                        p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                                                        p_prod_subcls          => v_prod_subcls   ,
"
"                                                                        p_prod_subcls_desc     => v_prod_subcls_desc,
"
"                                                                        p_prod_grp             => v_prod_grp,
"
"                                                                        p_prod_grp_desc        => v_prod_grp_desc,
"
"                                                                        p_prod_subgrp          => v_prod_subgrp,
"
"                                                                        p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"                                                                        p_prod_cls_type        => v_prod_cls_type
"
"                                                                        );
"
"
"
"
"
"
"
"                                                            SELECT NVL(MAX(rocmrb_sub_seq_no), 0) + 1
"
"                                                              INTO v_batch_seq_no
"
"                                                              FROM rework_ord_comp_mat_req_bat
"
"                                                             WHERE rocmrb_bu         = p_bu
"
"                                                               AND rocmrb_plnt       = p_plnt
"
"                                                               AND rocmrb_doc_no     = p_doc_no
"
"                                                               AND rocmrb_seq_no     = r_mat_cons.rocmrd_seq_no;
"
"
"
"                                                     INSERT INTO rework_ord_comp_mat_req_bat(rocmrb_bu          ,
"
"                                                                                            rocmrb_plnt        ,
"
"                                                                                            rocmrb_doc_no      ,
"
"                                                                                            rocmrb_seq_no      ,
"
"                                                                                            rocmrb_sub_seq_no  ,
"
"                                                                                            rocmrb_batch_id    ,
"
"                                                                                            rocmrb_batch_qty   ,
"
"                                                                                            rocmrb_cre_by      ,
"
"                                                                                            rocmrb_cre_date    ,
"
"                                                                                            rocmrb_upd_by      ,
"
"                                                                                            rocmrb_upd_date    ,
"
"                                                                                            rocmrb_batch_cost,
"
"                                                rocmrb_rw_seq_no
"
"                                                                                            )
"
"                                                                                      VALUES(p_bu              ,
"
"                                                                                             p_plnt            ,
"
"                                                                                             p_doc_no          ,
"
"                                                                                             r_mat_cons.rocmrd_seq_no  ,
"
"                                                                                             v_batch_seq_no,
"
"                                                                                             cr_batch.sb_batch_id   ,
"
"                                                                                             v_elg_batch_qty ,
"
"                                                                                             p_user,
"
"                                                                                             SYSDATE           ,
"
"                                                                                             NULL              ,
"
"                                                                                             NULL              ,
"
"                                                                                             cr_batch.sb_bc_unit_cost,
"
"                                                     r_mat_cons.rocmrd_rwk_seq_no
"
"                                                                                           );
"
"
"
"                                            END IF;
"
"
"
"                                        EXIT WHEN v_rem_batch_qty = 0;
"
"
"
"                                END LOOP cr_batch;
"
"
"
"                                     IF v_rem_batch_qty > 0 THEN
"
"
"
"                                        RAISE_APPLICATION_ERROR(-20251,'ICM'||r_mat_cons.rocmrd_prod_id||'/'||r_mat_cons.rocmrd_prod_rev||'/'||r_mat_cons.rocmrd_cons_store);
"
"
"
"                                     END IF;
"
"
"
"                        END IF; --End of Batch
"
"
"
"                        IF func_find_prod_cons_method(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('P') THEN
"
"
"
"                        -- raise_application_error(-20999,'HRM'||'/'||r_mat_cons.rocmrd_prod_id||'/'||r_mat_cons.rocmrd_prod_rev||'/'||cr6.rwochd_rw_ord_no);
"
"
"
"                            v_req_so_push_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                            v_rem_so_push_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                            v_elg_so_push_qty := 0;
"
"
"
"                                        FOR cr_push IN (SELECT so_pfx,
"
"                                                               so_no,
"
"                                                               so_seq_no,
"
"                                                               so_sub_seq_no,
"
"                                                               swoq_lot_no,
"
"                                                               swoq_ser_no,
"
"                                                               swoq_sys_ls_no,
"
"                                                               swoq_source_id,
"
"                                                               swoq_source_type,
"
"                                                               swoq_crate_id,
"
"                                                               swoq_batch_id,
"
"                                                               NVL(SUM(avbl_qty),0)avbl_qty
"
"                                                          FROM(
"
"                                                               SELECT NULL so_pfx,
"
"                                                               NULL so_no,
"
"                                                               NULL so_seq_no,
"
"                                                               NULL so_sub_seq_no,
"
"                                                               swoq_lot_no,
"
"                                                               swoq_ser_no,
"
"                                                               swoq_sys_ls_no,
"
"                                                               swoq_source_id,
"
"                                                               swoq_source_type,
"
"                                                               swoq_crate_id,
"
"                                                               swoq_batch_id,
"
"                                                               (swoq_qty - swoq_qty_allocated) avbl_qty
"
"                                                          FROM stock_wip_order_qty
"
"                                                         WHERE swoq_bu = p_bu
"
"                                                           AND swoq_prod_id = r_mat_cons.rocmrd_prod_id
"
"                                                           AND swoq_prod_rev = r_mat_cons.rocmrd_prod_rev
"
"                                                           AND swoq_store_id = r_mat_cons.rocmrd_cons_store
"
"                                                           AND swoq_order_no = cr6.rwochd_rw_ord_no
"
"                                                           AND (swoq_qty - swoq_qty_allocated) > 0
"
"                                                           AND swoq_order_type  = 'RW'
"
"                                                           AND func_find_prod_cons_method(swoq_bu ,swoq_prod_id,swoq_prod_rev) IN ('P')
"
"                                                        )GROUP BY so_pfx,
"
"                                                                  so_no,
"
"                                                                  so_seq_no,
"
"                                                                  so_sub_seq_no,
"
"                                                                  swoq_lot_no,
"
"                                                                  swoq_ser_no,
"
"                                                                  swoq_sys_ls_no,
"
"                                                                  swoq_source_id,
"
"                                                                  swoq_batch_id,
"
"                                                                  swoq_source_type,swoq_crate_id)
"
"                                        LOOP
"
"
"
"                                            IF cr_push.avbl_qty >= v_rem_so_push_qty THEN
"
"                                               v_elg_so_push_qty := v_rem_so_push_qty;
"
"                                               v_rem_so_push_qty := v_rem_so_push_qty - v_elg_so_push_qty;
"
"                                            ELSIF cr_push.avbl_qty < v_rem_so_push_qty  THEN
"
"                                               v_elg_so_push_qty := cr_push.avbl_qty;
"
"                                               v_rem_so_push_qty := v_rem_so_push_qty - v_elg_so_push_qty;
"
"                                            END IF;
"
"
"
"                     --   raise_application_error(-20999, 'HRM'||'-'||v_elg_so_push_qty||'-'||v_rem_so_push_qty||'-'||cr_push.avbl_qty||'/'||cr_push.swoq_lot_no||'/'||cr_push.swoq_sys_ls_no||'/'||
"
"                       -- r_mat_cons.rocmrd_cons_store);
"
"
"
"
"
"                                                    IF v_elg_so_push_qty > 0  THEN
"
"
"
"                                                      DBMS_OUTPUT.PUT_LINE(' 1 Push '||' ' ||r_mat_cons.rocmrd_prod_id||' ' ||cr_push.avbl_qty||' ' ||v_elg_so_push_qty);
"
"
"
"                                                  --s      RAISE_APPLICATION_ERROR(-20999,'HRM' || v_so_no ||'/'||
"
"
"
"
"
"
"
"
"
"							IF func_find_prod_indicator_type(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('I') THEN
"
"							                  SELECT RWOCHD_SO_PFX,RWOCHD_SO_NO,RWOCHD_SO_SCHLD_DESC
"
"							                    INTO V_SO_PFX,V_SO_NO, V_SO_sCHLD_DESC
"
"							                    FROM REWORK_ORDER_COMP_HD
"
"							   				   WHERE RWOCHD_BU = P_BU
"
"							   					 AND RWOCHD_PLNT = P_PLNT
"
"							                     AND RWOCHD_DOC_NO = P_DOC_NO;
"
"							END IF;
"
"
"
"
"
"
"
"
"
"                                                 -- raise_application_error(-20999,'HRM' ||v_so_schld_desc ||'/'||CR6.RWOCHD_SO_SCHLD_DESC ||'/'||cr6.rwochd_rw_ord_no);
"
"
"
"                                                         proc_insrupd_wip(p_bu,
"
"                                                                          r_mat_cons.rocmrd_cons_store,
"
"                                                                          r_mat_cons.rocmrd_prod_id,
"
"                                                                          r_mat_cons.rocmrd_prod_rev,
"
"                                                                          cr_push.swoq_sys_ls_no,
"
"                                                                          cr_push.swoq_lot_no,
"
"                                                                          cr_push.swoq_ser_no,
"
"                                                                          func_find_prod_expiry_date(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev,TRUNC(SYSDATE)),
"
"                                                                          cr_push.swoq_source_type,
"
"                                                                          cr_push.swoq_source_id,
"
"                                                                          0,
"
"                                                                          v_elg_so_push_qty,
"
"                                                                          'RW',
"
"                                                                          NULL,
"
"                                                                          cr6.rwochd_rw_ord_no,
"
"                                                                          NULL,
"
"                                                                          NULL,
"
"                                                                          p_user,
"
"                                                                          p_batch_id               => cr_push.swoq_batch_id, --p_batch_id
"
"                                                                          p_so_no                => v_so_no,--NULL, --p_so_order_no
"
"                                                                          p_so_pfx               => NULL, --p_so_order_pfx
"
"                                                                          p_so_seq_no              => NULL, --p_so_seq_no
"
"                                                                          p_so_sub_seq_no          => NULL, --p_so_sub_seq_no
"
"                                                                          p_type                => CASE WHEN v_so_no IS NOT NULL THEN 'SO' ELSE 'NA' END,
"
"                                                                          p_proj_id             => NULL,
"
"                                                                          p_task_id             => NULL,
"
"                                                                          p_ord_trans_no        => NULL,
"
"                                                                          p_crate_id => cr_push.swoq_crate_id,
"
"                                                                          p_so_schld_ref => v_so_schld_desc
"
"                                                                          );
"
"
"
"
"
"
"
"                                                    END IF;
"
"
"
"                                    IF func_find_prod_ser_lot_type(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev) IN ('L','S','O') THEN
"
"
"
"                                                v_req_lot_qty := v_elg_so_push_qty;
"
"                                                v_rem_lot_qty := v_elg_so_push_qty;
"
"                                                v_elg_lot_qty := 0;
"
"
"
"                                                    FOR cr_lot IN (SELECT lss_sys_ls_no,
"
"                                                                          lss_lot_no,
"
"                                                                          lss_ser_no,
"
"                                                                          lss_source_type,
"
"                                                                          lss_source_id,
"
"                                                                          NVL(SUM((lss_qty_hand - lss_qty_allocated)),0) lss_qty_hand
"
"                                                                      FROM lot_ser_stocks
"
"                                                                     WHERE lss_bu       = p_bu
"
"                                                                       AND lss_prod_id  = r_mat_cons.rocmrd_prod_id
"
"                                                                       AND lss_prod_rev = r_mat_cons.rocmrd_prod_rev
"
"                                                                       AND lss_store_id = r_mat_cons.rocmrd_cons_store
"
"                                                                       AND (lss_lot_no = cr_push.swoq_lot_no OR cr_push.swoq_lot_no IS NULL)
"
"                                                                       AND (lss_ser_no = cr_push.swoq_ser_no OR cr_push.swoq_ser_no IS NULL)
"
"                                                                       AND (lss_sys_ls_no = cr_push.swoq_sys_ls_no OR cr_push.swoq_sys_ls_no IS NULL)
"
"                                                                       AND (lss_qty_hand - lss_qty_allocated) > 0
"
"                                                                      GROUP BY lss_sys_ls_no,
"
"                                                                               lss_lot_no,
"
"                                                                               lss_ser_no,
"
"                                                                               lss_source_type,
"
"                                                                               lss_source_id
"
"                                                                     ORDER BY lss_sys_ls_no
"
"                                                                     )
"
"                                                    LOOP
"
"
"
"                                                    IF  cr_lot.lss_qty_hand  >= v_rem_lot_qty THEN
"
"                                                           v_elg_lot_qty := v_rem_lot_qty;
"
"                                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                                    ELSIF  cr_lot.lss_qty_hand  <  v_rem_lot_qty THEN
"
"                                                           v_elg_lot_qty := cr_lot.lss_qty_hand;
"
"                                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                                    END IF;
"
"
"
"                                                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_elg_lot_qty||'~'||:NEW.sccmc_prod_id );
"
"
"
"                                                        IF v_elg_lot_qty > 0 THEN
"
"
"
"                                                         proc_upd_lot_ser_stocks(
"
"                                                                                p_bu             ,
"
"                                                                                r_mat_cons.rocmrd_cons_store ,
"
"                                                                                r_mat_cons.rocmrd_prod_id          ,
"
"                                                                                r_mat_cons.rocmrd_prod_rev ,
"
"                                                                                cr_lot.lss_sys_ls_no         ,
"
"                                                                                0          ,
"
"                                                                                v_elg_lot_qty         ,
"
"                                                                                0       ,
"
"                                                                                func_find_unitcost(p_bu ,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_Rev,r_mat_cons.rocmrd_cons_store)   ,
"
"                                                                                func_find_prod_ser_no_opt(p_bu,r_mat_cons.rocmrd_prod_id,r_mat_cons.rocmrd_prod_rev),
"
"                                                                                cr_lot.lss_lot_no            ,
"
"                                                                                cr_lot.lss_ser_no            ,
"
"                                                                                cr_lot.lss_source_type          ,
"
"                                                                                cr_lot.lss_source_id            ,
"
"                                                                                NULL          ,
"
"                                                                                p_doc_date          ,
"
"                                                                                'MCM'          ,
"
"                                                                                NULL           ,
"
"                                                                                p_doc_no            ,
"
"                                                                                r_mat_cons.rocmrd_seq_no        ,
"
"                                                                                'SFM'              ,
"
"                                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION'                 ,
"
"                                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,r_mat_cons.rocmrd_cons_store,1),
"
"                                                                                p_user
"
"                                                                                );
"
"
"
"                                                          SELECT NVL (MAX (rocmrl_sub_seq_no), 0) + 1
"
"                                                            INTO v_lot_seq_no
"
"                                                            FROM rework_ord_comp_mat_req_lot
"
"                                                           WHERE rocmrl_bu         = p_bu
"
"                                                             AND rocmrl_plnt       = p_plnt
"
"                                                             AND rocmrl_doc_no     = p_doc_no
"
"                                                             AND rocmrl_seq_no     = r_mat_cons.rocmrd_seq_no;
"
"
"
"
"
"
"
"                                                        INSERT INTO rework_ord_comp_mat_req_lot(
"
"                                                                                            rocmrl_bu             ,
"
"                                                                                            rocmrl_plnt     ,
"
"                                                                                            rocmrl_doc_no    ,
"
"                                                                                            rocmrl_seq_no     ,
"
"                                                                                            rocmrl_sub_seq_no  ,
"
"                                                                                            rocmrl_lot_no        ,
"
"                                                                                            rocmrl_sys_ls_no      ,
"
"                                                                                            rocmrl_source_id       ,
"
"                                                                                            rocmrl_source_type     ,
"
"                                                                                            rocmrl_lot_qty  ,
"
"                                                                                            rocmrl_cre_by    ,
"
"                                                                                            rocmrl_cre_date   ,
"
"                                                                                            rocmrl_upd_by      ,
"
"                                                                                            rocmrl_upd_date,
"
"                                                                                            rocmrl_ser_no,
"
"                                                                                            rocmrl_rw_seq_no
"
"                                                                                            )
"
"                                                                                   VALUES(p_bu                   ,
"
"                                                                                          p_plnt                 ,
"
"                                                                                          p_doc_no               ,
"
"                                                                                          r_mat_cons.rocmrd_seq_no       ,
"
"                                                                                          v_lot_seq_no,
"
"                                                                                          cr_lot.lss_lot_no         ,
"
"                                                                                          cr_lot.lss_sys_ls_no      ,
"
"                                                                                          cr_lot.lss_source_id  ,
"
"                                                                                          cr_lot.lss_source_type,
"
"                                                                                          v_elg_lot_qty  ,
"
"                                                                                          p_user      ,
"
"                                                                                          SYSDATE                ,
"
"                                                                                          NULL,
"
"                                                                                          NULL,
"
"                                                                                          cr_lot.lss_ser_no,
"
"                                                                                            r_mat_cons.rocmrd_rwk_seq_no
"
"                                                                                          );
"
"                                                        END IF; --Lot
"
"
"
"                                                               EXIT WHEN v_rem_lot_qty = 0;
"
"
"
"                                                    END LOOP cr_lot; --Lot
"
"
"
"                                                    IF v_rem_lot_qty > 0 THEN
"
"                                                        RAISE_APPLICATION_ERROR(-20251,'ICM'||cr_push.swoq_lot_no ||' ' ||cr_push.swoq_sys_ls_no ||' ' ||cr_push.swoq_ser_no||' ' ||r_mat_cons.rocmrd_prod_id||'~'||r_mat_cons.rocmrd_prod_rev||'~'||r_mat_cons.rocmrd_cons_store||'~'||v_rem_lot_qty);
"
"                                                    END IF;
"
"
"
"
"
"                                        END IF; --Finish of Lot/Serial(Push)
"
"
"
"                                                EXIT WHEN v_rem_so_push_qty = 0;
"
"
"
"                                        END LOOP cr_push;
"
"
"
"                                    IF v_rem_so_push_qty > 0 THEN
"
"                                            RAISE_APPLICATION_ERROR(-20251,'ICM'||'Qty. on hand is low against order '||' '||v_rem_so_push_qty);
"
"                                    END IF;
"
"
"
"                        END IF;
"
"
"
"                    UPDATE rework_ord_comp_mat_req_dtls
"
"                       SET rocmrd_alloc_qty = rocmrd_alloc_qty + v_elg_qty,
"
"                           rocmrd_unit_cost = v_unit_cost
"
"                     WHERE rocmrd_bu = p_bu
"
"                       AND rocmrd_plnt = p_plnt
"
"                       AND rocmrd_doc_no = p_doc_no
"
"                       AND rocmrd_seq_no = r_mat_cons.rocmrd_seq_no
"
"               AND rocmrd_rwk_seq_no = r_mat_cons.rocmrd_rwk_seq_no;
"
"
"
"                       IF SQL%FOUND THEN
"
"                            p_res := 'Y';
"
"                       END IF;
"
"
"
"            END IF;
"
"
"
"        END LOOP r_mat_cons;
"
"
"
"
"
"        FOR cr_vg IN (SELECT *
"
"                    FROM rework_ord_comp_mat_req_dtls,rework_order_comp_dtl
"
"                   WHERE rocmrd_bu = p_bu
"
"                     AND rocmrd_plnt = p_plnt
"
"                     AND rocmrd_doc_no  = p_doc_no
"
"             AND rwocd_bu        = rocmrd_bu
"
"              AND rwocd_plnt      = rocmrd_plnt
"
"             AND rwocd_doc_no    = rocmrd_doc_no
"
"             AND rwocd_seq_no     = rocmrd_rwk_seq_no
"
"                     AND func_find_prod_var_group_type(rocmrd_bu,rocmrd_prod_id,rocmrd_prod_rev) IN ('Y')
"
"                     AND rocmrd_cons_qty > 0
"
"                     ORDER BY rocmrd_seq_no)
"
"         LOOP
"
"               v_total_alloc_qty := 0;
"
"               v_group_rqrd_qty := cr_vg.rocmrd_cons_qty;
"
"               v_rem_qty := cr_vg.rocmrd_cons_qty;
"
"                   v_req_qty := cr_vg.rocmrd_cons_qty;
"
"
"
"
"
"               FOR cr_var IN (SELECT rocmrd_seq_no,
"
"                                 rocmrd_prod_id,
"
"                 rocmrd_prod_rev ,
"
"                 rocmrd_cons_store,
"
"                 rocmrd_cons_qty  ,
"
"                 rocmrd_alloc_qty ,
"
"                         rocmrd_unit_cost ,
"
"                         (rocmrd_cons_qty - rocmrd_alloc_qty) rqrd_qty
"
"                            FROM rework_ord_comp_mat_req_dtls
"
"                           WHERE rocmrd_bu = p_bu
"
"                             AND rocmrd_plnt = p_plnt
"
"                             AND rocmrd_doc_no  = p_doc_no
"
"                 and rocmrd_rwk_seq_no = cr_vg.rwocd_seq_no
"
"                             AND rocmrd_var_prod_id = cr_vg.rocmrd_prod_id
"
"                             AND rocmrd_var_prod_rev = cr_vg.rocmrd_prod_rev)
"
"               LOOP
"
"               v_elg_qty := 0;
"
"
"
"               proc_get_prod_param_det(p_bu           ,
"
"                               p_plnt                 ,
"
"                               cr_var.rocmrd_prod_id       ,
"
"                               cr_var.rocmrd_prod_rev      ,
"
"                               v_prod_cls_desc        ,
"
"                               v_prod_subcls          ,
"
"                               v_prod_subcls_desc     ,
"
"                               v_prod_grp             ,
"
"                               v_prod_grp_desc        ,
"
"                               v_prod_subgrp          ,
"
"                               v_prod_subgrp_desc     ,
"
"                               v_prod_cls_type        ,
"
"                               p_user                 ,
"
"                                p_lang                 );
"
"
"
"OPEN c_stock(cr_var.rocmrd_prod_id, cr_var.rocmrd_prod_rev, cr_var.rocmrd_cons_store);
"
"                FETCH c_stock INTO r_stock;
"
"                    IF c_stock%NOTFOUND THEN
"
"                       RAISE_APPLICATION_ERROR(-20251,'ICM'||' ' ||cr_var.rocmrd_prod_id||' ' ||cr_var.rocmrd_prod_rev||' '  || cr_var.rocmrd_cons_store);
"
"                    END IF;
"
"                CLOSE c_stock;
"
"
"
"                IF r_stock.stock_qty_hand > 0 THEN
"
"
"
"                        IF r_stock.stock_qty_hand  >= v_rem_qty THEN
"
"                            v_elg_qty := v_rem_qty;
"
"                            v_rem_qty := v_rem_qty - v_elg_qty;
"
"                            v_total_alloc_qty := v_total_alloc_qty + v_elg_qty;
"
"                        ELSIF r_stock.stock_qty_hand  < v_rem_qty THEN
"
"                            v_elg_qty := r_stock.stock_qty_hand;
"
"                            v_rem_qty := v_rem_qty - v_elg_qty;
"
"                            v_total_alloc_qty := v_total_alloc_qty + v_elg_qty;
"
"                        END IF;
"
"
"
"                        v_unit_cost := func_find_unitcost(p_bu ,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev,cr_var.rocmrd_cons_store);
"
"
"
"                        IF v_elg_qty > 0 THEN
"
"
"
"                            proc_upd_stocks(
"
"                                            p_bu           ,
"
"                                            cr_var.rocmrd_cons_store,
"
"                                            NULL      ,
"
"                                            cr_var.rocmrd_prod_id,
"
"                                            cr_var.rocmrd_prod_rev     ,
"
"                                            0      ,
"
"                                            0      ,
"
"                                            0      ,
"
"                                            0     ,
"
"                                            v_elg_qty  , --p_alloc_Qty
"
"                                            func_find_unitcost(p_bu ,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev,cr_var.rocmrd_cons_store)      ,
"
"                                            func_find_unitcost(p_bu ,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev,cr_var.rocmrd_cons_store)      ,
"
"                                            0 ,
"
"                                            'N',
"
"                                            0    ,
"
"                                            0   ,
"
"                                            0,
"
"                                            cr_var.rocmrd_seq_no            ,
"
"                                            cr_var.rocmrd_seq_no      ,
"
"                                            NULL       ,
"
"                                            p_doc_no        ,
"
"                                            NULL   ,
"
"                                            p_doc_no     ,
"
"                                            NULL      ,
"
"                                            func_find_year(p_bu,TRUNC(p_doc_date))          ,
"
"                                            func_find_period(p_bu,TRUNC(p_doc_date))        ,
"
"                                            TRUNC(p_doc_date)          ,
"
"                                            NULL       ,
"
"                                            'SFM'          ,
"
"                                            'MCM'        ,
"
"                                            NULL          ,
"
"                                            p_user        ,
"
"                                            SYSDATE      ,
"
"                                            NULL    ,
"
"                                            func_find_product_class(p_bu,p_plnt,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev)      ,
"
"                                            NULL         ,
"
"                                            NULL    ,
"
"                                            NULL       ,
"
"                                            0   ,
"
"                                            0     ,
"
"                                            TRUNC(p_doc_date)       ,
"
"                                            NULL   ,
"
"                                            NULL,
"
"                                            0,
"
"                                            0,
"
"                                            cr_var.rocmrd_seq_no ,
"
"                                            NULL        ,
"
"                                            0       ,
"
"                                            0         ,
"
"                                            'MATERIAL ALLOCATED FOR REWORK COMPLETION'           ,
"
"                                            'MATERIAL ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,cr_var.rocmrd_cons_store,1),
"
"                                            0,
"
"                                            0,
"
"                                            NULL         ,
"
"                                            'S',
"
"                                            p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                            p_prod_sub_cls_id      => v_prod_subcls   ,
"
"                                            p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"                                            p_prod_grp_id          => v_prod_grp,
"
"                                            p_prod_grp_desc        => v_prod_grp_desc,
"
"                                            p_prod_sub_grp_id      => v_prod_subgrp,
"
"                                            p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"                                            p_prod_cls_type        => v_prod_cls_type
"
"                                               );
"
"                        ELSE
"
"                            RAISE_APPLICATION_ERROR(-20251,'ICM'||cr_var.rocmrd_cons_store||' ' ||cr_var.rocmrd_prod_id||' ' ||cr_var.rocmrd_prod_rev);
"
"                        END IF;
"
"
"
"                IF func_find_prod_ser_lot_type(p_bu,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev) IN ('L','S','O') AND func_find_prod_cons_method(p_bu,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev) IN ('L') THEN
"
"
"
"                            v_req_lot_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                            v_elg_lot_qty := 0;
"
"                            v_rem_lot_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"
"
"                                    FOR cr_lot IN (SELECT lss_sys_ls_no,
"
"                                                          lss_lot_no,
"
"                                                          lss_ser_no,
"
"                                                          lss_source_type,
"
"                                                          lss_source_id,
"
"                                                          NVL(SUM((lss_qty_hand - lss_qty_allocated)),0) lss_qty_hand
"
"                                                      FROM lot_ser_stocks
"
"                                                     WHERE lss_bu       = p_bu
"
"                                                       AND lss_prod_id  = cr_var.rocmrd_prod_id
"
"                                                       AND lss_prod_rev = cr_var.rocmrd_prod_rev
"
"                                                       AND lss_store_id = cr_var.rocmrd_cons_store
"
"                                                       AND (lss_qty_hand - lss_qty_allocated) > 0
"
"                                                      GROUP BY lss_sys_ls_no,
"
"                                                               lss_lot_no,
"
"                                                               lss_ser_no,
"
"                                                               lss_source_type,
"
"                                                               lss_source_id
"
"                                                     ORDER BY lss_sys_ls_no
"
"                                                     )
"
"                                    LOOP
"
"
"
"
"
"                                    IF  cr_lot.lss_qty_hand  >= v_rem_lot_qty THEN
"
"                                           v_elg_lot_qty := v_rem_lot_qty;
"
"                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                    ELSIF  cr_lot.lss_qty_hand  <  v_rem_lot_qty THEN
"
"                                           v_elg_lot_qty := cr_lot.lss_qty_hand;
"
"                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                    END IF;
"
"
"
"                                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_elg_lot_qty||'~'||:NEW.sccmc_prod_id );
"
"
"
"                                        IF v_elg_lot_qty > 0 THEN
"
"
"
"                                         proc_upd_lot_ser_stocks(
"
"                                                                p_bu             ,
"
"                                                                cr_var.rocmrd_cons_store ,
"
"                                                                cr_var.rocmrd_prod_id          ,
"
"                                                                cr_var.rocmrd_prod_rev ,
"
"                                                                cr_lot.lss_sys_ls_no         ,
"
"                                                                0          ,
"
"                                                                v_elg_lot_qty         ,
"
"                                                                0       ,
"
"                                                                func_find_unitcost(p_bu ,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_Rev,cr_var.rocmrd_cons_store)   ,
"
"                                                                func_find_prod_ser_no_opt(p_bu,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev),
"
"                                                                cr_lot.lss_lot_no            ,
"
"                                                                cr_lot.lss_ser_no            ,
"
"                                                                cr_lot.lss_source_type          ,
"
"                                                                cr_lot.lss_source_id            ,
"
"                                                                NULL          ,
"
"                                                                p_doc_date          ,
"
"                                                                'MCM'          ,
"
"                                                                NULL           ,
"
"                                                                p_doc_no            ,
"
"                                                                cr_var.ROCMRD_SEQ_NO        ,
"
"                                                                'SFM'              ,
"
"                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION'                 ,
"
"                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,cr_var.rocmrd_cons_store,1),
"
"                                                                p_user
"
"                                                                );
"
"
"
"                                              SELECT NVL(MAX(rocmrl_sub_seq_no),0) + 1
"
"                                                INTO v_lot_seq_no
"
"                                                FROM rework_ord_comp_mat_req_lot
"
"                                               WHERE rocmrl_bu         = p_bu
"
"                                                 AND rocmrl_plnt       = p_plnt
"
"                                                 AND rocmrl_doc_no     = p_doc_no
"
"                                                 AND rocmrl_seq_no     = cr_var.rocmrd_seq_no;
"
"
"
"
"
"
"
"                                            INSERT INTO rework_ord_comp_mat_req_lot(
"
"                                                                                rocmrl_bu             ,
"
"                                                                                rocmrl_plnt     ,
"
"                                                                                rocmrl_doc_no    ,
"
"                                                                                rocmrl_seq_no     ,
"
"                                                                                rocmrl_sub_seq_no  ,
"
"                                                                                rocmrl_lot_no        ,
"
"                                                                                rocmrl_sys_ls_no      ,
"
"                                                                                rocmrl_source_id       ,
"
"                                                                                rocmrl_source_type     ,
"
"                                                                                rocmrl_lot_qty  ,
"
"                                                                                rocmrl_cre_by    ,
"
"                                                                                rocmrl_cre_date   ,
"
"                                                                                rocmrl_upd_by      ,
"
"                                                                                rocmrl_upd_date,
"
"                                                                                rocmrl_ser_no,
"
"                                        rocmrl_rw_seq_no
"
"                                                                                )
"
"                                                                           VALUES(p_bu                   ,
"
"                                                                                  p_plnt                 ,
"
"                                                                                  p_doc_no               ,
"
"                                                                                  cr_var.rocmrd_seq_no       ,
"
"                                                                                  v_lot_seq_no  ,
"
"                                                                                  cr_lot.lss_lot_no         ,
"
"                                                                                  cr_lot.lss_sys_ls_no      ,
"
"                                                                                  cr_lot.lss_source_id  ,
"
"                                                                                  cr_lot.lss_source_type,
"
"                                                                                  v_elg_lot_qty  ,
"
"                                                                                  p_user      ,
"
"                                                                                  SYSDATE                ,
"
"                                                                                  NULL,
"
"                                                                                  NULL,
"
"                                                                                  cr_lot.lss_ser_no,
"
"                                          cr_vg.rwocd_seq_no
"
"                                                                                  );
"
"
"
"
"
"    END IF; --Lot
"
"
"
"                                        EXIT WHEN v_rem_lot_qty = 0;
"
"
"
"                                   END LOOP cr_lot; --Lot
"
"
"
"                            IF v_rem_lot_qty > 0 THEN
"
"                                RAISE_APPLICATION_ERROR(-20251,'ICM'||cr_var.rocmrd_prod_id||'~'||cr_var.rocmrd_prod_rev||'~'||cr_var.rocmrd_cons_store||'~'||v_rem_lot_qty);
"
"                            END IF;
"
"
"
"                        END IF; --Finish of Lot/Serial(Pull)
"
"
"
"
"
"                        IF func_find_prod_cost_method(p_bu, cr_var.rocmrd_prod_id, cr_var.rocmrd_prod_rev) NOT IN ('MAC') THEN
"
"
"
"                               v_req_batch_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                               v_rem_batch_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                               v_elg_batch_qty := 0;
"
"
"
"                                       FOR cr_batch IN (SELECT sb_batch_id,sb_bc_unit_cost,ROUND(sb_qty,3)sb_qty
"
"                                                          FROM (
"
"                                                        SELECT sb_batch_id,
"
"                                                               sb_bc_unit_cost,
"
"                                                               NVL(SUM((sb_qty_in - (sb_qty_out+sb_qty_allocated + sb_qty_picked))),0) sb_qty
"
"                                                          FROM stocks_batches
"
"                                                         WHERE sb_bu       = p_bu
"
"                                                           AND sb_prod_id  = cr_var.rocmrd_prod_id
"
"                                                           AND sb_prod_rev = cr_var.rocmrd_prod_rev
"
"                                                           AND sb_store_id = cr_var.rocmrd_cons_store
"
"                                                           AND sb_cost_method = 'FIFO'
"
"                                                           AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                                                         GROUP BY sb_batch_id,
"
"                                                                  sb_bc_unit_cost
"
"                                                         ORDER BY sb_batch_id ASC
"
"                                                            )
"
"                                                         UNION ALL
"
"                                                        SELECT sb_batch_id,sb_bc_unit_cost,sb_qty
"
"                                                          FROM(
"
"                                                        SELECT sb_batch_id,
"
"                                                               sb_bc_unit_cost,
"
"                                                               NVL(SUM((sb_qty_in - (sb_qty_out + sb_qty_allocated+sb_qty_picked))),0) sb_qty
"
"                                                          FROM stocks_batches
"
"                                                         WHERE sb_bu          = p_bu
"
"                                                           AND sb_prod_id     = cr_var.rocmrd_prod_id
"
"                                                           AND sb_prod_rev    = cr_var.rocmrd_prod_rev
"
"                                                           AND sb_store_id    = cr_var.rocmrd_cons_store
"
"                                                           AND sb_cost_method = 'LIFO'
"
"                                                           AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"                                                         GROUP BY sb_batch_id,
"
"                                                                  sb_bc_unit_cost
"
"                                                         ORDER BY sb_batch_id DESC
"
"                                                            ))
"
"                                    LOOP
"
"
"
"
"
"                                          IF cr_batch.sb_qty  >= v_rem_batch_qty THEN
"
"                                             v_elg_batch_qty := v_rem_batch_qty;
"
"                                             v_rem_batch_qty := v_rem_batch_qty - v_elg_batch_qty;
"
"                                          ELSIF cr_batch.sb_qty  < v_rem_batch_qty THEN
"
"                                             v_elg_batch_qty := cr_batch.sb_qty;
"
"                                             v_rem_batch_qty := v_rem_batch_qty - v_elg_batch_qty;
"
"                                          END IF;
"
"
"
"                                --v_err := cr_batch.sb_batch_id||' ' ||cr_var.rocmrd_prod_id ||' ' ||v_elg_batch_qty;
"
"
"
"
"
"
"
"                                            IF v_elg_batch_qty > 0 THEN
"
"
"
"                                          --dbms_output.put_line('Batch '||' Line'||' ' || r_mat_cons.ROCMRD_SEQ_NO ||' ' ||r_mat_cons.rocmrd_prod_id ||' Batch id' ||cr_batch.sb_batch_id ||' Qty' ||v_elg_batch_qty);
"
"
"
"                                                  proc_upd_stock_batches(
"
"                                                                         p_bu          ,
"
"                                                                         cr_var.rocmrd_cons_store  ,
"
"                                                                         cr_var.rocmrd_prod_id   ,
"
"                                                                         cr_var.rocmrd_prod_rev   ,
"
"                                                                         cr_batch.sb_batch_id     ,
"
"                                                                         0       ,
"
"                                                                         0      ,
"
"                                                                         v_elg_batch_qty    ,
"
"                                                                         0     ,
"
"                                                                         cr_batch.sb_bc_unit_cost ,
"
"                                                                         cr_batch.sb_bc_unit_cost ,
"
"                                                                         0    ,
"
"                                                                         0 ,
"
"                                                                         0    ,
"
"                                                                         0     ,
"
"                                                                         'N',
"
"                                                                         p_doc_date   ,
"
"                                                                         NULL      ,
"
"                                                                         p_doc_no       ,
"
"                                                                         cr_var.rocmrd_seq_no  ,
"
"                                                                         NULL     ,
"
"                                                                         NULL      ,
"
"                                                                         p_doc_no       ,
"
"                                                                         cr_var.rocmrd_seq_no  ,
"
"                                                                         cr_var.rocmrd_seq_no ,
"
"                                                                         func_find_product_class(p_bu, p_plnt, cr_var.rocmrd_prod_id, cr_var.rocmrd_prod_rev)      ,
"
"                                                                         'MCM'    ,
"
"                                                                         'SFM'          ,
"
"                                                                         p_doc_no   ,
"
"                                                                         p_doc_date ,
"
"                                                                         NULL     ,
"
"                                                                         NULL   ,
"
"                                                                         p_user         ,
"
"                                                                         NULL    ,
"
"                                                                         NULL,
"
"                                                                        p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                                                        p_prod_subcls          => v_prod_subcls   ,
"
"                                                                        p_prod_subcls_desc     => v_prod_subcls_desc,
"
"                                                                        p_prod_grp             => v_prod_grp,
"
"                                                                        p_prod_grp_desc        => v_prod_grp_desc,
"
"                                                                        p_prod_subgrp          => v_prod_subgrp,
"
"                                                                        p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"                                                                        p_prod_cls_type        => v_prod_cls_type
"
"                                                                        );
"
"
"
"
"
"
"
"                                                            SELECT NVL(MAX(rocmrb_sub_seq_no), 0) + 1
"
"                                                              INTO v_batch_seq_no
"
"                                                              FROM rework_ord_comp_mat_req_bat
"
"                                                             WHERE rocmrb_bu         = p_bu
"
"                                                               AND rocmrb_plnt       = p_plnt
"
"                                                               AND rocmrb_doc_no     = p_doc_no
"
"                                                               AND rocmrb_seq_no     = cr_var.rocmrd_seq_no;
"
"
"
"                                                     INSERT INTO rework_ord_comp_mat_req_bat(rocmrb_bu          ,
"
"                                                                                            rocmrb_plnt        ,
"
"                                                                                            rocmrb_doc_no      ,
"
"                                                                                            rocmrb_seq_no      ,
"
"                                                                                            rocmrb_sub_seq_no  ,
"
"                                                                                            rocmrb_batch_id    ,
"
"                                                                                            rocmrb_batch_qty   ,
"
"                                                                                            rocmrb_cre_by      ,
"
"                                                                                            rocmrb_cre_date    ,
"
"                                                                                            rocmrb_upd_by      ,
"
"                                                                                            rocmrb_upd_date    ,
"
"                                                                                            rocmrb_batch_cost,
"
"                                                rocmrb_rw_seq_no
"
"                                                                                            )
"
"                                                                                      VALUES(p_bu              ,
"
"                                                                                             p_plnt            ,
"
"                                                                                             p_doc_no          ,
"
"                                                                                             cr_var.rocmrd_seq_no  ,
"
"                                                                                             v_batch_seq_no,
"
"                                                                                             cr_batch.sb_batch_id   ,
"
"                                                                                             v_elg_batch_qty ,
"
"                                                                                             p_user,
"
"                                                                                             SYSDATE           ,
"
"                                                                                             NULL              ,
"
"                                                                                             NULL              ,
"
"                                                                                             cr_batch.sb_bc_unit_cost,
"
"                                                 cr_vg.rwocd_seq_no
"
"                                                                                           );
"
"
"
"                                            END IF;
"
"
"
"                                        EXIT WHEN v_rem_batch_qty = 0;
"
"
"
"                                END LOOP cr_batch;
"
"
"
"                                     IF v_rem_batch_qty > 0 THEN
"
"
"
"                                        RAISE_APPLICATION_ERROR(-20251,'ICM'||cr_var.rocmrd_prod_id||'/'||cr_var.rocmrd_prod_rev||'/'||cr_var.rocmrd_cons_store);
"
"
"
"                                     END IF;
"
"
"
"                        END IF; --End of Batch
"
"
"
"                        IF func_find_prod_cons_method(p_bu,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev) IN ('P') THEN
"
"
"
"                            v_req_so_push_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                            v_rem_so_push_qty := v_elg_qty;--r_mat_cons.rocmrd_cons_qty;
"
"                            v_elg_so_push_qty := 0;
"
"
"
"                                        FOR cr_push IN (SELECT so_pfx,
"
"                                                               so_no,
"
"                                                               so_seq_no,
"
"                                                               so_sub_seq_no,
"
"                                                               swoq_lot_no,
"
"                                                               swoq_ser_no,
"
"                                                               swoq_sys_ls_no,
"
"                                                               swoq_source_id,
"
"                                                               swoq_source_type,
"
"                                                               swoq_crate_id,
"
"                                                               swoq_batch_id,
"
"                                                               NVL(SUM(avbl_qty),0)avbl_qty
"
"                                                          FROM(
"
"                                                               SELECT NULL so_pfx,
"
"                                                               NULL so_no,
"
"                                                               NULL so_seq_no,
"
"                                                               NULL so_sub_seq_no,
"
"                                                               swoq_lot_no,
"
"                                                               swoq_ser_no,
"
"                                                               swoq_sys_ls_no,
"
"                                                               swoq_source_id,
"
"                                                               swoq_source_type,
"
"                                                               swoq_crate_id,
"
"                                                               swoq_batch_id,
"
"                                                               (swoq_qty - swoq_qty_allocated) avbl_qty
"
"                                                          FROM stock_wip_order_qty
"
"                                                         WHERE swoq_bu = p_bu
"
"                                                           AND swoq_prod_id = cr_var.rocmrd_prod_id
"
"                                                           AND swoq_prod_rev = cr_var.rocmrd_prod_rev
"
"                                                           AND swoq_store_id = cr_var.rocmrd_cons_store
"
"                                                           AND swoq_order_no = cr6.rwochd_rw_ord_no
"
"                                                           AND (swoq_qty - swoq_qty_allocated) > 0
"
"                                                           AND swoq_order_type  = 'RW'
"
"                                                           AND func_find_prod_cons_method(swoq_bu ,swoq_prod_id,swoq_prod_rev) IN ('P')
"
"                                                        )GROUP BY so_pfx,
"
"                                                                  so_no,
"
"                                                                  so_seq_no,
"
"                                                                  so_sub_seq_no,
"
"                                                                  swoq_lot_no,
"
"                                                                  swoq_ser_no,
"
"                                                                  swoq_sys_ls_no,
"
"                                                                  swoq_source_id,
"
"                                                                  swoq_batch_id,
"
"                                                                  swoq_source_type,swoq_crate_id)
"
"                                        LOOP
"
"
"
"                                            IF cr_push.avbl_qty >= v_rem_so_push_qty THEN
"
"                                               v_elg_so_push_qty := v_rem_so_push_qty;
"
"                                               v_rem_so_push_qty := v_rem_so_push_qty - v_elg_so_push_qty;
"
"                                            ELSIF cr_push.avbl_qty < v_rem_so_push_qty  THEN
"
"                                               v_elg_so_push_qty := cr_push.avbl_qty;
"
"                                               v_rem_so_push_qty := v_rem_so_push_qty - v_elg_so_push_qty;
"
"                                            END IF;
"
"
"
"
"
"                                                    IF v_elg_so_push_qty > 0  THEN
"
"
"
"                                                      DBMS_OUTPUT.PUT_LINE('Push '||' ' ||cr_var.rocmrd_prod_id||' ' ||cr_push.avbl_qty||' ' ||v_elg_so_push_qty);
"
"
"
"                                                        proc_insrupd_wip (
"
"                                                                          p_bu,
"
"                                                                          cr_var.rocmrd_cons_store,
"
"                                                                          cr_var.rocmrd_prod_id,
"
"                                                                          cr_var.rocmrd_prod_rev,
"
"                                                                          cr_push.swoq_sys_ls_no,
"
"                                                                          cr_push.swoq_lot_no,
"
"                                                                          cr_push.swoq_ser_no,
"
"                                                                          func_find_prod_expiry_date(p_bu,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev,TRUNC(SYSDATE)),
"
"                                                                          cr_push.swoq_source_type,
"
"                                                                          cr_push.swoq_source_id,
"
"                                                                          0,
"
"                                                                          v_elg_so_push_qty,
"
"                                                                          'RW',
"
"                                                                          NULL,
"
"                                                                          cr6.rwochd_rw_ord_no,
"
"                                                                          NULL,
"
"                                                                          NULL,
"
"                                                                          p_user,
"
"                                                                          p_batch_id               => cr_push.swoq_batch_id, --p_batch_id
"
"                                                                          p_so_no                => NULL, --p_so_order_no
"
"                                                                          p_so_pfx               => NULL, --p_so_order_pfx
"
"                                                                          p_so_seq_no              => NULL, --p_so_seq_no
"
"                                                                          p_so_sub_seq_no          => NULL, --p_so_sub_seq_no
"
"                                                                          p_type                => 'NA',
"
"                                                                          p_proj_id             => NULL,
"
"                                                                          p_task_id             => NULL,
"
"                                                                          p_ord_trans_no        => NULL,
"
"                                                                          p_crate_id => cr_push.swoq_crate_id
"
"                                                                          );
"
"
"
"
"
"
"
"                                                    END IF;
"
"
"
"                                    IF func_find_prod_ser_lot_type(p_bu,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev) IN ('L','S','O') THEN
"
"
"
"                                                v_req_lot_qty := v_elg_so_push_qty;
"
"                                                v_rem_lot_qty := v_elg_so_push_qty;
"
"                                                v_elg_lot_qty := 0;
"
"
"
"                                                    FOR cr_lot IN (SELECT lss_sys_ls_no,
"
"                                                                          lss_lot_no,
"
"                                                                          lss_ser_no,
"
"                                                                          lss_source_type,
"
"                                                                          lss_source_id,
"
"                                                                          NVL(SUM((lss_qty_hand - lss_qty_allocated)),0) lss_qty_hand
"
"                                                                      FROM lot_ser_stocks
"
"                                                                     WHERE lss_bu       = p_bu
"
"                                                                       AND lss_prod_id  = cr_var.rocmrd_prod_id
"
"                                                                       AND lss_prod_rev = cr_var.rocmrd_prod_rev
"
"                                                                       AND lss_store_id = cr_var.rocmrd_cons_store
"
"                                                                       AND (lss_lot_no = cr_push.swoq_lot_no OR cr_push.swoq_lot_no IS NULL)
"
"                                                                       AND (lss_ser_no = cr_push.swoq_ser_no OR cr_push.swoq_ser_no IS NULL)
"
"                                                                       AND (lss_sys_ls_no = cr_push.swoq_sys_ls_no OR cr_push.swoq_sys_ls_no IS NULL)
"
"                                                                       AND (lss_qty_hand - lss_qty_allocated) > 0
"
"                                                                      GROUP BY lss_sys_ls_no,
"
"                                                                               lss_lot_no,
"
"                                                                               lss_ser_no,
"
"                                                                               lss_source_type,
"
"                                                                               lss_source_id
"
"                                                                     ORDER BY lss_sys_ls_no
"
"                                                                     )
"
"                                                    LOOP
"
"
"
"                                                    IF  cr_lot.lss_qty_hand  >= v_rem_lot_qty THEN
"
"                                                           v_elg_lot_qty := v_rem_lot_qty;
"
"                                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                                    ELSIF  cr_lot.lss_qty_hand  <  v_rem_lot_qty THEN
"
"                                                           v_elg_lot_qty := cr_lot.lss_qty_hand;
"
"                                                           v_rem_lot_qty := v_rem_lot_qty - v_elg_lot_qty;
"
"                                                    END IF;
"
"
"
"                                                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_elg_lot_qty||'~'||:NEW.sccmc_prod_id );
"
"
"
"                                                        IF v_elg_lot_qty > 0 THEN
"
"
"
"                                                         proc_upd_lot_ser_stocks(
"
"                                                                                p_bu             ,
"
"                                                                                cr_var.rocmrd_cons_store ,
"
"                                                                                cr_var.rocmrd_prod_id          ,
"
"                                                                                cr_var.rocmrd_prod_rev ,
"
"                                                                                cr_lot.lss_sys_ls_no         ,
"
"                                                                                0          ,
"
"                                                                                v_elg_lot_qty         ,
"
"                                                                                0       ,
"
"                                                                                func_find_unitcost(p_bu ,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_Rev,cr_var.rocmrd_cons_store)   ,
"
"                                                                                func_find_prod_ser_no_opt(p_bu,cr_var.rocmrd_prod_id,cr_var.rocmrd_prod_rev),
"
"                                                                                cr_lot.lss_lot_no            ,
"
"                                                                                cr_lot.lss_ser_no            ,
"
"                                                                                cr_lot.lss_source_type          ,
"
"                                                                                cr_lot.lss_source_id            ,
"
"                                                                                NULL          ,
"
"                                                                                p_doc_date          ,
"
"                                                                                'MCM'          ,
"
"                                                                                NULL           ,
"
"                                                                                p_doc_no            ,
"
"                                                                                cr_var.rocmrd_seq_no        ,
"
"                                                                                'SFM'              ,
"
"                                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION'                 ,
"
"                                                                                'MATERIAL CONSUMPTION ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,cr_var.rocmrd_cons_store,1),
"
"                                                                                p_user
"
"                                                                                );
"
"
"
"                                                          SELECT NVL (MAX (rocmrl_sub_seq_no), 0) + 1
"
"                                                            INTO v_lot_seq_no
"
"                                                            FROM rework_ord_comp_mat_req_lot
"
"                                                           WHERE rocmrl_bu         = p_bu
"
"                                                             AND rocmrl_plnt       = p_plnt
"
"                                                             AND rocmrl_doc_no     = p_doc_no
"
"                                                             AND rocmrl_seq_no     = cr_var.rocmrd_seq_no;
"
"
"
"
"
"
"
"                                                        INSERT INTO rework_ord_comp_mat_req_lot(
"
"                                                                                            rocmrl_bu             ,
"
"                                                                                            rocmrl_plnt     ,
"
"                                                                                            rocmrl_doc_no    ,
"
"                                                                                            rocmrl_seq_no     ,
"
"                                                                                            rocmrl_sub_seq_no  ,
"
"                                                                                            rocmrl_lot_no        ,
"
"                                                                                            rocmrl_sys_ls_no      ,
"
"                                                                                            rocmrl_source_id       ,
"
"                                                                                            rocmrl_source_type     ,
"
"                                                                                            rocmrl_lot_qty  ,
"
"                                                                                            rocmrl_cre_by    ,
"
"                                                                                            rocmrl_cre_date   ,
"
"                                                                                            rocmrl_upd_by      ,
"
"                                                                                            rocmrl_upd_date,
"
"                                                                                            rocmrl_ser_no,
"
"                                                rocmrl_rw_seq_no
"
"                                                                                            )
"
"                                                                                   VALUES(p_bu                   ,
"
"                                                                                          p_plnt                 ,
"
"                                                                                          p_doc_no               ,
"
"                                                                                          cr_var.rocmrd_seq_no       ,
"
"                                                                                          v_lot_seq_no,
"
"                                                                                          cr_lot.lss_lot_no         ,
"
"                                                                                          cr_lot.lss_sys_ls_no      ,
"
"                                                                                          cr_lot.lss_source_id  ,
"
"                                                                                          cr_lot.lss_source_type,
"
"                                                                                          v_elg_lot_qty  ,
"
"                                                                                          p_user      ,
"
"                                                                                          SYSDATE                ,
"
"                                                                                          NULL,
"
"                                                                                          NULL,
"
"                                                                                          cr_lot.lss_ser_no,
"
"                                              cr_vg.rwocd_seq_no
"
"                                                                                          );
"
"                                                        END IF; --Lot
"
"
"
"                                                               EXIT WHEN v_rem_lot_qty = 0;
"
"
"
"                                                    END LOOP cr_lot; --Lot
"
"
"
"                                                    IF v_rem_lot_qty > 0 THEN
"
"                                                        RAISE_APPLICATION_ERROR(-20251,'ICM'||cr_push.swoq_lot_no ||' ' ||cr_push.swoq_sys_ls_no ||' ' ||cr_push.swoq_ser_no||' ' ||cr_var.rocmrd_prod_id||'~'||cr_var.rocmrd_prod_rev||'~'||cr_var.rocmrd_cons_store||'~'||v_rem_lot_qty);
"
"                                                    END IF;
"
"
"
"
"
"
"
"                                        END IF; --Finish of Lot/Serial(Push)
"
"
"
"                                                EXIT WHEN v_rem_so_push_qty = 0;
"
"
"
"                                        END LOOP cr_push;
"
"
"
"                                    IF v_rem_so_push_qty > 0 THEN
"
"                                            RAISE_APPLICATION_ERROR(-20251,'ICM'||'Qty. on hand is low against order '||' '||v_rem_so_push_qty);
"
"                                    END IF;
"
"
"
"                        END IF;
"
"
"
"                    UPDATE rework_ord_comp_mat_req_dtls
"
"                       SET rocmrd_alloc_qty = rocmrd_alloc_qty + v_elg_qty,
"
"                           rocmrd_unit_cost = v_unit_cost
"
"                     WHERE rocmrd_bu = p_bu
"
"                       AND rocmrd_plnt = p_plnt
"
"                       AND rocmrd_doc_no = p_doc_no
"
"                       AND rocmrd_seq_no = cr_var.rocmrd_seq_no
"
"               and rocmrd_rwk_seq_no    = cr_vg.rwocd_seq_no;
"
"
"
"
"
"
"
"
"
"                       IF SQL%FOUND THEN
"
"                            p_res := 'Y';
"
"                       END IF;
"
"
"
"            END IF;
"
"
"
"
"
"               END LOOP;
"
"         END LOOP;
"
"
"
"
"
"         FOR cr_vg1 IN(SELECT rocmrd_var_prod_id,rocmrd_var_prod_rev,SUM(rocmrd_alloc_qty)rocmrd_alloc_qty
"
"                        FROM rework_ord_comp_mat_req_dtls
"
"                       WHERE rocmrd_bu = p_bu
"
"                         AND rocmrd_plnt = p_plnt
"
"                         AND rocmrd_doc_no = p_doc_no
"
"                         AND rocmrd_alloc_qty > 0
"
"                         AND rocmrd_var_prod_id IS NOT NULL
"
"                         GROUP BY rocmrd_var_prod_id,rocmrd_var_prod_rev)
"
"           LOOP
"
"              UPDATE rework_ord_comp_mat_req_dtls
"
"                 SET rocmrd_alloc_qty = cr_vg1.rocmrd_alloc_qty,
"
"                     rocmrd_upd_by = p_user,
"
"                     rocmrd_upd_date = SYSDATE
"
"               WHERE rocmrd_bu = p_bu
"
"                 AND rocmrd_plnt= p_plnt
"
"                 AND rocmrd_doc_no = p_doc_no
"
"                 AND rocmrd_prod_id = cr_vg1.rocmrd_var_prod_id
"
"                 AND rocmrd_prod_rev = cr_vg1.rocmrd_var_prod_rev;
"
"
"
"                  SELECT rocmrd_cons_qty
"
"                    INTO v_vg_cons_qty
"
"                    FROM rework_ord_comp_mat_req_dtls
"
"                   WHERE rocmrd_bu = p_bu
"
"                     AND rocmrd_plnt = p_plnt
"
"                     AND rocmrd_doc_no = p_doc_no
"
"                     AND rocmrd_prod_id = cr_vg1.rocmrd_var_prod_id
"
"                     AND rocmrd_prod_rev = cr_vg1.rocmrd_var_prod_rev;
"
"
"
"            IF cr_vg1.rocmrd_alloc_qty =  v_vg_cons_qty THEN
"
"
"
"                   UPDATE rework_ord_comp_mat_req_dtls
"
"                      SET rocmrd_cons_qty = cr_vg1.rocmrd_alloc_qty,
"
"                      rocmrd_rqrd_qty = cr_vg1.rocmrd_alloc_qty,
"
"                      rocmrd_upd_by = p_user,
"
"                      rocmrd_upd_date = SYSDATE
"
"                    WHERE rocmrd_bu = p_bu
"
"                      AND rocmrd_plnt = p_plnt
"
"                      AND rocmrd_doc_no = p_doc_no
"
"                      AND rocmrd_var_prod_id = cr_vg1.rocmrd_var_prod_id
"
"                      AND rocmrd_var_prod_rev = cr_vg1.rocmrd_var_prod_rev;
"
"
"
"
"
"            END IF;
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
"           END LOOP;
"
"
"
"    ELSIF p_type = 'D'     THEN
"
"
"
"        FOR r_dec IN (SELECT (rocmrd_alloc_qty) rocmrd_cons_qty,rocmrd_rwk_seq_no,
"
"                   rocmrd_prod_id,rocmrd_prod_rev,rocmrd_cons_store,rocmrd_seq_no,rwocd_rw_ord_no
"
"              FROM rework_order_comp_hd,
"
"                   rework_order_comp_dtl,
"
"                   rework_ord_comp_mat_req_dtls
"
"             WHERE rwochd_bu        = rwocd_bu
"
"               AND rwochd_plnt      = rwocd_plnt
"
"               AND rwochd_doc_no    = rwocd_doc_no
"
"               AND rwochd_bu        = rocmrd_bu
"
"               AND rwochd_plnt      = rocmrd_plnt
"
"               AND rwochd_doc_no    = rocmrd_doc_no
"
"               AND rwocd_seq_no     = rocmrd_rwk_seq_no
"
"               AND rwochd_bu        = p_bu
"
"               AND rwochd_plnt      = p_plnt
"
"               AND rwochd_doc_no    = p_doc_no
"
"               AND rocmrd_var_prod_id IS NULL
"
"               AND func_find_prod_var_group_type(p_bu,rocmrd_prod_id,rocmrd_prod_rev) NOT IN('Y')
"
"               AND rwochd_status = 'N'
"
"                         AND rocmrd_alloc_qty > 0
"
"                    )
"
"        LOOP
"
"
"
"                    v_unit_cost := func_find_unitcost(p_bu ,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev,r_dec.rocmrd_cons_store);
"
"
"
"                        proc_upd_stocks(
"
"                                        p_bu           ,
"
"                                        r_dec.rocmrd_cons_store,
"
"                                        NULL      ,
"
"                                        r_dec.rocmrd_prod_id,
"
"                                        r_dec.rocmrd_prod_rev     ,
"
"                                        0      ,
"
"                                        0      ,
"
"                                        0     ,
"
"                                        0     ,
"
"                                       -r_dec.rocmrd_cons_qty  , --p_alloc_Qty
"
"                                        v_unit_cost      ,
"
"                                        v_unit_cost      ,
"
"                                        0 ,
"
"                                        'N',
"
"                                        0    ,
"
"                                        0   ,
"
"                                        0,
"
"                                        r_dec.rocmrd_seq_no            ,
"
"                                        r_dec.rocmrd_seq_no      ,
"
"                                        NULL       ,
"
"                                        p_doc_no        ,
"
"                                        NULL   ,
"
"                                        p_doc_no     ,
"
"                                        NULL      ,
"
"                                        func_find_year(p_bu,TRUNC(p_doc_date))          ,
"
"                                        func_find_period(p_bu,TRUNC(p_doc_date))        ,
"
"                                        TRUNC(p_doc_date)          ,
"
"                                        NULL       ,
"
"                                        'SFM'          ,
"
"                                        'MR'        ,
"
"                                        NULL          ,
"
"                                        p_user        ,
"
"                                        SYSDATE      ,
"
"                                        NULL    ,
"
"                                        func_find_product_class(p_bu,p_plnt,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev)      ,
"
"                                        NULL         ,
"
"                                        NULL    ,
"
"                                        NULL       ,
"
"                                        0   ,
"
"                                        0     ,
"
"                                        TRUNC(p_doc_date)       ,
"
"                                        NULL   ,
"
"                                        NULL,
"
"                                        0,
"
"                                        0,
"
"                                        r_dec.rocmrd_seq_no ,
"
"                                        NULL        ,
"
"                                        0       ,
"
"                                        0         ,
"
"                                        'MATERIAL DE-ALLOCATED FOR REWORK COMPLETION'           ,
"
"                                        'MATERIAL DE-ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,r_dec.rocmrd_cons_store,1),
"
"                                        0,
"
"                                        0,
"
"                                        NULL         ,
"
"                                        'S',
"
"                                        p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                        p_prod_sub_cls_id      => v_prod_subcls   ,
"
"                                        p_prod_sub_cls_desc    => v_prod_subcls_desc,
"
"                                        p_prod_grp_id          => v_prod_grp,
"
"                                        p_prod_grp_desc        => v_prod_grp_desc,
"
"                                        p_prod_sub_grp_id      => v_prod_subgrp,
"
"                                        p_prod_sub_grp_desc    => v_prod_subgrp_desc,
"
"                                        p_prod_cls_type        => v_prod_cls_type
"
"                                        );
"
"
"
"
"
"                                        OPEN c6(r_dec.rocmrd_rwk_seq_no);
"
"                                        FETCH c6 INTO cr6;
"
"                                        CLOSE c6;
"
"
"
"
"
"
"
"                                                IF func_find_prod_indicator_type(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev) = 'I' THEN
"
"                                                    v_so_pfx       := cr6.rwochd_so_pfx  ;
"
"                                                    v_so_no        := cr6.rwochd_so_no;
"
"                                                    v_so_seq_no    := cr6.rwochd_so_seq_no;
"
"                                                    v_so_sub_seq   :=  cr6.rwochd_so_sub_seq_no;
"
"                                                    v_so_schld_desc:= cr6.rwochd_so_schld_desc;
"
"                                                 ELSE
"
"                                                v_so_pfx       :=  NULL;
"
"                                                v_so_no        :=  NULL;
"
"                                                v_so_seq_no    :=  NULL;
"
"                                                v_so_sub_seq   :=  NULL;
"
"                                                v_so_schld_desc:=  NULL;
"
"
"
"                                                                         END IF;
"
"
"
"                                            IF v_so_pfx IS NOT NULL AND func_find_prod_indicator_type(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev) = 'I' THEN
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
"                                                                           proc_upd_so_stocks(p_bu,
"
"                                                                                    r_dec.rocmrd_cons_store,
"
"                                                                                    r_dec.rocmrd_prod_id,
"
"                                                                                    r_dec.rocmrd_prod_rev,
"
"                                                                                    0,
"
"                                                                                    -r_dec.rocmrd_cons_qty,
"
"                                                                                    func_find_unitcost(p_bu ,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev,r_dec.rocmrd_cons_store) ,
"
"                                                                                    v_so_pfx,
"
"                                                                                    v_so_no,
"
"                                                                                    v_so_seq_no,
"
"                                                                                    v_so_sub_seq,
"
"                                                                                    TRUNC(SYSDATE),
"
"                                                                                    'RW',
"
"                                                                                    NULL,
"
"                                                                                    p_doc_no,
"
"                                                                                    NULL,
"
"                                                                                    NULL,
"
"                                                                                    NULL,
"
"                                                                                    NULL,
"
"                                                                                    'MA',
"
"                                                                                    'SFM',
"
"                                                                                    'MATERIAL ALLOCATED FOR REWORK COMPLETION',
"
"                                                                                    'MATERIAL ALLOCATED FOR REWORK COMPLETION',
"
"                                                                                    p_user,
"
"                                                                                    'SO',
"
"                                                                                    NULL,
"
"                                                                                    NULL
"
"                                                                                 );
"
"                                                                END IF;
"
"
"
"                                                                IF func_find_prod_cons_method(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev) IN ('P') AND func_find_prod_ser_lot_type(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev) IN ('N') THEN
"
"
"
"                                                                    proc_insrupd_wip (
"
"									      p_bu,
"
"									      r_dec.rocmrd_cons_store,
"
"									      r_dec.rocmrd_prod_id,
"
"									      r_dec.rocmrd_prod_rev,
"
"									      NULL,
"
"									      NULL,
"
"									      NULL,
"
"									      func_find_prod_expiry_date(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev,TRUNC(SYSDATE)),
"
"									      NULL,
"
"									      NULL,
"
"									      0,
"
"									      -r_dec.rocmrd_cons_qty  ,
"
"									      'RW',
"
"									      NULL,
"
"									      cr6.rwochd_rw_ord_no,
"
"									      NULL,
"
"									      NULL,
"
"									      p_user,
"
"									      p_batch_id               => NULL, --p_batch_id
"
"									      p_so_no                => NULL, --p_so_order_no
"
"									      p_so_pfx               => NULL, --p_so_order_pfx
"
"									      p_so_seq_no              => NULL, --p_so_seq_no
"
"									      p_so_sub_seq_no          => NULL, --p_so_sub_seq_no
"
"									      p_type            => 'NA',
"
"									      p_proj_id         => NULL,
"
"									      p_task_id         => NULL,
"
"									      p_ord_trans_no        => NULL,
"
"									      p_crate_id            => NULL,
"
"									      p_so_schld_ref => v_so_schld_desc
"
"                                              				);
"
"
"
"                                              				END IF;
"
"
"
"
"
"                FOR cr3  IN (SELECT *
"
"                                FROM rework_ord_comp_mat_req_lot
"
"                               WHERE rocmrl_bu    = p_bu
"
"                                 AND rocmrl_plnt  = p_plnt
"
"                                 AND rocmrl_doc_no = p_doc_no
"
"                                 AND rocmrl_seq_no = r_dec.rocmrd_seq_no
"
"                 AND rocmrl_rw_seq_no = r_dec.rocmrd_rwk_seq_no
"
"                             )
"
"                LOOP
"
"
"
"                                    proc_upd_lot_ser_stocks(
"
"                                                            p_bu             ,
"
"                                                            r_dec.rocmrd_cons_store ,
"
"                                                            r_dec.rocmrd_prod_id          ,
"
"                                                            r_dec.rocmrd_prod_rev ,
"
"                                                            cr3.rocmrl_sys_ls_no         ,
"
"                                                            0          ,
"
"                                                            -cr3.rocmrl_lot_qty   ,
"
"                                                            0       ,
"
"                                                            v_unit_cost   ,
"
"                                                            func_find_prod_ser_no_opt(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev),
"
"                                                            cr3.rocmrl_lot_no            ,
"
"                                                            cr3.rocmrl_ser_no            ,
"
"                                                            cr3.rocmrl_source_type          ,
"
"                                                            cr3.rocmrl_source_id            ,
"
"                                                            NULL          ,
"
"                                                            p_doc_date          ,
"
"                                                            'MCM'          ,
"
"                                                            NULL           ,
"
"                                                            p_doc_no            ,
"
"                                                            r_dec.rocmrd_seq_no        ,
"
"                                                            'SFM'              ,
"
"                                                            'MATERIAL CONSUMPTION DE-ALLOCATED FOR REWORK COMPLETION'                 ,
"
"                                                            'MATERIAL CONSUMPTION DE-ALLOCATED FOR REWORK COMPLETION' || ' ' || p_doc_no ||' - '||p_doc_date||' FROM STORE '||func_find_store_desc(p_bu,r_dec.rocmrd_cons_store,1),
"
"                                                            p_user
"
"                                                            );
"
"
"
"                END LOOP c3;
"
"
"
"                FOR cr4 IN  (SELECT *
"
"                                FROM rework_ord_comp_mat_req_bat
"
"                               WHERE rocmrb_bu       = p_bu
"
"                                 AND rocmrb_plnt    = p_plnt
"
"                                 AND rocmrb_doc_no = p_doc_no
"
"                                 AND rocmrb_seq_no = r_dec.rocmrd_seq_no
"
"                                 AND rocmrb_rw_seq_no = r_dec.rocmrd_rwk_seq_no
"
"                             )
"
"                LOOP
"
"                                      proc_upd_stock_batches(
"
"                                                             p_bu          ,
"
"                                                             r_dec.rocmrd_cons_store  ,
"
"                                                             r_dec.rocmrd_prod_id   ,
"
"                                                             r_dec.rocmrd_prod_rev   ,
"
"                                                             cr4.rocmrb_batch_id     ,
"
"                                                             0       ,
"
"                                                             0      ,
"
"                                                             -cr4.rocmrb_batch_qty  ,
"
"                                                             0     ,
"
"                                                             cr4.rocmrb_batch_cost ,
"
"                                                             cr4.rocmrb_batch_cost ,
"
"                                                             0    ,
"
"                                                             0 ,
"
"                                                             0    ,
"
"                                                             0     ,
"
"                                                             'N',
"
"                                                             p_doc_date   ,
"
"                                                             NULL      ,
"
"                                                             p_doc_no       ,
"
"                                                             r_dec.rocmrd_seq_no  ,
"
"                                                             NULL     ,
"
"                                                             NULL      ,
"
"                                                             p_doc_no       ,
"
"                                                             r_dec.rocmrd_seq_no  ,
"
"                                                             r_dec.rocmrd_seq_no ,
"
"                                                             func_find_product_class(p_bu,p_plnt, r_dec.rocmrd_prod_id, r_dec.rocmrd_prod_rev)      ,
"
"                                                             'MCM'    ,
"
"                                                             'SFM'          ,
"
"                                                             p_doc_no   ,
"
"                                                             p_doc_date ,
"
"                                                             NULL     ,
"
"                                                             NULL   ,
"
"                                                             p_user         ,
"
"                                                             NULL    ,
"
"                                                             NULL,
"
"                                                            p_prod_cls_desc        => v_prod_cls_desc ,
"
"                                                            p_prod_subcls          => v_prod_subcls   ,
"
"                                                            p_prod_subcls_desc     => v_prod_subcls_desc,
"
"                                                            p_prod_grp             => v_prod_grp,
"
"                                                            p_prod_grp_desc        => v_prod_grp_desc,
"
"                                                            p_prod_subgrp          => v_prod_subgrp,
"
"                                                            p_prod_subgrp_desc     => v_prod_subgrp_desc,
"
"                                                            p_prod_cls_type        => v_prod_cls_type
"
"                                                            );
"
"                END LOOP c4;
"
"
"
"
"
"
"
"                FOR cr_push IN (SELECT so_pfx,
"
"                                       so_no,
"
"                                       so_seq_no,
"
"                                       so_sub_seq_no,
"
"                                       swoq_lot_no,
"
"                                       swoq_ser_no,
"
"                                       swoq_sys_ls_no,
"
"                                       swoq_source_id,
"
"                                       swoq_source_type,
"
"                                       swoq_batch_id,
"
"                                       swoq_qty_allocated,swoq_crate_id
"
"                                  FROM(
"
"                                       SELECT NULL so_pfx,
"
"                                       NULL so_no,
"
"                                       NULL so_seq_no,
"
"                                       NULL so_sub_seq_no,
"
"                                       rocmrl_lot_no swoq_lot_no,
"
"                                       rocmrl_ser_no swoq_ser_no,
"
"                                       rocmrl_sys_ls_no swoq_sys_ls_no,
"
"                                       rocmrl_source_id swoq_source_id,
"
"                                       rocmrl_source_type swoq_source_type,
"
"                                       null swoq_batch_id,
"
"                                       rocmrl_lot_qty swoq_qty_allocated,NULL swoq_crate_id
"
"                                  FROM rework_ord_comp_mat_req_lot
"
"                                 WHERE rocmrl_bu = p_bu
"
"                                   AND rocmrl_plnt = p_plnt
"
"                                   AND rocmrl_doc_no = p_doc_no
"
"                                   AND rocmrl_seq_no = r_dec.rocmrd_seq_no
"
"                                   AND rocmrl_bu = p_bu
"
"                                   AND func_find_prod_cons_method(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev) IN ('P')
"
"                                   AND rocmrl_lot_qty > 0
"
"
"
"                                   ))
"
"            LOOP
"
"
"
"
"
"                            IF func_find_prod_indicator_type(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev) IN ('I') THEN
"
"
"
"                                 SELECT rwochd_so_schld_desc
"
"                                   INTO V_SO_SCHLD_DESC
"
"                                   FROM rework_order_comp_hd
"
"                                  WHERE rwochd_bu = p_bu
"
"                                   AND rwochd_plnt = p_plnt
"
"                                   AND rwochd_doc_no = p_doc_no;
"
"
"
"
"
"                            END IF;
"
"
"
"                            proc_insrupd_wip (
"
"                                              p_bu,
"
"                                              r_dec.rocmrd_cons_store,
"
"                                              r_dec.rocmrd_prod_id,
"
"                                              r_dec.rocmrd_prod_rev,
"
"                                              cr_push.swoq_sys_ls_no,
"
"                                              cr_push.swoq_lot_no,
"
"                                              cr_push.swoq_ser_no,
"
"                                              func_find_prod_expiry_date(p_bu,r_dec.rocmrd_prod_id,r_dec.rocmrd_prod_rev,TRUNC(SYSDATE)),
"
"                                              cr_push.swoq_source_type,
"
"                                              cr_push.swoq_source_id,
"
"                                              0,
"
"                                              -cr_push.swoq_qty_allocated  ,
"
"                                              'RW',
"
"                                              NULL,
"
"                                              cr6.rwochd_rw_ord_no,
"
"                                              NULL,
"
"                                              NULL,
"
"                                              p_user,
"
"                                              p_batch_id               => cr_push.swoq_batch_id, --p_batch_id
"
"                                              p_so_no                => NULL, --p_so_order_no
"
"                                              p_so_pfx               => NULL, --p_so_order_pfx
"
"                                              p_so_seq_no              => NULL, --p_so_seq_no
"
"                                              p_so_sub_seq_no          => NULL, --p_so_sub_seq_no
"
"                                              p_type            => 'NA',
"
"                                              p_proj_id         => NULL,
"
"                                              p_task_id         => NULL,
"
"                                              p_ord_trans_no        => NULL,
"
"                                              p_crate_id            => cr_push.swoq_crate_id,
"
"                                              p_so_schld_ref => v_so_schld_desc
"
"                                              );
"
"
"
"                END LOOP cr_push;
"
"
"
"                    -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||r_dec.rocmrd_rwk_seq_no||'/'||r_dec.rocmrd_seq_no);
"
"
"
"                    UPDATE rework_ord_comp_mat_req_dtls
"
"                       SET rocmrd_alloc_qty = 0--rocmrd_alloc_qty - r_dec.rocmrd_cons_qty
"
"                     WHERE rocmrd_bu = p_bu
"
"                       AND rocmrd_plnt = p_plnt
"
"                       AND rocmrd_doc_no = p_doc_no
"
"                       AND rocmrd_seq_no = r_dec.rocmrd_seq_no
"
"                       AND rocmrd_rwk_seq_no = r_dec.rocmrd_rwk_seq_no;
"
"
"
"                    IF SQL%FOUND THEN
"
"                        p_res := 'Y';
"
"                    END IF;
"
"
"
"                    IF SQL%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"                    END IF;
"
"
"
"                END LOOP r_dec;
"
"
"
"            IF p_res = 'Y' THEN
"
"
"
"                DELETE
"
"                  FROM rework_ord_comp_mat_req_lot
"
"                 WHERE rocmrl_bu = p_bu
"
"                   AND rocmrl_plnt = p_plnt
"
"                   AND rocmrl_doc_no = p_doc_no;
"
"
"
"                DELETE
"
"                  FROM rework_ord_comp_mat_req_bat
"
"                 WHERE rocmrb_bu = p_bu
"
"                   AND rocmrb_plnt = p_plnt
"
"                   AND rocmrb_doc_no = p_doc_no;
"
"
"
"            END IF;
"
"
"
"    END IF;
"
"
"
"END proc_alloc_rwk_mat_cons_ln;
"
"
"
"END pkg_rework_mat_cons_ln;"
/
