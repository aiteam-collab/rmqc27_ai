CREATE OR REPLACE
"PACKAGE BODY pkg_mfg_rwk_perpetual_journals IS
"
"PROCEDURE proc_rw_cal_cost_hist(
"
"       p_bu                VARCHAR2,
"
"       p_plnt              VARCHAR2,
"
"       p_doc_no            VARCHAR2,
"
"       p_prod_id           VARCHAR2,
"
"       p_prod_rev          NUMBER,
"
"       p_comp_qty          NUMBER,
"
"       p_dm_cost     OUT   NUMBER,
"
"       p_dl_cost     OUT   NUMBER,
"
"       p_oh_cost     OUT   NUMBER,
"
"       p_unit_cost   OUT   NUMBER
"
"    )
"
"    IS
"
"CURSOR c1
"
"  IS
"
"SELECT NVL (SUM (item_cost), 0) oh_cost
"
"  FROM ((SELECT NVL ((p_comp_qty * SUM (ohbs_rate)), 0) item_cost
"
"         FROM rework_ord_res_usage_hist, oh_basis_subelement
"
"        WHERE roruh_bu = ohbs_bu
"
"          AND roruh_plnt = ohbs_plnt
"
"          AND roruh_oprn_id = ohbs_oprn_id
"
"          AND roruh_bu = p_bu
"
"          AND roruh_plnt = p_plnt
"
"          AND roruh_doc_no = p_doc_no
"
"          AND ohbs_prod_id = p_prod_id
"
"          AND ohbs_prod_rev = p_prod_rev
"
"          AND ohbs_status = 'A'
"
"          AND ohbs_basis = 'I')
"
"      UNION ALL
"
"      (SELECT   NVL (
"
"                   (p_comp_qty * (SUM (ohbs_rate) / prod_lot_size)),
"
"                   0
"
"                ) lot_cost
"
"           FROM rework_ord_res_usage_hist, oh_basis_subelement, products
"
"          WHERE roruh_bu = ohbs_bu
"
"            AND roruh_plnt = ohbs_plnt
"
"            AND roruh_oprn_id = ohbs_oprn_id
"
"            AND ohbs_bu = prod_bu
"
"            AND ohbs_prod_id = prod_id
"
"            AND ohbs_prod_rev = prod_rev
"
"            AND roruh_bu = p_bu
"
"            AND roruh_plnt = p_plnt
"
"            AND roruh_doc_no = p_doc_no
"
"            AND ohbs_prod_id = p_prod_id
"
"            AND ohbs_prod_rev = p_prod_rev
"
"            AND ohbs_status = 'A'
"
"            AND ohbs_basis = 'L'
"
"       GROUP BY prod_lot_size)
"
"      UNION ALL
"
"      (SELECT NVL (SUM (ohbs_rate), 0) act_cost
"
"         FROM rework_ord_res_usage_hist, oh_basis_subelement
"
"        WHERE roruh_bu = ohbs_bu
"
"          AND roruh_plnt = ohbs_plnt
"
"          AND roruh_oprn_id = ohbs_oprn_id
"
"          AND roruh_bu = p_bu
"
"          AND roruh_plnt = p_plnt
"
"          AND roruh_doc_no = p_doc_no
"
"          AND ohbs_prod_id = p_prod_id
"
"          AND ohbs_prod_rev = p_prod_rev
"
"          AND ohbs_status = 'A'
"
"          AND ohbs_basis = 'A'
"
"          AND ohbs_activity IS NOT NULL)
"
"      UNION ALL
"
"      (SELECT NVL (SUM (roruh_units * ohbs_rate), 0) ru_cost
"
"         FROM rework_ord_res_usage_hist,
"
"              oh_basis_subelement,
"
"              oh_resource_asso
"
"        WHERE roruh_bu = ohbs_bu
"
"          AND roruh_plnt = ohbs_plnt
"
"          AND roruh_oprn_id = ohbs_oprn_id
"
"          AND ohbs_bu = ohra_bu
"
"          AND ohbs_plnt = ohra_plnt
"
"          AND ohbs_trans_no = ohra_trans_no
"
"          AND ohra_res_grp = func_find_res_group (
"
"                                p_bu,
"
"                                p_plnt,
"
"                                roruh_res_id
"
"                             )
"
"          AND roruh_bu = p_bu
"
"          AND roruh_plnt = p_plnt
"
"          AND roruh_doc_no = p_doc_no
"
"          AND ohbs_prod_id = p_prod_id
"
"          AND ohbs_prod_rev = p_prod_rev
"
"          AND ohbs_status = 'A'
"
"          AND ohbs_basis = 'RU'
"
"          AND roruh_res_id IS NOT NULL)
"
"      UNION ALL
"
"      (SELECT   NVL (
"
"                   (  SUM (roruh_units * roruh_hrly_rate)
"
"                    * (ohbs_rate / 100)
"
"                   ),
"
"                   0
"
"                ) rv_cost
"
"           FROM rework_ord_res_usage_hist,
"
"                oh_basis_subelement,
"
"                oh_resource_asso
"
"          WHERE roruh_bu = ohbs_bu
"
"            AND roruh_plnt = ohbs_plnt
"
"            AND roruh_oprn_id = ohbs_oprn_id
"
"            AND ohbs_bu = ohra_bu
"
"            AND ohbs_plnt = ohra_plnt
"
"            AND ohbs_trans_no = ohra_trans_no
"
"            AND ohra_res_grp =
"
"                      func_find_res_group (p_bu, p_plnt, roruh_res_id)
"
"            AND roruh_bu = p_bu
"
"            AND roruh_plnt = p_plnt
"
"            AND roruh_doc_no = p_doc_no
"
"            AND ohbs_prod_id = p_prod_id
"
"            AND ohbs_prod_rev = p_prod_rev
"
"            AND ohbs_status = 'A'
"
"            AND ohbs_basis = 'RV'
"
"            AND roruh_res_id IS NOT NULL
"
"       GROUP BY ohbs_rate));
"
"
"
"       CURSOR c2
"
"       IS
"
"          SELECT SUM (mat_cost) mat_cost
"
"                  FROM ((SELECT NVL (SUM (rscd_cons_qty * rscd_unit_cost), 0) mat_cost
"
"                           FROM rework_scrap_cons_detail
"
"                          WHERE rscd_bu = p_bu
"
"                            AND rscd_plnt = p_plnt
"
"                            AND rscd_doc_no = p_doc_no
"
"                            AND ROUND((rscd_cons_qty * rscd_unit_cost),2) > 0
"
"                            AND rscd_cons_type = 'N')
"
"                          UNION ALL  --Handled for Mat. req.
"
"                         (SELECT NVL (SUM (rocmrd_cons_qty * rocmrd_unit_cost), 0) mat_cost
"
"                           FROM rework_ord_comp_mat_req_dtls
"
"                          WHERE rocmrd_bu = p_bu
"
"                            AND rocmrd_plnt = p_plnt
"
"                            AND ROUND((rocmrd_cons_qty * rocmrd_unit_cost),2) > 0
"
"                            AND rocmrd_doc_no = p_doc_no)
"
"                        UNION ALL
"
"                        (SELECT NVL (SUM ( DECODE(rwochdh_sf_code,NULL,func_find_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store),
"
"                                    CASE WHEN rocsd_sys_ls_no IS NOT NULL THEN func_find_sfg_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store,rwochdh_prod_ord_no,rwochdh_sf_code,rocsd_sys_ls_no) ELSE func_find_sfg_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store,rwochdh_prod_ord_no,rwochdh_sf_code,rwochdh_sys_ls_no)END))
"
"                                    , 0) mat_cost
"
"                           FROM rework_order_comp_hd_hist,
"
"                                rework_order_comp_ser_dtls
"
"                          WHERE rocsd_bu = rwochdh_bu
"
"                            AND rocsd_plnt  = rwochdh_plnt
"
"                            AND rocsd_doc_no  = rwochdh_doc_no
"
"                            AND rwochdh_bu = p_bu
"
"                            AND rwochdh_plnt = p_plnt
"
"                            AND rwochdh_ord_type NOT IN ('SC','PR')
"
"                            AND rwochdh_doc_no = p_doc_no)
"
"                          UNION ALL
"
"                        (SELECT NVL (SUM (rwochdh_trans_qty *
"
"                                DECODE(rwochdh_sf_code,NULL,func_find_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store),
"
"                                     func_find_sfg_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store,rwochdh_prod_ord_no,rwochdh_sf_code,rwochdh_sys_ls_no) ))
"
"                                    , 0) mat_cost
"
"                           FROM rework_order_comp_hd_hist
"
"                          WHERE rwochdh_bu = p_bu
"
"                            AND rwochdh_plnt = p_plnt
"
"                            AND rwochdh_ord_type NOT IN ('SC','PR')
"
"                            AND rwochdh_doc_no = p_doc_no
"
"                            AND NOT EXISTS(SELECT 1
"
"                                             FROM rework_order_comp_ser_dtls
"
"                                             WHERE rocsd_bu = rwochdh_bu
"
"                            AND rocsd_plnt  = rwochdh_plnt
"
"                            AND rocsd_doc_no  = rwochdh_doc_no))
"
"                        UNION ALL
"
"                        (SELECT NVL (SUM (rwochd_trans_qty * DECODE(rwochd_ord_type, 'SC',porl_scon_mat_unit_cost, 'PR',  (porl_sc_unit_cost * porh_exchange_rate) + NVL(porl_bc_land_cost,0) + NVL(porl_sc_chrg_amt,0))),0) mat_cost
"
"                           FROM rework_order_comp_hd,
"
"                                pur_ord_receipt_hd,
"
"                                pur_ord_receipt_ln
"
"                          WHERE rwochd_bu = porl_bu
"
"                            AND rwochd_plnt = porl_plnt
"
"                            --AND rwochd_source_pfx = porl_receipt_pfx
"
"                            AND rwochd_source_no = porl_receipt_no
"
"                            AND rwochd_source_line = porl_seq_no
"
"                            AND rwochd_prod_id = porl_prod_id
"
"                            AND rwochd_prod_rev = porl_prod_rev
"
"                            AND porh_bu = porl_bu
"
"                            AND porh_plnt = porl_plnt
"
"                         --   AND porh_receipt_pfx = porl_receipt_pfx
"
"                            AND porh_receipt_no = porl_receipt_no
"
"                            AND rwochd_bu = p_bu
"
"                            AND rwochd_plnt = p_plnt
"
"                            AND rwochd_ord_type IN ('SC','PR')
"
"                            AND rwochd_doc_no = p_doc_no)
"
"                       UNION ALL --HANDLED FOR HISTORY
"
"                       (SELECT NVL (SUM (rwochdh_trans_qty * DECODE(rwochdh_ord_type, 'SC',porlh_scon_mat_unit_cost, 'PR', (porlh_sc_unit_cost * porhh_exchange_rate) + NVL(porlh_bc_land_cost,0) + NVL(porlh_sc_chrg_amt,0))),0) mat_cost
"
"                                    FROM rework_order_comp_hd_hist,
"
"                                         pur_ord_receipt_hd_hist,
"
"                                         pur_ord_receipt_ln_hist
"
"                                   WHERE rwochdh_bu = porlh_bu
"
"                                     AND rwochdh_plnt = porlh_plnt
"
"                                  --   AND rwochdh_source_pfx = porlh_receipt_pfx
"
"                                     AND rwochdh_source_no = porlh_receipt_no
"
"                                     AND rwochdh_source_line = porlh_seq_no
"
"                                     AND rwochdh_prod_id = porlh_prod_id
"
"                                     AND rwochdh_prod_rev = porlh_prod_rev
"
"                                     AND porhh_bu = porlh_bu
"
"                                     AND porhh_plnt = porlh_plnt
"
"                                   --  AND porhh_receipt_pfx = porlh_receipt_pfx
"
"                                     AND porhh_receipt_no = porlh_receipt_no
"
"                                     AND rwochdh_bu = p_bu
"
"                                     AND rwochdh_plnt = p_plnt
"
"                                     AND rwochdh_ord_type IN ('SC','PR')
"
"                  AND rwochdh_doc_no = p_doc_no));
"
"
"
"
"
"       CURSOR c3
"
"       IS
"
"          SELECT NVL (SUM (roruh_units * roruh_hrly_rate), 0) res_cost
"
"            FROM rework_ord_res_usage_hist, mfg_resources, prod_plants
"
"           WHERE mfgr_bu = roruh_bu
"
"             AND mfgr_plnt = roruh_plnt
"
"             AND mfgr_res_id = roruh_res_id
"
"             AND roruh_bu = prodplnt_bu
"
"             AND roruh_plnt = prodplnt_plnt
"
"             AND prodplnt_prod_id = p_prod_id
"
"             AND prodplnt_prod_rev = p_prod_rev
"
"             AND prodplnt_source = 'R'
"
"             AND prodplnt_status = 'A'
"
"             AND roruh_bu = p_bu
"
"             AND roruh_plnt = p_plnt
"
"             AND roruh_doc_no = p_doc_no;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"       v_total_cost   NUMBER (17, 5) := 0;
"
"       v_dm_cost      NUMBER (17, 5) := 0;
"
"       v_dl_cost      NUMBER (17, 5) := 0;
"
"       v_oh_cost      NUMBER (17, 5) := 0;
"
"       v_unit_cost    NUMBER (17, 5) := 0;
"
"       v_prev_cost    NUMBER (17, 5) := 0;
"
"
"
"    BEGIN
"
"
"
"       IF p_comp_qty > 0
"
"       THEN
"
"          OPEN c1;
"
"          FETCH c1 INTO cr1;
"
"          OPEN c2;
"
"          FETCH c2 INTO cr2;
"
"          OPEN c3;
"
"          FETCH c3 INTO cr3;
"
"
"
"          --raise_application_error(-20999,'HRM'||cr2.mat_cost||' - '||cr3.res_cost||' - '||cr1.oh_cost||' - '||p_comp_qty);
"
"
"
"          v_dm_cost := ROUND (cr2.mat_cost, 5);
"
"          v_dl_cost := ROUND (cr3.res_cost, 5);
"
"          v_oh_cost := ROUND (cr1.oh_cost, 5);
"
"          v_unit_cost :=   (ROUND (NVL (cr2.mat_cost, 0), 5)
"
"                            + ROUND (NVL (cr3.res_cost, 0), 5)
"
"                            + ROUND (NVL (cr1.oh_cost, 0), 5)
"
"                           )
"
"                         / p_comp_qty;
"
"
"
"          p_dm_cost := NVL (v_dm_cost, 0);
"
"          p_dl_cost := NVL (v_dl_cost, 0);
"
"          p_oh_cost := NVL (v_oh_cost, 0);
"
"          p_unit_cost := NVL (v_unit_cost, 0);
"
"          CLOSE c3;
"
"          CLOSE c2;
"
"          CLOSE c1;
"
"       ELSE
"
"          p_dm_cost := 0;
"
"          p_dl_cost := 0;
"
"          p_oh_cost := 0;
"
"          p_unit_cost := 0;
"
"       END IF;
"
"
"
"       --raise_application_error(-20999,'HRM'||p_dm_cost||' - '||p_dl_cost||' - '||p_oh_cost||' - '||p_unit_cost);
"
"    END proc_rw_cal_cost_hist;
"
"
"
"    PROCEDURE proc_delete_journals(p_bu            VARCHAR2,
"
"                                   p_plnt        VARCHAR2,
"
"                                   p_trans_no    VARCHAR2,
"
"                                   p_vou_type    VARCHAR2,
"
"                                   p_appl        VARCHAR2
"
"                                   )
"
"    IS
"
"    BEGIN
"
"
"
"        DELETE
"
"          FROM appl_journals
"
"         WHERE aj_bu                = p_bu
"
"           AND aj_plnt                 = p_plnt
"
"           AND aj_vou_no            = p_trans_no
"
"           AND aj_vou_type              = p_vou_type
"
"           AND aj_appl                = p_appl;
"
"
"
"    END proc_delete_journals;
"
"
"
"    PROCEDURE proc_ins_repair_jrnls(p_bu            VARCHAR2,
"
"                    p_plnt            VARCHAR2,
"
"                    p_trans_no        VARCHAR2,
"
"                    p_trans_date    DATE,
"
"                    p_prod_ord_no    VARCHAR2,
"
"                    p_prod_id        VARCHAR2,
"
"                    p_prod_rev        NUMBER,
"
"                    p_comp_qty        NUMBER,
"
"                    p_lang            NUMBER,
"
"                    p_user            VARCHAR2
"
"                    )
"
"    IS
"
"    CURSOR c_rwk_comp
"
"    IS
"
"    SELECT rwocd_rwk_comp_qty rwochd_comp_qty,
"
"           rwocd_rwk_repair_qty ,
"
"       rwochd_plnt_loc_id ,
"
"       rwochd_ord_type,
"
"       rwocd_rwk_rej_qty rwochd_rej_qty ,
"
"       rwocd_sou_sf_code rwochd_sf_code,
"
"       rwocd_tar_store rwochd_target_store,
"
"       rwochd_sou_store ,
"
"       rwocd_seq_no,
"
"       rwocd_sou_sys_ls_no rwochd_sys_ls_no,
"
"       rwocd_prod_ord_no rwochd_prod_ord_no,
"
"       rwochd_comp_pfx
"
"      FROM rework_order_comp_hd,
"
"           rework_order_comp_dtl
"
"     WHERE rwocd_bu     = rwochd_bu
"
"       AND rwocd_plnt     = rwochd_plnt
"
"       AND rwocd_doc_no  = rwochd_doc_no
"
"       AND rwochd_bu      = p_bu
"
"       AND rwochd_plnt      = p_plnt
"
"       AND rwochd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_ser_sys
"
"    IS
"
"    SELECT rocsd_sys_ls_no
"
"      FROM rework_order_comp_ser_dtls
"
"     WHERE rocsd_bu = p_bu
"
"       AND rocsd_plnt = p_plnt
"
"       AND rocsd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_mach
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
"       AND roru_doc_no = p_trans_no
"
"       AND roru_hrly_rate > 0
"
"       AND roru_units > 0;
"
"
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"      IS
"
"    SELECT mfgr_acct       ,
"
"           mfgr_acct_plnt  ,
"
"           mfgr_prj_lvl    ,
"
"           mfgr_lvl1       ,
"
"           mfgr_lvl2       ,
"
"           mfgr_lvl3       ,
"
"           mfgr_lvl4
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"       IS
"
"    SELECT mfgrg_ac_lvl1,
"
"           mfgrg_ac_lvl2,
"
"           mfgrg_ac_lvl3,
"
"           mfgrg_ac_lvl4,
"
"           mfgrg_current_acct ,
"
"           mfgrg_ac_lvl_prj,
"
"           mfgrg_acct_plnt
"
"      FROM mfg_res_groups,
"
"           mfg_resources
"
"     WHERE mfgrg_bu = mfgr_bu
"
"       AND mfgrg_plnt = mfgr_plnt
"
"       AND mfgrg_grp_id = mfgr_group_id
"
"       AND mfgrg_bu = p_bu
"
"       AND mfgrg_plnt = p_plnt
"
"       AND mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_mat_req
"
"    IS
"
"    SELECT rocmrd_seq_no,
"
"           rocmrd_prod_id,
"
"           rocmrd_prod_rev,
"
"           rocmrd_cons_store,
"
"           store_gl_acct,
"
"           (rocmrd_cons_qty * rocmrd_unit_cost) ext_cost
"
"      FROM rework_ord_comp_mat_req_dtls,
"
"           stores
"
"     WHERE rocmrd_bu = store_bu
"
"       AND rocmrd_plnt = store_plnt
"
"       AND rocmrd_cons_store = store_id
"
"       AND ROUND((rocmrd_cons_qty * rocmrd_unit_cost),2) > 0
"
"       AND rocmrd_bu   = p_bu
"
"       AND rocmrd_plnt  = p_plnt
"
"       AND rocmrd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_rpr
"
"    IS
"
"    SELECT SUM (mat_cost) mat_cost
"
"        FROM ((SELECT NVL (SUM (rscd_cons_qty * rscd_unit_cost), 0) mat_cost
"
"                 FROM rework_scrap_cons_detail
"
"                WHERE rscd_bu = p_bu
"
"                  AND rscd_plnt = p_plnt
"
"                  AND rscd_doc_no = p_trans_no
"
"                  AND ROUND((rscd_cons_qty * rscd_unit_cost),2) > 0
"
"                  AND rscd_cons_type = 'N')
"
"              UNION ALL
"
"                  (SELECT NVL (SUM (
"
"                                DECODE(rwochd_sf_code,NULL, (CASE WHEN func_find_prod_cost_method(rwochd_bu,rwochd_prod_id,rwochd_prod_rev) IN ('MAC') THEN
"
"                                func_find_unitcost(rwochd_bu,rwochd_prod_id,rwochd_prod_rev,rwochd_sou_store) ELSE 0 END),
"
"                                    CASE WHEN rocsd_sys_ls_no IS NOT NULL THEN func_find_sfg_unitcost(p_bu,rwochd_prod_id,rwochd_prod_rev,rwochd_sou_store,rwochd_prod_ord_no,rwochd_sf_code,rocsd_sys_ls_no) ELSE func_find_sfg_unitcost(p_bu,rwochd_prod_id,rwochd_prod_rev,rwochd_sou_store,rwochd_prod_ord_no,rwochd_sf_code,rwochd_sys_ls_no)END))
"
"                                    , 0) mat_cost
"
"                           FROM rework_order_comp_hd,
"
"                                rework_order_comp_ser_dtls
"
"                          WHERE rocsd_bu = rwochd_bu
"
"                            AND rocsd_plnt  = rwochd_plnt
"
"                            AND rocsd_doc_no  = p_trans_no
"
"                            AND rwochd_bu = p_bu
"
"                            AND rwochd_plnt = p_plnt
"
"                            AND rwochd_ord_type NOT IN ('SC','PR')
"
"                            AND rwochd_doc_no = p_trans_no)
"
"                      UNION ALL
"
"                        (SELECT NVL (SUM (rwochd_trans_qty *
"
"                                DECODE(rwochd_sf_code,NULL, (CASE WHEN func_find_prod_cost_method(rwochd_bu,rwochd_prod_id,rwochd_prod_rev) IN ('MAC') THEN
"
"                                func_find_unitcost(rwochd_bu,rwochd_prod_id,rwochd_prod_rev,rwochd_sou_store) ELSE 0 END),
"
"                                     func_find_sfg_unitcost(p_bu,rwochd_prod_id,rwochd_prod_rev,rwochd_sou_store,rwochd_prod_ord_no,rwochd_sf_code,rwochd_sys_ls_no) ))
"
"                                    , 0) mat_cost
"
"                           FROM rework_order_comp_hd
"
"                          WHERE  rwochd_bu = p_bu
"
"                            AND rwochd_plnt = p_plnt
"
"                            AND rwochd_ord_type NOT IN ('SC','PR')
"
"                            AND rwochd_doc_no = p_trans_no
"
"                            AND NOT EXISTS(SELECT 1
"
"                                                          FROM rework_order_comp_ser_dtls
"
"                                                         WHERE rocsd_bu = rwochd_bu
"
"                                                             AND rocsd_plnt  = rwochd_plnt
"
"                                                              AND rocsd_doc_no  = rwochd_doc_no))
"
"                        UNION ALL
"
"                        (    SELECT NVL(SUM(rwocbd_batch_qty * rwocbd_batch_cost),0)  batch_mat_cost
"
"                FROM rework_comp_batch_dtls
"
"               WHERE rwocbd_bu = p_bu
"
"                 AND rwocbd_plnt = p_plnt
"
"       AND rwocbd_doc_no = p_trans_no)
"
"              UNION ALL
"
"              (SELECT NVL (SUM (rwochd_trans_qty * DECODE(rwochd_ord_type, 'SC',porl_scon_mat_unit_cost, 'PR',  (porl_sc_unit_cost * porh_exchange_rate) + NVL(porl_bc_land_cost,0) + NVL(porl_sc_chrg_amt,0))),0) mat_cost
"
"                 FROM rework_order_comp_hd,
"
"                      pur_ord_receipt_ln,
"
"                      pur_ord_receipt_hd
"
"                WHERE rwochd_bu = porl_bu
"
"                  AND rwochd_plnt = porl_plnt
"
"                --  AND rwochd_source_pfx = porl_receipt_pfx
"
"                  AND rwochd_source_no = porl_receipt_no
"
"                  AND rwochd_source_line = porl_seq_no
"
"                  AND rwochd_prod_id = porl_prod_id
"
"                  AND rwochd_prod_rev = porl_prod_rev
"
"                  AND porh_bu = porl_bu
"
"                  AND porh_plnt = porl_plnt
"
"                  AND porh_receipt_no = porl_receipt_no
"
"                  --AND porh_receipt_pfx = porl_receipt_pfx
"
"                  AND rwochd_bu = p_bu
"
"                  AND rwochd_plnt = p_plnt
"
"                  AND rwochd_ord_type IN ('SC','PR')
"
"                  AND func_find_prod_cost_method(rwochd_bu,rwochd_prod_id,rwochd_prod_rev)  IN ('MAC')
"
"                  AND rwochd_doc_no = p_trans_no)
"
"             UNION ALL --HANDLED FOR HISTORY
"
"             (SELECT NVL (SUM (rwochd_trans_qty * DECODE(rwochd_ord_type, 'SC',porlh_scon_mat_unit_cost, 'PR',  (porlh_sc_unit_cost * porhh_exchange_rate) + NVL(porlh_bc_land_cost,0) + NVL(porlh_sc_chrg_amt,0))),0) mat_cost
"
"                          FROM rework_order_comp_hd,
"
"                               pur_ord_receipt_ln_hist,
"
"                               pur_ord_receipt_hd_hist
"
"                         WHERE rwochd_bu = porlh_bu
"
"                           AND rwochd_plnt = porlh_plnt
"
"                        --   AND rwochd_source_pfx = porlh_receipt_pfx
"
"                           AND rwochd_source_no = porlh_receipt_no
"
"                           AND rwochd_source_line = porlh_seq_no
"
"                           AND rwochd_prod_id = porlh_prod_id
"
"                           AND rwochd_prod_rev = porlh_prod_rev
"
"                           AND porhh_bu = porlh_bu
"
"                           AND porhh_plnt = porlh_plnt
"
"                           AND porhh_receipt_no = porlh_receipt_no
"
"                           --AND porhh_receipt_pfx = porlh_receipt_pfx
"
"                           AND rwochd_bu = p_bu
"
"                           AND rwochd_plnt = p_plnt
"
"                           AND rwochd_ord_type IN ('SC','PR')
"
"                           AND func_find_prod_cost_method(rwochd_bu,rwochd_prod_id,rwochd_prod_rev)  IN ('MAC')
"
"                  AND rwochd_doc_no = p_trans_no));
"
"
"
"
"
"    r_store_acct            c_store_acct%ROWTYPE;
"
"    r_rwk_comp                c_rwk_comp%ROWTYPE;
"
"    r_res_acct                c_res_acct%ROWTYPE;
"
"    r_resgrp_acct            c_resgrp_acct%ROWTYPE;
"
"    r_mach_cost                c_mach%ROWTYPE;
"
"    r_rpr                    c_rpr%ROWTYPE;
"
"    r_ser_sys                 c_ser_sys%ROWTYPE;
"
"    v_dbt_store_id            VARCHAR2(10);
"
"    v_crd_store_id            VARCHAR2(10);
"
"    v_dbt_acct                stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl            VARCHAR2(10);
"
"    v_dbt_lvl1                VARCHAR2(4);
"
"    v_dbt_lvl2                VARCHAR2(4);
"
"    v_dbt_lvl3                VARCHAR2(4);
"
"    v_dbt_lvl4                VARCHAR2(4);
"
"    v_dbt_lvl5                VARCHAR2(4);
"
"    v_dbt_lvl6                VARCHAR2(4);
"
"    v_dbt_acct_plnt            VARCHAR2(10);
"
"    v_crd_lvl1                VARCHAR2(4);
"
"    v_crd_lvl2                VARCHAR2(4);
"
"    v_crd_lvl3                VARCHAR2(4);
"
"    v_crd_lvl4                VARCHAR2(4);
"
"    v_crd_lvl5                VARCHAR2(4);
"
"    v_crd_lvl6                VARCHAR2(4);
"
"    v_crd_acct_plnt            VARCHAR2(10);
"
"    v_crd_acct                stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl            VARCHAR2(10);
"
"    v_sf_cost                NUMBER(17,5):=0;
"
"    v_mach_cost                NUMBER(17,5):=0;
"
"    v_oh_cost                NUMBER(17,5):=0;
"
"    v_unit_cost                NUMBER(17,5):=0;
"
"    v_jrnl_trans_no            VARCHAR2(15);
"
"    v_jrnl_trans_seq_no        NUMBER;
"
"    v_mat_dbt_cc_code        VARCHAR2(20);
"
"    v_mat_crd_cc_code        VARCHAR2(20);
"
"
"
"
"
"        v_dbt_amt            NUMBER(17,5);
"
"        v_crd_amt            NUMBER(17,5);
"
"        v_diff_amt            NUMBER(17,5);
"
"        v_scrap_cost        NUMBER(17,5);
"
"    v_trans_seq_no        NUMBER;
"
"    BEGIN
"
"
"
"
"
"                        /*Debit Section*/
"
"
"
"       -- OPEN c_rwk_comp;
"
"      --  FETCH c_rwk_comp INTO r_rwk_comp;
"
"       -- CLOSE c_rwk_comp;
"
"
"
"    FOR r_rwk_comp IN c_rwk_comp
"
"      LOOP
"
"
"
"        OPEN c_ser_sys;
"
"        FETCH c_ser_sys INTO r_ser_sys;
"
"        CLOSE c_ser_sys;
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"         IF r_rwk_comp.rwochd_comp_qty > 0 THEN
"
"
"
"     proc_rw_cal_cost_ln (p_bu ,
"
"                  p_plnt              ,
"
"                  p_trans_no            ,
"
"                  r_rwk_comp.rwocd_seq_no            ,
"
"                  p_prod_id           ,
"
"                  p_prod_rev          ,
"
"                  r_rwk_comp.rwochd_comp_qty          ,
"
"                  v_sf_cost ,
"
"                  v_mach_cost ,
"
"                  v_oh_cost ,
"
"                  v_unit_cost
"
"                ) ;
"
"
"
"         /*   proc_rw_cal_cost(p_bu,
"
"                             p_plnt,
"
"                             p_trans_no,
"
"                             p_prod_id,
"
"                             p_prod_rev,
"
"                             r_rwk_comp.rwocd_seq_no,
"
"                             v_sf_cost,
"
"                             v_mach_cost,
"
"                             v_oh_cost,
"
"                             v_unit_cost
"
"                             );  */
"
"
"
"
"
"           v_dbt_store_id := r_rwk_comp.rwochd_target_store;
"
"
"
"--         Raise_Application_Error(-20999,v_dbt_store_id);
"
"            OPEN c_store_acct(v_dbt_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_dbt_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_dbt_lvl1,
"
"                                  v_dbt_lvl2,
"
"                                  v_dbt_lvl3,
"
"                                  v_dbt_lvl4,
"
"                                  v_dbt_lvl5,
"
"                                  v_dbt_lvl6,
"
"                                  v_dbt_prj_lvl,
"
"                                  v_dbt_acct_plnt ,
"
"                  v_mat_dbt_cc_code,
"
"                  r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
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
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"-- RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||v_dbt_store_id||'/'||p_lang||'/'||p_bu||'-'||v_dbt_acct);
"
"
"
"               INSERT INTO appl_journals(
"
"                                        aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                                        aj_gl_lvl5  ,
"
"                                        aj_gl_lvl6  ,
"
"                                        aj_cc_code,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj  ,
"
"                                        aj_gl_plnt_loc_id   ,
"
"                                        aj_sub_vou_type
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_dbt_acct_plnt             ,
"
"                                        v_dbt_lvl1                ,
"
"                                        v_dbt_lvl2                ,
"
"                                        v_dbt_lvl3                ,
"
"                                        v_dbt_lvl4                ,
"
"                        v_dbt_lvl5,
"
"                        v_dbt_lvl6,
"
"                        v_mat_dbt_cc_code,
"
"                                        v_dbt_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        ROUND((v_unit_cost * r_rwk_comp.rwochd_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                        0              ,
"
"                                        ROUND((v_unit_cost * r_rwk_comp.rwochd_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                        0              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_dbt_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                        p_prod_id               ,
"
"                                        p_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        r_rwk_comp.rwochd_comp_qty              ,
"
"                                        v_unit_cost,
"
"                                        v_unit_cost,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RWC'            ,
"
"                                        r_rwk_comp.rwochd_comp_pfx                ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_dbt_prj_lvl ,
"
"                                        r_rwk_comp.rwochd_plnt_loc_id,
"
"                                        r_rwk_comp.rwochd_ord_type
"
"                                        );
"
"
"
"
"
"         -- raise_application_error(-20999,'HRM'||'/'||r_rwk_comp.rwochd_ord_type);
"
"
"
"               END IF;
"
"
"
"
"
"  IF r_rwk_comp.rwochd_rej_qty > 0 THEN
"
"
"
"
"
"     proc_rw_cal_cost_ln (p_bu ,
"
"                  p_plnt              ,
"
"                  p_trans_no            ,
"
"                  r_rwk_comp.rwocd_seq_no            ,
"
"                  p_prod_id           ,
"
"                  p_prod_rev          ,
"
"                  r_rwk_comp.rwochd_comp_qty          ,
"
"                  v_sf_cost ,
"
"                  v_mach_cost ,
"
"                  v_oh_cost ,
"
"                  v_unit_cost
"
"                ) ;
"
"
"
"           v_dbt_store_id := func_find_store_fr_type(p_bu,p_plnt,r_rwk_comp.rwochd_plnt_loc_id,'J');
"
"
"
"            OPEN c_store_acct(v_dbt_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_dbt_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_dbt_lvl1,
"
"                                  v_dbt_lvl2,
"
"                                  v_dbt_lvl3,
"
"                                  v_dbt_lvl4,
"
"                  v_dbt_lvl5,
"
"                                  v_dbt_lvl6,
"
"                                  v_dbt_prj_lvl,
"
"                                  v_dbt_acct_plnt ,
"
"                  v_mat_dbt_cc_code,
"
"                      r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
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
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"               INSERT INTO appl_journals(
"
"                                        aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                    aj_gl_lvl5  ,
"
"                    aj_gl_lvl6  ,
"
"                    aj_cc_code,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj,
"
"                    aj_gl_plnt_loc_id   ,
"
"                                        aj_sub_vou_type
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_dbt_acct_plnt             ,
"
"                                        v_dbt_lvl1                ,
"
"                                        v_dbt_lvl2                ,
"
"                                        v_dbt_lvl3                ,
"
"                                        v_dbt_lvl4                ,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                    v_mat_dbt_cc_code,
"
"                                        v_dbt_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        ROUND((v_unit_cost * r_rwk_comp.rwochd_rej_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                        0              ,
"
"                                        ROUND((v_unit_cost * r_rwk_comp.rwochd_rej_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                        0              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_dbt_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                        p_prod_id               ,
"
"                                        p_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        r_rwk_comp.rwochd_rej_qty              ,
"
"                                        v_unit_cost,--/p_comp_qty              ,
"
"                                        v_unit_cost,--/p_comp_qty           ,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RWC'              ,
"
"                                        r_rwk_comp.rwochd_comp_pfx                 ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_dbt_prj_lvl,
"
"                    r_rwk_comp.rwochd_plnt_loc_id,
"
"                    r_rwk_comp.rwochd_ord_type
"
"                                        );
"
"
"
"               END IF;
"
"
"
"
"
"
"
"
"
"                    /*Credit Section*/
"
"
"
"            IF r_rwk_comp.rwochd_sf_code IS NOT NULL THEN
"
"
"
"                v_crd_store_id := r_rwk_comp.rwochd_sou_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                    v_crd_lvl5,
"
"                    v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt ,
"
"                    v_mat_crd_cc_code,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1                ,
"
"                                                        aj_gl_lvl2                ,
"
"                                                        aj_gl_lvl3                ,
"
"                                                        aj_gl_lvl4                ,
"
"                            aj_gl_lvl5,
"
"                            aj_gl_lvl6,
"
"                            aj_cc_code,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj ,
"
"                            aj_gl_plnt_loc_id   ,
"
"                            aj_sub_vou_type
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_crd_acct_plnt             ,
"
"                                                        v_crd_lvl1                ,
"
"                                                        v_crd_lvl2                ,
"
"                                                        v_crd_lvl3                ,
"
"                                                        v_crd_lvl4                ,
"
"                            v_crd_lvl5,
"
"                            v_crd_lvl6,
"
"                            v_mat_crd_cc_code ,
"
"                                                        v_crd_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        0              ,
"
"                                                        ROUND(func_find_sfg_unitcost(p_bu,p_prod_id,p_prod_rev,v_crd_store_id,r_rwk_comp.rwochd_prod_ord_no,r_rwk_comp.rwochd_sf_code,NVL(r_ser_sys.rocsd_sys_ls_no,r_rwk_comp.rwochd_sys_ls_no))*p_comp_qty,func_find_appl_rnddigit(p_bu))             ,
"
"                                                        0 ,
"
"                                                        ROUND(func_find_sfg_unitcost(p_bu,p_prod_id,p_prod_rev,v_crd_store_id,r_rwk_comp.rwochd_prod_ord_no,r_rwk_comp.rwochd_sf_code,NVL(r_ser_sys.rocsd_sys_ls_no,r_rwk_comp.rwochd_sys_ls_no))*p_comp_qty,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_crd_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                                        p_prod_id              ,
"
"                                                        p_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        p_comp_qty             ,
"
"                                                        v_sf_cost/p_comp_qty              ,
"
"                                                        v_sf_cost/p_comp_qty          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RWC'             ,
"
"                                                        r_rwk_comp.rwochd_comp_pfx                 ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_crd_prj_lvl,
"
"                            r_rwk_comp.rwochd_plnt_loc_id,
"
"                            r_rwk_comp.rwochd_ord_type
"
"                                                         );
"
"                END IF;
"
"
"
"            IF r_rwk_comp.rwochd_sf_code IS NULL THEN
"
"
"
"                v_crd_store_id := r_rwk_comp.rwochd_sou_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"                OPEN c_rpr;
"
"                FETCH c_rpr INTO r_rpr;
"
"                    IF c_rpr%NOTFOUND OR r_rpr.mat_cost IS NULL OR r_rpr.mat_cost = 0 THEN
"
"                        raise_application_error(-20005,'ICM');
"
"                    ELSE
"
"                        v_sf_cost := r_rpr.mat_cost;
"
"                    END IF;
"
"                CLOSE c_rpr;
"
"                   --  raise_application_error(-20005,'ICM'||' ' ||v_sf_cost);
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                    v_crd_lvl5,
"
"                                        v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt  ,
"
"                    v_mat_crd_cc_code,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1                ,
"
"                                                        aj_gl_lvl2                ,
"
"                                                        aj_gl_lvl3                ,
"
"                                                        aj_gl_lvl4                ,
"
"                            aj_gl_lvl5  ,
"
"                            aj_gl_lvl6  ,
"
"                            aj_cc_code,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj ,
"
"                            aj_gl_plnt_loc_id   ,
"
"                            aj_sub_vou_type
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_crd_acct_plnt             ,
"
"                                                        v_crd_lvl1                ,
"
"                                                        v_crd_lvl2                ,
"
"                                                        v_crd_lvl3                ,
"
"                                                        v_crd_lvl4                ,
"
"                            v_crd_lvl5 ,
"
"                            v_crd_lvl6 ,
"
"                            v_mat_crd_cc_code,
"
"                                                        v_crd_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        0              ,
"
"                                                        ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                        0 ,
"
"                                                        ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_crd_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                                        p_prod_id              ,
"
"                                                        p_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        p_comp_qty             ,
"
"                                                        v_sf_cost/p_comp_qty              ,
"
"                                                        v_sf_cost/p_comp_qty          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RWC'               ,
"
"                                                        r_rwk_comp.rwochd_comp_pfx                 ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_crd_prj_lvl,
"
"                            r_rwk_comp.rwochd_plnt_loc_id,
"
"                            r_rwk_comp.rwochd_ord_type
"
"                                                         );
"
"                END IF;     --Std. Item
"
"
"
"            FOR r_mach_cost IN c_mach
"
"            LOOP
"
"
"
"
"
"
"
"                OPEN c_res_acct(r_mach_cost.roru_res_id);
"
"                FETCH c_res_acct INTO r_res_acct;
"
"
"
"                    IF c_res_acct%NOTFOUND OR
"
"                        r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"                        r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"                        OPEN c_resgrp_acct(r_mach_cost.roru_res_id);
"
"                        FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"                            IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"                                raise_application_error(-20002,'APM');
"
"                            ELSE
"
"
"
"                                v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"                                v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"                                v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"                                v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"                                v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"                                v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"                                v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"                            END IF;
"
"                        CLOSE c_resgrp_acct;
"
"                    ELSE
"
"
"
"                                v_crd_acct := r_res_acct.mfgr_acct;
"
"                                v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"                                v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"                                v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"                                v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"                                v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"                                v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"                    END IF;
"
"
"
"                CLOSE c_res_acct;
"
"
"
"
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                        aj_gl_lvl5  ,
"
"                        aj_gl_lvl6  ,
"
"                        aj_cc_code,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj,
"
"                        aj_gl_plnt_loc_id   ,
"
"                                            aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                        v_crd_lvl5,
"
"                        v_crd_lvl6,
"
"                        v_mat_crd_cc_code,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty          ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'              ,
"
"                                            r_rwk_comp.rwochd_comp_pfx                 ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl,
"
"                        r_rwk_comp.rwochd_plnt_loc_id ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
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
"            END LOOP c_mach;
"
"
"
"            FOR r_mat_req IN c_mat_req
"
"            LOOP
"
"
"
"                    v_crd_store_id := r_mat_req.rocmrd_cons_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                        v_crd_lvl5,
"
"                    v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt,
"
"                    v_mat_crd_cc_code,
"
"                        r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1                ,
"
"                                                        aj_gl_lvl2                ,
"
"                                                        aj_gl_lvl3                ,
"
"                                                        aj_gl_lvl4                ,
"
"aj_gl_lvl5  ,
"
"                    aj_gl_lvl6  ,
"
"                    aj_cc_code,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj,
"
"                            aj_gl_plnt_loc_id   ,
"
"                                        aj_sub_vou_type
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_crd_acct_plnt             ,
"
"                                                        v_crd_lvl1                ,
"
"                                                        v_crd_lvl2                ,
"
"                                                        v_crd_lvl3                ,
"
"                                                        v_crd_lvl4                ,
"
"                            v_crd_lvl5,
"
"                            v_crd_lvl6,
"
"                            v_mat_crd_cc_code,
"
"                                                        v_crd_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        0              ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                        0 ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_crd_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)           ,
"
"                                                        r_mat_req.rocmrd_prod_id              ,
"
"                                                        r_mat_req.rocmrd_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        p_comp_qty             ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty              ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RWC'               ,
"
"                                                        r_rwk_comp.rwochd_comp_pfx                 ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_crd_prj_lvl,
"
"                            r_rwk_comp.rwochd_plnt_loc_id,
"
"                            r_rwk_comp.rwochd_ord_type
"
"                                                         );
"
"
"
"            END LOOP;
"
"
"
"              /* diff update */
"
"
"
"
"
"                                                 SELECT NVL(SUM(aj_bc_db_amt),0) db_amt,NVL(SUM(aj_bc_cr_amt),0) cr_amt
"
"                                                  INTO v_dbt_amt,v_crd_amt
"
"                                                  FROM appl_journals
"
"                                                 WHERE aj_bu = p_bu
"
"                                                  AND  aj_plnt = p_plnt
"
"                                                  AND aj_vou_no = p_trans_no
"
"                                                  AND aj_appl = 'RR'
"
"                                                  AND aj_vou_type = 'RWC';
"
"
"
"
"
"
"
"                                                  IF v_dbt_amt > v_crd_amt THEN
"
"                                                v_diff_amt := v_dbt_amt - v_crd_amt;
"
"                                                  IF v_diff_amt < 1 THEN
"
"
"
"                                                SELECT MIN(aj_jrnl_trns_seq_no)
"
"                                                  INTO v_trans_seq_no
"
"                                                  FROM appl_journals
"
"                                                 WHERE aj_bu = p_bu
"
"                                                   AND aj_plnt = p_plnt
"
"                                                   AND aj_vou_no = p_trans_no
"
"                                                   AND aj_appl = 'RR'
"
"                                                   AND aj_vou_type = 'RWC'
"
"                                                   AND aj_bc_db_amt > 0;
"
"
"
"
"
"
"
"                                                   UPDATE appl_journals
"
"                                                    SET aj_bc_db_amt = aj_bc_db_amt - v_diff_amt,
"
"                                                    aj_fc_db_amt = aj_fc_db_amt - v_diff_amt,
"
"                                                    aj_upd_by = p_user,
"
"                                                    aj_upd_date = SYSDATE
"
"                                                   WHERE aj_bu = p_bu
"
"                                                     AND aj_plnt = p_plnt
"
"                                                     AND aj_vou_no = p_trans_no
"
"                                                     AND aj_appl = 'RR'
"
"                                                     AND aj_vou_type = 'RWC'
"
"                                                     AND aj_bc_db_amt > 0
"
"                                                     AND aj_jrnl_trns_seq_no = v_trans_seq_no;
"
"                                                END IF;
"
"
"
"                                       ELSIF v_dbt_amt < v_crd_amt THEN
"
"
"
"                                           v_diff_amt := v_crd_amt - v_dbt_amt;
"
"
"
"                                        IF v_diff_amt < 1 THEN
"
"
"
"                                        SELECT MIN(aj_jrnl_trns_seq_no)
"
"                                          INTO v_trans_seq_no
"
"                                          FROM appl_journals
"
"                                         WHERE aj_bu = p_bu
"
"                                           AND aj_plnt = p_plnt
"
"                                           AND aj_vou_no = p_trans_no
"
"                                           AND aj_appl = 'RR'
"
"                                           AND aj_vou_type = 'RWC'
"
"                                           AND aj_bc_db_amt > 0;
"
"
"
"                                             UPDATE appl_journals
"
"                                                SET aj_bc_db_amt = aj_bc_db_amt + v_diff_amt,
"
"                                                aj_fc_db_amt = aj_fc_db_amt + v_diff_amt,
"
"                                                aj_upd_by = p_user,
"
"                                                aj_upd_date = SYSDATE
"
"                                               WHERE aj_bu = p_bu
"
"                                                 AND aj_plnt = p_plnt
"
"                                                 AND aj_vou_no = p_trans_no
"
"                                                 AND aj_appl = 'RR'
"
"                                                 AND aj_vou_type = 'RWC'
"
"                                                 AND aj_bc_db_amt > 0
"
"                                                 AND aj_jrnl_trns_seq_no = v_trans_seq_no;
"
"                                        END IF;
"
"             END IF;
"
"
"
"
"
"
"
"       END LOOP c_rwk_comp;
"
"
"
"
"
"
"
"    END proc_ins_repair_jrnls;
"
"
"
"    PROCEDURE proc_calc_cost (
"
"                               p_bu                VARCHAR2,
"
"                               p_plnt              VARCHAR2,
"
"                               p_doc_no            VARCHAR2,
"
"                               p_prod_id           VARCHAR2,
"
"                               p_prod_rev          NUMBER,
"
"                               p_comp_qty          NUMBER,
"
"                               p_dm_cost     OUT   NUMBER,
"
"                               p_dl_cost     OUT   NUMBER,
"
"                               p_oh_cost     OUT   NUMBER,
"
"                               p_unit_cost   OUT   NUMBER
"
"                             )
"
"    IS
"
"   CURSOR c1
"
"   IS
"
"      SELECT NVL (SUM (item_cost), 0) oh_cost
"
"        FROM ((SELECT NVL ((p_comp_qty * SUM (ohbs_rate)), 0) item_cost
"
"                 FROM rework_ord_res_usage, oh_basis_subelement
"
"                WHERE roru_bu = ohbs_bu
"
"                  AND roru_plnt = ohbs_plnt
"
"                  AND roru_oprn_id = ohbs_oprn_id
"
"                  AND roru_bu = p_bu
"
"                  AND roru_plnt = p_plnt
"
"                  AND roru_doc_no = p_doc_no
"
"                  AND ohbs_prod_id = p_prod_id
"
"                  AND ohbs_prod_rev = p_prod_rev
"
"                  AND ohbs_status = 'A'
"
"                  AND ohbs_basis = 'I')
"
"              UNION ALL
"
"              (SELECT   NVL (
"
"                           (p_comp_qty * (SUM (ohbs_rate) / prod_lot_size)),
"
"                           0
"
"                        ) lot_cost
"
"                   FROM rework_ord_res_usage, oh_basis_subelement, products
"
"                  WHERE roru_bu = ohbs_bu
"
"                    AND roru_plnt = ohbs_plnt
"
"                    AND roru_oprn_id = ohbs_oprn_id
"
"                    AND ohbs_bu = prod_bu
"
"                    AND ohbs_prod_id = prod_id
"
"                    AND ohbs_prod_rev = prod_rev
"
"                    AND roru_bu = p_bu
"
"                    AND roru_plnt = p_plnt
"
"                    AND roru_doc_no = p_doc_no
"
"                    AND ohbs_prod_id = p_prod_id
"
"                    AND ohbs_prod_rev = p_prod_rev
"
"                    AND ohbs_status = 'A'
"
"                    AND ohbs_basis = 'L'
"
"               GROUP BY prod_lot_size)
"
"              UNION ALL
"
"              (SELECT NVL (SUM (ohbs_rate), 0) act_cost
"
"                 FROM rework_ord_res_usage, oh_basis_subelement
"
"                WHERE roru_bu = ohbs_bu
"
"                  AND roru_plnt = ohbs_plnt
"
"                  AND roru_oprn_id = ohbs_oprn_id
"
"                  AND roru_bu = p_bu
"
"                  AND roru_plnt = p_plnt
"
"                  AND roru_doc_no = p_doc_no
"
"                  AND ohbs_prod_id = p_prod_id
"
"                  AND ohbs_prod_rev = p_prod_rev
"
"                  AND ohbs_status = 'A'
"
"                  AND ohbs_basis = 'A'
"
"                  AND ohbs_activity IS NOT NULL)
"
"              UNION ALL
"
"              (SELECT NVL (SUM (roru_units * ohbs_rate), 0) ru_cost
"
"                 FROM rework_ord_res_usage,
"
"                      oh_basis_subelement,
"
"                      oh_resource_asso
"
"                WHERE roru_bu = ohbs_bu
"
"                  AND roru_plnt = ohbs_plnt
"
"                  AND roru_oprn_id = ohbs_oprn_id
"
"                  AND ohbs_bu = ohra_bu
"
"                  AND ohbs_plnt = ohra_plnt
"
"                  AND ohbs_trans_no = ohra_trans_no
"
"                  AND ohra_res_grp = func_find_res_group (
"
"                                        p_bu,
"
"                                        p_plnt,
"
"                                        roru_res_id
"
"                                     )
"
"                  AND roru_bu = p_bu
"
"                  AND roru_plnt = p_plnt
"
"                  AND roru_doc_no = p_doc_no
"
"                  AND ohbs_prod_id = p_prod_id
"
"                  AND ohbs_prod_rev = p_prod_rev
"
"                  AND ohbs_status = 'A'
"
"                  AND ohbs_basis = 'RU'
"
"                  AND roru_res_id IS NOT NULL)
"
"              UNION ALL
"
"              (SELECT   NVL (
"
"                           (  SUM (roru_units * roru_hrly_rate)
"
"                            * (ohbs_rate / 100)
"
"                           ),
"
"                           0
"
"                        ) rv_cost
"
"                   FROM rework_ord_res_usage,
"
"                        oh_basis_subelement,
"
"                        oh_resource_asso
"
"                  WHERE roru_bu = ohbs_bu
"
"                    AND roru_plnt = ohbs_plnt
"
"                    AND roru_oprn_id = ohbs_oprn_id
"
"                    AND ohbs_bu = ohra_bu
"
"                    AND ohbs_plnt = ohra_plnt
"
"                    AND ohbs_trans_no = ohra_trans_no
"
"                    AND ohra_res_grp =
"
"                              func_find_res_group (p_bu, p_plnt, roru_res_id)
"
"                    AND roru_bu = p_bu
"
"                    AND roru_plnt = p_plnt
"
"                    AND roru_doc_no = p_doc_no
"
"                    AND ohbs_prod_id = p_prod_id
"
"                    AND ohbs_prod_rev = p_prod_rev
"
"                    AND ohbs_status = 'A'
"
"                    AND ohbs_basis = 'RV'
"
"                    AND roru_res_id IS NOT NULL
"
"               GROUP BY ohbs_rate));
"
"
"
"   CURSOR c2
"
"   IS
"
"      SELECT SUM (mat_cost) mat_cost
"
"        FROM ((SELECT NVL (SUM (rscd_cons_qty * rscd_unit_cost), 0) mat_cost
"
"                 FROM rework_scrap_cons_detail
"
"                WHERE rscd_bu = p_bu
"
"                  AND rscd_plnt = p_plnt
"
"                  AND rscd_doc_no = p_doc_no
"
"                  AND ROUND((rscd_cons_qty * rscd_unit_cost),2) > 0
"
"                  AND rscd_cons_type = 'N')
"
"                UNION ALL  --Handled for Mat. req.
"
"               (SELECT NVL (SUM (rocmrd_cons_qty * rocmrd_unit_cost), 0) mat_cost
"
"                 FROM rework_ord_comp_mat_req_dtls
"
"                WHERE rocmrd_bu = p_bu
"
"                  AND rocmrd_plnt = p_plnt
"
"                  AND ROUND((rocmrd_cons_qty  * rocmrd_unit_cost),2) > 0
"
"                  AND rocmrd_doc_no = p_doc_no)
"
"              UNION ALL
"
"              (SELECT NVL (SUM (rwochd_trans_qty * DECODE(rwochd_ord_type, 'SC',porl_scon_mat_unit_cost, 'PR', (porl_sc_unit_cost * porh_exchange_rate) + NVL(porl_bc_land_cost,0) + NVL(porl_sc_chrg_amt,0))),0) mat_cost
"
"                 FROM rework_order_comp_hd,
"
"                      pur_ord_receipt_ln,
"
"                      pur_ord_receipt_hd
"
"                WHERE rwochd_bu = porl_bu
"
"                  AND rwochd_plnt = porl_plnt
"
"                  --AND rwochd_source_pfx = porl_receipt_pfx
"
"                  AND rwochd_source_no = porl_receipt_no
"
"                  AND rwochd_source_line = porl_seq_no
"
"                  AND rwochd_prod_id = porl_prod_id
"
"                  AND rwochd_prod_rev = porl_prod_rev
"
"                  AND porh_bu = porl_bu
"
"                  AND porh_plnt = porl_plnt
"
"                 -- AND porh_receipt_pfx = porl_receipt_pfx
"
"                  AND porh_receipt_no = porl_receipt_no
"
"                  AND rwochd_bu = p_bu
"
"                  AND rwochd_plnt = p_plnt
"
"                  AND rwochd_ord_type IN ('SC','PR')
"
"                  AND rwochd_doc_no = p_doc_no)
"
"             UNION ALL --HANDLED FOR HISTORY
"
"             (SELECT NVL (SUM (rwochd_trans_qty * DECODE(rwochd_ord_type, 'SC',porlh_scon_mat_unit_cost, 'PR', (porlh_sc_unit_cost * porhh_exchange_rate) + NVL(porlh_bc_land_cost,0) + NVL(porlh_sc_chrg_amt,0))),0) mat_cost
"
"                          FROM rework_order_comp_hd,
"
"                               pur_ord_receipt_ln_hist,
"
"                               pur_ord_receipt_hd_hist
"
"                         WHERE rwochd_bu = porlh_bu
"
"                           AND rwochd_plnt = porlh_plnt
"
"                         --  AND rwochd_source_pfx = porlh_receipt_pfx
"
"                           AND rwochd_source_no = porlh_receipt_no
"
"                           AND rwochd_source_line = porlh_seq_no
"
"                           AND rwochd_prod_id = porlh_prod_id
"
"                           AND rwochd_prod_rev = porlh_prod_rev
"
"                           AND porhh_bu = porlh_bu
"
"                           AND porhh_plnt = porlh_plnt
"
"                        --   AND porhh_receipt_pfx = porlh_receipt_pfx
"
"                           AND porhh_receipt_no = porlh_receipt_no
"
"                           AND rwochd_bu = p_bu
"
"                           AND rwochd_plnt = p_plnt
"
"                           AND rwochd_ord_type IN ('SC','PR')
"
"                  AND rwochd_doc_no = p_doc_no));
"
"
"
"
"
"   CURSOR c3
"
"   IS
"
"      SELECT NVL (SUM (roru_units * roru_hrly_rate), 0) res_cost
"
"        FROM rework_ord_res_usage, mfg_resources, prod_plants
"
"       WHERE mfgr_bu = roru_bu
"
"         AND mfgr_plnt = roru_plnt
"
"         AND mfgr_res_id = roru_res_id
"
"         AND roru_bu = prodplnt_bu
"
"         AND roru_plnt = prodplnt_plnt
"
"         AND prodplnt_prod_id = p_prod_id
"
"         AND prodplnt_prod_rev = p_prod_rev
"
"         AND prodplnt_source = 'R'
"
"         AND prodplnt_status = 'A'
"
"         AND roru_bu = p_bu
"
"         AND roru_plnt = p_plnt
"
"         AND roru_doc_no = p_doc_no;
"
"
"
"   cr1            c1%ROWTYPE;
"
"   cr2            c2%ROWTYPE;
"
"   cr3            c3%ROWTYPE;
"
"   v_total_cost   NUMBER (17, 5) := 0;
"
"   v_dm_cost      NUMBER (17, 5) := 0;
"
"   v_dl_cost      NUMBER (17, 5) := 0;
"
"   v_oh_cost      NUMBER (17, 5) := 0;
"
"   v_unit_cost    NUMBER (17, 5) := 0;
"
"   v_prev_cost    NUMBER (17, 5) := 0;
"
"
"
"    BEGIN
"
"
"
"       IF p_comp_qty > 0
"
"       THEN
"
"          OPEN c1;
"
"          FETCH c1 INTO cr1;
"
"          OPEN c2;
"
"          FETCH c2 INTO cr2;
"
"          OPEN c3;
"
"          FETCH c3 INTO cr3;
"
"
"
"          v_dm_cost := ROUND (cr2.mat_cost, 5);
"
"          v_dl_cost := ROUND (cr3.res_cost, 5);
"
"          v_oh_cost := ROUND (cr1.oh_cost, 5);
"
"          v_unit_cost :=   (ROUND (NVL (cr2.mat_cost, 0), 5)
"
"                            + ROUND (NVL (cr3.res_cost, 0), 5)
"
"                            + ROUND (NVL (cr1.oh_cost, 0), 5)
"
"                           )
"
"                         / p_comp_qty;
"
"
"
"          p_dm_cost := NVL (v_dm_cost, 0);
"
"          p_dl_cost := NVL (v_dl_cost, 0);
"
"          p_oh_cost := NVL (v_oh_cost, 0);
"
"          p_unit_cost := NVL (v_unit_cost, 0);
"
"
"
"          CLOSE c3;
"
"          CLOSE c2;
"
"          CLOSE c1;
"
"
"
"       ELSE
"
"          p_dm_cost := 0;
"
"          p_dl_cost := 0;
"
"          p_oh_cost := 0;
"
"          p_unit_cost := 0;
"
"       END IF;
"
"
"
"    END proc_calc_cost;
"
"
"
"    PROCEDURE proc_ins_crm_repair_jrnls(p_bu            VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_trans_no        VARCHAR2,
"
"                                        p_trans_date    DATE,
"
"                                        p_prod_ord_no    VARCHAR2,
"
"                                        p_prod_id        VARCHAR2,
"
"                                        p_prod_rev        NUMBER,
"
"                                        p_comp_qty        NUMBER,
"
"                                        p_lang            NUMBER,
"
"                                        p_user            VARCHAR2
"
"                                        )
"
"    IS
"
"    CURSOR c_rwk_comp
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
"       AND rwochd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_mach
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
"       AND roru_doc_no = p_trans_no;
"
"
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"      IS
"
"    SELECT mfgr_acct       ,
"
"           mfgr_acct_plnt  ,
"
"           mfgr_prj_lvl    ,
"
"           mfgr_lvl1       ,
"
"           mfgr_lvl2       ,
"
"           mfgr_lvl3       ,
"
"           mfgr_lvl4
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"       IS
"
"    SELECT mfgrg_ac_lvl1,
"
"           mfgrg_ac_lvl2,
"
"           mfgrg_ac_lvl3,
"
"           mfgrg_ac_lvl4,
"
"           mfgrg_current_acct ,
"
"           mfgrg_ac_lvl_prj,
"
"           mfgrg_acct_plnt
"
"      FROM mfg_res_groups,
"
"           mfg_resources
"
"     WHERE mfgrg_bu = mfgr_bu
"
"       AND mfgrg_plnt = mfgr_plnt
"
"       AND mfgrg_grp_id = mfgr_group_id
"
"       AND mfgrg_bu = p_bu
"
"       AND mfgrg_plnt = p_plnt
"
"       AND mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_mat_req
"
"    IS
"
"    SELECT rocmrd_seq_no,
"
"           rocmrd_prod_id,
"
"           rocmrd_prod_rev,
"
"           rocmrd_cons_store,
"
"           store_gl_acct,
"
"           (rocmrd_cons_qty * rocmrd_unit_cost) ext_cost
"
"      FROM rework_ord_comp_mat_req_dtls,
"
"           stores
"
"     WHERE rocmrd_bu = store_bu
"
"       AND rocmrd_plnt = store_plnt
"
"       AND rocmrd_cons_store = store_id
"
"       AND ROUND((rocmrd_cons_qty * rocmrd_unit_cost),2) > 0
"
"       AND rocmrd_bu   = p_bu
"
"       AND rocmrd_plnt  = p_plnt
"
"       AND rocmrd_doc_no = p_trans_no;
"
"
"
"
"
"    r_store_acct            c_store_acct%ROWTYPE;
"
"    r_rwk_comp                c_rwk_comp%ROWTYPE;
"
"    r_res_acct                c_res_acct%ROWTYPE;
"
"    r_resgrp_acct            c_resgrp_acct%ROWTYPE;
"
"    r_mach_cost                c_mach%ROWTYPE;
"
"    v_dbt_store_id            VARCHAR2(10);
"
"    v_crd_store_id            VARCHAR2(10);
"
"    v_dbt_acct                stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl            VARCHAR2(10);
"
"    v_dbt_lvl1                VARCHAR2(4);
"
"    v_dbt_lvl2                VARCHAR2(4);
"
"    v_dbt_lvl3                VARCHAR2(4);
"
"    v_dbt_lvl4                VARCHAR2(4);
"
"    v_dbt_lvl5                VARCHAR2(4);
"
"    v_dbt_lvl6                VARCHAR2(4);
"
"    v_dbt_acct_plnt            VARCHAR2(10);
"
"    v_mat_dbt_cc_code        VARCHAR2(20);
"
"    v_mat_crd_cc_code        VARCHAR2(20);
"
"    v_crd_lvl1                VARCHAR2(4);
"
"    v_crd_lvl2                VARCHAR2(4);
"
"    v_crd_lvl3                VARCHAR2(4);
"
"    v_crd_lvl4                VARCHAR2(4);
"
"    v_crd_lvl5                VARCHAR2(4);
"
"    v_crd_lvl6                VARCHAR2(4);
"
"    v_crd_acct_plnt            VARCHAR2(10);
"
"    v_crd_acct                stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl            VARCHAR2(10);
"
"    v_sf_cost                NUMBER(17,5):=0;
"
"    v_mach_cost                NUMBER(17,5):=0;
"
"    v_oh_cost                NUMBER(17,5):=0;
"
"    v_unit_cost                NUMBER(17,5):=0;
"
"    v_jrnl_trans_no            VARCHAR2(15);
"
"    v_jrnl_trans_seq_no        NUMBER;
"
"
"
"    BEGIN
"
"
"
"
"
"                        /*Debit Section*/
"
"
"
"        OPEN c_rwk_comp;
"
"        FETCH c_rwk_comp INTO r_rwk_comp;
"
"        CLOSE c_rwk_comp;
"
"
"
"            v_dbt_store_id := r_rwk_comp.rwochd_target_store;
"
"
"
"            pkg_mfg_rwk_perpetual_journals.proc_calc_cost(p_bu,
"
"                                                          p_plnt,
"
"                                                          p_trans_no,
"
"                                                          p_prod_id,
"
"                                                          p_prod_rev,
"
"                                                          p_comp_qty,
"
"                                                          v_sf_cost,
"
"                                                          v_mach_cost,
"
"                                                          v_oh_cost,
"
"                                                          v_unit_cost
"
"                                                          );
"
"
"
"                            -- RAISE_APPLICATION_ERROR(-20999,'HRM' || v_unit_cost ||'/'||v_mach_cost ||'/'||v_sf_cost ||'/'||v_oh_cost ||'/'||p_comp_qty ||'/'||(v_unit_cost * p_comp_qty));
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||' ' ||v_sf_cost||' ' ||v_mach_cost||' ' ||v_unit_cost);
"
"
"
"            OPEN c_store_acct(v_dbt_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_dbt_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_dbt_lvl1,
"
"                                  v_dbt_lvl2,
"
"                                  v_dbt_lvl3,
"
"                                  v_dbt_lvl4,
"
"                  v_dbt_lvl5,
"
"                  v_dbt_lvl6,
"
"                                  v_dbt_prj_lvl,
"
"                      v_mat_dbt_cc_code,
"
"                                  v_dbt_acct_plnt ,
"
"                  r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"               INSERT INTO appl_journals(
"
"                                        aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_dbt_acct_plnt             ,
"
"                                        v_dbt_lvl1                ,
"
"                                        v_dbt_lvl2                ,
"
"                                        v_dbt_lvl3                ,
"
"                                        v_dbt_lvl4                ,
"
"                                        v_dbt_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                        0              ,
"
"                                        ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                        0              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_dbt_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                        p_prod_id               ,
"
"                                        p_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        p_comp_qty              ,
"
"                                        v_unit_cost,--/p_comp_qty              ,
"
"                                        v_unit_cost,--/p_comp_qty           ,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RCM'               ,
"
"                                        NULL                ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_dbt_prj_lvl
"
"                                        );
"
"
"
"
"
"                                /*Credit Section*/
"
"
"
"            FOR r_mach_cost IN c_mach
"
"            LOOP
"
"
"
"
"
"
"
"                OPEN c_res_acct(r_mach_cost.roru_res_id);
"
"                FETCH c_res_acct INTO r_res_acct;
"
"
"
"                    IF c_res_acct%NOTFOUND OR
"
"                        r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"                        r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"                        OPEN c_resgrp_acct(r_mach_cost.roru_res_id);
"
"                        FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"                            IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"                                raise_application_error(-20002,'APM');
"
"                            ELSE
"
"
"
"                                v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"                                v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"                                v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"                                v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"                                v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"                                v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"                                v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"                            END IF;
"
"                        CLOSE c_resgrp_acct;
"
"                    ELSE
"
"
"
"                                v_crd_acct := r_res_acct.mfgr_acct;
"
"                                v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"                                v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"                                v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"                                v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"                                v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"                                v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"                    END IF;
"
"
"
"                CLOSE c_res_acct;
"
"
"
"
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty          ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl
"
"                                             );
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
"            END LOOP c_mach;
"
"
"
"            FOR r_mat_req IN c_mat_req
"
"            LOOP
"
"
"
"                    v_crd_store_id := r_mat_req.rocmrd_cons_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                    v_crd_lvl5,
"
"                    v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                    v_mat_crd_cc_code ,
"
"                                        v_crd_acct_plnt ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1                ,
"
"                                                        aj_gl_lvl2                ,
"
"                                                        aj_gl_lvl3                ,
"
"                                                        aj_gl_lvl4                ,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_crd_acct_plnt             ,
"
"                                                        v_crd_lvl1                ,
"
"                                                        v_crd_lvl2                ,
"
"                                                        v_crd_lvl3                ,
"
"                                                        v_crd_lvl4                ,
"
"                                                        v_crd_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        0              ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                        0 ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_crd_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)           ,
"
"                                                        r_mat_req.rocmrd_prod_id              ,
"
"                                                        r_mat_req.rocmrd_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        p_comp_qty             ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty              ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RCM'               ,
"
"                                                        NULL                ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_crd_prj_lvl
"
"                                                         );
"
"
"
"            END LOOP;
"
"
"
"    END proc_ins_crm_repair_jrnls;
"
"
"
"    PROCEDURE proc_ins_disassemble_jrnls(p_bu            VARCHAR2,
"
"                                         p_plnt            VARCHAR2,
"
"                                         p_trans_no        VARCHAR2,
"
"                                         p_trans_date    DATE,
"
"                                         p_prod_ord_no    VARCHAR2,
"
"                                         p_prod_id        VARCHAR2,
"
"                                         p_prod_rev        NUMBER,
"
"                                         p_comp_qty        NUMBER,
"
"                                         p_lang            NUMBER,
"
"                                         p_user            VARCHAR2
"
"                                         )
"
"    IS
"
"    CURSOR c_rwk_comp
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
"       AND rwochd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_mach
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
"       AND roru_doc_no = p_trans_no;
"
"
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"      IS
"
"    SELECT mfgr_acct       ,
"
"           mfgr_acct_plnt  ,
"
"           mfgr_prj_lvl    ,
"
"           mfgr_lvl1       ,
"
"           mfgr_lvl2       ,
"
"           mfgr_lvl3       ,
"
"           mfgr_lvl4
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"       IS
"
"    SELECT mfgrg_ac_lvl1,
"
"           mfgrg_ac_lvl2,
"
"           mfgrg_ac_lvl3,
"
"           mfgrg_ac_lvl4,
"
"           mfgrg_current_acct ,
"
"           mfgrg_ac_lvl_prj,
"
"           mfgrg_acct_plnt
"
"      FROM mfg_res_groups,
"
"           mfg_resources
"
"     WHERE mfgrg_bu = mfgr_bu
"
"       AND mfgrg_plnt = mfgr_plnt
"
"       AND mfgrg_grp_id = mfgr_group_id
"
"       AND mfgrg_bu = p_bu
"
"       AND mfgrg_plnt = p_plnt
"
"       AND mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_dis_ass
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
"       AND rwocln_doc_no = p_trans_no;
"
"
"
"           CURSOR c_mat_var
"
"           IS
"
"           SELECT fmc_acct_type,
"
"                  fmc_acct
"
"             FROM fin_mgmt_control
"
"            WHERE fmc_bu = p_bu
"
"       AND fmc_acct_type = 'MV';
"
"
"
"
"
"           CURSOR c_mat_req
"
"           IS
"
"           SELECT rocmrd_seq_no,
"
"                  rocmrd_prod_id,
"
"                  rocmrd_prod_rev,
"
"                  rocmrd_cons_store,
"
"                  store_gl_acct,
"
"                  (rocmrd_cons_qty * rocmrd_unit_cost) ext_cost
"
"             FROM rework_ord_comp_mat_req_dtls,
"
"                  stores
"
"            WHERE rocmrd_bu = store_bu
"
"              AND rocmrd_plnt = store_plnt
"
"              AND rocmrd_cons_store = store_id
"
"              AND ROUND((rocmrd_cons_qty * rocmrd_unit_cost),2) > 0
"
"              AND rocmrd_bu   = p_bu
"
"              AND rocmrd_plnt  = p_plnt
"
"              AND rocmrd_doc_no = p_trans_no;
"
"
"
"    r_store_acct            c_store_acct%ROWTYPE;
"
"    r_rwk_comp                c_rwk_comp%ROWTYPE;
"
"    r_res_acct                c_res_acct%ROWTYPE;
"
"    r_resgrp_acct            c_resgrp_acct%ROWTYPE;
"
"    cr_mat_req                c_mat_req%ROWTYPE;
"
"    cr_mat_var             c_mat_var%ROWTYPE;
"
"    r_dis_ass                c_dis_ass%ROWTYPE;
"
"    r_mach_cost                c_mach%ROWTYPE;
"
"    v_dbt_store_id            VARCHAR2(10);
"
"    v_crd_store_id            VARCHAR2(10);
"
"    v_dbt_acct                stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl            VARCHAR2(10);
"
"    v_dbt_lvl1                VARCHAR2(4);
"
"    v_dbt_lvl2                VARCHAR2(4);
"
"    v_dbt_lvl3                VARCHAR2(4);
"
"    v_dbt_lvl4                VARCHAR2(4);
"
"    v_dbt_lvl5                VARCHAR2(4);
"
"    v_dbt_lvl6                VARCHAR2(4);
"
"    v_mat_dbt_cc_code    VARCHAR2(20);
"
"    v_mat_crd_cc_code    VARCHAR2(20);
"
"    v_dbt_acct_plnt            VARCHAR2(10);
"
"    v_crd_lvl1                VARCHAR2(4);
"
"    v_crd_lvl2                VARCHAR2(4);
"
"    v_crd_lvl3                VARCHAR2(4);
"
"    v_crd_lvl4                VARCHAR2(4);
"
"    v_crd_lvl5                VARCHAR2(4);
"
"    v_crd_lvl6                VARCHAR2(4);
"
"    v_crd_acct_plnt            VARCHAR2(10);
"
"    v_crd_acct                stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl            VARCHAR2(10);
"
"    v_sf_cost                NUMBER(17,5):=0;
"
"    v_mach_cost                NUMBER(17,5):=0;
"
"    v_oh_cost                NUMBER(17,5):=0;
"
"    v_unit_cost                NUMBER(17,5):=0;
"
"    v_jrnl_trans_no            VARCHAR2(15);
"
"    v_jrnl_trans_seq_no        NUMBER;
"
"    v_dbt_amt        NUMBER(17,5);
"
"                            v_crd_amt        NUMBER(17,5);
"
"                        v_diff_amt        NUMBER(17,5);
"
"    v_trans_seq_no        NUMBER;
"
"    BEGIN
"
"
"
"                /*Credit Section for Header*/
"
"
"
"        OPEN c_rwk_comp;
"
"        FETCH c_rwk_comp INTO r_rwk_comp;
"
"        CLOSE c_rwk_comp;
"
"
"
"            v_crd_store_id := r_rwk_comp.rwochd_sou_store;
"
"
"
"            proc_rw_cal_cost(p_bu,
"
"                             p_plnt,
"
"                             p_trans_no,
"
"                             p_prod_id,
"
"                             p_prod_rev,
"
"                             p_comp_qty,
"
"                             v_sf_cost,
"
"                             v_mach_cost,
"
"                             v_oh_cost,
"
"                             v_unit_cost
"
"                             );
"
"
"
"            OPEN c_store_acct(v_crd_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_crd_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_crd_lvl1,
"
"                                  v_crd_lvl2,
"
"                                  v_crd_lvl3,
"
"                                  v_crd_lvl4,
"
"                  v_crd_lvl5 ,
"
"                  v_crd_lvl6 ,
"
"                                  v_crd_prj_lvl,
"
"                  v_mat_crd_cc_code,
"
"                                  v_crd_acct_plnt  ,
"
"                  r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"               INSERT INTO appl_journals(
"
"                                        aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj  ,
"
"                    aj_sub_vou_type
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_crd_acct_plnt             ,
"
"                                        v_crd_lvl1                ,
"
"                                        v_crd_lvl2                ,
"
"                                        v_crd_lvl3                ,
"
"                                        v_crd_lvl4                ,
"
"                                        v_crd_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        0              ,
"
"                                        ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))              ,
"
"                                        0 ,
"
"                                        ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_crd_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                        p_prod_id               ,
"
"                                        p_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        p_comp_qty              ,
"
"                                        v_sf_cost/p_comp_qty            ,
"
"                                        v_sf_cost/p_comp_qty           ,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RWC'               ,
"
"                                        NULL                ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_crd_prj_lvl,
"
"                    r_rwk_comp.rwochd_ord_type
"
"                                        );
"
"
"
"                /*Credit Section*/
"
"
"
"            FOR r_mach_cost IN c_mach
"
"            LOOP
"
"
"
"
"
"
"
"                OPEN c_res_acct(r_mach_cost.roru_res_id);
"
"                FETCH c_res_acct INTO r_res_acct;
"
"
"
"                    IF c_res_acct%NOTFOUND OR
"
"                        r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"                        r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"                        OPEN c_resgrp_acct(r_mach_cost.roru_res_id);
"
"                        FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"                            IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"                                raise_application_error(-20002,'APM');
"
"                            ELSE
"
"
"
"                                v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"                                v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"                                v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"                                v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"                                v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"                                v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"                                v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"                            END IF;
"
"                        CLOSE c_resgrp_acct;
"
"                    ELSE
"
"
"
"                                v_crd_acct := r_res_acct.mfgr_acct;
"
"                                v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"                                v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"                                v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"                                v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"                                v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"                                v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"                    END IF;
"
"
"
"                CLOSE c_res_acct;
"
"
"
"
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj    ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty          ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"            END LOOP c_mach;
"
"
"
" FOR r_mat_req IN c_mat_req
"
"            LOOP
"
"
"
"                    v_crd_store_id := r_mat_req.rocmrd_cons_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                    v_crd_lvl5 ,
"
"                    v_crd_lvl6  ,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt,
"
"                    v_mat_crd_cc_code,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1                ,
"
"                                                        aj_gl_lvl2                ,
"
"                                                        aj_gl_lvl3                ,
"
"                                                        aj_gl_lvl4                ,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj    ,
"
"                            aj_sub_vou_type
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_crd_acct_plnt             ,
"
"                                                        v_crd_lvl1                ,
"
"                                                        v_crd_lvl2                ,
"
"                                                        v_crd_lvl3                ,
"
"                                                        v_crd_lvl4                ,
"
"                                                        v_crd_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        0              ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                        0 ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_crd_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)           ,
"
"                                                        r_mat_req.rocmrd_prod_id              ,
"
"                                                        r_mat_req.rocmrd_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        p_comp_qty             ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty              ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RWC'               ,
"
"                                                        NULL                ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_crd_prj_lvl  ,
"
"                            r_rwk_comp.rwochd_ord_type
"
"                                                         );
"
"
"
"            END LOOP;
"
"
"
"
"
"
"
"                /*Dis-assemble Part*/
"
"
"
"            FOR r_dis_ass IN c_dis_ass
"
"            LOOP
"
"
"
"            IF r_dis_ass.rwocln_qty > 0 THEN
"
"
"
"                v_dbt_store_id := r_dis_ass.rwocln_store_id;
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                                        v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt ,
"
"                    v_mat_dbt_cc_code,
"
"                                        r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj  ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_dis_ass.rwocln_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_dis_ass.rwocln_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0       ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)           ,
"
"                                            r_dis_ass.rwocln_prod_id           ,
"
"                                            r_dis_ass.rwocln_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_dis_ass.rwocln_qty ,
"
"                                            r_dis_ass.rwocln_unit_cost    ,
"
"                                            r_dis_ass.rwocln_unit_cost      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"                         END IF;
"
"
"
" IF r_dis_ass.rwocln_reject_qty > 0 THEN
"
"
"
"                v_dbt_store_id := func_find_store_fr_type(p_bu,p_plnt,r_rwk_comp.rwochd_plnt_loc_id,'J');
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt ,
"
"                    v_mat_dbt_cc_code    ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj        ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_dis_ass.rwocln_reject_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_dis_ass.rwocln_reject_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0       ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)           ,
"
"                                            r_dis_ass.rwocln_prod_id           ,
"
"                                            r_dis_ass.rwocln_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_dis_ass.rwocln_reject_qty ,
"
"                                            r_dis_ass.rwocln_unit_cost    ,
"
"                                            r_dis_ass.rwocln_unit_cost      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl  ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"                         END IF;
"
"
"
"
"
"
"
"            END LOOP c_dis_ass;
"
"
"
"                  SELECT NVL(SUM(aj_bc_db_amt),0) db_amt,NVL(SUM(aj_bc_cr_amt),0) cr_amt
"
"                INTO v_dbt_amt,v_crd_amt
"
"                FROM appl_journals
"
"               WHERE aj_bu = p_bu
"
"                AND  aj_plnt = p_plnt
"
"                AND aj_vou_no = p_trans_no
"
"                AND aj_appl = 'RR'
"
"                AND aj_vou_type = 'RCM';
"
"
"
"               IF v_dbt_amt < v_crd_amt THEN
"
"
"
"               v_diff_amt := v_crd_amt -  v_dbt_amt;
"
"
"
"                                   OPEN c_mat_var;
"
"                               FETCH c_mat_var INTO cr_mat_var;
"
"                                   IF c_mat_var%NOTFOUND OR cr_mat_var.fmc_acct IS NULL THEN
"
"                                      RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                                   ELSE
"
"                                      v_dbt_acct := cr_mat_var.fmc_acct;
"
"                                   END IF;
"
"                               CLOSE c_mat_var;
"
"
"
"                               proc_find_cost_center(
"
"                                                     p_bu    ,
"
"                                                     p_plnt  ,
"
"                                                     NULL,
"
"                                                     v_dbt_acct,
"
"                                                     NULL ,
"
"                                                     NULL ,
"
"                                                     NULL ,
"
"                                                     NULL ,
"
"                                                     v_dbt_lvl1,
"
"                                                     v_dbt_lvl2,
"
"                                                     v_dbt_lvl3,
"
"                                                     v_dbt_lvl4,
"
"                             v_dbt_lvl5,
"
"                             v_dbt_lvl6,
"
"                                                     v_dbt_prj_lvl,
"
"                                                     v_dbt_acct_plnt,
"
"                             v_mat_dbt_cc_code  ,
"
"                                 r_rwk_comp.rwochd_plnt_loc_id
"
"                                                     );
"
"
"
"                               IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                                   OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"                                  RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                               END IF;
"
"
"
"
"
"
"
"
"
"                               SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                 INTO v_jrnl_trans_seq_no
"
"                                 FROM appl_journals
"
"                                WHERE aj_bu = p_bu
"
"                                  AND aj_plnt = p_plnt
"
"                                  AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                  INSERT INTO appl_journals(
"
"                                                           aj_bu                     ,
"
"                                                           aj_plnt                   ,
"
"                                                           aj_jrnl_trns_no           ,
"
"                                                           aj_jrnl_trns_seq_no       ,
"
"                                                           aj_acctg_plnt             ,
"
"                                                           aj_gl_lvl1                ,
"
"                                                           aj_gl_lvl2                ,
"
"                                                           aj_gl_lvl3                ,
"
"                                                           aj_gl_lvl4                ,
"
"                                                           aj_gl_acct                ,
"
"                                                           aj_gl_acct_desc           ,
"
"                                                           aj_reference1             ,
"
"                                                           aj_reference2             ,
"
"                                                           aj_fc_db_amt              ,
"
"                                                           aj_fc_cr_amt              ,
"
"                                                           aj_bc_db_amt              ,
"
"                                                           aj_bc_cr_amt              ,
"
"                                                           aj_db_ex_rate             ,
"
"                                                           aj_cr_ex_rate             ,
"
"                                                           aj_jrnl_date              ,
"
"                                                           aj_jrnl_year              ,
"
"                                                           aj_jrnl_period            ,
"
"                                                           aj_store_id               ,
"
"                                                           aj_store_name             ,
"
"                                                           aj_cls_id                 ,
"
"                                                           aj_cls_desc               ,
"
"                                                           aj_sub_cls_id             ,
"
"                                                           aj_sub_cls_desc           ,
"
"                                                           aj_prod_id                ,
"
"                                                           aj_prod_rev               ,
"
"                                                           aj_prod_desc1             ,
"
"                                                           aj_tc_id                  ,
"
"                                                           aj_tc_desc                ,
"
"                                                           aj_suplr_id               ,
"
"                                                           aj_suplr_name             ,
"
"                                                           aj_cust_id                ,
"
"                                                           aj_cust_name              ,
"
"                                                           aj_area_id                ,
"
"                                                           aj_area_desc              ,
"
"                                                           aj_terr_id                ,
"
"                                                           aj_terr_desc              ,
"
"                                                           aj_bank_id                ,
"
"                                                           aj_bank_name              ,
"
"                                                           aj_fa_grp_id              ,
"
"                                                           aj_fa_grp_desc            ,
"
"                                                           aj_fa_id                  ,
"
"                                                           aj_fa_desc                ,
"
"                                                           aj_dept_id                ,
"
"                                                           aj_dept_desc              ,
"
"                                                           aj_proj_id                ,
"
"                                                           aj_proj_desc              ,
"
"                                                           aj_res_grp_id             ,
"
"                                                           aj_res_grp_desc           ,
"
"                                                           aj_res_id                 ,
"
"                                                           aj_res_desc               ,
"
"                                                           aj_emp_id                 ,
"
"                                                           aj_emp_name               ,
"
"                                                           aj_trans_qty              ,
"
"                                                           aj_unit_cost              ,
"
"                                                           aj_unit_price             ,
"
"                                                           aj_source_doc_mode        ,
"
"                                                           aj_appl                   ,
"
"                                                           aj_status                 ,
"
"                                                           aj_jrnl_no                ,
"
"                                                           aj_cre_by                 ,
"
"                                                           aj_cre_date               ,
"
"                                                           aj_upd_by                 ,
"
"                                                           aj_upd_date               ,
"
"                                                           aj_offset_doc_no          ,
"
"                                                           aj_vou_type               ,
"
"                                                           aj_vou_pfx                ,
"
"                                                           aj_vou_no                 ,
"
"                                                           aj_vou_line_no            ,
"
"                                                           aj_ref_no                 ,
"
"                                                           aj_ref_date,
"
"                                                           aj_gl_lvl_prj    ,
"
"                               aj_sub_vou_type
"
"                                                           )
"
"                                                    VALUES(
"
"                                                           p_bu                     ,
"
"                                                           p_plnt                   ,
"
"                                                           v_jrnl_trans_no           ,
"
"                                                           v_jrnl_trans_seq_no       ,
"
"                                                           v_dbt_acct_plnt             ,
"
"                                                           v_dbt_lvl1                ,
"
"                                                           v_dbt_lvl2                ,
"
"                                                           v_dbt_lvl3                ,
"
"                                                           v_dbt_lvl4                ,
"
"                                                           v_dbt_acct                ,
"
"                                                           func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                                           'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                           'REWORK COMPLETION'             ,
"
"                                                           ROUND((v_diff_amt),func_find_appl_rnddigit(p_bu))              ,
"
"                                                           0              ,
"
"                                                           ROUND(v_diff_amt,func_find_appl_rnddigit(p_bu)) ,
"
"                                                           0              ,
"
"                                                           1             ,
"
"                                                           1             ,
"
"                                                           p_trans_date              ,
"
"                                                           func_find_year(p_bu,p_trans_date)              ,
"
"                                                           func_find_period(p_bu,p_trans_date)            ,
"
"                                                           NULL              ,
"
"                                                           NULL             ,
"
"                                                           NULL                 ,
"
"                                                           NULL               ,
"
"                                                           NULL           ,
"
"                                                           NULL          ,
"
"                                                           NULL              ,
"
"                                                           NULL             ,
"
"                                                           NULL            ,
"
"                                                           NULL                  ,
"
"                                                           NULL                ,
"
"                                                           NULL               ,
"
"                                                           NULL             ,
"
"                                                           NULL                ,
"
"                                                           NULL              ,
"
"                                                           NULL                ,
"
"                                                           NULL              ,
"
"                                                           NULL                ,
"
"                                                           NULL              ,
"
"                                                           NULL                ,
"
"                                                           NULL              ,
"
"                                                           NULL              ,
"
"                                                           NULL            ,
"
"                                                           NULL                  ,
"
"                                                           NULL                ,
"
"                                                           NULL                ,
"
"                                                           NULL              ,
"
"                                                           NULL                ,
"
"                                                           NULL              ,
"
"                                                           NULL             ,
"
"                                                           NULL           ,
"
"                                                           NULL                 ,
"
"                                                           NULL               ,
"
"                                                           NULL                 ,
"
"                                                           NULL               ,
"
"                                                           p_comp_qty              ,
"
"                                                           v_unit_cost             ,
"
"                                                           v_unit_cost          ,
"
"                                                           NULL        ,
"
"                                                           'RR'                   ,
"
"                                                           'N'                 ,
"
"                                                           NULL                ,
"
"                                                           p_user                 ,
"
"                                                           SYSDATE               ,
"
"                                                           NULL                 ,
"
"                                                           NULL               ,
"
"                                                           NULL          ,
"
"                                                           'RWC'               ,
"
"                                                           NULL                ,
"
"                                                           p_trans_no                 ,
"
"                                                           1            ,
"
"                                                           NULL                 ,
"
"                                                           NULL,
"
"                                                           v_dbt_prj_lvl,
"
"                               r_rwk_comp.rwochd_ord_type
"
"                                                );
"
"
"
"                   ELSIF v_dbt_amt > v_crd_amt THEN
"
"                     raise_application_error(-20613,'PLN');
"
"               END IF;
"
"
"
"
"
"                /* diff update */
"
"
"
"
"
"                                 SELECT NVL(SUM(aj_bc_db_amt),0) db_amt,NVL(SUM(aj_bc_cr_amt),0) cr_amt
"
"                                  INTO v_dbt_amt,v_crd_amt
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                  AND  aj_plnt = p_plnt
"
"                                  AND aj_vou_no = p_trans_no
"
"                                  AND aj_appl = 'RR'
"
"                                  AND aj_vou_type = 'RWC';
"
"
"
"
"
"
"
"                                  IF v_dbt_amt > v_crd_amt THEN
"
"                                v_diff_amt := v_dbt_amt - v_crd_amt;
"
"                                  IF v_diff_amt < 1 THEN
"
"
"
"                                SELECT MIN(aj_jrnl_trns_seq_no)
"
"                                  INTO v_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_vou_no = p_trans_no
"
"                                   AND aj_appl = 'RR'
"
"                                   AND aj_vou_type = 'RWC'
"
"                                   AND aj_bc_db_amt > 0;
"
"
"
"
"
"
"
"                                   UPDATE appl_journals
"
"                                    SET aj_bc_db_amt = aj_bc_db_amt - v_diff_amt,
"
"                                    aj_fc_db_amt = aj_fc_db_amt - v_diff_amt,
"
"                                    aj_upd_by = p_user,
"
"                                    aj_upd_date = SYSDATE
"
"                                   WHERE aj_bu = p_bu
"
"                                     AND aj_plnt = p_plnt
"
"                                     AND aj_vou_no = p_trans_no
"
"                                     AND aj_appl = 'RR'
"
"                                     AND aj_vou_type = 'RWC'
"
"                                     AND aj_bc_db_amt > 0
"
"                                     AND aj_jrnl_trns_seq_no = v_trans_seq_no;
"
"                                END IF;
"
"
"
"                       ELSIF v_dbt_amt < v_crd_amt THEN
"
"
"
"                           v_diff_amt := v_crd_amt - v_dbt_amt;
"
"
"
"                        IF v_diff_amt < 1 THEN
"
"
"
"                        SELECT MIN(aj_jrnl_trns_seq_no)
"
"                          INTO v_trans_seq_no
"
"                          FROM appl_journals
"
"                         WHERE aj_bu = p_bu
"
"                           AND aj_plnt = p_plnt
"
"                           AND aj_vou_no = p_trans_no
"
"                           AND aj_appl = 'RR'
"
"                           AND aj_vou_type = 'RWC'
"
"                           AND aj_bc_db_amt > 0;
"
"
"
"                             UPDATE appl_journals
"
"                                SET aj_bc_db_amt = aj_bc_db_amt + v_diff_amt,
"
"                                aj_fc_db_amt = aj_fc_db_amt + v_diff_amt,
"
"                                aj_upd_by = p_user,
"
"                                aj_upd_date = SYSDATE
"
"                               WHERE aj_bu = p_bu
"
"                                 AND aj_plnt = p_plnt
"
"                                 AND aj_vou_no = p_trans_no
"
"                                 AND aj_appl = 'RR'
"
"                                 AND aj_vou_type = 'RWC'
"
"                                 AND aj_bc_db_amt > 0
"
"                                 AND aj_jrnl_trns_seq_no = v_trans_seq_no;
"
"                        END IF;
"
"             END IF;
"
"
"
"
"
"
"
"
"
"    END    proc_ins_disassemble_jrnls;
"
"
"
"    PROCEDURE proc_ins_scrap_jrnls(p_bu                VARCHAR2,
"
"                                   p_plnt            VARCHAR2,
"
"                                   p_trans_no        VARCHAR2,
"
"                                   p_trans_date        DATE,
"
"                                   p_prod_ord_no    VARCHAR2,
"
"                                   p_prod_id        VARCHAR2,
"
"                                   p_prod_rev        NUMBER,
"
"                                   p_comp_qty        NUMBER,
"
"                                   p_lang            NUMBER,
"
"                                   p_user            VARCHAR2
"
"                                   )
"
"    IS
"
"    CURSOR c_rwk_comp
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
"       AND rwochd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_mach
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
"       AND roru_doc_no = p_trans_no;
"
"
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"      IS
"
"    SELECT mfgr_acct       ,
"
"           mfgr_acct_plnt  ,
"
"           mfgr_prj_lvl    ,
"
"           mfgr_lvl1       ,
"
"           mfgr_lvl2       ,
"
"           mfgr_lvl3       ,
"
"           mfgr_lvl4
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"       IS
"
"    SELECT mfgrg_ac_lvl1,
"
"           mfgrg_ac_lvl2,
"
"           mfgrg_ac_lvl3,
"
"           mfgrg_ac_lvl4,
"
"           mfgrg_current_acct ,
"
"           mfgrg_ac_lvl_prj,
"
"           mfgrg_acct_plnt
"
"      FROM mfg_res_groups,
"
"           mfg_resources
"
"     WHERE mfgrg_bu = mfgr_bu
"
"       AND mfgrg_plnt = mfgr_plnt
"
"       AND mfgrg_grp_id = mfgr_group_id
"
"       AND mfgrg_bu = p_bu
"
"       AND mfgrg_plnt = p_plnt
"
"       AND mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_scrap
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
"       AND rcs_doc_no = p_trans_no;
"
"
"
"    CURSOR c_proc_loss
"
"    IS
"
"    SELECT fmc_acct_type,
"
"           fmc_acct
"
"      FROM fin_mgmt_control
"
"     WHERE fmc_bu = p_bu
"
"       AND fmc_acct_type = 'MV';
"
"
"
"           CURSOR c_mat_req
"
"           IS
"
"           SELECT rocmrd_seq_no,
"
"                  rocmrd_prod_id,
"
"                  rocmrd_prod_rev,
"
"                  rocmrd_cons_store,
"
"                  store_gl_acct,
"
"                  (rocmrd_cons_qty * rocmrd_unit_cost) ext_cost
"
"             FROM rework_ord_comp_mat_req_dtls,
"
"                  stores
"
"            WHERE rocmrd_bu = store_bu
"
"              AND rocmrd_plnt = store_plnt
"
"              AND rocmrd_cons_store = store_id
"
"              AND ROUND((rocmrd_cons_qty * rocmrd_unit_cost),2) > 0
"
"              AND rocmrd_bu   = p_bu
"
"              AND rocmrd_plnt  = p_plnt
"
"       AND rocmrd_doc_no = p_trans_no;
"
"
"
"    cr_proc_loss             c_proc_loss%ROWTYPE;
"
"    r_store_acct            c_store_acct%ROWTYPE;
"
"    r_rwk_comp                c_rwk_comp%ROWTYPE;
"
"    r_res_acct                c_res_acct%ROWTYPE;
"
"    r_resgrp_acct            c_resgrp_acct%ROWTYPE;
"
"    cr_mat_req                c_mat_req%ROWTYPE;
"
"    r_mach_cost                c_mach%ROWTYPE;
"
"    r_scrap                    c_scrap%ROWTYPE;
"
"    v_dbt_store_id            VARCHAR2(10);
"
"    v_crd_store_id            VARCHAR2(10);
"
"    v_dbt_acct                stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl            VARCHAR2(10);
"
"    v_dbt_lvl1                VARCHAR2(4);
"
"    v_dbt_lvl2                VARCHAR2(4);
"
"    v_dbt_lvl3                VARCHAR2(4);
"
"    v_dbt_lvl4                VARCHAR2(4);
"
"    v_dbt_lvl5                VARCHAR2(4);
"
"    v_dbt_lvl6                VARCHAR2(4);
"
"        v_mat_dbt_cc_code    VARCHAR2(20);
"
"    v_mat_crd_cc_code    VARCHAR2(20);
"
"    v_crd_lvl5                VARCHAR2(4);
"
"    v_crd_lvl6                VARCHAR2(4);
"
"    v_dbt_acct_plnt            VARCHAR2(10);
"
"    v_crd_lvl1                VARCHAR2(4);
"
"    v_crd_lvl2                VARCHAR2(4);
"
"    v_crd_lvl3                VARCHAR2(4);
"
"    v_crd_lvl4                VARCHAR2(4);
"
"    v_crd_acct_plnt            VARCHAR2(10);
"
"    v_crd_acct                stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl            VARCHAR2(10);
"
"    v_sf_cost                NUMBER(17,5):=0;
"
"    v_mach_cost                NUMBER(17,5):=0;
"
"    v_oh_cost                NUMBER(17,5):=0;
"
"    v_unit_cost                NUMBER(17,5):=0;
"
"    v_jrnl_trans_no            VARCHAR2(15);
"
"    v_jrnl_trans_seq_no        NUMBER;
"
"    v_proc_loss                NUMBER(17,5);
"
"
"
"
"
"    BEGIN
"
"
"
"            /*Credit Section*/
"
"
"
"        OPEN c_rwk_comp;
"
"        FETCH c_rwk_comp INTO r_rwk_comp;
"
"        CLOSE c_rwk_comp;
"
"
"
"        proc_rw_cal_cost(p_bu,
"
"                                 p_plnt,
"
"                                 p_trans_no,
"
"                                 p_prod_id,
"
"                                 p_prod_rev,
"
"                                 p_comp_qty,
"
"                                 v_sf_cost,
"
"                                 v_mach_cost,
"
"                                 v_oh_cost,
"
"                                 v_unit_cost
"
"                             );
"
"
"
"        v_proc_loss := (v_sf_cost + v_mach_cost + v_oh_cost);
"
"
"
"        --raise_application_error(-20999,'HRM'||'/'||v_proc_loss||' ' ||v_mach_cost||' ' ||v_oh_cost||' ' ||v_sf_cost);
"
"
"
"    --raise_application_error(-20999,'HRM');
"
"
"
"        FOR cr_scrap IN c_scrap
"
"        LOOP
"
"           v_proc_loss := v_proc_loss - (cr_scrap.rcs_scrap_qty * cr_scrap.rcs_unit_cost);
"
"        END LOOP;
"
"
"
"
"
"
"
"        FOR cr_scrap IN c_scrap
"
"        LOOP
"
"
"
"            v_dbt_store_id := cr_scrap.rcs_store_id;
"
"
"
"
"
"
"
"            --raise_application_error(-20999,'HRM'||' ' ||v_sf_cost||' ' ||v_mach_cost||' ' ||v_unit_cost);
"
"
"
"            OPEN c_store_acct(v_dbt_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_dbt_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_dbt_lvl1,
"
"                                  v_dbt_lvl2,
"
"                                  v_dbt_lvl3,
"
"                                  v_dbt_lvl4,
"
"                  v_dbt_lvl5,
"
"                  v_dbt_lvl6,
"
"                                  v_dbt_prj_lvl,
"
"                                  v_dbt_acct_plnt ,
"
"                  v_mat_dbt_cc_code,
"
"                                  r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"               INSERT INTO appl_journals(
"
"                                        aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                                        aj_gl_lvl5  ,
"
"                                        aj_gl_lvl6  ,
"
"                                        aj_cc_code,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj ,
"
"                                        aj_gl_plnt_loc_id   ,
"
"                                        aj_sub_vou_type
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_dbt_acct_plnt             ,
"
"                                        v_dbt_lvl1                ,
"
"                                        v_dbt_lvl2                ,
"
"                                        v_dbt_lvl3                ,
"
"                                        v_dbt_lvl4                ,
"
"                                        v_dbt_lvl5 ,
"
"                                        v_dbt_lvl6,
"
"                                        v_mat_dbt_cc_code,
"
"                                        v_dbt_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        ROUND((cr_scrap.rcs_scrap_qty * cr_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                        0              ,
"
"                                        ROUND((cr_scrap.rcs_scrap_qty * cr_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                        0              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_dbt_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,cr_scrap.rcs_prod_id,cr_scrap.rcs_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,cr_scrap.rcs_prod_id,cr_scrap.rcs_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,cr_scrap.rcs_prod_id,cr_scrap.rcs_prod_rev) ,p_lang)           ,
"
"                                        cr_scrap.rcs_prod_id               ,
"
"                                        cr_scrap.rcs_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,cr_scrap.rcs_prod_id,cr_scrap.rcs_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        cr_scrap.rcs_scrap_qty              ,
"
"                                        cr_scrap.rcs_unit_cost              ,
"
"                                        cr_scrap.rcs_unit_cost           ,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RWC'               ,
"
"                                        NULL                ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_dbt_prj_lvl,
"
"                                        r_rwk_comp.rwochd_plnt_loc_id  ,
"
"                                        r_rwk_comp.rwochd_ord_type
"
"                                        );
"
"              END LOOP;
"
"
"
"
"
"            IF v_proc_loss > 0 THEN
"
"
"
"                        OPEN c_proc_loss;
"
"                    FETCH c_proc_loss INTO cr_proc_loss;
"
"                        IF c_proc_loss%NOTFOUND OR cr_proc_loss.fmc_acct IS NULL THEN
"
"                           RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                        ELSE
"
"                           v_dbt_acct := cr_proc_loss.fmc_acct;
"
"                        END IF;
"
"                    CLOSE c_proc_loss;
"
"
"
"                    proc_find_cost_center(
"
"                                          p_bu    ,
"
"                                          p_plnt  ,
"
"                                          NULL,
"
"                                          v_dbt_acct,
"
"                                          NULL ,
"
"                                          NULL ,
"
"                                          NULL ,
"
"                                          NULL ,
"
"                                          v_dbt_lvl1,
"
"                                          v_dbt_lvl2,
"
"                                          v_dbt_lvl3,
"
"                                          v_dbt_lvl4,
"
"                      v_dbt_lvl5,
"
"                      v_dbt_lvl6,
"
"                      v_dbt_prj_lvl,
"
"                      v_dbt_acct_plnt ,
"
"                      v_mat_dbt_cc_code,
"
"                      r_rwk_comp.rwochd_plnt_loc_id
"
"                                          );
"
"
"
"                    IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                       INSERT INTO appl_journals(
"
"                                                aj_bu                     ,
"
"                                                aj_plnt                   ,
"
"                                                aj_jrnl_trns_no           ,
"
"                                                aj_jrnl_trns_seq_no       ,
"
"                                                aj_acctg_plnt             ,
"
"                                                aj_gl_lvl1                ,
"
"                                                aj_gl_lvl2                ,
"
"                                                aj_gl_lvl3                ,
"
"                                                aj_gl_lvl4                ,
"
"                                                aj_gl_acct                ,
"
"                                                aj_gl_acct_desc           ,
"
"                                                aj_reference1             ,
"
"                                                aj_reference2             ,
"
"                                                aj_fc_db_amt              ,
"
"                                                aj_fc_cr_amt              ,
"
"                                                aj_bc_db_amt              ,
"
"                                                aj_bc_cr_amt              ,
"
"                                                aj_db_ex_rate             ,
"
"                                                aj_cr_ex_rate             ,
"
"                                                aj_jrnl_date              ,
"
"                                                aj_jrnl_year              ,
"
"                                                aj_jrnl_period            ,
"
"                                                aj_store_id               ,
"
"                                                aj_store_name             ,
"
"                                                aj_cls_id                 ,
"
"                                                aj_cls_desc               ,
"
"                                                aj_sub_cls_id             ,
"
"                                                aj_sub_cls_desc           ,
"
"                                                aj_prod_id                ,
"
"                                                aj_prod_rev               ,
"
"                                                aj_prod_desc1             ,
"
"                                                aj_tc_id                  ,
"
"                                                aj_tc_desc                ,
"
"                                                aj_suplr_id               ,
"
"                                                aj_suplr_name             ,
"
"                                                aj_cust_id                ,
"
"                                                aj_cust_name              ,
"
"                                                aj_area_id                ,
"
"                                                aj_area_desc              ,
"
"                                                aj_terr_id                ,
"
"                                                aj_terr_desc              ,
"
"                                                aj_bank_id                ,
"
"                                                aj_bank_name              ,
"
"                                                aj_fa_grp_id              ,
"
"                                                aj_fa_grp_desc            ,
"
"                                                aj_fa_id                  ,
"
"                                                aj_fa_desc                ,
"
"                                                aj_dept_id                ,
"
"                                                aj_dept_desc              ,
"
"                                                aj_proj_id                ,
"
"                                                aj_proj_desc              ,
"
"                                                aj_res_grp_id             ,
"
"                                                aj_res_grp_desc           ,
"
"                                                aj_res_id                 ,
"
"                                                aj_res_desc               ,
"
"                                                aj_emp_id                 ,
"
"                                                aj_emp_name               ,
"
"                                                aj_trans_qty              ,
"
"                                                aj_unit_cost              ,
"
"                                                aj_unit_price             ,
"
"                                                aj_source_doc_mode        ,
"
"                                                aj_appl                   ,
"
"                                                aj_status                 ,
"
"                                                aj_jrnl_no                ,
"
"                                                aj_cre_by                 ,
"
"                                                aj_cre_date               ,
"
"                                                aj_upd_by                 ,
"
"                                                aj_upd_date               ,
"
"                                                aj_offset_doc_no          ,
"
"                                                aj_vou_type               ,
"
"                                                aj_vou_pfx                ,
"
"                                                aj_vou_no                 ,
"
"                                                aj_vou_line_no            ,
"
"                                                aj_ref_no                 ,
"
"                                                aj_ref_date,
"
"                                                aj_gl_lvl_prj,
"
"                        aj_sub_vou_type
"
"                                                )
"
"                                         VALUES(
"
"                                                p_bu                     ,
"
"                                                p_plnt                   ,
"
"                                                v_jrnl_trans_no           ,
"
"                                                v_jrnl_trans_seq_no       ,
"
"                                                v_dbt_acct_plnt             ,
"
"                                                v_dbt_lvl1                ,
"
"                                                v_dbt_lvl2                ,
"
"                                                v_dbt_lvl3                ,
"
"                                                v_dbt_lvl4                ,
"
"                                                v_dbt_acct                ,
"
"                                                func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                                'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                'REWORK COMPLETION'             ,
"
"                                                ROUND((v_proc_loss),func_find_appl_rnddigit(p_bu))              ,
"
"                                                0              ,
"
"                                                ROUND(v_proc_loss,func_find_appl_rnddigit(p_bu)) ,
"
"                                                0              ,
"
"                                                1             ,
"
"                                                1             ,
"
"                                                p_trans_date              ,
"
"                                                func_find_year(p_bu,p_trans_date)              ,
"
"                                                func_find_period(p_bu,p_trans_date)            ,
"
"                                                NULL              ,
"
"                                                NULL             ,
"
"                                                NULL                 ,
"
"                                                NULL               ,
"
"                                                NULL           ,
"
"                                                NULL          ,
"
"                                                NULL              ,
"
"                                                NULL             ,
"
"                                                NULL            ,
"
"                                                NULL                  ,
"
"                                                NULL                ,
"
"                                                NULL               ,
"
"                                                NULL             ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL              ,
"
"                                                NULL            ,
"
"                                                NULL                  ,
"
"                                                NULL                ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL             ,
"
"                                                NULL           ,
"
"                                                NULL                 ,
"
"                                                NULL               ,
"
"                                                NULL                 ,
"
"                                                NULL               ,
"
"                                                p_comp_qty              ,
"
"                                                v_unit_cost             ,
"
"                                                v_unit_cost          ,
"
"                                                NULL        ,
"
"                                                'RR'                   ,
"
"                                                'N'                 ,
"
"                                                NULL                ,
"
"                                                p_user                 ,
"
"                                                SYSDATE               ,
"
"                                                NULL                 ,
"
"                                                NULL               ,
"
"                                                NULL          ,
"
"                                                'RWC'               ,
"
"                                                NULL                ,
"
"                                                p_trans_no                 ,
"
"                                                1            ,
"
"                                                NULL                 ,
"
"                                                NULL,
"
"                                                v_dbt_prj_lvl,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                                );
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
"            /*Credit Section*/
"
"
"
"            FOR r_mach_cost IN c_mach
"
"            LOOP
"
"
"
"
"
"
"
"                OPEN c_res_acct(r_mach_cost.roru_res_id);
"
"                FETCH c_res_acct INTO r_res_acct;
"
"
"
"                    IF c_res_acct%NOTFOUND OR
"
"                        r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"                        r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"                        OPEN c_resgrp_acct(r_mach_cost.roru_res_id);
"
"                        FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"                            IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"                                raise_application_error(-20002,'APM');
"
"                            ELSE
"
"
"
"                                v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"                                v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"                                v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"                                v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"                                v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"                                v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"                                v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"                            END IF;
"
"                        CLOSE c_resgrp_acct;
"
"                    ELSE
"
"
"
"                                v_crd_acct := r_res_acct.mfgr_acct;
"
"                                v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"                                v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"                                v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"                                v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"                                v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"                                v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"                    END IF;
"
"
"
"                CLOSE c_res_acct;
"
"
"
"
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty          ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"            END LOOP c_mach;
"
"
"
" FOR r_mat_req IN c_mat_req
"
"            LOOP
"
"
"
"                    v_crd_store_id := r_mat_req.rocmrd_cons_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                    v_crd_lvl5 ,
"
"                    v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt,
"
"                    v_mat_crd_cc_code ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1                ,
"
"                                                        aj_gl_lvl2                ,
"
"                                                        aj_gl_lvl3                ,
"
"                                                        aj_gl_lvl4                ,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj ,
"
"                            aj_sub_vou_type
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_crd_acct_plnt             ,
"
"                                                        v_crd_lvl1                ,
"
"                                                        v_crd_lvl2                ,
"
"                                                        v_crd_lvl3                ,
"
"                                                        v_crd_lvl4                ,
"
"                                                        v_crd_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        0              ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                        0 ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_crd_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)           ,
"
"                                                        r_mat_req.rocmrd_prod_id              ,
"
"                                                        r_mat_req.rocmrd_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        p_comp_qty             ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty              ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RWC'               ,
"
"                                                        NULL                ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_crd_prj_lvl  ,
"
"                            r_rwk_comp.rwochd_ord_type
"
"                                                         );
"
"
"
"            END LOOP;
"
"
"
"
"
"       --Credit for Header item
"
"
"
"                v_crd_store_id := r_rwk_comp.rwochd_sou_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                    v_crd_lvl5 ,
"
"                    v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt,
"
"                    v_mat_crd_cc_code ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"                       --RAISE_APPLICATION_ERROR(-20999,'HRM'|| v_sf_cost);
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj    ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((v_sf_cost),func_find_appl_rnddigit(p_bu))             ,
"
"                                            --ROUND((r_scrap.rcs_scrap_qty * r_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((v_sf_cost),func_find_appl_rnddigit(p_bu))  ,
"
"                                            --ROUND((r_scrap.rcs_scrap_qty * r_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_crd_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                            p_prod_id          ,
"
"                                            p_prod_rev             ,
"
"                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty ,
"
"                                            v_sf_cost/p_comp_qty  ,
"
"                                            v_sf_cost/p_comp_qty    ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"
"
"
"
"    END proc_ins_scrap_jrnls;
"
"
"
"    PROCEDURE proc_ins_disass_scr_jrnls(p_bu                VARCHAR2,
"
"                                        p_plnt                VARCHAR2,
"
"                                        p_trans_no            VARCHAR2,
"
"                                        p_trans_date        DATE,
"
"                                        p_prod_ord_no        VARCHAR2,
"
"                                        p_prod_id            VARCHAR2,
"
"                                        p_prod_rev            NUMBER,
"
"                                        p_comp_qty            NUMBER,
"
"                                        p_lang                NUMBER,
"
"                                        p_user                VARCHAR2
"
"                                        )
"
"    IS
"
"    CURSOR c_rwk_comp
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
"       AND rwochd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_mach
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
"       AND roru_doc_no = p_trans_no;
"
"
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"      IS
"
"    SELECT mfgr_acct       ,
"
"           mfgr_acct_plnt  ,
"
"           mfgr_prj_lvl    ,
"
"           mfgr_lvl1       ,
"
"           mfgr_lvl2       ,
"
"           mfgr_lvl3       ,
"
"           mfgr_lvl4
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"       IS
"
"    SELECT mfgrg_ac_lvl1,
"
"           mfgrg_ac_lvl2,
"
"           mfgrg_ac_lvl3,
"
"           mfgrg_ac_lvl4,
"
"           mfgrg_current_acct ,
"
"           mfgrg_ac_lvl_prj,
"
"           mfgrg_acct_plnt
"
"      FROM mfg_res_groups,
"
"           mfg_resources
"
"     WHERE mfgrg_bu = mfgr_bu
"
"       AND mfgrg_plnt = mfgr_plnt
"
"       AND mfgrg_grp_id = mfgr_group_id
"
"       AND mfgrg_bu = p_bu
"
"       AND mfgrg_plnt = p_plnt
"
"       AND mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"
"
"    CURSOR c_dis_ass
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
"       AND rwocln_doc_no = p_trans_no;
"
"
"
"    CURSOR c_scrap
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
"       AND rcs_doc_no = p_trans_no;
"
"
"
"    r_store_acct            c_store_acct%ROWTYPE;
"
"    r_rwk_comp                c_rwk_comp%ROWTYPE;
"
"    r_res_acct                c_res_acct%ROWTYPE;
"
"    r_resgrp_acct            c_resgrp_acct%ROWTYPE;
"
"    r_dis_ass                c_dis_ass%ROWTYPE;
"
"    r_mach_cost                c_mach%ROWTYPE;
"
"    r_scrap                    c_scrap%ROWTYPE;
"
"    v_dbt_store_id            VARCHAR2(10);
"
"    v_crd_store_id            VARCHAR2(10);
"
"    v_dbt_acct                stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl            VARCHAR2(10);
"
"    v_dbt_lvl1                VARCHAR2(4);
"
"    v_dbt_lvl2                VARCHAR2(4);
"
"    v_dbt_lvl3                VARCHAR2(4);
"
"    v_dbt_lvl4                VARCHAR2(4);
"
"    v_dbt_acct_plnt            VARCHAR2(10);
"
"    v_crd_lvl1                VARCHAR2(4);
"
"    v_crd_lvl2                VARCHAR2(4);
"
"    v_crd_lvl3                VARCHAR2(4);
"
"    v_crd_lvl4                VARCHAR2(4);
"
"     v_dbt_lvl5                VARCHAR2(4);
"
"    v_dbt_lvl6                VARCHAR2(4);
"
"    v_mat_dbt_cc_code    VARCHAR2(20);
"
"    v_mat_crd_cc_code    VARCHAR2(20);
"
"    v_crd_lvl5                VARCHAR2(4);
"
"    v_crd_lvl6                VARCHAR2(4);
"
"    v_crd_acct_plnt            VARCHAR2(10);
"
"    v_crd_acct                stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl            VARCHAR2(10);
"
"    v_sf_cost                NUMBER(17,5):=0;
"
"    v_mach_cost                NUMBER(17,5):=0;
"
"    v_oh_cost                NUMBER(17,5):=0;
"
"    v_unit_cost                NUMBER(17,5):=0;
"
"    v_jrnl_trans_no            VARCHAR2(15);
"
"    v_jrnl_trans_seq_no        NUMBER;
"
"
"
"    BEGIN
"
"
"
"
"
"                /*Credit Section*/
"
"
"
"        OPEN c_rwk_comp;
"
"        FETCH c_rwk_comp INTO r_rwk_comp;
"
"        CLOSE c_rwk_comp;
"
"
"
"            v_crd_store_id := r_rwk_comp.rwochd_sou_store;
"
"
"
"            proc_rw_cal_cost(p_bu,
"
"                             p_plnt,
"
"                             p_trans_no,
"
"                             p_prod_id,
"
"                             p_prod_rev,
"
"                             p_comp_qty,
"
"                             v_sf_cost,
"
"                             v_mach_cost,
"
"                             v_oh_cost,
"
"                             v_unit_cost
"
"                             );
"
"
"
"            --raise_application_error(-20999,'HRM'||' ' ||v_sf_cost||' ' ||v_mach_cost||' ' ||v_unit_cost);
"
"
"
"            OPEN c_store_acct(v_crd_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_crd_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_crd_lvl1,
"
"                                  v_crd_lvl2,
"
"                                  v_crd_lvl3,
"
"                                  v_crd_lvl4,
"
"                                  v_crd_lvl5 ,
"
"                  v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt,
"
"                    v_mat_crd_cc_code ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"              INSERT INTO appl_journals(aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj ,
"
"                    aj_sub_vou_type
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_crd_acct_plnt             ,
"
"                                        v_crd_lvl1                ,
"
"                                        v_crd_lvl2                ,
"
"                                        v_crd_lvl3                ,
"
"                                        v_crd_lvl4                ,
"
"                                        v_crd_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        0              ,
"
"                                        ROUND(v_sf_cost ,func_find_appl_rnddigit(p_bu))              ,
"
"                                        0,
"
"                                        ROUND(v_sf_cost ,func_find_appl_rnddigit(p_bu))              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_crd_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                        p_prod_id               ,
"
"                                        p_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        p_comp_qty              ,
"
"                                        v_unit_cost              ,
"
"                                        v_unit_cost           ,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RWC'               ,
"
"                                        NULL                ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_crd_prj_lvl ,
"
"                    r_rwk_comp.rwochd_ord_type
"
"                                        );
"
"
"
"
"
"                /*Credit Section*/
"
"
"
"            FOR r_mach_cost IN c_mach
"
"            LOOP
"
"
"
"
"
"
"
"                OPEN c_res_acct(r_mach_cost.roru_res_id);
"
"                FETCH c_res_acct INTO r_res_acct;
"
"
"
"                    IF c_res_acct%NOTFOUND OR
"
"                        r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"                        r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"                        OPEN c_resgrp_acct(r_mach_cost.roru_res_id);
"
"                        FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"                            IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"                                raise_application_error(-20002,'APM');
"
"                            ELSE
"
"
"
"                                v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"                                v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"                                v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"                                v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"                                v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"                                v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"                                v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"                            END IF;
"
"                        CLOSE c_resgrp_acct;
"
"                    ELSE
"
"
"
"                                v_crd_acct := r_res_acct.mfgr_acct;
"
"                                v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"                                v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"                                v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"                                v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"                                v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"                                v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"                    END IF;
"
"
"
"                CLOSE c_res_acct;
"
"
"
"
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj   ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty          ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"            END LOOP c_mach;
"
"
"
"
"
"            /*Dis-assemble Part*/
"
"
"
"            FOR r_dis_ass IN c_dis_ass
"
"            LOOP
"
"
"
"               IF r_dis_ass.rwocln_qty > 0 THEN
"
"                v_dbt_store_id := r_dis_ass.rwocln_store_id;
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt ,
"
"                    v_mat_dbt_cc_code,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj    ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_dis_ass.rwocln_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_dis_ass.rwocln_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)           ,
"
"                                            r_dis_ass.rwocln_prod_id           ,
"
"                                            r_dis_ass.rwocln_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_dis_ass.rwocln_qty ,
"
"                                            r_dis_ass.rwocln_unit_cost    ,
"
"                                            r_dis_ass.rwocln_unit_cost      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"           END IF;
"
"
"
" IF r_dis_ass.rwocln_reject_qty > 0 THEN
"
"
"
"                v_dbt_store_id := func_find_store_fr_type(p_bu,p_plnt,r_rwk_comp.rwochd_plnt_loc_id,'J');
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt,
"
"                    v_mat_dbt_cc_code,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj  ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_dis_ass.rwocln_reject_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_dis_ass.rwocln_reject_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0       ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)           ,
"
"                                            r_dis_ass.rwocln_prod_id           ,
"
"                                            r_dis_ass.rwocln_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_dis_ass.rwocln_reject_qty ,
"
"                                            r_dis_ass.rwocln_unit_cost    ,
"
"                                            r_dis_ass.rwocln_unit_cost      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"                         END IF;
"
"
"
"
"
"            END LOOP c_dis_ass;
"
"
"
"            /*Scrap Part*/
"
"
"
"            FOR r_scrap IN c_scrap
"
"            LOOP
"
"
"
"                v_dbt_store_id := r_scrap.rcs_store_id;
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt  ,
"
"                    v_mat_dbt_cc_code ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj  ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_scrap.rcs_scrap_qty * r_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_scrap.rcs_scrap_qty * r_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0            ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev) ,p_lang)           ,
"
"                                            r_scrap.rcs_prod_id          ,
"
"                                            r_scrap.rcs_prod_rev             ,
"
"                                            func_find_prod_desc(p_bu,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_scrap.rcs_scrap_qty ,
"
"                                            r_scrap.rcs_unit_cost  ,
"
"                                            r_scrap.rcs_unit_cost     ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl  ,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"            END LOOP c_scrap;
"
"
"
"    END proc_ins_disass_scr_jrnls;
"
"
"
"    PROCEDURE proc_ins_rpr_disass_scr_jrnls(p_bu                VARCHAR2,
"
"                                            p_plnt                VARCHAR2,
"
"                                            p_trans_no            VARCHAR2,
"
"                                            p_trans_date        DATE,
"
"                                            p_prod_ord_no        VARCHAR2,
"
"                                            p_prod_id            VARCHAR2,
"
"                                            p_prod_rev            NUMBER,
"
"                                            p_comp_qty            NUMBER,
"
"                                            p_lang                NUMBER,
"
"                                            p_user                VARCHAR2
"
"                                            )
"
"    IS
"
"    CURSOR c_rwk_comp
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
"       AND rwochd_doc_no = p_trans_no;
"
"
"
"    CURSOR c_mach
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
"       AND roru_doc_no = p_trans_no;
"
"
"
"    CURSOR c_store_acct(c_store_id VARCHAR2)
"
"    IS
"
"    SELECT store_gl_acct
"
"      FROM stores
"
"     WHERE store_bu = p_bu
"
"       AND store_id = c_store_id;
"
"
"
"    CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"      IS
"
"    SELECT mfgr_acct       ,
"
"           mfgr_acct_plnt  ,
"
"           mfgr_prj_lvl    ,
"
"           mfgr_lvl1       ,
"
"           mfgr_lvl2       ,
"
"           mfgr_lvl3       ,
"
"           mfgr_lvl4
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"    CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"       IS
"
"    SELECT mfgrg_ac_lvl1,
"
"           mfgrg_ac_lvl2,
"
"           mfgrg_ac_lvl3,
"
"           mfgrg_ac_lvl4,
"
"           mfgrg_current_acct ,
"
"           mfgrg_ac_lvl_prj,
"
"           mfgrg_acct_plnt
"
"      FROM mfg_res_groups,
"
"           mfg_resources
"
"     WHERE mfgrg_bu = mfgr_bu
"
"       AND mfgrg_plnt = mfgr_plnt
"
"       AND mfgrg_grp_id = mfgr_group_id
"
"       AND mfgrg_bu = p_bu
"
"       AND mfgrg_plnt = p_plnt
"
"       AND mfgr_bu = p_bu
"
"       AND mfgr_plnt = p_plnt
"
"       AND mfgr_res_id = c_mach_id;
"
"
"
"
"
"    CURSOR c_dis_ass
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
"       AND rwocln_doc_no = p_trans_no;
"
"
"
"    CURSOR c_scrap
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
"       AND rcs_doc_no = p_trans_no;
"
"        CURSOR c_mat_var
"
"           IS
"
"           SELECT fmc_acct_type,
"
"                  fmc_acct
"
"             FROM fin_mgmt_control
"
"            WHERE fmc_bu = p_bu
"
"       AND fmc_acct_type = 'MV';
"
"
"
"   CURSOR c_mat_req
"
"           IS
"
"           SELECT rocmrd_seq_no,
"
"                  rocmrd_prod_id,
"
"                  rocmrd_prod_rev,
"
"                  rocmrd_cons_store,
"
"                  store_gl_acct,
"
"                  (rocmrd_cons_qty * rocmrd_unit_cost) ext_cost
"
"             FROM rework_ord_comp_mat_req_dtls,
"
"                  stores
"
"            WHERE rocmrd_bu = store_bu
"
"              AND rocmrd_plnt = store_plnt
"
"              AND rocmrd_cons_store = store_id
"
"              AND ROUND((rocmrd_cons_qty * rocmrd_unit_cost),2) > 0
"
"              AND rocmrd_bu   = p_bu
"
"              AND rocmrd_plnt  = p_plnt
"
"       AND rocmrd_doc_no = p_trans_no;
"
"
"
"
"
"
"
"    r_store_acct            c_store_acct%ROWTYPE;
"
"    r_rwk_comp                c_rwk_comp%ROWTYPE;
"
"    r_res_acct                c_res_acct%ROWTYPE;
"
"    r_resgrp_acct            c_resgrp_acct%ROWTYPE;
"
"   cr_mat_req                 c_mat_req%ROWTYPE;
"
"    cr_mat_var                c_mat_var%rowtype;
"
"    r_dis_ass                c_dis_ass%ROWTYPE;
"
"    r_mach_cost                c_mach%ROWTYPE;
"
"    r_scrap                    c_scrap%ROWTYPE;
"
"    v_dbt_store_id            VARCHAR2(10);
"
"    v_crd_store_id            VARCHAR2(10);
"
"    v_dbt_acct                stores.store_gl_acct%TYPE;
"
"    v_dbt_prj_lvl            VARCHAR2(10);
"
"    v_dbt_lvl1                VARCHAR2(4);
"
"    v_dbt_lvl2                VARCHAR2(4);
"
"    v_dbt_lvl3                VARCHAR2(4);
"
"    v_dbt_lvl4                VARCHAR2(4);
"
"    v_dbt_lvl5                VARCHAR2(4);
"
"    v_dbt_lvl6                VARCHAR2(4);
"
"    v_mat_dbt_cc_code    VARCHAR2(20);
"
"    v_mat_crd_cc_code    VARCHAR2(20);
"
"    v_crd_lvl5                VARCHAR2(4);
"
"    v_crd_lvl6                VARCHAR2(4);
"
"    v_dbt_acct_plnt            VARCHAR2(10);
"
"    v_crd_lvl1                VARCHAR2(4);
"
"    v_crd_lvl2                VARCHAR2(4);
"
"    v_crd_lvl3                VARCHAR2(4);
"
"    v_crd_lvl4                VARCHAR2(4);
"
"    v_crd_acct_plnt            VARCHAR2(10);
"
"    v_crd_acct                stores.store_gl_acct%TYPE;
"
"    v_crd_prj_lvl            VARCHAR2(10);
"
"    v_sf_cost                NUMBER(17,5):=0;
"
"    v_mach_cost                NUMBER(17,5):=0;
"
"    v_oh_cost                NUMBER(17,5):=0;
"
"    v_unit_cost                NUMBER(17,5):=0;
"
"    v_jrnl_trans_no            VARCHAR2(15);
"
"    v_jrnl_trans_seq_no        NUMBER;
"
"
"
"    v_repair_qty               NUMBER(12,3);
"
"      v_dbt_amt        NUMBER(17,5);
"
"                                v_crd_amt        NUMBER(17,5);
"
"                        v_diff_amt        NUMBER(17,5);
"
"
"
"    BEGIN
"
"
"
"
"
"                /*Debit Section*/
"
"
"
"        OPEN c_rwk_comp;
"
"        FETCH c_rwk_comp INTO r_rwk_comp;
"
"        CLOSE c_rwk_comp;
"
"
"
"            v_crd_store_id := r_rwk_comp.rwochd_sou_store;
"
"
"
"            proc_rw_cal_cost(p_bu,
"
"                             p_plnt,
"
"                             p_trans_no,
"
"                             p_prod_id,
"
"                             p_prod_rev,
"
"                             p_comp_qty,
"
"                             v_sf_cost,
"
"                             v_mach_cost,
"
"                             v_oh_cost,
"
"                             v_unit_cost
"
"                             );
"
"
"
"           --- raise_application_error(-20999,'HRM'||' ' ||v_sf_cost||' ' ||v_mach_cost||' ' ||v_unit_cost);
"
"
"
"            OPEN c_store_acct(v_crd_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_crd_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_crd_lvl1,
"
"                                  v_crd_lvl2,
"
"                                  v_crd_lvl3,
"
"                                  v_crd_lvl4,
"
"                                  v_crd_lvl5,
"
"                                  v_crd_lvl6,
"
"                                  v_crd_prj_lvl,
"
"                                  v_crd_acct_plnt ,
"
"                  v_mat_crd_cc_code ,
"
"                  r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"            IF r_rwk_comp.rwochd_ord_type <> 'RCRR' THEN
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"               INSERT INTO appl_journals(
"
"                                        aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                                        aj_gl_lvl5               ,
"
"                                        aj_gl_lvl6               ,
"
"                                        aj_cc_code          ,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj  ,
"
"                                        aj_gl_plnt_loc_id   ,
"
"                                        aj_sub_vou_type
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_crd_acct_plnt             ,
"
"                                        v_crd_lvl1                ,
"
"                                        v_crd_lvl2                ,
"
"                                        v_crd_lvl3                ,
"
"                                        v_crd_lvl4                ,
"
"                                        v_crd_lvl5          ,
"
"                                        v_crd_lvl6          ,
"
"                                        v_mat_crd_cc_code ,
"
"                                        v_crd_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        0             ,
"
"                                        ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))               ,
"
"                                        0 ,
"
"                                        ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_crd_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                        p_prod_id               ,
"
"                                        p_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        p_comp_qty              ,
"
"                                        v_sf_cost/p_comp_qty        ,
"
"                                        v_sf_cost/p_comp_qty    ,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RWC'               ,
"
"                                        NULL                ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_crd_prj_lvl  ,
"
"                                        r_rwk_comp.rwochd_plnt_loc_id  ,
"
"                                        r_rwk_comp.rwochd_ord_type
"
"                                        );
"
"
"
"        END IF;
"
"                /*Debit Section*/
"
"
"
"
"
"            /*Repair Part*/
"
"
"
"            v_repair_qty := r_rwk_comp.rwochd_comp_qty ;
"
"
"
"            v_dbt_store_id := r_rwk_comp.rwochd_target_store;
"
"
"
"           -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||v_repair_qty||'/'||v_dbt_store_id||'/'||v_unit_cost);
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt ,
"
"                    v_mat_dbt_cc_code    ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1,
"
"                                                        aj_gl_lvl2,
"
"                                                        aj_gl_lvl3,
"
"                                                        aj_gl_lvl4,
"
"                                                        aj_gl_lvl5,
"
"                                                        aj_gl_lvl6,
"
"                                                        aj_cc_code,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj,
"
"                                                        aj_gl_plnt_loc_id   ,
"
"                                                        aj_sub_vou_type
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_dbt_acct_plnt             ,
"
"                                                        v_dbt_lvl1                ,
"
"                                                        v_dbt_lvl2                ,
"
"                                                        v_dbt_lvl3                ,
"
"                                                        v_dbt_lvl4                ,
"
"                                                        v_dbt_lvl5   ,
"
"                                                        v_dbt_lvl6   ,
"
"                                                        v_mat_dbt_cc_code,
"
"                                                        v_dbt_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        ROUND(v_unit_cost * v_repair_qty,func_find_appl_rnddigit(p_bu))              ,
"
"                                                        0             ,
"
"                                                        ROUND(v_unit_cost * v_repair_qty,func_find_appl_rnddigit(p_bu)) ,
"
"                                                        0                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_dbt_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                                        p_prod_id              ,
"
"                                                        p_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        v_repair_qty             ,
"
"                                                        v_unit_cost             ,
"
"                                                        v_unit_cost          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RWC'               ,
"
"                                                        NULL                ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_dbt_prj_lvl,
"
"                                                        r_rwk_comp.rwochd_plnt_loc_id ,
"
"                                                        r_rwk_comp.rwochd_ord_type
"
"                                                         );
"
"
"
"
"
"IF r_rwk_comp.rwochd_rej_qty > 0 THEN
"
"
"
"
"
"            proc_rw_cal_cost(p_bu,
"
"                             p_plnt,
"
"                             p_trans_no,
"
"                             p_prod_id,
"
"                             p_prod_rev,
"
"                             p_comp_qty,
"
"                             v_sf_cost,
"
"                             v_mach_cost,
"
"                             v_oh_cost,
"
"                             v_unit_cost
"
"                             );
"
"
"
"
"
"           v_dbt_store_id := func_find_store_fr_type(p_bu,p_plnt,r_rwk_comp.rwochd_plnt_loc_id,'J');
"
"
"
"            OPEN c_store_acct(v_dbt_store_id);
"
"            FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                   RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"            CLOSE c_store_acct;
"
"
"
"            proc_find_cost_center(
"
"                                  p_bu    ,
"
"                                  p_plnt  ,
"
"                                  NULL,
"
"                                  v_dbt_acct,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  NULL ,
"
"                                  v_dbt_lvl1,
"
"                                  v_dbt_lvl2,
"
"                                  v_dbt_lvl3,
"
"                                  v_dbt_lvl4,
"
"                  v_dbt_lvl5,
"
"                  v_dbt_lvl6,
"
"                                  v_dbt_prj_lvl,
"
"                                  v_dbt_acct_plnt,
"
"                  v_mat_dbt_cc_code    ,
"
"                  r_rwk_comp.rwochd_plnt_loc_id
"
"                                  );
"
"
"
"            IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"            END IF;
"
"
"
"
"
"            v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"            SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"              INTO v_jrnl_trans_seq_no
"
"              FROM appl_journals
"
"             WHERE aj_bu = p_bu
"
"               AND aj_plnt = p_plnt
"
"               AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"               INSERT INTO appl_journals(
"
"                                        aj_bu                     ,
"
"                                        aj_plnt                   ,
"
"                                        aj_jrnl_trns_no           ,
"
"                                        aj_jrnl_trns_seq_no       ,
"
"                                        aj_acctg_plnt             ,
"
"                                        aj_gl_lvl1                ,
"
"                                        aj_gl_lvl2                ,
"
"                                        aj_gl_lvl3                ,
"
"                                        aj_gl_lvl4                ,
"
"                                        aj_gl_acct                ,
"
"                                        aj_gl_acct_desc           ,
"
"                                        aj_reference1             ,
"
"                                        aj_reference2             ,
"
"                                        aj_fc_db_amt              ,
"
"                                        aj_fc_cr_amt              ,
"
"                                        aj_bc_db_amt              ,
"
"                                        aj_bc_cr_amt              ,
"
"                                        aj_db_ex_rate             ,
"
"                                        aj_cr_ex_rate             ,
"
"                                        aj_jrnl_date              ,
"
"                                        aj_jrnl_year              ,
"
"                                        aj_jrnl_period            ,
"
"                                        aj_store_id               ,
"
"                                        aj_store_name             ,
"
"                                        aj_cls_id                 ,
"
"                                        aj_cls_desc               ,
"
"                                        aj_sub_cls_id             ,
"
"                                        aj_sub_cls_desc           ,
"
"                                        aj_prod_id                ,
"
"                                        aj_prod_rev               ,
"
"                                        aj_prod_desc1             ,
"
"                                        aj_tc_id                  ,
"
"                                        aj_tc_desc                ,
"
"                                        aj_suplr_id               ,
"
"                                        aj_suplr_name             ,
"
"                                        aj_cust_id                ,
"
"                                        aj_cust_name              ,
"
"                                        aj_area_id                ,
"
"                                        aj_area_desc              ,
"
"                                        aj_terr_id                ,
"
"                                        aj_terr_desc              ,
"
"                                        aj_bank_id                ,
"
"                                        aj_bank_name              ,
"
"                                        aj_fa_grp_id              ,
"
"                                        aj_fa_grp_desc            ,
"
"                                        aj_fa_id                  ,
"
"                                        aj_fa_desc                ,
"
"                                        aj_dept_id                ,
"
"                                        aj_dept_desc              ,
"
"                                        aj_proj_id                ,
"
"                                        aj_proj_desc              ,
"
"                                        aj_res_grp_id             ,
"
"                                        aj_res_grp_desc           ,
"
"                                        aj_res_id                 ,
"
"                                        aj_res_desc               ,
"
"                                        aj_emp_id                 ,
"
"                                        aj_emp_name               ,
"
"                                        aj_trans_qty              ,
"
"                                        aj_unit_cost              ,
"
"                                        aj_unit_price             ,
"
"                                        aj_source_doc_mode        ,
"
"                                        aj_appl                   ,
"
"                                        aj_status                 ,
"
"                                        aj_jrnl_no                ,
"
"                                        aj_cre_by                 ,
"
"                                        aj_cre_date               ,
"
"                                        aj_upd_by                 ,
"
"                                        aj_upd_date               ,
"
"                                        aj_offset_doc_no          ,
"
"                                        aj_vou_type               ,
"
"                                        aj_vou_pfx                ,
"
"                                        aj_vou_no                 ,
"
"                                        aj_vou_line_no            ,
"
"                                        aj_ref_no                 ,
"
"                                        aj_ref_date,
"
"                                        aj_gl_lvl_prj,
"
"                    aj_sub_vou_type
"
"                                        )
"
"                                 VALUES(
"
"                                        p_bu                     ,
"
"                                        p_plnt                   ,
"
"                                        v_jrnl_trans_no           ,
"
"                                        v_jrnl_trans_seq_no       ,
"
"                                        v_dbt_acct_plnt             ,
"
"                                        v_dbt_lvl1                ,
"
"                                        v_dbt_lvl2                ,
"
"                                        v_dbt_lvl3                ,
"
"                                        v_dbt_lvl4                ,
"
"                                        v_dbt_acct                ,
"
"                                        func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                        'REWORK COMPLETION'             ,
"
"                                        ROUND((v_unit_cost * r_rwk_comp.rwochd_rej_qty),func_find_appl_rnddigit(p_bu))              ,
"
"                                        0              ,
"
"                                        ROUND((v_unit_cost * r_rwk_comp.rwochd_rej_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                        0              ,
"
"                                        1             ,
"
"                                        1             ,
"
"                                        p_trans_date              ,
"
"                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                        v_dbt_store_id               ,
"
"                                        func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                        func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                        func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                        p_prod_id               ,
"
"                                        p_prod_rev              ,
"
"                                        func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL               ,
"
"                                        NULL             ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL              ,
"
"                                        NULL            ,
"
"                                        NULL                  ,
"
"                                        NULL                ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL                ,
"
"                                        NULL              ,
"
"                                        NULL             ,
"
"                                        NULL           ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        r_rwk_comp.rwochd_rej_qty              ,
"
"                                        v_unit_cost,--/p_comp_qty              ,
"
"                                        v_unit_cost,--/p_comp_qty           ,
"
"                                        NULL        ,
"
"                                        'RR'                   ,
"
"                                        'N'                 ,
"
"                                        NULL                ,
"
"                                        p_user                 ,
"
"                                        SYSDATE               ,
"
"                                        NULL                 ,
"
"                                        NULL               ,
"
"                                        NULL          ,
"
"                                        'RWC'               ,
"
"                                        NULL                ,
"
"                                        p_trans_no                 ,
"
"                                        1            ,
"
"                                        NULL                 ,
"
"                                        NULL,
"
"                                        v_dbt_prj_lvl,
"
"                    r_rwk_comp.rwochd_ord_type
"
"                                        );
"
"
"
"               END IF;
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
"   FOR r_mat_req IN c_mat_req
"
"            LOOP
"
"
"
"                    v_crd_store_id := r_mat_req.rocmrd_cons_store;
"
"
"
"                OPEN c_store_acct(v_crd_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_crd_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_crd_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_crd_lvl1,
"
"                                        v_crd_lvl2,
"
"                                        v_crd_lvl3,
"
"                                        v_crd_lvl4,
"
"                    v_crd_lvl5,
"
"                    v_crd_lvl6,
"
"                                        v_crd_prj_lvl,
"
"                                        v_crd_acct_plnt ,
"
"                    v_mat_crd_cc_code    ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    END IF;
"
"
"
"
"
"                                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                  INTO v_jrnl_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                INSERT INTO appl_journals(
"
"                                                        aj_bu                     ,
"
"                                                        aj_plnt                   ,
"
"                                                        aj_jrnl_trns_no           ,
"
"                                                        aj_jrnl_trns_seq_no       ,
"
"                                                        aj_acctg_plnt             ,
"
"                                                        aj_gl_lvl1                ,
"
"                                                        aj_gl_lvl2                ,
"
"                                                        aj_gl_lvl3                ,
"
"                                                        aj_gl_lvl4                ,
"
"                                                        aj_gl_acct                ,
"
"                                                        aj_gl_acct_desc           ,
"
"                                                        aj_reference1             ,
"
"                                                        aj_reference2             ,
"
"                                                        aj_fc_db_amt              ,
"
"                                                        aj_fc_cr_amt              ,
"
"                                                        aj_bc_db_amt              ,
"
"                                                        aj_bc_cr_amt              ,
"
"                                                        aj_db_ex_rate             ,
"
"                                                        aj_cr_ex_rate             ,
"
"                                                        aj_jrnl_date              ,
"
"                                                        aj_jrnl_year              ,
"
"                                                        aj_jrnl_period            ,
"
"                                                        aj_store_id               ,
"
"                                                        aj_store_name             ,
"
"                                                        aj_cls_id                 ,
"
"                                                        aj_cls_desc               ,
"
"                                                        aj_sub_cls_id             ,
"
"                                                        aj_sub_cls_desc           ,
"
"                                                        aj_prod_id                ,
"
"                                                        aj_prod_rev               ,
"
"                                                        aj_prod_desc1             ,
"
"                                                        aj_tc_id                  ,
"
"                                                        aj_tc_desc                ,
"
"                                                        aj_suplr_id               ,
"
"                                                        aj_suplr_name             ,
"
"                                                        aj_cust_id                ,
"
"                                                        aj_cust_name              ,
"
"                                                        aj_area_id                ,
"
"                                                        aj_area_desc              ,
"
"                                                        aj_terr_id                ,
"
"                                                        aj_terr_desc              ,
"
"                                                        aj_bank_id                ,
"
"                                                        aj_bank_name              ,
"
"                                                        aj_fa_grp_id              ,
"
"                                                        aj_fa_grp_desc            ,
"
"                                                        aj_fa_id                  ,
"
"                                                        aj_fa_desc                ,
"
"                                                        aj_dept_id                ,
"
"                                                        aj_dept_desc              ,
"
"                                                        aj_proj_id                ,
"
"                                                        aj_proj_desc              ,
"
"                                                        aj_res_grp_id             ,
"
"                                                        aj_res_grp_desc           ,
"
"                                                        aj_res_id                 ,
"
"                                                        aj_res_desc               ,
"
"                                                        aj_emp_id                 ,
"
"                                                        aj_emp_name               ,
"
"                                                        aj_trans_qty              ,
"
"                                                        aj_unit_cost              ,
"
"                                                        aj_unit_price             ,
"
"                                                        aj_source_doc_mode        ,
"
"                                                        aj_appl                   ,
"
"                                                        aj_status                 ,
"
"                                                        aj_jrnl_no                ,
"
"                                                        aj_cre_by                 ,
"
"                                                        aj_cre_date               ,
"
"                                                        aj_upd_by                 ,
"
"                                                        aj_upd_date               ,
"
"                                                        aj_offset_doc_no          ,
"
"                                                        aj_vou_type               ,
"
"                                                        aj_vou_pfx                ,
"
"                                                        aj_vou_no                 ,
"
"                                                        aj_vou_line_no            ,
"
"                                                        aj_ref_no                 ,
"
"                                                        aj_ref_date,
"
"                                                        aj_gl_lvl_prj  ,
"
"                            aj_sub_vou_type
"
"                                                        )
"
"                                                  VALUES(
"
"                                                        p_bu                     ,
"
"                                                        p_plnt                   ,
"
"                                                        v_jrnl_trans_no           ,
"
"                                                        v_jrnl_trans_seq_no       ,
"
"                                                        v_crd_acct_plnt             ,
"
"                                                        v_crd_lvl1                ,
"
"                                                        v_crd_lvl2                ,
"
"                                                        v_crd_lvl3                ,
"
"                                                        v_crd_lvl4                ,
"
"                                                        v_crd_acct                ,
"
"                                                        func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                        'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                        'REWORK COMPLETION '             ,
"
"                                                        0              ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                        0 ,
"
"                                                        ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                        1             ,
"
"                                                        1             ,
"
"                                                        p_trans_date              ,
"
"                                                        func_find_year(p_bu,p_trans_date)              ,
"
"                                                        func_find_period(p_bu,p_trans_date)            ,
"
"                                                        v_crd_store_id               ,
"
"                                                        func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                        func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)                 ,
"
"                                                        func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)               ,
"
"                                                        func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)             ,
"
"                                                        func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)           ,
"
"                                                        r_mat_req.rocmrd_prod_id              ,
"
"                                                        r_mat_req.rocmrd_prod_rev               ,
"
"                                                        func_find_prod_desc(p_bu,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev,p_lang)             ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL               ,
"
"                                                        NULL             ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL              ,
"
"                                                        NULL            ,
"
"                                                        NULL                  ,
"
"                                                        NULL                ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL                ,
"
"                                                        NULL              ,
"
"                                                        NULL             ,
"
"                                                        NULL           ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        p_comp_qty             ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty              ,
"
"                                                        r_mat_req.ext_cost/p_comp_qty          ,
"
"                                                        NULL        ,
"
"                                                        'RR'                   ,
"
"                                                        'N'                 ,
"
"                                                        NULL                ,
"
"                                                        p_user                 ,
"
"                                                        SYSDATE               ,
"
"                                                        NULL                 ,
"
"                                                        NULL               ,
"
"                                                        NULL          ,
"
"                                                        'RWC'               ,
"
"                                                        NULL                ,
"
"                                                        p_trans_no                 ,
"
"                                                        1            ,
"
"                                                        NULL                 ,
"
"                                                        NULL,
"
"                                                        v_crd_prj_lvl ,
"
"                            r_rwk_comp.rwochd_ord_type
"
"                                                         );
"
"
"
"            END LOOP;
"
"
"
"
"
"            FOR r_mach_cost IN c_mach
"
"            LOOP
"
"
"
"
"
"
"
"                OPEN c_res_acct(r_mach_cost.roru_res_id);
"
"                FETCH c_res_acct INTO r_res_acct;
"
"
"
"                    IF c_res_acct%NOTFOUND OR
"
"                        r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"                        r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"                        OPEN c_resgrp_acct(r_mach_cost.roru_res_id);
"
"                        FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"                            IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"                                       OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"                                raise_application_error(-20002,'APM');
"
"                            ELSE
"
"
"
"                                v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"                                v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"                                v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"                                v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"                                v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"                                v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"                                v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"                            END IF;
"
"                        CLOSE c_resgrp_acct;
"
"                    ELSE
"
"
"
"                                v_crd_acct := r_res_acct.mfgr_acct;
"
"                                v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"                                v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"                                v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"                                v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"                                v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"                                v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"                    END IF;
"
"
"
"                CLOSE c_res_acct;
"
"
"
"
"
"
"
"                IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                        OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_lvl5                ,
"
"                                            aj_gl_lvl6                ,
"
"                                            aj_cc_code                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj  ,
"
"                                            aj_gl_plnt_loc_id   ,
"
"                                            aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_crd_acct_plnt             ,
"
"                                            v_crd_lvl1                ,
"
"                                            v_crd_lvl2                ,
"
"                                            v_crd_lvl3                ,
"
"                                            v_crd_lvl4                ,
"
"                                            v_crd_lvl5,
"
"                                            v_crd_lvl6,
"
"                                            v_mat_crd_cc_code  ,
"
"                                            v_crd_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            0              ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0 ,
"
"                                            ROUND((r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL,
"
"                                            NULL            ,
"
"                                            NULL    ,
"
"                                            NULL           ,
"
"                                            NULL              ,
"
"                                            NULL           ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty             ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty          ,
"
"                                            (r_mach_cost.roru_units * r_mach_cost.roru_hrly_rate)   /p_comp_qty      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_crd_prj_lvl ,
"
"                                            r_rwk_comp.rwochd_plnt_loc_id   ,
"
"                                            r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"            END LOOP c_mach;
"
"
"
"
"
"            /*Dis-assemble Part*/
"
"
"
"            FOR r_dis_ass IN c_dis_ass
"
"            LOOP
"
"
"
"                IF r_dis_ass.rwocln_qty > 0 THEN
"
"                v_dbt_store_id := r_dis_ass.rwocln_store_id;
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt  ,
"
"                    v_mat_dbt_cc_code,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj ,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_dis_ass.rwocln_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_dis_ass.rwocln_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)           ,
"
"                                            r_dis_ass.rwocln_prod_id           ,
"
"                                            r_dis_ass.rwocln_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_dis_ass.rwocln_qty ,
"
"                                            r_dis_ass.rwocln_unit_cost    ,
"
"                                            r_dis_ass.rwocln_unit_cost      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"END IF;
"
"IF r_dis_ass.rwocln_reject_qty > 0 THEN
"
"
"
"                v_dbt_store_id := func_find_store_fr_type(p_bu,p_plnt,r_rwk_comp.rwochd_plnt_loc_id,'J');
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt  ,
"
"                    v_mat_dbt_cc_code    ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj,
"
"                        aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_dis_ass.rwocln_reject_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_dis_ass.rwocln_reject_qty * r_dis_ass.rwocln_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0       ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev) ,p_lang)           ,
"
"                                            r_dis_ass.rwocln_prod_id           ,
"
"                                            r_dis_ass.rwocln_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,r_dis_ass.rwocln_prod_id,r_dis_ass.rwocln_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_dis_ass.rwocln_reject_qty ,
"
"                                            r_dis_ass.rwocln_unit_cost    ,
"
"                                            r_dis_ass.rwocln_unit_cost      ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl,
"
"                        r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"
"
"                         END IF;
"
"
"
"
"
"            END LOOP c_dis_ass;
"
"
"
"            /*Scrap Part*/
"
"
"
"            FOR r_scrap IN c_scrap
"
"            LOOP
"
"
"
"                v_dbt_store_id := r_scrap.rcs_store_id;
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                ELSE
"
"                   v_dbt_acct := r_store_acct.store_gl_acct;
"
"                END IF;
"
"                CLOSE c_store_acct;
"
"
"
"
"
"                    proc_find_cost_center(
"
"                                        p_bu    ,
"
"                                        p_plnt  ,
"
"                                        NULL,
"
"                                        v_dbt_acct,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        NULL ,
"
"                                        v_dbt_lvl1,
"
"                                        v_dbt_lvl2,
"
"                                        v_dbt_lvl3,
"
"                                        v_dbt_lvl4,
"
"                    v_dbt_lvl5,
"
"                    v_dbt_lvl6,
"
"                                        v_dbt_prj_lvl,
"
"                                        v_dbt_acct_plnt  ,
"
"                    v_mat_dbt_cc_code    ,
"
"                    r_rwk_comp.rwochd_plnt_loc_id
"
"                                        );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                        OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                       RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roru_res_id);
"
"                END IF;
"
"
"
"                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                      INTO v_jrnl_trans_seq_no
"
"                      FROM appl_journals
"
"                     WHERE aj_bu = p_bu
"
"                       AND aj_plnt = p_plnt
"
"                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                    INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                             aj_gl_lvl5,
"
"                                             aj_gl_lvl6,
"
"                                             aj_cc_code,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj ,
"
"                                            aj_gl_plnt_loc_id   ,
"
"                                            aj_sub_vou_type
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_lvl5,
"
"                                            v_dbt_lvl6,
"
"                                            v_mat_dbt_cc_code  ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((r_scrap.rcs_scrap_qty * r_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu))              ,
"
"                                            0              ,
"
"                                            ROUND((r_scrap.rcs_scrap_qty * r_scrap.rcs_unit_cost),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0             ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev)                  ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev) ,p_lang)           ,
"
"                                            r_scrap.rcs_prod_id          ,
"
"                                            r_scrap.rcs_prod_rev             ,
"
"                                            func_find_prod_desc(p_bu,r_scrap.rcs_prod_id,r_scrap.rcs_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            r_scrap.rcs_scrap_qty ,
"
"                                            r_scrap.rcs_unit_cost  ,
"
"                                            r_scrap.rcs_unit_cost     ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RWC'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl ,
"
"                                            r_rwk_comp.rwochd_plnt_loc_id  ,
"
"                                            r_rwk_comp.rwochd_ord_type
"
"                                             );
"
"            END LOOP c_scrap;
"
"
"
"             SELECT NVL(SUM(aj_bc_db_amt),0) db_amt,NVL(SUM(aj_bc_cr_amt),0) cr_amt
"
"                        INTO v_dbt_amt,v_crd_amt
"
"                        FROM appl_journals
"
"                       WHERE aj_bu = p_bu
"
"                        AND  aj_plnt = p_plnt
"
"                        AND aj_vou_no = p_trans_no
"
"                        AND aj_appl = 'RR'
"
"                          AND aj_vou_type = 'RWC';
"
"
"
"                       IF v_dbt_amt < v_crd_amt THEN
"
"
"
"                       v_diff_amt := v_crd_amt -  v_dbt_amt;
"
"
"
"                                           OPEN c_mat_var;
"
"                                       FETCH c_mat_var INTO cr_mat_var;
"
"                                           IF c_mat_var%NOTFOUND OR cr_mat_var.fmc_acct IS NULL THEN
"
"                                              RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                                           ELSE
"
"                                              v_dbt_acct := cr_mat_var.fmc_acct;
"
"                                           END IF;
"
"                                       CLOSE c_mat_var;
"
"
"
"                                       proc_find_cost_center(
"
"                                                             p_bu    ,
"
"                                                             p_plnt  ,
"
"                                                             NULL,
"
"                                                             v_dbt_acct,
"
"                                                             NULL ,
"
"                                                             NULL ,
"
"                                                             NULL ,
"
"                                                             NULL ,
"
"                                                             v_dbt_lvl1,
"
"                                                             v_dbt_lvl2,
"
"                                                             v_dbt_lvl3,
"
"                                                             v_dbt_lvl4,
"
"                                v_dbt_lvl5                                    ,
"
"                                v_dbt_lvl6,
"
"                                                             v_dbt_prj_lvl,
"
"                                                             v_dbt_acct_plnt,
"
"                                v_mat_dbt_cc_code   ,
"
"r_rwk_comp.rwochd_plnt_loc_id
"
"                                                             );
"
"
"
"                                       IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                                           OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_acct_plnt IS NULL  THEN
"
"                                          RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                                       END IF;
"
"
"
"
"
"
"
"
"
"                                       SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                         INTO v_jrnl_trans_seq_no
"
"                                         FROM appl_journals
"
"                                        WHERE aj_bu = p_bu
"
"                                          AND aj_plnt = p_plnt
"
"                                          AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                          INSERT INTO appl_journals(
"
"                                                                   aj_bu                     ,
"
"                                                                   aj_plnt                   ,
"
"                                                                   aj_jrnl_trns_no           ,
"
"                                                                   aj_jrnl_trns_seq_no       ,
"
"                                                                   aj_acctg_plnt             ,
"
"                                                                   aj_gl_lvl1                ,
"
"                                                                   aj_gl_lvl2                ,
"
"                                                                   aj_gl_lvl3                ,
"
"                                                                   aj_gl_lvl4                ,
"
"                                                                   aj_gl_lvl5,
"
"                                                                   aj_gl_lvl6,
"
"                                                                   aj_cc_code,
"
"                                                                   aj_gl_acct                ,
"
"                                                                   aj_gl_acct_desc           ,
"
"                                                                   aj_reference1             ,
"
"                                                                   aj_reference2             ,
"
"                                                                   aj_fc_db_amt              ,
"
"                                                                   aj_fc_cr_amt              ,
"
"                                                                   aj_bc_db_amt              ,
"
"                                                                   aj_bc_cr_amt              ,
"
"                                                                   aj_db_ex_rate             ,
"
"                                                                   aj_cr_ex_rate             ,
"
"                                                                   aj_jrnl_date              ,
"
"                                                                   aj_jrnl_year              ,
"
"                                                                   aj_jrnl_period            ,
"
"                                                                   aj_store_id               ,
"
"                                                                   aj_store_name             ,
"
"                                                                   aj_cls_id                 ,
"
"                                                                   aj_cls_desc               ,
"
"                                                                   aj_sub_cls_id             ,
"
"                                                                   aj_sub_cls_desc           ,
"
"                                                                   aj_prod_id                ,
"
"                                                                   aj_prod_rev               ,
"
"                                                                   aj_prod_desc1             ,
"
"                                                                   aj_tc_id                  ,
"
"                                                                   aj_tc_desc                ,
"
"                                                                   aj_suplr_id               ,
"
"                                                                   aj_suplr_name             ,
"
"                                                                   aj_cust_id                ,
"
"                                                                   aj_cust_name              ,
"
"                                                                   aj_area_id                ,
"
"                                                                   aj_area_desc              ,
"
"                                                                   aj_terr_id                ,
"
"                                                                   aj_terr_desc              ,
"
"                                                                   aj_bank_id                ,
"
"                                                                   aj_bank_name              ,
"
"                                                                   aj_fa_grp_id              ,
"
"                                                                   aj_fa_grp_desc            ,
"
"                                                                   aj_fa_id                  ,
"
"                                                                   aj_fa_desc                ,
"
"                                                                   aj_dept_id                ,
"
"                                                                   aj_dept_desc              ,
"
"                                                                   aj_proj_id                ,
"
"                                                                   aj_proj_desc              ,
"
"                                                                   aj_res_grp_id             ,
"
"                                                                   aj_res_grp_desc           ,
"
"                                                                   aj_res_id                 ,
"
"                                                                   aj_res_desc               ,
"
"                                                                   aj_emp_id                 ,
"
"                                                                   aj_emp_name               ,
"
"                                                                   aj_trans_qty              ,
"
"                                                                   aj_unit_cost              ,
"
"                                                                   aj_unit_price             ,
"
"                                                                   aj_source_doc_mode        ,
"
"                                                                   aj_appl                   ,
"
"                                                                   aj_status                 ,
"
"                                                                   aj_jrnl_no                ,
"
"                                                                   aj_cre_by                 ,
"
"                                                                   aj_cre_date               ,
"
"                                                                   aj_upd_by                 ,
"
"                                                                   aj_upd_date               ,
"
"                                                                   aj_offset_doc_no          ,
"
"                                                                   aj_vou_type               ,
"
"                                                                   aj_vou_pfx                ,
"
"                                                                   aj_vou_no                 ,
"
"                                                                   aj_vou_line_no            ,
"
"                                                                   aj_ref_no                 ,
"
"                                                                   aj_ref_date,
"
"                                                                   aj_gl_lvl_prj ,
"
"                                                                   aj_gl_plnt_loc_id   ,
"
"                                                                   aj_sub_vou_type
"
"                                                                   )
"
"                                                            VALUES(
"
"                                                                   p_bu                     ,
"
"                                                                   p_plnt                   ,
"
"                                                                   v_jrnl_trans_no           ,
"
"                                                                   v_jrnl_trans_seq_no       ,
"
"                                                                   v_dbt_acct_plnt             ,
"
"                                                                   v_dbt_lvl1                ,
"
"                                                                   v_dbt_lvl2                ,
"
"                                                                   v_dbt_lvl3                ,
"
"                                                                   v_dbt_lvl4                ,
"
"                                                                   v_dbt_lvl5,
"
"                                                                   v_dbt_lvl6,
"
"                                                                   v_mat_dbt_cc_code ,
"
"                                                                   v_dbt_acct                ,
"
"                                                                   func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                                                   'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                                   'REWORK COMPLETION'             ,
"
"                                                                   ROUND((v_diff_amt),func_find_appl_rnddigit(p_bu))              ,
"
"                                                                   0              ,
"
"                                                                   ROUND(v_diff_amt,func_find_appl_rnddigit(p_bu)) ,
"
"                                                                   0              ,
"
"                                                                   1             ,
"
"                                                                   1             ,
"
"                                                                   p_trans_date              ,
"
"                                                                   func_find_year(p_bu,p_trans_date)              ,
"
"                                                                   func_find_period(p_bu,p_trans_date)            ,
"
"                                                                   NULL              ,
"
"                                                                   NULL             ,
"
"                                                                   NULL                 ,
"
"                                                                   NULL               ,
"
"                                                                   NULL           ,
"
"                                                                   NULL          ,
"
"                                                                   NULL              ,
"
"                                                                   NULL             ,
"
"                                                                   NULL            ,
"
"                                                                   NULL                  ,
"
"                                                                   NULL                ,
"
"                                                                   NULL               ,
"
"                                                                   NULL             ,
"
"                                                                   NULL                ,
"
"                                                                   NULL              ,
"
"                                                                   NULL                ,
"
"                                                                   NULL              ,
"
"                                                                   NULL                ,
"
"                                                                   NULL              ,
"
"                                                                   NULL                ,
"
"                                                                   NULL              ,
"
"                                                                   NULL              ,
"
"                                                                   NULL            ,
"
"                                                                   NULL                  ,
"
"                                                                   NULL                ,
"
"                                                                   NULL                ,
"
"                                                                   NULL              ,
"
"                                                                   NULL                ,
"
"                                                                   NULL              ,
"
"                                                                   NULL             ,
"
"                                                                   NULL           ,
"
"                                                                   NULL                 ,
"
"                                                                   NULL               ,
"
"                                                                   NULL                 ,
"
"                                                                   NULL               ,
"
"                                                                   p_comp_qty              ,
"
"                                                                   v_unit_cost             ,
"
"                                                                   v_unit_cost          ,
"
"                                                                   NULL        ,
"
"                                                                   'RR'                   ,
"
"                                                                   'N'                 ,
"
"                                                                   NULL                ,
"
"                                                                   p_user                 ,
"
"                                                                   SYSDATE               ,
"
"                                                                   NULL                 ,
"
"                                                                   NULL               ,
"
"                                                                   NULL          ,
"
"                                                                   'RWC'               ,
"
"                                                                   NULL                ,
"
"                                                                   p_trans_no                 ,
"
"                                                                   1            ,
"
"                                                                   NULL                 ,
"
"                                                                   NULL,
"
"                                                                   v_dbt_prj_lvl,
"
"                                                                   r_rwk_comp.rwochd_plnt_loc_id   ,
"
"                                                                   r_rwk_comp.rwochd_ord_type
"
"
"
"                );
"
"
"
"           ELSIF v_dbt_amt > v_crd_amt THEN
"
"
"
"             raise_application_error(-20613,'PLN');
"
"
"
"               END IF;
"
"
"
"
"
"    END proc_ins_rpr_disass_scr_jrnls;
"
"
"
"    PROCEDURE proc_ins_repair_jrnls_hist(p_bu            VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_trans_no        VARCHAR2,
"
"                                        p_trans_date    DATE,
"
"                                        p_prod_ord_no    VARCHAR2,
"
"                                        p_prod_id        VARCHAR2,
"
"                                        p_prod_rev        NUMBER,
"
"                                        p_comp_qty        NUMBER,
"
"                                        p_lang            NUMBER,
"
"                                        p_user            VARCHAR2
"
"                                        )
"
"        IS
"
"        CURSOR c_rwk_comp
"
"        IS
"
"        SELECT *
"
"          FROM rework_order_comp_hd_hist
"
"         WHERE rwochdh_bu = p_bu
"
"           AND rwochdh_plnt = p_plnt
"
"           AND rwochdh_doc_no = p_trans_no;
"
"
"
"        CURSOR c_mach
"
"        IS
"
"        SELECT *
"
"          FROM rework_ord_res_usage_hist
"
"         WHERE roruh_bu = p_bu
"
"           AND roruh_plnt = p_plnt
"
"           AND roruh_doc_no = p_trans_no;
"
"
"
"        CURSOR c_store_acct(c_store_id VARCHAR2)
"
"        IS
"
"        SELECT store_gl_acct
"
"          FROM stores
"
"         WHERE store_bu = p_bu
"
"           AND store_id = c_store_id;
"
"
"
"        CURSOR c_res_acct(c_mach_id VARCHAR2)
"
"          IS
"
"        SELECT mfgr_acct       ,
"
"               mfgr_acct_plnt  ,
"
"               mfgr_prj_lvl    ,
"
"               mfgr_lvl1       ,
"
"               mfgr_lvl2       ,
"
"               mfgr_lvl3       ,
"
"               mfgr_lvl4
"
"          FROM mfg_resources
"
"         WHERE mfgr_bu = p_bu
"
"           AND mfgr_plnt = p_plnt
"
"           AND mfgr_res_id = c_mach_id;
"
"
"
"        CURSOR c_resgrp_acct(c_mach_id VARCHAR2)
"
"           IS
"
"        SELECT mfgrg_ac_lvl1,
"
"               mfgrg_ac_lvl2,
"
"               mfgrg_ac_lvl3,
"
"               mfgrg_ac_lvl4,
"
"               mfgrg_current_acct ,
"
"               mfgrg_ac_lvl_prj,
"
"               mfgrg_acct_plnt
"
"          FROM mfg_res_groups,
"
"               mfg_resources
"
"         WHERE mfgrg_bu = mfgr_bu
"
"           AND mfgrg_plnt = mfgr_plnt
"
"           AND mfgrg_grp_id = mfgr_group_id
"
"           AND mfgrg_bu = p_bu
"
"           AND mfgrg_plnt = p_plnt
"
"           AND mfgr_bu = p_bu
"
"           AND mfgr_plnt = p_plnt
"
"           AND mfgr_res_id = c_mach_id;
"
"
"
"        CURSOR c_mat_req
"
"        IS
"
"        SELECT rocmrd_seq_no,
"
"               rocmrd_prod_id,
"
"               rocmrd_prod_rev,
"
"               rocmrd_cons_store,
"
"               store_gl_acct,
"
"               (rocmrd_cons_qty * rocmrd_unit_cost) ext_cost
"
"          FROM rework_ord_comp_mat_req_dtls,
"
"               stores
"
"         WHERE rocmrd_bu = store_bu
"
"           AND rocmrd_plnt = store_plnt
"
"           AND rocmrd_cons_store = store_id
"
"           AND ROUND((rocmrd_cons_qty * rocmrd_unit_cost),2) > 0
"
"           AND rocmrd_bu   = p_bu
"
"           AND rocmrd_plnt  = p_plnt
"
"           AND rocmrd_doc_no = p_trans_no;
"
"         /*UNION ALL
"
"        (SELECT 1 rocmrd_seq_no,
"
"               p_prod_id rocmrd_prod_id,
"
"               p_prod_rev rocmrd_prod_rev,
"
"               rwochdh_sou_store rocmrd_cons_store,
"
"               store_gl_acct,
"
"               NVL (SUM (rwochdh_trans_qty *
"
"                          DECODE(rwochdh_sf_code,NULL,func_find_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store),
"
"                              CASE WHEN rocsd_sys_ls_no IS NOT NULL THEN func_find_sfg_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store,rwochdh_prod_ord_no,rwochdh_sf_code,rocsd_sys_ls_no) ELSE func_find_sfg_unitcost(p_bu,rwochdh_prod_id,rwochdh_prod_rev,rwochdh_sou_store,rwochdh_prod_ord_no,rwochdh_sf_code,rwochdh_sys_ls_no)END))
"
"                              , 0) mat_cost
"
"                     FROM rework_order_comp_hd_hist,
"
"                          rework_order_comp_ser_dtls,
"
"                          stores
"
"                    WHERE rocsd_bu(+) = rwochdh_bu
"
"                      AND rocsd_plnt(+)  = rwochdh_plnt
"
"                      AND rocsd_doc_no(+)  = rwochdh_doc_no
"
"                      AND rwochdh_bu = store_bu
"
"                      AND rwochdh_plnt = store_plnt
"
"                      AND rwochdh_sou_store  = store_id
"
"                      AND rwochdh_bu = p_bu
"
"                      AND rwochdh_plnt = p_plnt
"
"                      AND rwochdh_ord_type NOT IN ('SC','PR')
"
"                      AND rwochdh_doc_no = p_trans_no
"
"                GROUP BY rwochdh_sou_store,store_gl_acct)
"
"        UNION ALL
"
"      (SELECT 1 rocmrd_seq_no,
"
"               p_prod_id rocmrd_prod_id,
"
"               p_prod_rev rocmrd_prod_rev,
"
"               rwochdh_sou_store rocmrd_cons_store,
"
"               store_gl_acct,
"
"               NVL (SUM (rwochdh_trans_qty * DECODE(rwochdh_ord_type, 'SC',porl_scon_mat_unit_cost, 'PR', porl_sc_unit_cost)),0) mat_cost
"
"         FROM rework_order_comp_hd_hist,
"
"              pur_ord_receipt_ln,
"
"              stores
"
"        WHERE rwochdh_bu = porl_bu
"
"          AND rwochdh_plnt = porl_plnt
"
"          AND rwochdh_source_pfx = porl_receipt_pfx
"
"          AND rwochdh_source_no = porl_receipt_no
"
"          AND rwochdh_source_line = porl_seq_no
"
"          AND rwochdh_prod_id = porl_prod_id
"
"          AND rwochdh_prod_rev = porl_prod_rev
"
"          AND rwochdh_bu = store_bu
"
"          AND rwochdh_plnt = store_plnt
"
"          AND rwochdh_bu = p_bu
"
"          AND rwochdh_plnt = p_plnt
"
"          AND rwochdh_ord_type IN ('SC','PR')
"
"          AND rwochdh_doc_no = p_trans_no
"
"        GROUP BY rwochdh_sou_store,store_gl_acct)
"
"         UNION ALL --HANDLED FOR HISTORY
"
"       (SELECT 1 rocmrd_seq_no,
"
"               p_prod_id rocmrd_prod_id,
"
"               p_prod_rev rocmrd_prod_rev,
"
"               rwochdh_sou_store rocmrd_cons_store,
"
"               store_gl_acct,
"
"               NVL (SUM (rwochdh_trans_qty * DECODE(rwochdh_ord_type, 'SC',porlh_scon_mat_unit_cost, 'PR', porlh_sc_unit_cost)),0) mat_cost
"
"          FROM rework_order_comp_hd_hist,
"
"               pur_ord_receipt_ln_hist,
"
"               stores
"
"         WHERE rwochdh_bu = porlh_bu
"
"           AND rwochdh_plnt = porlh_plnt
"
"           AND rwochdh_source_pfx = porlh_receipt_pfx
"
"           AND rwochdh_source_no = porlh_receipt_no
"
"           AND rwochdh_source_line = porlh_seq_no
"
"           AND rwochdh_prod_id = porlh_prod_id
"
"           AND rwochdh_prod_rev = porlh_prod_rev
"
"          AND  rwochdh_bu = store_bu
"
"          AND  rwochdh_plnt = store_plnt
"
"           AND rwochdh_bu = p_bu
"
"           AND rwochdh_plnt = p_plnt
"
"           AND rwochdh_ord_type IN ('SC','PR')
"
"           AND rwochdh_doc_no = p_trans_no
"
"         GROUP BY rwochdh_sou_store,store_gl_acct);*/
"
"
"
"        r_store_acct            c_store_acct%ROWTYPE;
"
"        r_rwk_comp                c_rwk_comp%ROWTYPE;
"
"        r_res_acct                c_res_acct%ROWTYPE;
"
"        r_resgrp_acct            c_resgrp_acct%ROWTYPE;
"
"        r_mach_cost                c_mach%ROWTYPE;
"
"        v_dbt_store_id            VARCHAR2(10);
"
"        v_crd_store_id            VARCHAR2(10);
"
"        v_dbt_acct                stores.store_gl_acct%TYPE;
"
"        v_dbt_prj_lvl            VARCHAR2(10);
"
"        v_dbt_lvl1                VARCHAR2(4);
"
"        v_dbt_lvl2                VARCHAR2(4);
"
"        v_dbt_lvl3                VARCHAR2(4);
"
"        v_dbt_lvl4                VARCHAR2(4);
"
"        v_dbt_lvl5                VARCHAR2(4);
"
"    v_dbt_lvl6                VARCHAR2(4);
"
"    v_mat_dbt_cc_code    VARCHAR2(20);
"
"    v_mat_crd_cc_code    VARCHAR2(20);
"
"    v_crd_lvl5                VARCHAR2(4);
"
"    v_crd_lvl6                VARCHAR2(4);
"
"        v_dbt_acct_plnt            VARCHAR2(10);
"
"        v_crd_lvl1                VARCHAR2(4);
"
"        v_crd_lvl2                VARCHAR2(4);
"
"        v_crd_lvl3                VARCHAR2(4);
"
"        v_crd_lvl4                VARCHAR2(4);
"
"        v_crd_acct_plnt            VARCHAR2(10);
"
"        v_crd_acct                stores.store_gl_acct%TYPE;
"
"        v_crd_prj_lvl            VARCHAR2(10);
"
"        v_sf_cost                NUMBER(17,5):=0;
"
"        v_mach_cost                NUMBER(17,5):=0;
"
"        v_oh_cost                NUMBER(17,5):=0;
"
"        v_unit_cost                NUMBER(17,5):=0;
"
"        v_jrnl_trans_no            VARCHAR2(15);
"
"        v_jrnl_trans_seq_no        NUMBER;
"
"
"
"
"
"        v_dbt_amt            NUMBER(17,5);
"
"        v_crd_amt            NUMBER(17,5);
"
"        v_diff_amt            NUMBER(17,5);
"
"        v_scrap_cost        NUMBER(17,5);
"
"    v_trans_seq_no        NUMBER;
"
"
"
"        BEGIN
"
"
"
"
"
"                            /*Debit Section*/
"
"
"
"            OPEN c_rwk_comp;
"
"            FETCH c_rwk_comp INTO r_rwk_comp;
"
"            CLOSE c_rwk_comp;
"
"
"
"                v_dbt_store_id := r_rwk_comp.rwochdh_target_store;
"
"
"
"                pkg_mfg_rwk_perpetual_journals.proc_rw_cal_cost_hist(p_bu,
"
"                                 p_plnt,
"
"                                 p_trans_no,
"
"                                 p_prod_id,
"
"                                 p_prod_rev,
"
"                                 p_comp_qty,
"
"                                 v_sf_cost,
"
"                                 v_mach_cost,
"
"                                 v_oh_cost,
"
"                                 v_unit_cost
"
"                                 );
"
"
"
"                --raise_application_error(-20999,'HRM'||' ' ||v_sf_cost||' ' ||v_mach_cost||' ' ||v_unit_cost);
"
"
"
"                OPEN c_store_acct(v_dbt_store_id);
"
"                FETCH c_store_acct INTO r_store_acct;
"
"                    IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                       RAISE_APPLICATION_ERROR(-20612,'ICM');
"
"                    ELSE
"
"                       v_dbt_acct := r_store_acct.store_gl_acct;
"
"                    END IF;
"
"                CLOSE c_store_acct;
"
"
"
"                proc_find_cost_center(
"
"                                      p_bu    ,
"
"                                      p_plnt  ,
"
"                                      NULL,
"
"                                      v_dbt_acct,
"
"                                      NULL ,
"
"                                      NULL ,
"
"                                      NULL ,
"
"                                      NULL ,
"
"                                      v_dbt_lvl1,
"
"                                      v_dbt_lvl2,
"
"                                      v_dbt_lvl3,
"
"                                      v_dbt_lvl4,
"
"                      v_dbt_lvl5,
"
"                      v_dbt_lvl6,
"
"                                      v_dbt_prj_lvl,
"
"                                      v_dbt_acct_plnt,
"
"                      v_mat_dbt_cc_code  ,
"
"                    r_rwk_comp.rwochdh_plnt_loc_id
"
"                                      );
"
"
"
"                IF v_dbt_lvl1 IS NULL OR v_dbt_lvl2 IS NULL OR v_dbt_lvl3 IS NULL
"
"                    OR v_dbt_lvl4 IS NULL OR v_dbt_prj_lvl IS NULL OR v_dbt_accT_plnt IS NULL  THEN
"
"                   RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                END IF;
"
"
"
"
"
"                v_jrnl_trans_no := func_find_jrnl_trans_no(p_bu,p_user);
"
"
"
"
"
"                SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                  INTO v_jrnl_trans_seq_no
"
"                  FROM appl_journals
"
"                 WHERE aj_bu = p_bu
"
"                   AND aj_plnt = p_plnt
"
"                   AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                   INSERT INTO appl_journals(
"
"                                            aj_bu                     ,
"
"                                            aj_plnt                   ,
"
"                                            aj_jrnl_trns_no           ,
"
"                                            aj_jrnl_trns_seq_no       ,
"
"                                            aj_acctg_plnt             ,
"
"                                            aj_gl_lvl1                ,
"
"                                            aj_gl_lvl2                ,
"
"                                            aj_gl_lvl3                ,
"
"                                            aj_gl_lvl4                ,
"
"                                            aj_gl_acct                ,
"
"                                            aj_gl_acct_desc           ,
"
"                                            aj_reference1             ,
"
"                                            aj_reference2             ,
"
"                                            aj_fc_db_amt              ,
"
"                                            aj_fc_cr_amt              ,
"
"                                            aj_bc_db_amt              ,
"
"                                            aj_bc_cr_amt              ,
"
"                                            aj_db_ex_rate             ,
"
"                                            aj_cr_ex_rate             ,
"
"                                            aj_jrnl_date              ,
"
"                                            aj_jrnl_year              ,
"
"                                            aj_jrnl_period            ,
"
"                                            aj_store_id               ,
"
"                                            aj_store_name             ,
"
"                                            aj_cls_id                 ,
"
"                                            aj_cls_desc               ,
"
"                                            aj_sub_cls_id             ,
"
"                                            aj_sub_cls_desc           ,
"
"                                            aj_prod_id                ,
"
"                                            aj_prod_rev               ,
"
"                                            aj_prod_desc1             ,
"
"                                            aj_tc_id                  ,
"
"                                            aj_tc_desc                ,
"
"                                            aj_suplr_id               ,
"
"                                            aj_suplr_name             ,
"
"                                            aj_cust_id                ,
"
"                                            aj_cust_name              ,
"
"                                            aj_area_id                ,
"
"                                            aj_area_desc              ,
"
"                                            aj_terr_id                ,
"
"                                            aj_terr_desc              ,
"
"                                            aj_bank_id                ,
"
"                                            aj_bank_name              ,
"
"                                            aj_fa_grp_id              ,
"
"                                            aj_fa_grp_desc            ,
"
"                                            aj_fa_id                  ,
"
"                                            aj_fa_desc                ,
"
"                                            aj_dept_id                ,
"
"                                            aj_dept_desc              ,
"
"                                            aj_proj_id                ,
"
"                                            aj_proj_desc              ,
"
"                                            aj_res_grp_id             ,
"
"                                            aj_res_grp_desc           ,
"
"                                            aj_res_id                 ,
"
"                                            aj_res_desc               ,
"
"                                            aj_emp_id                 ,
"
"                                            aj_emp_name               ,
"
"                                            aj_trans_qty              ,
"
"                                            aj_unit_cost              ,
"
"                                            aj_unit_price             ,
"
"                                            aj_source_doc_mode        ,
"
"                                            aj_appl                   ,
"
"                                            aj_status                 ,
"
"                                            aj_jrnl_no                ,
"
"                                            aj_cre_by                 ,
"
"                                            aj_cre_date               ,
"
"                                            aj_upd_by                 ,
"
"                                            aj_upd_date               ,
"
"                                            aj_offset_doc_no          ,
"
"                                            aj_vou_type               ,
"
"                                            aj_vou_pfx                ,
"
"                                            aj_vou_no                 ,
"
"                                            aj_vou_line_no            ,
"
"                                            aj_ref_no                 ,
"
"                                            aj_ref_date,
"
"                                            aj_gl_lvl_prj
"
"                                            )
"
"                                     VALUES(
"
"                                            p_bu                     ,
"
"                                            p_plnt                   ,
"
"                                            v_jrnl_trans_no           ,
"
"                                            v_jrnl_trans_seq_no       ,
"
"                                            v_dbt_acct_plnt             ,
"
"                                            v_dbt_lvl1                ,
"
"                                            v_dbt_lvl2                ,
"
"                                            v_dbt_lvl3                ,
"
"                                            v_dbt_lvl4                ,
"
"                                            v_dbt_acct                ,
"
"                                            func_find_gl_acct_desc(p_bu,v_dbt_acct,p_lang)           ,
"
"                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                            'REWORK COMPLETION'             ,
"
"                                            ROUND((v_unit_cost * p_comp_qty),func_find_appl_rnddigit(p_bu))           ,
"
"                                            0              ,
"
"                                            ROUND((v_unit_cost* p_comp_qty),func_find_appl_rnddigit(p_bu)) ,
"
"                                            0              ,
"
"                                            1             ,
"
"                                            1             ,
"
"                                            p_trans_date              ,
"
"                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                            v_dbt_store_id               ,
"
"                                            func_find_store_desc(p_bu,v_dbt_store_id,p_lang)             ,
"
"                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                            p_prod_id               ,
"
"                                            p_prod_rev              ,
"
"                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL               ,
"
"                                            NULL             ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL              ,
"
"                                            NULL            ,
"
"                                            NULL                  ,
"
"                                            NULL                ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL                ,
"
"                                            NULL              ,
"
"                                            NULL             ,
"
"                                            NULL           ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            p_comp_qty              ,
"
"                                            v_unit_cost/p_comp_qty              ,
"
"                                            v_unit_cost/p_comp_qty           ,
"
"                                            NULL        ,
"
"                                            'RR'                   ,
"
"                                            'N'                 ,
"
"                                            NULL                ,
"
"                                            p_user                 ,
"
"                                            SYSDATE               ,
"
"                                            NULL                 ,
"
"                                            NULL               ,
"
"                                            NULL          ,
"
"                                            'RCM'               ,
"
"                                            NULL                ,
"
"                                            p_trans_no                 ,
"
"                                            1            ,
"
"                                            NULL                 ,
"
"                                            NULL,
"
"                                            v_dbt_prj_lvl
"
"                                            );
"
"
"
"                        /*Credit Section*/
"
"
"
"                IF r_rwk_comp.rwochdh_sf_code IS NOT NULL THEN
"
"
"
"                    v_crd_store_id := r_rwk_comp.rwochdh_sou_store;
"
"
"
"                    OPEN c_store_acct(v_crd_store_id);
"
"                    FETCH c_store_acct INTO r_store_acct;
"
"                    IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    ELSE
"
"                       v_crd_acct := r_store_acct.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c_store_acct;
"
"
"
"
"
"                        proc_find_cost_center(
"
"                                            p_bu    ,
"
"                                            p_plnt  ,
"
"                                            NULL,
"
"                                            v_crd_acct,
"
"                                            NULL ,
"
"                                            NULL ,
"
"                                            NULL ,
"
"                                            NULL ,
"
"                                            v_crd_lvl1,
"
"                                            v_crd_lvl2,
"
"                                            v_crd_lvl3,
"
"                                            v_crd_lvl4,
"
"                        v_crd_lvl5                                        ,
"
"                        v_crd_lvl6                                        ,
"
"                                            v_crd_prj_lvl,
"
"                                            v_crd_acct_plnt ,
"
"                        v_mat_crd_cc_code    ,
"
"                        r_rwk_comp.rwochdh_plnt_loc_id
"
"                                            );
"
"
"
"
"
"                        IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                            OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                           RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                        END IF;
"
"
"
"
"
"                                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                      INTO v_jrnl_trans_seq_no
"
"                                      FROM appl_journals
"
"                                     WHERE aj_bu = p_bu
"
"                                       AND aj_plnt = p_plnt
"
"                                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                    INSERT INTO appl_journals(
"
"                                                            aj_bu                     ,
"
"                                                            aj_plnt                   ,
"
"                                                            aj_jrnl_trns_no           ,
"
"                                                            aj_jrnl_trns_seq_no       ,
"
"                                                            aj_acctg_plnt             ,
"
"                                                            aj_gl_lvl1                ,
"
"                                                            aj_gl_lvl2                ,
"
"                                                            aj_gl_lvl3                ,
"
"                                                            aj_gl_lvl4                ,
"
"                                                            aj_gl_acct                ,
"
"                                                            aj_gl_acct_desc           ,
"
"                                                            aj_reference1             ,
"
"                                                            aj_reference2             ,
"
"                                                            aj_fc_db_amt              ,
"
"                                                            aj_fc_cr_amt              ,
"
"                                                            aj_bc_db_amt              ,
"
"                                                            aj_bc_cr_amt              ,
"
"                                                            aj_db_ex_rate             ,
"
"                                                            aj_cr_ex_rate             ,
"
"                                                            aj_jrnl_date              ,
"
"                                                            aj_jrnl_year              ,
"
"                                                            aj_jrnl_period            ,
"
"                                                            aj_store_id               ,
"
"                                                            aj_store_name             ,
"
"                                                            aj_cls_id                 ,
"
"                                                            aj_cls_desc               ,
"
"                                                            aj_sub_cls_id             ,
"
"                                                            aj_sub_cls_desc           ,
"
"                                                            aj_prod_id                ,
"
"                                                            aj_prod_rev               ,
"
"                                                            aj_prod_desc1             ,
"
"                                                            aj_tc_id                  ,
"
"                                                            aj_tc_desc                ,
"
"                                                            aj_suplr_id               ,
"
"                                                            aj_suplr_name             ,
"
"                                                            aj_cust_id                ,
"
"                                                            aj_cust_name              ,
"
"                                                            aj_area_id                ,
"
"                                                            aj_area_desc              ,
"
"                                                            aj_terr_id                ,
"
"                                                            aj_terr_desc              ,
"
"                                                            aj_bank_id                ,
"
"                                                            aj_bank_name              ,
"
"                                                            aj_fa_grp_id              ,
"
"                                                            aj_fa_grp_desc            ,
"
"                                                            aj_fa_id                  ,
"
"                                                            aj_fa_desc                ,
"
"                                                            aj_dept_id                ,
"
"                                                            aj_dept_desc              ,
"
"                                                            aj_proj_id                ,
"
"                                                            aj_proj_desc              ,
"
"                                                            aj_res_grp_id             ,
"
"                                                            aj_res_grp_desc           ,
"
"                                                            aj_res_id                 ,
"
"                                                            aj_res_desc               ,
"
"                                                            aj_emp_id                 ,
"
"                                                            aj_emp_name               ,
"
"                                                            aj_trans_qty              ,
"
"                                                            aj_unit_cost              ,
"
"                                                            aj_unit_price             ,
"
"                                                            aj_source_doc_mode        ,
"
"                                                            aj_appl                   ,
"
"                                                            aj_status                 ,
"
"                                                            aj_jrnl_no                ,
"
"                                                            aj_cre_by                 ,
"
"                                                            aj_cre_date               ,
"
"                                                            aj_upd_by                 ,
"
"                                                            aj_upd_date               ,
"
"                                                            aj_offset_doc_no          ,
"
"                                                            aj_vou_type               ,
"
"                                                            aj_vou_pfx                ,
"
"                                                            aj_vou_no                 ,
"
"                                                            aj_vou_line_no            ,
"
"                                                            aj_ref_no                 ,
"
"                                                            aj_ref_date,
"
"                                                            aj_gl_lvl_prj
"
"                                                            )
"
"                                                      VALUES(
"
"                                                            p_bu                     ,
"
"                                                            p_plnt                   ,
"
"                                                            v_jrnl_trans_no           ,
"
"                                                            v_jrnl_trans_seq_no       ,
"
"                                                            v_crd_acct_plnt             ,
"
"                                                            v_crd_lvl1                ,
"
"                                                            v_crd_lvl2                ,
"
"                                                            v_crd_lvl3                ,
"
"                                                            v_crd_lvl4                ,
"
"                                                            v_crd_acct                ,
"
"                                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                            'REWORK COMPLETION '             ,
"
"                                                            0              ,
"
"                                                            ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                            0 ,
"
"                                                            ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                            1             ,
"
"                                                            1             ,
"
"                                                            p_trans_date              ,
"
"                                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                                            v_crd_store_id               ,
"
"                                                            func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                            func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                                            func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                                            p_prod_id              ,
"
"                                                            p_prod_rev               ,
"
"                                                            func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                                            NULL                  ,
"
"                                                            NULL                ,
"
"                                                            NULL               ,
"
"                                                            NULL             ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL              ,
"
"                                                            NULL            ,
"
"                                                            NULL                  ,
"
"                                                            NULL                ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL             ,
"
"                                                            NULL           ,
"
"                                                            NULL                 ,
"
"                                                            NULL               ,
"
"                                                            NULL                 ,
"
"                                                            NULL               ,
"
"                                                            p_comp_qty             ,
"
"                                                            v_sf_cost/p_comp_qty              ,
"
"                                                            v_sf_cost/p_comp_qty          ,
"
"                                                            NULL        ,
"
"                                                            'RR'                   ,
"
"                                                            'N'                 ,
"
"                                                            NULL                ,
"
"                                                            p_user                 ,
"
"                                                            SYSDATE               ,
"
"                                                            NULL                 ,
"
"                                                            NULL               ,
"
"                                                            NULL          ,
"
"                                                            'RCM'               ,
"
"                                                            NULL                ,
"
"                                                            p_trans_no                 ,
"
"                                                            1            ,
"
"                                                            NULL                 ,
"
"                                                            NULL,
"
"                                                            v_crd_prj_lvl
"
"                                                             );
"
"                    END IF;
"
"
"
"                    IF r_rwk_comp.rwochdh_sf_code IS  NULL THEN
"
"
"
"                                        v_crd_store_id := r_rwk_comp.rwochdh_sou_store;
"
"
"
"                                        OPEN c_store_acct(v_crd_store_id);
"
"                                        FETCH c_store_acct INTO r_store_acct;
"
"                                        IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                                            RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                                        ELSE
"
"                                           v_crd_acct := r_store_acct.store_gl_acct;
"
"                                        END IF;
"
"                                        CLOSE c_store_acct;
"
"
"
"
"
"                                            proc_find_cost_center(
"
"                                                                p_bu    ,
"
"                                                                p_plnt  ,
"
"                                                                NULL,
"
"                                                                v_crd_acct,
"
"                                                                NULL ,
"
"                                                                NULL ,
"
"                                                                NULL ,
"
"                                                                NULL ,
"
"                                                                v_crd_lvl1,
"
"                                                                v_crd_lvl2,
"
"                                                                v_crd_lvl3,
"
"                                                                v_crd_lvl4,
"
"                                                                v_crd_lvl5                                        ,
"
"                        v_crd_lvl6                                        ,
"
"                                            v_crd_prj_lvl,
"
"                                            v_crd_acct_plnt ,
"
"                        v_mat_crd_cc_code    ,
"
"                        r_rwk_comp.rwochdh_plnt_loc_id
"
"                                                                );
"
"
"
"
"
"                                            IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                                                OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                                               RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                                            END IF;
"
"
"
"
"
"                                                        SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                                          INTO v_jrnl_trans_seq_no
"
"                                                          FROM appl_journals
"
"                                                         WHERE aj_bu = p_bu
"
"                                                           AND aj_plnt = p_plnt
"
"                                                           AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                                        INSERT INTO appl_journals(
"
"                                                                                aj_bu                     ,
"
"                                                                                aj_plnt                   ,
"
"                                                                                aj_jrnl_trns_no           ,
"
"                                                                                aj_jrnl_trns_seq_no       ,
"
"                                                                                aj_acctg_plnt             ,
"
"                                                                                aj_gl_lvl1                ,
"
"                                                                                aj_gl_lvl2                ,
"
"                                                                                aj_gl_lvl3                ,
"
"                                                                                aj_gl_lvl4                ,
"
"                                                                                aj_gl_acct                ,
"
"                                                                                aj_gl_acct_desc           ,
"
"                                                                                aj_reference1             ,
"
"                                                                                aj_reference2             ,
"
"                                                                                aj_fc_db_amt              ,
"
"                                                                                aj_fc_cr_amt              ,
"
"                                                                                aj_bc_db_amt              ,
"
"                                                                                aj_bc_cr_amt              ,
"
"                                                                                aj_db_ex_rate             ,
"
"                                                                                aj_cr_ex_rate             ,
"
"                                                                                aj_jrnl_date              ,
"
"                                                                                aj_jrnl_year              ,
"
"                                                                                aj_jrnl_period            ,
"
"                                                                                aj_store_id               ,
"
"                                                                                aj_store_name             ,
"
"                                                                                aj_cls_id                 ,
"
"                                                                                aj_cls_desc               ,
"
"                                                                                aj_sub_cls_id             ,
"
"                                                                                aj_sub_cls_desc           ,
"
"                                                                                aj_prod_id                ,
"
"                                                                                aj_prod_rev               ,
"
"                                                                                aj_prod_desc1             ,
"
"                                                                                aj_tc_id                  ,
"
"                                                                                aj_tc_desc                ,
"
"                                                                                aj_suplr_id               ,
"
"                                                                                aj_suplr_name             ,
"
"                                                                                aj_cust_id                ,
"
"                                                                                aj_cust_name              ,
"
"                                                                                aj_area_id                ,
"
"                                                                                aj_area_desc              ,
"
"                                                                                aj_terr_id                ,
"
"                                                                                aj_terr_desc              ,
"
"                                                                                aj_bank_id                ,
"
"                                                                                aj_bank_name              ,
"
"                                                                                aj_fa_grp_id              ,
"
"                                                                                aj_fa_grp_desc            ,
"
"                                                                                aj_fa_id                  ,
"
"                                                                                aj_fa_desc                ,
"
"                                                                                aj_dept_id                ,
"
"                                                                                aj_dept_desc              ,
"
"                                                                                aj_proj_id                ,
"
"                                                                                aj_proj_desc              ,
"
"                                                                                aj_res_grp_id             ,
"
"                                                                                aj_res_grp_desc           ,
"
"                                                                                aj_res_id                 ,
"
"                                                                                aj_res_desc               ,
"
"                                                                                aj_emp_id                 ,
"
"                                                                                aj_emp_name               ,
"
"                                                                                aj_trans_qty              ,
"
"                                                                                aj_unit_cost              ,
"
"                                                                                aj_unit_price             ,
"
"                                                                                aj_source_doc_mode        ,
"
"                                                                                aj_appl                   ,
"
"                                                                                aj_status                 ,
"
"                                                                                aj_jrnl_no                ,
"
"                                                                                aj_cre_by                 ,
"
"                                                                                aj_cre_date               ,
"
"                                                                                aj_upd_by                 ,
"
"                                                                                aj_upd_date               ,
"
"                                                                                aj_offset_doc_no          ,
"
"                                                                                aj_vou_type               ,
"
"                                                                                aj_vou_pfx                ,
"
"                                                                                aj_vou_no                 ,
"
"                                                                                aj_vou_line_no            ,
"
"                                                                                aj_ref_no                 ,
"
"                                                                                aj_ref_date,
"
"                                                                                aj_gl_lvl_prj
"
"                                                                                )
"
"                                                                          VALUES(
"
"                                                                                p_bu                     ,
"
"                                                                                p_plnt                   ,
"
"                                                                                v_jrnl_trans_no           ,
"
"                                                                                v_jrnl_trans_seq_no       ,
"
"                                                                                v_crd_acct_plnt             ,
"
"                                                                                v_crd_lvl1                ,
"
"                                                                                v_crd_lvl2                ,
"
"                                                                                v_crd_lvl3                ,
"
"                                                                                v_crd_lvl4                ,
"
"                                                                                v_crd_acct                ,
"
"                                                                                func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                                                'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                                                'REWORK COMPLETION '             ,
"
"                                                                                0              ,
"
"                                                                                ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                                                0 ,
"
"                                                                                ROUND(v_sf_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                                                1             ,
"
"                                                                                1             ,
"
"                                                                                p_trans_date              ,
"
"                                                                                func_find_year(p_bu,p_trans_date)              ,
"
"                                                                                func_find_period(p_bu,p_trans_date)            ,
"
"                                                                                v_crd_store_id               ,
"
"                                                                                func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                                                func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev)                 ,
"
"                                                                                func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)               ,
"
"                                                                                func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev)             ,
"
"                                                                                func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,p_prod_id,p_prod_rev) ,p_lang)           ,
"
"                                                                                p_prod_id              ,
"
"                                                                                p_prod_rev               ,
"
"                                                                                func_find_prod_desc(p_bu,p_prod_id,p_prod_rev,p_lang)             ,
"
"                                                                                NULL                  ,
"
"                                                                                NULL                ,
"
"                                                                                NULL               ,
"
"                                                                                NULL             ,
"
"                                                                                NULL                ,
"
"                                                                                NULL              ,
"
"                                                                                NULL                ,
"
"                                                                                NULL              ,
"
"                                                                                NULL                ,
"
"                                                                                NULL              ,
"
"                                                                                NULL                ,
"
"                                                                                NULL              ,
"
"                                                                                NULL              ,
"
"                                                                                NULL            ,
"
"                                                                                NULL                  ,
"
"                                                                                NULL                ,
"
"                                                                                NULL                ,
"
"                                                                                NULL              ,
"
"                                                                                NULL                ,
"
"                                                                                NULL              ,
"
"                                                                                NULL             ,
"
"                                                                                NULL           ,
"
"                                                                                NULL                 ,
"
"                                                                                NULL               ,
"
"                                                                                NULL                 ,
"
"                                                                                NULL               ,
"
"                                                                                p_comp_qty             ,
"
"                                                                                v_sf_cost/p_comp_qty              ,
"
"                                                                                v_sf_cost/p_comp_qty          ,
"
"                                                                                NULL        ,
"
"                                                                                'RR'                   ,
"
"                                                                                'N'                 ,
"
"                                                                                NULL                ,
"
"                                                                                p_user                 ,
"
"                                                                                SYSDATE               ,
"
"                                                                                NULL                 ,
"
"                                                                                NULL               ,
"
"                                                                                NULL          ,
"
"                                                                                'RCM'               ,
"
"                                                                                NULL                ,
"
"                                                                                p_trans_no                 ,
"
"                                                                                1            ,
"
"                                                                                NULL                 ,
"
"                                                                                NULL,
"
"                                                                                v_crd_prj_lvl
"
"                                                                                 );
"
"                    END IF;
"
"
"
"                FOR r_mach_cost IN c_mach
"
"                LOOP
"
"
"
"
"
"
"
"                    OPEN c_res_acct(r_mach_cost.roruh_res_id);
"
"                    FETCH c_res_acct INTO r_res_acct;
"
"
"
"                        IF c_res_acct%NOTFOUND OR
"
"                            r_res_acct.mfgr_acct IS NULL OR r_res_acct.mfgr_acct_plnt IS NULL OR r_res_acct.mfgr_prj_lvl IS NULL OR
"
"                            r_res_acct.mfgr_lvl1 IS NULL OR r_res_acct.mfgr_lvl2 IS NULL OR r_res_acct.mfgr_lvl3 IS NULL OR r_res_acct.mfgr_lvl4 IS NULL THEN
"
"
"
"                            OPEN c_resgrp_acct(r_mach_cost.roruh_res_id);
"
"                            FETCH c_resgrp_acct INTO r_resgrp_acct;
"
"                                IF c_resgrp_acct%NOTFOUND OR r_resgrp_acct.mfgrg_ac_lvl1 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl2 IS NULL OR r_resgrp_acct.mfgrg_ac_lvl3 IS NULL
"
"                                           OR r_resgrp_acct.mfgrg_ac_lvl4 IS NULL OR r_resgrp_acct.mfgrg_current_acct IS NULL OR r_resgrp_acct.mfgrg_ac_lvl_prj IS NULL
"
"                                           OR r_resgrp_acct.mfgrg_acct_plnt IS NULL THEN
"
"
"
"                                    raise_application_error(-20002,'APM');
"
"                                ELSE
"
"
"
"                                    v_crd_acct := r_resgrp_acct.mfgrg_current_acct;
"
"                                    v_crd_acct_plnt := r_resgrp_acct.mfgrg_acct_plnt;
"
"                                    v_crd_lvl1 := r_resgrp_acct.mfgrg_ac_lvl1;
"
"                                    v_crd_lvl2 := r_resgrp_acct.mfgrg_ac_lvl2;
"
"                                    v_crd_lvl3 := r_resgrp_acct.mfgrg_ac_lvl3;
"
"                                    v_crd_lvl4 := r_resgrp_acct.mfgrg_ac_lvl4;
"
"                                    v_crd_prj_lvl := r_resgrp_acct.mfgrg_ac_lvl_prj;
"
"
"
"                                END IF;
"
"                            CLOSE c_resgrp_acct;
"
"                        ELSE
"
"
"
"                                    v_crd_acct := r_res_acct.mfgr_acct;
"
"                                    v_crd_acct_plnt := r_res_acct.mfgr_acct_plnt;
"
"                                    v_crd_lvl1 := r_res_acct.mfgr_lvl1;
"
"                                    v_crd_lvl2 := r_res_acct.mfgr_lvl2;
"
"                                    v_crd_lvl3 := r_res_acct.mfgr_lvl3;
"
"                                    v_crd_lvl4 := r_res_acct.mfgr_lvl4;
"
"                                    v_crd_prj_lvl := r_res_acct.mfgr_prj_lvl;
"
"
"
"                        END IF;
"
"
"
"                    CLOSE c_res_acct;
"
"
"
"
"
"
"
"                    IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                            OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_accT_plnt IS NULL  THEN
"
"                           RAISE_APPLICATION_ERROR(-20002,'APM'||' ' ||r_mach_cost.roruh_res_id);
"
"                    END IF;
"
"
"
"                        SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                          INTO v_jrnl_trans_seq_no
"
"                          FROM appl_journals
"
"                         WHERE aj_bu = p_bu
"
"                           AND aj_plnt = p_plnt
"
"                           AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                        INSERT INTO appl_journals(
"
"                                                aj_bu                     ,
"
"                                                aj_plnt                   ,
"
"                                                aj_jrnl_trns_no           ,
"
"                                                aj_jrnl_trns_seq_no       ,
"
"                                                aj_acctg_plnt             ,
"
"                                                aj_gl_lvl1                ,
"
"                                                aj_gl_lvl2                ,
"
"                                                aj_gl_lvl3                ,
"
"                                                aj_gl_lvl4                ,
"
"                                                aj_gl_acct                ,
"
"                                                aj_gl_acct_desc           ,
"
"                                                aj_reference1             ,
"
"                                                aj_reference2             ,
"
"                                                aj_fc_db_amt              ,
"
"                                                aj_fc_cr_amt              ,
"
"                                                aj_bc_db_amt              ,
"
"                                                aj_bc_cr_amt              ,
"
"                                                aj_db_ex_rate             ,
"
"                                                aj_cr_ex_rate             ,
"
"                                                aj_jrnl_date              ,
"
"                                                aj_jrnl_year              ,
"
"                                                aj_jrnl_period            ,
"
"                                                aj_store_id               ,
"
"                                                aj_store_name             ,
"
"                                                aj_cls_id                 ,
"
"                                                aj_cls_desc               ,
"
"                                                aj_sub_cls_id             ,
"
"                                                aj_sub_cls_desc           ,
"
"                                                aj_prod_id                ,
"
"                                                aj_prod_rev               ,
"
"                                                aj_prod_desc1             ,
"
"                                                aj_tc_id                  ,
"
"                                                aj_tc_desc                ,
"
"                                                aj_suplr_id               ,
"
"                                                aj_suplr_name             ,
"
"                                                aj_cust_id                ,
"
"                                                aj_cust_name              ,
"
"                                                aj_area_id                ,
"
"                                                aj_area_desc              ,
"
"                                                aj_terr_id                ,
"
"                                                aj_terr_desc              ,
"
"                                                aj_bank_id                ,
"
"                                                aj_bank_name              ,
"
"                                                aj_fa_grp_id              ,
"
"                                                aj_fa_grp_desc            ,
"
"                                                aj_fa_id                  ,
"
"                                                aj_fa_desc                ,
"
"                                                aj_dept_id                ,
"
"                                                aj_dept_desc              ,
"
"                                                aj_proj_id                ,
"
"                                                aj_proj_desc              ,
"
"                                                aj_res_grp_id             ,
"
"                                                aj_res_grp_desc           ,
"
"                                                aj_res_id                 ,
"
"                                                aj_res_desc               ,
"
"                                                aj_emp_id                 ,
"
"                                                aj_emp_name               ,
"
"                                                aj_trans_qty              ,
"
"                                                aj_unit_cost              ,
"
"                                                aj_unit_price             ,
"
"                                                aj_source_doc_mode        ,
"
"                                                aj_appl                   ,
"
"                                                aj_status                 ,
"
"                                                aj_jrnl_no                ,
"
"                                                aj_cre_by                 ,
"
"                                                aj_cre_date               ,
"
"                                                aj_upd_by                 ,
"
"                                                aj_upd_date               ,
"
"                                                aj_offset_doc_no          ,
"
"                                                aj_vou_type               ,
"
"                                                aj_vou_pfx                ,
"
"                                                aj_vou_no                 ,
"
"                                                aj_vou_line_no            ,
"
"                                                aj_ref_no                 ,
"
"                                                aj_ref_date,
"
"                                                aj_gl_lvl_prj
"
"                                                )
"
"                                         VALUES(
"
"                                                p_bu                     ,
"
"                                                p_plnt                   ,
"
"                                                v_jrnl_trans_no           ,
"
"                                                v_jrnl_trans_seq_no       ,
"
"                                                v_crd_acct_plnt             ,
"
"                                                v_crd_lvl1                ,
"
"                                                v_crd_lvl2                ,
"
"                                                v_crd_lvl3                ,
"
"                                                v_crd_lvl4                ,
"
"                                                v_crd_acct                ,
"
"                                                func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                'REWORK COMPLETION'             ,
"
"                                                0              ,
"
"                                                ROUND((r_mach_cost.roruh_units * r_mach_cost.roruh_hrly_rate),func_find_appl_rnddigit(p_bu))              ,
"
"                                                0 ,
"
"                                                ROUND((r_mach_cost.roruh_units * r_mach_cost.roruh_hrly_rate),func_find_appl_rnddigit(p_bu))             ,
"
"                                                1             ,
"
"                                                1             ,
"
"                                                p_trans_date              ,
"
"                                                func_find_year(p_bu,p_trans_date)              ,
"
"                                                func_find_period(p_bu,p_trans_date)            ,
"
"                                                NULL               ,
"
"                                                NULL             ,
"
"                                                NULL                ,
"
"                                                NULL,
"
"                                                NULL            ,
"
"                                                NULL    ,
"
"                                                NULL           ,
"
"                                                NULL              ,
"
"                                                NULL           ,
"
"                                                NULL                  ,
"
"                                                NULL                ,
"
"                                                NULL               ,
"
"                                                NULL             ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL              ,
"
"                                                NULL            ,
"
"                                                NULL                  ,
"
"                                                NULL                ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL                ,
"
"                                                NULL              ,
"
"                                                NULL             ,
"
"                                                NULL           ,
"
"                                                NULL                 ,
"
"                                                NULL               ,
"
"                                                NULL                 ,
"
"                                                NULL               ,
"
"                                                p_comp_qty             ,
"
"                                                (r_mach_cost.roruh_units * r_mach_cost.roruh_hrly_rate)   /p_comp_qty          ,
"
"                                                (r_mach_cost.roruh_units * r_mach_cost.roruh_hrly_rate)   /p_comp_qty      ,
"
"                                                NULL        ,
"
"                                                'RR'                   ,
"
"                                                'N'                 ,
"
"                                                NULL                ,
"
"                                                p_user                 ,
"
"                                                SYSDATE               ,
"
"                                                NULL                 ,
"
"                                                NULL               ,
"
"                                                NULL          ,
"
"                                                'RCM'               ,
"
"                                                NULL                ,
"
"                                                p_trans_no                 ,
"
"                                                1            ,
"
"                                                NULL                 ,
"
"                                                NULL,
"
"                                                v_crd_prj_lvl
"
"                                                 );
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
"                END LOOP c_mach;
"
"
"
"                FOR r_mat_req IN c_mat_req
"
"                LOOP
"
"
"
"                        v_crd_store_id := r_mat_req.rocmrd_cons_store;
"
"
"
"                    OPEN c_store_acct(v_crd_store_id);
"
"                    FETCH c_store_acct INTO r_store_acct;
"
"                    IF c_store_acct%NOTFOUND OR r_store_acct.store_gl_acct IS NULL THEN
"
"                        RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                    ELSE
"
"                       v_crd_acct := r_store_acct.store_gl_acct;
"
"                    END IF;
"
"                    CLOSE c_store_acct;
"
"
"
"
"
"                        proc_find_cost_center(
"
"                                            p_bu    ,
"
"                                            p_plnt  ,
"
"                                            NULL,
"
"                                            v_crd_acct,
"
"                                            NULL ,
"
"                                            NULL ,
"
"                                            NULL ,
"
"                                            NULL ,
"
"                                            v_crd_lvl1,
"
"                                            v_crd_lvl2,
"
"                                            v_crd_lvl3,
"
"                                            v_crd_lvl4,
"
"                        v_crd_lvl5,
"
"                        v_crd_lvl6,
"
"                                            v_crd_prj_lvl,
"
"                                            v_crd_acct_plnt,
"
"                        v_mat_crd_cc_code    ,
"
"                        r_rwk_comp.rwochdh_plnt_loc_id
"
"                                            );
"
"
"
"
"
"                        IF v_crd_lvl1 IS NULL OR v_crd_lvl2 IS NULL OR v_crd_lvl3 IS NULL
"
"                            OR v_crd_lvl4 IS NULL OR v_crd_prj_lvl IS NULL OR v_crd_acct_plnt IS NULL  THEN
"
"                           RAISE_APPLICATION_ERROR(-20002,'APM');
"
"                        END IF;
"
"
"
"
"
"                                    SELECT NVL(MAX(aj_jrnl_trns_seq_no),0) + 1
"
"                                      INTO v_jrnl_trans_seq_no
"
"                                      FROM appl_journals
"
"                                     WHERE aj_bu = p_bu
"
"                                       AND aj_plnt = p_plnt
"
"                                       AND aj_jrnl_trns_no = v_jrnl_trans_no;
"
"
"
"
"
"                                    INSERT INTO appl_journals(
"
"                                                            aj_bu                     ,
"
"                                                            aj_plnt                   ,
"
"                                                            aj_jrnl_trns_no           ,
"
"                                                            aj_jrnl_trns_seq_no       ,
"
"                                                            aj_acctg_plnt             ,
"
"                                                            aj_gl_lvl1                ,
"
"                                                            aj_gl_lvl2                ,
"
"                                                            aj_gl_lvl3                ,
"
"                                                            aj_gl_lvl4                ,
"
"                                                            aj_gl_acct                ,
"
"                                                            aj_gl_acct_desc           ,
"
"                                                            aj_reference1             ,
"
"                                                            aj_reference2             ,
"
"                                                            aj_fc_db_amt              ,
"
"                                                            aj_fc_cr_amt              ,
"
"                                                            aj_bc_db_amt              ,
"
"                                                            aj_bc_cr_amt              ,
"
"                                                            aj_db_ex_rate             ,
"
"                                                            aj_cr_ex_rate             ,
"
"                                                            aj_jrnl_date              ,
"
"                                                            aj_jrnl_year              ,
"
"                                                            aj_jrnl_period            ,
"
"                                                            aj_store_id               ,
"
"                                                            aj_store_name             ,
"
"                                                            aj_cls_id                 ,
"
"                                                            aj_cls_desc               ,
"
"                                                            aj_sub_cls_id             ,
"
"                                                            aj_sub_cls_desc           ,
"
"                                                            aj_prod_id                ,
"
"                                                            aj_prod_rev               ,
"
"                                                            aj_prod_desc1             ,
"
"                                                            aj_tc_id                  ,
"
"                                                            aj_tc_desc                ,
"
"                                                            aj_suplr_id               ,
"
"                                                            aj_suplr_name             ,
"
"                                                            aj_cust_id                ,
"
"                                                            aj_cust_name              ,
"
"                                                            aj_area_id                ,
"
"                                                            aj_area_desc              ,
"
"                                                            aj_terr_id                ,
"
"                                                            aj_terr_desc              ,
"
"                                                            aj_bank_id                ,
"
"                                                            aj_bank_name              ,
"
"                                                            aj_fa_grp_id              ,
"
"                                                            aj_fa_grp_desc            ,
"
"                                                            aj_fa_id                  ,
"
"                                                            aj_fa_desc                ,
"
"                                                            aj_dept_id                ,
"
"                                                            aj_dept_desc              ,
"
"                                                            aj_proj_id                ,
"
"                                                            aj_proj_desc              ,
"
"                                                            aj_res_grp_id             ,
"
"                                                            aj_res_grp_desc           ,
"
"                                                            aj_res_id                 ,
"
"                                                            aj_res_desc               ,
"
"                                                            aj_emp_id                 ,
"
"                                                            aj_emp_name               ,
"
"                                                            aj_trans_qty              ,
"
"                                                            aj_unit_cost              ,
"
"                                                            aj_unit_price             ,
"
"                                                            aj_source_doc_mode        ,
"
"                                                            aj_appl                   ,
"
"                                                            aj_status                 ,
"
"                                                            aj_jrnl_no                ,
"
"                                                            aj_cre_by                 ,
"
"                                                            aj_cre_date               ,
"
"                                                            aj_upd_by                 ,
"
"                                                            aj_upd_date               ,
"
"                                                            aj_offset_doc_no          ,
"
"                                                            aj_vou_type               ,
"
"                                                            aj_vou_pfx                ,
"
"                                                            aj_vou_no                 ,
"
"                                                            aj_vou_line_no            ,
"
"                                                            aj_ref_no                 ,
"
"                                                            aj_ref_date,
"
"                                                            aj_gl_lvl_prj
"
"                                                            )
"
"                                                      VALUES(
"
"                                                            p_bu                     ,
"
"                                                            p_plnt                   ,
"
"                                                            v_jrnl_trans_no           ,
"
"                                                            v_jrnl_trans_seq_no       ,
"
"                                                            v_crd_acct_plnt             ,
"
"                                                            v_crd_lvl1                ,
"
"                                                            v_crd_lvl2                ,
"
"                                                            v_crd_lvl3                ,
"
"                                                            v_crd_lvl4                ,
"
"                                                            v_crd_acct                ,
"
"                                                            func_find_gl_acct_desc(p_bu,v_crd_acct,p_lang)           ,
"
"                                                            'REWORK COMPLETION ('||p_trans_no  ||')'           ,
"
"                                                            'REWORK COMPLETION '             ,
"
"                                                            0              ,
"
"                                                            ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))             ,
"
"                                                            0 ,
"
"                                                            ROUND(r_mat_req.ext_cost,func_find_appl_rnddigit(p_bu))                 ,
"
"                                                            1             ,
"
"                                                            1             ,
"
"                                                            p_trans_date              ,
"
"                                                            func_find_year(p_bu,p_trans_date)              ,
"
"                                                            func_find_period(p_bu,p_trans_date)            ,
"
"                                                            v_crd_store_id               ,
"
"                                                            func_find_store_desc(p_bu,v_crd_store_id,p_lang)             ,
"
"                                                            func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)                 ,
"
"                                                            func_find_class_desc(p_bu,func_find_product_class(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)               ,
"
"                                                            func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev)             ,
"
"                                                            func_find_subclass_desc(p_bu,func_find_product_subclass(p_bu,p_plnt,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev) ,p_lang)           ,
"
"                                                            r_mat_req.rocmrd_prod_id              ,
"
"                                                            r_mat_req.rocmrd_prod_rev               ,
"
"                                                            func_find_prod_desc(p_bu,r_mat_req.rocmrd_prod_id,r_mat_req.rocmrd_prod_rev,p_lang)             ,
"
"                                                            NULL                  ,
"
"                                                            NULL                ,
"
"                                                            NULL               ,
"
"                                                            NULL             ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL              ,
"
"                                                            NULL            ,
"
"                                                            NULL                  ,
"
"                                                            NULL                ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL                ,
"
"                                                            NULL              ,
"
"                                                            NULL             ,
"
"                                                            NULL           ,
"
"                                                            NULL                 ,
"
"                                                            NULL               ,
"
"                                                            NULL                 ,
"
"                                                            NULL               ,
"
"                                                            p_comp_qty             ,
"
"                                                            r_mat_req.ext_cost/p_comp_qty              ,
"
"                                                            r_mat_req.ext_cost/p_comp_qty          ,
"
"                                                            NULL        ,
"
"                                                            'RR'                   ,
"
"                                                            'N'                 ,
"
"                                                            NULL                ,
"
"                                                            p_user                 ,
"
"                                                            SYSDATE               ,
"
"                                                            NULL                 ,
"
"                                                            NULL               ,
"
"                                                            NULL          ,
"
"                                                            'RCM'               ,
"
"                                                            NULL                ,
"
"                                                            p_trans_no                 ,
"
"                                                            1            ,
"
"                                                            NULL                 ,
"
"                                                            NULL,
"
"                                                            v_crd_prj_lvl
"
"                                                             );
"
"
"
"                END LOOP;
"
"
"
"                  /* diff update */
"
"
"
"
"
"                                         SELECT NVL(SUM(aj_bc_db_amt),0) db_amt,NVL(SUM(aj_bc_cr_amt),0) cr_amt
"
"                                          INTO v_dbt_amt,v_crd_amt
"
"                                          FROM appl_journals
"
"                                         WHERE aj_bu = p_bu
"
"                                          AND  aj_plnt = p_plnt
"
"                                          AND aj_vou_no = p_trans_no
"
"                                          AND aj_appl = 'RR'
"
"                                          AND aj_vou_type = 'RCM';
"
"
"
"
"
"
"
"                                          IF v_dbt_amt > v_crd_amt THEN
"
"                                        v_diff_amt := v_dbt_amt - v_crd_amt;
"
"                                          IF v_diff_amt < 1 THEN
"
"
"
"                                        SELECT MIN(aj_jrnl_trns_seq_no)
"
"                                          INTO v_trans_seq_no
"
"                                          FROM appl_journals
"
"                                         WHERE aj_bu = p_bu
"
"                                           AND aj_plnt = p_plnt
"
"                                           AND aj_vou_no = p_trans_no
"
"                                           AND aj_appl = 'RR'
"
"                                           AND aj_vou_type = 'RCM'
"
"                                           AND aj_bc_db_amt > 0;
"
"
"
"
"
"
"
"                                           UPDATE appl_journals
"
"                                            SET aj_bc_db_amt = aj_bc_db_amt - v_diff_amt,
"
"                                            aj_fc_db_amt = aj_fc_db_amt - v_diff_amt,
"
"                                            aj_upd_by = p_user,
"
"                                            aj_upd_date = SYSDATE
"
"                                           WHERE aj_bu = p_bu
"
"                                             AND aj_plnt = p_plnt
"
"                                             AND aj_vou_no = p_trans_no
"
"                                             AND aj_appl = 'RR'
"
"                                             AND aj_vou_type = 'RCM'
"
"                                             AND aj_bc_db_amt > 0
"
"                                             AND aj_jrnl_trns_seq_no = v_trans_seq_no;
"
"                                        END IF;
"
"
"
"                               ELSIF v_dbt_amt < v_crd_amt THEN
"
"
"
"                                   v_diff_amt := v_crd_amt - v_dbt_amt;
"
"
"
"                                IF v_diff_amt < 1 THEN
"
"
"
"                                SELECT MIN(aj_jrnl_trns_seq_no)
"
"                                  INTO v_trans_seq_no
"
"                                  FROM appl_journals
"
"                                 WHERE aj_bu = p_bu
"
"                                   AND aj_plnt = p_plnt
"
"                                   AND aj_vou_no = p_trans_no
"
"                                   AND aj_appl = 'RR'
"
"                                   AND aj_vou_type = 'RCM'
"
"                                   AND aj_bc_db_amt > 0;
"
"
"
"                                     UPDATE appl_journals
"
"                                        SET aj_bc_db_amt = aj_bc_db_amt + v_diff_amt,
"
"                                        aj_fc_db_amt = aj_fc_db_amt + v_diff_amt,
"
"                                        aj_upd_by = p_user,
"
"                                        aj_upd_date = SYSDATE
"
"                                       WHERE aj_bu = p_bu
"
"                                         AND aj_plnt = p_plnt
"
"                                         AND aj_vou_no = p_trans_no
"
"                                         AND aj_appl = 'RR'
"
"                                         AND aj_vou_type = 'RCM'
"
"                                         AND aj_bc_db_amt > 0
"
"                                         AND aj_jrnl_trns_seq_no = v_trans_seq_no;
"
"                                END IF;
"
"             END IF;
"
"
"
"
"
"
"
"    END proc_ins_repair_jrnls_hist;
"
"
"
"END    pkg_mfg_rwk_perpetual_journals;"
/
