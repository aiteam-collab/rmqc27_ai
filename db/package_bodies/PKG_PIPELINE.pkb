CREATE OR REPLACE
"PACKAGE BODY pkg_pipeline
"
"AS
"
"
"
"  PROCEDURE proc_cre_po_frm_pipeline(p_bu		VARCHAR2,
"
"                                     p_date		DATE,
"
"				     p_trf_plnt		VARCHAR2,
"
"				     p_user		VARCHAR2,
"
"				     p_lang		NUMBER,
"
"				     p_po_no	OUT	VARCHAR2
"
"				    )
"
"  AS
"
"  CURSOR c1(c_suplr_id	VARCHAR2) IS
"
"  SELECT store_plnt,
"
"         srp_store_id,
"
"	 store_desc1,
"
"         srp_prod_id,
"
"         srp_prod_rev,
"
"	 prod_desc11,
"
"         srp_pipeline_no,
"
"         srp_cur_proc_qty,
"
"	 /*CASE WHEN func_find_base_currency(srp_bu) <> func_find_party_curr(srp_bu,c_suplr_id,p_lang) THEN func_find_vou_dflt_pfx(srp_bu,store_plnt,store_plnt_loc_id,'PO','POG')
"
"              ELSE func_find_prod_po_pfx(srp_bu,store_plnt,NULL,srp_prod_id,srp_prod_rev,srp_re_ord_type)
"
"         END ord_pfx,*/
"
"	 func_find_vou_dflt_pfx(srp_bu,store_plnt,store_plnt_loc_id,'PO',CASE WHEN srp_re_ord_type IN('PO') THEN 'POG'
"
"	                                                                      WHEN srp_re_ord_type IN ('ST') THEN 'POT'END ) ord_pfx,
"
"         prodplnt_buyer_id,
"
"	 prodplnt_app_sup_pur_flag,
"
"	 prodplnt_cls,
"
"	 (SELECT class_desc1 FROM classes WHERE class_bu = prodplnt_bu AND class_id = prodplnt_cls) prodplnt_cls_desc,
"
"	 prodplnt_sub_cls,
"
"	 (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = prodplnt_bu AND subcls_id = prodplnt_cls) prodplnt_sub_cls_desc,
"
"	 prod_uom,
"
"	 prodplnt_crit_type,
"
"	 prodplnt_qc_oper,
"
"	 prodplnt_qc_next_date,
"
"	 prod_hsn_code,
"
"	 prodplnt_pur_price_basis,
"
"	 prodplnt_wvd_flag,
"
"	 prod_thickness,
"
"	 prod_length,
"
"	 prod_width,
"
"	 prod_fv_cls,
"
"	 prod_abc_cls,
"
"	 prod_stocked,
"
"	 prod_tolr_type,
"
" 	 store_addr1,
"
"	 store_addr2,
"
"	 store_addr3,
"
"	 store_zip,
"
"	 store_city,
"
"	 store_state,
"
"	 store_country,
"
"	 store_tele1,
"
"	 store_email1,
"
"	 store_plnt_loc_id,
"
"	 srp_re_ord_type
"
"    FROM stock_reorder_pipline,stores,prod_plants,products
"
"   WHERE store_bu = srp_bu
"
"     AND store_id = srp_store_id
"
"     AND prodplnt_bu = srp_bu
"
"     AND prodplnt_plnt = store_plnt
"
"     AND prodplnt_prod_id = srp_prod_id
"
"     AND prodplnt_prod_rev = srp_prod_rev
"
"     AND prod_bu = prodplnt_bu
"
"     AND prod_id = prodplnt_prod_id
"
"     AND prod_rev = prodplnt_prod_rev
"
"     AND srp_bu = p_bu
"
"     AND srp_re_ord_type = 'ST'
"
"     AND srp_sel_flag = 'Y'
"
"     AND srp_sel_user = p_user
"
"     AND (srp_reord_qty - srp_processed_qty) > 0
"
"   ORDER BY store_plnt,ord_pfx;
"
"
"
"  CURSOR c_suplr(c_suplr_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM suppliers
"
"   WHERE suplr_bu = p_bu
"
"     AND suplr_suplr_id = c_suplr_id;
"
"
"
"  CURSOR c_ssl(c_suplr_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = c_suplr_id
"
"     AND ssl_dflt_flg IN ('D','S');
"
"
"
"  CURSOR c_sbl(c_suplr_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = c_suplr_id
"
"     AND ssl_dflt_flg IN ('D','B');
"
"
"
"  CURSOR c_pl(c_plnt	VARCHAR2) IS
"
"  SELECT *
"
"    FROM bus_unit_plants_loc_dtls
"
"   WHERE bupld_bu = p_bu
"
"     AND bupld_plnt = c_plnt
"
"     AND bupld_dflt_loc_flag = 'Y';
"
"
"
"  CURSOR c_as(c_plnt		VARCHAR2,
"
"              c_suplr_id	VARCHAR2,
"
"	      c_prod_id		VARCHAR2,
"
"	      c_prod_rev	NUMBER) IS
"
"  SELECT *
"
"    FROM suplr_products
"
"   WHERE suprprod_bu = p_bu
"
"     AND suprprod_plnt = c_plnt
"
"     AND suprprod_suplr_id = c_suplr_id
"
"     AND suprprod_prod_id = c_prod_id
"
"     AND suprprod_prod_rev = c_prod_rev
"
"     AND suprprod_type = 'PR';
"
"
"
"  r_suplr		c_suplr%ROWTYPE;
"
"  r_ssl			c_ssl%ROWTYPE;
"
"  r_sbl			c_sbl%ROWTYPE;
"
"  r_pl			c_pl%ROWTYPE;
"
"  r_as			c_as%ROWTYPE;
"
"
"
"  v_year		NUMBER(6);
"
"  v_period		NUMBER(2);
"
"  v_suplr_id		suppliers.suplr_suplr_id%TYPE;
"
"  v_plnt_loc_id		bus_unit_plants_loc_dtls.bupld_loc_id%TYPE;
"
"
"
"  v_ord_no		VARCHAR2(30);
"
"  v_ord_no1		VARCHAR2(500);
"
"  v_ord_ln_no		NUMBER := 0;
"
"  v_ord_schld_no	NUMBER := 0;
"
"  v_ex_rate		NUMBER;
"
"
"
"  v_req_id           	VARCHAR2(10);
"
"  v_req_name         	VARCHAR2(100);
"
"  v_pos_id           	VARCHAR2(10);
"
"  v_pos_name         	VARCHAR2(50);
"
"  v_dept_id          	VARCHAR2(10);
"
"  v_dept_name        	VARCHAR2(50);
"
"
"
"  v_conv_factor		NUMBER;
"
"  v_qc_req_flag		VARCHAR2(1);
"
"  v_suplr_uom		VARCHAR2(5);
"
"  v_tax_set_id		VARCHAR2(10);
"
"  v_tcf_id		VARCHAR2(10);
"
"
"
"  v_sc_unit_cost 	NUMBER;
"
"  v_disc_pct		NUMBER;
"
"  v_contr_pfx		VARCHAR2(5);
"
"  v_contract_id		VARCHAR2(15);
"
"  v_contr_amd_no	NUMBER;
"
"  v_mill_suplr_name	VARCHAR2(50);
"
"  v_cc_code	        VARCHAR2(50);
"
"  v_chk_ord_pfx		VARCHAR2(5) := ' ';
"
"  v_chk_buyer_id	VARCHAR2(10) := ' ';
"
"  v_store_id		VARCHAR2(10);
"
"  v_store_name		VARCHAR2(100);
"
"
"
"  BEGIN
"
"
"
"    proc_find_year_period(p_bu,TRUNC(SYSDATE),v_year,v_period);
"
"
"
"    BEGIN
"
"      SELECT suplr_suplr_id
"
"        INTO v_suplr_id
"
"	FROM suppliers
"
"       WHERE suplr_transfer_bu = p_bu
"
"         AND suplr_transfer_plnt = p_trf_plnt
"
"		 AND suplr_mode_pur = 'Y'
"
"		 AND suplr_status = 'A';
"
"    EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20118,'APM ');
"
"    END;
"
"
"
"    OPEN c_suplr(v_suplr_id);
"
"    FETCH c_suplr INTO r_suplr;
"
"      IF c_suplr%NOTFOUND THEN
"
"        Raise_application_Error(-20118,'APM');
"
"      END IF;
"
"    CLOSE c_suplr;
"
"
"
"    OPEN c_ssl(v_suplr_id);
"
"    FETCH c_ssl INTO r_ssl;
"
"      IF c_ssl%NOTFOUND THEN
"
"        Raise_application_Error(-20629,'MNT');
"
"      END IF;
"
"    CLOSE c_ssl;
"
"
"
"    OPEN c_sbl(v_suplr_id);
"
"    FETCH c_sbl INTO r_sbl;
"
"      IF c_sbl%NOTFOUND THEN
"
"        Raise_application_Error(-20629,'MNT');
"
"      END IF;
"
"    CLOSE c_sbl;
"
"
"
"    proc_get_emp_det(p_bu,
"
"		     p_user,
"
"		     v_req_id,
"
"		     v_req_name,
"
"		     v_pos_id,
"
"		     v_pos_name,
"
"		     v_dept_id,
"
"		     v_dept_name,
"
"		     p_lang
"
"		    );
"
"
"
"    v_ex_rate := func_find_exchange_rate(p_bu,func_find_party_curr(p_bu,v_suplr_id,p_lang),NULL,TRUNC(SYSDATE),'PO');
"
"
"
"     -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'-'||v_suplr_id);
"
"
"
"    FOR cr1 IN c1(v_suplr_id)
"
"    LOOP
"
"
"
"      IF v_chk_ord_pfx <> cr1.ord_pfx OR
"
"         v_chk_buyer_id <> cr1.prodplnt_buyer_id THEN
"
"
"
"        OPEN c_pl(cr1.store_plnt);
"
"        FETCH c_pl INTO r_pl;
"
"          IF c_pl%NOTFOUND THEN
"
"            Raise_application_Error(20629,'MNT');
"
"          END IF;
"
"        CLOSE c_pl;
"
"
"
"        v_ord_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),cr1.ord_pfx,p_user);
"
"	v_ord_no1 := v_ord_no1||cr1.ord_pfx||v_ord_no||' ';
"
"
"
"	INSERT INTO pur_order_hd(poh_bu,
"
"			         poh_mode,
"
"			         poh_type,
"
"			         poh_order_pfx,
"
"			         poh_order_no,
"
"			         poh_suplr_id,
"
"			         poh_suplr_name,
"
"			         poh_order_date,
"
"			         poh_order_year,
"
"			         poh_order_period,
"
"			         poh_currency,
"
"			         poh_exchange_rate,
"
"			         poh_status,
"
"			         poh_shipvia_id,
"
"			         poh_term_id,
"
"			         poh_fob_id,
"
"			         poh_buyer_id,
"
"			         poh_origin,
"
"			         poh_adv_payable,
"
"			         poh_adv_paid,
"
"			         poh_part_ship_flag,
"
"			         poh_reqstr_id,
"
"			         poh_reqstr_name,
"
"			         poh_reqstr_pos_id,
"
"			         poh_reqstr_pos_name,
"
"			         poh_rqst_dept_id,
"
"			         poh_cre_by,
"
"			         poh_cre_date,
"
"			         poh_plant,
"
"			         poh_terr_id,
"
"			        -- poh_loc_id,
"
"			         poh_billfr_loc_name,
"
"			         poh_shipfr_loc_name,
"
"				 poh_plnt_loc_id,
"
"				 poh_plnt_loc_name,
"
"				 poh_billto_loc_name,
"
"                                 poh_shipto_loc_name
"
"                                )
"
"                          VALUES(p_bu,
"
"                                 'PO',
"
"                                 CASE WHEN cr1.srp_re_ord_type IN('PO') THEN 'POG'
"
"	                              WHEN cr1.srp_re_ord_type IN ('ST') THEN 'POT' END,
"
"                                 cr1.ord_pfx,
"
"                                 v_ord_no,
"
"                                 v_suplr_id,
"
"                                 r_suplr.suplr_name1,
"
"                                 TRUNC(SYSDATE),
"
"                                 v_year,
"
"                                 v_period,
"
"                                 r_suplr.suplr_currency,
"
"                                 v_ex_rate,
"
"                                 'E',
"
"		                 r_suplr.suplr_shipvia_id,
"
"                                 r_suplr.suplr_term_id,
"
"                                 r_suplr.suplr_fob_id,
"
"                                 cr1.prodplnt_buyer_id,
"
"                                 'R',
"
"                                  0,
"
"                                  0,
"
"                                 'Y',
"
"                                 v_req_id,
"
"                                 v_req_name,
"
"                                 v_pos_id,
"
"                                 v_pos_name,
"
"                                 v_dept_id,
"
"                                 p_user,
"
"                                 SYSDATE,
"
"                                 cr1.store_plnt,
"
"				 r_suplr.suplr_terr_id,
"
"                                 r_ssl.ssl_loc_name1,
"
"                                 r_sbl.ssl_loc_name1,
"
"				 cr1.store_plnt_loc_id,
"
"				 func_find_plnt_loc_desc(p_bu,cr1.store_plnt_loc_id),
"
"				 func_find_plnt_loc_desc(p_bu,cr1.store_plnt_loc_id),
"
"				 func_find_plnt_loc_desc(p_bu,cr1.store_plnt_loc_id)
"
"                                );
"
"
"
"        INSERT INTO pur_order_addr(poa_bu,
"
"				   poa_order_pfx,
"
"				   poa_order_no,
"
"				   poa_orderby_addr1,
"
"				   poa_orderby_addr2,
"
"				   poa_orderby_addr3,
"
"				   poa_orderby_postal_code,
"
"				   poa_orderby_city ,
"
"				   poa_orderby_state,
"
"				   poa_orderby_cntry,
"
"				   poa_orderby_tele1,
"
"				   poa_orderby_fax1,
"
"				   poa_orderby_email1,
"
"				   poa_orderby_zip_code,
"
"				   poa_cre_by,
"
"				   poa_cre_date,
"
"				   poa_upd_by,
"
"				   poa_upd_date,
"
"				   poa_billfr_addr1,
"
"				   poa_billfr_addr2,
"
"				   poa_billfr_addr3,
"
"				   poa_billfr_postal_code,
"
"				   poa_billfr_city,
"
"				   poa_billfr_state,
"
"				   poa_billfr_cntry,
"
"				   poa_billfr_tele1,
"
"				   poa_billfr_fax1,
"
"				   poa_billfr_email1,
"
"				   poa_billfr_mobno,
"
"				   poa_billfr_zip_code,
"
"				   poa_billto_addr1,
"
"				   poa_billto_addr2,
"
"				   poa_billto_addr3,
"
"				   poa_billto_postal_code,
"
"				   poa_billto_tele1,
"
"				   poa_billto_email1,
"
"				   poa_billto_zip_code,
"
"				   poa_billto_city,
"
"				   poa_billto_state,
"
"				   poa_billto_cntry
"
"				  )
"
"			    VALUES(p_bu,
"
"				   cr1.ord_pfx,
"
"				   v_ord_no,
"
"				   r_suplr.suplr_addr1,
"
"				   r_suplr.suplr_addr2,
"
"				   r_suplr.suplr_addr3,
"
"				   r_suplr.suplr_po_box,
"
"				   r_suplr.suplr_city,
"
"				   r_suplr.suplr_state,
"
"				   r_suplr.suplr_country,
"
"				   r_suplr.suplr_tele1,
"
"				   r_suplr.suplr_fax1,
"
"				   r_suplr.suplr_email1,
"
"				   r_suplr.suplr_zip,
"
"				   p_user,
"
"				   SYSDATE,
"
"				   NULL,
"
"				   NULL,
"
"				   r_sbl.ssl_addr1,
"
"				   r_sbl.ssl_addr2,
"
"				   r_sbl.ssl_addr3 ,
"
"				   r_sbl.ssl_po_box,
"
"				   r_sbl.ssl_city,
"
"				   r_sbl.ssl_state,
"
"				   r_sbl.ssl_country,
"
"				   r_sbl.ssl_tele,
"
"				   r_sbl.ssl_fax,
"
"				   r_sbl.ssl_email,
"
"				   r_sbl.ssl_mob_no,
"
"				   r_sbl.ssl_zip,
"
"				   r_pl.bupld_addr1,
"
"				   r_pl.bupld_addr2,
"
"				   r_pl.bupld_addr3,
"
"				   r_pl.bupld_po_box,
"
"				   r_pl.bupld_tele1,
"
"				   r_pl.bupld_email1,
"
"				   r_pl.bupld_zip,
"
"				   r_pl.bupld_city,
"
"				   r_pl.bupld_state,
"
"				   r_pl.bupld_country
"
"				  );
"
"      END IF;
"
"
"
"      OPEN c_as(cr1.store_plnt,v_suplr_id,cr1.srp_prod_id,cr1.srp_prod_rev);
"
"      FETCH c_as INTO r_as;
"
"        IF c_as%NOTFOUND AND cr1.prodplnt_app_sup_pur_flag = 'Y' THEN
"
"	  Raise_Application_Error(-20997,'SOM'||'/'||cr1.srp_prod_id||'/'||cr1.srp_prod_rev);
"
"	END IF;
"
"      CLOSE c_as;
"
"
"
"      IF cr1.prodplnt_app_sup_pur_flag = 'Y' THEN
"
"        v_suplr_uom := r_as.suprprod_uom;
"
"      ELSE
"
"        v_suplr_uom := cr1.prod_uom;
"
"      END IF;
"
"
"
"      v_conv_factor := func_find_uom_conversion(p_bu,cr1.srp_prod_id,cr1.srp_prod_rev,cr1.prod_uom,v_suplr_uom);
"
"
"
"      IF cr1.prodplnt_crit_type = 'CP' OR cr1.prodplnt_qc_oper = 'S' THEN
"
"        v_qc_req_flag := 'Y';
"
"      ELSIF cr1.prodplnt_crit_type = 'FR' THEN
"
"        IF TRUNC(SYSDATE) >= cr1.prodplnt_qc_next_date THEN
"
"          v_qc_req_flag := 'Y';
"
"        ELSE
"
"          v_qc_req_flag := 'N';
"
"        END IF;
"
"      ELSE
"
"        v_qc_req_flag := 'N';
"
"      END IF;
"
"
"
"    --  v_tax_set_id := func_find_dflt_tax_set(p_bu,cr1.store_plnt,'S',v_suplr_id,r_sbl.ssl_loc_id);
"
"     -- v_tcf_id := func_find_dflt_tax_cls_suplr(p_bu,cr1.store_plnt,v_suplr_id,cr1.srp_prod_id,cr1.srp_prod_rev,cr1.prod_hsn_code,r_ssl.ssl_loc_id,TRUNC(SYSDATE));
"
"
"
"      IF cr1.prodplnt_pur_price_basis = 'C' THEN
"
"
"
"        proc_find_batch_contr_price(p_bu,
"
"	                            cr1.store_plnt,
"
"	                            v_suplr_id,
"
"	                            r_suplr.suplr_currency,
"
"	                            cr1.srp_prod_id,
"
"	                            cr1.srp_prod_rev,
"
"	                            cr1.srp_cur_proc_qty,
"
"	                            TRUNC(SYSDATE),
"
"	                            'PR',
"
"	                            v_sc_unit_cost,
"
"	                            v_disc_pct,
"
"	                            v_contr_pfx,
"
"	                            v_contract_id,
"
"	                            v_contr_amd_no,
"
"	                            v_mill_suplr_name,
"
"	                            v_cc_code
"
"	                           );
"
"
"
"      ELSIF cr1.prodplnt_pur_price_basis = 'P' THEN
"
"
"
"        proc_find_price_frm_pricelist(p_bu,
"
"   				      cr1.store_plnt,
"
"   				      v_suplr_id,
"
"   				      r_suplr.suplr_currency,
"
"   				      cr1.srp_prod_id,
"
"   				      cr1.srp_prod_rev,
"
"	                              TRUNC(SYSDATE),
"
"	                              NULL,
"
"	                              v_sc_unit_cost,
"
"	                              v_disc_pct
"
"	                             );
"
"      ELSE
"
"
"
"        v_sc_unit_cost := func_find_unitcost(p_bu,cr1.srp_prod_id,cr1.srp_prod_rev,cr1.srp_store_id);
"
"        v_disc_pct := 0;
"
"        v_contr_amd_no := 0;
"
"
"
"      END IF;
"
"
"
"      v_ord_ln_no := v_ord_ln_no + 1;
"
"
"
"      v_store_id := func_find_deflt_storeid(p_bu,cr1.store_plnt,cr1.store_plnt_loc_id,cr1.srp_prod_id,cr1.srp_prod_rev,cr1.prod_stocked);
"
"      v_store_name := func_find_store_qry_desc(p_bu,v_store_id,1);
"
"
"
"      INSERT INTO pur_order_ln(pol_bu,
"
"	  	               pol_order_no,
"
"	  	               pol_seq_no,
"
"	  	               pol_print_seq_no,
"
"	  	               pol_prod_id,
"
"	  	               pol_prod_rev,
"
"	  	               pol_prod_desc1,
"
"	  	               pol_prod_cls,
"
"	  	               pol_prod_cls_desc,
"
"	  	               pol_prod_sub_cls,
"
"		               pol_prod_sub_cls_desc,
"
"	  	               pol_uom,
"
"	  	               pol_prod_uom,
"
"	  	               pol_conv_factor,
"
"	  	               pol_cost_basis,
"
"	  	               pol_contr_pfx,
"
"	  	               pol_contract_id,
"
"	  	               pol_contr_amd_no,
"
"	  	               pol_sc_unit_cost,
"
"	  	               pol_disc_pct,
"
"	  	               pol_scon_mat_unit_cost,
"
"	  	               pol_qc_required,
"
"	  	               pol_stocked,
"
"	  	               pol_ordered_qty,
"
"	  	               pol_tolr_qty,
"
"	  	               pol_received_qty,
"
"	  	               pol_tot_received_qty,
"
"		               pol_rejected_qty,
"
"	  	               pol_deflt_schld_flag,
"
"	  	               pol_net_disc_flag,
"
"	  	               pol_origin,
"
"	  	               pol_proj_flag,
"
"	  	               pol_status,
"
"	  	               pol_cre_by,
"
"	  	               pol_cre_date,
"
"	  	               pol_suplr_prod_id,
"
"	  	               pol_suplr_prod_desc,
"
"	  	               pol_ref,
"
"	  	               pol_prod_ext_desc,
"
"	  	               pol_disc_amt,
"
"	  	               pol_wvd_flag,
"
"	  	               pol_spr_type,
"
"	  	               pol_drawing_no,
"
"	  	               pol_drawing_rev,
"
"	  	               --pol_tcf_id,
"
"	  	               pol_thickness,
"
"	  	               pol_length,
"
"	  	               pol_width,
"
"	  	               pol_hsn_code,
"
"			       pol_store_id,
"
"			       pol_store_name
"
"	  	              )
"
"	  	        VALUES(p_bu,
"
"	  	               v_ord_no,
"
"	  	               v_ord_ln_no,
"
"	  	               v_ord_ln_no,
"
"	  	               cr1.srp_prod_id,
"
"	  	               cr1.srp_prod_rev,
"
"	  	               cr1.prod_desc11,
"
"	  	               cr1.prodplnt_cls,
"
"	  	               cr1.prodplnt_cls_desc,
"
"	  	               cr1.prodplnt_sub_cls,
"
"	  	               cr1.prodplnt_sub_cls_desc,
"
"	  	               v_suplr_uom,
"
"	  	               cr1.prod_uom,
"
"	  	               v_conv_factor,
"
"	  	               cr1.prodplnt_pur_price_basis,
"
"	  	               v_contr_pfx,
"
"	  	               v_contract_id,
"
"	  	               NVL(v_contr_amd_no,0),
"
"	  	               v_sc_unit_cost,
"
"	  	               v_disc_pct,
"
"	  	               0,
"
"	  	               v_qc_req_flag,
"
"	  	               cr1.prod_stocked,
"
"	  	               ROUND((cr1.srp_cur_proc_qty * v_conv_factor),3),
"
"	  	               (cr1.srp_cur_proc_qty * v_conv_factor),
"
"	  	               0,
"
"	  	               0,
"
"	  	               0,
"
"	  	               'Y',
"
"	  	               'N',
"
"	  	               'R',
"
"	  	               'N',
"
"	  	               'E',
"
"	  	               p_user,
"
"	  	               TRUNC(SYSDATE),
"
"	  	               r_as.suprprod_suprod_id,
"
"	  	               r_as.suprprod_suprod_desc,
"
"	  	               NULL,
"
"	  	               cr1.prod_desc11,
"
"	  	               0,
"
"	  	               cr1.prodplnt_wvd_flag,
"
"	  	               'S',
"
"	  	               r_as.suprprod_ctrl_set_no,
"
"	  	               r_as.suprprod_ctrl_set_no,
"
"	  	              -- v_tcf_id,
"
"	  	               cr1.prod_thickness,
"
"	  	               cr1.prod_length,
"
"	  	               cr1.prod_width,
"
"	  	               cr1.prod_hsn_code,
"
"			       v_store_id,
"
"			       v_store_name
"
"	                      );
"
"
"
"      v_chk_ord_pfx := cr1.ord_pfx;
"
"      v_chk_buyer_id := cr1.prodplnt_buyer_id;
"
"
"
"      UPDATE stock_reorder_pipline
"
"       SET srp_cur_proc_qty = srp_cur_proc_qty - ROUND((cr1.srp_cur_proc_qty * v_conv_factor),3),
"
"           srp_processed_qty = srp_processed_qty + ROUND((cr1.srp_cur_proc_qty * v_conv_factor),3),
"
"	   srp_sel_flag = 'N',
"
"           srp_sel_user = NULL,
"
"           srp_upd_by = p_user,
"
"           srp_upd_date = SYSDATE,
"
"           srp_pr_cre_flag = 'Y',
"
"	   srp_status = 'A'
"
"     WHERE srp_bu = p_bu
"
"       AND srp_sel_flag = 'Y'
"
"       AND srp_prod_id = cr1.srp_prod_id
"
"       AND srp_prod_rev = cr1.srp_prod_rev
"
"       AND srp_re_ord_type IN ('PO','ST')
"
"       AND srp_pipeline_no = cr1.srp_pipeline_no;
"
"
"
"    END LOOP;
"
"
"
"    p_po_no := v_ord_no1;
"
"
"
"  END proc_cre_po_frm_pipeline;
"
"
"
"  PROCEDURE proc_cre_sso_frm_pipeline(p_bu		VARCHAR2,
"
"				      p_plnt		VARCHAR2,
"
"				      p_user		VARCHAR2,
"
"				      p_ss_no	OUT	VARCHAR2
"
"				    )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT store_plnt,
"
"         srp_store_id,
"
"         srp_prod_id,
"
"         srp_prod_rev,
"
"	 prod_hsn_code,
"
"         srp_pipeline_no,
"
"         srp_cur_proc_qty rqst_qty
"
"    FROM stock_reorder_pipline,stores,products
"
"   WHERE store_bu = srp_bu
"
"     AND store_id = srp_store_id
"
"     AND prod_bu = srp_bu
"
"     AND prod_id = srp_prod_id
"
"     AND prod_rev = srp_prod_rev
"
"     AND srp_bu = p_bu
"
"     AND srp_re_ord_type = 'SS'
"
"     AND srp_sel_flag = 'Y'
"
"     AND srp_sel_user = p_user
"
"     AND (srp_reord_qty - srp_processed_qty) > 0;
"
"
"
"  CURSOR c2(c_store_id	VARCHAR2,
"
"            c_prod_id	VARCHAR2,
"
"            c_prod_rev	VARCHAR2) IS
"
"  SELECT pcdhd_suplr_id,pcdhd_price
"
"    FROM pur_contr_batch_view
"
"   WHERE pcdhd_bu = p_bu
"
"     AND pcdhd_plnt = p_plnt
"
"     AND pcdhd_prod_id = c_prod_id
"
"     AND pcdhd_prod_rev = c_prod_rev
"
"     AND (TRUNC(SYSDATE) BETWEEN TRUNC(pcdhd_date_from) AND TRUNC(pcdhd_date_to))
"
"     AND pcdhd_status = 'A'
"
"     AND pcdhd_price_type = 'F'
"
"     AND pcdhd_prod_type = 'PR'
"
"   UNION
"
"  SELECT pcdhd_suplr_id,pcdln_price pcdhd_price
"
"    FROM pur_contr_batch_view
"
"   WHERE pcdhd_bu = p_bu
"
"     AND pcdhd_plnt = p_plnt
"
"     AND pcdhd_prod_id = c_prod_id
"
"     AND pcdhd_prod_rev = c_prod_rev
"
"     AND (TRUNC(SYSDATE) BETWEEN TRUNC(pcdhd_date_from) AND TRUNC(pcdhd_date_to))
"
"     AND pcdhd_status = 'A'
"
"     AND pcdhd_price_type = 'R'
"
"     AND pcdhd_prod_type = 'PR';
"
"
"
"  CURSOR c_ssl(c_suplr_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = c_suplr_id
"
"     AND ssl_dflt_flg IN ('D','S');
"
"
"
"  CURSOR c_sbl(c_suplr_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = c_suplr_id
"
"     AND ssl_dflt_flg IN ('D','B');
"
"
"
"  cr2		c2%ROWTYPE;
"
"  r_ssl		c_ssl%ROWTYPE;
"
"  r_sbl		c_sbl%ROWTYPE;
"
"
"
"  v_sso_pfx	VARCHAR2(5);
"
"  v_sso_no	VARCHAR2(15);
"
"
"
"  v_dummy		VARCHAR2(30);
"
"  v_prod_desc1		VARCHAR2(150);
"
"  v_stocked		VARCHAR2(1);
"
"  v_uom			VARCHAR2(5);
"
"  v_class_id		VARCHAR2(10);
"
"  v_sub_cls_id		VARCHAR2(10);
"
"  v_req_qc		VARCHAR2(1);
"
"  v_class_desc		VARCHAR2(50);
"
"  v_sub_cls_desc	VARCHAR2(50);
"
"  v_prod_rfq		VARCHAR2(2);
"
"  var_price		suplr_schld_ln.ssln_price%TYPE;
"
"
"
"  v_req_id           	VARCHAR2(10);
"
"  v_req_name         	VARCHAR2(100);
"
"  v_pos_id           	VARCHAR2(10);
"
"  v_pos_name         	VARCHAR2(50);
"
"  v_dept_id          	VARCHAR2(10);
"
"  v_dept_name        	VARCHAR2(50);
"
"
"
"  v_tax_set_id		VARCHAR2(10);
"
"  v_tcf_id		VARCHAR2(10);
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,
"
"		     p_user,
"
"		     v_req_id,
"
"		     v_req_name,
"
"		     v_pos_id,
"
"		     v_pos_name,
"
"		     v_dept_id,
"
"		     v_dept_name,
"
"		     1
"
"		    );
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      OPEN c2(cr1.srp_store_id,cr1.srp_prod_id,cr1.srp_prod_rev);
"
"      FETCH c2 INTO cr2;
"
"        IF c2%NOTFOUND THEN
"
"	  Raise_Application_Error(-20324,'POM ');
"
"	END IF;
"
"        IF c2%ROWCOUNT > 1 THEN
"
"	  Raise_Application_Error(-20324,'POM ');
"
"	END IF;
"
"      CLOSE c2;
"
"
"
"      OPEN c_ssl(cr2.pcdhd_suplr_id);
"
"      FETCH c_ssl INTO r_ssl;
"
"        IF c_ssl%NOTFOUND THEN
"
"          Raise_application_Error(-20629,'MNT');
"
"        END IF;
"
"      CLOSE c_ssl;
"
"
"
"      OPEN c_sbl(cr2.pcdhd_suplr_id);
"
"      FETCH c_sbl INTO r_sbl;
"
"        IF c_sbl%NOTFOUND THEN
"
"          Raise_application_Error(-20629,'MNT');
"
"        END IF;
"
"      CLOSE c_sbl;
"
"
"
"      v_sso_pfx := func_find_dflt_pfx(p_bu,p_plnt,p_user,'SSPO','POM');
"
"      v_sso_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),v_sso_pfx,p_user);
"
"
"
"      INSERT INTO suplr_schld_hd(sshd_bu,
"
"		                 sshd_plnt,
"
"		                 sshd_doc_pfx,
"
"		                 sshd_doc_no,
"
"		                 sshd_doc_date,
"
"		                 sshd_ref_unit,
"
"		                 sshd_ref,
"
"		                 sshd_ps_type,
"
"		                 sshd_serv_type,
"
"		                 sshd_source,
"
"		                 sshd_status,
"
"		                 sshd_store_id,
"
"		                 sshd_suplr_id,
"
"		                 sshd_suplr_desc,
"
"		                 sshd_cre_by,
"
"		                 sshd_cre_date,
"
"				 sshd_dept_id
"
"		                )
"
"		          VALUES(p_bu,
"
"                 	         p_plnt,
"
"                                 v_sso_pfx,
"
"                                 v_sso_no,
"
"                                 TRUNC(SYSDATE),
"
"                                 p_plnt,
"
"                                 'REORDER LEVEL',
"
"                                 'PR',
"
"                                 'ST',
"
"                                 'S',
"
"                                 'A',
"
"                                 cr1.srp_store_id,
"
"                                 cr2.pcdhd_suplr_id,
"
"                                 func_find_party_name(p_bu,cr2.pcdhd_suplr_id,1),
"
"                                 p_user,
"
"                                 SYSDATE,
"
"				 v_dept_id
"
"                                );
"
"
"
"      proc_get_prod_details(p_bu,
"
"                            p_plnt,
"
"                            cr1.srp_prod_id,
"
"                            cr1.srp_prod_rev,
"
"                            v_prod_desc1,
"
"                            v_stocked,
"
"                            v_uom,
"
"                            v_class_id,
"
"                            v_sub_cls_id,
"
"                            v_req_qc,
"
"                            v_class_desc,
"
"                            v_sub_cls_desc,
"
"                            v_dummy,
"
"                            v_dummy,
"
"                            v_prod_rfq
"
"                           );
"
"
"
"     -- v_tax_set_id := func_find_dflt_tax_set(p_bu,cr1.store_plnt,'S',cr2.pcdhd_suplr_id,r_sbl.ssl_loc_id);
"
"     -- v_tcf_id := func_find_dflt_tax_cls_suplr(p_bu,cr1.store_plnt,cr2.pcdhd_suplr_id,cr1.srp_prod_id,cr1.srp_prod_rev,cr1.prod_hsn_code,r_ssl.ssl_loc_id,TRUNC(SYSDATE));
"
"
"
"      INSERT INTO suplr_schld_ln(ssln_bu,
"
"	       			 ssln_plnt,
"
"				 ssln_doc_pfx,
"
"				 ssln_doc_no,
"
"	       			 ssln_seq_no,
"
"	       			 ssln_print_seq_no,
"
"	       			 ssln_bucket_type,
"
"	       			 ssln_revised_qty,
"
"	       			 ssln_from_date,
"
"	       			 ssln_to_date,
"
"	       			 ssln_freq,
"
"	       			 ssln_price,
"
"	       			 ssln_prod_id,
"
"	       			 ssln_prod_rev,
"
"	       			 ssln_prod_uom,
"
"	       			 ssln_prod_desc1,
"
"	       			 ssln_status,
"
"	       			 ssln_uom,
"
"	       			 ssln_test_req_flag,
"
"	       			 ssln_cre_by,
"
"	       			 ssln_cre_date,
"
"				 ssln_hsn_code,
"
"				 ssln_tax_set_id
"
"				-- ssln_tcf_id
"
"	       			)
"
"	                  VALUES(p_bu,
"
"	                         p_plnt,
"
"				 v_sso_pfx,
"
"				 v_sso_no,
"
"	                         1,
"
"	                         1,
"
"	                         'D',
"
"	                         cr1.rqst_qty,
"
"	                         TRUNC(SYSDATE),
"
"	                         TRUNC(SYSDATE),
"
"	                         1,
"
"	                         cr2.pcdhd_price,
"
"	                         cr1.srp_prod_id,
"
"	                         cr1.srp_prod_rev,
"
"	                         v_uom,
"
"	                         v_prod_desc1,
"
"	                         'A',
"
"	                         func_find_suplr_uom(p_bu,cr2.pcdhd_suplr_id,cr1.srp_prod_id,cr1.srp_prod_rev),
"
"	                         'N',
"
"	                         p_user,
"
"	                         SYSDATE,
"
"				 cr1.prod_hsn_code,
"
"				 v_tax_set_id
"
"				-- v_tcf_id
"
"	                        );
"
"
"
"      proc_gen_frm_suplr_schld(p_bu,p_plnt,v_sso_pfx,v_sso_no,p_user);
"
"
"
"    END LOOP;
"
"
"
"    p_ss_no := 'Y';
"
"  END;
"
"
"
"END pkg_pipeline;"
/
