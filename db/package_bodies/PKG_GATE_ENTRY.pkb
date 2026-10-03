CREATE OR REPLACE
"PACKAGE BODY pkg_gate_entry
"
"AS
"
"
"
"  PROCEDURE proc_ins_ge_barcode_dtls(p_bu	dc_hd.dchd_bu%TYPE,
"
"			             p_plnt	dc_hd.dchd_plnt%TYPE,
"
"			             p_doc_no	dc_hd.dchd_doc_no%TYPE,
"
"				     p_user	dc_hd.dchd_cre_by%TYPE,
"
"				     p_barcode	VARCHAR2
"
"			            )
"
"  AS
"
"
"
"    v_pos		NUMBER;
"
"    v_dc_no		dc_hd.dchd_dc_no%TYPE;
"
"    v_dc_seq_no		dc_ln.dcln_seq_no%TYPE;
"
"
"
"  BEGIN
"
"
"
"    v_pos := INSTR(p_barcode,'|');
"
"
"
"    IF v_pos = 0 THEN
"
"      v_dc_no := p_barcode;
"
"      v_dc_seq_no := NULL;
"
"    ELSE
"
"      v_dc_no := SUBSTR(p_barcode,1,v_pos-1);
"
"      v_dc_seq_no := SUBSTR(p_barcode,v_pos+1);
"
"    END IF;
"
"
"
"    INSERT INTO gate_entry_barcode_dc_dtls(gebdd_bu,
"
"				           gebdd_plnt,
"
"				           gebdd_doc_no,
"
"				           gebdd_seq_no,
"
"				           gebdd_dc_doc_no,
"
"				           gebdd_dc_no,
"
"				           gebdd_dc_seq_no,
"
"					   gebdd_prod_id,
"
"					   gebdd_prod_rev,
"
"					   gebdd_uom,
"
"					   gebdd_sf_code,
"
"					   gebdd_prod_ord_no,
"
"					   gebdd_qty,
"
"					   gebdd_proc_qty,
"
"					   gebdd_sc_oper,
"
"					   gebdd_unit_cost,
"
"					   gebdd_store_id,
"
"					   gebdd_ord_pfx,
"
"					   gebdd_ord_no,
"
"					   gebdd_ord_seq_no,
"
"					   gebdd_ord_sub_seq_no,
"
"				           gebdd_cre_by,
"
"				           gebdd_cre_date
"
"					  )
"
"    SELECT p_bu,p_plnt,p_doc_no,ROWNUM,dchd_doc_no,dchd_dc_no,dcln_seq_no,
"
"           dcln_prod_id,dcln_prod_rev,dcln_uom,dcln_sf_code,dcln_prod_ord_no,
"
"	   dcln_qty - (dcln_compld_qty + dcln_cons_inproc_qty),
"
"	   dcln_qty - (dcln_compld_qty + dcln_cons_inproc_qty),
"
"	   CASE WHEN dcln_sf_code IS NOT NULL THEN 'P' ELSE 'U' END,
"
"	   dcln_sc_unit_cost,dcln_store_id,
"
"	   dcln_source_doc_pfx,dcln_source_doc_no,dcln_source_seq_no,dcln_source_sub_seq_no,
"
"	   p_user,SYSDATE
"
"      FROM dc_hd,dc_ln
"
"     WHERE dchd_bu = dcln_bu
"
"       AND dchd_plnt = dcln_plnt
"
"       AND dchd_doc_no = dcln_doc_no
"
"       AND dchd_bu = p_bu
"
"       AND dchd_plnt = p_plnt
"
"       AND dchd_dc_no = v_dc_no
"
"       AND (dcln_seq_no = v_dc_seq_no OR v_dc_seq_no IS NULL);
"
"
"
"  END proc_ins_ge_barcode_dtls;
"
"
"
"  PROCEDURE proc_ins_ge_dc_dtls(p_bu		dc_hd.dchd_bu%TYPE,
"
"			        p_plnt		dc_hd.dchd_plnt%TYPE,
"
"			        p_doc_no	dc_hd.dchd_doc_no%TYPE,
"
"			        p_user		dc_hd.dchd_cre_by%TYPE
"
"                               )
"
"  AS
"
"    CURSOR c_dc_dtls IS
"
"    SELECT *
"
"      FROM gate_entry_barcode_dc_dtls
"
"     WHERE gebdd_bu = p_bu
"
"       AND gebdd_plnt = p_plnt
"
"       AND gebdd_doc_no = p_doc_no
"
"       AND gebdd_sel_flag = 'Y'
"
"       AND gebdd_sel_user = p_user;
"
"
"
"    CURSOR c_ord_dtls(c_ord_pfx		pur_order_hd.poh_order_pfx%TYPE,
"
"                      c_ord_no		pur_order_hd.poh_order_no%TYPE,
"
"	              c_ord_seq_no	pur_order_ln.pol_seq_no%TYPE) IS
"
"    SELECT *
"
"      FROM pur_order_so_view
"
"     WHERE posv_bu = p_bu
"
"       AND posv_plnt = p_plnt
"
"       AND posv_ord_pfx = c_ord_pfx
"
"       AND posv_ord_no = c_ord_no
"
"       AND posv_ord_seq_no = c_ord_seq_no;
"
"
"
"    CURSOR c_gel_dtls(c_suplr_id	suppliers.suplr_suplr_id%TYPE) IS
"
"    SELECT *
"
"      FROM gate_entry_ln
"
"     WHERE geln_bu = p_bu
"
"       AND geln_plnt = p_plnt
"
"       AND geln_doc_no = p_doc_no
"
"       AND geln_suplr_id = c_suplr_id;
"
"
"
"    r_gel_dtls	c_gel_dtls%ROWTYPE;
"
"
"
"    v_seq_no		gate_entry_ln.geln_seq_no%TYPE;
"
"    v_sub_seq_no	gate_entry_details.gedl_sub_seq_no%TYPE;
"
"    v_mat_type		gate_entry_details.gedl_mat_type%TYPE;
"
"
"
"    v_prod_uom		products.prod_uom%TYPE;
"
"    v_uom		products.prod_uom%TYPE;
"
"
"
"    v_store_id		stores.store_id%TYPE;
"
"    v_unit_cost		NUMBER(17,5);
"
"    v_conv_factor	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    FOR r_dc_dtls IN c_dc_dtls
"
"    LOOP
"
"
"
"      FOR r_ord_dtls IN c_ord_dtls(r_dc_dtls.gebdd_ord_pfx,
"
"                                   r_dc_dtls.gebdd_ord_no,
"
"				   r_dc_dtls.gebdd_ord_seq_no)
"
"      LOOP
"
"
"
"	BEGIN
"
"	  SELECT geln_seq_no
"
"	    INTO v_seq_no
"
"            FROM gate_entry_ln
"
"           WHERE geln_bu = p_bu
"
"             AND geln_plnt = p_plnt
"
"             AND geln_doc_no = p_doc_no
"
"             AND geln_suplr_id = r_ord_dtls.posv_suplr;
"
"	EXCEPTION
"
"	  WHEN OTHERS THEN v_seq_no := NULL;
"
"	END;
"
"
"
"	IF v_seq_no IS NULL THEN
"
"
"
"	  SELECT NVL(MAX(geln_seq_no),0)+1
"
"	    INTO v_seq_no
"
"	    FROM gate_entry_ln
"
"	   WHERE geln_bu = p_bu
"
"	     AND geln_plnt = p_plnt
"
"	     AND geln_doc_no = p_doc_no;
"
"
"
"	  INSERT INTO gate_entry_ln(geln_bu,
"
"			            geln_plnt,
"
"			            geln_doc_no,
"
"			            geln_seq_no,
"
"			            geln_status,
"
"			            geln_suplr_id,
"
"			            geln_suplr_name,
"
"			            geln_dc_no,
"
"			            geln_dc_date,
"
"			            geln_cre_by,
"
"			            geln_cre_date
"
"				   )
"
"		             VALUES(p_bu,
"
"			            p_plnt,
"
"				    p_doc_no,
"
"				    v_seq_no,
"
"				    'N',
"
"				    r_ord_dtls.posv_suplr,
"
"				    r_ord_dtls.posv_suplr_name,
"
"				    NULL,
"
"				    NULL,
"
"				    p_user,
"
"				    SYSDATE
"
"				   );
"
"        END IF;
"
"
"
"        IF r_dc_dtls.gebdd_sc_oper = 'U' AND r_dc_dtls.gebdd_sf_code IS NULL THEN
"
"          v_mat_type := 'US';
"
"        ELSIF r_dc_dtls.gebdd_sc_oper = 'U' AND r_dc_dtls.gebdd_sf_code IS NOT NULL THEN
"
"          v_mat_type := 'UP';
"
"        ELSE
"
"          v_mat_type := 'PR';
"
"        END IF;
"
"
"
"        IF v_mat_type = 'PR' THEN
"
"          v_prod_uom := r_ord_dtls.posv_prod_uom;
"
"	  v_uom := r_ord_dtls.posv_uom;
"
"	  v_conv_factor := r_ord_dtls.posv_conv_factor;
"
"	  v_unit_cost := r_ord_dtls.posv_unit_cost;
"
"	  v_store_id := r_ord_dtls.posv_store_id;
"
"        ELSE
"
"          v_prod_uom := r_dc_dtls.gebdd_uom;
"
"	  v_uom := r_dc_dtls.gebdd_uom;
"
"	  v_conv_factor := 1;
"
"	  v_unit_cost := r_dc_dtls.gebdd_unit_cost;
"
"	  v_store_id := r_dc_dtls.gebdd_store_id;
"
"        END IF;
"
"
"
"        UPDATE gate_entry_details
"
"           SET gedl_qty = gedl_qty + r_dc_dtls.gebdd_proc_qty,
"
"	       gedl_upd_by = p_user,
"
"	       gedl_upd_date = SYSDATE
"
"         WHERE gedl_bu = p_bu
"
"           AND gedl_plnt = p_plnt
"
"	   AND gedl_doc_no = p_doc_no
"
"	   AND gedl_seq_no = v_seq_no
"
"	   AND gedl_mat_type = v_mat_type
"
"	   AND gedl_prod_id = r_dc_dtls.gebdd_prod_id
"
"	   AND gedl_prod_rev = r_dc_dtls.gebdd_prod_rev
"
"	   AND gedl_po_pfx = r_ord_dtls.posv_ord_pfx
"
"	   AND gedl_po_no = r_ord_dtls.posv_ord_no
"
"	   AND gedl_po_seq_no = r_ord_dtls.posv_ord_seq_no;
"
"
"
"        IF SQL%NOTFOUND THEN
"
"
"
"          SELECT NVL(MAX(gedl_sub_seq_no),0)+1
"
"	    INTO v_sub_seq_no
"
"	    FROM gate_entry_details
"
"	   WHERE gedl_bu = p_bu
"
"             AND gedl_plnt = p_plnt
"
"	     AND gedl_doc_no = p_doc_no
"
"	     AND gedl_seq_no = v_seq_no;
"
"
"
"	  INSERT INTO gate_entry_details(gedl_bu,
"
"	                                 gedl_plnt,
"
"	  			         gedl_doc_no,
"
"	  			         gedl_seq_no,
"
"	  			         gedl_sub_seq_no,
"
"	  			         gedl_mat_type,
"
"	  			         gedl_prod_id,
"
"	  			         gedl_prod_rev,
"
"	  			         gedl_prod_uom,
"
"	  			         gedl_uom,
"
"	  			         gedl_conv_factor,
"
"	  			         gedl_qty,
"
"	  			         gedl_store_id,
"
"	  			         gedl_po_pfx,
"
"	  			         gedl_po_no,
"
"	  			         gedl_po_seq_no,
"
"	  			         gedl_unit_cost,
"
"	  			         gedl_status,
"
"	  			         gedl_prod_desc1,
"
"	  			         gedl_prod_ord_no,
"
"	  			         gedl_sf_code,
"
"	  			         gedl_dc_doc_no,
"
"	  			         gedl_dc_no,
"
"	  			         gedl_dc_seq_no,
"
"	  			         gedl_so_type,
"
"	  			         gedl_so_pfx,
"
"	  			         gedl_so_no,
"
"	  			         gedl_so_seq_no,
"
"	  			         gedl_so_sub_seq_no,
"
"	  			         gedl_so_schld_desc,
"
"	  			         gedl_lot_no,
"
"	  			         gedl_ser_no,
"
"	  			         gedl_sys_ls_no,
"
"	  			         gedl_cre_by,
"
"	  			         gedl_cre_date
"
"	  			        )
"
"	  			  VALUES(p_bu,
"
"	  			         p_plnt,
"
"	  			         p_doc_no,
"
"	  			         v_seq_no,
"
"	  			         v_sub_seq_no,
"
"	  			         v_mat_type,
"
"	  			         r_dc_dtls.gebdd_prod_id,
"
"	  			         r_dc_dtls.gebdd_prod_rev,
"
"	  			         v_prod_uom,
"
"	  			         v_uom,
"
"	  			         v_conv_factor,
"
"	  			         r_dc_dtls.gebdd_proc_qty,
"
"	  			         v_store_id,
"
"	  			         r_ord_dtls.posv_ord_pfx,
"
"	  			         r_ord_dtls.posv_ord_no,
"
"	  			         r_ord_dtls.posv_ord_seq_no,
"
"	  			         v_unit_cost,
"
"	  			         'N',
"
"	  			         func_find_prod_desc(p_bu,r_dc_dtls.gebdd_prod_id,r_dc_dtls.gebdd_prod_rev,1),
"
"	  			         r_dc_dtls.gebdd_prod_ord_no,
"
"	  			         r_dc_dtls.gebdd_sf_code,
"
"	  			         r_dc_dtls.gebdd_dc_doc_no,
"
"	  			         r_dc_dtls.gebdd_dc_no,
"
"	  			         r_dc_dtls.gebdd_dc_seq_no,
"
"	  			         r_ord_dtls.posv_so_type,
"
"	  			         r_ord_dtls.posv_so_pfx,
"
"	  			         r_ord_dtls.posv_so_no,
"
"	  			         r_ord_dtls.posv_so_seq_no,
"
"	  			         r_ord_dtls.posv_so_sub_seq_no,
"
"	  			         r_ord_dtls.posv_so_schld_desc,
"
"	  			         r_ord_dtls.posv_lot_no,
"
"	  			         r_ord_dtls.posv_ser_no,
"
"	  			         r_ord_dtls.posv_sys_ls_no,
"
"	  			         p_user,
"
"	  			         SYSDATE
"
"	  			        );
"
"
"
"          FOR r_proc IN (SELECT scop_sub_seq_no,scop_process,scop_oprn_seq_no,
"
"	                        scop_lab_cost,scop_ls_req_flag
"
"	                   FROM sub_contr_ord_process
"
"			  WHERE scop_bu = p_bu
"
"			    AND scop_ord_pfx = r_ord_dtls.posv_ord_pfx
"
"			    AND scop_ord_no = r_ord_dtls.posv_ord_no
"
"			    AND scop_seq_no = r_ord_dtls.posv_ord_seq_no
"
"			  ORDER BY scop_sub_seq_no)
"
"	  LOOP
"
"
"
"	    INSERT INTO gate_entry_dtls_process(gedp_bu,
"
"	                                        gedp_plnt,
"
"					        gedp_doc_no,
"
"					        gedp_doc_seq_no,
"
"					        gedp_doc_sub_seq_no,
"
"					        gedp_seq_no,
"
"					        gedp_oprn_seq_no,
"
"					        gedp_process,
"
"					        gedp_proc_cost,
"
"					        gedp_ls_req_flag,
"
"					        gedp_cre_by,
"
"					        gedp_cre_date
"
"					       )
"
"			                 VALUES(p_bu,
"
"				                p_plnt,
"
"				                p_doc_no,
"
"			                        v_seq_no,
"
"			                        v_sub_seq_no,
"
"					        r_proc.scop_sub_seq_no,
"
"					        r_proc.scop_oprn_seq_no,
"
"					        r_proc.scop_process,
"
"					        r_proc.scop_lab_cost,
"
"					        r_proc.scop_ls_req_flag,
"
"				                p_user,
"
"				                SYSDATE
"
"				               );
"
"
"
"	  END LOOP;
"
"
"
"	END IF;
"
"
"
"	UPDATE pur_order_ln
"
"           SET pol_proc_qty = pol_proc_qty + r_dc_dtls.gebdd_proc_qty,
"
"	       pol_upd_by = p_user,
"
"	       pol_upd_date = SYSDATE
"
"         WHERE pol_bu = p_bu
"
"	   AND pol_order_no = r_ord_dtls.posv_ord_no
"
"	   AND pol_seq_no = r_ord_dtls.posv_ord_seq_no;
"
"
"
"      END LOOP c_ord_dtls;
"
"
"
"    END LOOP c_dc_dtls;
"
"
"
"    DELETE FROM gate_entry_barcode_dc_dtls
"
"     WHERE gebdd_bu = p_bu
"
"       AND gebdd_plnt = p_plnt
"
"       AND gebdd_doc_no = p_doc_no;
"
"
"
"  END proc_ins_ge_dc_dtls;
"
"
"
"END pkg_gate_entry;"
/
