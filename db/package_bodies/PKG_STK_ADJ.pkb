CREATE OR REPLACE
"PACKAGE BODY pkg_stk_adj
"
"AS
"
"
"
"  PROCEDURE proc_gen_sc_mat_req_frm_osa
"
"  (p_bu		VARCHAR2,
"
"   p_plnt	VARCHAR2,
"
"   p_doc_no	VARCHAR2,
"
"   p_user	VARCHAR2
"
"  )
"
"  AS
"
"
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM upd_stk_opbal_hd,upd_stk_opbal_ln
"
"   WHERE usoh_bu = usol_bu
"
"     AND usoh_plnt = usol_plnt
"
"     AND usoh_doc_no = usol_doc_no
"
"     AND usoh_bu = p_bu
"
"     AND usoh_plnt = p_plnt
"
"     AND usoh_doc_no = p_doc_no
"
"   ORDER BY usol_seq_no;
"
"
"
"  CURSOR c2(c_seq_no NUMBER) IS
"
"  SELECT *
"
"    FROM upd_stk_opbal_proc
"
"   WHERE usop_bu = p_bu
"
"     AND usop_plnt = p_plnt
"
"     AND usop_doc_no = p_doc_no
"
"     AND usop_seq_no = c_seq_no
"
"   ORDER BY usop_sub_seq_no;
"
"
"
"  /*CURSOR c_ls(c_seq_no NUMBER) IS
"
"  SELECT *
"
"    FROM upd_stk_opbal_lot_ser
"
"   WHERE usols_bu = p_bu
"
"     AND usols_plnt = p_plnt
"
"     AND usols_doc_no = p_doc_no
"
"     AND usols_seq_no = c_seq_no
"
"   ORDER BY usols_sub_seq_no;*/
"
"
"
"  CURSOR c3(c_prod_id	VARCHAR2,
"
"            c_prod_rev	NUMBER,
"
"	    c_eng_bom	VARCHAR2,
"
"	    c_oprn_no	VARCHAR2,
"
"	    c_process	VARCHAR2,
"
"	    c_bom_no	VARCHAR2) IS
"
"  SELECT bomhd_conv_factor,
"
"         bomln_prod_id,
"
"         bomln_prod_rev,
"
"         bomln_store_id,
"
"         bomln_prod_uom,
"
"         bomln_uom,
"
"         bomln_conv_factor,
"
"         CASE WHEN bomln_os_rqrd_qty > 0 THEN bomln_os_rqrd_qty
"
"              ELSE bomln_required_qty
"
"         END bomln_required_qty,
"
"         bomln_lot_no_gen_flag
"
"    FROM bom_hd,bom_ln, routing_ln
"
"   WHERE bomhd_bu = rouln_bu
"
"     AND bomhd_plnt = rouln_plnt
"
"     AND bomhd_bom_no = rouln_bom_no
"
"     AND bomln_bu = rouln_bu
"
"     AND bomln_plnt = rouln_plnt
"
"     AND bomln_bom_no = rouln_bom_no
"
"     AND bomln_oprn_seq_no = rouln_oprn_seq_no
"
"     AND bomln_bu = p_bu
"
"     AND bomln_plnt = p_plnt
"
"     AND bomhd_prod_id = c_prod_id
"
"     AND bomhd_prod_rev = c_prod_rev
"
"     AND bomhd_bom_no = c_bom_no
"
"     --AND bomhd_primary = 'Y'
"
"     AND bomhd_status = 'A'
"
"     AND TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to
"
"     AND rouln_oprn_ln_seq = c_oprn_no
"
"     AND rouln_oprn_id = c_process;
"
"
"
"    --r_ls	c_ls%ROWTYPE;
"
"
"
"    v_sub_seq_no	NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM upd_stk_mtrl_opbal
"
"     WHERE usmo_bu = p_bu
"
"       AND usmo_plnt = p_plnt
"
"       AND usmo_doc_no = p_doc_no;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_sub_seq_no := 0;
"
"
"
"      IF INSTR(cr1.usol_sf_code,'1') <> 0 THEN
"
"
"
"	--OPEN c_ls(cr1.usol_seq_no);
"
"	--FETCH c_ls INTO r_ls;
"
"	  --IF c_ls%NOTFOUND THEN
"
"
"
"	    v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	    INSERT INTO upd_stk_mtrl_opbal(usmo_bu,
"
"	                                   usmo_plnt,
"
"					   usmo_doc_no,
"
"					   usmo_seq_no,
"
"					   usmo_sub_seq_no,
"
"					   usmo_oprn_no,
"
"					   usmo_proc_id,
"
"					   usmo_prod_id,
"
"					   usmo_prod_rev,
"
"					   usmo_sf_code,
"
"					   usmo_rqrd_qty,
"
"					   usmo_stk_qty,
"
"					   usmo_unit_cost,
"
"					   usmo_dc_no,
"
"					   usmo_dc_date,
"
"					   usmo_cre_by,
"
"					   usmo_cre_emp_id,
"
"					   usmo_cre_ip_addr,
"
"					   usmo_cre_os_user,
"
"					   usmo_cre_date,
"
"					   usmo_sys_ls_no,
"
"					   usmo_lot_no,
"
"					   usmo_ser_no
"
"					  )
"
"	                            VALUES(p_bu,
"
"	                                   p_plnt,
"
"					   p_doc_no,
"
"					   cr1.usol_seq_no,
"
"					   v_sub_seq_no,
"
"					   cr1.usol_comp_oprn_no,
"
"					   cr1.usol_comp_proc_id,
"
"					   cr1.usol_fg_prod_id,
"
"					   cr1.usol_fg_prod_rev,
"
"					   cr1.usol_sf_code,
"
"					   cr1.usol_fg_ord_qty,
"
"					   cr1.usol_fg_ord_qty,
"
"					   cr1.usol_fg_unit_cost,
"
"					   NULL,
"
"					   NULL,
"
"					   p_user,
"
"					   func_find_emp_id(p_bu,p_user),
"
"					   Audit_Info.Get_Ip_Address,
"
"					   Audit_Info.Get_Os_User,
"
"					   SYSDATE,
"
"					   cr1.usol_sys_ls_no,
"
"					   cr1.usol_lot_no,
"
"					   cr1.usol_ser_no
"
"					  );
"
"	  /*ELSE
"
"	    LOOP
"
"	      v_sub_seq_no := v_sub_seq_no + 1;
"
"	      INSERT INTO upd_stk_mtrl_opbal(usmo_bu,
"
"	                                     usmo_plnt,
"
"					     usmo_doc_no,
"
"					     usmo_seq_no,
"
"					     usmo_sub_seq_no,
"
"					     usmo_oprn_no,
"
"					     usmo_proc_id,
"
"					     usmo_prod_id,
"
"					     usmo_prod_rev,
"
"					     usmo_sf_code,
"
"					     usmo_rqrd_qty,
"
"					     usmo_stk_qty,
"
"					     usmo_unit_cost,
"
"					     usmo_dc_no,
"
"					     usmo_dc_date,
"
"					     usmo_cre_by,
"
"					     usmo_cre_emp_id,
"
"					     usmo_cre_ip_addr,
"
"					     usmo_cre_os_user,
"
"					     usmo_cre_date,
"
"					     usmo_sys_ls_no,
"
"					     usmo_lot_no,
"
"					     usmo_ser_no
"
"					    )
"
"	                              VALUES(p_bu,
"
"	                                     p_plnt,
"
"					     p_doc_no,
"
"					     cr1.usol_seq_no,
"
"					     v_sub_seq_no,
"
"					     cr1.usol_comp_oprn_no,
"
"					     cr1.usol_comp_proc_id,
"
"					     cr1.usol_fg_prod_id,
"
"					     cr1.usol_fg_prod_rev,
"
"					     cr1.usol_sf_code,
"
"					     r_ls.usols_qty,
"
"					     r_ls.usols_qty,
"
"					     cr1.usol_fg_unit_cost,
"
"					     NULL,
"
"					     NULL,
"
"					     p_user,
"
"					     func_find_emp_id(p_bu,p_user),
"
"					     Audit_Info.Get_Ip_Address,
"
"					     Audit_Info.Get_Os_User,
"
"					     SYSDATE,
"
"					     r_ls.usols_sys_ls_no,
"
"					     r_ls.usols_lot_no,
"
"					     r_ls.usols_ser_no
"
"					    );
"
"	      FETCH c_ls INTO r_ls;
"
"	      EXIT WHEN c_ls%NOTFOUND;
"
"	    END LOOP;
"
"	  END IF;
"
"	CLOSE c_ls;*/
"
"
"
"      END IF;
"
"
"
"      FOR cr2 IN c2(cr1.usol_seq_no)
"
"      LOOP
"
"
"
"	FOR cr3 IN c3(cr1.usol_fg_prod_id,cr1.usol_fg_prod_rev,cr1.usol_eng_bom_flag,cr2.usop_oprn_no,cr2.usop_proc_id,cr1.usol_bom_no)
"
"	LOOP
"
"	--Raise_Application_Error(-20999,'HRM '||cr1.usol_fg_prod_id||'~'||cr1.usol_fg_prod_rev||'~'||cr1.usol_eng_bom_flag||'~'||cr2.usop_oprn_no||'~'||cr2.usop_proc_id||'~'||cr1.usol_bom_no);
"
"	  v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	  BEGIN
"
"	    SELECT stcost_cost
"
"	      INTO v_unit_cost
"
"	      FROM stock_costs
"
"	     WHERE stcost_bu = p_bu
"
"	       AND stcost_store_id = func_find_deflt_storeid(p_bu,p_plnt,cr1.usoh_plnt_loc_id,cr1.usol_fg_prod_id,cr1.usol_fg_prod_rev,'N')
"
"	       AND stcost_prod_id = cr1.usol_fg_prod_id
"
"	       AND stcost_prod_rev = cr1.usol_fg_prod_rev;
"
"	  EXCEPTION
"
"	    WHEN NO_DATA_FOUND THEN v_unit_cost := 0;
"
"	  END;
"
"
"
"	  INSERT INTO upd_stk_mtrl_opbal(usmo_bu,
"
"	                                 usmo_plnt,
"
"					 usmo_doc_no,
"
"					 usmo_seq_no,
"
"					 usmo_sub_seq_no,
"
"					 usmo_oprn_no,
"
"					 usmo_proc_id,
"
"					 usmo_prod_id,
"
"					 usmo_prod_rev,
"
"					 usmo_sf_code,
"
"					 usmo_rqrd_qty,
"
"					 usmo_stk_qty,
"
"					 usmo_unit_cost,
"
"					 usmo_dc_no,
"
"					 usmo_dc_date,
"
"					 usmo_cre_by,
"
"					 usmo_cre_emp_id,
"
"					 usmo_cre_ip_addr,
"
"					 usmo_cre_os_user,
"
"					 usmo_cre_date
"
"					)
"
"	                          VALUES(p_bu,
"
"	                                 p_plnt,
"
"					 p_doc_no,
"
"					 cr1.usol_seq_no,
"
"					 v_sub_seq_no,
"
"					 cr2.usop_oprn_no,
"
"					 cr2.usop_proc_id,
"
"					 cr3.bomln_prod_id,
"
"					 cr3.bomln_prod_rev,
"
"					 NULL,
"
"					 (cr1.usol_fg_ord_qty * cr3.bomln_required_qty) / cr3.bomhd_conv_factor,
"
"					 (cr1.usol_fg_ord_qty * cr3.bomln_required_qty) / cr3.bomhd_conv_factor,
"
"					 v_unit_cost,
"
"					 NULL,
"
"					 NULL,
"
"					 p_user,
"
"					 func_find_emp_id(p_bu,p_user),
"
"					 Audit_Info.Get_Ip_Address,
"
"					 Audit_Info.Get_Os_User,
"
"					 SYSDATE
"
"					);
"
"
"
"	END LOOP;
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
"  END proc_gen_sc_mat_req_frm_osa;
"
"
"
"  PROCEDURE proc_cre_sco_frm_osa
"
"  (p_bu			VARCHAR2,
"
"   p_plnt		VARCHAR2,
"
"   p_plnt_loc_id	VARCHAR2,
"
"   p_doc_no		VARCHAR2,
"
"   p_user		VARCHAR2
"
"  )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT usoh_doc_date,usol_suplr_id,prodplnt_buyer_id
"
"    FROM upd_stk_opbal_hd,upd_stk_opbal_ln,prod_plants,prod_plants_loc
"
"   WHERE usoh_bu = usol_bu
"
"     AND usoh_plnt = usol_plnt
"
"     AND usoh_doc_no = usol_doc_no
"
"     AND prodplnt_bu = usol_bu
"
"     AND prodplnt_plnt = usol_plnt
"
"     AND prodplnt_prod_id = usol_fg_prod_id
"
"     AND prodplnt_prod_rev = usol_fg_prod_rev
"
"     AND ppl_bu = prodplnt_bu
"
"     AND ppl_plnt = prodplnt_plnt
"
"     AND ppl_prod_id = prodplnt_prod_id
"
"     AND ppl_prod_rev = prodplnt_prod_rev
"
"     AND usoh_bu = p_bu
"
"     AND usoh_plnt = p_plnt
"
"     AND ppl_plnt_loc_id = p_plnt_loc_id
"
"     AND usoh_doc_no = p_doc_no;
"
"
"
"  CURSOR c2(c_suplr_id	VARCHAR2,
"
"	    c_buyer_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM upd_stk_opbal_hd,upd_stk_opbal_ln,
"
"         prod_plants,products,prod_plants_loc
"
"   WHERE usoh_bu = usol_bu
"
"     AND usoh_plnt = usol_plnt
"
"     AND usoh_doc_no = usol_doc_no
"
"     AND prodplnt_bu = usol_bu
"
"     AND prodplnt_plnt = usol_plnt
"
"     AND prodplnt_prod_id = usol_fg_prod_id
"
"     AND prodplnt_prod_rev = usol_fg_prod_rev
"
"     AND prod_bu = prodplnt_bu
"
"     AND prod_id = prodplnt_prod_id
"
"     AND prod_rev = prodplnt_prod_rev
"
"     AND ppl_bu = prodplnt_bu
"
"     AND ppl_plnt = prodplnt_plnt
"
"     AND ppl_prod_id = prodplnt_prod_id
"
"     AND ppl_prod_rev = prodplnt_prod_rev
"
"     AND usoh_bu = p_bu
"
"     AND usoh_plnt = p_plnt
"
"     AND ppl_plnt_loc_id = p_plnt_loc_id
"
"     AND usoh_doc_no = p_doc_no
"
"     AND usol_suplr_id = c_suplr_id
"
"     AND prodplnt_buyer_id = c_buyer_id
"
"   ORDER BY usol_seq_no;
"
"
"
" /* CURSOR c3(c_seq_no	NUMBER) IS
"
"  SELECT *
"
"    FROM upd_stk_opbal_lot_ser
"
"   WHERE usols_bu = p_bu
"
"     AND usols_plnt = p_plnt
"
"     AND usols_doc_no = p_doc_no
"
"     AND usols_seq_no = c_seq_no
"
"     AND usols_sys_ls_no IS NOT NULL;*/
"
"
"
"  /*SELECT *
"
"    FROM upd_stk_mtrl_opbal
"
"   WHERE usmo_bu = p_bu
"
"     AND usmo_plnt = p_plnt
"
"     AND usmo_doc_no = p_doc_no
"
"     AND usmo_seq_no = c_seq_no
"
"     AND usmo_sys_ls_no IS NOT NULL;*/
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
"  CURSOR c_loc(c_suplr_id		VARCHAR2) IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = c_suplr_id
"
"     AND ssl_dflt_flg IN ('S','D','H','P');
"
"
"
"  CURSOR c_bill_loc(c_suplr_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = c_suplr_id
"
"     AND ssl_dflt_flg IN ('B','D','I','P');
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
"CURSOR c_sl(c_suplr_id VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('D','S');
"
"
"
"CURSOR c_bl(c_suplr_id VARCHAR2) IS
"
"SELECT *
"
"  FROM suplr_ship_loc
"
" WHERE ssl_bu = p_bu
"
"   AND ssl_suplr_id = c_suplr_id
"
"   AND ssl_dflt_flg IN ('D','B');
"
"
"
"CURSOR c_ul(c_plnt        VARCHAR2) IS
"
"SELECT *
"
"  FROM bus_unit_plants_loc_dtls
"
" WHERE bupld_bu = p_bu
"
"   AND bupld_plnt = c_plnt
"
"   AND bupld_dflt_loc_flag = 'Y';
"
"
"
"  CURSOR c_store(c_store_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM stores
"
"   WHERE store_bu = p_bu
"
"     AND store_id = c_store_id;
"
"
"
"  CURSOR c_oprn(c_eng_bom_flag	VARCHAR2,
"
"                c_bom_no	VARCHAR2,
"
"	        c_oprn_seq	NUMBER) IS
"
"  SELECT rno,rouln_oprn_id,rouln_oprn_ln_seq
"
"    FROM (SELECT ROWNUM rno,rouln_oprn_id,rouln_oprn_ln_seq
"
"            FROM (SELECT rouln_oprn_no,rouln_oprn_id,rouln_oprn_ln_seq
"
"                    FROM routing_ln
"
"                   WHERE rouln_bu = p_bu
"
"                     AND rouln_plnt = p_plnt
"
"                     AND rouln_bom_no = c_bom_no
"
"		     AND c_eng_bom_flag = 'N'
"
"		  UNION ALL
"
"		  SELECT rouln_oprn_no,rouln_oprn_id,rouln_oprn_ln_seq
"
"                    FROM engg_routing_ln
"
"                   WHERE rouln_bu = p_bu
"
"                     AND rouln_plnt = p_plnt
"
"                     AND rouln_bom_no = c_bom_no
"
"		     AND c_eng_bom_flag = 'Y'
"
"                   ORDER BY rouln_oprn_no))
"
"   WHERE rno = c_oprn_seq;
"
"
"
"
"
"    r_oprn		c_oprn%ROWTYPE;
"
"
"
"    v_trans_qty		NUMBER;
"
"
"
"    r_suplr		c_suplr%ROWTYPE;
"
"    r_store		c_store%ROWTYPE;
"
"
"
"    r_loc		c_loc%ROWTYPE;
"
"    r_bill_loc		c_bill_loc%ROWTYPE;
"
"
"
"
"
"    v_sc_ord_pfx	VARCHAR2(5);
"
"    v_sc_ord_no		VARCHAR2(30);
"
"    v_seq_no		NUMBER;
"
"    v_proc_seq_no		NUMBER;
"
"
"
"    v_tar_sf_code	VARCHAR2(200);
"
"
"
"    v_req_id		VARCHAR2(10);
"
"    v_req_name		VARCHAR2(100);
"
"    v_pos_id		VARCHAR2(10);
"
"    v_pos_name		VARCHAR2(100);
"
"    v_dept_id		VARCHAR2(10);
"
"    v_dept_name		VARCHAR2(100);
"
"
"
"    v_gst_exempt_flag 	products.prod_gst_exempt_flag%TYPE;
"
"    v_gst_input_type      products.prod_gst_types_of_supply%TYPE;
"
"
"
"    v_proc_hsn_code	products.prod_hsn_code%TYPE;
"
"    v_bu_state		states.state_id%TYPE;
"
"    v_tcf_id		hsn_sac_tax_rates.hstr_tcf_loc_id%TYPE;
"
"    v_unit_cost		pur_order_ln.pol_sc_unit_cost%TYPE;
"
"    v_rqst_no		VARCHAR2(100);
"
"
"
"    v_next_oprn_no	NUMBER;
"
"
"
"    v_schld_seq_no	NUMBER;
"
"
"
"   r_unit		c_unit%ROWTYPE;
"
"   r_sl			c_sl%ROWTYPE;
"
"   r_bl			c_bl%ROWTYPE;
"
"   r_ul			c_ul%ROWTYPE;
"
"
"
"   v_ls_req_flag	VARCHAR2(1);
"
"
"
"   v_compl_oprn_seq	VARCHAR2(110);
"
"   v_compl_proc_id	VARCHAR2(10);
"
"   v_rcpt_store_id	stores.store_id%TYPE;
"
"   v_billfr_ut_cnt	NUMBER(5);
"
"
"
"  v_tax_pct		pur_ord_receipt_ln.porl_tax_pct%TYPE;
"
"  v_cgst_pct		pur_ord_receipt_ln.porl_tax_pct%TYPE;
"
"  v_sgst_pct		pur_ord_receipt_ln.porl_tax_pct%TYPE;
"
"  v_utgst_pct		pur_ord_receipt_ln.porl_tax_pct%TYPE;
"
"  v_cess_pct		pur_ord_receipt_ln.porl_tax_pct%TYPE;
"
"  v_igst_amt		pur_ord_receipt_ln.porl_tax_amt%TYPE;
"
"  v_cgst_amt		pur_ord_receipt_ln.porl_tax_amt%TYPE;
"
"  v_sgst_amt		pur_ord_receipt_ln.porl_tax_amt%TYPE;
"
"  v_utgst_amt		pur_ord_receipt_ln.porl_tax_amt%TYPE;
"
"  v_cess_amt		pur_ord_receipt_ln.porl_tax_amt%TYPE;
"
"  v_gst_type		pur_order_hd.poh_gst_type%TYPE;
"
"  v_gst_clf_type	pur_order_hd.poh_gst_clf_type%TYPE;
"
"  v_billfr_clf_type	pur_order_hd.poh_gst_clf_type%TYPE;
"
"  v_pur_acct		VARCHAR2(20);
"
"  v_cess_rate           NUMBER(12,3);
"
"  v_proc_conv_factor	NUMBER(15,8);
"
"  v_ins_req		VARCHAR2(1);
"
"  BEGIN
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      IF cr1.prodplnt_buyer_id IS NULL THEN
"
"        Raise_Application_Error(-20103,'APM ');
"
"      END IF;
"
"
"
"      v_sc_ord_pfx := func_find_vou_dflt_pfx(p_bu,p_plnt,p_plnt_loc_id,'SCO','SCOP');
"
"
"
"      v_sc_ord_no := func_find_pfx_nextno(p_bu,cr1.usoh_doc_date,v_sc_ord_pfx,p_user);
"
"
"
"      OPEN c_suplr(cr1.usol_suplr_id);
"
"      FETCH c_suplr INTO r_suplr;
"
"      CLOSE c_suplr;
"
"
"
"      proc_get_emp_det(p_bu,
"
"                       p_user,
"
"                       v_req_id,
"
"                       v_req_name,
"
"                       v_pos_id,
"
"                       v_pos_name,
"
"                       v_dept_id,
"
"                       v_dept_name,
"
"                       1
"
"                      );
"
"
"
"      OPEN c_sl (cr1.usol_suplr_id);
"
"      FETCH c_sl INTO r_sl;
"
"        IF c_sl%NOTFOUND THEN
"
"          Raise_Application_Error (-20118, 'APM ');
"
"        END IF;
"
"      CLOSE c_sl;
"
"
"
"      OPEN c_bl (cr1.usol_suplr_id);
"
"      FETCH c_bl INTO r_bl;
"
"        IF c_bl%NOTFOUND THEN
"
"          Raise_Application_Error (-20118, 'APM ');
"
"        END IF;
"
"      CLOSE c_bl;
"
"
"
"      OPEN c_unit (p_plnt);
"
"      FETCH c_unit INTO r_unit;
"
"        IF c_unit%NOTFOUND THEN
"
"          Raise_Application_Error (-20118, 'APM ');
"
"        END IF;
"
"      CLOSE c_unit;
"
"
"
"      OPEN c_ul (p_plnt);
"
"      FETCH c_ul INTO r_ul;
"
"        IF c_ul%NOTFOUND THEN
"
"          Raise_Application_Error (-20118, 'APM ');
"
"        END IF;
"
"      CLOSE c_ul;
"
"
"
"
"
"        BEGIN
"
"          SELECT ssl_gst_type,ssl_type INTO v_gst_type,v_gst_clf_type
"
"            FROM suplr_ship_loc
"
"           WHERE ssl_bu = p_bu
"
"             AND ssl_suplr_id = cr1.usol_suplr_id
"
"             AND ssl_loc_name1 = r_bl.ssl_loc_name1;
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"            Raise_Application_Error(-20118,'APM '||'/'||cr1.usol_suplr_id||'/'||r_bl.ssl_loc_name1);
"
"        END;
"
"
"
"	BEGIN
"
"          SELECT ssl_type INTO v_billfr_clf_type
"
"            FROM suplr_ship_loc
"
"           WHERE ssl_bu = p_bu
"
"             AND ssl_suplr_id = cr1.usol_suplr_id
"
"             AND ssl_loc_name1 = r_bl.ssl_loc_name1
"
"	     AND ssl_dflt_flg = 'D';
"
"        END;
"
"
"
"	IF v_gst_type IN ('M','S','D') THEN
"
"           v_gst_clf_type := v_gst_type;
"
"        ELSE
"
"          IF r_bl.ssl_state_code = r_unit.bup_state_code THEN
"
"
"
"           SELECT COUNT(*) INTO v_billfr_ut_cnt
"
"             FROM states
"
"            WHERE state_bu = p_bu
"
"              AND state_id = r_bl.ssl_state
"
"              AND state_type = 'Y';
"
"
"
"              IF v_billfr_ut_cnt = 0 THEN
"
"	        v_gst_clf_type := 'L';
"
"	      ELSE
"
"	        v_gst_clf_type := 'U';
"
"	      END IF;
"
"
"
"          ELSE
"
"            v_gst_clf_type := 'I';
"
"          END IF;
"
"        END IF;
"
"
"
"
"
"	IF v_gst_clf_type = 'M' THEN
"
"	   v_gst_clf_type := 'M';
"
"	END IF;
"
"
"
"	IF func_find_base_currency(p_bu) <> func_find_party_curry(p_bu,cr1.usol_suplr_id,1) THEN
"
"	   v_gst_clf_type := 'M';
"
"	END IF;
"
"
"
"
"
"      INSERT INTO pur_order_hd(poh_bu,
"
"                               poh_mode,
"
"                               poh_type,
"
"                               poh_order_pfx,
"
"                               poh_order_no,
"
"                               poh_suplr_id,
"
"                               poh_suplr_name,
"
"                               poh_order_date,
"
"                               poh_order_year,
"
"                               poh_order_period,
"
"                               poh_currency,
"
"                               poh_exchange_rate,
"
"                               poh_status,
"
"                               poh_shipvia_id,
"
"                               poh_term_id,
"
"                               poh_fob_id,
"
"                               poh_buyer_id,
"
"                               poh_origin,
"
"                               poh_adv_payable,
"
"                               poh_adv_paid,
"
"                               poh_part_ship_flag,
"
"                               poh_reqstr_id,
"
"                               poh_reqstr_name,
"
"                               poh_reqstr_pos_id,
"
"                               poh_reqstr_pos_name,
"
"                               poh_rqst_dept_id,
"
"                               poh_cre_by,
"
"                               poh_cre_date,
"
"                               poh_plant,
"
"			       poh_plnt_loc_id,
"
"			       poh_plnt_loc_name,
"
"                               poh_terr_id,
"
"			       poh_shipfr_loc_name,
"
"                               poh_billfr_loc_name,
"
"			       poh_billto_loc_name,
"
"			       poh_shipto_type,
"
"			       poh_cust_id,
"
"			       poh_shipto_loc_name,
"
"			       poh_ref,
"
"			       poh_cc_code,
"
"			       poh_gst_type,
"
"                               poh_gst_clf_type,
"
"                               poh_billfr_clf_type,
"
"                               poh_billto_gst_type
"
"			      )
"
"                        VALUES(p_bu,
"
"                               'SC',
"
"                               'SCOP',
"
"                               v_sc_ord_pfx,
"
"                               v_sc_ord_no,
"
"                               cr1.usol_suplr_id,
"
"                               r_suplr.suplr_name1,
"
"                               cr1.usoh_doc_date,
"
"                               func_find_year(p_bu,cr1.usoh_doc_date),
"
"                               func_find_period(p_bu,cr1.usoh_doc_date),
"
"                               r_suplr.suplr_currency,
"
"                               func_find_exchange_rate(p_bu,r_suplr.suplr_currency,NULL,cr1.usoh_doc_date,'PO'),
"
"                               'E',
"
"                               r_suplr.suplr_shipvia_id,
"
"                               r_suplr.suplr_term_id,
"
"                               r_suplr.suplr_fob_id,
"
"                               cr1.prodplnt_buyer_id,
"
"                               'A',
"
"                               0,
"
"                               0,
"
"                               'Y',
"
"                               v_req_id,
"
"                               v_req_name,
"
"                               v_pos_id,
"
"                               v_pos_name,
"
"                               v_dept_id,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               p_plnt,
"
"			       r_ul.bupld_loc_id,
"
"			       r_ul.bupld_loc_name,
"
"                               r_suplr.suplr_terr_id,
"
"                               r_sl.ssl_loc_name1,
"
"                               r_bl.ssl_loc_name1,
"
"			       r_unit.bup_name1,
"
"			       'U',
"
"			       p_plnt,
"
"			       r_ul.bupld_loc_name,
"
"			       'SA - '||p_doc_no,
"
"			       func_find_pur_cpc_bu(p_bu,p_plnt,p_user),
"
"			       v_gst_type,
"
"                               v_gst_clf_type,
"
"			       v_billfr_clf_type,
"
"			       r_unit.bup_gst_type
"
"			      );
"
"
"
"      INSERT INTO pur_order_addr(poa_bu,
"
"				 poa_order_pfx,
"
"				 poa_order_no ,
"
"				 poa_orderby_addr1 ,
"
"				 poa_orderby_addr2 ,
"
"				 poa_orderby_addr3 ,
"
"				 poa_orderby_postal_code ,
"
"				 poa_orderby_city  ,
"
"				 poa_orderby_state ,
"
"				 poa_orderby_state_code,
"
"				 poa_orderby_cntry ,
"
"				 poa_orderby_tele1 ,
"
"				 poa_orderby_fax1,
"
"				 poa_orderby_email1 ,
"
"				 poa_orderby_zip_code,
"
"				 poa_cre_by  ,
"
"				 poa_cre_date,
"
"				 poa_billfr_addr1,
"
"				 poa_billfr_addr2,
"
"				 poa_billfr_addr3,
"
"				 poa_billfr_postal_code,
"
"				 poa_billfr_city,
"
"				 poa_billfr_state,
"
"				 poa_billfr_state_code,
"
"				 poa_billfr_cntry,
"
"				 poa_billfr_tele1,
"
"				 poa_billfr_fax1,
"
"				 poa_billfr_email1,
"
"				 poa_billfr_mobno,
"
"				 poa_billfr_zip_code,
"
"				 poa_billto_addr1,
"
"				 poa_billto_addr2,
"
"				 poa_billto_addr3,
"
"				 poa_billto_postal_code,
"
"				 poa_billto_tele1,
"
"				 poa_billto_email1,
"
"				 poa_billto_zip_code,
"
"				 poa_billto_city,
"
"				 poa_billto_state,
"
"				 poa_billto_state_code,
"
"				 poa_billto_cntry,
"
"				 poa_shipto_addr1,
"
"				 poa_shipto_addr2,
"
"				 poa_shipto_addr3,
"
"				 poa_shipto_postal_code,
"
"				 poa_shipto_tele1,
"
"				 poa_shipto_email1,
"
"				 poa_shipto_zip_code,
"
"				 poa_shipto_city,
"
"				 poa_shipto_state,
"
"				 poa_shipto_state_code,
"
"				 poa_shipto_cntry ,
"
"				 poa_shipfr_gst_no,
"
"				 poa_billfr_gst_no,
"
"				 poa_billto_gst_no,
"
"				 poa_shipto_gst_no
"
"				)
"
"			  VALUES(p_bu,
"
"				 v_sc_ord_pfx,
"
"				 v_sc_ord_no,
"
"				 r_sl.ssl_addr1,
"
"				 r_sl.ssl_addr2,
"
"				 r_sl.ssl_addr3,
"
"				 r_sl.ssl_po_box,
"
"				 r_sl.ssl_city,
"
"				 r_sl.ssl_state,
"
"				 r_sl.ssl_state_code,
"
"				 r_sl.ssl_country,
"
"				 r_sl.ssl_tele,
"
"				 r_sl.ssl_fax,
"
"				 r_sl.ssl_email,
"
"				 r_sl.ssl_zip,
"
"				 p_user,
"
"				 SYSDATE,
"
"				 r_bl.ssl_addr1,
"
"				 r_bl.ssl_addr2,
"
"				 r_bl.ssl_addr3 ,
"
"				 r_bl.ssl_po_box,
"
"				 r_bl.ssl_city,
"
"				 r_bl.ssl_state,
"
"				 r_bl.ssl_state_code,
"
"				 r_bl.ssl_country,
"
"				 r_bl.ssl_tele,
"
"				 r_bl.ssl_fax,
"
"				 r_bl.ssl_email,
"
"				 r_bl.ssl_mob_no,
"
"				 r_bl.ssl_zip,
"
"				 r_unit.bup_addr1,
"
"				 r_unit.bup_addr2,
"
"				 r_unit.bup_addr3,
"
"				 r_unit.bup_po_box,
"
"				 r_unit.bup_tele1,
"
"				 r_unit.bup_email1,
"
"				 r_unit.bup_zip,
"
"				 r_unit.bup_city,
"
"				 r_unit.bup_state,
"
"				 r_unit.bup_state_code,
"
"				 r_unit.bup_country,
"
"				 r_ul.bupld_addr1,
"
"				 r_ul.bupld_addr2,
"
"				 r_ul.bupld_addr3,
"
"				 r_ul.bupld_po_box,
"
"				 r_ul.bupld_tele1,
"
"				 r_ul.bupld_email1,
"
"				 r_ul.bupld_zip,
"
"				 r_ul.bupld_city,
"
"				 r_ul.bupld_state,
"
"				 r_ul.bupld_state_code,
"
"				 r_ul.bupld_country,
"
"				 r_sl.ssl_gst_no,
"
"				 r_bl.ssl_gst_no,
"
"				 r_unit.bup_gst_no,
"
"				 r_ul.bupld_gst_no
"
"				);
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.usol_suplr_id,cr1.prodplnt_buyer_id)
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"
"
"
"
"         IF func_find_base_currency(p_bu) <> func_find_party_curry(p_bu,cr1.usol_suplr_id,1) THEN
"
"	  v_gst_exempt_flag := 'G';
"
"	  v_gst_input_type := 'M';
"
"	ELSE
"
"	     BEGIN
"
"	       SELECT prod_gst_exempt_flag,
"
"                      prod_gst_types_of_supply
"
"                 INTO v_gst_exempt_flag,
"
"	              v_gst_input_type
"
"	         FROM products
"
"	        WHERE prod_bu = p_bu
"
"	          AND prod_id = cr2.usol_fg_prod_id
"
"	          AND prod_rev = cr2.usol_fg_prod_rev;
"
"	     EXCEPTION WHEN no_data_found THEN
"
"	       v_gst_exempt_flag := 'G';
"
"	       v_gst_input_type := 'I';
"
"	     END;
"
"	END IF;
"
"
"
"        IF cr2.usol_fg_ord_qty <= 0 THEN
"
"          Raise_Application_Error(-20045,'ICM '||'FG Quantity'||'/'||cr2.usol_fg_prod_id||'/'||cr2.usol_fg_prod_rev);
"
"        END IF;
"
"
"
"        SELECT bup_state
"
"          INTO v_bu_state
"
"          FROM bus_unit_plants
"
"         WHERE bup_bu = p_bu
"
"           AND bup_plant_id = p_plnt;
"
"
"
"	BEGIN
"
"	  SELECT usop_oprn_no,usop_proc_id INTO v_compl_oprn_seq,v_compl_proc_id
"
"	    FROM (
"
"	  SELECT usop_sub_seq_no,usop_oprn_no,usop_proc_id
"
"	    FROM upd_stk_opbal_proc
"
"	   WHERE usop_bu = p_bu
"
"	     AND usop_plnt = p_plnt
"
"	     AND usop_doc_no = p_doc_no
"
"	     AND usop_seq_no = cr2.usol_seq_no
"
"	   ORDER BY usop_sub_seq_no DESC)
"
"	  WHERE ROWNUM = 1;
"
"	END;
"
"
"
"	BEGIN
"
"	SELECT pror_rcp_store INTO v_rcpt_store_id
"
"	  FROM prod_order_routing
"
"	 WHERE pror_bu = p_bu
"
"	   AND pror_plnt = p_plnt
"
"	   AND pror_ord_no = cr2.usol_prod_ord_no
"
"	   AND pror_oprn_ln_seq = v_compl_oprn_seq
"
"	   AND pror_oprn_id = v_compl_proc_id;
"
"	EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN
"
"	    Raise_Application_Error(-20999,cr2.usol_prod_ord_no||'/'||v_compl_oprn_seq||'/'||v_compl_proc_id);
"
"	END;
"
"	--Raise_Application_Error(-20999,cr2.usol_bom_no||'/'||v_compl_oprn_seq||'/'||v_compl_proc_id);
"
"	BEGIN
"
"	  SELECT rouln_ins_req  INTO v_ins_req
"
"	    FROM routing_ln
"
"	   WHERE rouln_bu = p_bu
"
"	     AND rouln_plnt = p_plnt
"
"	     AND rouln_bom_no = cr2.usol_bom_no
"
"	     AND rouln_oprn_ln_seq = v_compl_oprn_seq
"
"	     AND rouln_oprn_id = v_compl_proc_id;
"
"	  EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN v_ins_req  := 'N';
"
"	END;
"
"
"
"        OPEN c_store(cr2.ppl_dflt_store_id);
"
"        FETCH c_store INTO r_store;
"
"        CLOSE c_store;
"
"
"
"	v_tar_sf_code := cr2.usol_sf_code;
"
"
"
"	FOR r_proc IN (SELECT usop_proc_id,usop_oprn_seq_no,usop_oprn_no
"
"                         FROM upd_stk_opbal_proc
"
"                        WHERE usop_bu = p_bu
"
"                          AND usop_plnt = p_plnt
"
"                          AND usop_doc_no = p_doc_no
"
"                          AND usop_seq_no = cr2.usol_seq_no
"
"                        ORDER BY usop_sub_seq_no)
"
"        LOOP
"
"	  FOR r_rou IN (SELECT proc_seq pror_seq_no
"
"                          FROM (SELECT ROW_NUMBER() OVER (ORDER BY pror_seq_no ASC) proc_seq,pror_seq_no,pror_oprn_id,pror_oprn_ln_seq
"
"                                  FROM prod_order_routing
"
"                                 WHERE pror_bu = p_bu
"
"				   AND pror_plnt = p_plnt
"
"				   AND pror_ord_no = cr2.usol_prod_ord_no)
"
"                         WHERE pror_oprn_id = r_proc.usop_proc_id
"
"                           --AND pror_oprn_ln_seq = r_proc.scrp_oprn_ln_seq_no
"
"			   )
"
"          LOOP
"
"            v_tar_sf_code := func_find_upd_prod_sfg_code(v_tar_sf_code,r_rou.pror_seq_no);
"
"          END LOOP;
"
"	END LOOP;
"
"
"
"        INSERT INTO pur_order_ln(pol_bu,
"
"                                 pol_order_no,
"
"                                 pol_seq_no,
"
"                                 pol_print_seq_no,
"
"                                 pol_prod_id,
"
"                                 pol_prod_rev,
"
"                                 pol_prod_desc1,
"
"                                 pol_prod_cls,
"
"                                 pol_prod_cls_desc,
"
"                                 pol_prod_sub_cls,
"
"                                 pol_prod_sub_cls_desc,
"
"                                 pol_uom,
"
"                                 pol_prod_uom,
"
"                                 pol_conv_factor,
"
"                                 pol_cost_basis,
"
"                                 pol_contr_pfx,
"
"                                 pol_contract_id,
"
"                                 pol_sc_unit_cost,
"
"                                 pol_disc_pct,
"
"			         pol_disc_amt,
"
"                                 pol_scon_mat_unit_cost,
"
"                                 pol_qc_required,
"
"                                 pol_stocked,
"
"                                 pol_ordered_qty,
"
"                                 pol_tolr_qty,
"
"                                 pol_received_qty,
"
"                                 pol_tot_received_qty,
"
"                                 pol_rejected_qty,
"
"                                 pol_deflt_schld_flag,
"
"                                 pol_net_disc_flag,
"
"                                 pol_origin,
"
"                                 pol_proj_flag,
"
"                                 pol_status,
"
"                                 pol_cre_by,
"
"                                 pol_cre_date,
"
"                                 pol_prod_ord_no,
"
"                                 pol_sf_code,
"
"                                 pol_bom_avail_flag,
"
"                                 pol_targ_sf_code  ,
"
"                                 pol_scr_pct,
"
"                                 pol_mat_req_trans_no,
"
"                                 pol_drawing_no,
"
"                                 pol_Drawing_rev,
"
"                                 pol_hsn_code,
"
"			         pol_gst_exempt_flag,
"
"			         pol_gst_input_type,
"
"				 pol_bom_no,
"
"				 pol_bom_name,
"
"				 pol_store_id,
"
"                                 pol_store_name,
"
"				 pol_required_date,
"
"				 pol_so_schld_desc,
"
"                                 pol_so_type,
"
"                                 pol_so_pfx,
"
"                                 pol_so_no,
"
"                                 pol_so_seq_no,
"
"                                 pol_proj_id,
"
"				 pol_sys_ls_no,
"
"                                 pol_lot_no,
"
"				 pol_ser_no,
"
"				 pol_pur_acct,
"
"				 pol_test_no,
"
"				 pol_heat_no
"
"                                )
"
"                          VALUES(p_bu,
"
"                                 v_sc_ord_no,
"
"                                 v_seq_no,
"
"                                 v_seq_no,
"
"                                 cr2.usol_fg_prod_id,
"
"                                 cr2.usol_fg_prod_rev,
"
"                                 cr2.prod_desc11,
"
"                                 cr2.prodplnt_cls,
"
"                                 (SELECT class_desc1 FROM classes WHERE class_bu = p_bu AND class_id = cr2.prodplnt_cls),
"
"                                 cr2.prodplnt_sub_cls,
"
"                                 (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = p_bu AND subcls_id = cr2.prodplnt_sub_cls),
"
"                                 cr2.prod_uom,
"
"                                 cr2.prod_uom,
"
"                                 1,
"
"                                 cr2.prodplnt_pur_price_basis,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 0,
"
"                                 0,
"
"			         0,
"
"                                 0,
"
"                                 v_ins_req,--'N',
"
"                                 cr2.prod_stocked,
"
"                                 cr2.usol_fg_ord_qty,
"
"                                 cr2.usol_fg_ord_qty,
"
"                                 0,
"
"                                 0,
"
"                                 0,
"
"                                 'Y',
"
"                                 'Y',
"
"                                 'A',
"
"                                 'N',
"
"                                 'E',
"
"                                 p_user,
"
"                                 SYSDATE,
"
"                                 cr2.usol_prod_ord_no,
"
"                                 cr2.usol_sf_code,
"
"                                 'Y',
"
"                                 v_tar_sf_code,
"
"                                 0,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 NULL,
"
"                                 cr2.usol_hsn_code,--cr2.prod_hsn_code,
"
"			         v_gst_exempt_flag,
"
"			         v_gst_input_type,
"
"				 cr2.usol_bom_no,
"
"				 cr2.usol_bom_name,
"
"				 v_rcpt_store_id,--cr2.ppl_dflt_store_id,--v_rcpt_store_id,
"
"				 r_store.store_desc1,
"
"				 cr1.usoh_doc_date + 1,
"
"				 cr2.usol_so_schld_desc,
"
"                                 cr2.usol_so_type,
"
"                                 cr2.usol_so_pfx,
"
"                                 cr2.usol_so_no,
"
"                                 cr2.usol_so_seq_no,
"
"                                 cr2.usol_proj_id,
"
"                                 cr2.usol_sys_ls_no,
"
"                                 cr2.usol_lot_no,
"
"                                 cr2.usol_ser_no,
"
"                                 v_pur_acct,
"
"                                 cr2.usol_lot_no,
"
"                                 cr2.usol_lot_no
"
"                                );
"
"
"
"        v_proc_seq_no := 0;
"
"
"
"	FOR r_proc IN (SELECT usop_sub_seq_no,usop_oprn_seq_no,usop_proc_id,usop_oprn_no,
"
"                              mfgo_uom,mfgo_prod_id,mfgo_prod_rev,usop_proc_cost
"
"                         FROM upd_stk_opbal_proc,mfg_oprns
"
"		        WHERE mfgo_bu = usop_bu
"
"                          AND mfgo_oprn_id = usop_proc_id
"
"			  AND usop_bu = p_bu
"
"                          AND usop_plnt = p_plnt
"
"                          AND usop_doc_no = p_doc_no
"
"                          AND usop_seq_no = cr2.usol_seq_no
"
"			ORDER BY usop_sub_seq_no)
"
"        LOOP
"
"
"
"	  IF r_proc.mfgo_prod_id IS NULL THEN
"
"	    Raise_Application_Error(-20061,'PLN '||r_proc.usop_proc_id);
"
"	  END IF;
"
"
"
"	  BEGIN
"
"	    SELECT prod_hsn_code INTO v_proc_hsn_code
"
"	      FROM products
"
"	     WHERE prod_bu = p_bu
"
"	       AND prod_id = r_proc.mfgo_prod_id
"
"	       AND prod_rev = r_proc.mfgo_prod_rev;
"
"	  EXCEPTION
"
"	    WHEN NO_DATA_FOUND THEN
"
"	      Raise_Application_Error(-20260,'ICM '||r_proc.mfgo_prod_id);
"
"	  END;
"
"
"
"	  IF v_proc_hsn_code IS NULL THEN
"
"	    Raise_Application_Error(-20029,'TAX '||r_proc.mfgo_prod_id);
"
"	  END IF;
"
"
"
"	  UPDATE sub_contr_ord_process
"
"	     SET scop_lab_cost = r_proc.usop_proc_cost
"
"	   WHERE scop_bu = p_bu
"
"	     AND scop_ord_no = v_sc_ord_no
"
"	     AND scop_seq_no = v_seq_no
"
"	     AND scop_process = r_proc.usop_proc_id
"
"	     AND scop_oprn_ln_seq_no = r_proc.usop_oprn_no;
"
"
"
"	  IF SQL%NOTFOUND THEN
"
"
"
"          v_proc_seq_no := v_proc_seq_no + 1;
"
"
"
"	  BEGIN
"
"	    SELECT pror_ls_flag
"
"	      INTO v_ls_req_flag
"
"	      FROM prod_order_routing
"
"	     WHERE pror_bu = p_bu
"
"	       AND pror_plnt = p_plnt
"
"	       AND pror_ord_no = cr2.usol_prod_ord_no
"
"	       AND pror_oprn_ln_seq = r_proc.usop_oprn_no
"
"	       AND pror_oprn_id = r_proc.usop_proc_id;
"
"	  EXCEPTION
"
"	    WHEN NO_DATA_FOUND THEN
"
"	      Raise_Application_Error(-20474,'PRJ '||cr2.usol_prod_ord_no||'/'||r_proc.usop_oprn_no||'/'||r_proc.usop_proc_id);
"
"	  END;
"
"
"
"	  BEGIN
"
"	    SELECT prod_gst_exempt_flag,prod_gst_types_of_supply
"
"              INTO v_gst_exempt_flag,v_gst_input_type
"
"	      FROM products
"
"	     WHERE prod_bu = p_bu
"
"	       AND prod_id = r_proc.mfgo_prod_id
"
"	       AND prod_rev = r_proc.mfgo_prod_rev;
"
"	     EXCEPTION WHEN no_data_found THEN
"
"	       v_gst_exempt_flag := 'G';
"
"	       v_gst_input_type := 'I';
"
"	     END;
"
"
"
"	  IF v_proc_hsn_code IS NOT NULL THEN
"
"              proc_get_hsn_tax_pct(p_bu,
"
"	                           v_proc_hsn_code,
"
"			           cr1.usoh_doc_date,
"
"			           v_gst_clf_type,--CASE WHEN r_bl.ssl_type = 'M' THEN 'I' ELSE r_bl.ssl_type END,
"
"			           v_gst_input_type,
"
"			           v_gst_exempt_flag,
"
"				   cr2.usol_fg_ord_qty,
"
"			           (cr2.usol_fg_ord_qty * r_proc.usop_proc_cost),
"
"                                   v_tax_pct,
"
"                                   v_cgst_pct,
"
"                                   v_sgst_pct,
"
"                                   v_utgst_pct,
"
"                                   v_cess_pct,
"
"				   v_cess_rate,
"
"                                   v_igst_amt,
"
"                                   v_cgst_amt,
"
"                                   v_sgst_amt,
"
"                                   v_utgst_amt,
"
"                                   v_cess_amt
"
"	                           );
"
"         END IF;
"
"
"
"	 /*v_pur_acct := func_find_pur_acct(p_bu,'PR',NULL,cr2.prodplnt_cls,cr2.prodplnt_sub_cls,
"
"                                         p_plnt,r_proc.mfgo_prod_id, NVL(v_tax_pct,0),cr2.prod_gst_exempt_flag,v_gst_clf_type,r_ul.bupld_loc_id,v_rcpt_store_id,cr2.prod_stocked); */
"
"	BEGIN
"
"	SELECT subcls_pur_acct
"
"          INTO v_pur_acct
"
"          FROM sub_classes
"
"         WHERE subcls_bu = p_bu
"
"           AND subcls_id = func_find_product_subclass(p_bu,p_plnt,cr2.usol_fg_prod_id,cr2.usol_fg_prod_rev);
"
"	EXCEPTION WHEN OTHERS THEN
"
"      	v_pur_acct := NULL;
"
"	END;
"
"
"
"	v_proc_conv_factor := func_find_uom_conversion(p_bu,cr2.usol_fg_prod_id,cr2.usol_fg_prod_rev,cr2.prod_uom,r_proc.mfgo_uom);
"
"
"
"	  INSERT INTO sub_contr_ord_process(scop_bu,
"
"					    scop_ord_no,
"
"					    scop_seq_no,
"
"					    scop_sub_seq_no,
"
"					    scop_oprn_seq_no,
"
"					    scop_oprn_ln_seq_no,
"
"					    scop_process,
"
"					    scop_lab_cost,
"
"					    scop_cre_by,
"
"					    scop_cre_date,
"
"					    scop_uom,
"
"					    scop_prod_id,
"
"					    scop_prod_rev,
"
"					    scop_hsn_code,
"
"					    scop_ls_req_flag,
"
"					    scop_batch_qty,
"
"					    scop_batch_cost,
"
"					    scop_igst_pct,
"
"                                            scop_cgst_pct,
"
"                                            scop_sgst_pct,
"
"                                            scop_utgst_pct,
"
"                                            scop_cess_pct,
"
"                                            scop_igst_amt,
"
"                                            scop_cgst_amt,
"
"                                            scop_sgst_amt,
"
"                                            scop_utgst_amt,
"
"                                            scop_cess_amt,
"
"					    scop_assbl_val,
"
"					    scop_proc_qty,
"
"					    scop_pur_acct,
"
"					    scop_conv_factor
"
"					   )
"
"	                             VALUES(p_bu,
"
"					    v_sc_ord_no,
"
"					    v_seq_no,
"
"					    v_proc_seq_no,
"
"					    v_proc_seq_no,
"
"					    r_proc.usop_oprn_no,
"
"					    r_proc.usop_proc_id,
"
"					    r_proc.usop_proc_cost,
"
"					    p_user,
"
"					    SYSDATE,
"
"					    r_proc.mfgo_uom,
"
"					    r_proc.mfgo_prod_id,
"
"					    r_proc.mfgo_prod_rev,
"
"					    v_proc_hsn_code,
"
"					    v_ls_req_flag,
"
"					    1,
"
"					    r_proc.usop_proc_cost,
"
"					    NVL(v_tax_pct,0),
"
"					    NVL(v_cgst_pct,0),
"
"					    NVL(v_sgst_pct,0),
"
"					    NVL(v_utgst_pct,0),
"
"					    NVL(v_cess_pct,0),
"
"					    NVL(v_igst_amt,0),
"
"					    NVL(v_cgst_amt,0),
"
"					    NVL(v_sgst_amt,0),
"
"					    NVL(v_utgst_amt,0),
"
"					    NVL(v_cess_amt,0),
"
"					    (cr2.usol_fg_ord_qty * r_proc.usop_proc_cost),
"
"					    cr2.usol_fg_ord_qty,
"
"					    v_pur_acct,
"
"					    v_proc_conv_factor
"
"					   );
"
"	  END IF;
"
"
"
"          SELECT SUM(scop_lab_cost)
"
"	    INTO v_unit_cost
"
"	    FROM sub_contr_ord_process
"
"	   WHERE scop_bu = p_bu
"
"	     AND scop_ord_no = v_sc_ord_no
"
"	     AND scop_seq_no = v_seq_no;
"
"
"
"          UPDATE pur_order_ln
"
"	     SET pol_sc_unit_cost = v_unit_cost
"
"	   WHERE pol_bu = p_bu
"
"	     AND pol_order_no = v_sc_ord_no
"
"	     AND pol_seq_no = v_seq_no;
"
"
"
"          v_compl_oprn_seq := r_proc.usop_oprn_no;
"
"	  v_compl_proc_id := r_proc.usop_proc_id;
"
"
"
"	END LOOP;
"
"
"
"        IF cr2.usol_prod_ord_no IS NOT NULL THEN
"
"
"
"	  v_next_oprn_no := INSTR(cr2.usol_sf_code,'0');
"
"
"
"	  OPEN c_oprn(cr2.usol_eng_bom_flag,cr2.usol_bom_no,v_next_oprn_no);
"
"	  FETCH c_oprn INTO r_oprn;
"
"	  CLOSE c_oprn;
"
"
"
"	BEGIN
"
"          proc_upd_oprn_status_qtys(p_bu,
"
"                                    p_plnt,
"
"				    p_plnt_loc_id,
"
"                                    cr2.usol_prod_ord_no,
"
"                                    r_oprn.rouln_oprn_id,
"
"                                    r_oprn.rouln_oprn_ln_seq,
"
"                                    cr2.usol_sf_code,
"
"                                    -cr2.usol_fg_ord_qty,
"
"                                    0,
"
"                                    cr2.usol_fg_ord_qty,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"                                    0,
"
"				     0,
"
"                                    cr2.usol_sys_ls_no,
"
"                                    cr2.usol_lot_no,
"
"                                    cr2.usol_ser_no,
"
"                                    NULL,
"
"                                    'PR',
"
"                                    p_user,
"
"                                    NULL
"
"                                   );
"
"        EXCEPTION
"
"	  WHEN OTHERS THEN
"
"	    Raise_Application_Error(-20999,'HRM '||cr2.usol_prod_ord_no||'/'||r_oprn.rouln_oprn_id||'/'||r_oprn.rouln_oprn_ln_seq||'/'||cr2.usol_sf_code||'/'||cr2.usol_sys_ls_no);
"
"	END;
"
"	END IF;
"
"
"
"        UPDATE upd_stk_opbal_ln
"
"           SET usol_sco_ord_pfx = v_sc_ord_pfx,
"
"	       usol_sco_ord_no = v_sc_ord_no,
"
"	       usol_sco_seq_no = v_seq_no
"
"         WHERE usol_bu = p_bu
"
"	   AND usol_plnt = p_plnt
"
"           AND usol_doc_no = p_doc_no
"
"	   AND usol_seq_no = cr2.usol_seq_no;
"
"
"
"      END LOOP;
"
"
"
"      proc_gen_sub_contr_mat_req(p_bu,p_plnt,v_sc_ord_pfx,v_sc_ord_no,p_user);
"
"      proc_upd_po_tot_amt(p_bu,v_sc_ord_pfx,v_sc_ord_no,p_user);
"
"
"
"
"
"     UPDATE pur_order_hd
"
"        SET poh_status = 'A',
"
"            poh_upd_cost_flag = 'Y'
"
"      WHERE poh_bu = p_bu
"
"        AND poh_order_pfx = v_sc_ord_pfx
"
"        AND poh_order_no = v_sc_ord_no;
"
"
"
"     UPDATE pur_order_ln
"
"        SET pol_status = 'A'
"
"      WHERE pol_bu = p_bu
"
"        AND pol_order_no = v_sc_ord_no;
"
"
"
"    END LOOP;
"
"
"
"  END proc_cre_sco_frm_osa;
"
"
"
"  PROCEDURE proc_cre_sa_frm_osa
"
"  (p_bu		VARCHAR2,
"
"   p_plnt	VARCHAR2,
"
"   p_doc_no	VARCHAR2,
"
"   p_user	VARCHAR2
"
"  )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT usoh_doc_date,usol_suplr_id
"
"    FROM upd_stk_opbal_hd,upd_stk_opbal_ln
"
"   WHERE usoh_bu = usol_bu
"
"     AND usoh_plnt = usol_plnt
"
"     AND usoh_doc_no = usol_doc_no
"
"     AND usoh_bu = p_bu
"
"     AND usoh_plnt = p_plnt
"
"     AND usoh_doc_no = p_doc_no;
"
"
"
"  CURSOR c2(c_suplr_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM upd_stk_opbal_hd,upd_stk_opbal_ln,upd_stk_mtrl_opbal,products
"
"   WHERE usoh_bu = usol_bu
"
"     AND usoh_plnt = usol_plnt
"
"     AND usoh_doc_no = usol_doc_no
"
"     AND usmo_bu = usol_bu
"
"     AND usmo_plnt = usol_plnt
"
"     AND usmo_doc_no = usol_doc_no
"
"     AND usmo_seq_no = usol_seq_no
"
"     AND prod_bu = usmo_bu
"
"     AND prod_id = usmo_prod_id
"
"     AND prod_rev = usmo_prod_rev
"
"     AND usoh_bu = p_bu
"
"     AND usoh_plnt = p_plnt
"
"     AND usoh_doc_no = p_doc_no
"
"     AND usol_suplr_id = c_suplr_id;
"
"
"
"  CURSOR c_ul(c_plnt        VARCHAR2) IS
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
"    r_ul		c_ul%ROWTYPE;
"
"
"
"    v_ord_no		VARCHAR2(30);
"
"    v_seq_no		NUMBER;
"
"    v_seq_no1		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"    v_date		DATE;
"
"    v_year		NUMBER;
"
"    v_period		NUMBER;
"
"    v_store_id		VARCHAR2(10);
"
"    v_adj_pfx		VARCHAR2(10);
"
"    v_res		VARCHAR2(100);
"
"    v_sa_pfx		VARCHAR2(10);
"
"    v_loop		NUMBER;
"
"    v_ls_qty		NUMBER;
"
"    v_lot_no		VARCHAR2(50);
"
"    v_ser_no		VARCHAR2(50);
"
"    v_ser_no1		VARCHAR2(50);
"
"
"
"  BEGIN
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_date := cr1.usoh_doc_date;
"
"      proc_find_year_period(p_bu,v_date,v_year,v_period);
"
"
"
"      OPEN c_ul (p_plnt);
"
"      FETCH c_ul INTO r_ul;
"
"        IF c_ul%NOTFOUND THEN
"
"          Raise_Application_Error (-20118, 'APM ');
"
"        END IF;
"
"      CLOSE c_ul;
"
"
"
"      <<Find_WH>>
"
"
"
"      BEGIN
"
"        SELECT store_id,store_sa_pfx
"
"	  INTO v_store_id,v_sa_pfx
"
"	  FROM stores
"
"	 WHERE store_bu = p_bu
"
"	   AND store_plnt = p_plnt
"
"	   AND store_plnt_loc_id = r_ul.bupld_loc_id
"
"	   AND store_inv_id = cr1.usol_suplr_id
"
"	   AND store_physical = 'V';
"
"
"
"	IF v_sa_pfx IS NULL THEN
"
"	  BEGIN
"
"            /*SELECT adp_pfx INTO v_sa_pfx
"
"              FROM appl_doc_prefixes,appl_users,user_prefix_access,appl_doc_pfx_loc
"
"             WHERE appluser_bu = adp_bu
"
"               AND appluser_id = upa_user_id
"
"               AND appluser_id = p_user
"
"               AND upa_bu = adp_bu
"
"               AND upa_pfx = adp_pfx
"
"	       AND adp_bu = adpl_bu
"
"	       AND adp_pfx = adpl_pfx
"
"               AND adp_doc_type = 'SA'
"
"               AND upa_dflt_flag = 'Y'
"
"	       AND adp_bu = p_bu
"
"               AND adp_plnt = p_plnt
"
"	       AND adpl_loc_id = r_ul.bupld_loc_id
"
"               AND ROWNUM = 1;*/
"
"	    v_sa_pfx := func_find_vou_dflt_pfx(p_bu,p_plnt,r_ul.bupld_loc_id,'SA','SA');
"
"	  EXCEPTION
"
"	    WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20190,'ADM '||p_bu||'/'||p_plnt||'/'||p_user||'/'||r_ul.bupld_loc_id);
"
"	  END;
"
"	END IF;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"	  proc_cre_suplr_whr(p_bu,p_plnt,r_ul.bupld_loc_id,cr1.usol_suplr_id,'V',p_user);
"
"	  GOTO Find_WH;
"
"      END;
"
"
"
"      v_ord_no := func_find_pfx_nextno(p_bu,v_date,v_sa_pfx,p_user);
"
"
"
"      INSERT INTO stock_adj_trans_hd(sathd_bu,
"
"                                     sathd_ord_no,
"
"                                     sathd_store_id,
"
"                                     sathd_ord_date,
"
"                                     sathd_ord_year,
"
"                                     sathd_ord_period,
"
"                                     sathd_reference,
"
"                                     sathd_status,
"
"                                     sathd_plnt,
"
"				     sathd_plnt_loc_id,
"
"				     sathd_plnt_loc_name,
"
"                                     sathd_cre_by,
"
"                                     sathd_cre_date,
"
"				     sathd_source_type
"
"                                    )
"
"                              VALUES(p_bu,
"
"                                     v_ord_no,
"
"                                     v_store_id,
"
"                                     v_date,
"
"                                     v_year,
"
"                                     v_period,
"
"                                     'Stock Adjustment against SC Opening',
"
"                                     'E',
"
"                                     p_plnt,
"
"				     r_ul.bupld_loc_id,
"
"				     r_ul.bupld_loc_name,
"
"                                     p_user,
"
"                                     SYSDATE,
"
"				     'M'
"
"                                    );
"
"
"
"      BEGIN
"
"        SELECT sap_prefix
"
"          INTO v_adj_pfx
"
"          FROM stock_adjust_prefixes
"
"         WHERE sap_bu = p_bu
"
"           AND sap_oper = 'I'
"
"	   AND sap_status = 'A'
"
"	   AND ROWNUM = 1;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_Application_Error(-20999,'HRM Stock Adj. Increase Pfx. not found.');
"
"      END;
"
"
"
"      v_seq_no := 0;
"
"      v_seq_no1 := 0;
"
"
"
"    FOR cr2 IN c2(cr1.usol_suplr_id)
"
"    LOOP
"
"
"
"      UPDATE stock_adj_trans_ln
"
"         SET satln_trans_qty = satln_trans_qty + cr2.usmo_stk_qty
"
"       WHERE satln_bu = p_bu
"
"         AND satln_ord_no = v_ord_no
"
"	 AND satln_prod_id = cr2.usmo_prod_id
"
"	 AND satln_prod_rev = cr2.usmo_prod_rev
"
"	 AND satln_po_ord_no = cr2.usol_prod_ord_no
"
"	 AND satln_sf_code = cr2.usmo_sf_code
"
"	 AND cr2.usmo_sf_code IS NULL
"
"       RETURNING satln_seq_no INTO v_seq_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"	v_seq_no1 := v_seq_no1 + 1;
"
"
"
"        v_seq_no := v_seq_no1;
"
"
"
"        INSERT INTO stock_adj_trans_ln(satln_bu,
"
"                                       satln_ord_no,
"
"                                       satln_seq_no,
"
"				       satln_mat_type,
"
"                                       satln_adj_prefix,
"
"                                       satln_prod_id,
"
"                                       satln_prod_rev,
"
"                                       satln_uom,
"
"                                       satln_prod_uom,
"
"                                       satln_conv_factor,
"
"                                       satln_class_id,
"
"                                       satln_trans_qty,
"
"                                       satln_unit_cost,
"
"                                       satln_reference,
"
"                                       satln_status,
"
"				       satln_dc_cre_flag,
"
"				       satln_ord_type,
"
"				       satln_po_ord_no,
"
"				       satln_os_ord_pfx,
"
"				       satln_os_ord_no,
"
"				       satln_os_ord_seq_no,
"
"				       satln_os_ord_sub_seq_no,
"
"				       satln_dc_no,
"
"                                       satln_cre_by,
"
"                                       satln_cre_date,
"
"				       satln_oprn_ln_seq_no,
"
"				       satln_process_id,
"
"				       satln_sf_code,
"
"				       satln_so_schld_desc,
"
"                                       satln_so_type,
"
"                                       satln_so_pfx,
"
"                                       satln_so_no,
"
"                                       satln_so_seq_no,
"
"                                       satln_proj_id,
"
"				       satln_bom_no,
"
"                                       satln_bom_name
"
"                                      )
"
"                                VALUES(p_bu,
"
"                                       v_ord_no,
"
"                                       v_seq_no,
"
"				       CASE WHEN cr2.usmo_sf_code IS NULL THEN 'S' ELSE 'F' END,
"
"                                       v_adj_pfx,
"
"                                       cr2.usmo_prod_id,
"
"                                       cr2.usmo_prod_rev,
"
"                                       func_find_product_uom(p_bu,cr2.usmo_prod_id,cr2.usmo_prod_rev),
"
"                                       func_find_product_uom(p_bu,cr2.usmo_prod_id,cr2.usmo_prod_rev),
"
"                                       1,
"
"                                       func_find_product_class(p_bu,p_plnt,cr2.usmo_prod_id,cr2.usmo_prod_rev),
"
"                                       cr2.usmo_stk_qty,
"
"                                       cr2.usmo_unit_cost,
"
"                                       'Stock Adjustment Against SC Opening'||'~'||p_doc_no,
"
"                                       'E',
"
"				       'Y',
"
"				       'SCOP',
"
"				       cr2.usol_prod_ord_no,
"
"				       cr2.usol_sco_ord_pfx,
"
"				       cr2.usol_sco_ord_no,
"
"				       cr2.usol_sco_seq_no,
"
"				       1,
"
"				       cr2.usol_old_dc_no,
"
"                                       p_user,
"
"                                       SYSDATE,
"
"				       CASE WHEN cr2.usmo_sf_code IS NOT NULL THEN cr2.usmo_oprn_no ELSE NULL END,
"
"				       CASE WHEN cr2.usmo_sf_code IS NOT NULL THEN cr2.usmo_proc_id ELSE NULL END,
"
"				       cr2.usmo_sf_code,
"
"				       CASE WHEN cr2.prod_indicator = 'I' THEN cr2.usol_so_schld_desc ELSE NULL END,
"
"                                       CASE WHEN cr2.prod_indicator = 'I' THEN cr2.usol_so_type ELSE 'NA' END,
"
"                                       CASE WHEN cr2.prod_indicator = 'I' THEN cr2.usol_so_pfx ELSE NULL END,
"
"                                       CASE WHEN cr2.prod_indicator = 'I' THEN cr2.usol_so_no ELSE NULL END,
"
"                                       CASE WHEN cr2.prod_indicator = 'I' THEN cr2.usol_so_seq_no ELSE NULL END,
"
"                                       CASE WHEN cr2.prod_indicator = 'I' THEN cr2.usol_proj_id  ELSE NULL END,
"
"				       cr2.usol_bom_no,
"
"                                       cr2.usol_bom_name
"
"                                      );
"
"        END IF;
"
"
"
"	IF cr2.prod_ser_lot_opt IN ('L','S') THEN
"
"
"
"	  IF cr2.usmo_lot_no IS NULL AND cr2.prod_ser_lot_opt = 'L' AND cr2.usmo_sf_code IS NOT NULL THEN
"
"	    Raise_Application_Error(-20999,'HRM Lot No. not found.');
"
"	  END IF;
"
"
"
"	   IF cr2.usmo_ser_no IS NULL AND cr2.prod_ser_lot_opt = 'S' AND cr2.usmo_sf_code IS NOT NULL THEN
"
"	    Raise_Application_Error(-20999,'HRM Serial No. not found.');
"
"	  END IF;
"
"
"
"	  IF cr2.usmo_sf_code IS NULL THEN
"
"	  IF cr2.prod_ser_lot_opt = 'L' THEN
"
"	    v_loop := 1;
"
"	    v_ls_qty := cr2.usmo_stk_qty;
"
"	    IF cr2.usmo_lot_no IS NOT NULL THEN
"
"	      v_lot_no := cr2.usmo_lot_no;
"
"	    ELSE
"
"	      v_lot_no := v_ord_no||'#'||v_seq_no;
"
"	    END IF;
"
"	    v_ser_no := NULL;
"
"	  ELSE
"
"	    v_loop := cr2.usmo_stk_qty;
"
"	    v_ls_qty := 1;
"
"	    v_lot_no := NULL;
"
"	    v_ser_no := v_ord_no||'#'||v_seq_no;
"
"	  END IF;
"
"
"
"	  FOR i IN 1..v_loop
"
"	  LOOP
"
"
"
"	    SELECT NVL(MAX(satb_sub_seq_no),0) + 1 INTO v_sub_seq_no
"
"	      FROM stock_adj_trans_bin
"
"	     WHERE satb_bu = p_bu
"
"	       AND satb_ord_no = v_ord_no
"
"	       AND satb_seq_no = v_seq_no;
"
"
"
"	    IF cr2.prod_ser_lot_opt = 'S' THEN
"
"	      v_ser_no1 := v_ser_no||'#'||TO_CHAR(v_sub_seq_no);
"
"	    END IF;
"
"
"
"	    INSERT INTO stock_adj_trans_bin(satb_bu,
"
"                                            satb_ord_no,
"
"                                            satb_seq_no,
"
"                                            satb_sub_seq_no,
"
"					    satb_sys_ls_no,
"
"                                            satb_lot_no,
"
"					    satb_heat_no,
"
"					    satb_test_no,
"
"                                            satb_ser_no,
"
"                                            satb_source_id,
"
"                                            satb_source_type,
"
"					    satb_trans_qty,
"
"                                            satb_cre_by,
"
"                                            satb_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            v_ord_no,
"
"                                            v_seq_no,
"
"                                            v_sub_seq_no,
"
"                                            NULL,
"
"                                            CASE WHEN cr2.prod_ser_lot_opt = 'L' THEN  v_lot_no ELSE NULL END,
"
"					    CASE WHEN cr2.prod_ser_lot_opt = 'L' THEN v_lot_no  ELSE NULL END,
"
"					    CASE WHEN cr2.prod_ser_lot_opt = 'L' THEN  v_lot_no  ELSE NULL END,
"
"                                            CASE WHEN cr2.prod_ser_lot_opt = 'S' THEN v_ser_no1 ELSE NULL END,
"
"                                            v_store_id,
"
"                                            'S',
"
"                                            v_ls_qty,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"          END LOOP;
"
"	  ELSE
"
"
"
"	    SELECT NVL(MAX(satb_sub_seq_no),0) + 1 INTO v_sub_seq_no
"
"	      FROM stock_adj_trans_bin
"
"	     WHERE satb_bu = p_bu
"
"	       AND satb_ord_no = v_ord_no
"
"	       AND satb_seq_no = v_seq_no;
"
"
"
"	    INSERT INTO stock_adj_trans_bin(satb_bu,
"
"                                            satb_ord_no,
"
"                                            satb_seq_no,
"
"                                            satb_sub_seq_no,
"
"					    satb_sys_ls_no,
"
"                                            satb_lot_no,
"
"					    satb_heat_no,
"
"					    satb_test_no,
"
"                                            satb_ser_no,
"
"                                            satb_source_id,
"
"                                            satb_source_type,
"
"					    satb_trans_qty,
"
"                                            satb_cre_by,
"
"                                            satb_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            v_ord_no,
"
"                                            v_seq_no,
"
"                                            v_sub_seq_no,
"
"                                            cr2.usmo_sys_ls_no,
"
"                                            cr2.usmo_lot_no,
"
"					    cr2.usmo_lot_no,
"
"					    cr2.usmo_lot_no,
"
"                                            cr2.usmo_ser_no,
"
"                                            v_store_id,
"
"                                            'S',
"
"                                            cr2.usmo_stk_qty,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"
"
"	  END IF;
"
"	END IF;
"
"
"
"
"
"      END LOOP;
"
"
"
"      IF func_find_inv_method(p_bu) = 'T' THEN
"
"        proc_cre_stk_adj_jrnl(p_bu,p_plnt,v_ord_no,p_user,1);
"
"        UPDATE stock_adj_trans_hd
"
"           SET sathd_jrnl_flag = 'Y'
"
"         WHERE sathd_bu = p_bu
"
"           AND sathd_plnt = p_plnt
"
"	   AND sathd_ord_no = v_ord_no;
"
"      END IF;
"
"
"
"      UPDATE stock_adj_trans_hd
"
"         SET sathd_status = 'N',
"
"	     sathd_upd_by = p_user,
"
"	     sathd_upd_date = SYSDATE
"
"       WHERE sathd_bu = p_bu
"
"         AND sathd_plnt = p_plnt
"
"	 AND sathd_ord_no = v_ord_no;
"
"
"
"      UPDATE stock_adj_trans_ln
"
"         SET satln_status = 'N',
"
"	     satln_upd_by = p_user,
"
"	     satln_upd_date = SYSDATE
"
"       WHERE satln_bu = p_bu
"
"	 AND satln_ord_no = v_ord_no;
"
"
"
"      proc_upd_stock_adj_status(p_bu,v_ord_no,'A',p_user,func_find_emp_id(p_bu,p_user),v_res);
"
"
"
"      proc_cre_suplr_stk_adj_dc_doc(p_bu,p_plnt,v_ord_no,v_store_id,p_user,1,v_res);
"
"
"
"    END LOOP;
"
"
"
"  END proc_cre_sa_frm_osa;
"
"
"
"END pkg_stk_adj;"
/
