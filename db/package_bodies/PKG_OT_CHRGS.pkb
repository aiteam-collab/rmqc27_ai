CREATE OR REPLACE
"PACKAGE BODY pkg_ot_chrgs
"
"AS
"
"
"
"  PROCEDURE proc_ins_pr_oth_tax_chrgs(p_bu		VARCHAR2,
"
"                                      p_plnt		VARCHAR2,
"
"				      p_rcpt_pfx	VARCHAR2,
"
"                                      p_rcpt_no		VARCHAR2,
"
"				      p_user		VARCHAR2
"
"                                     )
"
"  AS
"
"
"
"  CURSOR c_prh IS
"
"  SELECT porh_receipt_date,porh_gst_clf_type
"
"    FROM pur_ord_receipt_hd
"
"   WHERE porh_bu = p_bu
"
"     AND porh_receipt_pfx = p_rcpt_pfx
"
"     AND porh_receipt_no = p_rcpt_no;
"
"
"
"    v_pr_seq_no		NUMBER;
"
"    v_pr_sub_seq_no	NUMBER;
"
"    v_tax_set_id	VARCHAR2(10);
"
"    v_hsn_code		VARCHAR2(25);
"
"    v_tcs_sec_id	pur_ord_receipt_ln.porl_tcs_sec_id%TYPE;
"
"    v_plnt_loc_id	pur_ord_receipt_hd.porh_plnt_loc_id%TYPE;
"
"    v_dept_id		prod_plants_loc.ppl_dflt_store_id%TYPE;
"
"
"
"    r_prh		c_prh%ROWTYPE;
"
"
"
"    v_tax_pct		pur_ord_receipt_ln.porl_tax_pct%TYPE;
"
"    v_cgst_pct		pur_ord_receipt_ln.porl_cgst_pct%TYPE;
"
"    v_sgst_pct		pur_ord_receipt_ln.porl_sgst_pct%TYPE;
"
"    v_utgst_pct		pur_ord_receipt_ln.porl_utgst_pct%TYPE;
"
"    v_cess_pct		pur_ord_receipt_ln.porl_cess_pct%TYPE;
"
"    v_igst_amt		pur_ord_receipt_ln.porl_igst_amt%TYPE;
"
"    v_cgst_amt		pur_ord_receipt_ln.porl_cgst_amt%TYPE;
"
"    v_sgst_amt		pur_ord_receipt_ln.porl_sgst_amt%TYPE;
"
"    v_utgst_amt		pur_ord_receipt_ln.porl_utgst_amt%TYPE;
"
"    v_cess_amt		pur_ord_receipt_ln.porl_cess_amt%TYPE;
"
"    v_tax_amt		pur_ord_receipt_ln.porl_tax_amt%TYPE;
"
"    v_cess_rate         NUMBER(12,3);
"
"
"
"  BEGIN
"
"
"
"    OPEN c_prh;
"
"    FETCH c_prh INTO r_prh;
"
"    CLOSE c_prh;
"
"
"
"    DELETE FROM pur_ord_receipt_ln
"
"     WHERE porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_matl_type = 'T'
"
"       AND EXISTS(SELECT 1
"
"                    FROM pr_oth_tax_charges
"
"		   WHERE protc_bu = porl_bu
"
"		     AND protc_rcpt_no = porl_receipt_no
"
"		     AND protc_prod_id = porl_prod_id
"
"		     AND protc_prod_rev = porl_prod_rev
"
"		     AND protc_chrg_amt = porl_sc_unit_cost);
"
"
"
"    BEGIN
"
"      SELECT porh_plnt_loc_id
"
"        INTO v_plnt_loc_id
"
"	FROM pur_ord_receipt_hd
"
"       WHERE porh_bu = p_bu
"
"	 AND porh_receipt_no = p_rcpt_no;
"
"    END;
"
"
"
"    FOR r_potc IN (SELECT protc_prod_id,protc_prod_rev,
"
"                          prod_desc11 protc_prod_desc1,
"
"			  prodplnt_cls protc_prod_cls,
"
"			  prodplnt_sub_cls protc_prod_subcls,
"
"			  prod_uom protc_prod_uom,
"
"			  protc_qty,protc_chrg_amt,protc_hsn_code,
"
"			  prod_tc_charge_flag,
"
"			  protc_gst_exmpt_flag,
"
"			  protc_gst_input_type,
"
"			  protc_inc_tcs_flag,
"
"			  protc_pur_acct,
"
"			  protc_cc_code,
"
"			  protc_po_no
"
"                     FROM pr_oth_tax_charges,products,prod_plants
"
"		    WHERE prod_bu = protc_bu
"
"		      AND prod_id = protc_prod_id
"
"		      AND prod_rev = protc_prod_rev
"
"		      AND prodplnt_bu = prod_bu
"
"		      AND prodplnt_prod_id = prod_id
"
"		      AND prodplnt_prod_rev = prod_rev
"
"		      AND prodplnt_plnt = p_plnt
"
"		      AND protc_bu = p_bu
"
"		      AND protc_rcpt_no = p_rcpt_no
"
"		      AND protc_chrg_amt > 0
"
"		    ORDER BY protc_seq_no)
"
"    LOOP
"
"
"
"      BEGIN
"
"        SELECT ppl_dflt_store_id
"
"          INTO v_dept_id
"
"	  FROM prod_plants_loc
"
"         WHERE ppl_bu = p_bu
"
"           AND ppl_plnt = p_plnt
"
"	   AND ppl_plnt_loc_id = v_plnt_loc_id
"
"	   AND ppl_prod_id = r_potc.protc_prod_id
"
"	   AND ppl_prod_rev = r_potc.protc_prod_rev;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20060,'ICM 1'||p_plnt||'/'||v_plnt_loc_id||'/'||r_potc.protc_prod_id||'/'||r_potc.protc_prod_rev);
"
"      END;
"
"
"
"      SELECT NVL(MAX(porl_seq_no),0)+1
"
"        INTO v_pr_seq_no
"
"        FROM pur_ord_receipt_ln
"
"       WHERE porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no;
"
"
"
"    IF 	r_potc.protc_hsn_code IS NULL THEN
"
"      BEGIN
"
"          SELECT porl_hsn_code
"
"            INTO v_hsn_code
"
"            FROM (SELECT porl_hsn_code,
"
"                         MAX(hstr_cgst_tax_pct + hstr_sgst_tax_pct + hstr_igst_tax_pct + hstr_utgst_tax_pct + hstr_gst_cess_tax_pct) hsn_rates
"
"                    FROM pur_ord_receipt_hd,pur_ord_receipt_ln, hsn_sac_tax_rates
"
"                   WHERE porh_bu = porl_bu
"
"                     AND porh_receipt_no = porl_receipt_no
"
"                     AND porl_bu = hstr_bu
"
"                     AND porl_hsn_code = hstr_hsnsac_code
"
"                     AND porl_matl_type <> 'T'
"
"                     AND TRUNC(porh_receipt_date) BETWEEN hstr_date_from AND hstr_date_to
"
"                     AND porl_bu = p_bu
"
"                     AND porl_receipt_no = p_rcpt_no
"
"		     AND porl_status <> 'C'
"
"                   GROUP BY porl_hsn_code
"
"		   ORDER BY hsn_rates DESC)
"
"           WHERE ROWNUM = 1;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_hsn_code := NULL;
"
"      END;
"
"    ELSE
"
"      v_hsn_code := r_potc.protc_hsn_code;
"
"    END IF;
"
"
"
"
"
"    IF v_hsn_code IS NOT NULL THEN
"
"    proc_get_hsn_tax_pct(p_bu,
"
"                         v_hsn_code,
"
"			 TRUNC(r_prh.porh_receipt_date),
"
"                         CASE WHEN r_prh.porh_gst_clf_type = 'M' THEN 'I' ELSE r_prh.porh_gst_clf_type END,
"
"                         r_potc.protc_gst_input_type,
"
"			 r_potc.protc_gst_exmpt_flag,
"
"			 r_potc.protc_qty,
"
"                         r_potc.protc_chrg_amt,
"
"                         v_tax_pct,
"
"                         v_cgst_pct,
"
"                         v_sgst_pct,
"
"                         v_utgst_pct,
"
"                         v_cess_pct,
"
"			 v_cess_rate,
"
"                         v_igst_amt,
"
"                         v_cgst_amt,
"
"                         v_sgst_amt,
"
"                         v_utgst_amt,
"
"                         v_cess_amt
"
"	                );
"
"    END IF;
"
"
"
"    /*IF r_potc.protc_gst_exmpt_flag  = 'R' THEN
"
"        v_tax_pct := 0;
"
"        v_igst_amt := 0;
"
"	v_cgst_amt := 0;
"
"	v_sgst_amt := 0;
"
"    END IF;*/
"
"
"
"	v_tax_amt := NVL(v_igst_amt,0) + NVL(v_cgst_amt,0) + NVL(v_sgst_amt,0) + NVL(v_utgst_amt,0) + NVL(v_cess_amt,0);
"
"
"
"      INSERT INTO pur_ord_receipt_ln(porl_bu,
"
"                                     porl_plnt,
"
"				     porl_plnt_loc_id,
"
"			             porl_receipt_no,
"
"			             porl_seq_no,
"
"				     porl_prod_id,
"
"				     porl_prod_rev,
"
"				     porl_prod_desc1,
"
"				     porl_cls_id,
"
"				     porl_prod_cls_desc,
"
"				     porl_sub_cls_id,
"
"				     porl_prod_subcls_desc,
"
"				     porl_suplr_uom,
"
"				     porl_prod_uom,
"
"				     porl_conv_factor,
"
"				     porl_suplr_bill_qty,
"
"				     porl_temp_inv_qty,
"
"				     porl_inv_proc_qty,
"
"    			             porl_receipt_qty,
"
"				     porl_accepted_qty,
"
"				     porl_stock_receipt_qty,
"
"				     porl_stk_accepted_qty,
"
"    			             porl_sc_unit_cost,
"
"			             porl_cre_by,
"
"    			             porl_cre_date,
"
"			             porl_status,
"
"			             porl_hsn_code,
"
"			             porl_matl_type,
"
"				     porl_dept_id,
"
"				     porl_tax_set_id,
"
"				     porl_tc_chrg_flag,
"
"				     porl_gst_exempt_flag,
"
"				     porl_gst_input_type,
"
"				     porl_tcs_sec_id,
"
"				     porl_po_plnt,
"
"				     porl_po_plnt_loc_id,
"
"				     porl_storage_store_id,
"
"				     porl_storage_store_name,
"
"				     porl_tax_pct,
"
"				     porl_cgst_pct,
"
"				     porl_sgst_pct,
"
"				     porl_utgst_pct,
"
"				     porl_cess_pct,
"
"				     porl_igst_amt,
"
"				     porl_cgst_amt,
"
"				     porl_sgst_amt,
"
"				     porl_utgst_amt,
"
"				     porl_cess_amt,
"
"				     porl_pur_acct,
"
"				     porl_cc_code,
"
"				     porl_tax_amt,
"
"				     porl_po_no
"
"			            )
"
"		              VALUES(p_bu,
"
"			             p_plnt,
"
"				     v_plnt_loc_id,
"
"			             p_rcpt_no,
"
"			             v_pr_seq_no,
"
"				     r_potc.protc_prod_id,
"
"				     r_potc.protc_prod_rev,
"
"				     r_potc.protc_prod_desc1,
"
"				     r_potc.protc_prod_cls,
"
"				     (SELECT class_desc1 FROM classes WHERE class_bu = p_bu AND class_id = r_potc.protc_prod_cls),
"
"				     r_potc.protc_prod_subcls,
"
"				     (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = p_bu AND subcls_id = r_potc.protc_prod_subcls),
"
"				     r_potc.protc_prod_uom,
"
"				     r_potc.protc_prod_uom,
"
"				     1,
"
"			             r_potc.protc_qty,
"
"				     r_potc.protc_qty,
"
"				     r_potc.protc_qty,
"
"				     r_potc.protc_qty,
"
"				     r_potc.protc_qty,
"
"				     r_potc.protc_qty,
"
"				     r_potc.protc_qty,
"
"			             r_potc.protc_chrg_amt,
"
"			             p_user,
"
"			             SYSDATE,
"
"			             'Q',
"
"			             v_hsn_code,
"
"			             'T',
"
"				     v_dept_id,
"
"				     v_tax_set_id,
"
"				     r_potc.prod_tc_charge_flag,
"
"				     r_potc.protc_gst_exmpt_flag,
"
"				     r_potc.protc_gst_input_type,
"
"				     CASE WHEN r_potc.protc_inc_tcs_flag = 'Y' THEN v_tcs_sec_id ELSE NULL END,
"
"				     p_plnt,
"
"				     v_plnt_loc_id,
"
"				     v_dept_id,
"
"				     func_find_dept_desc(p_bu,v_dept_id,1),
"
"				     NVL(v_tax_pct,0),
"
"				     NVL(v_cgst_pct,0),
"
"				     NVL(v_sgst_pct,0),
"
"				     NVL(v_utgst_pct,0),
"
"				     NVL(v_cess_pct,0),
"
"				     NVL(v_igst_amt,0),
"
"				     NVL(v_cgst_amt,0),
"
"				     NVL(v_sgst_amt,0),
"
"				     NVL(v_utgst_amt,0),
"
"				     NVL(v_cess_amt,0),
"
"				     r_potc.protc_pur_acct,
"
"				     r_potc.protc_cc_code,
"
"				     v_tax_amt,
"
"				     r_potc.protc_po_no
"
"			            );
"
"
"
"    END LOOP;
"
"
"
"    UPDATE pur_ord_receipt_ln a
"
"       SET porl_tcf_id = (SELECT DISTINCT porl_tcf_id
"
"                            FROM pur_ord_receipt_hd,pur_ord_receipt_ln b
"
"                           WHERE porh_bu = b.porl_bu
"
"                             AND porh_receipt_no = b.porl_receipt_no
"
"                             AND b.porl_bu = p_bu
"
"                             AND b.porl_receipt_no = p_rcpt_no
"
"                             AND b.porl_matl_type = 'PR'
"
"                             AND ROWNUM = 1)
"
"     WHERE a.porl_bu = p_bu
"
"       AND a.porl_receipt_no = p_rcpt_no
"
"       AND a.porl_matl_type = 'T';
"
"
"
"  END proc_ins_pr_oth_tax_chrgs;
"
"
"
"  PROCEDURE proc_del_pr_oth_tax_chrgs(p_bu		VARCHAR2,
"
"				      p_rcpt_pfx	VARCHAR2,
"
"                                      p_rcpt_no		VARCHAR2
"
"                                     )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM pur_ord_receipt_ln
"
"     WHERE porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_matl_type = 'T';
"
"
"
"  END proc_del_pr_oth_tax_chrgs;
"
"
"
"  PROCEDURE proc_ins_po_oth_tax_chrgs(p_bu		VARCHAR2,
"
"                                      p_plnt		VARCHAR2,
"
"				      p_ord_no		VARCHAR2,
"
"				      p_user		VARCHAR2
"
"				      )
"
"
"
"  AS
"
"
"
"  CURSOR c_poh IS
"
"  SELECT poh_order_date,poh_gst_clf_type,poh_suplr_id,poh_currency,poh_gst_type,poh_terr_id,poh_plnt_loc_id
"
"    FROM pur_order_hd
"
"   WHERE poh_bu = p_bu
"
"     AND poh_order_no = p_ord_no;
"
"
"
"    v_po_seq_no		NUMBER;
"
"    v_hsn_code		VARCHAR2(25);
"
"    v_dept_id		prod_plants_loc.ppl_dflt_store_id%TYPE;
"
"    v_cost_basis	suppliers.suplr_pur_price_basis_source%TYPE;
"
"
"
"    r_poh		c_poh%ROWTYPE;
"
"
"
"    v_tax_pct		pur_order_ln.pol_tax_pct%TYPE;
"
"    v_cgst_pct		pur_order_ln.pol_cgst_pct%TYPE;
"
"    v_sgst_pct		pur_order_ln.pol_sgst_pct%TYPE;
"
"    v_utgst_pct		pur_order_ln.pol_utgst_pct%TYPE;
"
"    v_cess_pct		pur_order_ln.pol_cess_pct%TYPE;
"
"    v_igst_amt		pur_order_ln.pol_igst_amt%TYPE;
"
"    v_cgst_amt		pur_order_ln.pol_cgst_amt%TYPE;
"
"    v_sgst_amt		pur_order_ln.pol_sgst_amt%TYPE;
"
"    v_utgst_amt		pur_order_ln.pol_utgst_amt%TYPE;
"
"    v_cess_amt		pur_order_ln.pol_cess_amt%TYPE;
"
"    v_cat_id		VARCHAR2(30);
"
"    v_status 		VARCHAR2(1);
"
"    v_pur_acct		VARCHAR2(30);
"
"    v_cls		VARCHAR2(10);
"
"    v_sub_cls		VARCHAR2(10);
"
"    v_cess_rate         NUMBER(12,3);
"
"  BEGIN
"
"
"
"    OPEN c_poh;
"
"    FETCH c_poh INTO r_poh;
"
"    CLOSE c_poh;
"
"
"
"    DELETE FROM pur_order_ln
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_no = p_ord_no
"
"       AND pol_matl_type = 'T'
"
"       AND EXISTS(SELECT 1
"
"                    FROM po_oth_tax_charges
"
"		   WHERE potc_bu = pol_bu
"
"		     AND potc_ord_no = pol_order_no
"
"		     AND potc_prod_id = pol_prod_id
"
"		     AND potc_prod_rev = pol_prod_rev
"
"		     AND potc_chrg_amt = pol_sc_unit_cost);
"
"
"
"
"
"   FOR r_potc IN (SELECT potc_prod_id,potc_prod_rev,
"
"                         prod_desc11 potc_prod_desc1,
"
"			 prodplnt_cls potc_prod_cls,
"
"			 prodplnt_sub_cls potc_prod_subcls,
"
"			 prod_uom potc_prod_uom,
"
"			 potc_qty,potc_chrg_amt,potc_hsn_code,
"
"			 prod_tc_charge_flag,
"
"			 potc_gst_exmpt_flag,
"
"			 potc_gst_input_type,
"
"			 prod_stocked potc_stocked,
"
"			 potc_grn_rqrd_flag,
"
"			 potc_cc_code,
"
"			 potc_pur_acct
"
"                    FROM po_oth_tax_charges,products,prod_plants
"
"		   WHERE prod_bu = potc_bu
"
"		     AND prod_id = potc_prod_id
"
"		     AND prod_rev = potc_prod_rev
"
"		     AND prodplnt_bu = prod_bu
"
"		     AND prodplnt_prod_id = prod_id
"
"		     AND prodplnt_prod_rev = prod_rev
"
"		     AND prodplnt_plnt = p_plnt
"
"		     AND potc_bu = p_bu
"
"		     AND potc_ord_no = p_ord_no
"
"		     AND potc_chrg_amt > 0
"
"		  ORDER BY potc_seq_no)
"
"    LOOP
"
"
"
"        BEGIN
"
"        SELECT ppl_dflt_store_id
"
"          INTO v_dept_id
"
"	  FROM prod_plants_loc
"
"         WHERE ppl_bu = p_bu
"
"           AND ppl_plnt = p_plnt
"
"	   AND ppl_plnt_loc_id = r_poh.poh_plnt_loc_id
"
"	   AND ppl_prod_id = r_potc.potc_prod_id
"
"	   AND ppl_prod_rev = r_potc.potc_prod_rev;
"
"        EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20060,'ICM 1'||p_plnt||'/'||r_poh.poh_plnt_loc_id||'/'||r_potc.potc_prod_id||'/'||r_potc.potc_prod_rev);
"
"        END;
"
"
"
"        BEGIN
"
"          SELECT pol_status
"
"            INTO v_status
"
"            FROM (SELECT pol_status
"
"			        FROM pur_order_hd,pur_order_ln
"
"                   WHERE poh_bu = pol_bu
"
"                     AND poh_order_no = pol_order_no
"
"                     AND pol_matl_type <> 'T'
"
"                     AND pol_bu = p_bu
"
"                     AND pol_order_no = p_ord_no
"
"		             AND pol_status <> 'C'
"
"                GROUP BY pol_status)
"
"           WHERE ROWNUM = 1;
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_status := 'E';
"
"        END;
"
"
"
"	IF r_potc.potc_hsn_code IS NULL THEN
"
"        BEGIN
"
"          SELECT pol_hsn_code
"
"            INTO v_hsn_code
"
"            FROM (SELECT pol_hsn_code,
"
"                         MAX(hstr_cgst_tax_pct + hstr_sgst_tax_pct + hstr_igst_tax_pct + hstr_utgst_tax_pct + hstr_gst_cess_tax_pct) hsn_rates
"
"                    FROM pur_order_hd,pur_order_ln, hsn_sac_tax_rates
"
"                   WHERE poh_bu = pol_bu
"
"                     AND poh_order_no = pol_order_no
"
"                     AND pol_bu = hstr_bu
"
"                     AND pol_hsn_code = hstr_hsnsac_code
"
"                     AND pol_matl_type <> 'T'
"
"                     AND TRUNC(poh_order_date) BETWEEN hstr_date_from AND hstr_date_to
"
"                     AND pol_bu = p_bu
"
"                     AND pol_order_no = p_ord_no
"
"		     AND pol_status <> 'C'
"
"                   GROUP BY pol_hsn_code
"
"		   ORDER BY hsn_rates DESC)
"
"           WHERE ROWNUM = 1;
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_hsn_code := NULL;
"
"        END;
"
"        END IF;
"
"
"
"	BEGIN
"
"	  SELECT suplr_pur_price_basis_source
"
"	    INTO v_cost_basis
"
"	    FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"	     AND suplr_suplr_id = r_poh.poh_suplr_id;
"
"	EXCEPTION WHEN NO_DATA_FOUND THEN
"
"           v_cost_basis	:= 'U';
"
"	END;
"
"
"
"	IF r_poh.poh_currency = func_find_base_currency (p_bu)  THEN
"
"	--RAISE_APPLICATION_ERROR(-20999,'HRM '); func_find_party_curry(p_bu,r_poh.poh_suplr_id,1)
"
"	proc_get_hsn_tax_pct(p_bu,
"
"                             NVL(r_potc.potc_hsn_code,v_hsn_code),
"
"			     TRUNC(r_poh.poh_order_date),
"
"                             CASE WHEN r_poh.poh_gst_clf_type = 'M' THEN 'I' ELSE r_poh.poh_gst_clf_type END,
"
"                             r_potc.potc_gst_input_type,
"
"			     r_potc.potc_gst_exmpt_flag,
"
"			     r_potc.potc_qty,
"
"                             r_potc.potc_chrg_amt,
"
"                             v_tax_pct,
"
"                             v_cgst_pct,
"
"                             v_sgst_pct,
"
"                             v_utgst_pct,
"
"                             v_cess_pct,
"
"			     v_cess_rate,
"
"                             v_igst_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_utgst_amt,
"
"                             v_cess_amt
"
"	                     );
"
"     ELSE
"
"
"
"	 v_cgst_pct  := 0;
"
"	 v_sgst_pct  := 0;
"
"	 v_utgst_pct := 0;
"
"	 v_cess_pct  := 0;
"
"	 v_igst_amt  := 0;
"
"	 v_cgst_amt  := 0;
"
"	 v_sgst_amt  := 0;
"
"	 v_utgst_amt := 0;
"
"	 v_cess_amt  := 0;
"
"	 v_cess_rate := 0;
"
"
"
"     END IF;
"
"
"
"      IF r_poh.poh_gst_type <> 'R' THEN
"
"
"
"      BEGIN
"
"
"
"      SELECT grtc_cat_id
"
"        INTO v_cat_id
"
"        FROM gst_rev_tax_cat
"
"       WHERE grtc_bu = p_bu
"
"         AND grtc_active_flag ='Y'
"
"	 AND grtc_default_flag ='Y';
"
"
"
"	 EXCEPTION WHEN NO_DATA_FOUND THEN v_cat_id := NULL;
"
"      END;
"
"      END IF;
"
"
"
"      BEGIN
"
"
"
"      SELECT prod_cls,prod_sub_cls
"
"        INTO v_cls,v_sub_cls
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = r_potc.potc_prod_id
"
"	 AND prod_rev = r_potc.potc_prod_rev;
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN v_cls := NULL; v_sub_cls := NULL;
"
"
"
"      END;
"
"
"
"    v_pur_acct := func_find_pur_acct(p_bu,
"
"				    'PR',
"
"				    r_poh.poh_terr_id,
"
"				    v_cls,
"
"				    v_sub_cls,
"
"                                    p_plnt,
"
"				    r_potc.potc_prod_id,
"
"				    NVL(v_tax_pct,0),
"
"				    r_potc.potc_gst_exmpt_flag,
"
"				    r_poh.poh_gst_clf_type,
"
"				    r_poh.poh_plnt_loc_id,
"
"				    NULL,
"
"				   'N');
"
"
"
"
"
"        SELECT NVL(MAX(pol_seq_no),0)+1
"
"          INTO v_po_seq_no
"
"          FROM pur_order_ln
"
"         WHERE pol_bu = p_bu
"
"           AND pol_order_no = p_ord_no;
"
"
"
"
"
"	INSERT INTO pur_order_ln(pol_bu,
"
"                                 pol_plnt,
"
"			         pol_order_no,
"
"			         pol_seq_no,
"
"				 pol_print_seq_no,
"
"				 pol_prod_id,
"
"				 pol_prod_rev,
"
"				 pol_prod_desc1,
"
"				 pol_prod_cls,
"
"				 pol_prod_cls_desc,
"
"				 pol_prod_sub_cls,
"
"				 pol_prod_sub_cls_desc,
"
"				 pol_uom,
"
"				 pol_prod_uom,
"
"				 pol_conv_factor,
"
"				 pol_ordered_qty,
"
"				 pol_ord_stk_qty,
"
"    			         pol_sc_unit_cost,
"
"			         pol_cre_by,
"
"    			         pol_cre_date,
"
"			         pol_status,
"
"			         pol_hsn_code,
"
"			         pol_matl_type,
"
"				 pol_gst_exempt_flag,
"
"				 pol_gst_input_type,
"
"				 pol_store_id,
"
"				 pol_store_name,
"
"				 pol_tax_pct,
"
"				 pol_cgst_pct,
"
"				 pol_sgst_pct,
"
"				 pol_utgst_pct,
"
"				 pol_cess_pct,
"
"				 pol_igst_amt,
"
"				 pol_cgst_amt,
"
"				 pol_sgst_amt,
"
"				 pol_utgst_amt,
"
"				 pol_cess_amt,
"
"				 pol_cost_basis,
"
"				 pol_qc_required,
"
"				 pol_stocked,
"
"				 pol_net_disc_flag,
"
"				 pol_origin,
"
"				 pol_grn_rqrd_flag,
"
"				 pol_cc_code,
"
"				 pol_pur_acct,
"
"				 pol_rcm_flag,
"
"				 pol_rcm_cat_id,
"
"				 pol_disc_amt,
"
"				 pol_serv_io_type
"
"			         )
"
"		          VALUES(p_bu,
"
"			         p_plnt,
"
"			         p_ord_no,
"
"			         v_po_seq_no,
"
"				 v_po_seq_no,
"
"				 r_potc.potc_prod_id,
"
"				 r_potc.potc_prod_rev,
"
"				 r_potc.potc_prod_desc1,
"
"				 r_potc.potc_prod_cls,
"
"				 (SELECT class_desc1 FROM classes WHERE class_bu = p_bu AND class_id = r_potc.potc_prod_cls),
"
"				 r_potc.potc_prod_subcls,
"
"				 (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = p_bu AND subcls_id = r_potc.potc_prod_subcls),
"
"				 r_potc.potc_prod_uom,
"
"				 r_potc.potc_prod_uom,
"
"				 1,
"
"			         r_potc.potc_qty,
"
"				 r_potc.potc_qty,
"
"			         r_potc.potc_chrg_amt,
"
"			         p_user,
"
"			         SYSDATE,
"
"			         NVL(v_status,'E'),
"
"			         NVL(r_potc.potc_hsn_code,v_hsn_code),
"
"			         'T',
"
"				 r_potc.potc_gst_exmpt_flag,
"
"				 r_potc.potc_gst_input_type,
"
"				 v_dept_id,
"
"				 func_find_dept_desc(p_bu,v_dept_id,1),
"
"				 NVL(v_tax_pct,0),
"
"				 v_cgst_pct,
"
"				 v_sgst_pct,
"
"				 v_utgst_pct,
"
"				 v_cess_pct,
"
"				 v_igst_amt,
"
"				 v_cgst_amt,
"
"				 v_sgst_amt,
"
"				 v_utgst_amt,
"
"				 v_cess_amt,
"
"				 v_cost_basis,
"
"				 'N',
"
"				 r_potc.potc_stocked,
"
"				 'N',
"
"				 'M',
"
"				 r_potc.potc_grn_rqrd_flag,
"
"				 r_potc.potc_cc_code,
"
"				 NVL(r_potc.potc_pur_acct,v_pur_acct),
"
"				 CASE WHEN r_poh.poh_gst_type <> 'R' THEN 'Y' ELSE 'N' END,
"
"				 v_cat_id,
"
"				 0,
"
"				 'I'
"
"			         );
"
"    END LOOP r_potc;
"
"
"
"
"
"  END proc_ins_po_oth_tax_chrgs;
"
"
"
"  PROCEDURE proc_del_po_oth_tax_chrgs(p_bu		VARCHAR2,
"
"				      p_ord_no		VARCHAR2
"
"				      )
"
"  AS
"
"  BEGIN
"
"     DELETE FROM pur_order_ln
"
"      WHERE pol_bu = p_bu
"
"        AND pol_order_no = p_ord_no
"
"	AND pol_matl_type = 'T';
"
"
"
"  END proc_del_po_oth_tax_chrgs;
"
"
"
"END pkg_ot_chrgs;"
/
