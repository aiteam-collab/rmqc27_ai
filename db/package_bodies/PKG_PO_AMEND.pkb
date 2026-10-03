CREATE OR REPLACE
"PACKAGE BODY pkg_po_amend
"
"AS
"
"
"
"  PROCEDURE proc_load_multi_cs_frm_pend_po(p_bu			VARCHAR2,
"
"					   p_plnt		VARCHAR2,
"
"					   p_plnt_loc_id	VARCHAR2,
"
"					   p_doc_no		VARCHAR2,
"
"					   p_suplr_id	        VARCHAR2,
"
"					   p_fr_date		DATE,
"
"					   p_to_date		DATE,
"
"					   p_user		VARCHAR2,
"
"					   p_mode		VARCHAR2	DEFAULT 'PO',
"
"					   p_res  	OUT	VARCHAR2
"
"					  )
"
"  AS
"
"
"
"  v_emp_id	VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr	VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"  v_os_user	VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"  BEGIN
"
"
"
"-- Raise_Application_Error(-20999,'HRM'||'-'||p_plnt||'-'||p_plnt_loc_id||'-'||p_doc_no||'-'||p_suplr_id||'-'||p_fr_date||'-'||p_to_date||'-'||p_mode);
"
"
"
"    p_res := 'Y';
"
"    DELETE FROM po_multi_clsht_ln
"
"     WHERE pmcl_bu = p_bu
"
"       AND pmcl_plnt = p_plnt
"
"       AND pmcl_doc_no = p_doc_no;
"
"     BEGIN
"
"    INSERT INTO po_multi_clsht_ln(pmcl_bu,
"
"                                  pmcl_plnt,
"
"				  pmcl_doc_no,
"
"				  pmcl_seq_no,
"
"				  pmcl_po_pfx,
"
"				  pmcl_po_no,
"
"				  pmcl_po_seq_no,
"
"				  pmcl_po_sub_seq_no,
"
"				  pmcl_ord_type,
"
"				  pmcl_suplr_id,
"
"				  pmcl_suplr_name,
"
"				  pmcl_prod_id,
"
"				  pmcl_prod_rev,
"
"				  pmcl_prod_desc1,
"
"				  pmcl_pur_uom,
"
"				  pmcl_ord_qty,
"
"				  pmcl_inproc_qty,
"
"				  pmcl_rcvd_qty,
"
"				  pmcl_cls_qty,
"
"				  pmcl_curr_cls_qty,
"
"				  pmcl_cre_by,
"
"				  pmcl_cre_emp_id,
"
"				  pmcl_cre_ip_addr,
"
"				  pmcl_cre_os_user,
"
"				  pmcl_cre_date
"
"				 )
"
"    SELECT p_bu,p_plnt,p_doc_no,ROW_NUMBER() OVER (ORDER BY poh_order_pfx,pol_order_no,pol_seq_no,1) seq_no,
"
"           poh_order_pfx,pol_order_no,pol_seq_no,1,poh_type,poh_suplr_id,poh_suplr_name,pol_prod_id,
"
"	   pol_prod_rev,pol_prod_desc1,pol_uom,pol_ordered_qty,pol_proc_qty,pol_received_qty,pol_cls_qty,
"
"	   (pol_ordered_qty - (pol_received_qty + pol_proc_qty + pol_cls_qty)) Bal_Qty,
"
"	   p_user,
"
"	   v_emp_id,
"
"	   v_ip_addr,
"
"	    v_os_user,
"
"	   SYSDATE
"
"      FROM pur_order_hd,pur_order_ln
"
"     WHERE poh_bu = pol_bu
"
"       AND poh_order_no = pol_order_no
"
"       AND poh_bu = p_bu
"
"       AND poh_plant = p_plnt
"
"       AND poh_plnt_loc_id = p_plnt_loc_id
"
"       AND (poh_suplr_id = p_suplr_id OR p_suplr_id IS NULL)
"
"       AND poh_order_date >= TRUNC(p_fr_date)
"
"       AND poh_order_date <= TRUNC(p_to_date )
"
"       AND (pol_ordered_qty - (pol_received_qty + pol_proc_qty + pol_cls_qty)) > 0
"
"     --AND (pol_ordered_qty - (pol_temp_inv_qty + pol_inv_qty)) > 0
"
"       AND pol_status IN ('A','P')
"
"      --AND pol_serv_io_type <> 'O'
"
"     --AND pol_work_ord_no IS NULL
"
"       AND ((p_mode = 'PO' AND poh_type IN ('POG','POT','POS')) OR (p_mode = 'SC' AND poh_type = 'SCOP'))
"
"       AND poh_mode = p_mode ;
"
"
"
"IF SQL%ROWCOUNT = 0 THEN
"
"   p_res := 'N';
"
"  ELSE
"
"  p_res := 'Y';
"
"  END IF;
"
"END;
"
"  END proc_load_multi_cs_frm_pend_po;
"
"
"
"  PROCEDURE proc_cre_cs_doc_frm_multi_cs(p_bu		VARCHAR2,
"
"                                         p_plnt		VARCHAR2,
"
"					 p_doc_no	VARCHAR2,
"
"					 p_user		VARCHAR2
"
"					)
"
"  AS
"
"  CURSOR c_hd IS
"
"  SELECT pmcl_po_pfx,pmcl_po_no
"
"    FROM po_multi_clsht_ln
"
"   WHERE pmcl_bu = p_bu
"
"     AND pmcl_plnt = p_plnt
"
"     AND pmcl_doc_no = p_doc_no
"
"     AND pmcl_sel_flag = 'Y'
"
"     AND pmcl_sel_user = p_user
"
"   GROUP BY pmcl_po_pfx,pmcl_po_no;
"
"
"
"  CURSOR c_ln(c_po_pfx	VARCHAR2,
"
"              c_po_no	VARCHAR2) IS
"
"  SELECT pmcl_po_pfx,pmcl_po_no,pmcl_po_seq_no,SUM(pmcl_curr_cls_qty) Cls_Qty
"
"    FROM po_multi_clsht_ln
"
"   WHERE pmcl_bu = p_bu
"
"     AND pmcl_plnt = p_plnt
"
"     AND pmcl_doc_no = p_doc_no
"
"     AND pmcl_po_pfx = c_po_pfx
"
"     AND pmcl_po_no = c_po_no
"
"     AND pmcl_sel_flag = 'Y'
"
"     AND pmcl_sel_user = p_user
"
"   GROUP BY pmcl_po_pfx,pmcl_po_no,pmcl_po_seq_no
"
"   ORDER BY pmcl_po_seq_no;
"
"
"
"  CURSOR c_sch(c_po_pfx		VARCHAR2,
"
"               c_po_no		VARCHAR2,
"
"	       c_po_seq_no	NUMBER) IS
"
"  SELECT *
"
"    FROM po_multi_clsht_ln
"
"   WHERE pmcl_bu = p_bu
"
"     AND pmcl_plnt = p_plnt
"
"     AND pmcl_doc_no = p_doc_no
"
"     AND pmcl_po_pfx = c_po_pfx
"
"     AND pmcl_po_no = c_po_no
"
"     AND pmcl_po_seq_no = c_po_seq_no
"
"     AND pmcl_sel_flag = 'Y'
"
"     AND pmcl_sel_user = p_user
"
"   ORDER BY pmcl_po_sub_seq_no;
"
"
"
"  CURSOR c_poh(c_po_pfx	VARCHAR2,
"
"               c_po_no	VARCHAR2) IS
"
"  SELECT *
"
"    FROM pur_order_hd
"
"   WHERE poh_bu = p_bu
"
"     AND poh_order_pfx = c_po_pfx
"
"     AND poh_order_no = c_po_no;
"
"
"
"  CURSOR c_pol(c_po_pfx	VARCHAR2,
"
"               c_po_no	VARCHAR2,
"
"	       c_seq_no	NUMBER) IS
"
"  SELECT *
"
"    FROM pur_order_ln
"
"   WHERE pol_bu = p_bu
"
"     AND pol_order_no = c_po_no
"
"     AND pol_seq_no = c_seq_no;
"
"
"
"
"
"  CURSOR c_pr(c_po_pfx		VARCHAR2,
"
"              c_po_no		VARCHAR2,
"
"              c_po_seq_no	NUMBER) IS
"
"
"
"  SELECT *
"
"    FROM pur_req_ln_schld_ord
"
"   WHERE prlso_bu = p_bu
"
"     AND prlso_order_no = c_po_no
"
"     AND prlso_order_seq_no = c_po_seq_no
"
"   ORDER BY prlso_bu,prlso_order_no,prlso_order_seq_no;
"
"
"
"  CURSOR c_poa(c_po_pfx	VARCHAR2,
"
"               c_po_no	VARCHAR2) IS
"
"  SELECT *
"
"    FROM pur_order_addr
"
"   WHERE poa_bu = p_bu
"
"     AND poa_order_no = c_po_no;
"
"
"
"  r_poh			c_poh%ROWTYPE;
"
"  r_pol			c_pol%ROWTYPE;
"
" -- r_pos			c_pos%ROWTYPE;
"
"  r_pr			c_pr%ROWTYPE;
"
"  r_poa			c_poa%ROWTYPE;
"
"
"
"  v_doc_no	po_amend_hd.pah_doc_no%TYPE;
"
"  v_doc_pfx	po_amend_hd.pah_doc_pfx%TYPE;
"
"  v_seq_no	po_amend_line_chnges.palc_seq_no%TYPE;
"
"  v_sub_seq_no	po_amend_sch_chnges.pasc_sub_seq_no%TYPE;
"
"  v_pr_seq_no	po_amend_sou_pr_lines.paspl_line_no%TYPE;
"
"
"
"  v_emp_id	VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr	VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"  v_os_user	VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"  v_cnt		NUMBER(5);
"
"
"
"  BEGIN
"
"
"
"    FOR r_hd IN c_hd
"
"    LOOP
"
"
"
"	BEGIN
"
"	   SELECT COUNT(*)
"
"	     INTO v_cnt
"
"	     FROM pur_ord_receipt_ln
"
"	    WHERE porl_bu = p_bu
"
"	      AND porl_po_no = r_hd.pmcl_po_no;
"
"
"
"	      IF v_cnt > 0 THEN
"
"	         Raise_Application_Error(-20999,'Receipt already created for this PO.');
"
"	      END IF;
"
"	END;
"
"
"
"      OPEN c_poh(r_hd.pmcl_po_pfx,r_hd.pmcl_po_no);
"
"      FETCH c_poh INTO r_poh;
"
"      CLOSE c_poh;
"
"
"
"	 v_doc_pfx := func_find_vou_dflt_pfx(p_bu,p_plnt,r_poh.poh_plnt_loc_id,'POA','POA');
"
"
"
"	 v_doc_no :=  func_find_pfx_nextno(p_bu,
"
"	                                  TRUNC(SYSDATE),
"
"					  v_doc_pfx,
"
"					  p_user);
"
"
"
"      INSERT INTO po_amend_hd(pah_bu,
"
"                              pah_plnt,
"
"			      pah_doc_pfx,
"
"			      pah_doc_no,
"
"			      pah_doc_date,
"
"			      pah_po_pfx,
"
"			      pah_po_no,
"
"			      pah_po_rev_no,
"
"			      pah_ref,
"
"			      pah_status,
"
"			      pah_shipvia_id,
"
"			      pah_term_id,
"
"			      pah_fob_id,
"
"			      pah_new_shipvia_id,
"
"			      pah_new_term_id,
"
"			      pah_new_fob_id,
"
"			      pah_exchange_rate,
"
"			      pah_suplr_id,
"
"			      pah_type,
"
"			      pah_cre_by,
"
"			      pah_cre_ip_addr,
"
"			      pah_cre_os_user,
"
"			      pah_cre_date,
"
"			      pah_cre_emp_id,
"
"			      pah_old_ref,
"
"			      pah_new_ref,
"
"			      pah_loc_name_old,
"
"			      pah_loc_name_new,
"
"			      pah_shipto_loc_name_old,
"
"			      pah_shipto_loc_name_new,
"
"			      pah_billto_loc_name_old,
"
"			      pah_billto_loc_name_new,
"
"			      pah_billfr_loc_name_old,
"
"			      pah_billfr_loc_name_new,
"
"			      pah_shipto_type_old,
"
"			      pah_shipto_type_new,
"
"			      pah_shipto_benf_id_old,
"
"			      pah_shipto_benf_id_new,
"
"			      pah_plnt_loc_id,
"
"			      pah_plnt_loc_name
"
"			     )
"
"                       VALUES(p_bu,
"
"		              p_plnt,
"
"			      v_doc_pfx,
"
"			      v_doc_no,
"
"			      TRUNC(SYSDATE),
"
"			      r_hd.pmcl_po_pfx,
"
"			      r_hd.pmcl_po_no,
"
"			      r_poh.poh_amend_no,
"
"			      'MULTI CLOSESHORT',
"
"			      'N',
"
"			      r_poh.poh_shipvia_id,
"
"			      r_poh.poh_term_id,
"
"			      r_poh.poh_fob_id,
"
"			      r_poh.poh_shipvia_id,
"
"			      r_poh.poh_term_id,
"
"			      r_poh.poh_fob_id,
"
"			      r_poh.poh_exchange_rate,
"
"			      r_poh.poh_suplr_id,
"
"			      r_poh.poh_type,
"
"			      p_user,
"
"			      v_ip_addr,
"
"			      v_os_user,
"
"			      SYSDATE,
"
"			      v_emp_id,
"
"			      r_poh.poh_ref,
"
"			      r_poh.poh_ref,
"
"			      r_poh.poh_shipfr_loc_name,
"
"			      r_poh.poh_shipfr_loc_name,
"
"			      r_poh.poh_shipto_loc_name,
"
"			      r_poh.poh_shipto_loc_name,
"
"			      r_poh.poh_billto_loc_name,
"
"			      r_poh.poh_billto_loc_name,
"
"			      r_poh.poh_billfr_loc_name,
"
"			      r_poh.poh_billfr_loc_name,
"
"			      r_poh.poh_shipto_type,
"
"			      r_poh.poh_shipto_type,
"
"			      r_poh.poh_cust_id,
"
"			      r_poh.poh_cust_id,
"
"			      r_poh.poh_plnt_loc_id,
"
"			      r_poh.poh_plnt_loc_name
"
"			     );
"
"
"
"      OPEN c_poa(r_hd.pmcl_po_pfx,r_hd.pmcl_po_no);
"
"      FETCH c_poa INTO r_poa;
"
"      CLOSE c_poa;
"
"
"
"      INSERT INTO po_amend_addr(paa_bu,
"
"			        paa_plnt,
"
"			        paa_doc_no,
"
"			        paa_orderby_addr1_old,
"
"			        paa_orderby_addr1_new,
"
"			        paa_orderby_addr2_old,
"
"			        paa_orderby_addr2_new,
"
"			        paa_orderby_addr3_old,
"
"			        paa_orderby_addr3_new,
"
"			        paa_orderby_postal_code_old,
"
"			        paa_orderby_postal_code_new,
"
"			        paa_orderby_city_old,
"
"			        paa_orderby_city_new,
"
"			        paa_orderby_state_old,
"
"			        paa_orderby_state_new,
"
"			        paa_orderby_cntry_old,
"
"			        paa_orderby_cntry_new,
"
"			        paa_orderby_tele1_old,
"
"			        paa_orderby_tele1_new,
"
"			        paa_orderby_fax1_old,
"
"			        paa_orderby_fax1_new,
"
"			        paa_orderby_email1_old,
"
"			        paa_orderby_email1_new,
"
"			        paa_orderby_mobno_old,
"
"			        paa_orderby_mobno_new,
"
"			        paa_orderby_zip_code_old,
"
"			        paa_orderby_zip_code_new,
"
"			        paa_billfr_addr1_old,
"
"			        paa_billfr_addr1_new,
"
"			        paa_billfr_addr2_old,
"
"			        paa_billfr_addr2_new,
"
"			        paa_billfr_addr3_old,
"
"			        paa_billfr_addr3_new,
"
"			        paa_billfr_postal_code_old,
"
"			        paa_billfr_postal_code_new,
"
"			        paa_billfr_city_old,
"
"			        paa_billfr_city_new,
"
"			        paa_billfr_state_old,
"
"			        paa_billfr_state_new,
"
"			        paa_billfr_cntry_old,
"
"			        paa_billfr_cntry_new,
"
"			        paa_billfr_tele1_old,
"
"			        paa_billfr_tele1_new,
"
"			        paa_billfr_fax1_old,
"
"			        paa_billfr_fax1_new,
"
"			        paa_billfr_email1_old,
"
"			        paa_billfr_email1_new,
"
"			        paa_billfr_mobno_old,
"
"			        paa_billfr_mobno_new,
"
"			        paa_billfr_zip_code_old,
"
"			        paa_billfr_zip_code_new,
"
"			        paa_billto_addr1_old,
"
"			        paa_billto_addr1_new,
"
"			        paa_billto_addr2_old,
"
"			        paa_billto_addr2_new,
"
"			        paa_billto_addr3_old,
"
"			        paa_billto_addr3_new,
"
"			        paa_billto_postal_code_old,
"
"			        paa_billto_postal_code_new,
"
"			        paa_billto_tele1_old,
"
"			        paa_billto_tele1_new,
"
"			        paa_billto_fax1_old,
"
"			        paa_billto_fax1_new,
"
"			        paa_billto_email1_old,
"
"			        paa_billto_email1_new,
"
"			        paa_billto_mobno_old,
"
"			        paa_billto_mobno_new,
"
"			        paa_billto_zip_code_old,
"
"			        paa_billto_zip_code_new,
"
"			        paa_billto_city_old,
"
"			        paa_billto_city_new,
"
"			        paa_billto_state_old,
"
"			        paa_billto_state_new,
"
"			        paa_billto_cntry_old,
"
"			        paa_billto_cntry_new,
"
"			        paa_shipfr_gst_no_old,
"
"			        paa_shipfr_gst_no_new,
"
"			        paa_billfr_gst_no_old,
"
"			        paa_billfr_gst_no_new,
"
"			        paa_billto_gst_no_old,
"
"			        paa_billto_gst_no_new,
"
"			        paa_shipto_addr1_old,
"
"			        paa_shipto_addr1_new,
"
"			        paa_shipto_addr2_old,
"
"			        paa_shipto_addr2_new,
"
"			        paa_shipto_addr3_old,
"
"			        paa_shipto_addr3_new,
"
"			        paa_shipto_postal_code_old,
"
"			        paa_shipto_postal_code_new,
"
"			        paa_shipto_tele1_old,
"
"			        paa_shipto_tele1_new,
"
"			        paa_shipto_fax1_old,
"
"			        paa_shipto_fax1_new,
"
"			        paa_shipto_email1_old,
"
"			        paa_shipto_email1_new,
"
"			        paa_shipto_mobno_old,
"
"			        paa_shipto_mobno_new,
"
"			        paa_shipto_zip_code_old,
"
"			        paa_shipto_zip_code_new,
"
"			        paa_shipto_city_old,
"
"			        paa_shipto_city_new,
"
"			        paa_shipto_state_old,
"
"			        paa_shipto_state_new,
"
"			        paa_shipto_cntry_old,
"
"			        paa_shipto_cntry_new,
"
"			        paa_shipto_gst_no_old,
"
"			        paa_shipto_gst_no_new,
"
"			        paa_cre_by,
"
"				paa_cre_emp_id,
"
"			        paa_cre_ip_addr,
"
"			        paa_cre_os_user,
"
"			        paa_cre_date,
"
"			        paa_orderby_state_code,
"
"			        paa_billfr_state_code,
"
"			        paa_billto_state_code,
"
"			        paa_shipto_state_code,
"
"			        paa_orderby_state_code_new,
"
"			        paa_billfr_state_code_new,
"
"			        paa_billto_state_code_new,
"
"			        paa_shipto_state_code_new
"
"			       )
"
"                         VALUES(p_bu,
"
"			        p_plnt,
"
"			        v_doc_no,
"
"			        r_poa.poa_orderby_addr1,
"
"			        r_poa.poa_orderby_addr1,
"
"			        r_poa.poa_orderby_addr2,
"
"			        r_poa.poa_orderby_addr2,
"
"			        r_poa.poa_orderby_addr3,
"
"			        r_poa.poa_orderby_addr3,
"
"			        r_poa.poa_orderby_postal_code,
"
"			        r_poa.poa_orderby_postal_code,
"
"			        r_poa.poa_orderby_city,
"
"			        r_poa.poa_orderby_city,
"
"			        r_poa.poa_orderby_state,
"
"			        r_poa.poa_orderby_state,
"
"			        r_poa.poa_orderby_cntry,
"
"			        r_poa.poa_orderby_cntry,
"
"			        r_poa.poa_orderby_tele1,
"
"			        r_poa.poa_orderby_tele1,
"
"			        r_poa.poa_orderby_fax1,
"
"			        r_poa.poa_orderby_fax1,
"
"			        r_poa.poa_orderby_email1,
"
"			        r_poa.poa_orderby_email1,
"
"			        r_poa.poa_orderby_mobno,
"
"			        r_poa.poa_orderby_mobno,
"
"			        r_poa.poa_orderby_zip_code,
"
"			        r_poa.poa_orderby_zip_code,
"
"			        r_poa.poa_billfr_addr1,
"
"			        r_poa.poa_billfr_addr1,
"
"			        r_poa.poa_billfr_addr2,
"
"			        r_poa.poa_billfr_addr2,
"
"			        r_poa.poa_billfr_addr3,
"
"			        r_poa.poa_billfr_addr3,
"
"			        r_poa.poa_billfr_postal_code,
"
"			        r_poa.poa_billfr_postal_code,
"
"			        r_poa.poa_billfr_city,
"
"			        r_poa.poa_billfr_city,
"
"			        r_poa.poa_billfr_state,
"
"			        r_poa.poa_billfr_state,
"
"			        r_poa.poa_billfr_cntry,
"
"			        r_poa.poa_billfr_cntry,
"
"			        r_poa.poa_billfr_tele1,
"
"			        r_poa.poa_billfr_tele1,
"
"			        r_poa.poa_billfr_fax1,
"
"			        r_poa.poa_billfr_fax1,
"
"			        r_poa.poa_billfr_email1,
"
"			        r_poa.poa_billfr_email1,
"
"			        r_poa.poa_billfr_mobno,
"
"			        r_poa.poa_billfr_mobno,
"
"			        r_poa.poa_billfr_zip_code,
"
"			        r_poa.poa_billfr_zip_code,
"
"			        r_poa.poa_billto_addr1,
"
"			        r_poa.poa_billto_addr1,
"
"			        r_poa.poa_billto_addr2,
"
"			        r_poa.poa_billto_addr2,
"
"			        r_poa.poa_billto_addr3,
"
"			        r_poa.poa_billto_addr3,
"
"			        r_poa.poa_billto_postal_code,
"
"			        r_poa.poa_billto_postal_code,
"
"			        r_poa.poa_billto_tele1,
"
"			        r_poa.poa_billto_tele1,
"
"			        r_poa.poa_billto_fax1,
"
"			        r_poa.poa_billto_fax1,
"
"			        r_poa.poa_billto_email1,
"
"			        r_poa.poa_billto_email1,
"
"			        r_poa.poa_billto_mobno,
"
"			        r_poa.poa_billto_mobno,
"
"			        r_poa.poa_billto_zip_code,
"
"			        r_poa.poa_billto_zip_code,
"
"			        r_poa.poa_billto_city,
"
"			        r_poa.poa_billto_city,
"
"			        r_poa.poa_billto_state,
"
"			        r_poa.poa_billto_state,
"
"			        r_poa.poa_billto_cntry,
"
"			        r_poa.poa_billto_cntry,
"
"			        r_poa.poa_shipfr_gst_no,
"
"			        r_poa.poa_shipfr_gst_no,
"
"			        r_poa.poa_billfr_gst_no,
"
"			        r_poa.poa_billfr_gst_no,
"
"			        r_poa.poa_billto_gst_no,
"
"			        r_poa.poa_billto_gst_no,
"
"			        r_poa.poa_shipto_addr1,
"
"			        r_poa.poa_shipto_addr1,
"
"			        r_poa.poa_shipto_addr2,
"
"			        r_poa.poa_shipto_addr2,
"
"			        r_poa.poa_shipto_addr3,
"
"			        r_poa.poa_shipto_addr3,
"
"			        r_poa.poa_shipto_postal_code,
"
"			        r_poa.poa_shipto_postal_code,
"
"			        r_poa.poa_shipto_tele1,
"
"			        r_poa.poa_shipto_tele1,
"
"			        r_poa.poa_shipto_fax1,
"
"			        r_poa.poa_shipto_fax1,
"
"			        r_poa.poa_shipto_email1,
"
"			        r_poa.poa_shipto_email1,
"
"			        r_poa.poa_shipto_mobno,
"
"			        r_poa.poa_shipto_mobno,
"
"			        r_poa.poa_shipto_zip_code,
"
"			        r_poa.poa_shipto_zip_code,
"
"			        r_poa.poa_shipto_city,
"
"			        r_poa.poa_shipto_city,
"
"			        r_poa.poa_shipto_state,
"
"			        r_poa.poa_shipto_state,
"
"			        r_poa.poa_shipto_cntry,
"
"			        r_poa.poa_shipto_cntry,
"
"			        r_poa.poa_shipto_gst_no,
"
"			        r_poa.poa_shipto_gst_no,
"
"			        p_user,
"
"				v_emp_id,
"
"			        v_ip_addr,
"
"			        v_os_user,
"
"			        SYSDATE,
"
"			        r_poa.poa_orderby_state_code,
"
"			        r_poa.poa_billfr_state_code,
"
"			        r_poa.poa_billto_state_code,
"
"			        r_poa.poa_shipto_state_code,
"
"			        r_poa.poa_orderby_state_code,
"
"			        r_poa.poa_billfr_state_code,
"
"			        r_poa.poa_billto_state_code,
"
"			        r_poa.poa_shipto_state_code
"
"			       );
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR r_ln IN c_ln(r_hd.pmcl_po_pfx,r_hd.pmcl_po_no)
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"
"
"        OPEN c_pol(r_hd.pmcl_po_pfx,r_hd.pmcl_po_no,r_ln.pmcl_po_seq_no);
"
"        FETCH c_pol INTO r_pol;
"
"        CLOSE c_pol;
"
"	 --RAISE_APPLICATION_ERROR('-20999','HRM'||r_hd.pmcl_po_pfx||'-'||r_hd.pmcl_po_no);
"
"	INSERT INTO po_amend_line_chnges(palc_bu,
"
"                                         palc_plnt,
"
"                                         palc_doc_no,
"
"                                         palc_seq_no,
"
"                                         palc_chnge_type,
"
"                                         palc_po_line_no,
"
"                                         palc_prod_id,
"
"                                         palc_prod_rev,
"
"                                         palc_prod_desc1,
"
"                                         palc_prod_uom,
"
"                                         palc_suplr_uom,
"
"                                         palc_old_po_qty,
"
"                                         palc_new_po_qty,
"
"                                         palc_old_unit_cost,
"
"                                         palc_new_unit_cost,
"
"                                         palc_old_disc_pct,
"
"                                         palc_old_disc_amt,
"
"                                         palc_new_disc_pct,
"
"										 palc_new_disc_amt,
"
"                                         palc_rqrd_date,
"
"                                         palc_source_flag,
"
"                                         palc_cre_by,
"
"                                         palc_cre_date,
"
"                                         palc_cls_id,
"
"                                         palc_subcls_id,
"
"                                         --palc_tax_set_id,
"
"                                       --  palc_tcf_id,
"
"                                         palc_hsn_code,
"
"                                         palc_gst_exempt_flag,
"
"                                         palc_gst_input_type,
"
"                                         --palc_old_tax_set_id,
"
"                                         --palc_old_tcf_id,
"
"                                         palc_old_hsn_code,
"
"                                         palc_old_gst_exempt_flag,
"
"                                         palc_old_gst_input_type,
"
"                                         palc_origin,
"
"                                         palc_cost_basis,
"
"                                         --palc_pend_po_qty,
"
"                                         palc_contr_pfx,
"
"                                         palc_contr_id,
"
"                                         palc_contr_amd_no,
"
"                                         palc_old_suplr_prod_id,
"
"                                         palc_old_suplr_prod_desc,
"
"                                         palc_new_suplr_prod_id,
"
"                                         palc_new_suplr_prod_desc,
"
"				         palc_new_ref,
"
"				         palc_old_ref,
"
"				         palc_old_pur_acct,
"
"				         palc_new_pur_acct,
"
"					 palc_old_cc_code,
"
"				         palc_new_cc_code,
"
"				         palc_old_fab_item_type,
"
"				         palc_old_thickness,
"
"				         palc_old_length,
"
"				         palc_old_width,
"
"				         palc_old_height,
"
"				         palc_old_outer_dia,
"
"				         palc_old_inner_dia,
"
"				         palc_old_density,
"
"				         polc_fab_item_type,
"
"				         palc_thickness,
"
"				         palc_length,
"
"				         palc_width,
"
"				         palc_height,
"
"				         palc_outer_dia,
"
"				         palc_inner_dia,
"
"				         palc_density,
"
"				         palc_old_so_type,
"
"                                         palc_old_so_no,
"
"                                         palc_old_so_seq_no,
"
"                                         palc_old_so_schld_desc,
"
"				         palc_pr_no,
"
"				         palc_pr_seq_no
"
"					)
"
"                                  VALUES(p_bu,
"
"                                         p_plnt,
"
"                                         v_doc_no,
"
"                                         v_seq_no,
"
"                                         'C',
"
"                                         r_pol.pol_seq_no,
"
"                                         r_pol.pol_prod_id,
"
"                                         r_pol.pol_prod_rev,
"
"                                         r_pol.pol_prod_desc1,
"
"                                         r_pol.pol_prod_uom,
"
"                                         r_pol.pol_uom,
"
"                                         r_pol.pol_ordered_qty,
"
"									     r_ln.Cls_Qty,
"
"                                         r_pol.pol_sc_unit_cost,
"
"                                         r_pol.pol_sc_unit_cost,
"
"                                         NVL(r_pol.pol_disc_pct,0),
"
"                                         NVL(r_pol.pol_disc_amt,0),
"
"                                         NVL(r_pol.pol_disc_pct,0),
"
"										 ROUND ((r_ln.Cls_Qty * r_pol.pol_sc_unit_cost) * (NVL(r_pol.pol_disc_pct,0) / 100),2),
"
"                                         NULL,
"
"                                         'S',
"
"                                         p_user,
"
"                                         SYSDATE,
"
"                                         r_pol.pol_prod_cls,
"
"                                         r_pol.pol_prod_sub_cls,
"
"                                         --r_pol.pol_tax_set_id,
"
"                                         --r_pol.pol_tcf_id,
"
"                                         r_pol.pol_hsn_code,
"
"                                         r_pol.pol_gst_exempt_flag,
"
"                                         r_pol.pol_gst_input_type,
"
"                                        -- r_pol.pol_tax_set_id,
"
"                                        -- r_pol.pol_tcf_id,
"
"                                         r_pol.pol_hsn_code,
"
"                                         r_pol.pol_gst_exempt_flag,
"
"                                         r_pol.pol_gst_input_type,
"
"                                         r_pol.pol_origin,
"
"                                         r_pol.pol_cost_basis,
"
"                                         --r_pol.pols_pend_qty,
"
"                                         r_pol.pol_contr_pfx,
"
"                                         r_pol.pol_contract_id,
"
"                                         r_pol.pol_contr_amd_no,
"
"                                         r_pol.pol_suplr_prod_id,
"
"                                         r_pol.pol_suplr_prod_desc,
"
"                                         r_pol.pol_suplr_prod_id,
"
"                                         r_pol.pol_suplr_prod_desc,
"
"				         r_pol.pol_ref,
"
"				         r_pol.pol_ref,
"
"				         r_pol.pol_pur_acct,
"
"				         r_pol.pol_pur_acct,
"
"					 r_pol.pol_cc_code,
"
"				         r_pol.pol_cc_code,
"
"				         r_pol.pol_fab_item_type,
"
"				         r_pol.pol_thickness,
"
"				         r_pol.pol_length,
"
"				         r_pol.pol_width,
"
"				         r_pol.pol_height,
"
"				         r_pol.pol_prod_outer_dia,
"
"				         r_pol.pol_inner_dia,
"
"				         r_pol.pol_density,
"
"				         r_pol.pol_fab_item_type,
"
"				         r_pol.pol_thickness,
"
"				         r_pol.pol_length,
"
"				         r_pol.pol_width,
"
"				         r_pol.pol_height,
"
"				         r_pol.pol_prod_outer_dia,
"
"				         r_pol.pol_inner_dia,
"
"				         r_pol.pol_density,
"
"				         r_pol.pol_so_type,
"
"				         r_pol.pol_so_no,
"
"				         r_pol.pol_so_seq_no,
"
"				         r_pol.pol_so_schld_desc,
"
"				         r_pol.pol_pr_no,
"
"				         r_pol.pol_pr_seq_no
"
"					);
"
"
"
"        v_sub_seq_no := 0;
"
"
"
"	/*FOR r_sch IN c_sch(r_hd.pmcl_po_pfx,r_hd.pmcl_po_no,r_ln.pmcl_po_seq_no)
"
"	LOOP
"
"
"
"          OPEN c_pos(r_hd.pmcl_po_pfx,r_hd.pmcl_po_no,r_ln.pmcl_po_seq_no,r_sch.pmcl_po_sub_seq_no);
"
"          FETCH c_pos INTO r_pos;
"
"          CLOSE c_pos;
"
"
"
"	  v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	  INSERT INTO po_amend_sch_chnges(pasc_bu,
"
"                                          pasc_plnt,
"
"                                          pasc_doc_no,
"
"                                          pasc_seq_no,
"
"                                          pasc_sub_seq_no,
"
"                                          pasc_po_line_no,
"
"                                          pasc_po_schld_no,
"
"                                          pasc_store_dept_id,
"
"                                          pasc_store_name,
"
"                                          pasc_new_store_dept_id,
"
"                                          pasc_new_store_name,
"
"                                          pasc_old_sch_qty,
"
"                                          pasc_new_sch_qty,
"
"                                          pasc_old_rqrd_date,
"
"                                          pasc_new_rqrd_date,
"
"                                          pasc_so_pfx,
"
"                                          pasc_so_no,
"
"                                          pasc_so_seq_no,
"
"                                          pasc_so_sub_seq_no,
"
"                                          pasc_schld_desc,
"
"                                          pasc_new_so_pfx,
"
"                                          pasc_new_so_no,
"
"                                          pasc_new_so_seq_no,
"
"                                          pasc_new_so_sub_seq_no,
"
"                                          pasc_new_schld_desc,
"
"				          pasc_new_so_type,
"
"				          pasc_so_type,
"
"				          pasc_old_proj_id,
"
"				          pasc_old_task_id,
"
"				          pasc_new_proj_id,
"
"				          pasc_new_task_id,
"
"                                          pasc_source_flag,
"
"                                          pasc_cre_by,
"
"                                          pasc_cre_date
"
"					 )
"
"                                   VALUES(p_bu,
"
"                                          p_plnt,
"
"                                          v_doc_no,
"
"                                          v_seq_no,
"
"                                          v_sub_seq_no,
"
"                                          r_ln.pmcl_po_seq_no,
"
"                                          r_pos.pols_sub_seq_no,
"
"                                          r_pos.pols_store_id,
"
"                                          r_pos.pols_store_name,
"
"                                          r_pos.pols_store_id,
"
"                                          r_pos.pols_store_name,
"
"                                          r_pos.pols_ordered_qty,
"
"                                          r_sch.pmcl_curr_cls_qty,
"
"                                          r_pos.pols_required_date,
"
"                                          r_pos.pols_required_date,
"
"                                          r_pos.pols_so_pfx,
"
"                                          r_pos.pols_so_no,
"
"                                          r_pos.pols_so_seq_no,
"
"                                          r_pos.pols_so_sub_seq_no,
"
"                                          r_pos.pols_so_schld_desc,
"
"                                          r_pos.pols_so_pfx,
"
"                                          r_pos.pols_so_no,
"
"                                          r_pos.pols_so_seq_no,
"
"                                          r_pos.pols_so_sub_seq_no,
"
"                                          r_pos.pols_so_schld_desc,
"
"				          r_pos.pols_so_type,
"
"				          r_pos.pols_so_type,
"
"				          r_pos.pols_proj_id,
"
"				          r_pos.pols_task_id,
"
"				          r_pos.pols_proj_id,
"
"				          r_pos.pols_task_id,
"
"                                          'S',
"
"                                          p_user,
"
"                                          SYSDATE
"
"					 );
"
"
"
"	  v_pr_seq_no := 0;*/
"
"
"
"	  /*FOR r_pr IN c_pr(r_hd.pmcl_po_pfx,r_hd.pmcl_po_no,r_ln.pmcl_po_seq_no)
"
"	  LOOP
"
"
"
"            v_pr_seq_no := v_pr_seq_no + 1;
"
"
"
"            INSERT INTO po_amend_sou_pr_lines(paspl_bu,
"
"                                              paspl_plnt,
"
"                                              paspl_doc_no,
"
"                                              paspl_seq_no,
"
"                                              paspl_sub_seq_no,
"
"                                              paspl_line_no,
"
"                                          --    paspl_pr_pfx,
"
"                                              paspl_pr_no,
"
"                                              paspl_pr_seq_no,
"
"                                              paspl_old_qty,
"
"                                              paspl_new_qty,
"
"                                              paspl_source_flag,
"
"                                              paspl_cre_by,
"
"                                              paspl_cre_date
"
"					     )
"
"                                       VALUES(p_bu,
"
"                                              p_plnt,
"
"                                              v_doc_no,
"
"                                              v_seq_no,
"
"                                              v_sub_seq_no,
"
"                                              v_pr_seq_no,1,
"
"                                            --  r_pr.prlso_rqst_pfx,
"
"                                              r_pr.prlso_rqst_no,
"
"                                              r_pr.prlso_seq_no,
"
"                                              r_pr.prlso_ordered_qty,
"
"                                              r_pr.prlso_ordered_qty,
"
"                                              'S',
"
"                                              p_user,
"
"                                              SYSDATE
"
"					     );
"
"          END LOOP c_pr; */
"
"
"
"	--END LOOP c_sch;
"
"
"
"     END LOOP c_ln;
"
"
"
"		FOR r_bud IN (SELECT *
"
"					FROM (
"
"					SELECT pah_bu,pah_plnt,pah_doc_no,pah_doc_date,palc_seq_no,palc_old_pur_acct,palc_old_cc_code,((((CASE WHEN palc_chnge_type IN ('A', 'M') THEN (palc_new_po_qty - palc_old_po_qty)
"
"                            WHEN (palc_old_po_qty - palc_new_po_qty) = 0 AND palc_chnge_type IN ('A', 'M') THEN 0
"
"                            WHEN palc_chnge_type = 'C' THEN -palc_new_po_qty END) * palc_new_unit_cost) - (CASE WHEN palc_chnge_type IN ('A', 'M') AND (palc_new_po_qty - palc_old_po_qty) < 0 THEN -palc_new_disc_amt WHEN palc_chnge_type = 'C' THEN -palc_new_disc_amt ELSE palc_new_disc_amt END)) * poh_exchange_rate ) amd_amt,palc_old_proj_id
"
"				  FROM po_amend_hd,
"
"					   po_amend_line_chnges,
"
"					   pur_order_hd
"
"				WHERE     pah_bu = palc_bu
"
"					 AND pah_plnt = palc_plnt
"
"					 AND pah_doc_no = palc_doc_no
"
"					 AND pah_bu = poh_bu
"
"					 AND pah_po_pfx = poh_order_pfx
"
"					 AND pah_po_no = poh_order_no
"
"					 AND palc_po_line_no IS NOT NULL
"
"					 AND pah_bu = p_bu
"
"					 AND pah_plnt = p_plnt
"
"					 AND pah_doc_no = v_doc_no
"
"					 AND poh_mode = 'PO')
"
"					ORDER BY amd_amt DESC)
"
"	LOOP
"
"
"
"	  pkg_budget.proc_upd_val_fr_xpns_cap_budget(p_bu,
"
"                                                 p_plnt,
"
"                                                 r_bud.pah_doc_date,
"
"                                                 func_find_year(p_bu,r_bud.pah_doc_date),
"
"                                                 func_find_period(p_bu,r_bud.pah_doc_date),
"
"                                                 'PA',
"
"                                                 r_bud.palc_old_pur_acct,
"
"                                                 r_bud.palc_old_cc_code,
"
"                                                 NULL,
"
"                                                 v_doc_no,
"
"                                                 r_bud.palc_seq_no,
"
"                                                 ROUND(r_bud.amd_amt,2),
"
"                                                 p_user,
"
"												 r_bud.palc_old_proj_id
"
"                                                );
"
"	END LOOP;
"
"
"
"      proc_upd_po_frm_po_amend(p_bu,p_plnt,v_doc_no,p_user,1);
"
"
"
"
"
"      UPDATE po_amend_hd
"
"         SET pah_status = 'A'
"
"       WHERE pah_bu = p_bu
"
"         AND pah_plnt = p_plnt
"
"	 AND pah_doc_no = v_doc_no;
"
"
"
"    END LOOP c_hd;
"
"
"
"  END proc_cre_cs_doc_frm_multi_cs;
"
"
"
"END pkg_po_amend;"
/
