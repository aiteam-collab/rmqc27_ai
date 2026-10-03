CREATE OR REPLACE
"PACKAGE BODY pkg_web_bank_ins_lc_acct
"
"AS
"
"
"
"  PROCEDURE proc_web_ins_lc_acct (p_bu                      IN     VARCHAR2,
"
"                                  p_ord_pfx                 IN     VARCHAR2,
"
"                                  p_ord_no                  IN     VARCHAR2,
"
"                                  p_lc_type                 IN     VARCHAR2,
"
"                                  p_lc_Amt                  IN     NUMBER,
"
"                                  p_user                    IN     VARCHAR2,
"
"                                  p_out_mgs                    OUT VARCHAR2)
"
"  IS
"
" CURSOR c3
"
"   IS
"
" SELECT *
"
"   FROM bank_trans
"
"  WHERE btrans_bu = p_bu
"
"    AND btrans_ord_pfx   = p_ord_pfx
"
"    AND btrans_ord_no    = p_ord_no;
"
"
"
" CURSOR c2(c_acct_id VARCHAR2)
"
"     IS
"
" SELECT glac_acct,
"
"        glac_acct_desc1,
"
"        glac_hsn_sac_code,
"
"        glac_sub_grp_type,
"
"        glac_tds_us_id
"
"   FROM gl_accts
"
"  WHERE glac_bu = p_bu
"
"    AND glac_sub_grp_type not in ('BANK','BKI','BKR')
"
"    AND glac_acct = c_acct_id;
"
"
"
"    cr3                        c3%ROWTYPE;
"
"    cr2                        c2%ROWTYPE;
"
"    v_tot_sel_grn_amt        NUMBER(15,3);
"
"    v_tot_sel_grn_qty        NUMBER(12,3);
"
"    v_seq_no                NUMBER;
"
"    v_sub_seq_no            NUMBER;
"
"    v_vou_type              VARCHAR2(5);
"
"  BEGIN
"
"
"
"  OPEN c3;
"
"  FETCH c3 INTO cr3;
"
"    DELETE FROM suplr_doc_dist_ln_adj
"
"     WHERE sddla_bu = p_bu
"
"       AND sddla_doc_no = p_ord_no;
"
"
"
"    DELETE FROM suplr_doc_dist_adj
"
"     WHERE sdda_bu = p_bu
"
"       AND sdda_doc_no = p_ord_no;
"
"
"
"    DELETE FROM bank_trans_dist_ln
"
"     WHERE btdln_bu = p_bu
"
"       AND btdln_ord_no = p_ord_no
"
"       AND btdln_ref_type = 'N'
"
"       AND btdln_chrg_flag = 'N';
"
"
"
"        SELECT NVL(SUM(sdlat_grn_amt),0),
"
"           NVL(SUM(sdlat_grn_qty),0)
"
"      INTO v_tot_sel_grn_amt,
"
"           v_tot_sel_grn_qty
"
"    FROM suplr_doc_ln_acct_temp
"
"   WHERE sdlat_bu = p_bu AND sdlat_user = p_user AND sdlat_sel_flag = 'Y'
"
"         AND sdlat_rcpt_pfx || sdlat_rcpt_no IN
"
"                (SELECT UNIQUE sdlatr_rcpt_pfx || sdlatr_rcpt_no
"
"                   FROM suplr_doc_ln_acct_temp_rev
"
"                  WHERE sdlatr_bu = p_bu
"
"                     and sdlatr_user=p_user);
"
"
"
"    FOR cr1 IN (SELECT sdlat_acct,sdlat_acct_plnt,sdlat_plnt_loc_id,sdlat_lvl1,sdlat_lvl2,sdlat_lvl3,sdlat_lvl4,sdlat_lvl5,sdlat_lvl6,sdlat_lvl_prj,sdlat_acct_desc,sdlat_cc_desc,sdlat_cc_code
"
"                              FROM suplr_doc_ln_acct_temp
"
"                             WHERE sdlat_bu = p_bu
"
"                               AND sdlat_user = p_user AND sdlat_sel_flag = 'Y'
"
"                                AND sdlat_rcpt_pfx || sdlat_rcpt_no IN
"
"                (SELECT UNIQUE sdlatr_rcpt_pfx || sdlatr_rcpt_no
"
"                   FROM suplr_doc_ln_acct_temp_rev
"
"                  WHERE sdlatr_bu = p_bu
"
"                    and sdlatr_user=p_user)
"
"                             GROUP BY sdlat_acct,sdlat_acct_plnt,sdlat_plnt_loc_id,sdlat_lvl1,sdlat_lvl2,sdlat_lvl3,sdlat_lvl4,sdlat_lvl5,sdlat_lvl6,sdlat_lvl_prj,sdlat_acct_desc,sdlat_cc_desc,sdlat_cc_code )
"
"    LOOP
"
" -- PROC_DEBUG_PROC(p_lc_Amt||'Dinesh');
"
"        UPDATE bank_trans_dist_ln
"
"           SET btdln_dist_amt = ROUND(btdln_dist_amt + p_lc_Amt,2),
"
"                    btdln_bc_amt = ROUND(btdln_bc_amt + (p_lc_Amt * cr3.btrans_trans_base_exrate),2)
"
"         WHERE btdln_bu = p_bu
"
"           AND btdln_ord_no = p_ord_no
"
"           --AND btdln_plant = cr3.btrans_plant
"
"           AND btdln_acct_plant = cr1.sdlat_acct_plnt
"
"           AND btdln_lvl1 = cr1.sdlat_lvl1
"
"           AND btdln_lvl2 = cr1.sdlat_lvl2
"
"           AND btdln_lvl3 = cr1.sdlat_lvl3
"
"           AND btdln_lvl4 = cr1.sdlat_lvl4
"
"           AND btdln_lvl5 = cr1.sdlat_lvl5
"
"           AND btdln_lvl6 = cr1.sdlat_lvl6
"
"           AND btdln_lvl_prj = cr1.sdlat_lvl_prj
"
"           AND btdln_acct = cr1.sdlat_acct
"
"           AND btdln_plnt_loc_id = cr1.sdlat_plnt_loc_id;
"
"
"
" IF SQL%NOTFOUND THEN
"
" PROC_DEBUG_PROC(p_lc_Amt||'Dhana');
"
"        SELECT NVL(MAX(btdln_seq_no),0) + 1
"
"            INTO v_seq_no
"
"            FROM bank_trans_dist_ln
"
"           WHERE btdln_bu = cr3.btrans_bu
"
"            -- AND btdln_ord_pfx = cr3.btrans_ord_pfx
"
"             AND btdln_ord_no = p_ord_no;
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||v_seq_no||'-'||p_ord_no||'-'||cr3.btrans_bu||'---'|| p_lc_Amt * cr3.btrans_trans_base_exrate );
"
"        OPEN c2(cr1.sdlat_acct);
"
"        FETCH c2 INTO cr2;
"
"        CLOSE c2;
"
"
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||v_seq_no||'-'||p_ord_no||'-'||cr3.btrans_bu||'---'|| CR1.sdlat_cc_code||'-'||  cr1.sdlat_lvl_prj ||cr1.sdlat_lvl1 );
"
"    INSERT INTO bank_trans_dist_ln (btdln_bu,
"
"                                --btdln_ord_pfx,
"
"                                btdln_ord_no,
"
"                                btdln_plant,
"
"                                btdln_seq_no,
"
"                                btdln_ref_type,
"
"                                btdln_acct_plant,
"
"                                btdln_lvl1,
"
"                                btdln_lvl2,
"
"                                btdln_lvl3,
"
"                                btdln_lvl4,
"
"                                btdln_lvl5,
"
"                                btdln_lvl6,
"
"                                btdln_lvl_prj,
"
"                                btdln_cc_code,
"
"                                btdln_acct,
"
"                                btdln_dist_amt,
"
"                                btdln_bc_amt,
"
"                                btdln_dr_cr,
"
"                                btdln_chrg_flag,
"
"                                btdln_curr,
"
"                                btln_exrate,
"
"                                btdln_cre_by,
"
"                                btdln_cre_date,
"
"                                btdln_assess_val,
"
"                                btdln_pct,
"
"                                btdln_bfcry_type,
"
"                                btdln_utr_flag,
"
"                                btdln_rgl_amt,
"
"                                btdln_hsn_code,
"
"                                btdln_gst_rev_tax_flag,
"
"                                btdln_pymt_wiz_status,
"
"                                btdln_pay_adv_ref,
"
"                                btdln_acct_type,
"
"                                btdln_gst_type,
"
"                                btdln_suplr_type,
"
"                                btdln_gst_supply,
"
"                                btdln_supply_type,
"
"                                btdln_tax_gen_flag,
"
"                                btdln_ref_bu,
"
"                                btdln_lc_import_flag,
"
"                                btdln_source,
"
"                                btdln_vat_class,
"
"                                btdln_vat_type,
"
"                                btdln_acct_desc,
"
"                                btdln_cc_desc,
"
"                                btdln_exmpt_flag,
"
"                                btdln_input_type,
"
"                                btdln_lic_type,
"
"                                btdln_meis_doc_no,
"
"                                btdln_meis_lic_no,
"
"                                btdln_pay_wiz_status,
"
"                                btdln_plnt_loc_id)
"
"     VALUES (p_bu,
"
"            -- cr3.btrans_ord_pfx,
"
"             p_ord_no,
"
"             cr3.btrans_plant,
"
"             v_seq_no,
"
"             'N',
"
"             cr1.sdlat_acct_plnt,
"
"             cr1.sdlat_lvl1,
"
"             cr1.sdlat_lvl2,
"
"             cr1.sdlat_lvl3,
"
"             cr1.sdlat_lvl4,
"
"             cr1.sdlat_lvl5,
"
"             cr1.sdlat_lvl6,
"
"             cr1.sdlat_lvl_prj,
"
"          /*   func_find_cc_code(p_bu,
"
"             cr1.sdlat_lvl1,
"
"             cr1.sdlat_lvl2,
"
"             cr1.sdlat_lvl3,
"
"             cr1.sdlat_lvl4,
"
"             cr1.sdlat_lvl5,
"
"             cr1.sdlat_lvl6,
"
"             cr1.sdlat_lvl_prj,
"
"             cr1.sdlat_acct_plnt,
"
"             cr1.sdlat_plnt_loc_id),*/
"
"             CR1.sdlat_cc_code,--cr1.sdlat_cc_code,
"
"             cr1.sdlat_acct,
"
"             ROUND(p_lc_Amt,2),--1,
"
"             ROUND(p_lc_Amt * cr3.btrans_trans_base_exrate,2),--1,
"
"             'DR',
"
"             'N',
"
"             cr3.btrans_trans_curcy,
"
"             cr3.btrans_trans_base_exrate,
"
"             p_user,
"
"             SYSDATE,
"
"             0,
"
"             0,
"
"             'N',
"
"             'N',
"
"             0,
"
"             cr2.glac_hsn_sac_code,
"
"             'N',
"
"             'N',
"
"             'N',
"
"             'N',
"
"             'U',
"
"             'L',
"
"             'N',
"
"             'G',
"
"             'N',
"
"             p_bu,
"
"             'N',
"
"             'M',
"
"             'L',
"
"             'R',
"
"             cr1.sdlat_acct_desc,
"
"             cr1.sdlat_cc_desc,
"
"             'N',
"
"             'I',
"
"             'N',
"
"             NULL,
"
"             NULL,
"
"             'N',
"
"             cr1.sdlat_plnt_loc_id);
"
"
"
"ELSE
"
"     --NULL;
"
"          SELECT btdln_seq_no
"
"             INTO v_seq_no
"
"             FROM bank_trans_dist_ln
"
"              WHERE btdln_bu = cr3.btrans_bu
"
"            -- AND btdln_ord_pfx = cr3.btrans_ord_pfx
"
"             AND btdln_ord_no = p_ord_no
"
"             AND btdln_acct_plant = cr1.sdlat_acct_plnt
"
"             AND btdln_lvl1 = cr1.sdlat_lvl1
"
"             AND btdln_lvl2 = cr1.sdlat_lvl2
"
"             AND btdln_lvl3 = cr1.sdlat_lvl3
"
"             AND btdln_lvl4 = cr1.sdlat_lvl4
"
"             AND btdln_lvl5 = cr1.sdlat_lvl5
"
"             AND btdln_lvl6 = cr1.sdlat_lvl6
"
"             AND btdln_lvl_prj = cr1.sdlat_lvl_prj
"
"             AND btdln_acct = cr1.sdlat_acct
"
"             AND btdln_plnt_loc_id = cr1.sdlat_plnt_loc_id;
"
"
"
"    END IF;
"
"
"
"
"
"    FOR cr3 IN (SELECT *
"
"                              FROM suplr_doc_ln_acct_temp
"
"                             WHERE sdlat_bu = p_bu
"
"                               AND sdlat_user = p_user
"
"                              AND sdlat_sel_flag = 'Y'
"
"                               AND sdlat_rcpt_pfx || sdlat_rcpt_no IN
"
"                                                                    (SELECT UNIQUE sdlatr_rcpt_pfx || sdlatr_rcpt_no
"
"                                                                       FROM suplr_doc_ln_acct_temp_rev
"
"                                                                      WHERE  sdlatr_bu = p_bu
"
"                                                                        and sdlatr_user=p_user
"
"                                                                        )
"
"                               AND sdlat_acct = cr1.sdlat_acct
"
"                               AND sdlat_acct_plnt = cr1.sdlat_acct_plnt
"
"                               AND sdlat_lvl1 = cr1.sdlat_lvl1
"
"                               AND sdlat_lvl2 = cr1.sdlat_lvl2
"
"                               AND sdlat_lvl3 = cr1.sdlat_lvl3
"
"                               AND sdlat_lvl4 = cr1.sdlat_lvl4
"
"                               AND sdlat_lvl5 = cr1.sdlat_lvl5
"
"                               AND sdlat_lvl6 = cr1.sdlat_lvl6
"
"                               AND sdlat_lvl_prj = cr1.sdlat_lvl_prj)
"
"    LOOP
"
"
"
"
"
"    UPDATE suplr_doc_dist_adj
"
"       SET sdda_grn_qty = cr3.sdlat_grn_qty,
"
"                sdda_grn_val = cr3.sdlat_grn_amt
"
"               --- sdda_adj_amt = sdda_adj_amt + CASE WHEN p_lc_type ='V' THEN (p_lc_Amt*(cr3.sdlat_grn_amt/v_tot_sel_grn_amt))ELSE(p_lc_Amt*(cr3.sdlat_grn_qty/v_tot_sel_grn_qtY)) END
"
"           --sdda_tot_sel_grn_qty = v_tot_sel_grn_qty,
"
"          -- sdda_tot_sel_grn_val = v_tot_sel_grn_amt
"
"     WHERE SDDA_BU  = p_bu
"
"     --  AND SDDA_DOC_PFX = cr3.btrans_ord_pfx
"
"       AND SDDA_DOC_NO = p_ord_no
"
"       AND SDDA_SEQ_NO = v_seq_no
"
"       --AND sdda_grn_pfx = cr3.sdlat_rcpt_pfx
"
"       AND sdda_grn_no = cr3.sdlat_rcpt_no;
"
"
"
" IF SQL%NOTFOUND THEN
"
"    select nvl(max(SDDA_SUB_SEQ_NO),0)+1
"
"      into v_sub_seq_no
"
"      from SUPLR_DOC_DIST_ADJ
"
"     where SDDA_BU  = p_bu
"
"      -- and SDDA_DOC_PFX = cr3.btrans_ord_pfx
"
"       and SDDA_DOC_NO = p_ord_no
"
"       and SDDA_SEQ_NO = v_seq_no;
"
"
"
"BEGIN
"
"SELECT BTRANS_VOU_TYPE INTO v_vou_type
"
"  FROM BANK_TRANS
"
" WHERE BTRANS_BU= p_bu
"
"   AND BTRANS_ORD_PFX=p_ord_pfx
"
"   AND BTRANS_ORD_NO=p_ord_no;
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
"
"END;
"
"
"
"        INSERT INTO suplr_doc_dist_adj    (sdda_bu,
"
"                                         --sdda_doc_pfx,
"
"                                         sdda_doc_no,
"
"                                         sdda_seq_no,
"
"                                         sdda_sub_seq_no,
"
"                                         sdda_grn_pfx,
"
"                                         sdda_grn_no,
"
"                                         sdda_grn_qty,
"
"                                         sdda_grn_val,
"
"                                         sdda_adj_type,
"
"                                         sdda_adj_amt,
"
"                                         sdda_bill_no,
"
"                                         sdda_bill_date,
"
"                                         sdda_vou_type,
"
"                                         sdda_grn_status,
"
"                                         sdda_tot_sel_grn_val,
"
"                                         sdda_tot_sel_grn_qty,
"
"                                         sdda_cre_by,
"
"                                         sdda_cre_date,
"
"                                         sdda_distr_type)
"
"                                VALUES    (p_bu,
"
"                                    --     cr3.btrans_ord_pfx,
"
"                                         p_ord_no,
"
"                                         v_seq_no,
"
"                                         v_sub_seq_no,
"
"                                         cr3.sdlat_rcpt_pfx,
"
"                                         cr3.sdlat_rcpt_no,
"
"                                         cr3.sdlat_grn_qty,
"
"                                         cr3.sdlat_grn_amt,
"
"                                         'C',
"
"                                        (CASE WHEN p_lc_type ='V' THEN
"
"                                                    (p_lc_Amt*(cr3.sdlat_grn_amt/v_tot_sel_grn_amt))
"
"                                                  WHEN p_lc_type ='Q' THEN(p_lc_Amt*(cr3.sdlat_grn_qty/v_tot_sel_grn_qty))
"
"                                                 END),  --  0,--(p_lc_Amt *(cr3.sdlat_grn_amt/v_tot_sel_grn_amt)),
"
"                                         cr3.sdlat_suplr_doc_no,
"
"                                         cr3.sdlat_suplr_doc_date,
"
"                                         NVL(v_vou_type,'CPV'),
"
"                                         cr3.sdlat_grn_status,
"
"                                         v_tot_sel_grn_amt,
"
"                                         v_tot_sel_grn_qtY,
"
"                                         p_user,
"
"                                         SYSDATE,
"
"                                         p_lc_type);
"
"
"
"        END IF;
"
"
"
"    END LOOP;
"
"
"
"    END LOOP;
"
"  END proc_web_ins_lc_acct;
"
"  PROCEDURE proc_web_load_grn_ln_acct(p_bu   VARCHAR2,
"
"                                    p_ord_pfx   VARCHAR2,
"
"                                    p_ord_no    VARCHAR2,
"
"                                    p_user      VARCHAR2)
"
"IS
"
"
"
"    CURSOR c0--(c_seq_no   NUMBER)
"
"    IS
"
"      SELECT btdln_acct_plant,
"
"             btdln_lvl1,
"
"             btdln_lvl2,
"
"             btdln_lvl3,
"
"             btdln_lvl4,
"
"             btdln_lvl5,
"
"             btdln_lvl6,
"
"             btdln_lvl_prj,
"
"             btdln_acct,
"
"             btdln_seq_no
"
"       FROM bank_trans_dist_ln
"
"      WHERE btdln_bu = p_bu
"
"        AND btdln_ord_no = p_ord_no;
"
"
"
"    CURSOR c1 (c_seq_no   NUMBER)
"
"    IS
"
"      SELECT *
"
"        FROM suplr_doc_dist_adj
"
"       WHERE sdda_bu = p_bu
"
"         AND sdda_seq_no = c_seq_no
"
"         AND sdda_doc_no = p_ord_no;
"
"
"
"    CURSOR c2(c_rcpt_pfx VARCHAR2,c_rcpt_no VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_hd_view,pur_ord_receipt_ln_view
"
"     WHERE porh_bu = porl_bu
"
"       AND porh_receipt_no = porl_receipt_no
"
"       AND porh_bu = p_bu
"
"       --AND porh_receipt_pfx = c_rcpt_pfx
"
"       AND porh_receipt_no = c_rcpt_no
"
"       AND porl_status NOT IN ('C')
"
"       AND EXISTS (SELECT 1
"
"                     FROM products
"
"                    WHERE prod_bu = porl_bu
"
"                      AND prod_id = porl_prod_id
"
"                      AND prod_rev = porl_prod_rev
"
"                      AND prod_status = 'A'
"
"                      AND prod_stocked = 'Y');
"
"
"
"
"
"    v_db_plnt         VARCHAR2(20);
"
"    v_db_lvl1       VARCHAR2(4);
"
"    v_db_lvl2       VARCHAR2(4);
"
"    v_db_lvl3       VARCHAR2(4);
"
"    v_db_lvl4       VARCHAR2(4);
"
"    v_db_lvl5       VARCHAR2(4);
"
"    v_db_lvl6       VARCHAR2(4);
"
"    v_db_lvl_prj   VARCHAR2(20);
"
"    v_db_cc_code   VARCHAR2(100);
"
"    v_db_acct       VARCHAR2(20);
"
"    v_db_loc       VARCHAR2(10);
"
"    cr0            c0%ROWTYPE;
"
"BEGIN
"
"
"
"
"
"    FOR cr0 IN c0
"
"    LOOP
"
"
"
"       FOR cr1 IN c1(cr0.btdln_seq_no)
"
"       LOOP
"
"       DELETE suplr_rct_ln_acct_dtls
"
"            WHERE srlad_bu = p_bu
"
"              AND srlad_adj_seq_no = cr1    .sdda_seq_no
"
"              AND srlad_doc_no = p_ord_no;
"
"        FOR cr2 IN c2(cr1.sdda_grn_pfx,cr1.sdda_grn_no)
"
"        LOOP
"
"
"
"         IF func_find_lc_ledger_src (p_bu) = 'I' THEN
"
"           /*  proc_find_store_glacct (p_bu,                --p_bu
"
"                                     cr2.porl_storage_store_id,    --p_store_id
"
"                                     cr2.porh_terr_id,            --p_terr_id
"
"                                     cr2.porl_cls_id,            --p_class_id
"
"                                     cr2.porl_sub_cls_id,        --p_sub_cls_id
"
"                                     cr2.porl_dept_id,            --p_dept_id
"
"                                     cr2.porl_proj_id,    --p_proj_id
"
"                                     cr2.porl_so_pfx,        --p_so_pfx
"
"                                     cr2.porl_so_no,        --p_so_no
"
"                                     v_db_plnt,                    --p_acct_plnt
"
"                                     v_db_lvl1,                    --p_lvl1
"
"                                     v_db_lvl2,                    --p_lvl2
"
"                                     v_db_lvl3,                    --p_lvl3
"
"                                     v_db_lvl4,                    --p_lvl4
"
"                                     v_db_lvl5,                    --p_lvl4
"
"                                     v_db_lvl6,                    --p_lvl4
"
"                                     v_db_lvl_prj,             --p_lvl_prj
"
"                                     v_db_acct,                    --p_acct
"
"                                     v_db_cc_code,                    --p_lvl4
"
"                                     v_db_loc,
"
"                                     'PR',                            --p_type
"
"                                     cr2.porh_ref_unit,    --p_plnt
"
"                                     'S',                                --p_mat_type
"
"                                     cr2.porl_tcf_id        --p_tcf_id
"
"                                    );     */
"
"
"
"         INSERT INTO suplr_rct_ln_acct_dtls
"
"                                            (srlad_bu,
"
"                                             srlad_pfx,
"
"                                             srlad_doc_no,
"
"                                             srlad_adj_seq_no,
"
"                                             srlad_rcpt_pfx,
"
"                                             srlad_rcpt_no,
"
"                                             srlad_rcpt_seq_no,
"
"                                             srlad_acct_plnt,
"
"                                             srlad_lvl1,
"
"                                             srlad_lvl2,
"
"                                             srlad_lvl3,
"
"                                             srlad_lvl4,
"
"                                             srlad_lvl5,
"
"                                             srlad_lvl6,
"
"                                             srlad_lvl_prj,
"
"                                             srlad_acct,
"
"                                             srlad_cre_by,
"
"                                             srlad_cre_date)
"
"                                   /* VALUES
"
"                                            (p_bu,
"
"                                             p_ord_pfx,
"
"                                             p_ord_no,
"
"                                             cr1.sdda_seq_no,
"
"                                            NULL,-- cr2.porl_receipt_pfx,
"
"                                             cr2.porl_receipt_no,
"
"                                             cr2.porl_seq_no,
"
"                                             v_db_plnt,
"
"                                             v_db_lvl1,
"
"                                             v_db_lvl2,
"
"                                             v_db_lvl3,
"
"                                             v_db_lvl4,
"
"                                             v_db_lvl5,
"
"                                             v_db_lvl6,
"
"                                             v_db_lvl_prj,
"
"                                             v_db_acct,
"
"                                             p_user,
"
"                                             SYSDATE);*/
"
"                                   VALUES
"
"                                                (p_bu,
"
"                                                 p_ord_pfx,
"
"                                                 p_ord_no,
"
"                                                 cr1.sdda_seq_no,
"
"                                                 cr2.porh_receipt_pfx,
"
"                                                 cr2.porl_receipt_no,
"
"                                                 cr2.porl_seq_no,
"
"                                                 cr0.btdln_acct_plant,
"
"                                                 cr0.btdln_lvl1,
"
"                                                 cr0.btdln_lvl2,
"
"                                                 cr0.btdln_lvl3,
"
"                                                 cr0.btdln_lvl4,
"
"                                                 cr0.btdln_lvl5,
"
"                                                 cr0.btdln_lvl6,
"
"                                                 cr0.btdln_lvl_prj,
"
"                                                 cr0.btdln_acct,
"
"                                                 p_user,
"
"                                                 SYSDATE);
"
"
"
"         ELSIF func_find_lc_ledger_src (p_bu) = 'S' THEN
"
"                INSERT INTO suplr_rct_ln_acct_dtls
"
"                                                (srlad_bu,
"
"                                                 srlad_pfx,
"
"                                                 srlad_doc_no,
"
"                                                 srlad_adj_seq_no,
"
"                                                 srlad_rcpt_pfx,
"
"                                                 srlad_rcpt_no,
"
"                                                 srlad_rcpt_seq_no,
"
"                                                 srlad_acct_plnt,
"
"                                                 srlad_lvl1,
"
"                                                 srlad_lvl2,
"
"                                                 srlad_lvl3,
"
"                                                 srlad_lvl4,
"
"                                                 srlad_lvl5,
"
"                                                 srlad_lvl6,
"
"                                                 srlad_lvl_prj,
"
"                                                 srlad_acct,
"
"                                                 srlad_cre_by,
"
"                                                 srlad_cre_date)
"
"                                        VALUES
"
"                                                (p_bu,
"
"                                                 p_ord_pfx,
"
"                                                 p_ord_no,
"
"                                                 cr1.sdda_seq_no,
"
"                                                 cr2.porh_receipt_pfx,
"
"                                                 cr2.porl_receipt_no,
"
"                                                 cr2.porl_seq_no,
"
"                                                 cr0.btdln_acct_plant,
"
"                                                 cr0.btdln_lvl1,
"
"                                                 cr0.btdln_lvl2,
"
"                                                 cr0.btdln_lvl3,
"
"                                                 cr0.btdln_lvl4,
"
"                                                 cr0.btdln_lvl5,
"
"                                                 cr0.btdln_lvl6,
"
"                                                 cr0.btdln_lvl_prj,
"
"                                                 cr0.btdln_acct,
"
"                                                 p_user,
"
"                                                 SYSDATE);
"
"
"
"            END IF;
"
"        END LOOP;
"
"        END LOOP;
"
"    END LOOP;
"
"END proc_web_load_grn_ln_acct;
"
"
"
"PROCEDURE proc_web_ins_lc_adjust (p_bu                      IN     VARCHAR2,
"
"                                    p_ord_pfx                 IN     VARCHAR2,
"
"                                    p_ord_no                  IN     VARCHAR2,
"
"                                    p_lc_type                 IN     VARCHAR2,
"
"                                    p_lc_Amt                  IN     NUMBER,
"
"                                    p_user                    IN     VARCHAR2,
"
"                                    p_out_mgs                    OUT VARCHAR2)
"
"IS
"
"CURSOR c1
"
"   IS
"
"      SELECT *
"
"        FROM bank_trans_dist_ln
"
"       WHERE     btdln_bu = p_bu
"
"         --    AND btdln_ord_pfx = p_ord_pfx
"
"             AND btdln_ord_no = p_ord_no;
"
"
"
"   CURSOR c2 (c_seq_no    NUMBER)
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_dist_adj
"
"       WHERE     sdda_bu = p_bu
"
"           --  AND sdda_doc_pfx = p_ord_pfx
"
"             AND sdda_doc_no = p_ord_no
"
"             AND sdda_seq_no = c_seq_no;
"
"
"
"   CURSOR c3 (
"
"    --  c_grn_pfx    VARCHAR2,
"
"      c_grn_no     VARCHAR2)
"
"   IS
"
"        SELECT *
"
"          FROM pur_ord_receipt_ln_view
"
"         WHERE     porl_bu = p_bu
"
"              -- AND porl_receipt_pfx = c_grn_pfx
"
"               AND porl_receipt_no = c_grn_no
"
"               AND porl_status NOT IN ('C')
"
"      ORDER BY porl_seq_no;
"
"
"
"   CURSOR c4 (
"
"      c_seq_no    NUMBER)
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_dist_adj
"
"       WHERE     sdda_bu = p_bu
"
"          --   AND sdda_doc_pfx = p_ord_pfx
"
"             AND sdda_doc_no = p_ord_no
"
"             AND sdda_seq_no = c_seq_no;
"
"
"
"   CURSOR c5 (
"
"      --c_pfx    VARCHAR2,
"
"      c_no     VARCHAR2)
"
"   IS
"
"      SELECT porh_grn_date
"
"        FROM pur_ord_receipt_hd_view, pur_ord_receipt_ln_view
"
"       WHERE     porh_bu = p_bu
"
"             AND porh_bu = porl_bu
"
"            -- AND porh_receipt_pfx = porl_receipt_pfx
"
"             AND porh_receipt_no = porl_receipt_no
"
"             --AND porh_receipt_pfx = c_pfx
"
"             AND porh_receipt_no = c_no
"
"             AND porl_status NOT IN ('C');
"
"   CURSOR c6
"
"     IS
"
"   SELECT *
"
"     FROM bank_trans
"
"    WHERE btrans_bu = p_bu
"
"      AND btrans_ord_pfx = p_ord_pfx
"
"      AND btrans_ord_no = p_ord_no;
"
"
"
"   v_grn_qty         NUMBER       := 0;
"
"   v_grn_val         NUMBER := 0;
"
"   v_adj_amt         NUMBER := 0;
"
"     v_adj_tot_amt          NUMBER := 0;
"
"   v_tot_amt              NUMBER := 0;
"
"   v_tot_tax_amt     NUMBER := 0;
"
"   v_tot_grn_amt     NUMBER := 0;
"
"   v_line_grn_amt    NUMBER := 0;
"
"   v_line_adj_val    NUMBER := 0;
"
"   v_adj_unit_cost   NUMBER := 0;
"
"   v_seq_no          NUMBER := 0;
"
"   v_line_grn_uc_amt NUMBER := 0;
"
"    v_tot_adj_amt     NUMBER       := 0;
"
"    v_lseq_no         NUMBER       := 0;
"
"   v_db_plnt         VARCHAR2 (20);
"
"   v_db_lvl1         VARCHAR2 (4);
"
"   v_db_lvl2         VARCHAR2 (4);
"
"   v_db_lvl3         VARCHAR2 (4);
"
"   v_db_lvl4         VARCHAR2 (4);
"
"   v_db_prj_lvl      VARCHAR2 (10);
"
"   v_db_acct         VARCHAR2 (20);
"
"   v_stkd            VARCHAR2 (1);
"
"   v_rnd                            NUMBER    := func_find_appl_rnddigit(p_bu);
"
"
"
"   cr2               c2%ROWTYPE;
"
"   cr1               c1%ROWTYPE;
"
"   cr6               c6%ROWTYPE;
"
"BEGIN
"
"  DELETE FROM suplr_doc_dist_ln_adj
"
"      WHERE     sddla_bu = p_bu
"
"           -- AND sddla_doc_pfx = p_ord_pfx
"
"            AND sddla_doc_no = p_ord_no;
"
"
"
"
"
"   OPEN c6;
"
"   FETCH c6 INTO cr6;
"
"   CLOSE c6;
"
"
"
"   OPEN c1;
"
"   FETCH c1 INTO cr1;
"
"   IF c1%notfound THEN
"
"       RAISE_APPLICATION_ERROR(-20999,'Not found');
"
"   END IF;
"
"   CLOSE c1;
"
"   FOR cr1 IN c1
"
"   LOOP
"
"      OPEN c2 (cr1.btdln_seq_no);
"
"      FETCH c2 INTO cr2;
"
"
"
"      IF c2%FOUND
"
"      THEN
"
"
"
"
"
"                SELECT ROUND(sdda_tot_sel_grn_qty,v_rnd),
"
"              ROUND(sdda_tot_sel_grn_val,v_rnd)
"
"           INTO v_grn_qtY,
"
"                v_grn_val
"
"                  FROM suplr_doc_dist_adj
"
"                 WHERE     sdda_bu = p_bu
"
"                   AND sdda_doc_no = cr1.btdln_ord_no
"
"                   AND sdda_seq_no = cr1.btdln_seq_no
"
"                   AND rownum=1;
"
"
"
"      END IF;
"
"      CLOSE c2;
"
"
"
"
"
"
"
"      v_tot_adj_amt    := 0;
"
"      v_lseq_no := 0;
"
"
"
"
"
"
"
"      FOR cr2 IN c2 (cr1.btdln_seq_no)
"
"      LOOP
"
"
"
"           SELECT SUM (CASE
"
"           WHEN (BTDLN_IGST_AMT) > 0
"
"           THEN
"
"              (BTDLN_IGST_AMT)
"
"           WHEN (BTDLN_CGST_AMT + BTDLN_SGST_AMT) > 0
"
"           THEN
"
"              (BTDLN_CGST_AMT + BTDLN_SGST_AMT)
"
"           WHEN (BTDLN_UTGST_AMT) > 0
"
"           THEN
"
"              (BTDLN_UTGST_AMT)
"
"           WHEN (BTDLN_CESS_AMT) > 0
"
"           THEN
"
"              (BTDLN_CESS_AMT)
"
"           ELSE
"
"              0
"
"        END) INTO v_tot_tax_amt
"
"              FROM bank_trans_dist_ln
"
"             WHERE     btdln_bu = p_bu
"
"                   AND btdln_ord_no = cr1.btdln_ord_no
"
"                   AND btdln_hsn_code IS NOT NULL
"
"             AND btdln_tax_pct>0;
"
"
"
"              IF cr2.sdda_distr_type = 'V' THEN
"
"                   v_adj_amt := ROUND((cr2.sdda_grn_val/v_grn_val)*p_lc_Amt,v_rnd);
"
"              ELSE
"
"                v_adj_amt := ROUND((cr2.sdda_grn_qty/v_grn_qtY)*p_lc_Amt,v_rnd);
"
"              END IF;
"
"                        UPDATE suplr_doc_dist_adj
"
"                   SET sdda_adj_amt = ROUND(v_adj_amt,v_rnd),
"
"                       sdda_adj_amt_bc = ROUND(v_adj_amt * cr1.btln_exrate,v_rnd),
"
"                       sdda_adj_type = CASE WHEN cr1.btdln_dr_cr = 'DR' THEN 'C' ELSE 'D' END
"
"                 WHERE     sdda_bu = p_bu
"
"                       AND sdda_doc_no = cr1.btdln_ord_no
"
"                       AND sdda_seq_no = cr1.btdln_seq_no
"
"                       AND sdda_sub_seq_no = cr2.sdda_sub_seq_no;
"
"
"
"
"
"                           v_tot_adj_amt    := v_tot_adj_amt + ROUND(v_adj_amt,v_rnd);
"
"            v_lseq_no    := cr2.sdda_sub_seq_no;
"
"
"
"          END LOOP;
"
"
"
"
"
"END LOOP;
"
"
"
"
"
"DECLARE
"
"
"
"    CURSOR c0
"
"    IS
"
"    SELECT apmc_lc_flag
"
"      FROM apm_control
"
"     WHERE apmc_bu = p_bu;
"
"
"
"     v_lc_flag                 VARCHAR2 (1);
"
"
"
"   CURSOR c1
"
"   IS
"
"      SELECT *
"
"        FROM bank_trans_dist_ln
"
"       WHERE     btdln_bu = p_bu
"
"             AND btdln_ord_no = p_ord_no;
"
"
"
"   CURSOR c2 (
"
"      c_seq_no    NUMBER)
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_dist_adj
"
"       WHERE     sdda_bu = p_bu
"
"             AND sdda_doc_no = p_ord_no
"
"             AND sdda_seq_no = c_seq_no;
"
"
"
"CURSOR c3 (c_grn_no VARCHAR2,
"
"              c_seq_no NUMBER,
"
"                          /* c_acct_plnt VARCHAR2,
"
"                           c_lvl1 VARCHAR2,
"
"                           c_lvl2 VARCHAR2,
"
"                           c_lvl3 VARCHAR2,
"
"                           c_lvl4 VARCHAR2,
"
"                           c_lvl5 VARCHAR2,
"
"                           c_lvl6 VARCHAR2,
"
"                           c_lvl_prj VARCHAR2,*/
"
"                           c_acct VARCHAR2)
"
"   IS
"
"      SELECT porl_sc_unit_cost,porl_receipt_qty,porl_aod_qty,porl_accepted_qty,porl_disc_pct,
"
"             porl_seq_no,porl_prod_id,porl_prod_rev,porl_prod_desc1,
"
"             pur_ord_receipt_hd_view.PORH_EXCHANGE_RATE
"
"        FROM pur_ord_receipt_ln_view a,
"
"        pur_ord_receipt_hd_view,
"
"        suplr_rct_ln_acct_dtls
"
"       WHERE porl_bu = p_bu
"
"           and PORH_BU = porl_bu
"
"                        and PORH_RECEIPT_NO = porl_receipt_no
"
"         AND porl_receipt_no = c_grn_no
"
"         AND porl_status NOT IN ('C')
"
"         AND srlad_bu = porl_bu
"
"         AND srlad_rcpt_no = porl_receipt_no
"
"                 AND srlad_rcpt_seq_no = porl_seq_no
"
"                 AND srlad_bu = p_bu
"
"                 AND srlad_pfx = p_ord_pfx
"
"                 AND srlad_doc_no = p_ord_no
"
"                 AND srlad_adj_seq_no = c_seq_no/*
"
"                 AND srlad_acct_plnt = c_acct_plnt
"
"                 AND srlad_lvl1 = c_lvl1
"
"                 AND srlad_lvl2 = c_lvl2
"
"                 AND srlad_lvl3 = c_lvl3
"
"                 AND srlad_lvl4 = c_lvl4
"
"                 AND srlad_lvl5 = c_lvl5
"
"                 AND srlad_lvl6 = c_lvl6
"
"                 AND srlad_lvl_prj = c_lvl_prj*/
"
"                 AND srlad_acct  = c_acct
"
"                 AND v_lc_flag = 'I'
"
"                 AND EXISTS
"
"                      (SELECT 1
"
"                         FROM products
"
"                        WHERE     prod_bu = porl_bu
"
"                              AND prod_id = porl_prod_id
"
"                              AND prod_rev = porl_prod_rev
"
"                              AND prod_status = 'A'
"
"                              AND prod_stocked = 'Y')
"
"              UNION ALL
"
"      SELECT porl_sc_unit_cost,porl_receipt_qty,porl_aod_qty,porl_accepted_qty,porl_disc_pct,
"
"             porl_seq_no,porl_prod_id,porl_prod_rev,porl_prod_desc1,
"
"             pur_ord_receipt_hd_view.PORH_EXCHANGE_RATE
"
"        FROM pur_ord_receipt_ln_view a,
"
"        pur_ord_receipt_hd_view,suplr_rct_ln_acct_dtls
"
"       WHERE porl_bu = p_bu
"
"           and PORH_BU = porl_bu
"
"                        and PORH_RECEIPT_NO = porl_receipt_no
"
"         AND porl_receipt_no = c_grn_no
"
"         AND porl_status NOT IN ('C')
"
"         AND srlad_bu = porl_bu
"
"         AND porl_accepted_qty > 0
"
"         AND srlad_rcpt_no = porl_receipt_no
"
"                 AND srlad_rcpt_seq_no = porl_seq_no
"
"                 AND srlad_bu = p_bu
"
"                 AND srlad_pfx = p_ord_pfx
"
"                 AND srlad_doc_no = p_ord_no
"
"                 AND srlad_adj_seq_no = c_seq_no/*
"
"                 AND srlad_acct_plnt = c_acct_plnt
"
"                 AND srlad_lvl1 = c_lvl1
"
"                 AND srlad_lvl2 = c_lvl2
"
"                 AND srlad_lvl3 = c_lvl3
"
"                 AND srlad_lvl4 = c_lvl4
"
"                 AND srlad_lvl5 = c_lvl5
"
"                 AND srlad_lvl6 = c_lvl6
"
"                 AND srlad_lvl_prj = c_lvl_prj*/
"
"                 AND srlad_acct  = c_acct
"
"                 AND v_lc_flag = 'S'
"
"                 AND EXISTS
"
"                      (SELECT 1
"
"                         FROM products
"
"                        WHERE     prod_bu = porl_bu
"
"                              AND prod_id = porl_prod_id
"
"                              AND prod_rev = porl_prod_rev
"
"                              AND prod_status = 'A'
"
"                              AND prod_stocked = 'Y')
"
"             UNION ALL
"
"      SELECT porl_sc_unit_cost,porl_receipt_qty,porl_aod_qty,porl_accepted_qty,porl_disc_pct,
"
"             porl_seq_no,porl_prod_id,porl_prod_rev,porl_prod_desc1,
"
"             pur_ord_receipt_hd_view.PORH_EXCHANGE_RATE
"
"        FROM pur_ord_receipt_ln_view a,pur_ord_receipt_hd_view
"
"       WHERE porl_bu = p_bu
"
"           and PORH_BU = porl_bu
"
"                        and PORH_RECEIPT_NO = porl_receipt_no
"
"         AND porl_receipt_no = c_grn_no
"
"         AND porl_accepted_qty > 0
"
"         AND porl_status NOT IN ('C')
"
"                 AND v_lc_flag = 'S'
"
"                 AND EXISTS (SELECT 1
"
"                                       FROM lc_ledger_association
"
"                                      WHERE lla_bu = p_bu
"
"                                                AND lla_acct = c_acct)
"
"                 AND NOT EXISTS (SELECT 1
"
"                                                   FROM suplr_rct_ln_acct_dtls
"
"                                                  WHERE srlad_bu = p_bu
"
"                                                      AND srlad_pfx = p_ord_pfx
"
"                                                      AND srlad_doc_no = p_ord_no
"
"                                                      AND srlad_adj_seq_no = c_seq_no/*
"
"                                                      AND srlad_acct_plnt = c_acct_plnt
"
"                                                      AND srlad_lvl1 = c_lvl1
"
"                                                      AND srlad_lvl2 = c_lvl2
"
"                                                      AND srlad_lvl3 = c_lvl3
"
"                                                      AND srlad_lvl4 = c_lvl4
"
"                                                      AND srlad_lvl5 = c_lvl5
"
"                                                      AND srlad_lvl6 = c_lvl6
"
"                                                      AND srlad_lvl_prj = c_lvl_prj*/
"
"                                                      AND srlad_acct  = c_acct
"
"                                                      AND srlad_rcpt_no = porl_receipt_no)
"
"                 AND EXISTS
"
"                      (SELECT 1
"
"                         FROM products
"
"                        WHERE     prod_bu = porl_bu
"
"                              AND prod_id = porl_prod_id
"
"                              AND prod_rev = porl_prod_rev
"
"                              AND prod_status = 'A'
"
"                              AND prod_stocked = 'Y')
"
"      ORDER BY 4;
"
"
"
"
"
"
"
"   CURSOR c4
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_dist_adj
"
"       WHERE     sdda_bu = p_bu
"
"             AND sdda_doc_no = p_ord_no;
"
"
"
"   CURSOR c5 (
"
"      --c_pfx    VARCHAR2,
"
"      c_no     VARCHAR2)
"
"   IS
"
"      SELECT *
"
"        FROM pur_ord_receipt_hd_view, pur_ord_receipt_ln_view
"
"       WHERE     porh_bu = p_bu
"
"             AND porh_bu = porl_bu
"
"             AND porh_receipt_no = porl_receipt_no
"
"             --AND porh_receipt_pfx = c_pfx
"
"             AND porh_receipt_no = c_no
"
"             AND porl_status NOT IN ('C');
"
"
"
"   v_grn_val         NUMBER := 0;
"
"   v_adj_amt         NUMBER := 0;
"
"   v_tot_grn_amt     NUMBER := 0;
"
"   v_line_grn_amt    NUMBER := 0;
"
"   v_tot_grn_uc_amt  NUMBER := 0;
"
"   v_line_adj_val    NUMBER := 0;
"
"   v_adj_unit_cost   NUMBER := 0;
"
"   v_seq_no          NUMBER := 0;
"
"   v_db_plnt         VARCHAR2 (20);
"
"   v_db_lvl1         VARCHAR2 (4);
"
"   v_db_lvl2         VARCHAR2 (4);
"
"   v_db_lvl3         VARCHAR2 (4);
"
"   v_db_lvl4         VARCHAR2 (4);
"
"   v_db_lvl5         VARCHAR2 (4);
"
"   v_db_lvl6         VARCHAR2 (4);
"
"   v_db_prj_lvl      VARCHAR2 (10);
"
"   v_db_cc_code         VARCHAR2 (100);
"
"   v_db_acct         VARCHAR2 (20);
"
"   v_stkd            VARCHAR2 (1);
"
"   v_adj_cnt                    NUMBER;
"
"   v_adj_ln_cnt                NUMBER;
"
"   v_lc_flag_cnt            NUMBER;
"
"    v_rnd                            NUMBER    := func_find_appl_rnddigit(p_bu);
"
"
"
"   cr0               c0%ROWTYPE;
"
"   cr2               c2%ROWTYPE;
"
"   cr5               c5%ROWTYPE;
"
"BEGIN
"
"
"
"    --proc_load_grn_ln_acct;
"
"    pkg_web_bank_ins_lc_acct.proc_web_load_grn_ln_acct(p_bu,
"
"                                                       p_ord_pfx,
"
"                                                       p_ord_no,
"
"                                                       p_user);
"
"
"
"     DELETE FROM suplr_doc_dist_ln_adj
"
"      WHERE sddla_bu = p_bu
"
"        AND sddla_doc_no = p_ord_no;
"
"
"
"        OPEN c0;
"
"        FETCH c0 INTO cr0;
"
"
"
"        v_lc_flag    := cr0.apmc_lc_flag;
"
"
"
"        CLOSE c0;
"
"
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"
"
"            FOR cr2 IN c2 (cr1.btdln_seq_no)
"
"      LOOP
"
"
"
"          OPEN c5(--cr2.sdda_grn_pfx,
"
"          cr2.sdda_grn_no);
"
"          FETCH c5 INTO cr5;
"
"
"
"          IF c5%FOUND AND cr5.porh_grn_date > cr6.btrans_pv_date THEN
"
"                  RAISE_APPLICATION_ERROR(-20999,'GRN Date should not be greater than Voucher Date.');
"
"          END IF;
"
"
"
"          CLOSE c5;
"
"
"
"                 SELECT COUNT(*)
"
"             INTO v_lc_flag_cnt
"
"             FROM suplr_rct_ln_acct_dtls
"
"            WHERE srlad_bu = p_bu
"
"                        AND srlad_pfx = p_ord_pfx
"
"                        AND srlad_doc_no = p_ord_no
"
"                        AND srlad_adj_seq_no = cr2.sdda_seq_no
"
"                        AND srlad_acct_plnt = cr1.btdln_acct_plant
"
"                        AND srlad_lvl1 = cr1.btdln_lvl1
"
"                        AND srlad_lvl2 = cr1.btdln_lvl2
"
"                        AND srlad_lvl3 = cr1.btdln_lvl3
"
"                        AND srlad_lvl4 = cr1.btdln_lvl4
"
"                        AND srlad_lvl5 = cr1.btdln_lvl5
"
"                        AND srlad_lvl6 = cr1.btdln_lvl6
"
"                        AND srlad_lvl_prj = cr1.btdln_lvl_prj
"
"                        AND srlad_acct = cr1.btdln_acct;
"
"
"
"          IF v_lc_flag = 'I' OR (v_lc_flag = 'S' AND v_lc_flag_cnt > 0) THEN
"
"        BEGIN
"
"       -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||cr1.btdln_lvl1 ||'-'||cr1.btdln_lvl2||'---'|| cr1.btdln_lvl3||'-'||cr1.btdln_lvl4||'-'||cr1.btdln_lvl5 ||'-'||cr1.btdln_lvl6||'-'||cr1.btdln_lvl_prj||'-'||cr1.btdln_acct );
"
"         SELECT SUM ((porl_receipt_qty + porl_aod_qty)
"
"                   * (  porl_sc_unit_cost- (porl_sc_unit_cost * (porl_disc_pct / 100))))*PORH_EXCHANGE_RATE
"
"           INTO v_tot_grn_amt
"
"           FROM pur_ord_receipt_ln_view,pur_ord_receipt_hd_view,suplr_rct_ln_acct_dtls
"
"          WHERE porl_bu = p_bu
"
"            AND porl_receipt_no = cr2.sdda_grn_no
"
"            AND porl_status NOT IN ('C')
"
"            AND srlad_bu = porl_bu
"
"            AND srlad_rcpt_no = porl_receipt_no
"
"            AND srlad_rcpt_seq_no = porl_seq_no
"
"            AND porh_bu = porl_bu
"
"            AND porh_receipt_no = porl_receipt_no
"
"            AND srlad_pfx = p_ord_pfx
"
"            AND srlad_doc_no = p_ord_no
"
"            AND srlad_adj_seq_no = cr2.sdda_seq_no
"
"            AND srlad_acct_plnt = cr1.btdln_acct_plant
"
"            AND srlad_lvl1 = cr1.btdln_lvl1
"
"            AND srlad_lvl2 = cr1.btdln_lvl2
"
"            AND srlad_lvl3 = cr1.btdln_lvl3
"
"            AND srlad_lvl4 = cr1.btdln_lvl4
"
"            AND srlad_lvl5 = cr1.btdln_lvl5
"
"            AND srlad_lvl6 = cr1.btdln_lvl6
"
"            AND srlad_lvl_prj = cr1.btdln_lvl_prj
"
"            AND srlad_acct = cr1.btdln_acct
"
"       GROUP BY porh_exchange_rate;
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
"
"    END;
"
"          ELSIF v_lc_flag = 'S' AND v_lc_flag_cnt = 0 THEN
"
"
"
"        SELECT
"
"                         SUM ((porl_receipt_qty + porl_aod_qty)
"
"                   * (  porl_sc_unit_cost
"
"                      - (porl_sc_unit_cost * (porl_disc_pct / 100))))*PORH_EXCHANGE_RATE
"
"           INTO v_tot_grn_amt
"
"           FROM pur_ord_receipt_ln_view,pur_ord_receipt_hd_view
"
"          WHERE porl_bu = p_bu
"
"            AND porl_receipt_no = cr2.sdda_grn_no
"
"             and PORH_BU = porl_bu
"
"                        and PORH_RECEIPT_NO = porl_receipt_no
"
"            AND porl_status NOT IN ('C')
"
"             group by PORH_EXCHANGE_RATE;
"
"
"
"          END IF;
"
"
"
"
"
"
"
"              SELECT
"
"                         SUM (((porl_receipt_qty + porl_aod_qty)
"
"                   * (  porl_sc_unit_cost
"
"                      - (porl_sc_unit_cost * (porl_disc_pct / 100))))*PORH_EXCHANGE_RATE)
"
"           INTO v_tot_grn_amt
"
"           FROM pur_ord_receipt_ln_view,pur_ord_receipt_hd_view
"
"          WHERE porl_bu = p_bu
"
"            AND porl_status NOT IN ('C')
"
"            and PORH_BU = porl_bu
"
"                        and PORH_RECEIPT_NO = porl_receipt_no
"
"            AND porl_receipt_no = cr2.sdda_grn_no
"
"                        AND EXISTS (SELECT 1
"
"                         FROM products
"
"                        WHERE     prod_bu = porl_bu
"
"                              AND prod_id = porl_prod_id
"
"                              AND prod_rev = porl_prod_rev
"
"                              AND prod_status = 'A'
"
"                              AND prod_stocked = 'Y');
"
"
"
"              SELECT SUM(porl_receipt_qty) porl_sc_unit_cost
"
"           INTO v_tot_grn_uc_amt
"
"           FROM pur_ord_receipt_ln_view
"
"          WHERE porl_bu = p_bu
"
"            AND porl_receipt_no = cr2.sdda_grn_no
"
"            AND porl_status NOT IN ('C')
"
"                        AND EXISTS (SELECT 1
"
"                         FROM products
"
"                        WHERE     prod_bu = porl_bu
"
"                              AND prod_id = porl_prod_id
"
"                              AND prod_rev = porl_prod_rev
"
"                              AND prod_status = 'A'
"
"                              AND prod_stocked = 'Y');
"
"
"
"         v_seq_no := 0;
"
"
"
"         FOR cr3 IN c3 ( cr2.sdda_grn_no,cr2.sdda_seq_no,
"
"                        /*cr1.btdln_acct_plant,
"
"                        cr1.btdln_lvl1,
"
"                        cr1.btdln_lvl2,
"
"                        cr1.btdln_lvl3,
"
"                        cr1.btdln_lvl4,
"
"                        cr1.btdln_lvl5,
"
"                        cr1.btdln_lvl6,
"
"                        cr1.btdln_lvl_prj,*/
"
"                        cr1.btdln_acct)
"
"         LOOP
"
"
"
"                v_line_grn_uc_amt:=cr3.porl_sc_unit_cost;
"
"            v_line_grn_amt := --cr3.porl_receipt_qty porl_accepted_qty
"
"                (cr3.porl_receipt_qty + cr3.porl_aod_qty)
"
"               * (  cr3.porl_sc_unit_cost
"
"                  - (cr3.porl_sc_unit_cost * (cr3.porl_disc_pct / 100)))*cr3.PORH_EXCHANGE_RATE;
"
"
"
"            IF p_lc_type <> 'V' THEN
"
"
"
"             v_line_adj_val := (cr3.porl_receipt_qty/cr2.sdda_grn_qty)*cr2.sdda_adj_amt;
"
"
"
"            ELSE
"
"
"
"
"
"            v_line_adj_val := v_line_grn_amt/cr2.sdda_grn_val*cr2.sdda_adj_amt;
"
"
"
"            END IF;
"
"      ---  proc_debug_proc('Dinesh*'||'-'||v_seq_no||'*'||cr3.porl_accepted_qty||'-'||cr3.porl_aod_qty||'/'||cr2.sdda_grn_no);
"
"            v_adj_unit_cost := ROUND (v_line_adj_val /(cr3.porl_accepted_qty + cr3.porl_aod_qty), 5);
"
"            v_seq_no := v_seq_no + 1;
"
"
"
"
"
"--raise_application_error(-20999,'HRM');
"
"                INSERT INTO suplr_doc_dist_ln_adj (sddla_bu,
"
"                                                   --sddla_doc_pfx,
"
"                                                   sddla_doc_no,
"
"                                                   sddla_seq_no,
"
"                                                   sddla_sub_seq_no,
"
"                                                   sddla_diln_seq_no,
"
"                                                   sddla_grn_pfx,
"
"                                                   sddla_grn_no,
"
"                                                   sddla_grnln_seq_no,
"
"                                                   sddla_grn_ln_val,
"
"                                                   sddla_prod_id,
"
"                                                   sddla_prod_rev,
"
"                                                   sddla_prod_desc1,
"
"                                                   sddla_distr_type,
"
"                                           sddla_grn_ln_qty,
"
"                                                   sddla_ln_adj_val,
"
"                                                   sddla_adj_unit_cost,
"
"                                                   sddla_cre_by,
"
"                                                   sddla_cre_date,
"
"                                                   sddla_upd_by,
"
"                                                   sddla_upd_date,
"
"                                                   sddla_currency,
"
"                                                   sddla_exchange_rate)
"
"                     VALUES ( p_bu,
"
"                           --  cr1.btdln_ord_pfx,
"
"                             cr1.btdln_ord_no,
"
"                             cr1.btdln_seq_no,
"
"                             cr2.sdda_sub_seq_no,
"
"                             v_seq_no,
"
"                             cr2.sdda_grn_pfx,
"
"                             cr2.sdda_grn_no,
"
"                             cr3.porl_seq_no,
"
"                             v_line_grn_amt,
"
"                             cr3.porl_prod_id,
"
"                     cr3.porl_prod_rev,
"
"                     cr3.porl_prod_desc1,
"
"                     p_lc_type,
"
"                     cr3.porl_receipt_qty,
"
"                             (v_line_adj_val * CR1.btln_exrate),--cr5.porh_exchange_rate),
"
"                             (v_adj_unit_cost * CR1.btln_exrate),
"
"                             p_user,
"
"                             SYSDATE,
"
"                             NULL,
"
"                             NULL,
"
"                             cr5.porh_currency,
"
"                            cr5.porh_exchange_rate  -- cr5.porh_exchange_rate    --CR1.btln_exrate
"
"                             );
"
"
"
"
"
"                         END LOOP;
"
"                      END LOOP;
"
"                   END LOOP;
"
"
"
"---------------------------------------
"
"
"
"FOR cr6 IN (SELECT btdln_seq_no,btdln_acct_desc,btdln_cc_desc
"
"              FROM bank_trans_dist_ln
"
"             WHERE btdln_bu = p_bu
"
"               AND btdln_ord_no = p_ord_no)
"
"LOOP
"
"
"
"    SELECT COUNT(1)
"
"      INTO v_adj_cnt
"
"      FROM suplr_doc_dist_adj
"
"     WHERE sdda_bu = p_bu
"
"       AND sdda_doc_no = p_ord_no
"
"       AND sdda_seq_no = cr6.btdln_seq_no;
"
"
"
"    SELECT COUNT(1)
"
"      INTO v_adj_ln_cnt
"
"      FROM suplr_doc_dist_adj,suplr_doc_dist_ln_adj
"
"     WHERE sdda_bu = sddla_bu
"
"       AND sdda_doc_no = sddla_doc_no
"
"       AND sdda_seq_no = sddla_seq_no
"
"       AND sdda_sub_seq_no = sddla_sub_seq_no
"
"       AND sdda_bu = p_bu
"
"       AND sdda_doc_no = p_ord_no
"
"       AND sdda_seq_no = cr6.btdln_seq_no;
"
"
"
"
"
"   IF v_adj_cnt > 0 AND v_adj_ln_cnt = 0 THEN
"
"           IF v_lc_flag = 'I' THEN
"
"               RAISE_APPLICATION_ERROR(-20999,'Account/CostCenter not associated with the GRN. '||cr6.btdln_acct_desc||'-'||cr6.btdln_cc_desc);
"
"           ELSIF v_lc_flag = 'S' THEN
"
"               RAISE_APPLICATION_ERROR(-20999,'Specified Account/CostCenter is not defined in LC Account Association. '||cr6.btdln_acct_desc||'-'||cr6.btdln_cc_desc);
"
"           END IF;
"
"   END IF;
"
"
"
"END LOOP;
"
"
"
"
"
"
"
"    SELECT COUNT(*)
"
"      INTO v_adj_cnt
"
"      FROM suplr_doc_dist_adj
"
"     WHERE sdda_bu = p_bu
"
"       AND sdda_doc_no = p_ord_no;
"
"
"
"    SELECT COUNT(*)
"
"      INTO v_adj_ln_cnt
"
"      FROM suplr_doc_dist_adj,suplr_doc_dist_ln_adj
"
"     WHERE sdda_bu = sddla_bu
"
"       AND sdda_doc_no = sddla_doc_no
"
"       AND sdda_seq_no = sddla_seq_no
"
"       AND sdda_sub_seq_no = sddla_sub_seq_no
"
"       AND sdda_bu = p_bu
"
"       AND sdda_doc_no = p_ord_no;
"
"
"
"
"
"IF (v_adj_cnt > 0 AND v_adj_ln_cnt = 0) OR v_adj_ln_cnt = 0 THEN
"
"   p_out_mgs := 'Please provide GRN Details.';
"
"ELSE
"
"   p_out_mgs := 'Amount Distributed.';
"
"END IF;
"
"
"
"
"
"END;
"
"END proc_web_ins_lc_adjust;
"
"
"
"PROCEDURE proc_web_upd_grn_adj_lc_amt (
"
"    p_bu      VARCHAR2,
"
"    p_ord_pfx VARCHAR,
"
"    p_ord_no  VARCHAR2
"
") IS
"
"V_EX_RATE   NUMBER := 0;
"
"--V_RND NUMBER  :=  FUNC_FIND_RND_DIGIT(p_bu);
"
"BEGIN
"
"BEGIN
"
"
"
"
"
"SELECT BTRANS_TRANS_BASE_EXRATE
"
"     INTO V_EX_RATE
"
"     FROM bank_trans
"
"    WHERE btrans_bu = p_bu
"
"      AND btrans_ord_pfx = p_ord_pfx
"
"      AND btrans_ord_no = p_ord_no;
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"   NULL;
"
"   END;
"
"    FOR cr1 IN (SELECT sdda_seq_no,
"
"                       sum(ROUND(sdda_adj_amt,2))sdda_adj_amt
"
"                  FROM suplr_doc_dist_adj
"
"                 WHERE sdda_bu = p_bu
"
"                   AND sdda_doc_no = p_ord_no
"
"              GROUP BY sdda_seq_no)
"
"         LOOP
"
"        UPDATE bank_trans_dist_ln
"
"           SET btdln_dist_amt = (cr1.sdda_adj_amt),
"
"               btdln_bc_amt = (cr1.sdda_adj_amt * btln_exrate)--cr1.sdda_adj_amt  --(cr1.sdda_adj_amt * NVL(V_EX_RATE,1))
"
"         WHERE btdln_bu = p_bu
"
"           AND btdln_ord_no = p_ord_no
"
"           AND btdln_seq_no = cr1.sdda_seq_no;
"
"    END LOOP;
"
"END proc_web_upd_grn_adj_lc_amt;
"
"END;"
/
