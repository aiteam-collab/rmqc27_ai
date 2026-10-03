CREATE OR REPLACE
"PACKAGE BODY pkg_stk_cost
"
"AS
"
"
"
"  PROCEDURE proc_ins_exp(p_bu        VARCHAR2,
"
"                         p_mat_type    VARCHAR2,
"
"             p_store_id    VARCHAR2,
"
"             p_prod_id    VARCHAR2,
"
"             p_prod_rev    NUMBER,
"
"             p_cost_method    VARCHAR2,
"
"             p_msg        VARCHAR2,
"
"             p_user        VARCHAR2,
"
"             p_prod_ord_no    VARCHAR2    DEFAULT NULL,
"
"             p_sf_code    VARCHAR2    DEFAULT NULL,
"
"             p_sys_ls_no    NUMBER        DEFAULT NULL
"
"            )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO stk_mac_exp(sme_bu,sme_mat_type,sme_store_id,sme_prod_id,sme_prod_rev,sme_cost_method,sme_err_msg,sme_cre_by,sme_cre_date,sme_prod_ord_no,sme_sf_code,sme_sys_ls_no)
"
"             VALUES(p_bu,p_mat_type,p_store_id,p_prod_id,p_prod_rev,p_cost_method,p_msg,p_user,SYSDATE,p_prod_ord_no,p_sf_code,p_sys_ls_no);
"
"
"
"    Commit;
"
"  END proc_ins_exp;
"
"
"
"  PROCEDURE proc_ins_mac_cost(p_bu        VARCHAR2,
"
"                              p_store_id    VARCHAR2,
"
"                  p_prod_id        VARCHAR2,
"
"                  p_prod_rev    NUMBER,
"
"                  p_mat_type    VARCHAR2,
"
"                  p_prod_ord_no    VARCHAR2,
"
"                  p_sf_code        VARCHAR2,
"
"                  p_sys_ls_no    NUMBER,
"
"                  p_user        VARCHAR2
"
"                 )
"
"  AS
"
"  BEGIN
"
"
"
"    IF p_mat_type = 'S' THEN
"
"
"
"      UPDATE std_stk_upd_mac_cost
"
"         SET sttr_upd_flag = 'N'
"
"       WHERE sttr_bu = p_bu
"
"         AND sttr_store_id = p_store_id
"
"         AND sttr_prod_id = p_prod_id
"
"         AND sttr_prod_rev = p_prod_rev;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"        INSERT INTO std_stk_upd_mac_cost
"
"        SELECT sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_cost_method,SUM(sttr_trans_qty) sttr_stk_qty,
"
"             --  SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_stk_val,
"
"               COUNT(*) sttr_rec_ctn,'N' sttr_upd_flag,TO_DATE(NULL) sttr_start_time,TO_DATE(NULL) sttr_end_time
"
"          FROM stock_trans,stores
"
"         WHERE sttr_bu = store_bu
"
"           AND sttr_store_id = store_id
"
"           AND sttr_bucket_type = 'QOH'
"
"           AND sttr_bu = p_bu
"
"           AND sttr_store_id = p_store_id
"
"           AND sttr_prod_id = p_prod_id
"
"           AND sttr_prod_rev = p_prod_rev
"
"         GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_cost_method
"
"         ORDER BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_rec_ctn;
"
"
"
"      END IF;
"
"    END IF;
"
"
"
"    IF p_mat_type = 'F' THEN
"
"
"
"      UPDATE sfg_stk_upd_mac_cost
"
"         SET stsfg_upd_flag = 'N'
"
"       WHERE stsfg_bu = p_bu
"
"         AND stsfg_store_id = p_store_id
"
"         AND stsfg_prod_id = p_prod_id
"
"         AND stsfg_prod_rev = p_prod_rev
"
"     AND (stsfg_ord_no = p_prod_ord_no OR (stsfg_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"     AND stsfg_sf_code = p_sf_code
"
"     AND (stsfg_sys_ls_no = p_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND p_sys_ls_no IS NULL));
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"        INSERT INTO sfg_stk_upd_mac_cost
"
"        SELECT stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no,
"
"           SUM(stsfg_trans_qty) stsfg_stk_qty,SUM(stsfg_trans_qty * stsfg_unit_cost) stsfg_stk_val,
"
"               COUNT(*) stsfg_rec_ctn,'N' stsfg_upd_flag,TO_DATE(NULL) stsfg_start_time,TO_DATE(NULL) stsfg_end_time
"
"          FROM stock_trans_sfg,stores
"
"         WHERE stsfg_bu = store_bu
"
"           AND stsfg_store_id = store_id
"
"           AND stsfg_bucket_type = 'QOH'
"
"           AND stsfg_bu = p_bu
"
"           AND stsfg_store_id = p_store_id
"
"           AND stsfg_prod_id = p_prod_id
"
"           AND stsfg_prod_rev = p_prod_rev
"
"       AND (stsfg_ord_no = p_prod_ord_no OR (stsfg_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"       AND stsfg_sf_code = p_sf_code
"
"       AND (stsfg_sys_ls_no = p_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND p_sys_ls_no IS NULL))
"
"         GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no;
"
"
"
"      END IF;
"
"    END IF;
"
"
"
"    Commit;
"
"  END proc_ins_mac_cost;
"
"
"
"  PROCEDURE proc_upd_scmc_cost(p_bu        VARCHAR2,
"
"                   p_rcpt_no    VARCHAR2,
"
"                   p_rcpt_seq_no    NUMBER,
"
"                   p_user        VARCHAR2
"
"                  )
"
"  IS
"
"
"
"    v_rm_cost        NUMBER;
"
"    v_proc_cost        NUMBER;
"
"    v_tot_cost        NUMBER;
"
"    v_unit_cost        NUMBER;
"
"    v_store_id        stores.store_id%TYPE;
"
"
"
"  BEGIN
"
"
"
"    FOR r_pr IN (SELECT *
"
"                   FROM pur_ord_receipt_hd_hist,pur_ord_receipt_ln_hist
"
"          WHERE porhh_bu = porlh_bu
"
"            AND porhh_receipt_no = porlh_receipt_no
"
"            AND porhh_bu = p_bu
"
"            AND porhh_receipt_no = p_rcpt_no
"
"            AND porlh_seq_no = p_rcpt_seq_no)
"
"    LOOP
"
"
"
"      SELECT NVL(SUM(scmcls_act_cons_qty * (scmcls_unit_cost / scmcls_conv_factor)),0) INTO v_rm_cost
"
"        FROM sub_contr_mat_cons_lot_ser
"
"       WHERE scmcls_bu = p_bu
"
"         AND scmcls_receipt_no = p_rcpt_no
"
"         AND scmcls_seq_no = p_rcpt_seq_no;
"
"
"
"      v_proc_cost := CASE WHEN r_pr.porlh_matl_type IN ('UP','US','RDC') THEN 0 ELSE r_pr.porlh_sc_unit_cost - (r_pr.porlh_sc_unit_cost * (r_pr.porlh_disc_pct / 100)) END * r_pr.porlh_receipt_qty * r_pr.porhh_exchange_rate;
"
"
"
"      v_tot_cost := NVL(v_rm_cost,0) + NVL(v_proc_cost,0);
"
"
"
"      v_unit_cost := v_tot_cost / r_pr.porlh_receipt_qty;
"
"
"
"      UPDATE pur_ord_receipt_ln_hist
"
"         SET porlh_scon_mat_unit_cost = v_unit_cost
"
"       WHERE porlh_bu = p_bu
"
"         AND porlh_receipt_no = p_rcpt_no
"
"         AND porlh_seq_no = p_rcpt_seq_no;
"
"
"
"      BEGIN
"
"      UPDATE stock_trans_sfg
"
"         SET stsfg_unit_cost = v_unit_cost
"
"       WHERE stsfg_bu = p_bu
"
"         AND stsfg_prod_id = r_pr.porlh_prod_id
"
"         AND stsfg_prod_rev = r_pr.porlh_prod_rev
"
"         AND stsfg_sf_code = r_pr.porlh_tar_sf_code
"
"         AND stsfg_ord_no = r_pr.porlh_prod_ord_no
"
"         AND stsfg_appl = 'SCM'
"
"         AND stsfg_source_doc = 'SRN'
"
"         AND stsfg_vou_no = p_rcpt_no
"
"     AND stsfg_vou_line_no = p_rcpt_seq_no;
"
"
"
"      SELECT DISTINCT stsfg_store_id INTO v_store_id
"
"        FROM stock_trans_sfg
"
"       WHERE stsfg_bu = p_bu
"
"         AND stsfg_prod_id = r_pr.porlh_prod_id
"
"         AND stsfg_prod_rev = r_pr.porlh_prod_rev
"
"         AND stsfg_sf_code = r_pr.porlh_tar_sf_code
"
"         AND stsfg_ord_no = r_pr.porlh_prod_ord_no
"
"         AND stsfg_appl = 'SCM'
"
"         AND stsfg_source_doc = 'SRN'
"
"         AND stsfg_vou_no = p_rcpt_no
"
"     AND stsfg_vou_line_no = p_rcpt_seq_no;
"
"
"
"      EXCEPTION
"
"        WHEN OTHERS THEN Raise_Application_Error(-20999,p_rcpt_no||'/'||r_pr.porlh_prod_ord_no||'/'||r_pr.porlh_tar_sf_code||'/'||SQLERRM);
"
"      END;
"
"
"
"      proc_ins_mac_cost(p_bu,v_store_id,r_pr.porlh_prod_id,r_pr.porlh_prod_rev,'F',r_pr.porlh_prod_ord_no,r_pr.porlh_tar_sf_code,r_pr.porlh_po_sys_ls_no,p_user);
"
"
"
"    END LOOP;
"
"
"
"  END proc_upd_scmc_cost;
"
"
"
"  PROCEDURE proc_upd_pmc_cost(p_bu    VARCHAR2,
"
"                  p_plnt    VARCHAR2,
"
"                  p_doc_no    VARCHAR2,
"
"                  p_user    VARCHAR2
"
"                 )
"
"  IS
"
"
"
"    v_rm_cost        NUMBER;
"
"    v_mchn_cost        NUMBER;
"
"    v_tot_cost        NUMBER;
"
"    v_unit_cost        NUMBER;
"
"    v_store_id        stores.store_id%TYPE;
"
"
"
"  BEGIN
"
"
"
"    FOR r_pth IN (SELECT *
"
"                    FROM prod_transfer_hist
"
"           WHERE pth_bu = p_bu
"
"             AND pth_plnt = p_plnt
"
"             AND pth_trans_no = p_doc_no)
"
"    LOOP
"
"
"
"      SELECT NVL(SUM(ptmch_allocated_qty * (ptmch_unit_Cost / ptmch_conv_factor)),0) INTO v_rm_cost
"
"        FROM prod_transfer_mat_cons_hist
"
"       WHERE ptmch_bu = p_bu
"
"         AND ptmch_plnt = p_plnt
"
"         AND ptmch_trans_no = p_doc_no
"
"         AND ptmch_allocated_qty > 0;
"
"
"
"      /*SELECT NVL(SUM(ppcmu_wrkd_hrs * ppcmu_hrly_rate),0) INTO v_mchn_cost
"
"        FROM pcb_prod_comp_mchn_usg
"
"       WHERE ppcmu_bu = p_bu
"
"         AND ppcmu_plnt = p_plnt
"
"         AND ppcmu_doc_no = p_doc_no;*/
"
"
"
"      v_tot_cost := NVL(v_rm_cost,0) + NVL(v_mchn_cost,0);
"
"
"
"      v_unit_cost := v_tot_cost / r_pth.pth_comp_qty;
"
"
"
"      UPDATE prod_transfer_hist
"
"         SET pth_unit_cost = v_unit_cost
"
"       WHERE pth_bu = p_bu
"
"         AND pth_plnt = p_plnt
"
"         AND pth_trans_no = p_doc_no;
"
"
"
"      BEGIN
"
"      UPDATE stock_trans_sfg
"
"         SET stsfg_unit_cost = v_unit_cost
"
"       WHERE stsfg_bu = p_bu
"
"         AND stsfg_prod_id = r_pth.pth_prod_id
"
"         AND stsfg_prod_Rev = r_pth.pth_prod_rev
"
"         AND stsfg_sf_code = r_pth.pth_comp_sf_code
"
"         AND stsfg_ord_no = r_pth.pth_prod_ord_no
"
"         AND stsfg_appl = 'SFM'
"
"         AND stsfg_source_doc = 'SFR'
"
"         AND stsfg_vou_no = p_doc_no;
"
"
"
"      SELECT DISTINCT stsfg_store_id INTO v_store_id
"
"        FROM stock_trans_sfg
"
"       WHERE stsfg_bu = p_bu
"
"         AND stsfg_prod_id = r_pth.pth_prod_id
"
"         AND stsfg_prod_Rev = r_pth.pth_prod_rev
"
"         AND stsfg_sf_code = r_pth.pth_comp_sf_code
"
"         AND stsfg_ord_no = r_pth.pth_prod_ord_no
"
"         AND stsfg_appl = 'SFM'
"
"         AND stsfg_source_doc = 'SFR'
"
"         AND stsfg_vou_no = p_doc_no;
"
"
"
"      EXCEPTION
"
"        WHEN OTHERS THEN Raise_Application_Error(-20999,p_doc_no||'/'||r_pth.pth_prod_ord_no||'/'||r_pth.pth_comp_sf_code||'/'||SQLERRM);
"
"      END;
"
"
"
"      proc_ins_mac_cost(p_bu,v_store_id,r_pth.pth_prod_id,r_pth.pth_prod_rev,'F',r_pth.pth_prod_ord_no,r_pth.pth_comp_sf_code,r_pth.pth_sys_ls_no,p_user);
"
"
"
"    END LOOP;
"
"
"
"    FOR cr1 IN (SELECT *
"
"                  FROM fg_pack_hd
"
"                 WHERE fph_bu = p_bu
"
"               AND fph_status = 'P'
"
"               AND fph_tpn_no = p_doc_no)
"
"    LOOP
"
"
"
"      proc_calc_pack_proc_cost(cr1.fph_bu,cr1.fph_plnt,cr1.fph_tpn_no,cr1.fph_pack_date,cr1.fph_prod_id,cr1.fph_prod_rev,cr1.fph_pack_qty,p_user,1);
"
"
"
"      FOR r_op IN (SELECT *
"
"                     FROM fg_pack_lot_ser_nos
"
"            WHERE fplsn_bu = p_bu
"
"              AND fplsn_plnt = cr1.fph_plnt
"
"              AND fplsn_tpn_no = cr1.fph_tpn_no)
"
"      LOOP
"
"        BEGIN
"
"
"
"        UPDATE stock_trans_sfg
"
"           SET stsfg_unit_cost = r_op.fplsn_op_unit_cost
"
"         WHERE stsfg_bu = p_bu
"
"           AND stsfg_prod_id = cr1.fph_prod_id
"
"           AND stsfg_prod_Rev = cr1.fph_prod_rev
"
"           AND stsfg_sf_code = r_op.fplsn_tar_sf_code
"
"           AND stsfg_ord_no = r_op.fplsn_prod_ord_no
"
"       AND stsfg_sys_ls_no = r_op.fplsn_sys_ls_no
"
"           AND stsfg_vou_no = cr1.fph_tpn_no;
"
"
"
"        SELECT DISTINCT stsfg_store_id INTO v_store_id
"
"          FROM stock_trans_sfg
"
"         WHERE stsfg_bu = p_bu
"
"           AND stsfg_prod_id = cr1.fph_prod_id
"
"           AND stsfg_prod_Rev = cr1.fph_prod_rev
"
"           AND stsfg_sf_code = r_op.fplsn_tar_sf_code
"
"           AND stsfg_ord_no = r_op.fplsn_prod_ord_no
"
"       AND stsfg_sys_ls_no = r_op.fplsn_sys_ls_no
"
"           AND stsfg_vou_no = cr1.fph_tpn_no;
"
"
"
"     proc_ins_mac_cost(p_bu,v_store_id,cr1.fph_prod_id,cr1.fph_prod_rev,'F',r_op.fplsn_prod_ord_no,r_op.fplsn_tar_sf_code,r_op.fplsn_sys_ls_no,p_user);
"
"
"
"        EXCEPTION
"
"        WHEN OTHERS THEN Raise_Application_Error(-20999,p_doc_no||'/'||cr1.fph_tpn_no||'/'||r_op.fplsn_sys_ls_no||'/'||SQLERRM);
"
"        END;
"
"
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"    FOR cr1 IN (SELECT *
"
"                  FROM rework_order_comp_hd
"
"                 WHERE rwochd_bu = p_bu
"
"               AND rwochd_status = 'P'
"
"               AND rwochd_doc_no = p_doc_no)
"
"    LOOP
"
"
"
"      FOR r_op IN (SELECT *
"
"                     FROM rework_order_comp_dtl
"
"            WHERE rwocd_bu = p_bu
"
"              AND rwocd_plnt = cr1.rwochd_plnt
"
"              AND rwocd_doc_no = cr1.rwochd_doc_no)
"
"      LOOP
"
"        UPDATE stock_trans_sfg
"
"           SET stsfg_unit_cost = r_op.rwocd_unit_cost
"
"         WHERE stsfg_bu = p_bu
"
"           AND stsfg_prod_id = cr1.rwochd_prod_id
"
"           AND stsfg_prod_Rev = cr1.rwochd_prod_rev
"
"           AND stsfg_sf_code = r_op.rwocd_tar_sf_code
"
"           AND stsfg_ord_no = r_op.rwocd_prod_ord_no
"
"       AND stsfg_sys_ls_no = r_op.rwocd_sou_sys_ls_no
"
"           AND stsfg_vou_no = cr1.rwochd_doc_no
"
"       AND stsfg_source_doc = 'RR'
"
"       AND stsfg_unit_cost <> r_op.rwocd_unit_cost
"
"        RETURNING stsfg_store_id INTO v_store_id;
"
"        IF SQL%FOUND THEN
"
"          proc_ins_mac_cost(p_bu,v_store_id,cr1.rwochd_prod_id,cr1.rwochd_prod_rev,'F',r_op.rwocd_prod_ord_no,r_op.rwocd_tar_sf_code,r_op.rwocd_sou_sys_ls_no,p_user);
"
"    END IF;
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"  END proc_upd_pmc_cost;
"
"
"
"  PROCEDURE proc_upd_mac_frm_std_stk_trans(p_bu        VARCHAR2,
"
"                               p_store_id    VARCHAR2,
"
"                               p_prod_id    VARCHAR2,
"
"                               p_prod_rev    NUMBER,
"
"                               p_start_dt    DATE,
"
"                       p_end_dt    DATE,
"
"                               p_limit    NUMBER,
"
"                               p_user    VARCHAR2
"
"                              )
"
"  AS
"
"  CURSOR c_st IS
"
"  SELECT Qry.*,CASE WHEN Cumm_Qty = 0 THEN 0 ELSE ROUND(Cumm_val/Cumm_Qty,5) END mac_cost,
"
"         CASE WHEN Old_Trans_Qty = 0 THEN 0 ELSE ROUND((Old_Trans_Val / Old_Trans_Qty),5) END Old_Trans_UnitCost
"
"    FROM(
"
"    SELECT SubQry.*,
"
"         SUM(trans_qty) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_qty,
"
"         SUM(trans_qty * trans_unitcost) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_val,
"
"         SUM(trans_qty) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_qty,
"
"         SUM(trans_qty * trans_unitcost) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_val
"
"    FROM(SELECT sttr_bu,1 sttr_trans_seq_no,1 sttr_run_seq_no,sttr_store_plnt,sttr_store_id,sttr_prod_id,sttr_prod_rev,
"
"                TO_DATE(p_start_dt) sttr_trans_date,NULL sttr_cre_date,'OP' sttr_source_doc,NULL sttr_appl,NULL sttr_vou_pfx,NULL sttr_vou_no,NULL sttr_vou_line_no,
"
"                SUM(sttr_trans_qty) trans_qty,
"
"        CASE WHEN SUM(sttr_trans_qty) = 0 THEN 0 ELSE ROUND(SUM(sttr_bc_unit_cost * sttr_trans_qty)/SUM(sttr_trans_qty),5) END trans_unitcost,
"
"                SUM(sttr_trans_qty * sttr_bc_unit_cost) trans_val
"
"           FROM stock_trans,products
"
"          WHERE prod_bu = sttr_bu
"
"        AND prod_id = sttr_prod_id
"
"        AND prod_rev = sttr_prod_rev
"
"        AND sttr_bucket_type = 'QOH'
"
"        AND prod_cost_method = 'MAC'
"
"        AND sttr_bu = p_bu
"
"            AND sttr_store_id = p_store_id
"
"            AND sttr_prod_id = p_prod_id
"
"            AND sttr_prod_rev = p_prod_rev
"
"            AND sttr_trans_date < p_start_dt
"
"          GROUP BY sttr_bu,sttr_store_plnt,sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"         UNION ALL
"
"         SELECT sttr_bu,sttr_trans_seq_no,sttr_run_seq_no,sttr_store_plnt,sttr_store_id,sttr_prod_id,sttr_prod_rev,
"
"                sttr_trans_date,sttr_cre_date,sttr_source_doc,sttr_appl,sttr_vou_pfx,sttr_vou_no,sttr_vou_line_no,
"
"                sttr_trans_qty trans_qty,sttr_bc_unit_cost trans_unitcost,
"
"                sttr_trans_qty * sttr_bc_unit_cost trans_val
"
"           FROM stock_trans,products
"
"      WHERE prod_bu = sttr_bu
"
"        AND prod_id = sttr_prod_id
"
"        AND prod_rev = sttr_prod_rev
"
"        AND sttr_bucket_type = 'QOH'
"
"        AND prod_cost_method = 'MAC'
"
"        AND sttr_bu = p_bu
"
"        AND sttr_store_id = p_store_id
"
"        AND sttr_prod_id = p_prod_id
"
"        AND sttr_prod_rev = p_prod_rev
"
"        AND sttr_trans_date >= p_start_dt
"
"        AND (sttr_trans_date <= p_end_dt OR p_end_dt IS NULL)
"
"       ) SubQry) Qry
"
"      ORDER BY sttr_trans_date,sttr_trans_seq_no;
"
"
"
"  r_st    c_st%ROWTYPE;
"
"
"
"  v_mac_cost        NUMBER(20,8) := 0;
"
"  v_doc_unit_cost    NUMBER(20,8) := 0;
"
"
"
"  v_dept_cnt        NUMBER;
"
"  v_mr_unit_cost    NUMBER(20,8) := 0;
"
"  v_scrap_unit_cost    NUMBER(20,8) := 0;
"
"
"
"  v_break        VARCHAR2(1) := 'N';
"
"
"
"  v_err_msg        VARCHAR2(4000);
"
"
"
"  v_rec_count        NUMBER := 0;
"
"
"
"  v_store_id        VARCHAR2(10);
"
"  v_upd_seq_no        NUMBER;
"
"  v_dc_no        VARCHAR2(15);
"
"  v_dc_seq_no        NUMBER;
"
"  v_dc_doc_no        VARCHAR2(15);
"
"  v_mi_vou_no        VARCHAR2(15);
"
"  v_mi_vou_line_no    NUMBER;
"
"
"
"  v_ap_lc_amt        NUMBER;
"
"
"
"  BEGIN
"
"
"
"    UPDATE stock_trans
"
"       SET sttr_run_seq_no = NULL
"
"     WHERE sttr_bu = p_bu
"
"       AND sttr_store_id = p_store_id
"
"       AND sttr_prod_id = p_prod_id
"
"       AND sttr_prod_rev = p_prod_rev
"
"       AND sttr_trans_date >= p_start_dt;
"
"
"
"    <<mac_cost>>
"
"    v_break := 'N';
"
"    v_upd_seq_no := 0;
"
"
"
"    OPEN c_st;
"
"    FETCH c_st INTO r_st;
"
"      IF c_st%FOUND THEN
"
"
"
"    LOOP
"
"
"
"      v_rec_count := v_rec_count + 1;
"
"
"
"          IF r_st.cumm_qty < 0 THEN
"
"
"
"            proc_ins_exp(p_bu,'S',p_store_id,p_prod_id,p_prod_rev,'MAC','Negative Stock',p_user);
"
"
"
"        Exit;
"
"
"
"      END IF;
"
"
"
"      IF c_st%ROWCOUNT = 1 THEN
"
"
"
"        IF r_st.sttr_source_doc = 'SA' THEN
"
"
"
"          BEGIN
"
"                SELECT satln_unit_cost
"
"                  INTO v_doc_unit_cost
"
"                  FROM stock_adj_trans_ln
"
"                 WHERE satln_bu = r_st.sttr_bu
"
"                   AND satln_ord_no = r_st.sttr_vou_no
"
"                   AND satln_seq_no = r_st.sttr_vou_line_no;
"
"          EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN v_doc_unit_cost := r_st.trans_unitcost;
"
"          END;
"
"
"
"            UPDATE stock_trans
"
"               SET sttr_bc_unit_cost = v_doc_unit_cost
"
"             WHERE sttr_bu = r_st.sttr_bu
"
"               AND sttr_store_id = r_st.sttr_store_id
"
"               AND sttr_prod_id = r_st.sttr_prod_id
"
"               AND sttr_prod_rev = r_st.sttr_prod_rev
"
"               AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"               AND sttr_vou_no = r_st.sttr_vou_no
"
"               AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"               AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"           AND sttr_bucket_type = 'QOH'
"
"           AND sttr_run_seq_no IS NULL;
"
"
"
"            IF SQL%FOUND THEN
"
"          v_break := 'Y';
"
"        END IF;
"
"          v_mac_cost := v_doc_unit_cost;
"
"
"
"        ELSIF r_st.sttr_source_doc = 'MR' AND r_st.sttr_appl = 'SFM' THEN
"
"
"
"                  BEGIN
"
"                    SELECT ptsh_unit_cost INTO v_scrap_unit_cost
"
"                      FROM prod_trans_scrap_hist
"
"                     WHERE ptsh_bu = r_st.sttr_bu
"
"               AND ptsh_plnt = r_st.sttr_store_plnt
"
"                       AND ptsh_trans_no = r_st.sttr_vou_no
"
"                       AND ptsh_scrap_id = r_st.sttr_prod_id;
"
"                  EXCEPTION
"
"                    WHEN NO_DATA_FOUND THEN
"
"              BEGIN
"
"                        SELECT pts_unit_cost INTO v_scrap_unit_cost
"
"                          FROM prod_trans_scrap
"
"                         WHERE pts_bu = r_st.sttr_bu
"
"                   AND pts_plnt = r_st.sttr_store_plnt
"
"                           AND pts_trans_no = r_st.sttr_vou_no
"
"                           AND pts_scrap_id = r_st.sttr_prod_id;
"
"              EXCEPTION
"
"                WHEN NO_DATA_FOUND THEN
"
"                  v_scrap_unit_cost := r_st.trans_unitcost;
"
"                  END;
"
"                  END;
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_scrap_unit_cost,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"                   AND sttr_store_id = r_st.sttr_store_id
"
"                   AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"                   AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"                   AND sttr_bucket_type = 'QOH'
"
"                   --AND sttr_bc_unit_cost <> v_scrap_unit_cost
"
"                   AND sttr_run_seq_no IS NULL;
"
"
"
"            IF SQL%FOUND THEN
"
"          v_break := 'Y';
"
"        END IF;
"
"
"
"              v_mac_cost := v_scrap_unit_cost;
"
"        ELSE
"
"          v_mac_cost := r_st.mac_cost;
"
"        END IF;
"
"
"
"      ELSE
"
"
"
"        IF r_st.trans_qty > 0 THEN
"
"
"
"          /*IF v_break = 'Y' THEN
"
"                CLOSE c_st;
"
"                GOTO mac_cost;
"
"              END IF;*/
"
"
"
"          IF r_st.sttr_source_doc IN ('IC','SR') THEN
"
"
"
"            UPDATE stock_trans
"
"               SET sttr_bc_unit_cost = v_mac_cost,sttr_run_seq_no = NULL
"
"             WHERE sttr_bu = r_st.sttr_bu
"
"               AND sttr_store_id = r_st.sttr_store_id
"
"               AND sttr_prod_id = r_st.sttr_prod_id
"
"               AND sttr_prod_rev = r_st.sttr_prod_rev
"
"               AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"               AND sttr_vou_no = r_st.sttr_vou_no
"
"               AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"                   AND sttr_bucket_type = 'QOH'
"
"           AND sttr_run_seq_no IS NULL;
"
"
"
"                IF SQl%FOUND THEN
"
"
"
"          IF r_st.sttr_source_doc = 'SR' THEN
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_mac_cost,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"               AND sttr_store_id <> r_st.sttr_store_id
"
"                   AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL));
"
"
"
"          END IF;
"
"
"
"
"
"                  v_break := 'Y';
"
"                END IF;
"
"
"
"              ELSIF r_st.sttr_source_doc = 'SA' THEN
"
"
"
"            BEGIN
"
"                  SELECT satln_unit_cost
"
"                    INTO v_doc_unit_cost
"
"                    FROM stock_adj_trans_ln
"
"                   WHERE satln_bu = r_st.sttr_bu
"
"                     AND satln_ord_no = r_st.sttr_vou_no
"
"                     AND satln_seq_no = r_st.sttr_vou_line_no;
"
"            EXCEPTION
"
"              WHEN NO_DATA_FOUND THEN v_doc_unit_cost := r_st.trans_unitcost;
"
"            END;
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_doc_unit_cost,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"                   AND sttr_store_id = r_st.sttr_store_id
"
"                   AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"                   AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"                   AND sttr_bucket_type = 'QOH'
"
"           AND sttr_run_seq_no IS NULL;
"
"
"
"                IF SQl%FOUND THEN
"
"                  v_break := 'Y';
"
"                END IF;
"
"
"
"          ELSIF r_st.sttr_source_doc = 'QC' THEN
"
"
"
"            BEGIN
"
"                  SELECT DISTINCT tqlnh_vou_no,tqlnh_vou_line_no
"
"                    INTO v_mi_vou_no,v_mi_vou_line_no
"
"                    FROM tqm_qc_ln_hist
"
"                   WHERE tqlnh_bu = r_st.sttr_bu
"
"                     AND tqlnh_qc_pfx = r_st.sttr_vou_pfx
"
"                     AND tqlnh_qc_no = r_st.sttr_vou_no
"
"             AND tqlnh_seq_no = r_st.sttr_vou_line_no
"
"             AND tqlnh_prod_id = r_st.sttr_prod_id
"
"             AND tqlnh_prod_rev = r_st.sttr_prod_rev
"
"             AND tqlnh_status = 'A';
"
"            EXCEPTION
"
"              WHEN NO_DATA_FOUND THEN v_mi_vou_no := NULL; v_mi_vou_line_no := NULL;
"
"            END;
"
"
"
"            BEGIN
"
"                  SELECT istlnh_unit_cost
"
"                    INTO v_doc_unit_cost
"
"                    FROM inv_stock_trans_ln_hist
"
"                   WHERE istlnh_bu = r_st.sttr_bu
"
"                     AND istlnh_doc_no = v_mi_vou_no
"
"                     AND istlnh_seq_no = v_mi_vou_line_no;
"
"            EXCEPTION
"
"              WHEN NO_DATA_FOUND THEN v_doc_unit_cost := r_st.trans_unitcost;
"
"            END;
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_doc_unit_cost,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"                   --AND sttr_store_id = r_st.sttr_store_id
"
"                   AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"                   AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"                   AND sttr_bucket_type = 'QOH'
"
"           AND sttr_run_seq_no IS NULL;
"
"
"
"                IF SQl%FOUND THEN
"
"                  v_break := 'Y';
"
"                END IF;
"
"
"
"          ELSIF r_st.sttr_source_doc = 'ME' THEN
"
"
"
"                  BEGIN
"
"                    SELECT sstln_unit_cost INTO v_mr_unit_cost
"
"                      FROM store_stock_trans_ln_vw
"
"                     WHERE sstln_bu = r_st.sttr_bu
"
"                       AND sstln_doc_no = r_st.sttr_vou_no
"
"                       AND sstln_seq_no = r_st.sttr_vou_line_no;
"
"                  EXCEPTION
"
"                    WHEN NO_DATA_FOUND THEN v_mr_unit_cost := r_st.trans_unitcost;
"
"                  END;
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_mr_unit_cost,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"                   AND sttr_store_id = r_st.sttr_store_id
"
"                   AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"                   AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"                   AND sttr_bucket_type = 'QOH'
"
"                   AND sttr_bc_unit_cost <> v_mr_unit_cost
"
"           AND sttr_run_seq_no IS NULL;
"
"
"
"                IF SQl%FOUND THEN
"
"                  v_break := 'Y';
"
"                END IF;
"
"
"
"          ELSIF r_st.sttr_source_doc = 'MR' AND r_st.sttr_appl = 'SFM' AND r_st.sttr_prod_id IN ('TVSSCR0001','TVSSCR0003') THEN
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = 0.00001,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"                   AND sttr_store_id = r_st.sttr_store_id
"
"                   AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"                   AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"                   AND sttr_bucket_type = 'QOH'
"
"           AND sttr_bc_unit_cost <> 0.00001
"
"                   AND sttr_run_seq_no IS NULL;
"
"
"
"                IF SQl%FOUND THEN
"
"                  v_break := 'Y';
"
"                END IF;
"
"
"
"          END IF;
"
"
"
"          v_mac_cost := r_st.mac_cost;
"
"
"
"        ELSE
"
"
"
"          UPDATE stock_trans
"
"                 SET sttr_bc_unit_cost = v_mac_cost,sttr_run_seq_no = NULL
"
"               WHERE sttr_bu = r_st.sttr_bu
"
"                 AND sttr_store_id = r_st.sttr_store_id
"
"         AND sttr_prod_id = r_st.sttr_prod_id
"
"                 AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                 AND sttr_vou_no = r_st.sttr_vou_no
"
"                 AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"             AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"         AND sttr_bc_unit_cost <> v_mac_cost
"
"         AND sttr_run_seq_no IS NULL;
"
"
"
"              IF SQL%FOUND THEN
"
"            Commit;
"
"            v_break := 'Y';
"
"          END IF;
"
"
"
"              IF r_st.sttr_source_doc IN ('MI','MT','MW','MR') THEN
"
"
"
"        UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_mac_cost
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"           AND sttr_store_id = r_st.sttr_store_id
"
"           AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"           AND sttr_bucket_type = 'SIT'
"
"           AND sttr_bc_unit_cost <> v_mac_cost;
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_mac_cost,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"           AND sttr_store_id <> r_st.sttr_store_id
"
"           AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"           AND sttr_bucket_type = 'QOH'
"
"           AND sttr_bc_unit_cost <> v_mac_cost
"
"        RETURNING sttr_store_id INTO v_store_id;
"
"
"
"        IF SQL%FOUND THEN
"
"          proc_ins_mac_cost(r_st.sttr_bu,v_store_id,r_st.sttr_prod_id,r_st.sttr_prod_rev,'S',NULL,NULL,NULL,p_user);
"
"        END IF;
"
"
"
"                UPDATE inv_stock_trans_ln_hist
"
"                   SET istlnh_unit_cost = v_mac_cost
"
"                 WHERE istlnh_bu = p_bu
"
"                   AND istlnh_prod_id = p_prod_id
"
"                   AND istlnh_prod_rev = p_prod_rev
"
"                   AND istlnh_doc_no = r_st.sttr_vou_no
"
"                   AND istlnh_seq_no = r_st.sttr_vou_line_no
"
"           AND istlnh_unit_cost <> v_mac_cost;
"
"
"
"                IF r_st.sttr_source_doc IN ('MI','MT') THEN
"
"
"
"          FOR r_mrv IN (SELECT isthdh_issueto_id,istlnh_doc_no,istlnh_seq_no,
"
"                               istlnh_vou_type,istlnh_vou_no,istlnh_vou_seq_no
"
"                                  FROM inv_stock_trans_hd_hist,inv_stock_trans_ln_hist
"
"                                 WHERE isthdh_bu = istlnh_bu
"
"                   AND isthdh_doc_no = istlnh_doc_no
"
"                   AND istlnh_bu = p_bu
"
"                   AND istlnh_prod_id = p_prod_id
"
"                   AND istlnh_prod_rev = p_prod_rev
"
"                   AND istlnh_mi_doc_no = r_st.sttr_vou_no
"
"                   AND istlnh_mi_seq_no = r_st.sttr_vou_line_no
"
"                     ORDER BY istlnh_doc_no)
"
"          LOOP
"
"
"
"            IF r_mrv.istlnh_vou_type = 'GRN' THEN
"
"              BEGIN
"
"                SELECT porl_ap_lc_chrg_amt INTO v_ap_lc_amt
"
"                  FROM pur_ord_receipt_ln_view
"
"                 WHERE porl_bu = p_bu
"
"                   AND porl_receipt_no = r_mrv.istlnh_vou_no
"
"               AND porl_seq_no = r_mrv.istlnh_vou_seq_no;
"
"              EXCEPTION
"
"                WHEN NO_DATA_FOUND THEN
"
"              Raise_Application_Error(-20999,r_mrv.istlnh_vou_no||'/'||r_mrv.istlnh_vou_seq_no);
"
"              END;
"
"            ELSE
"
"              v_ap_lc_amt := 0;
"
"            END IF;
"
"
"
"            UPDATE inv_stock_trans_ln_hist
"
"                       SET istlnh_unit_cost = v_mac_cost,istlnh_ap_lc_chrg_amt = v_ap_lc_amt
"
"                     WHERE istlnh_bu = p_bu
"
"                       AND istlnh_prod_id = p_prod_id
"
"                       AND istlnh_prod_rev = p_prod_rev
"
"                       AND istlnh_doc_no = r_mrv.istlnh_doc_no
"
"                       AND istlnh_seq_no = r_mrv.istlnh_seq_no;
"
"
"
"                    UPDATE stock_trans
"
"                       SET sttr_bc_unit_cost = v_mac_cost,sttr_run_seq_no = NULL
"
"                     WHERE sttr_bu = r_st.sttr_bu
"
"                       AND sttr_prod_id = r_st.sttr_prod_id
"
"                       AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                       AND sttr_vou_no = r_mrv.istlnh_doc_no
"
"                       AND sttr_vou_line_no = r_mrv.istlnh_seq_no
"
"                       AND sttr_appl = 'ICM'
"
"               AND sttr_bc_unit_cost <> v_mac_cost
"
"               AND sttr_bucket_type = 'SIT';
"
"
"
"                    UPDATE stock_trans
"
"                       SET sttr_bc_unit_cost = v_mac_cost + v_ap_lc_amt,sttr_run_seq_no = NULL
"
"                     WHERE sttr_bu = r_st.sttr_bu
"
"                       AND sttr_prod_id = r_st.sttr_prod_id
"
"                       AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                       AND sttr_vou_no = r_mrv.istlnh_doc_no
"
"                       AND sttr_vou_line_no = r_mrv.istlnh_seq_no
"
"                       AND sttr_appl = 'ICM'
"
"               AND sttr_bc_unit_cost <> (v_mac_cost + v_ap_lc_amt)
"
"               AND sttr_bucket_type = 'QOH';
"
"
"
"            IF SQL%FOUND THEN
"
"                      proc_ins_mac_cost(r_st.sttr_bu,r_mrv.isthdh_issueto_id,r_st.sttr_prod_id,r_st.sttr_prod_rev,'S',NULL,NULL,NULL,p_user);
"
"            END IF;
"
"
"
"                  END LOOP;
"
"
"
"                END IF;
"
"
"
"              ELSIF r_st.sttr_source_doc IN ('SIG','SIT','PR','NS','SP','ST','SO','RJN','SS','SR','FS','QC','NO','SE','IR','DE','FE') THEN
"
"
"
"                UPDATE sales_invoices_ln
"
"                   SET siln_unit_cost = v_mac_cost
"
"                 WHERE siln_bu = r_st.sttr_bu
"
"                   AND siln_prod_id = r_st.sttr_prod_id
"
"                   AND siln_prod_rev = r_st.sttr_prod_rev
"
"                   AND EXISTS(SELECT 1
"
"                                FROM sales_invoices_hd
"
"                               WHERE sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                                 AND sihd_inv_pfx = r_st.sttr_vou_pfx
"
"                                 AND sihd_inv_no = r_st.sttr_vou_no)
"
"                   AND siln_seq_no = r_st.sttr_vou_line_no;
"
"
"
"            UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_mac_cost,
"
"               sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"                   AND sttr_store_id = r_st.sttr_store_id
"
"           AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"               AND sttr_trans_qty > 0;
"
"
"
"        IF SQL%FOUND THEN
"
"          proc_ins_mac_cost(r_st.sttr_bu,r_st.sttr_store_id,r_st.sttr_prod_id,r_st.sttr_prod_rev,'S',NULL,NULL,NULL,p_user);
"
"        END IF;
"
"
"
"              ELSIF r_st.sttr_source_doc = 'SA' THEN
"
"
"
"        UPDATE stock_adj_trans_ln
"
"                   SET satln_unit_cost = v_mac_cost
"
"                 WHERE satln_bu = r_st.sttr_bu
"
"                   AND satln_ord_no = r_st.sttr_vou_no
"
"                   AND satln_seq_no = r_st.sttr_vou_line_no;
"
"
"
"          ELSIF r_st.sttr_source_doc = 'ME' THEN
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_mac_cost,
"
"               sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"           AND sttr_store_id <> r_st.sttr_store_id
"
"           AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"               AND sttr_trans_seq_no <> r_st.sttr_trans_seq_no
"
"         RETURNING sttr_store_id INTO v_store_id;
"
"
"
"        proc_ins_mac_cost(r_st.sttr_bu,v_store_id,r_st.sttr_prod_id,r_st.sttr_prod_rev,'S',NULL,NULL,NULL,p_user);
"
"
"
"        UPDATE store_stock_trans_ln
"
"                   SET sstln_unit_cost = v_mac_cost
"
"                 WHERE sstln_bu = r_st.sttr_bu
"
"                   AND sstln_doc_no = r_st.sttr_vou_no
"
"                   AND sstln_seq_no = r_st.sttr_vou_line_no;
"
"
"
"        IF SQL%NOTFOUND THEN
"
"
"
"          UPDATE store_stock_trans_ln_hist
"
"                     SET sstlnh_unit_cost = v_mac_cost
"
"                   WHERE sstlnh_bu = r_st.sttr_bu
"
"                     AND sstlnh_doc_no = r_st.sttr_vou_no
"
"                     AND sstlnh_seq_no = r_st.sttr_vou_line_no;
"
"
"
"                END IF;
"
"
"
"              ELSIF r_st.sttr_source_doc = 'SMC' THEN
"
"
"
"        UPDATE sub_contr_mat_cons_lot_ser
"
"                   SET scmcls_unit_cost = v_mac_cost
"
"                 WHERE scmcls_bu = r_st.sttr_bu
"
"                   AND scmcls_receipt_no = r_st.sttr_vou_no
"
"           AND scmcls_seq_no = r_st.sttr_vou_line_no
"
"                   AND scmcls_prod_id = r_st.sttr_prod_id
"
"                   AND scmcls_prod_rev = r_st.sttr_prod_rev
"
"                   AND scmcls_mat_type = 'S';
"
"
"
"        IF SQL%FOUND THEN
"
"          proc_upd_scmc_cost(r_st.sttr_bu,r_st.sttr_vou_no,r_st.sttr_vou_line_no,p_user);
"
"        END IF;
"
"
"
"              ELSIF r_st.sttr_source_doc = 'PMC' THEN
"
"
"
"        UPDATE prod_transfer_mat_cons_hist
"
"                   SET ptmch_unit_cost = v_mac_cost
"
"                 WHERE ptmch_bu = r_st.sttr_bu
"
"                   AND ptmch_plnt = r_st.sttr_store_plnt
"
"                   AND ptmch_trans_no = r_st.sttr_vou_no
"
"                   AND ptmch_prod_id = r_st.sttr_prod_id
"
"                   AND ptmch_prod_rev = r_st.sttr_prod_rev
"
"                   AND ptmch_store_id = r_st.sttr_store_id
"
"                   AND ptmch_mat_type = 'S'
"
"           AND ptmch_unit_cost <> v_mac_cost;
"
"
"
"        IF SQL%FOUND THEN
"
"          proc_upd_pmc_cost(r_st.sttr_bu,r_st.sttr_store_plnt,r_st.sttr_vou_no,p_user);
"
"        END IF;
"
"
"
"        UPDATE fg_pack_cons
"
"           SET fpc_unit_cost = v_mac_cost
"
"         WHERE fpc_bu = r_st.sttr_bu
"
"                   AND fpc_tpn_no = r_st.sttr_vou_no
"
"               AND fpc_seq_no = r_st.sttr_vou_line_no
"
"               AND fpc_prod_id = r_st.sttr_prod_id
"
"               AND fpc_prod_rev = r_st.sttr_prod_rev
"
"           AND fpc_unit_cost <> v_mac_cost;
"
"
"
"                IF SQL%FOUND THEN
"
"          proc_upd_pmc_cost(r_st.sttr_bu,r_st.sttr_store_plnt,r_st.sttr_vou_no,p_user);
"
"        END IF;
"
"
"
"              ELSIF r_st.sttr_source_doc = 'QC' THEN
"
"
"
"            BEGIN
"
"                  SELECT DISTINCT tqlnh_vou_no,tqlnh_vou_line_no
"
"                    INTO v_mi_vou_no,v_mi_vou_line_no
"
"                    FROM tqm_qc_ln_hist
"
"                   WHERE tqlnh_bu = r_st.sttr_bu
"
"                     AND tqlnh_qc_pfx = r_st.sttr_vou_pfx
"
"                     AND tqlnh_qc_no = r_st.sttr_vou_no
"
"             AND tqlnh_seq_no = r_st.sttr_vou_line_no
"
"             AND tqlnh_prod_id = r_st.sttr_prod_id
"
"             AND tqlnh_prod_rev = r_st.sttr_prod_rev
"
"             AND tqlnh_status = 'A';
"
"            EXCEPTION
"
"              WHEN NO_DATA_FOUND THEN v_mi_vou_no := NULL; v_mi_vou_line_no := NULL;
"
"            END;
"
"
"
"            BEGIN
"
"                  SELECT istlnh_unit_cost
"
"                    INTO v_doc_unit_cost
"
"                    FROM inv_stock_trans_ln_hist
"
"                   WHERE istlnh_bu = r_st.sttr_bu
"
"                     AND istlnh_doc_no = v_mi_vou_no
"
"                     AND istlnh_seq_no = v_mi_vou_line_no;
"
"            EXCEPTION
"
"              WHEN NO_DATA_FOUND THEN v_doc_unit_cost := r_st.trans_unitcost;
"
"            END;
"
"
"
"                UPDATE stock_trans
"
"                   SET sttr_bc_unit_cost = v_doc_unit_cost,sttr_run_seq_no = NULL
"
"                 WHERE sttr_bu = r_st.sttr_bu
"
"                   AND sttr_prod_id = r_st.sttr_prod_id
"
"                   AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                   AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"                   AND sttr_vou_no = r_st.sttr_vou_no
"
"                   AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"                   AND sttr_bucket_type = 'QOH'
"
"           AND sttr_bc_unit_cost <> v_doc_unit_cost;
"
"
"
"          END IF;
"
"
"
"            END IF;
"
"          END IF;
"
"
"
"          v_upd_seq_no := v_upd_seq_no + 1;
"
"
"
"      UPDATE stock_trans
"
"         SET sttr_old_qoh = NVL(r_st.old_trans_qty,0),
"
"             sttr_old_unit_cost = NVL(r_st.old_trans_unitcost,0),
"
"         sttr_run_seq_no = v_upd_seq_no
"
"       WHERE sttr_bu = r_st.sttr_bu
"
"         AND sttr_store_id = r_st.sttr_store_id
"
"         AND sttr_prod_id = r_st.sttr_prod_id
"
"         AND sttr_prod_rev = r_st.sttr_prod_rev
"
"         AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"         AND sttr_vou_no = r_st.sttr_vou_no
"
"         AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"         AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"         AND sttr_bucket_type = 'QOH';
"
"
"
"          IF v_break = 'Y' AND r_st.trans_qty > 0 THEN
"
"            CLOSE c_st;
"
"            GOTO mac_cost;
"
"          END IF;
"
"
"
"          IF v_rec_count >= p_limit THEN
"
"        proc_ins_exp(p_bu,'S',p_store_id,p_prod_id,p_prod_rev,'MAC','Infinity LOOP',p_user);
"
"            Exit;
"
"          END IF;
"
"
"
"
"
"      Commit;
"
"
"
"      FETCH c_st INTO r_st;
"
"          EXIT WHEN c_st%NOTFOUND;
"
"
"
"    END LOOP;
"
"
"
"      END IF;
"
"    CLOSE c_st;
"
"
"
"    IF ROUND(v_mac_cost,5) > 0 THEN
"
"
"
"    UPDATE stock_costs
"
"       SET stcost_cost = v_mac_cost,
"
"           stcost_upd_by = p_user,
"
"           stcost_upd_date = SYSDATE
"
"     WHERE stcost_bu = p_bu
"
"       AND stcost_store_id = p_store_id
"
"       AND stcost_prod_id = p_prod_id
"
"       AND stcost_prod_rev = p_prod_rev
"
"       AND NOT EXISTS (SELECT sme_prod_id
"
"                         FROM stk_mac_exp
"
"                        WHERE sme_bu = p_bu
"
"                          AND sme_store_id = p_store_id
"
"                          AND sme_prod_id = p_prod_id
"
"                          AND sme_prod_rev = p_prod_rev
"
"                          AND sme_mat_type = 'S');
"
"
"
"    END IF;
"
"
"
"    EXCEPTION
"
"      WHEN OTHERS THEN
"
"        v_err_msg := CONCAT(v_err_msg,SQLERRM);
"
"    proc_ins_exp(p_bu,'S',p_store_id,p_prod_id,p_prod_rev,'MAC',SUBSTR(DBMS_UTILITY.FORMAT_ERROR_STACK, 1, 4000),p_user);
"
"
"
"  END proc_upd_mac_frm_std_stk_trans;
"
"
"
"
"
"  PROCEDURE proc_upd_bc_frm_std_stk_trans(p_bu        VARCHAR2,
"
"                              p_store_id    VARCHAR2,
"
"                              p_prod_id    VARCHAR2,
"
"                              p_prod_rev    NUMBER,
"
"                          p_cost_method    VARCHAR2,
"
"                      p_start_dt    DATE,
"
"                              p_user    VARCHAR2
"
"                             )
"
"  AS
"
"  CURSOR c_st IS
"
"  /*SELECT Qry.*,CASE WHEN Cumm_Qty = 0 THEN 0 ELSE ROUND(Cumm_val/Cumm_Qty,8) END mac_cost,
"
"         CASE WHEN Old_Trans_Qty = 0 THEN 0 ELSE ROUND((Old_Trans_Val / Old_Trans_Qty),8) END Old_Trans_UnitCost
"
"    FROM(SELECT sttr_bu,sttr_trans_seq_no,sttr_store_id,sttr_prod_id,sttr_prod_rev,
"
"                sttr_batch_no,sttr_trans_date,sttr_source_doc,sttr_cost_method,
"
"        sttr_vou_pfx,sttr_vou_no,sttr_vou_line_no,
"
"                sttr_trans_qty trans_qty,
"
"        sttr_bc_unit_cost trans_unitcost,
"
"                sttr_trans_qty * sttr_bc_unit_cost trans_val,
"
"                SUM(sttr_trans_qty) OVER (ORDER BY sttr_batch_no,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_qty,
"
"                SUM(sttr_trans_qty * sttr_bc_unit_cost) OVER (ORDER BY sttr_batch_no,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_val,
"
"        SUM(sttr_trans_qty) OVER (ORDER BY sttr_batch_no,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_qty,
"
"                SUM(sttr_trans_qty * sttr_bc_unit_cost) OVER (ORDER BY sttr_batch_no,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_val,
"
"                stcost_cost stk_cost
"
"           FROM stock_trans,stock_costs
"
"      WHERE stcost_bu = sttr_bu
"
"        AND stcost_store_id = sttr_store_id
"
"        AND stcost_prod_id = sttr_prod_id
"
"        AND stcost_prod_rev = sttr_prod_rev
"
"        AND sttr_bucket_type = 'QOH'
"
"        AND sttr_cost_method <> 'MAC'
"
"        AND sttr_bu = p_bu
"
"        AND sttr_store_id = p_store_id
"
"        AND sttr_prod_id = p_prod_id
"
"        AND sttr_prod_rev = p_prod_rev
"
"        sttr_trans_date >= p_start_dt) Qry
"
"      ORDER BY sttr_batch_no,sttr_trans_seq_no;*/
"
"
"
"SELECT Qry.*,CASE WHEN Cumm_Qty = 0 THEN 0 ELSE ROUND(Cumm_val/Cumm_Qty,8) END mac_cost,
"
"         CASE WHEN Old_Trans_Qty = 0 THEN 0 ELSE ROUND((Old_Trans_Val / Old_Trans_Qty),8) END Old_Trans_UnitCost
"
"    FROM(
"
"  SELECT SubQry.*,
"
"         SUM(trans_qty) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_qty,
"
"         SUM(trans_qty * trans_unitcost) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_val,
"
"         SUM(trans_qty) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_qty,
"
"         SUM(trans_qty * trans_unitcost) OVER (ORDER BY sttr_trans_date,sttr_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_val
"
"    FROM(SELECT sttr_bu,1 sttr_trans_seq_no,1 sttr_run_seq_no,sttr_store_id,sttr_prod_id,sttr_prod_rev,
"
"                TO_DATE(p_start_dt) sttr_trans_date,NULL sttr_batch_no,'OP' sttr_source_doc,NULL sttr_vou_pfx,NULL sttr_vou_no,NULL sttr_vou_line_no,
"
"                SUM(sttr_trans_qty) trans_qty,
"
"        CASE WHEN SUM(sttr_trans_qty) = 0 THEN 0 ELSE ROUND(SUM(sttr_bc_unit_cost * sttr_trans_qty)/SUM(sttr_trans_qty),8) END trans_unitcost,sttr_cost_method,
"
"                SUM(sttr_trans_qty * sttr_bc_unit_cost) trans_val
"
"           FROM stock_trans
"
"          WHERE sttr_bucket_type = 'QOH'
"
"        AND sttr_cost_method = p_cost_method
"
"        AND sttr_bu = p_bu
"
"            AND sttr_store_id = p_store_id
"
"            AND sttr_prod_id = p_prod_id
"
"            AND sttr_prod_rev = p_prod_rev
"
"            AND sttr_trans_date < p_start_dt
"
"          GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_cost_method
"
"         UNION ALL
"
"         SELECT sttr_bu,sttr_trans_seq_no,sttr_run_seq_no,sttr_store_id,sttr_prod_id,sttr_prod_rev,
"
"                sttr_trans_date,sttr_batch_no,sttr_source_doc,sttr_vou_pfx,sttr_vou_no,sttr_vou_line_no,
"
"                sttr_trans_qty trans_qty,sttr_bc_unit_cost trans_unitcost,sttr_cost_method,
"
"                sttr_trans_qty * sttr_bc_unit_cost trans_val
"
"           FROM stock_trans
"
"      WHERE sttr_bucket_type = 'QOH'
"
"        AND sttr_cost_method = p_cost_method
"
"        AND sttr_bu = p_bu
"
"        AND sttr_store_id = p_store_id
"
"        AND sttr_prod_id = p_prod_id
"
"        AND sttr_prod_rev = p_prod_rev
"
"        AND sttr_trans_date >= p_start_dt) SubQry) Qry
"
"      ORDER BY sttr_trans_date,sttr_trans_seq_no;
"
"
"
"  r_st    c_st%ROWTYPE;
"
"
"
"  v_mac_cost        NUMBER(20,8) := 0;
"
"  v_doc_unit_cost    NUMBER(20,8) := 0;
"
"  v_cons_batch_cost    NUMBER(20,8) := 0;
"
"
"
"  v_batch_cost        NUMBER(20,8) := 0;
"
"  v_iss_cost        NUMBER(20,8) := 0;
"
"
"
"  v_store_id        stores.store_id%TYPE;
"
"  v_batch_no        stocks_batches.sb_batch_id%TYPE;
"
"
"
"  v_break        VARCHAR2(1) := 'N';
"
"
"
"  v_err_msg        VARCHAR2(2500);
"
"  v_rec_count        NUMBER := 0;
"
"
"
"  v_upd_seq_no        NUMBER;
"
"
"
"  BEGIN
"
"
"
"    UPDATE stock_trans
"
"       SET sttr_run_seq_no = NULL
"
"     WHERE sttr_bu = p_bu
"
"       AND sttr_store_id = p_store_id
"
"       AND sttr_prod_id = p_prod_id
"
"       AND sttr_prod_rev = p_prod_rev;
"
"
"
"    <<mac_cost>>
"
"    v_break := 'N';
"
"    v_upd_seq_no := 0;
"
"
"
"    OPEN c_st;
"
"    FETCH c_st INTO r_st;
"
"      IF c_st%FOUND THEN
"
"
"
"    LOOP
"
"
"
"      v_rec_count := v_rec_count + 1;
"
"
"
"          IF r_st.cumm_qty < 0 THEN
"
"
"
"            INSERT INTO stk_mac_exp(sme_bu,
"
"                                    sme_mat_type,
"
"                                    sme_store_id,
"
"                                    sme_prod_id,
"
"                                    sme_prod_rev,
"
"                    sme_cost_method,
"
"                    sme_err_msg,
"
"                    sme_cre_by,
"
"                    sme_cre_date
"
"                                   )
"
"                             VALUES(p_bu,
"
"                                    'S',
"
"                                    p_store_id,
"
"                                    p_prod_id,
"
"                                    p_prod_rev,
"
"                    p_cost_method,
"
"                    'Negative Stock',
"
"                    p_user,
"
"                    SYSDATE
"
"                                   );
"
"            Exit;
"
"
"
"      END IF;
"
"
"
"      IF c_st%ROWCOUNT = 1 THEN
"
"
"
"        IF r_st.sttr_source_doc = 'SA' THEN
"
"
"
"              SELECT satln_unit_cost
"
"                INTO v_doc_unit_cost
"
"                FROM stock_adj_trans_ln
"
"               WHERE satln_bu = r_st.sttr_bu
"
"                 AND satln_ord_no = r_st.sttr_vou_no
"
"                 AND satln_seq_no = r_st.sttr_vou_line_no;
"
"
"
"            UPDATE stock_trans
"
"               SET sttr_bc_unit_cost = v_doc_unit_cost
"
"             WHERE sttr_bu = r_st.sttr_bu
"
"               AND sttr_store_id = r_st.sttr_store_id
"
"               AND sttr_prod_id = r_st.sttr_prod_id
"
"               AND sttr_prod_rev = r_st.sttr_prod_rev
"
"               AND ((sttr_vou_pfx = r_st.sttr_vou_pfx) OR
"
"                (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"               AND sttr_vou_no = r_st.sttr_vou_no
"
"               AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR
"
"                (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"               AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"           AND sttr_batch_no = r_st.sttr_batch_no
"
"           AND sttr_bucket_type = 'QOH';
"
"
"
"            UPDATE stocks_batches
"
"           SET sb_bc_unit_cost = v_doc_unit_cost
"
"         WHERE sb_bu = r_st.sttr_bu
"
"           AND sb_store_id = r_st.sttr_store_id
"
"           AND sb_prod_id = r_st.sttr_prod_id
"
"           AND sb_prod_rev = r_st.sttr_prod_rev
"
"           AND sb_batch_id = r_st.sttr_batch_no
"
"           AND sb_cost_method = r_st.sttr_cost_method;
"
"
"
"          v_mac_cost := v_doc_unit_cost;
"
"          v_batch_cost := v_doc_unit_cost;
"
"
"
"        ELSE
"
"          v_mac_cost := r_st.mac_cost;
"
"          v_batch_cost := r_st.trans_unitcost;
"
"        END IF;
"
"
"
"      ELSE
"
"
"
"        IF r_st.trans_qty > 0 THEN
"
"
"
"          IF v_break = 'Y' THEN
"
"                CLOSE c_st;
"
"                GOTO mac_cost;
"
"              END IF;
"
"
"
"          IF r_st.sttr_source_doc IN ('IC','SR') AND v_mac_cost > 0 THEN
"
"
"
"            UPDATE stock_trans
"
"               SET sttr_bc_unit_cost = v_mac_cost
"
"             WHERE sttr_bu = r_st.sttr_bu
"
"               AND sttr_store_id = r_st.sttr_store_id
"
"               AND sttr_prod_id = r_st.sttr_prod_id
"
"               AND sttr_prod_rev = r_st.sttr_prod_rev
"
"               AND ((sttr_vou_pfx = r_st.sttr_vou_pfx) OR
"
"                (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"               AND sttr_vou_no = r_st.sttr_vou_no
"
"               AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR
"
"                (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"               AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"           AND sttr_batch_no = r_st.sttr_batch_no
"
"           AND sttr_bucket_type = 'QOH';
"
"
"
"            UPDATE stocks_batches
"
"           SET sb_bc_unit_cost = v_mac_cost
"
"         WHERE sb_bu = r_st.sttr_bu
"
"           AND sb_store_id = r_st.sttr_store_id
"
"           AND sb_prod_id = r_st.sttr_prod_id
"
"           AND sb_prod_rev = r_st.sttr_prod_rev
"
"           AND sb_batch_id = r_st.sttr_batch_no
"
"           AND sb_cost_method = r_st.sttr_cost_method;
"
"
"
"          ELSIF r_st.sttr_source_doc = 'SA' AND v_mac_cost > 0 THEN
"
"
"
"        SELECT satln_unit_cost
"
"          INTO v_doc_unit_cost
"
"          FROM stock_adj_trans_ln
"
"         WHERE satln_bu = r_st.sttr_bu
"
"           AND satln_ord_no = r_st.sttr_vou_no
"
"           AND satln_seq_no = r_st.sttr_vou_line_no;
"
"
"
"            UPDATE stock_trans
"
"               SET sttr_bc_unit_cost = v_doc_unit_cost
"
"             WHERE sttr_bu = r_st.sttr_bu
"
"               AND sttr_store_id = r_st.sttr_store_id
"
"               AND sttr_prod_id = r_st.sttr_prod_id
"
"               AND sttr_prod_rev = r_st.sttr_prod_rev
"
"               AND ((sttr_vou_pfx = r_st.sttr_vou_pfx) OR
"
"                (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"               AND sttr_vou_no = r_st.sttr_vou_no
"
"               AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR
"
"                (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"               AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"           AND sttr_batch_no = r_st.sttr_batch_no
"
"           AND sttr_bucket_type = 'QOH';
"
"
"
"            UPDATE stocks_batches
"
"           SET sb_bc_unit_cost = v_doc_unit_cost
"
"         WHERE sb_bu = r_st.sttr_bu
"
"           AND sb_store_id = r_st.sttr_store_id
"
"           AND sb_prod_id = r_st.sttr_prod_id
"
"           AND sb_prod_rev = r_st.sttr_prod_rev
"
"           AND sb_batch_id = r_st.sttr_batch_no
"
"           AND sb_cost_method = r_st.sttr_cost_method;
"
"
"
"          ELSE
"
"
"
"            v_mac_cost := r_st.mac_cost;
"
"
"
"        v_batch_cost := r_st.trans_unitcost;
"
"
"
"          END IF;
"
"
"
"        ELSE
"
"
"
"          BEGIN
"
"          SELECT sttr_bc_unit_cost
"
"            INTO v_batch_cost
"
"        FROM stock_trans
"
"           WHERE sttr_bu = p_bu
"
"             AND sttr_store_id = p_store_id
"
"             AND sttr_prod_id = p_prod_id
"
"             AND sttr_prod_rev = p_prod_rev
"
"             AND sttr_cost_method = p_cost_method
"
"         AND sttr_batch_no = r_st.sttr_batch_no
"
"         AND sttr_bucket_type = 'QOH'
"
"         AND sttr_trans_qty > 0;
"
"
"
"              EXCEPTION
"
"                WHEN NO_DATA_FOUND THEN
"
"                  Raise_Application_Error(-20001,'Batch Cost '||r_st.sttr_batch_no);
"
"        WHEN OTHERS THEN
"
"          Raise_Application_Error(-20004,'Batch Cost '||r_st.sttr_batch_no);
"
"              END;
"
"
"
"          IF ROUND(r_st.trans_unitcost,8) <> v_batch_cost THEN
"
"
"
"            v_break := 'Y';
"
"
"
"            IF r_st.sttr_source_doc IN ('MI','MT','MW') THEN
"
"
"
"          UPDATE inv_stock_trans_cst_batch_hist
"
"             SET istcbh_unit_cost = v_batch_cost
"
"           WHERE istcbh_bu = r_st.sttr_bu
"
"             AND istcbh_doc_no = r_st.sttr_vou_no
"
"             AND istcbh_seq_no = r_st.sttr_vou_line_no
"
"             AND istcbh_batch_no = r_st.sttr_batch_no;
"
"
"
"              UPDATE stock_trans
"
"                 SET sttr_bc_unit_cost = v_batch_cost
"
"               WHERE sttr_bu = r_st.sttr_bu
"
"                 AND sttr_store_id = r_st.sttr_store_id
"
"                 AND sttr_prod_id = r_st.sttr_prod_id
"
"                 AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                 --AND sttr_vou_pfx IS NULL
"
"                 AND sttr_vou_no = r_st.sttr_vou_no
"
"                 AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"             AND sttr_batch_no = r_st.sttr_batch_no
"
"                 AND sttr_appl = 'ICM'
"
"             AND sttr_bucket_type = 'QOH';
"
"
"
"              UPDATE stock_trans
"
"                 SET sttr_bc_unit_cost = v_batch_cost
"
"               WHERE sttr_bu = r_st.sttr_bu
"
"                 AND sttr_store_id <> r_st.sttr_store_id
"
"                 AND sttr_prod_id = r_st.sttr_prod_id
"
"                 AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                 --AND sttr_vou_pfx IS NULL
"
"                 AND sttr_vou_no = r_st.sttr_vou_no
"
"                 AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"                 AND sttr_appl = 'ICM'
"
"             AND sttr_bucket_type = 'QOH'
"
"             AND sttr_trans_qty > 0;
"
"
"
"            ELSIF r_st.sttr_source_doc IN ('GRN','SRN','SMC','PR','NS','SP','ST','SO','RJN','SS','SR','FS','QC','DE','FE') THEN
"
"
"
"              UPDATE stock_trans
"
"                 SET sttr_bc_unit_cost = v_batch_cost
"
"               WHERE sttr_bu = r_st.sttr_bu
"
"                 AND sttr_store_id = r_st.sttr_store_id
"
"                 AND sttr_prod_id = r_st.sttr_prod_id
"
"                 AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                 AND sttr_vou_pfx = r_st.sttr_vou_pfx
"
"                 AND sttr_vou_no = r_st.sttr_vou_no
"
"                 AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"                 AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"             AND sttr_batch_no = r_st.sttr_batch_no
"
"             AND sttr_bucket_type = 'QOH';
"
"
"
"            ELSIF r_st.sttr_source_doc IN ('SA','ME','IC','SC') THEN
"
"
"
"          IF r_st.sttr_source_doc = 'SA' THEN
"
"
"
"            UPDATE stock_adj_trans_cost_batch
"
"               SET satcb_unit_cost = v_batch_cost
"
"             WHERE satcb_bu = r_st.sttr_bu
"
"               AND satcb_ord_no = r_st.sttr_vou_no
"
"               AND satcb_seq_no = r_st.sttr_vou_line_no
"
"               AND satcb_batch_no = r_st.sttr_batch_no;
"
"
"
"          END IF;
"
"
"
"              UPDATE stock_trans
"
"                 SET sttr_bc_unit_cost = v_batch_cost
"
"               WHERE sttr_bu = r_st.sttr_bu
"
"                 AND sttr_store_id = r_st.sttr_store_id
"
"                 AND sttr_prod_id = r_st.sttr_prod_id
"
"                 AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                 --AND sttr_vou_pfx IS NULL
"
"                 AND sttr_vou_no = r_st.sttr_vou_no
"
"                 AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"                 AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"             AND sttr_batch_no = r_st.sttr_batch_no
"
"             AND sttr_bucket_type = 'QOH';
"
"
"
"            ELSIF r_st.sttr_source_doc IN ('PMC','RMC','MCM') THEN
"
"
"
"              UPDATE stock_trans
"
"                 SET sttr_bc_unit_cost = v_batch_cost
"
"               WHERE sttr_bu = r_st.sttr_bu
"
"                 AND sttr_store_id = r_st.sttr_store_id
"
"                 AND sttr_prod_id = r_st.sttr_prod_id
"
"                 AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                 --AND sttr_vou_pfx IS NULL
"
"                 AND sttr_vou_no = r_st.sttr_vou_no
"
"                 AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"                 AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"             AND sttr_batch_no = r_st.sttr_batch_no
"
"             AND sttr_bucket_type = 'QOH';
"
"
"
"          IF r_st.sttr_source_doc = 'PMC' THEN
"
"
"
"            UPDATE prod_trans_batch_detail_hist
"
"               SET ptbh_unit_cost = v_batch_cost
"
"             WHERE ptbh_bu = r_st.sttr_bu
"
"               AND ptbh_plnt = func_find_store_plnt(r_st.sttr_bu,r_st.sttr_store_id)
"
"               AND ptbh_trans_no = r_st.sttr_vou_no
"
"               AND ptbh_store_id = r_st.sttr_store_id
"
"               AND ptbh_prod_id = r_st.sttr_prod_id
"
"               AND ptbh_prod_rev = r_st.sttr_prod_rev
"
"               AND ptbh_batch_id = r_st.sttr_batch_no;
"
"
"
"            SELECT SUM(ptbh_used_qty * ptbh_unit_cost) / SUM(ptbh_used_qty)
"
"              INTO v_cons_batch_cost
"
"              FROM prod_trans_batch_detail_hist
"
"             WHERE ptbh_bu = r_st.sttr_bu
"
"               AND ptbh_plnt = func_find_store_plnt(r_st.sttr_bu,r_st.sttr_store_id)
"
"               AND ptbh_trans_no = r_st.sttr_vou_no
"
"               AND ptbh_store_id = r_st.sttr_store_id
"
"               AND ptbh_prod_id = r_st.sttr_prod_id
"
"               AND ptbh_prod_rev = r_st.sttr_prod_rev;
"
"
"
"            UPDATE prod_transfer_mat_cons_hist
"
"               SET ptmch_unit_cost = v_cons_batch_cost
"
"             WHERE ptmch_bu = r_st.sttr_bu
"
"               AND ptmch_plnt = func_find_store_plnt(r_st.sttr_bu,r_st.sttr_store_id)
"
"               AND ptmch_trans_no = r_st.sttr_vou_no
"
"               AND ptmch_prod_id = r_st.sttr_prod_id
"
"               AND ptmch_prod_rev = r_st.sttr_prod_rev
"
"               AND ptmch_store_id = r_st.sttr_store_id
"
"               AND ptmch_mat_type = 'S';
"
"
"
"          END IF;
"
"
"
"          /*proc_upd_wip_cost(r_st.sttr_bu,
"
"                            func_find_store_plnt(r_st.sttr_bu,r_st.sttr_store_id),
"
"                    r_st.sttr_vou_no
"
"                   );*/
"
"
"
"              /*proc_upd_fmcg_cons_cost(r_st.sttr_bu,
"
"                      r_st.sttr_vou_no,
"
"                      r_st.sttr_prod_id,
"
"                      r_st.sttr_prod_rev,
"
"                      r_st.sttr_store_id,
"
"                      r_st.sttr_batch_no,
"
"                      v_batch_cost);*/
"
"
"
"            ELSE
"
"              Raise_Application_Error(-20999,'HRM Source '||r_st.sttr_source_doc);
"
"              Exit;
"
"            END IF;
"
"
"
"          ELSE
"
"
"
"            IF r_st.sttr_source_doc = 'SA' THEN
"
"
"
"          UPDATE stock_adj_trans_cost_batch
"
"             SET satcb_unit_cost = v_batch_cost
"
"           WHERE satcb_bu = r_st.sttr_bu
"
"             AND satcb_ord_no = r_st.sttr_vou_no
"
"             AND satcb_seq_no = r_st.sttr_vou_line_no
"
"             AND satcb_batch_no = r_st.sttr_batch_no
"
"             AND satcb_unit_cost <> v_batch_cost;
"
"
"
"        ELSIF r_st.sttr_source_doc IN ('MI','MT','MW') THEN
"
"
"
"          UPDATE inv_stock_trans_cst_batch_hist
"
"             SET istcbh_unit_cost = v_batch_cost
"
"           WHERE istcbh_bu = r_st.sttr_bu
"
"             AND istcbh_doc_no = r_st.sttr_vou_no
"
"             AND istcbh_seq_no = r_st.sttr_vou_line_no
"
"             AND istcbh_batch_no = r_st.sttr_batch_no
"
"             AND istcbh_unit_cost <> v_batch_cost;
"
"
"
"        END IF;
"
"
"
"          END IF;
"
"
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"      IF r_st.sttr_source_doc IN ('MI','MW') THEN
"
"
"
"        BEGIN
"
"          SELECT SUM(istcb_trans_qty * istcb_unit_cost) / SUM(istcb_trans_qty)
"
"        INTO v_iss_cost
"
"        FROM inv_stock_trans_cost_batch_vw
"
"           WHERE istcb_bu = r_st.sttr_bu
"
"         AND istcb_doc_no = r_st.sttr_vou_no
"
"         AND istcb_seq_no = r_st.sttr_vou_line_no;
"
"        EXCEPTION
"
"              WHEN OTHERS THEN
"
"                Raise_Application_Error(-20002,'Material Issuance '||r_st.sttr_vou_no||'/'||r_st.sttr_vou_line_no);
"
"            END;
"
"
"
"            UPDATE inv_stock_trans_ln_hist
"
"           SET istlnh_unit_cost = v_iss_cost
"
"         WHERE istlnh_bu = r_st.sttr_bu
"
"           AND istlnh_prod_id = r_st.sttr_prod_id
"
"           AND istlnh_prod_rev = r_st.sttr_prod_rev
"
"           AND istlnh_doc_no = r_st.sttr_vou_no
"
"           AND istlnh_seq_no = r_st.sttr_vou_line_no;
"
"
"
"        /*BEGIN
"
"          UPDATE stock_trans
"
"             SET sttr_bc_unit_cost = v_iss_cost
"
"           WHERE sttr_bu = r_st.sttr_bu
"
"             AND sttr_store_id <> r_st.sttr_store_id
"
"             AND sttr_prod_id = r_st.sttr_prod_id
"
"             AND sttr_prod_rev = r_st.sttr_prod_rev
"
"             AND sttr_vou_pfx IS NULL
"
"             AND sttr_vou_no = r_st.sttr_vou_no
"
"             AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"             AND sttr_appl = 'ICM'
"
"             AND sttr_bucket_type = 'QOH'
"
"         AND sttr_trans_qty > 0
"
"          RETURNING sttr_store_id,sttr_batch_no INTO v_store_id,v_batch_no;
"
"        EXCEPTION
"
"          WHEN OTHERS THEN
"
"            Raise_Application_Error(-20003,'More Rec. '||r_st.sttr_vou_no||'/'||r_st.sttr_vou_line_no);
"
"        END;
"
"
"
"        UPDATE stocks_batches
"
"           SET sb_bc_unit_cost = v_mac_cost
"
"         WHERE sb_bu = r_st.sttr_bu
"
"           AND sb_store_id = v_store_id
"
"           AND sb_prod_id = r_st.sttr_prod_id
"
"           AND sb_prod_rev = r_st.sttr_prod_rev
"
"           AND sb_batch_id = v_batch_no
"
"           AND sb_cost_method = r_st.sttr_cost_method;*/
"
"
"
"            UPDATE std_stk_upd_mac_cost
"
"               SET sttr_upd_flag = 'N'
"
"             WHERE sttr_bu = p_bu
"
"               AND sttr_store_id = v_store_id
"
"           AND sttr_prod_id = r_st.sttr_prod_id
"
"           AND sttr_prod_rev = r_st.sttr_prod_rev
"
"           AND sttr_cost_method = r_st.sttr_cost_method;
"
"
"
"          END IF;
"
"
"
"      IF r_st.sttr_source_doc = 'SA' AND r_st.trans_qty < 0 THEN
"
"
"
"            FOR r_cb IN(SELECT SUM(satcb_trans_qty * satcb_unit_cost)/SUM(satcb_trans_qty) cb_cost
"
"                  FROM stock_adj_trans_cost_batch
"
"                 WHERE satcb_bu = r_st.sttr_bu
"
"                   AND satcb_ord_no = r_st.sttr_vou_no
"
"                   AND satcb_seq_no = r_st.sttr_vou_line_no)
"
"            LOOP
"
"          UPDATE stock_adj_trans_ln
"
"             SET satln_unit_cost = r_cb.cb_cost
"
"           WHERE satln_bu = r_st.sttr_bu
"
"             AND satln_ord_no = r_st.sttr_vou_no
"
"             AND satln_seq_no = r_st.sttr_vou_line_no;
"
"            END LOOP;
"
"
"
"      END IF;
"
"
"
"      IF r_st.sttr_source_doc = 'MT' THEN
"
"
"
"        BEGIN
"
"          SELECT SUM(istcb_trans_qty * istcb_unit_cost) / SUM(istcb_trans_qty)
"
"        INTO v_iss_cost
"
"        FROM inv_stock_trans_cost_batch_vw
"
"           WHERE istcb_bu = r_st.sttr_bu
"
"         AND istcb_doc_no = r_st.sttr_vou_no
"
"         AND istcb_seq_no = r_st.sttr_vou_line_no;
"
"        EXCEPTION
"
"              WHEN OTHERS THEN
"
"                Raise_Application_Error(-20002,'Material Issuance '||r_st.sttr_vou_no||'/'||r_st.sttr_vou_line_no);
"
"            END;
"
"
"
"            UPDATE inv_stock_trans_ln_hist
"
"           SET istlnh_unit_cost = v_iss_cost
"
"         WHERE istlnh_bu = r_st.sttr_bu
"
"           AND istlnh_prod_id = r_st.sttr_prod_id
"
"           AND istlnh_prod_rev = r_st.sttr_prod_rev
"
"           AND istlnh_doc_no = r_st.sttr_vou_no
"
"           AND istlnh_seq_no = r_st.sttr_vou_line_no;
"
"
"
"        FOR r_sb IN (SELECT sttr_store_id,sttr_batch_no
"
"                       FROM stock_trans
"
"              WHERE sttr_bu = r_st.sttr_bu
"
"                        AND sttr_store_id <> r_st.sttr_store_id
"
"                AND sttr_prod_id = r_st.sttr_prod_id
"
"                AND sttr_prod_rev = r_st.sttr_prod_rev
"
"                --AND sttr_vou_pfx IS NULL
"
"                AND sttr_vou_no = r_st.sttr_vou_no
"
"                AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"                AND sttr_appl = 'ICM'
"
"                AND sttr_bucket_type = 'QOH'
"
"              ORDER BY sttr_batch_no)
"
"        LOOP
"
"
"
"          v_store_id := r_sb.sttr_store_id;
"
"
"
"          UPDATE stock_trans
"
"             SET sttr_bc_unit_cost = v_iss_cost
"
"           WHERE sttr_bu = r_st.sttr_bu
"
"             AND sttr_store_id = v_store_id
"
"             AND sttr_prod_id = r_st.sttr_prod_id
"
"             AND sttr_prod_rev = r_st.sttr_prod_rev
"
"             --AND sttr_vou_pfx IS NULL
"
"             AND sttr_vou_no = r_st.sttr_vou_no
"
"             AND sttr_vou_line_no = r_st.sttr_vou_line_no
"
"         AND sttr_batch_no = r_sb.sttr_batch_no
"
"             AND sttr_appl = 'ICM'
"
"             AND sttr_bucket_type = 'QOH'
"
"         AND sttr_trans_qty > 0;
"
"
"
"        IF v_mac_cost IS NULL THEN
"
"          v_mac_cost := r_st.trans_unitcost;
"
"        END IF;
"
"
"
"        UPDATE stocks_batches
"
"           SET sb_bc_unit_cost = v_mac_cost
"
"         WHERE sb_bu = r_st.sttr_bu
"
"           AND sb_store_id = v_store_id
"
"           AND sb_prod_id = r_st.sttr_prod_id
"
"           AND sb_prod_rev = r_st.sttr_prod_rev
"
"           AND sb_batch_id = r_sb.sttr_batch_no
"
"           AND sb_cost_method = r_st.sttr_cost_method;
"
"
"
"        END LOOP;
"
"
"
"            UPDATE std_stk_upd_mac_cost
"
"               SET sttr_upd_flag = 'N'
"
"             WHERE sttr_bu = p_bu
"
"               AND sttr_store_id = v_store_id
"
"           AND sttr_prod_id = r_st.sttr_prod_id
"
"           AND sttr_prod_rev = r_st.sttr_prod_rev
"
"           AND sttr_cost_method = r_st.sttr_cost_method;
"
"
"
"          END IF;
"
"
"
"      v_upd_seq_no := v_upd_seq_no + 1;
"
"
"
"      UPDATE stock_trans
"
"         SET sttr_old_qoh = NVL(r_st.old_trans_qty,0),
"
"             sttr_old_unit_cost = NVL(r_st.old_trans_unitcost,0),
"
"         sttr_run_seq_no = v_upd_seq_no
"
"       WHERE sttr_bu = r_st.sttr_bu
"
"         AND sttr_store_id = r_st.sttr_store_id
"
"         AND sttr_prod_id = r_st.sttr_prod_id
"
"         AND sttr_prod_rev = r_st.sttr_prod_rev
"
"         AND (sttr_vou_pfx = r_st.sttr_vou_pfx OR (sttr_vou_pfx IS NULL AND r_st.sttr_vou_pfx IS NULL))
"
"         AND sttr_vou_no = r_st.sttr_vou_no
"
"         AND (sttr_vou_line_no = r_st.sttr_vou_line_no OR (sttr_vou_line_no IS NULL AND r_st.sttr_vou_line_no IS NULL))
"
"         AND sttr_trans_seq_no = r_st.sttr_trans_seq_no
"
"         AND sttr_batch_no = r_st.sttr_batch_no
"
"         AND sttr_bucket_type = 'QOH';
"
"
"
"          /*IF v_rec_count >= p_limit THEN
"
"            INSERT INTO stk_mac_exp(sme_bu,
"
"                                    sme_mat_type,
"
"                                    sme_store_id,
"
"                    sme_prod_id,
"
"                    sme_prod_rev,
"
"                    sme_cost_method,
"
"                    sme_err_msg
"
"                   )
"
"                 VALUES(p_bu,
"
"                    'S',
"
"                    p_store_id,
"
"                    p_prod_id,
"
"                    p_prod_rev,
"
"                    p_cost_method,
"
"                    'Infinity LOOP'
"
"                   );
"
"            Exit;
"
"          END IF;*/
"
"
"
"      Commit;
"
"
"
"      FETCH c_st INTO r_st;
"
"          EXIT WHEN c_st%NOTFOUND;
"
"
"
"    END LOOP;
"
"
"
"      END IF;
"
"    CLOSE c_st;
"
"
"
"    UPDATE stock_costs
"
"       SET stcost_cost = v_mac_cost,
"
"           stcost_upd_by = p_user,
"
"           stcost_upd_date = SYSDATE
"
"     WHERE stcost_bu = p_bu
"
"       AND stcost_store_id = p_store_id
"
"       AND stcost_prod_id = p_prod_id
"
"       AND stcost_prod_rev = p_prod_rev
"
"       AND NOT EXISTS (SELECT sme_prod_id
"
"                         FROM stk_mac_exp
"
"                        WHERE sme_bu = p_bu
"
"                          AND sme_store_id = p_store_id
"
"                          AND sme_prod_id = p_prod_id
"
"                          AND sme_prod_rev = p_prod_rev
"
"                          AND sme_mat_type = 'S');
"
"
"
"    EXCEPTION
"
"      WHEN OTHERS THEN
"
"        v_err_msg := CONCAT(v_err_msg,SQLERRM);
"
"    INSERT INTO stk_mac_exp(sme_bu,
"
"                                sme_mat_type,
"
"                                sme_store_id,
"
"                                sme_prod_id,
"
"                                sme_prod_rev,
"
"                sme_cost_method,
"
"                sme_err_msg,sme_cre_by,sme_cre_date
"
"                               )
"
"                         VALUES(p_bu,
"
"                                'S',
"
"                                p_store_id,
"
"                                p_prod_id,
"
"                                p_prod_rev,
"
"                p_cost_method,
"
"                v_err_msg,p_user,SYSDATE
"
"                               );
"
"
"
"  END proc_upd_bc_frm_std_stk_trans;
"
"
"
"  PROCEDURE proc_upd_mac_frm_sf_stk_trans(p_bu        VARCHAR2,
"
"                          p_store_id    VARCHAR2,
"
"                          p_prod_id    VARCHAR2,
"
"                          p_prod_rev    NUMBER,
"
"                          p_prod_ord_no    VARCHAR2,
"
"                          p_sf_code    VARCHAR2,
"
"                      p_sys_ls_no    VARCHAR2,
"
"                          p_start_dt    DATE,
"
"                      p_end_dt    DATE,
"
"                          p_limit    NUMBER,
"
"                              p_user    VARCHAR2
"
"                         )
"
"  AS
"
"  CURSOR c_sfst IS
"
"  SELECT Qry.*,CASE WHEN Cumm_Qty = 0 THEN 0 ELSE ROUND(Cumm_val/Cumm_Qty,8) END mac_cost,
"
"         CASE WHEN Old_Trans_Qty = 0 THEN 0 ELSE ROUND((Old_Trans_Val / Old_Trans_Qty),8) END Old_Trans_UnitCost
"
"    FROM(SELECT SubQry.*,
"
"                SUM(trans_qty) OVER (ORDER BY stsfg_trans_date,stsfg_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_qty,
"
"                SUM(trans_qty * trans_unitcost) OVER (ORDER BY stsfg_trans_date,stsfg_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING) old_trans_val,
"
"                SUM(trans_qty) OVER (ORDER BY stsfg_trans_date,stsfg_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_qty,
"
"                SUM(trans_qty * trans_unitcost) OVER (ORDER BY stsfg_trans_date,stsfg_trans_seq_no ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumm_val
"
"           FROM(SELECT stsfg_bu,1 stsfg_trans_seq_no,1 stsfg_run_seq_no,stsfg_store_plnt,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,
"
"                       stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no,TO_DATE(p_start_dt) stsfg_trans_date,'OP' stsfg_source_doc,
"
"                       NULL stsfg_vou_pfx,NULL stsfg_vou_no,NULL stsfg_vou_line_no,SUM(stsfg_trans_qty) trans_qty,
"
"               CASE WHEN SUM(stsfg_trans_qty) = 0 THEN 0 ELSE ROUND(SUM(stsfg_unit_cost * stsfg_trans_qty)/SUM(stsfg_trans_qty),8) END trans_unitcost,
"
"                       SUM(stsfg_trans_qty * stsfg_unit_cost) trans_val
"
"                  FROM stock_trans_sfg
"
"                 WHERE stsfg_bucket_type = 'QOH'
"
"           AND stsfg_bu = p_bu
"
"                   AND stsfg_store_id = p_store_id
"
"                   AND stsfg_prod_id = p_prod_id
"
"                   AND stsfg_prod_rev = p_prod_rev
"
"                   AND (stsfg_ord_no = p_prod_ord_no OR (stsfg_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"                   AND stsfg_sf_code = p_sf_code
"
"                   AND (stsfg_sys_ls_no = p_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND p_sys_ls_no IS NULL))
"
"                   AND stsfg_trans_date < p_start_dt
"
"         GROUP BY stsfg_bu,stsfg_store_plnt,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no
"
"        UNION ALL
"
"                SELECT stsfg_bu,stsfg_trans_seq_no,stsfg_run_seq_no,stsfg_store_plnt,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no,
"
"                       stsfg_trans_date,stsfg_source_doc,stsfg_vou_pfx,stsfg_vou_no,stsfg_vou_line_no,
"
"                       stsfg_trans_qty trans_qty,
"
"               stsfg_unit_cost trans_unitcost,
"
"                       (stsfg_trans_qty * stsfg_unit_cost) trans_val
"
"                  FROM stock_trans_sfg
"
"                 WHERE stsfg_bucket_type = 'QOH'
"
"           AND stsfg_bu = p_bu
"
"                   AND stsfg_store_id = p_store_id
"
"                   AND stsfg_prod_id = p_prod_id
"
"                   AND stsfg_prod_rev = p_prod_rev
"
"                   AND (stsfg_ord_no = p_prod_ord_no OR (stsfg_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"                   AND stsfg_sf_code = p_sf_code
"
"                   AND (stsfg_sys_ls_no = p_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND p_sys_ls_no IS NULL))
"
"                   AND stsfg_trans_date >= p_start_dt
"
"           AND (stsfg_trans_date <= p_end_dt OR p_end_dt IS NULL)
"
"          ) SubQry )Qry
"
"   ORDER BY stsfg_trans_date,stsfg_trans_seq_no;
"
"
"
"    r_sfst        c_sfst%ROWTYPE;
"
"
"
"    v_doc_unit_cost    NUMBER(20,8) := 0;
"
"
"
"    v_err_msg        VARCHAR2(1000);
"
"    v_mac_cost    NUMBER := 0;
"
"    v_break        VARCHAR2(1) := 'N';
"
"
"
"    v_rec_count        NUMBER := 0;
"
"
"
"    v_store_id        VARCHAR2(10);
"
"    v_upd_seq_no    NUMBER;
"
"    v_dc_no        VARCHAR2(15);
"
"    v_dc_seq_no        NUMBER;
"
"    v_dc_doc_no        VARCHAR2(15);
"
"    v_mr_vou_no        VARCHAR2(15);
"
"    v_mr_vou_line_no    NUMBER;
"
"
"
"  BEGIN
"
"  --Raise_application_Error(-20999,'HRM '||'/'||v_mac_cost);
"
"
"
"    v_err_msg := p_store_id||'~'||p_prod_id||'~'||p_prod_rev||'~'||p_prod_ord_no||'~'||p_sf_code;
"
"
"
"    UPDATE stock_trans_sfg
"
"       SET stsfg_run_seq_no = NULL
"
"     WHERE stsfg_bu = p_bu
"
"       AND stsfg_store_id = p_store_id
"
"       AND stsfg_prod_id = p_prod_id
"
"       AND stsfg_prod_rev = p_prod_rev
"
"       AND (stsfg_ord_no = p_prod_ord_no OR (stsfg_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"       AND stsfg_sf_code = p_sf_code
"
"       AND (stsfg_sys_ls_no = p_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND p_sys_ls_no IS NULL))
"
"       AND stsfg_trans_date >= p_start_dt;
"
"
"
"    <<mac_sf_cost>>
"
"
"
"    v_break := 'N';
"
"    v_upd_seq_no := 0;
"
"
"
"    OPEN c_sfst;
"
"    FETCH c_sfst INTO r_sfst;
"
"      IF c_sfst%FOUND THEN
"
"
"
"        LOOP
"
"
"
"      v_rec_count := v_rec_count + 1;
"
"
"
"      IF r_sfst.cumm_qty < 0 THEN
"
"
"
"        proc_ins_exp(p_bu,'F',p_store_id,p_prod_id,p_prod_rev,'MAC','Negative Stock',p_user,p_prod_ord_no,p_sf_code,p_sys_ls_no);
"
"
"
"            Exit;
"
"
"
"      END IF;
"
"
"
"      IF c_sfst%ROWCOUNT = 1 THEN
"
"
"
"        IF r_sfst.stsfg_source_doc = 'SA' THEN
"
"
"
"              BEGIN
"
"          SELECT satln_unit_cost
"
"                INTO v_doc_unit_cost
"
"                FROM stock_adj_trans_ln
"
"               WHERE satln_bu = r_sfst.stsfg_bu
"
"                 AND satln_ord_no = r_sfst.stsfg_vou_no
"
"                 AND satln_seq_no = r_sfst.stsfg_vou_line_no;
"
"          EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN v_doc_unit_cost := r_sfst.mac_cost;
"
"          END;
"
"
"
"          UPDATE stock_trans_sfg
"
"             SET stsfg_unit_cost = v_doc_unit_cost
"
"           WHERE stsfg_bu = r_sfst.stsfg_bu
"
"             AND stsfg_store_id = r_sfst.stsfg_store_id
"
"             AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"             AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"             AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"             AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"         AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"             AND stsfg_vou_no = r_sfst.stsfg_vou_no
"
"             AND stsfg_vou_line_no = r_sfst.stsfg_vou_line_no
"
"             AND stsfg_trans_seq_no = r_sfst.stsfg_trans_seq_no
"
"         AND stsfg_bucket_type = 'QOH'
"
"         AND stsfg_unit_cost <> v_doc_unit_cost;
"
"
"
"          IF SQL%FOUND THEN
"
"            v_break := 'Y';
"
"          END IF;
"
"
"
"          v_mac_cost := v_doc_unit_cost;
"
"
"
"        ELSE
"
"
"
"          v_mac_cost := r_sfst.mac_cost;
"
"
"
"        END IF;
"
"
"
"        Commit;
"
"
"
"      ELSE
"
"
"
"        IF r_sfst.trans_qty > 0 THEN
"
"
"
"          IF r_sfst.stsfg_source_doc = 'SA' THEN
"
"
"
"            BEGIN
"
"        SELECT satln_unit_cost
"
"          INTO v_doc_unit_cost
"
"          FROM stock_adj_trans_ln
"
"         WHERE satln_bu = r_sfst.stsfg_bu
"
"           AND satln_ord_no = r_sfst.stsfg_vou_no
"
"           AND satln_seq_no = r_sfst.stsfg_vou_line_no;
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN v_doc_unit_cost := r_sfst.mac_cost;
"
"                END;
"
"
"
"            UPDATE stock_trans_sfg
"
"               SET stsfg_unit_cost = v_doc_unit_cost
"
"             WHERE stsfg_bu = r_sfst.stsfg_bu
"
"               AND stsfg_store_id = r_sfst.stsfg_store_id
"
"               AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"               AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"               AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"               AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"           AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"               AND stsfg_vou_pfx IS NULL
"
"               AND stsfg_vou_no = r_sfst.stsfg_vou_no
"
"               AND stsfg_vou_line_no = r_sfst.stsfg_vou_line_no
"
"               AND stsfg_trans_seq_no = r_sfst.stsfg_trans_seq_no
"
"           AND stsfg_run_seq_no IS NULL
"
"           AND stsfg_unit_cost <> v_doc_unit_cost;
"
"
"
"            IF SQL%FOUND THEN
"
"          v_break := 'Y';
"
"        END IF;
"
"
"
"          ELSIF r_sfst.stsfg_source_doc IN ('IC','SR') AND v_mac_cost > 0 THEN
"
"
"
"            UPDATE stock_trans_sfg
"
"               SET stsfg_unit_cost = v_mac_cost
"
"             WHERE stsfg_bu = r_sfst.stsfg_bu
"
"               AND stsfg_store_id = r_sfst.stsfg_store_id
"
"               AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"               AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"               AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"               AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"           AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"               AND (stsfg_vou_pfx = r_sfst.stsfg_vou_pfx OR (stsfg_vou_pfx IS NULL AND r_sfst.stsfg_vou_pfx IS NULL))
"
"               AND stsfg_vou_no = r_sfst.stsfg_vou_no
"
"               AND stsfg_vou_line_no = r_sfst.stsfg_vou_line_no
"
"               AND stsfg_trans_seq_no = r_sfst.stsfg_trans_seq_no
"
"           AND stsfg_unit_cost <> v_mac_cost
"
"           AND stsfg_run_seq_no IS NULL;
"
"
"
"                IF SQl%FOUND THEN
"
"
"
"                  IF r_sfst.stsfg_source_doc = 'SR' THEN
"
"
"
"                UPDATE stock_trans_sfg
"
"                   SET stsfg_unit_cost = v_mac_cost
"
"                 WHERE stsfg_bu = r_sfst.stsfg_bu
"
"                   AND stsfg_store_id <> r_sfst.stsfg_store_id
"
"                   AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"                   AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"                   AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"                   AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"               AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"                   AND (stsfg_vou_pfx = r_sfst.stsfg_vou_pfx OR (stsfg_vou_pfx IS NULL AND r_sfst.stsfg_vou_pfx IS NULL))
"
"                   AND stsfg_vou_no = r_sfst.stsfg_vou_no
"
"                   AND stsfg_vou_line_no = r_sfst.stsfg_vou_line_no
"
"                   AND stsfg_trans_seq_no = r_sfst.stsfg_trans_seq_no
"
"               AND stsfg_unit_cost <> v_mac_cost
"
"               AND stsfg_run_seq_no IS NULL;
"
"
"
"          END IF;
"
"
"
"          v_break := 'Y';
"
"
"
"        END IF;
"
"
"
"          END IF;
"
"
"
"          v_mac_cost := r_sfst.mac_cost;
"
"
"
"          Commit;
"
"
"
"        ELSE
"
"
"
"          --Raise_application_Error(-20999,'HRM '||'/'||v_mac_cost);
"
"
"
"          UPDATE stock_trans_sfg
"
"             SET stsfg_unit_cost = v_mac_cost
"
"           WHERE stsfg_bu = r_sfst.stsfg_bu
"
"             AND stsfg_store_id = r_sfst.stsfg_store_id
"
"             AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"             AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"             AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"             AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"         AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"             AND stsfg_vou_no = r_sfst.stsfg_vou_no
"
"             AND stsfg_vou_line_no = r_sfst.stsfg_vou_line_no
"
"             AND stsfg_trans_seq_no = r_sfst.stsfg_trans_seq_no
"
"         AND stsfg_run_seq_no IS NULL;
"
"
"
"          IF SQL%FOUND THEN
"
"
"
"            UPDATE stock_trans_sfg
"
"               SET stsfg_unit_cost = v_mac_cost
"
"             WHERE stsfg_bu = r_sfst.stsfg_bu
"
"           AND stsfg_store_id = r_sfst.stsfg_store_id
"
"               AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"               AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"               AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"               AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"               AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"               AND stsfg_vou_no = r_sfst.stsfg_vou_no
"
"               AND stsfg_vou_line_no = r_sfst.stsfg_vou_line_no
"
"               AND stsfg_bucket_type = 'SIT';
"
"
"
"        v_break := 'Y';
"
"          END IF;
"
"
"
"          IF r_sfst.stsfg_source_doc IN ('MI','MT','MW') THEN
"
"
"
"                UPDATE inv_stock_trans_ln_hist
"
"               SET istlnh_unit_cost = v_mac_cost
"
"             WHERE istlnh_bu = p_bu
"
"               AND istlnh_prod_id = r_sfst.stsfg_prod_id
"
"               AND istlnh_prod_rev = r_sfst.stsfg_prod_rev
"
"               AND (istlnh_po_ord_no = r_sfst.stsfg_ord_no OR (istlnh_po_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"               AND istlnh_sf_code = r_sfst.stsfg_sf_code
"
"               AND istlnh_doc_no = r_sfst.stsfg_vou_no
"
"               AND istlnh_seq_no = r_sfst.stsfg_vou_line_no;
"
"
"
"                IF r_sfst.stsfg_source_doc IN ('MI','MT') THEN
"
"
"
"          FOR r_mrv IN (SELECT isthdh_issueto_id,istlnh_doc_no,istlnh_seq_no
"
"                                  FROM inv_stock_trans_hd_hist,inv_stock_trans_ln_hist
"
"                                 WHERE isthdh_bu = istlnh_bu
"
"                   AND isthdh_doc_no = istlnh_doc_no
"
"                   AND istlnh_bu = p_bu
"
"                   AND istlnh_prod_id = p_prod_id
"
"                   AND istlnh_prod_rev = p_prod_rev
"
"                   AND istlnh_mi_doc_no = r_sfst.stsfg_vou_no
"
"                   AND istlnh_mi_seq_no = r_sfst.stsfg_vou_line_no
"
"                     ORDER BY istlnh_doc_no)
"
"          LOOP
"
"
"
"            UPDATE inv_stock_trans_ln_hist
"
"                       SET istlnh_unit_cost = v_mac_cost
"
"                     WHERE istlnh_bu = p_bu
"
"                       AND istlnh_prod_id = p_prod_id
"
"                       AND istlnh_prod_rev = p_prod_rev
"
"                       AND istlnh_doc_no = r_mrv.istlnh_doc_no
"
"                       AND istlnh_seq_no = r_mrv.istlnh_seq_no;
"
"
"
"                    UPDATE stock_trans_sfg
"
"                       SET stsfg_unit_cost = v_mac_cost,stsfg_run_seq_no = v_upd_seq_no
"
"                     WHERE stsfg_bu = r_sfst.stsfg_bu
"
"                       AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"                       AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"                       AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"                   AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"                   AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"                   AND stsfg_vou_no = r_mrv.istlnh_doc_no
"
"                       AND stsfg_vou_line_no = r_mrv.istlnh_seq_no
"
"                       AND stsfg_appl = 'ICM'
"
"               AND stsfg_unit_cost <> v_mac_cost;
"
"
"
"            IF SQL%FOUND THEN
"
"                      proc_ins_mac_cost(r_sfst.stsfg_bu,r_mrv.isthdh_issueto_id,r_sfst.stsfg_prod_id,r_sfst.stsfg_prod_rev,'F',r_sfst.stsfg_ord_no,r_sfst.stsfg_sf_code,r_sfst.stsfg_sys_ls_no,p_user);
"
"            END IF;
"
"
"
"            IF INSTR(r_sfst.stsfg_sf_code,'0') = 0 THEN
"
"
"
"                      UPDATE stock_trans
"
"                         SET sttr_bc_unit_cost = v_mac_cost,
"
"                 sttr_run_seq_no = NULL
"
"                       WHERE sttr_bu = r_sfst.stsfg_bu
"
"                         AND sttr_prod_id = r_sfst.stsfg_prod_id
"
"                         AND sttr_prod_rev = r_sfst.stsfg_prod_rev
"
"                         AND sttr_vou_no = r_mrv.istlnh_doc_no
"
"                         AND sttr_vou_line_no = r_mrv.istlnh_seq_no
"
"                         AND sttr_appl = 'ICM'
"
"                 AND sttr_bc_unit_cost <> v_mac_cost;
"
"
"
"                  IF SQL%FOUND THEN
"
"                        proc_ins_mac_cost(r_sfst.stsfg_bu,r_mrv.isthdh_issueto_id,r_sfst.stsfg_prod_id,r_sfst.stsfg_prod_rev,'S',NULL,NULL,NULL,p_user);
"
"              END IF;
"
"            END IF;
"
"
"
"                  END LOOP;
"
"
"
"                END IF;
"
"
"
"          ELSIF r_sfst.stsfg_source_doc IN ('PR','NS','SP','ST','SO') AND v_break = 'Y' THEN
"
"
"
"            UPDATE sales_invoices_ln
"
"                   SET siln_unit_cost = v_mac_cost
"
"                 WHERE siln_bu = r_sfst.stsfg_bu
"
"                   AND siln_prod_id = r_sfst.stsfg_prod_id
"
"                   AND siln_prod_rev = r_sfst.stsfg_prod_rev
"
"                   AND EXISTS(SELECT 1
"
"                                FROM sales_invoices_hd
"
"                               WHERE sihd_bu = siln_bu
"
"                                 AND sihd_plant = siln_plnt
"
"                                 AND sihd_doc_no = siln_doc_no
"
"                                 AND sihd_inv_pfx = r_sfst.stsfg_vou_pfx
"
"                                 AND sihd_inv_no = r_sfst.stsfg_vou_no)
"
"                   AND siln_seq_no = r_sfst.stsfg_vou_line_no;
"
"
"
"          ELSIF r_sfst.stsfg_source_doc = 'SA' AND v_break = 'Y' THEN
"
"
"
"            UPDATE stock_adj_trans_ln
"
"                   SET satln_unit_cost = v_mac_cost
"
"                 WHERE satln_bu = r_sfst.stsfg_bu
"
"                   AND satln_ord_no = r_sfst.stsfg_vou_no
"
"                   AND satln_seq_no = r_sfst.stsfg_vou_line_no;
"
"
"
"          ELSIF r_sfst.stsfg_source_doc = 'ME' AND v_break = 'Y' THEN
"
"
"
"        UPDATE store_stock_trans_ln_hist
"
"                   SET sstlnh_unit_cost = v_mac_cost
"
"                 WHERE sstlnh_bu = r_sfst.stsfg_bu
"
"                   AND sstlnh_doc_no = r_sfst.stsfg_vou_no
"
"                   AND sstlnh_seq_no = r_sfst.stsfg_vou_line_no;
"
"
"
"              ELSIF r_sfst.stsfg_source_doc = 'SMC' AND v_break = 'Y' THEN
"
"
"
"        UPDATE sub_contr_mat_cons_lot_ser
"
"                   SET scmcls_unit_cost = v_mac_cost
"
"                 WHERE scmcls_bu = r_sfst.stsfg_bu
"
"           AND scmcls_receipt_pfx = r_sfst.stsfg_vou_pfx
"
"                   AND scmcls_receipt_no = r_sfst.stsfg_vou_no
"
"           AND scmcls_seq_no = r_sfst.stsfg_vou_line_no
"
"                   AND scmcls_prod_id = r_sfst.stsfg_prod_id
"
"                   AND scmcls_prod_rev = r_sfst.stsfg_prod_rev
"
"           AND scmcls_sf_code = r_sfst.stsfg_sf_code
"
"                   AND scmcls_mat_type = 'F';
"
"
"
"          ELSIF r_sfst.stsfg_source_doc IN ('PMC','QC','SFR') AND v_break = 'Y' THEN
"
"
"
"        UPDATE prod_transfer_mat_cons_hist
"
"                   SET ptmch_unit_cost = v_mac_cost
"
"                 WHERE ptmch_bu = r_sfst.stsfg_bu
"
"                   AND ptmch_plnt = r_sfst.stsfg_store_plnt
"
"                   AND ptmch_trans_no = r_sfst.stsfg_vou_no
"
"                   AND ptmch_prod_id = r_sfst.stsfg_prod_id
"
"                   AND ptmch_prod_rev = r_sfst.stsfg_prod_rev
"
"                   AND ptmch_store_id = r_sfst.stsfg_store_id
"
"           AND (ptmch_prod_ord_no = p_prod_ord_no OR (ptmch_prod_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"           AND ptmch_sf_code = r_sfst.stsfg_sf_code
"
"                   AND ptmch_mat_type = 'F';
"
"
"
"        UPDATE fg_pack_lot_ser_nos
"
"           SET fplsn_sou_unit_cost = v_mac_cost,
"
"               fplsn_sou_tot_cost = fplsn_lot_qty * v_mac_cost
"
"         WHERE fplsn_bu = r_sfst.stsfg_bu
"
"           AND fplsn_plnt = r_sfst.stsfg_store_plnt
"
"           AND fplsn_tpn_no = r_sfst.stsfg_vou_no
"
"           AND (fplsn_prod_ord_no = p_prod_ord_no OR (fplsn_prod_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"           AND fplsn_sou_sf_code = r_sfst.stsfg_sf_code
"
"           AND (fplsn_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (fplsn_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL));
"
"
"
"        proc_upd_pmc_cost(r_sfst.stsfg_bu,r_sfst.stsfg_store_plnt,r_sfst.stsfg_vou_no,p_user);
"
"
"
"          ELSIF r_sfst.stsfg_source_doc = 'RMC' AND v_break = 'Y' THEN
"
"
"
"        UPDATE rework_order_comp_dtl
"
"                   SET rwocd_unit_cost = v_mac_cost
"
"                 WHERE rwocd_bu = r_sfst.stsfg_bu
"
"                   AND rwocd_plnt = r_sfst.stsfg_store_plnt
"
"                   AND rwocd_doc_no = r_sfst.stsfg_vou_no
"
"           AND (rwocd_prod_ord_no = p_prod_ord_no OR (rwocd_prod_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"           AND rwocd_sou_sf_code = r_sfst.stsfg_sf_code
"
"           AND (rwocd_sou_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (rwocd_sou_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL));
"
"
"
"        proc_upd_pmc_cost(r_sfst.stsfg_bu,r_sfst.stsfg_store_plnt,r_sfst.stsfg_vou_no,p_user);
"
"
"
"          END IF;
"
"
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"      v_upd_seq_no := v_upd_seq_no + 1;
"
"
"
"      UPDATE stock_trans_sfg
"
"         SET stsfg_old_qoh = NVL(r_sfst.old_trans_qty,0),
"
"             stsfg_old_unit_cost = NVL(r_sfst.old_trans_unitcost,0),
"
"         stsfg_run_seq_no = v_upd_seq_no
"
"       WHERE stsfg_bu = r_sfst.stsfg_bu
"
"         AND stsfg_store_id = r_sfst.stsfg_store_id
"
"         AND stsfg_prod_id = r_sfst.stsfg_prod_id
"
"         AND stsfg_prod_rev = r_sfst.stsfg_prod_rev
"
"         AND (stsfg_ord_no = r_sfst.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfst.stsfg_ord_no IS NULL))
"
"         AND stsfg_sf_code = r_sfst.stsfg_sf_code
"
"         AND (stsfg_sys_ls_no = r_sfst.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfst.stsfg_sys_ls_no IS NULL))
"
"         AND stsfg_vou_no = r_sfst.stsfg_vou_no
"
"         AND (stsfg_vou_line_no = r_sfst.stsfg_vou_line_no OR (stsfg_vou_line_no IS NULL AND r_sfst.stsfg_vou_line_no IS NULL))
"
"         AND stsfg_trans_seq_no = r_sfst.stsfg_trans_seq_no
"
"         AND stsfg_bucket_type = 'QOH';
"
"
"
"          IF v_break = 'Y' AND r_sfst.trans_qty > 0 THEN
"
"            CLOSE c_sfst;
"
"            GOTO mac_sf_cost;
"
"          END IF;
"
"
"
"          IF v_rec_count >= p_limit THEN
"
"        proc_ins_exp(p_bu,'F',p_store_id,p_prod_id,p_prod_rev,'MAC','Infinity LOOP',p_user,p_prod_ord_no,p_sf_code,p_sys_ls_no);
"
"            Exit;
"
"          END IF;
"
"
"
"      Commit;
"
"
"
"      FETCH c_sfst INTO r_sfst;
"
"      EXIT WHEN c_sfst%NOTFOUND;
"
"
"
"    END LOOP;
"
"
"
"      END IF;
"
"
"
"    CLOSE c_sfst;
"
"
"
"    UPDATE store_sf_stocks
"
"       SET stsfs_unit_cost = v_mac_cost,
"
"           stsfs_upd_by = p_user,
"
"           stsfs_upd_date = SYSDATE
"
"     WHERE stsfs_bu = p_bu
"
"       AND stsfs_store_id = p_store_id
"
"       AND stsfs_prod_id = p_prod_id
"
"       AND stsfs_prod_rev = p_prod_rev
"
"       AND (stsfs_ord_no = p_prod_ord_no OR (stsfs_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"       AND stsfs_sf_code = p_sf_code
"
"       AND (stsfs_sys_ls_no = p_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND p_sys_ls_no IS NULL))
"
"       AND v_mac_cost > 0
"
"       AND NOT EXISTS(SELECT sme_prod_id
"
"                        FROM stk_mac_exp
"
"                       WHERE sme_bu = p_bu
"
"                         AND sme_store_id = p_store_id
"
"                         AND sme_prod_id = p_prod_id
"
"                         AND sme_prod_rev = p_prod_rev
"
"                         AND (sme_prod_ord_no = p_prod_ord_no OR (sme_prod_ord_no IS NULL AND p_prod_ord_no IS NULL))
"
"                         AND sme_sf_code = p_sf_code
"
"             AND (sme_sys_ls_no = p_sys_ls_no OR (sme_sys_ls_no IS NULL AND p_sys_ls_no IS NULL))
"
"                         AND sme_mat_type = 'F');
"
"
"
"    Commit;
"
"    /*EXCEPTION
"
"      WHEN OTHERS THEN
"
"        v_err_msg := CONCAT(v_err_msg,SQLERRM);
"
"    INSERT INTO stk_mac_exp(sme_bu,sme_mat_type,sme_store_id,sme_prod_id,sme_prod_rev,sme_prod_ord_no,sme_sf_code,sme_sys_ls_no,sme_cost_method,sme_err_msg)
"
"                         VALUES(p_bu,'F',p_store_id,p_prod_id,p_prod_rev,p_prod_ord_no,p_sf_code,p_sys_ls_no,'MAC',SUBSTR(DBMS_UTILITY.FORMAT_ERROR_STACK, 1, 4000)||':'||SUBSTR(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE, 1, 4000));
"
"    */
"
"  END proc_upd_mac_frm_sf_stk_trans;
"
"
"
"  PROCEDURE proc_upd_cost_frm_stk_trans(p_bu        IN    business_units.bu_id%TYPE,
"
"                    p_start_dt    IN    DATE,
"
"                    p_limit        IN    NUMBER,
"
"                                        p_user        IN    appl_users.appluser_id%TYPE
"
"                       )
"
"  AS
"
"    CURSOR c_sm IS
"
"    SELECT *
"
"      FROM std_stk_upd_mac_cost
"
"     WHERE sttr_bu = p_bu
"
"       AND sttr_upd_flag = 'N'
"
"       AND NOT EXISTS (SELECT sme_prod_id
"
"                         FROM stk_mac_exp
"
"                        WHERE sme_bu = sttr_bu
"
"                          AND sme_store_id = sttr_store_id
"
"                          AND sme_prod_id = sttr_prod_id
"
"                          AND sme_prod_rev = sttr_prod_rev
"
"              AND sme_cost_method = sttr_cost_method
"
"                          AND sme_mat_type = 'S')
"
"     ORDER BY sttr_bu,sttr_rec_ctn,sttr_store_id,sttr_prod_id,sttr_prod_rev;
"
"
"
"    CURSOR c_sfm IS
"
"    SELECT *
"
"      FROM sfg_stk_upd_mac_cost
"
"     WHERE stsfg_bu = p_bu
"
"       AND stsfg_upd_flag = 'N'
"
"       AND NOT EXISTS (SELECT sme_prod_id
"
"                         FROM stk_mac_exp
"
"                        WHERE sme_bu = stsfg_bu
"
"                          AND sme_store_id = stsfg_store_id
"
"                          AND sme_prod_id = stsfg_prod_id
"
"                          AND sme_prod_rev = stsfg_prod_rev
"
"              AND (sme_prod_ord_no = stsfg_ord_no OR (sme_prod_ord_no IS NULL AND stsfg_ord_no IS NULL))
"
"              AND sme_sf_code = stsfg_sf_code
"
"                          AND sme_mat_type = 'F')
"
"     ORDER BY stsfg_bu,stsfg_rec_ctn,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code;
"
"
"
"    r_sm     c_sm%ROWTYPE;
"
"    r_sfm    c_sfm%ROWTYPE;
"
"
"
"    v_rec_cnt    NUMBER;
"
"
"
"  BEGIN
"
"
"
"    <<STD_COST>>
"
"
"
"    OPEN c_sm;
"
"    LOOP
"
"      FETCH c_sm INTO r_sm;
"
"      EXIT WHEN c_sm%NOTFOUND;
"
"
"
"      UPDATE std_stk_upd_mac_cost
"
"         SET sttr_start_time = SYSDATE
"
"       WHERE sttr_bu = r_sm.sttr_bu
"
"         AND sttr_store_id = r_sm.sttr_store_id
"
"         AND sttr_prod_id = r_sm.sttr_prod_id
"
"         AND sttr_prod_rev = r_sm.sttr_prod_rev
"
"     AND sttr_cost_method = r_sm.sttr_cost_method;
"
"      Commit;
"
"
"
"      IF r_sm.sttr_cost_method = 'MAC' THEN
"
"
"
"        proc_upd_mac_frm_std_stk_trans(r_sm.sttr_bu,r_sm.sttr_store_id,r_sm.sttr_prod_id,r_sm.sttr_prod_rev,
"
"                           TRUNC(p_start_dt),TRUNC(SYSDATE),p_limit,p_user);
"
"
"
"      ELSE
"
"        proc_upd_bc_frm_std_stk_trans(r_sm.sttr_bu,r_sm.sttr_store_id,r_sm.sttr_prod_id,r_sm.sttr_prod_rev,r_sm.sttr_cost_method,
"
"                                  TRUNC(p_start_dt),p_user);
"
"      END IF;
"
"
"
"      UPDATE std_stk_upd_mac_cost
"
"         SET sttr_upd_flag = 'Y'
"
"       WHERE sttr_bu = r_sm.sttr_bu
"
"         AND sttr_store_id = r_sm.sttr_store_id
"
"         AND sttr_prod_id = r_sm.sttr_prod_id
"
"         AND sttr_prod_rev = r_sm.sttr_prod_rev
"
"     AND sttr_cost_method = r_sm.sttr_cost_method
"
"         AND NOT EXISTS (SELECT sme_prod_id
"
"                           FROM stk_mac_exp
"
"                          WHERE sme_bu = r_sm.sttr_bu
"
"                            AND sme_store_id = r_sm.sttr_store_id
"
"                            AND sme_prod_id = r_sm.sttr_prod_id
"
"                            AND sme_prod_rev = r_sm.sttr_prod_rev
"
"                AND sme_cost_method = r_sm.sttr_cost_method
"
"                            AND sme_mat_type = 'S');
"
"
"
"      UPDATE std_stk_upd_mac_cost
"
"         SET sttr_end_time = SYSDATE
"
"       WHERE sttr_bu = r_sm.sttr_bu
"
"         AND sttr_store_id = r_sm.sttr_store_id
"
"         AND sttr_prod_id = r_sm.sttr_prod_id
"
"         AND sttr_prod_rev = r_sm.sttr_prod_rev
"
"     AND sttr_cost_method = r_sm.sttr_cost_method;
"
"
"
"      Commit;
"
"
"
"    END LOOP;
"
"
"
"    CLOSE c_sm;
"
"
"
"    <<SFG_COST>>
"
"
"
"    OPEN c_sfm;
"
"    LOOP
"
"      FETCH c_sfm INTO r_sfm;
"
"      EXIT WHEN c_sfm%NOTFOUND;
"
"
"
"      UPDATE sfg_stk_upd_mac_cost
"
"         SET stsfg_start_time = SYSDATE
"
"       WHERE stsfg_bu = r_sfm.stsfg_bu
"
"         AND stsfg_store_id = r_sfm.stsfg_store_id
"
"         AND stsfg_prod_id = r_sfm.stsfg_prod_id
"
"         AND stsfg_prod_rev = r_sfm.stsfg_prod_rev
"
"     AND (stsfg_ord_no = r_sfm.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfm.stsfg_ord_no IS NULL))
"
"     AND stsfg_sf_code = r_sfm.stsfg_sf_code
"
"     AND (stsfg_sys_ls_no = r_sfm.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfm.stsfg_sys_ls_no IS NULL));
"
"
"
"      proc_upd_mac_frm_sf_stk_trans(r_sfm.stsfg_bu,r_sfm.stsfg_store_id,r_sfm.stsfg_prod_id,r_sfm.stsfg_prod_rev,r_sfm.stsfg_ord_no,
"
"                    r_sfm.stsfg_sf_code,r_sfm.stsfg_sys_ls_no,p_start_dt,TRUNC(SYSDATE),p_limit,p_user);
"
"
"
"     --raise_application_error(-20999,'HRM ');
"
"      UPDATE sfg_stk_upd_mac_cost
"
"         SET stsfg_upd_flag = 'Y'
"
"       WHERE stsfg_bu = r_sfm.stsfg_bu
"
"         AND stsfg_store_id = r_sfm.stsfg_store_id
"
"         AND stsfg_prod_id = r_sfm.stsfg_prod_id
"
"         AND stsfg_prod_rev = r_sfm.stsfg_prod_rev
"
"     AND (stsfg_ord_no = r_sfm.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfm.stsfg_ord_no IS NULL))
"
"     AND stsfg_sf_code = r_sfm.stsfg_sf_code
"
"         AND NOT EXISTS (SELECT sme_prod_id
"
"                           FROM stk_mac_exp
"
"                          WHERE sme_bu = r_sfm.stsfg_bu
"
"                            AND sme_store_id = r_sfm.stsfg_store_id
"
"                            AND sme_prod_id = r_sfm.stsfg_prod_id
"
"                            AND sme_prod_rev = r_sfm.stsfg_prod_rev
"
"                AND (sme_prod_ord_no = r_sfm.stsfg_ord_no OR (sme_prod_ord_no IS NULL AND r_sfm.stsfg_ord_no IS NULL))
"
"                        AND sme_sf_code = r_sfm.stsfg_sf_code
"
"                            AND sme_mat_type = 'F')
"
"         AND (stsfg_sys_ls_no = r_sfm.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfm.stsfg_sys_ls_no IS NULL));
"
"
"
"      UPDATE sfg_stk_upd_mac_cost
"
"         SET stsfg_end_time = SYSDATE
"
"       WHERE stsfg_bu = r_sfm.stsfg_bu
"
"         AND stsfg_store_id = r_sfm.stsfg_store_id
"
"         AND stsfg_prod_id = r_sfm.stsfg_prod_id
"
"         AND stsfg_prod_rev = r_sfm.stsfg_prod_rev
"
"     AND (stsfg_ord_no = r_sfm.stsfg_ord_no OR (stsfg_ord_no IS NULL AND r_sfm.stsfg_ord_no IS NULL))
"
"     AND stsfg_sf_code = r_sfm.stsfg_sf_code
"
"     AND (stsfg_sys_ls_no = r_sfm.stsfg_sys_ls_no OR (stsfg_sys_ls_no IS NULL AND r_sfm.stsfg_sys_ls_no IS NULL));
"
"
"
"      Commit;
"
"    END LOOP;
"
"    CLOSE c_sfm;
"
"
"
"    SELECT COUNT(*) INTO v_rec_cnt
"
"      FROM sfg_stk_upd_mac_cost
"
"     WHERE stsfg_bu = p_bu
"
"       AND stsfg_upd_flag = 'N'
"
"       AND NOT EXISTS (SELECT sme_prod_id
"
"                         FROM stk_mac_exp
"
"                        WHERE sme_bu = stsfg_bu
"
"                          AND sme_store_id = stsfg_store_id
"
"                          AND sme_prod_id = stsfg_prod_id
"
"                          AND sme_prod_rev = stsfg_prod_rev
"
"              AND (sme_prod_ord_no = stsfg_ord_no OR (sme_prod_ord_no IS NULL AND stsfg_ord_no IS NULL))
"
"              AND sme_sf_code = stsfg_sf_code
"
"                          AND sme_mat_type = 'F')
"
"     ORDER BY stsfg_bu,stsfg_rec_ctn,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code;
"
"
"
"    IF v_rec_cnt > 0 THEN
"
"      GOTO SFG_COST;
"
"    END IF;
"
"
"
"    SELECT COUNT(*) INTO v_rec_cnt
"
"      FROM std_stk_upd_mac_cost
"
"     WHERE sttr_bu = p_bu
"
"       AND sttr_upd_flag = 'N'
"
"       AND NOT EXISTS (SELECT sme_prod_id
"
"                         FROM stk_mac_exp
"
"                        WHERE sme_bu = sttr_bu
"
"                          AND sme_store_id = sttr_store_id
"
"                          AND sme_prod_id = sttr_prod_id
"
"                          AND sme_prod_rev = sttr_prod_rev
"
"              AND sme_cost_method = sttr_cost_method
"
"                          AND sme_mat_type = 'S')
"
"     ORDER BY sttr_bu,sttr_rec_ctn,sttr_store_id,sttr_prod_id,sttr_prod_rev;
"
"
"
"    IF v_rec_cnt > 0 THEN
"
"      GOTO STD_COST;
"
"    END IF;
"
"
"
"    pkg_stk.proc_gen_stmt_frm_stk_jrnl(p_bu,NULL,NULL,TRUNC(p_start_dt),TRUNC(SYSDATE),p_user,'-');
"
"    pkg_stk.proc_gen_doc_stmt_frm_stk_jrnl(p_bu,NULL,NULL,TRUNC(p_start_dt),TRUNC(SYSDATE),p_user,'-');
"
"
"
"
"
"
"
"  END proc_upd_cost_frm_stk_trans;
"
"
"
"  PROCEDURE proc_upd_cost_frm_form(p_bu        VARCHAR2,
"
"                                   p_start_dt    DATE,
"
"                                   p_user    VARCHAR2
"
"                  )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM std_stk_upd_mac_cost WHERE sttr_bu = p_bu;
"
"    DELETE FROM sfg_stk_upd_mac_cost WHERE stsfg_bu = p_bu;
"
"    DELETE FROM stk_mac_exp WHERE sme_bu = p_bu;
"
"
"
"    UPDATE stock_trans
"
"       SET sttr_run_seq_no = NULL
"
"     WHERE sttr_bu = p_bu
"
"       AND sttr_trans_date >= p_start_dt
"
"       AND sttr_run_seq_no IS NOT NULL;
"
"
"
"    INSERT INTO std_stk_upd_mac_cost
"
"    SELECT sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_cost_method,SUM(sttr_trans_qty) sttr_stk_qty,
"
"         --  SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_stk_val,
"
"           COUNT(*) sttr_rec_ctn,'N' sttr_upd_flag,TO_DATE(NULL) sttr_start_time,TO_DATE(NULL) sttr_end_time
"
"      FROM stock_trans,stores
"
"     WHERE sttr_bu = store_bu
"
"       AND sttr_store_id = store_id
"
"       AND sttr_bucket_type = 'QOH'
"
"       AND sttr_bu = p_bu
"
"       AND sttr_trans_date >= p_start_dt
"
"       AND EXISTS (SELECT 1
"
"                     FROM products
"
"                    WHERE prod_bu = sttr_bu
"
"                      AND prod_id = sttr_prod_id
"
"                      AND prod_rev = sttr_prod_rev
"
"                      AND prod_cost_method = 'MAC')
"
"     GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_cost_method
"
"     ORDER BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_rec_ctn;
"
"
"
"    INSERT INTO sfg_stk_upd_mac_cost
"
"    SELECT stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no,
"
"           SUM(stsfg_trans_qty) stsfg_stk_qty,SUM(stsfg_trans_qty * stsfg_unit_cost) stsfg_stk_val,
"
"       COUNT(*) stsfg_rec_ctn,'N' stsfg_upd_flag,TO_DATE(NULL) stsfg_start_time,TO_DATE(NULL) stsfg_end_time
"
"      FROM stock_trans_sfg,stores
"
"     WHERE stsfg_bu = store_bu
"
"       AND stsfg_store_id = store_id
"
"       AND stsfg_bucket_type = 'QOH'
"
"       AND stsfg_bu = p_bu
"
"       AND stsfg_trans_date >= p_start_dt
"
"     GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no
"
"     ORDER BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,stsfg_sys_ls_no,stsfg_rec_ctn;
"
"
"
"    proc_upd_cost_frm_stk_trans(p_bu,p_start_dt,1000000,p_user);
"
"
"
"  END proc_upd_cost_frm_form;
"
"
"
"END pkg_stk_cost;"
/
