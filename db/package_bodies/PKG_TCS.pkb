CREATE OR REPLACE
"PACKAGE BODY pkg_tcs
"
"AS
"
"
"
"  FUNCTION func_find_tcs_pct(p_bu		VARCHAR2,
"
"                             p_tcs_sec_id	VARCHAR2,
"
"                             p_doc_date		DATE
"
"                            ) RETURN NUMBER
"
"  AS
"
"    v_tcs_pct	NUMBER;
"
"  BEGIN
"
"
"
"    BEGIN
"
"      SELECT tcrl_pan_adhr_rate
"
"        INTO v_tcs_pct
"
"        FROM tcs_rates_hd,tcs_rates_ln
"
"       WHERE tcrh_bu = tcrl_bu
"
"         AND tcrh_doc_no = tcrl_doc_no
"
"         AND tcrh_bu = p_bu
"
"         AND p_doc_date BETWEEN tcrh_date_from AND tcrh_date_to
"
"         AND tcrl_tds_us = p_tcs_sec_id
"
"         AND tcrh_status = 'A';
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_tcs_pct := 0;
"
"    END;
"
"
"
"
"
"    RETURN v_tcs_pct;
"
"
"
"  EXCEPTION
"
"    WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20999,'HRM TCS Rate not found.');
"
"    WHEN OTHERS THEN Raise_Application_Error(-20999,'HRM TCS Rate not found.');
"
"
"
"  END func_find_tcs_pct;
"
"
"
"  PROCEDURE proc_upd_tcs_amt_frm_po(p_bu		VARCHAR2,
"
"                                    p_ord_pfx		VARCHAR2,
"
"                                    p_ord_no		VARCHAR2,
"
"                                    p_user		VARCHAR2
"
"				   )
"
"  AS
"
"    CURSOR c_poh IS
"
"    SELECT *
"
"      FROM pur_order_hd
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_pfx = p_ord_pfx
"
"       AND poh_order_no = p_ord_no;
"
"
"
"    r_poh	c_poh%ROWTYPE;
"
"
"
"    v_tax_amt		NUMBER;
"
"    v_tot_tcs_amt	NUMBER;
"
"    v_tot_tcs_amt1	NUMBER;
"
"
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
"    /*UPDATE pur_order_ln
"
"       SET pol_tcs_acces_val = ((pol_ordered_qty * pol_sc_unit_cost) - NVL(pol_disc_amt,0)) +
"
"                                NVL((SELECT SUM(poptc_tc_amt)
"
"				       FROM po_prod_tax_charges
"
"				      WHERE poptc_bu = pol_bu
"
"				        AND poptc_po_pfx = pol_order_pfx
"
"					AND poptc_po_no = pol_order_no
"
"					AND poptc_seq_no = pol_seq_no),0),
"
"           pol_tcs_pct = func_find_tcs_pct(p_bu,pol_tcs_sec_id,r_poh.poh_order_date)
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_pfx = p_ord_pfx
"
"       AND pol_order_no = p_ord_no
"
"       AND pol_status <> 'C';
"
"
"
"    UPDATE pur_order_ln
"
"       SET pol_tcs_amt = pol_tcs_acces_val * (pol_tcs_pct/100)
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_pfx = p_ord_pfx
"
"       AND pol_order_no = p_ord_no
"
"       AND pol_status <> 'C';
"
"
"
"    SELECT SUM(pol_tcs_amt)
"
"      INTO v_tot_tcs_amt
"
"      FROM pur_order_ln
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_pfx = p_ord_pfx
"
"       AND pol_order_no = p_ord_no
"
"       AND pol_status <> 'C';*/
"
"
"
"    UPDATE pur_order_hd
"
"       SET poh_tcs_amt = NVL(v_tot_tcs_amt,0)
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_pfx = p_ord_pfx
"
"       AND poh_order_no = p_ord_no;
"
"
"
"    /*IF SQL%FOUND THEN
"
"      Raise_Application_Error(-20999,'HRM Y'||v_tot_tcs_amt);
"
"    ELSE
"
"      Raise_Application_Error(-20999,'HRM N'||v_tot_tcs_amt);
"
"    END IF;*/
"
"
"
"  END proc_upd_tcs_amt_frm_po;
"
"
"
"  PROCEDURE proc_del_tcs_amt_frm_po(p_bu		VARCHAR2,
"
"                                    p_ord_pfx		VARCHAR2,
"
"                                    p_ord_no		VARCHAR2,
"
"                                    p_user		VARCHAR2
"
"				   )
"
"  AS
"
"  BEGIN
"
"
"
"    /*UPDATE pur_order_ln
"
"       SET pol_tcs_acces_val = 0,
"
"           pol_tcs_pct = 0,
"
"	   pol_tcs_amt = 0
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_pfx = p_ord_pfx
"
"       AND pol_order_no = p_ord_no
"
"       AND pol_status <> 'C';*/
"
"
"
"    UPDATE pur_order_hd
"
"       SET poh_tcs_amt = 0
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_pfx = p_ord_pfx
"
"       AND poh_order_no = p_ord_no;
"
"
"
"  END proc_del_tcs_amt_frm_po;
"
"
"
"  PROCEDURE proc_upd_tcs_amt_frm_po_amend(p_bu		VARCHAR2,
"
"                                          p_plnt	VARCHAR2,
"
"                                          p_doc_no	VARCHAR2,
"
"                                          p_user	VARCHAR2
"
"				         )
"
"  AS
"
"    CURSOR c_poh IS
"
"    SELECT *
"
"      FROM po_amend_hd
"
"     WHERE pah_bu = p_bu
"
"       AND pah_plnt = p_plnt
"
"       AND pah_doc_no = p_doc_no;
"
"
"
"    r_poh	c_poh%ROWTYPE;
"
"
"
"    v_tax_amt		NUMBER;
"
"    v_tot_tcs_amt	NUMBER;
"
"    v_tot_tcs_amt1	NUMBER;
"
"
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
"    UPDATE po_amend_line_chnges
"
"       SET palc_tcs_acces_val = (palc_new_po_qty * (palc_new_unit_cost - (palc_new_unit_cost * (palc_new_disc_pct/100)))),
"
"           palc_tcs_pct = func_find_tcs_pct(p_bu,palc_tcs_sec_id,r_poh.pah_doc_date)
"
"     WHERE palc_bu = p_bu
"
"       AND palc_plnt = p_plnt
"
"       AND palc_doc_no = p_doc_no;
"
"
"
"    UPDATE po_amend_line_chnges
"
"       SET palc_tcs_amt = palc_tcs_acces_val * (palc_tcs_pct/100)
"
"     WHERE palc_bu = p_bu
"
"       AND palc_plnt = p_plnt
"
"       AND palc_doc_no = p_doc_no;
"
"
"
"    SELECT SUM(palc_tcs_amt)
"
"      INTO v_tot_tcs_amt
"
"      FROM po_amend_line_chnges
"
"     WHERE palc_bu = p_bu
"
"       AND palc_plnt = p_plnt
"
"       AND palc_doc_no = p_doc_no;
"
"
"
"    UPDATE po_amend_hd
"
"       SET pah_tcs_amt = NVL(v_tot_tcs_amt,0)
"
"     WHERE pah_bu = p_bu
"
"       AND pah_plnt = p_plnt
"
"       AND pah_doc_no = p_doc_no;
"
"
"
"  END proc_upd_tcs_amt_frm_po_amend;
"
"
"
"  PROCEDURE proc_del_tcs_amt_frm_po_amend(p_bu		VARCHAR2,
"
"                                          p_plnt	VARCHAR2,
"
"                                          p_doc_no	VARCHAR2,
"
"                                          p_user	VARCHAR2
"
"				         )
"
"  AS
"
"  BEGIN
"
"
"
"    UPDATE po_amend_line_chnges
"
"       SET palc_tcs_acces_val = 0,
"
"           palc_tcs_pct = 0,
"
"	   palc_tcs_amt = 0
"
"     WHERE palc_bu = p_bu
"
"       AND palc_plnt = p_plnt
"
"       AND palc_doc_no = p_doc_no;
"
"
"
"    UPDATE po_amend_hd
"
"       SET pah_tcs_amt = 0
"
"     WHERE pah_bu = p_bu
"
"       AND pah_plnt = p_plnt
"
"       AND pah_doc_no = p_doc_no;
"
"
"
"  END proc_del_tcs_amt_frm_po_amend;
"
"
"
"  PROCEDURE proc_ins_suplr_tcs_limit(p_bu		VARCHAR2,
"
"                                     p_suplr_id		VARCHAR2,
"
"				     p_ded_suplr_id	VARCHAR2,
"
"				     p_year		NUMBER,
"
"				     p_sec_id		VARCHAR2,
"
"				     p_rcpt_inprog_amt	NUMBER,
"
"				     p_rcpt_acntd_amt	NUMBER,
"
"				     p_assbl_inprog_amt	NUMBER,
"
"				     p_assbl_acntd_amt	NUMBER,
"
"				     p_tcs_inprog_amt	NUMBER,
"
"				     p_tcs_acntd_amt	NUMBER,
"
"				     p_user		VARCHAR2
"
"				    )
"
"  AS
"
"  BEGIN
"
"    UPDATE suplr_bill_ded_tcs
"
"       SET sbdt_upd_by = p_user,
"
"	   sbdt_upd_emp_id = func_find_emp_id(p_bu,p_user),
"
"	   sbdt_upd_ip_addr = Audit_Info.Get_Ip_Address,
"
"	   sbdt_upd_os_user = Audit_Info.Get_Os_user,
"
"	   sbdt_upd_date = SYSDATE
"
"     WHERE sbdt_bu = p_bu
"
"       AND sbdt_suplr_id = p_suplr_id
"
"       AND sbdt_ded_suplr_id = p_ded_suplr_id
"
"       AND sbdt_fin_year = p_year
"
"       AND sbdt_tcs_us_id = p_sec_id;
"
"    UPDATE suplr_bill_ded_tcs
"
"       SET sbdt_bills_inprog = sbdt_bills_inprog + p_rcpt_inprog_amt,
"
"           sbdt_bills_acntd = sbdt_bills_acntd + p_rcpt_acntd_amt,
"
"	   sbdt_assbl_inprog = sbdt_assbl_inprog + p_assbl_inprog_amt,
"
"	   sbdt_assbl_acntd = sbdt_assbl_acntd + p_assbl_acntd_amt,
"
"	   sbdt_tcs_coll_inprog = sbdt_tcs_coll_inprog + p_tcs_inprog_amt,
"
"	   sbdt_tcs_coll_acntd = sbdt_tcs_coll_acntd + p_tcs_acntd_amt,
"
"           sbdt_upd_by = p_user,
"
"	   sbdt_upd_emp_id = func_find_emp_id(p_bu,p_user),
"
"	   sbdt_upd_ip_addr = Audit_Info.Get_Ip_Address,
"
"	   sbdt_upd_os_user = Audit_Info.Get_Os_user,
"
"	   sbdt_upd_date = SYSDATE
"
"     WHERE sbdt_bu = p_bu
"
"       AND sbdt_suplr_id = p_suplr_id
"
"       AND sbdt_ded_suplr_id = p_ded_suplr_id
"
"       AND sbdt_fin_year = p_year
"
"       AND sbdt_tcs_us_id = p_sec_id;
"
"
"
"    IF SQL%NOTFOUND THEN
"
"      INSERT INTO suplr_bill_ded_tcs(sbdt_bu,
"
"				     sbdt_suplr_id,
"
"				     sbdt_ded_suplr_id,
"
"				     sbdt_fin_year,
"
"				     sbdt_tcs_us_id,
"
"				     sbdt_bills_inprog,
"
"				     sbdt_bills_acntd,
"
"				     sbdt_assbl_inprog,
"
"				     sbdt_assbl_acntd,
"
"				     sbdt_tcs_coll_inprog,
"
"				     sbdt_tcs_coll_acntd,
"
"				     sbdt_cre_by,
"
"				     sbdt_cre_emp_id,
"
"				     sbdt_cre_ip_addr,
"
"				     sbdt_cre_os_user,
"
"				     sbdt_cre_date
"
"				    )
"
"			      VALUES(p_bu,
"
"				     p_suplr_id,
"
"				     p_ded_suplr_id,
"
"				     p_year,
"
"				     p_sec_id,
"
"				     p_rcpt_inprog_amt,
"
"				     p_rcpt_acntd_amt,
"
"				     p_assbl_inprog_amt,
"
"				     p_assbl_acntd_amt,
"
"				     p_tcs_inprog_amt,
"
"				     p_tcs_acntd_amt,
"
"				     p_user,
"
"				     func_find_emp_id(p_bu,p_user),
"
"				     Audit_Info.Get_Ip_Address,
"
"				     Audit_Info.Get_Os_user,
"
"				     SYSDATE
"
"				    );
"
"    END IF;
"
"
"
"  END proc_ins_suplr_tcs_limit;
"
"
"
"  PROCEDURE proc_upd_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                     p_rcpt_pfx		VARCHAR2,
"
"                                     p_rcpt_no		VARCHAR2,
"
"                                     p_user		VARCHAR2
"
"				    )
"
"  AS
"
"    CURSOR c_porh IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_hd
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no
"
"       --AND porh_type <> 'TS'
"
"       AND porh_mode = 'PR';
"
"
"
"    r_porh	c_porh%ROWTYPE;
"
"
"
"    v_tcs_limit_flag	VARCHAR2(1);
"
"    v_ded_suplr_id	VARCHAR2(10);
"
"
"
"    v_tax_amt		NUMBER;
"
"    v_rcpt_amt		NUMBER;
"
"    v_rcpt_rcvd_amt	NUMBER;
"
"    v_tcs_yesrly_limit	NUMBER;
"
"    v_tcs_pct		NUMBER;
"
"    v_tcs_assbl_amt	NUMBER;
"
"    v_tcs_amt		NUMBER;
"
"    v_tot_tcs_amt	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    OPEN c_porh;
"
"    FETCH c_porh INTO r_porh;
"
"    CLOSE c_porh;
"
"   IF  r_porh.porh_mode <> 'SC' THEN
"
"    BEGIN
"
"      SELECT suplr_tcs_ded_flg
"
"        INTO v_tcs_limit_flag
"
"	FROM suppliers
"
"       WHERE suplr_bu = p_bu
"
"         AND suplr_suplr_id = r_porh.porh_suplr_id;
"
"    EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20118,'APM '||r_porh.porh_suplr_id);
"
"    END;
"
"    END IF;
"
"    FOR r_porl IN (SELECT *
"
"                     FROM pur_ord_receipt_ln
"
"		    WHERE porl_bu = p_bu
"
"                      AND porl_receipt_no = p_rcpt_no
"
"                      AND porl_status <> 'C'
"
"		      AND porl_tcs_sec_id IS NOT NULl
"
"		    ORDER BY porl_seq_no)
"
"    LOOP
"
"
"
"      /*BEGIN
"
"        SELECT tcus_pan_adhr
"
"	  INTO v_ded_suplr_id
"
"	  FROM tcs_under_sections
"
"	 WHERE tcus_bu = p_bu
"
"	   AND tcus_id = r_porl.porl_tcs_sec_id;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END;
"
"
"
"      IF v_ded_suplr_id IS NULL THEN
"
"        Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END IF;*/
"
"
"
"      v_rcpt_amt := (r_porl.porl_receipt_qty * r_porl.porl_sc_unit_cost) - NVL(r_porl.porl_disc_amt,0);
"
"
"
"      v_tcs_pct := func_find_tcs_pct(p_bu,r_porl.porl_tcs_sec_id,r_porh.porh_receipt_date);
"
"
"
"      --IF v_tcs_limit_flag = 'N' THEN
"
"        v_tcs_assbl_amt := v_rcpt_amt;
"
"        v_tcs_amt := v_tcs_assbl_amt * (v_tcs_pct/100);
"
"      /*ELSE
"
"
"
"	SELECT SUM(sbdt_bills_inprog + sbdt_bills_acntd)
"
"	  INTO v_rcpt_rcvd_amt
"
"	  FROM suplr_bill_ded_tcs
"
"	 WHERE sbdt_bu = p_bu
"
"           AND sbdt_suplr_id = r_porh.porh_suplr_id
"
"           AND sbdt_ded_suplr_id = v_ded_suplr_id
"
"           AND sbdt_fin_year = r_porh.porh_year
"
"           AND sbdt_tcs_us_id = r_porl.porl_tcs_sec_id;
"
"
"
"        BEGIN
"
"	  SELECT tcrl_yrly_tl_limit
"
"            INTO v_tcs_yesrly_limit
"
"            FROM tcs_rates_hd,tcs_rates_ln
"
"           WHERE tcrh_bu = tcrl_bu
"
"             AND tcrh_doc_no = tcrl_doc_no
"
"             AND tcrh_bu = p_bu
"
"             AND r_porh.porh_receipt_date BETWEEN tcrh_date_from AND tcrh_date_to
"
"             AND tcrl_tds_us = r_porl.porl_tcs_sec_id
"
"             AND tcrh_status = 'A';
"
"	EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20137,'APM TCS Rate not found.');
"
"        END;
"
"
"
"	IF v_rcpt_rcvd_amt > v_tcs_yesrly_limit THEN
"
"          v_tcs_assbl_amt := v_rcpt_amt;
"
"          v_tcs_amt := v_tcs_assbl_amt * (v_tcs_pct/100);
"
"	ELSIF (v_rcpt_rcvd_amt + v_rcpt_amt) > v_tcs_yesrly_limit THEN
"
"          v_tcs_assbl_amt := (v_rcpt_rcvd_amt + v_rcpt_amt) - v_tcs_yesrly_limit;
"
"          v_tcs_amt := v_tcs_assbl_amt * (v_tcs_pct/100);
"
"	ELSE
"
"          v_tcs_assbl_amt := 0;
"
"          v_tcs_amt := v_tcs_assbl_amt * (v_tcs_pct/100);
"
"	END IF;
"
"      END IF;
"
"
"
"      proc_ins_suplr_tcs_limit(p_bu,
"
"	                       r_porh.porh_suplr_id,
"
"			       v_ded_suplr_id,
"
"			       r_porh.porh_year,
"
"			       r_porl.porl_tcs_sec_id,
"
"			       v_rcpt_amt,
"
"			       0,
"
"			       v_tcs_assbl_amt,
"
"			       0,
"
"			       v_tcs_amt,
"
"			       0,
"
"			       p_user
"
"			      );*/
"
"
"
"      UPDATE pur_ord_receipt_ln
"
"         SET porl_tcs_acces_val = v_tcs_assbl_amt,
"
"	     porl_tcs_pct = v_tcs_pct,
"
"	     porl_tcs_amt = v_tcs_amt
"
"       WHERE porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no
"
"	 AND porl_seq_no = r_porl.porl_seq_no;
"
"
"
"    END LOOP;
"
"
"
"    SELECT SUM(porl_tcs_amt)
"
"      INTO v_tot_tcs_amt
"
"      FROM pur_ord_receipt_ln
"
"     WHERE porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_status <> 'C';
"
"
"
"    UPDATE pur_ord_receipt_hd
"
"       SET porh_tcs_amt = NVL(v_tot_tcs_amt,0)
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no;
"
"
"
"  END proc_upd_tcs_amt_frm_grn;
"
"
"
"  PROCEDURE proc_del_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                     p_rcpt_pfx		VARCHAR2,
"
"                                     p_rcpt_no		VARCHAR2,
"
"                                     p_user		VARCHAR2
"
"				    )
"
"  AS
"
"    CURSOR c_porh IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_hd
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no
"
"       AND porh_type <> 'TS'
"
"       AND porh_mode = 'PR';
"
"
"
"    r_porh	c_porh%ROWTYPE;
"
"
"
"    v_ded_suplr_id	VARCHAR2(10);
"
"
"
"    v_tax_amt		NUMBER;
"
"    v_rcpt_amt		NUMBER;
"
"
"
"  BEGIN
"
"
"
"    OPEN c_porh;
"
"    FETCH c_porh INTO r_porh;
"
"    CLOSE c_porh;
"
"
"
"    FOR r_porl IN (SELECT *
"
"                     FROM pur_ord_receipt_ln
"
"		    WHERE porl_bu = p_bu
"
"                      AND porl_receipt_no = p_rcpt_no
"
"                      AND porl_status <> 'C'
"
"		      AND porl_tcs_sec_id IS NOT NULL
"
"		    ORDER BY porl_seq_no)
"
"    LOOP
"
"
"
"      /*BEGIN
"
"        SELECT tcus_pan_adhr
"
"	  INTO v_ded_suplr_id
"
"	  FROM tcs_under_sections
"
"	 WHERE tcus_bu = p_bu
"
"	   AND tcus_id = r_porl.porl_tcs_sec_id;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END;
"
"
"
"      IF v_ded_suplr_id IS NULL THEN
"
"        Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END IF;
"
"
"
"      SELECT SUM(porptc_tc_amt)
"
"        INTO v_tax_amt
"
"        FROM por_prod_tax_charges
"
"       WHERE porptc_bu = p_bu
"
"         AND porptc_receipt_pfx = p_rcpt_pfx
"
"	 AND porptc_receipt_no = p_rcpt_no
"
"	 AND porptc_receipt_seq_no = r_porl.porl_seq_no
"
"	 AND porptc_type = 'R';
"
"
"
"      v_rcpt_amt := (r_porl.porl_receipt_qty * r_porl.porl_sc_unit_cost) - NVL(r_porl.porl_disc_amt,0) + NVL(v_tax_amt,0);
"
"
"
"      proc_ins_suplr_tcs_limit(p_bu,
"
"	                       r_porh.porh_suplr_id,
"
"			       v_ded_suplr_id,
"
"			       r_porh.porh_year,
"
"			       r_porl.porl_tcs_sec_id,
"
"			       -v_rcpt_amt,
"
"			       0,
"
"			       -r_porl.porl_tcs_acces_val,
"
"			       0,
"
"			       -r_porl.porl_tcs_amt,
"
"			       0,
"
"			       p_user
"
"			      );*/
"
"
"
"      UPDATE pur_ord_receipt_ln
"
"         SET porl_tcs_acces_val = 0,
"
"             porl_tcs_pct = 0,
"
"	     porl_tcs_amt = 0
"
"       WHERE porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no
"
"         AND porl_seq_no = r_porl.porl_seq_no;
"
"
"
"    END LOOP;
"
"
"
"    UPDATE pur_ord_receipt_hd
"
"       SET porh_tcs_amt = 0
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no;
"
"
"
"  END proc_del_tcs_amt_frm_grn;
"
"
"
"  PROCEDURE proc_recv_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                      p_rcpt_pfx	VARCHAR2,
"
"                                      p_rcpt_no		VARCHAR2,
"
"                                      p_user		VARCHAR2
"
"				     )
"
"  AS
"
"    CURSOR c_porh IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_hd
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no
"
"       AND porh_type <> 'TS'
"
"       AND porh_mode = 'PR';
"
"
"
"    r_porh	c_porh%ROWTYPE;
"
"
"
"    v_ded_suplr_id	VARCHAR2(10);
"
"
"
"    v_tax_amt		NUMBER;
"
"    v_rcpt_amt		NUMBER;
"
"
"
"  BEGIN
"
"    NULL;
"
"    /*OPEN c_porh;
"
"    FETCH c_porh INTO r_porh;
"
"    CLOSE c_porh;
"
"
"
"    FOR r_porl IN (SELECT *
"
"                     FROM pur_ord_receipt_ln
"
"		    WHERE porl_bu = p_bu
"
"                      AND porl_receipt_no = p_rcpt_no
"
"                      AND porl_status <> 'C'
"
"		      AND porl_tcs_sec_id IS NOT NULL
"
"		    ORDER BY porl_seq_no)
"
"    LOOP
"
"
"
"      BEGIN
"
"        SELECT tcus_pan_adhr
"
"	  INTO v_ded_suplr_id
"
"	  FROM tcs_under_sections
"
"	 WHERE tcus_bu = p_bu
"
"	   AND tcus_id = r_porl.porl_tcs_sec_id;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END;
"
"
"
"      IF v_ded_suplr_id IS NULL THEN
"
"        Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END IF;
"
"
"
"      SELECT SUM(porptc_tc_amt)
"
"        INTO v_tax_amt
"
"        FROM por_prod_tax_charges
"
"       WHERE porptc_bu = p_bu
"
"         AND porptc_receipt_pfx = p_rcpt_pfx
"
"	 AND porptc_receipt_no = p_rcpt_no
"
"	 AND porptc_receipt_seq_no = r_porl.porl_seq_no
"
"	 AND porptc_type = 'R';
"
"
"
"      v_rcpt_amt := (r_porl.porl_receipt_qty * r_porl.porl_sc_unit_cost) - NVL(r_porl.porl_disc_amt,0) + NVL(v_tax_amt,0);
"
"
"
"      proc_ins_suplr_tcs_limit(p_bu,
"
"	                       r_porh.porh_suplr_id,
"
"			       v_ded_suplr_id,
"
"			       r_porh.porh_year,
"
"			       r_porl.porl_tcs_sec_id,
"
"			       -v_rcpt_amt,
"
"			       v_rcpt_amt,
"
"			       -r_porl.porl_tcs_acces_val,
"
"			       r_porl.porl_tcs_acces_val,
"
"			       -r_porl.porl_tcs_amt,
"
"			       r_porl.porl_tcs_amt,
"
"			       p_user
"
"			      );
"
"
"
"    END LOOP;*/
"
"
"
"  END proc_recv_tcs_amt_frm_grn;
"
"
"
"  PROCEDURE proc_can_tcs_amt_frm_grn(p_bu		VARCHAR2,
"
"                                     p_rcpt_pfx		VARCHAR2,
"
"                                     p_rcpt_no		VARCHAR2,
"
"                                     p_user		VARCHAR2
"
"				    )
"
"  AS
"
"    CURSOR c_porh IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_hd
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no
"
"       AND porh_type <> 'TS'
"
"       AND porh_mode = 'PR';
"
"
"
"    r_porh	c_porh%ROWTYPE;
"
"
"
"    v_ded_suplr_id	VARCHAR2(10);
"
"
"
"    v_tax_amt		NUMBER;
"
"    v_rcpt_amt		NUMBER;
"
"
"
"  BEGIN
"
"    NULL;
"
"    /*OPEN c_porh;
"
"    FETCH c_porh INTO r_porh;
"
"    CLOSE c_porh;
"
"
"
"    FOR r_porl IN (SELECT *
"
"                     FROM pur_ord_receipt_ln
"
"		    WHERE porl_bu = p_bu
"
"                      AND porl_receipt_no = p_rcpt_no
"
"                      AND porl_status <> 'C'
"
"		      AND porl_tcs_sec_id IS NOT NULl
"
"		    ORDER BY porl_seq_no)
"
"    LOOP
"
"
"
"      BEGIN
"
"        SELECT tcus_pan_adhr
"
"	  INTO v_ded_suplr_id
"
"	  FROM tcs_under_sections
"
"	 WHERE tcus_bu = p_bu
"
"	   AND tcus_id = r_porl.porl_tcs_sec_id;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END;
"
"
"
"      IF v_ded_suplr_id IS NULL THEN
"
"        Raise_Application_Error(-20118,'APM '||r_porl.porl_tcs_sec_id);
"
"      END IF;
"
"
"
"      SELECT SUM(porptc_tc_amt)
"
"        INTO v_tax_amt
"
"        FROM por_prod_tax_charges
"
"       WHERE porptc_bu = p_bu
"
"         AND porptc_receipt_pfx = p_rcpt_pfx
"
"	 AND porptc_receipt_no = p_rcpt_no
"
"	 AND porptc_receipt_seq_no = r_porl.porl_seq_no
"
"	 AND porptc_type = 'R';
"
"
"
"      v_rcpt_amt := (r_porl.porl_receipt_qty * r_porl.porl_sc_unit_cost) - NVL(r_porl.porl_disc_amt,0) + NVL(v_tax_amt,0);
"
"
"
"      proc_ins_suplr_tcs_limit(p_bu,
"
"	                       r_porh.porh_suplr_id,
"
"			       v_ded_suplr_id,
"
"			       r_porh.porh_year,
"
"			       r_porl.porl_tcs_sec_id,
"
"			       0,
"
"			       -v_rcpt_amt,
"
"			       0,
"
"			       -r_porl.porl_tcs_acces_val,
"
"			       0,
"
"			       -r_porl.porl_tcs_amt,
"
"			       p_user
"
"			      );
"
"
"
"    END LOOP;*/
"
"
"
"  END proc_can_tcs_amt_frm_grn;
"
"
"
"END;"
/
