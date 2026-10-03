CREATE OR REPLACE
"PACKAGE BODY pkg_mr_cre_frm_prodn
"
"IS
"
"
"
"    PROCEDURE proc_cre_mr_frm_prod_comp(p_bu            VARCHAR2,
"
"                                        p_date            DATE,
"
"                                        p_user            VARCHAR2,
"
"                                        p_res        OUT    VARCHAR2,
"
"                                        p_queue        OUT    VARCHAR2
"
"                                        )
"
"    IS
"
"
"
"/*    CURSOR c_pln_ctrl(c_plnt VARCHAR2)
"
"      IS
"
"     SELECT planctrl_mat_rqrd_by_user
"
"       FROM planning_control
"
"      WHERE planctrl_bu = p_bu
"
"        AND planctrl_plnt = c_plnt;*/
"
"
"
"    CURSOR c0
"
"        IS
"
"    SELECT potr_trans_no,
"
"           potr_plnt,
"
"           potr_ord_no,
"
"           prohd_date,
"
"           prohd_ord_no,
"
"           potr_seq_no,
"
"           POTR_OPRN_ID,
"
"           potr_oprn_no,
"
"           prohd_order_qty,
"
"           prohd_prod_id,
"
"           prohd_prod_rev,
"
"           prohd_type,
"
"           prohd_conv_factor,
"
"           prohd_tolr_pct,
"
"           prohd_tolr_qty,
"
"           potr_dept,
"
"           potr_tranfer_type,
"
"           prohd_ord_so_type,
"
"           prohd_so_pfx,
"
"           prohd_so_no,
"
"           prohd_so_seq_no,
"
"           prohd_so_sub_seq_no,
"
"           prohd_so_print_seq_no,
"
"           prohd_so_schld_desc,
"
"           prohd_sou_bu,
"
"           prohd_sou_plnt,
"
"           prohd_sou_ord_pfx,
"
"           prohd_sou_ord_no,
"
"           prohd_sou_seq_no,
"
"           prohd_sou_sub_seq_no,
"
"           prohd_cust_id,
"
"           prohd_cust_po_no,
"
"           prohd_cust_po_seq_no,
"
"           prohd_cust_po_date,
"
"           prohd_so_desp_date,
"
"           prohd_proj_id,
"
"           prohd_task_id,
"
"           potr_sf_code,
"
"           potr_lot_no,
"
"           potr_ser_no,
"
"           potr_sys_ls_no,
"
"           prohd_lot_size,
"
"           porlr_lot_no child_lot_no,
"
"           porlr_ser_no child_ser_no,
"
"           porlr_sys_ls_no child_sys_ls_no,
"
"           prod_route_card_req_flag,
"
"           potr_route_card_no,
"
"           prohd_pp_no,
"
"           prohd_pp_rev,
"
"           (NVL(FLOOR(porlr_enter_qty),potr_ins_proc)) enter_qty,
"
"           potr_enter_wt_qty,
"
"           potr_queue_qty,
"
"           potr_queue_wt_qty,
"
"           prod_net_weight,
"
"           prohd_sf_cons,
"
"           prohd_drg_no,
"
"           prohd_drg_rev,
"
"           potr_oprn_Seq_no
"
"      FROM prod_ord_trans_record,
"
"           prod_ord_rm_lot_record,
"
"           prod_order_hd,products
"
"     WHERE potr_bu         = prohd_bu
"
"       AND potr_plnt     = prohd_plnt
"
"       AND potr_ord_no     = prohd_ord_no
"
"       AND porlr_bu(+)    = potr_bu
"
"       AND porlr_plnt(+)    = potr_plnt
"
"       AND porlr_ord_no(+)    = potr_ord_no
"
"       AND porlr_seq_no(+)    = potr_seq_no
"
"       AND (porlr_sel_flag    = 'Y' OR porlr_sel_flag IS NULL)
"
"       AND prod_bu        = prohd_bu
"
"       AND prod_id        = prohd_prod_id
"
"       AND prod_rev        = prohd_prod_rev
"
"       AND potr_bu         = p_bu
"
"       AND potr_sel_flag    = 'Y'
"
"       AND potr_ins_proc     > 0
"
"       AND (potr_queue_qty + potr_run_qty) >= potr_st_qty
"
"       AND potr_type    = 'PR'
"
"       AND potr_user     = p_user;
"
"
"
"    CURSOR c1(c_plnt    VARCHAR2,c_ord_no    VARCHAR2,c_seq_no    NUMBER)
"
"    IS
"
"    SELECT potv_plnt,
"
"           potv_trans_no,
"
"           potv_ord_no,
"
"           potv_seq_no,
"
"           potv_oprn_id,
"
"           potv_dept_id,
"
"           potv_oprn_code,
"
"           potv_prod_id,
"
"           potv_prod_rev,
"
"           potv_oprn_flag,
"
"           potv_sys_ls_no,
"
"           potv_lot_no,
"
"           potv_ser_no,
"
"           potv_so_pfx,
"
"           potv_so_no,
"
"           potv_so_seq_no,
"
"           potv_so_sub_seq_no,
"
"           potv_so_schld_desc,
"
"           potv_proj_id,
"
"           potv_task_id,
"
"           prohd_uom,
"
"           potv_order_qty,
"
"           potv_ins_proc,
"
"           potv_queue_qty,
"
"           potv_user,
"
"           prohd_mat_req_type,
"
"           prohd_ord_no,
"
"           prohd_order_qty,
"
"           prohd_tolr_qty,
"
"           prohd_tolr_pct  ,
"
"           potv_oprn_seq_no,
"
"           potv_oprn_ln_seq,
"
"           potv_loc_id
"
"      FROM prod_order_hd,prod_ord_trans_view
"
"     WHERE prohd_bu        = potv_bu
"
"       AND prohd_plnt    = potv_plnt
"
"       AND prohd_ord_no    = potv_ord_no
"
"       AND potv_bu        = p_bu
"
"       AND potv_user    = p_user
"
"       AND prohd_status    = 'P'
"
"       AND potv_sel_flag    = 'Y'
"
"       AND prohd_type    NOT IN ('O')
"
"       AND potv_ins_proc    > 0
"
"       AND potv_plnt    = c_plnt
"
"       AND potv_ord_no    = c_ord_no
"
"       AND potv_seq_no    = c_seq_no;
"
"
"
"    CURSOR c2(c_plnt VARCHAR2,c_ord_no VARCHAR2,c_seq_no NUMBER,c_ord_qty NUMBER,
"
"        c_qty NUMBER,c_par_prod_id VARCHAR2, c_par_prod_rev NUMBER,
"
"        --c_mat_rqrd_by_user VARCHAR2,
"
"        c_trans_no VARCHAR2)
"
"    IS
"
"    SELECT  pror_seq_no,
"
"            pror_oprn_id,
"
"        pror_proc_id,
"
"        pror_oprn_flag,
"
"        pror_cons_store,
"
"        promrd_store_id,
"
"        promrd_prod_id,
"
"        promrd_prod_rev,
"
"        promrd_rqrd_date,
"
"        ((promrd_rqrd_qty/c_ord_qty) * c_qty ) rqrd_qty,
"
"        promrd_wip_cons_store_id,
"
"        promrd_uom,
"
"        promrd_prod_uom,
"
"        promrd_matreq_uom,
"
"        promrd_conv_factor,
"
"        promrd_subst_item_avbl
"
"      FROM prod_ord_oper_status_det,prod_order_routing,prod_order_mat_req_dtls
"
"     WHERE prosd_bu        = pror_bu
"
"       AND prosd_plnt    = pror_plnt
"
"       AND prosd_ord_no    = pror_ord_no
"
"       AND prosd_oprn_id    = pror_oprn_id
"
"       AND pror_bu        = promrd_bu
"
"       AND pror_plnt    = promrd_plnt
"
"       AND pror_ord_no    = promrd_ord_no
"
"       AND pror_seq_no    = promrd_seq_no
"
"       AND prosd_bu        = p_bu
"
"       AND prosd_plnt    = c_plnt
"
"       AND prosd_ord_no    = c_ord_no
"
"       AND prosd_seq_no    = c_seq_no
"
"       AND promrd_mat_type     = 'S'
"
"       AND promrd_mat_req     = 'Y'
"
"       AND prosd_sel_flag    = 'Y'
"
"       AND promrd_store_id <> promrd_wip_cons_store_id
"
"       AND promrd_rqrd_qty - (promrd_mr_qty - promrd_mat_rtn_qty) > 0
"
"       AND pror_seq_no = 1
"
"       AND func_find_ord_fo_mr_event(p_bu,c_plnt,c_ord_no,c_par_prod_id,c_par_prod_rev) IN ('C')
"
"       --AND c_mat_rqrd_by_user = 'N'
"
"       UNION ALL
"
"       SELECT  pror_seq_no,
"
"               pror_oprn_id,
"
"        pror_proc_id,
"
"        pror_oprn_flag,
"
"        pror_cons_store,
"
"        promrd_store_id,
"
"        promrd_prod_id,
"
"        promrd_prod_rev,
"
"        promrd_rqrd_date,
"
"        ((promrd_rqrd_qty/c_ord_qty) * c_qty ) rqrd_qty,
"
"        promrd_wip_cons_store_id,
"
"        promrd_uom,
"
"        promrd_prod_uom,
"
"        promrd_matreq_uom,
"
"        promrd_conv_factor,
"
"        promrd_subst_item_avbl
"
"         FROM prod_ord_oper_status_det,prod_order_routing,prod_order_mat_req_dtls
"
"        WHERE prosd_bu        = pror_bu
"
"          AND prosd_plnt    = pror_plnt
"
"          AND prosd_ord_no    = pror_ord_no
"
"          AND prosd_oprn_id    = pror_oprn_id
"
"          AND pror_bu        = promrd_bu
"
"          AND pror_plnt    = promrd_plnt
"
"          AND pror_ord_no    = promrd_ord_no
"
"          AND pror_seq_no    = promrd_seq_no
"
"          AND prosd_bu        = p_bu
"
"          AND prosd_plnt    = c_plnt
"
"          AND prosd_ord_no    = c_ord_no
"
"          AND prosd_seq_no    = c_seq_no
"
"          AND promrd_mat_type     = 'S'
"
"          AND promrd_mat_req     = 'Y'
"
"          AND prosd_sel_flag    = 'Y'
"
"          AND promrd_store_id <> promrd_wip_cons_store_id
"
"          AND promrd_rqrd_qty - (promrd_mr_qty - promrd_mat_rtn_qty) > 0
"
"          AND pror_seq_no > 1
"
"          AND func_find_ord_ro_mr_event(p_bu,c_plnt,c_ord_no,c_par_prod_id,c_par_prod_rev) IN ('C')
"
"          --AND c_mat_rqrd_by_user = 'N'
"
"        UNION ALL
"
"        SELECT potmrdt_seq_no,
"
"               potmrdt_oprn_id,
"
"               potmrdt_proc_id,
"
"               pror_oprn_flag,
"
"               pror_cons_store,
"
"               potmrdt_store_id,
"
"               potmrdt_prod_id,
"
"               potmrdt_prod_rev,
"
"               potmrdt_rqrd_date,
"
"               potmrdt_act_rqrd_qty rqrd_qty,
"
"               pror_cons_store potmrdt_wip_cons_store_id,
"
"               potmrdt_uom,
"
"               potmrdt_prod_uom,
"
"               potmrdt_prod_uom,
"
"               potmrdt_conv_factor,
"
"               'N'
"
"          FROM prod_ord_trans_mat_req_dtls,prod_order_routing
"
"         WHERE potmrdt_bu = pror_bu
"
"           AND potmrdt_plnt = pror_plnt
"
"           AND potmrdt_prod_ord_no = pror_ord_no
"
"           AND potmrdt_oprn_id = pror_oprn_id
"
"           AND potmrdt_proc_id = pror_proc_id
"
"           AND potmrdt_bu = p_bu
"
"           AND potmrdt_plnt = c_plnt
"
"           AND potmrdt_ps_type = 'P'
"
"           --AND c_mat_rqrd_by_user = 'Y'
"
"           AND potmrdt_act_rqrd_qty > 0
"
"           AND potmrdt_trans_no = c_trans_no
"
"           AND potmrdt_prod_ord_no = c_ord_no
"
"           AND potmrdt_store_id <> pror_cons_store;
"
"
"
"    CURSOR c3(c_plnt VARCHAR2,c_ord_no VARCHAR2,c_sf_code VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM prod_order_routing
"
"     WHERE pror_bu        = p_bu
"
"       AND pror_plnt    = c_plnt
"
"       AND pror_ord_no    = c_ord_no
"
"       AND pror_seq_no    = INSTR(c_sf_code,'1',-1);
"
"
"
"    CURSOR c4(c_plnt VARCHAR2,c_ord_no VARCHAR2,c_oprn_id VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM prod_order_routing
"
"     WHERE pror_bu        = p_bu
"
"       AND pror_plnt    = c_plnt
"
"       AND pror_ord_no    = c_ord_no
"
"       AND pror_oprn_id    = c_oprn_id;
"
"
"
"    CURSOR c5
"
"    IS
"
"    SELECT pmrdt_bu,
"
"           pmrdt_plnt,
"
"           pmrdt_ord_no,
"
"           pmrdt_position,
"
"           pmrdt_store_id,
"
"           pmrdt_cons_store_id,
"
"           pmrdt_enter_qty
"
"      FROM prodn_mat_req_dtls_temp
"
"     WHERE pmrdt_bu        = p_bu
"
"       AND pmrdt_user    = p_user
"
"    GROUP BY pmrdt_bu,
"
"         pmrdt_plnt,
"
"         pmrdt_ord_no,
"
"         pmrdt_position,
"
"             pmrdt_store_id,
"
"             pmrdt_cons_store_id,
"
"             pmrdt_enter_qty;
"
"
"
"    CURSOR c6(c_plnt VARCHAR2,c_ord_no VARCHAR2,c_store_id VARCHAR2,c_cons_store_id VARCHAR2,c_pos_id VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM prod_plants,prodn_mat_req_dtls_temp
"
"     WHERE prodplnt_bu        = pmrdt_bu
"
"       AND prodplnt_plnt        = pmrdt_plnt
"
"       AND prodplnt_prod_id        = pmrdt_prod_id
"
"       AND prodplnt_prod_rev    = pmrdt_prod_rev
"
"       AND prodplnt_status        = 'A'
"
"       AND pmrdt_bu            = p_bu
"
"       AND pmrdt_plnt        = c_plnt
"
"       AND pmrdt_ord_no        = c_ord_no
"
"       AND pmrdt_store_id        = c_store_id
"
"       AND pmrdt_cons_store_id    = c_cons_store_id
"
"       AND pmrdt_position        = c_pos_id
"
"       AND pmrdt_user        = p_user;
"
"
"
"    /*CURSOR c7 (c_plnt VARCHAR2,c_proc_id VARCHAR2,c_date DATE)
"
"    IS
"
"    SELECT pi_user_id
"
"      FROM process_incharge
"
"     WHERE pi_bu         = p_bu
"
"       AND pi_plnt         = c_plnt
"
"       AND pi_proc_id     = c_proc_id
"
"       AND (c_date BETWEEN pi_eff_from AND pi_eff_to)
"
"       AND pi_user_id     = func_find_position_id (p_bu, p_user);*/
"
"
"
"    CURSOR c8(c_store_id VARCHAR2,c_prod_id VARCHAR2,c_prod_rev NUMBER,c_ord_no VARCHAR2,c_sf_code VARCHAR2,c_sys_ls_no NUMBER)
"
"    IS
"
"    SELECT stsfs_unit_cost
"
"      FROM store_sf_stocks
"
"     WHERE stsfs_bu        = p_bu
"
"       AND stsfs_store_id    = c_store_id
"
"       AND stsfs_prod_id    = c_prod_id
"
"       AND stsfs_prod_rev    = c_prod_rev
"
"       AND stsfs_ord_no    = c_ord_no
"
"       AND stsfs_sf_code    = c_sf_code
"
"       AND (stsfs_sys_ls_no = c_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND c_sys_ls_no IS NULL));
"
"
"
"    CURSOR c9
"
"    IS
"
"    SELECT icmctrl_auto_mr_issue_flag
"
"      FROM icm_control
"
"     WHERE icmctrl_bu = p_bu;
"
"
"
"    CURSOR c10(c_doc_no VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM inv_stock_trans_hd
"
"     WHERE isthd_bu     = p_bu
"
"       AND isthd_doc_no     = c_doc_no;
"
"
"
"    CURSOR c11(c_prod_id    VARCHAR2,
"
"           c_prod_rev    NUMBER)
"
"        IS
"
"    SELECT prod_lot_size
"
"      FROM products
"
"     WHERE prod_bu  = p_bu
"
"       AND prod_id  = c_prod_id
"
"       AND prod_rev = c_prod_rev;
"
"
"
"    CURSOR c_chk_type(c_plnt    VARCHAR2,c_ord_no        VARCHAR2)
"
"    IS
"
"    SELECT prohd_fo_oprn_mr_event,
"
"           prohd_ro_oprn_mr_event
"
"      FROM prod_order_hd
"
"     WHERE prohd_bu = p_bu
"
"       AND prohd_plnt = c_plnt
"
"       AND prohd_ord_no = c_ord_no;
"
"
"
"    cr4            c4%ROWTYPE;
"
"    --cr7            c7%ROWTYPE;
"
"    cr8            c8%ROWTYPE;
"
"    cr9            c9%ROWTYPE;
"
"    cr10        c10%ROWTYPE;
"
"    cr11        c11%ROWTYPE;
"
"    cr_chk_type    c_chk_type%ROWTYPE;
"
"
"
"    v_year            NUMBER;
"
"    v_period        NUMBER;
"
"    v_sf_frm_store        VARCHAR2(10);
"
"    v_sf_to_store        VARCHAR2(10);
"
"    v_emp_id                 employees.emp_emp_id%TYPE;
"
"    v_pos_id                 hr_positions.hrpos_pos_id%TYPE;
"
"    v_pos_desc               hr_positions.hrpos_pos_name1%TYPE;
"
"    v_dept_id                departments.dept_id%TYPE;
"
"    v_prod_ord_pfx             prod_order_hd.prohd_ord_pfx%TYPE;
"
"    v_emp_name               VARCHAR2 (100);
"
"    v_dummy                  VARCHAR2(50);
"
"    v_user            VARCHAR2(15);
"
"    v_rqst_no        VARCHAR2(15);
"
"    v_seq_no                 NUMBER (5) := 0;
"
"    v_mr_res        VARCHAR2(10);
"
"    v_res            VARCHAR2(100);
"
"    v_res1            VARCHAR2(100);
"
"    v_deflt_store        VARCHAR2(10);
"
"    v_rqst_no1        VARCHAR2(100);
"
"    v_unit_cost        NUMBER(17,5);
"
"
"
"    v_so_pfx        VARCHAR2(5);
"
"    v_so_no            VARCHAR2(15);
"
"    v_so_seq_no        NUMBER(5);
"
"    v_so_sub_seq_no        NUMBER(5);
"
"    v_so_schld_desc        VARCHAR2(50);
"
"    v_proj_id        VARCHAR2(10);
"
"    v_task_id        VARCHAR2(10);
"
"        v_lo_no                 VARCHAR2(100);
"
"    var_iss_doc_no        VARCHAR2(15);
"
"    var_dc_no        VARCHAR2(15);
"
"    var_pack_dc_no        VARCHAR2(15);
"
"    v_qty            NUMBER;
"
"    v_mr_req_qty        NUMBER := 0;
"
"    var_mr_qty        NUMBER := 0;
"
"    var_tolr_qty        NUMBER := 0;
"
"    v_dc_doc_no        VARCHAR2 (4000);
"
"    v_dc_pack_no        VARCHAR2 (4000);
"
"    v_trans_no            VARCHAR2(15);
"
"    var_jrnl_res        VARCHAR2(1);
"
"    v_lot_size        NUMBER;
"
"    c_comp_cre        VARCHAR2(1) := 'N';
"
"    --c_pln_ctrl1        c_pln_ctrl%ROWTYPE;
"
"        v_iss_code       VARCHAR2(10);
"
"
"
"
"
"    BEGIN
"
"
"
"
"
"            proc_find_year_period (p_bu,p_date,v_year,v_period);
"
"
"
"            DELETE
"
"              FROM prodn_mat_req_dtls_temp
"
"             WHERE pmrdt_bu        = p_bu
"
"               AND pmrdt_user    = p_user;
"
"
"
"
"
"
"
"        FOR cr0 IN c0
"
"        LOOP
"
"
"
"            /*OPEN c_pln_ctrl(cr0.potr_plnt);
"
"            FETCH c_pln_ctrl INTO c_pln_ctrl1;
"
"            IF c_pln_ctrl%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20560,'PLN');
"
"            END IF;
"
"
"
"            CLOSE c_pln_ctrl;*/
"
"
"
"            FOR cr1 IN c1(cr0.potr_plnt,cr0.potr_ord_no,cr0.potr_seq_no)
"
"            LOOP
"
"
"
"                OPEN c_chk_type(cr0.potr_plnt,cr0.potr_ord_no);
"
"                FETCH c_chk_type INTO cr_chk_type;
"
"
"
"
"
"
"
"
"
"                IF (INSTR(cr1.potv_oprn_code,'0') > 1 AND cr_chk_type.prohd_fo_oprn_mr_event = 'C') OR (INSTR(cr1.potv_oprn_code,'0') = 1  AND cr_chk_type.prohd_fo_oprn_mr_event = 'C') THEN
"
"
"
"                /*  OPEN c7 (cr1.potv_plnt,cr1.potv_dept_id,p_date);
"
"                  FETCH c7 INTO cr7;
"
"
"
"                  IF c7%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20475,'SFM' || 'Refer Error Table' ||p_bu||'-'||cr1.potv_plnt||'-'||cr1.potv_dept_id);
"
"                  ELSE
"
"                    v_pos_id     := cr7.pi_user_id;
"
"                  END IF;
"
"
"
"                  CLOSE c7;*/
"
"
"
"                raise_application_error(-20999,'HRM'||'C1 '||' ' ||cr1.prohd_mat_req_type||' ' ||cr1.potv_oprn_flag);
"
"
"
"            IF cr1.prohd_mat_req_type IN ('O') OR (cr1.prohd_mat_req_type IN ('I') AND cr1.potv_oprn_flag NOT IN ('O')) THEN
"
"
"
"                FOR cr2 IN c2(cr1.potv_plnt,cr1.potv_ord_no,cr1.potv_seq_no,cr1.potv_order_qty,cr1.potv_ins_proc,cr1.potv_prod_id,cr1.potv_prod_rev/*,c_pln_ctrl1.planctrl_mat_rqrd_by_user*/,cr1.potv_trans_no)
"
"                LOOP
"
"
"
"                c_comp_cre := 'Y';
"
"
"
"                   IF func_find_prod_lot_size_type(p_bu, cr2.promrd_prod_id, cr2.promrd_prod_rev) = 'S' AND
"
"                      func_find_prod_ser_lot_type(p_bu, cr2.promrd_prod_id, cr2.promrd_prod_rev) = 'L' THEN
"
"
"
"                      OPEN c11(cr2.promrd_prod_id, cr2.promrd_prod_rev);
"
"                      FETCH c11 INTO cr11;
"
"                         IF cr11.prod_lot_size IS NULL OR cr11.prod_lot_size = 0 THEN
"
"                            v_mr_req_qty := cr2.rqrd_qty;
"
"                         ELSIF cr2.rqrd_qty <= cr11.prod_lot_size THEN
"
"                            v_mr_req_qty := cr11.prod_lot_size;
"
"                         ELSIF cr2.rqrd_qty > cr11.prod_lot_size THEN
"
"                            v_qty := CEIL(cr2.rqrd_qty/cr11.prod_lot_size);
"
"                            v_mr_req_qty := (v_qty * cr11.prod_lot_size);
"
"                         END IF;
"
"                      CLOSE c11;
"
"
"
"                   ELSE
"
"
"
"                    SELECT NVL(prod_lot_size,0)
"
"                          INTO v_lot_size
"
"                          FROM products
"
"                         WHERE prod_bu    = p_bu
"
"                           AND prod_id    = cr1.potv_prod_id
"
"                           AND prod_rev   = cr1.potv_prod_rev
"
"                           AND prod_status = 'A';
"
"
"
"                   v_mr_req_qty := cr2.rqrd_qty ;
"
"                   END IF;
"
"
"
"                 INSERT INTO prodn_mat_req_dtls_temp
"
"                                                    (
"
"                                                     pmrdt_bu,
"
"                                                     pmrdt_plnt,
"
"                                                     pmrdt_ord_no,
"
"                                                     pmrdt_oprn_id,
"
"                                                     pmrdt_dept_id,
"
"                                                     pmrdt_mat_type,
"
"                                                     pmrdt_prod_id,
"
"                                                     pmrdt_prod_rev,
"
"                                                     pmrdt_sf_code,
"
"                                                     pmrdt_store_id,
"
"                                                     pmrdt_cons_store_id,
"
"                                                     pmrdt_uom,
"
"                                                     pmrdt_mat_req_uom,
"
"                                                     pmrdt_conv_factor,
"
"                                                     pmrdt_rqrd_date,
"
"                                                     pmrdt_ord_qty,
"
"                                                     pmrdt_rqrd_qty,
"
"                                                     pmrdt_sys_ls_no,
"
"                                                     pmrdt_lot_no,
"
"                                                     pmrdt_ser_no,
"
"                                                     pmrdt_so_pfx,
"
"                                                     pmrdt_so_no,
"
"                                                     pmrdt_so_seq_no,
"
"                                                     pmrdt_so_sub_seq_no,
"
"                                                     pmrdt_so_schld_desc,
"
"                                                     pmrdt_proj_id,
"
"                                                     pmrdt_task_id,
"
"                                                     pmrdt_enter_qty,
"
"                                                     pmrdt_par_prod_id,
"
"                                                     pmrdt_par_prod_rev,
"
"                                                     pmrdt_position,
"
"                                                     pmrdt_user,
"
"                                                     pmrdt_ss_flag
"
"                                                    )
"
"                                                VALUES
"
"                                                    (
"
"                                                     p_bu,
"
"                                                     cr1.potv_plnt,
"
"                                                     cr1.potv_ord_no,
"
"                                                     cr2.pror_oprn_id,
"
"                                                     cr2.pror_proc_id,
"
"                                                     'S',
"
"                                                     cr2.promrd_prod_id,
"
"                                                     cr2.promrd_prod_rev,
"
"                                                     NULL,
"
"                                                     cr2.promrd_store_id,
"
"                                                     cr2.promrd_wip_cons_store_id,
"
"                                                     cr2.promrd_uom,
"
"                                                     cr2.promrd_matreq_uom,
"
"                                                     cr2.promrd_conv_factor,
"
"                                                     p_date,
"
"                                                     cr1.potv_ins_proc,
"
"                                                     v_mr_req_qty,--cr2.rqrd_qty,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     CASE WHEN func_find_prod_indicator_type(p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev) IN('I','C') THEN cr1.potv_so_pfx ELSE NULL END,
"
"                                                     CASE WHEN func_find_prod_indicator_type(p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev) IN('I','C') THEN cr1.potv_so_no ELSE NULL END,
"
"                                                     CASE WHEN func_find_prod_indicator_type(p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev) IN('I','C') THEN cr1.potv_so_seq_no ELSE NULL END,
"
"                                                     CASE WHEN func_find_prod_indicator_type(p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev) IN('I','C') THEN cr1.potv_so_sub_seq_no ELSE NULL END,
"
"                                                     CASE WHEN func_find_prod_indicator_type(p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev) IN('I','C') THEN cr1.potv_so_schld_desc ELSE NULL END,
"
"                                                     cr1.potv_proj_id,
"
"                                                     cr1.potv_task_id,
"
"                                                     cr1.potv_ins_proc,
"
"                                                     cr1.potv_prod_id,
"
"                                                     cr1.potv_prod_rev,
"
"                                                     v_pos_id,
"
"                                                     cr1.potv_user,
"
"                                                     cr2.promrd_subst_item_avbl
"
"                                                    );
"
"
"
"
"
"
"
"                    UPDATE prod_order_mat_req_dtls
"
"                       SET promrd_mr_qty     = promrd_mr_qty + v_mr_req_qty,
"
"                           promrd_upd_by     = p_user,
"
"                           promrd_upd_date   = SYSDATE
"
"                     WHERE promrd_bu     = p_bu
"
"                       AND promrd_plnt       = cr1.potv_plnt
"
"                       AND promrd_ord_no     = cr1.potv_ord_no
"
"                       AND promrd_seq_no     = cr2.pror_seq_no
"
"                       AND promrd_prod_id    = cr2.promrd_prod_id
"
"                       AND promrd_prod_rev   = cr2.promrd_prod_rev;
"
"
"
"
"
"
"
"                         IF SQL%NOTFOUND THEN
"
"                            raise_application_error(-20048,'PLN'||'-'||p_bu||'-'||cr1.potv_plnt||'-'||cr1.potv_ord_no||'-'||cr2.pror_seq_no||'-'||v_mr_req_qty);
"
"                         END IF;
"
"
"
"                    END LOOP;   -- c2 End Loop;
"
"
"
"                END IF;
"
"
"
"                    OPEN c4(cr1.potv_plnt,cr1.potv_ord_no,cr1.potv_oprn_id);
"
"                    FETCH c4 INTO cr4;
"
"                    CLOSE c4;
"
"
"
"                IF cr4.pror_sf_auto_mr = 'Y' THEN
"
"
"
"                    IF INSTR(cr1.potv_oprn_code,'1') > 0 THEN
"
"
"
"                        OPEN c4(cr1.potv_plnt,cr1.potv_ord_no,cr1.potv_oprn_id);
"
"                        FETCH c4 INTO cr4;
"
"
"
"                        IF c4%FOUND THEN
"
"                            v_sf_to_store    := cr4.pror_cons_store;
"
"                        END IF;
"
"
"
"                        CLOSE c4;
"
"
"
"                        FOR cr3 IN c3(cr1.potv_plnt,cr1.potv_ord_no,cr1.potv_oprn_code)
"
"                        LOOP
"
"
"
"                            OPEN c4(cr1.potv_plnt,cr1.potv_ord_no,cr3.pror_oprn_id);
"
"                            FETCH c4 INTO cr4;
"
"
"
"                            IF c4%FOUND THEN
"
"                                v_sf_frm_store    := cr4.pror_rcp_store;
"
"                            END IF;
"
"
"
"                            CLOSE c4;
"
"
"
"                        END LOOP;  --c3 End loop;
"
"
"
"                        IF cr1.prohd_tolr_pct > 0 AND (cr1.potv_ins_proc > cr1.potv_queue_qty) THEN
"
"
"
"                            IF cr1.prohd_tolr_qty >= (cr1.prohd_order_qty * (cr1.prohd_tolr_pct/100)) THEN
"
"                                var_tolr_qty    := 0;
"
"                            ELSE
"
"                                var_tolr_qty    := (cr1.prohd_order_qty * (cr1.prohd_tolr_pct/100)) - cr1.prohd_tolr_qty ;
"
"                            END IF;
"
"
"
"                            IF var_tolr_qty > 0 THEN
"
"
"
"                                IF var_tolr_qty >= (cr1.potv_ins_proc - cr1.potv_queue_qty) THEN
"
"
"
"                                    var_mr_qty    := (cr1.potv_ins_proc - var_tolr_qty);
"
"
"
"                                ELSE
"
"                                    RAISE_APPLICATION_ERROR(-20423,'PLN'||cr1.prohd_ord_no||' '||cr1.potv_ins_proc||' '||cr1.potv_queue_qty||' '||var_tolr_qty);
"
"                                END IF;
"
"
"
"                            END IF;
"
"                        ELSE
"
"                                    var_mr_qty    := cr1.potv_ins_proc;
"
"                        END IF;
"
"
"
"                        --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"                        IF v_sf_to_store <> v_sf_frm_store THEN
"
"
"
"
"
"
"
"                        INSERT INTO prodn_mat_req_dtls_temp
"
"                                                            (
"
"                                                             pmrdt_bu,
"
"                                                             pmrdt_plnt,
"
"                                                             pmrdt_ord_no,
"
"                                                             pmrdt_oprn_id,
"
"                                                             pmrdt_dept_id,
"
"                                                             pmrdt_mat_type,
"
"                                                             pmrdt_prod_id,
"
"                                                             pmrdt_prod_rev,
"
"                                                             pmrdt_sf_code,
"
"                                                             pmrdt_store_id,
"
"                                                             pmrdt_cons_store_id,
"
"                                                             pmrdt_uom,
"
"                                                             pmrdt_mat_req_uom,
"
"                                                             pmrdt_conv_factor,
"
"                                                             pmrdt_rqrd_date,
"
"                                                             pmrdt_ord_qty,
"
"                                                             pmrdt_rqrd_qty,
"
"                                                             pmrdt_sys_ls_no,
"
"                                                             pmrdt_lot_no,
"
"                                                             pmrdt_ser_no,
"
"                                                             pmrdt_so_pfx,
"
"                                                             pmrdt_so_no,
"
"                                                             pmrdt_so_seq_no,
"
"                                                             pmrdt_so_sub_seq_no,
"
"                                                             pmrdt_so_schld_desc,
"
"                                                             pmrdt_proj_id,
"
"                                                             pmrdt_task_id,
"
"                                                             pmrdt_enter_qty,
"
"                                                             pmrdt_par_prod_id,
"
"                                                             pmrdt_par_prod_rev,
"
"                                                             pmrdt_position,
"
"                                                             pmrdt_user
"
"                                                            )
"
"                                                        VALUES
"
"                                                            (
"
"                                                             p_bu,
"
"                                                             cr1.potv_plnt,
"
"                                                             cr1.potv_ord_no,
"
"                                                             cr1.potv_oprn_id,
"
"                                                             cr1.potv_dept_id,
"
"                                                             'F',
"
"                                                             cr1.potv_prod_id,
"
"                                                             cr1.potv_prod_rev,
"
"                                                             cr1.potv_oprn_code,
"
"                                                             v_sf_frm_store,
"
"                                                             v_sf_to_store,
"
"                                                             cr1.prohd_uom,
"
"                                                             cr1.prohd_uom,
"
"                                                             1,
"
"                                                             p_date,
"
"                                                             var_mr_qty,
"
"                                                             var_mr_qty,
"
"                                                             cr1.potv_sys_ls_no,
"
"                                                             cr1.potv_lot_no,
"
"                                                             cr1.potv_ser_no,
"
"                                                             cr1.potv_so_pfx,
"
"                                                             cr1.potv_so_no,
"
"                                                             cr1.potv_so_seq_no,
"
"                                                             cr1.potv_so_sub_seq_no,
"
"                                                             cr1.potv_so_schld_desc,
"
"                                                             cr1.potv_proj_id,
"
"                                                             cr1.potv_task_id,
"
"                                                             cr1.potv_ins_proc,
"
"                                                             NULL,
"
"                                                             NULL,
"
"                                                             v_pos_id,
"
"                                                             cr1.potv_user
"
"                                                            );
"
"                    END IF;
"
"                     END IF;
"
"                 END IF;
"
"
"
"                     v_trans_no := cr1.potv_trans_no;
"
"
"
"
"
"                     proc_upd_oprn_status_qtys
"
"                                                (
"
"                                                 p_bu,
"
"                                                 cr1.potv_plnt,
"
"                                                cr1.potv_loc_id,
"
"                                                 cr1.potv_ord_no,
"
"                                                 cr1.potv_oprn_id,
"
"                                                 cr1.potv_oprn_ln_seq,
"
"                                                 cr1.potv_oprn_code,
"
"                                                 -cr1.potv_ins_proc,
"
"                                                 cr1.potv_ins_proc,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 cr1.potv_sys_ls_no,
"
"                                                 cr1.potv_lot_no,
"
"                                                 cr1.potv_ser_no,
"
"                                                 NULL,
"
"                                                 'PR',
"
"                                                 p_user,
"
"                                                 NULL
"
"                                                );
"
"
"
"                ELSE
"
"                        proc_upd_oprn_status_qtys
"
"                                                (
"
"                                                 p_bu,
"
"                                                 cr1.potv_plnt,
"
"                                                 cr1.potv_loc_id,
"
"                                                 cr1.potv_ord_no,
"
"                                                 cr1.potv_oprn_id,
"
"                                                 cr1.potv_oprn_ln_seq,
"
"                                                 cr1.potv_oprn_code,
"
"                                                 -cr1.potv_ins_proc,
"
"                                                 cr1.potv_ins_proc,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 cr1.potv_sys_ls_no,
"
"                                                 cr1.potv_lot_no,
"
"                                                 cr1.potv_ser_no,
"
"                                                 NULL,
"
"                                                 'PR',
"
"                                                 p_user,
"
"                                                 NULL
"
"                                                );
"
"                END IF;--Operation checking
"
"                CLOSE c_chk_type;
"
"
"
"            END LOOP;
"
"
"
"        END LOOP c0;
"
"
"
"
"
"            FOR cr5 IN c5
"
"            LOOP
"
"
"
"                v_res1        := NULL;
"
"                v_emp_id     := func_find_emp_pos_id (p_bu,v_pos_id);
"
"                    v_user         := func_find_user_id (p_bu,v_emp_id);
"
"
"
"                      proc_get_emp_det (p_bu,
"
"                                        v_user,
"
"                                        v_emp_id,
"
"                                        v_emp_name,
"
"                                        v_pos_id,
"
"                                        v_pos_desc,
"
"                                        v_dept_id,
"
"                                        v_dummy,
"
"                                        1);
"
"
"
"                     v_rqst_no := func_find_icm_next_id (p_bu,p_date,'MR',cr5.pmrdt_store_id,p_user);
"
"
"
"
"
"            BEGIN
"
"            SELECT iic_code
"
"              INTO v_iss_code
"
"              FROM inv_iss_code
"
"             WHERE iic_bu = p_bu
"
"               AND iic_active_flag ='Y'
"
"               AND rownum = 1;
"
"               EXCEPTION
"
"               WHEN NO_DATA_FOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20050,'SFM');
"
"               END;
"
"
"
"
"
"                     INSERT INTO inv_material_request_hd (imrhd_bu,
"
"                                                          imrhd_rqst_no,
"
"                                                          imrhd_rqstto_store_id,
"
"                                                          imrhd_rqst_date,
"
"                                                          imrhd_year,
"
"                                                          imrhd_period,
"
"                                                          imrhd_rqstby_type,
"
"                                                          imrhd_rqstby_id,
"
"                                                          imrhd_status,
"
"                                                          imrhd_reference,
"
"                                                          imrhd_control_person,
"
"                                                          imrhd_reqstr_id,
"
"                                                          imrhd_reqstr_name,
"
"                                                          imrhd_reqstr_pos_id,
"
"                                                          imrhd_reqstr_pos_name,
"
"                                                          imrhd_rqst_dept_id,
"
"                                                          imrhd_appr_flag,
"
"                                                          imrhd_no_of_try,
"
"                                                          imrhd_no_of_issues,
"
"                                                          imrhd_rec_source,
"
"                                                          imrhd_cre_by,
"
"                                                          imrhd_cre_date,
"
"                                                          imrhd_plnt,
"
"                                                          imrhd_source_flag,
"
"                                                          imrhd_ref_unit,
"
"                                                          imrhd_emp_id,
"
"                                                          imrhd_iss_code)
"
"                                                  VALUES (p_bu,
"
"                                                          v_rqst_no,
"
"                                                          cr5.pmrdt_store_id,
"
"                                                          p_date,
"
"                                                          v_year,
"
"                                                          v_period,
"
"                                                          'W',
"
"                                                          cr5.pmrdt_cons_store_id,
"
"                                                          DECODE (func_find_matreq_type (p_bu), 'Y', 'N', 'E'),
"
"                                                          'Material Request For Production Order ',
"
"                                                          v_user,
"
"                                                          v_emp_id,
"
"                                                          v_emp_name,
"
"                                                          v_pos_id,
"
"                                                          v_pos_desc,
"
"                                                          v_dept_id,
"
"                                                          DECODE (func_find_matreq_type (p_bu), 'Y', 'Y', 'N'),
"
"                                                          0,
"
"                                                          0,
"
"                                                          'S',
"
"                                                          p_user,
"
"                                                          SYSDATE,
"
"                                                          cr5.pmrdt_plnt,
"
"                                                          'S',
"
"                                                          cr5.pmrdt_plnt,
"
"                                                          v_emp_id,
"
"                                                          v_iss_code
"
"                                                          );
"
"
"
"
"
"                FOR cr6 IN c6(cr5.pmrdt_plnt,cr5.pmrdt_ord_no,cr5.pmrdt_store_id,cr5.pmrdt_cons_store_id,cr5.pmrdt_position)
"
"                LOOP
"
"
"
"                            UPDATE inv_material_request_ln
"
"                               SET imrln_requested_qty     = imrln_requested_qty + cr6.pmrdt_rqrd_qty,
"
"                                   imrln_to_allocated_qty     = imrln_to_allocated_qty + cr6.pmrdt_rqrd_qty,
"
"                                   imrln_upd_by         = p_user,
"
"                                   imrln_upd_date         = SYSDATE
"
"                             WHERE imrln_bu         = p_bu
"
"                               AND imrln_plnt        = cr5.pmrdt_plnt
"
"                               AND imrln_rqst_no         = v_rqst_no
"
"                               AND imrln_prod_id         = cr6.pmrdt_prod_id
"
"                               AND imrln_prod_rev         = cr6.pmrdt_prod_rev
"
"                               AND (imrln_sys_ls_no         = cr6.pmrdt_sys_ls_no OR cr6.pmrdt_sys_ls_no IS NULL);
"
"
"
"                           IF SQL%NOTFOUND THEN
"
"
"
"                             SELECT NVL(MAX(imrln_seq_no),0) + 1
"
"                               INTO v_seq_no
"
"                               FROM inv_material_request_ln
"
"                              WHERE imrln_bu    = p_bu
"
"                                AND imrln_plnt      = cr5.pmrdt_plnt
"
"                                AND imrln_rqst_no     = v_rqst_no;
"
"
"
"                      IF cr6.pmrdt_sf_code IS NULL THEN
"
"                         v_unit_cost := func_find_unitcost (p_bu,cr6.pmrdt_prod_id,cr6.pmrdt_prod_rev,cr6.pmrdt_store_id);
"
"                      ELSE
"
"
"
"                      OPEN c8(cr6.pmrdt_store_id,cr6.pmrdt_prod_id,cr6.pmrdt_prod_rev,cr6.pmrdt_ord_no,cr6.pmrdt_sf_code,cr6.pmrdt_sys_ls_no);
"
"                      FETCH c8 INTO cr8;
"
"
"
"                      IF c8%FOUND THEN
"
"                        v_unit_cost    := cr8.stsfs_unit_cost;
"
"                      ELSE
"
"                        v_unit_cost    := 0;
"
"                      END IF;
"
"
"
"                      CLOSE c8;
"
"
"
"                      END IF;
"
"
"
"                    IF (func_find_prod_indicator_type (p_bu,cr6.pmrdt_prod_id,cr6.pmrdt_prod_rev) IN ('I','C'))
"
"                     OR INSTR(cr6.pmrdt_sf_code,'1') <> 0
"
"                    THEN
"
"
"
"                            v_so_pfx    := cr6.pmrdt_so_pfx;
"
"                            v_so_no        := cr6.pmrdt_so_no;
"
"                            v_so_seq_no    := cr6.pmrdt_so_seq_no;
"
"                            v_so_sub_seq_no    := cr6.pmrdt_so_sub_seq_no;
"
"                            v_so_schld_desc := cr6.pmrdt_so_schld_desc;
"
"                            v_proj_id    := cr6.pmrdt_proj_id;
"
"                            v_task_id    := cr6.pmrdt_task_id;
"
"
"
"                    ELSE
"
"
"
"                            v_so_pfx    := NULL;
"
"                            v_so_no        := NULL;
"
"                            v_so_seq_no    := NULL;
"
"                            v_so_sub_seq_no    := NULL;
"
"                            v_so_schld_desc := NULL;
"
"                            v_proj_id    := NULL;
"
"                            v_task_id    := NULL;
"
"
"
"                    END IF;
"
"
"
"
"
"                      dbms_output.put_line(cr6.pmrdt_ord_qty||cr6.pmrdt_rqrd_qty);
"
"
"
"
"
"                     BEGIN
"
"                       SELECT prohd_ord_pfx
"
"                         INTO v_prod_ord_pfx
"
"                         FROM prod_order_hd
"
"                        WHERE prohd_bu      = p_bu
"
"                          AND prohd_plnt    = cr6.pmrdt_plnt
"
"                          AND prohd_ord_no  = cr6.pmrdt_ord_no ;
"
"
"
"                         exception when others then
"
"                         v_prod_ord_pfx := NULL;
"
"
"
"
"
"                     END;
"
"
"
"
"
"                      INSERT
"
"                                INTO inv_material_request_ln (imrln_bu,
"
"                                                              imrln_plnt,
"
"                                                              imrln_rqst_no,
"
"                                                              imrln_seq_no,
"
"                                                              imrln_prod_id,
"
"                                                              imrln_prod_rev,
"
"                                                              imrln_prod_cls,
"
"                                                              imrln_unit_cost,
"
"                                                              imrln_requested_qty,
"
"                                                              imrln_ord_qty,
"
"                                                              imrln_uom,
"
"                                                              imrln_prod_uom,
"
"                                                              imrln_conv_factor,
"
"                                                              imrln_mi_allocated_qty,
"
"                                                              imrln_issued_qty,
"
"                                                              imrln_to_allocated_qty,
"
"                                                              imrln_reference,
"
"                                                              imrln_substiute,
"
"                                                              imrln_rqrd_date,
"
"                                                              imrln_rqrd_year,
"
"                                                              imrln_rqrd_period,
"
"                                                              imrln_proj_task_id,
"
"                                                              imrln_status,
"
"                                                              imrln_process_id,
"
"                                                              imrln_work_center,
"
"                                                              imrln_sf_code,
"
"                                                              imrln_mat_type,
"
"                                                              imrln_cre_by,
"
"                                                              imrln_cre_date,
"
"                                                              imrln_ord_type,
"
"                                                              imrln_po_ord_no,
"
"                                                              imrln_ord_no,
"
"                                                              imrln_mi_method,
"
"                                                              imrln_par_prod_id,
"
"                                                              imrln_par_prod_rev,
"
"                                                              imrln_type,
"
"                                                              imrln_so_pfx,
"
"                                                              imrln_so_no,
"
"                                                              imrln_so_seq_no,
"
"                                                              imrln_so_sub_seq_no,
"
"                                                              imrln_so_schld_desc,
"
"                                                              imrln_proj_id,
"
"                                                              imrln_task_id,
"
"                                                              imrln_sys_ls_no,
"
"                                                              imrln_lot_no,
"
"                                                              imrln_ser_no,
"
"                                                              imrln_expiry_date,
"
"                                                              imrln_trans_no,
"
"                                                              imrln_prod_subcls,
"
"                                                              imrln_substit_item_flag,
"
"                                                              imrln_drawing_no,
"
"                                                              imrln_drawing_rev,
"
"                                                              imrln_ord_pfx
"
"                                                              )
"
"                                                          VALUES (
"
"                                                              p_bu,
"
"                                                              cr6.pmrdt_plnt,
"
"                                                              v_rqst_no,
"
"                                                              v_seq_no,
"
"                                                              cr6.pmrdt_prod_id,
"
"                                                              cr6.pmrdt_prod_rev,
"
"                                                              func_find_product_class (p_bu,
"
"                                                                           cr6.pmrdt_plnt,
"
"                                                                           cr6.pmrdt_prod_id,
"
"                                                                           cr6.pmrdt_prod_rev),
"
"                                                              v_unit_cost,
"
"                                                              cr6.pmrdt_rqrd_qty,
"
"                                                              cr6.pmrdt_ord_qty,
"
"                                                              cr6.pmrdt_mat_req_uom,
"
"                                                              cr6.pmrdt_uom,
"
"                                                              cr6.pmrdt_conv_factor,
"
"                                                              0,
"
"                                                              0,
"
"                                                              cr6.pmrdt_rqrd_qty,
"
"                                                              'Material Request For Production Order',
"
"                                                              'N',
"
"                                                              cr6.pmrdt_rqrd_date,
"
"                                                              v_year,
"
"                                                              v_period,
"
"                                                              NULL,
"
"                                                              DECODE (func_find_matreq_type(p_bu),'Y','N','E'),
"
"                                                              cr6.pmrdt_oprn_id,
"
"                                                              cr6.pmrdt_dept_id,
"
"                                                              cr6.pmrdt_sf_code,
"
"                                                              DECODE (cr6.pmrdt_sf_code,NULL,'S','F'),
"
"                                                              p_user,
"
"                                                              SYSDATE,
"
"                                                              'PO',
"
"                                                              DECODE(cr6.pmrdt_sf_code,NULL,DECODE (func_find_prod_cons_method(p_bu,cr6.pmrdt_prod_id,cr6.pmrdt_prod_rev),'P',cr6.pmrdt_ord_no,NULL),cr6.pmrdt_ord_no),
"
"                                                              DECODE(cr6.pmrdt_sf_code,NULL,DECODE (func_find_prod_cons_method(p_bu,cr6.pmrdt_prod_id,cr6.pmrdt_prod_rev),'P',cr6.pmrdt_ord_no,NULL),cr6.pmrdt_ord_no),
"
"                                                              cr6.prodplnt_mi_method,
"
"                                                              cr6.pmrdt_par_prod_id,
"
"                                                              cr6.pmrdt_par_prod_rev,
"
"                                                              DECODE(cr6.pmrdt_so_pfx, NULL, DECODE(cr6.pmrdt_proj_id,NULL,'NA','P'), 'SO'),
"
"                                                              v_so_pfx,
"
"                                                              v_so_no,
"
"                                                              v_so_seq_no,
"
"                                                              v_so_sub_seq_no,
"
"                                                              v_so_schld_desc,
"
"                                                              v_proj_id,
"
"                                                              v_task_id,
"
"                                                              cr6.pmrdt_sys_ls_no,
"
"                                                              cr6.pmrdt_lot_no,
"
"                                                              cr6.pmrdt_ser_no,
"
"                                                              NULL,
"
"                                                              NULL  , --v_trans_no
"
"                                                              func_find_product_subclass(p_bu,cr6.pmrdt_plnt,cr6.pmrdt_prod_id,cr6.pmrdt_prod_rev),
"
"                                                              cr6.pmrdt_ss_flag,
"
"                                                              (SELECT prod_drawing_no FROM products WHERE prod_bu = p_bu AND prod_id = cr6.pmrdt_prod_id AND prod_rev = cr6.pmrdt_prod_rev),
"
"                                                              (SELECT prod_drg_rev FROM products WHERE prod_bu = p_bu AND prod_id = cr6.pmrdt_prod_id AND prod_rev = cr6.pmrdt_prod_rev),
"
"                                                              v_prod_ord_pfx
"
"                                                             );
"
"
"
"                           END IF;
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
"                END LOOP;  --c6 End Loop;
"
"
"
"                    proc_pom_icm_doc_approve (p_bu,
"
"                                              'MR',
"
"                                              p_user,
"
"                                              v_rqst_no,
"
"                                              NULL,
"
"                                              cr5.pmrdt_plnt,
"
"                                              v_mr_res,
"
"                                              v_res,
"
"                                              v_lo_no,
"
"                                              1
"
"                                              );
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
"                OPEN c9;
"
"                FETCH c9 INTO cr9;
"
"                CLOSE c9;
"
"
"
"                     IF cr9.icmctrl_auto_mr_issue_flag = 'Y' THEN
"
"
"
"                          UPDATE inv_material_request_ln
"
"                             SET imrln_sel_flag = 'Y',
"
"                                 imrln_sel_user = p_user,
"
"                                 imrln_upd_by = p_user,
"
"                                 imrln_upd_date = SYSDATE
"
"                           WHERE imrln_bu = p_bu
"
"                             AND imrln_plnt = cr5.pmrdt_plnt
"
"                             AND imrln_rqst_no = v_rqst_no;
"
"
"
"                              proc_alloc_frm_mat_req(p_bu,
"
"                                                     p_date,
"
"                                                     p_user,
"
"                                                     null,
"
"                                                     1,
"
"                                                     var_iss_doc_no,
"
"                                                     v_dc_doc_no,
"
"                                                     v_dc_pack_no
"
"                                                    );
"
"
"
"                          IF var_iss_doc_no IS NOT NULL THEN
"
"
"
"                            OPEN c10(var_iss_doc_no);
"
"                            FETCH c10 INTO cr10;
"
"                              IF c10%FOUND THEN
"
"
"
"                                IF cr10.isthd_issueto_type = 'D' OR func_find_inv_method(p_bu) = 'T' THEN
"
"                                  proc_ins_mat_iss_appl_jrnl(p_bu,
"
"                                                             cr10.isthd_plnt,
"
"                                                             cr10.isthd_doc_no,
"
"                                                             p_user,
"
"                                                             1,
"
"                                                             var_jrnl_res
"
"                                                            );
"
"
"
"                                  IF var_jrnl_res = 'Y' THEN
"
"
"
"                                UPDATE inv_stock_trans_hd
"
"                                   SET isthd_jrnl_flag = 'Y'
"
"                                 WHERE isthd_bu = p_bu
"
"                                   AND isthd_plnt = cr10.isthd_plnt
"
"                                   AND isthd_doc_no = cr10.isthd_doc_no;
"
"
"
"                                  ELSE
"
"                                    Raise_Application_Error(-20009,'GLM ');
"
"                                  END IF;
"
"                                END IF;
"
"
"
"                            proc_issue_mat_frm_mi(p_bu,
"
"                                                  cr10.isthd_plnt,
"
"                                                  cr10.isthd_doc_no,
"
"                                                  p_user,
"
"                                                  null,
"
"                                                  1,
"
"                                                  var_dc_no,
"
"                                                  var_pack_dc_no
"
"                                                 );
"
"
"
"                            proc_ins_gl_jrnl(p_bu,
"
"                                             cr10.isthd_plnt,
"
"                                             cr10.isthd_trans_date,
"
"                                             cr10.isthd_year,
"
"                                             cr10.isthd_period,
"
"                                             NULL,
"
"                                             cr10.isthd_doc_no,
"
"                                             NULL,
"
"                                             'ICM',
"
"                                             p_user,
"
"                                             1,
"
"                                             'Material Issuance'
"
"                                            );
"
"
"
"                          END IF;
"
"
"
"                        CLOSE c10;
"
"
"
"                          END IF;
"
"
"
"                    END IF;
"
"
"
"            v_rqst_no1 := v_rqst_no1||v_rqst_no||' ';
"
"
"
"            END LOOP; --c5 loop
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||' ' ||v_rqst_no1||' ' ||c_comp_cre);
"
"
"
"            IF v_res1 IS NULL THEN
"
"
"
"                    IF v_rqst_no1 IS NOT NULL THEN
"
"                      p_res := TRIM (func_find_order_no_substr (v_rqst_no1));
"
"                    END IF;
"
"
"
"            END IF;
"
"
"
"            IF c_comp_cre = 'Y' THEN
"
"                p_queue := NULL;
"
"            ELSIF c_comp_cre = 'N' THEN
"
"                p_queue := 'Y';
"
"            END IF;
"
"
"
"            FOR cr0 IN c0
"
"            LOOP
"
"            FOR cr1 IN c1(cr0.potr_plnt,cr0.potr_ord_no,cr0.potr_seq_no)
"
"            LOOP
"
"
"
"              UPDATE prod_ord_oper_status
"
"                 SET pros_ins_proc = 0,
"
"                     pros_enter_qty = 0,
"
"                     pros_enter_wt_qty = 0 ,
"
"                     pros_sel_flag     = 'N',
"
"                     pros_out_proc  = 0,
"
"                     pros_mat_rqst_qty = pros_mat_rqst_qty + case when func_find_prod_ord_matreq_type(p_bu,cr1.potv_plnt,cr1.potv_ord_no,cr1.potv_prod_id,cr1.potv_prod_rev) = 'O' THEN cr1.potv_ins_proc ELSE 0 END,
"
"                     pros_upd_by    = p_user,
"
"                     pros_upd_date     = SYSDATE
"
"               WHERE pros_bu     = p_bu
"
"                 AND pros_plnt     = cr1.potv_plnt
"
"                 AND pros_ord_no     = cr1.potv_ord_no
"
"                 AND pros_oprn_id     = cr1.potv_oprn_id
"
"                 AND pros_seq_no    = cr1.potv_seq_no
"
"                 AND pros_sf_code     = cr1.potv_oprn_code
"
"                 AND pros_type    = 'PR';
"
"
"
"
"
"              UPDATE prod_ord_trans_record
"
"                 SET potr_ins_proc = 0,
"
"                     potr_enter_qty = 0,
"
"                     potr_enter_wt_qty = 0,
"
"                     potr_out_proc    = 0,
"
"                     potr_sel_flag     = 'N',
"
"                     potr_mat_rqst_qty = potr_mat_rqst_qty + CASE WHEN func_find_prod_ord_matreq_type(p_bu,cr1.potv_plnt,cr1.potv_ord_no,cr1.potv_prod_id,cr1.potv_prod_rev) = 'O' THEN cr1.potv_ins_proc ELSE 0 END,
"
"                     potr_upd_by     = p_user,
"
"                     potr_upd_date     = SYSDATE
"
"               WHERE potr_bu     = p_bu
"
"                 AND potr_plnt     = cr1.potv_plnt
"
"                 AND potr_ord_no     = cr1.potv_ord_no
"
"                 AND potr_oprn_id     = cr1.potv_oprn_id
"
"                 AND potr_seq_no     = cr1.potv_seq_no
"
"                 AND potr_sf_code     = cr1.potv_oprn_code
"
"                 AND potr_type    = 'PR';
"
"
"
"            END LOOP c1;
"
"            END LOOP c0;
"
"
"
"    END proc_cre_mr_frm_prod_comp;
"
"
"
"
"
"    PROCEDURE proc_upd_ins_proc_qty(
"
"                                    p_bu            VARCHAR2,
"
"                                    p_plnt            VARCHAR2,
"
"                                    p_ord_no        VARCHAR2,
"
"                                    p_seq_no        NUMBER,
"
"                                    p_oprn_id        VARCHAR2,
"
"                                    p_oprn_no        NUMBER,
"
"                                    p_sf_code        VARCHAR2,
"
"                                    p_out_proc        NUMBER,
"
"                                    p_ins_proc        NUMBER,
"
"                                    p_comp_qty        NUMBER,
"
"                                    p_sel_flag        VARCHAR2,
"
"                                    p_lot_no        VARCHAR2,
"
"                                    p_ser_no         VARCHAR2,
"
"                                    p_user            VARCHAR2
"
"                                    )
"
"    IS
"
"    CURSOR c1(c_oprn_id VARCHAR2)
"
"      IS
"
"    SELECT pror_oprn_id,pror_unit_weight,prohd_sf_cons
"
"      FROM prod_order_hd,prod_order_routing
"
"     WHERE prohd_bu = pror_bu
"
"       AND prohd_plnt = pror_plnt
"
"       AND prohd_ord_no = pror_ord_no
"
"       AND pror_bu = p_bu
"
"       AND pror_plnt = p_plnt
"
"       AND pror_ord_no = p_ord_no
"
"       AND pror_oprn_id = c_oprn_id;
"
"
"
"
"
"    cr1        c1%ROWTYPE;
"
"
"
"    v_enter_qty     NUMBER(12,3);
"
"    v_oprn_id    VARCHAR2(10);
"
"    v_out_proc        NUMBER(12,3);
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
"
"
"    IF p_sel_flag    = 'Y' THEN
"
"
"
"       UPDATE prod_ord_oper_status
"
"          SET pros_ins_proc = p_ins_proc,
"
"              pros_sel_flag = 'Y',
"
"              pros_upd_by = p_user,
"
"              pros_upd_date = SYSDATE,
"
"              pros_user = p_user
"
"        WHERE pros_bu = p_bu
"
"          AND pros_plnt = p_plnt
"
"          AND pros_ord_no = p_ord_no
"
"          AND pros_oprn_id = p_oprn_id
"
"          AND pros_oprn_no = p_oprn_no
"
"          AND pros_sf_code = p_sf_code
"
"          AND (pros_lot_no = p_lot_no OR p_lot_no IS NULL)
"
"          AND (pros_ser_no = p_ser_no OR p_ser_no IS NULL)
"
"          AND pros_type    = 'PR';
"
"
"
"        UPDATE prod_ord_trans_record
"
"           SET potr_ins_proc = p_ins_proc,
"
"               potr_sel_flag = 'Y',
"
"               potr_upd_by = p_user,
"
"               potr_upd_date = SYSDATE,
"
"               potr_user = p_user
"
"         WHERE potr_bu = p_bu
"
"           AND potr_plnt = p_plnt
"
"           AND potr_ord_no = p_ord_no
"
"           AND potr_seq_no = p_seq_no
"
"           AND potr_oprn_id = p_oprn_id
"
"           AND potr_oprn_no = p_oprn_no
"
"           AND potr_sf_code = p_sf_code
"
"           AND (potr_lot_no = p_lot_no OR p_lot_no IS NULL)
"
"           AND (potr_ser_no = p_ser_no OR p_ser_no IS NULL)
"
"           AND potr_type    = 'PR';
"
"
"
"
"
"    ELSE
"
"
"
"
"
"
"
"       UPDATE prod_ord_oper_status
"
"          SET pros_ins_proc = 0,
"
"              pros_sel_flag = 'N',
"
"              pros_upd_by = p_user,
"
"              pros_upd_date = SYSDATE,
"
"              pros_user = p_user
"
"        WHERE pros_bu = p_bu
"
"          AND pros_plnt = p_plnt
"
"          AND pros_ord_no = p_ord_no
"
"          AND pros_oprn_id = p_oprn_id
"
"          AND pros_oprn_no = p_oprn_no
"
"          AND pros_sf_code = p_sf_code
"
"          AND (pros_lot_no = p_lot_no OR p_lot_no IS NULL)
"
"          AND (pros_ser_no = p_ser_no OR p_ser_no IS NULL)
"
"          AND pros_type    = 'PR';
"
"
"
"        UPDATE prod_ord_trans_record
"
"           SET potr_ins_proc = 0,
"
"               potr_sel_flag = 'N',
"
"               potr_upd_by = p_user,
"
"               potr_upd_date = SYSDATE,
"
"               potr_user = p_user
"
"         WHERE potr_bu = p_bu
"
"           AND potr_plnt = p_plnt
"
"           AND potr_ord_no = p_ord_no
"
"           AND potr_seq_no = p_seq_no
"
"           AND potr_oprn_id = p_oprn_id
"
"           AND potr_oprn_no = p_oprn_no
"
"           AND potr_sf_code = p_sf_code
"
"           AND (potr_lot_no = p_lot_no OR p_lot_no IS NULL)
"
"           AND (potr_ser_no = p_ser_no OR p_ser_no IS NULL)
"
"           AND potr_type    = 'PR';
"
"
"
"    END IF;
"
"
"
"    END proc_upd_ins_proc_qty;
"
"
"
"    PROCEDURE proc_cre_mr_eqm_ser_nos(
"
"                                      p_bu                VARCHAR2,
"
"                                      p_plnt            VARCHAR2,
"
"                                      p_date            DATE,
"
"                                      p_prod_ord_no        VARCHAR2,
"
"                                      p_process_id        VARCHAR2,
"
"                                      p_prod_id            VARCHAR2,
"
"                                      p_prod_rev        NUMBER,
"
"                                      p_sf_code            VARCHAR2,
"
"                                      p_ser_no            VARCHAR2,
"
"                                      p_sys_ls_no        NUMBER,
"
"                                      p_comp_qty        NUMBER,
"
"                                      p_so_pfx            VARCHAR2,
"
"                                      p_so_no            VARCHAR2,
"
"                                      p_so_seq_no        NUMBER,
"
"                                      p_so_sub_seq_no    NUMBER,
"
"                                      p_so_schld_desc    VARCHAR2,
"
"                                      p_user            VARCHAR2,
"
"                                      p_lang            NUMBER,
"
"                                      p_mr_no        OUT    VARCHAR2,
"
"                                      p_comp_res    OUT    VARCHAR2,
"
"                                      p_lot_no         VARCHAR2     DEFAULT NULL,
"
"                                      p_process_ln_seq    NUMBER DEFAULT NULL,
"
"                                      p_loc_id          VARCHAR2 DEFAULT  NULL
"
"                                      )
"
"    IS
"
"    CURSOR c1
"
"      IS
"
"      SELECT promrd_store_id,promrd_wip_cons_store_id
"
"        FROM(
"
"      SELECT promrd_seq_no,promrd_item_seq_no,promrd_prod_id,
"
"             promrd_prod_rev,promrd_wip_cons_store_id,
"
"             promrd_store_id,promrd_rqrd_qty,promrd_uom,promrd_prod_uom,
"
"             promrd_conv_factor
"
"        FROM
"
"      (SELECT promrd_seq_no,promrd_item_seq_no,
"
"           promrd_prod_id,promrd_prod_rev,promrd_wip_cons_store_id,
"
"           promrd_store_id,promrd_rqrd_qty/prohd_order_qty * p_comp_qty promrd_rqrd_qty,
"
"           promrd_uom,promrd_prod_uom,promrd_conv_factor
"
"                 FROM prod_order_hd,
"
"           prod_order_routing,
"
"           prod_order_mat_req_dtls
"
"     WHERE prohd_bu = pror_bu
"
"       AND prohd_plnt = pror_plnt
"
"       AND prohd_ord_no  = pror_ord_no
"
"       AND pror_bu = promrd_bu
"
"       AND pror_plnt = promrd_plnt
"
"       AND pror_ord_no = promrd_ord_no
"
"       AND pror_seq_no = promrd_seq_no
"
"       AND promrd_store_id <> promrd_wip_cons_store_id
"
"       AND promrd_mat_req = 'Y'
"
"       AND pror_bu = p_bu
"
"       AND Pror_plnt = p_plnt
"
"       AND pror_ord_no = p_prod_ord_no
"
"       AND pror_oprn_id = p_process_id
"
"       AND prohd_fo_oprn_mr_event = 'C'
"
"       ORDER by promrd_item_seq_no))
"
"    GROUP BY promrd_store_id,promrd_wip_cons_store_id;
"
"
"
"    CURSOR c2(c_store_id VARCHAR2, c_wip_store_id VARCHAR2)
"
"      IS
"
"    SELECT pror_oprn_id,pror_proc_id,prohd_prod_id,prohd_prod_rev,promrd_seq_no,promrd_item_seq_no,
"
"           promrd_prod_id,promrd_prod_rev,promrd_wip_cons_store_id,
"
"           promrd_store_id,promrd_rqrd_qty,promrd_uom,promrd_prod_uom,promrd_conv_factor,
"
"           prodplnt_mi_method,promrd_rqrd_date,promrd_subst_item_avbl
"
"      FROM(SELECT pror_oprn_id,pror_proc_id,prohd_prod_id,prohd_prod_rev,promrd_seq_no,promrd_item_seq_no,
"
"           promrd_prod_id,promrd_prod_rev,promrd_wip_cons_store_id,
"
"           promrd_store_id,promrd_rqrd_qty/prohd_order_qty * p_comp_qty promrd_rqrd_qty,
"
"           promrd_uom,promrd_prod_uom,promrd_conv_factor,
"
"           prodplnt_mi_method,promrd_rqrd_date,
"
"           promrd_subst_item_avbl
"
"      FROM prod_order_hd,
"
"           prod_order_routing,
"
"           prod_order_mat_req_dtls,
"
"           prod_plants
"
"     WHERE prohd_bu = pror_bu
"
"       AND prohd_plnt = pror_plnt
"
"       AND prohd_ord_no  = pror_ord_no
"
"       AND pror_bu = promrd_bu
"
"       AND pror_plnt = promrd_plnt
"
"       AND pror_ord_no = promrd_ord_no
"
"       AND pror_seq_no = promrd_seq_no
"
"       AND promrd_bu = prodplnt_bu
"
"       AND promrd_plnt = prodplnt_plnt
"
"       AND promrd_prod_id = prodplnt_prod_id
"
"       AND promrd_prod_rev = prodplnt_prod_rev
"
"       AND prohd_bu = p_bu
"
"       AND Prohd_plnt = p_plnt
"
"       AND prohd_ord_no = p_prod_ord_no
"
"       AND promrd_mat_req = 'Y'
"
"       AND pror_bu = p_bu
"
"       AND Pror_plnt = p_plnt
"
"       AND pror_ord_no = p_prod_ord_no
"
"       AND pror_oprn_id = p_process_id
"
"       AND promrd_store_id = c_store_id
"
"       AND promrd_wip_cons_store_id = c_wip_store_id
"
"    ORDER BY promrd_item_seq_no);
"
"
"
"    CURSOR  c3
"
"      IS
"
"    SELECT pror_seq_no,pror_oprn_id,pror_proc_id,pror_cons_store,pror_oprn_ln_seq
"
"      FROM prod_order_routing
"
"     WHERE pror_bu = p_bu
"
"       AND pror_plnt = p_plnt
"
"       AND pror_ord_no = p_prod_ord_no
"
"       AND pror_oprn_id = p_process_id;
"
"
"
"    CURSOR c4
"
"      IS
"
"    SELECT pror_seq_no,pror_oprn_id,pror_proc_id,pror_rcp_store
"
"      FROM prod_order_routing
"
"     WHERE pror_bu = p_bu
"
"       AND pror_plnt = p_plnt
"
"       AND pror_ord_no = p_prod_ord_no
"
"       AND pror_seq_no < (SELECT pror_seq_no
"
"                    FROM prod_order_routing
"
"                       WHERE pror_bu = p_bu
"
"                         AND pror_plnt = p_plnt
"
"                         AND pror_ord_no = p_prod_ord_no
"
"                         AND pror_oprn_id = p_process_id)
"
"     ORDER BY pror_seq_no DESC;
"
"
"
"
"
"     CURSOR c5
"
"       IS
"
"     SELECT prodplnt_mi_method
"
"       FROM prod_plants
"
"      WHERE prodplnt_bu = p_bu
"
"        AND prodplnt_plnt = p_plnt
"
"        AND Prodplnt_prod_id = p_prod_id
"
"        AND prodplnt_prod_rev = p_prod_rev;
"
"
"
"
"
"     CURSOR c6
"
"        IS
"
"      SELECT potv_oprn_seq_no,potv_ord_no,
"
"             potv_plnt,
"
"             potv_prod_id,
"
"             potv_prod_rev,
"
"             potv_oprn_code,
"
"             potv_oprn_id,
"
"             potv_ser_no,
"
"             potv_sys_ls_no,
"
"             potv_trans_no,
"
"             potv_enter_qty,
"
"             potv_oprn_ln_seq
"
"        FROM prod_ord_trans_view
"
"       WHERE potv_bu = p_bu
"
"         AND potv_sel_flag = 'Y'
"
"         AND potv_user = p_user
"
"         AND potv_plnt = p_plnt
"
"         AND potv_ord_no = p_prod_ord_no
"
"         AND potv_prod_id = p_prod_id
"
"         AND potv_prod_rev =p_prod_rev
"
"         AND potv_oprn_code = p_sf_code
"
"         AND potV_oprn_id = p_process_id
"
"         AND potv_ser_no NOT LIKE 'DS%'
"
"        GROUP BY potv_oprn_seq_no,potv_ord_no,potv_plnt,potv_prod_id,potv_prod_rev,
"
"              potv_ser_no,potv_sys_ls_no,
"
"             potv_oprn_code,potv_oprn_id,potv_enter_qty,potv_trans_no
"
"    ORDER BY potv_ord_no,potv_oprn_id;
"
"
"
"
"
"
"
"    CURSOR c9
"
"    IS
"
"    SELECT icmctrl_auto_mr_issue_flag
"
"      FROM icm_control
"
"     WHERE icmctrl_bu = p_bu;
"
"
"
"    CURSOR c10(c_doc_no VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM inv_stock_trans_hd
"
"     WHERE isthd_bu     = p_bu
"
"       AND isthd_doc_no     = c_doc_no;
"
"
"
"
"
"    CURSOR c_chk_type
"
"    IS
"
"    SELECT prohd_fo_oprn_mr_event,
"
"           prohd_ro_oprn_mr_event
"
"      FROM prod_order_hd
"
"     WHERE prohd_bu = p_bu
"
"       AND prohd_plnt = p_plnt
"
"       AND prohd_ord_no = p_prod_ord_no;
"
"
"
"
"
"
"
"
"
"    v_comp_cre_flag VARCHAR2(1):= 'N';
"
"    v_emp_id        VARCHAR2(15);
"
"    v_emp_name        VARCHAR2(200);
"
"    v_pos_id        VARCHAR2(15);
"
"    v_pos_desc         VARCHAR2(200);
"
"    v_dept_id        VARCHAR2(10);
"
"    v_dummy            VARCHAR2(1000);
"
"    v_rqst_no        VARCHAR2(15);
"
"    v_seq_no        NUMBER;
"
"    v_unit_cost        NUMBER(17,5);
"
"    v_so_pfx        VARCHAR2(5);
"
"    v_so_no            VARCHAR2(15);
"
"    v_so_seq_no        NUMBER(5);
"
"    v_so_sub_seq_no        NUMBER(5);
"
"    v_so_schld_desc        VARCHAR2(200);
"
"    v_first            NUMBER            := 1;
"
"    v_start_no        VARCHAR2(15);
"
"    v_end_no        VARCHAR2(15);
"
"    v_mr_res        VARCHAR2(4000);
"
"    var_iss_doc_no        VARCHAR2(4000);
"
"    var_jrnl_res        VARCHAR2(4000);
"
"    v_dc_doc_no        VARCHAR2(4000);
"
"    v_dc_pack_no        VARCHAR2(4000);
"
"    var_pack_dc_no        VARCHAR2(4000);
"
"    var_dc_no        VARCHAR2(4000);
"
"    v_res            VARCHAR2(4000);
"
"    v_lo_no                 VARCHAR2(100);
"
"    v_pm_seq_no        NUMBER;
"
"    v_rqrd_date        DATE;
"
"    v_queue_qty        NUMBER(12,3);
"
"    cr3            c3%ROWTYPE;
"
"    cr4            c4%ROWTYPE;
"
"    cr5            c5%ROWTYPE;
"
"    cr9            c9%ROWTYPE;
"
"    cr10            c10%ROWTYPE;
"
"    cr_chk_type        c_chk_type%ROWTYPE;
"
"    v_iss_code       VARCHAR2(10);
"
"
"
"
"
"    BEGIN
"
"
"
"
"
"        OPEN c_chk_type;
"
"        FETCH c_chk_type INTO cr_chk_type;
"
"
"
"        IF (INSTR(p_sf_code,'0') > 1 AND cr_chk_type.prohd_fo_oprn_mr_event = 'C') OR (INSTR(p_sf_code,'0') = 1  AND cr_chk_type.prohd_fo_oprn_mr_event = 'C') THEN
"
"
"
"
"
"        FOR cr1 IN c1
"
"        LOOP
"
"
"
"
"
"             proc_get_emp_det (p_bu,
"
"                       p_user,
"
"                       v_emp_id,
"
"                       v_emp_name,
"
"                       v_pos_id,
"
"                       v_pos_desc,
"
"                       v_dept_id,
"
"                       v_dummy,
"
"                       p_lang
"
"                       );
"
"
"
"                     v_rqst_no := func_find_icm_next_id (p_bu,p_date,'MR',cr1.promrd_store_id,p_user);
"
"
"
"                     IF v_first = 1 THEN
"
"                        v_start_no := v_rqst_no;
"
"                     END IF;
"
"
"
"                     v_first := v_first + 1;
"
"
"
"                     v_end_no := v_rqst_no;
"
"
"
"
"
"                     SELECT NVL(MAX(pmcl_seq_no),0) + 1
"
"                       INTO v_pm_seq_no
"
"                       FROM pend_mr_creation_list
"
"                      WHERE pmcl_bu = p_bu
"
"                        AND pmcl_user = p_user;
"
"
"
"                     INSERT INTO pend_mr_creation_list(
"
"                                pmcl_bu        ,
"
"                                pmcl_plnt      ,
"
"                                pmcl_user      ,
"
"                                pmcl_seq_no    ,
"
"                                pmcl_mr_no     ,
"
"                                pmcl_cre_by    ,
"
"                                pmcl_cre_date  ,
"
"                                pmcl_upd_by    ,
"
"                                pmcl_upd_date
"
"                                                      )
"
"                                                VALUES(
"
"                                p_bu        ,
"
"                                p_plnt     ,
"
"                                p_user      ,
"
"                                v_pm_seq_no    ,
"
"                                v_rqst_no     ,
"
"                                p_user    ,
"
"                                SYSDATE  ,
"
"                                NULL    ,
"
"                                NULL
"
"                                                      );
"
"            BEGIN
"
"            SELECT iic_code
"
"              INTO v_iss_code
"
"              FROM inv_iss_code
"
"             WHERE iic_bu = p_bu
"
"               AND iic_active_flag ='Y'
"
"               AND rownum = 1;
"
"               EXCEPTION
"
"               WHEN NO_DATA_FOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20050,'SFM');
"
"               END;
"
"
"
"                     INSERT INTO inv_material_request_hd (imrhd_bu,
"
"                                                          imrhd_rqst_no,
"
"                                                          imrhd_rqstto_store_id,
"
"                                                          imrhd_rqst_date,
"
"                                                          imrhd_year,
"
"                                                          imrhd_period,
"
"                                                          imrhd_rqstby_type,
"
"                                                          imrhd_rqstby_id,
"
"                                                          imrhd_status,
"
"                                                          imrhd_reference,
"
"                                                          imrhd_control_person,
"
"                                                          imrhd_reqstr_id,
"
"                                                          imrhd_reqstr_name,
"
"                                                          imrhd_reqstr_pos_id,
"
"                                                          imrhd_reqstr_pos_name,
"
"                                                          imrhd_rqst_dept_id,
"
"                                                          imrhd_appr_flag,
"
"                                                          imrhd_no_of_try,
"
"                                                          imrhd_no_of_issues,
"
"                                                          imrhd_rec_source,
"
"                                                          imrhd_cre_by,
"
"                                                          imrhd_cre_date,
"
"                                                          imrhd_plnt,
"
"                                                          imrhd_source_flag,
"
"                                                          imrhd_ref_unit,
"
"                                                          imrhd_emp_id,
"
"                                                          imrhd_iss_code)
"
"                                  VALUES (p_bu,
"
"                                      v_rqst_no,
"
"                                      cr1.promrd_store_id,
"
"                                      p_date,
"
"                                      func_find_year(p_bu,p_date),
"
"                                      func_find_period(p_bu,p_date),
"
"                                      'W',
"
"                                      cr1.promrd_wip_cons_store_id,
"
"                                      DECODE (func_find_matreq_type (p_bu), 'Y', 'N', 'E'),
"
"                                      'Material Request For Production Order ',
"
"                                      p_user,
"
"                                      v_emp_id,
"
"                                      v_emp_name,
"
"                                      v_pos_id,
"
"                                      v_pos_desc,
"
"                                      v_dept_id,
"
"                                      DECODE (func_find_matreq_type (p_bu), 'Y', 'Y', 'N'),
"
"                                      0,
"
"                                      0,
"
"                                      'S',
"
"                                      p_user,
"
"                                      SYSDATE,
"
"                                      p_plnt,
"
"                                      'S',
"
"                                      p_plnt,
"
"                                      v_emp_id,
"
"                                      v_iss_code     );
"
"
"
"
"
"                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||' ' ||p_process_id||' ' ||cr1.promrd_store_id||' ' ||cr1.promrd_wip_cons_store_id);
"
"
"
"                    FOR cr2 IN c2(cr1.promrd_store_id,cr1.promrd_wip_cons_store_id)
"
"                    --,cr0.ptp_oprn_id)
"
"                    LOOP
"
"
"
"                    DBMS_OUTPUT.PUT_LINE('Process '||' ' ||cr2.pror_oprn_id||' ' ||cr2.promrd_prod_id);
"
"
"
"                        UPDATE inv_material_request_ln
"
"                           SET imrln_requested_qty     = imrln_requested_qty + cr2.promrd_rqrd_qty,
"
"                               imrln_to_allocated_qty     = imrln_to_allocated_qty + cr2.promrd_rqrd_qty,
"
"                               imrln_upd_by         = p_user,
"
"                               imrln_upd_date         = SYSDATE
"
"                         WHERE imrln_bu         = p_bu
"
"                           AND imrln_plnt        = p_plnt
"
"                           AND imrln_rqst_no         = v_rqst_no
"
"                           AND imrln_prod_id         = cr2.promrd_prod_id
"
"                           AND imrln_prod_rev         = cr2.promrd_prod_rev
"
"                           AND imrln_process_id        = cr2.pror_oprn_id;
"
"
"
"                               IF SQL%NOTFOUND
"
"                               THEN
"
"
"
"                                 SELECT NVL(MAX(imrln_seq_no),0) + 1
"
"                                   INTO v_seq_no
"
"                                   FROM inv_material_request_ln
"
"                                  WHERE imrln_bu    = p_bu
"
"                                    AND imrln_plnt      = p_plnt
"
"                                    AND imrln_rqst_no     = v_rqst_no;
"
"
"
"
"
"                                    v_unit_cost := func_find_unitcost (p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev,cr2.promrd_store_id);
"
"
"
"
"
"                                    IF func_find_prod_indicator_type (p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev) IN ('I','C') THEN
"
"
"
"
"
"                                            v_so_pfx    := p_so_pfx;
"
"                                            v_so_no        := p_so_no;
"
"                                            v_so_seq_no    := p_so_seq_no;
"
"                                            v_so_sub_seq_no    := p_so_sub_seq_no;
"
"                                            v_so_schld_desc := p_so_schld_desc;
"
"
"
"                                    ELSE
"
"
"
"                                            v_so_pfx    := NULL;
"
"                                            v_so_no        := NULL;
"
"                                            v_so_seq_no    := NULL;
"
"                                            v_so_sub_seq_no    := NULL;
"
"                                            v_so_schld_desc := NULL;
"
"
"
"
"
"                                    END IF;
"
"
"
"                                    v_rqrd_date := CASE WHEN cr2.promrd_rqrd_date < TRUNC(SYSDATE)  THEN TRUNC(SYSDATE) ELSE cr2.promrd_rqrd_date END;
"
"
"
"
"
"                                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||' ' ||p_prod_ord_no);
"
"
"
"                                      INSERT INTO inv_material_request_ln (imrln_bu,
"
"                                                      imrln_plnt,
"
"                                                      imrln_rqst_no,
"
"                                                      imrln_seq_no,
"
"                                                      imrln_prod_id,
"
"                                                      imrln_prod_rev,
"
"                                                      imrln_prod_cls,
"
"                                                      imrln_unit_cost,
"
"                                                      imrln_requested_qty,
"
"                                                      imrln_ord_qty,
"
"                                                      imrln_uom,
"
"                                                      imrln_prod_uom,
"
"                                                      imrln_conv_factor,
"
"                                                      imrln_mi_allocated_qty,
"
"                                                      imrln_issued_qty,
"
"                                                      imrln_to_allocated_qty,
"
"                                                      imrln_reference,
"
"                                                      imrln_substiute,
"
"                                                      imrln_rqrd_date,
"
"                                                      imrln_rqrd_year,
"
"                                                      imrln_rqrd_period,
"
"                                                      imrln_proj_task_id,
"
"                                                      imrln_status,
"
"                                                      imrln_process_id,
"
"                                                      imrln_work_center,
"
"                                                      imrln_sf_code,
"
"                                                      imrln_mat_type,
"
"                                                      imrln_cre_by,
"
"                                                      imrln_cre_date,
"
"                                                      imrln_ord_type,
"
"                                                      imrln_po_ord_no,
"
"                                                      imrln_ord_no,
"
"                                                      imrln_mi_method,
"
"                                                      imrln_par_prod_id,
"
"                                                      imrln_par_prod_rev,
"
"                                                      imrln_type,
"
"                                                      imrln_so_pfx,
"
"                                                      imrln_so_no,
"
"                                                      imrln_so_seq_no,
"
"                                                      imrln_so_sub_seq_no,
"
"                                                      imrln_so_schld_desc,
"
"                                                      imrln_proj_id,
"
"                                                      imrln_task_id,
"
"                                                      imrln_sys_ls_no,
"
"                                                      imrln_lot_no,
"
"                                                      imrln_ser_no,
"
"                                                      imrln_expiry_date,
"
"                                                      imrln_trans_no,
"
"                                                      imrln_prod_subcls,
"
"                                                      imrln_substit_item_flag
"
"                                                      )
"
"                                                  VALUES (
"
"                                                      p_bu,
"
"                                                      p_plnt,
"
"                                                      v_rqst_no,
"
"                                                      v_seq_no,
"
"                                                      cr2.promrd_prod_id,
"
"                                                      cr2.promrd_prod_rev,
"
"                                                      func_find_product_class (p_bu,
"
"                                                                   p_plnt,
"
"                                                                   cr2.promrd_prod_id,
"
"                                                                   cr2.promrd_prod_rev),
"
"                                                      v_unit_cost,
"
"                                                      cr2.promrd_rqrd_qty,
"
"                                                      p_comp_qty,
"
"                                                      cr2.promrd_uom,
"
"                                                      cr2.promrd_prod_uom,
"
"                                                      cr2.promrd_conv_factor,
"
"                                                      0,
"
"                                                      0,
"
"                                                      cr2.promrd_rqrd_qty,
"
"                                                      'Material Request For Production Order',
"
"                                                      'N',
"
"                                                      v_rqrd_date,
"
"                                                      func_find_year(p_bu,v_rqrd_date),
"
"                                                      func_find_period(p_bu,v_rqrd_date),
"
"                                                      NULL,
"
"                                                      DECODE (func_find_matreq_type(p_bu),'Y','N','E'),
"
"                                                      cr2.pror_oprn_id,
"
"                                                      cr2.pror_proc_id,
"
"                                                      NULL,
"
"                                                      'S',
"
"                                                      p_user,
"
"                                                      SYSDATE,
"
"                                                      'PO',
"
"                                                      p_prod_ord_no, --DECODE (func_find_prod_cons_method(p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev),'P',p_prod_ord_no,NULL),
"
"                                                      p_prod_ord_no, --DECODE (func_find_prod_cons_method(p_bu,cr2.promrd_prod_id,cr2.promrd_prod_rev),'P',p_prod_ord_no,NULL),
"
"                                                      cr2.prodplnt_mi_method,
"
"                                                      cr2.prohd_prod_id,
"
"                                                      cr2.prohd_prod_rev,
"
"                                                      DECODE(p_so_pfx, NULL, 'NA', 'SO'),
"
"                                                      v_so_pfx,
"
"                                                      v_so_no,
"
"                                                      v_so_seq_no,
"
"                                                      v_so_sub_seq_no,
"
"                                                      v_so_schld_desc,
"
"                                                      NULL,
"
"                                                      NULL,
"
"                                                      NULL,
"
"                                                      NULL,
"
"                                                      NULL,
"
"                                                      NULL,
"
"                                                      NULL ,--v_trans_no
"
"                                                      func_find_product_subclass(p_bu,p_plnt,cr2.promrd_prod_id,cr2.promrd_prod_rev),
"
"                                                      cr2.promrd_subst_item_avbl
"
"                                                     );
"
"
"
"                                       END IF;
"
"
"
"
"
"
"
"                    END LOOP;
"
"
"
"
"
"                    proc_pom_icm_doc_approve (p_bu,
"
"                                              'MR',
"
"                                              p_user,
"
"                                              v_rqst_no,
"
"                                              NULL,
"
"                                             p_plnt,
"
"                                              v_mr_res,
"
"                                              v_res,
"
"                                              v_lo_no,
"
"                                             p_lang
"
"                                              );
"
"
"
"                                            OPEN c9;
"
"                                            FETCH c9 INTO cr9;
"
"                                            CLOSE c9;
"
"
"
"                                                 IF cr9.icmctrl_auto_mr_issue_flag = 'Y' THEN
"
"
"
"                                                      UPDATE inv_material_request_ln
"
"                                                     SET imrln_sel_flag = 'Y',
"
"                                                         imrln_sel_user = p_user,
"
"                                                         imrln_upd_by = p_user,
"
"                                                         imrln_upd_date = SYSDATE
"
"                                                       WHERE imrln_bu = p_bu
"
"                                                         AND imrln_plnt = p_plnt
"
"                                                     AND imrln_rqst_no = v_rqst_no;
"
"
"
"                                                      proc_alloc_frm_mat_req(p_bu,
"
"                                                                 p_date,
"
"                                                                 p_user,
"
"                                                                 null,
"
"                                                                 p_lang,
"
"                                                                 var_iss_doc_no,
"
"                                                                 v_dc_doc_no,
"
"                                                                         v_dc_pack_no
"
"                                                                );
"
"
"
"                                                      IF var_iss_doc_no IS NOT NULL THEN
"
"
"
"                                                    OPEN c10(var_iss_doc_no);
"
"                                                    FETCH c10 INTO cr10;
"
"                                                      IF c10%FOUND THEN
"
"
"
"                                                        IF cr10.isthd_issueto_type = 'D' OR func_find_inv_method(p_bu) = 'T' THEN
"
"                                                          proc_ins_mat_iss_appl_jrnl(p_bu,
"
"                                                                     cr10.isthd_plnt,
"
"                                                                     cr10.isthd_doc_no,
"
"                                                                     p_user,
"
"                                                                     p_lang,
"
"                                                                     var_jrnl_res
"
"                                                                    );
"
"
"
"                                                          IF var_jrnl_res = 'Y' THEN
"
"
"
"                                                        UPDATE inv_stock_trans_hd
"
"                                                           SET isthd_jrnl_flag = 'Y'
"
"                                                         WHERE isthd_bu = p_bu
"
"                                                           AND isthd_plnt = cr10.isthd_plnt
"
"                                                           AND isthd_doc_no = cr10.isthd_doc_no;
"
"
"
"                                                          ELSE
"
"                                                            Raise_Application_Error(-20009,'GLM ');
"
"                                                          END IF;
"
"                                                        END IF;
"
"
"
"                                                        proc_issue_mat_frm_mi(p_bu,
"
"                                                                  cr10.isthd_plnt,
"
"                                                                  cr10.isthd_doc_no,
"
"                                                                  p_user,
"
"                                                                  null,
"
"                                                                  p_lang,
"
"                                                                  var_dc_no,
"
"                                                                  var_pack_dc_no
"
"                                                                 );
"
"
"
"                                                        proc_ins_gl_jrnl(p_bu,
"
"                                                                 cr10.isthd_plnt,
"
"                                                                 cr10.isthd_trans_date,
"
"                                                                 cr10.isthd_year,
"
"                                                                 cr10.isthd_period,
"
"                                                                 NULL,
"
"                                                                 cr10.isthd_doc_no,
"
"                                                                 NULL,
"
"                                                                 'ICM',
"
"                                                                 p_user,
"
"                                                                 p_lang,
"
"                                                                 'Material Issuance'
"
"                                                                );
"
"
"
"                                                      END IF;
"
"
"
"                                                    CLOSE c10;
"
"
"
"                                                      END IF;
"
"
"
"                            END IF;
"
"
"
"
"
"
"
"                        /*Queue Updation*/    -- ESHWAR queue not done here because request may be raised for more than w/h
"
"
"
"                        /*select pros_queue_qty
"
"                          into v_queue_qty
"
"                          from PROD_ORD_OPER_STATUS
"
"                         where pros_bu = p_bu
"
"                           and pros_plnt = p_plnt
"
"                           and pros_orD_no = p_prod_ord_no
"
"                           and pros_sf_code = p_sf_code
"
"                           and pros_ser_no = p_ser_no
"
"                           and pros_sys_ls_no = p_sys_ls_no;
"
"
"
"
"
"
"
"                       proc_upd_oprn_status_qtys(
"
"                                                 p_bu,
"
"                                                 p_plnt,
"
"                                                 p_prod_ord_no,
"
"                                                 p_process_id,
"
"                                                 p_sf_code,
"
"                                                 -p_comp_qty,
"
"                                                 p_comp_qty,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 0,
"
"                                                 p_sys_ls_no,
"
"                                                 NULL,
"
"                                                 p_ser_no,
"
"                                                 NULL,
"
"                                                 'PR',
"
"                                                 p_user
"
"                                                );
"
"
"
"
"
"
"
"                    UPDATE prod_ord_oper_status
"
"                       SET pros_ins_proc = 0,
"
"                           pros_sel_flag = 'N',
"
"                           pros_user = NULL
"
"                     WHERE pros_bu = p_bu
"
"                       AND pros_plnt = p_plnt
"
"                       AND pros_ord_no = p_prod_ord_no
"
"                       AND pros_ser_no = p_ser_no
"
"                       AND pros_sys_ls_no = p_sys_ls_no
"
"                       AND pros_sf_code = p_sf_code;
"
"
"
"                    UPDATE prod_ord_trans_record
"
"                       SET potr_ins_proc = 0,
"
"                           potr_sel_flag = 'N',
"
"                           potr_user = NULL
"
"                     WHERE potr_bu = p_bu
"
"                       AND potr_plnt = p_plnt
"
"                       AND potr_ord_no = p_prod_ord_no
"
"                       AND potr_ser_no = p_ser_no
"
"                       AND potr_sys_ls_no = p_sys_ls_no
"
"                       AND potr_sf_code = p_sf_code;
"
"                        */
"
"
"
"
"
"
"
"        END LOOP;
"
"
"
"        --END LOOP;
"
"
"
"
"
"
"
"        IF func_find_prod_ser_lot_type(p_bu,p_prod_id,p_prod_rev) NOT IN ('S') THEN
"
"
"
"            /*Queue updation*/
"
"                                   ---raise_application_error(-20999,'HRM');
"
"                            proc_upd_oprn_status_qtys(
"
"                                         p_bu,
"
"                                         p_plnt,
"
"                                         p_loc_id,
"
"                                         p_prod_ord_no,
"
"                                         p_process_id,
"
"                                         p_process_ln_seq ,
"
"                                         p_sf_code,
"
"                                         - p_comp_qty,
"
"                                         p_comp_qty,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         p_sys_ls_no,
"
"                                         p_lot_no,
"
"                                         p_ser_no,
"
"                                         NULL,
"
"                                         'PR',
"
"                                         p_user
"
"                                        );
"
"
"
"                            UPDATE prod_ord_oper_status
"
"                               SET pros_ins_proc = 0,
"
"                                   pros_sel_flag = 'N',
"
"                                   pros_user = NULL
"
"                              WHERE pros_bu = p_bu
"
"                                AND pros_plnt = p_plnt
"
"                                AND pros_ord_no = p_prod_ord_no
"
"                                AND (pros_ser_no = p_ser_no OR pros_ser_no IS NULL)
"
"                                AND (pros_lot_no = p_lot_no OR pros_lot_no IS NULL)
"
"                                AND (pros_sys_ls_no = p_sys_ls_no OR pros_sys_ls_no IS NULL)
"
"                                AND pros_sf_code = p_sf_code;
"
"
"
"                            UPDATE prod_ord_trans_record
"
"                               SET potr_ins_proc =0,
"
"                                   potr_sel_flag = 'N',
"
"                                   potr_user = NULL
"
"                              WHERE potr_bu = p_bu
"
"                                AND potr_plnt = p_plnt
"
"                                AND potr_ord_no = p_prod_ord_no
"
"                                AND (potr_ser_no = p_ser_no OR potr_ser_no IS NULL)
"
"                                AND (potr_lot_no = p_lot_no OR potr_lot_no IS NULL)
"
"                                AND (potr_sys_ls_no = p_sys_ls_no OR potr_sys_ls_no IS NULL)
"
"                        AND potr_sf_code = p_sf_code;
"
"     END IF;
"
"
"
"
"
"
"
"        IF INSTR(p_sf_code,'1') > 0  THEN
"
"
"
"            IF p_ser_no LIKE 'DS%' THEN
"
"
"
"                proc_get_emp_det (p_bu,
"
"                           p_user,
"
"                           v_emp_id,
"
"                           v_emp_name,
"
"                           v_pos_id,
"
"                           v_pos_desc,
"
"                           v_dept_id,
"
"                           v_dummy,
"
"                           p_lang
"
"                           );
"
"
"
"
"
"                -- current process
"
"
"
"                         OPEN c3;
"
"                         FETCH c3 INTO cr3;
"
"                         CLOSE c3;
"
"
"
"                    -- previous process
"
"
"
"                         OPEN c4;
"
"                         FETCH c4 INTO cr4;
"
"                         CLOSE c4;
"
"
"
"
"
"                IF cr4.pror_rcp_store <> cr3.pror_cons_store THEN
"
"
"
"                 v_rqst_no := func_find_icm_next_id (p_bu,p_date,'MR',cr4.pror_rcp_store,p_user);
"
"
"
"                 IF v_first = 1 THEN
"
"                    v_start_no := v_rqst_no;
"
"                 END IF;
"
"
"
"                 v_end_no := v_rqst_no;
"
"
"
"                                 SELECT NVL(MAX(pmcl_seq_no),0) + 1
"
"                                   INTO v_pm_seq_no
"
"                                   FROM pend_mr_creation_list
"
"                                  WHERE pmcl_bu = p_bu
"
"                                    AND pmcl_user = p_user;
"
"
"
"                                 INSERT INTO pend_mr_creation_list(
"
"                                            pmcl_bu        ,
"
"                                            pmcl_plnt      ,
"
"                                            pmcl_user      ,
"
"                                            pmcl_seq_no    ,
"
"                                            pmcl_mr_no     ,
"
"                                            pmcl_cre_by    ,
"
"                                            pmcl_cre_date  ,
"
"                                            pmcl_upd_by    ,
"
"                                            pmcl_upd_date
"
"                                                                  )
"
"                                                            VALUES(
"
"                                            p_bu        ,
"
"                                            p_plnt     ,
"
"                                            p_user      ,
"
"                                            v_pm_seq_no    ,
"
"                                            v_rqst_no     ,
"
"                                            p_user    ,
"
"                                            SYSDATE  ,
"
"                                            NULL    ,
"
"                                            NULL
"
"                                                                  );
"
"
"
"
"
"
"
"                    INSERT INTO inv_material_request_hd (imrhd_bu,
"
"                                      imrhd_rqst_no,
"
"                                      imrhd_rqstto_store_id,
"
"                                      imrhd_rqst_date,
"
"                                      imrhd_year,
"
"                                      imrhd_period,
"
"                                      imrhd_rqstby_type,
"
"                                      imrhd_rqstby_id,
"
"                                      imrhd_status,
"
"                                      imrhd_reference,
"
"                                      imrhd_control_person,
"
"                                      imrhd_reqstr_id,
"
"                                      imrhd_reqstr_name,
"
"                                      imrhd_reqstr_pos_id,
"
"                                      imrhd_reqstr_pos_name,
"
"                                      imrhd_rqst_dept_id,
"
"                                      imrhd_appr_flag,
"
"                                      imrhd_no_of_try,
"
"                                      imrhd_no_of_issues,
"
"                                      imrhd_rec_source,
"
"                                      imrhd_cre_by,
"
"                                      imrhd_cre_date,
"
"                                      imrhd_plnt,
"
"                                      imrhd_source_flag,
"
"                                      imrhd_ref_unit)
"
"                                  VALUES (p_bu,
"
"                                      v_rqst_no,
"
"                                      cr4.pror_rcp_store,
"
"                                      p_date,
"
"                                      func_find_year(p_bu,p_date),
"
"                                      func_find_period(p_bu,p_date),
"
"                                      'W',
"
"                                      cr3.pror_cons_store,
"
"                                      DECODE (func_find_matreq_type (p_bu), 'Y', 'N', 'E'),
"
"                                      'Material Request For Production Order ',
"
"                                      p_user,
"
"                                      v_emp_id,
"
"                                      v_emp_name,
"
"                                      v_pos_id,
"
"                                      v_pos_desc,
"
"                                      v_dept_id,
"
"                                      DECODE (func_find_matreq_type (p_bu), 'Y', 'Y', 'N'),
"
"                                      0,
"
"                                      0,
"
"                                      'S',
"
"                                      p_user,
"
"                                      SYSDATE,
"
"                                      p_plnt,
"
"                                      'S',
"
"                                      p_plnt
"
"                                 );
"
"
"
"
"
"
"
"
"
"                        UPDATE inv_material_request_ln
"
"                           SET imrln_requested_qty     = imrln_requested_qty + p_comp_qty,
"
"                               imrln_to_allocated_qty     = imrln_to_allocated_qty + p_comp_qty,
"
"                               imrln_upd_by         = p_user,
"
"                               imrln_upd_date         = SYSDATE
"
"                         WHERE imrln_bu         = p_bu
"
"                           AND imrln_plnt        = p_plnt
"
"                           AND imrln_rqst_no         = v_rqst_no
"
"                           AND imrln_prod_id         = p_prod_id
"
"                           AND imrln_prod_rev         = p_prod_rev
"
"                           AND imrln_sf_code        = p_sf_code
"
"                           AND imrln_sys_ls_no        = p_sys_ls_no;
"
"
"
"                               IF SQL%NOTFOUND
"
"                               THEN
"
"
"
"                                 SELECT NVL(MAX(imrln_seq_no),0) + 1
"
"                                   INTO v_seq_no
"
"                                   FROM inv_material_request_ln
"
"                                  WHERE imrln_bu    = p_bu
"
"                                    AND imrln_plnt      = p_plnt
"
"                                    AND imrln_rqst_no     = v_rqst_no;
"
"
"
"
"
"                                    v_unit_cost := func_find_sfg_unitcost (p_bu,p_prod_id,p_prod_rev,cr4.pror_rcp_store,p_prod_ord_no,p_sf_code,p_sys_ls_no);
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
"                                            v_so_pfx    := p_so_pfx;
"
"                                            v_so_no        := p_so_no;
"
"                                            v_so_seq_no    := p_so_seq_no;
"
"                                            v_so_sub_seq_no    := p_so_sub_seq_no;
"
"                                            v_so_schld_desc := p_so_schld_desc;
"
"
"
"                                            OPEN c5;
"
"                                            FETCH c5 INTO cr5;
"
"                                            CLOSE c5;
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
"                                      INSERT INTO inv_material_request_ln (imrln_bu,
"
"                                                      imrln_plnt,
"
"                                                      imrln_rqst_no,
"
"                                                      imrln_seq_no,
"
"                                                      imrln_prod_id,
"
"                                                      imrln_prod_rev,
"
"                                                      imrln_prod_cls,
"
"                                                      imrln_unit_cost,
"
"                                                      imrln_requested_qty,
"
"                                                      imrln_ord_qty,
"
"                                                      imrln_uom,
"
"                                                      imrln_prod_uom,
"
"                                                      imrln_conv_factor,
"
"                                                      imrln_mi_allocated_qty,
"
"                                                      imrln_issued_qty,
"
"                                                      imrln_to_allocated_qty,
"
"                                                      imrln_reference,
"
"                                                      imrln_substiute,
"
"                                                      imrln_rqrd_date,
"
"                                                      imrln_rqrd_year,
"
"                                                      imrln_rqrd_period,
"
"                                                      imrln_proj_task_id,
"
"                                                      imrln_status,
"
"                                                      imrln_process_id,
"
"                                                      imrln_work_center,
"
"                                                      imrln_sf_code,
"
"                                                      imrln_mat_type,
"
"                                                      imrln_cre_by,
"
"                                                      imrln_cre_date,
"
"                                                      imrln_ord_type,
"
"                                                      imrln_po_ord_no,
"
"                                                      imrln_ord_no,
"
"                                                      imrln_mi_method,
"
"                                                      imrln_par_prod_id,
"
"                                                      imrln_par_prod_rev,
"
"                                                      imrln_type,
"
"                                                      imrln_so_pfx,
"
"                                                      imrln_so_no,
"
"                                                      imrln_so_seq_no,
"
"                                                      imrln_so_sub_seq_no,
"
"                                                      imrln_so_schld_desc,
"
"                                                      imrln_proj_id,
"
"                                                      imrln_task_id,
"
"                                                      imrln_sys_ls_no,
"
"                                                      imrln_lot_no,
"
"                                                      imrln_ser_no,
"
"                                                      imrln_expiry_date,
"
"                                                      imrln_trans_no,
"
"                                                      imrln_prod_subcls
"
"                                                      )
"
"                                                  VALUES (
"
"                                                      p_bu,
"
"                                                      p_plnt,
"
"                                                      v_rqst_no,
"
"                                                      v_seq_no,
"
"                                                      p_prod_id,
"
"                                                      p_prod_rev,
"
"                                                      func_find_product_class (p_bu,
"
"                                                                   p_plnt,
"
"                                                                   p_prod_id,
"
"                                                                   p_prod_rev),
"
"                                                      v_unit_cost,
"
"                                                      p_comp_qty,
"
"                                                      p_comp_qty,
"
"                                                      func_find_product_uom(p_bu,p_prod_id,p_prod_rev),
"
"                                                      func_find_product_uom(p_bu,p_prod_id,p_prod_rev),
"
"                                                      1,
"
"                                                      0,
"
"                                                      0,
"
"                                                      p_comp_qty,
"
"                                                      'Material Request For Production Order',
"
"                                                      'N',
"
"                                                      p_date,
"
"                                                      func_find_year(p_bu,p_date),
"
"                                                      func_find_period(p_bu,p_date),
"
"                                                      NULL,
"
"                                                      DECODE (func_find_matreq_type(p_bu),'Y','N','E'),
"
"                                                      cr3.pror_oprn_id,
"
"                                                      cr3.pror_proc_id,
"
"                                                      p_sf_code,
"
"                                                      'F',
"
"                                                      p_user,
"
"                                                      SYSDATE,
"
"                                                      'PO',
"
"                                                      p_prod_ord_no,
"
"                                                      p_prod_ord_no,
"
"                                                      cr5.prodplnt_mi_method,
"
"                                                      p_prod_id,
"
"                                                      p_prod_rev,
"
"                                                      DECODE(p_so_pfx, NULL, 'NA', 'SO'),
"
"                                                      v_so_pfx,
"
"                                                      v_so_no,
"
"                                                      v_so_seq_no,
"
"                                                      v_so_sub_seq_no,
"
"                                                      v_so_schld_desc,
"
"                                                      NULL,
"
"                                                      NULL,
"
"                                                      p_sys_ls_no,
"
"                                                      NULL,
"
"                                                      p_ser_no,
"
"                                                      NULL,
"
"                                                      NULL  ,--v_trans_no
"
"                                                      func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)
"
"                                                     );
"
"
"
"                                       END IF;
"
"
"
"
"
"
"
"                                       proc_pom_icm_doc_approve (p_bu,
"
"                                                  'MR',
"
"                                                  p_user,
"
"                                                  v_rqst_no,
"
"                                                  NULL,
"
"                                                 p_plnt,
"
"                                                  v_mr_res,
"
"                                                  v_res,
"
"                                                  v_lo_no,
"
"                                                 p_lang
"
"                                                  );
"
"
"
"                                                            OPEN c9;
"
"                                                            FETCH c9 INTO cr9;
"
"                                                            CLOSE c9;
"
"
"
"                                                                 IF cr9.icmctrl_auto_mr_issue_flag = 'Y' THEN
"
"
"
"                                                                      UPDATE inv_material_request_ln
"
"                                                                     SET imrln_sel_flag = 'Y',
"
"                                                                         imrln_sel_user = p_user,
"
"                                                                         imrln_upd_by = p_user,
"
"                                                                         imrln_upd_date = SYSDATE
"
"                                                                       WHERE imrln_bu = p_bu
"
"                                                                         AND imrln_plnt = p_plnt
"
"                                                                     AND imrln_rqst_no = v_rqst_no;
"
"
"
"                                                                      proc_alloc_frm_mat_req(p_bu,
"
"                                                                                 p_date,
"
"                                                                                 p_user,
"
"                                                                                 null,
"
"                                                                                 p_lang,
"
"                                                                                 var_iss_doc_no,
"
"                                                                                 v_dc_doc_no,
"
"                                                                                         v_dc_pack_no
"
"                                                                                );
"
"
"
"                                                                      IF var_iss_doc_no IS NOT NULL THEN
"
"
"
"                                                                    OPEN c10(var_iss_doc_no);
"
"                                                                    FETCH c10 INTO cr10;
"
"                                                                      IF c10%FOUND THEN
"
"
"
"                                                                        IF cr10.isthd_issueto_type = 'D' OR func_find_inv_method(p_bu) = 'T' THEN
"
"                                                                          proc_ins_mat_iss_appl_jrnl(p_bu,
"
"                                                                                     cr10.isthd_plnt,
"
"                                                                                     cr10.isthd_doc_no,
"
"                                                                                     p_user,
"
"                                                                                     p_lang,
"
"                                                                                     var_jrnl_res
"
"                                                                                    );
"
"
"
"                                                                          IF var_jrnl_res = 'Y' THEN
"
"
"
"                                                                        UPDATE inv_stock_trans_hd
"
"                                                                           SET isthd_jrnl_flag = 'Y'
"
"                                                                         WHERE isthd_bu = p_bu
"
"                                                                           AND isthd_plnt = cr10.isthd_plnt
"
"                                                                           AND isthd_doc_no = cr10.isthd_doc_no;
"
"
"
"                                                                          ELSE
"
"                                                                            Raise_Application_Error(-20009,'GLM ');
"
"                                                                          END IF;
"
"                                                                        END IF;
"
"
"
"                                                                        proc_issue_mat_frm_mi(p_bu,
"
"                                                                                  cr10.isthd_plnt,
"
"                                                                                  cr10.isthd_doc_no,
"
"                                                                                  p_user,
"
"                                                                                  null,
"
"                                                                                  p_lang,
"
"                                                                                  var_dc_no,
"
"                                                                                  var_pack_dc_no
"
"                                                                                 );
"
"
"
"                                                                        proc_ins_gl_jrnl(p_bu,
"
"                                                                                 cr10.isthd_plnt,
"
"                                                                                 cr10.isthd_trans_date,
"
"                                                                                 cr10.isthd_year,
"
"                                                                                 cr10.isthd_period,
"
"                                                                                 NULL,
"
"                                                                                 cr10.isthd_doc_no,
"
"                                                                                 NULL,
"
"                                                                                 'ICM',
"
"                                                                                 p_user,
"
"                                                                                 p_lang,
"
"                                                                                 'Material Issuance'
"
"                                                                                );
"
"
"
"                                                                      END IF;
"
"
"
"                                                                    CLOSE c10;
"
"
"
"                                                                      END IF;
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
"            END IF;
"
"
"
"                    /*Queue updation*/
"
"
"
"                    proc_upd_oprn_status_qtys(
"
"                                             p_bu,
"
"                                             p_plnt,
"
"                                             p_loc_id,
"
"                                             p_prod_ord_no,
"
"                                             p_process_id,
"
"                                             p_process_ln_seq,
"
"                                             p_sf_code,
"
"                                             -p_comp_qty,
"
"                                             p_comp_qty,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             p_sys_ls_no,
"
"                                             NULL,
"
"                                             p_ser_no,
"
"                                             NULL,
"
"                                             'PR',
"
"                                             p_user
"
"                                            );
"
"
"
"
"
"
"
"                    UPDATE prod_ord_oper_status
"
"                       SET pros_ins_proc = 0,
"
"                           pros_sel_flag = 'N',
"
"                           pros_user = NULL
"
"                      WHERE pros_bu = p_bu
"
"                        AND pros_plnt = p_plnt
"
"                        AND pros_ord_no = p_prod_ord_no
"
"                        AND pros_ser_no = p_ser_no
"
"                        AND pros_sys_ls_no = p_sys_ls_no
"
"                        AND pros_sf_code = p_sf_code;
"
"
"
"                    UPDATE prod_ord_trans_record
"
"                       SET potr_ins_proc =0,
"
"                           potr_sel_flag = 'N',
"
"                           potr_user = NULL
"
"                      WHERE potr_bu = p_bu
"
"                        AND potr_plnt = p_plnt
"
"                        AND potr_ord_no = p_prod_ord_no
"
"                        AND potr_ser_no = p_ser_no
"
"                        AND potr_sys_ls_no = p_sys_ls_no
"
"                        AND potr_sf_code = p_sf_code;
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
"
"
"
"
"            ELSIF p_ser_no IS NULL THEN
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"                    proc_get_emp_det (p_bu,
"
"                               p_user,
"
"                               v_emp_id,
"
"                               v_emp_name,
"
"                               v_pos_id,
"
"                               v_pos_desc,
"
"                               v_dept_id,
"
"                               v_dummy,
"
"                               p_lang
"
"                             );
"
"
"
"
"
"                           -- current process
"
"                             OPEN c3;
"
"                             FETCH c3 INTO cr3;
"
"                             CLOSE c3;
"
"
"
"
"
"
"
"                             -- previous process
"
"                             OPEN c4;
"
"                             FETCH c4 INTO cr4;
"
"                             CLOSE c4;
"
"
"
"                IF cr3.pror_cons_store <> cr4.pror_rcp_store THEN
"
"
"
"                 v_rqst_no := func_find_icm_next_id (p_bu,p_date,'MR',cr4.pror_rcp_store,p_user);
"
"
"
"
"
"                IF v_first = 1 THEN
"
"                    v_start_no := v_rqst_no;
"
"                 END IF;
"
"
"
"                 v_end_no := v_rqst_no;
"
"
"
"                                 SELECT NVL(MAX(pmcl_seq_no),0) + 1
"
"                                   INTO v_pm_seq_no
"
"                                   FROM pend_mr_creation_list
"
"                                  WHERE pmcl_bu = p_bu
"
"                                    AND pmcl_user = p_user;
"
"
"
"                                 INSERT INTO pend_mr_creation_list(
"
"                                            pmcl_bu        ,
"
"                                            pmcl_plnt      ,
"
"                                            pmcl_user      ,
"
"                                            pmcl_seq_no    ,
"
"                                            pmcl_mr_no     ,
"
"                                            pmcl_cre_by    ,
"
"                                            pmcl_cre_date  ,
"
"                                            pmcl_upd_by    ,
"
"                                            pmcl_upd_date
"
"                                                                  )
"
"                                                            VALUES(
"
"                                            p_bu        ,
"
"                                            p_plnt      ,
"
"                                            p_user      ,
"
"                                            v_pm_seq_no    ,
"
"                                            v_rqst_no     ,
"
"                                            p_user    ,
"
"                                            SYSDATE  ,
"
"                                            NULL    ,
"
"                                            NULL
"
"                                                                  );
"
"
"
"
"
"
"
"                    INSERT INTO inv_material_request_hd (imrhd_bu,
"
"                                      imrhd_rqst_no,
"
"                                      imrhd_rqstto_store_id,
"
"                                      imrhd_rqst_date,
"
"                                      imrhd_year,
"
"                                      imrhd_period,
"
"                                      imrhd_rqstby_type,
"
"                                      imrhd_rqstby_id,
"
"                                      imrhd_status,
"
"                                      imrhd_reference,
"
"                                      imrhd_control_person,
"
"                                      imrhd_reqstr_id,
"
"                                      imrhd_reqstr_name,
"
"                                      imrhd_reqstr_pos_id,
"
"                                      imrhd_reqstr_pos_name,
"
"                                      imrhd_rqst_dept_id,
"
"                                      imrhd_appr_flag,
"
"                                      imrhd_no_of_try,
"
"                                      imrhd_no_of_issues,
"
"                                      imrhd_rec_source,
"
"                                      imrhd_cre_by,
"
"                                      imrhd_cre_date,
"
"                                      imrhd_plnt,
"
"                                      imrhd_source_flag,
"
"                                      imrhd_ref_unit)
"
"                                  VALUES (p_bu,
"
"                                      v_rqst_no,
"
"                                      cr4.pror_rcp_store,
"
"                                      p_date,
"
"                                      func_find_year(p_bu,p_date),
"
"                                      func_find_period(p_bu,p_date),
"
"                                      'W',
"
"                                      cr3.pror_cons_store,
"
"                                      DECODE (func_find_matreq_type (p_bu), 'Y', 'N', 'E'),
"
"                                      'Material Request For Production Order ',
"
"                                      p_user,
"
"                                      v_emp_id,
"
"                                      v_emp_name,
"
"                                      v_pos_id,
"
"                                      v_pos_desc,
"
"                                      v_dept_id,
"
"                                      DECODE (func_find_matreq_type (p_bu), 'Y', 'Y', 'N'),
"
"                                      0,
"
"                                      0,
"
"                                      'S',
"
"                                      p_user,
"
"                                      SYSDATE,
"
"                                      p_plnt,
"
"                                      'S',
"
"                                      p_plnt
"
"                                 );
"
"
"
"
"
"
"
"                        FOR cr6 IN c6
"
"                        LOOP
"
"
"
"                            UPDATE inv_material_request_ln
"
"                               SET imrln_requested_qty     = imrln_requested_qty + cr6.potv_enter_qty,
"
"                                   imrln_to_allocated_qty     = imrln_to_allocated_qty + cr6.potv_enter_qty,
"
"                                   imrln_upd_by         = p_user,
"
"                                   imrln_upd_date         = SYSDATE
"
"                             WHERE imrln_bu         = p_bu
"
"                               AND imrln_plnt        = p_plnt
"
"                               AND imrln_rqst_no         = v_rqst_no
"
"                               AND imrln_prod_id         = p_prod_id
"
"                               AND imrln_prod_rev         = p_prod_rev
"
"                               AND imrln_sf_code        = p_sf_code
"
"                               AND imrln_sys_ls_no        = cr6.potv_sys_ls_no;
"
"
"
"                               IF SQL%NOTFOUND
"
"                               THEN
"
"
"
"                                 SELECT NVL(MAX(imrln_seq_no),0) + 1
"
"                                   INTO v_seq_no
"
"                                   FROM inv_material_request_ln
"
"                                  WHERE imrln_bu    = p_bu
"
"                                    AND imrln_plnt      = p_plnt
"
"                                    AND imrln_rqst_no     = v_rqst_no;
"
"
"
"
"
"
"
"
"
"                                    v_unit_cost := func_find_sfg_unitcost (p_bu,p_prod_id,p_prod_rev,cr4.pror_rcp_store,p_prod_ord_no,p_sf_code,cr6.potv_sys_ls_no);
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
"                                            v_so_pfx    := p_so_pfx;
"
"                                            v_so_no        := p_so_no;
"
"                                            v_so_seq_no    := p_so_seq_no;
"
"                                            v_so_sub_seq_no    := p_so_sub_seq_no;
"
"                                            v_so_schld_desc := p_so_schld_desc;
"
"
"
"                                            OPEN c5;
"
"                                            FETCH c5 INTO cr5;
"
"                                            CLOSE c5;
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
"                                      INSERT INTO inv_material_request_ln (imrln_bu,
"
"                                                      imrln_plnt,
"
"                                                      imrln_rqst_no,
"
"                                                      imrln_seq_no,
"
"                                                      imrln_prod_id,
"
"                                                      imrln_prod_rev,
"
"                                                      imrln_prod_cls,
"
"                                                      imrln_unit_cost,
"
"                                                      imrln_requested_qty,
"
"                                                      imrln_ord_qty,
"
"                                                      imrln_uom,
"
"                                                      imrln_prod_uom,
"
"                                                      imrln_conv_factor,
"
"                                                      imrln_mi_allocated_qty,
"
"                                                      imrln_issued_qty,
"
"                                                      imrln_to_allocated_qty,
"
"                                                      imrln_reference,
"
"                                                      imrln_substiute,
"
"                                                      imrln_rqrd_date,
"
"                                                      imrln_rqrd_year,
"
"                                                      imrln_rqrd_period,
"
"                                                      imrln_proj_task_id,
"
"                                                      imrln_status,
"
"                                                      imrln_process_id,
"
"                                                      imrln_work_center,
"
"                                                      imrln_sf_code,
"
"                                                      imrln_mat_type,
"
"                                                      imrln_cre_by,
"
"                                                      imrln_cre_date,
"
"                                                      imrln_ord_type,
"
"                                                      imrln_po_ord_no,
"
"                                                      imrln_ord_no,
"
"                                                      imrln_mi_method,
"
"                                                      imrln_par_prod_id,
"
"                                                      imrln_par_prod_rev,
"
"                                                      imrln_type,
"
"                                                      imrln_so_pfx,
"
"                                                      imrln_so_no,
"
"                                                      imrln_so_seq_no,
"
"                                                      imrln_so_sub_seq_no,
"
"                                                      imrln_so_schld_desc,
"
"                                                      imrln_proj_id,
"
"                                                      imrln_task_id,
"
"                                                      imrln_sys_ls_no,
"
"                                                      imrln_lot_no,
"
"                                                      imrln_ser_no,
"
"                                                      imrln_expiry_date,
"
"                                                      imrln_trans_no,
"
"                                                      imrln_prod_subcls
"
"                                                      )
"
"                                                  VALUES (
"
"                                                      p_bu,
"
"                                                      p_plnt,
"
"                                                      v_rqst_no,
"
"                                                      v_seq_no,
"
"                                                      p_prod_id,
"
"                                                      p_prod_rev,
"
"                                                      func_find_product_class (p_bu,
"
"                                                                   p_plnt,
"
"                                                                   p_prod_id,
"
"                                                                   p_prod_rev),
"
"                                                      v_unit_cost,
"
"                                                      cr6.potv_enter_qty,
"
"                                                      cr6.potv_enter_qty,
"
"                                                      func_find_product_uom(p_bu,p_prod_id,p_prod_rev),
"
"                                                      func_find_product_uom(p_bu,p_prod_id,p_prod_rev),
"
"                                                      1,
"
"                                                      0,
"
"                                                      0,
"
"                                                      cr6.potv_enter_qty,
"
"                                                      'Material Request For Production Order',
"
"                                                      'N',
"
"                                                      p_date,
"
"                                                      func_find_year(p_bu,p_date),
"
"                                                      func_find_period(p_bu,p_date),
"
"                                                      NULL,
"
"                                                      DECODE (func_find_matreq_type(p_bu),'Y','N','E'),
"
"                                                      cr3.pror_oprn_id,
"
"                                                      cr3.pror_proc_id,
"
"                                                      p_sf_code,
"
"                                                      'F',
"
"                                                      p_user,
"
"                                                      SYSDATE,
"
"                                                      'PO',
"
"                                                      p_prod_ord_no,
"
"                                                      p_prod_ord_no,
"
"                                                      cr5.prodplnt_mi_method,
"
"                                                      p_prod_id,
"
"                                                      p_prod_rev,
"
"                                                      DECODE(p_so_pfx, NULL, 'NA', 'SO'),
"
"                                                      v_so_pfx,
"
"                                                      v_so_no,
"
"                                                      v_so_seq_no,
"
"                                                      v_so_sub_seq_no,
"
"                                                      v_so_schld_desc,
"
"                                                      NULL,
"
"                                                      NULL,
"
"                                                      cr6.potv_sys_ls_no,
"
"                                                      NULL,
"
"                                                      cr6.potv_ser_no,
"
"                                                      NULL,
"
"                                                      NULL , --v_trans_no
"
"                                                      func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)
"
"                                                     );
"
"
"
"                                       END IF;
"
"
"
"
"
"
"
"                        END LOOP;
"
"
"
"
"
"                         proc_pom_icm_doc_approve (p_bu,
"
"                                          'MR',
"
"                                          p_user,
"
"                                          v_rqst_no,
"
"                                          NULL,
"
"                                         p_plnt,
"
"                                          v_mr_res,
"
"                                          v_res,
"
"                                          v_lo_no,
"
"                                         p_lang
"
"                                          );
"
"
"
"                            OPEN c9;
"
"                            FETCH c9 INTO cr9;
"
"                            CLOSE c9;
"
"
"
"                                 IF cr9.icmctrl_auto_mr_issue_flag = 'Y' THEN
"
"
"
"                                      UPDATE inv_material_request_ln
"
"                                     SET imrln_sel_flag = 'Y',
"
"                                         imrln_sel_user = p_user,
"
"                                         imrln_upd_by = p_user,
"
"                                         imrln_upd_date = SYSDATE
"
"                                       WHERE imrln_bu = p_bu
"
"                                         AND imrln_plnt = p_plnt
"
"                                     AND imrln_rqst_no = v_rqst_no;
"
"
"
"                                      proc_alloc_frm_mat_req(p_bu,
"
"                                                 p_date,
"
"                                                 p_user,
"
"                                                 null,
"
"                                                 p_lang,
"
"                                                 var_iss_doc_no,
"
"                                                 v_dc_doc_no,
"
"                                                         v_dc_pack_no
"
"                                                );
"
"
"
"                                      IF var_iss_doc_no IS NOT NULL THEN
"
"
"
"                                    OPEN c10(var_iss_doc_no);
"
"                                    FETCH c10 INTO cr10;
"
"                                      IF c10%FOUND THEN
"
"
"
"                                        IF cr10.isthd_issueto_type = 'D' OR func_find_inv_method(p_bu) = 'T' THEN
"
"                                          proc_ins_mat_iss_appl_jrnl(p_bu,
"
"                                                     cr10.isthd_plnt,
"
"                                                     cr10.isthd_doc_no,
"
"                                                     p_user,
"
"                                                     p_lang,
"
"                                                     var_jrnl_res
"
"                                                    );
"
"
"
"                                          IF var_jrnl_res = 'Y' THEN
"
"
"
"                                        UPDATE inv_stock_trans_hd
"
"                                           SET isthd_jrnl_flag = 'Y'
"
"                                         WHERE isthd_bu = p_bu
"
"                                           AND isthd_plnt = cr10.isthd_plnt
"
"                                           AND isthd_doc_no = cr10.isthd_doc_no;
"
"
"
"                                          ELSE
"
"                                            Raise_Application_Error(-20009,'GLM ');
"
"                                          END IF;
"
"                                        END IF;
"
"
"
"                                        proc_issue_mat_frm_mi(p_bu,
"
"                                                  cr10.isthd_plnt,
"
"                                                  cr10.isthd_doc_no,
"
"                                                  p_user,
"
"                                                  NULL,
"
"                                                  p_lang,
"
"                                                  var_dc_no,
"
"                                                  var_pack_dc_no
"
"                                                 );
"
"
"
"                                        proc_ins_gl_jrnl(p_bu,
"
"                                                 cr10.isthd_plnt,
"
"                                                 cr10.isthd_trans_date,
"
"                                                 cr10.isthd_year,
"
"                                                 cr10.isthd_period,
"
"                                                 NULL,
"
"                                                 cr10.isthd_doc_no,
"
"                                                 NULL,
"
"                                                 'ICM',
"
"                                                 p_user,
"
"                                                 p_lang,
"
"                                                 'Material Issuance'
"
"                                                );
"
"
"
"                                      END IF;
"
"
"
"                                    CLOSE c10;
"
"
"
"                                      END IF;
"
"
"
"            END IF;
"
"
"
"
"
"                        /*Queue Updation*/
"
"
"
"                    proc_upd_oprn_status_qtys(
"
"                                             p_bu,
"
"                                             p_plnt,
"
"                                             p_loc_id,
"
"                                             p_prod_ord_no,
"
"                                             p_process_id,
"
"                                             p_process_ln_seq,
"
"                                             p_sf_code,
"
"                                             -p_comp_qty,
"
"                                             p_comp_qty,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             0,
"
"                                             p_sys_ls_no,
"
"                                             NULL,
"
"                                             p_ser_no,
"
"                                             NULL,
"
"                                             'PR',
"
"                                             p_user
"
"
"
"                                            );
"
"
"
"
"
"
"
"                    UPDATE prod_ord_oper_status
"
"                       SET pros_ins_proc = 0,
"
"                           pros_sel_flag = 'N',
"
"                           pros_user = NULL
"
"                      WHERE pros_bu = p_bu
"
"                        AND pros_plnt = p_plnt
"
"                        AND pros_ord_no = p_prod_ord_no
"
"                        AND pros_ser_no = p_ser_no
"
"                        AND pros_sys_ls_no = p_sys_ls_no
"
"                        AND pros_sf_code = p_sf_code;
"
"
"
"                    UPDATE prod_ord_trans_record
"
"                       SET potr_ins_proc =0,
"
"                           potr_sel_flag = 'N',
"
"                           potr_user = NULL
"
"                      WHERE potr_bu = p_bu
"
"                        AND potr_plnt = p_plnt
"
"                        AND potr_ord_no = p_prod_ord_no
"
"                        AND potr_ser_no = p_ser_no
"
"                        AND potr_sys_ls_no = p_sys_ls_no
"
"                        AND potr_sf_code = p_sf_code;
"
"
"
"
"
"            END IF;
"
"
"
"        END IF;
"
"        END IF;
"
"
"
"
"
"        -- eshwar queue updation because of raw material requested from different warehouse
"
"                                proc_upd_oprn_status_qtys(
"
"                                                     p_bu,
"
"                                                     p_plnt,
"
"                                                     p_loc_id,
"
"                                                     p_prod_ord_no,
"
"                                                     p_process_id,
"
"                                                     p_process_ln_seq,
"
"                                                     p_sf_code,
"
"                                                     -p_comp_qty,
"
"                                                     p_comp_qty,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     0,
"
"                                                     p_sys_ls_no,
"
"                                                     NULL,
"
"                                                     p_ser_no,
"
"                                                     NULL,
"
"                                                     'PR',
"
"                                                     p_user
"
"                                                    );
"
"
"
"
"
"
"
"                            UPDATE prod_ord_oper_status
"
"                               SET pros_ins_proc = 0,
"
"                                   pros_sel_flag = 'N',
"
"                                   pros_user = NULL
"
"                              WHERE pros_bu = p_bu
"
"                                AND pros_plnt = p_plnt
"
"                                AND pros_ord_no = p_prod_ord_no
"
"                                AND pros_ser_no = p_ser_no
"
"                                AND pros_sys_ls_no = p_sys_ls_no
"
"                                AND pros_sf_code = p_sf_code;
"
"
"
"                            UPDATE prod_ord_trans_record
"
"                               SET potr_ins_proc =0,
"
"                                   potr_sel_flag = 'N',
"
"                                   potr_user = NULL
"
"                              WHERE potr_bu = p_bu
"
"                                AND potr_plnt = p_plnt
"
"                                AND potr_ord_no = p_prod_ord_no
"
"                                AND potr_ser_no = p_ser_no
"
"                                AND potr_sys_ls_no = p_sys_ls_no
"
"                        AND potr_sf_code = p_sf_code;
"
"
"
"
"
"        IF v_start_no <> v_end_no THEN
"
"        --RAISE_APPLICATION_ERROR(-20999,'HRM'||' ' ||v_start_no ||' to '||v_end_no);
"
"            p_mr_no := v_start_no ||' to '||v_end_no;
"
"        ELSE
"
"            p_mr_no := v_start_no;
"
"        END IF;
"
"
"
"    ELSE
"
"                    /*Queue Updation*/
"
"
"
"            v_comp_cre_flag := 'Y';
"
"
"
"                            proc_upd_oprn_status_qtys
"
"                                        (
"
"                                         p_bu,
"
"                                         p_plnt,
"
"                                         p_loc_id,
"
"                                         p_prod_ord_no,
"
"                                         p_process_id,
"
"                                         p_process_ln_seq,
"
"                                         p_sf_code,
"
"                                         -p_comp_qty,
"
"                                         p_comp_qty,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         p_sys_ls_no,
"
"                                         NULL,
"
"                                         p_ser_no,
"
"                                         NULL,
"
"                                         'PR',
"
"                                         p_user,
"
"                                         NULL
"
"                                        );
"
"
"
"    END IF;
"
"
"
"        p_comp_res := v_comp_cre_flag;
"
"
"
"    CLOSE c_chk_type;
"
"
"
"
"
"    END proc_cre_mr_eqm_ser_nos;
"
"END    pkg_mr_cre_frm_prodn;"
/
