CREATE OR REPLACE
"PACKAGE BODY pkg_engg_bom_hist
"
"IS
"
"
"
"PROCEDURE proc_cre_engg_bom_rev (p_bu            VARCHAR2,
"
"                                 p_plnt            VARCHAR2,
"
"                                 p_bom_no        VARCHAR2,
"
"                                 p_eff_from        DATE,
"
"                                 p_eff_to        DATE,
"
"                                 p_user            VARCHAR2,
"
"                                 p_res    OUT        VARCHAR2
"
"                                )
"
"IS
"
"CURSOR c0
"
"    IS
"
"SELECT *
"
"  FROM engg_bom_hd
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
"  FROM engg_routing_ln
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
"  FROM engg_bom_ln
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
"  FROM engg_bor_ln
"
" WHERE borln_bu = p_bu
"
"   AND borln_plnt = p_plnt
"
"   AND borln_bom_no = p_bom_no;
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
"             RAISE_APPLICATION_ERROR(-20595,'PLN'||' '||'Engineering Bill Of Materials Not Found.');
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
"--Raise_Application_Error(-20999,func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),func_find_get_mfg_pfx(p_bu,V_PLNT_LOC_ID,p_plnt,'EBOM')));
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
"                         'EBOM'),
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
"                         INSERT INTO engg_bom_hd(bomhd_bu,
"
"                                                 bomhd_plnt,
"
"                                                 bomhd_bom_no,
"
"                                                 bomhd_prod_id,
"
"                                                 bomhd_prod_rev,
"
"                                                 bomhd_primary,
"
"                                                 bomhd_eff_from,
"
"                                                 bomhd_eff_to,
"
"                                                 bomhd_active_date,
"
"                                                 bomhd_cancel_date,
"
"                                                 bomhd_status,
"
"                                                 bomhd_dflt_bom,
"
"                                                 bomhd_cumm_leadtime,
"
"                                                 bomhd_prod_cat,
"
"                                                 bomhd_prod_style,
"
"                                                 bomhd_prod_color,
"
"                                                 bomhd_prod_size,
"
"                                                 bomhd_gar_bom_no,
"
"                                                 bomhd_order_no,
"
"                                                 bomhd_buyer_id,
"
"                                                 bomhd_dia,
"
"                                                 bomhd_gsm,
"
"                                                 bomhd_structure,
"
"                                                 bomhd_content,
"
"                                                 bomhd_count,
"
"                                                 bomhd_partial,
"
"                                                 bomhd_uom,
"
"                                                 bomhd_prod_uom,
"
"                                                 bomhd_conv_factor,
"
"                                                 bomhd_cre_by,
"
"                                                 bomhd_cre_date,
"
"                                                 bomhd_so_pfx,
"
"                                                 bomhd_so_no,
"
"                                                 bomhd_so_seqno,
"
"                                                 /*bomhd_cust_spec_mat_flag,
"
"                                                 bomhd_cust_id          ,
"
"                                                 bomhd_proj_id          ,
"
"                                                 bomhd_task_id          ,
"
"                                                 bomhd_so_schld_desc,
"
"                                                 bomhd_so_sub_seq_no,
"
"                                                 bomhd_sf_cons          ,
"
"                                                 bomhd_drg_no           ,
"
"                                                 bomhd_drg_rev          ,
"
"                                                 bomhd_wbs              ,
"
"                                                 bomhd_ecn_no           ,
"
"                                                 bomhd_ecn_date         ,*/
"
"                                                 bomhd_qty              ,
"
"                                                 bomhd_bom_name         ,
"
"                                                 bomhd_revision_num     ,
"
"                                                 --bomhd_rel_date         ,
"
"                                                 --bomhd_model_id    ,
"
"                                                 bomhd_cre_ip_addr,
"
"                                                 bomhd_cre_os_user,
"
"                                                 bomhd_cre_emp_id,
"
"                                                 bomhd_upd_ip_addr,
"
"                                                 bomhd_upd_os_user,
"
"                                                 bomhd_upd_emp_id,
"
"                                                 bomhd_first_proc_cons_rqrd
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
"                                /*cr0.bomhd_cust_spec_mat_flag,
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
"                                cr0.bomhd_ecn_date         ,*/
"
"                                cr0.bomhd_qty              ,
"
"                                cr0.bomhd_bom_name   ||'-'||v_max_rev,--v_new_bom_no ||'-'||v_max_rev  ,
"
"                                v_max_rev    ,
"
"                                --cr0.bomhd_rel_date         ,
"
"                                --cr0.bomhd_model_id  ,
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
"             UPDATE engg_bom_ln
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
"                            INSERT INTO engg_routing_ln (rouln_bu,
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
"                                        --rouln_tsa_flag,
"
"                                       --rouln_unit_weight,
"
"                                        --rouln_proc_skip_opt,
"
"                                        rouln_cons_store      ,
"
"                                        rouln_rcp_store        ,
"
"                                        --rouln_proj_id          ,
"
"                                        --rouln_task_id          ,
"
"                                        --rouln_oprn_spec       ,
"
"                                        rouln_oprn_desc       ,
"
"                                       -- rouln_appr_suplr_flag ,
"
"                                       -- rouln_oprn_hrs        ,
"
"                                        --rouln_oprn_mins       ,
"
"                                        --rouln_sf_auto_mr ,
"
"                                        --rouln_secs  ,
"
"                                        rouln_oprn_ln_seq,
"
"                                      --  rouln_sco_flag ,
"
"                                      --  rouln_lag_hrs  ,
"
"                                       -- rouln_lag_mins ,
"
"                                        --rouln_lag_hrs_qty   ,
"
"                                        rouln_loc_id,
"
"                                        rouln_cre_ip_addr,
"
"                                        rouln_cre_os_user,
"
"                                        rouln_cre_emp_id,
"
"                                        --rouln_uph
"
"										rouln_pp_plnr_id,
"
"                                        rouln_sfc_plnr_id,
"
"										rouln_stkng_height,
"
"                                        rouln_stkng_no
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
"                                        --cr1.rouln_tsa_flag,
"
"                                        --cr1.rouln_unit_weight,
"
"                                        --cr1.rouln_proc_skip_opt,
"
"                                        cr1.rouln_cons_store      ,
"
"                                        cr1.rouln_rcp_store        ,
"
"                                        --cr1.rouln_proj_id          ,
"
"                                        --cr1.rouln_task_id          ,
"
"                                        --cr1.rouln_oprn_spec       ,
"
"                                        cr1.rouln_oprn_desc       ,
"
"                                        /*cr1.rouln_appr_suplr_flag ,
"
"                                        cr1.rouln_oprn_hrs        ,
"
"                                        cr1.rouln_oprn_mins       ,
"
"                                        cr1.rouln_sf_auto_mr  ,
"
"                                        cr1.rouln_secs  ,   */
"
"                                        cr1.rouln_oprn_ln_seq,
"
"                                       /* cr1.rouln_sco_flag ,
"
"                                        cr1.rouln_lag_hrs  ,
"
"                                        cr1.rouln_lag_mins ,
"
"                                        cr1.rouln_lag_hrs_qty  ,*/
"
"                                        cr1.rouln_loc_id,
"
"                                        audit_info.get_ip_address,
"
"                                        audit_info.get_os_user,
"
"                                        func_find_emp_id(p_bu,p_user) ,
"
"                                        cr1.rouln_pp_plnr_id,
"
"										cr1.rouln_sfc_plnr_id,
"
"										cr1.rouln_stkng_height,
"
"										cr1.rouln_stkng_no
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
"                    INSERT INTO engg_bom_ln (bomln_bu,
"
"                                             bomln_plnt,
"
"                                             bomln_bom_no,
"
"                                             bomln_oprn_seq_no,
"
"										     bomln_seq_no,
"
"										     bomln_bom_type,
"
"										     bomln_prod_id,
"
"										     bomln_prod_rev,
"
"										     bomln_store_id,
"
"										     bomln_prod_uom,
"
"										     bomln_uom,
"
"										     bomln_conv_factor,
"
"										     bomln_required_qty,
"
"										     bomln_scrap_pct,
"
"										     bomln_optional,
"
"										     bomln_multiple,
"
"										     bomln_ord_flag,
"
"										     bomln_plan_pct,
"
"										     bomln_min_qty,
"
"										     bomln_max_qty,
"
"										     bomln_item_seq_no,
"
"										     bomln_matreq_uom,
"
"										     bomln_phantom,
"
"										     bomln_lot_no_gen_flag,
"
"										     bomln_plnnd_mat_flag,
"
"										     bomln_deflt_flag,
"
"										     bomln_byprod_pct,
"
"										     bomln_bom_name,
"
"										     bomln_revision_num,
"
"										     bomln_child_bom_no,
"
"										     bomln_cre_by,
"
"										     bomln_cre_ip_addr,
"
"										     bomln_cre_os_user,
"
"										     bomln_cre_date,
"
"										     bomln_cre_emp_id,
"
"										     bomln_ply_type,
"
"										     bomln_flute_type,
"
"										     bomln_subst_item_avbl,
"
"										     bomln_loc
"
"
"
"                                    )
"
"                            VALUES( p_bu,
"
"                                    p_plnt,
"
"                                    v_new_bom_no,
"
"                                    cr2.bomln_oprn_seq_no,
"
"								    cr2.bomln_seq_no,
"
"								    cr2.bomln_bom_type,
"
"								    cr2.bomln_prod_id,
"
"								    cr2.bomln_prod_rev,
"
"								    cr2.bomln_store_id,
"
"								    cr2.bomln_prod_uom,
"
"								    cr2.bomln_uom,
"
"								    cr2.bomln_conv_factor,
"
"								    cr2.bomln_required_qty,
"
"								    cr2.bomln_scrap_pct,
"
"								    cr2.bomln_optional,
"
"								    cr2.bomln_multiple,
"
"								    cr2.bomln_ord_flag,
"
"								    cr2.bomln_plan_pct,
"
"								    cr2.bomln_min_qty,
"
"								    cr2.bomln_max_qty,
"
"								    cr2.bomln_item_seq_no,
"
"								    cr2.bomln_matreq_uom,
"
"								    cr2.bomln_phantom,
"
"								    cr2.bomln_lot_no_gen_flag,
"
"								    cr2.bomln_plnnd_mat_flag,
"
"								    cr2.bomln_deflt_flag,
"
"								    cr2.bomln_byprod_pct,
"
"								    cr2.bomln_bom_name,
"
"								    cr2.bomln_revision_num,
"
"								    cr2.bomln_child_bom_no,
"
"								    p_user,
"
"								    audit_info.get_ip_address,
"
"								    audit_info.get_os_user,
"
"								    sysdate,
"
"								    func_find_emp_id(p_bu,p_user) ,
"
"								    cr2.bomln_ply_type,
"
"								    cr2.bomln_flute_type,
"
"								    cr2.bomln_subst_item_avbl,
"
"								    cr2.bomln_loc
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
"            INSERT INTO engg_bor_ln(borln_bu,
"
"						borln_plnt,
"
"						borln_bom_no,
"
"						borln_oprn_seq_no,
"
"						borln_sub_seq_no,
"
"						borln_type,
"
"						borln_res_grp_id,
"
"						borln_units_per_hour,
"
"						borln_hrs_per_unit,
"
"						borln_mins_per_unit,
"
"						borln_basis,
"
"						borln_res_seq_no,
"
"						borln_bkup_days,
"
"						borln_res_offset_pct,
"
"						borln_uom,
"
"						borln_lot_size,
"
"						borln_secs_per_unit,
"
"						borln_no_of_units,
"
"						borln_res_grp_type,
"
"						borln_cre_by,
"
"						borln_cre_ip_addr,
"
"						borln_cre_os_user,
"
"						borln_cre_date,
"
"						borln_cre_emp_id,
"
"						borln_setup_hrs,
"
"						borln_setup_mins,
"
"						borln_batch_qty,
"
"						borln_batch_hrs,
"
"						borln_lag_hrs,
"
"						borln_priority,
"
"						borln_oprn_id,
"
"						borln_proc_id
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
"						        cr3.borln_sub_seq_no,
"
"						        cr3.borln_type,
"
"						        cr3.borln_res_grp_id,
"
"						        cr3.borln_units_per_hour,
"
"						        cr3.borln_hrs_per_unit,
"
"						        cr3.borln_mins_per_unit,
"
"						        cr3.borln_basis,
"
"						        cr3.borln_res_seq_no,
"
"						        cr3.borln_bkup_days,
"
"						        cr3.borln_res_offset_pct,
"
"						        cr3.borln_uom,
"
"						        cr3.borln_lot_size,
"
"						        cr3.borln_secs_per_unit,
"
"						        cr3.borln_no_of_units,
"
"						        cr3.borln_res_grp_type,
"
"						        p_user,
"
"						        audit_info.get_ip_address,
"
"						        audit_info.get_os_user,
"
"						        sysdate,
"
"						        func_find_emp_id(p_bu,p_user),
"
"						        cr3.borln_setup_hrs,
"
"						        cr3.borln_setup_mins,
"
"						        cr3.borln_batch_qty,
"
"						        cr3.borln_batch_hrs,
"
"						        cr3.borln_lag_hrs,
"
"						        cr3.borln_priority,
"
"						        cr3.borln_oprn_id,
"
"						        cr3.borln_proc_id
"
"                                );
"
"
"
"         END LOOP c3;
"
"
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
"    END proc_cre_engg_bom_rev;
"
"
"
"
"
"
"
"     PROCEDURE proc_ins_engg_bom_hist (p_bu                VARCHAR2,
"
"                                     p_plnt                VARCHAR2,
"
"                                     p_bom_no            VARCHAR2,
"
"                                     p_ref                VARCHAR2,
"
"                                     p_user                VARCHAR2,
"
"                                     p_res        OUT        VARCHAR2
"
"                                     )
"
"        IS
"
"
"
"
"
"
"
"        CURSOR c0
"
"            IS
"
"        SELECT *
"
"          FROM engg_bom_hd
"
"         WHERE bomhd_bu = p_bu
"
"           AND bomhd_plnt = p_plnt
"
"           AND bomhd_bom_no = p_bom_no;
"
"
"
"        CURSOR c1
"
"            IS
"
"        SELECT *
"
"          FROM engg_routing_ln
"
"         WHERE rouln_bu = p_bu
"
"           AND rouln_plnt = p_plnt
"
"           AND rouln_bom_no = p_bom_no;
"
"
"
"        CURSOR c2
"
"            IS
"
"        SELECT *
"
"          FROM engg_bom_ln
"
"         WHERE bomln_bu = p_bu
"
"           AND bomln_plnt = p_plnt
"
"           AND bomln_bom_no = p_bom_no;
"
"
"
"        CURSOR c3
"
"            IS
"
"        SELECT *
"
"          FROM engg_bor_ln
"
"         WHERE borln_bu = p_bu
"
"           AND borln_plnt = p_plnt
"
"           AND borln_bom_no = p_bom_no;
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
"        cr0            c0%ROWTYPE;
"
"        v_doc_no    VARCHAR2(15);
"
"
"
"
"
"        BEGIN
"
"
"
"           OPEN c0;
"
"           FETCH c0 INTO cr0;
"
"
"
"              IF c0%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20595,'PLN'||' '||'Bill Of Materials Not Found.');
"
"              ELSE
"
"
"
"                 p_res := 'N';
"
"
"
"                 SELECT NVL(MAX(TO_NUMBER(bomhdh_doc_no)),0) + 1
"
"                   INTO v_doc_no
"
"                   FROM engg_bom_hd_hist
"
"                  WHERE bomhdh_bu = p_bu
"
"                    AND bomhdh_plnt = p_plnt;
"
"
"
"                             INSERT INTO engg_bom_hd_hist(bomhdh_bu,
"
"                                         bomhdh_plnt,
"
"                                         bomhdh_bom_no,
"
"                                         bomhdh_doc_no,
"
"                                         bomhdh_prod_id,
"
"                                         bomhdh_prod_rev,
"
"                                         bomhdh_primary,
"
"                                         bomhdh_eff_from,
"
"                                         bomhdh_eff_to,
"
"                                         bomhdh_active_date,
"
"                                         bomhdh_cancel_date,
"
"                                         bomhdh_status,
"
"                                         bomhdh_dflt_bom,
"
"                                         bomhdh_cumm_leadtime,
"
"                                         bomhdh_prod_cat,
"
"                                         bomhdh_prod_style,
"
"                                         bomhdh_prod_color,
"
"                                         bomhdh_prod_size,
"
"                                         bomhdh_gar_bom_no,
"
"                                         bomhdh_order_no,
"
"                                         bomhdh_buyer_id,
"
"                                         bomhdh_dia,
"
"                                         bomhdh_gsm,
"
"                                         bomhdh_structure,
"
"                                         bomhdh_content,
"
"                                         bomhdh_count,
"
"                                         bomhdh_partial,
"
"                                         bomhdh_uom,
"
"                                         bomhdh_prod_uom,
"
"                                         bomhdh_conv_factor,
"
"                                         bomhdh_cre_by,
"
"                                         bomhdh_cre_date,
"
"                                         bomhdh_upd_by,
"
"                                         bomhdh_upd_date,
"
"                                         bomhdh_so_pfx,
"
"                                         bomhdh_so_no,
"
"                                         bomhdh_so_seqno,
"
"                                         bomhdh_action_by,
"
"                                         bomhdh_action_date,
"
"                                         bomhdh_ref,
"
"                                         bomhdh_bom_name  ,
"
"                                         bomhdh_revision_num,
"
"                                         bomhdh_cre_ip_addr,
"
"                                         bomhdh_cre_os_user,
"
"                                         bomhdh_cre_emp_id,
"
"                                         bomhdh_qty,
"
"                                         bomhdh_cust_spec_mat_flag,
"
"                                         bomhdh_thickness,
"
"                                         bomhdh_width,
"
"                                         bomhdh_length,
"
"                                         bomhdh_first_proc_cons_rqrd
"
"                                         )
"
"                                 VALUES( p_bu,
"
"                                         p_plnt,
"
"                                         p_bom_no,
"
"                                         v_doc_no,
"
"                                         cr0.bomhd_prod_id,
"
"                                         cr0.bomhd_prod_rev,
"
"                                         cr0.bomhd_primary,
"
"                                         cr0.bomhd_eff_from,
"
"                                         cr0.bomhd_eff_to,
"
"                                         cr0.bomhd_active_date,
"
"                                         cr0.bomhd_cancel_date,
"
"                                         cr0.bomhd_status,
"
"                                         cr0.bomhd_dflt_bom,
"
"                                         cr0.bomhd_cumm_leadtime,
"
"                                         cr0.bomhd_prod_cat,
"
"                                         cr0.bomhd_prod_style,
"
"                                         cr0.bomhd_prod_color,
"
"                                         cr0.bomhd_prod_size,
"
"                                         cr0.bomhd_gar_bom_no,
"
"                                         cr0.bomhd_order_no,
"
"                                         cr0.bomhd_buyer_id,
"
"                                         cr0.bomhd_dia,
"
"                                         cr0.bomhd_gsm,
"
"                                         cr0.bomhd_structure,
"
"                                         cr0.bomhd_content,
"
"                                         cr0.bomhd_count,
"
"                                         cr0.bomhd_partial,
"
"                                         cr0.bomhd_uom,
"
"                                         cr0.bomhd_prod_uom,
"
"                                         cr0.bomhd_conv_factor,
"
"                                         cr0.bomhd_cre_by,
"
"                                         cr0.bomhd_cre_date,
"
"                                         cr0.bomhd_upd_by,
"
"                                         cr0.bomhd_upd_date,
"
"                                         cr0.bomhd_so_pfx,
"
"                                         cr0.bomhd_so_no,
"
"                                         cr0.bomhd_so_seqno,
"
"                                         p_user,
"
"                                         SYSDATE,
"
"                                         p_ref,
"
"                                         cr0.bomhd_bom_name,
"
"                                         cr0.bomhd_revision_num,
"
"                                         audit_info.get_ip_address,
"
"                                         audit_info.get_os_user,
"
"                                         func_find_emp_id(p_bu,p_user),
"
"                                         cr0.bomhd_qty,
"
"                                         'N',
"
"                                         0,
"
"                                         0,
"
"                                         0,
"
"                                         'N'
"
"                                         );
"
"
"
"                 FOR cr1 IN c1
"
"                 LOOP
"
"
"
"                                    INSERT INTO engg_routing_ln_hist(roulnh_bu,
"
"                                                roulnh_plnt,
"
"                                                roulnh_bom_no,
"
"                                                roulnh_doc_no,
"
"                                                roulnh_oprn_seq_no,
"
"                                                roulnh_oprn_id,
"
"                                                roulnh_proc_id,
"
"                                                roulnh_comp_pct,
"
"                                                roulnh_ins_req,
"
"                                                roulnh_oprn_no,
"
"                                                roulnh_source_type,
"
"                                                roulnh_proc_draw_no,
"
"                                                roulnh_proc_draw_rev,
"
"                                                roulnh_ins_sheet_id,
"
"                                                roulnh_cre_by,
"
"                                                roulnh_cre_date,
"
"                                                roulnh_upd_by,
"
"                                                roulnh_upd_date,
"
"                                                roulnh_ls_flag,
"
"                                                roulnh_oprn_flag,
"
"                                                roulnh_action_by,
"
"                                                roulnh_action_date,
"
"                                                roulnh_oprn_ln_seq,
"
"                                                roulnh_cons_store,
"
"                                                roulnh_rcp_store,
"
"                                                roulnh_cre_ip_addr,
"
"                                                roulnh_cre_os_user,
"
"                                                roulnh_cre_emp_id,
"
"                                                roulnh_tsa_flag,
"
"                                                roulnh_oprn_hrs,
"
"                                                roulnh_oprn_mins,
"
"                                                roulnh_secs
"
"                                                )
"
"                                                 VALUES(p_bu,
"
"                                                p_plnt,
"
"                                                p_bom_no,
"
"                                                v_doc_no,
"
"                                                cr1.rouln_oprn_seq_no,
"
"                                                cr1.rouln_oprn_id,
"
"                                                cr1.rouln_proc_id,
"
"                                                cr1.rouln_comp_pct,
"
"                                                cr1.rouln_ins_req,
"
"                                                cr1.rouln_oprn_no,
"
"                                                cr1.rouln_source_type,
"
"                                                cr1.rouln_proc_draw_no,
"
"                                                cr1.rouln_proc_draw_rev,
"
"                                                cr1.rouln_ins_sheet_id,
"
"                                                cr1.rouln_cre_by,
"
"                                                cr1.rouln_cre_date,
"
"                                                cr1.rouln_upd_by,
"
"                                                cr1.rouln_upd_date,
"
"                                                cr1.rouln_ls_flag,
"
"                                                cr1.rouln_oprn_flag,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                cr1.rouln_oprn_ln_seq,
"
"                                                cr1.rouln_cons_store,
"
"                                                cr1.rouln_rcp_store,
"
"                                                audit_info.get_ip_address,
"
"                                                audit_info.get_os_user,
"
"                                                func_find_emp_id(p_bu,p_user),
"
"                                                'N',
"
"                                                0,
"
"                                                0,
"
"                                                0
"
"                                                );
"
"
"
"
"
"             END LOOP;
"
"
"
"             FOR cr2 IN c2
"
"             LOOP
"
"
"
"                                  INSERT INTO engg_bom_ln_hist ( bomlnh_bu,
"
"                                            bomlnh_plnt,
"
"                                            bomlnh_bom_no,
"
"                                            bomlnh_doc_no,
"
"                                            bomlnh_oprn_seq_no,
"
"                                            bomlnh_seq_no,
"
"                                            bomlnh_bom_type,
"
"                                            bomlnh_prod_id,
"
"                                            bomlnh_prod_rev,
"
"                                            bomlnh_store_id,
"
"                                            bomlnh_prod_uom,
"
"                                            bomlnh_uom,
"
"                                            bomlnh_conv_factor,
"
"                                            bomlnh_required_qty,
"
"                                            bomlnh_scrap_pct,
"
"                                            bomlnh_optional,
"
"                                            bomlnh_multiple,
"
"                                            bomlnh_ord_flag,
"
"                                            bomlnh_plan_pct,
"
"                                            bomlnh_min_qty,
"
"                                            bomlnh_max_qty,
"
"                                            bomlnh_item_seq_no,
"
"                                            bomlnh_matreq_uom,
"
"                                            bomlnh_phantom,
"
"                                            bomlnh_lot_no_gen_flag,
"
"                                            bomlnh_cre_by,
"
"                                            bomlnh_cre_date,
"
"                                            bomlnh_upd_by,
"
"                                            bomlnh_upd_date,
"
"                                            bomlnh_plnnd_mat_flag,
"
"                                            bomlnh_deflt_flag,
"
"                                            bomlnh_action_by,
"
"                                            bomlnh_action_date,
"
"                                            bomlnh_cre_ip_addr,
"
"                                            bomlnh_cre_os_user,
"
"                                            bomlnh_cre_emp_id,
"
"                                            bomlnh_child_bom_no,
"
"                                            bomlnh_byprod_pct,
"
"                                            bomlnh_rqrd_pct,
"
"                                            bomlnh_cmr_flag,
"
"                                            bomlnh_gsm,
"
"                                            bomlnh_length,
"
"                                            bomlnh_width,
"
"                                            bomlnh_no_of_ups,
"
"                                            bomlnh_fdng_size,
"
"                                            bomlnh_grain
"
"                                            )
"
"                                    VALUES( p_bu,
"
"                                            p_plnt,
"
"                                            p_bom_no,
"
"                                            v_doc_no,
"
"                                            cr2.bomln_oprn_seq_no,
"
"                                            cr2.bomln_seq_no,
"
"                                            cr2.bomln_bom_type,
"
"                                            cr2.bomln_prod_id,
"
"                                            cr2.bomln_prod_rev,
"
"                                            cr2.bomln_store_id,
"
"                                            cr2.bomln_prod_uom,
"
"                                            cr2.bomln_uom,
"
"                                            cr2.bomln_conv_factor,
"
"                                            cr2.bomln_required_qty,
"
"                                            cr2.bomln_scrap_pct,
"
"                                            cr2.bomln_optional,
"
"                                            cr2.bomln_multiple,
"
"                                            cr2.bomln_ord_flag,
"
"                                            cr2.bomln_plan_pct,
"
"                                            cr2.bomln_min_qty,
"
"                                            cr2.bomln_max_qty,
"
"                                            cr2.bomln_item_seq_no,
"
"                                            cr2.bomln_matreq_uom,
"
"                                            cr2.bomln_phantom,
"
"                                            cr2.bomln_lot_no_gen_flag,
"
"                                            cr2.bomln_cre_by,
"
"                                            cr2.bomln_cre_date,
"
"                                            cr2.bomln_upd_by,
"
"                                            cr2.bomln_upd_date,
"
"                                            cr2.bomln_plnnd_mat_flag,
"
"                                            cr2.bomln_deflt_flag,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            audit_info.get_ip_address,
"
"                                            audit_info.get_os_user,
"
"                                            func_find_emp_id(p_bu,p_user),
"
"                                            cr2.bomln_child_bom_no,
"
"                                            0,
"
"                                            0,
"
"                                            'N',
"
"                                            0,
"
"                                            0,
"
"                                            0,
"
"                                            0,
"
"                                            0,
"
"                                            0
"
"                                            );
"
"
"
"             END LOOP;
"
"
"
"             FOR cr3 IN c3
"
"             LOOP
"
"
"
"                INSERT INTO engg_bor_ln_hist (    borlnh_bu,
"
"                                            borlnh_plnt,
"
"                                            borlnh_bom_no,
"
"                                            borlnh_doc_no,
"
"                                            borlnh_oprn_seq_no,
"
"                                            borlnh_sub_seq_no,
"
"                                            borlnh_type,
"
"                                            borlnh_res_grp_id,
"
"                                            borlnh_units_per_hour,
"
"                                            borlnh_hrs_per_unit,
"
"                                            borlnh_mins_per_unit,
"
"                                            borlnh_basis,
"
"                                            borlnh_res_seq_no,
"
"                                            borlnh_bkup_days,
"
"                                            borlnh_res_offset_pct,
"
"                                            borlnh_uom,
"
"                                            borlnh_cre_by,
"
"                                            borlnh_cre_date,
"
"                                            borlnh_upd_by,
"
"                                            borlnh_upd_date,
"
"                                            borlnh_lot_size,
"
"                                            borlnh_secs_per_unit,
"
"                                            borlnh_lag_hrs,
"
"                                            borlnh_action_by,
"
"                                            borlnh_action_date,
"
"                                            borlnh_setup_hrs   ,
"
"                                            borlnh_no_of_units  ,
"
"                                            borlnh_res_grp_type ,
"
"                                            borlnh_priority  ,
"
"                                            borlnh_setup_mins ,
"
"                                            borlnh_cre_ip_addr,
"
"                                            borlnh_cre_os_user,
"
"                                            borlnh_cre_emp_id,
"
"                                            borlnh_batch_hrs,
"
"                                            borlnh_batch_qty,
"
"                                            borlnh_mpm,
"
"                                            borlnh_ink_mix_hrs,
"
"                                            borlnh_roll_chng_hrs,
"
"                                            borlnh_move_hrs,
"
"                                            borlnh_tear_down_hrs
"
"                                            )
"
"                                    VALUES (p_bu,
"
"                                            p_plnt,
"
"                                            p_bom_no,
"
"                                            v_doc_no,
"
"                                            cr3.borln_oprn_seq_no,
"
"                                            cr3.borln_sub_seq_no,
"
"                                            cr3.borln_type,
"
"                                            cr3.borln_res_grp_id,
"
"                                            cr3.borln_units_per_hour,
"
"                                            cr3.borln_hrs_per_unit,
"
"                                            cr3.borln_mins_per_unit,
"
"                                            cr3.borln_basis,
"
"                                            cr3.borln_res_seq_no,
"
"                                            cr3.borln_bkup_days,
"
"                                            cr3.borln_res_offset_pct,
"
"                                            cr3.borln_uom,
"
"                                            cr3.borln_cre_by,
"
"                                            cr3.borln_cre_date,
"
"                                            cr3.borln_upd_by,
"
"                                            cr3.borln_upd_date,
"
"                                            cr3.borln_lot_size,
"
"                                            cr3.borln_secs_per_unit,
"
"                                            cr3.borln_lag_hrs,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr3.borln_setup_hrs   ,
"
"                                            cr3.borln_no_of_units  ,
"
"                                            cr3.borln_res_grp_type ,
"
"                                            cr3.borln_priority  ,
"
"                                            cr3.borln_setup_mins ,
"
"                                            audit_info.get_ip_address,
"
"                                            audit_info.get_os_user,
"
"                                            func_find_emp_id(p_bu,p_user),
"
"                                            cr3.borln_batch_hrs,
"
"                                            cr3.borln_batch_qty,
"
"                                            0,
"
"                                            0,
"
"                                            0,
"
"                                            0,
"
"                                            0
"
"                                            );
"
"
"
"             END LOOP;
"
"
"
"
"
"
"
"
"
"                p_res := 'Y';
"
"
"
"             END IF;
"
"
"
"             IF p_res ='Y' THEN
"
"
"
"                DELETE
"
"                  FROM engg_bom_hd
"
"                 WHERE bomhd_bu = p_bu
"
"                   AND bomhd_plnt = p_plnt
"
"                   AND bomhd_bom_no = p_bom_no;
"
"
"
"                DELETE
"
"                  FROM engg_routing_ln
"
"                 WHERE rouln_bu = p_bu
"
"                   AND rouln_plnt = p_plnt
"
"                   AND rouln_bom_no = p_bom_no;
"
"
"
"
"
"                DELETE
"
"                  FROM engg_bom_ln
"
"                 WHERE bomln_bu = p_bu
"
"                   AND bomln_plnt = p_plnt
"
"                   AND bomln_bom_no = p_bom_no;
"
"
"
"
"
"                 DELETE
"
"                  FROM engg_bor_ln
"
"                 WHERE borln_bu = p_bu
"
"                   AND borln_plnt = p_plnt
"
"                   AND borln_bom_no = p_bom_no;
"
"
"
"
"
"
"
"             END IF;
"
"
"
"          CLOSE c0;
"
"
"
"    END proc_ins_engg_bom_hist;
"
"
"
"
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
"           engg_bom_hd
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
"           engg_routing_ln
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
"           engg_routing_ln
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
"           engg_routing_ln
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
"           engg_bom_ln
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
"      FROM mfg_res_groups, engg_bor_ln
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
"      FROM mfg_resources, engg_bor_ln
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
"
"
"    CURSOR c7
"
"    IS
"
"    SELECT *
"
"      FROM engg_bor_ln
"
"     WHERE borln_bu = p_bu
"
"       AND borln_plnt = p_plnt
"
"       AND borln_bom_no = p_bom_no;
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
"    SELECT *
"
"      FROM processes,
"
"           engg_routing_ln
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
"    cr7 c7%ROWTYPE;
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
"
"
"    END    proc_check_unit_asso;
"
"
"
"PROCEDURE proc_inactivate_engg_bom (p_bu        VARCHAR2,
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
"  FROM engg_bom_hd
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
"  FROM engg_bom_hd,
"
"       engg_routing_ln
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
"  FROM engg_bom_hd,
"
"       engg_routing_ln,
"
"       engg_bom_ln
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
"  FROM engg_bom_hd,
"
"       engg_routing_ln,
"
"       engg_bor_ln
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
"
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
"             RAISE_APPLICATION_ERROR(-20595,'PLN'||' '||'Engineering Bill Of Materials Not Found.');
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
"            UPDATE engg_bom_hd
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
"            UPDATE engg_bom_hd
"
"               SET bomhd_status = 'E',
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
"    END proc_inactivate_engg_bom;
"
"
"
"END pkg_engg_bom_hist;"
/
