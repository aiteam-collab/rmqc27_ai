CREATE OR REPLACE
"PACKAGE BODY pkg_si_invoice_web_som1090
"
"AS  /*DECLARED BY ISWARYA*/
"
"   PROCEDURE proc_si_pick_det_web (p_bu             VARCHAR2,
"
"                                   p_user           VARCHAR2,
"
"                                   p_sihd_plant     VARCHAR2,
"
"                                   p_sihd_doc_no    VARCHAR2)
"
"   IS
"
"      CURSOR c0
"
"      IS
"
"         SELECT *
"
"           FROM som_control
"
"          WHERE somctrl_bu = p_bu;
"
"
"
"      CURSOR c1
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_ln, products
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_sihd_plant
"
"                AND siln_doc_no = p_sihd_doc_no
"
"                AND siln_bu = prod_bu
"
"                AND siln_prod_id = prod_id
"
"                AND siln_prod_rev = prod_rev
"
"                AND prod_status = 'A'
"
"                AND prod_cost_method IN ('FIFO', 'LIFO');
"
"
"
"      CURSOR c2
"
"      IS
"
"         SELECT *
"
"           FROM (SELECT siln_seq_no,
"
"                        siln_store_id,
"
"                        siln_prod_id,
"
"                        siln_prod_rev,
"
"                        siln_so_no,
"
"                        siln_so_seq_no,
"
"                        siln_inv_qty,
"
"                        NVL ( (sqoh_so_qty - sqoh_so_alloc_qty), 0) so_qty
"
"                   FROM sales_invoices_ln,
"
"                        products,
"
"                        so_qty_on_hand,
"
"                        icm_control
"
"                  WHERE     siln_bu = p_bu
"
"                        AND siln_plnt = p_sihd_plant
"
"                        AND siln_doc_no = p_sihd_doc_no
"
"                        AND siln_promotion_flag IN ('N', 'T')
"
"                        AND siln_bu = prod_bu
"
"                        AND siln_prod_id = prod_id
"
"                        AND siln_prod_rev = prod_rev
"
"                        AND prod_status = 'A'
"
"                        AND siln_bu = icmctrl_bu
"
"                        AND siln_so_no IS NOT NULL
"
"                        AND siln_proj_id IS NULL
"
"                        AND siln_prod_indicator_flag = 'Y'
"
"                        AND siln_w_wo_stk_flag = 'Y'
"
"                        AND prod_var_opt NOT IN ('PTO')
"
"                        AND siln_sf_code IS NULL
"
"                        AND siln_bu = sqoh_bu(+)
"
"                        AND siln_store_id = sqoh_store_id(+)
"
"                        AND siln_prod_id = sqoh_prod_id(+)
"
"                        AND siln_prod_rev = sqoh_prod_rev(+)
"
"                        AND siln_so_schld_desc = sqoh_so_schld_desc(+)
"
"                        --AND siln_so_no = sqoh_so_ord_no(+)
"
"                 UNION ALL
"
"                 SELECT siln_seq_no,
"
"                        siln_store_id,
"
"                        siln_prod_id,
"
"                        siln_prod_rev,
"
"                        siln_so_no,
"
"                        siln_so_seq_no,
"
"                        siln_inv_qty,
"
"                        NVL ( (sqoh_so_qty - sqoh_so_alloc_qty), 0) so_qty
"
"                   FROM sales_invoices_ln,
"
"                        products,
"
"                        so_qty_on_hand,
"
"                        icm_control
"
"                  WHERE     siln_bu = p_bu
"
"                        AND siln_plnt = p_sihd_plant
"
"                        AND siln_doc_no = p_sihd_doc_no
"
"                        AND siln_promotion_flag IN ('N', 'T')
"
"                        AND siln_bu = prod_bu
"
"                        AND siln_prod_id = prod_id
"
"                        AND siln_prod_rev = prod_rev
"
"                        AND prod_status = 'A'
"
"                        AND siln_bu = icmctrl_bu
"
"                        AND siln_proj_id IS NOT NULL
"
"                        AND siln_prod_indicator_flag = 'Y'
"
"                        AND siln_w_wo_stk_flag = 'Y'
"
"                        AND prod_var_opt NOT IN ('PTO')
"
"                        AND siln_sf_code IS NULL
"
"                        AND siln_bu = sqoh_bu(+)
"
"                        AND siln_store_id = sqoh_store_id(+)
"
"                        AND siln_prod_id = sqoh_prod_id(+)
"
"                        AND siln_prod_rev = sqoh_prod_rev(+)
"
"                        AND siln_proj_id = sqoh_proj_id(+))
"
"          WHERE siln_inv_qty > so_qty;
"
"
"
"      CURSOR c3
"
"      IS
"
"         SELECT siplh_pck_ctn_prod_id
"
"           FROM sales_inv_pack_list_hd
"
"          WHERE     siplh_bu = p_bu
"
"                AND siplh_plnt = p_sihd_plant
"
"                AND siplh_doc_no = p_sihd_doc_no;
"
"
"
"      CURSOR c4
"
"      IS
"
"           SELECT SUM (siln_inv_qty) inv_qty, siln_seq_no, siln_prod_id, siln_prod_rev
"
"             FROM sales_invoices_ln
"
"            WHERE     siln_bu = p_bu
"
"                  AND siln_plnt = p_sihd_plant
"
"                  AND siln_doc_no = p_sihd_doc_no
"
"         GROUP BY siln_prod_id, siln_prod_rev,siln_seq_no;
"
"
"
"      CURSOR c5 (p_seq_no NUMBER,
"
"         p_prod_id     VARCHAR2,
"
"         p_prod_rev    VARCHAR2)
"
"      IS
"
"           SELECT SUM (sipli_no_of_ctn) pack_itm
"
"             FROM sales_inv_pack_list_item
"
"            WHERE     sipli_bu = p_bu
"
"                  AND sipli_plnt = p_sihd_plant
"
"                  AND sipli_doc_no = p_sihd_doc_no
"
"          AND sipli_ln_seq_no = p_seq_no
"
"                  AND sipli_prod_id = p_prod_id
"
"                  AND sipli_prod_rev = p_prod_rev
"
"         GROUP BY sipli_prod_id;
"
"
"
"      CURSOR c6
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_hd
"
"          WHERE     sihd_bu = p_bu
"
"                AND sihd_plant = p_sihd_plant
"
"                AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"      CURSOR c8
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_ln, products
"
"          WHERE     siln_bu = prod_bu
"
"                AND siln_prod_id = prod_id
"
"                AND siln_prod_rev = prod_rev
"
"                AND siln_bu = p_bu
"
"                AND siln_plnt = p_sihd_plant
"
"                AND siln_doc_no = p_sihd_doc_no;
"
"
"
"      CURSOR c_str (
"
"         c_plnt           VARCHAR2,
"
"         c_plnt_loc_id    VARCHAR2,
"
"         c_store_id       VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM stores
"
"          WHERE     store_bu = p_bu
"
"                AND store_plnt = c_plnt
"
"                AND store_plnt_loc_id = c_plnt_loc_id
"
"                AND store_id = c_store_id;
"
"
"
"      CURSOR c_bd (
"
"         c_seq_no NUMBER)
"
"      IS
"
"         SELECT SUM (sibd_bin_qty) trans_qty
"
"           FROM sales_inv_bin_details
"
"          WHERE     sibd_bu = p_bu
"
"                AND sibd_plnt = p_sihd_plant
"
"                AND sibd_doc_no = p_sihd_doc_no
"
"                AND sibd_seq_no = c_seq_no;
"
"
"
"      CURSOR c_sd
"
"      IS
"
"           SELECT siln_seq_no, siln_inv_qty
"
"             FROM sales_invoices_ln, som_control
"
"            WHERE     siln_bu = somctrl_bu
"
"                  AND siln_bu = p_bu
"
"                  AND siln_plnt = p_sihd_plant
"
"                  AND siln_doc_no = p_sihd_doc_no
"
"         GROUP BY siln_seq_no, siln_inv_qty;
"
"
"
"
"
"      CURSOR c_st (
"
"         c_doc_no      VARCHAR2,
"
"         c_prod_id     VARCHAR2,
"
"         c_prod_rev    NUMBER,
"
"         c_store_id    VARCHAR2)
"
"      IS
"
"         SELECT SUM (stob_trans_qty) trans_qty
"
"           FROM stock_trans_other_buckets
"
"          WHERE     stob_bu = p_bu
"
"                AND stob_order_no = c_doc_no
"
"                AND stob_prod_id = c_prod_id
"
"                AND stob_prod_rev = c_prod_rev
"
"                AND stob_store_id = c_store_id;
"
"
"
"      CURSOR c_ps (
"
"         c_prod_id     VARCHAR2,
"
"         c_prod_rev    NUMBER)
"
"      IS
"
"         SELECT *
"
"           FROM prod_shipset
"
"          WHERE     ps_bu = p_bu
"
"                AND ps_fg_prod_id = c_prod_id
"
"                AND ps_fg_prod_rev = c_prod_rev;
"
"
"
"
"
"      CURSOR c_cdc_1 (
"
"         c_seq_no NUMBER)
"
"      IS
"
"         SELECT COUNT (*) cnt
"
"           FROM sales_invoices_ln, sales_inv_cust_dc_mat_cons
"
"          WHERE     siln_bu = sicdmc_bu
"
"                AND siln_plnt = sicdmc_plnt
"
"                AND siln_doc_no = sicdmc_doc_no
"
"                AND siln_seq_no = c_seq_no
"
"                AND sicdmc_bu = p_bu
"
"                AND sicdmc_plnt = p_sihd_plant
"
"                AND sicdmc_doc_no = p_sihd_doc_no;
"
"
"
"      CURSOR c_cdc_2 (
"
"         c_seq_no NUMBER)
"
"      IS
"
"         SELECT COUNT (*) cnt
"
"           FROM sales_invoices_ln, sales_inv_cust_dc_mat_cons
"
"          WHERE     siln_bu = sicdmc_bu
"
"                AND siln_plnt = sicdmc_plnt
"
"                AND siln_doc_no = sicdmc_doc_no
"
"                AND siln_dc_short_flag = 'N'
"
"                AND siln_seq_no = c_seq_no
"
"                AND sicdmc_bu = p_bu
"
"                AND sicdmc_plnt = p_sihd_plant
"
"                AND sicdmc_doc_no = p_sihd_doc_no
"
"                AND sicdmc_dc_no IS NULL
"
"                AND sicdmc_cons_qty > 0;
"
"
"
"      CURSOR c_cdc_3 (
"
"         c_seq_no NUMBER)
"
"      IS
"
"         SELECT siln_seq_no, siln_prod_id, siln_prod_rev
"
"           FROM sales_invoices_ln, sales_inv_cust_dc_mat_cons
"
"          WHERE     siln_bu = sicdmc_bu
"
"                AND siln_plnt = sicdmc_plnt
"
"                AND siln_doc_no = sicdmc_doc_no
"
"                AND siln_dc_short_flag = 'Y'
"
"                AND siln_seq_no = c_seq_no
"
"                AND sicdmc_bu = p_bu
"
"                AND sicdmc_plnt = p_sihd_plant
"
"                AND sicdmc_doc_no = p_sihd_doc_no;
"
"
"
"      CURSOR c_exp
"
"      IS
"
"         SELECT *
"
"           FROM sales_inv_exceptions
"
"          WHERE sie_bu = p_bu;
"
"
"
"      CURSOR cb1
"
"      IS
"
"         SELECT somctrl_allow_bol_falg
"
"           FROM som_control
"
"          WHERE somctrl_bu = p_bu;
"
"
"
"      CURSOR c_ls (
"
"         c_seq_no NUMBER)
"
"      IS
"
"           SELECT sisln_seq_no, SUM (sisln_lot_qty) lot_ser_qty
"
"             FROM sales_inv_serial_lot_no
"
"            WHERE     sisln_bu = p_bu
"
"                  AND sisln_plnt = p_sihd_plant
"
"                  AND sisln_doc_no = p_sihd_doc_no
"
"                  AND sisln_seq_no = c_seq_no
"
"         GROUP BY sisln_seq_no;
"
"
"
"      CURSOR c_pk (
"
"         c_prod_id     VARCHAR2,
"
"         c_prod_rev    NUMBER)
"
"      IS
"
"           SELECT sipli_prod_id, sipli_prod_rev, SUM (sipli_no_of_ctn) pack_qty
"
"             FROM sales_inv_pack_list_hd, sales_inv_pack_list_item
"
"            WHERE     siplh_bu = p_bu
"
"                  AND siplh_plnt = p_sihd_plant
"
"                  AND siplh_doc_no = p_sihd_doc_no
"
"                  AND siplh_bu = sipli_bu
"
"                  AND siplh_doc_no = sipli_doc_no
"
"                  AND siplh_seq_no = sipli_seq_no
"
"                  AND sipli_prod_id = c_prod_id
"
"                  AND sipli_prod_rev = c_prod_rev
"
"         GROUP BY sipli_prod_id, sipli_prod_rev;
"
"
"
"      CURSOR c10
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_hd, sales_invoices_ln
"
"          WHERE     sihd_bu = siln_bu
"
"                AND sihd_doc_no = siln_doc_no
"
"                AND sihd_plant = siln_plnt
"
"                AND sihd_bu = p_bu
"
"                AND sihd_plant = p_sihd_plant
"
"                AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"      cr0                c0%ROWTYPE;
"
"      cr6                c6%ROWTYPE;
"
"      cr2                c2%ROWTYPE;
"
"      cr3                c3%ROWTYPE;
"
"      cr4                c4%ROWTYPE;
"
"      cr5                c5%ROWTYPE;
"
"      cr10               c10%ROWTYPE;
"
"      r_str              c_str%ROWTYPE;
"
"      r_bd               c_bd%ROWTYPE;
"
"      r_ls               c_ls%ROWTYPE;
"
"      r_sd               c_sd%ROWTYPE;
"
"      ---  r_cid              c_cid%ROWTYPE;
"
"      r_st               c_st%ROWTYPE;
"
"      r_ps               c_ps%ROWTYPE;
"
"      r_cdc_1            c_cdc_1%ROWTYPE;
"
"      r_cdc_2            c_cdc_2%ROWTYPE;
"
"      r_cdc_3            c_cdc_3%ROWTYPE;
"
"      r_exp              c_exp%ROWTYPE;
"
"      crb1               cb1%ROWTYPE;
"
"      r_pk               c_pk%ROWTYPE;
"
"
"
"      var_gen_ls         VARCHAR2 (1);
"
"      var_tot_amt        NUMBER;
"
"      var_tot_qty        NUMBER;
"
"      v_cnt              NUMBER;
"
"      v_cnt1             NUMBER;
"
"      var_tr_wgt         NUMBER;
"
"      var_pallet_wgt     NUMBER := 0;
"
"      v_wh_cnt           NUMBER;
"
"      var_res            VARCHAR2 (1);
"
"      var_cl_res         VARCHAR2 (100);
"
"      v_ship_set_cnt     NUMBER;
"
"      var_lic_basis      VARCHAR2 (50);
"
"      var_lic_basis1     VARCHAR2 (50);
"
"      v_pto_count        NUMBER;
"
"      v_sto_cnt          NUMBER;
"
"      v_tpn              NUMBER (10) := 0;
"
"      v_bill             NUMBER (10) := 0;
"
"      v_ser              NUMBER (10) := 0;
"
"      flag               NUMBER (10);
"
"      v_pick_qty         NUMBER (12, 3) := 0;
"
"      v_inv_qty          NUMBER (12, 3) := 0;
"
"      rnd                NUMBER;
"
"      var_cnt_disc       NUMBER;
"
"      var_sum_duepct     NUMBER;
"
"      var_sum_dueamt     NUMBER;
"
"      var_isum_duepct    NUMBER;
"
"      var_dsum_dueamt    NUMBER;
"
"      var_dsum_duepct    NUMBER;
"
"      var_isum_dueamt    NUMBER;
"
"      v_ln_amount        NUMBER (15, 3);
"
"      v_tax_amt          NUMBER (15, 3);
"
"      v_mat_amount       NUMBER (15, 3);
"
"      v_dtax_amt         NUMBER := 0;
"
"      v_status           VARCHAR2 (1);
"
"      var_pk_res         VARCHAR2 (1);
"
"      var_cast_res       VARCHAR (15);
"
"      var_mat_rnd        NUMBER;
"
"      v_rec_no           NUMBER;
"
"      var_upd_ser_flag   VARCHAR2 (1);
"
"      v_lot_ser_qty      NUMBER;
"
"      v_sos_lot_qty      NUMBER;
"
"      v_sos_batch_qty    NUMBER;
"
"      v_sos_bin_qty      NUMBER;
"
"      var_seq_no         VARCHAR2 (2000);
"
"      v_pk_cnt           NUMBER (15) := 0;
"
"      v_pack_hd          NUMBER (15) := 0;
"
"      v_pack_ln          NUMBER (15) := 0;
"
"      var_cut_len_flag   VARCHAR2 (1) := 'N';
"
"      v_res         VARCHAR2(30);
"
"      v_mi_doc_no         VARCHAR2(30);
"
"      v_desp_cnt    NUMBER;
"
"      v_shipfrm_loc_id    VARCHAR2(100);
"
"   BEGIN
"
"
"
"      OPEN c6;
"
"
"
"      FETCH c6 INTO cr6;
"
"
"
"      CLOSE c6;
"
"
"
"      OPEN c0;
"
"
"
"      FETCH c0 INTO cr0;
"
"
"
"      CLOSE c0;
"
"
"
"      proc_chk_cust_trans_hold (p_bu, cr6.sihd_cust_id);
"
"
"
"      IF cr0.somctrl_shipset_ln_stk_flag = 'N'
"
"      THEN
"
"         proc_gen_sto_mat_cons (p_bu,
"
"                                p_sihd_plant,
"
"                                p_sihd_doc_no,
"
"                                p_user);
"
"      END IF;
"
"
"
"      OPEN c2;
"
"
"
"      FETCH c2 INTO cr2;
"
"
"
"      IF c2%FOUND
"
"      THEN
"
"         raise_application_error (
"
"            -20999,
"
"            'Quantity on hand is low for the line.');-- || p_bu||'/'||p_sihd_plant||'/'||p_sihd_doc_no||'/'||cr2.siln_seq_no);
"
"      END IF;
"
"
"
"      CLOSE c2;
"
"
"
"      BEGIN
"
"         SELECT COUNT (*)
"
"           INTO v_wh_cnt
"
"           FROM sales_invoices_ln
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_sihd_plant
"
"                AND siln_doc_no = p_sihd_doc_no
"
"                AND siln_store_id IS NULL
"
"                AND siln_matl_type = 'P';
"
"      EXCEPTION
"
"         WHEN NO_DATA_FOUND
"
"         THEN
"
"            v_wh_cnt := 0;
"
"      END;
"
"
"
"      IF v_wh_cnt <> 0
"
"      THEN
"
"         raise_application_error (-20999, 'Warehouse must be entered.');
"
"      END IF;
"
"
"
"      UPDATE sales_invoices_ln
"
"         SET siln_gen_ls_flag = 'N'
"
"       WHERE     siln_bu = p_bu
"
"             AND siln_plnt = p_sihd_plant
"
"             AND siln_doc_no = p_sihd_doc_no;
"
"
"
"      IF var_cut_len_flag = 'N' AND cr6.sihd_deliverable_flag = 'N'
"
"      THEN
"
"         proc_ins_lot_serial (p_bu,
"
"                              p_sihd_plant,
"
"                              p_sihd_doc_no,
"
"                              p_user,
"
"                              var_gen_ls);
"
"      ELSE
"
"        var_gen_ls := 'Y';
"
"      END IF;
"
"
"
"      IF var_gen_ls = 'Y'
"
"      THEN
"
"         FOR cr1 IN c1
"
"         LOOP
"
"            SELECT SUM (sicb_trans_qty * sicb_unit_cost)
"
"              INTO var_tot_amt
"
"              FROM sales_inv_cost_batch
"
"             WHERE     sicb_bu = p_bu
"
"                   AND sicb_plnt = p_sihd_plant
"
"                   AND sicb_doc_no = p_sihd_doc_no
"
"                   AND sicb_seq_no = cr1.siln_seq_no;
"
"
"
"            SELECT SUM (sicb_trans_qty)
"
"              INTO var_tot_qty
"
"              FROM sales_inv_cost_batch
"
"             WHERE     sicb_bu = p_bu
"
"                   AND sicb_plnt = p_sihd_plant
"
"                   AND sicb_doc_no = p_sihd_doc_no
"
"                   AND sicb_seq_no = cr1.siln_seq_no;
"
"
"
"            UPDATE sales_invoices_ln
"
"               SET siln_unit_cost =
"
"                      NVL (NVL (var_tot_amt, 0) / cr1.siln_inv_qty, 0)
"
"             WHERE     siln_bu = p_bu
"
"                   AND siln_plnt = p_sihd_plant
"
"                   AND siln_doc_no = p_sihd_doc_no
"
"                   AND siln_seq_no = cr1.siln_seq_no;
"
"         END LOOP;
"
"      END IF;
"
"
"
"      --------------------------------Alloc LS Batch Process ENDS Here---------------------------------------------------------------------------------------
"
"
"
"      IF cr6.sihd_upd_chrg_flag = 'N'
"
"      THEN
"
"         proc_ins_si_oth_tax_chrgs (p_bu,
"
"                                    p_sihd_plant,
"
"                                    p_sihd_doc_no,
"
"                                    p_user);
"
"
"
"
"
"      END IF;
"
"
"
"
"
"      OPEN c3;
"
"
"
"      FETCH c3 INTO cr3;
"
"
"
"      FOR cr4 IN c4
"
"      LOOP
"
"         OPEN c5 (cr4.siln_seq_no,cr4.siln_prod_id, cr4.siln_prod_rev);
"
"         FETCH c5 INTO cr5;
"
"         CLOSE c5;
"
"
"
"      --   IF c5%FOUND THEN
"
"         IF cr4.inv_qty <> cr5.pack_itm  THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'Sum of invoice qty. mismatch with sum of packing qty.- '||cr4.siln_seq_no||'/'||cr4.inv_qty||'/'||cr5.pack_itm );
"
"         END IF;
"
"        -- END IF;
"
"      END LOOP;
"
"
"
"      CLOSE c3;
"
"
"
"
"
"      FOR r_ln
"
"         IN (SELECT *
"
"               FROM sales_invoices_ln, products
"
"              WHERE     siln_bu = prod_bu
"
"                    AND siln_prod_id = prod_id
"
"                    AND siln_prod_rev = prod_rev
"
"                    AND siln_bu = p_bu
"
"                    AND siln_plnt = p_sihd_plant
"
"                    AND siln_doc_no = p_sihd_doc_no
"
"                    AND siln_matl_type = 'P')
"
"      LOOP
"
"         BEGIN
"
"            SELECT COUNT (*)
"
"              INTO v_ship_set_cnt
"
"              FROM sales_inv_sto_dtls
"
"             WHERE     sisd_bu = p_bu
"
"                   AND sisd_plnt = r_ln.siln_plnt
"
"                   AND sisd_doc_no = r_ln.siln_doc_no
"
"                   AND sisd_seq_no = r_ln.siln_seq_no;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               v_ship_set_cnt := 0;
"
"         END;
"
"
"
"         IF v_ship_set_cnt > 0 AND r_ln.prod_var_opt <> 'PTO'
"
"         THEN
"
"            raise_application_error (-20999,
"
"                                     'Shipset BOM type not configured');
"
"         END IF;
"
"      END LOOP;
"
"
"
"      FOR cr8 IN c8
"
"      LOOP
"
"         IF cr8.prod_stocked = 'Y' AND cr6.sihd_status = 'N' THEN
"
"     BEGIN
"
"        SELECT bupld_loc_id
"
"          INTO v_shipfrm_loc_id
"
"          FROM bus_unit_plants_loc_dtls
"
"         WHERE bupld_bu  = p_bu
"
"           AND bupld_plnt = cr6.sihd_plant
"
"           AND bupld_loc_name = cr6.sihd_shipfrm_loc_name;
"
"     EXCEPTION WHEN OTHERS THEN
"
"       v_shipfrm_loc_id := NULL;
"
"     END;
"
"
"
"            OPEN c_str (cr6.sihd_plant,
"
"                        NVL(cr8.siln_desp_loc_name,v_shipfrm_loc_id),--sihd_plnt_loc_id,
"
"                        cr8.siln_store_id);
"
"
"
"            FETCH c_str INTO r_str;
"
"
"
"            IF c_str%NOTFOUND
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                     'Warehouse is not associated with unit location.'
"
"                  || '-'
"
"                  || cr6.sihd_plant
"
"                  || '-'
"
"                  || v_shipfrm_loc_id
"
"                  || '-'
"
"                  || cr8.siln_store_id);
"
"            END IF;
"
"
"
"            CLOSE c_str;
"
"         END IF;
"
"      END LOOP;
"
"
"
"      proc_upd_sales_invoice_amount (p_bu, p_sihd_plant, p_sihd_doc_no);
"
"
"
"      OPEN c6;
"
"
"
"      FETCH c6 INTO cr6;
"
"
"
"      CLOSE c6;
"
"
"
"
"
"      FOR r_ln
"
"         IN (SELECT *
"
"               FROM sales_invoices_ln, products, som_control
"
"              WHERE     siln_bu = prod_bu
"
"                    AND siln_prod_id = prod_id
"
"                    AND siln_prod_rev = prod_rev
"
"                    AND siln_bu = somctrl_bu
"
"                    AND ( (somctrl_shipset_ln_stk_flag = 'Y'
"
"                           AND prod_var_opt IN ('PTO'))
"
"                         OR prod_var_opt NOT IN ('PTO'))
"
"                    AND siln_bu = p_bu
"
"                    AND siln_plnt = p_sihd_plant
"
"                    AND siln_doc_no = p_sihd_doc_no)
"
"      LOOP
"
"         IF r_ln.prod_stocked = 'Y'
"
"         THEN
"
"            IF func_find_store_bin_flag (p_bu, r_ln.siln_store_id) = 'Y'
"
"            THEN
"
"               OPEN c_bd (r_ln.siln_seq_no);
"
"
"
"               FETCH c_bd INTO r_bd;
"
"
"
"               IF c_bd%NOTFOUND
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Bin details not found for line ' || r_ln.siln_seq_no);
"
"               ELSE
"
"                  IF r_ln.siln_stk_inv_qty <> r_bd.trans_qty
"
"                  THEN
"
"                     raise_application_error (
"
"                        -20999,
"
"                        'Bin details not found for line ' || r_ln.siln_seq_no);
"
"                  END IF;
"
"               END IF;
"
"
"
"               CLOSE c_bd;
"
"            END IF;
"
"         END IF;
"
"      END LOOP;
"
"
"
"      proc_chk_cust_credit_limit (
"
"         p_bu,
"
"         p_sihd_plant,
"
"         p_sihd_doc_no,
"
"         cr6.sihd_cust_id,
"
"         NVL (cr6.sihd_exc_inv_date, cr6.sihd_doc_date),
"
"         p_user,
"
"         var_cl_res,
"
"         cr6.sihd_currency);
"
"
"
"      IF cr0.somctrl_cr_limit_wf_req = 'N'
"
"      THEN
"
"         IF var_cl_res = 'Y'
"
"         THEN
"
"            raise_application_error (-20999, 'Credit Limit Exceeds');
"
"         END IF;
"
"      END IF;
"
"
"
"
"
"
"
"      FOR cr8 IN c8
"
"      LOOP
"
"         IF cr8.prod_var_opt = 'PTO'
"
"         THEN
"
"            SELECT COUNT (*)
"
"              INTO v_pto_count
"
"              FROM sales_inv_sto_dtls
"
"             WHERE     sisd_bu = p_bu
"
"                   AND sisd_plnt = cr8.siln_plnt
"
"                   AND sisd_doc_no = cr8.siln_doc_no
"
"                   AND sisd_seq_no = cr8.siln_seq_no;
"
"
"
"            IF v_pto_count = 0
"
"            THEN
"
"               OPEN c_ps (cr8.siln_prod_id, cr8.siln_prod_rev);
"
"
"
"               FETCH c_ps INTO r_ps;
"
"
"
"               IF c_ps%NOTFOUND
"
"               THEN
"
"                  raise_application_error (-20999, 'Shipset does not exists');
"
"               END IF;
"
"
"
"               CLOSE c_ps;
"
"            END IF;
"
"         END IF;
"
"      END LOOP;
"
"
"
"
"
"
"
"      proc_ins_sales_exceptions (p_bu,
"
"                                 p_sihd_doc_no,
"
"                                 p_sihd_plant,
"
"                                 p_user);
"
"
"
"      OPEN c_exp;
"
"
"
"      FETCH c_exp INTO r_exp;
"
"
"
"      IF c_exp%FOUND
"
"      THEN
"
"         raise_application_error (-20999, 'Refer Exceptions.');
"
"      ELSE
"
"         IF cr6.sihd_currency <> func_find_base_currency (p_bu)
"
"         THEN
"
"            rnd := func_find_currency_dec1 (p_bu, cr6.sihd_currency);
"
"         ELSE
"
"            rnd := func_find_contr_rnddigit (p_bu, cr6.sihd_cust_id);
"
"         END IF;
"
"
"
"         var_mat_rnd := func_find_currency_dec1 (p_bu, cr6.sihd_currency);
"
"
"
"         FOR cr8 IN c8
"
"         LOOP
"
"            IF cr8.siln_matl_type <> 'T' AND cr8.prod_stocked = 'Y'
"
"               AND ( (cr0.somctrl_shipset_ln_stk_flag = 'Y'
"
"                      AND cr8.prod_var_opt IN ('PTO'))
"
"                    OR cr8.prod_var_opt NOT IN ('PTO'))
"
"            THEN
"
"               IF cr8.prod_ser_lot_opt IN ('S', 'O', 'L', 'B')
"
"               THEN
"
"                  SELECT COUNT (*)
"
"                    INTO v_lot_ser_qty
"
"                    FROM sales_inv_serial_lot_no
"
"                   WHERE     sisln_bu = p_bu
"
"                         AND sisln_plnt = p_sihd_plant
"
"                         AND sisln_doc_no = p_sihd_doc_no
"
"                         AND sisln_seq_no = cr8.siln_seq_no;
"
"
"
"                  IF NVL (v_lot_ser_qty, 0) = 0
"
"                  THEN
"
"                     raise_application_error (
"
"                        -20999,
"
"                        'Lot/Serial Detail must be entered.');
"
"                  END IF;
"
"
"
"                  FOR r_ls IN c_ls (cr8.siln_seq_no)
"
"                  LOOP
"
"                     IF ROUND (
"
"                           NVL ( (cr8.siln_inv_qty / cr8.siln_conv_factor),
"
"                                0),
"
"                           3) <> NVL (r_ls.lot_ser_qty, 0)
"
"                     THEN
"
"                        raise_application_error (
"
"                           -20999,
"
"                           'Lot/Serial Qty must match with the Invoice Qty');
"
"                     END IF;
"
"                  END LOOP;
"
"               END IF;
"
"
"
"               IF cr8.prod_cost_method IN ('FIFO', 'LIFO')
"
"               THEN
"
"                  SELECT NVL (SUM (sicb_trans_qty), 0)
"
"                    INTO v_lot_ser_qty
"
"                    FROM sales_inv_cost_batch
"
"                   WHERE     sicb_bu = p_bu
"
"                         AND sicb_plnt = p_sihd_plant
"
"                         AND sicb_doc_no = p_sihd_doc_no
"
"                         AND sicb_seq_no = cr8.siln_seq_no;
"
"
"
"                  IF v_lot_ser_qty <> ROUND ( (cr8.siln_stk_inv_qty), 3)
"
"                     AND cr8.siln_sf_code IS NULL
"
"                  THEN
"
"                     raise_application_error (
"
"                        -20999,
"
"                           'Batch details not generated for the line.'
"
"                        || '-'
"
"                        || cr8.siln_seq_no);
"
"                  END IF;
"
"               END IF;
"
"            END IF;
"
"         END LOOP;
"
"
"
"         OPEN cb1;
"
"
"
"         FETCH cb1 INTO crb1;
"
"
"
"         IF crb1.somctrl_allow_bol_falg = 'Y'
"
"         THEN
"
"            SELECT COUNT (*)
"
"              INTO v_bill
"
"              FROM sales_inv_bill_of_lading
"
"             WHERE     sibol_bu = p_bu
"
"                   AND sibol_plnt = p_sihd_plant
"
"                   AND sibol_doc_no = p_sihd_doc_no;
"
"
"
"            IF v_bill = 0
"
"            THEN
"
"               raise_application_error (-20999,
"
"                                        'Bill of Lading does not exist.');
"
"            END IF;
"
"         END IF;
"
"
"
"         CLOSE cb1;
"
"
"
"         OPEN c6;
"
"
"
"         FETCH c6 INTO cr6;
"
"
"
"         CLOSE c6;
"
"
"
"         SELECT COUNT (*), NVL (SUM (sipd_due_amt), 0)
"
"           INTO var_cnt_disc, var_sum_dueamt
"
"           FROM sales_invoices_pay_due
"
"          WHERE     sipd_bu = p_bu
"
"                AND sipd_plnt = p_sihd_plant
"
"                AND sipd_doc_no = p_sihd_doc_no
"
"                AND sipd_due_type = 'TD';
"
"
"
"         /*  Calculating the sum of due percentage and sum of due amount from sales_invoices_pay_due for current document values
"
"             and due type like Invoice Due  */
"
"         SELECT NVL (SUM (sipd_due_amt), 0)
"
"           INTO var_isum_dueamt
"
"           FROM sales_invoices_pay_due
"
"          WHERE     sipd_bu = p_bu
"
"                AND sipd_plnt = p_sihd_plant
"
"                AND sipd_doc_no = p_sihd_doc_no
"
"                AND sipd_due_type = 'ID';
"
"
"
"         /*  Calculating the sum of due percentage and sum of due amount from sales_invoices_pay_due for current document values
"
"                 and due type like Discount Due  */
"
"         SELECT NVL (SUM (sipd_due_amt), 0)
"
"           INTO var_dsum_dueamt
"
"           FROM sales_invoices_pay_due
"
"          WHERE     sipd_bu = p_bu
"
"                AND sipd_plnt = p_sihd_plant
"
"                AND sipd_doc_no = p_sihd_doc_no
"
"                AND sipd_due_type = 'DD';
"
"
"
"           SELECT ROUND (
"
"                           (NVL (
"
"                               SUM (
"
"                                  CASE
"
"                                     WHEN sihd_sal_ret_type = 'CM'
"
"                                     THEN
"
"                                        NVL (
"
"                                           SUM (
"
"                                              (CASE
"
"                                                  WHEN siln_cr_dr = 'DR' THEN 1
"
"                                                  ELSE -1
"
"                                               END)
"
"                                              * ( ( CASE WHEN siln_reverse_tax_flag = 'Y' THEN ( (ROUND ((siln_inv_qty * siln_price),3) - (  siln_disc_amt + siln_spl_disc_amt + siln_cash_disc_amt)) - (CASE WHEN siln_cust_tax_charge_flag = 'Y' THEN (siln_igst_amt + siln_sgst_amt + siln_cgst_amt + siln_utgst_amt + siln_cess_amt) ELSE 0 END))
"
"                                                    ELSE (ROUND (
"
"                                                        (siln_inv_qty
"
"                                                         * siln_price),3)
"
"                                                     - (  siln_disc_amt
"
"                                                        + siln_spl_disc_amt
"
"                                                        + siln_cash_disc_amt)) END
"
"                                                        ))),
"
"                                           0)
"
"                                     ELSE
"
"                                        NVL (
"
"                                           SUM (
"
"                                              (CASE
"
"                                                  WHEN siln_cr_dr = 'CR' THEN 1
"
"                                                  ELSE -1
"
"                                               END)
"
"                                              * ( ( CASE WHEN siln_reverse_tax_flag = 'Y' THEN ( (ROUND ((siln_inv_qty * siln_price),3) - (  siln_disc_amt + siln_spl_disc_amt + siln_cash_disc_amt)) - (CASE WHEN siln_cust_tax_charge_flag = 'Y' THEN (siln_igst_amt + siln_sgst_amt + siln_cgst_amt + siln_utgst_amt + siln_cess_amt) ELSE 0 END))
"
"                                              ELSE (ROUND (
"
"                                                        (siln_inv_qty
"
"                                                         * siln_price),
"
"                                                        3)
"
"                                                     - (  siln_disc_amt
"
"                                                        + siln_spl_disc_amt
"
"                                                        + siln_cash_disc_amt)) END
"
"                                                        ))),
"
"                                           0)
"
"                                  END),
"
"                               0)),
"
"                           2)
"
"             INTO v_mat_amount
"
"             FROM sales_invoices_hd, sales_invoices_ln
"
"            WHERE     sihd_bu = siln_bu
"
"                  AND sihd_plant = siln_plnt
"
"                  AND sihd_doc_no = siln_doc_no
"
"                  AND siln_bu = p_bu
"
"                  AND siln_plnt = p_sihd_plant
"
"                  AND siln_doc_no = p_sihd_doc_no
"
"                  AND siln_matl_type NOT IN ('O')
"
"                  AND (sihd_type = 'IF'
"
"                       OR (sihd_type <> 'IF'
"
"                           AND siln_promotion_flag IN ('T', 'N')))
"
"         GROUP BY sihd_sal_ret_type;
"
"
"
"         IF NVL (v_mat_amount, 0) <> NVL (cr6.sihd_net_amt, 0)
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"                  'Material amount mismatch with Total Material amount.'
"
"               || '/'
"
"               || NVL (v_mat_amount, 0)
"
"               || '/'
"
"               || NVL (cr6.sihd_net_amt, 0));
"
"         END IF;
"
"
"
"         SELECT (NVL ( (SUM (ROUND ( ( (siln_inv_qty) * siln_price), 3))), 0)
"
"                 - NVL (
"
"                      (SUM (
"
"                          ROUND (
"
"                             (  (siln_inv_qty)
"
"                              * siln_price
"
"                              * siln_disc_pct
"
"                              / 100),
"
"                             3))),
"
"                      0))
"
"           INTO v_ln_amount
"
"           FROM sales_invoices_ln
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_sihd_plant
"
"                AND siln_doc_no = p_sihd_doc_no
"
"                AND siln_promotion_flag IN ('N', 'T');
"
"
"
"           SELECT NVL (
"
"                     SUM (
"
"                        CASE
"
"                           WHEN sihd_sal_ret_type = 'CM'
"
"                           THEN
"
"                              NVL (
"
"                                 SUM (
"
"                                    (CASE
"
"                                        WHEN siln_cr_dr = 'DR' THEN 1
"
"                                        ELSE -1
"
"                                     END)
"
"                                    * (  siln_igst_amt
"
"                                       + siln_sgst_amt
"
"                                       + siln_cgst_amt
"
"                                       + siln_utgst_amt
"
"                                       + siln_cess_amt)),
"
"                                 0)
"
"                           ELSE
"
"                              NVL (
"
"                                 SUM (
"
"                                    (CASE
"
"                                        WHEN siln_cr_dr = 'CR' THEN 1
"
"                                        ELSE -1
"
"                                     END)
"
"                                    * (  siln_igst_amt
"
"                                       + siln_sgst_amt
"
"                                       + siln_cgst_amt
"
"                                       + siln_utgst_amt
"
"                                       + siln_cess_amt)),
"
"                                 0)
"
"                        END),
"
"                     0)
"
"             INTO v_tax_amt
"
"             FROM sales_invoices_hd, sales_invoices_ln
"
"            WHERE     sihd_bu = siln_bu
"
"                  AND sihd_plant = siln_plnt
"
"                  AND sihd_doc_no = siln_doc_no
"
"                  AND siln_bu = p_bu
"
"                  AND siln_plnt = p_sihd_plant
"
"                  AND siln_doc_no = p_sihd_doc_no
"
"                  AND siln_cust_tax_charge_flag = 'Y'
"
"                  AND (sihd_type = 'IF'
"
"                       OR (sihd_type <> 'IF'
"
"                           AND siln_promotion_flag IN ('T', 'N', 'Y')))
"
"         GROUP BY sihd_sal_ret_type;
"
"
"
"
"
"         IF (NVL (v_tax_amt, 0)) <> NVL (cr6.sihd_tax_amt,0)
"
"         THEN            --raise_application_error(-20999,v_tax_amt||'/'||v_dtax_amt||'/'||cr6.sihd_tax_amt);
"
"            raise_application_error(
"
"               -20999,
"
"               'Tax amount mismatch with Total Tax amount.');
"
"         END IF;
"
"
"
"         IF ROUND (cr6.sihd_tot_amt, 2) <> var_sum_dueamt
"
"         THEN
"
"            raise_application_error(
"
"               -20999,
"
"               'Due amount mismatch with document amount.'||'~'||ROUND (cr6.sihd_tot_amt, 2)||'~'||var_sum_dueamt);
"
"         END IF;
"
"
"
"         IF cr6.sihd_type IN ('TP')
"
"         THEN
"
"            OPEN c10;
"
"
"
"            FETCH c10 INTO cr10;
"
"
"
"            IF cr10.siln_rcvd_store_id IS NULL
"
"            THEN
"
"               raise_application_error (-20999,
"
"                                        'Receipt Warehouse must be entered.');
"
"            END IF;
"
"
"
"            CLOSE c10;
"
"         END IF;
"
"      END IF;
"
"
"
"
"
"      SELECT COUNT (*)
"
"        INTO v_tpn
"
"        FROM sales_inv_pack_list_dtls
"
"       WHERE     sipld_bu = p_bu
"
"             AND sipld_plnt = p_sihd_plant
"
"             AND sipld_doc_no = p_sihd_doc_no;
"
"
"
"      SELECT COUNT (1)
"
"        INTO v_ser
"
"        FROM (  SELECT DISTINCT sisln_serial_no, COUNT (*)
"
"                  FROM sales_inv_serial_lot_no
"
"                 WHERE     sisln_bu = p_bu
"
"                       AND sisln_plnt = p_sihd_plant
"
"                       AND sisln_doc_no = p_sihd_doc_no
"
"                       AND sisln_serial_no IS NOT NULL
"
"              GROUP BY sisln_sys_ls_no, sisln_serial_no, sisln_seq_no
"
"                HAVING COUNT (*) > 1);
"
"
"
"      IF v_ser <> 0
"
"      THEN
"
"         raise_application_error (-20999, 'Serial No. already allocated');
"
"      END IF;
"
"
"
"      SELECT COUNT (*)
"
"        INTO v_sto_cnt
"
"        FROM sales_inv_sto_dtls
"
"       WHERE     sisd_bu = p_bu
"
"             AND sisd_plnt = p_sihd_plant
"
"             AND sisd_doc_no = p_sihd_doc_no;
"
"
"
"      IF v_sto_cnt = 0
"
"      THEN
"
"         proc_gen_sto_mat_cons (p_bu,
"
"                                p_sihd_plant,
"
"                                p_sihd_doc_no,
"
"                                p_user);
"
"      END IF;
"
"
"
"   /*  BEGIN
"
"
"
"       SELECT COUNT(*)
"
"         INTO v_desp_cnt
"
"         FROM sales_invoices_ln
"
"        WHERE siln_bu = p_bu
"
"          AND siln_plnt = p_sihd_plant
"
"          AND siln_doc_no = p_sihd_doc_no
"
"          AND siln_matl_type = 'P'
"
"          AND siln_qc_no IS NULL;
"
"     EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       v_desp_cnt := 0;
"
"     END;*/
"
"   /*  IF cr0.somctrl_pre_desp_rqrd = 'Y' AND cr6.sihd_type = 'SIG' AND cr6.sihd_status IN ('N') AND v_desp_cnt > 0 THEN
"
"
"
"      proc_ins_qc_frm_pre_disp (p_bu,
"
"                                p_sihd_plant,
"
"                                p_sihd_doc_no,
"
"                                p_user,
"
"                                1,
"
"                                v_res
"
"                               );
"
"
"
"     proc_cre_miv_frm_si_predisp (p_bu,
"
"                                  p_sihd_plant,
"
"                                  p_sihd_doc_no,
"
"                                  p_user,
"
"                                  1,
"
"                                  v_mi_doc_no);
"
"
"
"       IF v_res IS NOT NULL AND v_mi_doc_no IS NOT NULL THEN
"
"
"
"       UPDATE sales_inv_serial_lot_no
"
"          SET sisln_source_flag = 'M'
"
"        WHERE sisln_bu = p_bu
"
"          AND sisln_plnt = p_sihd_plant
"
"          AND sisln_doc_no = p_sihd_doc_no;
"
"
"
"       END IF;
"
"     ELSE*/
"
"      proc_sales_inv_pick (p_bu,
"
"                           p_sihd_plant,
"
"                           p_sihd_doc_no,
"
"                           'P',
"
"                           p_user,
"
"                           var_pk_res);
"
"
"
"
"
"    -- END IF;
"
"
"
"      CLOSE c_exp;
"
"   END proc_si_pick_det_web;
"
"
"
"   PROCEDURE proc_si_cre_inv_web (p_bu             VARCHAR2,
"
"                                  p_sihd_plant     VARCHAR2,
"
"                                  p_sihd_doc_no    VARCHAR2,
"
"                                  p_user           VARCHAR2)
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"         SELECT somctrl_comm_exc_fin_flag,somctrl_cr_limit_wf_req,somctrl_inv_tent_hrs
"
"           FROM som_control
"
"          WHERE somctrl_bu = p_bu;
"
"
"
"
"
"      CURSOR c4
"
"      IS
"
"         SELECT *
"
"           FROM sales_inv_ship_addr, business_units
"
"          WHERE     sisa_bu = bu_id
"
"                AND sisa_bu = p_bu
"
"                AND sisa_plnt = p_sihd_plant
"
"                AND sisa_doc_no = p_sihd_doc_no
"
"                AND (sisa_shipto_postal_code IS NULL
"
"                     OR sisa_billto_postal_code IS NULL);
"
"
"
"      CURSOR c6
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_hd
"
"          WHERE     sihd_bu = p_bu
"
"                AND sihd_plant = p_sihd_plant
"
"                AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"      cr1                c1%ROWTYPE;
"
"      cr4                c4%ROWTYPE;
"
"      cr6                c6%ROWTYPE;
"
"
"
"      var_stk_item_cnt   NUMBER;
"
"      var_res            VARCHAR2 (1);
"
"      var_inv_date       DATE;
"
"      var_inv_pfx        VARCHAR2 (10);
"
"      var_inv_no         VARCHAR2 (20);
"
"      var_tent_hrs       NUMBER;
"
"      var_tent_date      DATE;
"
"
"
"   BEGIN
"
"      OPEN c6;
"
"
"
"      FETCH c6 INTO cr6;
"
"
"
"      CLOSE c6;
"
"
"
"      OPEN c1;
"
"
"
"      FETCH c1 INTO cr1;
"
"
"
"      CLOSE c1;
"
"
"
"      proc_chk_cust_trans_hold (p_bu, cr6.sihd_cust_id);
"
"
"
"
"
"      OPEN c4;
"
"
"
"      FETCH c4 INTO cr4;
"
"
"
"      IF     c4%FOUND
"
"         AND cr4.bu_country = cr4.sisa_billto_cntry
"
"         AND cr6.sihd_gst_reg_type = 'R'
"
"      THEN
"
"         raise_application_error (
"
"            -20999,
"
"            'Ship or Bill address PINCODE should not be null.');
"
"      END IF;
"
"
"
"      CLOSE c4;
"
"
"
"      IF cr6.sihd_type NOT IN
"
"            ('RD', 'RL', 'RS', 'SR', 'SG', 'LR', 'SN', 'RY', 'RH', 'RU')
"
"      THEN
"
"         BEGIN
"
"            SELECT COUNT (*)
"
"              INTO var_stk_item_cnt
"
"              FROM sales_invoices_ln, products
"
"             WHERE     siln_bu = prod_bu
"
"                   AND siln_prod_id = prod_id
"
"                   AND siln_prod_rev = prod_rev
"
"                   AND prod_stocked = 'Y'
"
"                   AND siln_w_wo_stk_flag = 'Y'
"
"                   AND siln_bu = p_bu
"
"                   AND siln_plnt = p_sihd_plant
"
"                   AND siln_doc_no = p_sihd_doc_no
"
"                   AND cr6.sihd_comm_tax_inv_flag = 'E';
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               var_stk_item_cnt := 0;
"
"         END;
"
"
"
"         IF cr6.sihd_type IN
"
"               ('SIG',
"
"                'SIDE',
"
"                'SIFS',
"
"                'SIFR',
"
"                'LO',
"
"                'LI',
"
"                'RB',
"
"                'TP',
"
"                'SIT',
"
"                'NS',
"
"                'NO',
"
"                'SE',
"
"                'IR',
"
"                'JWIG')
"
"            AND cr6.sihd_status = 'N'
"
"            AND var_stk_item_cnt > 0
"
"         THEN
"
"            raise_application_error (-20999, 'Quantity should be picked.');
"
"         END IF;
"
"
"
"         proc_upd_sales_invoice_amount (p_bu, p_sihd_plant, p_sihd_doc_no);
"
"
"
"
"
"         proc_chk_cust_credit_limit (
"
"            p_bu,
"
"            p_sihd_plant,
"
"            p_sihd_doc_no,
"
"            cr6.sihd_cust_id,
"
"            NVL (cr6.sihd_exc_inv_date, cr6.sihd_doc_date),
"
"            p_user,
"
"            var_res);
"
"
"
"         IF cr1.somctrl_cr_limit_wf_req = 'N'
"
"         THEN
"
"            IF var_res = 'Y'
"
"            THEN
"
"               raise_application_error (-20999, 'Credit Limit Exceeds');
"
"            END IF;
"
"         END IF;
"
"
"
"         IF func_find_comm_inv_type (p_bu) = 'A'
"
"            AND (cr6.sihd_currency <> func_find_base_currency (p_bu))
"
"         THEN
"
"            IF cr6.sihd_comm_inv_pfx IS NULL
"
"            THEN
"
"               raise_application_error (-20999,
"
"                                        'Commercial prefix must be entered.');
"
"            END IF;
"
"         ELSE
"
"            IF cr1.somctrl_comm_exc_fin_flag = 'C'
"
"               AND cr6.sihd_currency <> func_find_base_currency (p_bu)
"
"            THEN
"
"               IF cr6.sihd_comm_inv_pfx IS NULL
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Commercial Invoice Prefix must be entered.');
"
"               ELSE
"
"                  var_inv_pfx := cr6.sihd_comm_inv_pfx;
"
"               END IF;
"
"
"
"               IF cr6.sihd_comm_inv_date IS NULL
"
"               THEN
"
"                  var_inv_date := SYSDATE;
"
"               ELSE
"
"                  var_inv_date := cr6.sihd_comm_inv_date;
"
"               END IF;
"
"
"
"               IF cr6.sihd_comm_inv_no IS NULL
"
"               THEN
"
"                  var_inv_no :=
"
"                     func_find_pfx_nextno (p_bu,
"
"                                           var_inv_date,
"
"                                           var_inv_pfx,
"
"                                           p_user);
"
"               ELSE
"
"                  var_inv_no := cr6.sihd_comm_inv_no;
"
"               END IF;
"
"            ELSE
"
"               IF cr6.sihd_exc_inv_pfx IS NULL
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Invoice Prefix must be entered.');
"
"               ELSE
"
"                  var_inv_pfx := cr6.sihd_exc_inv_pfx;
"
"               END IF;
"
"
"
"      DECLARE
"
"                  CURSOR c_inv IS
"
"                      SELECT *
"
"                        FROM sales_invoices_hd
"
"                       WHERE sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_exc_inv_pfx = cr6.sihd_exc_inv_pfx
"
"                         AND sihd_exc_inv_no = cr6.sihd_exc_inv_no
"
"                         AND sihd_doc_no <> cr6.sihd_doc_no
"
"                         AND sihd_status NOT IN ('C');
"
"
"
"                cr_inv        c_inv%ROWTYPE;
"
"                var_count    NUMBER;
"
"              BEGIN
"
"                  OPEN c_inv;
"
"                  FETCH c_inv INTO cr_inv;
"
"                    IF c_inv%FOUND THEN
"
"                        Raise_Application_Error (
"
"                  -20999,'Invoice No. Already exists.');
"
"                    END IF;
"
"                  CLOSE c_inv;
"
"              END;
"
"
"
"      IF cr6.sihd_exc_inv_date IS NULL
"
"               THEN
"
"                  var_tent_hrs := NVL (cr1.somctrl_inv_tent_hrs, 0);
"
"
"
"                  SELECT SYSDATE - var_tent_hrs / 24
"
"                    INTO var_tent_date
"
"                    FROM DUAL;
"
"
"
"                  var_inv_date := var_tent_date;
"
"               ELSE
"
"                  var_inv_date := cr6.sihd_exc_inv_date;
"
"               END IF;
"
"
"
"
"
"               IF cr6.sihd_exc_inv_no IS NULL
"
"               THEN
"
"                  var_inv_no :=
"
"                     func_find_pfx_nextno (p_bu,
"
"                                           var_inv_date,
"
"                                           var_inv_pfx,
"
"                                           p_user);
"
"
"
"               ELSE
"
"                  var_inv_no := cr6.sihd_exc_inv_no;
"
"               END IF;
"
"            END IF;
"
"         END IF;
"
"
"
"         IF cr1.somctrl_comm_exc_fin_flag IN ('A', 'C')
"
"            AND cr6.sihd_currency <> func_find_base_currency (p_bu)
"
"         THEN
"
"            UPDATE sales_invoices_hd
"
"               SET sihd_exc_inv_pfx = var_inv_pfx,
"
"                   sihd_exc_inv_no = var_inv_no,
"
"                   sihd_exc_inv_date = var_inv_date,
"
"                   sihd_inv_pfx = var_inv_pfx,
"
"                   sihd_inv_no = var_inv_no,
"
"                   sihd_inv_date = var_inv_date,
"
"                   sihd_year = func_find_year (p_bu, var_inv_date),
"
"                   sihd_period = func_find_period (p_bu, var_inv_date),
"
"                   sihd_rem_date =
"
"                      CASE
"
"                         WHEN sihd_rem_date IS NULL THEN SYSDATE + (0.5 / 24)
"
"                         ELSE sihd_rem_date
"
"                      END
"
"             WHERE     sihd_bu = p_bu
"
"                   AND sihd_plant = p_sihd_plant
"
"                   AND sihd_doc_no = p_sihd_doc_no;
"
"         ELSIF ( (cr1.somctrl_comm_exc_fin_flag = 'E')
"
"                OR (cr1.somctrl_comm_exc_fin_flag IN ('A', 'C')
"
"                    AND cr6.sihd_currency = func_find_base_currency (p_bu)))
"
"         THEN
"
"            UPDATE sales_invoices_hd
"
"               SET sihd_exc_inv_pfx = var_inv_pfx,
"
"                   sihd_exc_inv_no = var_inv_no,
"
"                   sihd_exc_inv_date = var_inv_date,
"
"                   sihd_inv_pfx = var_inv_pfx,
"
"                   sihd_inv_no = var_inv_no,
"
"                   sihd_inv_date = var_inv_date,
"
"                   sihd_year = func_find_year (p_bu, var_inv_date),
"
"                   sihd_period = func_find_period (p_bu, var_inv_date),
"
"                   sihd_rem_date =
"
"                      CASE
"
"                         WHEN sihd_rem_date IS NULL THEN SYSDATE + (0.5 / 24)
"
"                         ELSE sihd_rem_date
"
"                      END
"
"             WHERE     sihd_bu = p_bu
"
"                   AND sihd_plant = p_sihd_plant
"
"                   AND sihd_doc_no = p_sihd_doc_no;
"
"         END IF;
"
"
"
"         FOR r_ln
"
"            IN (SELECT *
"
"                  FROM sales_invoices_ln
"
"                 WHERE     siln_bu = p_bu
"
"                       AND siln_plnt = p_sihd_plant
"
"                       AND siln_doc_no = p_sihd_doc_no
"
"                       AND siln_ret_freq IN ('D', 'M', 'Y'))
"
"         LOOP
"
"            IF r_ln.siln_ret_freq = 'Y'
"
"            THEN
"
"               UPDATE sales_invoices_ln
"
"                  SET siln_ret_by_date =
"
"                         ADD_MONTHS ( (var_inv_date), r_ln.siln_ret_dur * 12)
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no
"
"                      AND siln_seq_no = r_ln.siln_seq_no;
"
"            ELSIF r_ln.siln_ret_freq = 'M'
"
"            THEN
"
"               UPDATE sales_invoices_ln
"
"                  SET siln_ret_by_date =
"
"                         ADD_MONTHS ( (var_inv_date), r_ln.siln_ret_dur)
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no
"
"                      AND siln_seq_no = r_ln.siln_seq_no;
"
"            ELSIF r_ln.siln_ret_freq = 'D'
"
"            THEN
"
"               UPDATE sales_invoices_ln
"
"                  SET siln_ret_by_date = var_inv_date + r_ln.siln_ret_dur
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no
"
"                      AND siln_seq_no = r_ln.siln_seq_no;
"
"            END IF;
"
"         END LOOP;
"
"      ELSIF cr6.sihd_type IN
"
"               ('RD', 'RL', 'RS', 'SR', 'SG', 'LR', 'SN', 'RY', 'RH', 'RU')
"
"      THEN
"
"         IF cr6.sihd_inv_pfx IS NULL
"
"         THEN
"
"            raise_application_error (-20999,
"
"                                     'Invoice Prefix must be entered.');
"
"         ELSE
"
"            var_inv_pfx := cr6.sihd_inv_pfx;
"
"         END IF;
"
"
"
"         IF cr6.sihd_inv_date IS NULL
"
"         THEN
"
"            var_inv_date := SYSDATE;
"
"         END IF;
"
"
"
"         IF cr6.sihd_inv_no IS NULL
"
"         THEN
"
"            var_inv_no :=
"
"               func_find_pfx_nextno (p_bu,
"
"                                     var_inv_date,
"
"                                     var_inv_pfx,
"
"                                     p_user);
"
"         ELSE
"
"            var_inv_no := cr6.sihd_inv_no;
"
"         END IF;
"
"
"
"         UPDATE sales_invoices_hd
"
"            SET sihd_inv_pfx =
"
"                   CASE
"
"                      WHEN sihd_inv_pfx IS NULL THEN var_inv_pfx
"
"                      ELSE sihd_inv_pfx
"
"                   END,
"
"                sihd_inv_no = var_inv_no,
"
"                sihd_inv_date =  NVL(var_inv_date,sihd_inv_date),
"
"                sihd_year = func_find_year (p_bu, NVL(var_inv_date,sihd_inv_date)),
"
"                sihd_period = func_find_period (p_bu, NVL(var_inv_date,sihd_inv_date)),
"
"                sihd_rem_date =
"
"                   CASE
"
"                      WHEN sihd_rem_date IS NULL THEN SYSDATE + (0.5 / 24)
"
"                      ELSE sihd_rem_date
"
"                   END
"
"          WHERE     sihd_bu = p_bu
"
"                AND sihd_plant = p_sihd_plant
"
"                AND sihd_doc_no = p_sihd_doc_no;
"
"      END IF;
"
"   END proc_si_cre_inv_web;
"
"
"
"   PROCEDURE proc_si_journal_web (p_bu                      VARCHAR2,
"
"                                  p_sihd_cust_id            VARCHAR2,
"
"                                  p_sihd_jrnl_flag   IN OUT VARCHAR2,
"
"                                  p_sihd_plant              VARCHAR2,
"
"                                  p_sihd_doc_no             VARCHAR2,
"
"                                  p_user                    VARCHAR2,
"
"                                  p_lang                    NUMBER)
"
"   IS
"
"      --begin
"
"
"
"      CURSOR c6
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_hd
"
"          WHERE     sihd_bu = p_bu
"
"                AND sihd_plant = p_sihd_plant
"
"                AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"
"
"      cr6   c6%ROWTYPE;
"
"   BEGIN
"
"      OPEN c6;
"
"
"
"      FETCH c6 INTO cr6;
"
"
"
"      ---------------------------proc_alloc_lot_serial -------------------------------
"
"
"
"      IF p_sihd_jrnl_flag = 'Y'
"
"      THEN
"
"
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT COUNT (1) v_chrg_cnt
"
"                 FROM si_oth_tax_charges
"
"                WHERE     siotc_bu = p_bu
"
"                      AND siotc_plnt = p_sihd_plant
"
"                      AND siotc_doc_no = p_sihd_doc_no;
"
"
"
"            cr1           c1%ROWTYPE;
"
"            p_chrg_type   VARCHAR2 (1);
"
"         BEGIN
"
"            SELECT sihd_upd_chrg_flag
"
"              INTO p_chrg_type
"
"              FROM sales_invoices_hd
"
"             WHERE     sihd_bu = p_bu
"
"                   AND sihd_plant = p_sihd_plant
"
"                   AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"          IF p_chrg_type = 'N' THEN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            CLOSE c1;
"
"
"
"            IF cr1.v_chrg_cnt > 0
"
"            THEN
"
"               proc_ins_si_oth_tax_chrgs (p_bu,
"
"                                          p_sihd_plant,
"
"                                          p_sihd_doc_no,
"
"                                          p_user);
"
"               COMMIT;
"
"
"
"
"
"            ELSE
"
"               DELETE FROM sales_invoices_ln
"
"                     WHERE     siln_bu = p_bu
"
"                           AND siln_plnt = p_sihd_plant
"
"                           AND siln_doc_no = p_sihd_doc_no
"
"                           AND siln_matl_type = 'T';
"
"
"
"               COMMIT;
"
"
"
"               UPDATE sales_invoices_hd
"
"                  SET sihd_upd_chrg_flag = 'N'
"
"                WHERE     sihd_bu = p_bu
"
"                      AND sihd_plant = p_sihd_plant
"
"                      AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"               COMMIT;
"
"            --:sales_invoices_hd.chrg_flag := 'N';
"
"            END IF;
"
"            END IF;
"
"         END;
"
"
"
"         IF cr6.sihd_status = 'N' AND cr6.sihd_comm_tax_inv_flag = 'E'
"
"         THEN
"
"            proc_chk_cust_trans_hold (p_bu, p_sihd_cust_id);
"
"
"
"            DECLARE
"
"               CURSOR c1
"
"               IS
"
"                  SELECT *
"
"                    FROM sales_invoices_ln, products
"
"                   WHERE     siln_bu = p_bu
"
"                         AND siln_plnt = p_sihd_plant
"
"                         AND siln_doc_no = p_sihd_doc_no
"
"                         AND siln_bu = prod_bu
"
"                         AND siln_prod_id = prod_id
"
"                         AND siln_prod_rev = prod_rev
"
"                         AND prod_status = 'A'
"
"                         AND prod_cost_method IN ('FIFO', 'LIFO');
"
"
"
"               CURSOR c2
"
"               IS
"
"                  SELECT *
"
"                    FROM (SELECT siln_seq_no,
"
"                                 siln_store_id,
"
"                                 siln_prod_id,
"
"                                 siln_prod_rev,
"
"                                 siln_so_no,
"
"                                 siln_so_seq_no,
"
"                                 siln_inv_qty,
"
"                                 NVL ( (sqoh_so_qty - sqoh_so_alloc_qty), 0)
"
"                                    so_qty
"
"                            FROM sales_invoices_ln,
"
"                                 products,
"
"                                 so_qty_on_hand,
"
"                                 icm_control
"
"                           WHERE     siln_bu = p_bu
"
"                                 AND siln_plnt = p_sihd_plant
"
"                                 AND siln_doc_no = p_sihd_doc_no
"
"                                 AND siln_promotion_flag IN ('N', 'T')
"
"                                 AND siln_bu = prod_bu
"
"                                 AND siln_prod_id = prod_id
"
"                                 AND siln_prod_rev = prod_rev
"
"                                 AND prod_status = 'A'
"
"                                 AND siln_bu = icmctrl_bu
"
"                                 AND siln_so_no IS NOT NULL
"
"                                 AND siln_prod_indicator_flag = 'Y'
"
"                                 AND siln_w_wo_stk_flag = 'Y'
"
"                                 AND prod_var_opt NOT IN ('PTO')
"
"                                 AND prod_stocked = 'Y'
"
"                                 AND siln_sf_code IS NULL
"
"                                 AND siln_bu = sqoh_bu(+)
"
"                                 AND siln_store_id = sqoh_store_id(+)
"
"                                 AND siln_prod_id = sqoh_prod_id(+)
"
"                                 AND siln_prod_rev = sqoh_prod_rev(+)
"
"                                 AND siln_so_schld_desc = sqoh_so_schld_desc(+)
"
"                                 --AND siln_so_no = sqoh_so_ord_no(+)
"
"                                 --AND siln_so_seq_no = sqoh_seq_no(+)
"
"                          UNION ALL
"
"                          SELECT siln_seq_no,
"
"                                 siln_store_id,
"
"                                 siln_prod_id,
"
"                                 siln_prod_rev,
"
"                                 siln_so_no,
"
"                                 siln_so_seq_no,
"
"                                 siln_inv_qty,
"
"                                 NVL ( (sqoh_so_qty - sqoh_so_alloc_qty), 0)
"
"                                    so_qty
"
"                            FROM sales_invoices_ln,
"
"                                 products,
"
"                                 so_qty_on_hand,
"
"                                 icm_control
"
"                           WHERE     siln_bu = p_bu
"
"                                 AND siln_plnt = p_sihd_plant
"
"                                 AND siln_doc_no = p_sihd_doc_no
"
"                                 AND siln_promotion_flag IN ('N', 'T')
"
"                                 AND siln_bu = prod_bu
"
"                                 AND siln_prod_id = prod_id
"
"                                 AND siln_prod_rev = prod_rev
"
"                                 AND prod_status = 'A'
"
"                                 AND siln_bu = icmctrl_bu
"
"                                 AND siln_proj_id IS NOT NULL
"
"                                 AND siln_prod_indicator_flag = 'Y'
"
"                                 AND siln_w_wo_stk_flag = 'Y'
"
"                                 AND prod_var_opt NOT IN ('PTO')
"
"                                 AND prod_stocked = 'Y'
"
"                                 AND siln_sf_code IS NULL
"
"                                 AND siln_bu = sqoh_bu(+)
"
"                                 AND siln_store_id = sqoh_store_id(+)
"
"                                 AND siln_prod_id = sqoh_prod_id(+)
"
"                                 AND siln_prod_rev = sqoh_prod_rev(+)
"
"                                 AND siln_proj_id = sqoh_proj_id(+))
"
"                   WHERE siln_inv_qty > so_qty;
"
"
"
"               var_gen_ls              VARCHAR2 (1);
"
"               var_tot_amt             NUMBER;
"
"               var_tot_qty             NUMBER;
"
"               v_cnt                   NUMBER;
"
"               v_cnt1                  NUMBER;
"
"               cr2                     c2%ROWTYPE;
"
"               var_tr_wgt              NUMBER;
"
"               var_pallet_wgt          NUMBER := 0;
"
"               var_cut_len_flag        VARCHAR2 (1) := 'N';
"
"               v_wh_cnt                NUMBER;
"
"               v_shipset_ln_stk_flag   VARCHAR2 (1);
"
"            BEGIN
"
"               SELECT somctrl_shipset_ln_stk_flag
"
"                 INTO v_shipset_ln_stk_flag
"
"                 FROM som_control
"
"                WHERE somctrl_bu = p_bu;
"
"
"
"               IF v_shipset_ln_stk_flag = 'N'
"
"               THEN
"
"                  proc_gen_sto_mat_cons (p_bu,
"
"                                         p_sihd_plant,
"
"                                         p_sihd_doc_no,
"
"                                         p_user);
"
"                  COMMIT;
"
"               END IF;
"
"
"
"               OPEN c2;
"
"
"
"               FETCH c2 INTO cr2;
"
"
"
"               IF c2%FOUND               /*AND cr2.siln_inv_qty > cr2.so_qty*/
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Quantity on hand is low for the line.||cr2.siln_seq_no');
"
"               END IF;
"
"
"
"               CLOSE c2;
"
"
"
"               SELECT COUNT (*)
"
"                 INTO v_wh_cnt
"
"                 FROM sales_invoices_ln
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no
"
"                      AND siln_store_id IS NULL
"
"                      AND siln_matl_type = 'P';
"
"
"
"               IF v_wh_cnt <> 0
"
"               THEN
"
"                  raise_application_error (-20999,
"
"                                           'Warehouse must be entered.');
"
"               END IF;
"
"
"
"
"
"               UPDATE sales_invoices_ln
"
"                  SET siln_gen_ls_flag = 'N'
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no;
"
"
"
"
"
"
"
"               IF var_gen_ls = 'Y'
"
"               THEN
"
"                  FOR cr1 IN c1
"
"                  LOOP
"
"                     SELECT SUM (sicb_trans_qty * sicb_unit_cost)
"
"                       INTO var_tot_amt
"
"                       FROM sales_inv_cost_batch
"
"                      WHERE     sicb_bu = p_bu
"
"                            AND sicb_plnt = p_sihd_plant
"
"                            AND sicb_doc_no = p_sihd_doc_no
"
"                            AND sicb_seq_no = cr1.siln_seq_no;
"
"
"
"                     SELECT SUM (sicb_trans_qty)
"
"                       INTO var_tot_qty
"
"                       FROM sales_inv_cost_batch
"
"                      WHERE     sicb_bu = p_bu
"
"                            AND sicb_plnt = p_sihd_plant
"
"                            AND sicb_doc_no = p_sihd_doc_no
"
"                            AND sicb_seq_no = cr1.siln_seq_no;
"
"
"
"                     UPDATE sales_invoices_ln
"
"                        SET siln_unit_cost =
"
"                               NVL (NVL (var_tot_amt, 0) / cr1.siln_inv_qty,
"
"                                    0)
"
"                      WHERE     siln_bu = p_bu
"
"                            AND siln_plnt = p_sihd_plant
"
"                            AND siln_doc_no = p_sihd_doc_no
"
"                            AND siln_seq_no = cr1.siln_seq_no;
"
"                  END LOOP;
"
"
"
"                  COMMIT;
"
"               END IF;
"
"            END;
"
"
"
"            /* proc_alloc_lot_serial END */
"
"
"
"
"
"            IF cr6.sihd_type IN
"
"                  ('SIG',
"
"                   'SIDE',
"
"                   'SIFS',
"
"                   'SIFR',
"
"                   'LO',
"
"                   'TP',
"
"                   'SIT',
"
"                   'LI',
"
"                   'RB',
"
"                   'SE',
"
"                   'IR',
"
"                   'JWIG')
"
"               AND cr6.sihd_status <> 'P'
"
"               AND cr6.sihd_comm_tax_inv_flag = 'E'
"
"            THEN
"
"               --proc_pick_sales_inv;
"
"
"
"               pkg_si_invoice_web_som1090.proc_si_pick_det_web (p_bu,
"
"                                     p_user,
"
"                                     p_sihd_plant,
"
"                                     p_sihd_doc_no);
"
"
"
"               UPDATE sales_invoices_hd
"
"                  SET sihd_status = 'P'
"
"                WHERE     sihd_bu = p_bu
"
"                      AND sihd_plant = p_sihd_plant
"
"                      AND sihd_doc_no = p_sihd_doc_no
"
"                      AND sihd_status = 'N';
"
"
"
"               COMMIT;
"
"            END IF;
"
"         END IF;
"
"
"
"
"
"
"
"         IF cr6.sihd_inv_no IS NULL
"
"         THEN
"
"            proc_si_cre_inv_web (p_bu,
"
"                                 p_sihd_plant,
"
"                                 p_sihd_doc_no,
"
"                                 p_user);
"
"
"
"
"
"            COMMIT;
"
"         END IF;
"
"
"
"         ---------------------------------------------------
"
"         IF cr6.sihd_exc_inv_no IS NULL
"
"         THEN
"
"
"
"
"
"            UPDATE sales_invoices_hd
"
"               SET sihd_jrnl_flag = 'N'
"
"             WHERE     sihd_bu = p_bu
"
"                   AND sihd_plant = p_sihd_plant
"
"                   AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"            COMMIT;
"
"            raise_application_error (-20999, 'Create Invoice No.');
"
"         END IF;
"
"
"
"         DECLARE
"
"            v_cnt   NUMBER (5);
"
"         BEGIN
"
"            SELECT COUNT (*)
"
"              INTO v_cnt
"
"              FROM sales_invoices_ln
"
"             WHERE     siln_bu = p_bu
"
"                   AND siln_plnt = p_sihd_plant
"
"                   AND siln_doc_no = p_sihd_doc_no;
"
"
"
"            IF v_cnt <= 0
"
"            THEN
"
"               --p_sihd_jrnl_flag := 'N';
"
"               UPDATE sales_invoices_hd
"
"                  SET sihd_jrnl_flag = 'N'
"
"                WHERE     sihd_bu = p_bu
"
"                      AND sihd_plant = p_sihd_plant
"
"                      AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"               COMMIT;
"
"               raise_application_error (-20999,
"
"                                        'Line Details must be Entered.');
"
"            END IF;
"
"         END;
"
"
"
"         DECLARE
"
"            CURSOR c0
"
"            IS
"
"               SELECT somctrl_fa_id_rqrd_flag
"
"                 FROM som_control
"
"                WHERE somctrl_bu = p_bu;
"
"
"
"            cr0             c0%ROWTYPE;
"
"            var_asset_cnt   NUMBER;
"
"         BEGIN
"
"            OPEN c0;
"
"
"
"            FETCH c0 INTO cr0;
"
"
"
"            IF     c0%FOUND
"
"               AND cr0.somctrl_fa_id_rqrd_flag = 'Y'
"
"               AND cr6.sihd_type = 'SIFA'
"
"            THEN
"
"               SELECT COUNT (*)
"
"                 INTO var_asset_cnt
"
"                 FROM sales_invoices_ln
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no
"
"                      AND siln_asset_id IS NULL;
"
"
"
"               IF var_asset_cnt > 0
"
"               THEN
"
"                  -- p_sihd_jrnl_flag := 'N';
"
"                  UPDATE sales_invoices_hd
"
"                     SET sihd_jrnl_flag = 'N'
"
"                   WHERE     sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                  COMMIT;
"
"                  raise_application_error (-20999,
"
"                                           'Fixed asset must be entered.');
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE c0;
"
"         END;
"
"
"
"         DECLARE
"
"            CURSOR c0
"
"            IS
"
"               SELECT somctrl_no_fin_impl_flag
"
"                 FROM som_control
"
"                WHERE somctrl_bu = p_bu;
"
"
"
"            cr0   c0%ROWTYPE;
"
"         BEGIN
"
"            OPEN c0;
"
"
"
"            FETCH c0 INTO cr0;
"
"
"
"            IF cr0.somctrl_no_fin_impl_flag = 'Y'
"
"            THEN
"
"               -- p_sihd_jrnl_flag := 'N';
"
"               UPDATE sales_invoices_hd
"
"                  SET sihd_jrnl_flag = 'N'
"
"                WHERE     sihd_bu = p_bu
"
"                      AND sihd_plant = p_sihd_plant
"
"                      AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"               COMMIT;
"
"               raise_application_error (
"
"                  -20999,
"
"                  'Uncheck the flag ""No financial implications"" in application control');
"
"            END IF;
"
"
"
"            CLOSE c0;
"
"         END;
"
"
"
"
"
"         IF cr6.sihd_sales_person IS NULL
"
"         THEN
"
"            -- p_sihd_jrnl_flag := 'N';
"
"            UPDATE sales_invoices_hd
"
"               SET sihd_jrnl_flag = 'N'
"
"             WHERE     sihd_bu = p_bu
"
"                   AND sihd_plant = p_sihd_plant
"
"                   AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"            COMMIT;
"
"            raise_application_error (-20999,
"
"                                     'Sales Person ID must be entered.');
"
"         END IF;
"
"
"
"
"
"         IF cr6.sihd_proj_lvl IS NULL
"
"         THEN
"
"            DECLARE
"
"               CURSOR c1
"
"               IS
"
"                    SELECT siln_so_no
"
"                      FROM sales_invoices_ln
"
"                     WHERE     siln_bu = p_bu
"
"                           AND siln_plnt = p_sihd_plant
"
"                           AND siln_doc_no = p_sihd_doc_no
"
"                  GROUP BY siln_so_no;
"
"
"
"               CURSOR c2 (
"
"                  c_order_no VARCHAR2)
"
"               IS
"
"                  SELECT pcc_ac_lvl_prj, pcc_desc
"
"                    FROM profit_cost_centers
"
"                   WHERE     pcc_bu = p_bu
"
"                         AND pcc_ac_plnt = p_sihd_plant
"
"                         AND pcc_so_prj_id = c_order_no
"
"                         AND pcc_so_cust_id = p_sihd_cust_id;
"
"
"
"               cr2   c2%ROWTYPE;
"
"            BEGIN
"
"               FOR cr1 IN c1
"
"               LOOP
"
"                  OPEN c2 (cr1.siln_so_no);
"
"
"
"                  FETCH c2 INTO cr2;
"
"
"
"                  IF c2%FOUND
"
"                  THEN
"
"                     UPDATE sales_invoices_hd
"
"                        SET sihd_proj_lvl = cr2.pcc_ac_lvl_prj,
"
"                            sihd_proj_lvl_name = cr2.pcc_desc
"
"                      WHERE     sihd_bu = p_bu
"
"                            AND sihd_plant = p_sihd_plant
"
"                            AND sihd_doc_no = p_sihd_doc_no;
"
"                  END IF;
"
"
"
"                  CLOSE c2;
"
"               END LOOP c1;
"
"            END;
"
"         END IF;
"
"
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT *
"
"                 FROM sales_invoices_ln
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no;
"
"
"
"            CURSOR c2 (
"
"               c_order_no VARCHAR2)
"
"            IS
"
"               SELECT glp_prj_id, glp_prj_name
"
"                 FROM gl_lvl_prj
"
"                WHERE     glp_bu = p_bu
"
"                      AND glp_acct_plnt = p_sihd_plant
"
"                      AND glp_so_prj_id = c_order_no
"
"                      AND glp_type = 'SO';
"
"
"
"            cr2   c2%ROWTYPE;
"
"         BEGIN
"
"            FOR cr1 IN c1
"
"            LOOP
"
"               OPEN c2 (cr1.siln_so_no);
"
"
"
"               FETCH c2 INTO cr2;
"
"
"
"               IF c2%FOUND
"
"               THEN
"
"                  UPDATE sales_invoices_ln
"
"                     SET siln_proj_lvl_id = cr2.glp_prj_id,
"
"                         siln_proj_lvl_name = cr2.glp_prj_name
"
"                   WHERE     siln_bu = p_bu
"
"                         AND siln_plnt = cr1.siln_plnt
"
"                         AND siln_doc_no = cr1.siln_doc_no
"
"                         AND siln_seq_no = cr1.siln_seq_no
"
"                         AND siln_so_no = cr1.siln_so_no
"
"                         AND siln_so_seq_no = cr1.siln_so_seq_no;
"
"               END IF;
"
"
"
"               CLOSE c2;
"
"            END LOOP c1;
"
"         END;
"
"
"
"         CLOSE c6;
"
"
"
"
"
"         /*-------------Update Amount-------------*/
"
"         proc_upd_sales_invoice_amount (p_bu, p_sihd_plant, p_sihd_doc_no);
"
"
"
"         /*-------------End Update Amount---------*/
"
"
"
"         proc_upd_sales_inv_adj_amt (p_bu, p_sihd_doc_no);
"
"
"
"         COMMIT;
"
"
"
"
"
"         OPEN c6;
"
"
"
"         FETCH c6 INTO cr6;
"
"
"
"         IF cr6.sihd_exc_inv_no IS NULL
"
"            OR cr6.sihd_exc_inv_no IS NOT NULL AND cr6.sihd_status <> 'I'
"
"         THEN
"
"            DECLARE
"
"               post_alert          NUMBER;
"
"               var_post_flag       VARCHAR2 (1) := 'N';
"
"               var_cnt_disc        NUMBER;
"
"               var_sum_duepct      NUMBER;
"
"               var_sum_dueamt      NUMBER;
"
"               var_isum_duepct     NUMBER;
"
"               var_dsum_dueamt     NUMBER;
"
"               var_dsum_duepct     NUMBER;
"
"               var_isum_dueamt     NUMBER;
"
"               rnd                 NUMBER;
"
"               var_due_amount      NUMBER := 0;
"
"               p_flag              VARCHAR2 (1) := 'N';
"
"               v_ln_amount         NUMBER (15, 3);
"
"               v_tax_amt           NUMBER (15, 3);
"
"               v_mat_amount        NUMBER (15, 3);
"
"               v_year              NUMBER;
"
"               v_period            NUMBER;
"
"               v_class_cnt         NUMBER := 0;
"
"               v_inv_no            VARCHAR2 (20);
"
"               v_depb_count        NUMBER;
"
"               v_fa_count          NUMBER;
"
"               var_inv_type        VARCHAR2 (50);
"
"               var_res             VARCHAR2 (50);
"
"               var_cnt_ps          NUMBER;
"
"               v_dtax_amt          NUMBER := 0;
"
"               var_amda_cnt        NUMBER := 0;
"
"               var_mat_rnd         NUMBER;
"
"               var_comm_inv_flag   VARCHAR2 (1);
"
"
"
"               CURSOR c2
"
"               IS
"
"                  SELECT *
"
"                    FROM sales_invoices_ln
"
"                   WHERE     siln_bu = p_bu
"
"                         AND siln_plnt = p_sihd_plant
"
"                         AND siln_doc_no = p_sihd_doc_no;
"
"
"
"               CURSOR c3 (
"
"                  p_contr_no     VARCHAR2,
"
"                  p_class_id     VARCHAR2,
"
"                  p_prod_id      VARCHAR2,
"
"                  p_prod_rev     NUMBER,
"
"                  p_sale_uom     VARCHAR2,
"
"                  p_price_uom    VARCHAR2)
"
"               IS
"
"                  SELECT scdhd_hold_flag
"
"                    FROM sales_contr_details_hd
"
"                   WHERE     scdhd_bu = p_bu
"
"                         AND scdhd_plnt = p_sihd_plant
"
"                         AND scdhd_contr_no = p_contr_no
"
"                         AND scdhd_cust_id = p_sihd_cust_id
"
"                         AND scdhd_prod_id = p_prod_id
"
"                         AND scdhd_prod_rev = p_prod_rev
"
"                         AND scdhd_class_id = p_class_id
"
"                         AND scdhd_price_uom = p_price_uom
"
"                         AND scdhd_uom = p_sale_uom
"
"                         AND (TRUNC (SYSDATE) BETWEEN scdhd_date_from
"
"                                                  AND scdhd_date_to)
"
"                         AND scdhd_status = 'A';
"
"
"
"               -- cr1 c1%rowtype;
"
"               cr3                 c3%ROWTYPE;
"
"               var_stk_item_cnt    NUMBER;
"
"               var_pk_cnt          NUMBER;
"
"            BEGIN
"
"               IF cr6.sihd_currency <> func_find_base_currency (p_bu)
"
"               THEN
"
"                  rnd := func_find_currency_dec1 (p_bu, cr6.sihd_currency);
"
"               ELSE
"
"                  rnd := func_find_contr_rnddigit (p_bu,cr6.sihd_cust_id);
"
"               END IF;
"
"
"
"               var_mat_rnd := func_find_currency_dec (p_bu, cr6.sihd_currency);
"
"
"
"               FOR cr2 IN c2
"
"               LOOP
"
"                  OPEN c3 (cr2.siln_conract_no,
"
"                           cr2.siln_sales_price_class,
"
"                           cr2.siln_prod_id,
"
"                           cr2.siln_prod_rev,
"
"                           cr2.siln_uom,
"
"                           cr2.siln_price_uom);
"
"
"
"                  FETCH c3 INTO cr3;
"
"
"
"                  IF cr3.scdhd_hold_flag = 'Y'
"
"                  THEN
"
"                     -- p_sihd_jrnl_flag := 'N';
"
"                     UPDATE sales_invoices_hd
"
"                        SET sihd_jrnl_flag = 'N'
"
"                      WHERE     sihd_bu = p_bu
"
"                            AND sihd_plant = p_sihd_plant
"
"                            AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                     COMMIT;
"
"
"
"                     raise_application_error (-20999,
"
"                                              'Open Sales Order is on hold.');
"
"                  END IF;
"
"
"
"                  CLOSE c3;
"
"               END LOOP;
"
"
"
"               IF p_sihd_plant IS NULL
"
"               THEN
"
"                  --  p_sihd_jrnl_flag := 'N';
"
"                  UPDATE sales_invoices_hd
"
"                     SET sihd_jrnl_flag = 'N'
"
"                   WHERE     sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                  COMMIT;
"
"
"
"                  raise_application_error (-20999, 'Unit must be entered.');
"
"               END IF;
"
"
"
"               --:global.docno:=P_SIHD_DOC_NO;
"
"
"
"               SELECT COUNT (*)
"
"                 INTO var_due_amount
"
"                 FROM sales_invoices_pay_due
"
"                WHERE     sipd_bu = p_bu
"
"                      AND sipd_plnt = p_sihd_plant
"
"                      AND sipd_doc_no = p_sihd_doc_no;
"
"
"
"               /*  Counting the number of values in sales_invoices_pay_due for only term_due type also
"
"                       Calculating the sum of due percentage and sum of due amount in current document values */
"
"               SELECT COUNT (*), NVL (SUM (sipd_due_amt), 0)
"
"                 INTO var_cnt_disc, var_sum_dueamt
"
"                 FROM sales_invoices_pay_due
"
"                WHERE     sipd_bu = p_bu
"
"                      AND sipd_plnt = p_sihd_plant
"
"                      AND sipd_doc_no = p_sihd_doc_no
"
"                      AND sipd_due_type = 'TD';
"
"
"
"               /*  Calculating the sum of due percentage and sum of due amount from sales_invoices_pay_due for current document values
"
"                       and due type like Invoice Due  */
"
"               SELECT NVL (SUM (sipd_due_amt), 0)
"
"                 INTO var_isum_dueamt
"
"                 FROM sales_invoices_pay_due
"
"                WHERE     sipd_bu = p_bu
"
"                      AND sipd_plnt = p_sihd_plant
"
"                      AND sipd_doc_no = p_sihd_doc_no
"
"                      AND sipd_due_type = 'ID';
"
"
"
"               /*  Calculating the sum of due percentage and sum of due amount from sales_invoices_pay_due for current document values
"
"                       and due type like Discount Due  */
"
"               SELECT NVL (SUM (sipd_due_amt), 0)
"
"                 INTO var_dsum_dueamt
"
"                 FROM sales_invoices_pay_due
"
"                WHERE     sipd_bu = p_bu
"
"                      AND sipd_plnt = p_sihd_plant
"
"                      AND sipd_doc_no = p_sihd_doc_no
"
"                      AND sipd_due_type = 'DD';
"
"
"
"
"
"               IF cr6.sihd_exc_inv_date IS NULL
"
"               THEN
"
"                  -- p_sihd_jrnl_flag := 'N';
"
"                  UPDATE sales_invoices_hd
"
"                     SET sihd_jrnl_flag = 'N'
"
"                   WHERE     sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                  COMMIT;
"
"
"
"                  raise_application_error (-20999,
"
"                                           'Invoice Date must be entered.');
"
"               END IF;
"
"
"
"                 SELECT ROUND (
"
"                           (NVL (
"
"                               SUM (
"
"                                  CASE
"
"                                     WHEN sihd_sal_ret_type = 'CM'
"
"                                     THEN
"
"                                        NVL (
"
"                                           SUM (
"
"                                              (CASE
"
"                                                  WHEN siln_cr_dr = 'DR' THEN 1
"
"                                                  ELSE -1
"
"                                               END)
"
"                                              * ( ( CASE WHEN siln_reverse_tax_flag = 'Y' THEN ( (ROUND ((siln_inv_qty * siln_price),3) - (  siln_disc_amt + siln_spl_disc_amt + siln_cash_disc_amt)) - (CASE WHEN siln_cust_tax_charge_flag = 'Y' THEN (siln_igst_amt + siln_sgst_amt + siln_cgst_amt + siln_utgst_amt + siln_cess_amt) ELSE 0 END))
"
"                                                    ELSE (ROUND (
"
"                                                        (siln_inv_qty
"
"                                                         * siln_price),3)
"
"                                                     - (  siln_disc_amt
"
"                                                        + siln_spl_disc_amt
"
"                                                        + siln_cash_disc_amt)) END
"
"                                                        ))),
"
"                                           0)
"
"                                     ELSE
"
"                                        NVL (
"
"                                           SUM (
"
"                                              (CASE
"
"                                                  WHEN siln_cr_dr = 'CR' THEN 1
"
"                                                  ELSE -1
"
"                                               END)
"
"                                              * ( ( CASE WHEN siln_reverse_tax_flag = 'Y' THEN ( (ROUND ((siln_inv_qty * siln_price),3) - (  siln_disc_amt + siln_spl_disc_amt + siln_cash_disc_amt)) - (CASE WHEN siln_cust_tax_charge_flag = 'Y' THEN (siln_igst_amt + siln_sgst_amt + siln_cgst_amt + siln_utgst_amt + siln_cess_amt) ELSE 0 END))
"
"                                              ELSE (ROUND (
"
"                                                        (siln_inv_qty
"
"                                                         * siln_price),
"
"                                                        3)
"
"                                                     - (  siln_disc_amt
"
"                                                        + siln_spl_disc_amt
"
"                                                        + siln_cash_disc_amt)) END
"
"                                                        ))),
"
"                                           0)
"
"                                  END),
"
"                               0)),
"
"                           2)
"
"                   INTO v_mat_amount
"
"                   FROM sales_invoices_hd, sales_invoices_ln
"
"                  WHERE     sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND siln_bu = p_bu
"
"                        AND siln_plnt = p_sihd_plant
"
"                        AND siln_doc_no = p_sihd_doc_no
"
"                        AND siln_matl_type NOT IN ('O')
"
"                        AND (sihd_type = 'IF'
"
"                             OR (sihd_type <> 'IF'
"
"                                 AND siln_promotion_flag IN ('T', 'N')))
"
"               GROUP BY sihd_sal_ret_type;
"
"
"
"
"
"               IF NVL (v_mat_amount, 0) <> NVL (cr6.sihd_net_amt, 0)
"
"               THEN
"
"                  --  p_sihd_jrnl_flag := 'N';
"
"                  UPDATE sales_invoices_hd
"
"                     SET sihd_jrnl_flag = 'N'
"
"                   WHERE     sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                  COMMIT;
"
"
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Material amount mismatch with Total Material amount.'
"
"                     || '-'
"
"                     || NVL (v_mat_amount, 0)
"
"                     || '-'
"
"                     || NVL (cr6.sihd_net_amt, 0));
"
"               END IF;
"
"
"
"
"
"               IF cr6.sihd_type IN ('DP')
"
"               THEN
"
"                  SELECT COUNT (*)
"
"                    INTO v_depb_count
"
"                    FROM sales_invoices_ln
"
"                   WHERE     siln_bu = p_bu
"
"                         AND siln_plnt = p_sihd_plant
"
"                         AND siln_doc_no = p_sihd_doc_no
"
"                         AND siln_meis_lic_no IS NULL;
"
"
"
"                  IF v_depb_count > 0
"
"                  THEN
"
"                     --  p_sihd_jrnl_flag := 'N';
"
"                     UPDATE sales_invoices_hd
"
"                        SET sihd_jrnl_flag = 'N'
"
"                      WHERE     sihd_bu = p_bu
"
"                            AND sihd_plant = p_sihd_plant
"
"                            AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                     COMMIT;
"
"
"
"                     raise_application_error (
"
"                        -20999,
"
"                        'License details must be entered.');
"
"                  END IF;
"
"               END IF;
"
"
"
"
"
"               SELECT NVL (
"
"                         (SUM (ROUND ( ( (siln_inv_qty) * siln_price), 3))),
"
"                         0)
"
"                      - NVL (
"
"                           (SUM (
"
"                               ROUND (
"
"                                  (  (siln_inv_qty)
"
"                                   * siln_price
"
"                                   * siln_disc_pct
"
"                                   / 100),
"
"                                  3))),
"
"                           0)
"
"                 INTO v_ln_amount
"
"                 FROM sales_invoices_ln
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_sihd_plant
"
"                      AND siln_doc_no = p_sihd_doc_no
"
"                      AND siln_promotion_flag IN ('N', 'T');
"
"
"
"                 SELECT NVL (
"
"                           SUM (
"
"                              CASE
"
"                                 WHEN sihd_sal_ret_type = 'CM'
"
"                                 THEN
"
"                                    NVL (
"
"                                       SUM (
"
"                                          (CASE
"
"                                              WHEN siln_cr_dr = 'DR' THEN 1
"
"                                              ELSE -1
"
"                                           END)
"
"                                          * (  siln_igst_amt
"
"                                             + siln_sgst_amt
"
"                                             + siln_cgst_amt
"
"                                             + siln_utgst_amt
"
"                                             + siln_cess_amt)),
"
"                                       0)
"
"                                 ELSE
"
"                                    NVL (
"
"                                       SUM (
"
"                                          (CASE
"
"                                              WHEN siln_cr_dr = 'CR' THEN 1
"
"                                              ELSE -1
"
"                                           END)
"
"                                          * (  siln_igst_amt
"
"                                             + siln_sgst_amt
"
"                                             + siln_cgst_amt
"
"                                             + siln_utgst_amt
"
"                                             + siln_cess_amt)),
"
"                                       0)
"
"                              END),
"
"                           0)
"
"                   INTO v_tax_amt
"
"                   FROM sales_invoices_hd, sales_invoices_ln
"
"                  WHERE     sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND siln_bu = p_bu
"
"                        AND siln_plnt = p_sihd_plant
"
"                        AND siln_doc_no = p_sihd_doc_no
"
"                        AND siln_cust_tax_charge_flag = 'Y'
"
"                        AND (sihd_type = 'IF'
"
"                             OR (sihd_type <> 'IF'
"
"                                 AND siln_promotion_flag IN ('T', 'N', 'Y')))
"
"               GROUP BY sihd_sal_ret_type;
"
"
"
"               IF NVL (v_tax_amt, 0) <> NVL (cr6.sihd_tax_amt, 0)
"
"               THEN
"
"                  -- p_sihd_jrnl_flag := 'N';
"
"                  UPDATE sales_invoices_hd
"
"                     SET sihd_jrnl_flag = 'N'
"
"                   WHERE     sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                  COMMIT;
"
"
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Tax amount mismatch with Total Tax amount.');
"
"               END IF;
"
"
"
"
"
"
"
"               FOR dpb
"
"                  IN (SELECT siln_depb_pct, siln_depb_flag
"
"                        FROM sales_invoices_ln
"
"                       WHERE siln_bu = p_bu AND siln_doc_no = p_sihd_doc_no)
"
"               LOOP
"
"                  IF dpb.siln_depb_flag IN ('Y')
"
"                     AND NVL (dpb.siln_depb_pct, 0) <= 0
"
"                  THEN
"
"                     -- p_sihd_jrnl_flag := 'N';
"
"                     UPDATE sales_invoices_hd
"
"                        SET sihd_jrnl_flag = 'N'
"
"                      WHERE     sihd_bu = p_bu
"
"                            AND sihd_plant = p_sihd_plant
"
"                            AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                     COMMIT;
"
"
"
"                     raise_application_error (
"
"                        -20999,
"
"                        'Depb percentage should be greater than zero.');
"
"                  END IF;
"
"               END LOOP;
"
"
"
"               IF cr6.sihd_exc_inv_date IS NULL
"
"               THEN
"
"                  -- p_sihd_jrnl_flag := 'N';
"
"                  UPDATE sales_invoices_hd
"
"                     SET sihd_jrnl_flag = 'N'
"
"                   WHERE     sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                  COMMIT;
"
"
"
"                  raise_application_error (-20999,
"
"                                           'Invoice date must be entered.');
"
"               END IF;
"
"
"
"               IF cr6.sihd_rem_date IS NULL
"
"               THEN
"
"                  -- p_sihd_jrnl_flag := 'N';
"
"                  UPDATE sales_invoices_hd
"
"                     SET sihd_jrnl_flag = 'N'
"
"                   WHERE     sihd_bu = p_bu
"
"                         AND sihd_plant = p_sihd_plant
"
"                         AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                  COMMIT;
"
"
"
"                  raise_application_error (-20999,
"
"                                           'Removal date  must be entered.');
"
"               END IF;
"
"
"
"               DECLARE
"
"                  v_exc_inv_date   DATE;
"
"               BEGIN
"
"                  v_exc_inv_date := TO_CHAR (cr6.sihd_exc_inv_date);
"
"                  --raise_application_error (-20999, v_exc_inv_date);
"
"                  proc_find_year_period (p_bu,
"
"                                         TRUNC (v_exc_inv_date),
"
"                                         v_year,
"
"                                         v_period);
"
"               END;
"
"
"
"               proc_salterm_det (p_bu, p_sihd_plant, p_sihd_doc_no);
"
"
"
"
"
"               IF cr6.sihd_status <> 'P'
"
"                  AND cr6.sihd_type IN
"
"                         ('SIG', 'LO', 'LI', 'RB', 'TP', 'SIT', 'SE', 'IR','JWIG')
"
"               THEN
"
"                  SELECT COUNT (*)
"
"                    INTO var_stk_item_cnt
"
"                    FROM sales_invoices_ln, products
"
"                   WHERE     siln_bu = prod_bu
"
"                         AND siln_prod_id = prod_id
"
"                         AND siln_prod_rev = prod_rev
"
"                         AND prod_stocked = 'Y'
"
"                         AND siln_bu = p_bu
"
"                         AND siln_plnt = p_sihd_plant
"
"                         AND siln_doc_no = p_sihd_doc_no;
"
"
"
"                  IF var_stk_item_cnt > 0
"
"                  THEN
"
"                     -- p_sihd_jrnl_flag := 'N';
"
"                     UPDATE sales_invoices_hd
"
"                        SET sihd_jrnl_flag = 'N'
"
"                      WHERE     sihd_bu = p_bu
"
"                            AND sihd_plant = p_sihd_plant
"
"                            AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                     COMMIT;
"
"
"
"                     raise_application_error (-20999,
"
"                                              'Quantity should be picked.');
"
"                  END IF;
"
"               END IF;
"
"
"
"
"
"               IF cr6.sihd_status = 'P'
"
"                  AND (ROUND ( (cr6.sihd_gross_amt), rnd) <> cr6.sihd_tot_amt)
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'Total amount does not match the material amount and tax amount.'
"
"                     || '/'
"
"                     || ROUND ( (cr6.sihd_gross_amt), rnd)
"
"                     || '/'
"
"                     || cr6.sihd_tot_amt);
"
"               END IF;
"
"
"
"               var_post_flag := 'Y';
"
"
"
"               IF var_post_flag = 'Y'
"
"               THEN
"
"                  SELECT somctrl_comm_exc_fin_flag
"
"                    INTO var_comm_inv_flag
"
"                    FROM som_control
"
"                   WHERE somctrl_bu = p_bu;
"
"
"
"                  IF var_comm_inv_flag <> 'C'
"
"                  THEN
"
"                     IF cr6.sihd_exc_inv_pfx IS NULL
"
"                     THEN
"
"                        --  p_sihd_jrnl_flag := 'N';
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_jrnl_flag = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_sihd_plant
"
"                               AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                        COMMIT;
"
"
"
"                        raise_application_error (
"
"                           -20999,
"
"                           'Invoice prefix must be entered');
"
"                     END IF;
"
"
"
"                     IF cr6.sihd_exc_inv_no IS NULL
"
"                     THEN
"
"                        -- p_sihd_jrnl_flag := 'N';
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_jrnl_flag = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_sihd_plant
"
"                               AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                        COMMIT;
"
"
"
"                        raise_application_error (
"
"                           -20999,
"
"                           'Invoice number must be generated.');
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  IF cr6.sihd_currency <> func_find_base_currency (p_bu)
"
"                     AND var_comm_inv_flag = 'C'
"
"                  THEN
"
"                     SELECT COUNT (*)
"
"                       INTO var_pk_cnt
"
"                       FROM sales_invoices_ln
"
"                      WHERE     siln_bu = p_bu
"
"                            AND siln_plnt = p_sihd_plant
"
"                            AND siln_doc_no = p_sihd_doc_no
"
"                            AND siln_pack_slip_doc_no IS NOT NULL;
"
"
"
"
"
"                     IF var_pk_cnt = 0
"
"                     THEN
"
"                        IF cr6.sihd_comm_inv_pfx IS NULL
"
"                        THEN
"
"                           -- p_sihd_jrnl_flag := 'N';
"
"                           UPDATE sales_invoices_hd
"
"                              SET sihd_jrnl_flag = 'N'
"
"                            WHERE     sihd_bu = p_bu
"
"                                  AND sihd_plant = p_sihd_plant
"
"                                  AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                           COMMIT;
"
"
"
"                           raise_application_error (
"
"                              -20999,
"
"                              (   'Commercial'
"
"                               || ' '
"
"                               || 'Invoice prefix must be entered'));
"
"                        END IF;
"
"                     END IF;
"
"
"
"                     IF cr6.sihd_comm_inv_no IS NULL
"
"                     THEN
"
"                        -- p_sihd_jrnl_flag := 'N';
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_jrnl_flag = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_sihd_plant
"
"                               AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                        COMMIT;
"
"
"
"                        raise_application_error (
"
"                           -20999,
"
"                           (   'Commercial'
"
"                            || ' '
"
"                            || 'Invoice number must be generated.'));
"
"                     END IF;
"
"
"
"                     IF cr6.sihd_comm_inv_date IS NULL
"
"                     THEN
"
"                        --p_sihd_jrnl_flag := 'N';
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_jrnl_flag = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_sihd_plant
"
"                               AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                        COMMIT;
"
"
"
"                        raise_application_error (
"
"                           -20999,
"
"                           (   'Commercial'
"
"                            || ' '
"
"                            || 'Invoice date must be entered.'));
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  IF cr6.sihd_type NOT IN ('PR', 'SISUP', 'NT')
"
"                  THEN
"
"                     SELECT COUNT (*)
"
"                       INTO v_class_cnt
"
"                       FROM sales_invoices_ln
"
"                      WHERE     siln_bu = p_bu
"
"                            AND siln_plnt = p_sihd_plant
"
"                            AND siln_doc_no = p_sihd_doc_no
"
"                            AND siln_class IS NULL
"
"                             AND siln_matl_type = 'P';
"
"
"
"                     IF v_class_cnt > 0
"
"                     THEN
"
"                        --p_sihd_jrnl_flag := 'N';
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_jrnl_flag = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_sihd_plant
"
"                               AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                        COMMIT;
"
"
"
"                        raise_application_error (
"
"                           -20999,
"
"                           'Item class must be entered.');
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  --raise_application_error (-20999,cr6.sihd_ref_plnt);
"
"                  IF cr6.sihd_type IN ('TT', 'NT', 'NO', 'IC', 'SIRC')
"
"                  THEN
"
"                     p_flag := 'Y';
"
"                  ELSE
"
"                     --p_sihd_jrnl_flag := 'N';
"
"                     UPDATE sales_invoices_hd
"
"                        SET sihd_jrnl_flag = 'N'
"
"                      WHERE     sihd_bu = p_bu
"
"                            AND sihd_plant = p_sihd_plant
"
"                            AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                     COMMIT;
"
"
"
"                     proc_ins_cust_inv_jrnl (p_bu,
"
"                                             p_sihd_plant,
"
"                                             p_sihd_plant,
"
"                                             p_sihd_doc_no,
"
"                                             cr6.sihd_type,
"
"                                             cr6.sihd_inv_pfx,
"
"                                             v_inv_no,
"
"                                             p_user,
"
"                                             TRUNC (SYSDATE),
"
"                                             p_lang,
"
"                                             p_flag);
"
"
"
"
"
"                     IF p_flag = 'Y'
"
"                     THEN
"
"                        --p_sihd_jrnl_flag := 'N';
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_jrnl_flag = 'Y'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_sihd_plant
"
"                               AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                        COMMIT;
"
"                     ELSIF p_flag = 'N'
"
"                     THEN
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_jrnl_flag = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_sihd_plant
"
"                               AND sihd_doc_no = p_sihd_doc_no;
"
"
"
"                        COMMIT;
"
"                     END IF;
"
"                  END IF;
"
"               END IF;
"
"            END;
"
"         ELSE
"
"            raise_application_error (-20999, 'Invoice already created.');
"
"
"
"            CLOSE c6;
"
"         END IF;
"
"      ELSE
"
"         DELETE appl_journals
"
"          WHERE     aj_bu = p_bu
"
"                AND aj_plnt = p_sihd_plant
"
"                --and aj_inv_doc_no = :sales_invoices_hd.sihd_doc_no
"
"                AND aj_vou_pfx = cr6.sihd_inv_pfx
"
"                AND aj_vou_no = cr6.sihd_inv_no
"
"                AND aj_appl = 'SOM'
"
"                AND aj_vou_type = 'SI';
"
"
"
"         COMMIT;
"
"
"
"         proc_upd_sales_tcs_amt (p_bu,
"
"                                 p_sihd_plant,
"
"                                 p_sihd_doc_no,
"
"                                 'S',
"
"                                 'U',
"
"                                 p_user);
"
"
"
"
"
"
"
"         UPDATE sales_invoices_ln
"
"            SET siln_tcs_access_val = 0,
"
"                siln_tcs_amt = 0,
"
"                siln_upd_tcs_amt = 0
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_sihd_plant
"
"                AND siln_doc_no = p_sihd_doc_no;
"
"
"
"         COMMIT;
"
"
"
"      END IF;
"
"   END proc_si_journal_web;
"
"
"
"   PROCEDURE proc_si_post_web (p_bu            VARCHAR2,
"
"                               p_user          VARCHAR2,
"
"                               p_plnt          VARCHAR2,
"
"                               p_doc_no        VARCHAR2,
"
"                               p_lang          VARCHAR2,
"
"                               p_wf_type   OUT VARCHAR2)
"
"   IS
"
"      CURSOR c0
"
"      IS
"
"         SELECT *
"
"           FROM som_control
"
"          WHERE somctrl_bu = p_bu;
"
"
"
"      CURSOR c7
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_hd
"
"          WHERE     sihd_bu = p_bu
"
"                AND sihd_plant = p_plnt
"
"                AND sihd_doc_no = p_doc_no;
"
"
"
"
"
"      CURSOR c13
"
"      IS
"
"         SELECT *
"
"           FROM sales_invoices_ln
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_plnt
"
"                AND siln_doc_no = p_doc_no;
"
"
"
"      CURSOR c9
"
"      IS
"
"         SELECT *
"
"           FROM sales_inv_ship_addr
"
"          WHERE     sisa_bu = p_bu
"
"                AND sisa_plnt = p_plnt
"
"                AND sisa_doc_no = p_doc_no;
"
"
"
"
"
"
"
"      CURSOR c_db (
"
"         c_prod_id     VARCHAR2,
"
"         c_prod_rev    NUMBER,
"
"         c_hsn_code    VARCHAR2,
"
"         c_lic_no      VARCHAR2)
"
"      IS
"
"         SELECT (NVL (ddp_dfia_qty, 0) - (ddp_sales_qty)) ddp_bal_qty
"
"           FROM duty_drawback_hd, stat_lic_prod_asso, duty_dbk_prod
"
"          WHERE     ddh_bu = p_bu
"
"                AND slpa_bu = ddh_bu
"
"                AND slpa_prod_id = c_prod_id
"
"                AND slpa_prod_rev = c_prod_rev
"
"                AND ddp_hsn_code = c_hsn_code
"
"                AND ddh_license_no = c_lic_no
"
"                AND ddh_bu = ddp_bu
"
"                AND ddh_doc_no = ddp_doc_no
"
"                AND ddh_status = 'P'
"
"                AND ddh_doc_type = 'A'
"
"                AND slpa_licence_type = 'DFIA'
"
"                AND ddh_license_no IS NOT NULL
"
"                AND ddh_meis_status = 'N'
"
"                AND (NVL (ddp_dfia_qty, 0) - (ddp_sales_qty)) > 0;
"
"
"
"
"
"
"
"      CURSOR c_ptc (
"
"         c_seq_no NUMBER)
"
"      IS
"
"         SELECT *
"
"           FROM sales_inv_serial_lot_no
"
"          WHERE     sisln_bu = p_bu
"
"                AND sisln_plnt = p_plnt
"
"                AND sisln_doc_no = p_doc_no
"
"                AND sisln_seq_no = c_seq_no
"
"                AND sisln_pigmnt_tc_doc_no IS NULL;
"
"
"
"      CURSOR c_str (
"
"         c_store_id    VARCHAR2,
"
"         c_prod_id     VARCHAR2,
"
"         c_prod_rev    NUMBER,
"
"         c_date        DATE)
"
"      IS
"
"         SELECT NVL (SUM (sttr_trans_qty), 0) sttr_trans_qty
"
"           FROM stock_trans
"
"          WHERE     sttr_bu = p_bu
"
"                AND sttr_store_id = c_store_id
"
"                AND sttr_prod_id = c_prod_id
"
"                AND sttr_prod_rev = c_prod_rev
"
"                AND sttr_bucket_type = 'QOH'
"
"                AND TRUNC (sttr_trans_date) <= TRUNC (c_date);
"
"
"
"      CURSOR c_stk (
"
"         c_store_id    VARCHAR2,
"
"         c_prod_id     VARCHAR2,
"
"         c_prod_rev    NUMBER)
"
"      IS
"
"         SELECT NVL (stock_qty_picked, 0) stock_qty_picked
"
"           FROM stocks
"
"          WHERE     stock_bu = p_bu
"
"                AND stock_store_id = c_store_id
"
"                AND stock_prod_id = c_prod_id
"
"                AND stock_prod_rev = c_prod_rev;
"
"
"
"      CURSOR c_bol
"
"      IS
"
"         SELECT sibol_rpermit_no
"
"           FROM sales_inv_bill_of_lading
"
"          WHERE     sibol_bu = p_bu
"
"                AND sibol_plnt = p_plnt
"
"                AND sibol_doc_no = p_doc_no;
"
"
"
"      CURSOR c_ac
"
"      IS
"
"         SELECT *
"
"           FROM appl_control
"
"          WHERE applctrl_bu = p_bu;
"
"
"
"      CURSOR c_aj (
"
"         c_inv_pfx    VARCHAR2,
"
"         c_inv_no     VARCHAR2)
"
"      IS
"
"         SELECT COUNT (*) v_cnt
"
"           FROM appl_journals
"
"          WHERE     aj_bu = p_bu
"
"                AND aj_plnt = p_plnt
"
"                AND aj_vou_pfx = c_inv_pfx
"
"                AND aj_vou_no = c_inv_no
"
"                AND aj_appl = 'SOM'
"
"                AND aj_vou_type IN ('SI','JWI');
"
"
"
"      CURSOR c_aj_amt (
"
"         c_inv_pfx    VARCHAR2,
"
"         c_inv_no     VARCHAR2)
"
"      IS
"
"         SELECT SUM (aj_bc_db_amt) db_amt, SUM (aj_bc_cr_amt) cr_amt
"
"           FROM appl_journals
"
"          WHERE     aj_bu = p_bu
"
"                AND aj_plnt = p_plnt
"
"                AND aj_vou_pfx = c_inv_pfx
"
"                AND aj_vou_no = c_inv_no;
"
"
"
"      CURSOR c10
"
"      IS
"
"         SELECT siplh_pck_ctn_prod_id
"
"           FROM sales_inv_pack_list_hd
"
"          WHERE     siplh_bu = p_bu
"
"                AND siplh_plnt = p_plnt
"
"                AND siplh_doc_no = p_doc_no;
"
"
"
"      CURSOR c11
"
"      IS
"
"           SELECT SUM (siln_inv_qty) inv_qty,siln_seq_no, siln_prod_id, siln_prod_rev
"
"             FROM sales_invoices_ln
"
"            WHERE     siln_bu = p_bu
"
"                  AND siln_plnt = p_plnt
"
"                  AND siln_doc_no = p_doc_no
"
"                  AND siln_matl_type = 'P'
"
"         GROUP BY siln_prod_id, siln_prod_rev,siln_seq_no;
"
"
"
"      CURSOR c12 (p_seq_no NUMBER,
"
"         p_prod_id     VARCHAR2,
"
"         p_prod_rev    VARCHAR2)
"
"      IS
"
"           SELECT SUM (sipli_no_of_ctn) pack_itm
"
"             FROM sales_inv_pack_list_item
"
"            WHERE     sipli_bu = p_bu
"
"                  AND sipli_plnt = p_plnt
"
"                  AND sipli_doc_no = p_doc_no
"
"                  AND sipli_ln_seq_no = p_seq_no
"
"                  AND sipli_prod_id = p_prod_id
"
"                  AND sipli_prod_rev = p_prod_rev
"
"         GROUP BY sipli_prod_id;
"
"
"
"      CURSOR c14 (
"
"         p_cust_id VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM suplr_ship_loc
"
"          WHERE     ssl_bu = p_bu
"
"                AND ssl_suplr_id = p_cust_id
"
"                AND ssl_dflt_flg IN ('D', 'B')
"
"                AND ssl_gst_no IS NOT NULL
"
"                AND SUBSTR (ssl_gst_no, 1, 2) <>
"
"                       (SELECT state_code
"
"                          FROM states
"
"                         WHERE state_id = ssl_state AND ssl_bu = state_bu);
"
"
"
"      CURSOR c15
"
"      IS
"
"         SELECT 1
"
"           FROM sales_inv_ship_addr
"
"          WHERE     sisa_bu = p_bu
"
"                AND sisa_plnt = p_plnt
"
"                AND sisa_doc_no = p_doc_no;
"
"
"
"      CURSOR c16
"
"      IS
"
"         SELECT *
"
"           FROM sales_inv_ship_addr, business_units
"
"          WHERE     sisa_bu = bu_id
"
"                AND sisa_bu = p_bu
"
"                AND sisa_plnt = p_plnt
"
"                AND sisa_doc_no = p_doc_no
"
"                AND (sisa_shipto_postal_code IS NULL
"
"                     OR sisa_billto_postal_code IS NULL);
"
"
"
"
"
"
"
"      CURSOR c17 (
"
"         p_contr_no       VARCHAR2,
"
"         p_class_id       VARCHAR2,
"
"         p_prod_id        VARCHAR2,
"
"         p_prod_rev       NUMBER,
"
"         p_sale_uom       VARCHAR2,
"
"         p_price_uom      VARCHAR2,
"
"         p_parent_cust    VARCHAR2,
"
"         p_cust_id        VARCHAR2)
"
"      IS
"
"         SELECT scdhd_hold_flag
"
"           FROM sales_contr_details_hd
"
"          WHERE     scdhd_bu = p_bu
"
"                AND scdhd_plnt = p_plnt
"
"                AND scdhd_contr_no = p_contr_no
"
"                AND scdhd_cust_id = NVL (p_parent_cust, p_cust_id)
"
"                AND scdhd_prod_id = p_prod_id
"
"                AND scdhd_prod_rev = p_prod_rev
"
"                AND scdhd_class_id = p_class_id
"
"                AND scdhd_price_uom = p_price_uom
"
"                AND scdhd_uom = p_sale_uom
"
"                AND (TRUNC (SYSDATE) BETWEEN scdhd_date_from
"
"                                         AND scdhd_date_to)
"
"                AND scdhd_status = 'A';
"
"
"
"
"
"      CURSOR c_ls (
"
"         c_seq_no NUMBER)
"
"      IS
"
"           SELECT sisln_seq_no, SUM (sisln_lot_qty) lot_ser_qty
"
"             FROM sales_inv_serial_lot_no
"
"            WHERE     sisln_bu = p_bu
"
"                  AND sisln_plnt = p_plnt
"
"                  AND sisln_doc_no = p_doc_no
"
"                  AND sisln_seq_no = c_seq_no
"
"         GROUP BY sisln_seq_no;
"
"
"
"        CURSOR c_dc (c_seq_no    NUMBER) IS
"
"        SELECT COUNT(1) cnt
"
"          FROM sales_invoices_ln,sales_inv_cust_dc_mat_cons
"
"         WHERE siln_bu = sicdmc_bu
"
"           AND siln_plnt = sicdmc_plnt
"
"           AND siln_doc_no = sicdmc_doc_no
"
"           AND siln_seq_no = c_seq_no
"
"           AND sicdmc_bu = p_bu
"
"           AND sicdmc_plnt = p_plnt
"
"           AND sicdmc_doc_no = p_doc_no;
"
"
"
"        CURSOR c_dc_cons(c_seq_no    NUMBER) IS
"
"        SELECT COUNT(1) cnt
"
"          FROM sales_invoices_ln,sales_inv_cust_dc_mat_cons
"
"         WHERE siln_bu = sicdmc_bu
"
"           AND siln_plnt = sicdmc_plnt
"
"           AND siln_doc_no = sicdmc_doc_no
"
"           AND siln_dc_short_flag = 'N'
"
"           AND siln_seq_no = c_seq_no
"
"           AND sicdmc_bu = p_bu
"
"           AND sicdmc_plnt = p_plnt
"
"           AND sicdmc_doc_no = p_doc_no
"
"           AND sicdmc_dc_no IS NULL
"
"           AND sicdmc_cons_qty > 0;
"
"
"
"      r_aj_amt           c_aj_amt%ROWTYPE;
"
"      r_aj               c_aj%ROWTYPE;
"
"
"
"      r_ac               c_ac%ROWTYPE;
"
"      r_bol              c_bol%ROWTYPE;
"
"
"
"      r_str              c_str%ROWTYPE;
"
"      r_stk              c_stk%ROWTYPE;
"
"      r_ptc              c_ptc%ROWTYPE;
"
"
"
"
"
"
"
"      r_db               c_db%ROWTYPE;
"
"      cr0                c0%ROWTYPE;
"
"      cr7                c7%ROWTYPE;
"
"      cr9                c9%ROWTYPE;
"
"      cr13               c13%ROWTYPE;
"
"      cr10               c10%ROWTYPE;
"
"      cr11               c11%ROWTYPE;
"
"      cr12               c12%ROWTYPE;
"
"      cr14               c14%ROWTYPE;
"
"      cr15               c15%ROWTYPE;
"
"      cr16               c16%ROWTYPE;
"
"      cr17               c17%ROWTYPE;
"
"
"
"      r_dc_cons         c_dc_cons%ROWTYPE;
"
"      r_dc              c_dc%ROWTYPE;
"
"
"
"      v_cust_po_no_cnt   NUMBER;
"
"      v_cust_po_dt_cnt   NUMBER;
"
"      v_ref              VARCHAR2 (5000);
"
"      var_trans_qty      NUMBER;
"
"      v_jrnl_cnt         NUMBER;
"
"      on_hand            NUMBER;
"
"      pick_qty           NUMBER;
"
"      rnd                NUMBER;
"
"      var_post_flag      VARCHAR2 (1);
"
"      var_res            VARCHAR2 (100);
"
"      v_wf_type          VARCHAR2 (100);
"
"      v_jrnl_flag        VARCHAR2 (10);
"
"      v_ship_set_cnt     NUMBER;
"
"      var_res1           VARCHAR2 (1);
"
"      v_pto_count        NUMBER;
"
"
"
"      post_alert         NUMBER;
"
"      var_post_flag1     VARCHAR2 (1) := 'N';
"
"      var_cnt_disc       NUMBER;
"
"      var_sum_duepct     NUMBER;
"
"      var_sum_dueamt     NUMBER;
"
"      var_isum_duepct    NUMBER;
"
"      var_dsum_dueamt    NUMBER;
"
"      var_dsum_duepct    NUMBER;
"
"      var_isum_dueamt    NUMBER;
"
"      rnd1               NUMBER;
"
"      var_due_amount     NUMBER := 0;
"
"      p_flag             VARCHAR2 (10) := 'N';
"
"      p_dc_no            VARCHAR2 (15);
"
"      v_ln_amount        NUMBER (15, 3);
"
"      v_tax_amt          NUMBER (15, 3);
"
"      v_mat_amount       NUMBER (15, 3);
"
"      v_year             NUMBER;
"
"      v_period           NUMBER;
"
"      v_class_cnt        NUMBER := 0;
"
"      v_inv_no           VARCHAR2 (20);
"
"      v_depb_count       NUMBER;
"
"      v_fa_count         NUMBER;
"
"      var_inv_type       VARCHAR2 (50);
"
"      var_res2           VARCHAR2 (50);
"
"      var_cnt_ps         NUMBER;
"
"      v_dtax_amt         NUMBER := 0;
"
"      var_amda_cnt       NUMBER := 0;
"
"      var_appr_cnt       NUMBER;
"
"      var_mat_rnd        NUMBER;
"
"      var_stk_item_cnt   NUMBER;
"
"      v_cnt              NUMBER;
"
"      v_gen_ls_res       VARCHAR2(1);
"
"      v_batch_tot_amt    NUMBER;
"
"      v_chk_lot_ser_qty  NUMBER;
"
"
"
"      v_dc_pfx           VARCHAR2(10);
"
"      v_dc_ctrl_mode    VARCHAR2(1);
"
"      v_dc_type         VARCHAR2(10);
"
"      v_pfx             VARCHAR2(10);
"
"
"
"   BEGIN
"
"      OPEN c7;
"
"
"
"      FETCH c7 INTO cr7;
"
"
"
"      CLOSE c7;
"
"
"
"      OPEN c0;
"
"
"
"      FETCH c0 INTO cr0;
"
"
"
"      CLOSE c0;
"
"
"
"
"
"
"
"      OPEN c10;
"
"
"
"      FETCH c10 INTO cr10;
"
"
"
"      FOR cr11 IN c11
"
"      LOOP
"
"         OPEN c12 (cr11.siln_seq_no,cr11.siln_prod_id, cr11.siln_prod_rev);
"
"
"
"         FETCH c12 INTO cr12;
"
"
"
"         CLOSE c12;
"
"
"
"         IF cr11.inv_qty <> cr12.pack_itm
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'Sum of invoice qty. mismatch with sum of packing qty. for the Line.. '||'~'||cr11.siln_seq_no||'/'||cr11.inv_qty||'/'||cr12.pack_itm );
"
"         END IF;
"
"      END LOOP;
"
"
"
"      CLOSE c10;
"
"
"
"      OPEN c13;
"
"
"
"      FETCH c13 INTO cr13;
"
"
"
"
"
"
"
"      IF c13%NOTFOUND
"
"      THEN
"
"         raise_application_error (-20999,
"
"                                  'APX' || 'Line Details must be Entered.');
"
"      END IF;
"
"
"
"      CLOSE c13;
"
"
"
"      OPEN c9;
"
"
"
"      FETCH c9 INTO cr9;
"
"      IF cr7.sihd_gst_reg_type IN ('R', 'C')
"
"         AND cr9.sisa_billto_gst_no IS NULL
"
"      THEN
"
"         raise_application_error (-20999, 'APX' || 'GST No. cannot be null');
"
"      END IF;
"
"
"
"      CLOSE c9;
"
"
"
"      IF cr7.sihd_exc_inv_pfx IS NULL
"
"         AND cr7.sihd_currency <> func_find_base_currency (p_bu)
"
"      THEN
"
"         raise_application_error (-20999, 'Invoice Pfx. must be entered.');
"
"      END IF;
"
"
"
"      IF cr0.somctrl_si_cust_po_rqrd = 'Y'
"
"      THEN
"
"         SELECT COUNT (*)
"
"           INTO v_cust_po_no_cnt
"
"           FROM sales_invoices_ln
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_plnt
"
"                AND siln_doc_no = p_doc_no
"
"                AND siln_promotion_flag IN ('N', 'T', 'P')
"
"                AND siln_matl_type = 'P'
"
"                AND siln_cust_po_no IS NULL;
"
"
"
"         IF v_cust_po_no_cnt > 0
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'APX' || 'Customer PO No. in line level must be entered.');
"
"         END IF;
"
"
"
"         SELECT COUNT (*)
"
"           INTO v_cust_po_dt_cnt
"
"           FROM sales_invoices_ln
"
"          WHERE     siln_bu = p_bu
"
"                AND siln_plnt = p_plnt
"
"                AND siln_doc_no = p_doc_no
"
"                AND siln_promotion_flag IN ('N', 'T', 'P')
"
"                 AND siln_matl_type = 'P'
"
"                AND siln_cust_po_date IS NULL;
"
"
"
"         IF v_cust_po_dt_cnt > 0
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'APX' || 'Customer PO Date in line level must be entered.');
"
"         END IF;
"
"      END IF;
"
"
"
"      FOR cr13 IN c13
"
"      LOOP
"
"         IF cr13.siln_matl_type = 'P' AND cr13.siln_proj_lvl_id IS NULL
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"                  'APX'
"
"               || 'Project level not defined for line no.'
"
"               || '-'
"
"               || cr13.siln_seq_no);
"
"         END IF;
"
"      END LOOP;
"
"
"
"      IF cr7.sihd_ap_ar_doc_cls IS NULL AND cr7.sihd_type <> 'SIRC'
"
"      THEN
"
"         raise_application_error (-20999,
"
"                                  'APX' || 'AP/AR class must be entered.');
"
"      END IF;
"
"
"
"
"
"      OPEN c7;
"
"
"
"      FETCH c7 INTO cr7;
"
"
"
"      CLOSE c7;
"
"
"
"
"
"
"
"      IF cr7.sihd_upd_chrg_flag = 'N'
"
"      THEN
"
"         proc_ins_si_oth_tax_chrgs (p_bu,
"
"                                    p_plnt,
"
"                                    p_doc_no,
"
"                                    p_user);
"
"
"
"         COMMIT;
"
"      END IF;
"
"
"
"      IF cr7.sihd_status = 'N' AND cr7.sihd_comm_tax_inv_flag = 'E'
"
"      THEN
"
"
"
"         IF cr7.sihd_type IN
"
"               ('SIG',
"
"                'SIDE',
"
"                'SIFS',
"
"                'SIFR',
"
"                'LO',
"
"                'TP',
"
"                'SIT',
"
"                'LI',
"
"                'RB',
"
"                'SE',
"
"                'IR',
"
"                'JWIG','IS')
"
"            AND cr7.sihd_status <> 'P'
"
"            AND cr7.sihd_comm_tax_inv_flag = 'E'
"
"         THEN
"
"            pkg_si_invoice_web_som1090.proc_si_pick_det_web (p_bu,
"
"                                  p_user,
"
"                                  p_plnt,
"
"                                  p_doc_no);
"
"         END IF;
"
"      END IF;
"
"
"
"      IF cr7.sihd_status = 'N' AND cr7.sihd_type = 'SISCR' THEN
"
"
"
"         UPDATE sales_invoices_ln
"
"            SET siln_gen_ls_flag = 'N'
"
"          WHERE siln_bu = p_bu
"
"            AND siln_plnt = p_plnt
"
"            AND siln_doc_no = p_doc_no;
"
"
"
"        proc_ins_lot_serial(p_bu,p_plnt,p_doc_no,p_user,v_gen_ls_res);
"
"
"
"        IF v_gen_ls_res = 'Y' THEN
"
"
"
"          FOR r_ln IN (SELECT siln_seq_no,siln_inv_qty
"
"                         FROM sales_invoices_ln
"
"                        WHERE siln_bu = p_bu
"
"                          AND siln_plnt = p_plnt
"
"                          AND siln_doc_no = p_doc_no
"
"                          AND siln_matl_type = 'P'
"
"                          AND siln_sf_code IS NULL)
"
"          LOOP
"
"            SELECT SUM (sicb_trans_qty * sicb_unit_cost)
"
"              INTO v_batch_tot_amt
"
"              FROM sales_inv_cost_batch
"
"             WHERE     sicb_bu = p_bu
"
"                   AND sicb_plnt = p_plnt
"
"                   AND sicb_doc_no = p_doc_no
"
"                   AND sicb_seq_no = r_ln.siln_seq_no;
"
"
"
"            UPDATE sales_invoices_ln
"
"               SET siln_unit_cost =
"
"                      NVL (NVL (v_batch_tot_amt, 0) / r_ln.siln_inv_qty, 0)
"
"             WHERE     siln_bu = p_bu
"
"                   AND siln_plnt = p_plnt
"
"                   AND siln_doc_no = p_doc_no
"
"                   AND siln_seq_no = r_ln.siln_seq_no;
"
"          END LOOP;
"
"        END IF;
"
"
"
"        FOR r_ln IN (SELECT siln_seq_no,siln_matl_type,prod_stocked,prod_cost_method,prod_ser_lot_opt,siln_inv_qty,siln_conv_factor,siln_stk_inv_qty
"
"                       FROM sales_invoices_ln, products
"
"                      WHERE siln_bu = prod_bu
"
"                        AND siln_prod_id = prod_id
"
"                        AND siln_prod_rev = prod_rev
"
"                        AND siln_bu = p_bu
"
"                        AND siln_plnt = p_plnt
"
"                        AND siln_doc_no = p_doc_no
"
"                        AND siln_matl_type = 'P'
"
"                        AND prod_stocked = 'Y'
"
"                        AND siln_sf_code IS NULL)
"
"        LOOP
"
"
"
"          IF r_ln.prod_ser_lot_opt IN ('S', 'O', 'L', 'B') THEN
"
"
"
"            SELECT COUNT (*)
"
"              INTO v_chk_lot_ser_qty
"
"              FROM sales_inv_serial_lot_no
"
"             WHERE sisln_bu = p_bu
"
"               AND sisln_plnt = p_plnt
"
"               AND sisln_doc_no = p_doc_no
"
"               AND sisln_seq_no = r_ln.siln_seq_no;
"
"
"
"            IF NVL (v_chk_lot_ser_qty, 0) = 0 THEN
"
"             raise_application_error (
"
"                -20999,
"
"                'Lot/Serial Detail must be entered.');
"
"            END IF;
"
"
"
"            FOR r_ls IN c_ls (r_ln.siln_seq_no)
"
"            LOOP
"
"              IF ROUND (
"
"                   NVL ( (r_ln.siln_inv_qty / r_ln.siln_conv_factor),
"
"                        0),
"
"                   3) <> NVL (r_ls.lot_ser_qty, 0) THEN
"
"                raise_application_error (
"
"                   -20999,
"
"                   'Lot/Serial Qty must match with the Invoice Qty');
"
"               END IF;
"
"            END LOOP;
"
"          END IF;
"
"
"
"          IF r_ln.prod_cost_method IN ('FIFO', 'LIFO') THEN
"
"
"
"            SELECT NVL (SUM (sicb_trans_qty), 0)
"
"              INTO v_chk_lot_ser_qty
"
"              FROM sales_inv_cost_batch
"
"             WHERE sicb_bu = p_bu
"
"               AND sicb_plnt = p_plnt
"
"               AND sicb_doc_no = p_doc_no
"
"               AND sicb_seq_no = r_ln.siln_seq_no;
"
"
"
"                  IF v_chk_lot_ser_qty <> ROUND ( (r_ln.siln_stk_inv_qty), 3)
"
"                  THEN
"
"                     raise_application_error (
"
"                        -20999,
"
"                           'Batch details not generated for the line.'
"
"                        || '-'
"
"                        || r_ln.siln_seq_no);
"
"                  END IF;
"
"          END IF;
"
"
"
"        END LOOP;
"
"      END IF;
"
"
"
"
"
"      IF cr7.sihd_type IN ('JWIG') THEN
"
"        proc_gen_sales_inv_cust_dc(p_bu,
"
"                                   p_plnt,
"
"                                   p_plnt,
"
"                                   p_doc_no,
"
"                                   p_user
"
"                                  );
"
"
"
"       FOR r_ln IN (SELECT *
"
"                      FROM sales_invoices_ln
"
"                     WHERE siln_bu = p_bu
"
"                       AND siln_plnt = p_plnt
"
"                       AND siln_doc_no = p_doc_no
"
"                       AND siln_matl_type = 'P')
"
"       LOOP
"
"
"
"         OPEN c_dc(r_ln.siln_seq_no);
"
"         FETCH c_dc INTO r_dc;
"
"           IF r_dc.cnt = 0 AND r_ln.siln_dc_short_flag = 'N'THEN
"
"             Raise_Application_Error(-20999,'DC Consumption must be created');
"
"           ELSE
"
"             OPEN c_dc_cons(r_ln.siln_seq_no);
"
"             FETCH c_dc_cons INTO r_dc_cons;
"
"               IF r_dc_cons.cnt > 0 THEN
"
"                 Raise_Application_Error(-20999,'Cust. DC Consumption not found');
"
"               END IF;
"
"              CLOSE c_dc_cons;
"
"           END IF;
"
"         CLOSE c_dc;
"
"
"
"       END LOOP;
"
"      END IF;
"
"
"
"      OPEN c7;
"
"
"
"      FETCH c7 INTO cr7;
"
"
"
"      CLOSE c7;
"
"
"
"
"
"      IF cr7.sihd_inv_no IS NULL
"
"      THEN
"
"         ---start of proc_cre_inv_no------;
"
"         proc_si_cre_inv_web (p_bu,
"
"                              p_plnt,
"
"                              p_doc_no,
"
"                              p_user);
"
"      ---end of proc_cre_inv_no------;
"
"      END IF;
"
"
"
"      /*--------------START proc_upd_narration--------------------*/
"
"      OPEN c7;
"
"
"
"      FETCH c7 INTO cr7;
"
"
"
"        CLOSE c7;
"
"
"
"
"
"      IF cr7.sihd_ref1 IS NULL
"
"      THEN
"
"         FOR r_ln
"
"            IN (  SELECT siln_prod_desc1, SUM (siln_inv_qty) siln_inv_qty
"
"                    FROM sales_invoices_ln
"
"                   WHERE     siln_bu = p_bu
"
"                         AND siln_plnt = p_plnt
"
"                         AND siln_doc_no = p_doc_no
"
"                GROUP BY siln_seq_no, siln_prod_desc1
"
"                ORDER BY siln_seq_no)
"
"         LOOP
"
"
"
"            IF v_ref IS NULL
"
"            THEN
"
"               v_ref :=
"
"                  r_ln.siln_prod_desc1 || '(' || r_ln.siln_inv_qty || ')';
"
"            ELSE
"
"               v_ref :=
"
"                     v_ref
"
"                  || ','
"
"                  || r_ln.siln_prod_desc1
"
"                  || '('
"
"                  || r_ln.siln_inv_qty
"
"                  || ')';
"
"            END IF;
"
"
"
"
"
"
"
"         END LOOP;
"
"
"
"         IF cr7.sihd_type IN ('PR', 'NS', 'NN', 'NO')
"
"         THEN
"
"            v_ref := 'PURCHASE RETURN OF ' || v_ref;
"
"         ELSIF cr7.sihd_type IN ('NT')
"
"         THEN
"
"            v_ref := 'STOCK TRANSFER PURCHASE RETURN OF ' || v_ref;
"
"         ELSIF cr7.sihd_type IN ('SC', 'SW', 'SP')
"
"         THEN
"
"            v_ref := 'SUBCONTRACT RETURN OF ' || v_ref;
"
"         ELSIF cr7.sihd_type IN
"
"                  ('SR',
"
"                   'SG',
"
"                   'RL',
"
"                   'RS',
"
"                   'LR',
"
"                   'SN',
"
"                   'RV',
"
"                   'RY',
"
"                   'RH',
"
"                   'DR',
"
"                   'RU')
"
"         THEN
"
"            v_ref := 'SALES RETURN OF ' || v_ref;
"
"         ELSIF cr7.sihd_type IN
"
"                  ('SIG',
"
"                   'SIT',
"
"                   'TP',
"
"                   'SISUP',
"
"                   'SISCR',
"
"                   'LO',
"
"                   'LI',
"
"                   'RB',
"
"                   'SIS',
"
"                   'IS',
"
"                   'PI',
"
"                   'DP',
"
"                   'SIDE',
"
"                   'SIFA',
"
"                   'SIFR',
"
"                   'SIFS',
"
"           'SIRC',
"
"                   'IV',
"
"                   'IC',
"
"                   'OH',
"
"                   'SE',
"
"                   'IR',
"
"                   'JWIG')
"
"         THEN
"
"            v_ref := 'SALES OF ' || v_ref;
"
"         END IF;
"
"
"
"         IF LENGTH (v_ref) > 450
"
"         THEN
"
"            v_ref := SUBSTR (v_ref, 1, 450);
"
"         END IF;
"
"
"
"         UPDATE sales_invoices_hd
"
"            SET sihd_ref1 = v_ref
"
"          WHERE     sihd_bu = p_bu
"
"                AND sihd_plant = p_plnt
"
"                AND sihd_doc_no = p_doc_no;
"
"      END IF;
"
"
"
"      OPEN c7;
"
"
"
"      FETCH c7 INTO cr7;
"
"
"
"      CLOSE c7;
"
"
"
"      /*--------------END proc_upd_narration--------------------*/
"
"      IF cr7.sihd_jrnl_flag = 'N' AND cr7.sihd_type <> 'SIRC'
"
"      THEN
"
"         --start of proc_cre_sales_inv_jrnl------;
"
"         v_jrnl_flag := 'Y';
"
"         proc_si_journal_web (p_bu,
"
"                              cr7.sihd_cust_id,
"
"                              v_jrnl_flag,
"
"                              p_plnt,
"
"                              p_doc_no,
"
"                              p_user,
"
"                              p_lang);
"
"      --end  of proc_cre_sales_inv_jrnl------;
"
"      END IF;
"
"
"
"
"
"      OPEN c7;
"
"
"
"      FETCH c7 INTO cr7;
"
"
"
"      CLOSE c7;
"
"
"
"      IF cr7.sihd_exc_inv_no IS NOT NULL
"
"      THEN
"
"         OPEN c14 (cr7.sihd_cust_id);
"
"
"
"         FETCH c14 INTO cr14;
"
"
"
"         IF c14%FOUND
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'First two digit GST No. must be equal to State code.');
"
"         END IF;
"
"
"
"         CLOSE c14;
"
"      END IF;
"
"
"
"      IF cr7.sihd_doc_no IS NOT NULL
"
"      THEN
"
"         OPEN c15;
"
"
"
"         FETCH c15 INTO cr15;
"
"
"
"         IF c15%NOTFOUND
"
"         THEN
"
"            raise_application_error (-20999, 'Address must be entered.');
"
"         END IF;
"
"
"
"         CLOSE c15;
"
"      END IF;
"
"
"
"      IF    cr7.sihd_shipto_loc_name IS NULL
"
"         OR cr7.sihd_billto_loc_name IS NULL
"
"         OR cr7.sihd_billfrm_loc_name IS NULL
"
"         OR cr7.sihd_shipfrm_loc_name IS NULL
"
"      THEN
"
"         raise_application_error (-20999,
"
"                                  'APX' || 'Location must be entered.');
"
"      END IF;
"
"
"
"      IF    cr7.sihd_shipto_loc_name IS NULL
"
"         OR cr7.sihd_billto_loc_name IS NULL
"
"         OR cr7.sihd_billfrm_loc_name IS NULL
"
"         OR cr7.sihd_shipfrm_loc_name IS NULL
"
"      THEN
"
"         raise_application_error (-20999,
"
"                                  'APX' || 'Location must be entered.');
"
"      END IF;
"
"
"
"      FOR cr13 IN c13
"
"      LOOP
"
"
"
"         IF     cr13.siln_gst_exempt_flag NOT IN ('A', 'Y')
"
"            AND cr13.siln_gst_input_type <> 'A'
"
"            AND cr13.siln_hsn_code IS NULL
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"                  'APX'
"
"               || 'HSN code not defined for line no.'
"
"               || '-'
"
"               || cr13.siln_seq_no);
"
"         END IF;
"
"      END LOOP;
"
"
"
"      IF cr7.sihd_type = 'DP'
"
"      THEN
"
"         IF cr7.sihd_currency <> func_find_base_currency (p_bu)
"
"         THEN
"
"            raise_application_error (
"
"               -20999,
"
"               'APX' || 'License is not saleable for foreign customers.');
"
"         END IF;
"
"
"
"         FOR cr13 IN c13
"
"         LOOP
"
"            OPEN c_db (cr13.siln_prod_id,
"
"                       cr13.siln_prod_rev,
"
"                       cr13.siln_hsn_code,
"
"                       cr13.siln_meis_lic_no);
"
"
"
"            FETCH c_db INTO r_db;
"
"
"
"            IF c_db%FOUND AND cr13.siln_inv_qty > r_db.ddp_bal_qty
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                  'APX'
"
"                  || 'Quantity should not be greater than duty drawback quantity for line.'
"
"                  || '-'
"
"                  || cr13.siln_seq_no);
"
"            END IF;
"
"
"
"            CLOSE c_db;
"
"         END LOOP;
"
"      END IF;
"
"
"
"
"
"      OPEN c16;
"
"
"
"      FETCH c16 INTO cr16;
"
"
"
"      IF     c16%FOUND
"
"         AND cr16.bu_country = cr16.sisa_billto_cntry
"
"         AND cr7.sihd_gst_reg_type = 'R'
"
"      THEN
"
"         raise_application_error (
"
"            -20999,
"
"            'Ship or Bill address PINCODE should not be null.');
"
"      END IF;
"
"
"
"      CLOSE c16;
"
"
"
"      proc_upd_sales_invoice_amount (p_bu, p_plnt, p_doc_no);
"
"
"
"      SELECT COUNT (*)
"
"        INTO v_cnt
"
"        FROM sales_invoices_ln
"
"       WHERE siln_bu = p_bu AND siln_plnt = p_plnt AND siln_doc_no = p_doc_no;
"
"
"
"      IF v_cnt <= 0
"
"      THEN
"
"         raise_application_error (-20999, 'Line Details must be Entered.');
"
"      END IF;
"
"
"
"
"
"
"
"      IF cr7.sihd_ref1 IS NULL
"
"      THEN
"
"         raise_application_error (-20999, 'Narration must be entered.');
"
"      END IF;
"
"
"
"      proc_upd_sales_invoice_amount (p_bu, p_plnt, p_doc_no);
"
"
"
"
"
"      BEGIN
"
"
"
"        SELECT dcctrl_mode
"
"          INTO v_dc_ctrl_mode
"
"          FROM dc_control
"
"         WHERE dcctrl_bu = p_bu
"
"           AND dcctrl_doc_type = 'SO';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20747,'ICM'||'~'||p_bu||'~'||'SO');
"
"      END;
"
"
"
"      IF v_dc_ctrl_mode = 'A' AND cr7.sihd_type NOT IN ('SIS','DP','PI','SIFA','SISUP','NN','SC','SP','IV','IC',
"
"                                                        'OH','RH','RV','RY','CR','LW','LS','SR','SG') THEN
"
"
"
"         IF cr7.sihd_type IN ('PR', 'NS', 'NN', 'NT', 'NO', 'SW')
"
"         THEN
"
"            v_dc_type := 'DCPRTN';
"
"         ELSIF cr7.sihd_type = 'SM'
"
"         THEN
"
"            v_dc_type := 'DCSI';
"
"         ELSE
"
"            v_dc_type := 'DCSI';
"
"         END IF;
"
"
"
"        v_dc_pfx := func_find_dc_pfx(p_bu,p_plnt,cr7.sihd_plnt_loc_id,v_dc_type);
"
"
"
"      END IF;
"
"      --- Start Last Add Code ---
"
"      IF cr7.sihd_inv_no IS NULL
"
"         OR cr7.sihd_inv_no IS NOT NULL AND cr7.sihd_status <> 'I'
"
"      THEN
"
"         IF cr7.sihd_currency <> func_find_base_currency (p_bu)
"
"         THEN
"
"            rnd := func_find_currency_dec1 (p_bu, cr7.sihd_currency);
"
"         ELSE
"
"            rnd := func_find_contr_rnddigit (p_bu, cr7.sihd_cust_id);
"
"         END IF;
"
"
"
"         var_mat_rnd := func_find_currency_dec1 (p_bu, cr7.sihd_currency);
"
"
"
"         IF cr7.sihd_type NOT IN ('PR', 'SISUP', 'NT')
"
"         THEN
"
"            SELECT COUNT (*)
"
"              INTO v_class_cnt
"
"              FROM sales_invoices_ln
"
"             WHERE     siln_bu = p_bu
"
"                   AND siln_plnt = p_plnt
"
"                   AND siln_doc_no = p_doc_no
"
"                   AND siln_class IS NULL
"
"                    AND siln_matl_type = 'P';
"
"
"
"            IF v_class_cnt > 0
"
"            THEN
"
"               raise_application_error (-20999,
"
"                                        'Item Class must be entered.');
"
"            END IF;
"
"
"
"            FOR cr13 IN c13
"
"            LOOP
"
"               OPEN c17 (cr13.siln_conract_no,
"
"                         cr13.siln_sales_price_class,
"
"                         cr13.siln_prod_id,
"
"                         cr13.siln_prod_rev,
"
"                         cr13.siln_uom,
"
"                         cr13.siln_price_uom,
"
"                         cr7.sihd_parent_cust_id,
"
"                         cr7.sihd_cust_id);
"
"
"
"               FETCH c17 INTO cr17;
"
"
"
"               IF cr17.scdhd_hold_flag = 'Y'
"
"               THEN
"
"                  raise_application_error (-20999,
"
"                                           'Open Sales Order is on hold.');
"
"               END IF;
"
"
"
"               CLOSE c17;
"
"            END LOOP;
"
"
"
"            IF cr7.sihd_plant IS NULL
"
"            THEN
"
"               raise_application_error (-20999, 'Unit must be entered.');
"
"            END IF;
"
"
"
"            SELECT COUNT (*)
"
"              INTO var_due_amount
"
"              FROM sales_invoices_pay_due
"
"             WHERE     sipd_bu = p_bu
"
"                   AND sipd_plnt = p_plnt
"
"                   AND sipd_doc_no = p_doc_no;
"
"
"
"
"
"            /*  Counting the number of values in sales_invoices_pay_due for only term_due type also
"
"                    Calculating the sum of due percentage and sum of due amount in current document values */
"
"            SELECT COUNT (*), NVL (SUM (sipd_due_amt), 0)
"
"              INTO var_cnt_disc, var_sum_dueamt
"
"              FROM sales_invoices_pay_due
"
"             WHERE     sipd_bu = p_bu
"
"                   AND sipd_plnt = p_plnt
"
"                   AND sipd_doc_no = p_doc_no
"
"                   AND sipd_due_type = 'TD';
"
"
"
"            /*  Calculating the sum of due percentage and sum of due amount from sales_invoices_pay_due for current document values
"
"                    and due type like Invoice Due  */
"
"            SELECT NVL (SUM (sipd_due_amt), 0)
"
"              INTO var_isum_dueamt
"
"              FROM sales_invoices_pay_due
"
"             WHERE     sipd_bu = p_bu
"
"                   AND sipd_plnt = p_plnt
"
"                   AND sipd_doc_no = p_doc_no
"
"                   AND sipd_due_type = 'ID';
"
"
"
"
"
"            /*  Calculating the sum of due percentage and sum of due amount from sales_invoices_pay_due for current document values
"
"                    and due type like Discount Due  */
"
"            SELECT NVL (SUM (sipd_due_amt), 0)
"
"              INTO var_dsum_dueamt
"
"              FROM sales_invoices_pay_due
"
"             WHERE     sipd_bu = p_bu
"
"                   AND sipd_plnt = p_plnt
"
"                   AND sipd_doc_no = p_doc_no
"
"                   AND sipd_due_type = 'DD';
"
"
"
"
"
"            IF cr7.sihd_exc_inv_date IS NULL
"
"            THEN
"
"               raise_application_error (-20999,
"
"                                        'Invoice Date must be entered.');
"
"            END IF;
"
"
"
"
"
"              SELECT ROUND (
"
"                           (NVL (
"
"                               SUM (
"
"                                  CASE
"
"                                     WHEN sihd_sal_ret_type = 'CM'
"
"                                     THEN
"
"                                        NVL (
"
"                                           SUM (
"
"                                              (CASE
"
"                                                  WHEN siln_cr_dr = 'DR' THEN 1
"
"                                                  ELSE -1
"
"                                               END)
"
"                                              * ( ( CASE WHEN siln_reverse_tax_flag = 'Y' THEN ( (ROUND ((siln_inv_qty * siln_price),3) - (  siln_disc_amt + siln_spl_disc_amt + siln_cash_disc_amt)) - (CASE WHEN siln_cust_tax_charge_flag = 'Y' THEN (siln_igst_amt + siln_sgst_amt + siln_cgst_amt + siln_utgst_amt + siln_cess_amt) ELSE 0 END))
"
"                                                    ELSE (ROUND (
"
"                                                        (siln_inv_qty
"
"                                                         * siln_price),3)
"
"                                                     - (  siln_disc_amt
"
"                                                        + siln_spl_disc_amt
"
"                                                        + siln_cash_disc_amt)) END
"
"                                                        ))),
"
"                                           0)
"
"                                     ELSE
"
"                                        NVL (
"
"                                           SUM (
"
"                                              (CASE
"
"                                                  WHEN siln_cr_dr = 'CR' THEN 1
"
"                                                  ELSE -1
"
"                                               END)
"
"                                              * ( ( CASE WHEN siln_reverse_tax_flag = 'Y' THEN ( (ROUND ((siln_inv_qty * siln_price),3) - (  siln_disc_amt + siln_spl_disc_amt + siln_cash_disc_amt)) - (CASE WHEN siln_cust_tax_charge_flag = 'Y' THEN (siln_igst_amt + siln_sgst_amt + siln_cgst_amt + siln_utgst_amt + siln_cess_amt) ELSE 0 END))
"
"                                              ELSE (ROUND (
"
"                                                        (siln_inv_qty
"
"                                                         * siln_price),
"
"                                                        3)
"
"                                                     - (  siln_disc_amt
"
"                                                        + siln_spl_disc_amt
"
"                                                        + siln_cash_disc_amt)) END
"
"                                                        ))),
"
"                                           0)
"
"                                  END),
"
"                               0)),
"
"                           2)
"
"                INTO v_mat_amount
"
"                FROM sales_invoices_hd, sales_invoices_ln
"
"               WHERE     sihd_bu = siln_bu
"
"                     AND sihd_plant = siln_plnt
"
"                     AND sihd_doc_no = siln_doc_no
"
"                     AND siln_bu = p_bu
"
"                     AND siln_plnt = p_plnt
"
"                     AND siln_doc_no = p_doc_no
"
"                     AND siln_matl_type NOT IN ('O')
"
"                     AND (sihd_type = 'IF'
"
"                          OR (sihd_type <> 'IF'
"
"                              AND siln_promotion_flag IN ('T', 'N')))
"
"            GROUP BY sihd_sal_ret_type;
"
"
"
"            IF NVL (v_mat_amount, 0) <> NVL (cr7.sihd_net_amt, 0)
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                  'Material amount mismatch with Total Material amount.');
"
"            END IF;
"
"
"
"            IF cr7.sihd_type IN ('DP')
"
"            THEN
"
"               SELECT COUNT (*)
"
"                 INTO v_depb_count
"
"                 FROM sales_invoices_ln
"
"                WHERE     siln_bu = p_bu
"
"                      AND siln_plnt = p_plnt
"
"                      AND siln_doc_no = p_doc_no
"
"                      AND siln_meis_lic_no IS NULL;
"
"
"
"               IF v_depb_count > 0
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'License details must be entered.');
"
"               END IF;
"
"            END IF;
"
"
"
"
"
"            SELECT NVL ( (SUM (ROUND ( ( (siln_inv_qty) * siln_price), 3))),
"
"                        0)
"
"                   - NVL (
"
"                        (SUM (
"
"                            ROUND (
"
"                               (  (siln_inv_qty)
"
"                                * siln_price
"
"                                * siln_disc_pct
"
"                                / 100),
"
"                               3))),
"
"                        0)
"
"              INTO v_ln_amount
"
"              FROM sales_invoices_ln
"
"             WHERE     siln_bu = p_bu
"
"                   AND siln_plnt = p_plnt
"
"                   AND siln_doc_no = p_doc_no
"
"                   AND siln_promotion_flag IN ('N', 'T');
"
"
"
"
"
"            SELECT NVL (SUM ( ( (tc_amt))), 0)
"
"              INTO v_tax_amt
"
"              FROM (SELECT SUM (
"
"                              (  siln_igst_amt
"
"                               + siln_sgst_amt
"
"                               + siln_cgst_amt
"
"                               + siln_utgst_amt
"
"                               + siln_cess_amt))
"
"                              tc_amt
"
"                      FROM sales_invoices_ln
"
"                     WHERE     siln_bu = p_bu
"
"                           AND siln_plnt = p_plnt
"
"                           AND siln_doc_no = p_doc_no
"
"                           AND siln_cust_tax_charge_flag = 'Y');
"
"
"
"
"
"
"
"            IF NVL (v_tax_amt, 0) + NVL (v_dtax_amt, 0) <>
"
"                  NVL (cr7.sihd_tax_amt, 0)
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                  'Tax amount mismatch with Total Tax amount.');
"
"            END IF;
"
"
"
"
"
"
"
"            IF cr7.sihd_tot_amt <> var_sum_dueamt
"
"            THEN
"
"               raise_application_error (
"
"                  -20999,
"
"                  'Due amount mismatch with document amount.');
"
"            END IF;
"
"
"
"
"
"
"
"            FOR dpb IN (SELECT siln_depb_pct, siln_depb_flag
"
"                          FROM sales_invoices_ln
"
"                         WHERE siln_bu = p_bu AND siln_doc_no = p_doc_no)
"
"            LOOP
"
"               IF dpb.siln_depb_flag IN ('Y')
"
"                  AND NVL (dpb.siln_depb_pct, 0) <= 0
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'DEPB Percentage Should be greater than zero.');
"
"               END IF;
"
"            END LOOP;
"
"
"
"            IF cr7.sihd_inv_date IS NULL
"
"            THEN
"
"               raise_application_error (-20999,
"
"                                        'Invoice Date must be entered.');
"
"            END IF;
"
"
"
"            IF cr7.sihd_rem_date IS NULL
"
"            THEN
"
"               raise_application_error (-20999,
"
"                                        'Removal Date  must be entered.');
"
"            END IF;
"
"
"
"            proc_find_year_period (p_bu,
"
"                                   cr7.sihd_inv_date,
"
"                                   v_year,
"
"                                   v_period);
"
"
"
"
"
"            SELECT COUNT (*)
"
"              INTO var_stk_item_cnt
"
"              FROM sales_invoices_ln, products
"
"             WHERE     siln_bu = prod_bu
"
"                   AND siln_prod_id = prod_id
"
"                   AND siln_prod_rev = prod_rev
"
"                   AND prod_stocked = 'Y'
"
"                   AND siln_w_wo_stk_flag = 'Y'
"
"                   AND siln_bu = p_bu
"
"                   AND siln_plnt = p_plnt
"
"                   AND siln_doc_no = p_doc_no
"
"                   AND cr7.sihd_comm_tax_inv_flag = 'E';
"
"
"
"            IF cr7.sihd_status <> 'P'
"
"               AND cr7.sihd_type IN
"
"                      ('SIG', 'LO', 'LI', 'RB', 'TP', 'SIT', 'SE', 'IR')
"
"            THEN
"
"               IF var_stk_item_cnt > 0
"
"               THEN
"
"                  raise_application_error (-20999,
"
"                                           'Quantity should be picked.');
"
"               END IF;
"
"            END IF;
"
"
"
"            IF cr7.sihd_inv_pfx IS NULL AND cr7.sihd_exc_inv_pfx IS NOT NULL
"
"            THEN
"
"               UPDATE sales_invoices_hd
"
"                  SET sihd_inv_pfx = cr7.sihd_exc_inv_pfx
"
"                WHERE     sihd_bu = p_bu
"
"                      AND sihd_plant = p_plnt
"
"                      AND sihd_doc_no = p_doc_no;
"
"            END IF;
"
"
"
"            IF cr7.sihd_inv_no IS NULL AND cr7.sihd_exc_inv_no IS NOT NULL
"
"            THEN
"
"               UPDATE sales_invoices_hd
"
"                  SET sihd_inv_no = cr7.sihd_exc_inv_no
"
"                WHERE     sihd_bu = p_bu
"
"                      AND sihd_plant = p_plnt
"
"                      AND sihd_doc_no = p_doc_no;
"
"            END IF;
"
"
"
"            --- End Last Add Code ---
"
"
"
"
"
"
"
"            IF cr7.sihd_inv_no IS NOT NULL AND cr7.sihd_status <> 'I'
"
"            THEN
"
"               OPEN c_ac;
"
"
"
"               FETCH c_ac INTO r_ac;
"
"
"
"               CLOSE c_ac;
"
"
"
"               IF r_ac.applctrl_jrnl_rqrd_flag = 'Y'
"
"               THEN
"
"                  IF cr0.somctrl_no_fin_impl_flag = 'N'
"
"                  THEN
"
"                     OPEN c_aj (cr7.sihd_inv_pfx, cr7.sihd_inv_no);
"
"
"
"                     FETCH c_aj INTO r_aj;
"
"
"
"                     IF cr7.sihd_type NOT IN ('SIDE', 'DR', 'TP','SIRC')
"
"                     THEN
"
"                        IF r_aj.v_cnt = 0
"
"                        THEN
"
"                           raise_application_error (
"
"                              -20999,
"
"                              'APX' || 'Create Application Journal.');
"
"                        END IF;
"
"                     ELSIF cr7.sihd_type IN ('SIDE', 'DR', 'TP')
"
"                     THEN
"
"                        IF cr7.sihd_tax_amt > 0
"
"                        THEN
"
"                           IF r_aj.v_cnt = 0
"
"                           THEN
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'APX' || 'Create Application Journal.');
"
"                           END IF;
"
"                        END IF;
"
"                     ELSIF cr7.sihd_type IN ('LI', 'RB','JWIG')
"
"                           AND cr7.sihd_jrnl_wn_ent_req_flag = 'Y'
"
"                     THEN
"
"                        IF r_aj.v_cnt = 0
"
"                        THEN
"
"                           raise_application_error (
"
"                              -20999,
"
"                              'APX' || 'Create Application Journal.');
"
"                        END IF;
"
"                     END IF;
"
"
"
"                     CLOSE c_aj;
"
"                  END IF;
"
"               END IF;
"
"
"
"               IF     cr7.sihd_isd_gst_eligible_flag = 'Y'
"
"                  AND cr7.sihd_jrnl_flag = 'N'
"
"                  AND cr7.sihd_type NOT IN ('TP','SIRC')
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'APX' || 'Create Application Journal.');
"
"               END IF;
"
"
"
"               BEGIN
"
"                   select  func_find_vou_dflt_pfx (p_bu,
"
"                                            p_plnt,
"
"                                            NVL(cr7.sihd_plnt_loc_id,func_find_dflt_plnt_loc(p_bu,p_plnt)),
"
"                                            'AJ',
"
"                                            'AJ'
"
"                                            ) into v_pfx from dual;
"
"
"
"               END;
"
"
"
"
"
"
"
"               IF r_ac.applctrl_jrnl_rqrd_flag = 'Y'
"
"               THEN
"
"                  IF cr7.sihd_type NOT IN ('TP')
"
"                  THEN
"
"                     IF cr0.somctrl_no_fin_impl_flag = 'N'
"
"                     THEN
"
"                        IF cr7.sihd_jrnl_flag = 'Y'
"
"                        THEN
"
"                           OPEN c_aj_amt (cr7.sihd_inv_pfx, cr7.sihd_inv_no);
"
"
"
"                           FETCH c_aj_amt INTO r_aj_amt;
"
"
"
"                           IF r_aj_amt.db_amt > 0 AND r_aj_amt.cr_amt > 0
"
"                           THEN
"
"                              IF cr7.sihd_type NOT IN ('SIDE', 'DR')
"
"                              THEN
"
"                                 IF r_aj_amt.db_amt <> r_aj_amt.cr_amt
"
"                                 THEN
"
"                                    raise_application_error (
"
"                                       -20999,
"
"                                       'APX'
"
"                                       || 'Application Journal does not match.');
"
"                                 END IF;
"
"                              ELSIF cr7.sihd_type IN ('SIDE', 'DR')
"
"                                    AND cr7.sihd_tax_amt > 0
"
"                              THEN
"
"                                 IF r_aj_amt.db_amt <> r_aj_amt.cr_amt
"
"                                 THEN
"
"                                    raise_application_error (
"
"                                       -20999,
"
"                                       'APX'
"
"                                       || 'Application Journal does not match.');
"
"                                 END IF;
"
"                              END IF;
"
"                           ELSE
"
"                              IF cr7.sihd_type NOT IN ('SIDE', 'DR')
"
"                              THEN
"
"                                 raise_application_error (
"
"                                    -20999,
"
"                                    'APX' || 'Create Application Journal.');
"
"                              ELSIF cr7.sihd_type IN ('SIDE', 'DR')
"
"                                    AND cr7.sihd_tax_amt > 0
"
"                              THEN
"
"                                 raise_application_error (
"
"                                    -20999,
"
"                                    'APX' || 'Create Application Journal.');
"
"                              END IF;
"
"                           END IF;
"
"
"
"                           CLOSE c_aj_amt;
"
"                        END IF;
"
"                     END IF;
"
"                  END IF;
"
"               END IF;
"
"
"
"               FOR r_ln
"
"                  IN (SELECT *
"
"                        FROM sales_invoices_hd,
"
"                             sales_invoices_ln,
"
"                             products,
"
"                             som_control
"
"                       WHERE     sihd_bu = siln_bu
"
"                             AND sihd_plant = siln_plnt
"
"                             AND sihd_doc_no = siln_doc_no
"
"                             AND siln_bu = somctrl_bu
"
"                             AND siln_bu = prod_bu
"
"                             AND siln_prod_id = prod_id
"
"                             AND siln_prod_rev = prod_rev
"
"                             --AND prod_var_opt NOT IN ('PTO')
"
"                             AND ( (somctrl_shipset_ln_stk_flag = 'Y'
"
"                                    AND prod_var_opt IN ('PTO'))
"
"                                  OR prod_var_opt NOT IN ('PTO'))
"
"                             AND siln_bu = p_bu
"
"                             AND siln_plnt = p_plnt
"
"                             AND siln_doc_no = p_doc_no
"
"                             AND siln_w_wo_stk_flag = 'Y'
"
"                             AND siln_sf_code IS NULL
"
"                             AND func_find_prod_stocked (p_bu,
"
"                                                         siln_prod_id,
"
"                                                         siln_prod_rev) = 'Y'
"
"                             AND sihd_type NOT IN ('IV', 'IC', 'SIFA', 'SIRC')
"
"                             AND cr7.sihd_comm_tax_inv_flag = 'E')
"
"               LOOP
"
"
"
"               BEGIN
"
"                  SELECT NVL ( (stock_qty_hand - (stock_qty_mi_allocated)),
"
"                              0)
"
"                    INTO on_hand
"
"                    FROM stocks,
"
"                         stores,
"
"                         sales_invoices_hd,
"
"                         sales_invoices_ln
"
"                   WHERE     stock_bu = sihd_bu
"
"                         AND stock_store_id = siln_store_id
"
"                         AND stock_prod_id = siln_prod_id
"
"                         AND stock_prod_rev = siln_prod_rev
"
"                         AND sihd_bu = siln_bu
"
"                         AND sihd_plant = siln_plnt
"
"                         AND sihd_bu = p_bu
"
"                         AND store_plnt = p_plnt
"
"                         AND store_bu = stock_bu
"
"                         AND store_id = stock_store_id
"
"                         AND sihd_doc_no = siln_doc_no
"
"                         AND siln_prod_id = r_ln.siln_prod_id
"
"                         AND siln_prod_rev = r_ln.siln_prod_rev
"
"                         AND siln_doc_no = r_ln.siln_doc_no
"
"                         AND siln_store_id = r_ln.siln_store_id
"
"                         AND siln_seq_no = r_ln.siln_seq_no;
"
"                      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                  Raise_Application_Error(-20999,'Quantity on hand is low.');
"
"                END;
"
"
"
"              BEGIN
"
"                  SELECT NVL (stock_qty_picked, 0)
"
"                    INTO pick_qty
"
"                    FROM stocks,
"
"                         stores,
"
"                         sales_invoices_hd,
"
"                         sales_invoices_ln
"
"                   WHERE     stock_bu = sihd_bu
"
"                         AND stock_store_id = siln_store_id
"
"                         AND stock_prod_id = siln_prod_id
"
"                         AND stock_prod_rev = siln_prod_rev
"
"                         AND sihd_bu = siln_bu
"
"                         AND sihd_plant = siln_plnt
"
"                         AND sihd_bu = p_bu
"
"                         AND store_plnt = p_plnt
"
"                         AND store_bu = stock_bu
"
"                         AND store_id = stock_store_id
"
"                         AND sihd_doc_no = siln_doc_no
"
"                         AND siln_prod_id = r_ln.siln_prod_id
"
"                         AND siln_prod_rev = r_ln.siln_prod_rev
"
"                         AND siln_doc_no = r_ln.siln_doc_no
"
"                         AND siln_store_id = r_ln.siln_store_id
"
"                         AND siln_seq_no = r_ln.siln_seq_no;
"
"                 EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                  Raise_Application_Error(-20999,'Quantity on hand is low.');
"
"                END;
"
"
"
"                  IF cr7.sihd_type NOT IN ('SISUP','IS', 'SIS')
"
"                  THEN
"
"                     IF on_hand < TRUNC ( (r_ln.siln_stk_inv_qty), 3)
"
"                     THEN
"
"                        raise_application_error (-20999,'Quantity on hand is low.');
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  IF cr7.sihd_type NOT IN
"
"                        ('SISUP', 'SISCR', 'IS', 'SIFA', 'PJ', 'SIS')
"
"                  THEN
"
"                     IF pick_qty < TRUNC ( (r_ln.siln_stk_inv_qty), 3)
"
"                     THEN
"
"                        raise_application_error (
"
"                           -20999,
"
"                           'APX' || 'Quantity should be picked.'||'~'||pick_qty||'~'||TRUNC ( (r_ln.siln_stk_inv_qty), 3));
"
"                     END IF;
"
"                  END IF;
"
"               END LOOP;
"
"
"
"               OPEN c7;
"
"
"
"               FETCH c7 INTO cr7;
"
"
"
"               CLOSE c7;
"
"
"
"               IF cr7.sihd_status = 'P'
"
"                  AND (ROUND ( (cr7.sihd_gross_amt), rnd) <> cr7.sihd_tot_amt)
"
"               THEN
"
"                  raise_application_error (
"
"                     -20999,
"
"                     'APX'
"
"                     || 'Total amount does not match the material amount and tax amount.');
"
"               END IF;
"
"
"
"               var_post_flag := 'Y';
"
"
"
"               IF var_post_flag = 'Y'
"
"               THEN
"
"                  proc_chk_cust_credit_limit (
"
"                     p_bu,
"
"                     p_plnt,
"
"                     p_doc_no,
"
"                     cr7.sihd_cust_id,
"
"                     NVL (cr7.sihd_exc_inv_date, cr7.sihd_doc_date),
"
"                     p_user,
"
"                     var_res);
"
"
"
"                  IF cr0.somctrl_cr_limit_wf_req = 'Y'
"
"                  THEN
"
"                     IF var_res = 'Y'
"
"                     THEN
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_cr_limit_status = 'Y'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_plnt
"
"                               AND sihd_doc_no = p_doc_no;
"
"
"
"                        v_wf_type := 'WF_SICRL';
"
"                     ELSE
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_cr_limit_status = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_plnt
"
"                               AND sihd_doc_no = p_doc_no;
"
"
"
"                        v_wf_type := 'WF_SIA';
"
"                     END IF;
"
"                  ELSE
"
"                     IF var_res = 'Y'
"
"                     THEN
"
"                        raise_application_error (
"
"                           -20999,
"
"                           'APX' || 'Credit Limit Exceeds');
"
"                     ELSE
"
"                        UPDATE sales_invoices_hd
"
"                           SET sihd_cr_limit_status = 'N'
"
"                         WHERE     sihd_bu = p_bu
"
"                               AND sihd_plant = p_plnt
"
"                               AND sihd_doc_no = p_doc_no;
"
"
"
"                        v_wf_type := 'WF_SIA';
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  p_wf_type := v_wf_type;
"
"               END IF;
"
"            ELSE
"
"               raise_application_error (-20999,
"
"                                        'APX' || 'Invoice already created.');
"
"            END IF;
"
"         END IF;
"
"      END IF;
"
"   END proc_si_post_web;
"
"END pkg_si_invoice_web_som1090;"
/
