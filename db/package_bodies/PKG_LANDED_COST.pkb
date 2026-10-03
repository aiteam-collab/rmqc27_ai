CREATE OR REPLACE
"PACKAGE BODY pkg_landed_cost
"
"AS
"
"
"
"  PROCEDURE proc_chk_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			             p_rcpt_pfx		pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			             p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"				    )
"
"  AS
"
"
"
"  CURSOR c_lc IS
"
"    SELECT btdlnh_bu,btdlnh_ord_no,btdlnh_seq_no,
"
"           btdlnh_bfcry_id,btdlnh_hsn_code,btdlnh_assess_val,btdlnh_pct,btdlnh_dist_amt,
"
"	   btdlnh_acct
"
"      FROM bank_trans_dist_ln_hist
"
"     WHERE btdlnh_bu = p_bu
"
"       AND btdlnh_lc_grn_no IS NULL
"
"       AND EXISTS(SELECT 1
"
"                    FROM pur_ord_receipt_ln
"
"		   WHERE porl_bu = p_bu
"
"		     AND porl_receipt_no = p_rcpt_no
"
"		     AND porl_po_no = btdlnh_lc_po_no);
"
"
"
"    r_lc	c_lc%ROWTYPE;
"
"
"
"  BEGIN
"
"
"
"    OPEN c_lc;
"
"    FETCH c_lc INTO r_lc;
"
"      IF c_lc%FOUND THEN
"
"        Raise_Application_Error(-20999,'Landed Cost not Loaded.');
"
"      END IF;
"
"    CLOSE c_lc;
"
"
"
"  END proc_chk_lc_frm_pur_rcpt;
"
"
"
"  PROCEDURE proc_load_lc_frm_bill(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"                                  p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			          p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				  p_user	pur_ord_receipt_hd.porh_cre_by%TYPE
"
"				 )
"
"  AS
"
"    CURSOR c_lc IS
"
"    SELECT btdlnh_bu,btdlnh_plant,btdlnh_ord_no,btdlnh_seq_no,
"
"           btdlnh_bfcry_id,btdlnh_hsn_code,btdlnh_assess_val,btdlnh_pct,btdlnh_dist_amt,
"
"	   btdlnh_curr,btln_exrate,btdlnh_acct
"
"      FROM bank_trans_dist_ln_hist
"
"     WHERE btdlnh_bu = p_bu
"
"       AND btdlnh_lc_grn_no IS NULL
"
"       AND EXISTS(SELECT 1
"
"                    FROM pur_ord_receipt_ln
"
"		   WHERE porl_bu = p_bu
"
"		     AND porl_receipt_no = p_rcpt_no
"
"		     AND porl_po_no = btdlnh_lc_po_no);
"
"
"
"    CURSOR c_tc(c_plnt		VARCHAR2,
"
"                c_acct_no	VARCHAR2) IS
"
"    SELECT tc_tc_id,tc_pur_acct,tc_offset_acct
"
"      FROM tax_charges
"
"     WHERE tc_bu = p_bu
"
"       AND tc_tc_plnt = c_plnt
"
"       AND tc_offset_acct = c_acct_no
"
"       AND tc_active_flag = 'Y';
"
"
"
"
"
"    r_tc		c_tc%ROWTYPE;
"
"
"
"    v_seq_no		NUMBER := 0;
"
"    v_sub_seq_no 	NUMBER := 0;
"
"
"
"    v_rcpt_qty		NUMBER(12,3);
"
"
"
"  BEGIN
"
"
"
"    SELECT NVL(MAX(prlc_seq_no),0) INTO v_seq_no
"
"      FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_rcpt_no;
"
"
"
"    FOR r_lc IN c_lc
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      OPEN c_tc(r_lc.btdlnh_plant,r_lc.btdlnh_acct);
"
"      FETCH c_tc INTO r_tc;
"
"        IF c_tc%NOTFOUND THEN
"
"	  Raise_Application_Error(-20999,'Landed Cost Setup not found.');
"
"	END IF;
"
"      CLOSE c_tc;
"
"
"
"      INSERT INTO pur_rcpt_land_costs(prlc_bu,
"
"                                      prlc_rcpt_no,
"
"                                      prlc_seq_no,
"
"				      prlc_sub_seq_no,
"
"				      prlc_tc_type,
"
"                                      prlc_tc_id,
"
"				      prlc_tc_rev,
"
"                                      prlc_assbl_val,
"
"                                      prlc_tc_pct,
"
"                                      prlc_tc_amt,
"
"                                      prlc_suplr_id,
"
"                                      prlc_chrg_flag,
"
"                                      prlc_cre_by,
"
"                                      prlc_cre_date,
"
"				      prlc_type,
"
"				      prlc_pur_acct,
"
"				      prlc_offset_acct,
"
"				      prlc_rec_source,
"
"				      prlc_hsn_code,
"
"				      --prlc_bt_doc_pfx,
"
"                                      prlc_bt_doc_no,
"
"                                      prlc_bt_doc_seq_no,
"
"				      prlc_currency,
"
"				      prlc_exchange_rate,
"
"				      prlc_pts_flag,
"
"				      prlc_lc_import_flag
"
"				     )
"
"			       VALUES(p_bu,
"
"				      p_rcpt_no,
"
"				      v_seq_no,
"
"				      1,
"
"				      'P',
"
"				      r_tc.tc_tc_id,
"
"				      0,
"
"				      r_lc.btdlnh_assess_val,
"
"				      r_lc.btdlnh_pct,
"
"				      r_lc.btdlnh_dist_amt,
"
"				      NULL,
"
"				      'N',
"
"				      p_user,
"
"				      SYSDATE,
"
"				      'L',
"
"				      r_tc.tc_pur_acct,
"
"				      r_tc.tc_offset_acct,
"
"				      'L',
"
"				      r_lc.btdlnh_hsn_code,
"
"				      --r_lc.btdlnh_ord_pfx,
"
"				      r_lc.btdlnh_ord_no,
"
"				      r_lc.btdlnh_seq_no,
"
"				      r_lc.btdlnh_curr,
"
"				      r_lc.btln_exrate,
"
"				      'Y',
"
"				      'N'
"
"				     );
"
"
"
"      UPDATE bank_trans_dist_ln_hist
"
"         SET btdlnh_lc_grn_pfx = p_rcpt_pfx,
"
"	     btdlnh_lc_grn_no = p_rcpt_no
"
"       WHERE btdlnh_bu = p_bu
"
"         --AND btdlnh_ord_pfx = r_lc.btdlnh_ord_pfx
"
"	 AND btdlnh_ord_no = r_lc.btdlnh_ord_no
"
"	 AND btdlnh_seq_no = r_lc.btdlnh_seq_no;
"
"
"
"    END LOOP;
"
"
"
"  END proc_load_lc_frm_bill;
"
"
"
"  PROCEDURE proc_del_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			             p_rcpt_pfx		pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"			             p_rcpt_no		pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			            )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_rcpt_no
"
"       AND prlc_rec_source = 'L';
"
"
"
"    UPDATE bank_trans_dist_ln_hist
"
"       SET btdlnh_lc_grn_pfx = NULL,
"
"	   btdlnh_lc_grn_no = NULL
"
"     WHERE btdlnh_bu = p_bu
"
"       AND btdlnh_lc_grn_no = p_rcpt_no;
"
"
"
"  END proc_del_lc_frm_pur_rcpt;
"
"
"
"  PROCEDURE proc_ins_prod_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			                  p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				          p_user	pur_ord_receipt_hd.porh_cre_by%TYPE
"
"			                 )
"
"  AS
"
"    CURSOR c_lc IS
"
"    SELECT *
"
"      FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_rcpt_no
"
"     ORDER BY prlc_seq_no;
"
"
"
"    CURSOR c_pr IS
"
"    SELECT porl_receipt_no,porl_seq_no,porl_receipt_qty Rcpt_Qty,porl_stock_receipt_qty Stk_Rcpt_Qty,
"
"           (((porl_sc_unit_cost - (porl_sc_unit_cost * (porl_disc_pct/100))) * porl_receipt_qty)) Rcpt_Amt,
"
"	   porh_tot_rcpt_amt
"
"      FROM pur_ord_receipt_hd,pur_ord_receipt_ln
"
"     WHERE porh_bu = porl_bu
"
"       AND porh_receipt_no = porl_receipt_no
"
"       AND porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_status <> 'C'
"
"       AND porl_matl_type = 'PR'
"
"     ORDER BY porl_seq_no;
"
"
"
"    v_plnt		VARCHAR2(10);
"
"    v_lc_apport_basis	VARCHAR2(1);
"
"    v_rcpt_tot_amt	NUMBER;
"
"    v_rcpt_tot_qty	NUMBER;
"
"    v_lc_assbl_val	NUMBER;
"
"    v_lc_tc_amt		NUMBER;
"
"    v_tot_lc_amt	NUMBER;
"
"    v_rcpt_tc_amt	NUMBER;
"
"    v_diff_tc_amt	NUMBER;
"
"    v_chrg_flag		VARCHAR2(1);
"
"    v_seq_no		NUMBER;
"
"    v_tot_rcpt_amt	NUMBER;
"
"    v_gst_rof		NUMBER;
"
"    v_avl_lic_amt	NUMBER;
"
"
"
"    v_bal_lc_amt	NUMBER;
"
"    v_upd_lc_amt	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_rcpt_no
"
"       AND prlc_rec_source = 'S';
"
"
"
"    SELECT porh_plnt,porh_lc_apport_basis,porh_tot_rcpt_amt
"
"      INTO v_plnt,v_lc_apport_basis,v_tot_rcpt_amt
"
"      FROM pur_ord_receipt_hd
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_no = p_rcpt_no;
"
"
"
"    IF v_lc_apport_basis = 'P' THEN
"
"
"
"      SELECT SUM(((porl_sc_unit_cost - (porl_sc_unit_cost * (porl_disc_pct/100))) * porl_receipt_qty))
"
"        INTO v_rcpt_tot_amt
"
"        FROM pur_ord_receipt_hd,pur_ord_receipt_ln
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no
"
"         AND porl_matl_type = 'PR'
"
"         AND porl_status <> 'C';
"
"
"
"    ELSE
"
"
"
"      SELECT SUM(porl_receipt_qty)
"
"        INTO v_rcpt_tot_qty
"
"        FROM pur_ord_receipt_hd,pur_ord_receipt_ln
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no
"
"         AND porl_matl_type = 'PR'
"
"         AND porl_status <> 'C';
"
"
"
"    END IF;
"
"
"
"    FOR r_lc IN c_lc
"
"    LOOP
"
"
"
"      v_bal_lc_amt := r_lc.prlc_tc_amt;
"
"
"
"      FOR r_pr IN c_pr
"
"      LOOP
"
"
"
"	IF v_lc_apport_basis = 'P' THEN
"
"	  v_lc_assbl_val := r_lc.prlc_assbl_val * (r_pr.Rcpt_Amt / v_rcpt_tot_amt);
"
"          v_lc_tc_amt := ROUND(r_lc.prlc_tc_amt * (r_pr.Rcpt_Amt / v_rcpt_tot_amt),2);
"
"	ELSE
"
"	  v_lc_assbl_val := r_lc.prlc_assbl_val * (r_pr.Rcpt_Qty / v_rcpt_tot_qty);
"
"          v_lc_tc_amt := ROUND(r_lc.prlc_tc_amt * (r_pr.Rcpt_Qty / v_rcpt_tot_qty),2);
"
"	END IF;
"
"
"
"        SELECT NVL(MAX(prplc_seq_no),0) + 1 INTO v_seq_no
"
"          FROM pur_rcpt_prod_land_costs
"
"         WHERE prplc_bu = p_bu
"
"           AND prplc_rcpt_no = p_rcpt_no
"
"           AND prplc_rcpt_seq_no = r_pr.porl_seq_no;
"
"
"
"        BEGIN
"
"        SELECT suplr_gst_rof INTO v_gst_rof
"
"          FROM suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_suplr_id = r_lc.prlc_suplr_id;
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN v_gst_rof := 2;
"
"        END;
"
"
"
"	IF v_bal_lc_amt > v_lc_tc_amt THEN
"
"	  v_upd_lc_amt := v_lc_tc_amt;
"
"	  v_bal_lc_amt := v_bal_lc_amt - v_upd_lc_amt;
"
"	ELSE
"
"	  v_upd_lc_amt := v_bal_lc_amt;
"
"	  v_bal_lc_amt := 0;
"
"	END IF;
"
"
"
"	INSERT INTO pur_rcpt_prod_land_costs(prplc_bu,
"
"                                             prplc_rcpt_no,
"
"					     prplc_rcpt_seq_no,
"
"					     prplc_seq_no,
"
"					     prplc_prod_id,
"
"					     prplc_prod_rev,
"
"					     prplc_hsn_code,
"
"					     prplc_tc_amt,
"
"					     prplc_rec_source,
"
"					     prplc_type,
"
"					     prplc_suplr_id,
"
"					     prplc_currency,
"
"					     prplc_exchange_rate,
"
"					     prplc_tc_pct,
"
"					     prplc_assbl_val,
"
"					     prplc_pts_flag,
"
"					     prplc_chrg_flag,
"
"					     prplc_cre_by,
"
"					     prplc_cre_date,
"
"					     prplc_pur_acct,
"
"					     prplc_offset_acct,
"
"					     prplc_lc_seq_no,
"
"					     prplc_state_code,
"
"					     prplc_igst_pct,
"
"					     prplc_igst_amt,
"
"					     prplc_cgst_pct,
"
"					     prplc_cgst_amt,
"
"					     prplc_sgst_pct,
"
"					     prplc_sgst_amt,
"
"					     prplc_cess_pct,
"
"					     prplc_cess_amt,
"
"					     prplc_gst_type,
"
"					     prplc_gst_clf_type,
"
"					     prplc_suplr_doc_no,
"
"					     prplc_suplr_doc_date,
"
"					     prplc_gst_exempt_type,
"
"					     prplc_meis_lic_no,
"
"					     prplc_meis_doc_no,
"
"					     prplc_lc_import_flag,
"
"					     prplc_billfr_loc
"
"					    )
"
"                                      VALUES(p_bu,
"
"					     p_rcpt_no,
"
"					     r_pr.porl_seq_no,
"
"					     v_seq_no,
"
"					     r_lc.prlc_tc_id,
"
"					     r_lc.prlc_tc_rev,
"
"					     r_lc.prlc_hsn_code,
"
"					     v_upd_lc_amt,--v_lc_tc_amt,
"
"					     'S',
"
"					     r_lc.prlc_type,
"
"					     r_lc.prlc_suplr_id,
"
"					     r_lc.prlc_currency,
"
"					     r_lc.prlc_exchange_rate,
"
"					     r_lc.prlc_tc_pct,
"
"					     v_lc_assbl_val,
"
"					     r_lc.prlc_pts_flag,
"
"					     r_lc.prlc_chrg_flag,
"
"					     p_user,
"
"					     SYSDATE,
"
"					     r_lc.prlc_pur_acct,
"
"					     r_lc.prlc_offset_acct,
"
"					     r_lc.prlc_seq_no,
"
"					     r_lc.prlc_state_code,
"
"					     r_lc.prlc_igst_pct,
"
"					     CASE WHEN r_lc.prlc_igst_pct > 0 AND r_lc.prlc_gst_exempt_type = 'G' AND r_lc.prlc_gst_clf_type = 'I' THEN ROUND((v_lc_tc_amt * r_lc.prlc_igst_pct/100),v_gst_rof) ELSE 0 END,
"
"					     r_lc.prlc_cgst_pct,
"
"					     CASE WHEN r_lc.prlc_cgst_pct > 0 AND r_lc.prlc_gst_exempt_type = 'G' AND r_lc.prlc_gst_clf_type = 'L' THEN ROUND((v_lc_tc_amt * r_lc.prlc_cgst_pct/100),v_gst_rof) ELSE 0 END,
"
"					     r_lc.prlc_sgst_pct,
"
"					     CASE WHEN r_lc.prlc_sgst_pct > 0 AND r_lc.prlc_gst_exempt_type = 'G' AND r_lc.prlc_gst_clf_type = 'L' THEN ROUND((v_lc_tc_amt * r_lc.prlc_sgst_pct/100),v_gst_rof) ELSE 0 END,
"
"					     r_lc.prlc_cess_pct,
"
"					     r_lc.prlc_cess_amt,
"
"					     r_lc.prlc_gst_type,
"
"					     r_lc.prlc_gst_clf_type,
"
"					     r_lc.prlc_suplr_doc_no,
"
"					     r_lc.prlc_suplr_doc_date,
"
"					     r_lc.prlc_gst_exempt_type,
"
"					     r_lc.prlc_meis_lic_no,
"
"					     r_lc.prlc_meis_doc_no,
"
"					     r_lc.prlc_lc_import_flag,
"
"					     r_lc.prlc_billfr_loc
"
"					    );
"
"      END LOOP;
"
"
"
"      IF v_bal_lc_amt <> 0 THEN
"
"
"
"	UPDATE pur_rcpt_prod_land_costs
"
"	   SET prplc_tc_amt = prplc_tc_amt + v_bal_lc_amt
"
"	 WHERE prplc_bu = p_bu
"
"	   AND prplc_rcpt_no = p_rcpt_no
"
"	   AND prplc_prod_id = r_lc.prlc_tc_id
"
"	   AND prplc_prod_rev = r_lc.prlc_tc_rev
"
"	   AND prplc_rcpt_seq_no = (SELECT MAX(porl_seq_no)
"
"	                              FROM pur_ord_receipt_ln
"
"				     WHERE porl_bu = p_bu
"
"				       AND porl_receipt_no = p_rcpt_no
"
"				       AND porl_status <> 'C');
"
"
"
"        --Raise_Application_Error(-20999,'Landed Cost : '||v_bal_lc_amt);
"
"      END IF;
"
"
"
"    END LOOP;
"
"
"
"   SELECT NVL(MAX(prlc_seq_no),0) INTO v_seq_no
"
"     FROM pur_rcpt_land_costs
"
"    WHERE prlc_bu = p_bu
"
"      AND prlc_rcpt_no = p_rcpt_no;
"
"
"
"    FOR r_llc IN (SELECT prplc_prod_id,prplc_prod_rev,prplc_hsn_code,prplc_type,prplc_suplr_id,prplc_currency,prplc_exchange_rate,prplc_pts_flag,
"
"                         prplc_chrg_flag,prplc_pur_acct,prplc_offset_acct,SUM(prplc_assbl_val) LC_Assbl_Amt,AVG(prplc_tc_pct) LC_Pct,SUM(prplc_tc_amt) LC_Amt,
"
"			 prplc_state_code,prplc_suplr_doc_no,prplc_suplr_doc_date,prplc_igst_pct,prplc_cgst_pct,prplc_sgst_pct,
"
"			 SUM(prplc_igst_amt) prplc_igst_amt,SUM(prplc_cgst_amt) prplc_cgst_amt,SUM(prplc_sgst_amt) prplc_sgst_amt,
"
"			 prplc_gst_type,prplc_gst_clf_type,prplc_gst_exempt_type,prplc_meis_lic_no,prplc_meis_doc_no,prplc_billfr_loc,prplc_lc_import_flag
"
"                    FROM pur_rcpt_prod_land_costs
"
"                   WHERE prplc_bu = p_bu
"
"                     AND prplc_rcpt_no = p_rcpt_no
"
"                     AND prplc_rec_source = 'M'
"
"		   GROUP BY prplc_prod_id,prplc_prod_rev,prplc_hsn_code,prplc_type,prplc_suplr_id,prplc_currency,prplc_exchange_rate,prplc_pts_flag,
"
"		            prplc_chrg_flag,prplc_pur_acct,prplc_offset_acct,prplc_state_code,prplc_suplr_doc_no,prplc_suplr_doc_date,
"
"			    prplc_igst_pct,prplc_cgst_pct,prplc_sgst_pct,prplc_gst_type,prplc_gst_clf_type,prplc_gst_exempt_type,prplc_meis_lic_no,
"
"			    prplc_meis_doc_no,prplc_billfr_loc,prplc_lc_import_flag
"
"		   ORDER BY 1)
"
"    LOOP
"
"      v_seq_no := v_seq_no + 1;
"
"      INSERT INTO pur_rcpt_land_costs(prlc_bu,
"
"                                      prlc_rcpt_no,
"
"				      prlc_seq_no,
"
"				      prlc_tc_id,
"
"				      prlc_tc_rev,
"
"				      prlc_hsn_code,
"
"				      prlc_tc_amt,
"
"				      prlc_rec_source,
"
"				      prlc_type,
"
"				      prlc_suplr_id,
"
"				      prlc_currency,
"
"				      prlc_exchange_rate,
"
"				      prlc_tc_pct,
"
"				      prlc_assbl_val,
"
"				      prlc_pts_flag,
"
"				      prlc_chrg_flag,
"
"				      prlc_cre_by,
"
"				      prlc_cre_date,
"
"				      prlc_pur_acct,
"
"				      prlc_offset_acct,
"
"				      prlc_state_code,
"
"				      prlc_suplr_doc_no,
"
"				      prlc_suplr_doc_date,
"
"				      prlc_igst_pct,
"
"				      prlc_cgst_pct,
"
"				      prlc_sgst_pct,
"
"				      prlc_igst_amt,
"
"				      prlc_cgst_amt,
"
"				      prlc_sgst_amt,
"
"				      prlc_gst_type,
"
"				      prlc_gst_clf_type,
"
"				      prlc_gst_exempt_type,
"
"				      prlc_meis_lic_no,
"
"				      prlc_meis_doc_no,
"
"				      prlc_billfr_loc,
"
"				      prlc_lc_import_flag
"
"				     )
"
"			       VALUES(p_bu,
"
"				      p_rcpt_no,
"
"				      v_seq_no,
"
"				      r_llc.prplc_prod_id,
"
"				      r_llc.prplc_prod_rev,
"
"				      r_llc.prplc_hsn_code,
"
"				      ROUND(r_llc.LC_Amt,2),
"
"				      'S',
"
"				      r_llc.prplc_type,
"
"				      r_llc.prplc_suplr_id,
"
"				      r_llc.prplc_currency,
"
"				      r_llc.prplc_exchange_rate,
"
"				      r_llc.LC_Pct,
"
"				      r_llc.LC_Assbl_Amt,
"
"				      r_llc.prplc_pts_flag,
"
"				      r_llc.prplc_chrg_flag,
"
"				      p_user,
"
"				      SYSDATE,
"
"				      r_llc.prplc_pur_acct,
"
"				      r_llc.prplc_offset_acct,
"
"				      r_llc.prplc_state_code,
"
"				      r_llc.prplc_suplr_doc_no,
"
"				      r_llc.prplc_suplr_doc_date,
"
"				      r_llc.prplc_igst_pct,
"
"				      r_llc.prplc_cgst_pct,
"
"				      r_llc.prplc_sgst_pct,
"
"				      r_llc.prplc_igst_amt,
"
"				      r_llc.prplc_cgst_amt,
"
"				      r_llc.prplc_sgst_amt,
"
"				      r_llc.prplc_gst_type,
"
"				      r_llc.prplc_gst_clf_type,
"
"				      r_llc.prplc_gst_exempt_type,
"
"				      r_llc.prplc_meis_lic_no,
"
"				      r_llc.prplc_meis_doc_no,
"
"				      r_llc.prplc_billfr_loc,
"
"				      r_llc.prplc_lc_import_flag
"
"				     );
"
"    END LOOP;
"
"
"
"    FOR r_meis IN (SELECT porh_plnt,porh_exchange_rate,prlc_meis_doc_no,prlc_meis_lic_no,SUM(prlc_tc_amt) prlc_tc_amt
"
"                     FROM pur_ord_receipt_hd,pur_rcpt_land_costs
"
"		    WHERE porh_bu = prlc_bu
"
"		      AND porh_receipt_no = prlc_rcpt_no
"
"		      AND prlc_bu = p_bu
"
"                      AND prlc_rcpt_no = p_rcpt_no
"
"		      AND prlc_type IN ('I','D')
"
"		    GROUP BY porh_plnt,porh_exchange_rate,prlc_meis_doc_no,prlc_meis_lic_no)
"
"    LOOP
"
"
"
"      BEGIN
"
"
"
"        SELECT SUM(ddh_duty_drback_amt - (ddh_lcn_inprog_amt + ddh_lcn_rcpt_amt + ddh_sales_inprog_amt + ddh_lcn_sales_amt)) INTO v_avl_lic_amt
"
"          FROM duty_drawback_hd
"
"         WHERE ddh_bu = p_bu
"
"           AND ddh_plnt = r_meis.porh_plnt
"
"           AND ddh_doc_no = r_meis.prlc_meis_doc_no
"
"           AND ddh_license_no = r_meis.prlc_meis_lic_no;
"
"
"
"        IF v_avl_lic_amt < r_meis.prlc_tc_amt THEN
"
"          Raise_Application_Error(-20014,'POM RODTEP/DFIA Lic. No : '||r_meis.prlc_meis_lic_no||' Avail Bal : '||v_avl_lic_amt||'/'||r_meis.prlc_tc_amt);
"
"        END IF;
"
"
"
"        UPDATE duty_drawback_hd
"
"           SET ddh_lcn_inprog_amt = ddh_lcn_inprog_amt + r_meis.prlc_tc_amt
"
"         WHERE ddh_bu = p_bu
"
"           AND ddh_plnt = r_meis.porh_plnt
"
"           AND ddh_doc_no = r_meis.prlc_meis_doc_no
"
"           AND ddh_license_no = r_meis.prlc_meis_lic_no;
"
"      EXCEPTION
"
"        WHEN OTHERS THEN
"
"          Raise_Application_Error(-20014,'POM RODTEP/DFIA Lic. No : '||r_meis.prlc_meis_lic_no||' Avail Bal : '||v_avl_lic_amt||'/'||r_meis.prlc_tc_amt);
"
"      END;
"
"    END LOOP;
"
"
"
"  END proc_ins_prod_lc_frm_pur_rcpt;
"
"
"
"  PROCEDURE proc_del_prod_lc_frm_pur_rcpt(p_bu		pur_ord_receipt_hd.porh_bu%TYPE,
"
"			                  p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE
"
"			                 )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM pur_rcpt_prod_land_costs
"
"     WHERE prplc_bu = p_bu
"
"       AND prplc_rcpt_no = p_rcpt_no
"
"       AND prplc_rec_source = 'S';
"
"
"
"    DELETE FROM pur_rcpt_land_costs
"
"     WHERE prlc_bu = p_bu
"
"       AND prlc_rcpt_no = p_rcpt_no
"
"       AND prlc_rec_source = 'S';
"
"
"
"    FOR r_lc IN (SELECT *
"
"                   FROM pur_ord_receipt_hd,pur_rcpt_land_costs
"
"		  WHERE porh_bu = prlc_bu
"
"		    AND porh_receipt_no = prlc_rcpt_no
"
"		    AND prlc_bu = p_bu
"
"                    AND prlc_rcpt_no = p_rcpt_no
"
"		    AND prlc_type IN ('I','D'))
"
"    LOOP
"
"      BEGIN
"
"        UPDATE duty_drawback_hd
"
"           SET ddh_lcn_inprog_amt = ddh_lcn_inprog_amt - r_lc.prlc_tc_amt
"
"         WHERE ddh_bu = p_bu
"
"           AND ddh_plnt = r_lc.porh_plnt
"
"           AND ddh_doc_no = r_lc.prlc_meis_doc_no
"
"           AND ddh_license_no = r_lc.prlc_meis_lic_no;
"
"      EXCEPTION
"
"        WHEN OTHERS THEN Raise_Application_Error(-20999,'HRM ');
"
"      END;
"
"    END LOOP;
"
"
"
"  END proc_del_prod_lc_frm_pur_rcpt;
"
"
"
"END pkg_landed_cost;"
/
