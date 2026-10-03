CREATE OR REPLACE
"PACKAGE BODY         pkg_sal_bud
"
"AS
"
"
"
"  PROCEDURE proc_load_cust_frm_sal_bud(p_bu        VARCHAR2,
"
"                                       p_doc_no        VARCHAR2,
"
"                                       p_rev_no     NUMBER,
"
"                                       p_user        VARCHAR2,
"
"                                       p_user_emp    VARCHAR2
"
"                                      )
"
"  AS
"
"
"
"  CURSOR c1 IS
"
"  SELECT suplr_suplr_id
"
"    FROM suppliers
"
"   WHERE suplr_bu = p_bu
"
"     AND suplr_status = 'A'
"
"     AND suplr_mode_sal = 'Y'
"
"     AND suplr_party_type not in ('N','A','I')
"
"     ORDER BY suplr_suplr_id;
"
"
"
"    v_seq_no    NUMBER(5);
"
"    v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM sale_bud_cust
"
"     WHERE sbc_bu = p_bu
"
"       AND sbc_doc_no = p_doc_no
"
"       AND sbc_rev_no = p_rev_no;
"
"
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      INSERT INTO sale_bud_cust(sbc_bu,
"
"                                sbc_doc_no,
"
"                                sbc_rev_no,
"
"                                sbc_seq_no,
"
"                                sbc_cust_id,
"
"                                sbc_inc_pct,
"
"                                sbc_sel_flag,
"
"                                sbc_cre_by,
"
"                                sbc_cre_emp_id,
"
"                                sbc_cre_ip_addr,
"
"                                sbc_cre_os_user,
"
"                                sbc_cre_date
"
"                   )
"
"                         VALUES(p_bu,
"
"                    p_doc_no,
"
"                    p_rev_no,
"
"                    v_seq_no,
"
"                    cr1.suplr_suplr_id,
"
"                    0,
"
"                    'N', --'Y',
"
"                    p_user,
"
"                    p_user_emp,
"
"                    v_ip_addr,
"
"                    v_os_user,
"
"                    SYSDATE
"
"                   );
"
"
"
"    END LOOP;
"
"
"
"    COMMIT;
"
"
"
"  END proc_load_cust_frm_sal_bud;
"
"
"
"  PROCEDURE proc_load_sales_frm_sal_bud(p_bu        VARCHAR2,
"
"                                        p_doc_no    VARCHAR2,
"
"                                        p_rev_no    NUMBER,
"
"                                        p_fr_date    DATE,
"
"                                        p_to_date    DATE,
"
"                                        p_user        VARCHAR2,
"
"                                        p_user_emp    VARCHAR2
"
"                                       )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT sihd_cust_id,siln_prod_id,siln_prod_rev,SUM(siln_inv_qty) Inv_Qty
"
"    FROM sales_invoices_hd,sales_invoices_ln
"
"   WHERE sihd_bu = siln_bu
"
"     AND sihd_plant = siln_plnt
"
"     AND sihd_doc_no = siln_doc_no
"
"     AND sihd_bu = p_bu
"
"     AND sihd_status = 'I'
"
"     AND siln_matl_type = 'P'
"
"     AND func_find_prod_class_type(p_bu,sihd_plant,siln_prod_id,siln_prod_rev) in ('FG')
"
"      AND sihd_type in ('SIDE',
"
"     'SIFA',
"
"     'SIFR',
"
"     'SIFS',
"
"     'SIG',
"
"     'SISCR',
"
"     'SIS',
"
"     'SIT',
"
"     'IS',
"
"'SIRC')
"
"     AND TRUNC(sihd_inv_date) BETWEEN p_fr_date AND p_to_date
"
"     AND EXISTS(SELECT 1
"
"                  FROM sale_bud_cust
"
"                 WHERE sbc_bu = p_bu
"
"           AND sbc_doc_no = p_doc_no
"
"           AND sbc_sel_flag = 'Y'
"
"           AND sbc_cust_id = sihd_cust_id)
"
"  GROUP BY sihd_cust_id,siln_prod_id,siln_prod_rev
"
"  ORDER BY sihd_cust_id,siln_prod_id;
"
"
"
"
"
"CURSOR c3(c_prod_id VARCHAR2, c_prod_rev NUMBER)
"
"IS
"
"              SELECT bomln_prod_id,bomln_prod_rev,bomln_required_qty
"
"                FROM bom_hd,routing_ln,bom_ln
"
"               WHERE bomhd_bu = rouln_bu
"
"                 AND bomhd_plnt = rouln_plnt
"
"                 AND bomhd_bom_no = rouln_bom_no
"
"                 AND rouln_bu = bomln_bu
"
"                 AND rouln_plnt = bomln_plnt
"
"                 AND rouln_bom_no = bomln_bom_no
"
"                 AND rouln_oprn_id = bomln_oprn_id
"
"                 AND rouln_oprn_ln_seq = bomln_oprn_ln_seq
"
"                 AND bomhd_bu = p_bu
"
"                 AND bomhd_prod_id = c_prod_id
"
"                 AND bomhd_prod_rev = c_prod_rev
"
"                 AND bomhd_primary = 'Y'
"
"                 AND bomhd_status = 'A'
"
"                 ORDER BY bomln_prod_id;
"
"
"
"
"
"    v_seq_no    NUMBER(5);
"
"    v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"    v_yrly    NUMBER;
"
"    var_exc_cnt NUMBER;
"
"    cr3        c3%ROWTYPE;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM sale_bud_act_sales
"
"     WHERE sbas_bu = p_bu
"
"       AND sbas_doc_no = p_doc_no
"
"       AND sbas_rev_no = p_rev_no;
"
"
"
"
"
"   /*DELETE sales_budget_exception
"
"    WHERE sse_bu = p_bu
"
"      AND sse_doc_no = p_doc_no;*/
"
"
"
"    v_seq_no := 0;
"
"
"
"    SELECT CEIL(MONTHS_BETWEEN(sbh_date_to,sbh_date_from)/12) INTO v_yrly
"
"      FROM sale_bud_hd
"
"     WHERE sbh_bu = p_bu
"
"       AND sbh_doc_no = p_doc_no
"
"       AND sbh_rev_no = p_rev_no;
"
"
"
"      /* v_seq_no := 1;
"
"
"
"     FOR cr1 IN c1
"
"     LOOP
"
"
"
"                 OPEN c3(cr1.siln_prod_id,cr1.siln_prod_rev);
"
"                 FETCH c3 INTO cr3;
"
"                 IF c3%NOTFOUND THEN
"
"
"
"
"
"
"
"                 INSERT INTO sales_budget_exception(
"
"                           sse_bu,
"
"                       sse_doc_no,
"
"                       sse_seq_no,
"
"                       sse_exp,
"
"                       sse_cre_by,
"
"                       sse_cre_date
"
"                       )
"
"                    VALUES(
"
"                           p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       'BOM item is not found.'||'-'||cr1.siln_prod_id||'-'||cr1.siln_prod_rev,
"
"                       p_user,
"
"                       SYSDATE
"
"                           );
"
"
"
"                           v_seq_no := v_seq_no + 1;
"
"
"
"                           COMMIT;
"
"
"
"                           END IF;
"
"                           CLOSE c3;
"
"
"
"      END LOOP;
"
"
"
"
"
"      SELECT COUNT(*)
"
"        INTO var_exc_cnt
"
"        FROM sales_budget_exception
"
"       WHERE sse_bu = p_bu
"
"         AND sse_doc_no = p_doc_no;
"
"
"
"         IF var_exc_cnt > 0 THEN
"
"            RAISE_APPLICATION_ERROR(-20595,'PLN' ||'Bill of material not exists, refer exception');
"
"         END IF;*/
"
"
"
"
"
"
"
"
"
"      v_seq_no := 0;
"
"
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      INSERT INTO sale_bud_act_sales(sbas_bu,
"
"                                     sbas_doc_no,
"
"                                     sbas_rev_no,
"
"                                     sbas_seq_no,
"
"                                     sbas_cust_id,
"
"                                     sbas_fg_prod_id,
"
"                                     sbas_fg_prod_rev,
"
"                                     sbas_act_sale_qty,
"
"                                     sbas_yrly_avg_qty,
"
"                                     sbas_cre_by,
"
"                                     sbas_cre_emp_id,
"
"                                     sbas_cre_ip_addr,
"
"                                     sbas_cre_os_user,
"
"                                     sbas_cre_date)
"
"                              VALUES(p_bu,
"
"                         p_doc_no,
"
"                         p_rev_no,
"
"                         v_seq_no,
"
"                         cr1.sihd_cust_id,
"
"                         cr1.siln_prod_id,
"
"                         cr1.siln_prod_rev,
"
"                         ROUND(cr1.Inv_Qty),
"
"                         ROUND(cr1.Inv_Qty/v_yrly),
"
"                         p_user,
"
"                         p_user_emp,
"
"                         v_ip_addr,
"
"                         v_os_user,
"
"                         SYSDATE
"
"                    );
"
"
"
"
"
"    END LOOP;
"
"
"
"    COMMIT;
"
"
"
"  END proc_load_sales_frm_sal_bud;
"
"
"
"  PROCEDURE proc_load_plan_frm_sal_bud(p_bu                VARCHAR2,
"
"                                       p_doc_no            VARCHAR2,
"
"                                       p_rev_no         NUMBER,
"
"                                       p_user            VARCHAR2,
"
"                                       p_user_emp       VARCHAR2
"
"                                      )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT sbas_cust_id,sbas_fg_prod_id,sbas_fg_prod_rev,
"
"         sal_bud_qry + (sal_bud_qry * inc_pct/100) Sal_Bud_Qry
"
"         FROM(
"
"  SELECT sbas_cust_id,sbas_fg_prod_id,sbas_fg_prod_rev,--(sbas_yrly_avg_qty + (sbas_yrly_avg_qty * (sbc_inc_pct/100))) Sal_Bud_Qry,
"
"         sbas_yrly_avg_qty Sal_Bud_Qry,
"
"         (select sbip_inc_pct
"
"                             FROM SALE_BUD_INC_PCT
"
"                            where sbip_bu = p_bu
"
"                              and sbip_doc_no = p_doc_no
"
"                              and sbip_rev_no = p_rev_no
"
"                              and sbip_prod_id = sbas_fg_prod_id
"
"                         and sbip_prod_rev  = sbas_fg_prod_rev) inc_pct
"
"    FROM sale_bud_cust,sale_bud_act_sales
"
"   WHERE sbc_bu = sbas_bu
"
"     AND sbc_doc_no = sbas_doc_no
"
"     AND sbc_rev_no = sbas_rev_no
"
"     AND sbc_cust_id = sbas_cust_id
"
"     AND sbas_bu = p_bu
"
"     AND sbas_doc_no = p_doc_no
"
"     AND sbas_rev_no = p_rev_no
"
"     AND sbc_sel_flag = 'Y'
"
"     ORDER BY sbas_cust_id,sbas_fg_prod_id) ;
"
"
"
"  CURSOR c2 IS
"
"  SELECT sbfs_cust_id,sbfs_fg_prod_id,sbfs_fg_prod_rev,sbfs_fp01_bud_qty,sbfs_fp02_bud_qty,sbfs_fp03_bud_qty,sbfs_fp04_bud_qty,
"
"         sbfs_fp05_bud_qty,sbfs_fp06_bud_qty,sbfs_fp07_bud_qty,sbfs_fp08_bud_qty,sbfs_fp09_bud_qty,sbfs_fp10_bud_qty,
"
"     sbfs_fp11_bud_qty,sbfs_fp12_bud_qty,sbfs_tot_bud_qty
"
"    FROM sale_bud_fc_sales
"
"   WHERE sbfs_bu = p_bu
"
"     AND sbfs_doc_no = p_doc_no
"
"     AND sbfs_rev_no = p_rev_no
"
"   ORDER BY sbfs_seq_no;
"
"
"
"    v_seq_no    NUMBER(5);
"
"    v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"    v_tot_bud_qty NUMBER(12,3);
"
"    v_diff_Qty NUMBER(12,3);
"
"    v_fp01_qty NUMBER(12,3);
"
"    v_fp02_qty    NUMBER(12,3);
"
"    v_fp03_qty    NUMBER(12,3);
"
"    v_fp04_qty    NUMBER(12,3);
"
"    v_fp05_qty    NUMBER(12,3);
"
"    v_fp06_qty    NUMBER(12,3);
"
"    v_fp07_qty    NUMBER(12,3);
"
"    v_fp08_qty    NUMBER(12,3);
"
"    v_fp09_qty    NUMBER(12,3);
"
"    v_fp10_qty    NUMBER(12,3);
"
"    v_fp11_qty    NUMBER(12,3);
"
"    v_fp12_qty    NUMBER(12,3);
"
"    v_rem_diff_qty NUMBER(12,3);
"
"    v_elg_diff_qty    NUMBER(12,3);
"
"    v_fg_unit_cost NUMBER(17,5);
"
"
"
"    v_tot_bud_qty1  NUMBER(12,3);
"
"
"
"    v_pack_size     NUMBER(12,3);
"
"    v_quo        NUMBER(12,3);
"
"    v_rem        NUMBER(12,3);
"
"
"
"v_month1_qty number(12,3);
"
"v_month2_qty number(12,3);
"
"v_month3_qty number(12,3);
"
"v_month4_qty number(12,3);
"
"v_month5_qty number(12,3);
"
"
"
"v_month6_qty number(12,3);
"
"
"
"v_month7_qty number(12,3);
"
"
"
"v_month8_qty number(12,3);
"
"
"
"v_month9_qty number(12,3);
"
"
"
"v_month10_qty number(12,3);
"
"v_month11_qty number(12,3);
"
"v_month12_qty number(12,3);
"
"
"
"v_month_qty number(12,3);
"
"
"
"
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM sale_bud_cy_pln_qty
"
"     WHERE sbcpq_bu = p_bu
"
"       AND sbcpq_doc_no = p_doc_no
"
"       AND sbcpq_rev_no = p_rev_no;
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR cr2 IN c2
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"
"
"
"
"      begin
"
"
"
"
"
"                            select NVL(MAX(srcln_price),0)
"
"                              into v_fg_unit_cost
"
"                            from SALES_RATE_CONTR_HD,SALES_RATE_CONTR_LN
"
"                            where SRCHD_BU = SRCLN_BU
"
"                              AND SRCHD_PLNT = SRCLN_PLNT
"
"                              AND SRCHD_DOC_NO = SRCLN_DOC_NO
"
"                              AND SRCHD_STATUS = 'A'
"
"                              AND srchd_bu = p_bu
"
"                              and srchd_cust_id = cr2.sbfs_cust_id
"
"                              and srcln_prod_id = cr2.sbfs_fg_prod_id
"
"                                and srcln_prod_rev = cr2.sbfs_fg_prod_REV;
"
"
"
"                                exception
"
"                                when no_data_found then
"
"                                v_fg_unit_cost := 0;
"
"                          end;
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
"      /* SELECT nvl(MAX(STCOST_COST),0)
"
"              INTO v_fg_unit_cost
"
"              FROM STOCK_COSTS
"
"                 WHERE STCOST_BU = P_BU
"
"                   AND STCOST_PROD_ID = cr2.sbfs_fg_prod_id
"
"       AND STCOST_PROD_REV = cr2.sbfs_fg_prod_rev;*/
"
"
"
"
"
"        /*  IF cr2.prod_lot_size_type = 'S' AND cr2.prod_lot_size > 0 THEN
"
"                       IF cr2.prod_lot_size >= ABS (v_proj_qoh) THEN
"
"                           v_plnd_rel := cr2.prod_lot_size;
"
"                           v_proj_qoh := v_proj_qoh + v_plnd_rel;
"
"                       ELSE
"
"                           IF cr2.prod_lot_size = 1 THEN
"
"                               v_plnd_rel := ceil(abs(v_proj_qoh));
"
"                               v_proj_qoh := v_proj_qoh + v_plnd_rel;
"
"                           ELSE
"
"                               v_quo :=  (ABS (v_proj_qoh) / cr2.prod_lot_size);
"
"                               v_rem := MOD (ABS (v_proj_qoh), cr2.prod_lot_size);
"
"                               v_plnd_rel := ((v_quo * cr2.prod_lot_size) + (case when v_rem > 0 THEN cr2.prod_lot_size - v_rem ELSE 0 END));
"
"                               v_proj_qoh := v_proj_qoh + v_plnd_rel;
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
"                END IF;*/
"
"
"
"
"
"                SELECT NVL(MAX(fsph_no_of_pcs_per_cover),0)-- NVL(MAX(fsph_qty_per_box),0)
"
"                    INTO   v_pack_size
"
"                  FROM fg_std_pack_hd
"
"                 WHERE fsph_bu = p_bu
"
"                   AND fsph_status = 'A'
"
"                   AND fsph_fg_prod_id = cr2.sbfs_fg_prod_id
"
"                   AND fsph_fg_prod_rev = cr2.sbfs_fg_prod_rev
"
"                   AND fsph_cust_id = cr2.sbfs_cust_id;
"
"
"
"
"
"       IF v_pack_size >= ROUND(cr2.sbfs_tot_bud_qty) THEN
"
"               v_tot_bud_qty1 := v_pack_size;
"
"       ELSIF v_pack_size = 0 THEN
"
"              v_tot_bud_qty1 := ROUND(cr2.sbfs_tot_bud_qty);
"
"       ELSIF v_pack_size < ROUND(cr2.sbfs_tot_bud_qty) THEN
"
"
"
"           v_quo :=  (ROUND(cr2.sbfs_tot_bud_qty) / v_pack_size);
"
"       v_rem := MOD (ROUND(cr2.sbfs_tot_bud_qty), v_pack_size);
"
"              v_tot_bud_qty1 := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"       END IF;
"
"
"
"       v_tot_bud_qty1 := floor(v_tot_bud_qty1);
"
"
"
"
"
"       v_month1_qty := cr2.sbfs_fp01_bud_qty;
"
"
"
"        IF v_pack_size >= ROUND(v_month1_qty)  AND v_month1_qty >0 THEN
"
"                      v_month1_qty := v_pack_size;
"
"              ELSIF v_pack_size = 0 THEN
"
"                     v_month1_qty := ROUND(v_month1_qty);
"
"              ELSIF v_pack_size < ROUND(v_month1_qty)  AND v_month1_qty > 0 THEN
"
"
"
"                  v_quo :=  (ROUND(v_month1_qty) / v_pack_size);
"
"              v_rem := MOD (ROUND(v_month1_qty), v_pack_size);
"
"                     v_month1_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"       END IF;
"
"
"
"       v_month1_qty := floor(v_month1_qty);
"
"
"
"
"
"         v_month2_qty := cr2.sbfs_fp02_bud_qty;
"
"
"
"               IF v_pack_size >= ROUND(v_month2_qty) AND  v_month2_qty > 0 THEN
"
"                             v_month2_qty := v_pack_size;
"
"                     ELSIF v_pack_size = 0 THEN
"
"                            v_month2_qty := ROUND(v_month2_qty);
"
"                     ELSIF v_pack_size < ROUND(v_month2_qty) AND v_month2_qty > 0 THEN
"
"
"
"                         v_quo :=  (ROUND(v_month2_qty) / v_pack_size);
"
"                     v_rem := MOD (ROUND(v_month2_qty), v_pack_size);
"
"                            v_month2_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"              END IF;
"
"
"
"       v_month2_qty := floor(v_month2_qty);
"
"
"
"
"
"          v_month3_qty := cr2.sbfs_fp03_bud_qty;
"
"
"
"                      IF v_pack_size >= ROUND(v_month3_qty) AND v_month3_qty > 0 THEN
"
"                                    v_month3_qty := v_pack_size;
"
"                            ELSIF v_pack_size = 0 THEN
"
"                                   v_month3_qty := ROUND(v_month3_qty);
"
"                            ELSIF v_pack_size < ROUND(v_month3_qty) AND v_month3_qty > 0 THEN
"
"
"
"                                v_quo :=  (ROUND(v_month3_qty) / v_pack_size);
"
"                            v_rem := MOD (ROUND(v_month3_qty), v_pack_size);
"
"                                   v_month3_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                     END IF;
"
"
"
"       v_month3_qty := floor(v_month3_qty);
"
"
"
"
"
"               v_month4_qty := cr2.sbfs_fp04_bud_qty;
"
"
"
"                             IF v_pack_size >= ROUND(v_month4_qty)  AND v_month4_qty > 0 THEN
"
"                                           v_month4_qty := v_pack_size;
"
"                                   ELSIF v_pack_size = 0 THEN
"
"                                          v_month4_qty := ROUND(v_month4_qty);
"
"                                   ELSIF v_pack_size < ROUND(v_month4_qty) AND v_month4_qty > 0 THEN
"
"
"
"                                       v_quo :=  (ROUND(v_month4_qty) / v_pack_size);
"
"                                   v_rem := MOD (ROUND(v_month4_qty), v_pack_size);
"
"                                          v_month4_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                            END IF;
"
"
"
"       v_month4_qty := floor(v_month4_qty);
"
"
"
"
"
"                  v_month5_qty := cr2.sbfs_fp05_bud_qty;
"
"
"
"                                    IF v_pack_size >= ROUND(v_month5_qty) AND v_month5_qty > 0 THEN
"
"                                                  v_month5_qty := v_pack_size;
"
"                                          ELSIF v_pack_size = 0 THEN
"
"                                                 v_month5_qty := ROUND(v_month5_qty);
"
"                                          ELSIF v_pack_size < ROUND(v_month5_qty) AND v_month5_qty > 0 THEN
"
"
"
"                                              v_quo :=  (ROUND(v_month5_qty) / v_pack_size);
"
"                                          v_rem := MOD (ROUND(v_month5_qty), v_pack_size);
"
"                                                 v_month5_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                                   END IF;
"
"
"
"       v_month5_qty := floor(v_month5_qty);
"
"
"
"
"
"
"
"                         v_month6_qty := cr2.sbfs_fp06_bud_qty;
"
"
"
"                                           IF v_pack_size >= ROUND(v_month6_qty)  AND v_month6_qty > 0 THEN
"
"                                                         v_month6_qty := v_pack_size;
"
"                                                 ELSIF v_pack_size = 0 THEN
"
"                                                        v_month6_qty := ROUND(v_month6_qty);
"
"                                                 ELSIF v_pack_size < ROUND(v_month6_qty) AND v_month6_qty > 0 THEN
"
"
"
"                                                     v_quo :=  (ROUND(v_month6_qty) / v_pack_size);
"
"                                                 v_rem := MOD (ROUND(v_month6_qty), v_pack_size);
"
"                                                        v_month6_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                                          END IF;
"
"
"
"       v_month6_qty := floor(v_month6_qty);
"
"
"
"
"
"            v_month7_qty := cr2.sbfs_fp07_bud_qty;
"
"
"
"                      IF v_pack_size >= ROUND(v_month7_qty) AND v_month7_qty > 0 THEN
"
"                            v_month7_qty := v_pack_size;
"
"                        ELSIF v_pack_size = 0 THEN
"
"                               v_month7_qty := ROUND(v_month7_qty);
"
"                        ELSIF v_pack_size < ROUND(v_month7_qty) AND v_month7_qty > 0  THEN
"
"
"
"                            v_quo :=  (ROUND(v_month7_qty) / v_pack_size);
"
"                        v_rem := MOD (ROUND(v_month7_qty), v_pack_size);
"
"                               v_month7_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                     END IF;
"
"
"
"            v_month7_qty := floor(v_month7_qty);
"
"
"
"
"
"        v_month8_qty := cr2.sbfs_fp08_bud_qty;
"
"
"
"                          IF v_pack_size >= ROUND(v_month8_qty) AND v_month8_qty > 0 THEN
"
"                                v_month8_qty := v_pack_size;
"
"                            ELSIF v_pack_size = 0 THEN
"
"                                   v_month8_qty := ROUND(v_month8_qty);
"
"                            ELSIF v_pack_size < ROUND(v_month8_qty) AND v_month8_qty > 0 THEN
"
"
"
"                                v_quo :=  (ROUND(v_month8_qty) / v_pack_size);
"
"                            v_rem := MOD (ROUND(v_month8_qty), v_pack_size);
"
"                                   v_month8_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                         END IF;
"
"
"
"                v_month8_qty := floor(v_month8_qty);
"
"
"
"
"
"    v_month9_qty := cr2.sbfs_fp09_bud_qty;
"
"
"
"                          IF v_pack_size >= ROUND(v_month9_qty) AND v_month9_qty > 0 THEN
"
"                                v_month9_qty := v_pack_size;
"
"                            ELSIF v_pack_size = 0 THEN
"
"                                   v_month9_qty := ROUND(v_month9_qty);
"
"                            ELSIF v_pack_size < ROUND(v_month9_qty) AND v_month9_qty > 0 THEN
"
"
"
"                                v_quo :=  (ROUND(v_month9_qty) / v_pack_size);
"
"                            v_rem := MOD (ROUND(v_month9_qty), v_pack_size);
"
"                                   v_month9_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                         END IF;
"
"
"
"                v_month9_qty := floor(v_month9_qty);
"
"
"
"
"
"                    v_month10_qty := cr2.sbfs_fp10_bud_qty;
"
"
"
"                                          IF v_pack_size >= ROUND(v_month10_qty) AND v_month10_qty > 0 THEN
"
"                                                v_month10_qty := v_pack_size;
"
"                                            ELSIF v_pack_size = 0 THEN
"
"                                                   v_month10_qty := ROUND(v_month10_qty);
"
"                                            ELSIF v_pack_size < ROUND(v_month10_qty) AND v_month10_qty > 0 THEN
"
"
"
"                                                v_quo :=  (ROUND(v_month10_qty) / v_pack_size);
"
"                                            v_rem := MOD (ROUND(v_month10_qty), v_pack_size);
"
"                                                   v_month10_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                                         END IF;
"
"
"
"                v_month10_qty := floor(v_month10_qty);
"
"
"
"
"
"                        v_month11_qty := cr2.sbfs_fp11_bud_qty;
"
"
"
"                              IF v_pack_size >= ROUND(v_month11_qty) AND v_month11_qty > 0 THEN
"
"                                    v_month11_qty := v_pack_size;
"
"                                ELSIF v_pack_size = 0 THEN
"
"                                       v_month11_qty := ROUND(v_month11_qty);
"
"                                ELSIF v_pack_size < ROUND(v_month11_qty) AND v_month11_qty > 0 THEN
"
"
"
"                                    v_quo :=  (ROUND(v_month11_qty) / v_pack_size);
"
"                                v_rem := MOD (ROUND(v_month11_qty), v_pack_size);
"
"                                       v_month11_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                             END IF;
"
"
"
"                v_month11_qty := floor(v_month11_qty);
"
"
"
"
"
"                                v_month12_qty := cr2.sbfs_fp12_bud_qty;
"
"
"
"                                      IF v_pack_size >= ROUND(v_month12_qty) AND v_month12_qty > 0 THEN
"
"                                            v_month12_qty := v_pack_size;
"
"                                        ELSIF v_pack_size = 0 THEN
"
"                                               v_month12_qty := ROUND(v_month12_qty);
"
"                                        ELSIF v_pack_size < ROUND(v_month12_qty) AND v_month12_qty > 0 THEN
"
"
"
"                                            v_quo :=  (ROUND(v_month12_qty) / v_pack_size);
"
"                                        v_rem := MOD (ROUND(v_month12_qty), v_pack_size);
"
"                                               v_month12_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"
"
"
"
"                                     END IF;
"
"
"
"                v_month12_qty := floor(v_month12_qty);
"
"
"
"
"
"
"
"      INSERT INTO sale_bud_cy_pln_qty (sbcpq_bu,
"
"                                       sbcpq_doc_no,
"
"                                       sbcpq_rev_no,
"
"                                       sbcpq_seq_no,
"
"                                       sbcpq_cust_id,
"
"                                       sbcpq_fg_prod_id,
"
"                                       sbcpq_fg_prod_rev,
"
"                                       sbcpq_bud_sale_qty,
"
"                                       sbcpq_unit_price,
"
"                                       sbcpq_bud_amt,
"
"                                       sbcpq_fp01_bud_qty,
"
"                                       sbcpq_apr_val,
"
"                                       sbcpq_fp02_bud_qty,
"
"                                       sbcpq_may_val,
"
"                                       sbcpq_fp03_bud_qty,
"
"                                       sbcpq_jun_val,
"
"                                       sbcpq_fp04_bud_qty,
"
"                                       sbcpq_jul_val,
"
"                                       sbcpq_fp05_bud_qty,
"
"                                       sbcpq_aug_val,
"
"                                       sbcpq_fp06_bud_qty,
"
"                                       sbcpq_sep_val,
"
"                                       sbcpq_fp07_bud_qty,
"
"                                       sbcpq_oct_val,
"
"                                       sbcpq_fp08_bud_qty,
"
"                                       sbcpq_nov_val,
"
"                                       sbcpq_fp09_bud_qty,
"
"                                       sbcpq_dec_val,
"
"                                       sbcpq_fp10_bud_qty,
"
"                                       sbcpq_jan_val,
"
"                                       sbcpq_fp11_bud_qty,
"
"                                       sbcpq_feb_val,
"
"                                       sbcpq_fp12_bud_qty,
"
"                                       sbcpq_mar_val,
"
"                                       sbcpq_cre_by,
"
"                                       sbcpq_cre_emp_id,
"
"                                       sbcpq_cre_ip_addr,
"
"                                       sbcpq_cre_os_user,
"
"                                       sbcpq_cre_date)
"
"                        VALUES(p_bu,
"
"                               p_doc_no,
"
"                               p_rev_no,
"
"                              v_seq_no,
"
"                              cr2.sbfs_cust_id,
"
"                              cr2.sbfs_fg_prod_id,
"
"                              cr2.sbfs_fg_prod_rev,
"
"                              v_tot_bud_qty1,
"
"                              v_fg_unit_cost,
"
"                              (v_tot_bud_qty1 * v_fg_unit_cost),
"
"                             v_month1_qty,
"
"                              v_month1_qty*v_fg_unit_cost,
"
"                              v_month2_qty,
"
"                              v_month2_qty*v_fg_unit_cost,
"
"                              v_month3_qty,
"
"                              v_month3_qty*v_fg_unit_cost,
"
"                              v_month4_qty,
"
"                              v_month4_qty*v_fg_unit_cost,
"
"                              v_month5_qty,
"
"                              v_month5_qty*v_fg_unit_cost,
"
"                              v_month6_qty,
"
"                              v_month6_qty*v_fg_unit_cost,
"
"                              v_month7_qty,
"
"                              v_month7_qty*v_fg_unit_cost,
"
"                              v_month8_qty,
"
"                              v_month8_qty*v_fg_unit_cost,
"
"                              v_month9_qty,
"
"                              v_month9_qty*v_fg_unit_cost,
"
"                              v_month10_qty,
"
"                              v_month10_qty*v_fg_unit_cost,
"
"                              v_month11_qty,
"
"                              v_month11_qty*v_fg_unit_cost,
"
"                              v_month12_qty,
"
"                              v_month12_qty*v_fg_unit_cost,
"
"                              p_user,
"
"                              p_user_emp,
"
"                              v_ip_addr,
"
"                              v_os_user,
"
"                              SYSDATE
"
"                      );
"
"
"
"
"
"            UPDATE sale_bud_cy_pln_qty
"
"            SET sbcpq_bud_sale_qty = (sbcpq_fp01_bud_qty + sbcpq_fp02_bud_qty + sbcpq_fp03_bud_qty + sbcpq_fp04_bud_qty +
"
"                                      sbcpq_fp05_bud_qty + sbcpq_fp06_bud_qty + sbcpq_fp07_bud_qty + sbcpq_fp08_bud_qty +
"
"                                      sbcpq_fp09_bud_qty + sbcpq_fp10_bud_qty + sbcpq_fp11_bud_qty + sbcpq_fp12_bud_qty
"
"                                      )
"
"                                      where sbcpq_bu = p_bu
"
"                                        AND sbcpq_doc_no = p_doc_no
"
"                                        AND sbcpq_rev_no = p_rev_no
"
"                                        AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                UPDATE sale_bud_cy_pln_qty
"
"                                     SET sbcpq_bud_amt = sbcpq_bud_sale_qty * v_fg_unit_cost
"
"                                      where sbcpq_bu = p_bu
"
"                                        AND sbcpq_doc_no = p_doc_no
"
"                                        AND sbcpq_rev_no = p_rev_no
"
"                                        AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                        select sbcpq_bud_sale_qty
"
"                                          into v_tot_bud_qty1
"
"                                          FROM sale_bud_cy_pln_qty
"
"                                         WHERE sbcpq_bu = p_bu
"
"                                           AND sbcpq_doc_no = p_doc_no
"
"                                           AND sbcpq_rev_no = p_rev_no
"
"                                           AND sbcpq_seq_no = v_seq_no;
"
"
"
"
"
"
"
"
"
"                              SELECT (sbcpq_fp01_bud_qty + sbcpq_fp02_bud_qty + sbcpq_fp03_bud_qty +
"
"                                     sbcpq_fp04_bud_qty +  sbcpq_fp05_bud_qty + sbcpq_fp06_bud_qty +
"
"                                     sbcpq_fp07_bud_qty + sbcpq_fp08_bud_qty + sbcpq_fp09_bud_qty +
"
"                                     sbcpq_fp10_bud_qty + sbcpq_fp11_bud_qty + sbcpq_fp12_bud_qty)  tot_bud_qty
"
"                                       into v_tot_bud_qty
"
"                                FROM sale_bud_cy_pln_qty
"
"                               WHERE sbcpq_bu = p_bu
"
"                                 AND sbcpq_doc_no = p_doc_no
"
"                              And SBCPQ_REV_NO = P_REV_NO
"
"                                 AND sbcpq_seq_no = v_seq_no;
"
"
"
"
"
"
"
"                                 v_diff_qty := 0;
"
"
"
"                                /* IF v_seq_no = 6 THEN
"
"                          RAISE_APPLICATION_ERROR(-20999,'HRM' || ROUND(cr1.Sal_Bud_Qry) ||'/'|| v_tot_bud_qty ||'/'||v_diff_qty ||'/'||ROUND(cr1.Sal_Bud_Qry/12));
"
"                                 END IF;*/
"
"
"
"
"
"                                 IF ROUND(v_tot_bud_qty1) >= v_tot_bud_qty THEN
"
"                                     v_diff_qty := v_tot_bud_qty1 - v_tot_bud_qty;
"
"                                 END IF;
"
"
"
"
"
"
"
"
"
"                                 IF v_diff_qty <> 0 THEN
"
"                                     UPDATE sale_bud_cy_pln_qty
"
"                                        SET sbcpq_fp12_bud_qty = case when (sbcpq_fp12_bud_qty + v_diff_qty) < 0 then 0 else sbcpq_fp12_bud_qty + v_diff_qty end
"
"                                     WHERE sbcpq_bu = p_bu
"
"                                       AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                       AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                 END IF;
"
"
"
"                                 IF ROUND(v_tot_bud_qty1) < v_tot_bud_qty THEN
"
"
"
"                                    v_diff_qty := v_tot_bud_qty - ROUND(v_tot_bud_qty1);
"
"
"
"                                    v_rem_diff_qty := v_diff_qty;
"
"                                    v_elg_diff_qty := 0;
"
"
"
"                                    WHILE (v_rem_diff_qty >0)
"
"                                    LOOP
"
"
"
"                                        SELECT sbcpq_fp01_bud_qty , sbcpq_fp02_bud_qty , sbcpq_fp03_bud_qty ,
"
"                              sbcpq_fp04_bud_qty ,  sbcpq_fp05_bud_qty , sbcpq_fp06_bud_qty ,
"
"                              sbcpq_fp07_bud_qty , sbcpq_fp08_bud_qty , sbcpq_fp09_bud_qty ,
"
"                              sbcpq_fp10_bud_qty , sbcpq_fp11_bud_qty , sbcpq_fp12_bud_qty
"
"                             into v_fp01_qty,v_fp02_qty,v_fp03_qty,v_fp04_qty,v_fp05_qty,
"
"                                  v_fp06_qty,v_fp07_qty,v_fp08_qty,v_fp09_qty,v_fp10_qty,
"
"                                  v_fp11_qty,v_fp12_qty
"
"                             FROM sale_bud_cy_pln_qty
"
"                            WHERE sbcpq_bu = p_bu
"
"                              AND sbcpq_doc_no = p_doc_no
"
"                              AND SBCPQ_REV_NO = P_REV_NO
"
"                                           AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                           IF v_fp12_qty > 0 AND v_fp12_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp12_bud_qty = sbcpq_fp12_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"
"
"                                           ELSIF   v_fp12_qty > 0 AND v_fp12_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"
"
"                                              v_elg_diff_qty := v_fp12_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp12_bud_qty = sbcpq_fp12_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp11_qty > 0 AND v_fp11_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp11_bud_qty = sbcpq_fp11_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                            ELSIF v_fp11_qty > 0 AND v_fp11_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp11_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp11_bud_qty = sbcpq_fp11_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp10_qty > 0 AND v_fp10_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp10_bud_qty = sbcpq_fp10_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                                 ELSIF v_fp10_qty > 0 AND v_fp10_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp10_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp10_bud_qty = sbcpq_fp10_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp09_qty > 0 AND v_fp09_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp09_bud_qty = sbcpq_fp09_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"                                             ELSIF v_fp09_qty > 0 AND v_fp09_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp09_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp09_bud_qty = sbcpq_fp09_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp08_qty > 0 AND v_fp08_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp08_bud_qty = sbcpq_fp08_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                            ELSIF v_fp08_qty > 0 AND v_fp08_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp08_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp08_bud_qty = sbcpq_fp08_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                            IF v_fp07_qty > 0 AND v_fp07_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp07_bud_qty = sbcpq_fp07_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                                ELSIF v_fp07_qty > 0 AND v_fp07_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp07_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp07_bud_qty = sbcpq_fp07_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                            IF v_fp06_qty > 0 AND v_fp06_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp06_bud_qty = sbcpq_fp06_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp06_qty > 0 AND v_fp06_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp06_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp06_bud_qty = sbcpq_fp06_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                        IF v_fp05_qty > 0 AND v_fp05_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp05_bud_qty = sbcpq_fp05_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"                                           ELSIF v_fp05_qty > 0 AND v_fp05_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp05_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp05_bud_qty = sbcpq_fp05_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                        IF v_fp04_qty > 0 AND v_fp04_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp04_bud_qty = sbcpq_fp04_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp04_qty > 0 AND v_fp04_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp04_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp04_bud_qty = sbcpq_fp04_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                        IF v_fp03_qty > 0 AND v_fp03_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp03_bud_qty = sbcpq_fp03_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp03_qty > 0 AND v_fp03_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp03_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp03_bud_qty = sbcpq_fp03_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp02_qty > 0 AND v_fp02_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp02_bud_qty = sbcpq_fp02_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp02_qty > 0 AND v_fp02_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp02_bud_qty = sbcpq_fp02_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                            IF v_fp01_qty > 0 AND v_fp01_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp01_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp01_bud_qty = sbcpq_fp01_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                                    END LOOP;
"
"
"
"                                 END IF;
"
"
"
"
"
"
"
"    END LOOP;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"
"
"          begin
"
"
"
"
"
"                                  select NVL(MAX(srcln_price),0)
"
"                                    into v_fg_unit_cost
"
"                                  from SALES_RATE_CONTR_HD,SALES_RATE_CONTR_LN
"
"                                  where SRCHD_BU = SRCLN_BU
"
"                                    AND SRCHD_PLNT = SRCLN_PLNT
"
"                                    AND SRCHD_DOC_NO = SRCLN_DOC_NO
"
"                                    AND SRCHD_STATUS = 'A'
"
"                                    AND srchd_bu = p_bu
"
"                                    and srchd_cust_id = cr1.sbas_cust_id
"
"                                    and srcln_prod_id = cr1.sbas_fg_prod_id
"
"                                      and srcln_prod_rev = cr1.sbas_fg_prod_rev;
"
"
"
"                                      exception
"
"                                      when no_data_found then
"
"                                      v_fg_unit_cost := 0;
"
"                          end;
"
"
"
"
"
"
"
"                            SELECT NVL(MAX(fsph_qty_per_box),0)
"
"                INTO   v_pack_size
"
"                  FROM fg_std_pack_hd
"
"                 WHERE fsph_bu = p_bu
"
"                   AND fsph_status = 'A'
"
"                   AND fsph_fg_prod_id = cr1.sbas_fg_prod_id
"
"                   AND fsph_fg_prod_rev = cr1.sbas_fg_prod_rev
"
"                   AND fsph_cust_id = cr1.sbas_cust_id;
"
"
"
"
"
"                     IF v_pack_size >= ROUND(cr1.Sal_Bud_Qry) THEN
"
"                         v_tot_bud_qty1 := v_pack_size;
"
"                     ELSIF v_pack_size = 0 THEN
"
"                            v_tot_bud_qty1 := ROUND(cr1.Sal_Bud_Qry);
"
"                     ELSIF v_pack_size < ROUND(cr1.Sal_Bud_Qry)  THEN
"
"
"
"                         v_quo :=  (ROUND(cr1.Sal_Bud_Qry) / v_pack_size);
"
"                     v_rem := MOD (ROUND(cr1.Sal_Bud_Qry), v_pack_size);
"
"                        v_tot_bud_qty1 := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"                       END IF;
"
"
"
"
"
"            v_tot_bud_qty1 := floor(v_tot_bud_qty1);
"
"
"
"
"
"            v_month_qty := ROUND(v_tot_bud_qty1/12);
"
"
"
"
"
"                IF v_pack_size >= ROUND(v_month_qty) THEN
"
"                         v_month_qty := v_pack_size;
"
"                     ELSIF v_pack_size = 0 THEN
"
"                            v_month_qty := ROUND(v_month_qty);
"
"                     ELSIF v_pack_size < ROUND(v_month_qty)  THEN
"
"
"
"                         v_quo :=  (ROUND(v_month_qty) / v_pack_size);
"
"                     v_rem := MOD (ROUND(v_month_qty), v_pack_size);
"
"                        v_month_qty := ((v_quo * v_pack_size) + (case when v_rem > 0 THEN (v_pack_size - v_rem) ELSE 0 END));
"
"
"
"
"
"                       END IF;
"
"
"
"                       v_month_qty := floor(v_month_qty);
"
"
"
"
"
"
"
"
"
"      INSERT INTO sale_bud_cy_pln_qty (sbcpq_bu,
"
"                                       sbcpq_doc_no,
"
"                                       sbcpq_rev_no,
"
"                                       sbcpq_seq_no,
"
"                                       sbcpq_cust_id,
"
"                                       sbcpq_fg_prod_id,
"
"                                       sbcpq_fg_prod_rev,
"
"                                       sbcpq_bud_sale_qty,
"
"                                       sbcpq_unit_price,
"
"                                       sbcpq_bud_amt,
"
"                                       sbcpq_fp01_bud_qty,
"
"                                       sbcpq_apr_val,
"
"                                       sbcpq_fp02_bud_qty,
"
"                                       sbcpq_may_val,
"
"                                       sbcpq_fp03_bud_qty,
"
"                                       sbcpq_jun_val,
"
"                                       sbcpq_fp04_bud_qty,
"
"                                       sbcpq_jul_val,
"
"                                       sbcpq_fp05_bud_qty,
"
"                                       sbcpq_aug_val,
"
"                                       sbcpq_fp06_bud_qty,
"
"                                       sbcpq_sep_val,
"
"                                       sbcpq_fp07_bud_qty,
"
"                                       sbcpq_oct_val,
"
"                                       sbcpq_fp08_bud_qty,
"
"                                       sbcpq_nov_val,
"
"                                       sbcpq_fp09_bud_qty,
"
"                                       sbcpq_dec_val,
"
"                                       sbcpq_fp10_bud_qty,
"
"                                       sbcpq_jan_val,
"
"                                       sbcpq_fp11_bud_qty,
"
"                                       sbcpq_feb_val,
"
"                                       sbcpq_fp12_bud_qty,
"
"                                       sbcpq_mar_val,
"
"                                       sbcpq_cre_by,
"
"                                       sbcpq_cre_emp_id,
"
"                                       sbcpq_cre_ip_addr,
"
"                                       sbcpq_cre_os_user,
"
"                                       sbcpq_cre_date)
"
"                        VALUES(p_bu,
"
"                               p_doc_no,
"
"                               p_rev_no,
"
"                              v_seq_no,
"
"                              cr1.sbas_cust_id,
"
"                              cr1.sbas_fg_prod_id,
"
"                              cr1.sbas_fg_prod_rev,
"
"                              v_tot_bud_qty1,
"
"                              v_fg_unit_cost,
"
"                              v_tot_bud_qty1 * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              v_month_qty,
"
"                              v_month_qty * v_fg_unit_cost,
"
"                              p_user,
"
"                              p_user_emp,
"
"                              v_ip_addr,
"
"                              v_os_user,
"
"                              SYSDATE);
"
"
"
"                              --v_tot_bud_qty := ROUND(cr1.Sal_Bud_Qry/12)*12;
"
"
"
"
"
"
"
"                             UPDATE sale_bud_cy_pln_qty
"
"                SET sbcpq_bud_sale_qty = (sbcpq_fp01_bud_qty + sbcpq_fp02_bud_qty + sbcpq_fp03_bud_qty + sbcpq_fp04_bud_qty +
"
"                      sbcpq_fp05_bud_qty + sbcpq_fp06_bud_qty + sbcpq_fp07_bud_qty + sbcpq_fp08_bud_qty +
"
"                      sbcpq_fp09_bud_qty + sbcpq_fp10_bud_qty + sbcpq_fp11_bud_qty + sbcpq_fp12_bud_qty
"
"                      )
"
"                      where sbcpq_bu = p_bu
"
"                        AND sbcpq_doc_no = p_doc_no
"
"                        AND sbcpq_rev_no = p_rev_no
"
"                        AND sbcpq_seq_no = v_seq_no;
"
"
"
"                UPDATE sale_bud_cy_pln_qty
"
"                SET sbcpq_bud_amt = sbcpq_bud_sale_qty * v_fg_unit_cost
"
"                      where sbcpq_bu = p_bu
"
"                        AND sbcpq_doc_no = p_doc_no
"
"                        AND sbcpq_rev_no = p_rev_no
"
"                        AND sbcpq_seq_no = v_seq_no;
"
"
"
"                        select sbcpq_bud_sale_qty
"
"                          into v_tot_bud_qty1
"
"                          FROM sale_bud_cy_pln_qty
"
"                         WHERE sbcpq_bu = p_bu
"
"                                       AND sbcpq_doc_no = p_doc_no
"
"                           AND sbcpq_rev_no = p_rev_no
"
"                           AND sbcpq_seq_no = v_seq_no;
"
"
"
"
"
"                              SELECT (sbcpq_fp01_bud_qty + sbcpq_fp02_bud_qty + sbcpq_fp03_bud_qty +
"
"                                     sbcpq_fp04_bud_qty +  sbcpq_fp05_bud_qty + sbcpq_fp06_bud_qty +
"
"                                     sbcpq_fp07_bud_qty + sbcpq_fp08_bud_qty + sbcpq_fp09_bud_qty +
"
"                                     sbcpq_fp10_bud_qty + sbcpq_fp11_bud_qty + sbcpq_fp12_bud_qty)  tot_bud_qty
"
"                                       into v_tot_bud_qty
"
"                                FROM sale_bud_cy_pln_qty
"
"                               WHERE sbcpq_bu = p_bu
"
"                                 AND sbcpq_doc_no = p_doc_no
"
"                              And SBCPQ_REV_NO = P_REV_NO
"
"                                 AND sbcpq_seq_no = v_seq_no;
"
"
"
"
"
"
"
"                                 v_diff_qty := 0;
"
"
"
"                                /* IF v_seq_no = 6 THEN
"
"                          RAISE_APPLICATION_ERROR(-20999,'HRM' || ROUND(cr1.Sal_Bud_Qry) ||'/'|| v_tot_bud_qty ||'/'||v_diff_qty ||'/'||ROUND(cr1.Sal_Bud_Qry/12));
"
"                                 END IF;*/
"
"
"
"
"
"                                 IF ROUND(v_tot_bud_qty1) >= v_tot_bud_qty THEN
"
"                                     v_diff_qty := v_tot_bud_qty1 - v_tot_bud_qty;
"
"                                 END IF;
"
"
"
"
"
"
"
"
"
"                                 IF v_diff_qty <> 0 THEN
"
"                                     UPDATE sale_bud_cy_pln_qty
"
"                                        SET sbcpq_fp12_bud_qty = case when (sbcpq_fp12_bud_qty + v_diff_qty) < 0 then 0 else sbcpq_fp12_bud_qty + v_diff_qty end
"
"                                     WHERE sbcpq_bu = p_bu
"
"                                       AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                       AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                 END IF;
"
"
"
"                                 IF ROUND(v_tot_bud_qty1) < v_tot_bud_qty THEN
"
"
"
"                                    v_diff_qty := v_tot_bud_qty - ROUND(v_tot_bud_qty1);
"
"
"
"                                    v_rem_diff_qty := v_diff_qty;
"
"                                    v_elg_diff_qty := 0;
"
"
"
"                                    WHILE (v_rem_diff_qty >0)
"
"                                    LOOP
"
"
"
"                                        SELECT sbcpq_fp01_bud_qty , sbcpq_fp02_bud_qty , sbcpq_fp03_bud_qty ,
"
"                              sbcpq_fp04_bud_qty ,  sbcpq_fp05_bud_qty , sbcpq_fp06_bud_qty ,
"
"                              sbcpq_fp07_bud_qty , sbcpq_fp08_bud_qty , sbcpq_fp09_bud_qty ,
"
"                              sbcpq_fp10_bud_qty , sbcpq_fp11_bud_qty , sbcpq_fp12_bud_qty
"
"                             into v_fp01_qty,v_fp02_qty,v_fp03_qty,v_fp04_qty,v_fp05_qty,
"
"                                  v_fp06_qty,v_fp07_qty,v_fp08_qty,v_fp09_qty,v_fp10_qty,
"
"                                  v_fp11_qty,v_fp12_qty
"
"                             FROM sale_bud_cy_pln_qty
"
"                            WHERE sbcpq_bu = p_bu
"
"                              AND sbcpq_doc_no = p_doc_no
"
"                              AND SBCPQ_REV_NO = P_REV_NO
"
"                                           AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                           IF v_fp12_qty > 0 AND v_fp12_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp12_bud_qty = sbcpq_fp12_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"
"
"                                           ELSIF   v_fp12_qty > 0 AND v_fp12_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"
"
"                                              v_elg_diff_qty := v_fp12_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp12_bud_qty = sbcpq_fp12_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp11_qty > 0 AND v_fp11_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp11_bud_qty = sbcpq_fp11_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                            ELSIF v_fp11_qty > 0 AND v_fp11_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp11_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp11_bud_qty = sbcpq_fp11_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp10_qty > 0 AND v_fp10_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp10_bud_qty = sbcpq_fp10_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                                 ELSIF v_fp10_qty > 0 AND v_fp10_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp10_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp10_bud_qty = sbcpq_fp10_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp09_qty > 0 AND v_fp09_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp09_bud_qty = sbcpq_fp09_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"                                             ELSIF v_fp09_qty > 0 AND v_fp09_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp09_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp09_bud_qty = sbcpq_fp09_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp08_qty > 0 AND v_fp08_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp08_bud_qty = sbcpq_fp08_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                            ELSIF v_fp08_qty > 0 AND v_fp08_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp08_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp08_bud_qty = sbcpq_fp08_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                            IF v_fp07_qty > 0 AND v_fp07_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp07_bud_qty = sbcpq_fp07_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                                ELSIF v_fp07_qty > 0 AND v_fp07_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp07_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp07_bud_qty = sbcpq_fp07_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                            IF v_fp06_qty > 0 AND v_fp06_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp06_bud_qty = sbcpq_fp06_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp06_qty > 0 AND v_fp06_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp06_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp06_bud_qty = sbcpq_fp06_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                        IF v_fp05_qty > 0 AND v_fp05_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp05_bud_qty = sbcpq_fp05_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"                                           ELSIF v_fp05_qty > 0 AND v_fp05_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp05_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp05_bud_qty = sbcpq_fp05_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                        IF v_fp04_qty > 0 AND v_fp04_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp04_bud_qty = sbcpq_fp04_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp04_qty > 0 AND v_fp04_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp04_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp04_bud_qty = sbcpq_fp04_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                        IF v_fp03_qty > 0 AND v_fp03_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp03_bud_qty = sbcpq_fp03_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp03_qty > 0 AND v_fp03_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp03_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp03_bud_qty = sbcpq_fp03_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"
"
"                            IF v_fp02_qty > 0 AND v_fp02_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp02_bud_qty = sbcpq_fp02_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                               ELSIF v_fp02_qty > 0 AND v_fp02_qty >= v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_rem_diff_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp02_bud_qty = sbcpq_fp02_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                            IF v_fp01_qty > 0 AND v_fp01_qty < v_rem_diff_qty AND v_rem_diff_qty > 0  THEN
"
"                                              v_elg_diff_qty := v_fp01_qty;
"
"                                              v_rem_diff_qty := v_rem_diff_qty - v_elg_diff_qty;
"
"
"
"                                               UPDATE sale_bud_cy_pln_qty
"
"                                      SET sbcpq_fp01_bud_qty = sbcpq_fp01_bud_qty - v_elg_diff_qty
"
"                                   WHERE sbcpq_bu = p_bu
"
"                                     AND sbcpq_doc_no = p_doc_no
"
"                                    AND SBCPQ_REV_NO = P_REV_NO
"
"                                               AND sbcpq_seq_no = v_seq_no;
"
"
"
"                                               EXIT WHEN v_rem_diff_qty <=0;
"
"
"
"                                           END IF;
"
"
"
"
"
"                                    END LOOP;
"
"
"
"                                 END IF;
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
"    END LOOP;
"
"
"
"
"
"
"
"    COMMIT;
"
"
"
"  END proc_load_plan_frm_sal_bud;
"
"
"
"  PROCEDURE proc_load_prod_frm_sal_bud(p_bu            VARCHAR2,
"
"                                       p_doc_no            VARCHAR2,
"
"                                       P_REV_NO NUMBER,
"
"                                       p_user            VARCHAR2,
"
"                                       p_user_emp       VARCHAR2
"
"                                      )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT sbcpq_cust_id,sbcpq_fg_prod_id,sbcpq_fg_prod_rev,sbcpq_bud_sale_qty,
"
"  sbcpq_fp01_bud_qty,
"
"  sbcpq_fp02_bud_qty,
"
"  sbcpq_fp03_bud_qty,
"
"  sbcpq_fp04_bud_qty,
"
"  sbcpq_fp05_bud_qty,
"
"  sbcpq_fp06_bud_qty,
"
"  sbcpq_fp07_bud_qty,
"
"  sbcpq_fp08_bud_qty,
"
"  sbcpq_fp09_bud_qty,
"
"  sbcpq_fp10_bud_qty,
"
"  sbcpq_fp11_bud_qty,
"
"sbcpq_fp12_bud_qty
"
"    FROM sale_bud_cy_pln_qty
"
"   WHERE sbcpq_bu = p_bu
"
"     AND sbcpq_doc_no = p_doc_no
"
"     AND SBCPQ_REV_NO = P_REV_NO
"
"     --ORDER BY sbcpq_cust_id,sbcpq_fg_prod_id;
"
"     ORDER BY sbcpq_seq_no;
"
"
"
"    v_seq_no    NUMBER(5);
"
"    v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"    v_rej_pct   NUMBER(5);
"
"    v_purge_pct NUMBER(5);
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM sale_bud_prod_qty
"
"     WHERE sbpq_bu = p_bu
"
"       AND sbpq_doc_no = p_doc_no
"
"       AND SBPQ_REV_NO = P_REV_NO;
"
"
"
"    v_seq_no := 0;
"
"
"
"    BEGIN
"
"      SELECT sbh_rej_pct,sbh_purge_pct
"
"        INTO v_rej_pct,v_purge_pct
"
"        FROM sale_bud_hd
"
"       WHERE sbh_bu = p_bu
"
"         AND sbh_doc_no = p_doc_no
"
"         AND SBH_REV_NO = P_REV_NO;
"
"    END;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      SELECT nvl(max(SBPR_REJ_PCT),0),NVL(MAX(SBPR_PUR_PCT),0)
"
"        INTO V_REJ_PCT,V_PURGE_PCT
"
"        FROM SALE_BUD_PUR_REJ
"
"       WHERE SBPR_BU  = P_BU
"
"         and SBPR_DOC_NO = P_DOC_NO
"
"         and SBPR_REV_NO = P_REV_NO
"
"         AND SBPR_PROD_ID = cr1.sbcpq_fg_prod_id
"
"         AND SBPR_PROD_REV = CR1.SBCPQ_FG_PROD_REV;
"
"
"
"      INSERT INTO sale_bud_prod_qty(sbpq_bu,
"
"                                    sbpq_doc_no,
"
"                                    SBPQ_REV_NO ,
"
"                                    sbpq_seq_no,
"
"                                    sbpq_cust_id,
"
"                                    sbpq_fg_prod_id,
"
"                                    sbpq_fg_prod_rev,
"
"                                    sbpq_bud_prod_qty,
"
"                                    sbpq_purge_pct,
"
"                                    sbpq_rej_pct,
"
"                                    sbpq_fp01_prod_bud_qty,
"
"                                    sbpq_fp02_prod_bud_qty,
"
"                                    sbpq_fp03_prod_bud_qty,
"
"                                    sbpq_fp04_prod_bud_qty,
"
"                                    sbpq_fp05_prod_bud_qty,
"
"                                    sbpq_fp06_prod_bud_qty,
"
"                                    sbpq_fp07_prod_bud_qty,
"
"                                    sbpq_fp08_prod_bud_qty,
"
"                                    sbpq_fp09_prod_bud_qty,
"
"                                    sbpq_fp10_prod_bud_qty,
"
"                                    sbpq_fp11_prod_bud_qty,
"
"                                    sbpq_fp12_prod_bud_qty,
"
"                                    sbpq_cre_by,
"
"                                    sbpq_cre_emp_id,
"
"                                    sbpq_cre_ip_addr,
"
"                                    sbpq_cre_os_user,
"
"                                    sbpq_cre_date)
"
"               VALUES (p_bu,
"
"                   p_doc_no,
"
"                   P_REV_NO,
"
"                   v_seq_no,
"
"                   cr1.sbcpq_cust_id,
"
"                   cr1.sbcpq_fg_prod_id,
"
"                   cr1.sbcpq_fg_prod_rev,
"
"                   ROUND(cr1.sbcpq_bud_sale_qty),
"
"                   v_purge_pct,
"
"                   v_rej_pct,
"
"                   cr1.sbcpq_fp01_bud_qty,
"
"                   cr1.sbcpq_fp02_bud_qty,
"
"                   cr1.sbcpq_fp03_bud_qty,
"
"                   cr1.sbcpq_fp04_bud_qty,
"
"                   cr1.sbcpq_fp05_bud_qty,
"
"                   cr1.sbcpq_fp06_bud_qty,
"
"                   cr1.sbcpq_fp07_bud_qty,
"
"                   cr1.sbcpq_fp08_bud_qty,
"
"                   cr1.sbcpq_fp09_bud_qty,
"
"                   cr1.sbcpq_fp10_bud_qty,
"
"                   cr1.sbcpq_fp11_bud_qty,
"
"                   cr1.sbcpq_fp12_bud_qty,
"
"                   p_user,
"
"                   p_user_emp,
"
"                   v_ip_addr,
"
"                   v_os_user,
"
"                   SYSDATE
"
"                  );
"
"
"
"
"
"
"
"    END LOOP;
"
"
"
"    COMMIT;
"
"
"
"  END proc_load_prod_frm_sal_bud;
"
"
"
"  PROCEDURE proc_load_rm_frm_sal_bud(p_bu            VARCHAR2,
"
"                                     p_doc_no            VARCHAR2,
"
"                                     P_REV_NO NUMBER,
"
"                                     p_user            VARCHAR2,
"
"                                     p_user_emp       VARCHAR2
"
"                                    )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM sale_bud_prod_qty
"
"   WHERE sbpq_bu = p_bu
"
"     AND sbpq_doc_no = p_doc_no
"
"     AND SBPQ_REV_NO = P_REV_NO
"
"   ORDER BY sbpq_seq_no;
"
"
"
"  CURSOR c2(c_prod_id    VARCHAR2,
"
"            c_prod_rev    NUMBER)  IS
"
"  SELECT bomhd_prod_id,bomhd_prod_rev,bomhd_qty,rouln_oprn_seq_no,rouln_oprn_no,
"
"         rouln_oprn_ln_seq,rouln_oprn_id,
"
"         rouln_oprn_flag,bomln_item_seq_no,bomln_prod_id,bomln_prod_rev,
"
"         bomln_required_qty/bomln_conv_factor bomln_required_qty_per_batch,
"
"         (bomln_required_qty/bomhd_qty)/bomln_conv_factor bomln_required_qty
"
"    FROM bom_hd,routing_ln,bom_ln
"
"   WHERE bomhd_bu = rouln_bu
"
"     AND bomhd_plnt = rouln_plnt
"
"     AND bomhd_bom_no = rouln_bom_no
"
"     AND rouln_bu = bomln_bu(+)
"
"     AND rouln_plnt = bomln_plnt(+)
"
"     AND rouln_bom_no = bomln_bom_no(+)
"
"     AND rouln_oprn_seq_no = bomln_oprn_seq_no(+)
"
"     AND bomhd_bu = p_bu
"
"     AND bomhd_prod_id = c_prod_id
"
"     AND bomhd_prod_rev = c_prod_rev
"
"     AND (TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"     AND bomhd_primary = 'Y'
"
"     AND bomhd_status = 'A'
"
"     ORDER BY rouln_oprn_no,bomln_item_seq_no;
"
"
"
"
"
"
"
"
"
"  CURSOR c_rms IS
"
"  SELECT sbrq_rm_prod_id,sbrq_rm_prod_rev,
"
"         SUM(sbrq_fp01_rm_qty) sbrq_fp01_rm_qty,
"
"     SUM(sbrq_fp02_rm_qty) sbrq_fp02_rm_qty,
"
"     SUM(sbrq_fp03_rm_qty) sbrq_fp03_rm_qty,
"
"     SUM(sbrq_fp04_rm_qty) sbrq_fp04_rm_qty,
"
"     SUM(sbrq_fp05_rm_qty) sbrq_fp05_rm_qty,
"
"     SUM(sbrq_fp06_rm_qty) sbrq_fp06_rm_qty,
"
"     SUM(sbrq_fp07_rm_qty) sbrq_fp07_rm_qty,
"
"     SUM(sbrq_fp08_rm_qty) sbrq_fp08_rm_qty,
"
"     SUM(sbrq_fp09_rm_qty) sbrq_fp09_rm_qty,
"
"     SUM(sbrq_fp10_rm_qty) sbrq_fp10_rm_qty,
"
"     SUM(sbrq_fp11_rm_qty) sbrq_fp11_rm_qty,
"
"     SUM(sbrq_fp12_rm_qty) sbrq_fp12_rm_qty
"
"    FROM sale_bud_rm_qty
"
"   WHERE sbrq_bu = p_bu
"
"     AND sbrq_doc_no = p_doc_no
"
"     AND SBRQ_REV_NO = P_REV_NO
"
"     AND sbrq_rm_prod_id IS NOT NULL
"
"     AND not exists (select 1 from BOM_HD WHERE BOMHD_BU = SBRQ_BU AND BOMHD_PROD_ID = SBRQ_RM_PROD_ID AND BOMHD_PROD_REV = SBRQ_RM_PROD_REV
"
"     AND BOMHD_STATUS = 'A'
"
"     AND bomhd_primary = 'Y')
"
"       GROUP BY sbrq_rm_prod_id,sbrq_rm_prod_rev,sbrq_bu
"
"   ORDER BY sbrq_rm_prod_id;
"
"
"
"    v_seq_no    NUMBER(5);
"
"    v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"    v_curcy    VARCHAR2(5);
"
"    v_ex_rate   NUMBER(13);
"
"    v_pkg_cost  NUMBER(5,2);
"
"
"
"
"
"    v_fp01_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp02_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp03_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp04_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp05_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp06_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp07_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp08_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp09_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp10_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp11_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_fp12_rqrd_qty            NUMBER(12,3) := 0;
"
"
"
"    v_rm_rqrd_qty            NUMBER(12,3) := 0;
"
"    v_proc_seq_no            NUMBER;
"
"    v_fp01_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp02_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp03_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp04_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp05_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp06_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp07_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp08_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp09_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp10_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp11_oprn_qty            NUMBER(12,3) := 0;
"
"    v_fp12_oprn_qty            NUMBER(12,3) := 0;
"
"    v_par_per_proc_qty            NUMBER(12,3) := 0;
"
"    v_rm_cd_per_kg            NUMBER(12,3);
"
"    v_rm_fwd_chrg_kg        NUMBER(12,3);
"
"    v_rm_unit_cost   NUMBER(17,5);
"
"    v_bc_rm_unit_cost   NUMBER(17,5);
"
"    v_tot_value   NUMBER(17,5);
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM sale_bud_rm_smry
"
"     WHERE sbrs_bu = p_bu
"
"       AND sbrs_doc_no = p_doc_no
"
"       AND SBRS_REV_NO = P_REV_NO;
"
"
"
"    DELETE FROM sale_bud_rm_qty
"
"     WHERE sbrq_bu = p_bu
"
"       AND sbrq_doc_no = p_doc_no
"
"       AND SBRQ_REV_NO  = P_REV_NO;
"
"
"
"         DELETE FROM sale_bud_rm_qty1
"
"            WHERE sbrq_bu = p_bu
"
"       AND sbrq_doc_no = p_doc_no
"
"       AND SBRQ_REV_NO = P_rEV_NO;
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
"     DELETE so_budget_proc_qty
"
"      WHERE sbpq_bu = p_bu
"
"        AND sbpq_doc_no = p_doc_no
"
"        AND SBPQ_REV_NO = P_REV_NO ;
"
"
"
"
"
"
"
"    v_seq_no := 0;
"
"
"
"        BEGIN
"
"      SELECT sbh_currency,sbh_exchange_rate,sbh_rm_pkg_cost_pct
"
"        INTO v_curcy,v_ex_rate,v_pkg_cost
"
"        FROM sale_bud_hd
"
"       WHERE sbh_bu = p_bu
"
"         AND sbh_doc_no = p_doc_no
"
"         AND SBH_REV_NO = P_REV_NO;
"
"    END;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      FOR cr2 IN c2(cr1.sbpq_fg_prod_id,cr1.sbpq_fg_prod_rev)
"
"      LOOP
"
"
"
"      SELECT NVL(MAX(sbrq_seq_no),0) + 1
"
"        INTO v_seq_no
"
"        FROM sale_bud_rm_qty
"
"       WHERE sbrq_bu = p_bu
"
"         AND sbrq_doc_no = p_doc_no
"
"         AND SBRQ_REV_NO = P_REV_NO;
"
"
"
"         IF cr2.bomln_required_qty > 0 THEN
"
"         v_rm_rqrd_qty := ROUND((cr1.sbpq_bud_prod_qty * cr2.bomln_required_qty) + ((cr1.sbpq_bud_prod_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_bud_prod_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"
"
"
"
"         v_fp01_rqrd_qty := ROUND((cr1.sbpq_fp01_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp01_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp01_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp02_rqrd_qty := ROUND((cr1.sbpq_fp02_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp02_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp02_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp03_rqrd_qty := ROUND((cr1.sbpq_fp03_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp03_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp03_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp04_rqrd_qty := ROUND((cr1.sbpq_fp04_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp04_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp04_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp05_rqrd_qty := ROUND((cr1.sbpq_fp05_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp05_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp05_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp06_rqrd_qty := ROUND((cr1.sbpq_fp06_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp06_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp06_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp07_rqrd_qty := ROUND((cr1.sbpq_fp07_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp07_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp07_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp08_rqrd_qty := ROUND((cr1.sbpq_fp08_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp08_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp08_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp09_rqrd_qty := ROUND((cr1.sbpq_fp09_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp09_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp09_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp10_rqrd_qty := ROUND((cr1.sbpq_fp10_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp10_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp10_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp11_rqrd_qty := ROUND((cr1.sbpq_fp11_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp11_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp11_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"         v_fp12_rqrd_qty := ROUND((cr1.sbpq_fp12_prod_bud_qty * cr2.bomln_required_qty) + ((cr1.sbpq_fp12_prod_bud_qty * cr2.bomln_required_qty) * (cr1.sbpq_purge_pct/100)) + (((cr1.sbpq_fp12_prod_bud_qty * cr2.bomln_required_qty) / (100 - cr1.sbpq_purge_pct)) * cr1.sbpq_rej_pct));
"
"             ELSE
"
"
"
"                 v_rm_rqrd_qty :=0;
"
"                 v_fp01_rqrd_qty :=0;
"
"                 v_fp02_rqrd_qty :=0;
"
"                 v_fp03_rqrd_qty :=0;
"
"                 v_fp04_rqrd_qty :=0;
"
"                 v_fp05_rqrd_qty :=0;
"
"                 v_fp06_rqrd_qty :=0;
"
"                 v_fp07_rqrd_qty :=0;
"
"                 v_fp08_rqrd_qty :=0;
"
"                 v_fp09_rqrd_qty :=0;
"
"                 v_fp10_rqrd_qty :=0;
"
"                 v_fp11_rqrd_qty :=0;
"
"                 v_fp12_rqrd_qty :=0;
"
"
"
"
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
"INSERT INTO sale_bud_rm_qty1(    sbrq_bu,
"
"                    sbrq_doc_no,
"
"                    SBRQ_REV_NO,
"
"                    sbrq_seq_no,
"
"                    sbrq_cust_id,
"
"                    sbrq_fg_prod_id,
"
"                    sbrq_fg_prod_rev,
"
"                    sbrq_fg_qty,
"
"                    sbrq_batch_qty,
"
"                    sbrq_par_prod_id,
"
"                    sbrq_par_prod_rev,
"
"                    sbrq_par_qty    ,
"
"                    sbrq_oprn_ln_seq,
"
"                    sbrq_oprn_id,
"
"                    sbrq_oprn_flag,
"
"                    sbrq_rm_prod_id,
"
"                    sbrq_rm_prod_rev,
"
"                    sbrq_bom_qty,
"
"                    sbrq_rm_qty,
"
"                    sbrq_purge_pct,
"
"                    sbrq_rej_pct,
"
"                    sbrq_fp01_rm_qty,
"
"                    sbrq_fp02_rm_qty,
"
"                    sbrq_fp03_rm_qty,
"
"                    sbrq_fp04_rm_qty,
"
"                    sbrq_fp05_rm_qty,
"
"                    sbrq_fp06_rm_qty,
"
"                    sbrq_fp07_rm_qty,
"
"                    sbrq_fp08_rm_qty,
"
"                    sbrq_fp09_rm_qty,
"
"                    sbrq_fp10_rm_qty,
"
"                    sbrq_fp11_rm_qty,
"
"                    sbrq_fp12_rm_qty,
"
"                    sbrq_cre_by,
"
"                    sbrq_cre_emp_id,
"
"                    sbrq_cre_ip_addr,
"
"                    sbrq_cre_os_user,
"
"                    sbrq_cre_date,
"
"                    sbrq_upd_by,
"
"                    sbrq_upd_emp_id,
"
"                    sbrq_upd_ip_addr,
"
"                    sbrq_upd_os_user,
"
"                    sbrq_upd_date,
"
"                    sbrq_oprn_no,
"
"                    sbrq_bom_qty_per_batch
"
"                       )
"
"                     VALUES(
"
"                    p_bu,
"
"                    p_doc_no,
"
"                    P_REV_NO,
"
"                    v_seq_no,
"
"                    cr1.sbpq_cust_id,
"
"                    cr1.sbpq_fg_prod_id,
"
"                    cr1.sbpq_fg_prod_rev,
"
"                    cr1.sbpq_bud_prod_qty,
"
"                    cr2.bomhd_qty,
"
"                    cr2.bomhd_prod_id,
"
"                    cr2.bomhd_prod_rev,
"
"                    cr1.sbpq_bud_prod_qty    ,
"
"                    cr2.rouln_oprn_ln_seq,
"
"                    cr2.rouln_oprn_id,
"
"                    cr2.rouln_oprn_flag,
"
"                    cr2.bomln_prod_id,
"
"                    cr2.bomln_prod_rev,
"
"                    NVL(cr2.bomln_required_qty,0),
"
"                    v_rm_rqrd_qty,
"
"                    cr1.sbpq_purge_pct,
"
"                    cr1.sbpq_rej_pct,
"
"                    v_fp01_rqrd_qty,
"
"                    v_fp02_rqrd_qty,
"
"                    v_fp03_rqrd_qty,
"
"                    v_fp04_rqrd_qty,
"
"                    v_fp05_rqrd_qty,
"
"                    v_fp06_rqrd_qty,
"
"                    v_fp07_rqrd_qty,
"
"                    v_fp08_rqrd_qty,
"
"                    v_fp09_rqrd_qty,
"
"                    v_fp10_rqrd_qty,
"
"                    v_fp11_rqrd_qty,
"
"                    v_fp12_rqrd_qty,
"
"                    p_user,
"
"                    func_find_emp_id(p_bu,p_user),
"
"                    audit_info.get_ip_address,
"
"                    audit_info.get_os_user,
"
"                    SYSDATE,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    cr2.rouln_oprn_no,
"
"            nvl(cr2.bomln_required_qty_per_batch                    ,0)
"
"                    );
"
"
"
"
"
"        IF cr2.bomln_prod_id IS NOT NULL THEN
"
"
"
"    INSERT INTO sale_bud_rm_qty(    sbrq_bu,
"
"                    sbrq_doc_no,
"
"                    SBRQ_REV_NO,
"
"                    sbrq_seq_no,
"
"                    sbrq_cust_id,
"
"                    sbrq_fg_prod_id,
"
"                    sbrq_fg_prod_rev,
"
"                    sbrq_fg_qty,
"
"                    sbrq_batch_qty,
"
"                    sbrq_par_prod_id,
"
"                    sbrq_par_prod_rev,
"
"                    sbrq_par_qty    ,
"
"                    sbrq_oprn_ln_seq,
"
"                    sbrq_oprn_id,
"
"                    sbrq_oprn_flag,
"
"                    sbrq_rm_prod_id,
"
"                    sbrq_rm_prod_rev,
"
"                    sbrq_bom_qty,
"
"                    sbrq_rm_qty,
"
"                    sbrq_purge_pct,
"
"                    sbrq_rej_pct,
"
"                    sbrq_fp01_rm_qty,
"
"                    sbrq_fp02_rm_qty,
"
"                    sbrq_fp03_rm_qty,
"
"                    sbrq_fp04_rm_qty,
"
"                    sbrq_fp05_rm_qty,
"
"                    sbrq_fp06_rm_qty,
"
"                    sbrq_fp07_rm_qty,
"
"                    sbrq_fp08_rm_qty,
"
"                    sbrq_fp09_rm_qty,
"
"                    sbrq_fp10_rm_qty,
"
"                    sbrq_fp11_rm_qty,
"
"                    sbrq_fp12_rm_qty,
"
"                    sbrq_cre_by,
"
"                    sbrq_cre_emp_id,
"
"                    sbrq_cre_ip_addr,
"
"                    sbrq_cre_os_user,
"
"                    sbrq_cre_date,
"
"                    sbrq_upd_by,
"
"                    sbrq_upd_emp_id,
"
"                    sbrq_upd_ip_addr,
"
"                    sbrq_upd_os_user,
"
"                    sbrq_upd_date,
"
"                    sbrq_oprn_no,
"
"                    sbrq_bom_qty_per_batch
"
"                       )
"
"                     VALUES(
"
"                    p_bu,
"
"                    p_doc_no,
"
"                    P_REV_NO,
"
"                    v_seq_no,
"
"                    cr1.sbpq_cust_id,
"
"                    cr1.sbpq_fg_prod_id,
"
"                    cr1.sbpq_fg_prod_rev,
"
"                    cr1.sbpq_bud_prod_qty,
"
"                    cr2.bomhd_qty,
"
"                    cr2.bomhd_prod_id,
"
"                    cr2.bomhd_prod_rev,
"
"                    cr1.sbpq_bud_prod_qty    ,
"
"                    cr2.rouln_oprn_ln_seq,
"
"                    cr2.rouln_oprn_id,
"
"                    cr2.rouln_oprn_flag,
"
"                    cr2.bomln_prod_id,
"
"                    cr2.bomln_prod_rev,
"
"                    NVL(cr2.bomln_required_qty,0),
"
"                    v_rm_rqrd_qty,
"
"                    cr1.sbpq_purge_pct,
"
"                    cr1.sbpq_rej_pct,
"
"                    v_fp01_rqrd_qty,
"
"                    v_fp02_rqrd_qty,
"
"                    v_fp03_rqrd_qty,
"
"                    v_fp04_rqrd_qty,
"
"                    v_fp05_rqrd_qty,
"
"                    v_fp06_rqrd_qty,
"
"                    v_fp07_rqrd_qty,
"
"                    v_fp08_rqrd_qty,
"
"                    v_fp09_rqrd_qty,
"
"                    v_fp10_rqrd_qty,
"
"                    v_fp11_rqrd_qty,
"
"                    v_fp12_rqrd_qty,
"
"                    p_user,
"
"                    func_find_emp_id(p_bu,p_user),
"
"                    audit_info.get_ip_address,
"
"                    audit_info.get_os_user,
"
"                    SYSDATE,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    NULL,
"
"                    cr2.rouln_oprn_no,
"
"            cr2.bomln_required_qty_per_batch
"
"                    );
"
"
"
"                END IF;
"
"                    proc_load_bud_mtrl_dtl(
"
"                                p_bu            ,
"
"                                p_doc_no        ,
"
"                                P_REV_NO,
"
"                                cr1.sbpq_cust_id,
"
"                                cr1.sbpq_fg_prod_id        ,
"
"                                cr1.sbpq_fg_prod_rev        ,
"
"                                cr1.sbpq_bud_prod_qty        ,
"
"                                cr2.bomhd_prod_id        ,
"
"                                cr2.bomhd_prod_rev        ,
"
"                                cr1.sbpq_bud_prod_qty            ,
"
"                                cr2.bomln_prod_id        ,
"
"                                cr2.bomln_prod_rev        ,
"
"                                v_rm_rqrd_qty        ,
"
"                                v_fp01_rqrd_qty    ,
"
"                                v_fp02_rqrd_qty    ,
"
"                                v_fp03_rqrd_qty    ,
"
"                                v_fp04_rqrd_qty    ,
"
"                                v_fp05_rqrd_qty    ,
"
"                                v_fp06_rqrd_qty    ,
"
"                                v_fp07_rqrd_qty    ,
"
"                                v_fp08_rqrd_qty    ,
"
"                                v_fp09_rqrd_qty    ,
"
"                                v_fp10_rqrd_qty    ,
"
"                                v_fp11_rqrd_qty    ,
"
"                                v_fp12_rqrd_qty    ,
"
"                                cr1.sbpq_purge_pct        ,
"
"                                cr1.sbpq_rej_pct        ,
"
"                                p_user                ,
"
"                                p_user_emp
"
"                                );
"
"
"
"
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
"
"
"    v_proc_seq_no := 1;
"
"
"
"    FOR c_proc IN (select sbrq_cust_id,sbrq_par_prod_id,sbrq_par_prod_rev,sum(sbrq_par_qty) sbrq_par_qty,
"
"                       sbrq_oprn_id,sbrq_oprn_no,sbrq_oprn_ln_seq,sbrq_purge_pct,sbrq_rej_pct,sbrq_oprn_flag
"
"                FROM sale_bud_rm_qty1
"
"             WHERE sbrq_bu = p_bu
"
"                   AND sbrq_doc_no = p_doc_no
"
"                   AND SBRQ_REV_NO = P_REV_NO
"
"                GROUP BY sbrq_cust_id,sbrq_par_prod_id,sbrq_par_prod_rev,
"
"                          sbrq_oprn_id,sbrq_oprn_no,sbrq_oprn_ln_seq,sbrq_purge_pct,sbrq_rej_pct,sbrq_oprn_flag
"
"                  ORDER BY sbrq_cust_id,sbrq_par_prod_id,sbrq_oprn_no
"
"                  )
"
"                  LOOP
"
"
"
"                      v_par_per_proc_qty := ceil(c_proc.sbrq_par_qty/12);
"
"
"
"             v_fp01_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp02_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp03_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp04_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp05_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp06_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp07_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp08_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp09_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp10_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp11_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"             v_fp12_oprn_qty := ROUND(v_par_per_proc_qty + (v_par_per_proc_qty * (c_proc.sbrq_purge_pct/100)) + ((v_par_per_proc_qty / (100 - c_proc.sbrq_purge_pct)) * c_proc.sbrq_rej_pct));
"
"
"
"                      INSERT INTO so_budget_proc_qty(
"
"                        sbpq_bu        ,
"
"                        sbpq_doc_no,
"
"                        SBPQ_REV_NO,
"
"                        sbpq_seq_no,
"
"                        sbpq_cust_id,
"
"                        sbpq_prod_id,
"
"                        sbpq_prod_rev,
"
"                        sbpq_oprn_no,
"
"                        sbpq_oprn_ln_seq,
"
"                        sbpq_oprn_id,
"
"                        sbpq_oprn_flag,
"
"                        sbpq_oprn_qty,
"
"                        sbpq_purge_pct,
"
"                        sbpq_rej_pct,
"
"                        sbpq_fp01_oprn_qty,
"
"                        sbpq_fp02_oprn_qty,
"
"                        sbpq_fp03_oprn_qty,
"
"                        sbpq_fp04_oprn_qty,
"
"                        sbpq_fp05_oprn_qty,
"
"                        sbpq_fp06_oprn_qty,
"
"                        sbpq_fp07_oprn_qty,
"
"                        sbpq_fp08_oprn_qty,
"
"                        sbpq_fp09_oprn_qty,
"
"                        sbpq_fp10_oprn_qty,
"
"                        sbpq_fp11_oprn_qty,
"
"                        sbpq_fp12_oprn_qty,
"
"                        sbpq_cre_by,
"
"                        sbpq_cre_ip_addr,
"
"                        sbpq_cre_os_user,
"
"                        sbpq_cre_emp_id,
"
"                        sbpq_cre_date,
"
"                        sbpq_upd_by,
"
"                        sbpq_upd_ip_addr,
"
"                        sbpq_upd_os_user,
"
"                        sbpq_upd_emp_id,
"
"                        sbpq_upd_date
"
"                                                    )
"
"                          VALUES(
"
"                        p_bu        ,
"
"                        p_doc_no,
"
"                        P_REV_NO,
"
"                        v_proc_seq_no,
"
"                        c_proc.sbrq_cust_id,
"
"                        c_proc.sbrq_par_prod_id,
"
"                        c_proc.sbrq_par_prod_rev,
"
"                        c_proc.sbrq_oprn_no,
"
"                        c_proc.sbrq_oprn_ln_seq,
"
"                        c_proc.sbrq_oprn_id,
"
"                        c_proc.sbrq_oprn_flag,
"
"                        c_proc.sbrq_par_qty,
"
"                        c_proc.sbrq_purge_pct,
"
"                        c_proc.sbrq_rej_pct,
"
"                        v_fp01_oprn_qty,
"
"                        v_fp02_oprn_qty,
"
"                        v_fp03_oprn_qty,
"
"                        v_fp04_oprn_qty,
"
"                        v_fp05_oprn_qty,
"
"                        v_fp06_oprn_qty,
"
"                        v_fp07_oprn_qty,
"
"                        v_fp08_oprn_qty,
"
"                        v_fp09_oprn_qty,
"
"                        v_fp10_oprn_qty,
"
"                        v_fp11_oprn_qty,
"
"                        v_fp12_oprn_qty,
"
"                        p_user,
"
"                        audit_info.get_ip_address,
"
"                        audit_info.get_os_user,
"
"                        func_find_emp_id(p_bu,p_user),
"
"                        SYSDATE,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL
"
"                                );
"
"
"
"                                v_proc_seq_no := v_proc_seq_no + 1;
"
"
"
"                  END LOOP;
"
"
"
"    v_seq_no := 0;
"
"
"
"
"
"      BEGIN
"
"
"
"        SELECT sbh_rm_cd_per_kg,
"
"               sbh_rm_fwd_chrg_kg
"
"          INTO v_rm_cd_per_kg,
"
"              v_rm_fwd_chrg_kg
"
"         FROM sale_bud_hd
"
"       WHERE sbh_bu = p_bu
"
"         AND sbh_doc_no = p_doc_no
"
"         AND SBH_REV_NO = P_REV_NO;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"           v_rm_cd_per_kg := 0;
"
"           v_rm_fwd_chrg_kg :=0;
"
"     END;
"
"
"
"    FOR r_rms IN c_rms
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"
"
" BEGIN
"
"
"
"      SELECT pol_sc_unit_cost
"
"        INTO v_rm_unit_cost
"
"        FROM (
"
"      SELECT ROWNUM RNM,POL_sC_UNIT_COST,POH_ORDER_DATE
"
"        FROM (
"
"      SELECT pol_sc_unit_cost,poh_order_date
"
"        FROM pur_order_hd,pur_order_ln
"
"       WHERE poh_bu = pol_bu
"
"         AND poh_plant = pol_plnt
"
"         AND poh_order_no = pol_order_no
"
"         AND poh_bu  = p_bu
"
"         AND poh_status NOT IN ('L','C')
"
"         AND pol_prod_id = r_rms.sbrq_rm_prod_id
"
"         AND pol_prod_rev = r_rms.sbrq_rm_prod_rev
"
"       ORDER BY poh_order_date DESC))
"
"       WHERE RNM = 1;
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_rm_unit_cost := 0;
"
"
"
" END;
"
"
"
"
"
"         v_bc_rm_unit_cost :=  v_rm_unit_cost * v_ex_rate;
"
"
"
"
"
"         v_tot_value := v_bc_rm_unit_cost  + v_rm_cd_per_kg + v_rm_fwd_chrg_kg + CASE WHEN v_pkg_cost > 0 THEN (v_bc_rm_unit_cost *v_pkg_cost/100) ELSE 0 END;
"
"
"
"      INSERT INTO sale_bud_rm_smry(sbrs_bu,
"
"                                   sbrs_doc_no,
"
"                                   SBRS_REV_NO,
"
"                                   sbrs_seq_no,
"
"                                   sbrs_rm_prod_id,
"
"                                   sbrs_rm_prod_rev,
"
"                                   sbrs_rm_rqrd_qty,
"
"                                   sbrs_curcy_id,
"
"                                   sbrs_unit_cost,
"
"                                   sbrs_ex_rate,
"
"                                   sbrs_cd_per_kg,
"
"                                   sbrs_fwd_chrg_kg,
"
"                                   sbrs_pkg_cost_pct,
"
"                                   sbrs_tot_cost,
"
"                                   sbrs_fp01_rm_qty,
"
"                                   sbrs_fp02_rm_qty,
"
"                                   sbrs_fp03_rm_qty,
"
"                                   sbrs_fp04_rm_qty,
"
"                                   sbrs_fp05_rm_qty,
"
"                                   sbrs_fp06_rm_qty,
"
"                                   sbrs_fp07_rm_qty,
"
"                                   sbrs_fp08_rm_qty,
"
"                                   sbrs_fp09_rm_qty,
"
"                                   sbrs_fp10_rm_qty,
"
"                                   sbrs_fp11_rm_qty,
"
"                                   sbrs_fp12_rm_qty,
"
"                                   sbrs_cre_by,
"
"                                   sbrs_cre_emp_id,
"
"                                   sbrs_cre_ip_addr,
"
"                                   sbrs_cre_os_user,
"
"                                   sbrs_cre_date
"
"                                  )
"
"                            VALUES(p_bu,
"
"                       p_doc_no,
"
"                       P_REV_NO,
"
"                   v_seq_no,
"
"                                   r_rms.sbrq_rm_prod_id,
"
"                                   r_rms.sbrq_rm_prod_rev,
"
"                                   ROUND(r_rms.sbrq_fp01_rm_qty+r_rms.sbrq_fp02_rm_qty+r_rms.sbrq_fp03_rm_qty+r_rms.sbrq_fp04_rm_qty+r_rms.sbrq_fp05_rm_qty+r_rms.sbrq_fp06_rm_qty+r_rms.sbrq_fp07_rm_qty+r_rms.sbrq_fp08_rm_qty+r_rms.sbrq_fp09_rm_qty+r_rms.sbrq_fp10_rm_qty+r_rms.sbrq_fp11_rm_qty+r_rms.sbrq_fp12_rm_qty),
"
"                                   v_curcy,
"
"                                   v_rm_unit_cost,
"
"                                   v_ex_rate,
"
"                                   v_rm_cd_per_kg, --0,
"
"                                   v_rm_fwd_chrg_kg, --0,
"
"                                   v_pkg_cost,
"
"                                   v_tot_value,
"
"                                   ROUND(r_rms.sbrq_fp01_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp02_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp03_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp04_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp05_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp06_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp07_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp08_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp09_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp10_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp11_rm_qty),
"
"                                   ROUND(r_rms.sbrq_fp12_rm_qty),
"
"                                   p_user,
"
"                   p_user_emp,
"
"                   v_ip_addr,
"
"                   v_os_user,
"
"                   SYSDATE
"
"                  );
"
"    END LOOP;
"
"
"
"  END proc_load_rm_frm_sal_bud;
"
"
"
"END pkg_sal_bud;"
/
