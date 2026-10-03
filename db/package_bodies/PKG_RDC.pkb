CREATE OR REPLACE
"PACKAGE BODY pkg_rdc
"
"AS
"
"  PROCEDURE proc_fetch_rdc_frm_ge(p_bu		VARCHAR2,
"
"                                  p_plnt	VARCHAR2,
"
"				  p_doc_no	VARCHAR2,
"
"				  p_user	VARCHAR2
"
"				 )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM gate_entryout_ln_temp
"
"     WHERE gelt_bu = p_bu
"
"       AND gelt_plnt = p_plnt
"
"       AND gelt_doc_no = p_doc_no;
"
"
"
"    INSERT INTO gate_entryout_ln_temp(gelt_bu,
"
"                                      gelt_plnt,
"
"                                      gelt_doc_no,
"
"                                      gelt_suplr_id,
"
"                                      gelt_suplr_name,
"
"                                      gelt_date,
"
"                                      gelt_dc_no,
"
"                                      gelt_type,
"
"                                      gelt_prod_id,
"
"                                      gelt_prod_rev,
"
"                                      gelt_prod_desc,
"
"                                      gelt_uom,
"
"                                      gelt_qty,
"
"				      gelt_unit_cost,
"
"                                      gelt_cre_by,
"
"                                      gelt_cre_date,
"
"                                      gelt_source_doc_pfx,
"
"                                      gelt_source_doc_no,
"
"                                      gelt_return_flag,
"
"                                      gelt_source_seq_no,
"
"                                      gelt_source_sub_seq_no,
"
"                                      gelt_mi_doc_no,
"
"                                      gelt_sel_flag,
"
"                                      gelt_seq_no,
"
"                                      gelt_sub_seq_no,
"
"                                      gelt_other_type,
"
"                                      gelt_dc_doc_no,
"
"				      gelt_dc_seq_no,
"
"                                      gelt_ref_unit,
"
"                                      gelt_ins_sel_flag,
"
"                                      gelt_source_from
"
"				     )
"
"    SELECT p_bu,p_plnt,p_doc_no,dchd_suplr_id,func_find_party_name(dchd_bu,dchd_suplr_id,1),dchd_date,dchd_dc_no,dchd_type,dcln_prod_id,dcln_prod_rev,
"
"           dcln_prod_desc1,dcln_uom,(dcln_qty - (dcln_compld_qty + dcln_cons_inproc_qty)),dcln_sc_unit_cost,p_user,SYSDATE,dcln_source_doc_pfx,dcln_source_doc_no,
"
"	   DECODE(dchd_return_flag,'R','Returnable(As Is)','C', 'Returnable(Conversion)','N', 'Non-Returnable','B', 'Both'),
"
"	   dcln_source_seq_no,dcln_source_sub_seq_no,dcln_mi_doc_no,'N',ROWNUM,1,dchd_other_type,dchd_doc_no,dcln_seq_no,dchd_ref_unit,'Y',dchd_source_frm
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
"       AND dchd_status = 'L'
"
"       AND dcln_rtn_flag <> 'N'
"
"       AND dchd_other_type = 'S'
"
"       AND (dcln_qty - (dcln_compld_qty + dcln_cons_inproc_qty)) > 0
"
"       AND EXISTS (SELECT 1
"
"                     FROM gate_entry_ln
"
"                    WHERE geln_bu = p_bu
"
"                      AND geln_plnt = p_plnt
"
"                      AND geln_doc_no = p_doc_no
"
"                      AND geln_suplr_id = dchd_suplr_id);
"
"
"
"    Commit;
"
"
"
"  END proc_fetch_rdc_frm_ge;
"
"
"
"  PROCEDURE proc_ins_rdc_frm_ge(p_bu		VARCHAR2,
"
"                                p_plnt		VARCHAR2,
"
"				p_doc_no	VARCHAR2,
"
"				p_user		VARCHAR2
"
"			       )
"
"  AS
"
"    CURSOR c1 IS
"
"    SELECT gelt_suplr_id,gelt_suplr_name
"
"      FROM gate_entryout_ln_temp
"
"     WHERE gelt_bu = p_bu
"
"       AND gelt_plnt = p_plnt
"
"       AND gelt_doc_no = p_doc_no
"
"       AND gelt_sel_flag = 'Y'
"
"     GROUP BY gelt_suplr_id,gelt_suplr_name;
"
"
"
"    CURSOR c2(c_suplr_id	VARCHAR2) IS
"
"    SELECT *
"
"      FROM gate_entryout_ln_temp
"
"     WHERE gelt_bu = p_bu
"
"       AND gelt_plnt = p_plnt
"
"       AND gelt_doc_no = p_doc_no
"
"       AND gelt_sel_flag = 'Y'
"
"       AND gelt_suplr_id = c_suplr_id;
"
"
"
"    v_ge_seq_no		NUMBER;
"
"    v_ge_sub_seq_no	NUMBER;
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
"      BEGIN
"
"        SELECT geln_seq_no INTO v_ge_seq_no
"
"          FROM gate_entry_ln
"
"         WHERE geln_bu = p_bu
"
"           AND geln_plnt = p_plnt
"
"	   AND geln_doc_no = p_doc_no
"
"	   AND geln_suplr_id = cr1.gelt_suplr_id;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"
"
"	  SELECT NVL(MAX(geln_seq_no),0) + 1 INTO v_ge_seq_no
"
"            FROM gate_entry_ln
"
"           WHERE geln_bu = p_bu
"
"             AND geln_plnt = p_plnt
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
"			            geln_cre_by,
"
"			            geln_cre_date,
"
"			            geln_io_type
"
"			           )
"
"           		     VALUES(p_bu,
"
"				    p_plnt,
"
"			            p_doc_no,
"
"			            v_ge_seq_no,
"
"			            'N',
"
"			            cr1.gelt_suplr_id,
"
"			            cr1.gelt_suplr_name,
"
"			            p_user,
"
"			            SYSDATE,
"
"			            'I'
"
"				   );
"
"      END;
"
"
"
"      SELECT NVL(MAX(gedl_sub_seq_no),0) INTO v_ge_sub_seq_no
"
"        FROM gate_entry_details
"
"       WHERE gedl_bu = p_bu
"
"         AND gedl_plnt = p_plnt
"
"	 AND gedl_doc_no = p_doc_no
"
"	 AND gedl_seq_no = v_ge_seq_no;
"
"
"
"      FOR cr2 IN c2(cr1.gelt_suplr_id)
"
"      LOOP
"
"
"
"        v_ge_sub_seq_no := v_ge_sub_seq_no + 1;
"
"
"
"	INSERT INTO gate_entry_details(gedl_bu,
"
"				       gedl_plnt,
"
"				       gedl_doc_no,
"
"				       gedl_seq_no,
"
"				       gedl_sub_seq_no,
"
"				       gedl_mat_type,
"
"				       gedl_prod_id,
"
"				       gedl_prod_rev,
"
"				       gedl_uom,
"
"				       gedl_prod_uom,
"
"				       gedl_conv_factor,
"
"				       gedl_qty,
"
"				       gedl_unit_cost,
"
"				       gedl_status,
"
"				       gedl_prod_desc1,
"
"				       gedl_store_id,
"
"				       gedl_dc_doc_no,
"
"				       gedl_dc_no,
"
"				       gedl_dc_seq_no,
"
"				       gedl_po_pfx,
"
"				       gedl_po_no,
"
"				       gedl_po_seq_no,
"
"				       gedl_po_sub_seq_no,
"
"				       gedl_cre_by,
"
"				       gedl_cre_date
"
"                                      )
"
"			        VALUES(p_bu,
"
"				       p_plnt,
"
"				       p_doc_no,
"
"				       v_ge_seq_no,
"
"				       v_ge_sub_seq_no,
"
"				       'RDC',
"
"				       cr2.gelt_prod_id,
"
"				       cr2.gelt_prod_rev,
"
"				       cr2.gelt_uom,
"
"				       cr2.gelt_uom,
"
"				       1,
"
"				       cr2.gelt_proc_qty,
"
"				       cr2.gelt_unit_cost,
"
"				       'N',
"
"				       cr2.gelt_prod_desc,
"
"				       cr2.gelt_suplr_id,
"
"				       cr2.gelt_dc_doc_no,
"
"				       cr2.gelt_dc_no,
"
"				       cr2.gelt_dc_seq_no,
"
"				       cr2.gelt_source_doc_pfx,
"
"				       cr2.gelt_source_doc_no,
"
"				       cr2.gelt_source_seq_no,
"
"				       cr2.gelt_source_sub_seq_no,
"
"				       p_user,
"
"				       SYSDATE
"
"				      );
"
"
"
"	/*UPDATE dc_ln
"
"	   SET dcln_cons_inproc_qty = dcln_cons_inproc_qty + cr2.gelt_proc_qty
"
"	 WHERE dcln_bu = p_bu
"
"	   AND dcln_plnt = p_plnt
"
"	   AND dcln_doc_no = cr2.gelt_dc_doc_no
"
"	   AND dcln_seq_no = cr2.gelt_dc_seq_no;*/
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
"  END proc_ins_rdc_frm_ge;
"
"
"
"END pkg_rdc;"
/
