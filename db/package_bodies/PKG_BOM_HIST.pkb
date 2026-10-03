CREATE OR REPLACE
"PACKAGE BODY pkg_bom_hist
"
"IS
"
"
"
"PROCEDURE proc_cre_bom_rev (p_bu            VARCHAR2,
"
"                p_plnt            VARCHAR2,
"
"                p_bom_no        VARCHAR2,
"
"                p_eff_from        DATE,
"
"                p_eff_to        DATE,
"
"                p_user            VARCHAR2,
"
"                p_res    OUT        VARCHAR2
"
"                )
"
"IS
"
"CURSOR c0
"
"    IS
"
"SELECT *
"
"  FROM bom_hd
"
" WHERE bomhd_bu = p_bu
"
"   AND bomhd_plnt = p_plnt
"
"   AND bomhd_bom_no = p_bom_no;
"
"
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM routing_ln
"
" WHERE rouln_bu = p_bu
"
"   AND rouln_plnt = p_plnt
"
"   AND rouln_bom_no = p_bom_no;
"
"
"
"CURSOR c2
"
"    IS
"
"SELECT *
"
"  FROM bom_ln
"
" WHERE bomln_bu = p_bu
"
"   AND bomln_plnt = p_plnt
"
"   AND bomln_bom_no = p_bom_no;
"
"
"
"CURSOR c3
"
"    IS
"
"SELECT *
"
"  FROM bor_ln
"
" WHERE borln_bu = p_bu
"
"   AND borln_plnt = p_plnt
"
"   AND borln_bom_no = p_bom_no;
"
"
"
"CURSOR c4
"
"    IS
"
"SELECT *
"
"  FROM bor_details
"
" WHERE bordet_bu = p_bu
"
"   AND bordet_plnt = p_plnt
"
"   AND bordet_bom_no = p_bom_no;
"
"
"
"CURSOR c5
"
"    IS
"
"SELECT *
"
"  FROM bor_res_ln
"
" WHERE brl_bu = p_bu
"
"   AND brl_plnt = p_plnt
"
"   AND brl_bom_no = p_bom_no;
"
"
"
"CURSOR c6
"
"IS
"
"SELECT *
"
"  FROM proc_by_scr_prod
"
" WHERE pbsp_bu        = p_bu
"
"   AND pbsp_plnt      = p_plnt
"
"   AND pbsp_bom_no    = p_bom_no;
"
"
"
"CURSOR c_calc
"
"    IS
"
"SELECT *
"
"  FROM bom_ln_rqrd_qty_calc
"
" WHERE blrqc_bu     = p_bu
"
"   AND blrqc_plnt = p_plnt
"
"   AND blrqc_bom_no = p_bom_no
"
"ORDER BY blrqc_oprn_seq_no,
"
"       blrqc_item_seq_no,
"
"       blrqc_seq_no;
"
"
"
"CURSOR c_inst
"
"   IS
"
"SELECT *
"
"  FROM bom_proc_inst
"
" WHERE bpi_bu   = p_bu
"
"   AND bpi_plnt = p_plnt
"
"   AND bpi_bom_no = p_bom_no;
"
"
"
"CURSOR c_subitem
"
"    IS
"
"SELECT  *
"
"  FROM bom_subst_prod
"
" WHERE bsp_bu   = p_bu
"
"   AND bsp_plnt = p_plnt
"
"   AND bsp_bom_no  = p_bom_no;
"
"
"
"CURSOR c_multi_res
"
"  IS
"
"SELECT *
"
"  FROM bom_multi_proc_res
"
" WHERE bmpr_bu        = p_bu
"
"   AND bmpr_plnt    = p_plnt
"
"   AND bmpr_bom_no    = p_bom_no
"
" ORDER BY bmpr_seq_no;
"
"
"
"CURSOR c_multi_proc(c_seq_no NUMBER)
"
"  IS
"
"SELECT *
"
"  FROM bom_multi_proc_res_dtls
"
" WHERE bmprd_bu        = p_bu
"
"   AND bmprd_plnt    = p_plnt
"
"   AND bmprd_bom_no    = p_bom_no
"
"   AND bmprd_seq_no    = c_seq_no
"
" ORDER BY bmprd_seq_no,
"
"          bmprd_sub_seq_no;
"
"
"
"    v_new_bom_no    VARCHAR2 (30);
"
"    v_max_bom_no    VARCHAR2 (30);
"
"    v_old_bom_no    VARCHAR2 (30);
"
"    v_rev        VARCHAR (5);
"
"    v_max_rev    VARCHAR (5);
"
"    v_old_rev    VARCHAR (5);
"
"    v_upd_bom_no    VARCHAR2 (30);
"
"    v_bom_no       VARCHAR2 (30);
"
"    V_PLNT_LOC_ID VARCHAR2(10);
"
"
"
"    cr0                c0%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"       OPEN c0;
"
"       FETCH c0 INTO cr0;
"
"
"
"          IF c0%NOTFOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20595,'PLN'||' '||'Bill Of Materials Not Found.');
"
"          ELSE
"
"
"
"          SELECT NVL(REPLACE(p_bom_no,SUBSTR(p_bom_no,INSTR(p_bom_no,'-'))),p_bom_no)
"
"            INTO v_old_bom_no
"
"            FROM DUAL;
"
"
"
"            /*
"
"         SELECT MAX(v_max_bom_no) + 1
"
"           INTO v_rev
"
"           FROM (SELECT ( NVL(REPLACE(bomhd_bom_no,
"
"                        NVL(SUBSTR(bomhd_bom_no, 1,
"
"                        INSTR(bomhd_bom_no,'-')),bomhd_bom_no)),0)) v_max_bom_no
"
"               FROM bom_hd
"
"              WHERE bomhd_bu = p_bu
"
"                AND bomhd_plnt = p_plnt
"
"                AND bomhd_prod_id = cr0.bomhd_prod_id
"
"                AND bomhd_prod_rev = cr0.bomhd_prod_rev
"
"                AND bomhd_bom_no LIKE v_old_bom_no||'%');
"
"
"
"         SELECT MAX(v_max_bom_no)
"
"           INTO v_old_rev
"
"           FROM (SELECT ( NVL(REPLACE(bomhd_bom_no,
"
"                        NVL(SUBSTR(bomhd_bom_no, 1,
"
"                        INSTR(bomhd_bom_no,'-')),bomhd_bom_no)),0)) v_max_bom_no
"
"               FROM bom_hd
"
"              WHERE bomhd_bu = p_bu
"
"                AND bomhd_plnt = p_plnt
"
"                AND bomhd_prod_id = cr0.bomhd_prod_id
"
"                AND bomhd_prod_rev = cr0.bomhd_prod_rev
"
"                AND bomhd_bom_no LIKE v_old_bom_no||'%');
"
"
"
"             IF v_rev IS NOT NULL THEN
"
"                v_new_bom_no := v_old_bom_no||'-'||v_rev;
"
"             END IF;
"
"
"
"             IF v_old_rev = 0 THEN
"
"                v_upd_bom_no := v_old_bom_no;
"
"             ELSE
"
"                v_upd_bom_no := v_old_bom_no||'-'||v_old_rev;
"
"             END IF;
"
"
"
"             IF v_new_bom_no IS NULL THEN
"
"                RAISE_APPLICATION_ERROR(-20999,'HRM'||'Revision No. not generated.');
"
"             END IF;*/
"
"
"
"           -- v_new_bom_no := func_find_plan_nextno(p_bu,p_plnt,'BOM',p_user);
"
"
"
"              SELECT bupld_loc_id
"
"                INTO v_plnt_loc_id
"
"                FROM bus_unit_plants_loc_dtls
"
"               WHERE bupld_bu = p_bu
"
"                 AND bupld_plnt = p_plnt
"
"                 AND bupld_actv_loc_flag = 'Y'
"
"                 AND bupld_dflt_loc_flag = 'Y';
"
"
"
"             v_new_bom_no :=   func_find_pfx_nextno(p_bu,
"
"                        TRUNC(SYSDATE),
"
"                        func_find_get_mfg_pfx(p_bu,
"
"                         V_PLNT_LOC_ID,
"
"                         p_plnt,
"
"                         'BOM'),
"
"                p_user);
"
"
"
"                 SELECT nvl(MAX(bomhd_revision_num),0) + 1
"
"                   INTO v_max_rev
"
"                   FROM bom_hd
"
"                  WHERE bomhd_bu = p_bu
"
"                    AND bomhd_plnt = p_plnt
"
"                    AND bomhd_prod_id = cr0.bomhd_prod_id
"
"                    AND bomhd_prod_rev = cr0.bomhd_prod_rev
"
"                     AND bomhd_bom_no = p_bom_no
"
"--                        AND bomhd_bom_no LIKE v_old_bom_no||'%'
"
"                        ;
"
"                   --     raise_Application_Error(-20999,p_bu||'/'||p_plnt||'/'||cr0.bomhd_prod_id||'/'||cr0.bomhd_prod_rev||'/'||p_bom_no||'/'||v_max_rev);
"
"
"
"                         INSERT INTO bom_hd(bomhd_bu,
"
"                                bomhd_plnt,
"
"                                bomhd_bom_no,
"
"                                bomhd_prod_id,
"
"                                bomhd_prod_rev,
"
"                                bomhd_primary,
"
"                                bomhd_eff_from,
"
"                                bomhd_eff_to,
"
"                                bomhd_active_date,
"
"                                bomhd_cancel_date,
"
"                                bomhd_status,
"
"                                bomhd_dflt_bom,
"
"                                bomhd_cumm_leadtime,
"
"                                bomhd_prod_cat,
"
"                                bomhd_prod_style,
"
"                                bomhd_prod_color,
"
"                                bomhd_prod_size,
"
"                                bomhd_gar_bom_no,
"
"                                bomhd_order_no,
"
"                                bomhd_buyer_id,
"
"                                bomhd_dia,
"
"                                bomhd_gsm,
"
"                                bomhd_structure,
"
"                                bomhd_content,
"
"                                bomhd_count,
"
"                                bomhd_partial,
"
"                                bomhd_uom,
"
"                                bomhd_prod_uom,
"
"                                bomhd_conv_factor,
"
"                                bomhd_cre_by,
"
"                                bomhd_cre_date,
"
"                                bomhd_so_pfx,
"
"                                bomhd_so_no,
"
"                                bomhd_so_seqno,
"
"                                bomhd_cust_spec_mat_flag,
"
"                                bomhd_cust_id          ,
"
"                                bomhd_proj_id          ,
"
"                                bomhd_task_id          ,
"
"                                bomhd_so_schld_desc,
"
"                                bomhd_so_sub_seq_no,
"
"                                bomhd_sf_cons          ,
"
"                                bomhd_drg_no           ,
"
"                                bomhd_drg_rev          ,
"
"                                bomhd_wbs              ,
"
"                                bomhd_ecn_no           ,
"
"                                bomhd_ecn_date         ,
"
"                                bomhd_qty              ,
"
"                                bomhd_bom_name         ,
"
"                                bomhd_revision_num     ,
"
"                                bomhd_rel_date         ,
"
"                                bomhd_model_id    ,
"
"                                bomhd_cre_ip_addr,
"
"                                bomhd_cre_os_user,
"
"                                bomhd_cre_emp_id,
"
"                                bomhd_upd_ip_addr,
"
"                                bomhd_upd_os_user,
"
"                                bomhd_upd_emp_id,
"
"                                bomhd_first_proc_cons_rqrd
"
"                                )
"
"                        VALUES( p_bu,
"
"                                p_plnt,
"
"                                v_new_bom_no,
"
"                                cr0.bomhd_prod_id,
"
"                                cr0.bomhd_prod_rev,
"
"                                'N',
"
"                                p_eff_from,
"
"                                p_eff_to,
"
"                                NULL,
"
"                                NULL,
"
"                                'E',
"
"                                cr0.bomhd_dflt_bom,
"
"                                cr0.bomhd_cumm_leadtime,
"
"                                cr0.bomhd_prod_cat,
"
"                                cr0.bomhd_prod_style,
"
"                                cr0.bomhd_prod_color,
"
"                                cr0.bomhd_prod_size,
"
"                                cr0.bomhd_gar_bom_no,
"
"                                cr0.bomhd_order_no,
"
"                                cr0.bomhd_buyer_id,
"
"                                cr0.bomhd_dia,
"
"                                cr0.bomhd_gsm,
"
"                                cr0.bomhd_structure,
"
"                                cr0.bomhd_content,
"
"                                cr0.bomhd_count,
"
"                                cr0.bomhd_partial,
"
"                                cr0.bomhd_uom,
"
"                                cr0.bomhd_prod_uom,
"
"                                cr0.bomhd_conv_factor,
"
"                                p_user,
"
"                                SYSDATE,
"
"                                cr0.bomhd_so_pfx,
"
"                                cr0.bomhd_so_no,
"
"                                cr0.bomhd_so_seqno,
"
"                                cr0.bomhd_cust_spec_mat_flag,
"
"                                cr0.bomhd_cust_id          ,
"
"                                cr0.bomhd_proj_id          ,
"
"                                cr0.bomhd_task_id          ,
"
"                                cr0.bomhd_so_schld_desc,
"
"                                cr0.bomhd_so_sub_seq_no,
"
"                                cr0.bomhd_sf_cons          ,
"
"                                cr0.bomhd_drg_no           ,
"
"                                cr0.bomhd_drg_rev          ,
"
"                                cr0.bomhd_wbs              ,
"
"                                cr0.bomhd_ecn_no           ,
"
"                                cr0.bomhd_ecn_date         ,
"
"                                cr0.bomhd_qty              ,
"
"                                cr0.bomhd_bom_name   ||'-'||v_max_rev,--v_new_bom_no ||'-'||v_max_rev  ,
"
"                                v_max_rev    ,
"
"                                cr0.bomhd_rel_date         ,
"
"                                cr0.bomhd_model_id  ,
"
"                                audit_info.get_ip_address,
"
"                                audit_info.get_os_user,
"
"                                func_find_emp_id(p_bu,p_user),
"
"                                NULL,
"
"                                NULL,
"
"                                NULL   ,
"
"                                cr0.bomhd_first_proc_cons_rqrd
"
"                                );
"
"
"
"             UPDATE bom_ln
"
"            SET bomln_child_bom_no      = v_new_bom_no,
"
"                bomln_bom_name        = cr0.bomhd_bom_name   ||'-'||v_new_bom_no ||'-'||v_max_rev,
"
"                bomln_revision_num        = v_max_rev
"
"              WHERE bomln_bu            = p_bu
"
"            AND bomln_plnt            = p_plnt
"
"            AND bomln_prod_id        = cr0.bomhd_prod_id
"
"            AND bomln_prod_rev        = cr0.bomhd_prod_rev;
"
"
"
"             FOR cr1 IN c1
"
"             LOOP
"
"
"
"                            INSERT INTO routing_ln (rouln_bu,
"
"                                        rouln_plnt,
"
"                                        rouln_bom_no,
"
"                                        rouln_oprn_seq_no,
"
"                                        rouln_oprn_id,
"
"                                        rouln_proc_id,
"
"                                        rouln_comp_pct,
"
"                                        rouln_ins_req,
"
"                                        rouln_oprn_no,
"
"                                        rouln_source_type,
"
"                                        rouln_proc_draw_no,
"
"                                        rouln_proc_draw_rev,
"
"                                        rouln_ins_sheet_id,
"
"                                        rouln_cre_by,
"
"                                        rouln_cre_date,
"
"                                        rouln_ls_flag,
"
"                                        rouln_oprn_flag,
"
"                                        rouln_tsa_flag,
"
"                                        rouln_unit_weight,
"
"                                        rouln_proc_skip_opt,
"
"                                        rouln_cons_store      ,
"
"                                        rouln_rcp_store        ,
"
"                                        rouln_proj_id          ,
"
"                                        rouln_task_id          ,
"
"                                        rouln_oprn_spec       ,
"
"                                        rouln_oprn_desc       ,
"
"                                        rouln_appr_suplr_flag ,
"
"                                        rouln_oprn_hrs        ,
"
"                                        rouln_oprn_mins       ,
"
"                                        rouln_sf_auto_mr ,
"
"                                        rouln_secs  ,
"
"                                        rouln_oprn_ln_seq,
"
"                                        rouln_sco_flag ,
"
"                                        rouln_lag_hrs  ,
"
"                                        rouln_lag_mins ,
"
"                                        rouln_lag_hrs_qty   ,
"
"                                        rouln_loc_id,
"
"                                        rouln_cre_ip_addr,
"
"                                        rouln_cre_os_user,
"
"                                        rouln_cre_emp_id,
"
"                                        rouln_uph
"
"                                        )
"
"                                 VALUES(p_bu,
"
"                                        p_plnt,
"
"                                        v_new_bom_no,
"
"                                        cr1.rouln_oprn_seq_no,
"
"                                        cr1.rouln_oprn_id,
"
"                                        cr1.rouln_proc_id,
"
"                                        cr1.rouln_comp_pct,
"
"                                        cr1.rouln_ins_req,
"
"                                        cr1.rouln_oprn_no,
"
"                                        cr1.rouln_source_type,
"
"                                        cr1.rouln_proc_draw_no,
"
"                                        cr1.rouln_proc_draw_rev,
"
"                                        cr1.rouln_ins_sheet_id,
"
"                                        p_user,
"
"                                        SYSDATE,
"
"                                        cr1.rouln_ls_flag,
"
"                                        cr1.rouln_oprn_flag,
"
"                                        cr1.rouln_tsa_flag,
"
"                                        cr1.rouln_unit_weight,
"
"                                        cr1.rouln_proc_skip_opt,
"
"                                        cr1.rouln_cons_store      ,
"
"                                        cr1.rouln_rcp_store        ,
"
"                                        cr1.rouln_proj_id          ,
"
"                                        cr1.rouln_task_id          ,
"
"                                        cr1.rouln_oprn_spec       ,
"
"                                        cr1.rouln_oprn_desc       ,
"
"                                        cr1.rouln_appr_suplr_flag ,
"
"                                        cr1.rouln_oprn_hrs        ,
"
"                                        cr1.rouln_oprn_mins       ,
"
"                                        cr1.rouln_sf_auto_mr  ,
"
"                                        cr1.rouln_secs  ,
"
"                                        cr1.rouln_oprn_ln_seq,
"
"                                        cr1.rouln_sco_flag ,
"
"                                        cr1.rouln_lag_hrs  ,
"
"                                        cr1.rouln_lag_mins ,
"
"                                        cr1.rouln_lag_hrs_qty  ,
"
"                                        cr1.rouln_loc_id,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user) ,
"
"                                        cr1.rouln_uph
"
"                                    );
"
"
"
"         END LOOP c1;
"
"
"
"         FOR cr2 IN c2
"
"         LOOP
"
"                    INSERT INTO bom_ln (bomln_bu,
"
"                                bomln_plnt,
"
"                                bomln_bom_no,
"
"                                bomln_oprn_seq_no,
"
"                                bomln_cons_seq_no,
"
"                                bomln_seq_no,
"
"                                bomln_bom_type,
"
"                                bomln_prod_id,
"
"                                bomln_prod_rev,
"
"                                bomln_store_id,
"
"                                bomln_prod_uom,
"
"                                bomln_uom,
"
"                                bomln_required_qty,
"
"                                bomln_scrap_pct,
"
"                                bomln_optional,
"
"                                bomln_multiple,
"
"                                bomln_ord_flag,
"
"                                bomln_plan_pct,
"
"                                bomln_min_qty,
"
"                                bomln_max_qty,
"
"                                bomln_item_seq_no,
"
"                                bomln_matreq_uom,
"
"                                bomln_phantom,
"
"                                bomln_lot_no_gen_flag,
"
"                                bomln_cre_by,
"
"                                bomln_cre_date,
"
"                                bomln_plnnd_mat_flag,
"
"                                bomln_deflt_flag,
"
"                                bomln_rqrd_pct,
"
"                                bomln_conv_factor             ,
"
"                                bomln_tolr_flag               ,
"
"                                bomln_tolr_upr_lmt            ,
"
"                                bomln_tolr_lwr_lmt            ,
"
"                                bomln_scrap_uom               ,
"
"                                bomln_scrap_qty               ,
"
"                                bomln_byprod_uom              ,
"
"                                bomln_byprod_qty              ,
"
"                                bomln_fmcg_conv_fact_req_flag,
"
"                                bomln_os_rqrd_qty           ,
"
"                                bomln_rej_cons_flag         ,
"
"                                bomln_subcntr_cnr            ,
"
"                                bomln_loc                    ,
"
"                                bomln_mftr_part_no           ,
"
"                                bomln_remarks                ,
"
"                                bomln_wbs                    ,
"
"                                bomln_ecn_ref                 ,
"
"                                bomln_subst_item_avbl    ,
"
"                                bomln_gsm,
"
"                                bomln_grain,
"
"                                bomln_length,
"
"                                bomln_width,
"
"                                bomln_no_of_ups,
"
"                                bomln_fdng_size,
"
"                                bomln_ply_type   ,
"
"                                bomln_flute_type ,
"
"                                bomln_thickness   ,
"
"                                bomln_fab_thickness ,
"
"                                bomln_fab_width  ,
"
"                                bomln_fab_length,
"
"                                bomln_cls_type      ,
"
"                                bomln_cre_ip_addr,
"
"                                bomln_cre_os_user,
"
"                                bomln_cre_emp_id,
"
"                bomln_oprn_no,
"
"                bomln_oprn_ln_seq,
"
"                bomln_oprn_id,
"
"                bomln_proc_id,
"
"                bomln_child_bom_no,
"
"                bomln_revision_num
"
"
"
"                                    )
"
"                            VALUES( p_bu,
"
"                                p_plnt,
"
"                                v_new_bom_no,
"
"                                cr2.bomln_oprn_seq_no,
"
"                                cr2.bomln_cons_seq_no,
"
"                                cr2.bomln_seq_no,
"
"                                cr2.bomln_bom_type,
"
"                                cr2.bomln_prod_id,
"
"                                cr2.bomln_prod_rev,
"
"                                cr2.bomln_store_id,
"
"                                cr2.bomln_prod_uom,
"
"                                cr2.bomln_uom,
"
"                                cr2.bomln_required_qty,
"
"                                cr2.bomln_scrap_pct,
"
"                                cr2.bomln_optional,
"
"                                cr2.bomln_multiple,
"
"                                cr2.bomln_ord_flag,
"
"                                cr2.bomln_plan_pct,
"
"                                cr2.bomln_min_qty,
"
"                                cr2.bomln_max_qty,
"
"                                cr2.bomln_item_seq_no,
"
"                                cr2.bomln_matreq_uom,
"
"                                cr2.bomln_phantom,
"
"                                cr2.bomln_lot_no_gen_flag,
"
"                                p_user,
"
"                                SYSDATE,
"
"                                cr2.bomln_plnnd_mat_flag,
"
"                                cr2.bomln_deflt_flag,
"
"                                cr2.bomln_rqrd_pct,
"
"                                cr2.bomln_conv_factor             ,
"
"                                cr2.bomln_tolr_flag               ,
"
"                                cr2.bomln_tolr_upr_lmt            ,
"
"                                cr2.bomln_tolr_lwr_lmt            ,
"
"                                cr2.bomln_scrap_uom               ,
"
"                                cr2.bomln_scrap_qty               ,
"
"                                cr2.bomln_byprod_uom              ,
"
"                                cr2.bomln_byprod_qty              ,
"
"                                cr2.bomln_fmcg_conv_fact_req_flag,
"
"                                cr2.bomln_os_rqrd_qty           ,
"
"                                cr2.bomln_rej_cons_flag         ,
"
"                                cr2.bomln_subcntr_cnr            ,
"
"                                cr2.bomln_loc                    ,
"
"                                cr2.bomln_mftr_part_no           ,
"
"                                cr2.bomln_remarks                ,
"
"                                cr2.bomln_wbs                    ,
"
"                                cr2.bomln_ecn_ref                 ,
"
"                                cr2.bomln_subst_item_avbl       ,
"
"                                cr2.bomln_gsm,
"
"                                cr2.bomln_grain,
"
"                                cr2.bomln_length,
"
"                                cr2.bomln_width,
"
"                                cr2.bomln_no_of_ups,
"
"                                cr2.bomln_fdng_size,
"
"                                cr2.bomln_ply_type   ,
"
"                                cr2.bomln_flute_type ,
"
"                                cr2.bomln_thickness   ,
"
"                                cr2.bomln_fab_thickness ,
"
"                                cr2.bomln_fab_width  ,
"
"                                cr2.bomln_fab_length,
"
"                                cr2.bomln_cls_type ,
"
"                                audit_info.get_ip_address,
"
"                                audit_info.get_os_user,
"
"                                func_find_emp_id(p_bu,p_user)   ,
"
"                cr2.bomln_oprn_no,
"
"                cr2.bomln_oprn_ln_seq,
"
"                cr2.bomln_oprn_id,
"
"                cr2.bomln_proc_id,
"
"                cr2.bomln_child_bom_no,
"
"                cr2.bomln_revision_num
"
"                                );
"
"
"
"         END LOOP c2;
"
"
"
"         FOR cr3 IN c3
"
"         LOOP
"
"
"
"            INSERT INTO bor_ln (borln_bu,
"
"                                borln_plnt,
"
"                                borln_bom_no,
"
"                                borln_oprn_seq_no,
"
"                                borln_sub_seq_no,
"
"                                borln_type,
"
"                                borln_res_grp_id,
"
"                                borln_units_per_hour,
"
"                                borln_hrs_per_unit,
"
"                                borln_mins_per_unit,
"
"                                borln_basis,
"
"                                borln_res_seq_no,
"
"                                borln_bkup_days,
"
"                                borln_res_offset_pct,
"
"                                borln_uom,
"
"                                borln_cre_by,
"
"                                borln_cre_date,
"
"                                borln_lot_size,
"
"                                borln_secs_per_unit,
"
"                                borln_lag_hrs,
"
"                                borln_mpm        ,
"
"                                borln_setup_hrs  ,
"
"                                borln_ink_mix_hrs ,
"
"                                borln_roll_chng_hrs,
"
"                                borln_no_of_units   ,
"
"                                borln_res_grp_type,
"
"                                borln_priority,
"
"                                borln_cre_ip_addr,
"
"                                borln_cre_os_user,
"
"                                borln_cre_emp_id,
"
"                borln_oprn_id,
"
"                borln_proc_id,
"
"                borln_oprn_ln_seq,
"
"                borln_oprn_no
"
"                                )
"
"                        VALUES (p_bu,
"
"                                p_plnt,
"
"                                v_new_bom_no,
"
"                                cr3.borln_oprn_seq_no,
"
"                                cr3.borln_sub_seq_no,
"
"                                cr3.borln_type,
"
"                                cr3.borln_res_grp_id,
"
"                                cr3.borln_units_per_hour,
"
"                                cr3.borln_hrs_per_unit,
"
"                                cr3.borln_mins_per_unit,
"
"                                cr3.borln_basis,
"
"                                cr3.borln_res_seq_no,
"
"                                cr3.borln_bkup_days,
"
"                                cr3.borln_res_offset_pct,
"
"                                cr3.borln_uom,
"
"                                p_user,
"
"                                SYSDATE,
"
"                                cr3.borln_lot_size,
"
"                                cr3.borln_secs_per_unit,
"
"                                cr3.borln_lag_hrs,
"
"                                cr3.borln_mpm        ,
"
"                                cr3.borln_setup_hrs  ,
"
"                                cr3.borln_ink_mix_hrs ,
"
"                                cr3.borln_roll_chng_hrs,
"
"                                cr3.borln_no_of_units ,
"
"                                cr3.borln_res_grp_type,
"
"                                cr3.borln_priority,
"
"                                audit_info.get_ip_address,
"
"                                audit_info.get_os_user,
"
"                                func_find_emp_id(p_bu,p_user) ,
"
"                cr3.borln_oprn_id,
"
"                cr3.borln_proc_id,
"
"                cr3.borln_oprn_ln_seq,
"
"                cr3.borln_oprn_no
"
"                                );
"
"
"
"         END LOOP c3;
"
"
"
"         FOR cr4 IN c4
"
"         LOOP
"
"
"
"            INSERT INTO bor_details (bordet_bu,
"
"                                     bordet_plnt,
"
"                                     bordet_bom_no,
"
"                                     bordet_oprn_seq_no,
"
"                                     bordet_sub_seq_no,
"
"                                     bordet_res_id,
"
"                                     bordet_priority,
"
"                                     bordet_cre_by,
"
"                                     bordet_cre_date,
"
"                                     bordet_cre_ip_addr,
"
"                                     bordet_cre_os_user,
"
"                                     bordet_cre_emp_id
"
"                                     )
"
"                              VALUES(p_bu,
"
"                                     p_plnt,
"
"                                     v_new_bom_no,
"
"                                     cr4.bordet_oprn_seq_no,
"
"                                     cr4.bordet_sub_seq_no,
"
"                                     cr4.bordet_res_id,
"
"                                     cr4.bordet_priority,
"
"                                     p_user,
"
"                                     SYSDATE,
"
"                                     audit_info.get_ip_address,
"
"                                     audit_info.get_os_user,
"
"                                     func_find_emp_id(p_bu,p_user)
"
"                                     );
"
"
"
"         END LOOP c4;
"
"
"
"         FOR cr5 IN c5
"
"         LOOP
"
"
"
"            INSERT INTO bor_res_ln (brl_bu,
"
"                                    brl_plnt,
"
"                                    brl_bom_no,
"
"                                    brl_oprn_seq_no,
"
"                                    brl_sub_seq_no,
"
"                                    brl_res_seq_no,
"
"                                    brl_type,
"
"                                    brl_res_id,
"
"                                    brl_units_per_hour,
"
"                                    brl_hrs_per_unit,
"
"                                    brl_mins_per_unit,
"
"                                    brl_basis,
"
"                                    brl_bkup_days,
"
"                                    brl_res_offset_pct,
"
"                                    brl_uom,
"
"                                    brl_lot_size,
"
"                                    brl_secs_per_unit,
"
"                                    brl_priority,
"
"                                    brl_cre_by,
"
"                                    brl_cre_date,
"
"                                    brl_lag_hrs,
"
"                                    brl_mpm            ,
"
"                                    brl_setup_hrs      ,
"
"                                    brl_ink_mix_hrs    ,
"
"                                    brl_roll_chng_hrs,
"
"                                    brl_cre_ip_addr,
"
"                                    brl_cre_os_user,
"
"                                    brl_cre_emp_id
"
"                                    )
"
"                            VALUES(p_bu,
"
"                                    p_plnt,
"
"                                    v_new_bom_no,
"
"                                    cr5.brl_oprn_seq_no,
"
"                                    cr5.brl_sub_seq_no,
"
"                                    cr5.brl_res_seq_no,
"
"                                    cr5.brl_type,
"
"                                    cr5.brl_res_id,
"
"                                    cr5.brl_units_per_hour,
"
"                                    cr5.brl_hrs_per_unit,
"
"                                    cr5.brl_mins_per_unit,
"
"                                    cr5.brl_basis,
"
"                                    cr5.brl_bkup_days,
"
"                                    cr5.brl_res_offset_pct,
"
"                                    cr5.brl_uom,
"
"                                    cr5.brl_lot_size,
"
"                                    cr5.brl_secs_per_unit,
"
"                                    cr5.brl_priority,
"
"                                    p_user,
"
"                                    SYSDATE,
"
"                                    cr5.brl_lag_hrs,
"
"                                    cr5.brl_mpm            ,
"
"                                    cr5.brl_setup_hrs      ,
"
"                                    cr5.brl_ink_mix_hrs    ,
"
"                                    cr5.brl_roll_chng_hrs,
"
"                                    audit_info.get_ip_address,
"
"                                    audit_info.get_os_user,
"
"                                    func_find_emp_id(p_bu,p_user)
"
"                                    );
"
"
"
"         END LOOP c5;
"
"
"
"         FOR cr6 IN c6
"
"         LOOP
"
"
"
"                     INSERT INTO proc_by_scr_prod
"
"                                    (
"
"                                     pbsp_bu,
"
"                                     pbsp_plnt,
"
"                                     pbsp_bom_no,
"
"                                     pbsp_oprn_seq_no,
"
"                                     pbsp_prod_id,
"
"                                     pbsp_prod_rev,
"
"                                     pbsp_rct_qty,
"
"                                     pbsp_sou_prod_id,
"
"                                     pbsp_sou_prod_rev,
"
"                                     pbsp_auto_gen_flag,
"
"                                     pbsp_cre_by,
"
"                                     pbsp_cre_date,
"
"                                     pbsp_tar_store_id ,
"
"                                     pbsp_prod_type    ,
"
"                                     pbsp_cre_ip_addr,
"
"                                     pbsp_cre_os_user,
"
"                                     pbsp_cre_emp_id,
"
"                     pbsp_oprn_no,
"
"                     pbsp_oprn_ln_seq,
"
"                     pbsp_oprn_id,
"
"                     pbsp_proc_id
"
"                                    )
"
"                            VALUES
"
"                                    (
"
"                                     p_bu,
"
"                                     p_plnt,
"
"                                     v_new_bom_no,
"
"                                     cr6.pbsp_oprn_seq_no,
"
"                                     cr6.pbsp_prod_id,
"
"                                     cr6.pbsp_prod_rev,
"
"                                     cr6.pbsp_rct_qty,
"
"                                     cr6.pbsp_sou_prod_id,
"
"                                     cr6.pbsp_sou_prod_rev,
"
"                                     cr6.pbsp_auto_gen_flag,
"
"                                     p_user,
"
"                                     SYSDATE,
"
"                                     cr6.pbsp_tar_store_id ,
"
"                                     cr6.pbsp_prod_type  ,
"
"                                     audit_info.get_ip_address,
"
"                                     audit_info.get_os_user,
"
"                                     func_find_emp_id(p_bu,p_user)  ,
"
"                     cr6.pbsp_oprn_no,
"
"                     cr6.pbsp_oprn_ln_seq,
"
"                     cr6.pbsp_oprn_id,
"
"                     cr6.pbsp_proc_id
"
"                                    );
"
"
"
"
"
"         END LOOP c6;
"
"
"
"             FOR r_calc IN c_calc
"
"             LOOP
"
"
"
"                             INSERT INTO bom_ln_rqrd_qty_calc
"
"                                        (
"
"                                        blrqc_bu              ,
"
"                                        blrqc_plnt            ,
"
"                                        blrqc_bom_no          ,
"
"                                        blrqc_oprn_seq_no     ,
"
"                                        blrqc_item_seq_no     ,
"
"                                        blrqc_seq_no          ,
"
"                                        blrqc_len1            ,
"
"                                        blrqc_dia1            ,
"
"                                        blrqc_oper            ,
"
"                                        blrqc_len2            ,
"
"                                        blrqc_dia2            ,
"
"                                        blrqc_rqrd_qty        ,
"
"                                        blrqc_cre_by          ,
"
"                                        blrqc_cre_date ,
"
"                                        blrqc_cre_ip_addr,
"
"                                        blrqc_cre_os_user,
"
"                                        blrqc_cre_emp_id
"
"                                        )
"
"                                VALUES
"
"                                        (
"
"                                         p_bu              ,
"
"                                         p_plnt            ,
"
"                                         v_new_bom_no          ,
"
"                                         r_calc.blrqc_oprn_seq_no     ,
"
"                                         r_calc.blrqc_item_seq_no     ,
"
"                                         r_calc.blrqc_seq_no          ,
"
"                                         r_calc.blrqc_len1            ,
"
"                                         r_calc.blrqc_dia1            ,
"
"                                         r_calc.blrqc_oper            ,
"
"                                         r_calc.blrqc_len2            ,
"
"                                         r_calc.blrqc_dia2            ,
"
"                                         r_calc.blrqc_rqrd_qty        ,
"
"                                         p_user          ,
"
"                                         SYSDATE  ,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user)
"
"                                        );
"
"
"
"
"
"             END LOOP c_calc;
"
"
"
"             FOR r_inst IN c_inst
"
"              LOOP
"
"
"
"                             INSERT INTO bom_proc_inst (bpi_bu,
"
"                                                        bpi_plnt,
"
"                                                        bpi_bom_no,
"
"                                                        bpi_oper_seq_no,
"
"                                                        bpi_instr_seq_no,
"
"                                                        bpi_inst,
"
"                                                        bpi_cre_by,
"
"                                                        bpi_cre_emp_id,
"
"                                                        bpi_cre_ip_addr,
"
"                                                        bpi_cre_os_user,
"
"                                                        bpi_cre_date
"
"                                              )
"
"                                          VALUES
"
"                                              (p_bu     ,
"
"                                              p_plnt    ,
"
"                                              v_new_bom_no   ,
"
"                                              r_inst.bpi_oper_seq_no  ,
"
"                                              r_inst.bpi_instr_seq_no,
"
"                                              r_inst.bpi_inst  ,
"
"                                              p_user   ,
"
"                                              func_find_emp_id(p_bu,p_user) ,
"
"                                              Audit_Info.get_ip_address,
"
"                                              Audit_Info.get_os_user ,
"
"                                              SYSDATE
"
"                                              );
"
"
"
"               END LOOP c_inst;
"
"
"
"
"
"           FOR cr_subitem IN c_subitem
"
"           LOOP
"
"                   INSERT INTO bom_subst_prod (bsp_bu      ,
"
"                            bsp_plnt    ,
"
"                            bsp_bom_no  ,
"
"                            bsp_proc_seq_no ,
"
"                            bsp_item_seq_no ,
"
"                            bsp_seq_no   ,
"
"                            bsp_prod_id ,
"
"                            bsp_prod_rev ,
"
"                            bsp_uom   ,
"
"                            bsp_bom_qty ,
"
"                            bsp_cre_by  ,
"
"                            bsp_cre_date ,
"
"                            bsp_cre_ip_addr,
"
"                            bsp_cre_os_user,
"
"                            bsp_cre_emp_id
"
"                                   )
"
"                                 values
"
"                                  (p_bu      ,
"
"                            p_plnt    ,
"
"                            v_new_bom_no  ,
"
"                            cr_subitem.bsp_proc_seq_no ,
"
"                            cr_subitem.bsp_item_seq_no ,
"
"                            cr_subitem.bsp_seq_no   ,
"
"                            cr_subitem.bsp_prod_id ,
"
"                            cr_subitem.bsp_prod_rev ,
"
"                            cr_subitem.bsp_uom   ,
"
"                            cr_subitem.bsp_bom_qty ,
"
"                            p_user  ,
"
"                            SYSDATE,
"
"                            audit_info.get_ip_address,
"
"                            audit_info.get_os_user,
"
"                            func_find_emp_id(p_bu,p_user)
"
"                                  );
"
"
"
"           END LOOP c_subitem;
"
"
"
"            FOR r_multi_res IN c_multi_res
"
"            LOOP
"
"
"
"                INSERT INTO bom_multi_proc_res(
"
"                                bmpr_bu             ,
"
"                                bmpr_plnt           ,
"
"                                bmpr_bom_no         ,
"
"                                bmpr_seq_no         ,
"
"                                bmpr_res_id         ,
"
"                                bmpr_st_hrs         ,
"
"                                bmpr_st_mins        ,
"
"                                bmpr_cre_by         ,
"
"                                bmpr_cre_emp_id     ,
"
"                                bmpr_cre_ip_addr    ,
"
"                                bmpr_cre_os_user    ,
"
"                                bmpr_cre_date
"
"                                    )
"
"                                    VALUES(
"
"                                    p_bu,--bmpr_bu             ,
"
"                                    p_plnt,--bmpr_plnt           ,
"
"                                    v_new_bom_no,--bmpr_bom_no         ,
"
"                                    r_multi_res.bmpr_seq_no,--bmpr_seq_no         ,
"
"                                    r_multi_res.bmpr_res_id,--bmpr_res_id         ,
"
"                                    r_multi_res.bmpr_st_hrs,--bmpr_st_hrs         ,
"
"                                    r_multi_res.bmpr_st_mins,--bmpr_st_mins        ,
"
"                                    p_user,--bmpr_cre_by         ,
"
"                                    func_find_emp_id(p_bu,p_user),--bmpr_cre_emp_id     ,
"
"                                    audit_info.get_ip_address,--bmpr_cre_ip_addr    ,
"
"                                    audit_info.get_os_user,--bmpr_cre_os_user    ,
"
"                                    SYSDATE--bmpr_cre_date
"
"                                           );
"
"
"
"                FOR r_multi_proc IN c_multi_proc(r_multi_res.bmpr_seq_no)
"
"                LOOP
"
"
"
"                    INSERT INTO bom_multi_proc_res_dtls(
"
"                                        bmprd_bu               ,
"
"                                        bmprd_plnt             ,
"
"                                        bmprd_bom_no           ,
"
"                                        bmprd_seq_no           ,
"
"                                        bmprd_sub_seq_no       ,
"
"                                        bmprd_proc_id          ,
"
"                                        bmprd_rt_hrs           ,
"
"                                        bmprd_rt_mins          ,
"
"                                        bmprd_rt_sec           ,
"
"                                        bmprd_cre_by           ,
"
"                                        bmprd_cre_emp_id       ,
"
"                                        bmprd_cre_ip_addr      ,
"
"                                        bmprd_cre_os_user      ,
"
"                                        bmprd_cre_date
"
"                                        )
"
"                                        VALUES(
"
"                                            p_bu,--bmprd_bu               ,
"
"                                            p_plnt,--bmprd_plnt             ,
"
"                                            v_new_bom_no,--bmprd_bom_no           ,
"
"                                            r_multi_res.bmpr_seq_no,--bmprd_seq_no           ,
"
"                                            r_multi_proc.bmprd_sub_seq_no,--bmprd_sub_seq_no       ,
"
"                                            r_multi_proc.bmprd_proc_id,--bmprd_proc_id          ,
"
"                                            r_multi_proc.bmprd_rt_hrs,--bmprd_rt_hrs           ,
"
"                                            r_multi_proc.bmprd_rt_mins,--bmprd_rt_mins          ,
"
"                                            r_multi_proc.bmprd_rt_sec,--bmprd_rt_sec           ,
"
"                                            p_user,--bmprd_cre_by           ,
"
"                                            func_find_emp_id(p_bu,p_user),--bmprd_cre_emp_id       ,
"
"                                            audit_info.get_ip_address,--bmprd_cre_ip_addr      ,
"
"                                            audit_info.get_os_user,--bmprd_cre_os_user      ,
"
"                                            SYSDATE--bmprd_cre_date
"
"                                               );
"
"
"
"                END LOOP c_multi_proc;
"
"
"
"            END LOOP c_multi_res;
"
"
"
"       --  IF p_eff_from < cr0.bomhd_eff_from THEN
"
"       --     NULL;--RAISE_APPLICATION_ERROR(-20539,'PLN'||'Eff. From date should be greater than Eff. From date for the Parent BOM. ' ||p_bom_no );
"
"     --    ELSE
"
"
"
"        /* Comment by Dhinesh ticket raised by priya mam     2425-810197927
"
"           UPDATE bom_hd
"
"               SET bomhd_eff_to = p_eff_from,
"
"                   bomhd_upd_by = p_user,
"
"                   bomhd_upd_ip_addr = audit_info.get_ip_address,
"
"                   bomhd_upd_os_user = audit_info.get_os_user,
"
"                   bomhd_upd_emp_id = func_find_emp_id(p_bu,p_user),
"
"               bomhd_upd_date = SYSDATE
"
"             WHERE bomhd_bu = p_bu
"
"               AND bomhd_plnt = p_plnt
"
"               AND bomhd_bom_no = v_upd_bom_no; */
"
"
"
"            p_res := v_new_bom_no;
"
"
"
"         --    END IF;
"
"
"
"          END IF;
"
"
"
"      CLOSE c0;
"
"
"
"    END proc_cre_bom_rev;
"
"
"
"    PROCEDURE proc_ins_bom_hist (p_bu                VARCHAR2,
"
"                                 p_plnt                VARCHAR2,
"
"                                 p_bom_no            VARCHAR2,
"
"                                 p_ref                VARCHAR2,
"
"                                 p_user                VARCHAR2,
"
"                                 p_res        OUT        VARCHAR2
"
"                                 )
"
"    IS
"
"
"
"
"
"
"
"    CURSOR c0
"
"        IS
"
"    SELECT *
"
"      FROM bom_hd
"
"     WHERE bomhd_bu = p_bu
"
"       AND bomhd_plnt = p_plnt
"
"       AND bomhd_bom_no = p_bom_no;
"
"
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM routing_ln
"
"     WHERE rouln_bu = p_bu
"
"       AND rouln_plnt = p_plnt
"
"       AND rouln_bom_no = p_bom_no;
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT *
"
"      FROM bom_ln
"
"     WHERE bomln_bu = p_bu
"
"       AND bomln_plnt = p_plnt
"
"       AND bomln_bom_no = p_bom_no;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT *
"
"      FROM bor_ln
"
"     WHERE borln_bu = p_bu
"
"       AND borln_plnt = p_plnt
"
"       AND borln_bom_no = p_bom_no;
"
"
"
"    CURSOR c4
"
"        IS
"
"    SELECT *
"
"      FROM bor_details
"
"     WHERE bordet_bu = p_bu
"
"       AND bordet_plnt = p_plnt
"
"       AND bordet_bom_no = p_bom_no;
"
"
"
"    CURSOR c5
"
"        IS
"
"    SELECT *
"
"      FROM bor_res_ln
"
"     WHERE brl_bu = p_bu
"
"       AND brl_plnt = p_plnt
"
"       AND brl_bom_no = p_bom_no;
"
"
"
"    CURSOR c6
"
"        IS
"
"    SELECT *
"
"      FROM proc_by_scr_prod
"
"     WHERE pbsp_bu            = p_bu
"
"       AND pbsp_plnt          = p_plnt
"
"       AND pbsp_bom_no    = p_bom_no;
"
"
"
"    cr0            c0%ROWTYPE;
"
"    v_doc_no    VARCHAR2(15);
"
"
"
"
"
"    BEGIN
"
"
"
"       OPEN c0;
"
"       FETCH c0 INTO cr0;
"
"
"
"          IF c0%NOTFOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20595,'PLN'||' '||'Bill Of Materials Not Found.');
"
"          ELSE
"
"
"
"             p_res := 'N';
"
"
"
"             SELECT NVL(MAX(TO_NUMBER(bomhdh_doc_no)),0) + 1
"
"               INTO v_doc_no
"
"               FROM bom_hd_hist
"
"              WHERE bomhdh_bu = p_bu
"
"                AND bomhdh_plnt = p_plnt;
"
"
"
"                         INSERT INTO bom_hd_hist(bomhdh_bu,
"
"                                     bomhdh_plnt,
"
"                                     bomhdh_bom_no,
"
"                                     bomhdh_doc_no,
"
"                                     bomhdh_prod_id,
"
"                                     bomhdh_prod_rev,
"
"                                     bomhdh_primary,
"
"                                     bomhdh_eff_from,
"
"                                     bomhdh_eff_to,
"
"                                     bomhdh_active_date,
"
"                                     bomhdh_cancel_date,
"
"                                     bomhdh_status,
"
"                                     bomhdh_dflt_bom,
"
"                                     bomhdh_cumm_leadtime,
"
"                                     bomhdh_prod_cat,
"
"                                     bomhdh_prod_style,
"
"                                     bomhdh_prod_color,
"
"                                     bomhdh_prod_size,
"
"                                     bomhdh_gar_bom_no,
"
"                                     bomhdh_order_no,
"
"                                     bomhdh_buyer_id,
"
"                                     bomhdh_dia,
"
"                                     bomhdh_gsm,
"
"                                     bomhdh_structure,
"
"                                     bomhdh_content,
"
"                                     bomhdh_count,
"
"                                     bomhdh_partial,
"
"                                     bomhdh_uom,
"
"                                     bomhdh_prod_uom,
"
"                                     bomhdh_conv_factor,
"
"                                     bomhdh_cre_by,
"
"                                     bomhdh_cre_date,
"
"                                     bomhdh_upd_by,
"
"                                     bomhdh_upd_date,
"
"                                     bomhdh_so_pfx,
"
"                                     bomhdh_so_no,
"
"                                     bomhdh_so_seqno,
"
"                                     bomhdh_cust_spec_mat_flag,
"
"                                     bomhdh_action_by,
"
"                                     bomhdh_action_date,
"
"                                     bomhdh_ref,
"
"                                     bomhdh_bom_name  ,
"
"                                     bomhdh_revision_num,
"
"                                     bomhdh_cre_ip_addr,
"
"                                     bomhdh_cre_os_user,
"
"                                     bomhdh_cre_emp_id,
"
"                                     bomhdh_qty)
"
"                             VALUES( p_bu,
"
"                                     p_plnt,
"
"                                     p_bom_no,
"
"                                     v_doc_no,
"
"                                     cr0.bomhd_prod_id,
"
"                                     cr0.bomhd_prod_rev,
"
"                                     cr0.bomhd_primary,
"
"                                     cr0.bomhd_eff_from,
"
"                                     cr0.bomhd_eff_to,
"
"                                     cr0.bomhd_active_date,
"
"                                     cr0.bomhd_cancel_date,
"
"                                     cr0.bomhd_status,
"
"                                     cr0.bomhd_dflt_bom,
"
"                                     cr0.bomhd_cumm_leadtime,
"
"                                     cr0.bomhd_prod_cat,
"
"                                     cr0.bomhd_prod_style,
"
"                                     cr0.bomhd_prod_color,
"
"                                     cr0.bomhd_prod_size,
"
"                                     cr0.bomhd_gar_bom_no,
"
"                                     cr0.bomhd_order_no,
"
"                                     cr0.bomhd_buyer_id,
"
"                                     cr0.bomhd_dia,
"
"                                     cr0.bomhd_gsm,
"
"                                     cr0.bomhd_structure,
"
"                                     cr0.bomhd_content,
"
"                                     cr0.bomhd_count,
"
"                                     cr0.bomhd_partial,
"
"                                     cr0.bomhd_uom,
"
"                                     cr0.bomhd_prod_uom,
"
"                                     cr0.bomhd_conv_factor,
"
"                                     cr0.bomhd_cre_by,
"
"                                     cr0.bomhd_cre_date,
"
"                                     cr0.bomhd_upd_by,
"
"                                     cr0.bomhd_upd_date,
"
"                                     cr0.bomhd_so_pfx,
"
"                                     cr0.bomhd_so_no,
"
"                                     cr0.bomhd_so_seqno,
"
"                                     cr0.bomhd_cust_spec_mat_flag,
"
"                                     p_user,
"
"                                     SYSDATE,
"
"                                     p_ref,
"
"                                     cr0.bomhd_bom_name,
"
"                                     cr0.bomhd_revision_num,
"
"                                     audit_info.get_ip_address,
"
"                                     audit_info.get_os_user,
"
"                                     func_find_emp_id(p_bu,p_user),
"
"                                     cr0.bomhd_qty);
"
"
"
"             FOR cr1 IN c1
"
"             LOOP
"
"
"
"                                INSERT INTO routing_ln_hist(roulnh_bu,
"
"                                            roulnh_plnt,
"
"                                            roulnh_bom_no,
"
"                                            roulnh_doc_no,
"
"                                            roulnh_oprn_seq_no,
"
"                                            roulnh_oprn_id,
"
"                                            roulnh_proc_id,
"
"                                            roulnh_comp_pct,
"
"                                            roulnh_ins_req,
"
"                                            roulnh_oprn_no,
"
"                                            roulnh_source_type,
"
"                                            roulnh_proc_draw_no,
"
"                                            roulnh_proc_draw_rev,
"
"                                            roulnh_ins_sheet_id,
"
"                                            roulnh_cre_by,
"
"                                            roulnh_cre_date,
"
"                                            roulnh_upd_by,
"
"                                            roulnh_upd_date,
"
"                                            roulnh_ls_flag,
"
"                                            roulnh_oprn_flag,
"
"                                            roulnh_tsa_flag,
"
"                                            roulnh_unit_weight,
"
"                                            roulnh_proc_skip_opt,
"
"                                            roulnh_action_by,
"
"                                            roulnh_action_date,
"
"                                            roulnh_oprn_ln_seq,
"
"                                            roulnh_cons_store,
"
"                                            roulnh_rcp_store,
"
"                                            roulnh_cre_ip_addr,
"
"                                            roulnh_cre_os_user,
"
"                                            roulnh_cre_emp_id,
"
"                                            roulnh_uph
"
"                                            )
"
"                                             VALUES(p_bu,
"
"                                            p_plnt,
"
"                                            p_bom_no,
"
"                                            v_doc_no,
"
"                                            cr1.rouln_oprn_seq_no,
"
"                                            cr1.rouln_oprn_id,
"
"                                            cr1.rouln_proc_id,
"
"                                            cr1.rouln_comp_pct,
"
"                                            cr1.rouln_ins_req,
"
"                                            cr1.rouln_oprn_no,
"
"                                            cr1.rouln_source_type,
"
"                                            cr1.rouln_proc_draw_no,
"
"                                            cr1.rouln_proc_draw_rev,
"
"                                            cr1.rouln_ins_sheet_id,
"
"                                            cr1.rouln_cre_by,
"
"                                            cr1.rouln_cre_date,
"
"                                            cr1.rouln_upd_by,
"
"                                            cr1.rouln_upd_date,
"
"                                            cr1.rouln_ls_flag,
"
"                                            cr1.rouln_oprn_flag,
"
"                                            cr1.rouln_tsa_flag,
"
"                                            cr1.rouln_unit_weight,
"
"                                            cr1.rouln_proc_skip_opt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr1.rouln_oprn_ln_seq,
"
"                                            cr1.rouln_cons_store,
"
"                                            cr1.rouln_rcp_store,
"
"                                            audit_info.get_ip_address,
"
"                                            audit_info.get_os_user,
"
"                                            func_find_emp_id(p_bu,p_user) ,
"
"                                            cr1.rouln_uph
"
"                                            );
"
"
"
"
"
"         END LOOP;
"
"
"
"         FOR cr2 IN c2
"
"         LOOP
"
"
"
"                              INSERT INTO bom_ln_hist ( bomlnh_bu,
"
"                                        bomlnh_plnt,
"
"                                        bomlnh_bom_no,
"
"                                        bomlnh_doc_no,
"
"                                        bomlnh_oprn_seq_no,
"
"                                        bomlnh_seq_no,
"
"                                        bomlnh_bom_type,
"
"                                        bomlnh_prod_id,
"
"                                        bomlnh_prod_rev,
"
"                                        bomlnh_store_id,
"
"                                        bomlnh_prod_uom,
"
"                                        bomlnh_uom,
"
"                                        bomlnh_conv_factor,
"
"                                        bomlnh_required_qty,
"
"                                        bomlnh_scrap_pct,
"
"                                        bomlnh_optional,
"
"                                        bomlnh_multiple,
"
"                                        bomlnh_ord_flag,
"
"                                        bomlnh_plan_pct,
"
"                                        bomlnh_min_qty,
"
"                                        bomlnh_max_qty,
"
"                                        bomlnh_item_seq_no,
"
"                                        bomlnh_matreq_uom,
"
"                                        bomlnh_phantom,
"
"                                        bomlnh_lot_no_gen_flag,
"
"                                        bomlnh_cre_by,
"
"                                        bomlnh_cre_date,
"
"                                        bomlnh_upd_by,
"
"                                        bomlnh_upd_date,
"
"                                        bomlnh_plnnd_mat_flag,
"
"                                        bomlnh_deflt_flag,
"
"                                        bomlnh_rqrd_pct,
"
"                                        bomlnh_action_by,
"
"                                        bomlnh_action_date,
"
"                                        bomlnh_gsm       ,
"
"                                        bomlnh_grain     ,
"
"                                        bomlnh_length    ,
"
"                                        bomlnh_width    ,
"
"                                        bomlnh_no_of_ups,
"
"                                        bomlnh_fdng_size ,
"
"                                        bomlnh_cre_ip_addr,
"
"                                        bomlnh_cre_os_user,
"
"                                        bomlnh_cre_emp_id,
"
"                                        bomlnh_oprn_ln_seq,
"
"                                        bomlnh_oprn_id,
"
"                                        bomlnh_proc_id,
"
"                                        bomlnh_oprn_no,
"
"                                        bomlnh_child_bom_no
"
"
"
"                                        )
"
"                                VALUES( p_bu,
"
"                                        p_plnt,
"
"                                        p_bom_no,
"
"                                        v_doc_no,
"
"                                        cr2.bomln_oprn_seq_no,
"
"                                        cr2.bomln_seq_no,
"
"                                        cr2.bomln_bom_type,
"
"                                        cr2.bomln_prod_id,
"
"                                        cr2.bomln_prod_rev,
"
"                                        cr2.bomln_store_id,
"
"                                        cr2.bomln_prod_uom,
"
"                                        cr2.bomln_uom,
"
"                                        cr2.bomln_conv_factor,
"
"                                        cr2.bomln_required_qty,
"
"                                        cr2.bomln_scrap_pct,
"
"                                        cr2.bomln_optional,
"
"                                        cr2.bomln_multiple,
"
"                                        cr2.bomln_ord_flag,
"
"                                        cr2.bomln_plan_pct,
"
"                                        cr2.bomln_min_qty,
"
"                                        cr2.bomln_max_qty,
"
"                                        cr2.bomln_item_seq_no,
"
"                                        cr2.bomln_matreq_uom,
"
"                                        cr2.bomln_phantom,
"
"                                        cr2.bomln_lot_no_gen_flag,
"
"                                        cr2.bomln_cre_by,
"
"                                        cr2.bomln_cre_date,
"
"                                        cr2.bomln_upd_by,
"
"                                        cr2.bomln_upd_date,
"
"                                        cr2.bomln_plnnd_mat_flag,
"
"                                        cr2.bomln_deflt_flag,
"
"                                        cr2.bomln_rqrd_pct,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        cr2.bomln_gsm       ,
"
"                                        cr2.bomln_grain     ,
"
"                                        cr2.bomln_length    ,
"
"                                        cr2.bomln_width    ,
"
"                                        cr2.bomln_no_of_ups,
"
"                                        cr2.bomln_fdng_size,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user),
"
"                                        cr2.bomln_oprn_ln_seq,
"
"                                        cr2.bomln_oprn_id,
"
"                                        cr2.bomln_proc_id,
"
"                                        cr2.bomln_oprn_no,
"
"                                        cr2.bomln_child_bom_no
"
"                                        );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr3 IN c3
"
"         LOOP
"
"
"
"            INSERT INTO bor_ln_hist (    borlnh_bu,
"
"                                        borlnh_plnt,
"
"                                        borlnh_bom_no,
"
"                                        borlnh_doc_no,
"
"                                        borlnh_oprn_seq_no,
"
"                                        borlnh_sub_seq_no,
"
"                                        borlnh_type,
"
"                                        borlnh_res_grp_id,
"
"                                        borlnh_units_per_hour,
"
"                                        borlnh_hrs_per_unit,
"
"                                        borlnh_mins_per_unit,
"
"                                        borlnh_basis,
"
"                                        borlnh_res_seq_no,
"
"                                        borlnh_bkup_days,
"
"                                        borlnh_res_offset_pct,
"
"                                        borlnh_uom,
"
"                                        borlnh_cre_by,
"
"                                        borlnh_cre_date,
"
"                                        borlnh_upd_by,
"
"                                        borlnh_upd_date,
"
"                                        borlnh_lot_size,
"
"                                        borlnh_secs_per_unit,
"
"                                        borlnh_lag_hrs,
"
"                                        borlnh_action_by,
"
"                                        borlnh_action_date,
"
"                                        borlnh_mpm   ,
"
"                                        borlnh_setup_hrs   ,
"
"                                        borlnh_ink_mix_hrs ,
"
"                                        borlnh_roll_chng_hrs ,
"
"                                        borlnh_no_of_units  ,
"
"                                        borlnh_res_grp_type ,
"
"                                        borlnh_priority  ,
"
"                                        borlnh_move_hrs  ,
"
"                                        borlnh_tear_down_hrs ,
"
"                                        borlnh_setup_mins ,
"
"                                        borlnh_cre_ip_addr,
"
"                                        borlnh_cre_os_user,
"
"                                        borlnh_cre_emp_id,
"
"                                        borlnh_proc_id,
"
"                                        borlnh_oprn_id,
"
"                                        borlnh_oprn_ln_seq,
"
"                                        borlnh_oprn_no,
"
"                                        borlnh_batch_hrs,
"
"                                        borlnh_batch_qty,
"
"                                        borlnh_load_secs,
"
"                                        borlnh_load_mins,
"
"                                        borlnh_load_hrs
"
"
"
"                                        )
"
"                                VALUES (p_bu,
"
"                                        p_plnt,
"
"                                        p_bom_no,
"
"                                        v_doc_no,
"
"                                        cr3.borln_oprn_seq_no,
"
"                                        cr3.borln_sub_seq_no,
"
"                                        cr3.borln_type,
"
"                                        cr3.borln_res_grp_id,
"
"                                        cr3.borln_units_per_hour,
"
"                                        cr3.borln_hrs_per_unit,
"
"                                        cr3.borln_mins_per_unit,
"
"                                        cr3.borln_basis,
"
"                                        cr3.borln_res_seq_no,
"
"                                        cr3.borln_bkup_days,
"
"                                        cr3.borln_res_offset_pct,
"
"                                        cr3.borln_uom,
"
"                                        cr3.borln_cre_by,
"
"                                        cr3.borln_cre_date,
"
"                                        cr3.borln_upd_by,
"
"                                        cr3.borln_upd_date,
"
"                                        cr3.borln_lot_size,
"
"                                        cr3.borln_secs_per_unit,
"
"                                        cr3.borln_lag_hrs,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        cr3.borln_mpm   ,
"
"                                        cr3.borln_setup_hrs   ,
"
"                                        cr3.borln_ink_mix_hrs ,
"
"                                        cr3.borln_roll_chng_hrs ,
"
"                                        cr3.borln_no_of_units  ,
"
"                                        cr3.borln_res_grp_type ,
"
"                                        cr3.borln_priority  ,
"
"                                        cr3.borln_move_hrs  ,
"
"                                        cr3.borln_tear_down_hrs ,
"
"                                        cr3.borln_setup_mins ,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user),
"
"                                        cr3.borln_proc_id,
"
"                                        cr3.borln_oprn_id,
"
"                                        cr3.borln_oprn_ln_seq,
"
"                                        cr3.borln_oprn_no,
"
"                                        cr3.borln_batch_hrs,
"
"                                        cr3.borln_batch_qty,
"
"                                        cr3.borln_load_secs,
"
"                                        cr3.borln_load_mins,
"
"                                        cr3.borln_load_hrs
"
"                                        );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr4 IN c4
"
"         LOOP
"
"
"
"                            INSERT INTO bor_details_hist(bordeth_bu,
"
"                                         bordeth_plnt,
"
"                                         bordeth_bom_no,
"
"                                         bordeth_doc_no,
"
"                                         bordeth_oprn_seq_no,
"
"                                         bordeth_sub_seq_no,
"
"                                         bordeth_res_id,
"
"                                         bordeth_priority,
"
"                                         bordeth_cre_by,
"
"                                         bordeth_cre_date,
"
"                                         bordeth_upd_by,
"
"                                         bordeth_upd_date,
"
"                                         bordeth_action_by,
"
"                                         bordeth_action_date,
"
"                                         bordeth_cre_ip_addr,
"
"                                         bordeth_cre_os_user,
"
"                                         bordeth_cre_emp_id
"
"
"
"                                         )
"
"                                    VALUES(     p_bu,
"
"                                         p_plnt,
"
"                                         p_bom_no,
"
"                                         v_doc_no,
"
"                                         cr4.bordet_oprn_seq_no,
"
"                                         cr4.bordet_sub_seq_no,
"
"                                         cr4.bordet_res_id,
"
"                                         cr4.bordet_priority,
"
"                                         cr4.bordet_cre_by,
"
"                                         cr4.bordet_cre_date,
"
"                                         cr4.bordet_upd_by,
"
"                                         cr4.bordet_upd_date,
"
"                                         NULL,
"
"                                         NULL,
"
"                                         audit_info.get_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user)
"
"                                         );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr5 IN c5
"
"         LOOP
"
"
"
"            INSERT INTO bor_res_ln_hist (brlh_bu,
"
"                                         brlh_plnt,
"
"                                         brlh_bom_no,
"
"                                         brlh_doc_no,
"
"                                         brlh_oprn_seq_no,
"
"                                         brlh_sub_seq_no,
"
"                                         brlh_res_seq_no,
"
"                                         brlh_type,
"
"                                         brlh_res_id,
"
"                                         brlh_units_per_hour,
"
"                                         brlh_hrs_per_unit,
"
"                                         brlh_mins_per_unit,
"
"                                         brlh_basis,
"
"                                         brlh_bkup_days,
"
"                                         brlh_res_offset_pct,
"
"                                         brlh_uom,
"
"                                         brlh_lot_size,
"
"                                         brlh_secs_per_unit,
"
"                                         brlh_priority,
"
"                                         brlh_cre_by,
"
"                                         brlh_cre_date,
"
"                                         brlh_upd_by,
"
"                                         brlh_upd_date,
"
"                                         brlh_lag_hrs,
"
"                                         brlh_action_by,
"
"                                         brlh_action_date,
"
"                                         brlh_cre_ip_addr,
"
"                                         brlh_cre_os_user,
"
"                                         brlh_cre_emp_id
"
"                                         )
"
"                                 VALUES(     p_bu,
"
"                                         p_plnt,
"
"                                         p_bom_no,
"
"                                         v_doc_no,
"
"                                         cr5.brl_oprn_seq_no,
"
"                                         cr5.brl_sub_seq_no,
"
"                                         cr5.brl_res_seq_no,
"
"                                         cr5.brl_type,
"
"                                         cr5.brl_res_id,
"
"                                         cr5.brl_units_per_hour,
"
"                                         cr5.brl_hrs_per_unit,
"
"                                         cr5.brl_mins_per_unit,
"
"                                         cr5.brl_basis,
"
"                                         cr5.brl_bkup_days,
"
"                                         cr5.brl_res_offset_pct,
"
"                                         cr5.brl_uom,
"
"                                         cr5.brl_lot_size,
"
"                                         cr5.brl_secs_per_unit,
"
"                                         cr5.brl_priority,
"
"                                         cr5.brl_cre_by,
"
"                                         cr5.brl_cre_date,
"
"                                         cr5.brl_upd_by,
"
"                                         cr5.brl_upd_date,
"
"                                         cr5.brl_lag_hrs,
"
"                                         NULL,
"
"                                         NULL,
"
"                                         audit_info.get_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user)
"
"                                         );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr6 IN c6
"
"         LOOP
"
"
"
"         INSERT INTO proc_by_scr_prod_hist
"
"                                        (
"
"                                         pbsph_bu,
"
"                                         pbsph_plnt,
"
"                                         pbsph_bom_no,
"
"                                         pbsph_oprn_seq_no,
"
"                                         pbsph_prod_id,
"
"                                         pbsph_prod_rev,
"
"                                         pbsph_rct_qty,
"
"                                         pbsph_sou_prod_id,
"
"                                         pbsph_sou_prod_rev,
"
"                                         pbsph_auto_gen_flag,
"
"                                         pbsph_cre_by,
"
"                                         pbsph_cre_date,
"
"                                         pbsph_cre_ip_addr,
"
"                                         pbsph_cre_os_user,
"
"                                         pbsph_cre_emp_id,
"
"                                         pbsph_proc_id,
"
"                                         pbsph_oprn_id,
"
"                                         pbsph_oprn_no,
"
"                                         pbsph_oprn_ln_seq
"
"
"
"                                        )
"
"                                    VALUES
"
"                                        (
"
"                                         p_bu,
"
"                                         p_plnt,
"
"                                         p_bom_no,
"
"                                         cr6.pbsp_oprn_seq_no,
"
"                                         cr6.pbsp_prod_id,
"
"                                         cr6.pbsp_prod_rev,
"
"                                         cr6.pbsp_rct_qty,
"
"                                         cr6.pbsp_sou_prod_id,
"
"                                         cr6.pbsp_sou_prod_rev,
"
"                                         cr6.pbsp_auto_gen_flag,
"
"                                         p_user,
"
"                                         SYSDATE,
"
"                                         audit_info.get_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user),
"
"                                         cr6.pbsp_proc_id,
"
"                                         cr6.pbsp_oprn_id,
"
"                                         cr6.pbsp_oprn_no,
"
"                                         cr6.pbsp_oprn_ln_seq
"
"                                    );
"
"
"
"
"
"         END LOOP;
"
"
"
"            p_res := 'Y';
"
"
"
"         END IF;
"
"
"
"         IF p_res ='Y' THEN
"
"
"
"            DELETE
"
"              FROM bom_hd
"
"             WHERE bomhd_bu = p_bu
"
"               AND bomhd_plnt = p_plnt
"
"               AND bomhd_bom_no = p_bom_no;
"
"
"
"            DELETE
"
"              FROM routing_ln
"
"             WHERE rouln_bu = p_bu
"
"               AND rouln_plnt = p_plnt
"
"               AND rouln_bom_no = p_bom_no;
"
"
"
"
"
"            DELETE
"
"              FROM bom_ln
"
"             WHERE bomln_bu = p_bu
"
"               AND bomln_plnt = p_plnt
"
"               AND bomln_bom_no = p_bom_no;
"
"
"
"
"
"             DELETE
"
"              FROM bor_ln
"
"             WHERE borln_bu = p_bu
"
"               AND borln_plnt = p_plnt
"
"               AND borln_bom_no = p_bom_no;
"
"
"
"            DELETE
"
"              FROM bor_details
"
"             WHERE bordet_bu = p_bu
"
"               AND bordet_plnt = p_plnt
"
"               AND bordet_bom_no = p_bom_no;
"
"
"
"
"
"            DELETE
"
"              FROM bor_res_ln
"
"             WHERE brl_bu = p_bu
"
"               AND brl_plnt = p_plnt
"
"               AND brl_bom_no = p_bom_no;
"
"
"
"
"
"            DELETE
"
"              FROM proc_by_scr_prod
"
"             WHERE pbsp_bu            = p_bu
"
"               AND pbsp_plnt          = p_plnt
"
"               AND pbsp_bom_no    = p_bom_no;
"
"
"
"         END IF;
"
"
"
"      CLOSE c0;
"
"
"
"    END proc_ins_bom_hist;
"
"
"
"PROCEDURE proc_copy_bom(p_bu            VARCHAR2,
"
"            p_plnt            VARCHAR2,
"
"            p_bom_no        VARCHAR2,
"
"            p_to_plnt        VARCHAR2,
"
"            p_prod_id        VARCHAR2,
"
"            p_prod_rev        NUMBER,
"
"            p_bom_name        VARCHAR2,
"
"            P_bom_rev        VARCHAR2,
"
"            p_bom_uom        VARCHAR2,
"
"            p_eff_from        DATE,
"
"            p_eff_to        DATE,
"
"            p_rm_rqrd        VARCHAR2,
"
"            p_user            VARCHAR2,
"
"            p_res        OUT    VARCHAR2,
"
"            p_sou_bu                VARCHAR2 DEFAULT NULL
"
"            )
"
"IS
"
"CURSOR c0
"
"    IS
"
"SELECT *
"
"  FROM bom_hd
"
" WHERE bomhd_bu = NVL(p_sou_bu,p_bu)
"
"   AND bomhd_plnt = p_plnt
"
"   AND bomhd_bom_no = p_bom_no;
"
"
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM routing_ln
"
" WHERE rouln_bu = NVL(p_sou_bu,p_bu)
"
"   AND rouln_plnt = p_plnt
"
"   AND rouln_bom_no = p_bom_no
"
"  ORDER BY rouln_oprn_seq_no;
"
"
"
"CURSOR c2(c_oprn_seq_no NUMBER)
"
"    IS
"
"SELECT *
"
"  FROM bom_ln
"
" WHERE bomln_bu = NVL(p_sou_bu,p_bu)
"
"   AND bomln_plnt = p_plnt
"
"   AND bomln_bom_no = p_bom_no
"
"   AND bomln_oprn_seq_no = c_oprn_seq_no
"
" ORDER BY bomln_oprn_seq_no,
"
"      bomln_item_seq_no;
"
"
"
"CURSOR c3(c_oprn_seq_no NUMBER)
"
"   IS
"
"SELECT *
"
"  FROM bor_ln
"
" WHERE borln_bu = NVL(p_sou_bu,p_bu)
"
"   AND borln_plnt = p_plnt
"
"   AND borln_bom_no = p_bom_no
"
"   AND borln_oprn_seq_no = c_oprn_seq_no
"
" ORDER BY borln_oprn_seq_no,
"
"          borln_sub_seq_no;
"
"
"
"CURSOR c4(c_oprn_seq_no NUMBER,c_sub_seq_no VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM bor_details
"
" WHERE bordet_bu = NVL(p_sou_bu,p_bu)
"
"   AND bordet_plnt = p_plnt
"
"   AND bordet_bom_no = p_bom_no
"
"   AND bordet_oprn_seq_no = c_oprn_seq_no
"
"   AND bordet_sub_seq_no = c_sub_seq_no
"
" ORDER BY bordet_oprn_seq_no,
"
"          bordet_sub_seq_no;
"
"
"
"CURSOR c5(c_oprn_seq_no NUMBER,c_sub_seq_no VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM bor_res_ln
"
" WHERE brl_bu = NVL(p_sou_bu,p_bu)
"
"   AND brl_plnt = p_plnt
"
"   AND brl_bom_no = p_bom_no
"
"   AND brl_oprn_seq_no = c_oprn_seq_no
"
"   AND brl_sub_seq_no = c_sub_seq_no
"
" ORDER BY brl_oprn_seq_no,
"
"           brl_sub_seq_no,
"
"           brl_res_seq_no;
"
"
"
"CURSOR c06(c_oprn_id     VARCHAR2 ,c_proc_id    VARCHAR2 ,c_loc_id VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM mfg_oprns_plnt
"
" WHERE mfgop_bu = p_bu
"
"   AND mfgop_plnt = p_to_plnt
"
"   AND mfgop_oprn_id = c_oprn_id
"
"   AND mfgop_dept_id =c_proc_id
"
"   AND MFGOP_LOC_ID = c_loc_id;
"
"
"
"CURSOR c6(c_oprn_id     VARCHAR2 ,c_loc_id VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM mfg_oprns_plnt
"
" WHERE mfgop_bu = p_bu
"
"   AND mfgop_plnt = p_to_plnt
"
"   AND mfgop_oprn_id = c_oprn_id
"
"  AND MFGOP_LOC_ID = c_loc_id;
"
"
"
"CURSOR c7 (c_prod_id VARCHAR2, c_prod_rev NUMBER)
"
"    IS
"
"SELECT *
"
"  FROM products,
"
"       prod_plants
"
" WHERE prod_bu = prodplnt_bu
"
"   AND prod_id = prodplnt_prod_id
"
"   AND prod_rev = prodplnt_prod_rev
"
"   AND prod_status = 'A'
"
"   AND prodplnt_status = 'A'
"
"   AND prodplnt_bu = p_bu
"
"   AND prodplnt_plnt = p_to_plnt
"
"   AND prodplnt_prod_id = c_prod_id
"
"   AND prodplnt_prod_rev = c_prod_rev;
"
"
"
"CURSOR c8 (c_res_grp_id     VARCHAR2,c_res_grp_type        VARCHAR2)
"
"    IS
"
"SELECT  mfgrg_grp_id
"
"FROM(
"
"SELECT mfgrg_grp_id
"
"  FROM mfg_res_groups
"
" WHERE mfgrg_bu = p_bu
"
"   AND mfgrg_plnt = p_to_plnt
"
"   AND mfgrg_grp_id = c_res_grp_id
"
"   AND c_res_grp_type ='G'
"
"UNION ALL
"
"SELECT mfgr_res_id
"
"  FROM mfg_resources
"
" WHERE mfgr_bu = p_bu
"
"   AND mfgr_plnt = p_to_plnt
"
"   AND mfgr_res_id = c_res_grp_id
"
"   AND c_res_grp_type ='R'
"
"     )
"
"   GROUP BY mfgrg_grp_id;
"
"
"
"CURSOR c9 (c_res_id VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM mfg_resources
"
" WHERE mfgr_bu = p_bu
"
"   AND mfgr_plnt = p_to_plnt
"
"   AND mfgr_res_id = c_res_id;
"
"
"
"CURSOR c10(c_oprn_seq_no NUMBER)
"
"IS
"
"SELECT *
"
"  FROM proc_by_scr_prod
"
" WHERE pbsp_bu        = NVL(p_sou_bu,p_bu)
"
"   AND pbsp_plnt      = p_plnt
"
"   AND pbsp_bom_no    = p_bom_no
"
"   AND pbsp_oprn_seq_no = c_oprn_seq_no;
"
"
"
" CURSOR c11(c_proc_id VARCHAR2)
"
" IS
"
" SELECT *
"
"   FROM processes
"
"  WHERE process_bu   = p_bu
"
"    AND process_plnt = p_to_plnt
"
"    AND process_id   = c_proc_id;
"
"
"
"    CURSOR c12(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_plnt = p_to_plnt
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c13(c_oprn_id        VARCHAR2,
"
"               c_res_type        VARCHAR2,
"
"               c_res_id            VARCHAR2)
"
"      IS
"
"    SELECT rgo_oprn_id,
"
"           mfgr_group_id
"
"      FROM res_grp_operns,
"
"           mfg_resources
"
"     WHERE rgo_bu            = mfgr_bu
"
"       AND rgo_plnt            = mfgr_plnt
"
"       AND rgo_res_grp        = mfgr_group_id
"
"       AND rgo_bu            = p_bu
"
"       AND rgo_plnt            = p_to_plnt
"
"       AND rgo_oprn_id      = c_oprn_id
"
"           AND mfgr_res_id         = c_res_id
"
"       AND c_res_type        = 'R'
"
"    UNION ALL
"
"    SELECT rgo_oprn_id,
"
"           mfgrg_grp_id mfgr_group_id
"
"      FROM res_grp_operns,
"
"           mfg_res_groups
"
"     WHERE rgo_bu            = mfgrg_bu
"
"       AND rgo_plnt            = mfgrg_plnt
"
"       AND rgo_res_grp        = mfgrg_grp_id
"
"       AND rgo_bu            = p_bu
"
"       AND rgo_plnt            = p_to_plnt
"
"       AND rgo_oprn_id          = c_oprn_id
"
"           AND mfgrg_grp_id         = c_res_id
"
"       AND c_res_type        = 'G';
"
"
"
"     CURSOR c14
"
"       IS
"
"     SELECT *
"
"       FROM bom_hd
"
"      WHERE bomhd_bu         = NVL(p_sou_bu,p_bu)
"
"        AND bomhd_plnt         = p_to_plnt
"
"        AND bomhd_bom_name         = p_bom_name
"
"        AND bomhd_revision_num     = p_bom_rev;
"
"
"
"CURSOR c_calc(c_oprn_seq_no NUMBER,c_item_seq_no NUMBER)
"
"    IS
"
"SELECT *
"
"  FROM bom_ln_rqrd_qty_calc
"
" WHERE blrqc_bu     = NVL(p_sou_bu,p_bu)
"
"   AND blrqc_plnt = p_plnt
"
"   AND blrqc_bom_no = p_bom_no
"
"   AND blrqc_oprn_seq_no = c_oprn_seq_no
"
"   AND blrqc_item_seq_no = c_item_seq_no
"
"  ORDER BY blrqc_oprn_seq_no,
"
"       blrqc_item_seq_no,
"
"       blrqc_seq_no;
"
"
"
" CURSOR c_inst(c_seq_no NUMBER)
"
"   IS
"
" SELECT *
"
"   FROM bom_proc_inst
"
"  WHERE bpi_bu   = p_bu
"
"    AND bpi_plnt = p_plnt
"
"    AND bpi_bom_no = p_bom_no
"
"    AND bpi_oper_seq_no = c_seq_no;
"
"
"
"CURSOR c_subitem(c_oprn_seq_no NUMBER,c_item_seq_no NUMBER)
"
"    IS
"
"SELECT  *
"
"  FROM bom_subst_prod
"
" WHERE bsp_bu   = p_bu
"
"   AND bsp_plnt = p_plnt
"
"   AND bsp_bom_no  = p_bom_no
"
"   AND bsp_proc_seq_no = c_oprn_seq_no
"
"   AND bsp_item_seq_no = c_item_seq_no;
"
"
"
"CURSOR c_multi_res
"
"  IS
"
"SELECT *
"
"  FROM bom_multi_proc_res
"
" WHERE bmpr_bu        = p_bu
"
"   AND bmpr_plnt    = p_plnt
"
"   AND bmpr_bom_no    = p_bom_no
"
" ORDER BY bmpr_seq_no;
"
"
"
"CURSOR c_multi_proc(c_seq_no NUMBER)
"
"  IS
"
"SELECT *
"
"  FROM bom_multi_proc_res_dtls
"
" WHERE bmprd_bu        = p_bu
"
"   AND bmprd_plnt    = p_plnt
"
"   AND bmprd_bom_no    = p_bom_no
"
"   AND bmprd_seq_no    = c_seq_no
"
" ORDER BY bmprd_seq_no,
"
"          bmprd_sub_seq_no;
"
"
"
"CURSOR c_chk_oprn
"
"  IS
"
"SELECT *
"
"  FROM planning_control
"
" WHERE planctrl_bu      = p_bu
"
"   AND planctrl_plnt    = p_plnt;
"
"
"
"
"
"CURSOR c_sub_loc (c_oprn_seq_no        NUMBER)
"
"    IS
"
"SELECT *
"
"  FROM bom_proc_work_loc
"
" WHERE bpwl_bu            =    p_bu
"
"   AND bpwl_plnt        =    p_plnt
"
"   AND bpwl_bom_no      =    p_bom_no
"
"   AND bpwl_oprn_seq_no    =    c_oprn_seq_no;
"
"
"
"CURSOR c_sub_loc_res(c_seq_no        NUMBER,
"
"                     c_sub_seq_no    NUMBER)
"
"    IS
"
"SELECT *
"
"  FROM bom_proc_work_loc_res
"
" WHERE bpwlr_bu               =    p_bu
"
"   AND bpwlr_plnt           =    p_plnt
"
"   AND bpwlr_bom_no         =     p_bom_no
"
"   AND bpwlr_seq_no         =    c_seq_no
"
"   AND bpwlr_sub_seq_no     =    c_sub_seq_no;
"
"
"
" CURSOR c15 (c_loc_id VARCHAR)
"
"   IS
"
" SELECT adp_pfx
"
"   FROM appl_doc_prefixes,appl_doc_pfx_loc
"
"  WHERE adp_bu = adpl_bu
"
"    AND adp_plnt = adpl_plnt
"
"    AND adp_pfx = adpl_pfx
"
"    AND adp_bu  = p_bu
"
"    AND adp_plnt = p_to_plnt
"
"    AND adpl_loc_id = c_loc_id
"
"    AND ADPL_DFLT_LOC = 'Y'
"
"    AND adp_doc_type = 'BOM';
"
"
"
"       v_bom_no        VARCHAR2(30);
"
"       v_dflt_store_id    VARCHAR2(15);
"
"       v_prod_uom        VARCHAR2(15);
"
"       v_error_msg        VARCHAR2(4000);
"
"       v_res        VARCHAR2(4000);
"
"       v_oprn_ln_seq    routing_ln.rouln_oprn_ln_seq%TYPE;
"
"       v_loc_id     VARCHAR2(10);
"
"      v_loc_id_proc     VARCHAR2(10);
"
"      v_proc_id     VARCHAR2(50);
"
"       cr0            c0%ROWTYPE;
"
"       cr06           c06%ROWTYPE;
"
"       cr6            c6%ROWTYPE;
"
"       cr7            c7%ROWTYPE;
"
"       cr8            c8%ROWTYPE;
"
"       cr9            c9%ROWTYPE;
"
"       cr11           c11%ROWTYPE;
"
"       cr12           c12%ROWTYPE;
"
"       cr13           c13%ROWTYPE;
"
"       cr14           c14%ROWTYPE;
"
"       cr15           c15%ROWTYPE;
"
"       r_chk_oprn     c_chk_oprn%ROWTYPE;
"
"       V_PLNT_LOC_ID VARCHAR2(10);
"
"       v_plnt_id  varchar2(10);
"
"    v_store_id    varchar2(10);
"
"    v_so_schld_desc VARCHAR2(200);
"
"    v_so_seq_no    NUMBER;
"
"    v_cust_id    VARCHAR2(10);
"
"    v_so_no    VARCHAR2(30);
"
"    v_so_pfx    VARCHAR2(10);
"
"    BEGIN
"
"
"
"           OPEN c14;
"
"       FETCH c14 INTO cr14;
"
"
"
"         IF c14%FOUND THEN
"
"           RAISE_APPLICATION_ERROR (-20780,'HRM'||' '|| 'BOM NAME/REVIISION ALREADY EXISTS FOR THIS PLANT '||p_to_plnt||' '||p_bom_name||' '||p_bom_rev);
"
"         END IF;
"
"
"
"           CLOSE c14;
"
"
"
"       OPEN c0;
"
"       FETCH c0 INTO cr0;
"
"
"
"          IF c0%NOTFOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20595,'PLN'||' '||'Bill Of Materials Not Found.');
"
"          ELSE
"
"
"
"
"
"             OPEN c7(p_prod_id, p_prod_rev);
"
"             FETCH c7 INTO cr7;
"
"
"
"                IF c7%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR (-20267,'ICM'||' '|| 'Product not found in this Plant. '||p_prod_id||' '||p_prod_rev||' '||p_to_plnt);
"
"                END IF;
"
"
"
"             CLOSE c7;
"
"
"
"             --v_bom_no   := func_find_plan_nextno(p_bu, p_to_plnt, 'BOM', p_user);
"
"             BEGIN
"
"               select bupld_loc_id
"
"                 INTO v_plnt_loc_id
"
"                 FROM bus_unit_plants_loc_dtls
"
"                WHERE bupld_bu = p_bu
"
"                  AND bupld_plnt = p_to_plnt
"
"                  AND bupld_actv_loc_flag = 'Y'
"
"                  AND bupld_dflt_loc_flag = 'Y';
"
"               EXCEPTION
"
"               WHEN NO_DATA_FOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20482,'PLN' || p_bu ||'/'||p_to_plnt ||'Unit Location not defined');
"
"               END;
"
"
"
"       -- RAISE_APPLICATION_ERROR(-20999,V_PLNT_LOC_ID);
"
"    OPEN c15(V_PLNT_LOC_ID);
"
"     FETCH c15 INTO cr15;
"
"     IF c15%NOTFOUND THEN
"
"      -- RAISE_APPLICATION_ERROR(-20748,'Prefix type control not defined.');
"
"     RAISE_APPLICATION_ERROR(-20748,'MNT'||'/'||cr15.adp_pfx||'/'||'BOM'||'/'||p_to_plnt||'/'||V_PLNT_LOC_ID);
"
"     END IF;
"
"     CLOSE c15;
"
"
"
"             v_bom_no :=   func_find_pfx_nextno(p_bu,
"
"                         TRUNC(SYSDATE),
"
"                         func_find_get_mfg_pfx(p_bu,
"
"                          V_PLNT_LOC_ID,
"
"                          p_to_plnt,
"
"                          'BOM'),
"
"                p_user);
"
"
"
"             v_prod_uom := func_find_product_uom(p_bu, p_prod_id, p_prod_rev);
"
"
"
"
"
"            BEGIN
"
"                SELECT soq_schld_desc,soq_seq_no
"
"                  INTO v_so_schld_desc,v_so_seq_no
"
"                  FROM sales_order_hd,sales_order_qtys
"
"                 WHERE soh_bu = soq_bu
"
"                   AND soh_order_no = soq_order_no
"
"                   AND soh_bu = p_bu
"
"                   AND soh_plant= p_to_plnt
"
"                   AND soh_cust_id  = cr0.bomhd_cust_id
"
"                   AND soh_order_pfx = cr0.bomhd_so_pfx
"
"                   AND soh_order_no = cr0.bomhd_so_no
"
"                   AND soq_prod_id = p_prod_id
"
"                   AND soq_prod_rev = p_prod_rev;
"
"
"
"                   v_cust_id := cr0.bomhd_cust_id;
"
"                   v_so_pfx := cr0.bomhd_so_pfx;
"
"                   v_so_no := cr0.bomhd_so_no;
"
"
"
"              EXCEPTION
"
"                WHEN NO_DATA_FOUND THEN
"
"                    v_so_schld_desc := NULL;
"
"                    v_cust_id := NULL;
"
"                    v_so_pfx := NULL;
"
"                    v_so_no := NULL;
"
"                    v_so_seq_no := NULL;
"
"              END;
"
"
"
"
"
"                             INSERT INTO bom_hd(bomhd_bu,
"
"                                bomhd_plnt,
"
"                                bomhd_bom_no,
"
"                                bomhd_prod_id,
"
"                                bomhd_prod_rev,
"
"                                bomhd_eff_from,
"
"                                bomhd_eff_to,
"
"                                bomhd_status,
"
"                                bomhd_primary,
"
"                                bomhd_uom,
"
"                                bomhd_prod_uom,
"
"                                bomhd_conv_factor,
"
"                                bomhd_cre_by,
"
"                                bomhd_cre_date,
"
"                                bomhd_bom_name    ,
"
"                                bomhd_revision_num,
"
"                                bomhd_thickness,
"
"                                bomhd_width,
"
"                                bomhd_length,
"
"                                bomhd_drg_no,
"
"                                bomhd_drg_rev,
"
"                                bomhd_model_id,
"
"                                bomhd_cre_ip_addr,
"
"                                bomhd_cre_os_user,
"
"                                bomhd_cre_emp_id,
"
"                                bomhd_first_proc_cons_rqrd,
"
"                                bomhd_qty,
"
"                                bomhd_so_schld_desc,
"
"                                bomhd_so_pfx,
"
"                                bomhd_so_no,
"
"                                bomhd_cust_id,
"
"                                bomhd_so_seqno
"
"                                )
"
"                        VALUES  (p_bu,
"
"                                p_to_plnt,
"
"                                v_bom_no,
"
"                                p_prod_id,
"
"                                p_prod_rev,
"
"                                p_eff_from,
"
"                                p_eff_to,
"
"                                'E',
"
"                                'N',
"
"                                p_bom_uom,
"
"                                v_prod_uom,
"
"                                1,
"
"                                p_user,
"
"                                SYSDATE,
"
"                                p_bom_name,
"
"                                p_bom_rev,
"
"                                cr7.prod_thickness,
"
"                                cr7.prod_width,
"
"                                cr7.prod_length,
"
"                                cr7.prod_drawing_no,
"
"                                cr7.prod_drg_rev,
"
"                                cr7.prod_model,
"
"                                audit_info.get_ip_address,
"
"                                audit_info.get_os_user,
"
"                                func_find_emp_id(p_bu,p_user) ,
"
"                                cr0.bomhd_first_proc_cons_rqrd,
"
"                                cr0.bomhd_qty,
"
"                                v_so_schld_desc,
"
"                                v_so_pfx,
"
"                                v_so_no,
"
"                                v_cust_id,
"
"                                v_so_seq_no
"
"                                );
"
"
"
"             FOR cr1 IN c1
"
"             LOOP
"
"
"
"            OPEN c_chk_oprn;
"
"            FETCH c_chk_oprn INTO r_chk_oprn;
"
"
"
"              IF r_chk_oprn.planctrl_oprn_cre = 'A' THEN
"
"                 v_oprn_ln_seq  := cr1.rouln_oprn_ln_seq;--||'-'||cr1.rouln_oprn_id;
"
"              ELSE
"
"                 v_oprn_ln_seq  := cr1.rouln_oprn_ln_seq;
"
"              END IF;
"
"
"
"            CLOSE c_chk_oprn;
"
"
"
"            BEGIN
"
"            SELECT bupld_loc_id
"
"              INTO v_loc_id
"
"              FROM bus_unit_plants_loc_dtls
"
"             WHERE bupld_bu        =    p_bu
"
"               AND bupld_plnt    =    p_to_plnt
"
"               AND bupld_dflt_loc_flag = 'Y'
"
"               AND bupld_actv_loc_flag = 'Y';
"
"
"
"               EXCEPTION
"
"               WHEN NO_DATA_FOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20482,'PLN' || p_bu ||'/'||p_to_plnt ||'Unit Location not defined');
"
"               END;
"
"
"
"               begin
"
"               SELECT bup_plant_id
"
"                 INTO v_plnt_id
"
"              FROM bus_unit_plants_loc_dtls,
"
"                   bus_unit_plants
"
"             WHERE bup_bu = bupld_bu
"
"               AND bup_plant_id = bupld_plnt
"
"               AND bupld_bu = p_bu
"
"               AND bupld_actv_loc_flag = 'Y'
"
"               AND bupld_loc_id = v_loc_id
"
"               AND EXISTS (SELECT 1 FROM appl_user_plant_access
"
"                                    WHERE auba_bu = p_bu
"
"                                      AND auba_user_id = p_user
"
"                                      AND trunc(sysdate) between  auba_from and  auba_to
"
"                                      AND auba_plant = bupld_plnt
"
"                                      AND auba_plnt_loc_id = bupld_loc_id
"
"--                                      AND auba_deflt_flag = 'Y'
"
"                                      );
"
"                                      exception
"
"                                      when no_data_found then
"
"                                         raise_application_error(-20999,'HRM' ||'Location access not available to this plant');
"
"                                      end;
"
"     OPEN c06(cr1.rouln_oprn_id,cr1.rouln_proc_id,v_loc_id);
"
"            FETCH c06 INTO cr06;
"
"               IF c06%NOTFOUND THEN
"
"                OPEN c6(cr1.rouln_oprn_id,v_loc_id);
"
"                FETCH c6 INTO cr6;
"
"                   IF c6%NOTFOUND THEN
"
"                      RAISE_APPLICATION_ERROR(-20474,'SFM'||' '||'Process not found in this Plant. '||cr1.rouln_oprn_id ||' '||p_to_plnt);
"
"                   END IF;
"
"                CLOSE c6;
"
"               END IF;
"
"    CLOSE c06;
"
"
"
"
"
"              BEGIN
"
"                  SELECT MFGOP_LOC_ID
"
"                    INTO v_loc_id_proc
"
"                    FROM mfg_oprns_plnt
"
"                   WHERE mfgop_bu = p_bu
"
"                     AND mfgop_plnt = p_to_plnt
"
"                     AND MFGOP_LOC_ID = v_loc_id
"
"                     GROUP BY MFGOP_LOC_ID;
"
"                EXCEPTION
"
"                     WHEN NO_DATA_FOUND THEN
"
"                          RAISE_APPLICATION_ERROR(-20474,'SFM'||' '||'Process not found in this Location. '||cr1.rouln_oprn_id ||' '||p_to_plnt ||' '||v_loc_id);
"
"                     END;
"
"
"
"
"
"                --v_error_msg := cr1.rouln_oprn_id||'~'||func_find_oper_desc(p_bu,cr1.rouln_oprn_id,1)||p_to_plnt||p_plnt;
"
"
"
"                /*OPEN c11(cr6.mfgop_dept_id);
"
"                FETCH c11 INTO cr11;
"
"                IF c11%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||cr6.mfgop_dept_id);
"
"                END IF;
"
"                CLOSE c11;
"
"
"
"                OPEN c12(cr6.mfgop_cons_store);
"
"                FETCH c12 INTO cr12;
"
"                IF c12%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20270,'ICM'||'~'||cr6.mfgop_cons_store);
"
"                END IF;
"
"                CLOSE c12;
"
"
"
"                OPEN c12(cr6.mfgop_rcp_store);
"
"                FETCH c12 INTO cr12;
"
"                IF c12%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20270,'ICM'||'~'||cr6.mfgop_rcp_store);
"
"                END IF;
"
"                CLOSE c12;*/
"
"--RAISE_APPLICATION_ERROR(-20270,'ICM'||'~'||v_loc_id);
"
"
"
"
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM'||CASE WHEN func_find_prod_ser_lot_type(p_bu ,p_prod_id,p_prod_rev)='N' THEN 'N' ELSE cr1.rouln_ls_flag END);
"
"
"
"                            INSERT INTO routing_ln(rouln_bu         ,
"
"                                       rouln_plnt       ,
"
"                                       rouln_bom_no     ,
"
"                                       rouln_oprn_seq_no,
"
"                                       rouln_oprn_no    ,
"
"                                       rouln_oprn_id    ,
"
"                                       rouln_oprn_flag,
"
"                                       rouln_proc_id    ,
"
"                                       rouln_comp_pct   ,
"
"                                       rouln_ins_req    ,
"
"                                       rouln_cre_by     ,
"
"                                       rouln_cre_date   ,
"
"                                       rouln_cons_store ,
"
"                                       rouln_rcp_store  ,
"
"                                       rouln_sf_auto_mr  ,
"
"                                       rouln_ls_flag,
"
"                                       rouln_tsa_flag,
"
"                                       rouln_oprn_hrs,
"
"                                       rouln_oprn_mins,
"
"                                       rouln_unit_weight,
"
"                                       rouln_oprn_ln_seq,
"
"                                       rouln_secs  ,
"
"                                       rouln_sco_flag ,
"
"                                       rouln_lag_hrs  ,
"
"                                       rouln_lag_mins ,
"
"                                       rouln_lag_hrs_qty  ,
"
"                                       rouln_loc_id,
"
"                                       rouln_cre_ip_addr,
"
"                                       rouln_cre_os_user,
"
"                                       rouln_cre_emp_id,
"
"                                       rouln_uph
"
"                                       )
"
"                                VALUES(
"
"                                       p_bu             ,
"
"                                       p_to_plnt         ,
"
"                                       v_bom_no        ,
"
"                                       cr1.rouln_oprn_seq_no,
"
"                                       cr1.rouln_oprn_no    ,
"
"                                       cr1.rouln_oprn_id    ,
"
"                                       cr1.rouln_oprn_flag,
"
"                                       NVL(cr06.mfgop_dept_id,cr6.mfgop_dept_id)    ,
"
"                                       cr1.rouln_comp_pct    ,
"
"                                       cr1.rouln_ins_req        ,
"
"                                       p_user        ,
"
"                                       SYSDATE,
"
"                                       NVL(cr06.mfgop_cons_store ,cr6.mfgop_cons_store ),
"
"                                       NVL(cr06.mfgop_rcp_store ,cr6.mfgop_rcp_store ),
"
"                                       cr1.rouln_sf_auto_mr,
"
"                                       CASE WHEN func_find_prod_ser_lot_type(p_bu ,p_prod_id,p_prod_rev)='N' THEN 'N' ELSE cr1.rouln_ls_flag END,
"
"                                       cr1.rouln_tsa_flag,
"
"                                       0,--cr1.rouln_oprn_hrs,
"
"                                       0,--cr1.rouln_oprn_mins,
"
"                                       cr1.rouln_unit_weight,
"
"                                       v_oprn_ln_seq,
"
"                                       0,--cr1.rouln_secs  ,
"
"                                       cr1.rouln_sco_flag ,
"
"                                       cr1.rouln_lag_hrs  ,
"
"                                       cr1.rouln_lag_mins ,
"
"                                       cr1.rouln_lag_hrs_qty  ,
"
"                                       v_loc_id,
"
"                                       audit_info.get_ip_address,
"
"                                       audit_info.get_os_user,
"
"                                       func_find_emp_id(p_bu,p_user)  ,
"
"                                       cr1.rouln_uph
"
"                                   );
"
"
"
"
"
"                FOR r_sub_loc in c_sub_loc(cr1.rouln_oprn_seq_no)
"
"                LOOP
"
"                        INSErt INTO bom_proc_work_loc ( bpwl_bu                 ,
"
"                                                        bpwl_plnt               ,
"
"                                                        bpwl_bom_no             ,
"
"                                                        bpwl_oprn_seq_no        ,
"
"                                                        bpwl_sub_seq_no         ,
"
"                                                        bpwl_loc_id             ,
"
"                                                        bpwl_wrk_ctr            ,
"
"                                                        bpwl_cons_store_id      ,
"
"                                                        bpwl_rct_store_id       ,
"
"                                                        bpwl_cre_by             ,
"
"                                                        bpwl_cre_ip_addr        ,
"
"                                                        bpwl_cre_os_user        ,
"
"                                                        bpwl_cre_emp_id         ,
"
"                                                        bpwl_cre_date
"
"
"
"                                            ) VALUES (    p_bu, --bpwl_bu                 ,
"
"                                                        p_to_plnt, --bpwl_plnt              ,
"
"                                                        v_bom_no, --bpwl_bom_no             ,
"
"                                                        r_sub_loc.bpwl_oprn_seq_no, --bpwl_oprn_seq_no        ,
"
"                                                        r_sub_loc.bpwl_sub_seq_no, --bpwl_sub_seq_no         ,
"
"                                                        r_sub_loc.bpwl_loc_id, --bpwl_loc_id             ,
"
"                                                        r_sub_loc.bpwl_wrk_ctr, --bpwl_wrk_ctr            ,
"
"                                                        r_sub_loc.bpwl_cons_store_id, --bpwl_cons_store_id      ,
"
"                                                        r_sub_loc.bpwl_rct_store_id, --bpwl_rct_store_id       ,
"
"                                                        p_user, --bpwl_cre_by             ,
"
"                                                        audit_info.get_ip_address,  --bpwl_cre_ip_addr        ,
"
"                                                        audit_info.get_os_user,     --bpwl_cre_os_user        ,
"
"                                                        func_find_emp_id(p_bu, p_user),  --bpwl_cre_emp_id,       ,
"
"                                                        SYSDATE--bpwl_cre_date
"
"                                                      );
"
"
"
"                    FOR r_sub_loc_res IN c_sub_loc_res (cr1.rouln_oprn_seq_no, r_sub_loc.bpwl_sub_seq_no)
"
"                    LOOP
"
"                            INSERT INTO bom_proc_work_loc_res    (     bpwlr_bu              ,
"
"                                                                     bpwlr_plnt            ,
"
"                                                                     bpwlr_bom_no          ,
"
"                                                                     bpwlr_seq_no          ,
"
"                                                                     bpwlr_sub_seq_no      ,
"
"                                                                     bpwlr_res_seq_no      ,
"
"                                                                     bpwlr_type            ,
"
"                                                                     bpwlr_res_grp_type    ,
"
"                                                                     bpwlr_res_grp_id      ,
"
"                                                                     bpwlr_uom             ,
"
"                                                                     bpwlr_basis           ,
"
"                                                                     bpwlr_lot_size        ,
"
"                                                                     bpwlr_setup_hrs       ,
"
"                                                                     bpwlr_setup_mins      ,
"
"                                                                     bpwlr_units_per_hour  ,
"
"                                                                     bpwlr_hrs_per_unit    ,
"
"                                                                     bpwlr_mins_per_unit   ,
"
"                                                                     bpwlr_secs_per_unit   ,
"
"                                                                     bpwlr_batch_qty       ,
"
"                                                                     bpwlr_batch_hrs       ,
"
"                                                                     bpwlr_load_hrs        ,
"
"                                                                     bpwlr_load_mins       ,
"
"                                                                     bpwlr_load_secs       ,
"
"                                                                     bpwlr_priority        ,
"
"                                                                     bpwlr_cre_by          ,
"
"                                                                     bpwlr_cre_ip_addr     ,
"
"                                                                     bpwlr_cre_os_user     ,
"
"                                                                     bpwlr_cre_emp_id      ,
"
"                                                                     bpwlr_cre_date
"
"                                                    )   VALUES  (    p_bu, -- bpwlr_bu              ,
"
"                                                                    p_to_plnt,  -- bpwlr_plnt            ,
"
"                                                                    v_bom_no, -- bpwlr_bom_no          ,
"
"                                                                    r_sub_loc_res.bpwlr_seq_no, -- bpwlr_seq_no          ,
"
"                                                                    r_sub_loc_res.bpwlr_sub_seq_no, -- bpwlr_sub_seq_no      ,
"
"                                                                    r_sub_loc_res.bpwlr_res_seq_no , -- bpwlr_res_seq_no      ,
"
"                                                                    r_sub_loc_res.bpwlr_type, -- bpwlr_type            ,
"
"                                                                    r_sub_loc_res.bpwlr_res_grp_type, -- bpwlr_res_grp_type    ,
"
"                                                                    r_sub_loc_res.bpwlr_res_grp_id , -- bpwlr_res_grp_id      ,
"
"                                                                    r_sub_loc_res.bpwlr_uom, -- bpwlr_uom             ,
"
"                                                                    r_sub_loc_res.bpwlr_basis, -- bpwlr_basis           ,
"
"                                                                    r_sub_loc_res.bpwlr_lot_size ,-- bpwlr_lot_size         ,
"
"                                                                    r_sub_loc_res.bpwlr_setup_hrs , -- bpwlr_setup_hrs       ,
"
"                                                                    r_sub_loc_res.bpwlr_setup_mins , -- bpwlr_setup_mins      ,
"
"                                                                    r_sub_loc_res.bpwlr_units_per_hour, -- bpwlr_units_per_hour  ,
"
"                                                                    r_sub_loc_res.bpwlr_hrs_per_unit ,-- bpwlr_hrs_per_unit    ,
"
"                                                                    r_sub_loc_res.bpwlr_mins_per_unit ,-- bpwlr_mins_per_unit   ,
"
"                                                                    r_sub_loc_res.bpwlr_secs_per_unit ,-- bpwlr_secs_per_unit   ,
"
"                                                                    r_sub_loc_res.bpwlr_batch_qty,  -- bpwlr_batch_qty       ,
"
"                                                                    r_sub_loc_res.bpwlr_batch_hrs , -- bpwlr_batch_hrs       ,
"
"                                                                    r_sub_loc_res.bpwlr_load_hrs, -- bpwlr_load_hrs        ,
"
"                                                                    r_sub_loc_res.bpwlr_load_mins, -- bpwlr_load_mins       ,
"
"                                                                    r_sub_loc_res.bpwlr_load_secs , -- bpwlr_load_secs       ,
"
"                                                                    r_sub_loc_res.bpwlr_priority, -- bpwlr_priority        ,
"
"                                                                    p_user , -- bpwlr_cre_by          ,
"
"                                                                    audit_info.get_ip_address,-- bpwlr_cre_ip_addr     ,
"
"                                                                    audit_info.get_os_user,      -- bpwlr_cre_os_user     ,
"
"                                                                    func_find_emp_id(p_bu, p_user), -- bpwlr_cre_emp_id      ,
"
"                                                                    SYSDATE -- bpwlr_cre_date
"
"                                                                );
"
"                    END LOOP c_sub_loc_res;
"
"                END LOOP c_sub_loc;
"
"
"
"
"
"             IF p_rm_rqrd = 'Y' THEN
"
"
"
"             FOR cr2 IN c2(cr1.rouln_oprn_seq_no)
"
"             LOOP
"
"                                --RAISE_APPLICATION_ERROR(-20999,'HRM'||' '||p_to_plnt||' '||v_bom_no||' '||cr2.bomln_seq_no||'seq'||cr2.bomln_oprn_seq_no);
"
"                OPEN c7(cr2.bomln_prod_id, cr2.bomln_prod_rev);
"
"                FETCH c7 INTO cr7;
"
"
"
"                   IF c7%NOTFOUND THEN
"
"                      RAISE_APPLICATION_ERROR (-20267,'ICM'||' '|| 'Product not found in this Plant. '||cr2.bomln_prod_id||' '||cr2.bomln_prod_rev||' '||p_to_plnt);
"
"                   END IF;
"
"
"
"                CLOSE c7;
"
"
"
"                v_error_msg := p_bu||' ' ||p_to_plnt||' '||v_bom_no||' '||cr2.bomln_seq_no||'OPRN. SEQ'||cr2.bomln_oprn_seq_no;
"
"
"
"                v_dflt_store_id := func_find_deflt_storeid(p_bu, p_to_plnt,v_loc_id, cr2.bomln_prod_id, cr2.bomln_prod_rev, 'Y');
"
"
"
"OPEN c06(cr2.BOMLN_OPRN_ID,cr2.BOMLN_PROC_ID,v_loc_id);
"
"    FETCH c06 INTO cr06;
"
"        IF c06%NOTFOUND THEN
"
"         OPEN c6(cr2.BOMLN_OPRN_ID,v_loc_id);
"
"          FETCH c6 INTO cr6;
"
"            IF c6%NOTFOUND THEN
"
"              RAISE_APPLICATION_ERROR(-20999,'HRM'||'  '||'Work Center not found in this Plant.'||p_to_plnt||' ' ||cr2.BOMLN_PROC_ID||' '||cr2.BOMLN_OPRN_ID);
"
"             END IF;
"
"         CLOSE c6;
"
"        END IF;
"
"CLOSE c06;
"
"/*
"
"BEGIN
"
"     SELECT process_id
"
"           INTO v_proc_id
"
"        FROM processes
"
"        WHERE process_bu = p_bu
"
"        AND process_plnt = p_to_plnt
"
"        AND process_id =  cr2.bomln_proc_id;
"
"    EXCEPTION WHEN no_data_found THEN
"
"     RAISE_APPLICATION_ERROR(-20999,'HRM'||'  '||'Work Center not found in this Plant.');
"
"    END;
"
"*/
"
"
"
"                        INSERT INTO bom_ln(bomln_bu               ,
"
"                                   bomln_plnt             ,
"
"                                   bomln_bom_no           ,
"
"                                   bomln_item_seq_no      ,
"
"                                   bomln_cons_seq_no,
"
"                                   bomln_oprn_seq_no      ,
"
"                                   bomln_seq_no           ,
"
"                                   bomln_bom_type         ,
"
"                                   bomln_prod_id          ,
"
"                                   bomln_prod_rev         ,
"
"                                   bomln_store_id         ,
"
"                                   bomln_prod_uom         ,
"
"                                   bomln_uom              ,
"
"                                   bomln_conv_factor      ,
"
"                                   bomln_required_qty     ,
"
"                                   bomln_scrap_pct        ,
"
"                                   bomln_optional         ,
"
"                                   bomln_multiple         ,
"
"                                   bomln_ord_flag         ,
"
"                                   bomln_phantom          ,
"
"                                   bomln_matreq_uom       ,
"
"                                   bomln_cre_by           ,
"
"                                   bomln_cre_date         ,
"
"                                   bomln_plan_pct          ,
"
"                                   bomln_min_qty          ,
"
"                                   bomln_max_qty          ,
"
"                                   bomln_lot_no_gen_flag  ,
"
"                                   bomln_plnnd_mat_flag   ,
"
"                                   bomln_deflt_flag       ,
"
"                                   bomln_rqrd_pct          ,
"
"                                   bomln_tolr_flag       ,
"
"                                   bomln_tolr_upr_lmt    ,
"
"                                   bomln_tolr_lwr_lmt    ,
"
"                                   bomln_scrap_uom      ,
"
"                                   bomln_scrap_qty      ,
"
"                                   bomln_byprod_uom     ,
"
"                                   bomln_byprod_qty       ,
"
"                                   bomln_fmcg_conv_fact_req_flag   ,
"
"                                   bomln_os_rqrd_qty       ,
"
"                                   bomln_rej_cons_flag    ,
"
"                                   bomln_subcntr_cnr    ,
"
"                                   bomln_loc            ,
"
"                                   bomln_mftr_part_no   ,
"
"                                   bomln_remarks    ,
"
"                                   bomln_wbs       ,
"
"                                   bomln_ecn_ref,
"
"                                   bomln_child_bom_no,
"
"                                   bomln_bom_name,
"
"                                   bomln_revision_num,
"
"                                   bomln_gsm      ,
"
"                                   bomln_grain    ,
"
"                                   bomln_length    ,
"
"                                   bomln_width    ,
"
"                                   bomln_no_of_ups,
"
"                                   bomln_fdng_size,
"
"                                   bomln_ply_type   ,
"
"                                   bomln_flute_type ,
"
"                                   bomln_thickness   ,
"
"                                   bomln_fab_thickness ,
"
"                                   bomln_fab_width  ,
"
"                                   bomln_fab_length,
"
"                                   bomln_cls_type     ,
"
"                         bomln_fab_type,
"
"                        bomln_fab_min_od,
"
"                        bomln_fab_max_od,
"
"                        bomln_fab_height,
"
"                        bomln_fab_od,
"
"                        bomln_fab_id,
"
"                        bomln_fab_angle_side1,
"
"                        bomln_fab_angle_side2,
"
"                        bomln_fab_side_a,
"
"                        bomln_fab_side_b,
"
"                        bomln_cre_ip_addr,
"
"                        bomln_cre_os_user,
"
"                        bomln_cre_emp_id,
"
"            bomln_oprn_no,
"
"            bomln_oprn_ln_seq,
"
"            bomln_oprn_id,
"
"            bomln_proc_id,
"
"            bomln_subst_item_avbl
"
")
"
"                                VALUES ( p_bu                  ,
"
"                                   p_to_plnt          ,
"
"                                   v_bom_no                  ,
"
"                                   cr2.bomln_item_seq_no      ,
"
"                                   cr2.bomln_cons_seq_no,
"
"                                   cr1.rouln_oprn_seq_no     ,
"
"                                   cr2.bomln_seq_no           ,
"
"                                   cr2.bomln_bom_type         ,
"
"                                   cr2.bomln_prod_id      ,
"
"                                   cr2.bomln_prod_rev         ,
"
"                                   v_dflt_store_id            ,
"
"                                   cr2.bomln_prod_uom         ,
"
"                                   cr2.bomln_uom              ,
"
"                                   cr2.bomln_conv_factor      ,
"
"                                   cr2.bomln_required_qty     ,
"
"                                   cr2.bomln_scrap_pct        ,
"
"                                   cr2.bomln_optional         ,
"
"                                   cr2.bomln_multiple         ,
"
"                                   cr2.bomln_ord_flag         ,
"
"                                   cr2.bomln_phantom          ,
"
"                                   cr2.bomln_matreq_uom       ,
"
"                                   p_user                     ,
"
"                                   SYSDATE                    ,
"
"                                   cr2.bomln_plan_pct      ,
"
"                                   cr2.bomln_min_qty          ,
"
"                                   cr2.bomln_max_qty          ,
"
"                                   cr2.bomln_lot_no_gen_flag  ,
"
"                                   cr2.bomln_plnnd_mat_flag   ,
"
"                                   cr2.bomln_deflt_flag       ,
"
"                                   cr2.bomln_rqrd_pct,
"
"                                   cr2.bomln_tolr_flag       ,
"
"                                   cr2.bomln_tolr_upr_lmt    ,
"
"                                   cr2.bomln_tolr_lwr_lmt    ,
"
"                                   cr2.bomln_scrap_uom      ,
"
"                                   cr2.bomln_scrap_qty      ,
"
"                                   cr2.bomln_byprod_uom     ,
"
"                                   cr2.bomln_byprod_qty       ,
"
"                                   cr2.bomln_fmcg_conv_fact_req_flag   ,
"
"                                   cr2.bomln_os_rqrd_qty       ,
"
"                                   cr2.bomln_rej_cons_flag    ,
"
"                                   cr2.bomln_subcntr_cnr    ,
"
"                                   cr2.bomln_loc            ,
"
"                                   cr2.bomln_mftr_part_no   ,
"
"                                   cr2.bomln_remarks    ,
"
"                                   cr2.bomln_wbs       ,
"
"                                   cr2.bomln_ecn_ref,
"
"                                   cr2.bomln_child_bom_no,
"
"                                   cr2.bomln_bom_name,
"
"                                   cr2.bomln_revision_num,
"
"                                   cr2.bomln_gsm      ,
"
"                                   cr2.bomln_grain    ,
"
"                                   cr2.bomln_length    ,
"
"                                   cr2.bomln_width    ,
"
"                                   cr2.bomln_no_of_ups,
"
"                                   cr2.bomln_fdng_size    ,
"
"                                   cr2.bomln_ply_type   ,
"
"                                   cr2.bomln_flute_type ,
"
"                                   cr2.bomln_thickness   ,
"
"                                   cr2.bomln_fab_thickness ,
"
"                                   cr2.bomln_fab_width  ,
"
"                                   cr2.bomln_fab_length,
"
"                                   cr2.bomln_cls_type ,
"
"                                    cr2.bomln_fab_type,
"
"                                    cr2.bomln_fab_min_od,
"
"                                    cr2.bomln_fab_max_od,
"
"                                    cr2.bomln_fab_height,
"
"                                    cr2.bomln_fab_od,
"
"                                    cr2.bomln_fab_id,
"
"                                    cr2.bomln_fab_angle_side1,
"
"                                    cr2.bomln_fab_angle_side2,
"
"                                    cr2.bomln_fab_side_a,
"
"                                    cr2.bomln_fab_side_b,
"
"                                    audit_info.get_ip_address,
"
"                                    audit_info.get_os_user,
"
"                                    func_find_emp_id(p_bu,p_user),
"
"                    cr2.bomln_oprn_no,
"
"                    cr2.bomln_oprn_ln_seq,
"
"                    cr2.bomln_oprn_id,
"
"                    NVL(cr06.mfgop_dept_id,cr6.mfgop_dept_id),--v_proc_id
"
"                    cr2.bomln_subst_item_avbl
"
"                                   );
"
"
"
"                 FOR cr_subitem IN c_subitem(cr2.bomln_oprn_seq_no,cr2.bomln_seq_no)
"
"                 LOOP
"
"                            INSERT INTO bom_subst_prod (bsp_bu      ,
"
"                                        bsp_plnt    ,
"
"                                        bsp_bom_no  ,
"
"                                        bsp_proc_seq_no ,
"
"                                        bsp_item_seq_no ,
"
"                                        bsp_seq_no   ,
"
"                                        bsp_prod_id ,
"
"                                        bsp_prod_rev ,
"
"                                        bsp_uom   ,
"
"                                        bsp_bom_qty ,
"
"                                        bsp_cre_by  ,
"
"                                        bsp_cre_date       ,
"
"                                        bsp_cre_ip_addr,
"
"                                        bsp_cre_os_user,
"
"                                        bsp_cre_emp_id
"
"                                        )
"
"                                          VALUES
"
"                                           (p_bu      ,
"
"                                        p_to_plnt    ,
"
"                                        v_bom_no  ,
"
"                                        cr_subitem.bsp_proc_seq_no ,
"
"                                        cr_subitem.bsp_item_seq_no ,
"
"                                        cr_subitem.bsp_seq_no   ,
"
"                                        cr_subitem.bsp_prod_id ,
"
"                                        cr_subitem.bsp_prod_rev ,
"
"                                        cr_subitem.bsp_uom   ,
"
"                                        cr_subitem.bsp_bom_qty ,
"
"                                        p_user  ,
"
"                                        SYSDATE,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user)
"
"                                           );
"
"
"
"                 END LOOP cr_subitem;
"
"
"
"                 FOR r_calc IN c_calc(cr2.bomln_oprn_seq_no,cr2.bomln_item_seq_no)
"
"                 LOOP
"
"
"
"                                 INSERT INTO bom_ln_rqrd_qty_calc
"
"                                            (
"
"                                            blrqc_bu              ,
"
"                                            blrqc_plnt            ,
"
"                                            blrqc_bom_no          ,
"
"                                            blrqc_oprn_seq_no     ,
"
"                                            blrqc_item_seq_no     ,
"
"                                            blrqc_seq_no          ,
"
"                                            blrqc_len1            ,
"
"                                            blrqc_dia1            ,
"
"                                            blrqc_oper            ,
"
"                                            blrqc_len2            ,
"
"                                            blrqc_dia2            ,
"
"                                            blrqc_rqrd_qty        ,
"
"                                            blrqc_cre_by          ,
"
"                                            blrqc_cre_date ,
"
"                                            blrqc_cre_ip_addr,
"
"                                            blrqc_cre_os_user,
"
"                                            blrqc_cre_emp_id
"
"                                            )
"
"                                    VALUES
"
"                                            (
"
"                                             p_bu              ,
"
"                                             p_to_plnt            ,
"
"                                             v_bom_no          ,
"
"                                             r_calc.blrqc_oprn_seq_no     ,
"
"                                             r_calc.blrqc_item_seq_no     ,
"
"                                             r_calc.blrqc_seq_no          ,
"
"                                             r_calc.blrqc_len1            ,
"
"                                             r_calc.blrqc_dia1            ,
"
"                                             r_calc.blrqc_oper            ,
"
"                                             r_calc.blrqc_len2            ,
"
"                                             r_calc.blrqc_dia2            ,
"
"                                             r_calc.blrqc_rqrd_qty        ,
"
"                                             p_user          ,
"
"                                             SYSDATE        ,
"
"                                            audit_info.get_ip_address,
"
"                                            audit_info.get_os_user,
"
"                                            func_find_emp_id(p_bu,p_user)
"
"                                            );
"
"
"
"
"
"                 END LOOP c_calc;
"
"
"
"             END LOOP c2;
"
"
"
"             END IF;
"
"
"
"           /*  FOR cr3 IN c3(cr1.rouln_oprn_seq_no)
"
"             LOOP
"
"
"
"                OPEN c8(cr3.borln_res_grp_id,cr3.borln_res_grp_type);
"
"                FETCH c8 INTO cr8;
"
"
"
"                   IF c8%NOTFOUND THEN
"
"                      RAISE_APPLICATION_ERROR (-20555,'PLN'||' '|| 'Resource Group  not found in this unit. '
"
"                      ||cr3.borln_res_grp_id||' '||p_to_plnt
"
"                      ||'/'||CR3.BORLN_RES_GRP_TYPE );
"
"                   END IF;
"
"
"
"                CLOSE c8;
"
"
"
"
"
"                OPEN c13(cr1.rouln_oprn_id,cr3.borln_res_grp_type,cr3.borln_res_grp_id);
"
"                FETCH c13 INTO cr13;
"
"
"
"                  IF c13%NOTFOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20566,'PLN'||' '||'Resource group not defined for this operation. '
"
"                                   ||cr1.rouln_oprn_id||' '||cr3.borln_res_grp_id||' '||p_to_plnt);
"
"                  END IF;
"
"
"
"                CLOSE c13;
"
"
"
"
"
"                          INSERT INTO bor_ln( borln_bu                   ,
"
"                                                borln_plnt                 ,
"
"                                                borln_bom_no               ,
"
"                                                borln_oprn_seq_no          ,
"
"                                                borln_sub_seq_no           ,
"
"                                                borln_res_seq_no    ,
"
"                                                borln_type                 ,
"
"                                                borln_res_grp_id           ,
"
"                                                borln_units_per_hour       ,
"
"                                                borln_hrs_per_unit      ,
"
"                                                borln_mins_per_unit        ,
"
"                                                borln_bkup_days        ,
"
"                                                borln_cre_by               ,
"
"                                                borln_cre_date             ,
"
"                                                borln_upd_by               ,
"
"                                                borln_upd_date          ,
"
"                                                borln_basis             ,
"
"                                                borln_res_offset_pct    ,
"
"                                                borln_uom               ,
"
"                                                borln_lot_size          ,
"
"                                                borln_secs_per_unit,
"
"                                                borln_res_grp_type,
"
"                                                borln_priority,
"
"                                                borln_lag_hrs,
"
"                                                borln_mpm   ,
"
"                                                borln_setup_hrs   ,
"
"                                                borln_ink_mix_hrs ,
"
"                                                borln_roll_chng_hrs ,
"
"                                                borln_no_of_units  ,
"
"                                                borln_move_hrs  ,
"
"                                                borln_tear_down_hrs ,
"
"                                                borln_setup_mins,
"
"                                                borln_cre_ip_addr,
"
"                                                borln_cre_os_user,
"
"                                                borln_cre_emp_id,
"
"                                                borln_load_hrs   ,
"
"                                                borln_load_mins  ,
"
"                                                borln_load_secs   ,
"
"                        borln_oprn_id,
"
"                        borln_proc_id,
"
"                        borln_oprn_ln_seq,
"
"                        borln_oprn_no
"
"                                                )
"
"                                               VALUES( p_bu              ,
"
"                                                p_to_plnt         ,
"
"                                                v_bom_no         ,
"
"                                                cr1.rouln_oprn_seq_no     ,
"
"                                                cr3.borln_sub_seq_no     ,
"
"                                                cr3.borln_res_seq_no     ,
"
"                                                cr3.borln_type         ,
"
"                                                cr3.borln_res_grp_id     ,
"
"                                                cr3.borln_units_per_hour ,
"
"                                                cr3.borln_hrs_per_unit     ,
"
"                                                cr3.borln_mins_per_unit     ,
"
"                                                1                        ,
"
"                                                p_user             ,
"
"                                                SYSDATE             ,
"
"                                                NULL             ,
"
"                                                NULL                     ,
"
"                                                cr3.borln_basis          ,
"
"                                                cr3.borln_res_offset_pct ,
"
"                                                cr3.borln_uom            ,
"
"                                                cr3.borln_lot_size       ,
"
"                                                cr3.borln_secs_per_unit,
"
"                                                cr3.borln_res_grp_type,
"
"                                                    cr3.borln_priority,
"
"                                                    cr3.borln_lag_hrs,
"
"                                                cr3.borln_mpm   ,
"
"                                                cr3.borln_setup_hrs   ,
"
"                                                cr3.borln_ink_mix_hrs ,
"
"                                                cr3.borln_roll_chng_hrs ,
"
"                                                cr3.borln_no_of_units  ,
"
"                                                cr3.borln_move_hrs  ,
"
"                                                cr3.borln_tear_down_hrs ,
"
"                                                cr3.borln_setup_mins,
"
"                                                audit_info.get_ip_address,
"
"                                                audit_info.get_os_user,
"
"                                                func_find_emp_id(p_bu,p_user),
"
"                                                cr3.borln_load_hrs   ,
"
"                                                cr3.borln_load_mins  ,
"
"                                                cr3.borln_load_secs,
"
"                        cr3.borln_oprn_id,
"
"                        cr3.borln_proc_id,
"
"                        cr3.borln_oprn_ln_seq,
"
"                        cr3.borln_oprn_no
"
"                                                );
"
"
"
"                 FOR cr4 IN c4(cr3.borln_oprn_seq_no,cr3.borln_sub_seq_no)
"
"                 LOOP
"
"
"
"                    OPEN c9(cr4.bordet_res_id);
"
"                    FETCH c9 INTO cr9;
"
"
"
"                       IF c9%NOTFOUND THEN
"
"                          RAISE_APPLICATION_ERROR (-20454,'SFM'||' '|| 'Resource not found. '||cr4.bordet_res_id||' '||p_to_plnt);
"
"                       END IF;
"
"
"
"                    CLOSE c9;
"
"
"
"                INSERT INTO bor_details(            bordet_bu              ,
"
"                                        bordet_plnt            ,
"
"                                        bordet_bom_no          ,
"
"                                        bordet_oprn_seq_no    ,
"
"                                        bordet_sub_seq_no     ,
"
"                                        bordet_res_id         ,
"
"                                        bordet_cre_by         ,
"
"                                        bordet_cre_date       ,
"
"                                        bordet_upd_by         ,
"
"                                        bordet_upd_date,
"
"                                        bordet_cre_ip_addr,
"
"                                        bordet_cre_os_user,
"
"                                        bordet_cre_emp_id
"
"                                        )
"
"                                    VALUES( p_bu           ,
"
"                                        p_to_plnt          ,
"
"                                        v_bom_no          ,
"
"                                        cr4.bordet_oprn_seq_no,
"
"                                        cr4.bordet_sub_seq_no ,
"
"                                        cr4.bordet_res_id      ,
"
"                                        p_user          ,
"
"                                        SYSDATE          ,
"
"                                        NULL          ,
"
"                                        NULL,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user)
"
"                                        );
"
"
"
"                 END LOOP c4;
"
"
"
"                 FOR cr5 IN c5(cr3.borln_oprn_seq_no,cr3.borln_sub_seq_no)
"
"                 LOOP
"
"
"
"                    OPEN c9(cr5.brl_res_id);
"
"                    FETCH c9 INTO cr9;
"
"
"
"                       IF c9%NOTFOUND THEN
"
"                          RAISE_APPLICATION_ERROR (-20454,'SFM'||' '|| 'Resource not found. '||cr5.brl_res_id||' '||p_to_plnt);
"
"                       END IF;
"
"
"
"                    CLOSE c9;
"
"
"
"                                     INSERT INTO bor_res_ln(brl_bu          ,
"
"                                                           brl_plnt          ,
"
"                                                           brl_bom_no          ,
"
"                                                           brl_oprn_seq_no    ,
"
"                                                           brl_sub_seq_no     ,
"
"                                                           brl_res_seq_no     ,
"
"                                                           brl_type           ,
"
"                                                           brl_res_id          ,
"
"                                                           brl_units_per_hour ,
"
"                                                           brl_hrs_per_unit   ,
"
"                                                           brl_mins_per_unit  ,
"
"                                                           brl_basis          ,
"
"                                                           brl_bkup_days      ,
"
"                                                           brl_res_offset_pct ,
"
"                                                           brl_uom            ,
"
"                                                           brl_lot_size       ,
"
"                                                           brl_secs_per_unit  ,
"
"                                                           brl_priority       ,
"
"                                                           brl_cre_by         ,
"
"                                                           brl_cre_date       ,
"
"                                                           brl_lag_hrs ,
"
"                                                           brl_cre_ip_addr,
"
"                                                           brl_cre_os_user,
"
"                                                           brl_cre_emp_id
"
"                                                           )
"
"                                                    VALUES(p_bu                    ,
"
"                                                           p_to_plnt          ,
"
"                                                           v_bom_no          ,
"
"                                                           cr5.brl_oprn_seq_no,
"
"                                                           cr5.brl_sub_seq_no ,
"
"                                                           cr5.brl_res_seq_no ,
"
"                                                           cr5.brl_type       ,
"
"                                                           cr5.brl_res_id     ,
"
"                                                           cr5.brl_units_per_hour ,
"
"                                                           cr5.brl_hrs_per_unit   ,
"
"                                                           cr5.brl_mins_per_unit  ,
"
"                                                           cr5.brl_basis          ,
"
"                                                           cr5.brl_bkup_days      ,
"
"                                                           cr5.brl_res_offset_pct ,
"
"                                                           cr5.brl_uom            ,
"
"                                                           cr5.brl_lot_size       ,
"
"                                                           cr5.brl_secs_per_unit  ,
"
"                                                           cr5.brl_priority       ,
"
"                                                           p_user                 ,
"
"                                                           SYSDATE                ,
"
"                                                           cr5.brl_lag_hrs,
"
"                                                           audit_info.get_ip_address,
"
"                                                           audit_info.get_os_user,
"
"                                                           func_find_emp_id(p_bu,p_user)
"
"                                                           );
"
"
"
"                 END LOOP c5;
"
"
"
"             END LOOP c3;
"
"             */
"
"
"
"             FOR cr10 IN c10(cr1.rouln_oprn_seq_no)
"
"             LOOP
"
"               BEGIN
"
"                  SELECT ppl_dflt_store_id
"
"                   INTO v_store_id
"
"                    FROM products, prod_plants,STORES,prod_plants_loc
"
"                   WHERE prod_bu = prodplnt_bu
"
"                     AND prod_id = prodplnt_prod_id
"
"                     AND prod_rev = prodplnt_prod_rev
"
"                     AND ppl_bu   = prodplnt_bu
"
"                     AND ppl_plnt   = prodplnt_plnt
"
"                     AND ppl_prod_id = prodplnt_prod_id
"
"                     AND ppl_prod_rev   = prodplnt_prod_rev
"
"                     AND ppl_BU = store_bu
"
"                     AND ppl_dflt_store_id = STORE_ID
"
"                     AND prod_bu = p_bu
"
"                     AND prodplnt_plnt = p_to_plnt
"
"                     AND prod_status = 'A'
"
"                     AND prod_stocked = 'Y'
"
"                     AND PRODPLNT_CLS_TYPE IN('RP')
"
"                     AND prod_id =  cr10.pbsp_prod_id
"
"                     AND PPL_PLNT_LOC_ID = v_loc_id;
"
"           EXCEPTION WHEN no_data_found THEN
"
"             RAISE_APPLICATION_ERROR(-20999,'HRM'||'  '||'Default Warehouse not defined in this Plant.'||' '||cr10.pbsp_prod_id||' '||v_loc_id);
"
"           END;
"
"                           INSERT INTO proc_by_scr_prod
"
"                                        (
"
"                                         pbsp_bu,
"
"                                         pbsp_plnt,
"
"                                         pbsp_bom_no,
"
"                                         pbsp_oprn_seq_no,
"
"                                         pbsp_prod_id,
"
"                                         pbsp_prod_rev,
"
"                                         pbsp_rct_qty,
"
"                                         pbsp_sou_prod_id,
"
"                                         pbsp_sou_prod_rev,
"
"                                         pbsp_auto_gen_flag,
"
"                                         pbsp_cre_by,
"
"                                         pbsp_cre_date,
"
"                                         pbsp_tar_store_id,
"
"                                         pbsp_prod_type,
"
"                                         pbsp_cre_ip_addr,
"
"                                         pbsp_cre_os_user,
"
"                                         pbsp_cre_emp_id,
"
"                    pbsp_oprn_no,
"
"                    pbsp_oprn_ln_seq,
"
"                    pbsp_oprn_id,
"
"                    pbsp_proc_id
"
"                                        )
"
"                                    VALUES
"
"                                        (
"
"                                         p_bu,
"
"                                         p_to_plnt,
"
"                                         v_bom_no,
"
"                                         cr1.rouln_oprn_seq_no,
"
"                                         cr10.pbsp_prod_id,
"
"                                         cr10.pbsp_prod_rev,
"
"                                         cr10.pbsp_rct_qty,
"
"                                         cr10.pbsp_sou_prod_id,
"
"                                         cr10.pbsp_sou_prod_rev,
"
"                                         cr10.pbsp_auto_gen_flag,
"
"                                         p_user,
"
"                                         SYSDATE,
"
"                                         v_store_id,--cr10.pbsp_tar_store_id ,
"
"                                         cr10.pbsp_prod_type,
"
"                                         audit_info.get_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user)   ,
"
"                    cr10.pbsp_oprn_no,
"
"                    cr10.pbsp_oprn_ln_seq,
"
"                    cr10.pbsp_oprn_id,
"
"                    NVL(cr06.mfgop_dept_id,cr6.mfgop_dept_id)--cr10.pbsp_proc_id
"
"                                        );
"
"
"
"             END LOOP c10;
"
"
"
"            FOR r_inst IN c_inst(cr1.rouln_oprn_seq_no)
"
"				LOOP
"
"
"
"                             INSERT INTO bom_proc_inst (bpi_bu,
"
"                                                        bpi_plnt,
"
"                                                        bpi_bom_no,
"
"                                                        bpi_oper_seq_no,
"
"                                                        bpi_instr_seq_no,
"
"                                                        bpi_inst,
"
"                                                        bpi_cre_by,
"
"                                                        bpi_cre_emp_id,
"
"                                                        bpi_cre_ip_addr,
"
"                                                        bpi_cre_os_user,
"
"                                                        bpi_cre_date
"
"                                              )
"
"                                          VALUES
"
"                                              (p_bu     ,
"
"                                              p_to_plnt    ,
"
"                                              v_bom_no   ,
"
"                                              r_inst.bpi_oper_seq_no  ,
"
"                                              r_inst.bpi_instr_seq_no,
"
"                                              r_inst.bpi_inst  ,
"
"                                              p_user   ,
"
"                                              func_find_emp_id(p_bu,p_user) ,
"
"                                              Audit_Info.get_ip_address,
"
"                                              Audit_Info.get_os_user ,
"
"                                              SYSDATE
"
"                                              );
"
"
"
"				END LOOP c_inst;
"
"
"
"
"
"            END LOOP c1;
"
"
"
"            FOR r_multi_res IN c_multi_res
"
"            LOOP
"
"
"
"                INSERT INTO bom_multi_proc_res(
"
"                                bmpr_bu             ,
"
"                                bmpr_plnt           ,
"
"                                bmpr_bom_no         ,
"
"                                bmpr_seq_no         ,
"
"                                bmpr_res_id         ,
"
"                                bmpr_st_hrs         ,
"
"                                bmpr_st_mins        ,
"
"                                bmpr_cre_by         ,
"
"                                bmpr_cre_emp_id     ,
"
"                                bmpr_cre_ip_addr    ,
"
"                                bmpr_cre_os_user    ,
"
"                                bmpr_cre_date
"
"                                    )
"
"                                    VALUES(
"
"                                    p_bu,--bmpr_bu             ,
"
"                                    p_to_plnt,--bmpr_plnt           ,
"
"                                    v_bom_no,--bmpr_bom_no         ,
"
"                                    r_multi_res.bmpr_seq_no,--bmpr_seq_no         ,
"
"                                    r_multi_res.bmpr_res_id,--bmpr_res_id         ,
"
"                                    r_multi_res.bmpr_st_hrs,--bmpr_st_hrs         ,
"
"                                    r_multi_res.bmpr_st_mins,--bmpr_st_mins        ,
"
"                                    p_user,--bmpr_cre_by         ,
"
"                                    func_find_emp_id(p_bu,p_user),--bmpr_cre_emp_id     ,
"
"                                    audit_info.get_ip_address,--bmpr_cre_ip_addr    ,
"
"                                    audit_info.get_os_user,--bmpr_cre_os_user    ,
"
"                                    SYSDATE--bmpr_cre_date
"
"                                           );
"
"
"
"                FOR r_multi_proc IN c_multi_proc(r_multi_res.bmpr_seq_no)
"
"                LOOP
"
"
"
"                    INSERT INTO bom_multi_proc_res_dtls(
"
"                                        bmprd_bu               ,
"
"                                        bmprd_plnt             ,
"
"                                        bmprd_bom_no           ,
"
"                                        bmprd_seq_no           ,
"
"                                        bmprd_sub_seq_no       ,
"
"                                        bmprd_proc_id          ,
"
"                                        bmprd_rt_hrs           ,
"
"                                        bmprd_rt_mins          ,
"
"                                        bmprd_rt_sec           ,
"
"                                        bmprd_cre_by           ,
"
"                                        bmprd_cre_emp_id       ,
"
"                                        bmprd_cre_ip_addr      ,
"
"                                        bmprd_cre_os_user      ,
"
"                                        bmprd_cre_date
"
"                                        )
"
"                                        VALUES(
"
"                                            p_bu,--bmprd_bu               ,
"
"                                            p_to_plnt,--bmprd_plnt             ,
"
"                                            v_bom_no,--bmprd_bom_no           ,
"
"                                            r_multi_res.bmpr_seq_no,--bmprd_seq_no           ,
"
"                                            r_multi_proc.bmprd_sub_seq_no,--bmprd_sub_seq_no       ,
"
"                                            r_multi_proc.bmprd_proc_id,--bmprd_proc_id          ,
"
"                                            r_multi_proc.bmprd_rt_hrs,--bmprd_rt_hrs           ,
"
"                                            r_multi_proc.bmprd_rt_mins,--bmprd_rt_mins          ,
"
"                                            r_multi_proc.bmprd_rt_sec,--bmprd_rt_sec           ,
"
"                                            p_user,--bmprd_cre_by           ,
"
"                                            func_find_emp_id(p_bu,p_user),--bmprd_cre_emp_id       ,
"
"                                            audit_info.get_ip_address,--bmprd_cre_ip_addr      ,
"
"                                            audit_info.get_os_user,--bmprd_cre_os_user      ,
"
"                                            SYSDATE--bmprd_cre_date
"
"                                               );
"
"
"
"                END LOOP c_multi_proc;
"
"
"
"            END LOOP c_multi_res;
"
"
"
"          END IF;
"
"
"
"        v_res := v_bom_no;
"
"
"
"       CLOSE c0;
"
"
"
"      /*EXCEPTION WHEN OTHERS THEN
"
"        RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_error_msg);*/
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_bom_no);
"
"       p_res := v_res;
"
"
"
"    END proc_copy_bom;
"
"
"
"    PROCEDURE proc_check_unit_asso(p_bu        VARCHAR2,
"
"                       p_plnt        VARCHAR2,
"
"                       p_bom_no        VARCHAR2
"
"                                   )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT prod_id
"
"      FROM products,
"
"           prod_plants,
"
"           bom_hd
"
"     WHERE prod_bu = prodplnt_bu
"
"       AND prod_id = prodplnt_prod_id
"
"       AND prod_rev = prodplnt_prod_Rev
"
"       AND prodplnt_bu = bomhd_bu
"
"       AND prodplnt_plnt = bomhd_plnt
"
"       AND prodplnt_prod_id = bomhd_prod_id
"
"       AND prodplnt_prod_rev = bomhd_prod_rev
"
"       AND prod_status = 'A'
"
"       AND prodplnt_Status = 'A'
"
"       AND bomhd_bu = p_bu
"
"       AND bomhd_plnt = p_plnt
"
"       AND bomhd_bom_no = p_bom_no;
"
"
"
"    CURSOR c2
"
"    IS
"
"    SELECT *
"
"      FROM mfg_oprns_plnt,
"
"           routing_ln
"
"     WHERE mfgop_bu = rouln_bu
"
"       AND mfgop_plnt = rouln_plnt
"
"       AND mfgop_oprn_id = rouln_oprn_id
"
"       AND rouln_bu = p_bu
"
"       AND rouln_plnt = p_plnt
"
"       AND rouln_bom_no = p_bom_no;
"
"
"
"    CURSOR c3
"
"    IS
"
"    SELECT *
"
"      FROM stores,
"
"           routing_ln
"
"     WHERE store_bu = rouln_bu
"
"       AND store_plnt = rouln_plnt
"
"       --AND store_id = rouln_cons_store
"
"       AND store_id = rouln_rcp_Store
"
"       AND rouln_bu = p_bu
"
"       AND rouln_plnt = p_plnt
"
"       AND rouln_bom_no = p_bom_no;
"
"
"
"    CURSOR c3A
"
"    IS
"
"    SELECT *
"
"      FROM stores,
"
"           routing_ln
"
"     WHERE store_bu = rouln_bu
"
"       AND store_plnt = rouln_plnt
"
"       AND store_id = rouln_cons_store
"
"       AND rouln_bu = p_bu
"
"       AND rouln_plnt = p_plnt
"
"       AND rouln_bom_no = p_bom_no;
"
"
"
"    CURSOR c4
"
"    IS
"
"    SELECT *
"
"      FROM products,
"
"           prod_plants,
"
"           bom_ln
"
"     WHERE prod_bu = prodplnt_bu
"
"       AND prod_id = prodplnt_prod_id
"
"       AND prod_rev = prodplnt_prod_Rev
"
"       AND prod_status = 'A'
"
"       AND prodplnt_Status = 'A'
"
"       AND prodplnt_bu = bomln_bu
"
"       AND prodplnt_plnt = bomln_plnt
"
"       AND prodplnt_prod_id = bomln_prod_id
"
"       AND bomln_bu = p_bu
"
"       AND bomln_plnt = p_plnt
"
"       AND bomln_bom_no = p_bom_no;
"
"
"
"CURSOR c5
"
"IS
"
"SELECT borln_res_grp_id
"
"  FROM (SELECT borln_res_grp_id
"
"      FROM mfg_res_groups, bor_ln
"
"     WHERE mfgrg_bu = borln_bu
"
"       AND mfgrg_plnt = borln_plnt
"
"       AND mfgrg_grp_id = borln_res_grp_id
"
"       AND borln_bu = p_bu
"
"       AND borln_plnt = p_plnt
"
"       AND borln_bom_no = p_bom_no
"
"       AND borln_res_grp_type = 'G'
"
"     UNION ALL
"
"    SELECT borln_res_grp_id
"
"      FROM mfg_resources, bor_ln
"
"     WHERE mfgr_bu = borln_bu
"
"       AND mfgr_plnt = borln_plnt
"
"       AND mfgr_res_id = borln_res_grp_id
"
"       AND borln_bu = p_bu
"
"       AND borln_plnt = p_plnt
"
"       AND borln_bom_no = p_bom_no
"
"       AND borln_res_grp_type = 'R')
"
"         GROUP BY borln_res_grp_id;
"
"
"
"    CURSOR c6
"
"    IS
"
"    SELECT *
"
"      FROM bor_res_ln,
"
"           mfg_resources
"
"     WHERE mfgr_bu = brl_bu
"
"       AND mfgr_plnt = brl_plnt
"
"       AND mfgr_res_id = brl_res_id
"
"       AND brl_bu = p_bu
"
"       AND brl_plnt = p_plnt
"
"       AND brl_bom_no = p_bom_no;
"
"
"
"    CURSOR c7
"
"    IS
"
"    SELECT *
"
"      FROM bor_ln
"
"     WHERE borln_bu = p_bu
"
"       AND borln_plnt = p_plnt
"
"       AND borln_bom_no = p_bom_no;
"
"
"
"    CURSOR c8
"
"    IS
"
"    SELECT *
"
"      FROM bor_res_ln
"
"     WHERE brl_bu = p_bu
"
"       AND brl_plnt = p_plnt
"
"       AND brl_bom_no = p_bom_no;
"
"
"
"    CURSOR c9
"
"    IS
"
"    SELECT *
"
"      FROM processes,
"
"           routing_ln
"
"     WHERE process_bu = rouln_bu
"
"       AND process_plnt = rouln_plnt
"
"       AND process_id = rouln_proc_id
"
"       AND rouln_bu = p_bu
"
"       AND rouln_plnt = p_plnt
"
"       AND rouln_bom_no = p_bom_no;
"
"
"
"
"
"
"
"    cr1 c1%ROWTYPE;
"
"    cr2 c2%ROWTYPE;
"
"    cr3 c3%ROWTYPE;
"
"    cr3A c3A%ROWTYPE;
"
"    cr4 c4%ROWTYPE;
"
"    cr5 c5%ROWTYPE;
"
"    cr6 c6%ROWTYPE;
"
"    cr7 c7%ROWTYPE;
"
"    cr8 c8%ROWTYPE;
"
"    cr9 c9%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"            OPEN c1;
"
"            FETCH c1 INTO cr1;
"
"                IF c1%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20267,'ICM'||'/'||'Item not defined in the unit.');
"
"                END IF;
"
"            CLOSE c1;
"
"
"
"            OPEN c2;
"
"            FETCH c2 INTO cr2;
"
"                IF c2%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20476,'SFM'||'/'||'Process not defined in the unit.');
"
"                END IF;
"
"            CLOSE c2;
"
"
"
"
"
"            OPEN c3;
"
"            FETCH c3 INTO cr3;
"
"                IF c3%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20270,'SOM'||'/'||'Warehouse not found at this unit.');
"
"                END IF;
"
"            CLOSE c3;
"
"
"
"            OPEN c3A;
"
"            FETCH c3A INTO cr3A;
"
"                IF c3A%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20270,'SOM'||'/'||'Warehouse not found at this unit.');
"
"                END IF;
"
"            CLOSE c3A;
"
"
"
"            OPEN c4;
"
"            FETCH c4 INTO cr4;
"
"                IF c4%NOTFOUND THEN
"
"                   --RAISE_APPLICATION_ERROR(-20267,'ICM'||'/'||'Raw material item not defined in the unit.');
"
"                   null;
"
"                END IF;
"
"            CLOSE c4;
"
"
"
"
"
"            OPEN c9;
"
"            FETCH c9 INTO cr9;
"
"                IF c9%NOTFOUND THEN
"
"                   RAISE_APPLICATION_ERROR(-20569,'PLN'||'/'||'Work center not defined in the unit.');
"
"
"
"                END IF;
"
"            CLOSE c9;
"
"
"
"
"
"            OPEN c7;
"
"            FETCH c7 INTO cr7;
"
"            IF c7%FOUND OR cr7.borln_res_grp_id IS NOT NULL THEN
"
"
"
"                OPEN c5;
"
"                FETCH c5 INTO cr5;
"
"                    IF c5%NOTFOUND THEN
"
"                       RAISE_APPLICATION_ERROR(-20655,'PRJ'||'/'||'Resource Group not found.');
"
"                    END IF;
"
"                CLOSE c5;
"
"                END IF;
"
"            CLOSE c7;
"
"
"
"            OPEN c8;
"
"            FETCH c8 INTO cr8;
"
"            IF c8%FOUND OR cr8.brl_res_id IS NOT NULL THEN
"
"
"
"                OPEN c6;
"
"                FETCH c6 INTO cr6;
"
"                    IF c6%NOTFOUND THEN
"
"                       RAISE_APPLICATION_ERROR(-20656,'PRJ'||'/'||'Resource not found.');
"
"                    END IF;
"
"                CLOSE c6;
"
"            END IF;
"
"            CLOSE c8;
"
"
"
"    END    proc_check_unit_asso;
"
"
"
"PROCEDURE proc_inactivate_bom (p_bu        VARCHAR2,
"
"                               p_plnt        VARCHAR2,
"
"                   p_bom_no        VARCHAR2,
"
"                   p_ref        VARCHAR2,
"
"                   p_type        VARCHAR2, --'C' - Correction 'I' - Inactive
"
"                   p_user        VARCHAR2,
"
"                   p_res    OUT    VARCHAR2
"
"                 )
"
"    IS
"
"CURSOR c0
"
"    IS
"
"SELECT *
"
"  FROM bom_hd
"
" WHERE bomhd_bu = p_bu
"
"   AND bomhd_plnt = p_plnt
"
"   AND bomhd_bom_no = p_bom_no
"
"   AND bomhd_status = 'A';
"
"
"
"CURSOR c1
"
"    IS
"
"SELECT *
"
"  FROM bom_hd,
"
"       routing_ln
"
" WHERE bomhd_bu     = rouln_bu
"
"   AND bomhd_plnt   = rouln_plnt
"
"   AND bomhd_bom_no = rouln_bom_no
"
"   AND rouln_bu     = p_bu
"
"   AND rouln_plnt   = p_plnt
"
"   AND rouln_bom_no = p_bom_no
"
"   AND bomhd_status = 'A';
"
"
"
"CURSOR c2
"
"    IS
"
"SELECT *
"
"  FROM bom_hd,
"
"       routing_ln,
"
"       bom_ln
"
" WHERE bomhd_bu     = rouln_bu
"
"   AND bomhd_plnt   = rouln_plnt
"
"   AND bomhd_bom_no = rouln_bom_no
"
"   AND rouln_bu     = bomln_bu
"
"   AND rouln_plnt   = bomln_plnt
"
"   AND rouln_bom_no = bomln_bom_no
"
"   AND rouln_oprn_seq_no = bomln_oprn_seq_no
"
"   AND bomln_bu     = p_bu
"
"   AND bomln_plnt   = p_plnt
"
"   AND bomln_bom_no = p_bom_no
"
"   AND bomhd_status = 'A';
"
"
"
"CURSOR c3
"
"    IS
"
"SELECT *
"
"  FROM bom_hd,
"
"       routing_ln,
"
"       bor_ln
"
" WHERE bomhd_bu     = rouln_bu
"
"   AND bomhd_plnt   = rouln_plnt
"
"   AND bomhd_bom_no = rouln_bom_no
"
"   AND rouln_bu     = borln_bu
"
"   AND rouln_plnt   = borln_plnt
"
"   AND rouln_bom_no = borln_bom_no
"
"   AND rouln_oprn_seq_no = borln_oprn_seq_no
"
"   AND borln_bu          = p_bu
"
"   AND borln_plnt        = p_plnt
"
"   AND borln_bom_no      = p_bom_no
"
"   AND bomhd_status = 'A';
"
"
"
"CURSOR c4
"
"    IS
"
"SELECT *
"
"  FROM bom_hd,
"
"       routing_ln,
"
"       bor_ln,
"
"       bor_details
"
" WHERE bomhd_bu     = rouln_bu
"
"   AND bomhd_plnt   = rouln_plnt
"
"   AND bomhd_bom_no = rouln_bom_no
"
"   AND rouln_bu     = borln_bu
"
"   AND rouln_plnt   = borln_plnt
"
"   AND rouln_bom_no = borln_bom_no
"
"   AND rouln_oprn_seq_no = borln_oprn_seq_no
"
"   AND borln_bu          = bordet_bu
"
"   AND borln_plnt        = bordet_plnt
"
"   AND borln_bom_no      = bordet_bom_no
"
"   AND borln_oprn_seq_no = bordet_oprn_seq_no
"
"   AND borln_sub_seq_no  = bordet_sub_seq_no
"
"   AND bordet_bu     = p_bu
"
"   AND bordet_plnt   = p_plnt
"
"   AND bordet_bom_no = p_bom_no
"
"   AND bomhd_status  = 'A';
"
"
"
"CURSOR c5
"
"    IS
"
"SELECT *
"
"  FROM bor_res_ln
"
" WHERE brl_bu = p_bu
"
"   AND brl_plnt = p_plnt
"
"   AND brl_bom_no = p_bom_no;
"
"
"
"CURSOR c6
"
"    IS
"
"SELECT *
"
"  FROM bom_hd,
"
"       routing_ln,
"
"       proc_by_scr_prod
"
" WHERE bomhd_bu     = rouln_bu
"
"   AND bomhd_plnt   = rouln_plnt
"
"   AND bomhd_bom_no = rouln_bom_no
"
"   AND rouln_bu     = pbsp_bu
"
"   AND rouln_plnt   = pbsp_plnt
"
"   AND rouln_bom_no = pbsp_bom_no
"
"   AND rouln_oprn_seq_no = pbsp_oprn_seq_no
"
"   AND pbsp_bu             = p_bu
"
"   AND pbsp_plnt           = p_plnt
"
"   AND pbsp_bom_no         = p_bom_no
"
"   AND bomhd_status = 'A';
"
"
"
"    cr0            c0%ROWTYPE;
"
"    v_doc_no    VARCHAR2(15);
"
"
"
"
"
"    BEGIN
"
"
"
"       OPEN c0;
"
"       FETCH c0 INTO cr0;
"
"--            RAISE_APPLICATION_ERROR(-20999,cr0.bomhd_bom_no);
"
"          IF c0%NOTFOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20595,'PLN'||' '||'Bill Of Materials Not Found.');
"
"          ELSE
"
"
"
"             p_res := 'N';
"
"
"
"          IF p_type = 'I' THEN
"
"          null;
"
"
"
"            /*SELECT NVL(MAX(TO_NUMBER(bomhdh_doc_no)),0) + 1
"
"               INTO v_doc_no
"
"               FROM bom_hd_hist
"
"              WHERE bomhdh_bu = p_bu
"
"                AND bomhdh_plnt = p_plnt;
"
"
"
"                         INSERT INTO bom_hd_hist(bomhdh_bu,
"
"                                     bomhdh_plnt,
"
"                                     bomhdh_bom_no,
"
"                                     bomhdh_doc_no,
"
"                                     bomhdh_prod_id,
"
"                                     bomhdh_prod_rev,
"
"                                     bomhdh_primary,
"
"                                     bomhdh_eff_from,
"
"                                     bomhdh_eff_to,
"
"                                     bomhdh_active_date,
"
"                                     bomhdh_cancel_date,
"
"                                     bomhdh_status,
"
"                                     bomhdh_dflt_bom,
"
"                                     bomhdh_cumm_leadtime,
"
"                                     bomhdh_prod_cat,
"
"                                     bomhdh_prod_style,
"
"                                     bomhdh_prod_color,
"
"                                     bomhdh_prod_size,
"
"                                     bomhdh_gar_bom_no,
"
"                                     bomhdh_order_no,
"
"                                     bomhdh_buyer_id,
"
"                                     bomhdh_dia,
"
"                                     bomhdh_gsm,
"
"                                     bomhdh_structure,
"
"                                     bomhdh_content,
"
"                                     bomhdh_count,
"
"                                     bomhdh_partial,
"
"                                     bomhdh_uom,
"
"                                     bomhdh_prod_uom,
"
"                                     bomhdh_conv_factor,
"
"                                     bomhdh_cre_by,
"
"                                     bomhdh_cre_date,
"
"                                     bomhdh_upd_by,
"
"                                     bomhdh_upd_date,
"
"                                     bomhdh_so_pfx,
"
"                                     bomhdh_so_no,
"
"                                     bomhdh_so_seqno,
"
"                                     bomhdh_cust_spec_mat_flag,
"
"                                     bomhdh_action_by,
"
"                                     bomhdh_action_date,
"
"                                     bomhdh_ref,
"
"                                     bomhdh_bom_name,
"
"                                     bomhdh_drg_no  ,
"
"                                     bomhdh_drg_rev  ,
"
"                                     bomhdh_thickness,
"
"                                     bomhdh_width  ,
"
"                                     bomhdh_length ,
"
"                                     bomhdh_cre_ip_addr,
"
"                                     bomhdh_cre_os_user,
"
"                                     bomhdh_cre_emp_id,
"
"                                     bomhdh_first_proc_cons_rqrd
"
"                                     )
"
"                     VALUES( p_bu,
"
"                             p_plnt,
"
"                             p_bom_no,
"
"                             v_doc_no,
"
"                             cr0.bomhd_prod_id,
"
"                             cr0.bomhd_prod_rev,
"
"                             cr0.bomhd_primary,
"
"                             cr0.bomhd_eff_from,
"
"                             cr0.bomhd_eff_to,
"
"                             cr0.bomhd_active_date,
"
"                             cr0.bomhd_cancel_date,
"
"                             cr0.bomhd_status,
"
"                             cr0.bomhd_dflt_bom,
"
"                             cr0.bomhd_cumm_leadtime,
"
"                             cr0.bomhd_prod_cat,
"
"                             cr0.bomhd_prod_style,
"
"                             cr0.bomhd_prod_color,
"
"                             cr0.bomhd_prod_size,
"
"                             cr0.bomhd_gar_bom_no,
"
"                             cr0.bomhd_order_no,
"
"                             cr0.bomhd_buyer_id,
"
"                             cr0.bomhd_dia,
"
"                             cr0.bomhd_gsm,
"
"                             cr0.bomhd_structure,
"
"                             cr0.bomhd_content,
"
"                             cr0.bomhd_count,
"
"                             cr0.bomhd_partial,
"
"                             cr0.bomhd_uom,
"
"                             cr0.bomhd_prod_uom,
"
"                             cr0.bomhd_conv_factor,
"
"                             cr0.bomhd_cre_by,
"
"                             cr0.bomhd_cre_date,
"
"                             cr0.bomhd_upd_by,
"
"                             cr0.bomhd_upd_date,
"
"                             cr0.bomhd_so_pfx,
"
"                             cr0.bomhd_so_no,
"
"                             cr0.bomhd_so_seqno,
"
"                             cr0.bomhd_cust_spec_mat_flag,
"
"                             p_user,
"
"                             SYSDATE,
"
"                             p_ref,
"
"                             cr0.bomhd_bom_name   ,
"
"                             cr0.bomhd_drg_no     ,
"
"                             cr0.bomhd_drg_rev    ,
"
"                             cr0.bomhd_thickness  ,
"
"                             cr0.bomhd_width      ,
"
"                             cr0.bomhd_length ,
"
"                             audit_info.get_ip_address,
"
"                             audit_info.get_os_user,
"
"                             func_find_emp_id(p_bu,p_user)  ,
"
"                             cr0.bomhd_first_proc_cons_rqrd
"
"                             );
"
"
"
"             FOR cr1 IN c1
"
"             LOOP
"
"
"
"                INSERT INTO routing_ln_hist(roulnh_bu,
"
"                                            roulnh_plnt,
"
"                                            roulnh_bom_no,
"
"                                            roulnh_doc_no,
"
"                                            roulnh_oprn_seq_no,
"
"                                            roulnh_oprn_id,
"
"                                            roulnh_proc_id,
"
"                                            roulnh_comp_pct,
"
"                                            roulnh_ins_req,
"
"                                            roulnh_oprn_no,
"
"                                            roulnh_source_type,
"
"                                            roulnh_proc_draw_no,
"
"                                            roulnh_proc_draw_rev,
"
"                                            roulnh_ins_sheet_id,
"
"                                            roulnh_cre_by,
"
"                                            roulnh_cre_date,
"
"                                            roulnh_upd_by,
"
"                                            roulnh_upd_date,
"
"                                            roulnh_ls_flag,
"
"                                            roulnh_oprn_flag,
"
"                                            roulnh_tsa_flag,
"
"                                            roulnh_unit_weight,
"
"                                            roulnh_proc_skip_opt,
"
"                                            roulnh_action_by,
"
"                                            roulnh_action_date,
"
"                                            roulnh_cons_store,
"
"                                            roulnh_rcp_store,
"
"                                            roulnh_oprn_ln_seq,
"
"                                            roulnh_loc_id,
"
"                                            roulnh_oprn_hrs,
"
"                                            roulnh_oprn_mins,
"
"                                            roulnh_secs,
"
"                                            roulnh_cre_ip_addr,
"
"                                            roulnh_cre_os_user,
"
"                                            roulnh_cre_emp_id)
"
"                                    VALUES( p_bu,
"
"                                            p_plnt,
"
"                                            p_bom_no,
"
"                                            v_doc_no,
"
"                                            cr1.rouln_oprn_seq_no,
"
"                                            cr1.rouln_oprn_id,
"
"                                            cr1.rouln_proc_id,
"
"                                            cr1.rouln_comp_pct,
"
"                                            cr1.rouln_ins_req,
"
"                                            cr1.rouln_oprn_no,
"
"                                            cr1.rouln_source_type,
"
"                                            cr1.rouln_proc_draw_no,
"
"                                            cr1.rouln_proc_draw_rev,
"
"                                            cr1.rouln_ins_sheet_id,
"
"                                            cr1.rouln_cre_by,
"
"                                            cr1.rouln_cre_date,
"
"                                            cr1.rouln_upd_by,
"
"                                            cr1.rouln_upd_date,
"
"                                            cr1.rouln_ls_flag,
"
"                                            cr1.rouln_oprn_flag,
"
"                                            cr1.rouln_tsa_flag,
"
"                                            cr1.rouln_unit_weight,
"
"                                            cr1.rouln_proc_skip_opt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr1.rouln_cons_store,
"
"                                            cr1.rouln_rcp_store,
"
"                                            cr1.rouln_oprn_ln_seq,
"
"                                            cr1.rouln_loc_id,
"
"                                            cr1.rouln_oprn_hrs,
"
"                                            cr1.rouln_oprn_mins,
"
"                                            cr1.rouln_secs,
"
"                                            audit_info.get_ip_address,
"
"                                            audit_info.get_os_user,
"
"                                            func_find_emp_id(p_bu,p_user)
"
"                                            );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr2 IN c2
"
"         LOOP
"
"
"
"            INSERT INTO bom_ln_hist (    bomlnh_bu,
"
"                                        bomlnh_plnt,
"
"                                        bomlnh_bom_no,
"
"                                        bomlnh_doc_no,
"
"                                        bomlnh_oprn_seq_no,
"
"                                        bomlnh_seq_no,
"
"                                        bomlnh_bom_type,
"
"                                        bomlnh_prod_id,
"
"                                        bomlnh_prod_rev,
"
"                                        bomlnh_store_id,
"
"                                        bomlnh_prod_uom,
"
"                                        bomlnh_uom,
"
"                                        bomlnh_conv_factor,
"
"                                        bomlnh_required_qty,
"
"                                        bomlnh_scrap_pct,
"
"                                        bomlnh_optional,
"
"                                        bomlnh_multiple,
"
"                                        bomlnh_ord_flag,
"
"                                        bomlnh_plan_pct,
"
"                                        bomlnh_min_qty,
"
"                                        bomlnh_max_qty,
"
"                                        bomlnh_item_seq_no,
"
"                                        bomlnh_matreq_uom,
"
"                                        bomlnh_phantom,
"
"                                        bomlnh_lot_no_gen_flag,
"
"                                        bomlnh_cre_by,
"
"                                        bomlnh_cre_date,
"
"                                        bomlnh_upd_by,
"
"                                        bomlnh_upd_date,
"
"                                        bomlnh_plnnd_mat_flag,
"
"                                        bomlnh_deflt_flag,
"
"                                        bomlnh_rqrd_pct,
"
"                                        bomlnh_action_by,
"
"                                        bomlnh_action_date,
"
"                                        bomlnh_gsm      ,
"
"                                        bomlnh_grain    ,
"
"                                        bomlnh_length    ,
"
"                                        bomlnh_width    ,
"
"                                        bomlnh_no_of_ups,
"
"                                        bomlnh_fdng_size,
"
"                                        bomlnh_cons_seq_no,
"
"                                        bomlnh_cre_ip_addr,
"
"                                        bomlnh_cre_os_user,
"
"                                        bomlnh_cre_emp_id)
"
"                                    VALUES( p_bu,
"
"                                        p_plnt,
"
"                                        p_bom_no,
"
"                                        v_doc_no,
"
"                                        cr2.bomln_oprn_seq_no,
"
"                                        cr2.bomln_seq_no,
"
"                                        cr2.bomln_bom_type,
"
"                                        cr2.bomln_prod_id,
"
"                                        cr2.bomln_prod_rev,
"
"                                        cr2.bomln_store_id,
"
"                                        cr2.bomln_prod_uom,
"
"                                        cr2.bomln_uom,
"
"                                        cr2.bomln_conv_factor,
"
"                                        cr2.bomln_required_qty,
"
"                                        cr2.bomln_scrap_pct,
"
"                                        cr2.bomln_optional,
"
"                                        cr2.bomln_multiple,
"
"                                        cr2.bomln_ord_flag,
"
"                                        cr2.bomln_plan_pct,
"
"                                        cr2.bomln_min_qty,
"
"                                        cr2.bomln_max_qty,
"
"                                        cr2.bomln_item_seq_no,
"
"                                        cr2.bomln_matreq_uom,
"
"                                        cr2.bomln_phantom,
"
"                                        cr2.bomln_lot_no_gen_flag,
"
"                                        cr2.bomln_cre_by,
"
"                                        cr2.bomln_cre_date,
"
"                                        cr2.bomln_upd_by,
"
"                                        cr2.bomln_upd_date,
"
"                                        cr2.bomln_plnnd_mat_flag,
"
"                                        cr2.bomln_deflt_flag,
"
"                                        cr2.bomln_rqrd_pct,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        cr2.bomln_gsm      ,
"
"                                        cr2.bomln_grain    ,
"
"                                        cr2.bomln_length    ,
"
"                                        cr2.bomln_width    ,
"
"                                        cr2.bomln_no_of_ups,
"
"                                        cr2.bomln_fdng_size,
"
"                                        cr2.bomln_cons_seq_no,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user)
"
"                                        );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr3 IN c3
"
"         LOOP
"
"
"
"                           INSERT INTO bor_ln_hist (    borlnh_bu,
"
"                                        borlnh_plnt,
"
"                                        borlnh_bom_no,
"
"                                        borlnh_doc_no,
"
"                                        borlnh_oprn_seq_no,
"
"                                        borlnh_sub_seq_no,
"
"                                        borlnh_type,
"
"                                        borlnh_res_grp_id,
"
"                                        borlnh_units_per_hour,
"
"                                        borlnh_hrs_per_unit,
"
"                                        borlnh_mins_per_unit,
"
"                                        borlnh_basis,
"
"                                        borlnh_res_seq_no,
"
"                                        borlnh_bkup_days,
"
"                                        borlnh_res_offset_pct,
"
"                                        borlnh_uom,
"
"                                        borlnh_cre_by,
"
"                                        borlnh_cre_date,
"
"                                        borlnh_upd_by,
"
"                                        borlnh_upd_date,
"
"                                        borlnh_lot_size,
"
"                                        borlnh_secs_per_unit,
"
"                                        borlnh_lag_hrs,
"
"                                        borlnh_action_by,
"
"                                        borlnh_action_date,
"
"                                        borlnh_res_grp_type,
"
"                                        borlnh_mpm    ,
"
"                                        borlnh_setup_hrs ,
"
"                                        borlnh_ink_mix_hrs  ,
"
"                                        borlnh_roll_chng_hrs ,
"
"                                        borlnh_no_of_units,
"
"                                        borlnh_priority ,
"
"                                        borlnh_move_hrs ,
"
"                                        borlnh_tear_down_hrs ,
"
"                                        borlnh_setup_mins ,
"
"                                        borlnh_cre_ip_addr,
"
"                                        borlnh_cre_os_user,
"
"                                        borlnh_cre_emp_id
"
"                                        )
"
"                                VALUES (    p_bu,
"
"                                        p_plnt,
"
"                                        p_bom_no,
"
"                                        v_doc_no,
"
"                                        cr3.borln_oprn_seq_no,
"
"                                        cr3.borln_sub_seq_no,
"
"                                        cr3.borln_type,
"
"                                        cr3.borln_res_grp_id,
"
"                                        cr3.borln_units_per_hour,
"
"                                        cr3.borln_hrs_per_unit,
"
"                                        cr3.borln_mins_per_unit,
"
"                                        cr3.borln_basis,
"
"                                        cr3.borln_res_seq_no,
"
"                                        cr3.borln_bkup_days,
"
"                                        cr3.borln_res_offset_pct,
"
"                                        cr3.borln_uom,
"
"                                        cr3.borln_cre_by,
"
"                                        cr3.borln_cre_date,
"
"                                        cr3.borln_upd_by,
"
"                                        cr3.borln_upd_date,
"
"                                        cr3.borln_lot_size,
"
"                                        cr3.borln_secs_per_unit,
"
"                                        cr3.borln_lag_hrs,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        cr3.borln_res_grp_type,
"
"                                        cr3.borln_mpm    ,
"
"                                        cr3.borln_setup_hrs ,
"
"                                        cr3.borln_ink_mix_hrs  ,
"
"                                        cr3.borln_roll_chng_hrs ,
"
"                                        cr3.borln_no_of_units,
"
"                                        cr3.borln_priority ,
"
"                                        cr3.borln_move_hrs ,
"
"                                        cr3.borln_tear_down_hrs ,
"
"                                        cr3.borln_setup_mins ,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user)
"
"                                        );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr4 IN c4
"
"         LOOP
"
"
"
"            INSERT INTO bor_details_hist(bordeth_bu,
"
"                                         bordeth_plnt,
"
"                                         bordeth_bom_no,
"
"                                         bordeth_doc_no,
"
"                                         bordeth_oprn_seq_no,
"
"                                         bordeth_sub_seq_no,
"
"                                         bordeth_res_id,
"
"                                         bordeth_priority,
"
"                                         bordeth_cre_by,
"
"                                         bordeth_cre_date,
"
"                                         bordeth_upd_by,
"
"                                         bordeth_upd_date,
"
"                                         bordeth_action_by,
"
"                                         bordeth_action_date,
"
"                                         bordeth_cre_ip_addr,
"
"                                         bordeth_cre_os_user,
"
"                                         bordeth_cre_emp_id
"
"                                         )
"
"                                    VALUES(     p_bu,
"
"                                         p_plnt,
"
"                                         p_bom_no,
"
"                                         v_doc_no,
"
"                                         cr4.bordet_oprn_seq_no,
"
"                                         cr4.bordet_sub_seq_no,
"
"                                         cr4.bordet_res_id,
"
"                                         cr4.bordet_priority,
"
"                                         cr4.bordet_cre_by,
"
"                                         cr4.bordet_cre_date,
"
"                                         cr4.bordet_upd_by,
"
"                                         cr4.bordet_upd_date,
"
"                                         NULL,
"
"                                         NULL,
"
"                                         audit_info.get_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user)
"
"                                         );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr5 IN c5
"
"         LOOP
"
"
"
"            INSERT INTO bor_res_ln_hist (brlh_bu,
"
"                                         brlh_plnt,
"
"                                         brlh_bom_no,
"
"                                         brlh_doc_no,
"
"                                         brlh_oprn_seq_no,
"
"                                         brlh_sub_seq_no,
"
"                                         brlh_res_seq_no,
"
"                                         brlh_type,
"
"                                         brlh_res_id,
"
"                                         brlh_units_per_hour,
"
"                                         brlh_hrs_per_unit,
"
"                                         brlh_mins_per_unit,
"
"                                         brlh_basis,
"
"                                         brlh_bkup_days,
"
"                                         brlh_res_offset_pct,
"
"                                         brlh_uom,
"
"                                         brlh_lot_size,
"
"                                         brlh_secs_per_unit,
"
"                                         brlh_priority,
"
"                                         brlh_cre_by,
"
"                                         brlh_cre_date,
"
"                                         brlh_upd_by,
"
"                                         brlh_upd_date,
"
"                                         brlh_lag_hrs,
"
"                                         brlh_action_by,
"
"                                         brlh_action_date,
"
"                                         brlh_cre_ip_addr,
"
"                                         brlh_cre_os_user,
"
"                                         brlh_cre_emp_id
"
"                                         )
"
"                                 VALUES(     p_bu,
"
"                                         p_plnt,
"
"                                         p_bom_no,
"
"                                         v_doc_no,
"
"                                         cr5.brl_oprn_seq_no,
"
"                                         cr5.brl_sub_seq_no,
"
"                                         cr5.brl_res_seq_no,
"
"                                         cr5.brl_type,
"
"                                         cr5.brl_res_id,
"
"                                         cr5.brl_units_per_hour,
"
"                                         cr5.brl_hrs_per_unit,
"
"                                         cr5.brl_mins_per_unit,
"
"                                         cr5.brl_basis,
"
"                                         cr5.brl_bkup_days,
"
"                                         cr5.brl_res_offset_pct,
"
"                                         cr5.brl_uom,
"
"                                         cr5.brl_lot_size,
"
"                                         cr5.brl_secs_per_unit,
"
"                                         cr5.brl_priority,
"
"                                         cr5.brl_cre_by,
"
"                                         cr5.brl_cre_date,
"
"                                         cr5.brl_upd_by,
"
"                                         cr5.brl_upd_date,
"
"                                         cr5.brl_lag_hrs,
"
"                                         NULL,
"
"                                         NULL,
"
"                                         audit_info.geT_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user)
"
"                                         );
"
"
"
"         END LOOP;
"
"
"
"         FOR cr6 IN c6
"
"         LOOP
"
"
"
"         INSERT INTO proc_by_scr_prod_hist
"
"                                        (
"
"                                         pbsph_bu,
"
"                                         pbsph_plnt,
"
"                                         pbsph_bom_no,
"
"                                         pbsph_oprn_seq_no,
"
"                                         pbsph_prod_id,
"
"                                         pbsph_prod_rev,
"
"                                         pbsph_rct_qty,
"
"                                         pbsph_sou_prod_id,
"
"                                         pbsph_sou_prod_rev,
"
"                                         pbsph_auto_gen_flag,
"
"                                         pbsph_cre_by,
"
"                                         pbsph_cre_date,
"
"                                         pbsph_tar_store_id,
"
"                                         pbsph_prod_type,
"
"                                         pbsph_cre_ip_addr,
"
"                                         pbsph_cre_os_user,
"
"                                         pbsph_cre_emp_id
"
"                                        )
"
"                                    VALUES
"
"                                        (
"
"                                         p_bu,
"
"                                         p_plnt,
"
"                                         p_bom_no,
"
"                                         cr6.pbsp_oprn_seq_no,
"
"                                         cr6.pbsp_prod_id,
"
"                                         cr6.pbsp_prod_rev,
"
"                                         cr6.pbsp_rct_qty,
"
"                                         cr6.pbsp_sou_prod_id,
"
"                                         cr6.pbsp_sou_prod_rev,
"
"                                         cr6.pbsp_auto_gen_flag,
"
"                                         p_user,
"
"                                         SYSDATE,
"
"                                         cr6.pbsp_tar_store_id,
"
"                                         cr6.pbsp_prod_type,
"
"                                         audit_info.get_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user)
"
"                                        );
"
"
"
"
"
"         END LOOP;*/
"
"
"
"   END IF;
"
"
"
"         IF p_type = 'I' THEN
"
"
"
"            UPDATE bom_hd
"
"               SET bomhd_status = 'I',
"
"                   bomhd_primary = 'N',
"
"                   bomhd_upd_by = p_user,
"
"                   bomhd_upd_date = SYSDATE,
"
"                   bomhd_upd_ip_addr = audit_info.get_ip_address,
"
"                   bomhd_upd_os_user = audit_info.get_os_user,
"
"                   bomhd_upd_emp_id = func_find_emp_id(p_bu,p_user)
"
"             WHERE bomhd_bu = p_bu
"
"               AND bomhd_plnt = p_plnt
"
"               AND bomhd_bom_no = p_bom_no;
"
"
"
"         ELSIF p_type = 'C' THEN
"
"
"
"            UPDATE bom_hd
"
"               SET bomhd_status = 'E',
"
"                   bomhd_primary = 'N',
"
"                   bomhd_remarks  =p_ref,
"
"                   bomhd_upd_by = p_user,
"
"                   bomhd_upd_date = SYSDATE,
"
"                   bomhd_upd_ip_addr = audit_info.get_ip_address,
"
"                   bomhd_upd_os_user = audit_info.get_os_user,
"
"                   bomhd_upd_emp_id = func_find_emp_id(p_bu,p_user)
"
"             WHERE bomhd_bu = p_bu
"
"               AND bomhd_plnt = p_plnt
"
"               AND bomhd_bom_no = p_bom_no;
"
"
"
"         END IF;
"
"
"
"
"
"          END IF;
"
"             p_res := 'Y';
"
"
"
"
"
"
"
"      CLOSE c0;
"
"
"
"    END proc_inactivate_bom;
"
"
"
"END pkg_bom_hist;"
/
