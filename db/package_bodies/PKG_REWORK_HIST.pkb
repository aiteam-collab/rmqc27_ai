CREATE OR REPLACE
"PACKAGE BODY pkg_rework_hist
"
"IS
"
"
"
"    PROCEDURE proc_ins_rework_order_hist(p_bu            VARCHAR2,
"
"                         p_plnt            VARCHAR2,
"
"                         p_doc_no        VARCHAR2,
"
"                         p_user            VARCHAR2,
"
"                         p_res    OUT        VARCHAR2
"
"                        )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT *
"
"      FROM rework_order_hd
"
"     WHERE rwohd_bu = p_bu
"
"       AND rwohd_plnt = p_plnt
"
"       AND rwohd_ord_no = p_doc_no;
"
"
"
"       CURSOR c2
"
"     IS
"
"     SELECT *
"
"      FROM rework_order_ser_dtls
"
"     WHERE rosd_bu = p_bu
"
"       AND rosd_plnt = p_plnt
"
"       AND rosd_rwk_ord_no = p_doc_no;
"
"
"
"        CURSOR c3
"
"            IS
"
"            SELECT *
"
"             FROM rework_ord_mat_req_dtls
"
"            WHERE romrd_bu = p_bu
"
"              AND romrd_plnt = p_plnt
"
"              AND romrd_rwk_ord_no = p_doc_no;
"
"
"
"    BEGIN
"
"
"
"    p_res := 'N';
"
"
"
"        FOR cr1 IN c1
"
"        LOOP
"
"               INSERT INTO rework_order_hd_hist(rwohdh_bu                      ,
"
"                            rwohdh_plnt                    ,
"
"                            rwohdh_ord_no                  ,
"
"                            rwohdh_date                    ,
"
"                            rwohdh_prod_id                 ,
"
"                            rwohdh_prod_rev                ,
"
"                            rwohdh_prod_ord_no             ,
"
"                            rwohdh_rework_qty              ,
"
"                            rwohdh_status                  ,
"
"                            rwohdh_line_id                 ,
"
"                            rwohdh_rec_source              ,
"
"                            rwohdh_ord_type                ,
"
"                            rwohdh_dis_assemble            ,
"
"                            rwohdh_prod_comp_qty           ,
"
"                            rwohdh_scrap_qty               ,
"
"                            rwohdh_repair_qty              ,
"
"                            rwohdh_in_proc_qty             ,
"
"                            rwohdh_sel_flag                ,
"
"                            rwohdh_user                    ,
"
"                            rwohdh_rcpt_seq_no             ,
"
"                            rwohdh_prim_rwk_qty            ,
"
"                            rwohdh_secon_rwk_qty           ,
"
"                            rwohdh_rcpt_store_id           ,
"
"                            rwohdh_sf_code                 ,
"
"                            rwohdh_cre_by                  ,
"
"                            rwohdh_cre_date                ,
"
"                            rwohdh_upd_by                  ,
"
"                            rwohdh_upd_date                ,
"
"                            rwohdh_proc_qty                ,
"
"                            rwohdh_reference               ,
"
"                            rwohdh_prod_ord_type           ,
"
"                            rwohdh_sal_ord_type            ,
"
"                            rwohdh_sou_doc_pfx             ,
"
"                            rwohdh_sou_doc_no              ,
"
"                            rwohdh_sou_doc_line_no         ,
"
"                            rwohdh_lot_no                  ,
"
"                            rwohdh_serial_no               ,
"
"                            rwohdh_so_pfx                  ,
"
"                            rwohdh_so_no                   ,
"
"                            rwohdh_so_seq_no               ,
"
"                            rwohdh_so_sub_seq_no           ,
"
"                            rwohdh_proj_id                 ,
"
"                            rwohdh_task_id                 ,
"
"                            rwohdh_source_type             ,
"
"                            rwohdh_source_id               ,
"
"                            rwohdh_pp_no                   ,
"
"                            rwohdh_pp_seq_no               ,
"
"                            rwohdh_sys_ls_no               ,
"
"                            rwohdh_route_card_no           ,
"
"                            rwohdh_vi_flag                 ,
"
"                            rwohdh_oprn_id                 ,
"
"                            rwohdh_so_schld_desc           ,
"
"                            rwohdh_ppr_rwk_qty             ,
"
"                            rwohdh_mr_cre_flag               ,
"
"                            rwohdh_mr_no                      ,
"
"                            rwohdh_standby_flag               ,
"
"                            rwohdh_pp_rev                  ,
"
"                            rwohdh_csr_no                  ,
"
"                            rwohdh_stl_doc_no              ,
"
"                            rwohdh_stl_seq_no              ,
"
"                            rwohdh_cust_id ,
"
"                            rwohdh_mat_type   ,
"
"                            rwohdh_plnt_loc_id  ,
"
"                            rwohdh_ord_pfx  ,
"
"                            rwohdh_cre_ip_addr  ,
"
"                            rwohdh_cre_os_user  ,
"
"                            rwohdh_upd_ip_addr  ,
"
"                            rwohdh_upd_os_user  ,
"
"                            rwohdh_oprn_ln_seq  ,
"
"                            rwohdh_cre_emp_id   ,
"
"                            rwohdh_upd_emp_id
"
"                            )
"
"                     VALUES(cr1.rwohd_bu                   ,
"
"                            cr1.rwohd_plnt                 ,
"
"                            cr1.rwohd_ord_no               ,
"
"                            cr1.rwohd_date                 ,
"
"                            cr1.rwohd_prod_id              ,
"
"                            cr1.rwohd_prod_rev             ,
"
"                            cr1.rwohd_prod_ord_no          ,
"
"                            cr1.rwohd_rework_qty           ,
"
"                            cr1.rwohd_status               ,
"
"                            cr1.rwohd_line_id              ,
"
"                            cr1.rwohd_rec_source           ,
"
"                            cr1.rwohd_ord_type             ,
"
"                            cr1.rwohd_dis_assemble         ,
"
"                            cr1.rwohd_prod_comp_qty        ,
"
"                            cr1.rwohd_scrap_qty            ,
"
"                            cr1.rwohd_repair_qty           ,
"
"                            cr1.rwohd_in_proc_qty          ,
"
"                            cr1.rwohd_sel_flag             ,
"
"                            cr1.rwohd_user                 ,
"
"                            cr1.rwohd_rcpt_seq_no          ,
"
"                            cr1.rwohd_prim_rwk_qty         ,
"
"                            cr1.rwohd_secon_rwk_qty        ,
"
"                            cr1.rwohd_rcpt_store_id        ,
"
"                            cr1.rwohd_sf_code              ,
"
"                            cr1.rwohd_cre_by               ,
"
"                            cr1.rwohd_cre_date             ,
"
"                            cr1.rwohd_upd_by               ,
"
"                            cr1.rwohd_upd_date             ,
"
"                            cr1.rwohd_proc_qty             ,
"
"                            cr1.rwohd_reference            ,
"
"                            cr1.rwohd_prod_ord_type        ,
"
"                            cr1.rwohd_sal_ord_type         ,
"
"                            cr1.rwohd_sou_doc_pfx          ,
"
"                            cr1.rwohd_sou_doc_no           ,
"
"                            cr1.rwohd_sou_doc_line_no      ,
"
"                            cr1.rwohd_lot_no               ,
"
"                            cr1.rwohd_serial_no            ,
"
"                            cr1.rwohd_so_pfx               ,
"
"                            cr1.rwohd_so_no                ,
"
"                            cr1.rwohd_so_seq_no            ,
"
"                            cr1.rwohd_so_sub_seq_no        ,
"
"                            cr1.rwohd_proj_id              ,
"
"                            cr1.rwohd_task_id              ,
"
"                            cr1.rwohd_source_type          ,
"
"                            cr1.rwohd_source_id            ,
"
"                            cr1.rwohd_pp_no                ,
"
"                            cr1.rwohd_pp_seq_no            ,
"
"                            cr1.rwohd_sys_ls_no            ,
"
"                            cr1.rwohd_route_card_no        ,
"
"                            cr1.rwohd_vi_flag              ,
"
"                            cr1.rwohd_oprn_id              ,
"
"                            cr1.rwohd_so_schld_desc        ,
"
"                            cr1.rwohd_ppr_rwk_qty            ,
"
"                            cr1.rwohd_mr_cre_flag          ,
"
"                            cr1.rwohd_mr_no                ,
"
"                            cr1.rwohd_standby_flag         ,
"
"                            cr1.rwohd_pp_rev               ,
"
"                            cr1.rwohd_csr_no               ,
"
"                            cr1.rwohd_stl_doc_no           ,
"
"                            cr1.rwohd_stl_seq_no           ,
"
"                            cr1.rwohd_cust_id ,
"
"                            cr1.rwohd_mat_type,
"
"                            cr1.rwohd_plnt_loc_id,
"
"                            cr1.rwohd_ord_pfx ,
"
"                            cr1.rwohd_cre_ip_addr  ,
"
"                            cr1.rwohd_cre_os_user  ,
"
"                            cr1.rwohd_upd_ip_addr  ,
"
"                            cr1.rwohd_upd_os_user  ,
"
"                            cr1.rwohd_oprn_ln_seq  ,
"
"                            cr1.rwohd_cre_emp_id   ,
"
"                            cr1.rwohd_upd_emp_id
"
"                             );
"
"
"
"        END LOOP c1;
"
"
"
"        FOR cr2 in c2
"
"        LOOP
"
"            INSERT INTO rework_order_ser_dtls_hist(
"
"                            rosdh_bu                       ,
"
"                            rosdh_plnt                     ,
"
"                            rosdh_rwk_ord_no               ,
"
"                            rosdh_seq_no                   ,
"
"                            rosdh_ser_no                   ,
"
"                            rosdh_sys_ls_no                ,
"
"                            rosdh_source_id                ,
"
"                            rosdh_source_type              ,
"
"                            rosdh_ser_status               ,
"
"                            rosdh_cre_by                   ,
"
"                            rosdh_cre_date                 ,
"
"                            rosdh_upd_by                   ,
"
"                            rosdh_upd_date                 ,
"
"                            rosdh_qty                      ,
"
"                            rosdh_sel_flag                 ,
"
"                            rosdh_sel_user                 ,
"
"                            rosdh_prod_ord_no              ,
"
"                            rosdh_repair_qty               ,
"
"                            rosdh_scrap_qty                ,
"
"                            rosdh_dis_assemble             ,
"
"                            rosdh_in_proc_qty              ,
"
"                            rosdh_proc_qty                 ,
"
"                            rosdh_prim_rwk_qty             ,
"
"                            rosdh_secon_rwk_qty
"
"                                 )VALUES
"
"                             (  cr2.rosd_bu                ,
"
"                            cr2.rosd_plnt              ,
"
"                            cr2.rosd_rwk_ord_no        ,
"
"                            cr2.rosd_seq_no            ,
"
"                            cr2.rosd_ser_no            ,
"
"                            cr2.rosd_sys_ls_no         ,
"
"                            cr2.rosd_source_id         ,
"
"                            cr2.rosd_source_type       ,
"
"                            cr2.rosd_ser_status        ,
"
"                            cr2.rosd_cre_by            ,
"
"                            cr2.rosd_cre_date          ,
"
"                            cr2.rosd_upd_by            ,
"
"                            cr2.rosd_upd_date          ,
"
"                            cr2.rosd_qty               ,
"
"                            cr2.rosd_sel_flag          ,
"
"                            cr2.rosd_sel_user          ,
"
"                            cr2.rosd_prod_ord_no       ,
"
"                            cr2.rosd_repair_qty        ,
"
"                            cr2.rosd_scrap_qty         ,
"
"                            cr2.rosd_dis_assemble      ,
"
"                            cr2.rosd_in_proc_qty       ,
"
"                            cr2.rosd_proc_qty          ,
"
"                            cr2.rosd_prim_rwk_qty      ,
"
"                            cr2.rosd_secon_rwk_qty
"
"                            );
"
"                END LOOP c2;
"
"
"
"
"
"                FOR cr3 IN c3
"
"                 LOOP
"
"                          INSERT INTO  rework_ord_mat_req_dtls_hist(
"
"                                            romrdh_bu              ,
"
"                                            romrdh_plnt            ,
"
"                                            romrdh_rwk_ord_no      ,
"
"                                            romrdh_seq_no          ,
"
"                                            romrdh_prod_id         ,
"
"                                            romrdh_prod_rev        ,
"
"                                            romrdh_sou_store_id    ,
"
"                                            romrdh_uom             ,
"
"                                            romrdh_rqrd_qty        ,
"
"                                            romrdh_cre_by          ,
"
"                                            romrdh_cre_date        ,
"
"                                            romrdh_upd_by          ,
"
"                                            romrdh_upd_date        ,
"
"                                            romrdh_cons_store
"
"                                            )VALUES
"
"                                               ( cr3.romrd_bu          ,
"
"                                             cr3.romrd_plnt        ,
"
"                                             cr3.romrd_rwk_ord_no  ,
"
"                                             cr3.romrd_seq_no      ,
"
"                                             cr3.romrd_prod_id     ,
"
"                                             cr3.romrd_prod_rev    ,
"
"                                             cr3.romrd_sou_store_id,
"
"                                             cr3.romrd_uom         ,
"
"                                             cr3.romrd_rqrd_qty    ,
"
"                                             cr3.romrd_cre_by      ,
"
"                                             cr3.romrd_cre_date    ,
"
"                                             cr3.romrd_upd_by      ,
"
"                                             cr3.romrd_upd_date    ,
"
"                                             cr3.romrd_cons_store
"
"                                            );
"
"
"
"                END LOOP c3;
"
"
"
"                p_res := 'Y';
"
"
"
"            IF p_res = 'Y' THEN
"
"
"
"    --raise_application_error(-20999,'HRM'||'/'||p_doc_no);
"
"                DELETE
"
"                  FROM rework_order_ser_dtls
"
"                 WHERE rosd_bu = p_bu
"
"                   AND rosd_plnt = p_plnt
"
"                   AND rosd_rwk_ord_no = p_doc_no;
"
"
"
"                DELETE
"
"                  FROM rework_ord_mat_req_dtls
"
"                 WHERE romrd_bu = p_bu
"
"                   AND romrd_plnt = p_plnt
"
"                   AND romrd_rwk_ord_no = p_doc_no;
"
"
"
"                DELETE
"
"                  FROM rework_order_hd
"
"                 WHERE rwohd_bu = p_bu
"
"                   AND rwohd_plnt = p_plnt
"
"                   AND rwohd_ord_no = p_doc_no;
"
"
"
"                 --  RAISE_APPLICATION_ERROR(-20999,'HRM21');
"
"
"
"            END IF;
"
"
"
"    END proc_ins_rework_order_hist;
"
"
"
"    PROCEDURE proc_ins_rework_comp_hist(p_bu            VARCHAR2,
"
"                        p_plnt            VARCHAR2,
"
"                        p_doc_no            VARCHAR2,
"
"                        p_user            VARCHAR2,
"
"                        p_res    OUT        VARCHAR2
"
"                        )
"
"    IS
"
"    CURSOR c0
"
"    IS
"
"    SELECT *
"
"      FROM rework_order_comp_hd_hist
"
"     WHERE rwochdh_bu = p_bu
"
"       AND rwochdh_plnt = p_plnt
"
"       AND rwochdh_doc_no = p_doc_no;
"
"
"
"    CURSOR c1
"
"    IS
"
"    SELECT *
"
"      FROM rework_order_comp_hd
"
"     WHERE rwochd_bu = p_bu
"
"       AND rwochd_plnt = p_plnt
"
"       AND rwochd_doc_no = p_doc_no;
"
"
"
"    CURSOR c2
"
"    IS
"
"    SELECT *
"
"      FROM rework_ord_res_usage
"
"     WHERE roru_bu = p_bu
"
"       AND roru_plnt = p_plnt
"
"       AND roru_doc_no = p_doc_no;
"
"
"
"    CURSOR c3
"
"    IS
"
"    SELECT *
"
"      FROM rework_order_cons_ln
"
"     WHERE rwocln_bu = p_bu
"
"       AND rwocln_plnt = p_plnt
"
"       AND rwocln_doc_no = p_doc_no;
"
"
"
"    CURSOR c4
"
"    IS
"
"    SELECT *
"
"      FROM rework_comp_scrap
"
"     WHERE rcs_bu = p_bu
"
"       AND rcs_plnt = p_plnt
"
"       AND rcs_doc_no = p_doc_no;
"
"
"
"    CURSOR c5
"
"    IS
"
"    SELECT *
"
"      FROM rework_comp_bin_dtls
"
"     WHERE rcbd_bu = p_bu
"
"       AND rcbd_plnt = p_plnt
"
"       AND rcbd_doc_no = p_doc_no;
"
"
"
"    CURSOR c6
"
"    IS
"
"    SELECT *
"
"      FROM rework_order_lot_ser_dtls
"
"     WHERE rwolsd_bu = p_bu
"
"       AND rwolsd_plnt = p_plnt
"
"       AND rwolsd_doc_no = p_doc_no;
"
"
"
"    CURSOR c7
"
"    IS
"
"    SELECT *
"
"      FROM rework_order_comp_dtl
"
"     WHERE rwocd_bu     = p_bu
"
"       AND rwocd_plnt     = p_plnt
"
"       AND rwocd_doc_no = p_doc_no;
"
"
"
"    cr0     c0%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"        p_res := 'N';
"
"
"
"        OPEN c0;
"
"        FETCH c0 INTO cr0;
"
"
"
"        IF c0%NOTFOUND THEN
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"
"
"                    INSERT INTO rework_order_comp_hd_hist
"
"                                    (rwochdh_bu            ,
"
"                                    rwochdh_plnt           ,
"
"                                    rwochdh_doc_no         ,
"
"                                    rwochdh_date           ,
"
"                                    rwochdh_rw_ord_no      ,
"
"                                    rwochdh_prod_id        ,
"
"                                    rwochdh_prod_rev       ,
"
"                                    rwochdh_comp_qty       ,
"
"                                    rwochdh_scrap_qty      ,
"
"                                    rwochdh_status         ,
"
"                                    rwochdh_line_id        ,
"
"                                    rwochdh_prod_ord_no    ,
"
"                                    rwochdh_dis_assemble   ,
"
"                                    rwochdh_ord_type       ,
"
"                                    rwochdh_material_cost  ,
"
"                                    rwochdh_res_cost       ,
"
"                                    rwochdh_ot_cost        ,
"
"                                    rwochdh_unit_cost      ,
"
"                                    rwochdh_alloc_flag     ,
"
"                                    rwochdh_rcpt_line      ,
"
"                                    rwochdh_so_pfx         ,
"
"                                    rwochdh_so_no          ,
"
"                                    rwochdh_so_seq_no      ,
"
"                                    rwochdh_so_sub_seq_no  ,
"
"                                    rwochdh_type           ,
"
"                                    rwochdh_gen_cons       ,
"
"                                    rwochdh_prod_comp_qty  ,
"
"                                    rwochdh_conv_factor    ,
"
"                                    rwochdh_comp_stk_qty   ,
"
"                                    rwochdh_prod_comp_stk_qty       ,
"
"                                    rwochdh_year           ,
"
"                                    rwochdh_period         ,
"
"                                    rwochdh_sf_code        ,
"
"                                    rwochdh_cre_by         ,
"
"                                    rwochdh_cre_date       ,
"
"                                    rwochdh_upd_by         ,
"
"                                    rwochdh_upd_date       ,
"
"                                    rwochdh_mach_id        ,
"
"                                    rwochdh_opt_id         ,
"
"                                    rwochdh_shift_id       ,
"
"                                    rwochdh_trans_qty      ,
"
"                                    rwochdh_source         ,
"
"                                    rwochdh_sou_store      ,
"
"                                    rwochdh_target_store   ,
"
"                                    rwochdh_lot_no         ,
"
"                                    rwochdh_ser_no         ,
"
"                                    rwochdh_source_id      ,
"
"                                    rwochdh_source_type    ,
"
"                                    rwochdh_comp_sf_code   ,
"
"                                    rwochdh_batch_id       ,
"
"                                    rwochdh_reference      ,
"
"                                    rwochdh_prod_ord_type  ,
"
"                                    rwochdh_cust_id        ,
"
"                                    rwochdh_sal_ord_type   ,
"
"                                    rwochdh_pp_no          ,
"
"                                    rwochdh_pp_rev         ,
"
"                                    rwochdh_pp_seq_no      ,
"
"                                    rwochdh_source_pfx     ,
"
"                                    rwochdh_source_no      ,
"
"                                    rwochdh_source_line    ,
"
"                                    rwochdh_proj_id        ,
"
"                                    rwochdh_task_id        ,
"
"                                    rwochdh_qc_pfx         ,
"
"                                    rwochdh_qc_no          ,
"
"                                    rwochdh_rej_qty        ,
"
"                                    rwochdh_qc_flag        ,
"
"                                    rwochdh_sys_ls_no      ,
"
"                                    rwochdh_route_card_no  ,
"
"                                    rwochdh_vi_flag        ,
"
"                                    rwochdh_oprn_id        ,
"
"                                    rwochdh_so_schld_desc  ,
"
"                                    rwochdh_inc_jrnl       ,
"
"                                    rwochdh_imo_rplc_type  ,
"
"                                    rwochdh_imo_no         ,
"
"                                    rwochdh_buffer         ,
"
"                                    rwochdh_sel_flag       ,
"
"                                    rwochdh_sel_user       ,
"
"                                    rwochdh_dc_no          ,
"
"                                    rowchdh_mr_cre_flag    ,
"
"                                    rwochdh_chrg_flag      ,
"
"                                    rwochdh_ber_reason     ,
"
"                                    rwochdh_standby_flag   ,
"
"                                    rwochdh_stock_type     ,
"
"                                    rwochdh_opt_id1        ,
"
"                                    rwochdh_opt_id2        ,
"
"                                    rwochdh_csr_no         ,
"
"                                    rwochdh_adv_replc_flag     ,
"
"                                    rwochdh_mat_type    ,
"
"                                    rwochdh_miv_no        ,
"
"                                    rwochdh_mrv_no   ,
"
"                                    rwochdh_scr_miv_no,
"
"                                    rwochdh_scr_mrv_no,
"
"                                    rwochdh_dis_miv_no,
"
"                                    rwochdh_dis_mrv_no,
"
"                                    rwochdh_dis_scr_miv_no,
"
"                                    rwochdh_dis_scr_mrv_no,
"
"                                    rwochdh_dis_rej_miv_no,
"
"                                    rwochdh_dis_rej_mrv_no  ,
"
"                                    rwochdh_loc_id ,
"
"                                    rwochdh_ord_pfx     ,
"
"                                    rwochdh_cre_ip_addr  ,
"
"                                    rwochdh_cre_os_user,
"
"                                    rwochdh_upd_ip_addr,
"
"                                    rwochdh_upd_os_user,
"
"                                    rwochdh_cre_emp_id,
"
"                                    rwochdh_upd_emp_id
"
"                                    )
"
"                                  VALUES(cr1.rwochd_bu            ,
"
"                                    cr1.rwochd_plnt           ,
"
"                                    cr1.rwochd_doc_no         ,
"
"                                    cr1.rwochd_date           ,
"
"                                    cr1.rwochd_rw_ord_no      ,
"
"                                    cr1.rwochd_prod_id        ,
"
"                                    cr1.rwochd_prod_rev       ,
"
"                                    cr1.rwochd_comp_qty       ,
"
"                                    cr1.rwochd_scrap_qty      ,
"
"                                    cr1.rwochd_status         ,
"
"                                    cr1.rwochd_line_id        ,
"
"                                    cr1.rwochd_prod_ord_no    ,
"
"                                    cr1.rwochd_dis_assemble   ,
"
"                                    cr1.rwochd_ord_type       ,
"
"                                    cr1.rwochd_material_cost  ,
"
"                                    cr1.rwochd_res_cost       ,
"
"                                    cr1.rwochd_ot_cost        ,
"
"                                    cr1.rwochd_unit_cost      ,
"
"                                    cr1.rwochd_alloc_flag     ,
"
"                                    cr1.rwochd_rcpt_line      ,
"
"                                    cr1.rwochd_so_pfx         ,
"
"                                    cr1.rwochd_so_no          ,
"
"                                    cr1.rwochd_so_seq_no      ,
"
"                                    cr1.rwochd_so_sub_seq_no  ,
"
"                                    cr1.rwochd_type           ,
"
"                                    cr1.rwochd_gen_cons       ,
"
"                                    cr1.rwochd_prod_comp_qty  ,
"
"                                    cr1.rwochd_conv_factor    ,
"
"                                    cr1.rwochd_comp_stk_qty   ,
"
"                                    cr1.rwochd_prod_comp_stk_qty       ,
"
"                                    cr1.rwochd_year           ,
"
"                                    cr1.rwochd_period         ,
"
"                                    cr1.rwochd_sf_code        ,
"
"                                    cr1.rwochd_cre_by         ,
"
"                                    cr1.rwochd_cre_date       ,
"
"                                    cr1.rwochd_upd_by         ,
"
"                                    cr1.rwochd_upd_date       ,
"
"                                    cr1.rwochd_mach_id        ,
"
"                                    cr1.rwochd_opt_id         ,
"
"                                    cr1.rwochd_shift_id       ,
"
"                                    cr1.rwochd_trans_qty      ,
"
"                                    cr1.rwochd_source         ,
"
"                                    cr1.rwochd_sou_store      ,
"
"                                    cr1.rwochd_target_store   ,
"
"                                    cr1.rwochd_lot_no         ,
"
"                                    cr1.rwochd_ser_no         ,
"
"                                    cr1.rwochd_source_id      ,
"
"                                    cr1.rwochd_source_type    ,
"
"                                    cr1.rwochd_comp_sf_code   ,
"
"                                    cr1.rwochd_batch_id       ,
"
"                                    cr1.rwochd_reference      ,
"
"                                    cr1.rwochd_prod_ord_type  ,
"
"                                    cr1.rwochd_cust_id        ,
"
"                                    cr1.rwochd_sal_ord_type   ,
"
"                                    cr1.rwochd_pp_no          ,
"
"                                    cr1.rwochd_pp_rev         ,
"
"                                    cr1.rwochd_pp_seq_no      ,
"
"                                    cr1.rwochd_source_pfx     ,
"
"                                    cr1.rwochd_source_no      ,
"
"                                    cr1.rwochd_source_line    ,
"
"                                    cr1.rwochd_proj_id        ,
"
"                                    cr1.rwochd_task_id        ,
"
"                                    cr1.rwochd_qc_pfx         ,
"
"                                    cr1.rwochd_qc_no          ,
"
"                                    cr1.rwochd_rej_qty        ,
"
"                                    cr1.rwochd_qc_flag        ,
"
"                                    cr1.rwochd_sys_ls_no      ,
"
"                                    cr1.rwochd_route_card_no  ,
"
"                                    cr1.rwochd_vi_flag        ,
"
"                                    cr1.rwochd_oprn_id        ,
"
"                                    cr1.rwochd_so_schld_desc  ,
"
"                                    cr1.rwochd_inc_jrnl       ,
"
"                                    cr1.rwochd_imo_rplc_type  ,
"
"                                    cr1.rwochd_imo_no         ,
"
"                                    cr1.rwochd_buffer         ,
"
"                                    cr1.rwochd_sel_flag       ,
"
"                                    cr1.rwochd_sel_user       ,
"
"                                    cr1.rwochd_dc_no          ,
"
"                                    cr1.rowchd_mr_cre_flag    ,
"
"                                    cr1.rwochd_chrg_flag      ,
"
"                                    cr1.rwochd_ber_reason     ,
"
"                                    cr1.rwochd_standby_flag   ,
"
"                                    cr1.rwochd_stock_type     ,
"
"                                    cr1.rwochd_opt_id1        ,
"
"                                    cr1.rwochd_opt_id2        ,
"
"                                    cr1.rwochd_csr_no         ,
"
"                                    cr1.rwochd_adv_replc_flag  ,
"
"                                    cr1.rwochd_mat_type,
"
"                                    cr1.rwochd_miv_no        ,
"
"                                    cr1.rwochd_mrv_no   ,
"
"                                    cr1.rwochd_scr_miv_no,
"
"                                    cr1.rwochd_scr_mrv_no,
"
"                                    cr1.rwochd_dis_miv_no,
"
"                                    cr1.rwochd_dis_mrv_no,
"
"                                    cr1.rwochd_dis_scr_miv_no,
"
"                                    cr1.rwochd_dis_scr_mrv_no,
"
"                                    cr1.rwochd_dis_rej_miv_no,
"
"                                    cr1.rwochd_dis_rej_mrv_no  ,
"
"                                    cr1.rwochd_loc_id  ,
"
"                                    cr1.rwochd_comp_pfx  ,
"
"                                    cr1.rwochd_cre_ip_addr  ,
"
"                                    cr1.rwochd_cre_os_user,
"
"                                    cr1.rwochd_upd_ip_addr,
"
"                                    cr1.rwochd_upd_os_user,
"
"                                    cr1.rwochd_cre_emp_id,
"
"                                    cr1.rwochd_upd_emp_id
"
"                                    );
"
"
"
"                FOR cr7 IN c7
"
"                   LOOP
"
"             INSERT INTO rework_order_comp_dtl_hist(rwocdh_bu            ,
"
"                                rwocdh_plnt                 ,
"
"                                rwocdh_doc_no               ,
"
"                                rwocdh_seq_no               ,
"
"                                rwocdh_rw_ord_no            ,
"
"                                rwocdh_prod_ord_no          ,
"
"                                rwocdh_sou_sf_code          ,
"
"                                rwocdh_sou_lot_no           ,
"
"                                rwocdh_sou_sys_ls_no        ,
"
"                                rwocdh_rwk_comp_qty         ,
"
"                                rwocdh_rwk_repair_qty       ,
"
"                                rwocdh_rwk_scrap_qty        ,
"
"                                rwocdh_rwk_dis_ass_qty      ,
"
"                                rwocdh_sou_unit_cost        ,
"
"                                rwocdh_sou_tot_cost         ,
"
"                                rwocdh_cre_by               ,
"
"                                rwocdh_cre_ip_addr          ,
"
"                                rwocdh_cre_os_user          ,
"
"                                rwocdh_cre_emp_id           ,
"
"                                rwocdh_cre_date             ,
"
"                                rwocdh_upd_by               ,
"
"                                rwocdh_upd_ip_addr          ,
"
"                                rwocdh_upd_os_user          ,
"
"                                rwocdh_upd_emp_id           ,
"
"                                rwocdh_upd_date             ,
"
"                                rwocdh_source_id            ,
"
"                                rwocdh_source_type          ,
"
"                                rwocdh_tar_store            ,
"
"                                rwocdh_next_oprn_id         ,
"
"                                rwocdh_next_oprn_ln_seq     ,
"
"                                rwocdh_tar_sf_code          ,
"
"                                rwocdh_mat_cost             ,
"
"                                rwocdh_ot_cost              ,
"
"                                rwocdh_res_cost             ,
"
"                                rwocdh_unit_cost            ,
"
"                                rwocdh_rwk_rej_qty          ,
"
"                                rwocdh_so_pfx               ,
"
"                                rwocdh_so_no                ,
"
"                                rwocdh_so_seq_no            ,
"
"                                rwocdh_so_sub_seq_no        ,
"
"                                rwocdh_proj_id              ,
"
"                                rwocdh_task_id              ,
"
"                                rwocdh_so_schld_desc        ,
"
"                                rwocdh_source_pfx           ,
"
"                                rwocdh_source_no            ,
"
"                                rwocdh_source_line          ,
"
"                                rwocdh_miv_no               ,
"
"                                rwocdh_mrv_no               ,
"
"                                rwocdh_scr_miv_no           ,
"
"                                rwocdh_scr_mrv_no           ,
"
"                                rwocdh_dis_miv_no           ,
"
"                                rwocdh_dis_mrv_no           ,
"
"                                rwocdh_dis_rej_miv_no       ,
"
"                                rwocdh_dis_rej_mrv_no       ,
"
"                                rwocdh_dis_scr_miv_no       ,
"
"                                rwocdh_dis_scr_mrv_no       ,
"
"                                rwocdh_rej_miv_no           ,
"
"                                rwocdh_rej_mrv_no           ,
"
"                                rwocdh_status               ,
"
"                                rwocdh_pp_plan_no           ,
"
"                                rwocdh_act_oprn_id          ,
"
"                                rwocdh_act_ln_seq           ,
"
"                                rwocdh_act_sf_code          ,
"
"                                rwocdh_act_store_id
"
"                                                    )
"
"                         VALUES(cr7.rwocd_bu            ,
"
"                                cr7.rwocd_plnt                 ,
"
"                                cr7.rwocd_doc_no               ,
"
"                                cr7.rwocd_seq_no               ,
"
"                                cr7.rwocd_rw_ord_no            ,
"
"                                cr7.rwocd_prod_ord_no          ,
"
"                                cr7.rwocd_sou_sf_code          ,
"
"                                cr7.rwocd_sou_lot_no           ,
"
"                                cr7.rwocd_sou_sys_ls_no        ,
"
"                                cr7.rwocd_rwk_comp_qty         ,
"
"                                cr7.rwocd_rwk_repair_qty       ,
"
"                                cr7.rwocd_rwk_scrap_qty        ,
"
"                                cr7.rwocd_rwk_dis_ass_qty      ,
"
"                                cr7.rwocd_sou_unit_cost        ,
"
"                                cr7.rwocd_sou_tot_cost         ,
"
"                                cr7.rwocd_cre_by               ,
"
"                                cr7.rwocd_cre_ip_addr          ,
"
"                                cr7.rwocd_cre_os_user          ,
"
"                                cr7.rwocd_cre_emp_id           ,
"
"                                cr7.rwocd_cre_date             ,
"
"                                cr7.rwocd_upd_by               ,
"
"                                cr7.rwocd_upd_ip_addr          ,
"
"                                cr7.rwocd_upd_os_user          ,
"
"                                cr7.rwocd_upd_emp_id           ,
"
"                                cr7.rwocd_upd_date             ,
"
"                                cr7.rwocd_source_id            ,
"
"                                cr7.rwocd_source_type          ,
"
"                                cr7.rwocd_tar_store            ,
"
"                                cr7.rwocd_next_oprn_id         ,
"
"                                cr7.rwocd_next_oprn_ln_seq     ,
"
"                                cr7.rwocd_tar_sf_code          ,
"
"                                cr7.rwocd_mat_cost             ,
"
"                                cr7.rwocd_ot_cost              ,
"
"                                cr7.rwocd_res_cost             ,
"
"                                cr7.rwocd_unit_cost            ,
"
"                                cr7.rwocd_rwk_rej_qty          ,
"
"                                cr7.rwocd_so_pfx               ,
"
"                                cr7.rwocd_so_no                ,
"
"                                cr7.rwocd_so_seq_no            ,
"
"                                cr7.rwocd_so_sub_seq_no        ,
"
"                                cr7.rwocd_proj_id              ,
"
"                                cr7.rwocd_task_id              ,
"
"                                cr7.rwocd_so_schld_desc        ,
"
"                                cr7.rwocd_source_pfx           ,
"
"                                cr7.rwocd_source_no            ,
"
"                                cr7.rwocd_source_line          ,
"
"                                cr7.rwocd_miv_no               ,
"
"                                cr7.rwocd_mrv_no               ,
"
"                                cr7.rwocd_scr_miv_no           ,
"
"                                cr7.rwocd_scr_mrv_no           ,
"
"                                cr7.rwocd_dis_miv_no           ,
"
"                                cr7.rwocd_dis_mrv_no           ,
"
"                                cr7.rwocd_dis_rej_miv_no       ,
"
"                                cr7.rwocd_dis_rej_mrv_no       ,
"
"                                cr7.rwocd_dis_scr_miv_no       ,
"
"                                cr7.rwocd_dis_scr_mrv_no       ,
"
"                                cr7.rwocd_rej_miv_no           ,
"
"                                cr7.rwocd_rej_mrv_no           ,
"
"                                cr7.rwocd_status               ,
"
"                                cr7.rwocd_pp_plan_no           ,
"
"                                cr7.rwocd_act_oprn_id          ,
"
"                                cr7.rwocd_act_ln_seq           ,
"
"                                cr7.rwocd_act_sf_code          ,
"
"                                cr7.rwocd_act_store_id
"
"                                    );
"
"           END LOOP c6;
"
"
"
"                FOR cr2 IN c2
"
"                LOOP
"
"
"
"
"
"                         INSERT INTO rework_ord_res_usage_hist
"
"                                            (
"
"                                            roruh_bu            ,
"
"                                         roruh_plnt          ,
"
"                                         roruh_doc_no        ,
"
"                                         roruh_seq_no        ,
"
"                                         roruh_dept_id       ,
"
"                                         roruh_oprn_id       ,
"
"                                         roruh_res_id        ,
"
"                                         roruh_date_from     ,
"
"                                         roruh_date_to       ,
"
"                                         roruh_uom           ,
"
"                                         roruh_units         ,
"
"                                         roruh_hrly_rate     ,
"
"                                         roruh_extend_rate   ,
"
"                                         roruh_cre_by        ,
"
"                                         roruh_cre_date      ,
"
"                                         roruh_upd_by        ,
"
"                                         roruh_upd_date
"
"                                         )
"
"                                     VALUES(cr2.roru_bu            ,
"
"                                        cr2.roru_plnt          ,
"
"                                        cr2.roru_doc_no        ,
"
"                                        cr2.roru_seq_no        ,
"
"                                        cr2.roru_dept_id       ,
"
"                                        cr2.roru_oprn_id       ,
"
"                                        cr2.roru_res_id        ,
"
"                                        cr2.roru_date_from     ,
"
"                                        cr2.roru_date_to       ,
"
"                                        cr2.roru_uom           ,
"
"                                        cr2.roru_units         ,
"
"                                        cr2.roru_hrly_rate     ,
"
"                                        cr2.roru_extend_rate   ,
"
"                                        cr2.roru_cre_by        ,
"
"                                        cr2.roru_cre_date      ,
"
"                                        cr2.roru_upd_by        ,
"
"                                        cr2.roru_upd_date
"
"                                        );
"
"
"
"                END LOOP c2;
"
"
"
"                FOR cr3 IN c3
"
"                LOOP
"
"
"
"                 INSERT INTO  rework_order_cons_ln_hist(rwoclnh_bu             ,
"
"                                    rwoclnh_plnt          ,
"
"                                    rwoclnh_doc_no        ,
"
"                                    rwoclnh_seq_no        ,
"
"                                    rwoclnh_prod_id       ,
"
"                                    rwoclnh_prod_rev      ,
"
"                                    rwoclnh_qty           ,
"
"                                    rwoclnh_cons_type     ,
"
"                                    rwoclnh_narration     ,
"
"                                    rwoclnh_oprn_id       ,
"
"                                    rwoclnh_unit_cost     ,
"
"                                    rwoclnh_cre_by        ,
"
"                                    rwoclnh_cre_date      ,
"
"                                    rwoclnh_upd_by        ,
"
"                                    rwoclnh_upd_date      ,
"
"                                    rwoclnh_store_id      ,
"
"                                    rwoclnh_uom           ,
"
"                                    rwoclnh_mat_type      ,
"
"                                    rwoclnh_sf_code       ,
"
"                                    rwoclnh_sys_ls_no     ,
"
"                                    rwoclnh_lot_no        ,
"
"                                    rwoclnh_ser_no        ,
"
"                                    rwoclnh_source_type   ,
"
"                                    rwoclnh_source_id     ,
"
"                                    rwoclnh_pr_flag       ,
"
"                                    rwoclnh_reject_qty     ,
"
"                                    rwoclnh_curproc_qty,
"
"                                    rwoclnh_inproc_qty     ,
"
"                                                                        rwoclnh_comp_qty
"
"                                                                     --   rwoclnh_sel_flag       ,
"
"                                    --rwoclnh_sel_user       ,
"
"                                                                   --     rwoclnh_scrap_qty
"
"                                   )
"
"                                    VALUES(cr3.rwocln_bu             ,
"
"                                       cr3.rwocln_plnt          ,
"
"                                       cr3.rwocln_doc_no        ,
"
"                                       cr3.rwocln_seq_no        ,
"
"                                       cr3.rwocln_prod_id       ,
"
"                                       cr3.rwocln_prod_rev      ,
"
"                                       cr3.rwocln_qty           ,
"
"                                       cr3.rwocln_cons_type     ,
"
"                                       cr3.rwocln_narration     ,
"
"                                       cr3.rwocln_oprn_id       ,
"
"                                       cr3.rwocln_unit_cost     ,
"
"                                       cr3.rwocln_cre_by        ,
"
"                                       cr3.rwocln_cre_date      ,
"
"                                       cr3.rwocln_upd_by        ,
"
"                                       cr3.rwocln_upd_date      ,
"
"                                       cr3.rwocln_store_id      ,
"
"                                       cr3.rwocln_uom           ,
"
"                                       cr3.rwocln_mat_type      ,
"
"                                       cr3.rwocln_sf_code       ,
"
"                                       cr3.rwocln_sys_ls_no     ,
"
"                                       cr3.rwocln_lot_no        ,
"
"                                       cr3.rwocln_ser_no        ,
"
"                                       cr3.rwocln_source_type   ,
"
"                                       cr3.rwocln_source_id     ,
"
"                                       cr3.rwocln_pr_flag    ,
"
"                                       cr3.rwocln_reject_qty  ,
"
"                                       cr3.rwocln_curproc_qty,
"
"                                       cr3.rwocln_inproc_qty  ,
"
"                                       cr3.rwocln_comp_qty
"
"                                    --   cr3.rwoclnh_sel_flag       ,
"
"                                                                       --    cr3.rwoclnh_sel_user       ,
"
"                                                                   --        cr3.rwoclnh_scrap_qty
"
"                                                                          );
"
"
"
"                END LOOP c3;
"
"
"
"                FOR cr4 IN c4
"
"                LOOP
"
"
"
"                    INSERT INTO rework_comp_scrap_hist (
"
"                                    rcsh_bu         ,
"
"                                    rcsh_plnt       ,
"
"                                    rcsh_doc_no     ,
"
"                                    rcsh_prod_id    ,
"
"                                    rcsh_prod_rev   ,
"
"                                    rcsh_store_id   ,
"
"                                    rcsh_scrap_qty  ,
"
"                                    rcsh_cre_by     ,
"
"                                    rcsh_cre_date   ,
"
"                                    rcsh_upd_by     ,
"
"                                    rcsh_upd_date   ,
"
"                                    rcsh_uom        ,
"
"                                    rcsh_unit_cost  ,
"
"                                    rcsh_seq_no
"
"                                    )
"
"                                     VALUES(cr4.rcs_bu         ,
"
"                                    cr4.rcs_plnt      ,
"
"                                    cr4.rcs_doc_no    ,
"
"                                    cr4.rcs_prod_id   ,
"
"                                    cr4.rcs_prod_rev  ,
"
"                                    cr4.rcs_store_id  ,
"
"                                    cr4.rcs_scrap_qty ,
"
"                                    cr4.rcs_cre_by    ,
"
"                                    cr4.rcs_cre_date  ,
"
"                                    cr4.rcs_upd_by    ,
"
"                                    cr4.rcs_upd_date  ,
"
"                                    cr4.rcs_uom       ,
"
"                                    cr4.rcs_unit_cost ,
"
"                                    cr4.rcs_seq_no
"
"                                       );
"
"
"
"                END LOOP c4;
"
"
"
"                FOR cr5 IN c5
"
"                LOOP
"
"                      INSERT INTO rework_comp_bin_dtls_hist(rcbdh_bu               ,
"
"                                        rcbdh_plnt             ,
"
"                                        rcbdh_doc_no           ,
"
"                                        rcbdh_seq_no           ,
"
"                                        rcbdh_store_id         ,
"
"                                        rcbdh_prod_id          ,
"
"                                        rcbdh_prod_rev         ,
"
"                                        rcbdh_lot_no           ,
"
"                                        rcbdh_ser_no           ,
"
"                                        rcbdh_bin_id           ,
"
"                                        rcbdh_rcpt_qty         ,
"
"                                        rcbdh_source_id        ,
"
"                                        rcbdh_source_type      ,
"
"                                        rcbdh_cre_by           ,
"
"                                        rcbdh_cre_date         ,
"
"                                        rcbdh_upd_by           ,
"
"                                        rcbdh_upd_date         ,
"
"                                        rcbdh_sys_ls_no    ,
"
"                                        rcbdh_crate_id
"
"                                        )
"
"                                      VALUES(cr5.rcbd_bu               ,
"
"                                        cr5.rcbd_plnt             ,
"
"                                        cr5.rcbd_doc_no           ,
"
"                                        cr5.rcbd_seq_no           ,
"
"                                        cr5.rcbd_store_id         ,
"
"                                        cr5.rcbd_prod_id          ,
"
"                                        cr5.rcbd_prod_rev         ,
"
"                                        cr5.rcbd_lot_no           ,
"
"                                        cr5.rcbd_ser_no           ,
"
"                                        cr5.rcbd_bin_id           ,
"
"                                        cr5.rcbd_rcpt_qty         ,
"
"                                        cr5.rcbd_source_id        ,
"
"                                        cr5.rcbd_source_type      ,
"
"                                        cr5.rcbd_cre_by           ,
"
"                                        cr5.rcbd_cre_date         ,
"
"                                        cr5.rcbd_upd_by           ,
"
"                                        cr5.rcbd_upd_date         ,
"
"                                        cr5.rcbd_sys_ls_no ,
"
"                                        cr5.rcbd_crate_id
"
"                                       );
"
"                END LOOP c5;
"
"
"
"                FOR cr6 IN c6
"
"                LOOP
"
"
"
"                    INSERT INTO rework_order_lot_ser_dtls_hist( rwolsdh_bu           ,
"
"                                        rwolsdh_plnt         ,
"
"                                        rwolsdh_doc_no       ,
"
"                                        rwolsdh_seq_no       ,
"
"                                        rwolsdh_lot_no       ,
"
"                                        rwolsdh_ser_no       ,
"
"                                        rwolsdh_qty          ,
"
"                                        rwolsdh_source_type  ,
"
"                                        rwolsdh_source_id    ,
"
"                                        rwolsdh_sub_seq_no   ,
"
"                                        rwolsdh_cre_by       ,
"
"                                        rwolsdh_cre_date     ,
"
"                                        rwolsdh_upd_by       ,
"
"                                        rwolsdh_upd_date     ,
"
"                                        rwolsdh_sys_ls_no    ,
"
"                                        rwolsdh_bin_id       ,
"
"                                        rwolsdh_reject_qty   ,
"
"                                        rwolsdh_curproc_qty  ,
"
"                                        rwolsdh_inproc_qty   ,
"
"                                        rwolsdh_comp_qty     ,
"
"                                        rwolsdh_sel_flag     ,
"
"                                        rwolsdh_sel_user     ,
"
"                                        rwolsdh_create_id    ,
"
"                                        rwolsdh_type           )
"
"                                     VALUES(cr6.rwolsd_bu         ,
"
"                                        cr6.rwolsd_plnt          ,
"
"                                        cr6.rwolsd_doc_no        ,
"
"                                        cr6.rwolsd_seq_no        ,
"
"                                        cr6.rwolsd_lot_no        ,
"
"                                        cr6.rwolsd_ser_no        ,
"
"                                        cr6.rwolsd_qty           ,
"
"                                        cr6.rwolsd_source_type     ,
"
"                                        cr6.rwolsd_source_id     ,
"
"                                        cr6.rwolsd_sub_seq_no    ,
"
"                                        cr6.rwolsd_cre_by        ,
"
"                                        cr6.rwolsd_cre_date      ,
"
"                                        cr6.rwolsd_upd_by        ,
"
"                                        cr6.rwolsd_upd_date      ,
"
"                                        cr6.rwolsd_sys_ls_no     ,
"
"                                        cr6.rwolsd_bin_id        ,
"
"                                        cr6.rwolsd_reject_qty    ,
"
"                                        cr6.rwolsd_curproc_qty   ,
"
"                                        cr6.rwolsd_inproc_qty    ,
"
"                                        cr6.rwolsd_comp_qty      ,
"
"                                        cr6.rwolsd_sel_flag      ,
"
"                                        cr6.rwolsd_sel_user      ,
"
"                                        cr6.rwolsd_create_id     ,
"
"                                        cr6.rwolsd_type          ) ;
"
"
"
"                END LOOP;
"
"
"
"
"
"                p_res := 'Y';
"
"
"
"            END LOOP c1;
"
"
"
"        END IF;
"
"
"
"    CLOSE c0;
"
"
"
"    IF p_res = 'Y' THEN
"
"
"
"            DELETE rework_order_comp_hd
"
"             WHERE rwochd_bu = p_bu
"
"               AND rwochd_plnt = p_plnt
"
"               AND rwochd_doc_no = p_doc_no;
"
"
"
"        DELETE rework_order_comp_dtl
"
"             WHERE rwocd_bu = p_bu
"
"               AND rwocd_plnt = p_plnt
"
"               AND rwocd_doc_no = p_doc_no;
"
"
"
"                DELETE
"
"                  FROM rework_ord_res_usage
"
"                 WHERE roru_bu = p_bu
"
"                   AND roru_plnt = p_plnt
"
"                   AND roru_doc_no = p_doc_no;
"
"
"
"                DELETE
"
"                  FROM rework_order_cons_ln
"
"                 WHERE rwocln_bu = p_bu
"
"                   AND rwocln_plnt = p_plnt
"
"                   AND rwocln_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"              FROM rework_comp_scrap
"
"             WHERE rcs_bu = p_bu
"
"               AND rcs_plnt = p_plnt
"
"                   AND rcs_doc_no = p_doc_no;
"
"
"
"            DELETE
"
"              FROM rework_comp_bin_dtls
"
"             WHERE rcbd_bu = p_bu
"
"               AND rcbd_plnt = p_plnt
"
"               AND rcbd_doc_no = p_doc_no;
"
"
"
"
"
"               DELETE FROM rework_order_lot_ser_dtls
"
"                    WHERE rwolsd_bu = p_bu
"
"                      AND rwolsd_plnt = p_plnt
"
"                      AND rwolsd_doc_no = p_doc_no;
"
"
"
"
"
"        END IF;
"
"
"
"
"
"    END    proc_ins_rework_comp_hist;
"
"
"
"END;"
/
