CREATE OR REPLACE
"PACKAGE BODY pkg_subcontr
"
"AS
"
"
"
"PROCEDURE proc_cre_scv_frm_sa
"
"(p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_ord_no 		VARCHAR2,
"
" p_user   		VARCHAR2,
"
" p_lang			NUMBER,
"
" p_sc_ord_no	OUT	VARCHAR2
"
")
"
"IS
"
"CURSOR c1 IS
"
"SELECT DISTINCT satln_ord_type,sathd_ord_date,ppl_sc_ord_pfx,
"
"       store_inv_id,prodplnt_buyer_id,sathd_plnt,sathd_plnt_loc_id,sathd_plnt_loc_name
"
"  FROM stock_adj_trans_hd,stock_adj_trans_ln,stores,stock_adjust_prefixes,prod_plants,prod_plants_loc
"
" WHERE sathd_bu = satln_bu
"
"   AND sathd_ord_no = satln_ord_no
"
"   AND store_bu = sathd_bu
"
"   AND store_id = sathd_store_id
"
"   AND sap_bu = satln_bu
"
"   AND sap_prefix = satln_adj_prefix
"
"   AND prodplnt_bu = satln_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = satln_prod_id
"
"   AND prodplnt_prod_rev = satln_prod_rev
"
"   AND ppl_bu(+) = prodplnt_bu
"
"   AND ppl_plnt(+) = prodplnt_plnt
"
"   AND ppl_prod_id(+) = prodplnt_prod_id
"
"   AND ppl_prod_rev(+) = prodplnt_prod_rev
"
"   AND ppl_plnt_loc_id(+) = sathd_plnt_loc_id
"
"   AND sathd_bu = p_bu
"
"   AND sathd_ord_no = p_ord_no
"
"   AND satln_ord_type IN ('SCOV')
"
"   AND store_physical = 'V'
"
"   AND sap_oper IN ('I','O')
"
"   AND satln_status <> 'C';
"
"
"
"CURSOR c2(c_ord_type	VARCHAR2,
"
"          c_suplr_id	VARCHAR2,
"
"	  c_buyer_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM stock_adj_trans_hd,stock_adj_trans_ln,stores,stock_adjust_prefixes,products,prod_plants
"
" WHERE sathd_bu = satln_bu
"
"   AND sathd_ord_no = satln_ord_no
"
"   AND store_bu = sathd_bu
"
"   AND store_id = sathd_store_id
"
"   AND sap_bu = satln_bu
"
"   AND sap_prefix = satln_adj_prefix
"
"   AND prod_bu = satln_bu
"
"   AND prod_id = satln_prod_id
"
"   AND prod_rev = satln_prod_rev
"
"   AND prodplnt_bu = satln_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = satln_prod_id
"
"   AND prodplnt_prod_rev = satln_prod_rev
"
"   AND sathd_bu = p_bu
"
"   AND sathd_ord_no = p_ord_no
"
"   AND store_physical = 'V'
"
"   AND sap_oper IN ('I','O')
"
"   AND satln_status <> 'C'
"
"   AND store_inv_id = c_suplr_id
"
"   AND prodplnt_buyer_id = c_buyer_id
"
"   AND satln_ord_type = c_ord_type
"
" ORDER BY satln_seq_no;
"
"
"
"CURSOR c_suplr(c_suplr_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM suppliers
"
" WHERE suplr_bu = p_bu
"
"   AND suplr_suplr_id = c_suplr_id;
"
"
"
"CURSOR c_loc(c_suplr_id		VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('S','D','H','P');
"
"
"
"CURSOR c_bill_loc(c_suplr_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('B','D','I','P');
"
"
"
"CURSOR c_store(c_store_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM stores
"
" WHERE store_bu = p_bu
"
"   AND store_id = c_store_id;
"
"
"
"  r_suplr		c_suplr%ROWTYPE;
"
"  r_store		c_store%ROWTYPE;
"
"
"
"  r_loc			c_loc%ROWTYPE;
"
"  r_bill_loc		c_bill_loc%ROWTYPE;
"
"
"
"  v_sc_ord_no		VARCHAR2(15);
"
"  v_seq_no		NUMBER;
"
"  v_proc_seq_no		NUMBER;
"
"
"
"  v_req_id		VARCHAR2(10);
"
"  v_req_name		VARCHAR2(100);
"
"  v_pos_id		VARCHAR2(10);
"
"  v_pos_name		VARCHAR2(100);
"
"  v_dept_id		VARCHAR2(10);
"
"  v_dept_name		VARCHAR2(100);
"
"
"
"  v_gst_exempt_flag 	products.prod_gst_exempt_flag%TYPE;
"
"  v_gst_input_type      products.prod_gst_types_of_supply%TYPE;
"
"
"
"  v_proc_hsn_code	products.prod_hsn_code%TYPE;
"
"  v_rqst_no		VARCHAR2(100);
"
"  v_pfx			VARCHAR2(10);
"
"  v_store_id		VARCHAR2(10);
"
"  v_store_desc		VARCHAR2(50);
"
"
"
"BEGIN
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"       SELECT DISTINCT apsta_pfx INTO v_pfx
"
"          FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc
"
"         WHERE apsta_bu = adpl_bu
"
"           AND apsta_pfx = adpl_pfx
"
"           AND apsta_bu = p_bu
"
"           AND apsta_vou_type = 'SCO'
"
"           AND apsta_sub_type = 'SCOV'
"
"           AND apsta_plnt = cr1.sathd_plnt
"
"           AND adpl_loc_id = cr1.sathd_plnt_loc_id
"
"           AND adpl_dflt_loc = 'Y';
"
"
"
"    /*IF cr1.ppl_sc_ord_pfx IS NULL THEN
"
"      Raise_Application_Error(-20853,'ADM '||p_plnt);
"
"    END IF;*/
"
"
"
"    IF cr1.prodplnt_buyer_id IS NULL THEN
"
"      Raise_Application_Error(-20103,'APM ');
"
"    END IF;
"
"
"
"    v_sc_ord_no := func_find_pfx_nextno(p_bu,cr1.sathd_ord_date,v_pfx,p_user);
"
"
"
"    OPEN c_suplr(cr1.store_inv_id);
"
"    FETCH c_suplr INTO r_suplr;
"
"    CLOSE c_suplr;
"
"
"
"    proc_get_emp_det(p_bu,
"
"                     p_user,
"
"                     v_req_id,
"
"                     v_req_name,
"
"                     v_pos_id,
"
"                     v_pos_name,
"
"                     v_dept_id,
"
"                     v_dept_name,
"
"                     p_lang
"
"                    );
"
"
"
"    OPEN c_loc(cr1.store_inv_id);
"
"    FETCH c_loc INTO r_loc;
"
"      IF c_loc%NOTFOUND THEN
"
"        Raise_Application_Error(-20629,'MNT '||cr1.store_inv_id);
"
"      END IF;
"
"    CLOSE c_loc;
"
"
"
"    OPEN c_bill_loc(cr1.store_inv_id);
"
"    FETCH c_bill_loc INTO r_bill_loc;
"
"      IF c_bill_loc%NOTFOUND THEN
"
"        Raise_Application_Error(-20629,'MNT '||cr1.store_inv_id);
"
"      END IF;
"
"    CLOSE c_bill_loc;
"
"
"
"    INSERT INTO pur_order_hd(poh_bu,
"
"                             poh_mode,
"
"			     poh_plnt_loc_id,
"
"			     poh_plnt_loc_name,
"
"                             poh_type,
"
"                             poh_order_pfx,
"
"                             poh_order_no,
"
"                             poh_suplr_id,
"
"                             poh_suplr_name,
"
"                             poh_order_date,
"
"                             poh_order_year,
"
"                             poh_order_period,
"
"                             poh_currency,
"
"                             poh_exchange_rate,
"
"                             poh_status,
"
"                             poh_shipvia_id,
"
"                             poh_term_id,
"
"                             poh_fob_id,
"
"                             poh_buyer_id,
"
"                             poh_origin,
"
"                             poh_adv_payable,
"
"                             poh_adv_paid,
"
"                             poh_part_ship_flag,
"
"                             poh_reqstr_id,
"
"                             poh_reqstr_name,
"
"                             poh_reqstr_pos_id,
"
"                             poh_reqstr_pos_name,
"
"                             poh_rqst_dept_id,
"
"                             poh_cre_by,
"
"                             poh_cre_date,
"
"                             poh_plant,
"
"                             poh_terr_id,
"
"                             poh_billfr_loc_name,
"
"			     poh_cc_code,
"
"			     poh_shipto_loc_name
"
"			    )
"
"                      VALUES(p_bu,
"
"                             'SC',
"
"			     cr1.sathd_plnt_loc_id,
"
"			     cr1.sathd_plnt_loc_name,
"
"                             cr1.satln_ord_type,
"
"                             v_pfx,--cr1.ppl_sc_ord_pfx,
"
"                             v_sc_ord_no,
"
"                             cr1.store_inv_id,
"
"                             r_suplr.suplr_name1,
"
"                             cr1.sathd_ord_date,
"
"                             func_find_year(p_bu,cr1.sathd_ord_date),
"
"                             func_find_period(p_bu,cr1.sathd_ord_date),
"
"                             r_suplr.suplr_currency,
"
"                             func_find_exchange_rate(p_bu,r_suplr.suplr_currency,NULL,cr1.sathd_ord_date,'PO'),
"
"                             'E',
"
"                             r_suplr.suplr_shipvia_id,
"
"                             r_suplr.suplr_term_id,
"
"                             r_suplr.suplr_fob_id,
"
"                             cr1.prodplnt_buyer_id,
"
"                             'A',
"
"                             0,
"
"                             0,
"
"                             'Y',
"
"                             v_req_id,
"
"                             v_req_name,
"
"                             v_pos_id,
"
"                             v_pos_name,
"
"                             v_dept_id,
"
"                             p_user,
"
"                             SYSDATE,
"
"                             p_plnt,
"
"                             r_suplr.suplr_terr_id,
"
"                             r_bill_loc.ssl_loc_name1,
"
"			     func_find_pur_cpc_bu(p_bu,p_plnt,p_user),
"
"			     cr1.sathd_plnt_loc_name
"
"			    );
"
"
"
"    INSERT INTO pur_order_addr(poa_bu,
"
"                               poa_order_no,
"
"                               poa_orderby_addr1,
"
"                               poa_orderby_addr2,
"
"                               poa_orderby_addr3,
"
"                               poa_orderby_postal_code,
"
"                               poa_orderby_city,
"
"                               poa_orderby_state,
"
"                               poa_orderby_cntry,
"
"                               poa_orderby_tele1,
"
"                               poa_orderby_fax1,
"
"                               poa_orderby_email1,
"
"                               poa_cre_by,
"
"                               poa_cre_date,
"
"                               poa_billfr_addr1,
"
"                               poa_billfr_addr2,
"
"                               poa_billfr_addr3,
"
"                               poa_billfr_postal_code,
"
"                               poa_billfr_city,
"
"                               poa_billfr_state,
"
"                               poa_billfr_cntry,
"
"                               poa_billfr_tele1,
"
"                               poa_billfr_fax1,
"
"                               poa_billfr_email1
"
"			      )
"
"                        VALUES(p_bu,
"
"                               v_sc_ord_no,
"
"                               r_suplr.suplr_addr1,
"
"                               r_suplr.suplr_addr2,
"
"                               r_suplr.suplr_addr3,
"
"                               r_suplr.suplr_po_box,
"
"                               r_suplr.suplr_city,
"
"                               r_suplr.suplr_state,
"
"                               r_suplr.suplr_country,
"
"                               r_suplr.suplr_tele1,
"
"                               r_suplr.suplr_fax1,
"
"                               r_suplr.suplr_email1,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               r_suplr.suplr_addr1,
"
"                               r_suplr.suplr_addr2,
"
"                               r_suplr.suplr_addr3,
"
"                               r_suplr.suplr_po_box,
"
"                               r_suplr.suplr_city,
"
"                               r_suplr.suplr_state,
"
"                               r_suplr.suplr_country,
"
"                               r_suplr.suplr_tele1,
"
"                               r_suplr.suplr_fax1,
"
"                               r_suplr.suplr_email1
"
"			      );
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR cr2 IN c2(cr1.satln_ord_type,cr1.store_inv_id,cr1.prodplnt_buyer_id)
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      v_store_id := func_find_deflt_storeid (p_bu,p_plnt,cr1.sathd_plnt_loc_id,cr2.satln_prod_id,cr2.satln_prod_rev,cr2.prod_stocked);
"
"      v_store_desc := func_find_store_qry_desc (p_bu,v_store_id,1);
"
"
"
"      BEGIN
"
"        SELECT prod_gst_exempt_flag,prod_gst_types_of_supply
"
"          INTO v_gst_exempt_flag,v_gst_input_type
"
"          FROM products
"
"         WHERE prod_bu = p_bu
"
"           AND prod_id = cr2.satln_prod_id
"
"           AND prod_rev = cr2.satln_prod_rev;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_gst_exempt_flag := 'G';
"
"        v_gst_input_type := 'I';
"
"      END;
"
"
"
"      INSERT INTO pur_order_ln(pol_bu,
"
"                               pol_order_no,
"
"                               pol_seq_no,
"
"                               pol_print_seq_no,
"
"                               pol_prod_id,
"
"                               pol_prod_rev,
"
"                               pol_prod_desc1,
"
"                               pol_prod_cls,
"
"                               pol_prod_cls_desc,
"
"                               pol_prod_sub_cls,
"
"                               pol_prod_sub_cls_desc,
"
"                               pol_uom,
"
"                               pol_prod_uom,
"
"                               pol_conv_factor,
"
"                               pol_cost_basis,
"
"                               pol_contr_pfx,
"
"                               pol_contract_id,
"
"                               pol_sc_unit_cost,
"
"                               pol_disc_pct,
"
"                               pol_scon_mat_unit_cost,
"
"                               pol_qc_required,
"
"                               pol_stocked,
"
"                               pol_ordered_qty,
"
"                               pol_tolr_qty,
"
"                               pol_received_qty,
"
"                               pol_tot_received_qty,
"
"                               pol_rejected_qty,
"
"                               pol_deflt_schld_flag,
"
"                               pol_net_disc_flag,
"
"                               pol_origin,
"
"                               pol_proj_flag,
"
"                               pol_status,
"
"                               pol_cre_by,
"
"                               pol_cre_date,
"
"                               pol_prod_ord_no,
"
"                               pol_sf_code,
"
"                               pol_bom_avail_flag,
"
"                               pol_targ_sf_code  ,
"
"                               pol_scr_pct,
"
"                               pol_mat_req_trans_no,
"
"                               pol_drawing_no,
"
"                               pol_Drawing_rev,
"
"                               pol_hsn_code,
"
"			       pol_gst_exempt_flag,
"
"			       pol_gst_input_type,
"
"			       pol_store_id,
"
"                               pol_store_name
"
"                              )
"
"                        VALUES(p_bu,
"
"                               v_sc_ord_no,
"
"                               v_seq_no,
"
"                               v_seq_no,
"
"                               cr2.satln_prod_id,
"
"                               cr2.satln_prod_rev,
"
"                               cr2.prod_desc11,
"
"                               cr2.prodplnt_cls,
"
"                               (SELECT class_desc1 FROM classes WHERE class_bu = p_bu AND class_id = cr2.prodplnt_cls),
"
"                               cr2.prodplnt_sub_cls,
"
"                               (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = p_bu AND subcls_id = cr2.prodplnt_sub_cls),
"
"                               cr2.prod_uom,
"
"                               cr2.prod_uom,
"
"                               1,
"
"                               cr2.prodplnt_pur_price_basis,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               0,
"
"                               0,
"
"                               'N',
"
"                               cr2.prod_stocked,
"
"                               cr2.satln_trans_qty,
"
"                               cr2.satln_trans_qty,
"
"                               0,
"
"                               0,
"
"                               0,
"
"                               'Y',
"
"                               'Y',
"
"                               'A',
"
"                               'N',
"
"                               'E',
"
"                               p_user,
"
"                               SYSDATE,
"
"                               cr2.satln_po_ord_no,
"
"                               cr2.satln_sf_code,
"
"                               'N',
"
"                               cr2.satln_sf_code,
"
"                               0,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.prod_hsn_code,
"
"			       v_gst_exempt_flag,
"
"			       v_gst_input_type,
"
"			       v_store_id,
"
"                               v_store_desc
"
"                              );
"
"
"
"      v_proc_seq_no := 0;
"
"
"
"      /*FOR r_proc IN (SELECT sasp_oprn_seq_no,sasp_oprn_ln_seq_no,sasp_process,sasp_proc_cost,mfgo_uom,mfgo_prod_id,mfgo_prod_rev
"
"                       FROM stock_adj_sc_process,mfg_oprns
"
"		      WHERE mfgo_bu = sasp_bu
"
"                        AND mfgo_oprn_id = sasp_process
"
"			AND sasp_bu = p_bu
"
"		        AND sasp_ord_no = p_ord_no
"
"			AND sasp_seq_no = cr2.satln_seq_no)
"
"      LOOP
"
"
"
"	IF r_proc.mfgo_prod_id IS NULL THEN
"
"	  Raise_Application_Error(-20061,'PLN '||r_proc.mfgo_prod_id);
"
"	END IF;
"
"
"
"	BEGIN
"
"	  SELECT prod_hsn_code
"
"	    INTO v_proc_hsn_code
"
"	    FROM products
"
"	   WHERE prod_bu = p_bu
"
"	     AND prod_id = r_proc.mfgo_prod_id
"
"	     AND prod_rev = r_proc.mfgo_prod_rev;
"
"	EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN
"
"	    Raise_Application_Error(-20260,'ICM '||r_proc.mfgo_prod_id);
"
"	END;
"
"
"
"	IF v_proc_hsn_code IS NULL THEN
"
"	  Raise_Application_Error(-20029,'TAX '||r_proc.mfgo_prod_id);
"
"	END IF;
"
"
"
"        v_proc_seq_no := v_proc_seq_no + 1;
"
"
"
"	INSERT INTO sub_contr_ord_process(scop_bu,
"
"					  scop_ord_no,
"
"					  scop_seq_no,
"
"					  scop_sub_seq_no,
"
"					  scop_oprn_seq_no,
"
"					  scop_oprn_ln_seq_no,
"
"					  scop_process,
"
"					  scop_lab_cost,
"
"					  scop_cre_by,
"
"					  scop_cre_date,
"
"					  scop_uom,
"
"					  scop_prod_id,
"
"					  scop_prod_rev,
"
"					  scop_hsn_code
"
"					 )
"
"	                           VALUES(p_bu,
"
"					  v_sc_ord_no,
"
"					  v_seq_no,
"
"					  v_proc_seq_no,
"
"					  r_proc.sasp_oprn_seq_no,
"
"					  r_proc.sasp_oprn_ln_seq_no,
"
"					  r_proc.sasp_process,
"
"					  r_proc.sasp_proc_cost,
"
"					  p_user,
"
"					  SYSDATE,
"
"					  r_proc.mfgo_uom,
"
"					  r_proc.mfgo_prod_id,
"
"					  r_proc.mfgo_prod_rev,
"
"					  v_proc_hsn_code
"
"					 );
"
"
"
"      END LOOP;*/
"
"
"
"      OPEN c_store(cr2.prodplnt_deflt_store_id);
"
"      FETCH c_store INTO r_store;
"
"      CLOSE c_store;
"
"
"
"      UPDATE stock_adj_trans_ln
"
"         SET satln_os_ord_pfx = cr1.ppl_sc_ord_pfx,
"
"	     satln_os_ord_no = v_sc_ord_no,
"
"	     satln_os_ord_seq_no = v_seq_no,
"
"	     satln_os_ord_sub_seq_no = 1
"
"       WHERE satln_bu = p_bu
"
"         AND satln_ord_no = cr2.satln_ord_no
"
"	 AND satln_seq_no = cr2.satln_seq_no;
"
"
"
"    END LOOP;
"
"
"
"
"
"    proc_gen_sub_contr_mat_req(p_bu,p_plnt,cr1.ppl_sc_ord_pfx,v_sc_ord_no,p_user);
"
"    --proc_upd_po_cost(p_bu,cr1.ppl_sc_ord_pfx,v_sc_ord_no,p_user);
"
"
"
"
"
"    UPDATE pur_order_hd
"
"       SET poh_status = 'A',
"
"           poh_upd_cost_flag = 'Y'
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_no = v_sc_ord_no;
"
"
"
"    UPDATE pur_order_ln
"
"       SET pol_status = 'A'
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_no = v_sc_ord_no;
"
"
"
"  END LOOP;
"
"
"
"  p_sc_ord_no := v_sc_ord_no;
"
"
"
"END proc_cre_scv_frm_sa;
"
"
"
"PROCEDURE proc_cre_sco_frm_sa
"
"(p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_ord_no 		VARCHAR2,
"
" p_user   		VARCHAR2,
"
" p_lang			NUMBER,
"
" p_sc_ord_no	OUT	VARCHAR2
"
")
"
"IS
"
"CURSOR c1 IS
"
"SELECT DISTINCT sathd_ord_date,store_inv_id,prodplnt_buyer_id,sathd_plnt,sathd_plnt_loc_id
"
"  FROM stock_adj_trans_hd,stock_adj_trans_ln,stores,stock_adjust_prefixes,prod_plants
"
" WHERE sathd_bu = satln_bu
"
"   AND sathd_ord_no = satln_ord_no
"
"   AND store_bu = sathd_bu
"
"   AND store_id = sathd_store_id
"
"   AND sap_bu = satln_bu
"
"   AND sap_prefix = satln_adj_prefix
"
"   AND prodplnt_bu = satln_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = satln_fg_prod_id
"
"   AND prodplnt_prod_rev = satln_fg_prod_rev
"
"   AND sathd_bu = p_bu
"
"   AND sathd_ord_no = p_ord_no
"
"   AND satln_ord_type = 'SCOP'
"
"   AND store_physical = 'V'
"
"   AND sap_oper IN ('I','O')
"
"   AND satln_status <> 'C'
"
"   AND satln_mat_type = 'S';
"
"
"
"CURSOR c2(c_suplr_id	VARCHAR2,
"
"	  c_buyer_id	VARCHAR2) IS
"
"SELECT satln_fg_prod_id,satln_fg_prod_rev,satln_fg_qty,satln_bom_no,satln_bom_name,
"
"       prod_desc11,prodplnt_cls,prodplnt_sub_cls,prod_uom,prodplnt_pur_price_basis,prod_stocked,prod_abc_cls,prod_fv_cls,prod_hsn_code,
"
"       prodplnt_deflt_store_id,satln_po_ord_no,satln_so_type,satln_so_pfx,satln_so_no,satln_so_seq_no,satln_so_sub_seq_no,satln_proj_id,satln_task_id,
"
"       satln_so_schld_desc
"
"  FROM stock_adj_trans_hd,stock_adj_trans_ln,stores,stock_adjust_prefixes,products,prod_plants,prod_plants_loc
"
" WHERE sathd_bu = satln_bu
"
"   AND sathd_ord_no = satln_ord_no
"
"   AND store_bu = sathd_bu
"
"   AND store_id = sathd_store_id
"
"   AND sap_bu = satln_bu
"
"   AND sap_prefix = satln_adj_prefix
"
"   AND prod_bu = satln_bu
"
"   AND prod_id = satln_fg_prod_id
"
"   AND prod_rev = satln_fg_prod_rev
"
"   AND prodplnt_bu = satln_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = satln_fg_prod_id
"
"   AND prodplnt_prod_rev = satln_fg_prod_rev
"
"   AND ppl_bu(+) = prodplnt_bu
"
"   AND ppl_plnt(+) = prodplnt_plnt
"
"   AND ppl_prod_id(+) = prodplnt_prod_id
"
"   AND ppl_prod_rev(+) = prodplnt_prod_rev
"
"   AND ppl_plnt_loc_id(+) = sathd_plnt_loc_id
"
"   AND sathd_bu = p_bu
"
"   AND sathd_ord_no = p_ord_no
"
"   AND store_physical = 'V'
"
"   AND sap_oper IN ('I','O')
"
"   AND satln_status <> 'C'
"
"   AND store_inv_id = c_suplr_id
"
"   AND prodplnt_buyer_id = c_buyer_id
"
"   AND satln_ord_type = 'SCOP'
"
"   AND satln_mat_type = 'S'
"
" GROUP BY satln_fg_prod_id,satln_fg_prod_rev,satln_fg_qty,satln_bom_no,satln_bom_name,
"
"          prod_desc11,prodplnt_cls,prodplnt_sub_cls,prod_uom,prodplnt_pur_price_basis,prod_stocked,prod_abc_cls,prod_fv_cls,prod_hsn_code,
"
"	  prodplnt_deflt_store_id,satln_po_ord_no
"
" ORDER BY satln_fg_prod_id;
"
"
"
"CURSOR c_suplr(c_suplr_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM suppliers
"
" WHERE suplr_bu = p_bu
"
"   AND suplr_suplr_id = c_suplr_id;
"
"
"
"CURSOR c_loc(c_suplr_id		VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('S','D','H','P');
"
"
"
"CURSOR c_bill_loc(c_suplr_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('B','D','I','P');
"
"
"
"CURSOR c_store(c_store_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM stores
"
" WHERE store_bu = p_bu
"
"   AND store_id = c_store_id;
"
"
"
"  r_suplr		c_suplr%ROWTYPE;
"
"  r_store		c_store%ROWTYPE;
"
"
"
"  r_loc			c_loc%ROWTYPE;
"
"  r_bill_loc		c_bill_loc%ROWTYPE;
"
"
"
"  v_sc_ord_no		VARCHAR2(15);
"
"  v_seq_no		NUMBER;
"
"  v_proc_seq_no		NUMBER;
"
"
"
"  v_req_id		VARCHAR2(10);
"
"  v_req_name		VARCHAR2(100);
"
"  v_pos_id		VARCHAR2(10);
"
"  v_pos_name		VARCHAR2(100);
"
"  v_dept_id		VARCHAR2(10);
"
"  v_dept_name		VARCHAR2(100);
"
"
"
"  v_gst_exempt_flag 	products.prod_gst_exempt_flag%TYPE;
"
"  v_gst_input_type      products.prod_gst_types_of_supply%TYPE;
"
"
"
"  v_proc_hsn_code	products.prod_hsn_code%TYPE;
"
"  v_bu_state		states.state_id%TYPE;
"
"  v_tcf_id		hsn_sac_tax_rates.hstr_tcf_loc_id%TYPE;
"
"  v_unit_cost		pur_order_ln.pol_sc_unit_cost%TYPE;
"
"  v_rqst_no		VARCHAR2(100);
"
"
"
"  v_sc_mc_seq_no	NUMBER(5);
"
"  v_sc_ord_pfx		VARCHAR2(30);
"
"
"
"BEGIN
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"
"
"    IF cr1.prodplnt_buyer_id IS NULL THEN
"
"      Raise_Application_Error(-20103,'APM ');
"
"    END IF;
"
"
"
"    v_sc_ord_pfx := func_find_vou_dflt_pfx(p_bu,cr1.sathd_plnt,cr1.sathd_plnt_loc_id,'SCO','SCOP');
"
"    v_sc_ord_no := func_find_pfx_nextno(p_bu,cr1.sathd_ord_date,v_sc_ord_pfx,p_user);
"
"
"
"    OPEN c_suplr(cr1.store_inv_id);
"
"    FETCH c_suplr INTO r_suplr;
"
"    CLOSE c_suplr;
"
"
"
"    proc_get_emp_det(p_bu,
"
"                     p_user,
"
"                     v_req_id,
"
"                     v_req_name,
"
"                     v_pos_id,
"
"                     v_pos_name,
"
"                     v_dept_id,
"
"                     v_dept_name,
"
"                     p_lang
"
"                    );
"
"
"
"    OPEN c_loc(cr1.store_inv_id);
"
"    FETCH c_loc INTO r_loc;
"
"      IF c_loc%NOTFOUND THEN
"
"        Raise_Application_Error(-20629,'MNT '||cr1.store_inv_id);
"
"      END IF;
"
"    CLOSE c_loc;
"
"
"
"    OPEN c_bill_loc(cr1.store_inv_id);
"
"    FETCH c_bill_loc INTO r_bill_loc;
"
"      IF c_bill_loc%NOTFOUND THEN
"
"        Raise_Application_Error(-20629,'MNT '||cr1.store_inv_id);
"
"      END IF;
"
"    CLOSE c_bill_loc;
"
"
"
"    INSERT INTO pur_order_hd(poh_bu,
"
"                             poh_mode,
"
"                             poh_type,
"
"                             poh_order_pfx,
"
"                             poh_order_no,
"
"                             poh_suplr_id,
"
"                             poh_suplr_name,
"
"                             poh_order_date,
"
"                             poh_order_year,
"
"                             poh_order_period,
"
"                             poh_currency,
"
"                             poh_exchange_rate,
"
"                             poh_status,
"
"                             poh_shipvia_id,
"
"                             poh_term_id,
"
"                             poh_fob_id,
"
"                             poh_buyer_id,
"
"                             poh_origin,
"
"                             poh_adv_payable,
"
"                             poh_adv_paid,
"
"                             poh_part_ship_flag,
"
"                             poh_reqstr_id,
"
"                             poh_reqstr_name,
"
"                             poh_reqstr_pos_id,
"
"                             poh_reqstr_pos_name,
"
"                             poh_rqst_dept_id,
"
"                             poh_cre_by,
"
"                             poh_cre_date,
"
"                             poh_plant,
"
"                             poh_terr_id,
"
"                             poh_billfr_loc_name,
"
"			     poh_ref,
"
"			     poh_cc_code
"
"			    )
"
"                      VALUES(p_bu,
"
"                             'SC',
"
"                             'SCOP',
"
"                             v_sc_ord_pfx,
"
"                             v_sc_ord_no,
"
"                             cr1.store_inv_id,
"
"                             r_suplr.suplr_name1,
"
"                             cr1.sathd_ord_date,
"
"                             func_find_year(p_bu,cr1.sathd_ord_date),
"
"                             func_find_period(p_bu,cr1.sathd_ord_date),
"
"                             r_suplr.suplr_currency,
"
"                             func_find_exchange_rate(p_bu,r_suplr.suplr_currency,NULL,cr1.sathd_ord_date,'PO'),
"
"                             'E',
"
"                             r_suplr.suplr_shipvia_id,
"
"                             r_suplr.suplr_term_id,
"
"                             r_suplr.suplr_fob_id,
"
"                             cr1.prodplnt_buyer_id,
"
"                             'A',
"
"                             0,
"
"                             0,
"
"                             'Y',
"
"                             v_req_id,
"
"                             v_req_name,
"
"                             v_pos_id,
"
"                             v_pos_name,
"
"                             v_dept_id,
"
"                             p_user,
"
"                             SYSDATE,
"
"                             p_plnt,
"
"                             r_suplr.suplr_terr_id,
"
"                             r_bill_loc.ssl_loc_name1,
"
"			     'Stock Adjustment '||p_ord_no,
"
"                             func_find_pur_cpc_bu(p_bu,p_plnt,p_user)
"
"			    );
"
"
"
"    INSERT INTO pur_order_addr(poa_bu,
"
"                               poa_order_no,
"
"                               poa_orderby_addr1,
"
"                               poa_orderby_addr2,
"
"                               poa_orderby_addr3,
"
"                               poa_orderby_postal_code,
"
"                               poa_orderby_city,
"
"                               poa_orderby_state,
"
"                               poa_orderby_cntry,
"
"                               poa_orderby_tele1,
"
"                               poa_orderby_fax1,
"
"                               poa_orderby_email1,
"
"                               poa_cre_by,
"
"                               poa_cre_date,
"
"                               poa_billfr_addr1,
"
"                               poa_billfr_addr2,
"
"                               poa_billfr_addr3,
"
"                               poa_billfr_postal_code,
"
"                               poa_billfr_city,
"
"                               poa_billfr_state,
"
"                               poa_billfr_cntry,
"
"                               poa_billfr_tele1,
"
"                               poa_billfr_fax1,
"
"                               poa_billfr_email1
"
"			      )
"
"                        VALUES(p_bu,
"
"                               v_sc_ord_no,
"
"                               r_suplr.suplr_addr1,
"
"                               r_suplr.suplr_addr2,
"
"                               r_suplr.suplr_addr3,
"
"                               r_suplr.suplr_po_box,
"
"                               r_suplr.suplr_city,
"
"                               r_suplr.suplr_state,
"
"                               r_suplr.suplr_country,
"
"                               r_suplr.suplr_tele1,
"
"                               r_suplr.suplr_fax1,
"
"                               r_suplr.suplr_email1,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               r_suplr.suplr_addr1,
"
"                               r_suplr.suplr_addr2,
"
"                               r_suplr.suplr_addr3,
"
"                               r_suplr.suplr_po_box,
"
"                               r_suplr.suplr_city,
"
"                               r_suplr.suplr_state,
"
"                               r_suplr.suplr_country,
"
"                               r_suplr.suplr_tele1,
"
"                               r_suplr.suplr_fax1,
"
"                               r_suplr.suplr_email1
"
"			      );
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR cr2 IN c2(cr1.store_inv_id,cr1.prodplnt_buyer_id)
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      BEGIN
"
"        SELECT prod_gst_exempt_flag,prod_gst_types_of_supply
"
"          INTO v_gst_exempt_flag,v_gst_input_type
"
"          FROM products
"
"         WHERE prod_bu = p_bu
"
"           AND prod_id = cr2.satln_fg_prod_id
"
"           AND prod_rev = cr2.satln_fg_prod_rev;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_gst_exempt_flag := 'G';
"
"        v_gst_input_type := 'I';
"
"      END;
"
"
"
"      IF cr2.prod_hsn_code IS NULL THEN
"
"        Raise_Application_Error(-20015,'TAX '||cr2.satln_fg_prod_id||'/'||cr2.satln_fg_prod_rev);
"
"      END IF;
"
"
"
"      IF cr2.satln_fg_qty <= 0 THEN
"
"        Raise_Application_Error(-20045,'ICM '||'FG Quantity'||'/'||cr2.satln_fg_prod_id||'/'||cr2.satln_fg_prod_rev);
"
"      END IF;
"
"
"
"      SELECT bup_state
"
"        INTO v_bu_state
"
"        FROM bus_unit_plants
"
"       WHERE bup_bu = p_bu
"
"         AND bup_plant_id = p_plnt;
"
"
"
"      IF r_suplr.suplr_state = v_bu_state THEN
"
"
"
"        BEGIN
"
"          SELECT hstr_tcf_loc_id
"
"            INTO v_tcf_id
"
"            FROM hsn_sac_tax_rates
"
"           WHERE hstr_bu = p_bu
"
"             AND hstr_hsnsac_code = cr2.prod_hsn_code
"
"	     AND ROWNUM = 1;
"
"	EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN
"
"           v_tcf_id := NULL;
"
"        END;
"
"
"
"      ELSE
"
"
"
"        BEGIN
"
"          SELECT hstr_tcf_imp_id
"
"            INTO v_tcf_id
"
"            FROM hsn_sac_tax_rates
"
"           WHERE hstr_bu = p_bu
"
"             AND hstr_hsnsac_code = cr2.prod_hsn_code
"
"	     AND ROWNUM = 1;
"
"
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN
"
"            v_tcf_id := NULL;
"
"        END;
"
"
"
"      END IF;
"
"
"
"
"
"      INSERT INTO pur_order_ln(pol_bu,
"
"                               pol_order_no,
"
"                               pol_seq_no,
"
"                               pol_print_seq_no,
"
"                               pol_prod_id,
"
"                               pol_prod_rev,
"
"                               pol_prod_desc1,
"
"                               pol_prod_cls,
"
"                               pol_prod_cls_desc,
"
"                               pol_prod_sub_cls,
"
"                               pol_prod_sub_cls_desc,
"
"                               pol_uom,
"
"                               pol_prod_uom,
"
"                               pol_conv_factor,
"
"                               pol_cost_basis,
"
"                               pol_contr_pfx,
"
"                               pol_contract_id,
"
"                               pol_sc_unit_cost,
"
"                               pol_disc_pct,
"
"			       pol_disc_amt,
"
"                               pol_scon_mat_unit_cost,
"
"                               pol_qc_required,
"
"                               pol_stocked,
"
"                               pol_ordered_qty,
"
"                               pol_tolr_qty,
"
"                               pol_received_qty,
"
"                               pol_tot_received_qty,
"
"                               pol_rejected_qty,
"
"                               pol_deflt_schld_flag,
"
"                               pol_net_disc_flag,
"
"                               pol_origin,
"
"                               pol_proj_flag,
"
"                               pol_status,
"
"                               pol_cre_by,
"
"                               pol_cre_date,
"
"                               pol_prod_ord_no,
"
"                               pol_sf_code,
"
"                               pol_bom_avail_flag,
"
"                               pol_targ_sf_code  ,
"
"                               pol_scr_pct,
"
"                               pol_mat_req_trans_no,
"
"                               pol_drawing_no,
"
"                               pol_Drawing_rev,
"
"                               pol_hsn_code,
"
"			       pol_gst_exempt_flag,
"
"			       pol_gst_input_type,
"
"			       pol_bom_no,
"
"			       pol_bom_name
"
"                              )
"
"                        VALUES(p_bu,
"
"                               v_sc_ord_no,
"
"                               v_seq_no,
"
"                               v_seq_no,
"
"                               cr2.satln_fg_prod_id,
"
"                               cr2.satln_fg_prod_rev,
"
"                               cr2.prod_desc11,
"
"                               cr2.prodplnt_cls,
"
"                               (SELECT class_desc1 FROM classes WHERE class_bu = p_bu AND class_id = cr2.prodplnt_cls),
"
"                               cr2.prodplnt_sub_cls,
"
"                               (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = p_bu AND subcls_id = cr2.prodplnt_sub_cls),
"
"                               cr2.prod_uom,
"
"                               cr2.prod_uom,
"
"                               1,
"
"                               cr2.prodplnt_pur_price_basis,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               0,
"
"			       0,
"
"                               0,
"
"                               'N',
"
"                               cr2.prod_stocked,
"
"                               cr2.satln_fg_qty,
"
"                               cr2.satln_fg_qty,
"
"                               0,
"
"                               0,
"
"                               0,
"
"                               'Y',
"
"                               'Y',
"
"                               'A',
"
"                               'N',
"
"                               'E',
"
"                               p_user,
"
"                               SYSDATE,
"
"                               cr2.satln_po_ord_no,
"
"                               NULL,
"
"                               'Y',
"
"                               NULL,
"
"                               0,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.prod_hsn_code,
"
"			       v_gst_exempt_flag,
"
"			       v_gst_input_type,
"
"			       cr2.satln_bom_no,
"
"			       cr2.satln_bom_name
"
"                              );
"
"
"
"      v_proc_seq_no := 0;
"
"
"
"      FOR r_proc IN (SELECT DISTINCT satln_sc_proc_id,mfgo_uom,mfgo_prod_id,mfgo_prod_rev,satln_sc_proc_cost
"
"                       FROM stock_adj_trans_ln,mfg_oprns
"
"		      WHERE mfgo_bu = satln_bu
"
"                        AND mfgo_oprn_id = satln_sc_proc_id
"
"			AND satln_bu = p_bu
"
"		        AND satln_ord_no = p_ord_no
"
"			AND satln_fg_prod_id = cr2.satln_fg_prod_id
"
"			AND satln_fg_prod_rev = cr2.satln_fg_prod_rev
"
"			AND satln_fg_qty = cr2.satln_fg_qty)
"
"      LOOP
"
"
"
"	IF r_proc.mfgo_prod_id IS NULL THEN
"
"	  Raise_Application_Error(-20061,'PLN '||r_proc.satln_sc_proc_id);
"
"	END IF;
"
"
"
"	BEGIN
"
"	  SELECT prod_hsn_code
"
"	    INTO v_proc_hsn_code
"
"	    FROM products
"
"	   WHERE prod_bu = p_bu
"
"	     AND prod_id = r_proc.mfgo_prod_id
"
"	     AND prod_rev = r_proc.mfgo_prod_rev;
"
"	EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN
"
"	    Raise_Application_Error(-20260,'ICM '||r_proc.mfgo_prod_id);
"
"	END;
"
"
"
"	IF v_proc_hsn_code IS NULL THEN
"
"	  Raise_Application_Error(-20029,'TAX '||r_proc.mfgo_prod_id);
"
"	END IF;
"
"
"
"	UPDATE sub_contr_ord_process
"
"	   SET scop_lab_cost = r_proc.satln_sc_proc_cost
"
"	 WHERE scop_bu = p_bu
"
"	   AND scop_ord_no = v_sc_ord_no
"
"	   AND scop_seq_no = v_seq_no
"
"	   AND scop_process = r_proc.satln_sc_proc_id;
"
"
"
"	IF SQL%NOTFOUND THEN
"
"
"
"        v_proc_seq_no := v_proc_seq_no + 1;
"
"
"
"	INSERT INTO sub_contr_ord_process(scop_bu,
"
"					  scop_ord_no,
"
"					  scop_seq_no,
"
"					  scop_sub_seq_no,
"
"					  scop_oprn_seq_no,
"
"					  scop_process,
"
"					  scop_lab_cost,
"
"					  scop_cre_by,
"
"					  scop_cre_date,
"
"					  scop_uom,
"
"					  scop_prod_id,
"
"					  scop_prod_rev,
"
"					  scop_hsn_code,
"
"					  scop_oprn_ln_seq_no
"
"					 )
"
"	                           VALUES(p_bu,
"
"					  v_sc_ord_no,
"
"					  v_seq_no,
"
"					  v_proc_seq_no,
"
"					  1,
"
"					  r_proc.satln_sc_proc_id,
"
"					  r_proc.satln_sc_proc_cost,
"
"					  p_user,
"
"					  SYSDATE,
"
"					  r_proc.mfgo_uom,
"
"					  r_proc.mfgo_prod_id,
"
"					  r_proc.mfgo_prod_rev,
"
"					  v_proc_hsn_code,
"
"					  1
"
"					 );
"
"	END IF;
"
"
"
"        SELECT SUM(scop_lab_cost)
"
"	  INTO v_unit_cost
"
"	  FROM sub_contr_ord_process
"
"	 WHERE scop_bu = p_bu
"
"	   AND scop_ord_no = v_sc_ord_no
"
"	   AND scop_seq_no = v_seq_no;
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_sc_unit_cost = v_unit_cost
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = v_sc_ord_no
"
"	   AND pol_seq_no = v_seq_no;
"
"
"
"      END LOOP;
"
"
"
"      OPEN c_store(cr2.prodplnt_deflt_store_id);
"
"      FETCH c_store INTO r_store;
"
"      CLOSE c_store;
"
"
"
"      /*INSERT INTO pur_ord_ln_schedule(pols_bu,
"
"				      pols_order_pfx,
"
"				      pols_order_no,
"
"				      pols_seq_no,
"
"				      pols_sub_seq_no,
"
"				      pols_store_id,
"
"				      pols_store_name,
"
"				      pols_storage_store_id,
"
"				      pols_storage_store_name,
"
"				      pols_ordered_qty,
"
"				      pols_tolr_qty,
"
"				      pols_ord_stk_qty,
"
"				      pols_rcpt_stk_qty,
"
"				      pols_receipt_qty,
"
"				      pols_tot_receipt_qty,
"
"				      pols_rejected_qty,
"
"				      pols_required_date,
"
"				      pols_promise_date,
"
"				      pols_distribute_flag,
"
"				      pols_sc_suplr_flag,
"
"				      pols_plnt,
"
"				      pols_cre_by,
"
"				      pols_cre_date,
"
"				      pols_shipto_addr1,
"
"				      pols_shipto_addr2,
"
"				      pols_shipto_addr3,
"
"				      pols_shipto_po_box,
"
"				      pols_shipto_zip,
"
"				      pols_shipto_city,
"
"				      pols_shipto_state,
"
"				      pols_shipto_cntry,
"
"				      pols_shipto_tele,
"
"				      pols_shipto_fax,
"
"				      pols_shipto_email,
"
"				      pols_so_type,
"
"				      pols_so_pfx,
"
"				      pols_so_no,
"
"				      pols_so_seq_no,
"
"				      pols_so_sub_seq_no,
"
"				      pols_proj_id,
"
"				      pols_task_id,
"
"				      pols_so_schld_desc
"
"				     )
"
"			       VALUES(p_bu,
"
"				      cr1.ppl_sc_ord_pfx,
"
"				      v_sc_ord_no,
"
"				      v_seq_no,
"
"				      1,
"
"				      cr2.prodplnt_deflt_store_id,
"
"				      func_find_store_desc(p_bu,cr2.prodplnt_deflt_store_id,p_lang),
"
"				      cr2.prodplnt_deflt_store_id,
"
"				      func_find_store_desc(p_bu, cr2.prodplnt_deflt_store_id,p_lang),
"
"				      cr2.satln_fg_qty,
"
"				      0,
"
"				      cr2.satln_fg_qty,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      cr1.sathd_ord_date + 1,
"
"				      cr1.sathd_ord_date + 1,
"
"				      'Y' ,
"
"				      'N' ,
"
"				      p_plnt,
"
"				      p_user,
"
"				      SYSDATE,
"
"				      r_store.store_addr1,
"
"				      r_store.store_addr2,
"
"				      r_store.store_addr3,
"
"				      r_store.store_po_box,
"
"				      r_store.store_zip,
"
"				      r_store.store_city,
"
"				      r_store.store_state,
"
"				      r_store.store_country,
"
"				      r_store.store_tele1,
"
"				      r_store.store_fax1,
"
"				      r_store.store_email1,
"
"				      cr2.satln_so_type,
"
"				      cr2.satln_so_pfx,
"
"				      cr2.satln_so_no,
"
"				      cr2.satln_so_seq_no,
"
"				      cr2.satln_so_sub_seq_no,
"
"				      cr2.satln_proj_id,
"
"				      cr2.satln_task_id,
"
"				      cr2.satln_so_schld_desc
"
"				    );*/
"
"
"
"
"
"      UPDATE stock_adj_trans_ln
"
"         SET satln_os_ord_pfx = v_sc_ord_pfx,
"
"	     satln_os_ord_no = v_sc_ord_no,
"
"	     satln_os_ord_seq_no = v_seq_no,
"
"	     satln_os_ord_sub_seq_no = 1
"
"       WHERE satln_bu = p_bu
"
"         AND satln_ord_no = p_ord_no
"
"	 AND satln_fg_prod_id = cr2.satln_fg_prod_id
"
"	 AND satln_fg_prod_rev = cr2.satln_fg_prod_rev
"
"	 AND satln_fg_qty = cr2.satln_fg_qty;
"
"
"
"      v_sc_mc_seq_no := 0;
"
"
"
"      FOR r_mc IN (SELECT *
"
"                     FROM stock_adj_trans_hd,stock_adj_trans_ln
"
"		    WHERE sathd_bu = satln_bu
"
"		      AND sathd_ord_no = satln_ord_no
"
"		      AND satln_bu = p_bu
"
"                      AND satln_ord_no = p_ord_no
"
"	              AND satln_fg_prod_id = cr2.satln_fg_prod_id
"
"	              AND satln_fg_prod_rev = cr2.satln_fg_prod_rev
"
"	              AND satln_fg_qty = cr2.satln_fg_qty)
"
"      LOOP
"
"
"
"        v_sc_mc_seq_no := v_sc_mc_seq_no + 1;
"
"
"
"        INSERT INTO sub_contr_mat_req_ln(scmrl_bu,
"
"                                         scmrl_plnt,
"
"				         scmrl_order_no,
"
"				         scmrl_seq_no,
"
"				         scmrl_sub_seq_no,
"
"				         scmrl_mat_type,
"
"				         scmrl_store_id,
"
"				         scmrl_prod_id,
"
"				         scmrl_prod_rev,
"
"				         scmrl_prod_uom,
"
"				         scmrl_uom,
"
"				         scmrl_conv_factor,
"
"				         scmrl_prod_ord_no,
"
"				         scmrl_oprn_ln_seq_no,
"
"				         scmrl_process,
"
"				         scmrl_sf_code,
"
"				         scmrl_sys_ls_no,
"
"				         scmrl_lot_no,
"
"				         scmrl_serial_no,
"
"				         scmrl_rqrd_qty,
"
"				         scmrl_bom_qty,
"
"				         scmrl_scrap_qty,
"
"				         scmrl_rqrd_date,
"
"				         scmrl_mat_req,
"
"				         scmrl_cre_by,
"
"				         scmrl_cre_date
"
"				        )
"
"	                          VALUES(p_bu,
"
"				         p_plnt,
"
"				         v_sc_ord_no,
"
"				         v_seq_no,
"
"				         v_sc_mc_seq_no,
"
"				         'S',
"
"				         r_mc.sathd_store_id,
"
"				         r_mc.satln_prod_id,
"
"				         r_mc.satln_prod_rev,
"
"				         r_mc.satln_prod_uom,
"
"				         r_mc.satln_prod_uom,
"
"				         1,
"
"				         NULL,
"
"				         1,
"
"				         r_mc.satln_sc_proc_id,
"
"				         NULL,
"
"				         NULL,
"
"				         NULL,
"
"				         NULL,
"
"				         ROUND(r_mc.satln_trans_qty,3),
"
"				         ROUND(r_mc.satln_trans_qty,3),
"
"				         0,
"
"				         cr1.sathd_ord_date + 1,
"
"				         'N',
"
"				         p_user,
"
"				         SYSDATE
"
"				        );
"
"      END LOOP;
"
"    END LOOP;
"
"
"
"    --proc_gen_sub_contr_mat_req(p_bu,p_plnt,cr1.ppl_sc_ord_pfx,v_sc_ord_no,p_user);
"
"    --proc_upd_po_cost(p_bu,cr1.ppl_sc_ord_pfx,v_sc_ord_no,p_user);
"
"
"
"    UPDATE pur_order_hd
"
"       SET poh_status = 'A',
"
"           poh_upd_cost_flag = 'Y'
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_pfx = v_sc_ord_pfx
"
"       AND poh_order_no = v_sc_ord_no;
"
"
"
"    UPDATE pur_order_ln
"
"       SET pol_status = 'A'
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_no = v_sc_ord_no;
"
"
"
"  END LOOP;
"
"
"
"  p_sc_ord_no := v_sc_ord_no;
"
"
"
"END proc_cre_sco_frm_sa;
"
"
"
"PROCEDURE proc_cre_sco_frm_sa_sf_mat
"
"(p_bu			VARCHAR2,
"
" p_plnt			VARCHAR2,
"
" p_ord_no 		VARCHAR2,
"
" p_user   		VARCHAR2,
"
" p_lang			NUMBER,
"
" p_sc_ord_no	OUT	VARCHAR2
"
")
"
"AS
"
"CURSOR c1 IS
"
"SELECT DISTINCT sathd_plnt_loc_id,sathd_plnt_loc_name,sathd_ord_date,store_inv_id,prodplnt_buyer_id,sathd_plnt
"
"  FROM stock_adj_trans_hd,stock_adj_trans_ln,stores,stock_adjust_prefixes,prod_plants
"
" WHERE sathd_bu = satln_bu
"
"   AND sathd_ord_no = satln_ord_no
"
"   AND store_bu = sathd_bu
"
"   AND store_id = sathd_store_id
"
"   AND sap_bu = satln_bu
"
"   AND sap_prefix = satln_adj_prefix
"
"   AND prodplnt_bu = satln_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = satln_prod_id
"
"   AND prodplnt_prod_rev = satln_prod_rev
"
"   AND sathd_bu = p_bu
"
"   AND sathd_ord_no = p_ord_no
"
"   AND satln_ord_type = 'SCOP'
"
"   AND satln_sc_rqrd_flag = 'Y'
"
"   AND sap_oper IN ('I','O')
"
"   AND satln_status <> 'C'
"
"   AND satln_mat_type = 'F'
"
"   AND (satln_os_ord_pfx IS NULL AND satln_os_ord_no IS NULL AND satln_os_ord_seq_no IS NULL AND satln_os_ord_sub_seq_no IS NULL);
"
"
"
"CURSOR c2(c_plnt_loc_id	VARCHAR2,
"
"          c_suplr_id	VARCHAR2,
"
"	  c_buyer_id	VARCHAR2) IS
"
"SELECT satln_seq_no,satln_prod_id,satln_prod_rev,satln_trans_qty,satln_bom_no,satln_bom_name,prod_desc11,prodplnt_cls,
"
"       prodplnt_sub_cls,prod_uom,prodplnt_pur_price_basis,prod_stocked,prod_abc_cls,prod_fv_cls,prod_hsn_code,
"
"       prodplnt_deflt_store_id,satln_po_ord_no,satln_sf_code,satln_process_id,satln_oprn_ln_seq_no,
"
"       satb_sys_ls_no,satb_lot_no,satb_ser_no,satb_trans_qty,satln_eng_bom_flag,
"
"       satln_so_type,satln_so_pfx,satln_so_no,satln_so_seq_no,satln_so_sub_seq_no,satln_proj_id,satln_task_id,satln_so_schld_desc
"
"  FROM stock_adj_trans_hd,stock_adj_trans_ln,stock_adj_trans_bin,
"
"       stores,stock_adjust_prefixes,products,prod_plants,prod_plants_loc
"
" WHERE sathd_bu = satln_bu
"
"   AND sathd_ord_no = satln_ord_no
"
"   AND satb_bu(+) = satln_bu
"
"   AND satb_ord_no(+) = satln_ord_no
"
"   AND satb_seq_no(+) = satln_seq_no
"
"   AND store_bu = sathd_bu
"
"   AND store_id = sathd_store_id
"
"   AND sap_bu = satln_bu
"
"   AND sap_prefix = satln_adj_prefix
"
"   AND prod_bu = satln_bu
"
"   AND prod_id = satln_prod_id
"
"   AND prod_rev = satln_prod_rev
"
"   AND prodplnt_bu = satln_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = satln_prod_id
"
"   AND prodplnt_prod_rev = satln_prod_rev
"
"   AND ppl_bu(+) = prodplnt_bu
"
"   AND ppl_plnt(+) = prodplnt_plnt
"
"   AND ppl_prod_id(+) = prodplnt_prod_id
"
"   AND ppl_prod_rev(+) = prodplnt_prod_rev
"
"   AND ppl_plnt_loc_id(+) = sathd_plnt_loc_id
"
"   AND sathd_bu = p_bu
"
"   AND sathd_ord_no = p_ord_no
"
"   AND store_physical = 'V'
"
"   AND sap_oper IN ('I','O')
"
"   AND satln_status <> 'C'
"
"   AND sathd_plnt_loc_id = c_plnt_loc_id
"
"   AND store_inv_id = c_suplr_id
"
"   AND prodplnt_buyer_id = c_buyer_id
"
"   AND satln_ord_type = 'SCOP'
"
"   AND satln_sc_rqrd_flag = 'Y'
"
"   AND satln_mat_type = 'F'
"
"   AND (satln_os_ord_pfx IS NULL AND satln_os_ord_no IS NULL AND satln_os_ord_seq_no IS NULL AND satln_os_ord_sub_seq_no IS NULL)
"
" ORDER BY satln_seq_no;
"
"
"
"CURSOR c_suplr(c_suplr_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM suppliers
"
" WHERE suplr_bu = p_bu
"
"   AND suplr_suplr_id = c_suplr_id;
"
"
"
"CURSOR c_loc(c_suplr_id		VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('S','D','H','P');
"
"
"
"CURSOR c_bill_loc(c_suplr_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('B','D','I','P');
"
"
"
"CURSOR c_store(c_store_id	VARCHAR2) IS
"
"SELECT *
"
"  FROM stores
"
" WHERE store_bu = p_bu
"
"   AND store_id = c_store_id;
"
"
"
"CURSOR c_oprn(c_bom_no		VARCHAR2,
"
"	      c_oprn_seq	NUMBER,
"
"	      c_eng_bom		VARCHAR2) IS
"
"SELECT rno,rouln_oprn_id,rouln_oprn_ln_seq
"
"  FROM (SELECT ROWNUM rno,rouln_oprn_id,rouln_oprn_ln_seq
"
"          FROM (SELECT rouln_oprn_no,rouln_oprn_id,rouln_oprn_ln_seq
"
"                  FROM routing_ln
"
"                 WHERE rouln_bu = p_bu
"
"                   AND rouln_plnt = p_plnt
"
"                   AND rouln_bom_no = c_bom_no
"
"		   AND c_eng_bom = 'N'
"
"                 ORDER BY rouln_oprn_no))
"
" WHERE rno = c_oprn_seq;
"
"
"
"CURSOR c_unit(c_plnt	VARCHAR2) IS
"
"SELECT *
"
"  FROM bus_unit_plants
"
" WHERE bup_bu = p_bu
"
"   AND bup_plant_id = c_plnt;
"
"
"
"CURSOR c_ul(c_plnt        VARCHAR2,
"
"            c_plnt_loc_id VARCHAR2) IS
"
"SELECT *
"
"  FROM bus_unit_plants_loc_dtls
"
" WHERE bupld_bu = p_bu
"
"   AND bupld_plnt = c_plnt
"
"   AND bupld_loc_id  = c_plnt_loc_id;
"
"
"
"  cr1		c1%ROWTYPE;
"
"  r_oprn	c_oprn%ROWTYPE;
"
"
"
"  v_trans_qty	NUMBER;
"
"
"
"  r_suplr		c_suplr%ROWTYPE;
"
"  r_store		c_store%ROWTYPE;
"
"
"
"  r_loc			c_loc%ROWTYPE;
"
"  r_bill_loc		c_bill_loc%ROWTYPE;
"
"
"
"  v_sc_ord_no		VARCHAR2(15);
"
"  v_seq_no		NUMBER;
"
"  v_proc_seq_no		NUMBER;
"
"
"
"  v_req_id		VARCHAR2(10);
"
"  v_req_name		VARCHAR2(100);
"
"  v_pos_id		VARCHAR2(10);
"
"  v_pos_name		VARCHAR2(100);
"
"  v_dept_id		VARCHAR2(10);
"
"  v_dept_name		VARCHAR2(100);
"
"
"
"  v_gst_exempt_flag 	products.prod_gst_exempt_flag%TYPE;
"
"  v_gst_input_type      products.prod_gst_types_of_supply%TYPE;
"
"
"
"  v_proc_hsn_code	products.prod_hsn_code%TYPE;
"
"  v_bu_state		states.state_id%TYPE;
"
"  v_tcf_id		hsn_sac_tax_rates.hstr_tcf_loc_id%TYPE;
"
"  v_unit_cost		pur_order_ln.pol_sc_unit_cost%TYPE;
"
"  v_rqst_no		VARCHAR2(100);
"
"
"
"  v_next_oprn_no	NUMBER;
"
"  v_sc_ord_pfx		VARCHAR2(30);
"
"  r_unit		c_unit%ROWTYPE;
"
"  r_ul			c_ul%ROWTYPE;
"
"
"
"BEGIN
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"
"
"
"
"    IF cr1.prodplnt_buyer_id IS NULL THEN
"
"      Raise_Application_Error(-20103,'APM ');
"
"    END IF;
"
"
"
"    v_sc_ord_pfx := func_find_vou_dflt_pfx(p_bu,cr1.sathd_plnt,cr1.sathd_plnt_loc_id,'SCO','SCOP');
"
"    v_sc_ord_no := func_find_pfx_nextno(p_bu,cr1.sathd_ord_date,v_sc_ord_pfx,p_user);
"
"
"
"    OPEN c_suplr(cr1.store_inv_id);
"
"    FETCH c_suplr INTO r_suplr;
"
"    CLOSE c_suplr;
"
"
"
"    proc_get_emp_det(p_bu,
"
"                     p_user,
"
"                     v_req_id,
"
"                     v_req_name,
"
"                     v_pos_id,
"
"                     v_pos_name,
"
"                     v_dept_id,
"
"                     v_dept_name,
"
"                     p_lang
"
"                    );
"
"
"
"    OPEN c_loc(cr1.store_inv_id);
"
"    FETCH c_loc INTO r_loc;
"
"      IF c_loc%NOTFOUND THEN
"
"        Raise_Application_Error(-20629,'MNT '||cr1.store_inv_id);
"
"      END IF;
"
"    CLOSE c_loc;
"
"
"
"    OPEN c_bill_loc(cr1.store_inv_id);
"
"    FETCH c_bill_loc INTO r_bill_loc;
"
"      IF c_bill_loc%NOTFOUND THEN
"
"        Raise_Application_Error(-20629,'MNT '||cr1.store_inv_id);
"
"      END IF;
"
"    CLOSE c_bill_loc;
"
"
"
"    OPEN c_ul(cr1.sathd_plnt,cr1.sathd_plnt_loc_id);
"
"      FETCH c_ul INTO r_ul;
"
"        IF c_ul%NOTFOUND THEN
"
"          Raise_Application_Error(-20188, 'APM ');
"
"        END IF;
"
"      CLOSE c_ul;
"
"
"
"    OPEN c_unit(cr1.sathd_plnt);
"
"    FETCH c_unit INTO r_unit;
"
"      IF c_unit%NOTFOUND THEN
"
"        Raise_Application_Error(-20483,'ADM ');
"
"      END IF;
"
"    CLOSE c_unit;
"
"
"
"    INSERT INTO pur_order_hd(poh_bu,
"
"                             poh_mode,
"
"                             poh_type,
"
"                             poh_order_pfx,
"
"                             poh_order_no,
"
"                             poh_suplr_id,
"
"                             poh_suplr_name,
"
"                             poh_order_date,
"
"                             poh_order_year,
"
"                             poh_order_period,
"
"                             poh_currency,
"
"                             poh_exchange_rate,
"
"                             poh_status,
"
"                             poh_shipvia_id,
"
"                             poh_term_id,
"
"                             poh_fob_id,
"
"                             poh_buyer_id,
"
"                             poh_origin,
"
"                             poh_adv_payable,
"
"                             poh_adv_paid,
"
"                             poh_part_ship_flag,
"
"                             poh_reqstr_id,
"
"                             poh_reqstr_name,
"
"                             poh_reqstr_pos_id,
"
"                             poh_reqstr_pos_name,
"
"                             poh_rqst_dept_id,
"
"                             poh_cre_by,
"
"                             poh_cre_date,
"
"                             poh_plant,
"
"                             poh_terr_id,
"
"                             poh_shipfr_loc_name,
"
"                             poh_billfr_loc_name,
"
"			     poh_ref,
"
"			     poh_plnt_loc_id,
"
"			     poh_plnt_loc_name,
"
"			     poh_billto_loc_name,
"
"			     poh_shipto_loc_name,
"
"			     poh_cc_code
"
"			    )
"
"                      VALUES(p_bu,
"
"                             'SC',
"
"                             'SCOP',
"
"                             v_sc_ord_pfx,
"
"                             v_sc_ord_no,
"
"                             cr1.store_inv_id,
"
"                             r_suplr.suplr_name1,
"
"                             cr1.sathd_ord_date,
"
"                             func_find_year(p_bu,cr1.sathd_ord_date),
"
"                             func_find_period(p_bu,cr1.sathd_ord_date),
"
"                             r_suplr.suplr_currency,
"
"                             func_find_exchange_rate(p_bu,r_suplr.suplr_currency,NULL,cr1.sathd_ord_date,'PO'),
"
"                             'E',
"
"                             r_suplr.suplr_shipvia_id,
"
"                             r_suplr.suplr_term_id,
"
"                             r_suplr.suplr_fob_id,
"
"                             cr1.prodplnt_buyer_id,
"
"                             'A',
"
"                             0,
"
"                             0,
"
"                             'Y',
"
"                             v_req_id,
"
"                             v_req_name,
"
"                             v_pos_id,
"
"                             v_pos_name,
"
"                             v_dept_id,
"
"                             p_user,
"
"                             SYSDATE,
"
"                             p_plnt,
"
"                             r_suplr.suplr_terr_id,
"
"                             r_loc.ssl_loc_name1,
"
"                             r_bill_loc.ssl_loc_name1,
"
"			     'Stock Adjustment '||p_ord_no,
"
"			     cr1.sathd_plnt_loc_id,
"
"			     cr1.sathd_plnt_loc_name,
"
"			     r_unit.bup_name1,
"
"			     r_ul.bupld_loc_name,
"
"			     func_find_pur_cpc_bu(p_bu,p_plnt,p_user)
"
"			    );
"
"
"
"    INSERT INTO pur_order_addr(poa_bu,
"
"                               poa_order_no,
"
"                               poa_orderby_addr1,
"
"                               poa_orderby_addr2,
"
"                               poa_orderby_addr3,
"
"                               poa_orderby_postal_code,
"
"                               poa_orderby_city,
"
"                               poa_orderby_state,
"
"                               poa_orderby_cntry,
"
"                               poa_orderby_tele1,
"
"                               poa_orderby_fax1,
"
"                               poa_orderby_email1,
"
"                               poa_cre_by,
"
"                               poa_cre_date,
"
"                               poa_billfr_addr1,
"
"                               poa_billfr_addr2,
"
"                               poa_billfr_addr3,
"
"                               poa_billfr_postal_code,
"
"                               poa_billfr_city,
"
"                               poa_billfr_state,
"
"                               poa_billfr_cntry,
"
"                               poa_billfr_tele1,
"
"                               poa_billfr_fax1,
"
"                               poa_billfr_email1
"
"			      )
"
"                        VALUES(p_bu,
"
"                               v_sc_ord_no,
"
"                               r_suplr.suplr_addr1,
"
"                               r_suplr.suplr_addr2,
"
"                               r_suplr.suplr_addr3,
"
"                               r_suplr.suplr_po_box,
"
"                               r_suplr.suplr_city,
"
"                               r_suplr.suplr_state,
"
"                               r_suplr.suplr_country,
"
"                               r_suplr.suplr_tele1,
"
"                               r_suplr.suplr_fax1,
"
"                               r_suplr.suplr_email1,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               r_suplr.suplr_addr1,
"
"                               r_suplr.suplr_addr2,
"
"                               r_suplr.suplr_addr3,
"
"                               r_suplr.suplr_po_box,
"
"                               r_suplr.suplr_city,
"
"                               r_suplr.suplr_state,
"
"                               r_suplr.suplr_country,
"
"                               r_suplr.suplr_tele1,
"
"                               r_suplr.suplr_fax1,
"
"                               r_suplr.suplr_email1
"
"			      );
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR cr2 IN c2(cr1.sathd_plnt_loc_id,cr1.store_inv_id,cr1.prodplnt_buyer_id)
"
"    LOOP
"
"
"
"      IF cr2.satb_trans_qty > 0 OR cr2.satb_trans_qty IS NOT NULL THEN
"
"        v_trans_qty := cr2.satb_trans_qty;
"
"      ELSE
"
"        v_trans_qty := cr2.satln_trans_qty;
"
"      END IF;
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      BEGIN
"
"        SELECT prod_gst_exempt_flag,prod_gst_types_of_supply
"
"          INTO v_gst_exempt_flag,v_gst_input_type
"
"          FROM products
"
"         WHERE prod_bu = p_bu
"
"           AND prod_id = cr2.satln_prod_id
"
"           AND prod_rev = cr2.satln_prod_rev;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_gst_exempt_flag := 'G';
"
"        v_gst_input_type := 'I';
"
"      END;
"
"
"
"
"
"      IF cr2.prod_hsn_code IS NULL THEN
"
"        Raise_Application_Error(-20015,'TAX '||cr2.satln_prod_id||'/'||cr2.satln_prod_rev);
"
"      END IF;
"
"
"
"      IF cr2.satln_trans_qty <= 0 THEN
"
"        Raise_Application_Error(-20045,'ICM '||'FG Quantity'||'/'||cr2.satln_prod_id||'/'||cr2.satln_prod_rev);
"
"      END IF;
"
"
"
"      SELECT bup_state
"
"        INTO v_bu_state
"
"        FROM bus_unit_plants
"
"       WHERE bup_bu = p_bu
"
"         AND bup_plant_id = p_plnt;
"
"
"
"      IF r_suplr.suplr_state = v_bu_state THEN
"
"
"
"        BEGIN
"
"          SELECT hstr_tcf_loc_id
"
"            INTO v_tcf_id
"
"            FROM hsn_sac_tax_rates
"
"           WHERE hstr_bu = p_bu
"
"             AND hstr_hsnsac_code = cr2.prod_hsn_code
"
"	     AND ROWNUM = 1;
"
"	EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN
"
"           v_tcf_id := NULL;
"
"        END;
"
"
"
"      ELSE
"
"
"
"        BEGIN
"
"          SELECT hstr_tcf_imp_id
"
"            INTO v_tcf_id
"
"            FROM hsn_sac_tax_rates
"
"           WHERE hstr_bu = p_bu
"
"             AND hstr_hsnsac_code = cr2.prod_hsn_code
"
"	     AND ROWNUM = 1;
"
"
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN
"
"            v_tcf_id := NULL;
"
"        END;
"
"
"
"      END IF;
"
"
"
"
"
"      INSERT INTO pur_order_ln(pol_bu,
"
"                               pol_order_no,
"
"                               pol_seq_no,
"
"                               pol_print_seq_no,
"
"                               pol_prod_id,
"
"                               pol_prod_rev,
"
"                               pol_prod_desc1,
"
"                               pol_prod_cls,
"
"                               pol_prod_cls_desc,
"
"                               pol_prod_sub_cls,
"
"                               pol_prod_sub_cls_desc,
"
"                               pol_uom,
"
"                               pol_prod_uom,
"
"                               pol_conv_factor,
"
"                               pol_cost_basis,
"
"                               pol_contr_pfx,
"
"                               pol_contract_id,
"
"                               pol_sc_unit_cost,
"
"                               pol_disc_pct,
"
"			       pol_disc_amt,
"
"                               pol_scon_mat_unit_cost,
"
"                               pol_qc_required,
"
"                               pol_stocked,
"
"                               pol_ordered_qty,
"
"                               pol_tolr_qty,
"
"                               pol_received_qty,
"
"                               pol_tot_received_qty,
"
"                               pol_rejected_qty,
"
"                               pol_deflt_schld_flag,
"
"                               pol_net_disc_flag,
"
"                               pol_origin,
"
"                               pol_proj_flag,
"
"                               pol_status,
"
"                               pol_cre_by,
"
"                               pol_cre_date,
"
"                               pol_prod_ord_no,
"
"                               pol_sf_code,
"
"                               pol_bom_avail_flag,
"
"                               pol_targ_sf_code  ,
"
"                               pol_scr_pct,
"
"                               pol_mat_req_trans_no,
"
"                               pol_drawing_no,
"
"                               pol_Drawing_rev,
"
"                               pol_hsn_code,
"
"			       pol_gst_exempt_flag,
"
"			       pol_gst_input_type,
"
"			       pol_bom_no,
"
"			       pol_bom_name
"
"                              )
"
"                        VALUES(p_bu,
"
"                               v_sc_ord_no,
"
"                               v_seq_no,
"
"                               v_seq_no,
"
"                               cr2.satln_prod_id,
"
"                               cr2.satln_prod_rev,
"
"                               cr2.prod_desc11,
"
"                               cr2.prodplnt_cls,
"
"                               (SELECT class_desc1 FROM classes WHERE class_bu = p_bu AND class_id = cr2.prodplnt_cls),
"
"                               cr2.prodplnt_sub_cls,
"
"                               (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = p_bu AND subcls_id = cr2.prodplnt_sub_cls),
"
"                               cr2.prod_uom,
"
"                               cr2.prod_uom,
"
"                               1,
"
"                               cr2.prodplnt_pur_price_basis,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               0,
"
"			       0,
"
"                               0,
"
"                               'N',
"
"                               cr2.prod_stocked,
"
"                               v_trans_qty,
"
"                               v_trans_qty,
"
"                               0,
"
"                               0,
"
"                               0,
"
"                               'Y',
"
"                               'Y',
"
"                               'A',
"
"                               'N',
"
"                               'E',
"
"                               p_user,
"
"                               SYSDATE,
"
"                               cr2.satln_po_ord_no,
"
"                               cr2.satln_sf_code,
"
"                               'Y',
"
"                               cr2.satln_sf_code,
"
"                               0,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.prod_hsn_code,
"
"			       v_gst_exempt_flag,
"
"			       v_gst_input_type,
"
"			       cr2.satln_bom_no,
"
"			       cr2.satln_bom_name
"
"                              );
"
"
"
"      v_proc_seq_no := 0;
"
"
"
"      /*FOR r_proc IN (SELECT DISTINCT sasp_oprn_seq_no,sasp_process,sasp_oprn_ln_seq_no,
"
"                            mfgo_uom,mfgo_prod_id,mfgo_prod_rev,sasp_proc_cost
"
"                       FROM stock_adj_sc_process,mfg_oprns
"
"		      WHERE mfgo_bu = sasp_bu
"
"                        AND mfgo_oprn_id = sasp_process
"
"			AND sasp_bu = p_bu
"
"		        AND sasp_ord_no = p_ord_no
"
"			AND sasp_seq_no = cr2.satln_seq_no)
"
"      LOOP
"
"
"
"	IF r_proc.mfgo_prod_id IS NULL THEN
"
"	  Raise_Application_Error(-20061,'PLN '||r_proc.sasp_process);
"
"	END IF;
"
"
"
"	BEGIN
"
"	  SELECT prod_hsn_code
"
"	    INTO v_proc_hsn_code
"
"	    FROM products
"
"	   WHERE prod_bu = p_bu
"
"	     AND prod_id = r_proc.mfgo_prod_id
"
"	     AND prod_rev = r_proc.mfgo_prod_rev;
"
"	EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN
"
"	    Raise_Application_Error(-20260,'ICM '||r_proc.mfgo_prod_id);
"
"	END;
"
"
"
"	IF v_proc_hsn_code IS NULL THEN
"
"	  Raise_Application_Error(-20029,'TAX '||r_proc.mfgo_prod_id);
"
"	END IF;
"
"
"
"	UPDATE sub_contr_ord_process
"
"	   SET scop_lab_cost = r_proc.sasp_proc_cost
"
"	 WHERE scop_bu = p_bu
"
"	   AND scop_ord_no = v_sc_ord_no
"
"	   AND scop_seq_no = v_seq_no
"
"	   AND scop_process = r_proc.sasp_process
"
"	   AND scop_oprn_ln_seq_no = r_proc.sasp_oprn_ln_seq_no;
"
"
"
"	IF SQL%NOTFOUND THEN
"
"
"
"        v_proc_seq_no := v_proc_seq_no + 1;
"
"
"
"	INSERT INTO sub_contr_ord_process(scop_bu,
"
"					  scop_ord_no,
"
"					  scop_seq_no,
"
"					  scop_sub_seq_no,
"
"					  scop_oprn_seq_no,
"
"					  scop_oprn_ln_seq_no,
"
"					  scop_process,
"
"					  scop_lab_cost,
"
"					  scop_cre_by,
"
"					  scop_cre_date,
"
"					  scop_uom,
"
"					  scop_prod_id,
"
"					  scop_prod_rev,
"
"					  scop_hsn_code
"
"					 )
"
"	                           VALUES(p_bu,
"
"					  v_sc_ord_no,
"
"					  v_seq_no,
"
"					  v_proc_seq_no,
"
"					  r_proc.sasp_oprn_seq_no,
"
"					  r_proc.sasp_oprn_ln_seq_no,
"
"					  r_proc.sasp_process,
"
"					  r_proc.sasp_proc_cost,
"
"					  p_user,
"
"					  SYSDATE,
"
"					  r_proc.mfgo_uom,
"
"					  r_proc.mfgo_prod_id,
"
"					  r_proc.mfgo_prod_rev,
"
"					  v_proc_hsn_code
"
"					 );
"
"	END IF;
"
"
"
"        SELECT SUM(scop_lab_cost)
"
"	  INTO v_unit_cost
"
"	  FROM sub_contr_ord_process
"
"	 WHERE scop_bu = p_bu
"
"	   AND scop_ord_no = v_sc_ord_no
"
"	   AND scop_seq_no = v_seq_no;
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_sc_unit_cost = v_unit_cost
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = v_sc_ord_no
"
"	   AND pol_seq_no = v_seq_no;
"
"
"
"      END LOOP;*/
"
"
"
"      OPEN c_store(cr2.prodplnt_deflt_store_id);
"
"      FETCH c_store INTO r_store;
"
"      CLOSE c_store;
"
"
"
"      /*INSERT INTO pur_ord_ln_schedule(pols_bu,
"
"				      pols_order_pfx,
"
"				      pols_order_no,
"
"				      pols_seq_no,
"
"				      pols_sub_seq_no,
"
"				      pols_store_id,
"
"				      pols_store_name,
"
"				      pols_storage_store_id,
"
"				      pols_storage_store_name,
"
"				      pols_ordered_qty,
"
"				      pols_tolr_qty,
"
"				      pols_ord_stk_qty,
"
"				      pols_rcpt_stk_qty,
"
"				      pols_receipt_qty,
"
"				      pols_tot_receipt_qty,
"
"				      pols_rejected_qty,
"
"				      pols_required_date,
"
"				      pols_promise_date,
"
"				      pols_distribute_flag,
"
"				      pols_sc_suplr_flag,
"
"				      pols_plnt,
"
"				      pols_cre_by,
"
"				      pols_cre_date,
"
"				      pols_shipto_addr1,
"
"				      pols_shipto_addr2,
"
"				      pols_shipto_addr3,
"
"				      pols_shipto_po_box,
"
"				      pols_shipto_zip,
"
"				      pols_shipto_city,
"
"				      pols_shipto_state,
"
"				      pols_shipto_cntry,
"
"				      pols_shipto_tele,
"
"				      pols_shipto_fax,
"
"				      pols_shipto_email,
"
"			              pols_sys_ls_no,
"
"			              pols_lot_no,
"
"			              pols_ser_no,
"
"				      pols_so_type,
"
"				      pols_so_pfx,
"
"				      pols_so_no,
"
"				      pols_so_seq_no,
"
"				      pols_so_sub_seq_no,
"
"				      pols_proj_id,
"
"				      pols_task_id,
"
"				      pols_so_schld_desc
"
"				     )
"
"			       VALUES(p_bu,
"
"				      cr1.ppl_sc_ord_pfx,
"
"				      v_sc_ord_no,
"
"				      v_seq_no,
"
"				      1,
"
"				      cr2.prodplnt_deflt_store_id,
"
"				      func_find_store_desc(p_bu,cr2.prodplnt_deflt_store_id,p_lang),
"
"				      cr2.prodplnt_deflt_store_id,
"
"				      func_find_store_desc(p_bu, cr2.prodplnt_deflt_store_id,p_lang),
"
"				      v_trans_qty,
"
"				      0,
"
"				      v_trans_qty,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      cr1.sathd_ord_date + 1,
"
"				      cr1.sathd_ord_date + 1,
"
"				      'Y' ,
"
"				      'N' ,
"
"				      p_plnt,
"
"				      p_user,
"
"				      SYSDATE,
"
"				      r_store.store_addr1,
"
"				      r_store.store_addr2,
"
"				      r_store.store_addr3,
"
"				      r_store.store_po_box,
"
"				      r_store.store_zip,
"
"				      r_store.store_city,
"
"				      r_store.store_state,
"
"				      r_store.store_country,
"
"				      r_store.store_tele1,
"
"				      r_store.store_fax1,
"
"				      r_store.store_email1,
"
"			              cr2.satb_sys_ls_no,
"
"			              cr2.satb_lot_no,
"
"			              cr2.satb_ser_no,
"
"				      cr2.satln_so_type,
"
"				      cr2.satln_so_pfx,
"
"				      cr2.satln_so_no,
"
"				      cr2.satln_so_seq_no,
"
"				      cr2.satln_so_sub_seq_no,
"
"				      cr2.satln_proj_id,
"
"				      cr2.satln_task_id,
"
"				      cr2.satln_so_schld_desc
"
"				    );*/
"
"
"
"      IF cr2.satln_po_ord_no IS NOT NULL THEN
"
"
"
"	v_next_oprn_no := INSTR(cr2.satln_sf_code,'0');
"
"
"
"	OPEN c_oprn(cr2.satln_bom_no,v_next_oprn_no,cr2.satln_eng_bom_flag);
"
"	FETCH c_oprn INTO r_oprn;
"
"	CLOSE c_oprn;
"
"
"
"        proc_upd_oprn_status_qtys(p_bu,
"
"                                  p_plnt,
"
"                                  cr2.satln_po_ord_no,
"
"                                  r_oprn.rouln_oprn_id,
"
"                                  r_oprn.rouln_oprn_ln_seq,
"
"                                  cr2.satln_sf_code,
"
"                                  -v_trans_qty,
"
"                                  0,
"
"                                  v_trans_qty,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  0,
"
"                                  cr2.satb_sys_ls_no,
"
"                                  cr2.satb_lot_no,
"
"                                  cr2.satb_ser_no,
"
"                                  NULL,
"
"                                  'PR',
"
"                                  p_user,
"
"                                  NULL
"
"                                 );
"
"      END IF;
"
"
"
"      UPDATE stock_adj_trans_ln
"
"         SET satln_os_ord_pfx = v_sc_ord_pfx,
"
"	     satln_os_ord_no = v_sc_ord_no,
"
"	     satln_os_ord_seq_no = v_seq_no,
"
"	     satln_os_ord_sub_seq_no = 1
"
"       WHERE satln_bu = p_bu
"
"         AND satln_ord_no = p_ord_no
"
"	 AND satln_seq_no = cr2.satln_seq_no;
"
"
"
"    END LOOP;
"
"
"
"   -- proc_gen_sub_contr_mat_req(p_bu,p_plnt,v_sc_ord_pfx,v_sc_ord_no,p_user);
"
"    --proc_upd_po_cost(p_bu,cr1.ppl_sc_ord_pfx,v_sc_ord_no,p_user);
"
"
"
"  /*  UPDATE pur_order_hd
"
"       SET poh_status = 'A',
"
"           poh_upd_cost_flag = 'Y'
"
"     WHERE poh_bu = p_bu
"
"       AND poh_order_pfx = v_sc_ord_pfx
"
"       AND poh_order_no = v_sc_ord_no;
"
"
"
"    UPDATE pur_order_ln
"
"       SET pol_status = 'A'
"
"     WHERE pol_bu = p_bu
"
"       AND pol_order_no = v_sc_ord_no;*/
"
"
"
"  END LOOP;
"
"
"
"  p_sc_ord_no := v_sc_ord_no;
"
"
"
"END;
"
"
"
"END pkg_subcontr;"
/
