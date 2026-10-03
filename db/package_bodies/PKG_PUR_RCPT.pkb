CREATE OR REPLACE
"PACKAGE BODY pkg_pur_rcpt
"
"AS
"
"
"
"  PROCEDURE proc_rev_subcontr_stks
"
"  (p_bu			pur_ord_receipt_ln.porl_bu%TYPE,
"
"   p_rcpt_pfx		VARCHAR2 DEFAULT NULL,
"
"   p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"   p_rcpt_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"   p_store_id		stores.store_id%TYPE,
"
"   p_ord_pfx		VARCHAR2,
"
"   p_ord_no		VARCHAR2,
"
"   p_vou_date		DATE,
"
"   p_vou_year		NUMBER,
"
"   p_vou_period		NUMBER,
"
"   p_cost_method	VARCHAR2,
"
"   p_upd_ref		VARCHAR2,
"
"   p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"  )
"
"  AS
"
"    v_unit_cost		NUMBER;
"
"    v_store_id		VARCHAR2(10);
"
"    v_lot_qty		NUMBER;
"
"  BEGIN
"
"
"
"    FOR cr1 IN (SELECT *
"
"                  FROM pur_ord_receipt_hd,
"
"		       pur_ord_receipt_ln,
"
"		       pur_rcpt_lot_serial
"
"		 WHERE porh_bu = porl_bu
"
"		   AND porh_receipt_no = porl_receipt_no
"
"		   AND prcls_bu(+) = porl_bu
"
"		   AND prcls_doc_no(+) = porl_receipt_no
"
"		   AND prcls_doc_seq_no(+) = porl_seq_no
"
"		   AND porl_bu = p_bu
"
"		   AND porl_receipt_no = p_rcpt_no
"
"		   AND porl_seq_no = p_rcpt_seq_no)
"
"    LOOP
"
"
"
"      IF cr1.porl_status = 'R' THEN
"
"	v_lot_qty := ROUND(NVL(cr1.prcls_qty_accepted + cr1.prcls_aod_qty,
"
"	                       cr1.porl_accepted_qty + cr1.porl_aod_qty)/cr1.porl_conv_factor,3);
"
"      ELSE
"
"	v_lot_qty := ROUND(NVL(cr1.prcls_lot_qty,cr1.porl_receipt_qty)/cr1.porl_conv_factor,3);
"
"      END IF;
"
"
"
"      v_unit_cost := (cr1.porl_scon_mat_unit_cost + cr1.porl_sc_chrg_amt + cr1.porl_bc_land_cost + cr1.porl_bc_oh_cost + cr1.porl_ap_lc_chrg_amt) * cr1.porl_conv_factor;
"
"
"
"      IF v_lot_qty > 0 THEN
"
"
"
"        --v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,p_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr1.prcls_sys_ls_no);
"
"
"
"        proc_upd_sf_stocks(p_bu,
"
"		           cr1.porl_prod_ord_no,
"
"			   NULL,
"
"			   cr1.porl_tar_sf_code,
"
"			   p_store_id,
"
"			   cr1.porl_prod_id,
"
"			   cr1.porl_prod_rev,
"
"			   cr1.prcls_sys_ls_no,
"
"			   cr1.prcls_lot_no,
"
"			   cr1.prcls_serial_no,
"
"			   cr1.prcls_expiry_date,
"
"			   -v_lot_qty,
"
"			   0,
"
"			   v_unit_cost,
"
"			   cr1.porl_plnt,
"
"			   cr1.porh_suplr_id,
"
"			   'V',
"
"			   cr1.porl_so_pfx,
"
"			   cr1.porl_so_no,
"
"			   cr1.porl_so_seq_no,
"
"			   cr1.porl_so_sub_seq_no,
"
"			   p_ord_pfx,
"
"			   p_ord_no,
"
"			   p_rcpt_pfx,
"
"			   p_rcpt_no,
"
"			   cr1.porl_seq_no,
"
"			   cr1.porl_seq_no,
"
"			   p_vou_date,
"
"			   p_vou_year,
"
"			   p_vou_period,
"
"			   p_cost_method,
"
"			   'SRN',
"
"			   'SCM',
"
"			   cr1.porl_cls_id,
"
"			   cr1.porl_upd_ref1,
"
"			   p_upd_ref,
"
"			   v_unit_cost,
"
"			   v_unit_cost,
"
"			   'SC',
"
"			   p_user,
"
"			   NULL,
"
"			   p_type => cr1.porl_so_type,
"
"			   p_proj => cr1.porl_proj_id,
"
"			   p_task => cr1.porl_task_id,
"
"			   p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			   p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			   p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			   p_prod_grp_id => cr1.porl_prod_grp,
"
"			   p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			   p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			   p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			   p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			  );
"
"      END IF;
"
"
"
"      IF cr1.porl_status = 'R' AND cr1.porl_rejected_qty > 0 THEN
"
"        v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'J');
"
"	--v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr1.prcls_sys_ls_no);
"
"	v_lot_qty := ROUND(NVL(cr1.prcls_qty_rejected,cr1.porl_rejected_qty)/cr1.porl_conv_factor,3);
"
"	IF v_lot_qty > 0 THEN
"
"
"
"	  --v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev,v_store_id,cr1.porl_prod_ord_no,cr1.porl_tar_sf_code,cr1.prcls_sys_ls_no);
"
"
"
"	  proc_upd_sf_stocks(p_bu,
"
"		             cr1.porl_prod_ord_no,
"
"			     NULL,
"
"			     cr1.porl_tar_sf_code,
"
"			     v_store_id,
"
"			     cr1.porl_prod_id,
"
"			     cr1.porl_prod_rev,
"
"			     cr1.prcls_sys_ls_no,
"
"			     cr1.prcls_lot_no,
"
"			     cr1.prcls_serial_no,
"
"			     cr1.prcls_expiry_date,
"
"			     -v_lot_qty,
"
"			     0,
"
"			     v_unit_cost,
"
"			     cr1.porl_plnt,
"
"			     cr1.porh_suplr_id,
"
"			     'V',
"
"			     cr1.porl_so_pfx,
"
"			     cr1.porl_so_no,
"
"			     cr1.porl_so_seq_no,
"
"			     cr1.porl_so_sub_seq_no,
"
"			     p_ord_pfx,
"
"			     p_ord_no,
"
"			     p_rcpt_pfx,
"
"			     p_rcpt_no,
"
"			     cr1.porl_seq_no,
"
"			     cr1.porl_seq_no,
"
"			     p_vou_date,
"
"			     p_vou_year,
"
"			     p_vou_period,
"
"			     p_cost_method,
"
"			     'SRN',
"
"			     'SCM',
"
"			     cr1.porl_cls_id,
"
"			     cr1.porl_upd_ref1,
"
"			     p_upd_ref,
"
"			     v_unit_cost,
"
"			     v_unit_cost,
"
"			     'SC',
"
"			     p_user,
"
"			     NULL,
"
"			     p_type => cr1.porl_so_type,
"
"			     p_proj => cr1.porl_proj_id,
"
"			     p_task => cr1.porl_task_id,
"
"			     p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			     p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			     p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			     p_prod_grp_id => cr1.porl_prod_grp,
"
"			     p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			     p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			     p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			     p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			    );
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"    END LOOP;
"
"
"
"  END proc_rev_subcontr_stks;
"
"
"
"  PROCEDURE proc_rev_subcontr_queue
"
"  (p_bu			pur_ord_receipt_ln.porl_bu%TYPE,
"
"   p_rcpt_pfx		VARCHAR2 DEFAULT NULL,
"
"   p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"   p_rcpt_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"   p_user		pur_ord_receipt_ln.porl_cre_by%TYPE)
"
"  AS
"
"
"
"    CURSOR c_ls	IS
"
"    SELECT *
"
"      FROM pur_rcpt_lot_serial
"
"     WHERE prcls_bu = p_bu
"
"       AND prcls_doc_no = p_rcpt_no
"
"       AND prcls_doc_seq_no = p_rcpt_seq_no
"
"     ORDER BY prcls_seq_no;
"
"
"
"    r_ls		c_ls%ROWTYPE;
"
"
"
"    v_sou_oprn_seq_no	NUMBER;
"
"    v_tar_oprn_seq_no	NUMBER;
"
"    v_rej_oprn_seq_no	NUMBER;
"
"    v_sou_proc_id	VARCHAR2(10);
"
"    v_tar_proc_id	VARCHAR2(10);
"
"    v_rej_proc_id	VARCHAR2(10);
"
"
"
"    PROCEDURE proc_get_proc_id(p_plnt		IN	VARCHAR2,
"
"			       p_prod_ord_no	IN	VARCHAR2,
"
"			       p_oprn_seq_no	IN	NUMBER,
"
"			       p_proc_id	OUT	VARCHAR2)
"
"    AS
"
"    BEGIN
"
"      SELECT pror_oprn_id
"
"        INTO p_proc_id
"
"	FROM prod_order_routing
"
"       WHERE pror_bu = p_bu
"
"         AND pror_plnt = p_plnt
"
"	 AND pror_ord_no = p_prod_ord_no
"
"	 AND pror_seq_no = p_oprn_seq_no;
"
"    END;
"
"
"
"  BEGIN
"
"
"
"    FOR r_grn IN (SELECT *
"
"                    FROM pur_ord_receipt_hd,
"
"		         pur_ord_receipt_ln
"
"	           WHERE porh_bu = porl_bu
"
"		     AND porh_receipt_no = porl_receipt_no
"
"		     AND porl_bu = p_bu
"
"		     AND porl_receipt_no = p_rcpt_no
"
"		     AND porl_seq_no = p_rcpt_seq_no)
"
"    LOOP
"
"
"
"      SELECT INSTR(r_grn.porl_sf_code,'0',1)
"
"        INTO v_sou_oprn_seq_no
"
"        FROM DUAL;
"
"
"
"      IF INSTR(r_grn.porl_tar_sf_code,'0') = 0 THEN
"
"        SELECT INSTR(r_grn.porl_tar_sf_code,'1',-1)
"
"          INTO v_tar_oprn_seq_no
"
"          FROM DUAL;
"
"      ELSE
"
"        SELECT INSTR(r_grn.porl_tar_sf_code,'0',1)
"
"          INTO v_tar_oprn_seq_no
"
"          FROM DUAL;
"
"      END IF;
"
"
"
"      SELECT INSTR(r_grn.porl_tar_sf_code,'1',-1)
"
"        INTO v_rej_oprn_seq_no
"
"	FROM DUAL;
"
"
"
"      proc_get_proc_id(r_grn.porl_plnt,
"
"                       r_grn.porl_prod_ord_no,
"
"		       v_sou_oprn_seq_no,
"
"		       v_sou_proc_id
"
"		      );
"
"
"
"      proc_get_proc_id(r_grn.porl_plnt,
"
"                       r_grn.porl_prod_ord_no,
"
"		       v_tar_oprn_seq_no,
"
"		       v_tar_proc_id
"
"		      );
"
"
"
"      proc_get_proc_id(r_grn.porl_plnt,
"
"                       r_grn.porl_prod_ord_no,
"
"		       v_rej_oprn_seq_no,
"
"		       v_rej_proc_id
"
"		      );
"
"
"
"      IF /*p_rcpt_type = 'SP' AND*/ r_grn.porl_matl_type IN ('PR','SDS','CS','UP') THEN
"
"
"
"	Dbms_Output.Put_Line('Test-1');
"
"        proc_upd_oprn_status_qtys(p_bu,
"
"                                  r_grn.porl_plnt,
"
"				  r_grn.porl_plnt_loc_id,
"
"				  r_grn.porl_prod_ord_no,
"
"				  v_sou_proc_id,
"
"				  v_sou_oprn_seq_no,
"
"				  r_grn.porl_sf_code,
"
"				  CASE WHEN r_grn.porl_matl_type = 'UP' THEN -(r_grn.porl_accepted_qty/r_grn.porl_conv_factor) ELSE 0 END,
"
"				  0,
"
"				  ((r_grn.porl_accepted_qty + r_grn.porl_rejected_qty)/r_grn.porl_conv_factor),
"
"				  0,
"
"				  0,
"
"				  CASE WHEN r_grn.porl_matl_type <> 'UP' THEN -((r_grn.porl_accepted_qty + r_grn.porl_rejected_qty)/r_grn.porl_conv_factor) ELSE 0 END,
"
"				  0,
"
"				  0,
"
"				  0,
"
"				  0,
"
"				  0,
"
"				  0,
"
"				  0,
"
"				  CASE WHEN r_grn.porl_matl_type = 'UP' THEN -(r_grn.porl_accepted_qty/r_grn.porl_conv_factor) ELSE 0 END,
"
"				  r_grn.porl_po_sys_ls_no,
"
"				  r_grn.porl_po_lot_no,
"
"				  r_grn.porl_po_ser_no,
"
"				  NULL,
"
"				  'PR',
"
"				  p_user
"
"				 );
"
"      END IF;
"
"
"
"      OPEN c_ls;
"
"      FETCH c_ls INTO r_ls;
"
"        IF c_ls%NOTFOUND THEN
"
"	  IF r_grn.porl_accepted_qty > 0 AND r_grn.porl_matl_type NOT IN ('CS','UP') THEN
"
"	    Dbms_Output.Put_Line('Test-2');
"
"	  --Raise_Application_Error(-20999,'HRM '||v_tar_proc_id||'/'||r_grn.porl_po_sys_ls_no);
"
"	    proc_upd_oprn_status_qtys(p_bu,
"
"                                      r_grn.porl_plnt,
"
"				      r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_tar_proc_id,
"
"				      v_tar_oprn_seq_no,
"
"				      r_grn.porl_tar_sf_code,
"
"				     -(r_grn.porl_accepted_qty/r_grn.porl_conv_factor),
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'PR',
"
"				      p_user
"
"				     );
"
"	  END IF;
"
"
"
"	  IF r_grn.porl_rejected_qty > 0 AND r_grn.porl_matl_type NOT IN ('CS','UP') THEN
"
"            Dbms_Output.Put_Line('Test-3');
"
"            proc_upd_oprn_status_qtys(p_bu,
"
"                                      r_grn.porl_plnt,
"
"				      r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_rej_proc_id,
"
"				      v_rej_oprn_seq_no,
"
"				      r_grn.porl_tar_sf_code,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      -(r_grn.porl_rejected_qty/r_grn.porl_conv_factor),
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'PQC',
"
"				      p_user
"
"				     );
"
"
"
"
"
"          END IF;
"
"
"
"          IF r_grn.porl_rejected_qty > 0 AND r_grn.porl_matl_type = 'UP' THEN
"
"            Dbms_Output.Put_Line('Test-4');
"
"            proc_upd_oprn_status_qtys(p_bu,
"
"                                      r_grn.porl_plnt,
"
"				      r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_sou_proc_id,
"
"				      v_sou_oprn_seq_no,
"
"				      r_grn.porl_sf_code,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      -(r_grn.porl_rejected_qty/r_grn.porl_conv_factor),
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'UQC',
"
"				      p_user
"
"				     );
"
"
"
"          END IF;
"
"
"
"	  IF r_grn.porl_matl_type = 'CS' THEN
"
"
"
"            UPDATE prod_order_hd
"
"               SET prohd_cs_qty = prohd_cs_qty - ((r_grn.porl_accepted_qty + r_grn.porl_rejected_qty)/r_grn.porl_conv_factor),
"
"                   prohd_upd_by = p_user,
"
"                   prohd_upd_date = SYSDATE
"
"             WHERE prohd_bu = p_bu
"
"               AND prohd_plnt = r_grn.porl_plnt
"
"               AND prohd_ord_no = r_grn.porl_prod_ord_no;
"
"
"
"	    Dbms_Output.Put_Line('Test-5');
"
"            proc_upd_oprn_status_qtys(p_bu,
"
"                                      r_grn.porl_plnt,
"
"				      r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_tar_proc_id,
"
"				      v_tar_oprn_seq_no,
"
"				      r_grn.porl_tar_sf_code,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      -((r_grn.porl_accepted_qty + r_grn.porl_rejected_qty)/r_grn.porl_conv_factor),
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'PQC',
"
"				      p_user
"
"				     );
"
"
"
"          END IF;
"
"
"
"	ELSE
"
"
"
"	  LOOP
"
"
"
"	    IF r_grn.porl_accepted_qty > 0 AND r_grn.porl_matl_type NOT IN ('CS','UP') THEN
"
"
"
"	      Dbms_Output.Put_Line('Test-6');
"
"
"
"	      Dbms_Output.Put_Line(r_grn.porl_prod_ord_no||'/'||v_tar_proc_id||'/'||r_grn.porl_tar_sf_code||
"
"	                           '/'||-(r_grn.porl_accepted_qty/r_grn.porl_conv_factor)||'/'||
"
"				   r_grn.porl_po_sys_ls_no||'/'||r_grn.porl_po_lot_no);
"
"
"
"	      proc_upd_oprn_status_qtys(p_bu,
"
"                                        r_grn.porl_plnt,
"
"					r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_tar_proc_id,
"
"				      v_tar_oprn_seq_no,
"
"				      r_grn.porl_tar_sf_code,
"
"				     -(r_grn.porl_accepted_qty/r_grn.porl_conv_factor),
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'PR',
"
"				      p_user
"
"				     );
"
"	  END IF;
"
"
"
"	  IF r_grn.porl_rejected_qty > 0 AND r_grn.porl_matl_type NOT IN ('CS','UP') THEN
"
"
"
"	    Dbms_Output.Put_Line('Test-7');
"
"
"
"            proc_upd_oprn_status_qtys(p_bu,
"
"                                      r_grn.porl_plnt,
"
"				      r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_rej_proc_id,
"
"				      v_rej_oprn_seq_no,
"
"				      r_grn.porl_tar_sf_code,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      -(r_grn.porl_rejected_qty/r_grn.porl_conv_factor),
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'PQC',
"
"				      p_user
"
"				     );
"
"
"
"
"
"          END IF;
"
"
"
"          IF r_grn.porl_rejected_qty > 0 AND r_grn.porl_matl_type = 'UP' THEN
"
"
"
"	    Dbms_Output.Put_Line('Test-8');
"
"
"
"            proc_upd_oprn_status_qtys(p_bu,
"
"                                      r_grn.porl_plnt,
"
"				      r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_sou_proc_id,
"
"				      v_sou_oprn_seq_no,
"
"				      r_grn.porl_sf_code,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      -(r_grn.porl_rejected_qty/r_grn.porl_conv_factor),
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'UQC',
"
"				      p_user
"
"				     );
"
"
"
"          END IF;
"
"
"
"	  IF r_grn.porl_matl_type = 'CS' THEN
"
"
"
"            UPDATE prod_order_hd
"
"               SET prohd_cs_qty = prohd_cs_qty - ((r_grn.porl_accepted_qty + r_grn.porl_rejected_qty)/r_grn.porl_conv_factor),
"
"                   prohd_upd_by = p_user,
"
"                   prohd_upd_date = SYSDATE
"
"             WHERE prohd_bu = p_bu
"
"               AND prohd_plnt = r_grn.porl_plnt
"
"               AND prohd_ord_no = r_grn.porl_prod_ord_no;
"
"
"
"	    Dbms_Output.Put_Line('Test-9');
"
"
"
"            proc_upd_oprn_status_qtys(p_bu,
"
"                                      r_grn.porl_plnt,
"
"				      r_grn.porl_plnt_loc_id,
"
"				      r_grn.porl_prod_ord_no,
"
"				      v_tar_proc_id,
"
"				      v_tar_oprn_seq_no,
"
"				      r_grn.porl_tar_sf_code,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      0,
"
"				      -((r_grn.porl_accepted_qty + r_grn.porl_rejected_qty)/r_grn.porl_conv_factor),
"
"				      0,
"
"				      r_grn.porl_po_sys_ls_no,
"
"				      r_grn.porl_po_lot_no,
"
"				      r_grn.porl_po_ser_no,
"
"				      NULL,
"
"				      'PQC',
"
"				      p_user
"
"				     );
"
"
"
"          END IF;
"
"
"
"	    FETCH c_ls INTO r_ls;
"
"	    EXIT WHEN c_ls%NOTFOUND;
"
"	  END LOOP;
"
"
"
"	END IF;
"
"      CLOSE c_ls;
"
"
"
"    END LOOP;
"
"
"
"  END proc_rev_subcontr_queue;
"
"
"
"
"
"  PROCEDURE proc_valid_frm_pur_rcpt(p_bu	pur_ord_receipt_hd.porh_bu%TYPE,
"
"	                            p_plnt	pur_ord_receipt_hd.porh_plnt%TYPE,
"
"				    p_rcpt_pfx	pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                                    p_rcpt_no	pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"				    p_user	pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                                   )
"
"  AS
"
"
"
"  CURSOR c_prh IS
"
"  SELECT *
"
"    FROM pur_ord_receipt_hd
"
"   WHERE porh_bu = p_bu
"
"     AND porh_receipt_no = p_rcpt_no;
"
"
"
"  CURSOR c_prl IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_ln,products
"
"     WHERE prod_bu = porl_bu
"
"       AND prod_id = porl_prod_id
"
"       AND prod_rev = porl_prod_rev
"
"       AND porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_status <> 'C'
"
"     ORDER BY porl_seq_no;
"
"
"
"    CURSOR c_ls(c_seq_no NUMBER) IS
"
"    SELECT *
"
"      FROM pur_rcpt_lot_serial
"
"     WHERE prcls_bu = p_bu
"
"       AND prcls_doc_no = p_rcpt_no
"
"       AND prcls_doc_seq_no = c_seq_no
"
"     ORDER BY prcls_seq_no;
"
"
"
"    CURSOR c_prodplnt(c_plnt		VARCHAR2,
"
"                      c_prod_id		VARCHAR2,
"
"                      c_prod_rev	NUMBER) IS
"
"    SELECT *
"
"      FROM prod_plants
"
"     WHERE prodplnt_bu = p_bu
"
"       AND prodplnt_plnt = c_plnt
"
"       AND prodplnt_prod_id = c_prod_id
"
"       AND prodplnt_prod_rev = c_prod_rev;
"
"
"
"
"
"    r_prodplnt		c_prodplnt%ROWTYPE;
"
"
"
"    v_cnt		NUMBER;
"
"
"
"    v_base_curry	appl_control.applctrl_base_currency%TYPE;
"
"    v_jrnl_method	appl_control.applctrl_inv_method%TYPE;
"
"    v_jrnl_type     	glm_control.glmctrl_ps_jrnl_opt%TYPE;
"
"
"
"    v_pfx_count		NUMBER;
"
"
"
"    v_pm_dflt_store_id	stores.store_id%TYPE;
"
"    v_std_cost		NUMBER;
"
"
"
"  BEGIN
"
"
"
"    BEGIN
"
"      SELECT applctrl_base_currency,applctrl_inv_method INTO v_base_curry,v_jrnl_method
"
"        FROM appl_control
"
"       WHERE applctrl_bu = p_bu;
"
"    EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20999,'Application Control not defined.');
"
"    END;
"
"
"
"    BEGIN
"
"      SELECT glmctrl_ps_jrnl_opt INTO v_jrnl_type
"
"        FROM glm_control
"
"       WHERE glmctrl_bu = p_bu;
"
"    EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20999,'GLM Control not defined.');
"
"    END;
"
"
"
"    FOR r_prh IN c_prh
"
"    LOOP
"
"
"
"      IF r_prh.porh_jrnl_flag = 'N' AND (v_jrnl_type = 'G' OR v_jrnl_method IN ('T','S')) AND r_prh.porh_type <> 'SA' THEN
"
"        --Raise_Application_Error(-20999,'Journal should be create.');
"
"
"
"	DECLARE
"
"	  v_oth_charges		NUMBER;
"
"	  v_lc_tax		NUMBER;
"
"	  v_prod_lc_cnt		NUMBER;
"
"	  v_jrnl_flag		VARCHAR2(1);
"
"	BEGIN
"
"	IF r_prh.porh_tax_flag = 'N' THEN
"
"
"
"          SELECT COUNT(*) INTO v_oth_charges
"
"           FROM pr_oth_tax_charges
"
"          WHERE protc_bu = p_bu
"
"            AND protc_rcpt_no = p_rcpt_no;
"
"
"
"         SELECT COUNT(*) INTO v_lc_tax
"
"           FROM pur_rcpt_land_costs
"
"          WHERE prlc_bu = p_bu
"
"            AND prlc_rcpt_no = p_rcpt_no;
"
"
"
"         SELECT COUNT(*) INTO v_prod_lc_cnt
"
"           FROM pur_rcpt_prod_land_costs
"
"          WHERE prplc_bu = p_bu
"
"            AND prplc_rcpt_no = p_rcpt_no;
"
"
"
"          IF v_oth_charges > 0 OR v_lc_tax > 0 OR v_prod_lc_cnt > 0 THEN
"
"
"
"	    pkg_pur_rcpt.proc_upd_grn_lm_disc_amt(p_bu,p_rcpt_pfx,p_rcpt_no,p_user);
"
"            pkg_ot_chrgs.proc_ins_pr_oth_tax_chrgs(p_bu,p_plnt,p_rcpt_pfx,p_rcpt_no,p_user);
"
"            pkg_landed_cost.proc_ins_prod_lc_frm_pur_rcpt(p_bu,p_rcpt_no,p_user);
"
"            proc_upd_grn_charge(p_bu,p_plnt,p_rcpt_pfx,p_rcpt_no,p_user);
"
"
"
"	    UPDATE pur_ord_receipt_hd
"
"	       SET porh_tax_flag = 'Y'
"
"	     WHERE porh_bu = p_bu
"
"	       AND porh_receipt_no = p_rcpt_no;
"
"
"
"          END IF;
"
"	END IF;
"
"
"
"	IF (v_jrnl_method = 'D' AND v_jrnl_type = 'G') THEN
"
"	  proc_cre_pur_rcpt_jrnl(p_bu,p_plnt,p_plnt,p_rcpt_pfx,p_rcpt_no,p_user,1,v_jrnl_flag);
"
"	END IF;
"
"
"
"	IF v_jrnl_method IN ('T','S') THEN
"
"	  pkg_perpetual_journals.proc_ins_inward_jrnl_frm_grn(p_bu,p_plnt,p_rcpt_pfx,p_rcpt_no,NULL,p_user,1,v_jrnl_flag);
"
"	END IF;
"
"
"
"	IF v_jrnl_flag = 'Y' THEN
"
"	  UPDATE pur_ord_receipt_hd
"
"             SET porh_jrnl_flag = 'Y'
"
"           WHERE porh_bu = p_bu
"
"             AND porh_receipt_pfx = p_rcpt_pfx
"
"             AND porh_receipt_no = p_rcpt_no;
"
"	  Commit;
"
"	ELSE
"
"	  Raise_Application_Error(-20999,'Journal should be create.');
"
"	END IF;
"
"	END;
"
"      END IF;
"
"
"
"      IF (v_jrnl_type = 'G' OR v_jrnl_method IN ('T','S')) THEN
"
"        SELECT COUNT(apsta_pfx) INTO v_pfx_count
"
"          FROM appl_pfx_sub_types_asso,appl_doc_pfx_loc
"
"         WHERE apsta_bu = adpl_bu
"
"           AND apsta_pfx = adpl_pfx
"
"           AND apsta_bu = p_bu
"
"           AND apsta_vou_type = 'AJ'
"
"           AND apsta_sub_type = 'AJ'
"
"           AND apsta_plnt = p_plnt
"
"           AND adpl_loc_id = r_prh.porh_plnt_loc_id
"
"           AND adpl_dflt_loc = 'Y';
"
"        IF v_pfx_count = 0 THEN
"
"	  Raise_Application_Error(-20999,'Application Journal Pfx. not found.');
"
"	END IF;
"
"      END IF;
"
"
"
"      IF r_prh.porh_mode = 'SC' AND r_prh.porh_type = 'GRNSP' AND r_prh.porh_alloc_flag = 'N' THEN
"
"        Raise_Application_Error(-20006,'POM ');
"
"      END IF;
"
"
"
"      IF r_prh.porh_mode = 'PR' AND r_prh.porh_suplr_doc_no IS NULL THEN
"
"        Raise_Application_Error(-20999,'Supplier Bill No. must be entered.');
"
"      END IF;
"
"
"
"      IF r_prh.porh_mode = 'PR' AND r_prh.porh_suplr_doc_date IS NULL THEN
"
"        Raise_Application_Error(-20999,'Supplier Bill Date must be entered.');
"
"      END IF;
"
"
"
"      IF r_prh.porh_mode = 'SC' AND r_prh.porh_dc_no IS NULL THEN
"
"        Raise_Application_Error(-20999,'DC No. must be entered.');
"
"      END IF;
"
"
"
"      IF r_prh.porh_mode = 'SC' AND r_prh.porh_dc_date IS NULL THEN
"
"        Raise_Application_Error(-20999,'DC Date must be entered.');
"
"      END IF;
"
"
"
"      DECLARE
"
"        v_rej_cnt	NUMBER;
"
"      BEGIN
"
"      SELECT COUNT(*) INTO v_rej_cnt
"
"        FROM (
"
"      SELECT *
"
"        FROM pur_ord_receipt_ln,prod_plants_loc
"
"       WHERE ppl_bu = porl_bu
"
"         AND ppl_plnt = porl_plnt
"
"	 AND ppl_plnt_loc_id = porl_plnt_loc_id
"
"	 AND ppl_prod_id = porl_prod_id
"
"	 AND ppl_prod_rev = porl_prod_rev
"
"	 AND porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no
"
"	 AND porl_rejected_qty > 0
"
"	 AND porl_status <> 'C'
"
"	 AND ppl_rejt_store_id IS NULL);
"
"
"
"	IF v_rej_cnt > 0 THEN
"
"	  Raise_Application_Error(-20999,'Rejection W/H not found.');
"
"	END IF;
"
"      END;
"
"
"
"      DECLARE
"
"        v_pfx	VARCHAR2(10);
"
"	v_insp	VARCHAR2(20);
"
"      BEGIN
"
"
"
"      SELECT CASE WHEN porh_mode = 'PR' THEN func_find_vou_dflt_pfx(porl_bu,porl_plnt,porl_plnt_loc_id,'IR','IRPO')
"
"                  ELSE func_find_vou_dflt_pfx(porl_bu,porl_plnt,porl_plnt_loc_id,'IR','IRSCO') END ,
"
"	     func_get_qc_inspector(porl_bu,porl_plnt,porh_mode,porl_prod_id,porl_prod_rev,NULL) INTO v_pfx,v_insp
"
"        FROM pur_ord_receipt_hd,pur_ord_receipt_ln
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"	 AND porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no
"
"	 AND porl_status <> 'C'
"
"	 AND porl_qc_sel_flag = 'Y'
"
"	 AND ROWNUM = 1;
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
"
"      END;
"
"
"
"      DECLARE
"
"        v_mi_pfx	VARCHAR2(10);
"
"      BEGIN
"
"
"
"      SELECT func_find_vou_dflt_pfx(porh_bu,porh_plnt,porh_plnt_loc_id,'MIV','MIV') INTO v_mi_pfx
"
"        FROM pur_ord_receipt_hd
"
"       WHERE porh_bu = p_bu
"
"         AND porh_receipt_no = p_rcpt_no
"
"	 AND EXISTS(SELECT 1
"
"	              FROM pur_ord_receipt_ln
"
"		     WHERE porh_bu = porl_bu
"
"                       AND porh_receipt_no = porl_receipt_no
"
"	               AND porl_status <> 'C'
"
"	               AND porl_qc_sel_flag = 'N');
"
"
"
"      SELECT func_find_vou_dflt_pfx(porh_bu,porh_plnt,porh_plnt_loc_id,'MRV','MRV') INTO v_mi_pfx
"
"        FROM pur_ord_receipt_hd
"
"       WHERE porh_bu = p_bu
"
"         AND porh_receipt_no = p_rcpt_no
"
"	 AND EXISTS(SELECT 1
"
"	              FROM pur_ord_receipt_ln
"
"		     WHERE porh_bu = porl_bu
"
"                       AND porh_receipt_no = porl_receipt_no
"
"	               AND porl_status <> 'C'
"
"	               AND porl_qc_sel_flag = 'N')
"
"	AND EXISTS(SELECT 1
"
"	             FROM icm_control
"
"		    WHERE icmctrl_bu = p_bu
"
"		      AND icmctrl_auto_mtr_flag = 'Y');
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
"
"      END;
"
"
"
"      IF r_prh.porh_suplr_doc_no IS NOT NULL THEN
"
"        SELECT COUNT(*) INTO v_cnt
"
"          FROM pur_ord_receipt_hd_view
"
"         WHERE porh_bu = p_bu
"
"           AND porh_plnt = p_plnt
"
"           AND porh_suplr_id = r_prh.porh_suplr_id
"
"           AND porh_mode = r_prh.porh_mode
"
"           AND porh_suplr_doc_no = r_prh.porh_suplr_doc_no
"
"           AND porh_status <> 'C'
"
"           AND porh_year = func_find_year(p_bu,r_prh.porh_suplr_doc_date)
"
"           AND porh_receipt_no <> p_rcpt_no;
"
"	IF v_cnt > 0 THEN
"
"	  Raise_Application_Error(-20999,'POM Supplier Bill No. already exists');
"
"	END IF;
"
"      END IF;
"
"
"
"      /*SELECT COUNT(*) INTO v_suplr_doc_cnt
"
"        FROM pur_ord_receipt_hd,pur_rcpt_land_costs
"
"       WHERE porh_bu = prlc_bu
"
"         AND porh_receipt_no = prlc_rcpt_no
"
"         AND porh_bu = p_bu
"
"         AND porh_suplr_id = r_prh.porh_suplr_id
"
"         AND porh_receipt_pfx = p_rcpt_pfx
"
"         AND porh_receipt_no = p_rcpt_no
"
"         AND porh_suplr_doc_no = prlc_suplr_doc_no;
"
"
"
"      IF v_suplr_doc_cnt > 0 THEN
"
"        --Alert_Msg('Suplr. Bill Date/No. Should not be Same for Land Cost Bill Date/No.','S');
"
"      END IF;
"
"
"
"      SELECT COUNT(*) INTO v_lc_suplr_cnt
"
"        FROM pur_ord_receipt_hd,pur_rcpt_land_costs
"
"       WHERE porh_bu = prlc_bu
"
"         AND porh_receipt_no = prlc_rcpt_no
"
"         AND porh_bu = p_bu
"
"         AND porh_receipt_no = p_rcpt_no
"
"         AND prlc_type = 'S'
"
"         AND prlc_suplr_id IS NULL;
"
"
"
"      IF v_lc_suplr_cnt > 0 THEN
"
"        --Alert_Msg('Landed Cost Supplier not exists.','S');
"
"      END IF;*/
"
"
"
"      SELECT COUNT(porl_seq_no) INTO v_cnt
"
"        FROM pur_ord_receipt_hd_view,pur_ord_receipt_ln_view
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND porh_bu = p_bu
"
"         AND porh_receipt_no = p_rcpt_no
"
"         AND porl_status <> 'C'
"
"         AND porl_receipt_qty = porl_stock_receipt_qty
"
"         AND (porl_accepted_qty <> porl_stk_accepted_qty OR porl_rejected_qty <> porl_stk_rejected_qty OR porl_aod_qty <> porl_stk_aod_qty);
"
"
"
"      IF v_cnt > 0 THEN
"
"        Raise_Application_Error(-20999,'GRN Qty. mismatch with GRN Stock Qty.');
"
"      END IF;
"
"
"
"      IF r_prh.porh_currency <> v_base_curry THEN
"
"
"
"        SELECT COUNT(*) INTO v_cnt
"
"          FROM pur_rcpt_land_costs
"
"         WHERE prlc_bu = p_bu
"
"           AND prlc_rcpt_no = p_rcpt_no
"
"           AND prlc_suplr_doc_no IS NULL
"
"           AND prlc_tc_id IS NOT NULL
"
"           AND prlc_type NOT IN ('I','D','L');
"
"
"
"        IF v_cnt > 0 THEN
"
"      	  Raise_Application_Error(-20999,'Landed Cost Suplr. Bill No. must be entered.');
"
"        END IF;
"
"
"
"	SELECT COUNT(*) INTO v_cnt
"
"          FROM pur_rcpt_land_costs
"
"         WHERE prlc_bu = p_bu
"
"           AND prlc_rcpt_no = p_rcpt_no
"
"           AND prlc_suplr_doc_date IS NULL
"
"           AND prlc_tc_id IS NOT NULL
"
"           AND prlc_type NOT IN ('I','D','L');
"
"
"
"        IF v_cnt > 0 THEN
"
"      	  Raise_Application_Error(-20999,'Landed Cost Suplr. Bill Date must be entered.');
"
"        END IF;
"
"
"
"	SELECT COUNT(*) INTO v_cnt
"
"          FROM pur_imp_details
"
"         WHERE pid_bu = p_bu
"
"           AND pid_receipt_no = p_rcpt_no
"
"           AND pid_boe_no IS NULL;
"
"
"
"        IF v_cnt > 0 THEN
"
"      	  Raise_Application_Error(-20999,'Bill of Entry no. must be entered.'||p_rcpt_no);
"
"        END IF;
"
"
"
"	SELECT COUNT(*) INTO v_cnt
"
"          FROM pur_imp_details
"
"         WHERE pid_bu = p_bu
"
"           AND pid_receipt_no = p_rcpt_no
"
"           AND pid_boe_date IS NULL;
"
"
"
"        IF v_cnt > 0 THEN
"
"      	  Raise_Application_Error(-20999,'Bill of Entry date must be entered.');
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"      DECLARE
"
"      v_cnt	NUMBER(5);
"
"      BEGIN
"
"      SELECT COUNT(*) INTO v_cnt
"
"        FROM stores
"
"       WHERE store_bu = p_bu
"
"         AND store_plnt = r_prh.porh_plnt
"
"         AND store_plnt_loc_id = r_prh.porh_plnt_loc_id
"
"         AND store_physical = 'Q';
"
"
"
"        IF v_cnt = 0 THEN
"
"	   Raise_Application_Error(-20999,'Inspection Warehouse not found.');
"
"        END IF;
"
"      END;
"
"
"
"      /* ************ Line Validation ****************** */
"
"      FOR r_prl IN c_prl
"
"      LOOP
"
"
"
"        OPEN c_prodplnt(r_prl.porl_plnt,r_prl.porl_prod_id,r_prl.porl_prod_rev);
"
"        FETCH c_prodplnt INTO r_prodplnt;
"
"        CLOSE c_prodplnt;
"
"
"
"        IF r_prh.porh_currency <> v_base_curry AND r_prl.porl_gst_input_type NOT IN ('M','A') THEN
"
"          Raise_Application_Error(-20999,'GST Input type should be Import for the GRN Line '||r_prl.porl_seq_no);
"
"	END IF;
"
"
"
"        IF /*r_prh.porh_gst_type = 'U' AND*/ r_prl.porl_rcm_flag = 'Y' AND r_prl.porl_rcm_cat_id IS NULL THEN
"
"          Raise_Application_Error(-20999,'RCM Category not found for the GRN Line '||r_prl.porl_seq_no);
"
"	END IF;
"
"
"
"        IF r_prh.porh_gst_type = 'R' AND r_prl.porl_foc_flag = 'N' AND  r_prl.porl_hsn_code IS NULL AND r_prl.porl_matl_type IN ('PR','T') AND r_prl.porl_gst_input_type = 'I' THEN
"
"          Raise_Application_Error(-20999,'HSN Code not found for the Line '||r_prl.porl_seq_no);
"
"	END IF;
"
"
"
"        IF r_prl.porl_storage_store_id IS NULL AND r_prl.prod_stocked = 'Y' THEN
"
"          Raise_Application_Error(-20999,'Warehouse not found for the line '||r_prl.porl_seq_no);
"
"        END IF;
"
"
"
"        IF r_prl.porl_storage_store_id IS NULL AND r_prl.prod_stocked = 'N' THEN
"
"          Raise_Application_Error(-20999,'Department not found for the line '||r_prl.porl_seq_no);
"
"        END IF;
"
"
"
"        IF r_prl.porl_sc_unit_cost = 0 AND r_prl.porl_foc_flag = 'N' THEN
"
"          Raise_Application_Error(-20999,func_find_form_msg('PROD_UNIT_COST','GTZERO')||' for line '||r_prl.porl_seq_no);
"
"        END IF;
"
"
"
"        IF r_prl.porl_status = 'Q' AND r_prl.porl_stock_receipt_qty <> (r_prl.porl_stk_accepted_qty + r_prl.porl_stk_aod_qty + r_prl.porl_stk_rejected_qty) THEN
"
"          Raise_Application_Error(-20999,'Stock Receipt Qty. should be equal to updated qty. for the line '||r_prl.porl_seq_no);
"
"        END IF;
"
"
"
"        IF r_prodplnt.prodplnt_procure_hold_flag = 'Y' THEN
"
"          Raise_Application_Error(-20999,'Procurement is hold for this item '||r_prl.porl_prod_id);
"
"        END IF;
"
"
"
"        IF r_prh.porh_indir_mvmt_flag = 'Y' AND r_prl.porl_matl_type = 'PR' AND r_prl.porl_im_suplr_id IS NULL THEN
"
"          Raise_Application_Error(-20999,'Indirect Movement Supplier must be entered for the line '||r_prl.porl_seq_no);
"
"        END IF;
"
"
"
"	IF r_prl.porl_test_req_flag = 'Y' AND r_prl.porl_cert_id IS NULL THEN
"
"	  Raise_Application_Error(-20999,'Test Certificate must be entered for the line '||r_prl.porl_seq_no);
"
"	END IF;
"
"
"
"	IF r_prl.porl_cc_code IS NULL AND r_prh.porh_mode = 'PR' THEN
"
"	  Raise_Application_Error(-20999,'CPC Code must be entered for the line '||r_prl.porl_seq_no);
"
"	END IF;
"
"
"
"	--IF func_find_inv_method(p_bu) = 'T' THEN
"
"	   IF r_prl.porl_pur_acct IS NULL AND r_prh.porh_mode = 'PR' AND r_prl.porl_matl_type = 'PR' THEN
"
"	     Raise_Application_Error(-20999,'GL Acct. must be entered for the line '||r_prl.porl_seq_no);
"
"	   END IF;
"
"	--END IF;
"
"
"
"	IF r_prl.prod_ser_lot_opt = 'S' THEN
"
"        SELECT COUNT(*) INTO v_cnt
"
"          FROM pur_rcpt_lot_serial
"
"         WHERE prcls_bu = p_bu
"
"           AND prcls_doc_no = r_prh.porh_receipt_no
"
"           AND prcls_doc_seq_no = r_prl.porl_seq_no
"
"           AND prcls_lot_qty <> 1;
"
"
"
"        IF v_cnt <> 0 THEN
"
"          Raise_Application_Error(-20999,'Quantity of serial item should not be greater or lesser than one for the Line '||r_prl.porl_seq_no);
"
"        END IF;
"
"	END IF;
"
"
"
"	IF r_prl.prod_ser_lot_opt IN ('S','L') THEN
"
"          SELECT COUNT(*) INTO v_cnt
"
"            FROM pur_rcpt_lot_serial
"
"           WHERE prcls_bu = p_bu
"
"             AND prcls_doc_no = r_prh.porh_receipt_no
"
"             AND prcls_doc_seq_no = r_prl.porl_seq_no
"
"	     AND prcls_mfg_date IS NULL;
"
"
"
"          IF v_cnt <> 0 THEN
"
"            Raise_Application_Error(-20999,'Lot/Serial Mfg. date should not be empty for the item '||r_prl.porl_prod_id);
"
"          END IF;
"
"	END IF;
"
"
"
"	IF r_prl.prod_ser_lot_opt IN ('L') THEN
"
"
"
"          SELECT COUNT(*) INTO v_cnt
"
"            FROM pur_rcpt_lot_serial
"
"           WHERE prcls_bu = p_bu
"
"             AND prcls_doc_no = r_prh.porh_receipt_no
"
"             AND prcls_doc_seq_no = r_prl.porl_seq_no
"
"	     AND prcls_heat_no IS NULL;
"
"
"
"          IF v_cnt <> 0 THEN
"
"            Raise_Application_Error(-20999,'Heat No. should not be empty for the item '||r_prl.porl_prod_id);
"
"          END IF;
"
"	END IF;
"
"
"
"	IF r_prl.prod_ser_lot_opt IN ('L') THEN
"
"
"
"          SELECT COUNT(*) INTO v_cnt
"
"            FROM pur_rcpt_lot_serial
"
"           WHERE prcls_bu = p_bu
"
"             AND prcls_doc_no = r_prh.porh_receipt_no
"
"             AND prcls_doc_seq_no = r_prl.porl_seq_no
"
"	     AND prcls_test_no IS NULL;
"
"
"
"          IF v_cnt <> 0 THEN
"
"            Raise_Application_Error(-20999,'Test No. should not be empty for the item '||r_prl.porl_prod_id);
"
"          END IF;
"
"	END IF;
"
"
"
"	IF r_prl.prod_expr_flag = 'Y' THEN
"
"
"
"	  SELECT COUNT(*) INTO v_cnt
"
"            FROM pur_rcpt_lot_serial
"
"           WHERE prcls_bu = p_bu
"
"             AND prcls_doc_no = r_prh.porh_receipt_no
"
"             AND prcls_doc_seq_no = r_prl.porl_seq_no
"
"			 AND func_find_prod_ser_lot_type(p_bu,r_prl.porl_prod_id,r_prl.porl_prod_rev) <> 'N'
"
"             AND prcls_expiry_date IS NULL
"
"	     AND r_prh.porh_mode = 'PR';
"
"
"
"	  IF v_cnt > 0 THEN
"
"	    Raise_Application_Error(-20999,'Lot/Serial Expiry date should not be empty for the item '||r_prl.porl_prod_id);
"
"	  END IF;
"
"	END IF;
"
"
"
"	IF r_prl.porl_foc_flag = 'N' AND r_prl.porl_matl_type = 'PR' THEN
"
"	BEGIN
"
"	 proc_get_hsn_tax_val(p_bu,
"
"	                       r_prl.porl_hsn_code,
"
"	                       r_prh.porh_receipt_date,
"
"	                       CASE WHEN r_prh.porh_gst_clf_type = 'M' THEN 'I' ELSE r_prh.porh_gst_clf_type END,
"
"                               r_prl.porl_gst_input_type,
"
"                               r_prl.porl_gst_exempt_flag,
"
"                               ((r_prl.porl_receipt_qty * r_prl.porl_sc_unit_cost) - r_prl.porl_disc_amt ));
"
"        END;
"
"        END IF;
"
"
"
"        IF r_prl.prod_indicator = 'I' AND r_prl.porl_so_schld_desc IS NULL THEN /*Order Specific*/
"
"          Raise_Application_Error(-20999,'SO/Project Ref. must be entered for the item '||r_prl.porl_prod_id);
"
"	ELSIF r_prl.prod_indicator = 'N' AND r_prl.porl_so_schld_desc IS NOT NULL THEN /*Non Specific*/
"
"          Raise_Application_Error(-20999,'SO/Project Ref. should not be entered for the item '||r_prl.porl_prod_id);
"
"	END IF;
"
"
"
"	IF r_prl.prod_inc_pack_mat_flag = 'Y' THEN
"
"
"
"           IF r_prl.porl_pack_mat_prod_id IS NULL THEN
"
"              Raise_Application_Error(-20999,'Packing Item must be entered for line no. '||r_prl.porl_seq_no);
"
"	   END IF;
"
"
"
"	   IF r_prl.porl_pack_mat_qty <= 0 THEN
"
"              Raise_Application_Error(-20999,'Packing Material Qty. should be greater than zero for line no. '||r_prl.porl_seq_no);
"
"	   END IF;
"
"
"
"           BEGIN
"
"             SELECT ppl_dflt_store_id INTO v_pm_dflt_store_id
"
"               FROM prod_plants_loc
"
"              WHERE ppl_bu = p_bu
"
"                AND ppl_plnt = r_prh.porh_plnt
"
"                AND ppl_plnt_loc_id = r_prh.porh_plnt_loc_id
"
"                AND ppl_prod_id = r_prl.porl_pack_mat_prod_id
"
"                AND ppl_prod_rev = r_prl.porl_pack_mat_prod_rev;
"
"           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"	     Raise_Application_Error(-20999,'Packing Material default W/H not found for the item '||r_prl.porl_pack_mat_prod_id);
"
"           END;
"
"
"
"           BEGIN
"
"             SELECT svsc_unit_cost INTO v_std_cost
"
"               FROM stock_val_std_cost
"
"              WHERE svsc_bu = p_bu
"
"	        AND svsc_plnt = r_prh.porh_plnt
"
"                AND svsc_prod_id = r_prl.porl_pack_mat_prod_id
"
"                AND svsc_prod_rev = r_prl.porl_pack_mat_prod_rev;
"
"           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             Raise_Application_Error(-20999,'Standard Cost not found for the item '||r_prl.porl_pack_mat_prod_id);
"
"           END;
"
"
"
"	END IF;
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
"DECLARE
"
"CURSOR c1 IS
"
"SELECT porl_seq_no,
"
"       porl_receipt_qty,
"
"       SUM(prcls_lot_qty) rcpt_qty,
"
"       porl_accepted_qty,
"
"       SUM(prcls_qty_accepted) acpt_qty,
"
"       porl_aod_qty,
"
"       SUM(prcls_aod_qty) aod_qty,
"
"       porl_rejected_qty,
"
"       SUM(prcls_qty_rejected) rej_qty,
"
"       porl_prim_rej_qty,
"
"       SUM(prcls_prim_rej_qty) prim_rej_qty,
"
"       porl_sec_rej_qty,
"
"       SUM(prcls_sec_rej_qty) sec_rej_qty
"
"  FROM pur_ord_receipt_hd,
"
"       pur_ord_receipt_ln,
"
"       pur_rcpt_lot_serial,
"
"       prod_plants
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prodplnt_bu = porl_bu
"
"   AND prodplnt_plnt = porl_plnt
"
"   AND prodplnt_prod_id = porl_prod_id
"
"   AND prodplnt_prod_rev = porl_prod_rev
"
"   AND prcls_bu(+) = porl_bu
"
"   AND prcls_doc_no(+) = porl_receipt_no
"
"   AND prcls_doc_seq_no(+) = porl_seq_no
"
"   AND porh_bu = p_bu
"
"   AND porh_receipt_pfx = p_rcpt_pfx
"
"   AND porh_receipt_no = p_rcpt_no
"
"   AND porl_status NOT IN ('C')
"
"   AND prcls_apply_type(+) = 'R'
"
"   AND porl_matl_type NOT IN ('T','SCI')
"
"   AND prodplnt_crate_rqrd_flag = 'Y'
"
"   AND prcls_crate_id(+) IS NOT NULL
"
" GROUP BY porl_seq_no,
"
"          porl_receipt_qty,
"
"          porl_accepted_qty,
"
"          porl_rejected_qty,
"
"          porl_prim_rej_qty,
"
"          porl_sec_rej_qty,
"
"          porl_aod_qty
"
"HAVING ((NVL(SUM(prcls_lot_qty),0) <> porl_receipt_qty) OR
"
"        (NVL(SUM(prcls_qty_accepted),0) <> porl_accepted_qty) OR
"
"        (NVL(SUM(prcls_aod_qty),0) <> porl_aod_qty) OR
"
"        (NVL(SUM(prcls_qty_rejected),0) <> porl_rejected_qty) OR
"
"        (NVL(SUM(prcls_prim_rej_qty),0) <> porl_prim_rej_qty) OR
"
"        (NVL(SUM(prcls_sec_rej_qty),0) <> porl_sec_rej_qty))
"
"UNION ALL
"
"SELECT porl_seq_no,
"
"       porl_stock_receipt_qty,
"
"       SUM(prcls_stk_rcpt_qty) rcpt_qty,
"
"       porl_stk_accepted_qty,
"
"       SUM(prcls_stk_acpt_qty) acpt_qty,
"
"       porl_stk_aod_qty,
"
"       SUM(prcls_stk_aod_qty) aod_qty,
"
"       porl_stk_rejected_qty,
"
"       SUM(prcls_stk_rej_qty) rej_qty,
"
"       porl_stk_prim_rej_qty,
"
"       SUM(prcls_stk_prim_rej_qty) prim_rej_qty,
"
"       porl_stk_sec_rej_qty,
"
"       SUM(prcls_stk_sec_rej_qty) sec_rej_qty
"
"  FROM pur_ord_receipt_hd,
"
"       pur_ord_receipt_ln,
"
"       pur_rcpt_lot_serial,
"
"       prod_plants
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prodplnt_bu = porl_bu
"
"   AND prodplnt_plnt = porl_plnt
"
"   AND prodplnt_prod_id = porl_prod_id
"
"   AND prodplnt_prod_rev = porl_prod_rev
"
"   AND prcls_bu(+) = porl_bu
"
"   AND prcls_doc_no(+) = porl_receipt_no
"
"   AND prcls_doc_seq_no(+) = porl_seq_no
"
"   AND porh_bu = p_bu
"
"   AND porh_receipt_pfx = p_rcpt_pfx
"
"   AND porh_receipt_no = p_rcpt_no
"
"   AND porl_status NOT IN ('C')
"
"   AND prcls_apply_type(+) = 'R'
"
"   AND porl_matl_type NOT IN ('T','SCI')
"
"   AND prodplnt_crate_rqrd_flag = 'Y'
"
"   AND prcls_crate_id(+) IS NOT NULL
"
" GROUP BY porl_seq_no,
"
"          porl_stock_receipt_qty,
"
"          porl_stk_accepted_qty,
"
"          porl_stk_rejected_qty,
"
"          porl_stk_prim_rej_qty,
"
"          porl_stk_sec_rej_qty,
"
"          porl_stk_aod_qty
"
"HAVING ((NVL(SUM(prcls_stk_rcpt_qty),0) <> porl_stock_receipt_qty) OR
"
"        (NVL(SUM(prcls_stk_acpt_qty),0) <> porl_stk_accepted_qty) OR
"
"        (NVL(SUM(prcls_stk_aod_qty),0) <> porl_stk_aod_qty) OR
"
"        (NVL(SUM(prcls_stk_rej_qty),0) <> porl_stk_rejected_qty) OR
"
"        (NVL(SUM(prcls_stk_prim_rej_qty),0) <> porl_stk_prim_rej_qty) OR
"
"        (NVL(SUM(prcls_stk_sec_rej_qty),0) <> porl_stk_sec_rej_qty));
"
"
"
"  cr1			c1%ROWTYPE;
"
"
"
"BEGIN
"
"
"
"  OPEN c1;
"
"  FETCH c1 INTO cr1;
"
"    IF c1%FOUND THEN
"
"      Raise_Application_Error(-20999,'Receipt Qty. mismatch with Crates Receipt Qty. for the line '||cr1.porl_seq_no);
"
"    END IF;
"
"  CLOSE c1;
"
"END;
"
"
"
"DECLARE
"
"CURSOR c1 IS
"
"SELECT porl_seq_no,
"
"       porl_receipt_qty,
"
"       SUM(prcls_lot_qty) rcpt_qty,
"
"       porl_accepted_qty,
"
"       SUM(prcls_qty_accepted) acpt_qty,
"
"       porl_aod_qty,
"
"       SUM(prcls_aod_qty) aod_qty,
"
"       porl_rejected_qty,
"
"       SUM(prcls_qty_rejected) rej_qty,
"
"       porl_prim_rej_qty,
"
"       SUM(prcls_prim_rej_qty) prim_rej_qty,
"
"       porl_sec_rej_qty,
"
"       SUM(prcls_sec_rej_qty) sec_rej_qty
"
"  FROM pur_ord_receipt_hd,
"
"       pur_ord_receipt_ln,
"
"       pur_rcpt_lot_serial,
"
"       products
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prod_bu = porl_bu
"
"   AND prod_id = porl_prod_id
"
"   AND prod_rev = porl_prod_rev
"
"   AND prcls_bu(+) = porl_bu
"
"   AND prcls_doc_no(+) = porl_receipt_no
"
"   AND prcls_doc_seq_no(+) = porl_seq_no
"
"   AND porh_bu = p_bu
"
"   AND porh_receipt_pfx = p_rcpt_pfx
"
"   AND porh_receipt_no = p_rcpt_no
"
"   AND porl_status NOT IN ('C')
"
"   AND prcls_apply_type(+) = 'R'
"
"   AND porl_matl_type NOT IN ('T','SCI')
"
"   AND prod_ser_lot_opt <> 'N'
"
"   AND (prcls_lot_no(+) IS NOT NULL OR prcls_serial_no(+) IS NOT NULL)
"
" GROUP BY porl_seq_no,
"
"          porl_receipt_qty,
"
"          porl_accepted_qty,
"
"          porl_rejected_qty,
"
"          porl_prim_rej_qty,
"
"          porl_sec_rej_qty,
"
"          porl_aod_qty
"
"HAVING ((NVL(SUM(prcls_lot_qty),0) <> porl_receipt_qty) OR
"
"        (NVL(SUM(prcls_qty_accepted),0) <> porl_accepted_qty) OR
"
"        (NVL(SUM(prcls_aod_qty),0) <> porl_aod_qty) OR
"
"        (NVL(SUM(prcls_qty_rejected),0) <> porl_rejected_qty) OR
"
"        (NVL(SUM(prcls_prim_rej_qty),0) <> porl_prim_rej_qty) OR
"
"        (NVL(SUM(prcls_sec_rej_qty),0) <> porl_sec_rej_qty))
"
"UNION ALL
"
"SELECT porl_seq_no,
"
"       porl_stock_receipt_qty,
"
"       SUM(prcls_stk_rcpt_qty) rcpt_qty,
"
"       porl_stk_accepted_qty,
"
"       SUM(prcls_stk_acpt_qty) acpt_qty,
"
"       porl_stk_aod_qty,
"
"       SUM(prcls_stk_aod_qty) aod_qty,
"
"       porl_stk_rejected_qty,
"
"       SUM(prcls_stk_rej_qty) rej_qty,
"
"       porl_stk_prim_rej_qty,
"
"       SUM(prcls_stk_prim_rej_qty) prim_rej_qty,
"
"       porl_stk_sec_rej_qty,
"
"       SUM(prcls_stk_sec_rej_qty) sec_rej_qty
"
"  FROM pur_ord_receipt_hd,
"
"       pur_ord_receipt_ln,
"
"       pur_rcpt_lot_serial,
"
"       products
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prod_bu = porl_bu
"
"   AND prod_id = porl_prod_id
"
"   AND prod_rev = porl_prod_rev
"
"   AND prcls_bu(+) = porl_bu
"
"   AND prcls_doc_no(+) = porl_receipt_no
"
"   AND prcls_doc_seq_no(+) = porl_seq_no
"
"   AND porh_bu = p_bu
"
"   AND porh_receipt_pfx = p_rcpt_pfx
"
"   AND porh_receipt_no = p_rcpt_no
"
"   AND porl_status NOT IN ('C')
"
"   AND prcls_apply_type(+) = 'R'
"
"   AND porl_matl_type NOT IN ('T','SCI')
"
"   AND prod_ser_lot_opt <> 'N'
"
"   AND (prcls_lot_no(+) IS NOT NULL OR prcls_serial_no(+) IS NOT NULL)
"
" GROUP BY porl_seq_no,
"
"          porl_stock_receipt_qty,
"
"          porl_stk_accepted_qty,
"
"          porl_stk_rejected_qty,
"
"          porl_stk_prim_rej_qty,
"
"          porl_stk_sec_rej_qty,
"
"          porl_stk_aod_qty
"
"HAVING ((NVL(SUM(prcls_stk_rcpt_qty),0) <> porl_stock_receipt_qty) OR
"
"        (NVL(SUM(prcls_stk_acpt_qty),0) <> porl_stk_accepted_qty) OR
"
"        (NVL(SUM(prcls_stk_aod_qty),0) <> porl_stk_aod_qty) OR
"
"        (NVL(SUM(prcls_stk_rej_qty),0) <> porl_stk_rejected_qty) OR
"
"        (NVL(SUM(prcls_stk_prim_rej_qty),0) <> porl_stk_prim_rej_qty) OR
"
"        (NVL(SUM(prcls_stk_sec_rej_qty),0) <> porl_stk_sec_rej_qty));
"
"
"
"  cr1			c1%ROWTYPE;
"
"
"
"BEGIN
"
"  OPEN c1;
"
"  FETCH c1 INTO cr1;
"
"    IF c1%FOUND THEN
"
"      Raise_Application_Error(-20999,'Receipt Qty. mismatch with Lot/Serial Receipt Qty. for the Line '||cr1.porl_seq_no);
"
"    END IF;
"
"  CLOSE c1;
"
"END;
"
"
"
"DECLARE
"
"CURSOR c1 IS
"
"SELECT porl_seq_no,porl_excess_qty,SUM(prcls_lot_qty) LS_Excs_qty,
"
"       ROUND((porl_excess_qty / porl_conv_factor),3) porl_stk_excess_qty,SUM(prcls_stk_rcpt_qty) LS_Stk_Excs_qty
"
"  FROM pur_ord_receipt_hd,
"
"       pur_ord_receipt_ln,
"
"       pur_rcpt_lot_serial,
"
"       products
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prod_bu = porl_bu
"
"   AND prod_id = porl_prod_id
"
"   AND prod_rev = porl_prod_rev
"
"   AND prcls_bu(+) = porl_bu
"
"   AND prcls_doc_no(+) = porl_receipt_no
"
"   AND prcls_doc_seq_no(+) = porl_seq_no
"
"   AND porh_bu = p_bu
"
"   AND porh_receipt_pfx = p_rcpt_pfx
"
"   AND porh_receipt_no = p_rcpt_no
"
"   AND porl_status NOT IN ('C')
"
"   AND prcls_apply_type(+) = 'E'
"
"   AND porl_matl_type NOT IN ('T','SCI')
"
"   AND prod_ser_lot_opt <> 'N'
"
"   AND porl_excess_qty > 0
"
" GROUP BY porl_seq_no,porl_excess_qty,porl_conv_factor
"
"HAVING (NVL(SUM(prcls_lot_qty),0) <> porl_excess_qty OR
"
"        NVL(SUM(prcls_stk_rcpt_qty),0) <> ROUND((porl_excess_qty / porl_conv_factor),3));
"
"
"
"  cr1			c1%ROWTYPE;
"
"
"
"BEGIN
"
"  OPEN c1;
"
"  FETCH c1 INTO cr1;
"
"    IF c1%FOUND THEN
"
"      Raise_Application_Error(-20999,'Excess Qty. mismatch with Lot/Serial Excess Qty. for the Line '||cr1.porl_seq_no);
"
"    END IF;
"
"  CLOSE c1;
"
"END;
"
"
"
"DECLARE
"
"CURSOR c1 IS
"
"SELECT porl_seq_no,
"
"       porl_receipt_qty,
"
"       SUM(prcls_lot_qty) rcpt_qty,
"
"       porl_accepted_qty,
"
"       SUM(prcls_qty_accepted) acpt_qty,
"
"       porl_aod_qty,
"
"       SUM(prcls_aod_qty) aod_qty,
"
"       porl_rejected_qty,
"
"       SUM(prcls_qty_rejected) rej_qty,
"
"       porl_prim_rej_qty,
"
"       SUM(prcls_prim_rej_qty) prim_rej_qty,
"
"       porl_sec_rej_qty,
"
"       SUM(prcls_sec_rej_qty) sec_rej_qty
"
"  FROM pur_ord_receipt_hd,
"
"       pur_ord_receipt_ln,
"
"       pur_rcpt_lot_serial,
"
"       products
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prod_bu = porl_bu
"
"   AND prod_id = porl_prod_id
"
"   AND prod_rev = porl_prod_rev
"
"   AND prcls_bu(+) = porl_bu
"
"   AND prcls_doc_no(+) = porl_receipt_no
"
"   AND prcls_doc_seq_no(+) = porl_seq_no
"
"   AND porh_bu = p_bu
"
"   AND porh_receipt_pfx = p_rcpt_pfx
"
"   AND porh_receipt_no = p_rcpt_no
"
"   AND porl_status NOT IN ('C')
"
"   AND prcls_apply_type(+) = 'R'
"
"   AND porl_matl_type NOT IN ('T','SCI')
"
"   AND prod_ser_lot_opt = 'N'
"
" GROUP BY porl_seq_no,
"
"          porl_receipt_qty,
"
"          porl_accepted_qty,
"
"          porl_rejected_qty,
"
"          porl_prim_rej_qty,
"
"          porl_sec_rej_qty,
"
"          porl_aod_qty
"
"HAVING ((NVL(SUM(prcls_lot_qty),0) <> porl_receipt_qty) OR
"
"        (NVL(SUM(prcls_qty_accepted),0) <> porl_accepted_qty) OR
"
"        (NVL(SUM(prcls_aod_qty),0) <> porl_aod_qty) OR
"
"        (NVL(SUM(prcls_qty_rejected),0) <> porl_rejected_qty) OR
"
"        (NVL(SUM(prcls_prim_rej_qty),0) <> porl_prim_rej_qty) OR
"
"        (NVL(SUM(prcls_sec_rej_qty),0) <> porl_sec_rej_qty))
"
" UNION
"
"SELECT porl_seq_no,
"
"       porl_stock_receipt_qty,
"
"       SUM(prcls_stk_rcpt_qty) rcpt_qty,
"
"       porl_stk_accepted_qty,
"
"       SUM(prcls_stk_acpt_qty) acpt_qty,
"
"       porl_stk_aod_qty,
"
"       SUM(prcls_stk_aod_qty) aod_qty,
"
"       porl_stk_rejected_qty,
"
"       SUM(prcls_stk_rej_qty) rej_qty,
"
"       porl_stk_prim_rej_qty,
"
"       SUM(prcls_stk_prim_rej_qty) prim_rej_qty,
"
"       porl_stk_sec_rej_qty,
"
"       SUM(prcls_stk_sec_rej_qty) sec_rej_qty
"
"  FROM pur_ord_receipt_hd,
"
"       pur_ord_receipt_ln,
"
"       pur_rcpt_lot_serial,
"
"       products
"
" WHERE porh_bu = porl_bu
"
"   AND porh_receipt_no = porl_receipt_no
"
"   AND prod_bu = porl_bu
"
"   AND prod_id = porl_prod_id
"
"   AND prod_rev = porl_prod_rev
"
"   AND prcls_bu(+) = porl_bu
"
"   AND prcls_doc_no(+) = porl_receipt_no
"
"   AND prcls_doc_seq_no(+) = porl_seq_no
"
"   AND porh_bu = p_bu
"
"   AND porh_receipt_pfx = p_rcpt_pfx
"
"   AND porh_receipt_no = p_rcpt_no
"
"   AND porl_status NOT IN ('C')
"
"   AND prcls_apply_type(+) = 'R'
"
"   AND porl_matl_type NOT IN ('T','SCI')
"
"   AND prod_ser_lot_opt = 'N'
"
" GROUP BY porl_seq_no,
"
"          porl_stock_receipt_qty,
"
"          porl_stk_accepted_qty,
"
"          porl_stk_rejected_qty,
"
"          porl_stk_prim_rej_qty,
"
"          porl_stk_sec_rej_qty,
"
"          porl_stk_aod_qty
"
"HAVING ((NVL(SUM(prcls_stk_rcpt_qty),0) <> porl_stock_receipt_qty) OR
"
"        (NVL(SUM(prcls_stk_acpt_qty),0) <> porl_stk_accepted_qty) OR
"
"        (NVL(SUM(prcls_stk_aod_qty),0) <> porl_stk_aod_qty) OR
"
"        (NVL(SUM(prcls_stk_rej_qty),0) <> porl_stk_rejected_qty) OR
"
"        (NVL(SUM(prcls_stk_prim_rej_qty),0) <> porl_stk_prim_rej_qty) OR
"
"        (NVL(SUM(prcls_stk_sec_rej_qty),0) <> porl_stk_sec_rej_qty));
"
"
"
"  cr1			c1%ROWTYPE;
"
"
"
"BEGIN
"
"  OPEN c1;
"
"  FETCH c1 INTO cr1;
"
"    IF c1%FOUND THEN
"
"      Raise_Application_Error(-20999,'Receipt Qty. mismatch with Lot/Serial Receipt Qty. for the Line'||cr1.porl_seq_no);
"
"    END IF;
"
"  CLOSE c1;
"
"END;
"
"
"
"  DECLARE
"
"  v_cnt	NUMBER(5);
"
"  BEGIN
"
"    SELECT COUNT(*)
"
"      INTO v_cnt
"
"      FROM pur_ord_receipt_ln,products
"
"     WHERE porl_bu = prod_bu
"
"       AND porl_prod_id = prod_id
"
"       AND porl_prod_rev = prod_rev
"
"       AND porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_status <> 'C'
"
"       AND porl_matl_type = 'T'
"
"       AND prod_tc_charge_flag = 'Y'
"
"       AND porl_pur_acct IS NULL;
"
"
"
"      IF v_cnt > 0 THEN
"
"         Raise_Application_Error(-20999,'GL Acct. not found for the charge item.');
"
"      END IF;
"
"  END;
"
"
"
"  END proc_valid_frm_pur_rcpt;
"
"
"
"  PROCEDURE proc_can_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                              p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"			      p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"			      p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			     )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM pur_ord_receipt_hd,
"
"         pur_ord_receipt_ln,
"
"	 products
"
"   WHERE porh_bu = porl_bu
"
"     AND porh_receipt_no = porl_receipt_no
"
"     AND prod_bu = porl_bu
"
"     AND prod_id = porl_prod_id
"
"     AND prod_rev = porl_prod_rev
"
"     AND porl_bu = p_bu
"
"     AND porl_receipt_no = p_rcpt_no
"
"     AND porl_status NOT IN ('C','P')
"
"     AND porl_inv_qty = 0
"
"     AND porl_temp_in_progress = 0;
"
"
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER(6);
"
"    v_vou_period	NUMBER(2);
"
"
"
"    v_ord_type		VARCHAR2(2);
"
"    v_ord_pfx		pur_order_hd.poh_order_pfx%TYPE;
"
"    v_ord_no		pur_order_hd.poh_order_no%TYPE;
"
"    v_ord_seq_no	pur_order_ln.pol_seq_no%TYPE;
"
"    v_ord_sub_seq_no	NUMBER(5);
"
"
"
"    v_store_id		VARCHAR2(10);
"
"
"
"    v_rcpt_qty		NUMBER;
"
"    v_aod_qty		NUMBER;
"
"    v_rej_qty		NUMBER;
"
"    v_excs_qty		NUMBER;
"
"    v_lot_qty		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_fg_rcpt_no	VARCHAR2(30);
"
"
"
"    v_upd_ref		VARCHAR2(500);
"
"
"
"    v_suplr_bill_cnt	NUMBER;
"
"    v_stk_trf_cnt	NUMBER;
"
"
"
"    v_po_cls_type	VARCHAR2(1);
"
"    v_rcvd_qty		NUMBER;
"
"    v_res		VARCHAR2(1);
"
"    v_unldg_log_sht_flag VARCHAR2(1) := 'N';
"
"    v_grn_cnt 		NUMBER;
"
"
"
"    var_elg_qty2       	NUMBER := 0;
"
"    var_bal_qty2	NUMBER := 0;
"
"    var_elg_qty       	NUMBER := 0;
"
"    var_bal_qty		NUMBER := 0;
"
"    var_elg_qty1       	NUMBER := 0;
"
"    var_bal_qty1	NUMBER := 0;
"
"    var_acpt_qty	pur_ord_receipt_ln.porl_accepted_qty%TYPE;
"
"
"
"    v_appl		VARCHAR2(3);
"
"    v_source_doc	VARCHAR2(5);
"
"
"
"    v_trans_count	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    BEGIN
"
"      SELECT COUNT(*)
"
"        INTO v_trans_count
"
"	FROM pur_ord_receipt_hd,suppliers
"
"       WHERE porh_bu = suplr_bu
"
"         AND porh_suplr_id = suplr_suplr_id
"
"	 AND porh_bu = p_bu
"
"	 AND porh_receipt_pfx = p_rcpt_pfx
"
"	 AND porh_receipt_no = p_rcpt_no
"
"	 AND suplr_transfer_bu IS NOT NULL
"
"	 AND suplr_transfer_plnt IS NOT NULL;
"
"    END;
"
"
"
"    BEGIN
"
"      SELECT COUNT(*)
"
"        INTO v_grn_cnt
"
"        FROM pur_ord_receipt_hd_view,
"
"             pur_ord_receipt_ln_view
"
"       WHERE porh_bu = porl_bu
"
"         AND porh_receipt_no = porl_receipt_no
"
"         AND porh_bu = p_bu
"
"         AND porh_receipt_pfx = p_rcpt_pfx
"
"         AND porh_receipt_no = p_rcpt_no
"
"         AND porl_status NOT IN ('C','P')
"
"         AND (porl_inv_qty > 0 OR porl_temp_in_progress > 0);
"
"
"
"      IF v_grn_cnt > 0 THEN
"
"        Raise_Application_Error(-20256,'POM'||' '||p_bu||' '||p_rcpt_pfx||' '||p_rcpt_no);
"
"      END IF;
"
"    END;
"
"
"
"    pkg_pur_hist.proc_rev_grn_hist(p_bu,p_rcpt_pfx,p_rcpt_no);
"
"
"
"    FOR r_po IN (SELECT DISTINCT porl_po_pfx,porl_po_no
"
"                   FROM pur_ord_receipt_ln_view
"
"		  WHERE porl_bu = p_bu
"
"		    AND porl_receipt_no = p_rcpt_no)
"
"    LOOP
"
"      pkg_pur_hist.proc_rev_po_hist(p_bu,r_po.porl_po_pfx,r_po.porl_po_no);
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
"      v_vou_date := TRUNC(SYSDATE);
"
"      v_vou_year := func_find_year(p_bu,v_vou_date);
"
"      v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"      IF cr1.porh_mode = 'PR' THEN
"
"        v_appl := 'POM';
"
"	v_source_doc := 'GRN';
"
"      ELSE
"
"        v_appl := 'SCM';
"
"	v_source_doc := 'SRN';
"
"      END IF;
"
"
"
"      IF c1%ROWCOUNT = 1 AND cr1.porh_tax_flag = 'Y' AND cr1.porh_wf_status <> 'A' THEN
"
"        pkg_tcs.proc_del_tcs_amt_frm_grn(p_bu,p_rcpt_pfx,p_rcpt_no,p_user);
"
"      END IF;
"
"
"
"      IF c1%ROWCOUNT = 1 AND cr1.porh_tax_flag = 'Y' AND cr1.porh_wf_status = 'A' THEN
"
"        pkg_tcs.proc_can_tcs_amt_frm_grn(p_bu,p_rcpt_pfx,p_rcpt_no,p_user);
"
"      END IF;
"
"
"
"      IF c1%ROWCOUNT = 1 AND cr1.porh_tax_flag = 'Y' AND cr1.porh_status <> 'R' THEN
"
"
"
"	/*pkg_landed_cost.proc_del_pur_rcpt_lc_tax(p_bu,
"
"	                                         p_rcpt_pfx,
"
"						 p_rcpt_no
"
"						);*/
"
"
"
"	proc_upd_grn_charge(p_bu,cr1.porh_plnt,p_rcpt_pfx,p_rcpt_no,p_user);
"
"
"
"	UPDATE pur_ord_receipt_hd
"
"	   SET porh_tax_flag = 'N'
"
"	 WHERE porh_bu = p_bu
"
"	   AND porh_receipt_pfx = p_rcpt_pfx
"
"	   AND porh_receipt_no = p_rcpt_no;
"
"
"
"      END IF;
"
"
"
"      IF cr1.porl_status = 'P' THEN
"
"        Raise_Application_Error(-20150,'APM Cannot cancel partial GRN.');
"
"      ELSIF cr1.porl_status = 'N' AND cr1.porl_qc_doc_pfx IS NOT NULL AND cr1.porl_qc_doc_no IS NOT NULL THEN
"
"        Raise_Application_Error(-20444,'SFM Cannot cancel QC pending.');
"
"      --ELSIF cr1.porl_status = 'Q' AND cr1.porl_receipt_qty <> (cr1.porl_accepted_qty + cr1.porl_rejected_qty + cr1.porl_aod_qty) THEN
"
"        --Raise_Application_Error(-20444,'SFM Cannot cancel QC pending.');
"
"      END IF;
"
"
"
"    UPDATE dc_hd
"
"       SET dchd_lo_rcpt_pfx = NULL,
"
"           dchd_lo_rcpt_no = NULL,
"
"	   dchd_lo_sel_flag = 'N',
"
"           dchd_lo_sel_user = NULL
"
"     WHERE dchd_lo_bu = p_bu
"
"       AND dchd_lo_plnt = cr1.porh_plnt
"
"       AND dchd_lo_rcpt_pfx = cr1.porh_receipt_pfx
"
"       AND dchd_lo_rcpt_no = cr1.porh_receipt_no;
"
"
"
"	  /* Ledger Budget Starts */
"
"
"
"	  /*proc_upd_ldgr_bud_fr_pr_po_grn(p_bu,
"
"									 cr1.porh_plnt,
"
"									 cr1.porh_year,
"
"									 cr1.porh_period,
"
"									 'GRN',
"
"									 cr1.porh_receipt_pfx,
"
"									 cr1.porh_receipt_no,
"
"									 'C',
"
"									 p_user,
"
"									 cr1.porl_seq_no
"
"									);*/
"
"
"
"      /* Ledger Budget End */
"
"
"
"
"
"      IF v_trans_count <> 0 THEN
"
"        FOR r_ls IN (SELECT sisln_plnt,sisln_doc_no,sisln_seq_no,prcls_lot_qty
"
"                       FROM pur_rcpt_lot_serial,sales_invoices_hd,sales_invoices_ln,sales_inv_serial_lot_no
"
"                      WHERE sihd_bu = siln_bu
"
"                        AND sihd_plant = siln_plnt
"
"                        AND sihd_doc_no = siln_doc_no
"
"                        AND siln_bu = sisln_bu
"
"                        AND siln_plnt = sisln_plnt
"
"                        AND siln_doc_no = sisln_doc_no
"
"                        AND siln_seq_no = sisln_seq_no
"
"                        AND sihd_trans_bu = p_bu
"
"                        AND sihd_inv_pfx = cr1.porl_st_inv_pfx
"
"                        AND sihd_inv_no = cr1.porl_st_inv_no
"
"                        AND siln_seq_no = cr1.porl_st_inv_seq_no
"
"			AND prcls_bu = p_bu
"
"			AND prcls_doc_no = cr1.porl_receipt_no
"
"			AND prcls_doc_seq_no = cr1.porl_seq_no
"
"			AND prcls_apply_type = 'R'
"
"			AND (sisln_lot_no = prcls_lot_no OR (sisln_lot_no IS NULL AND prcls_lot_no IS NULL))
"
"			AND (sisln_serial_no = prcls_serial_no OR (sisln_serial_no IS NULL AND prcls_serial_no IS NULL))
"
"	              ORDER BY sisln_seq_no)
"
"	LOOP
"
"	  UPDATE sales_inv_serial_lot_no
"
"	     SET sisln_grn_qty = sisln_grn_qty - r_ls.prcls_lot_qty
"
"	   WHERE sisln_bu = p_bu
"
"	     AND sisln_plnt = r_ls.sisln_plnt
"
"	     AND sisln_doc_no = r_ls.sisln_doc_no
"
"	     AND sisln_seq_no = r_ls.sisln_seq_no;
"
"	END LOOP;
"
"      END IF;
"
"
"
"      IF (cr1.porh_mode = 'PR' AND cr1.porh_type = 'SS') OR
"
"         cr1.porl_matl_type = 'PC' OR
"
"	 (cr1.porh_mode = 'SC' AND cr1.porh_type = 'SL') OR
"
"	 (cr1.prod_stocked = 'N') THEN
"
"
"
"        IF cr1.porl_ge_doc_no IS NOT NULL THEN
"
"
"
"          proc_upd_ge_frm_pur_rcpt(p_bu,p_rcpt_pfx,p_rcpt_no,cr1.porl_seq_no,p_user);
"
"
"
"        END IF;
"
"
"
"	IF cr1.porl_status <> 'R' THEN
"
"
"
"	  proc_upd_ord_process_qty(p_bu,p_rcpt_pfx,p_rcpt_no,cr1.porl_seq_no,p_user);
"
"
"
"	END IF;
"
"
"
"        UPDATE pur_ord_receipt_ln
"
"           SET porl_status = 'C',
"
"	       porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	       porl_upd_by = p_user,
"
"	       porl_upd_date = SYSDATE
"
"         WHERE porl_bu = cr1.porl_bu
"
"           AND porl_receipt_no = cr1.porl_receipt_no
"
"           AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"      ELSE
"
"
"
"        IF cr1.porh_grn_source = 'SS' THEN
"
"	  v_ord_type := 'SS';
"
"	ELSIF cr1.porh_type = 'SP' THEN
"
"	  v_ord_type := 'SC';
"
"	ELSIF cr1.porh_type IN ('SV','RS','RV') THEN
"
"	  v_ord_type := cr1.porh_type;
"
"	ELSE
"
"	  v_ord_type := 'PO';
"
"	END IF;
"
"
"
"	IF cr1.porh_grn_source = 'PO' THEN
"
"          v_ord_pfx := cr1.porl_po_pfx;
"
"	  v_ord_no := cr1.porl_po_no;
"
"	  v_ord_seq_no := cr1.porl_po_seq_no;
"
"	  v_ord_sub_seq_no := cr1.porl_po_sub_seq_no;
"
"        ELSIF cr1.porh_grn_source = 'SS' THEN
"
"          v_ord_pfx := cr1.porl_ss_doc_pfx;
"
"	  v_ord_no := cr1.porl_ss_doc_no;
"
"	  v_ord_seq_no := cr1.porl_ss_seq_no;
"
"	  v_ord_sub_seq_no := cr1.porl_ss_sub_seq_no;
"
"        ELSIF cr1.porh_grn_source = 'PR' THEN
"
"          v_ord_pfx := cr1.porl_pr_pfx;
"
"	  v_ord_no := cr1.porl_pr_no;
"
"	  v_ord_seq_no := cr1.porl_pr_seq_no;
"
"	  v_ord_sub_seq_no := cr1.porl_pr_sub_seq_no;
"
"        ELSE
"
"          v_ord_pfx := cr1.porh_receipt_pfx;
"
"	  v_ord_no := cr1.porl_receipt_no;
"
"	  v_ord_seq_no := cr1.porl_seq_no;
"
"	  v_ord_sub_seq_no := NULL;
"
"        END IF;
"
"
"
"	v_upd_ref := SUBSTR('GRN Reverse #('||p_rcpt_pfx||'/'||p_rcpt_no||'/'||cr1.porl_seq_no||')/Order Dtls.#('||
"
"                            v_ord_pfx||'/'||v_ord_no||'/'||v_ord_seq_no||'/'||v_ord_sub_seq_no||')',1,200);
"
"
"
"        IF cr1.porl_ge_doc_no IS NOT NULL THEN
"
"
"
"          UPDATE gate_entry_details
"
"             SET gedl_match_qty = gedl_match_qty - cr1.porl_receipt_qty,
"
"                 gedl_rcpt_pfx = NULL,
"
"                 gedl_rcpt_no = NULL
"
"           WHERE gedl_bu = p_bu
"
"             AND gedl_plnt = cr1.porl_plnt
"
"             AND gedl_doc_no = cr1.porl_ge_doc_no
"
"             AND gedl_seq_no = cr1.porl_ge_seq_no
"
"             AND gedl_sub_seq_no = cr1.porl_ge_sub_seq_no
"
"             AND gedl_prod_id = cr1.porl_prod_id
"
"             AND gedl_prod_rev = cr1.porl_prod_rev;
"
"        END IF;
"
"
"
"	IF cr1.porl_status <> 'R' THEN --Without GateEntry
"
"	  proc_upd_ord_process_qty(p_bu,
"
"                                   p_rcpt_pfx,
"
"				   p_rcpt_no,
"
"				   cr1.porl_seq_no,
"
"				   p_user
"
"				  );
"
"	END IF;
"
"
"
"        IF ((cr1.porh_mode = 'SC' OR func_find_prod_pur_with_mat(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y')
"
"            AND cr1.porh_inspn_flag = 'N') THEN
"
"
"
"          IF cr1.porh_alloc_flag = 'Y' THEN
"
"
"
"            proc_dealloc_cons_mat_frm_grn(p_bu,cr1.porh_plnt,p_rcpt_pfx,p_rcpt_no,cr1.porl_seq_no,p_user,v_res);
"
"
"
"          END IF;
"
"
"
"          DELETE FROM sub_contr_rcpt_dc_mat_cons
"
"           WHERE scrdmc_bu = p_bu
"
"             AND scrdmc_rcpt_no = p_rcpt_no
"
"             AND scrdmc_seq_no = cr1.porl_seq_no;
"
"
"
"        END IF;
"
"
"
"        IF cr1.porh_inspn_flag = 'Y' THEN
"
"
"
"	  IF cr1.porl_status = 'N' THEN
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'I');
"
"	    v_rcpt_qty := cr1.porl_stock_receipt_qty;--cr1.porl_receipt_qty / cr1.porl_conv_factor;
"
"	  ELSIF (cr1.porl_status = 'Q' AND cr1.porl_qc_doc_pfx IS NOT NULL AND cr1.porl_qc_doc_no IS NOT NULL) THEN
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'P');
"
"	    v_rcpt_qty := cr1.porl_stock_receipt_qty;--cr1.porl_receipt_qty / cr1.porl_conv_factor;
"
"	  ELSIF (cr1.porl_status = 'Q' AND cr1.porl_qc_doc_pfx IS NULL AND cr1.porl_qc_doc_no IS NULL) THEN
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'I');
"
"	    v_rcpt_qty := cr1.porl_stock_receipt_qty;--cr1.porl_receipt_qty / cr1.porl_conv_factor;
"
"	  ELSIF cr1.porl_status = 'R' THEN
"
"	    v_store_id := cr1.porl_storage_store_id;
"
"	    v_rcpt_qty := cr1.porl_stk_accepted_qty;--cr1.porl_accepted_qty / cr1.porl_conv_factor;
"
"
"
"	    SELECT COUNT(*)
"
"	      INTO v_suplr_bill_cnt
"
"	      FROM suplr_doc_hd_hist_vw1,
"
"	           suplr_doc_ln_hist_vw1
"
"             WHERE suphd_bu = supln_bu
"
"	       AND suphd_doc_no = supln_doc_no
"
"	       AND suphd_bu = p_bu
"
"	       AND supln_receipt_pfx = p_rcpt_pfx
"
"	       AND supln_receipt_no = p_rcpt_no
"
"	       AND suphd_status <> 'D';
"
"
"
"            IF v_suplr_bill_cnt > 0 THEN
"
"	      Raise_Application_Error(-20256,'POM'||' '||'Supplier Bill already done for this GRN');
"
"            END IF;
"
"
"
"	  END IF;
"
"
"
"
"
"
"
"	  IF cr1.porh_mode = 'PR' OR (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR')) THEN
"
"
"
"            v_unit_cost := (((((cr1.porl_sc_unit_cost) + cr1.porl_sc_chrg_amt) - ((cr1.porl_sc_unit_cost) * (cr1.porl_disc_pct / 100)) ) * cr1.porh_exchange_rate) + cr1.porl_ap_lc_chrg_amt) * cr1.porl_conv_factor;
"
"	  --Raise_Application_Error(-20999,'HRM '||cr1.porh_inspn_flag||'/'||v_rcpt_qty||'/'||cr1.porh_mode||'/'||cr1.porl_matl_type);
"
"	    proc_upd_stocks(p_bu,
"
"		            v_store_id,
"
"		            NULL,
"
"			    cr1.porl_prod_id,
"
"			    cr1.porl_prod_rev,
"
"			    0,
"
"			    0,
"
"			    -v_rcpt_qty,
"
"			    0,
"
"			    0,
"
"		            v_unit_cost,
"
"		            v_unit_cost,
"
"		            0,
"
"			    cr1.porl_net_disc_flag,
"
"			    0,
"
"			    0,
"
"			    0,
"
"			    v_ord_seq_no,
"
"			    v_ord_sub_seq_no,
"
"			    v_ord_pfx,
"
"			    v_ord_no,
"
"			    p_rcpt_pfx,
"
"			    p_rcpt_no,
"
"			    cr1.porh_suplr_id,
"
"			    v_vou_year,
"
"			    v_vou_period,
"
"			    v_vou_date,
"
"			    NULL,
"
"			    v_appl,
"
"			    v_source_doc,
"
"			    NULL,
"
"			    p_user,
"
"			    SYSDATE,
"
"			    NULL,
"
"			    cr1.porl_cls_id,
"
"			    NULL,
"
"			    cr1.porh_type,
"
"			    NULL,
"
"			    0,
"
"			    0,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    cr1.porl_seq_no,
"
"			    NULL,
"
"			    0,
"
"			    0,
"
"			    cr1.porl_upd_ref1,
"
"			    v_upd_ref,
"
"			    p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			    p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			    p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			    p_prod_grp_id => cr1.porl_prod_grp,
"
"			    p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			    p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			    p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			    p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			   );
"
"
"
"	    IF (cr1.porl_so_pfx IS NOT NULL AND cr1.porl_so_no IS NOT NULL) OR
"
"               (cr1.porl_proj_id IS NOT NULL AND cr1.porl_task_id IS NOT NULL) THEN
"
"	      proc_upd_so_stocks(p_bu,
"
"	                         v_store_id,
"
"				 cr1.porl_prod_id,
"
"				 cr1.porl_prod_rev,
"
"				 -v_rcpt_qty,
"
"				 0,
"
"				 v_unit_cost,
"
"				 cr1.porl_so_pfx,
"
"				 cr1.porl_so_no,
"
"				 cr1.porl_so_seq_no,
"
"				 cr1.porl_so_sub_seq_no,
"
"				 v_vou_date,
"
"				 v_ord_type,
"
"				 v_ord_pfx,
"
"				 v_ord_no,
"
"				 v_ord_seq_no,
"
"				 cr1.porh_receipt_pfx,
"
"				 cr1.porl_receipt_no,
"
"				 cr1.porl_seq_no,
"
"				 v_source_doc,
"
"				 v_appl,
"
"				 cr1.porl_upd_ref1,
"
"				 v_upd_ref,
"
"				 p_user,
"
"				 cr1.porl_so_type,
"
"				 cr1.porl_proj_id,
"
"				 cr1.porl_task_id,
"
"				 p_so_prj_schld_desc => cr1.porl_so_schld_desc
"
"				);
"
"	    END IF;
"
"
"
"	    IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	      FOR cr_ls IN (SELECT prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_lot_qty,
"
"		                   prcls_qty_accepted,prcls_expiry_date,prcls_no_of_coils,
"
"				   prcls_org_lot_no,
"
"				   prcls_stk_rcpt_qty,prcls_stk_acpt_qty
"
"                              FROM pur_rcpt_lot_serial
"
"			     WHERE prcls_bu = p_bu
"
"			       AND prcls_doc_no = cr1.porl_receipt_no
"
"			       AND prcls_doc_seq_no = cr1.porl_seq_no
"
"			       AND prcls_apply_type = 'R')
"
"              LOOP
"
"
"
"                IF cr1.porl_status = 'R' THEN
"
"		  v_lot_qty := cr_ls.prcls_stk_acpt_qty;
"
"		ELSE
"
"		  v_lot_qty := cr_ls.prcls_stk_rcpt_qty;
"
"		END IF;
"
"
"
"                proc_upd_lot_ser_stocks(p_bu,
"
"	                                v_store_id,
"
"					cr1.porl_prod_id,
"
"					cr1.porl_prod_rev,
"
"					cr_ls.prcls_sys_ls_no,
"
"					-v_lot_qty,
"
"					0,
"
"					0,
"
"					v_unit_cost,
"
"					cr1.prod_ser_lot_opt,
"
"					cr_ls.prcls_lot_no,
"
"					cr_ls.prcls_serial_no,
"
"					'V',
"
"					cr1.porh_suplr_id,
"
"					cr_ls.prcls_expiry_date,
"
"					v_vou_date,
"
"					v_source_doc,
"
"					cr1.porh_receipt_pfx,
"
"					cr1.porl_receipt_no,
"
"					cr1.porl_seq_no,
"
"					v_appl,
"
"					cr1.porl_upd_ref1,
"
"					v_upd_ref,
"
"					p_user,
"
"					p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					p_org_lot_no => cr_ls.prcls_org_lot_no
"
"				       );
"
"
"
"              END LOOP;
"
"
"
"	    END IF;
"
"
"
"	    IF func_find_prod_crate_rqrd_flag(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y' AND
"
"	       (cr1.porl_status <> 'R' OR (func_find_store_bin_flag(p_bu,v_store_id) = 'N' AND cr1.porl_status = 'R')) THEN
"
"
"
"              FOR r_crt IN (SELECT *
"
"                              FROM pur_rcpt_lot_serial
"
"                             WHERE prcls_bu = p_bu
"
"                               AND prcls_doc_no = cr1.porl_receipt_no
"
"                               AND prcls_doc_seq_no = cr1.porl_seq_no
"
"                               AND prcls_apply_type = 'R'
"
"	      		       AND prcls_crate_id IS NOT NULL)
"
"              LOOP
"
"
"
"	        proc_upd_bin_stocks(p_bu,
"
"	      		            v_store_id,
"
"	      		            cr1.porl_prod_id,
"
"	      		            cr1.porl_prod_rev,
"
"	      		            NULL,
"
"                                    r_crt.prcls_sys_ls_no,
"
"   	      		            r_crt.prcls_lot_no,
"
"	      		            r_crt.prcls_serial_no,
"
"	      		            r_crt.prcls_sou_type,
"
"	      		            r_crt.prcls_sou_id,
"
"	      		            -r_crt.prcls_stk_rcpt_qty,
"
"	      		            0,
"
"	      		            0,
"
"	      		            0,
"
"	      		            v_unit_cost,
"
"	      		            v_vou_date,
"
"	      		            v_source_doc,
"
"	      		            cr1.porh_receipt_pfx,
"
"	      		            cr1.porl_receipt_no,
"
"	      		            cr1.porl_seq_no,
"
"	      		            v_appl,
"
"	      		            p_user,
"
"	      		            p_crate_id => r_crt.prcls_crate_id
"
"	      		           );
"
"	      END LOOP;
"
"	    END IF;
"
"
"
"	    IF func_find_store_bin_flag(p_bu,v_store_id) = 'Y' AND cr1.porl_status = 'R' THEN
"
"
"
"              FOR cr_bin_stk IN (SELECT *
"
"                                   FROM pur_rct_put_away
"
"				  WHERE prpa_bu = p_bu
"
"				    AND prpa_receipt_pfx = cr1.porh_receipt_pfx
"
"				    AND prpa_receipt_no = cr1.porh_receipt_no
"
"				    AND prpa_rcpt_seq_no = cr1.porl_seq_no
"
"				    AND prpa_bin_flag = 'Y')
"
"              LOOP
"
"
"
"                proc_upd_bin_stocks(p_bu,
"
"		                    cr_bin_stk.prpa_store_id,
"
"		                    cr1.porl_prod_id,
"
"		                    cr1.porl_prod_rev,
"
"		                    cr_bin_stk.prpa_bin_id,
"
"		                    cr_bin_stk.prpa_sys_ls_no,
"
"		                    cr_bin_stk.prpa_lot_no,
"
"		                    cr_bin_stk.prpa_serial_no,
"
"		                    'V',
"
"		                    cr1.porh_suplr_id,
"
"		                    -(cr_bin_stk.prpa_qty / cr1.porl_conv_factor),
"
"		                    0,
"
"		                    0,
"
"		                    0,
"
"		                    cr1.porl_sc_unit_cost,
"
"		                    cr1.porh_receipt_date,
"
"		                    v_source_doc,
"
"		                    cr1.porh_receipt_pfx,
"
"		                    cr1.porh_receipt_no,
"
"		                    cr1.porl_seq_no,
"
"		                    v_appl,
"
"		                    p_user,
"
"				    p_crate_id => cr_bin_stk.prpa_crate_id
"
"		                   );
"
"
"
"                UPDATE pur_rct_put_away
"
"                   SET prpa_bin_flag = 'N'
"
"                 WHERE prpa_bu = p_bu
"
"                   AND prpa_receipt_pfx = cr1.porh_receipt_pfx
"
"                   AND prpa_receipt_no = cr1.porh_receipt_no
"
"                   AND prpa_rcpt_seq_no = cr1.porl_seq_no
"
"                   AND prpa_prod_id = cr_bin_stk.prpa_prod_id
"
"                   AND prpa_prod_rev = cr_bin_stk.prpa_prod_rev
"
"                   AND (prpa_lot_no = cr_bin_stk.prpa_lot_no OR prpa_lot_no IS NULL)
"
"                   AND (prpa_serial_no = cr_bin_stk.prpa_serial_no OR prpa_serial_no IS NULL)
"
"                   AND prpa_bin_id = cr_bin_stk.prpa_bin_id;
"
"
"
"              END LOOP;
"
"
"
"	    END IF;
"
"
"
"	    --IF cr1.porh_type = 'TS' THEN
"
"	    IF v_trans_count > 0 THEN
"
"
"
"	      SELECT COUNT(suplr_suplr_id)
"
"	        INTO v_stk_trf_cnt
"
"	        FROM suppliers
"
"	       WHERE suplr_bu = p_bu
"
"	         AND suplr_suplr_id = cr1.porh_suplr_id
"
"		 AND suplr_transfer_bu IS NOT NULL
"
"		 AND suplr_transfer_plnt IS NOT NULL;
"
"
"
"              IF v_stk_trf_cnt > 0 AND cr1.porh_inspn_flag = 'N' THEN
"
"
"
"	        proc_upd_stocks(p_bu,
"
"		                func_find_deflt_storeid(p_bu,cr1.porl_plnt,cr1.porl_plnt_loc_id,cr1.porl_prod_id,cr1.porl_prod_rev,'N'),
"
"		                NULL,
"
"		                cr1.porl_prod_id,
"
"		                cr1.porl_prod_rev,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                v_unit_cost,
"
"		                v_unit_cost,
"
"		                0,
"
"		                cr1.porl_net_disc_flag,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                v_ord_seq_no,
"
"		                v_ord_sub_seq_no,
"
"		                v_ord_pfx,
"
"		                v_ord_no,
"
"		                p_rcpt_pfx,
"
"		                p_rcpt_no,
"
"		                cr1.porh_suplr_id,
"
"		                v_vou_year,
"
"		                v_vou_period,
"
"		                v_vou_date,
"
"		                NULL,
"
"		                'POM',
"
"		                'GRN',
"
"		                NULL,
"
"		                p_user,
"
"		                SYSDATE,
"
"		                NULL,
"
"		                cr1.porl_cls_id,
"
"		                NULL,
"
"		                cr1.porh_type,
"
"		                NULL,
"
"		                0,
"
"		                0,
"
"		                NULL,
"
"		                NULL,
"
"		                NULL,
"
"		                NULL,
"
"		                NULL,
"
"		                cr1.porl_seq_no,
"
"		                NULL,
"
"		                0,
"
"		                0,
"
"		                cr1.porl_upd_ref1,
"
"		                v_upd_ref,
"
"		                p_stock_transit_in => -v_rcpt_qty,
"
"				p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			        p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			        p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			        p_prod_grp_id => cr1.porl_prod_grp,
"
"			        p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			        p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			        p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"		                );
"
"
"
"              END IF;
"
"
"
"	    END IF;
"
"
"
"	    IF cr1.porl_aod_qty > 0 AND cr1.porl_status = 'R' THEN
"
"
"
"	      v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'A');
"
"	      v_aod_qty := cr1.porl_stk_aod_qty;--cr1.porl_aod_qty / cr1.porl_conv_factor;
"
"
"
"	      proc_upd_stocks(p_bu,
"
"		              v_store_id,
"
"			      NULL,
"
"			      cr1.porl_prod_id,
"
"			      cr1.porl_prod_rev,
"
"			      0,
"
"			      0,
"
"			      -v_aod_qty,
"
"			      0,
"
"			      0,
"
"			      v_unit_cost,
"
"			      v_unit_cost,
"
"			      0,
"
"			      cr1.porl_net_disc_flag,
"
"			      0,
"
"			      0,
"
"			      0,
"
"			      v_ord_seq_no,
"
"			      v_ord_sub_seq_no,
"
"			      v_ord_pfx,
"
"			      v_ord_no,
"
"			      p_rcpt_pfx,
"
"			      p_rcpt_no,
"
"			      cr1.porh_suplr_id,
"
"			      v_vou_year,
"
"			      v_vou_period,
"
"			      v_vou_date,
"
"			      NULL,
"
"			      v_appl,
"
"			      v_source_doc,
"
"			      NULL,
"
"			      p_user,
"
"			      SYSDATE,
"
"			      NULL,
"
"			      cr1.porl_cls_id,
"
"			      NULL,
"
"			      cr1.porh_type,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      cr1.porl_seq_no,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      cr1.porl_upd_ref1,
"
"			      v_upd_ref,
"
"			      p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			      p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			      p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			      p_prod_grp_id => cr1.porl_prod_grp,
"
"			      p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			      p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			      p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			      p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			     );
"
"
"
"	      IF (cr1.porl_so_pfx IS NOT NULL AND cr1.porl_so_no IS NOT NULL) OR
"
"                 (cr1.porl_proj_id IS NOT NULL AND cr1.porl_task_id IS NOT NULL) THEN
"
"	        proc_upd_so_stocks(p_bu,
"
"	                           v_store_id,
"
"				   cr1.porl_prod_id,
"
"				   cr1.porl_prod_rev,
"
"				   -v_aod_qty,
"
"				   0,
"
"				   v_unit_cost,
"
"				   cr1.porl_so_pfx,
"
"				   cr1.porl_so_no,
"
"				   cr1.porl_so_seq_no,
"
"				   cr1.porl_so_sub_seq_no,
"
"				   v_vou_date,
"
"				   v_ord_type,
"
"				   v_ord_pfx,
"
"				   v_ord_no,
"
"				   v_ord_seq_no,
"
"				   cr1.porh_receipt_pfx,
"
"				   cr1.porl_receipt_no,
"
"				   cr1.porl_seq_no,
"
"				   v_source_doc,
"
"				   v_appl,
"
"				   cr1.porl_upd_ref1,
"
"				   v_upd_ref,
"
"				   p_user,
"
"				   cr1.porl_so_type,
"
"				   cr1.porl_proj_id,
"
"				   cr1.porl_task_id,
"
"				   p_so_prj_schld_desc => cr1.porl_so_schld_desc
"
"				  );
"
"	      END IF;
"
"
"
"	      IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	        FOR cr_ls IN (SELECT prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_aod_qty,prcls_stk_aod_qty,
"
"		                     prcls_expiry_date,prcls_no_of_coils,prcls_org_lot_no
"
"                                FROM pur_rcpt_lot_serial
"
"                               WHERE prcls_bu = p_bu
"
"				 AND prcls_doc_no = cr1.porl_receipt_no
"
"				 AND prcls_doc_seq_no = cr1.porl_seq_no
"
"				 AND prcls_apply_type = 'R'
"
"				 AND prcls_stk_aod_qty > 0)
"
"                LOOP
"
"
"
"                  v_lot_qty := cr_ls.prcls_stk_aod_qty;
"
"
"
"                  proc_upd_lot_ser_stocks(p_bu,
"
"	                                  v_store_id,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr_ls.prcls_sys_ls_no,
"
"					  -v_lot_qty,
"
"					  0,
"
"					  0,
"
"					  v_unit_cost,
"
"					  cr1.prod_ser_lot_opt,
"
"					  cr_ls.prcls_lot_no,
"
"					  cr_ls.prcls_serial_no,
"
"					  'V',
"
"					  cr1.porh_suplr_id,
"
"					  cr_ls.prcls_expiry_date,
"
"					  v_vou_date,
"
"					  v_source_doc,
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  v_appl,
"
"					  cr1.porl_upd_ref1,
"
"					  v_upd_ref,
"
"					  p_user,
"
"					  p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					  p_org_lot_no => cr_ls.prcls_org_lot_no
"
"					 );
"
"
"
"                END LOOP;
"
"
"
"	      END IF;
"
"
"
"	    IF func_find_prod_crate_rqrd_flag(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y' THEN
"
"              FOR r_crt IN (SELECT *
"
"                              FROM pur_rcpt_lot_serial
"
"                             WHERE prcls_bu = p_bu
"
"                               AND prcls_doc_no = cr1.porl_receipt_no
"
"                               AND prcls_doc_seq_no = cr1.porl_seq_no
"
"                               AND prcls_apply_type = 'R'
"
"	      		       AND prcls_crate_id IS NOT NULL
"
"			       AND prcls_stk_aod_qty > 0)
"
"              LOOP
"
"
"
"	        proc_upd_bin_stocks(p_bu,
"
"	      		            v_store_id,
"
"	      		            cr1.porl_prod_id,
"
"	      		            cr1.porl_prod_rev,
"
"	      		            NULL,
"
"                                    r_crt.prcls_sys_ls_no,
"
"   	      		            r_crt.prcls_lot_no,
"
"	      		            r_crt.prcls_serial_no,
"
"	      		            r_crt.prcls_sou_type,
"
"	      		            r_crt.prcls_sou_id,
"
"	      		            -r_crt.prcls_stk_aod_qty,
"
"	      		            0,
"
"	      		            0,
"
"	      		            0,
"
"	      		            v_unit_cost,
"
"	      		            v_vou_date,
"
"	      		            v_source_doc,
"
"	      		            cr1.porh_receipt_pfx,
"
"	      		            cr1.porl_receipt_no,
"
"	      		            cr1.porl_seq_no,
"
"	      		            v_appl,
"
"	      		            p_user,
"
"	      		            p_crate_id => r_crt.prcls_crate_id
"
"	      		           );
"
"	      END LOOP;
"
"	    END IF;
"
"
"
"
"
"
"
"	    END IF;
"
"
"
"	    IF cr1.porl_rejected_qty > 0 AND cr1.porl_status = 'R' THEN
"
"
"
"	      v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'J');
"
"	      v_rej_qty := cr1.porl_stk_rejected_qty;--cr1.porl_rejected_qty / cr1.porl_conv_factor;
"
"
"
"	      proc_upd_stocks(p_bu,
"
"		              v_store_id,
"
"			      NULL,
"
"			      cr1.porl_prod_id,
"
"			      cr1.porl_prod_rev,
"
"			      0,
"
"			      0,
"
"			      -v_rej_qty,
"
"			      0,
"
"			      0,
"
"			      v_unit_cost,
"
"			      v_unit_cost,
"
"			      0,
"
"			      cr1.porl_net_disc_flag,
"
"			      0,
"
"			      0,
"
"			      0,
"
"			      v_ord_seq_no,
"
"			      v_ord_sub_seq_no,
"
"			      v_ord_pfx,
"
"			      v_ord_no,
"
"			      p_rcpt_pfx,
"
"			      p_rcpt_no,
"
"			      cr1.porh_suplr_id,
"
"			      v_vou_year,
"
"			      v_vou_period,
"
"			      v_vou_date,
"
"			      NULL,
"
"			      v_appl,
"
"			      v_source_doc,
"
"			      NULL,
"
"			      p_user,
"
"			      SYSDATE,
"
"			      NULL,
"
"			      cr1.porl_cls_id,
"
"			      NULL,
"
"			      cr1.porh_type,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      cr1.porl_seq_no,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      cr1.porl_upd_ref1,
"
"			      v_upd_ref,
"
"			      p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			      p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			      p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			      p_prod_grp_id => cr1.porl_prod_grp,
"
"			      p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			      p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			      p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			      p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			     );
"
"
"
"	      IF (cr1.porl_so_pfx IS NOT NULL AND cr1.porl_so_no IS NOT NULL) OR
"
"                 (cr1.porl_proj_id IS NOT NULL AND cr1.porl_task_id IS NOT NULL) THEN
"
"	        proc_upd_so_stocks(p_bu,
"
"	                           v_store_id,
"
"				   cr1.porl_prod_id,
"
"				   cr1.porl_prod_rev,
"
"				   -v_rej_qty,
"
"				   0,
"
"				   v_unit_cost,
"
"				   cr1.porl_so_pfx,
"
"				   cr1.porl_so_no,
"
"				   cr1.porl_so_seq_no,
"
"				   cr1.porl_so_sub_seq_no,
"
"				   v_vou_date,
"
"				   v_ord_type,
"
"				   v_ord_pfx,
"
"				   v_ord_no,
"
"				   v_ord_seq_no,
"
"				   cr1.porh_receipt_pfx,
"
"				   cr1.porl_receipt_no,
"
"				   cr1.porl_seq_no,
"
"				   v_source_doc,
"
"				   v_appl,
"
"				   cr1.porl_upd_ref1,
"
"				   v_upd_ref,
"
"				   p_user,
"
"				   cr1.porl_so_type,
"
"				   cr1.porl_proj_id,
"
"				   cr1.porl_task_id,
"
"				   p_so_prj_schld_desc => cr1.porl_so_schld_desc
"
"				  );
"
"	      END IF;
"
"
"
"	      IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	        FOR cr_ls IN (SELECT prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_qty_rejected,prcls_stk_rej_qty,
"
"		                     prcls_expiry_date,prcls_no_of_coils,prcls_org_lot_no
"
"                                FROM pur_rcpt_lot_serial
"
"                               WHERE prcls_bu = p_bu
"
"				 AND prcls_doc_no = cr1.porl_receipt_no
"
"				 AND prcls_doc_seq_no = cr1.porl_seq_no
"
"				 AND prcls_apply_type = 'R'
"
"				 AND prcls_stk_rej_qty > 0)
"
"                LOOP
"
"
"
"                  v_lot_qty := cr_ls.prcls_stk_rej_qty;
"
"
"
"                  proc_upd_lot_ser_stocks(p_bu,
"
"	                                  v_store_id,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr_ls.prcls_sys_ls_no,
"
"					  -v_lot_qty,
"
"					  0,
"
"					  0,
"
"					  v_unit_cost,
"
"					  cr1.prod_ser_lot_opt,
"
"					  cr_ls.prcls_lot_no,
"
"					  cr_ls.prcls_serial_no,
"
"					  'V',
"
"					  cr1.porh_suplr_id,
"
"					  cr_ls.prcls_expiry_date,
"
"					  v_vou_date,
"
"					  v_source_doc,
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  v_appl,
"
"					  cr1.porl_upd_ref1,
"
"					  v_upd_ref,
"
"					  p_user,
"
"					  p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					  p_org_lot_no => cr_ls.prcls_org_lot_no
"
"					 );
"
"
"
"                END LOOP;
"
"
"
"	      END IF;
"
"
"
"	    IF func_find_prod_crate_rqrd_flag(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y' THEN
"
"              FOR r_crt IN (SELECT *
"
"                              FROM pur_rcpt_lot_serial
"
"                             WHERE prcls_bu = p_bu
"
"                               AND prcls_doc_no = cr1.porl_receipt_no
"
"                               AND prcls_doc_seq_no = cr1.porl_seq_no
"
"                               AND prcls_apply_type = 'R'
"
"	      		       AND prcls_crate_id IS NOT NULL
"
"			       AND prcls_stk_rej_qty > 0)
"
"              LOOP
"
"
"
"	        proc_upd_bin_stocks(p_bu,
"
"	      		            v_store_id,
"
"	      		            cr1.porl_prod_id,
"
"	      		            cr1.porl_prod_rev,
"
"	      		            NULL,
"
"                                    r_crt.prcls_sys_ls_no,
"
"   	      		            r_crt.prcls_lot_no,
"
"	      		            r_crt.prcls_serial_no,
"
"	      		            r_crt.prcls_sou_type,
"
"	      		            r_crt.prcls_sou_id,
"
"	      		            -r_crt.prcls_stk_rej_qty,
"
"	      		            0,
"
"	      		            0,
"
"	      		            0,
"
"	      		            v_unit_cost,
"
"	      		            v_vou_date,
"
"	      		            v_source_doc,
"
"	      		            cr1.porh_receipt_pfx,
"
"	      		            cr1.porl_receipt_no,
"
"	      		            cr1.porl_seq_no,
"
"	      		            v_appl,
"
"	      		            p_user,
"
"	      		            p_crate_id => r_crt.prcls_crate_id
"
"	      		           );
"
"	      END LOOP;
"
"	    END IF;
"
"
"
"	    END IF;
"
"
"
"	    IF cr1.porl_excess_qty > 0 THEN
"
"
"
"	      v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'X');
"
"	      v_excs_qty := cr1.porl_excess_qty/cr1.porl_conv_factor;
"
"
"
"	      proc_upd_stocks(p_bu,
"
"		              v_store_id,
"
"			      NULL,
"
"			      cr1.porl_prod_id,
"
"			      cr1.porl_prod_rev,
"
"			      0,
"
"			      0,
"
"			      -v_excs_qty,
"
"			      0,
"
"			      0,
"
"			      v_unit_cost,
"
"			      v_unit_cost,
"
"			      0,
"
"			      cr1.porl_net_disc_flag,
"
"			      0,
"
"			      0,
"
"			      0,
"
"			      v_ord_seq_no,
"
"			      v_ord_sub_seq_no,
"
"			      v_ord_pfx,
"
"			      v_ord_no,
"
"			      p_rcpt_pfx,
"
"			      p_rcpt_no,
"
"			      cr1.porh_suplr_id,
"
"			      v_vou_year,
"
"			      v_vou_period,
"
"			      v_vou_date,
"
"			      NULL,
"
"			      v_appl,
"
"			      v_source_doc,
"
"			      NULL,
"
"			      p_user,
"
"			      SYSDATE,
"
"			      NULL,
"
"			      cr1.porl_cls_id,
"
"			      NULL,
"
"			      cr1.porh_type,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      cr1.porl_seq_no,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      cr1.porl_upd_ref1,
"
"			      v_upd_ref,
"
"			      p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			      p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			      p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			      p_prod_grp_id => cr1.porl_prod_grp,
"
"			      p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			      p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			      p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			      p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			     );
"
"
"
"	      IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	        FOR cr_ls IN (SELECT *
"
"                                FROM pur_rcpt_lot_serial
"
"                               WHERE prcls_bu = p_bu
"
"				 AND prcls_doc_no = cr1.porl_receipt_no
"
"				 AND prcls_doc_seq_no = cr1.porl_seq_no
"
"				 AND prcls_apply_type = 'E')
"
"                LOOP
"
"                  v_lot_qty := cr_ls.prcls_stk_rcpt_qty;
"
"
"
"                  proc_upd_lot_ser_stocks(p_bu,
"
"	                                  v_store_id,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr_ls.prcls_sys_ls_no,
"
"					  -v_lot_qty,
"
"					  0,
"
"					  0,
"
"					  v_unit_cost,
"
"					  cr1.prod_ser_lot_opt,
"
"					  cr_ls.prcls_lot_no,
"
"					  cr_ls.prcls_serial_no,
"
"					  'V',
"
"					  cr1.porh_suplr_id,
"
"					  cr_ls.prcls_expiry_date,
"
"					  v_vou_date,
"
"					  v_source_doc,
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  v_appl,
"
"					  cr1.porl_upd_ref1,
"
"					  v_upd_ref,
"
"					  p_user,
"
"					  p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					  p_org_lot_no => cr_ls.prcls_org_lot_no
"
"					 );
"
"
"
"                END LOOP;
"
"
"
"	      END IF;
"
"
"
"	    IF func_find_prod_crate_rqrd_flag(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y' THEN
"
"              FOR r_crt IN (SELECT *
"
"                              FROM pur_rcpt_lot_serial
"
"                             WHERE prcls_bu = p_bu
"
"                               AND prcls_doc_no = cr1.porl_receipt_no
"
"                               AND prcls_doc_seq_no = cr1.porl_seq_no
"
"                               AND prcls_apply_type = 'E'
"
"	      		       AND prcls_crate_id IS NOT NULL)
"
"              LOOP
"
"
"
"	        proc_upd_bin_stocks(p_bu,
"
"	      		            v_store_id,
"
"	      		            cr1.porl_prod_id,
"
"	      		            cr1.porl_prod_rev,
"
"	      		            NULL,
"
"                                    r_crt.prcls_sys_ls_no,
"
"   	      		            r_crt.prcls_lot_no,
"
"	      		            r_crt.prcls_serial_no,
"
"	      		            r_crt.prcls_sou_type,
"
"	      		            r_crt.prcls_sou_id,
"
"	      		            -r_crt.prcls_stk_rcpt_qty,
"
"	      		            0,
"
"	      		            0,
"
"	      		            0,
"
"	      		            v_unit_cost,
"
"	      		            v_vou_date,
"
"	      		            v_source_doc,
"
"	      		            cr1.porh_receipt_pfx,
"
"	      		            cr1.porl_receipt_no,
"
"	      		            cr1.porl_seq_no,
"
"	      		            v_appl,
"
"	      		            p_user,
"
"	      		            p_crate_id => r_crt.prcls_crate_id
"
"	      		           );
"
"	      END LOOP;
"
"	    END IF;
"
"
"
"	    END IF;
"
"
"
"	    IF func_find_prod_pur_with_mat(cr1.porl_bu,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y' THEN
"
"
"
"	      FOR cr_sc_ln IN (SELECT *
"
"       		                 FROM sub_contr_mat_cons_lot_ser
"
"       		                WHERE scmcls_bu = cr1.porl_bu
"
"       		                  AND scmcls_receipt_pfx = cr1.porh_receipt_pfx
"
"       		                  AND scmcls_receipt_no = cr1.porl_receipt_no
"
"				  AND scmcls_seq_no = cr1.porl_seq_no
"
"				  AND scmcls_act_cons_qty > 0)
"
"              LOOP
"
"
"
"		v_store_id := func_find_benf_store(cr1.porl_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,cr1.porh_suplr_id,'V');
"
"		v_unit_cost := cr_sc_ln.scmcls_unit_cost;--func_find_unitcost(p_bu,cr_sc_ln.scmcls_prod_id,cr_sc_ln.scmcls_prod_rev,v_store_id);
"
"
"
"		proc_upd_stocks(cr1.porl_bu,
"
"       			        v_store_id,
"
"				NULL,
"
"				cr_sc_ln.scmcls_prod_id,
"
"				cr_sc_ln.scmcls_prod_rev,
"
"				0,
"
"				0,
"
"				(cr_sc_ln.scmcls_act_cons_qty),
"
"				0,
"
"				0,
"
"				v_unit_cost,
"
"				v_unit_cost,
"
"				0,
"
"				0,
"
"				0,
"
"				0,
"
"				0,
"
"				cr_sc_ln.scmcls_seq_no,
"
"				0,
"
"				v_ord_pfx,
"
"				v_ord_no,
"
"				cr1.porh_receipt_pfx,
"
"				cr1.porl_receipt_no,
"
"				cr1.porh_suplr_id,
"
"				v_vou_year,
"
"				v_vou_period,
"
"				v_vou_date,
"
"				NULL,
"
"				v_appl,
"
"				v_source_doc,
"
"				NULL,
"
"				p_user,
"
"				SYSDATE,
"
"				NULL,
"
"				cr1.porl_cls_id,
"
"				NULL,
"
"				cr1.porh_type,
"
"				NULL,
"
"				0,
"
"				0,
"
"				NULL,
"
"				NULL,
"
"				NULL,
"
"				NULL,
"
"				NULL,
"
"				cr1.porl_seq_no,
"
"				0,
"
"				0,
"
"				0,
"
"				cr1.porl_upd_ref1,
"
"				v_upd_ref,
"
"				0,
"
"			        p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			        p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			        p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			        p_prod_grp_id => cr1.porl_prod_grp,
"
"			        p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			        p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			        p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			       );
"
"	      END LOOP;
"
"
"
"	    END IF;
"
"
"
"	    IF cr1.porh_mode = 'SC' THEN
"
"
"
"	      proc_can_mat_cons_frm_grn(cr1.porl_bu,
"
"                                        cr1.porl_plnt,cr1.porl_plnt_loc_id,
"
"					cr1.porh_receipt_pfx,
"
"					cr1.porl_receipt_no,
"
"					cr1.porl_seq_no,
"
"					v_ord_pfx,
"
"					v_ord_no,
"
"					v_ord_seq_no,
"
"					v_ord_sub_seq_no,
"
"					cr1.porl_prod_ord_no,
"
"					cr1.porh_receipt_date,--v_vou_date,
"
"					v_ord_type,
"
"					cr1.porh_suplr_id,
"
"					cr1.porl_prod_id,
"
"					cr1.porl_prod_rev,
"
"					cr1.porl_cls_id,
"
"					cr1.porl_so_type,
"
"					cr1.porl_so_pfx,
"
"					cr1.porl_so_no,
"
"					cr1.porl_so_seq_no,
"
"					cr1.porl_so_sub_seq_no,
"
"					cr1.porl_proj_id,
"
"					cr1.porl_task_id,
"
"					cr1.porl_receipt_qty,
"
"					cr1.porl_conv_factor,
"
"					cr1.porl_upd_ref1,
"
"					cr1.porl_upd_ref2,
"
"					p_user
"
"				       );
"
"
"
"	    END IF;
"
"
"
"	    UPDATE pur_ord_receipt_ln
"
"               SET porl_status = 'C',
"
"                   porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"		   porl_upd_by = p_user,
"
"		   porl_upd_date = SYSDATE
"
"             WHERE porl_bu = p_bu
"
"	       AND porl_receipt_no = p_rcpt_no
"
"	       AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"	    --Raise_Application_Error(-20999,'HRM End');
"
"	  ELSIF cr1.porh_mode = 'SC' THEN
"
"
"
"	  /****************************Subcontract**************************/
"
"
"
"            IF cr1.porl_status = 'R' THEN
"
"	      proc_rev_subcontr_queue(p_bu,
"
"	                              cr1.porh_receipt_pfx,
"
"				      cr1.porl_receipt_no,
"
"				      cr1.porl_seq_no,
"
"				      p_user
"
"				     );
"
"	    END IF;
"
"
"
"	    IF cr1.porl_matl_type IN ('PR','SDS','UP') THEN
"
"
"
"	      IF cr1.porl_matl_type = 'PR' AND cr1.porl_status = 'R' THEN
"
"
"
"	        UPDATE fg_receipts
"
"		   SET fgr_status = 'C',
"
"		       fgr_upd_by = p_user,
"
"		       fgr_upd_date = SYSDATE
"
"		 WHERE fgr_bu = p_bu
"
"		   AND fgr_plnt = cr1.porl_plnt
"
"		   AND fgr_os_rcpt_pfx = cr1.porh_receipt_pfx
"
"		   AND fgr_os_rcpt_no = cr1.porl_receipt_no
"
"		   AND fgr_os_rcpt_seq_no = cr1.porl_seq_no
"
"		   AND fgr_prod_id = cr1.porl_prod_id
"
"		   AND fgr_prod_rev = cr1.porl_prod_rev
"
"		   AND fgr_status = 'N';
"
"
"
"		/*BEGIN
"
"		SELECT fgr_receipt_no
"
"		  INTO v_fg_rcpt_no
"
"		  FROM fg_receipts
"
"		 WHERE fgr_bu = p_bu
"
"		   AND fgr_plnt = cr1.porl_plnt
"
"		   AND fgr_os_rcpt_pfx = cr1.porh_receipt_pfx
"
"		   AND fgr_os_rcpt_no = cr1.porl_receipt_no
"
"		   AND fgr_os_rcpt_seq_no = cr1.porl_seq_no
"
"		   AND fgr_prod_id = cr1.porl_prod_id
"
"		   AND fgr_prod_rev = cr1.porl_prod_rev
"
"		   AND fgr_status = 'I';
"
"		EXCEPTION
"
"		  WHEN NO_DATA_FOUND THEN
"
"		    v_fg_rcpt_no := NULL;
"
"		END;*/
"
"
"
"		FOR r_fg_rcpt IN (SELECT fgr_receipt_no
"
"		                    FROM fg_receipts
"
"				   WHERE fgr_bu = p_bu
"
"		                     AND fgr_plnt = cr1.porl_plnt
"
"				     AND fgr_os_rcpt_pfx = cr1.porh_receipt_pfx
"
"				     AND fgr_os_rcpt_no = cr1.porl_receipt_no
"
"				     AND fgr_os_rcpt_seq_no = cr1.porl_seq_no
"
"				     AND fgr_prod_id = cr1.porl_prod_id
"
"				     AND fgr_prod_rev = cr1.porl_prod_rev
"
"				     AND fgr_status = 'I'
"
"				   GROUP BY fgr_receipt_no)
"
"		LOOP
"
"
"
"	          FOR cr_mi IN (SELECT *
"
"		                  FROM inv_stock_trans_hd,
"
"				       inv_stock_trans_ln
"
"			         WHERE isthd_bu = istln_bu
"
"			           AND isthd_doc_no = istln_doc_no
"
"				   AND istln_bu = p_bu
"
"				   AND istln_receipt_no = r_fg_rcpt.fgr_receipt_no
"
"			         ORDER BY isthd_trans_date)
"
"                  LOOP
"
"		    Raise_Application_Error(-20999,'HRM');
"
"		  END LOOP;
"
"
"
"		END LOOP;
"
"
"
"	      END IF;
"
"
"
"	      proc_rev_subcontr_stks(p_bu,
"
"	                             p_rcpt_pfx,
"
"				     p_rcpt_no,
"
"				     cr1.porl_seq_no,
"
"				     v_store_id,
"
"				     v_ord_pfx,
"
"				     v_ord_no,
"
"				     v_vou_date,
"
"				     v_vou_year,
"
"				     v_vou_period,
"
"				     cr1.prod_cost_method,
"
"				     v_upd_ref,
"
"				     p_user
"
"				    );
"
"
"
"	      IF cr1.porh_alloc_flag = 'Y' THEN
"
"	      proc_can_mat_cons_frm_grn(cr1.porl_bu,
"
"                                        cr1.porl_plnt,cr1.porl_plnt_loc_id,
"
"					cr1.porh_receipt_pfx,
"
"					cr1.porl_receipt_no,
"
"					cr1.porl_seq_no,
"
"					v_ord_pfx,
"
"					v_ord_no,
"
"					v_ord_seq_no,
"
"					v_ord_sub_seq_no,
"
"					cr1.porl_prod_ord_no,
"
"					v_vou_date,
"
"					v_ord_type,
"
"					cr1.porh_suplr_id,
"
"					cr1.porl_prod_id,
"
"					cr1.porl_prod_rev,
"
"					cr1.porl_cls_id,
"
"					cr1.porl_so_type,
"
"					cr1.porl_so_pfx,
"
"					cr1.porl_so_no,
"
"					cr1.porl_so_seq_no,
"
"					cr1.porl_so_sub_seq_no,
"
"					cr1.porl_proj_id,
"
"					cr1.porl_task_id,
"
"					cr1.porl_receipt_qty,
"
"					cr1.porl_conv_factor,
"
"					cr1.porl_upd_ref1,
"
"					cr1.porl_upd_ref2,
"
"					p_user
"
"				       );
"
"	      END IF;
"
"	    END IF;
"
"
"
"	  END IF;
"
"
"
"
"
"	  UPDATE pur_ord_receipt_ln
"
"             SET porl_status = 'C',
"
"                 porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"		 porl_upd_by = p_user,
"
"		 porl_upd_date = SYSDATE
"
"           WHERE porl_bu = p_bu
"
"	     AND porl_receipt_no = p_rcpt_no
"
"	     AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"        ELSE
"
"
"
"	  UPDATE pur_ord_receipt_ln
"
"	     SET porl_status = 'C',
"
"	         porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"		 porl_upd_by = p_user,
"
"		 porl_upd_date = SYSDATE
"
"	   WHERE porl_bu = p_bu
"
"	     AND porl_receipt_no = cr1.porl_receipt_no
"
"	     AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"      UPDATE tqm_qc_ln
"
"         SET tqln_status = 'L',
"
"	     tqln_can_ref = 'GRN Cancelled.'
"
"       WHERE tqln_bu = p_bu
"
"         AND tqln_qc_no = cr1.porl_qc_doc_no;
"
"
"
"      UPDATE tqm_qc_hd
"
"         SET tqhd_status = 'L'
"
"       WHERE tqhd_bu = p_bu
"
"         AND tqhd_qc_pfx = cr1.porl_qc_doc_pfx
"
"         AND tqhd_qc_no = cr1.porl_qc_doc_no;
"
"
"
"      UPDATE tqm_qc_plan_ln
"
"         SET tqpln_status = 'L'
"
"       WHERE tqpln_bu = p_bu
"
"         AND tqpln_pln_no = cr1.porl_qc_doc_no;
"
"
"
"      UPDATE tqm_qc_plan_hd
"
"         SET tqphd_status = 'L'
"
"       WHERE tqphd_bu = p_bu
"
"         AND tqphd_pln_pfx = cr1.porl_qc_doc_pfx
"
"         AND tqphd_pln_no = cr1.porl_qc_doc_no;
"
"
"
"      UPDATE tqm_qc_ln_hist
"
"         SET tqlnh_status = 'L',
"
"	     tqlnh_can_ref = 'GRN Cancelled.'
"
"       WHERE tqlnh_bu = p_bu
"
"         AND tqlnh_qc_pfx = cr1.porl_qc_doc_pfx
"
"         AND tqlnh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"      UPDATE tqm_qc_hd_hist
"
"         SET tqhdh_status = 'L'
"
"       WHERE tqhdh_bu = p_bu
"
"         AND tqhdh_qc_pfx = cr1.porl_qc_doc_pfx
"
"         AND tqhdh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"      UPDATE tqm_qc_plan_ln_hist
"
"         SET tqplnh_status = 'L'
"
"       WHERE tqplnh_bu = p_bu
"
"         AND tqplnh_pln_pfx = cr1.porl_qc_doc_pfx
"
"         AND tqplnh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"      UPDATE tqm_qc_plan_hd_hist
"
"         SET tqphdh_status = 'L'
"
"       WHERE tqphdh_bu = p_bu
"
"         AND tqphdh_pln_pfx = cr1.porl_qc_doc_pfx
"
"         AND tqphdh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"      IF cr1.porh_grn_source = 'PO' AND cr1.porl_status = 'R' THEN
"
"
"
"	UPDATE pur_order_hd
"
"	   SET poh_rcpt_rev_flag = CASE WHEN poh_status IN ('R','P') THEN 'Y' ELSE 'N' END
"
"	 WHERE poh_bu = p_bu
"
"	   AND poh_order_pfx = cr1.porl_po_pfx
"
"	   AND poh_order_no = cr1.porl_po_no;
"
"
"
"	BEGIN
"
"	  SELECT pomctrl_po_closure
"
"	    INTO v_po_cls_type
"
"	    FROM pom_control
"
"	   WHERE pomctrl_bu = p_bu
"
"	     AND pomctrl_plnt = cr1.porl_plnt;
"
"	EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20963,'POM ');
"
"	END;
"
"
"
"	IF v_po_cls_type = 'A' THEN
"
"	  v_rcvd_qty := cr1.porl_accepted_qty + cr1.porl_aod_qty;
"
"	ELSE
"
"	  v_rcvd_qty := cr1.porl_receipt_qty;
"
"	END IF;
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_received_qty = pol_received_qty - v_rcvd_qty,
"
"	       pol_rejected_qty = pol_rejected_qty - cr1.porl_rejected_qty,
"
"	       pol_tot_received_qty = pol_tot_received_qty - cr1.porl_receipt_qty,
"
"	       pol_rcpt_rev_flag = CASE WHEN pol_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	       pol_rcpt_stk_qty = pol_rcpt_stk_qty - (cr1.porl_receipt_qty/cr1.porl_conv_factor)
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = cr1.porl_po_no
"
"	   AND pol_seq_no = cr1.porl_po_seq_no
"
"	   AND pol_basis = 'Q';
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_rcpt_val = pol_rcpt_val - cr1.porl_sc_unit_cost
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = cr1.porl_po_no
"
"	   AND pol_seq_no = cr1.porl_po_seq_no
"
"	   AND pol_basis = 'V';
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_received_qty = 0
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = cr1.porl_po_no
"
"	   AND pol_seq_no = cr1.porl_po_seq_no
"
"	   AND pol_basis = 'V'
"
"	   AND pol_sc_unit_cost > pol_rcpt_val;
"
"
"
"       /* UPDATE pur_ord_ln_schedule
"
"	   SET pols_receipt_qty = pols_receipt_qty - v_rcvd_qty,
"
"	       pols_rejected_qty = pols_rejected_qty - cr1.porl_rejected_qty,
"
"	       pols_tot_receipt_qty = pols_tot_receipt_qty - cr1.porl_receipt_qty,
"
"	       pols_rcpt_stk_qty = pols_rcpt_stk_qty - (cr1.porl_receipt_qty/cr1.porl_conv_factor)
"
"	 WHERE pols_bu = p_bu
"
"	   AND pols_order_pfx = cr1.porl_po_pfx
"
"	   AND pols_order_no = cr1.porl_po_no
"
"	   AND pols_seq_no = cr1.porl_po_seq_no
"
"	   AND pols_sub_seq_no = cr1.porl_po_sub_seq_no;*/
"
"
"
"	/*proc_upd_pur_order_status(p_bu,
"
"				  cr1.porl_po_no,
"
"				  cr1.porl_po_seq_no,
"
"				  'P',
"
"				  p_user
"
"				 ); */
"
"
"
"      ELSIF cr1.porh_grn_source = 'SS' AND cr1.porl_status = 'R' THEN
"
"
"
"	IF v_po_cls_type = 'A' THEN
"
"	  v_rcvd_qty := cr1.porl_accepted_qty + cr1.porl_aod_qty;
"
"	ELSE
"
"	  v_rcvd_qty := cr1.porl_receipt_qty;
"
"	END IF;
"
"
"
"	UPDATE suplr_schld_ln
"
"           SET ssln_receipt_qty = ssln_receipt_qty - v_rcvd_qty
"
"         WHERE ssln_bu = p_bu
"
"           AND ssln_plnt = cr1.porl_plnt
"
"           AND ssln_doc_pfx = cr1.porl_ss_doc_pfx
"
"           AND ssln_doc_no = cr1.porl_ss_doc_no
"
"           AND ssln_seq_no = cr1.porl_ss_seq_no;
"
"
"
"        UPDATE suplr_schld_ln_dtls
"
"           SET ssld_recvd_qty = ssld_recvd_qty - v_rcvd_qty
"
"         WHERE ssld_bu = p_bu
"
"           AND ssld_plnt = cr1.porl_plnt
"
"           AND ssld_doc_pfx = cr1.porl_ss_doc_pfx
"
"           AND ssld_doc_no = cr1.porl_ss_doc_no
"
"           AND ssld_seq_no = cr1.porl_ss_seq_no
"
"           AND ssld_sub_seq_no = cr1.porl_ss_sub_seq_no;
"
"
"
"	proc_upd_suplr_schld_status(p_bu,
"
"                                    cr1.porl_plnt,
"
"                                    cr1.porl_ss_doc_no,
"
"                                    cr1.porl_ss_seq_no,
"
"                                    'P',
"
"                                    p_user
"
"                                   );
"
"      END IF;
"
"
"
"      IF cr1.porl_status = 'R' AND cr1.porl_ge_doc_no IS NOT NULL AND v_unldg_log_sht_flag = 'N' THEN
"
"
"
"        IF cr1.porl_po_pfx IS NOT NULL AND cr1.porl_po_no IS NOT NULL THEN
"
"
"
"	  UPDATE pur_order_ln
"
"             SET pol_proc_qty = pol_proc_qty + cr1.porl_receipt_qty,
"
"                 pol_excess_qty = pol_excess_qty + cr1.porl_excess_qty,
"
"                 pol_upd_by = p_user,
"
"                 pol_upd_date = SYSDATE
"
"           WHERE pol_bu = p_bu
"
"             AND pol_order_no = cr1.porl_po_no
"
"             AND pol_seq_no = cr1.porl_po_seq_no
"
"	     AND pol_basis = 'Q';
"
"
"
"	  UPDATE pur_order_ln
"
"             SET pol_inproc_val = pol_inproc_val + cr1.porl_sc_unit_cost
"
"           WHERE pol_bu = p_bu
"
"             AND pol_order_no = cr1.porl_po_no
"
"             AND pol_seq_no = cr1.porl_po_seq_no
"
"	     AND pol_basis = 'V';
"
"
"
"	  /*UPDATE pur_ord_ln_schedule
"
"             SET pols_process_qty = pols_process_qty + cr1.porl_receipt_qty,
"
"                 pols_excess_qty = pols_excess_qty + cr1.porl_excess_qty,
"
"                 pols_upd_by = p_user,
"
"                 pols_upd_date = SYSDATE
"
"           WHERE pols_bu = p_bu
"
"             AND pols_order_pfx = cr1.porl_po_pfx
"
"             AND pols_order_no = cr1.porl_po_no
"
"             AND pols_seq_no = cr1.porl_po_seq_no
"
"             AND pols_sub_seq_no = cr1.porl_po_sub_seq_no;*/
"
"
"
"	ELSIF cr1.porl_ss_doc_pfx IS NOT NULL AND cr1.porl_ss_doc_no IS NOT NULL THEN
"
"
"
"	  UPDATE suplr_schld_ln_dtls
"
"	     SET ssld_inproc_qty = ssld_inproc_qty + cr1.porl_receipt_qty,
"
"		 ssld_excs_qty = ssld_excs_qty + cr1.porl_excess_qty,
"
"		 ssld_upd_by = p_user,
"
"		 ssld_upd_date = SYSDATE
"
"	   WHERE ssld_bu = p_bu
"
"	     AND ssld_doc_pfx = cr1.porl_ss_doc_pfx
"
"             AND ssld_doc_no = cr1.porl_ss_doc_no
"
"             AND ssld_seq_no = cr1.porl_ss_seq_no
"
"	     AND ssld_sub_seq_no = cr1.porl_ss_sub_seq_no;
"
"
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"    END LOOP;
"
"
"
"    FOR cr_jrnl IN (SELECT ajh_jrnl_no
"
"                      FROM appl_journals_hist
"
"		     WHERE ajh_bu = p_bu
"
"		       AND ajh_vou_pfx = p_rcpt_pfx
"
"		       AND ajh_vou_no = p_rcpt_no)
"
"    LOOP
"
"
"
"      DELETE FROM gl_jrnl_ln_hist
"
"       WHERE gjlh_bu = p_bu
"
"         AND gjlh_jrnl_no = cr_jrnl.ajh_jrnl_no
"
"         AND gjlh_vou_pfx = p_rcpt_pfx
"
"         AND gjlh_vou_no = p_rcpt_no;
"
"
"
"      DELETE FROM gl_jrnl_hd_hist
"
"       WHERE gjhh_bu = p_bu
"
"         AND gjhh_jrnl_no = cr_jrnl.ajh_jrnl_no
"
"         AND gjhh_vou_pfx = p_rcpt_pfx
"
"         AND gjhh_vou_no = p_rcpt_no;
"
"
"
"      DELETE FROM appl_journals_hist
"
"       WHERE ajh_bu = p_bu
"
"         AND ajh_vou_pfx = p_rcpt_pfx
"
"         AND ajh_vou_no = p_rcpt_no
"
"         AND ajh_appl = 'POM';
"
"
"
"      DELETE FROM appl_journals
"
"       WHERE aj_bu = p_bu
"
"         AND aj_vou_pfx = p_rcpt_pfx
"
"         AND aj_vou_no = p_rcpt_no
"
"         AND aj_appl = 'POM';
"
"
"
"    END LOOP;
"
"
"
"    UPDATE pur_ord_receipt_hd
"
"       SET porh_status = 'R',
"
"           porh_rcpt_rev_flag = CASE WHEN porh_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	   porh_upd_by = p_user,
"
"	   porh_upd_date = SYSDATE
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no
"
"       AND 0 = (SELECT COUNT(*)
"
"                  FROM pur_ord_receipt_ln
"
"                 WHERE porl_bu = porh_bu
"
"                   AND porl_plnt = porh_plnt
"
"                   AND porl_receipt_no = porh_receipt_no
"
"                   AND porl_status IN ('N','Q','P'))
"
"       AND 0 < (SELECT COUNT(*)
"
"                  FROM pur_ord_receipt_ln
"
"                 WHERE porl_bu = porh_bu
"
"                   AND porl_plnt = porh_plnt
"
"                   AND porl_receipt_no = porh_receipt_no
"
"                   AND porl_status IN ('R'));
"
"
"
"    IF SQL%NOTFOUND THEN
"
"
"
"
"
"    UPDATE pur_ord_receipt_hd
"
"       SET porh_status = 'C',porh_wf_status = 'C',
"
"           porh_rcpt_rev_flag = CASE WHEN porh_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	   porh_upd_by = p_user,
"
"	   porh_upd_date = SYSDATE
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no
"
"       AND 0 = (SELECT COUNT(*)
"
"                  FROM pur_ord_receipt_ln
"
"                 WHERE porl_bu = porh_bu
"
"                   AND porl_plnt = porh_plnt
"
"                   AND porl_receipt_no = porh_receipt_no
"
"                   AND porl_status IN ('N','Q','P'));
"
"
"
"    END IF;
"
"
"
"    UPDATE sales_invoices_hd
"
"       SET sihd_stk_trfr_grn_pfx = NULL,
"
"           sihd_stk_trfr_grn_no = NULL,
"
"           sihd_upd_by = p_user,
"
"           sihd_upd_date = SYSDATE
"
"     WHERE sihd_bu = p_bu
"
"       AND sihd_stk_trfr_grn_pfx = p_rcpt_pfx
"
"       AND sihd_stk_trfr_grn_no = p_rcpt_no;
"
"
"
"    pkg_pur_hist.proc_ins_grn_hist(p_bu,p_rcpt_pfx,p_rcpt_no);
"
"
"
"  END proc_can_pur_rcpt;
"
"
"
"  PROCEDURE proc_corr_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                               p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"			       p_rcpt_no	pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"			       p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			      )
"
"  AS
"
"    CURSOR c1 IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_hd_view,
"
"           pur_ord_receipt_ln_view,
"
"  	   products
"
"     WHERE porh_bu = porl_bu
"
"       AND porh_receipt_no = porl_receipt_no
"
"       AND prod_bu = porl_bu
"
"       AND prod_id = porl_prod_id
"
"       AND prod_rev = porl_prod_rev
"
"       AND porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_status NOT IN ('P','C')
"
"       AND porh_mode = 'PR';
"
"
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER(6);
"
"    v_vou_period	NUMBER(2);
"
"
"
"    v_ord_type		VARCHAR2(2);
"
"    v_ord_pfx		VARCHAR2(5);
"
"    v_ord_no		VARCHAR2(30);
"
"    v_ord_seq_no	NUMBER(5);
"
"    v_ord_sub_seq_no	NUMBER(5);
"
"    v_upd_ref		VARCHAR2(500);
"
"    v_res		VARCHAR2(1);
"
"    v_store_id		VARCHAR2(10);
"
"    v_rcpt_qty		NUMBER;
"
"    v_aod_qty		NUMBER;
"
"    v_rej_qty		NUMBER;
"
"    v_excs_qty		NUMBER;
"
"    v_lot_qty		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"    v_suplr_bill_cnt	NUMBER;
"
"    v_stk_trf_cnt	NUMBER;
"
"    v_po_cls_type	VARCHAR2(1);
"
"    v_rcvd_qty		NUMBER;
"
"
"
"    var_elg_qty2       	NUMBER := 0;
"
"    var_bal_qty2	NUMBER := 0;
"
"    var_elg_qty       	NUMBER := 0;
"
"    var_bal_qty		NUMBER := 0;
"
"    var_elg_qty1       	NUMBER := 0;
"
"    var_bal_qty1	NUMBER := 0;
"
"    var_acpt_qty	pur_ord_receipt_ln.porl_accepted_qty%TYPE;
"
"    v_grn_amt           NUMBER(17,5);
"
"
"
"  BEGIN
"
"
"
"   -- pkg_pur_audit.proc_ins_grn_audit(p_bu,p_rcpt_pfx,p_rcpt_no);
"
"
"
"    pkg_pur_hist.proc_rev_grn_hist(p_bu,p_rcpt_pfx,p_rcpt_no);
"
"
"
"    FOR r_po IN (SELECT DISTINCT porl_po_pfx,porl_po_no
"
"                   FROM pur_ord_receipt_ln_view
"
"		  WHERE porl_bu = p_bu
"
"		    AND porl_receipt_no = p_rcpt_no)
"
"    LOOP
"
"      pkg_pur_hist.proc_rev_po_hist(p_bu,r_po.porl_po_pfx,r_po.porl_po_no);
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
"        /*-----------------Budget------------------*/
"
"        FOR r_grn IN (SELECT porh_receipt_date,porl_pur_acct,porl_cc_code,porl_seq_no,(((porl_receipt_qty * porl_sc_unit_cost) - porl_disc_amt) * porh_exchange_rate) rcpt_amt,
"
"                            porl_proj_id,
"
"                            porl_cls_id,
"
"                            porl_sub_cls_id,
"
"                            porl_prod_grp,
"
"                                                        porl_prod_subgrp,porh_plnt,porh_receipt_pfx,porh_receipt_no
"
"                     FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products
"
"                    WHERE porh_bu = porl_bu
"
"                      AND porh_receipt_no = porl_receipt_no
"
"                      AND porl_bu = prod_bu
"
"                      AND porl_prod_id = prod_id
"
"                      AND porl_prod_rev = prod_rev
"
"                      AND porh_type <> 'GRNPT'
"
"                      AND porh_mode <> 'SC'
"
"                      AND porl_status NOT IN ('C')
"
"                      AND (porl_matl_type = 'PR' OR (porl_matl_type = 'T'
"
"                                  AND (porl_tc_chrg_flag = 'Y'
"
"                                       AND prod_gl_acct_type = 'C')))
"
"                      AND porh_bu = p_bu
"
"                      AND porh_receipt_no = p_rcpt_no
"
"		      AND porl_seq_no = cr1.porl_seq_no
"
"		      AND porl_foc_flag = 'N'
"
"                    UNION ALL
"
"                   SELECT porh_receipt_date,scrp_pur_acct porl_pur_acct,scrp_cc_code porl_cc_code,porl_seq_no,(((scrp_proc_qty * scrp_proc_cost)) * porh_exchange_rate) rcpt_amt,
"
"                          porl_proj_id,
"
"                          porl_cls_id,
"
"                          porl_sub_cls_id,
"
"                              porl_prod_grp,
"
"                                                  porl_prod_subgrp,porh_plnt,porh_receipt_pfx,porh_receipt_no
"
"                     FROM pur_ord_receipt_hd,pur_ord_receipt_ln,sub_contr_rcpt_process
"
"                    WHERE porh_bu = porl_bu
"
"                      AND porh_receipt_no = porl_receipt_no
"
"                      AND porl_bu = scrp_bu
"
"                      AND porl_receipt_no = scrp_rcpt_no
"
"                      AND porl_seq_no = scrp_seq_no
"
"                      AND porh_type <> 'GRNPT'
"
"                      AND porh_mode = 'SC'
"
"                      AND porl_status NOT IN ('C')
"
"                                          AND scrp_proc_flag = 'Y'
"
"                      AND porh_bu = p_bu
"
"                      AND porh_receipt_no = p_rcpt_no
"
"		      AND porl_seq_no = cr1.porl_seq_no
"
"		      AND porl_foc_flag = 'N'
"
"                    )
"
"      LOOP
"
"
"
"      v_grn_amt := ROUND(r_grn.rcpt_amt,2);
"
"
"
"        /*IF p_bu = 'PREE' THEN
"
"	Raise_Application_Error(-20999,'HRM0'||'-'||v_grn_amt);
"
"    END IF;*/
"
"
"
"      pkg_budget.proc_upd_val_fr_xpns_cap_budget(p_bu,
"
"                                                   r_grn.porh_plnt,
"
"                                                   r_grn.porh_receipt_date,
"
"                                                   func_find_year(p_bu,r_grn.porh_receipt_date),
"
"                                                   func_find_period(p_bu,r_grn.porh_receipt_date),
"
"                                                   'GRNR',
"
"                                                   r_grn.porl_pur_acct,
"
"                                                   r_grn.porl_cc_code,
"
"                                                   r_grn.porh_receipt_pfx,
"
"                                                   r_grn.porh_receipt_no,
"
"                                                   r_grn.porl_seq_no,
"
"                                                   - v_grn_amt,
"
"                                                   p_user,
"
"                                                   r_grn.porl_proj_id
"
"						 --  'R'
"
"                                                   );
"
"
"
"        pkg_budget_matl.proc_upd_val_fr_matl_budget(p_bu,
"
"                                                    r_grn.porh_plnt,
"
"                                                    r_grn.porh_receipt_date,
"
"                                                    func_find_year(p_bu,r_grn.porh_receipt_date),
"
"                                                    func_find_period(p_bu,r_grn.porh_receipt_date),
"
"                                                    'GRN',
"
"                                                    r_grn.porl_pur_acct,
"
"                                                    CASE WHEN func_find_matl_bud_type(p_bu) = 'C'  THEN r_grn.porl_cls_id
"
"                                                         WHEN func_find_matl_bud_type(p_bu) = 'SC' THEN r_grn.porl_sub_cls_id
"
"                                                         WHEN func_find_matl_bud_type(p_bu) = 'G'  THEN r_grn.porl_prod_grp
"
"                                                         WHEN func_find_matl_bud_type(p_bu) = 'SG' THEN r_grn.porl_prod_subgrp
"
"                                                    END,
"
"                                                    r_grn.porh_receipt_pfx,
"
"                                                    r_grn.porh_receipt_no,
"
"                                                    r_grn.porl_seq_no,
"
"                                                    - v_grn_amt,
"
"                                                    p_user,
"
"                                                    r_grn.porl_proj_id
"
"                                                    );
"
"      END LOOP;
"
"    /*-----------------------------------------*/
"
"
"
"
"
"    /*IF p_bu = 'PREE' THEN
"
"	Raise_Application_Error(-20999,'HRM1');
"
"    END IF;*/
"
"      --v_vou_date := TRUNC(SYSDATE);
"
"      v_vou_date := cr1.porh_receipt_date;
"
"      v_vou_year := func_find_year(p_bu,v_vou_date);
"
"      v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"      IF c1%ROWCOUNT = 1 AND cr1.porh_tax_flag = 'Y' AND cr1.porh_wf_status <> 'A' THEN
"
"        pkg_tcs.proc_del_tcs_amt_frm_grn(p_bu,p_rcpt_pfx,p_rcpt_no,p_user);
"
"      END IF;
"
"
"
"      IF c1%ROWCOUNT = 1 AND cr1.porh_tax_flag = 'Y' AND cr1.porh_wf_status = 'A' THEN
"
"        pkg_tcs.proc_can_tcs_amt_frm_grn(p_bu,p_rcpt_pfx,p_rcpt_no,p_user);
"
"      END IF;
"
"
"
"      /*IF cr1.porl_status = 'P' THEN
"
"        Raise_Application_Error(-20150,'APM Cannot cancel partial GRN.');
"
"      ELSIF cr1.porl_status = 'N' AND cr1.porl_qc_doc_pfx IS NOT NULL AND cr1.porl_qc_doc_no IS NOT NULL THEN
"
"        Raise_Application_Error(-20444,'SFM Cannot cancel QC pending.');
"
"      ELSIF cr1.porl_status = 'Q' AND cr1.porl_receipt_qty <> (cr1.porl_accepted_qty + cr1.porl_rejected_qty + cr1.porl_aod_qty) THEN
"
"        Raise_Application_Error(-20444,'SFM Cannot cancel QC pending.');
"
"      END IF;*/
"
"
"
"
"
"      IF (cr1.porh_mode = 'PR' AND cr1.porh_type = 'SS') OR cr1.porl_matl_type = 'PC' OR
"
"	 (cr1.porh_mode = 'SC' AND cr1.porh_type = 'SL') OR (cr1.prod_stocked = 'N') THEN
"
"
"
"        UPDATE pur_ord_receipt_ln
"
"           SET porl_status = DECODE(porl_qc_sel_flag,'Y','N','Q'),
"
"	       porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	       porl_upd_by = p_user,
"
"	       porl_upd_date = SYSDATE,
"
"	       porl_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_receipt_qty,0),
"
"	       porl_rejected_qty = 0,
"
"	       porl_tot_accepted_qty = 0,--DECODE(porl_qc_sel_flag,'N',porl_receipt_qty,0), --Modify by Mohamed Yasir
"
"	       porl_tot_rejected_qty = 0,
"
"	       porl_tot_stk_acpt_qty = 0,
"
"	       porl_tot_stk_rej_qty = 0,
"
"               porl_stk_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_stock_receipt_qty,0),
"
"	       porl_stk_rejected_qty = 0
"
"         WHERE porl_bu = cr1.porl_bu
"
"           AND porl_receipt_no = cr1.porl_receipt_no
"
"           AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"	UPDATE pur_rcpt_lot_serial
"
"	   SET prcls_qty_accepted = DECODE(cr1.porl_qc_sel_flag,'N',prcls_lot_qty,0),
"
"	       prcls_qty_rejected = 0,
"
"	       prcls_tot_accepted = 0,
"
"	       prcls_tot_rejected = 0,
"
"	       prcls_tot_stk_acpt_qty = /*DECODE(cr1.porl_qc_sel_flag,'N',prcls_lot_qty,0)*/0,
"
"               prcls_tot_stk_rej_qty = 0,
"
"	       prcls_stk_acpt_qty = DECODE(cr1.porl_qc_sel_flag,'N',prcls_stk_rcpt_qty,0),
"
"	       prcls_stk_rej_qty  = 0,
"
"	       prcls_status = DECODE(cr1.porl_qc_sel_flag,'Y','N','Q')
"
"	 WHERE prcls_bu = cr1.porl_bu
"
"	   AND prcls_doc_no = cr1.porl_receipt_no
"
"	   AND prcls_doc_seq_no = cr1.porl_seq_no;
"
"
"
"      ELSE
"
"
"
"        IF cr1.porh_grn_source = 'SS' THEN
"
"	  v_ord_type := 'SS';
"
"	ELSIF cr1.porh_type = 'SP' THEN
"
"	  v_ord_type := 'SC';
"
"	ELSIF cr1.porh_type IN ('SV','RS','RV') THEN
"
"	  v_ord_type := cr1.porh_type;
"
"	ELSE
"
"	  v_ord_type := 'PO';
"
"	END IF;
"
"
"
"
"
"	IF cr1.porh_grn_source = 'PO' THEN
"
"          v_ord_pfx := NVL(cr1.porl_po_pfx,cr1.porh_receipt_pfx);
"
"	  v_ord_no := NVL(cr1.porl_po_no,cr1.porl_receipt_no);
"
"	  v_ord_seq_no := NVL(cr1.porl_po_seq_no,cr1.porl_seq_no);
"
"	  v_ord_sub_seq_no := cr1.porl_po_sub_seq_no;
"
"        ELSIF cr1.porh_grn_source = 'SS' THEN
"
"          v_ord_pfx := cr1.porl_ss_doc_pfx;
"
"	  v_ord_no := cr1.porl_ss_doc_no;
"
"	  v_ord_seq_no := cr1.porl_ss_seq_no;
"
"	  v_ord_sub_seq_no := cr1.porl_ss_sub_seq_no;
"
"        ELSIF cr1.porh_grn_source = 'PR' THEN
"
"          v_ord_pfx := cr1.porl_pr_pfx;
"
"	  v_ord_no := cr1.porl_pr_no;
"
"	  v_ord_seq_no := cr1.porl_pr_seq_no;
"
"	  v_ord_sub_seq_no := cr1.porl_pr_sub_seq_no;
"
"        ELSE
"
"          v_ord_pfx := cr1.porh_receipt_pfx;
"
"	  v_ord_no := cr1.porl_receipt_no;
"
"	  v_ord_seq_no := cr1.porl_seq_no;
"
"	  v_ord_sub_seq_no := NULL;
"
"        END IF;
"
"
"
"
"
"	v_upd_ref := SUBSTR('GRN Reverse #('||p_rcpt_pfx||'/'||p_rcpt_no||'/'||cr1.porl_seq_no||')/Order Dtls.#('||
"
"                            v_ord_pfx||'/'||v_ord_no||'/'||v_ord_seq_no||'/'||v_ord_sub_seq_no||')',1,200);
"
"
"
"
"
"        IF ((cr1.porh_mode = 'SC' OR func_find_prod_pur_with_mat(p_bu,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y')
"
"            AND cr1.porh_inspn_flag = 'N') THEN
"
"
"
"          IF cr1.porh_alloc_flag = 'Y' THEN
"
"
"
"            proc_dealloc_cons_mat_frm_grn(p_bu,cr1.porh_plnt,p_rcpt_pfx,p_rcpt_no,cr1.porl_seq_no,p_user,v_res);
"
"
"
"          END IF;
"
"
"
"          DELETE FROM sub_contr_rcpt_dc_mat_cons
"
"           WHERE scrdmc_bu = p_bu
"
"             AND scrdmc_rcpt_pfx = p_rcpt_pfx
"
"             AND scrdmc_rcpt_no = p_rcpt_no
"
"             AND scrdmc_seq_no = cr1.porl_seq_no;
"
"
"
"	  UPDATE pur_ord_receipt_hd
"
"	     SET porh_alloc_flag = 'N'
"
"	   WHERE porh_bu = p_bu
"
"	     AND porh_receipt_pfx = cr1.porh_receipt_pfx
"
"             AND porh_receipt_no = cr1.porl_receipt_no;
"
"
"
"        END IF;
"
"
"
"	IF cr1.porh_inspn_flag = 'Y' THEN
"
"
"
"	  IF cr1.porl_status = 'N' OR (cr1.porl_status = 'Q' AND cr1.porl_qc_doc_pfx IS NULl AND cr1.porl_qc_doc_no IS NULL) THEN
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'Q');
"
"	    v_rcpt_qty := cr1.porl_stock_receipt_qty;--cr1.porl_receipt_qty / cr1.porl_conv_factor;
"
"	  ELSIF cr1.porl_status = 'Q' THEN
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'Q');
"
"	    v_rcpt_qty := cr1.porl_stock_receipt_qty;--cr1.porl_receipt_qty / cr1.porl_conv_factor;
"
"	  ELSIF cr1.porl_status = 'R' THEN
"
"	    --v_store_id := cr1.porl_storage_store_id;
"
"	    --v_rcpt_qty := cr1.porl_stk_accepted_qty;--cr1.porl_accepted_qty / cr1.porl_conv_factor;
"
"	    v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'Q');
"
"	    v_rcpt_qty := cr1.porl_stock_receipt_qty;
"
"
"
"	    SELECT COUNT(*)
"
"	      INTO v_suplr_bill_cnt
"
"	      FROM suplr_doc_hd_hist_vw1,
"
"	           suplr_doc_ln_hist_vw1
"
"             WHERE suphd_bu = supln_bu
"
"	       AND suphd_doc_no = supln_doc_no
"
"	       AND suphd_bu = p_bu
"
"	       AND supln_receipt_pfx = p_rcpt_pfx
"
"	       AND supln_receipt_no = p_rcpt_no
"
"	       AND suphd_status <> 'D';
"
"
"
"            IF v_suplr_bill_cnt > 0 THEN
"
"	      Raise_Application_Error(-20256,'POM'||' '||'Supplier Bill already done for this GRN');
"
"            END IF;
"
"
"
"	  END IF;
"
"	  --For New Status Cancel
"
"	  FOR r_mrv IN (SELECT isthd_plnt,isthd_doc_no
"
"	                  FROM inv_stock_trans_hd_vw,inv_stock_trans_ln_vw
"
"			 WHERE isthd_bu = istln_bu
"
"			   AND isthd_doc_no = istln_doc_no
"
"			   AND isthd_bu = p_bu
"
"			   AND isthd_doc_oper = 'R'
"
"			   AND istln_vou_type = 'GRN'
"
"			   AND istln_vou_no = p_rcpt_no
"
"			   AND istln_status = 'N'
"
"			 GROUP BY isthd_plnt,isthd_doc_no
"
"			 ORDER BY 1)
"
"	  LOOP
"
"
"
"	    proc_can_mat_issue(p_bu,r_mrv.isthd_plnt,r_mrv.isthd_doc_no,NULL,p_user);
"
"
"
"	  END LOOP;
"
"
"
"	  FOR r_mrv IN (SELECT isthd_plnt,isthd_doc_no
"
"	                  FROM inv_stock_trans_hd_vw,inv_stock_trans_ln_vw
"
"			 WHERE isthd_bu = istln_bu
"
"			   AND isthd_doc_no = istln_doc_no
"
"			   AND isthd_bu = p_bu
"
"			   AND isthd_doc_oper = 'R'
"
"			   AND istln_vou_type = 'GRN'
"
"			   AND istln_vou_no = p_rcpt_no
"
"			   AND istln_status = 'I'
"
"			 GROUP BY isthd_plnt,isthd_doc_no
"
"			 ORDER BY 1)
"
"	  LOOP
"
"
"
"	    pkg_mat_rcpt.proc_rev_rcpt_frm_mat_rcpt(p_bu,r_mrv.isthd_doc_no,p_user,'-');
"
"
"
"	    proc_can_mat_issue(p_bu,r_mrv.isthd_plnt,r_mrv.isthd_doc_no,NULL,p_user);
"
"
"
"	  END LOOP;
"
"
"
"	  FOR r_miv IN (SELECT isthd_plnt,isthd_doc_no
"
"	                  FROM inv_stock_trans_hd_vw,inv_stock_trans_ln_vw
"
"			 WHERE isthd_bu = istln_bu
"
"			   AND isthd_doc_no = istln_doc_no
"
"			   AND isthd_bu = p_bu
"
"			   AND isthd_doc_oper = 'T'
"
"			   AND istln_vou_type = 'GRN'
"
"			   AND istln_vou_no = p_rcpt_no
"
"			   AND istln_status = 'I'
"
"			 GROUP BY isthd_plnt,isthd_doc_no
"
"			 ORDER BY 1)
"
"	  LOOP
"
"
"
"	    pkg_mat_iss.proc_rev_mat_frm_mi(p_bu,r_miv.isthd_plnt,r_miv.isthd_doc_no,p_user,1);
"
"
"
"	    proc_can_mat_issue(p_bu,r_miv.isthd_plnt,r_miv.isthd_doc_no,NULL,p_user);
"
"
"
"	  END LOOP;
"
"
"
"
"
"	  IF cr1.porh_mode = 'PR' OR (cr1.porh_mode = 'SC' AND cr1.porl_matl_type IN ('US','EB','SCR')) THEN
"
"
"
"            v_unit_cost := (((((cr1.porl_sc_unit_cost) + cr1.porl_sc_chrg_amt) - ((cr1.porl_sc_unit_cost) * (cr1.porl_disc_pct / 100)) ) * cr1.porh_exchange_rate) + cr1.porl_ap_lc_chrg_amt) * cr1.porl_conv_factor;
"
"
"
"	    proc_upd_stocks(p_bu,
"
"		            v_store_id,
"
"		            NULL,
"
"			    cr1.porl_prod_id,
"
"			    cr1.porl_prod_rev,
"
"			    0,
"
"			    0,
"
"			    -v_rcpt_qty,
"
"			    0,
"
"			    0,
"
"		            v_unit_cost,
"
"		            v_unit_cost,
"
"		            0,
"
"			    cr1.porl_net_disc_flag,
"
"			    0,
"
"			    0,
"
"			    0,
"
"			    v_ord_seq_no,
"
"			    v_ord_sub_seq_no,
"
"			    v_ord_pfx,
"
"			    v_ord_no,
"
"			    p_rcpt_pfx,
"
"			    p_rcpt_no,
"
"			    cr1.porh_suplr_id,
"
"			    v_vou_year,
"
"			    v_vou_period,
"
"			    v_vou_date,
"
"			    NULL,
"
"			    'POM',
"
"			    'GRN',
"
"			    NULL,
"
"			    p_user,
"
"			    SYSDATE,
"
"			    NULL,
"
"			    cr1.porl_cls_id,
"
"			    NULL,
"
"			    cr1.porh_type,
"
"			    NULL,
"
"			    0,
"
"			    0,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    NULL,
"
"			    cr1.porl_seq_no,
"
"			    NULL,
"
"			    0,
"
"			    0,
"
"			    cr1.porl_upd_ref1,
"
"			    v_upd_ref,
"
"			    p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			    p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			    p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			    p_prod_grp_id => cr1.porl_prod_grp,
"
"			    p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			    p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			    p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			    p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			   );
"
"
"
"	    IF cr1.prod_cost_method IN ('LIFO','FIFO') THEN
"
"	      FOR r_cb IN (SELECT sb_batch_id,(sb_qty_in - sb_qty_out) CB_Qty,sb_bc_unit_cost
"
"	                   FROM stocks_batches
"
"	  		  WHERE sb_bu = p_bu
"
"	  		    AND sb_store_id = v_store_id
"
"	  		    AND sb_prod_id = cr1.porl_prod_id
"
"	  		    AND sb_prod_rev = cr1.porl_prod_rev
"
"	  		    AND sb_receipt_pfx = p_rcpt_pfx
"
"	  		    AND sb_po_no = p_rcpt_no
"
"	  		    AND sb_receipt_seq_no = cr1.porl_seq_no
"
"			    AND (sb_qty_in - sb_qty_out) > 0
"
"			  ORDER BY sb_batch_id)
"
"	    LOOP
"
"
"
"	      proc_upd_stock_batches(p_bu,
"
"	                             v_store_id,
"
"	                             cr1.porl_prod_id,
"
"	                             cr1.porl_prod_rev,
"
"	                             r_cb.sb_batch_id,
"
"	                             -r_cb.CB_Qty,
"
"	                             0,
"
"	                             0,
"
"	                             0,
"
"	                             r_cb.sb_bc_unit_cost,
"
"	                             r_cb.sb_bc_unit_cost,
"
"	                             0,
"
"	                             0,
"
"	                             0,
"
"	                             0,
"
"	                             'N',
"
"                                     v_vou_date,
"
"	                             NULL,
"
"	                             p_rcpt_no,
"
"	                             cr1.porl_seq_no,
"
"	                             'MI',
"
"	                             NULL,
"
"	                             p_rcpt_no,
"
"	                             cr1.porl_seq_no,
"
"	                             NULL,
"
"	                             cr1.porl_cls_id,
"
"	                             'GRN',
"
"	                             'POM',
"
"	                             NULL,
"
"	                             NULL,
"
"	                             NULL,
"
"	                             NULL,
"
"	                             p_user,
"
"	  			     p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"	  			     p_prod_subcls => cr1.porl_sub_cls_id,
"
"	  			     p_prod_subcls_desc => cr1.porl_prod_subcls_desc,
"
"	  			     p_prod_grp => cr1.porl_prod_grp,
"
"	  			     p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"	  			     p_prod_subgrp => cr1.porl_prod_subgrp,
"
"	  			     p_prod_subgrp_desc => cr1.porl_prod_subgrp_desc,
"
"	  			     p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev),
"
"                                     p_reverse_flag => 'Y'
"
"	                            );
"
"	    END LOOP;
"
"	    END IF;
"
"
"
"	    IF cr1.prod_indicator = 'I' THEN
"
"
"
"	      proc_upd_so_stocks(p_bu,
"
"	                         v_store_id,
"
"				 cr1.porl_prod_id,
"
"				 cr1.porl_prod_rev,
"
"				 -v_rcpt_qty,
"
"				 0,
"
"				 v_unit_cost,
"
"				 cr1.porl_so_pfx,
"
"				 cr1.porl_so_no,
"
"				 cr1.porl_so_seq_no,
"
"				 cr1.porl_so_sub_seq_no,
"
"				 v_vou_date,
"
"				 v_ord_type,
"
"				 v_ord_pfx,
"
"				 v_ord_no,
"
"				 v_ord_seq_no,
"
"				 cr1.porh_receipt_pfx,
"
"				 cr1.porl_receipt_no,
"
"				 cr1.porl_seq_no,
"
"				 'GRN',
"
"				 'POM',
"
"				 cr1.porl_upd_ref1,
"
"				 v_upd_ref,
"
"				 p_user,
"
"				 cr1.porl_so_type,
"
"				 cr1.porl_proj_id,
"
"				 cr1.porl_task_id,
"
"				 p_so_prj_schld_desc => cr1.porl_so_schld_desc
"
"				);
"
"	    END IF;
"
"
"
"	    IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	      FOR cr_ls IN (SELECT prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_lot_qty,
"
"		                   prcls_qty_accepted,prcls_expiry_date,prcls_no_of_coils,
"
"				   prcls_org_lot_no,prcls_stk_acpt_qty,prcls_stk_rcpt_qty
"
"                              FROM pur_rcpt_lot_serial
"
"			     WHERE prcls_bu = p_bu
"
"			       AND prcls_doc_no = cr1.porl_receipt_no
"
"			       AND prcls_doc_seq_no = cr1.porl_seq_no
"
"			       AND prcls_apply_type = 'R')
"
"              LOOP
"
"
"
"                /*IF cr1.porl_status = 'R' THEN
"
"		--  v_lot_qty := cr_ls.prcls_qty_accepted;
"
"		  v_lot_qty := cr_ls.prcls_stk_acpt_qty;
"
"		ELSE
"
"		 -- v_lot_qty := cr_ls.prcls_lot_qty;
"
"		  v_lot_qty := cr_ls.prcls_stk_rcpt_qty;
"
"		END IF;*/
"
"
"
"		v_lot_qty := cr_ls.prcls_stk_rcpt_qty;
"
"		/*
"
"		IF cr1.porl_ls_uom_gen_type = 'S' THEN
"
"		  v_lot_qty := ROUND(v_lot_qty/cr1.porl_conv_factor,3);
"
"		END IF;*/
"
"
"
"                proc_upd_lot_ser_stocks(p_bu,
"
"	                                v_store_id,
"
"					cr1.porl_prod_id,
"
"					cr1.porl_prod_rev,
"
"					cr_ls.prcls_sys_ls_no,
"
"					-v_lot_qty,
"
"					0,
"
"					0,
"
"					v_unit_cost,
"
"					cr1.prod_ser_lot_opt,
"
"					cr_ls.prcls_lot_no,
"
"					cr_ls.prcls_serial_no,
"
"					'V',
"
"					cr1.porh_suplr_id,
"
"					cr_ls.prcls_expiry_date,
"
"					v_vou_date,
"
"					'GRN',
"
"					cr1.porh_receipt_pfx,
"
"					cr1.porl_receipt_no,
"
"					cr1.porl_seq_no,
"
"					'POM',
"
"					cr1.porl_upd_ref1,
"
"					v_upd_ref,
"
"					p_user,
"
"					p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					p_org_lot_no => cr_ls.prcls_org_lot_no
"
"				       );
"
"
"
"              END LOOP;
"
"
"
"	    END IF;
"
"
"
"	    IF func_find_store_bin_flag(p_bu,v_store_id) = 'Y' THEN
"
"
"
"              FOR cr_bin_stk IN (SELECT *
"
"                                   FROM pur_rct_put_away
"
"				  WHERE prpa_bu = p_bu
"
"				    AND prpa_receipt_pfx = cr1.porh_receipt_pfx
"
"				    AND prpa_receipt_no = cr1.porh_receipt_no
"
"				    AND prpa_rcpt_seq_no = cr1.porl_seq_no
"
"				    AND prpa_bin_flag = 'Y')
"
"              LOOP
"
"
"
"                proc_upd_bin_stocks(p_bu,
"
"		                    cr_bin_stk.prpa_store_id,
"
"		                    cr1.porl_prod_id,
"
"		                    cr1.porl_prod_rev,
"
"		                    cr_bin_stk.prpa_bin_id,
"
"		                    cr_bin_stk.prpa_sys_ls_no,
"
"		                    cr_bin_stk.prpa_lot_no,
"
"		                    cr_bin_stk.prpa_serial_no,
"
"		                    'V',
"
"		                    cr1.porh_suplr_id,
"
"		                    -(cr_bin_stk.prpa_qty / cr1.porl_conv_factor),
"
"		                    0,
"
"		                    0,
"
"		                    (cr_bin_stk.prpa_qty / cr1.porl_conv_factor),
"
"		                    cr1.porl_sc_unit_cost,
"
"		                    cr1.porh_receipt_date,
"
"		                    'GRN',
"
"		                    cr1.porh_receipt_pfx,
"
"		                    cr1.porh_receipt_no,
"
"		                    cr1.porl_seq_no,
"
"		                    'POM',
"
"		                    p_user
"
"		                   );
"
"
"
"                UPDATE pur_rct_put_away
"
"                   SET prpa_bin_flag = 'N'
"
"                 WHERE prpa_bu = p_bu
"
"                   AND prpa_receipt_pfx = cr1.porh_receipt_pfx
"
"                   AND prpa_receipt_no = cr1.porh_receipt_no
"
"                   AND prpa_rcpt_seq_no = cr1.porl_seq_no
"
"                   AND prpa_prod_id = cr_bin_stk.prpa_prod_id
"
"                   AND prpa_prod_rev = cr_bin_stk.prpa_prod_rev
"
"                   AND (prpa_lot_no = cr_bin_stk.prpa_lot_no OR prpa_lot_no IS NULL)
"
"                   AND (prpa_serial_no = cr_bin_stk.prpa_serial_no OR prpa_serial_no IS NULL)
"
"                   AND prpa_bin_id = cr_bin_stk.prpa_bin_id;
"
"
"
"              END LOOP;
"
"
"
"	    END IF;
"
"
"
"	    IF cr1.porh_type = 'TS'  THEN --AND func_find_stk_trns_rqrd_flag(p_bu) = 'Y' by prabha
"
"
"
"	      SELECT COUNT(suplr_suplr_id)
"
"	        INTO v_stk_trf_cnt
"
"	        FROM suppliers
"
"	       WHERE suplr_bu = p_bu
"
"	         AND suplr_suplr_id = cr1.porh_suplr_id
"
"		 AND suplr_transfer_bu IS NOT NULL
"
"		 AND suplr_transfer_plnt IS NOT NULL;
"
"
"
"              IF v_stk_trf_cnt > 0 THEN
"
"
"
"	        proc_upd_stocks(p_bu,
"
"		                func_find_deflt_storeid(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,cr1.porl_prod_id,cr1.porl_prod_rev,'N'),
"
"		                NULL,
"
"		                cr1.porl_prod_id,
"
"		                cr1.porl_prod_rev,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                v_unit_cost,
"
"		                v_unit_cost,
"
"		                0,
"
"		                cr1.porl_net_disc_flag,
"
"		                0,
"
"		                0,
"
"		                0,
"
"		                v_ord_seq_no,
"
"		                v_ord_sub_seq_no,
"
"		                v_ord_pfx,
"
"		                v_ord_no,
"
"		                p_rcpt_pfx,
"
"		                p_rcpt_no,
"
"		                cr1.porh_suplr_id,
"
"		                v_vou_year,
"
"		                v_vou_period,
"
"		                v_vou_date,
"
"		                NULL,
"
"		                'POM',
"
"		                'GRN',
"
"		                NULL,
"
"		                p_user,
"
"		                SYSDATE,
"
"		                NULL,
"
"		                cr1.porl_cls_id,
"
"		                NULL,
"
"		                cr1.porh_type,
"
"		                NULL,
"
"		                0,
"
"		                0,
"
"		                NULL,
"
"		                NULL,
"
"		                NULL,
"
"		                NULL,
"
"		                NULL,
"
"		                cr1.porl_seq_no,
"
"		                NULL,
"
"		                0,
"
"		                0,
"
"		                cr1.porl_upd_ref1,
"
"		                v_upd_ref,
"
"		                p_stock_transit_in => v_rcpt_qty,
"
"			        p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			        p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			        p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			        p_prod_grp_id => cr1.porl_prod_grp,
"
"			        p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			        p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			        p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"		               );
"
"
"
"              END IF;
"
"
"
"	    END IF;
"
"
"
"	    /*IF cr1.porl_aod_qty > 0 AND cr1.porl_status = 'R' THEN
"
"
"
"	      v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'A');
"
"	      v_aod_qty := cr1.porl_stk_aod_qty;--cr1.porl_aod_qty / cr1.porl_conv_factor;
"
"
"
"	      proc_upd_stocks(p_bu,
"
"		              v_store_id,
"
"			      NULL,
"
"			      cr1.porl_prod_id,
"
"			      cr1.porl_prod_rev,
"
"			      0,
"
"			      0,
"
"			      -v_aod_qty,
"
"			      0,
"
"			      0,
"
"			      v_unit_cost,
"
"			      v_unit_cost,
"
"			      0,
"
"			      cr1.porl_net_disc_flag,
"
"			      0,
"
"			      0,
"
"			      0,
"
"			      v_ord_seq_no,
"
"			      v_ord_sub_seq_no,
"
"			      v_ord_pfx,
"
"			      v_ord_no,
"
"			      p_rcpt_pfx,
"
"			      p_rcpt_no,
"
"			      cr1.porh_suplr_id,
"
"			      v_vou_year,
"
"			      v_vou_period,
"
"			      v_vou_date,
"
"			      NULL,
"
"			      'POM',
"
"			      'GRN',
"
"			      NULL,
"
"			      p_user,
"
"			      SYSDATE,
"
"			      NULL,
"
"			      cr1.porl_cls_id,
"
"			      NULL,
"
"			      cr1.porh_type,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      cr1.porl_seq_no,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      cr1.porl_upd_ref1,
"
"			      v_upd_ref,
"
"			      p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			      p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			      p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			      p_prod_grp_id => cr1.porl_prod_grp,
"
"			      p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			      p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			      p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			      p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			     );
"
"
"
"	      IF cr1.prod_indicator = 'I' THEN
"
"
"
"	        proc_upd_so_stocks(p_bu,
"
"	                           v_store_id,
"
"				   cr1.porl_prod_id,
"
"				   cr1.porl_prod_rev,
"
"				   -v_aod_qty,
"
"				   0,
"
"				   v_unit_cost,
"
"				   cr1.porl_so_pfx,
"
"				   cr1.porl_so_no,
"
"				   cr1.porl_so_seq_no,
"
"				   cr1.porl_so_sub_seq_no,
"
"				   v_vou_date,
"
"				   v_ord_type,
"
"				   v_ord_pfx,
"
"				   v_ord_no,
"
"				   v_ord_seq_no,
"
"				   cr1.porh_receipt_pfx,
"
"				   cr1.porl_receipt_no,
"
"				   cr1.porl_seq_no,
"
"				   'GRN',
"
"				   'POM',
"
"				   cr1.porl_upd_ref1,
"
"				   v_upd_ref,
"
"				   p_user,
"
"				   cr1.porl_so_type,
"
"				   cr1.porl_proj_id,
"
"				   cr1.porl_task_id
"
"				  );
"
"	      END IF;
"
"
"
"	      IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	        FOR cr_ls IN (SELECT prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_aod_qty,
"
"		                     prcls_expiry_date,prcls_no_of_coils,prcls_org_lot_no
"
"                                FROM pur_rcpt_lot_serial
"
"                               WHERE prcls_bu = p_bu
"
"				 AND prcls_doc_no = cr1.porl_receipt_no
"
"				 AND prcls_doc_seq_no = cr1.porl_seq_no
"
"				 AND prcls_apply_type = 'R'
"
"				 AND prcls_aod_qty > 0)
"
"                LOOP
"
"
"
"                  v_lot_qty := cr_ls.prcls_aod_qty;
"
"		  IF cr1.porl_ls_uom_gen_type = 'S' THEN
"
"		    v_lot_qty := ROUND(v_lot_qty/cr1.porl_conv_factor,3);
"
"		  END IF;
"
"
"
"                  proc_upd_lot_ser_stocks(p_bu,
"
"	                                  v_store_id,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr_ls.prcls_sys_ls_no,
"
"					  -v_lot_qty,
"
"					  0,
"
"					  0,
"
"					  v_unit_cost,
"
"					  cr1.prod_ser_lot_opt,
"
"					  cr_ls.prcls_lot_no,
"
"					  cr_ls.prcls_serial_no,
"
"					  'V',
"
"					  cr1.porh_suplr_id,
"
"					  cr_ls.prcls_expiry_date,
"
"					  v_vou_date,
"
"					  'GRN',
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  'POM',
"
"					  cr1.porl_upd_ref1,
"
"					  v_upd_ref,
"
"					  p_user,
"
"					  p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					  p_org_lot_no => cr_ls.prcls_org_lot_no
"
"					 );
"
"
"
"                END LOOP;
"
"
"
"	      END IF;
"
"
"
"	    END IF;*/
"
"
"
"	   /* IF cr1.porl_rejected_qty > 0 AND cr1.porl_status = 'R' THEN
"
"
"
"	      --v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'J');
"
"
"
"	      BEGIN
"
"	        SELECT ppl_rejt_store_id INTO v_store_id
"
"		  FROM prod_plants_loc
"
"		 WHERE ppl_bu = p_bu
"
"		   AND ppl_plnt = cr1.porl_plnt
"
"		   AND ppl_prod_id = cr1.porl_prod_id
"
"		   AND ppl_prod_rev = cr1.porl_prod_rev
"
"		   AND ppl_plnt_loc_id = cr1.porh_plnt_loc_id;
"
"	      EXCEPTION
"
"	        WHEN NO_DATA_FOUND THEN
"
"		  Raise_Application_Error(-20032,'ICM Rejection Warehouse'||p_bu||'-'||cr1.porl_plnt||'-'||cr1.porh_plnt_loc_id);
"
"	      END;
"
"
"
"	      v_rej_qty := cr1.porl_stk_rejected_qty;--cr1.porl_rejected_qty / cr1.porl_conv_factor;
"
"
"
"	      proc_upd_stocks(p_bu,
"
"		              v_store_id,
"
"			      NULL,
"
"			      cr1.porl_prod_id,
"
"			      cr1.porl_prod_rev,
"
"			      0,
"
"			      0,
"
"			      -v_rej_qty,
"
"			      0,
"
"			      0,
"
"			      v_unit_cost,
"
"			      v_unit_cost,
"
"			      0,
"
"			      cr1.porl_net_disc_flag,
"
"			      0,
"
"			      0,
"
"			      0,
"
"			      v_ord_seq_no,
"
"			      v_ord_sub_seq_no,
"
"			      v_ord_pfx,
"
"			      v_ord_no,
"
"			      p_rcpt_pfx,
"
"			      p_rcpt_no,
"
"			      cr1.porh_suplr_id,
"
"			      v_vou_year,
"
"			      v_vou_period,
"
"			      v_vou_date,
"
"			      NULL,
"
"			      'POM',
"
"			      'GRN',
"
"			      NULL,
"
"			      p_user,
"
"			      SYSDATE,
"
"			      NULL,
"
"			      cr1.porl_cls_id,
"
"			      NULL,
"
"			      cr1.porh_type,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      cr1.porl_seq_no,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      cr1.porl_upd_ref1,
"
"			      v_upd_ref,
"
"			      p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			      p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			      p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			      p_prod_grp_id => cr1.porl_prod_grp,
"
"			      p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			      p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			      p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			      p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			     );
"
"
"
"	      IF cr1.prod_indicator = 'I' THEN
"
"
"
"	        proc_upd_so_stocks(p_bu,
"
"	                           v_store_id,
"
"				   cr1.porl_prod_id,
"
"				   cr1.porl_prod_rev,
"
"				   -v_rej_qty,
"
"				   0,
"
"				   v_unit_cost,
"
"				   cr1.porl_so_pfx,
"
"				   cr1.porl_so_no,
"
"				   cr1.porl_so_seq_no,
"
"				   cr1.porl_so_sub_seq_no,
"
"				   v_vou_date,
"
"				   v_ord_type,
"
"				   v_ord_pfx,
"
"				   v_ord_no,
"
"				   v_ord_seq_no,
"
"				   cr1.porh_receipt_pfx,
"
"				   cr1.porl_receipt_no,
"
"				   cr1.porl_seq_no,
"
"				   'GRN',
"
"				   'POM',
"
"				   cr1.porl_upd_ref1,
"
"				   v_upd_ref,
"
"				   p_user,
"
"				   cr1.porl_so_type,
"
"				   cr1.porl_proj_id,
"
"				   cr1.porl_task_id
"
"				  );
"
"	      END IF;
"
"
"
"	      IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	        FOR cr_ls IN (SELECT prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_qty_rejected,prcls_stk_rej_qty,
"
"		                     prcls_expiry_date,prcls_no_of_coils,prcls_org_lot_no
"
"                                FROM pur_rcpt_lot_serial
"
"                               WHERE prcls_bu = p_bu
"
"				 AND prcls_doc_no = cr1.porl_receipt_no
"
"				 AND prcls_doc_seq_no = cr1.porl_seq_no
"
"				 AND prcls_apply_type = 'R'
"
"				 AND prcls_qty_rejected > 0)
"
"                LOOP
"
"
"
"                  v_lot_qty := cr_ls.prcls_stk_rej_qty;
"
"
"
"                  proc_upd_lot_ser_stocks(p_bu,
"
"	                                  v_store_id,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr_ls.prcls_sys_ls_no,
"
"					  -v_lot_qty,
"
"					  0,
"
"					  0,
"
"					  v_unit_cost,
"
"					  cr1.prod_ser_lot_opt,
"
"					  cr_ls.prcls_lot_no,
"
"					  cr_ls.prcls_serial_no,
"
"					  'V',
"
"					  cr1.porh_suplr_id,
"
"					  cr_ls.prcls_expiry_date,
"
"					  v_vou_date,
"
"					  'GRN',
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  'POM',
"
"					  cr1.porl_upd_ref1,
"
"					  v_upd_ref,
"
"					  p_user,
"
"					  p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					  p_org_lot_no => cr_ls.prcls_org_lot_no
"
"					 );
"
"
"
"                END LOOP;
"
"
"
"	      END IF;
"
"
"
"	    END IF;*/
"
"
"
"
"
"	    IF cr1.porl_excess_qty > 0 THEN
"
"
"
"	      v_store_id := func_find_store_fr_type(p_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,'X');
"
"	      v_excs_qty := cr1.porl_excess_qty/cr1.porl_conv_factor;
"
"
"
"	      proc_upd_stocks(p_bu,
"
"		              v_store_id,
"
"			      NULL,
"
"			      cr1.porl_prod_id,
"
"			      cr1.porl_prod_rev,
"
"			      0,
"
"			      0,
"
"			      -v_excs_qty,
"
"			      0,
"
"			      0,
"
"			      v_unit_cost,
"
"			      v_unit_cost,
"
"			      0,
"
"			      cr1.porl_net_disc_flag,
"
"			      0,
"
"			      0,
"
"			      0,
"
"			      v_ord_seq_no,
"
"			      v_ord_sub_seq_no,
"
"			      v_ord_pfx,
"
"			      v_ord_no,
"
"			      p_rcpt_pfx,
"
"			      p_rcpt_no,
"
"			      cr1.porh_suplr_id,
"
"			      v_vou_year,
"
"			      v_vou_period,
"
"			      v_vou_date,
"
"			      NULL,
"
"			      'POM',
"
"			      'GRN',
"
"			      NULL,
"
"			      p_user,
"
"			      SYSDATE,
"
"			      NULL,
"
"			      cr1.porl_cls_id,
"
"			      NULL,
"
"			      cr1.porh_type,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      NULL,
"
"			      cr1.porl_seq_no,
"
"			      NULL,
"
"			      0,
"
"			      0,
"
"			      cr1.porl_upd_ref1,
"
"			      v_upd_ref,
"
"			      p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			      p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			      p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			      p_prod_grp_id => cr1.porl_prod_grp,
"
"			      p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			      p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			      p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			      p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			     );
"
"
"
"	      IF cr1.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	        FOR cr_ls IN (SELECT *
"
"                                FROM pur_rcpt_lot_serial
"
"                               WHERE prcls_bu = p_bu
"
"				 AND prcls_doc_no = cr1.porl_receipt_no
"
"				 AND prcls_doc_seq_no = cr1.porl_seq_no
"
"				 AND prcls_apply_type = 'E')
"
"                LOOP
"
"                  v_lot_qty := cr_ls.prcls_lot_qty;
"
"		  IF cr1.porl_ls_uom_gen_type = 'S' THEN
"
"		    v_lot_qty := ROUND(v_lot_qty/cr1.porl_conv_factor,3);
"
"		  END IF;
"
"                  proc_upd_lot_ser_stocks(p_bu,
"
"	                                  v_store_id,
"
"					  cr1.porl_prod_id,
"
"					  cr1.porl_prod_rev,
"
"					  cr_ls.prcls_sys_ls_no,
"
"					  -v_lot_qty,
"
"					  0,
"
"					  0,
"
"					  v_unit_cost,
"
"					  cr1.prod_ser_lot_opt,
"
"					  cr_ls.prcls_lot_no,
"
"					  cr_ls.prcls_serial_no,
"
"					  'V',
"
"					  cr1.porh_suplr_id,
"
"					  cr_ls.prcls_expiry_date,
"
"					  v_vou_date,
"
"					  'GRN',
"
"					  cr1.porh_receipt_pfx,
"
"					  cr1.porl_receipt_no,
"
"					  cr1.porl_seq_no,
"
"					  'POM',
"
"					  cr1.porl_upd_ref1,
"
"					  v_upd_ref,
"
"					  p_user,
"
"					  p_no_of_bales => cr_ls.prcls_no_of_coils,
"
"					  p_org_lot_no => cr_ls.prcls_org_lot_no
"
"					 );
"
"
"
"                END LOOP;
"
"
"
"	      END IF;
"
"
"
"	    END IF;
"
"
"
"	    IF func_find_prod_pur_with_mat(cr1.porl_bu,cr1.porl_prod_id,cr1.porl_prod_rev) = 'Y' THEN
"
"
"
"	      FOR cr_sc_ln IN (SELECT *
"
"       		                 FROM sub_contr_mat_cons_lot_ser
"
"       		                WHERE scmcls_bu = cr1.porl_bu
"
"       		                  AND scmcls_receipt_pfx = cr1.porh_receipt_pfx
"
"       		                  AND scmcls_receipt_no = cr1.porl_receipt_no
"
"				  AND scmcls_seq_no = cr1.porl_seq_no
"
"				  AND scmcls_act_cons_qty > 0)
"
"              LOOP
"
"
"
"		v_store_id := func_find_benf_store(cr1.porl_bu,cr1.porl_plnt,cr1.porh_plnt_loc_id,cr1.porh_suplr_id,'V');
"
"		v_unit_cost := cr_sc_ln.scmcls_unit_cost;
"
"		proc_upd_stocks(cr1.porl_bu,
"
"       			        v_store_id,
"
"				NULL,
"
"				cr_sc_ln.scmcls_prod_id,
"
"				cr_sc_ln.scmcls_prod_rev,
"
"				0,
"
"				0,
"
"				(cr_sc_ln.scmcls_act_cons_qty),
"
"				0,
"
"				0,
"
"				v_unit_cost,
"
"				v_unit_cost,
"
"				0,
"
"				0,
"
"				0,
"
"				0,
"
"				0,
"
"				cr_sc_ln.scmcls_seq_no,
"
"				0,
"
"				v_ord_pfx,
"
"				v_ord_no,
"
"				cr1.porh_receipt_pfx,
"
"				cr1.porl_receipt_no,
"
"				cr1.porh_suplr_id,
"
"				v_vou_year,
"
"				v_vou_period,
"
"				v_vou_date,
"
"				NULL,
"
"				'POM',
"
"				'GRN',
"
"				NULL,
"
"				p_user,
"
"				SYSDATE,
"
"				NULL,
"
"				cr1.porl_cls_id,
"
"				NULL,
"
"				cr1.porh_type,
"
"				NULL,
"
"				0,
"
"				0,
"
"				NULL,
"
"				NULL,
"
"				NULL,
"
"				NULL,
"
"				NULL,
"
"				cr1.porl_seq_no,
"
"				0,
"
"				0,
"
"				0,
"
"				cr1.porl_upd_ref1,
"
"				v_upd_ref,
"
"				0,
"
"			        p_prod_cls_desc => cr1.porl_prod_cls_desc,
"
"			        p_prod_sub_cls_id => cr1.porl_sub_cls_id,
"
"			        p_prod_sub_cls_desc => cr1.porl_prod_subcls_desc,
"
"			        p_prod_grp_id => cr1.porl_prod_grp,
"
"			        p_prod_grp_desc => cr1.porl_prod_grp_desc,
"
"			        p_prod_sub_grp_id => cr1.porl_prod_subgrp,
"
"			        p_prod_sub_grp_desc => cr1.porl_prod_subgrp_desc,
"
"			        p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr1.porl_prod_id,cr1.porl_prod_rev)
"
"			       );
"
"	      END LOOP;
"
"
"
"	    END IF;
"
"
"
"	    IF cr1.porh_mode = 'SC' THEN
"
"
"
"	      proc_can_mat_cons_frm_grn(cr1.porl_bu,
"
"                                        cr1.porl_plnt,cr1.porl_plnt_loc_id,
"
"					cr1.porh_receipt_pfx,
"
"					cr1.porl_receipt_no,
"
"					cr1.porl_seq_no,
"
"					v_ord_pfx,
"
"					v_ord_no,
"
"					v_ord_seq_no,
"
"					v_ord_sub_seq_no,
"
"					cr1.porl_prod_ord_no,
"
"					cr1.porh_receipt_date,--v_vou_date,
"
"					v_ord_type,
"
"					cr1.porh_suplr_id,
"
"					cr1.porl_prod_id,
"
"					cr1.porl_prod_rev,
"
"					cr1.porl_cls_id,
"
"					cr1.porl_so_type,
"
"					cr1.porl_so_pfx,
"
"					cr1.porl_so_no,
"
"					cr1.porl_so_seq_no,
"
"					cr1.porl_so_sub_seq_no,
"
"					cr1.porl_proj_id,
"
"					cr1.porl_task_id,
"
"					cr1.porl_receipt_qty,
"
"					cr1.porl_conv_factor,
"
"					cr1.porl_upd_ref1,
"
"					cr1.porl_upd_ref2,
"
"					p_user
"
"				       );
"
"
"
"	    END IF;
"
"
"
"            UPDATE tqm_qc_ln
"
"               SET tqln_status = 'L',
"
"	           tqln_can_ref = 'GRN Correction.'
"
"             WHERE tqln_bu = p_bu
"
"               AND tqln_qc_no = cr1.porl_qc_doc_no;
"
"
"
"            UPDATE tqm_qc_hd
"
"               SET tqhd_status = 'L'
"
"             WHERE tqhd_bu = p_bu
"
"               AND tqhd_qc_pfx = cr1.porl_qc_doc_pfx
"
"               AND tqhd_qc_no = cr1.porl_qc_doc_no;
"
"
"
"            UPDATE tqm_qc_plan_ln
"
"               SET tqpln_status = 'L'
"
"             WHERE tqpln_bu = p_bu
"
"               AND tqpln_pln_no = cr1.porl_qc_doc_no;
"
"
"
"            UPDATE tqm_qc_plan_hd
"
"               SET tqphd_status = 'L'
"
"             WHERE tqphd_bu = p_bu
"
"               AND tqphd_pln_pfx = cr1.porl_qc_doc_pfx
"
"               AND tqphd_pln_no = cr1.porl_qc_doc_no;
"
"
"
"            UPDATE tqm_qc_ln_hist
"
"               SET tqlnh_status = 'L',
"
"	           tqlnh_can_ref = 'GRN Correction.'
"
"             WHERE tqlnh_bu = p_bu
"
"               AND tqlnh_qc_pfx = cr1.porl_qc_doc_pfx
"
"               AND tqlnh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"            UPDATE tqm_qc_hd_hist
"
"               SET tqhdh_status = 'L'
"
"             WHERE tqhdh_bu = p_bu
"
"               AND tqhdh_qc_pfx = cr1.porl_qc_doc_pfx
"
"               AND tqhdh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"            UPDATE tqm_qc_plan_ln_hist
"
"               SET tqplnh_status = 'L'
"
"             WHERE tqplnh_bu = p_bu
"
"               AND tqplnh_pln_pfx = cr1.porl_qc_doc_pfx
"
"               AND tqplnh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"            UPDATE tqm_qc_plan_hd_hist
"
"               SET tqphdh_status = 'L'
"
"             WHERE tqphdh_bu = p_bu
"
"               AND tqphdh_pln_pfx = cr1.porl_qc_doc_pfx
"
"               AND tqphdh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"	    UPDATE pur_ord_receipt_ln
"
"               SET porl_status = DECODE(porl_qc_sel_flag,'Y','N','Q'),
"
"	           porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	           porl_upd_by = p_user,
"
"	           porl_upd_date = SYSDATE,
"
"	           porl_tot_accepted_qty = 0,
"
"	           porl_tot_rejected_qty = 0,
"
"		   porl_tot_stk_acpt_qty = 0,
"
"	           porl_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_receipt_qty,0),
"
"	           porl_rejected_qty = 0,
"
"		   porl_stk_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_stock_receipt_qty,0),
"
"		   porl_stk_rejected_qty = 0,
"
"		   porl_qc_doc_pfx = NULL,
"
"		   porl_qc_doc_no = NULL
"
"             WHERE porl_bu = p_bu
"
"	       AND porl_receipt_no = p_rcpt_no
"
"	       AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"	    UPDATE pur_rcpt_lot_serial
"
"	       SET prcls_qty_accepted = DECODE(cr1.porl_qc_sel_flag,'N',prcls_lot_qty,0),
"
"		   prcls_tot_accepted = 0,
"
"		   prcls_stk_acpt_qty = DECODE(cr1.porl_qc_sel_flag,'N',prcls_stk_rcpt_qty,0),
"
"		   prcls_tot_stk_acpt_qty = 0,
"
"		   prcls_qty_rejected = 0,
"
"	           prcls_tot_rejected = 0,
"
"		   prcls_stk_rej_qty = 0,
"
"		   prcls_tot_stk_rej_qty = 0,
"
"	           prcls_status = DECODE(cr1.porl_qc_sel_flag,'Y','N','Q'),
"
"		   prcls_aod_qty = 0,
"
"		   prcls_tot_aod_qty = 0,
"
"		   prcls_stk_aod_qty = 0,
"
"		   prcls_tot_stk_aod_qty = 0
"
"	    WHERE prcls_bu = cr1.porl_bu
"
"	      AND prcls_doc_no = cr1.porl_receipt_no
"
"	      AND prcls_doc_seq_no = cr1.porl_seq_no;
"
"
"
"	  ELSIF cr1.porh_mode = 'SC' THEN
"
"
"
"	    Raise_Application_Error(-20999,'HRM ');
"
"
"
"	  END IF;
"
"
"
"          UPDATE tqm_qc_ln
"
"             SET tqln_status = 'L'
"
"           WHERE tqln_bu = p_bu
"
"             AND tqln_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_hd
"
"             SET tqhd_status = 'L'
"
"           WHERE tqhd_bu = p_bu
"
"             AND tqhd_qc_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqhd_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_ln
"
"             SET tqpln_status = 'L'
"
"           WHERE tqpln_bu = p_bu
"
"             AND tqpln_pln_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_hd
"
"             SET tqphd_status = 'L'
"
"           WHERE tqphd_bu = p_bu
"
"             AND tqphd_pln_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqphd_pln_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_ln_hist
"
"             SET tqlnh_status = 'L'
"
"           WHERE tqlnh_bu = p_bu
"
"             AND tqlnh_qc_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqlnh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_hd_hist
"
"             SET tqhdh_status = 'L'
"
"           WHERE tqhdh_bu = p_bu
"
"             AND tqhdh_qc_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqhdh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_ln_hist
"
"             SET tqplnh_status = 'L'
"
"           WHERE tqplnh_bu = p_bu
"
"             AND tqplnh_pln_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqplnh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_hd_hist
"
"             SET tqphdh_status = 'L'
"
"           WHERE tqphdh_bu = p_bu
"
"             AND tqphdh_pln_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqphdh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"	  UPDATE pur_ord_receipt_ln
"
"             SET porl_status = DECODE(porl_qc_sel_flag,'Y','N','Q'),
"
"	         porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	         porl_upd_by = p_user,
"
"	         porl_upd_date = SYSDATE,
"
"	         porl_tot_accepted_qty = 0,
"
"	         porl_tot_rejected_qty = 0,
"
"	         porl_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_receipt_qty,0),
"
"	         porl_rejected_qty = 0,
"
"		 porl_stk_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_stock_receipt_qty,0),
"
"		 porl_stk_rejected_qty = 0,
"
"		 porl_qc_doc_pfx = NULL,
"
"		 porl_qc_doc_no = NULL
"
"           WHERE porl_bu = p_bu
"
"	     AND porl_receipt_no = p_rcpt_no
"
"	     AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"	    UPDATE pur_rcpt_lot_serial
"
"	       SET prcls_qty_accepted = DECODE(cr1.porl_qc_sel_flag,'N',prcls_lot_qty,0),
"
"		   prcls_tot_accepted = 0,
"
"		   prcls_stk_acpt_qty = DECODE(cr1.porl_qc_sel_flag,'N',prcls_stk_rcpt_qty,0),
"
"		   prcls_tot_stk_acpt_qty = 0,
"
"		   prcls_qty_rejected = 0,
"
"	           prcls_tot_rejected = 0,
"
"		   prcls_stk_rej_qty = 0,
"
"		   prcls_tot_stk_rej_qty = 0,
"
"	           prcls_status = DECODE(cr1.porl_qc_sel_flag,'Y','N','Q'),
"
"		   prcls_aod_qty = 0,
"
"		   prcls_tot_aod_qty = 0,
"
"		   prcls_stk_aod_qty = 0,
"
"		   prcls_tot_stk_aod_qty = 0
"
"	    WHERE prcls_bu = cr1.porl_bu
"
"	      AND prcls_doc_no = cr1.porl_receipt_no
"
"	      AND prcls_doc_seq_no = cr1.porl_seq_no;
"
"
"
"	ELSE
"
"
"
"          UPDATE tqm_qc_ln
"
"             SET tqln_status = 'L'
"
"           WHERE tqln_bu = p_bu
"
"             AND tqln_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_hd
"
"             SET tqhd_status = 'L'
"
"           WHERE tqhd_bu = p_bu
"
"             AND tqhd_qc_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqhd_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_ln
"
"             SET tqpln_status = 'L'
"
"           WHERE tqpln_bu = p_bu
"
"             AND tqpln_pln_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_hd
"
"             SET tqphd_status = 'L'
"
"           WHERE tqphd_bu = p_bu
"
"             AND tqphd_pln_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqphd_pln_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_ln_hist
"
"             SET tqlnh_status = 'L'
"
"           WHERE tqlnh_bu = p_bu
"
"             AND tqlnh_qc_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqlnh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_hd_hist
"
"             SET tqhdh_status = 'L'
"
"           WHERE tqhdh_bu = p_bu
"
"             AND tqhdh_qc_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqhdh_qc_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_ln_hist
"
"             SET tqplnh_status = 'L'
"
"           WHERE tqplnh_bu = p_bu
"
"             AND tqplnh_pln_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqplnh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE tqm_qc_plan_hd_hist
"
"             SET tqphdh_status = 'L'
"
"           WHERE tqphdh_bu = p_bu
"
"             AND tqphdh_pln_pfx = cr1.porl_qc_doc_pfx
"
"             AND tqphdh_pln_no = cr1.porl_qc_doc_no;
"
"
"
"          UPDATE pur_ord_receipt_ln
"
"             SET porl_status = DECODE(porl_qc_sel_flag,'Y','N','Q'),
"
"	         porl_rcpt_rev_flag = CASE WHEN cr1.porl_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	         porl_upd_by = p_user,
"
"	         porl_upd_date = SYSDATE,
"
"	         porl_tot_accepted_qty = 0,
"
"	         porl_tot_rejected_qty = 0,
"
"	         porl_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_receipt_qty,0),
"
"	         porl_rejected_qty = 0,
"
"		 porl_stk_accepted_qty = DECODE(porl_qc_sel_flag,'N',porl_stock_receipt_qty,0),
"
"		 porl_stk_rejected_qty = 0,
"
"		 porl_tot_stk_acpt_qty = 0,
"
"		 porl_qc_doc_pfx = NULL,
"
"		 porl_qc_doc_no = NULL
"
"           WHERE porl_bu = p_bu
"
"             AND porl_receipt_no = p_rcpt_no
"
"             AND porl_seq_no = cr1.porl_seq_no;
"
"
"
"	    UPDATE pur_rcpt_lot_serial
"
"	       SET prcls_qty_accepted = DECODE(cr1.porl_qc_sel_flag,'N',prcls_lot_qty,0),
"
"	           prcls_qty_rejected = 0,
"
"	           prcls_tot_accepted = 0,
"
"	           prcls_tot_rejected = 0,
"
"	           prcls_status = DECODE(cr1.porl_qc_sel_flag,'Y','N','Q'),
"
"		   prcls_tot_stk_acpt_qty = DECODE(cr1.porl_qc_sel_flag,'N',prcls_lot_qty,0),
"
"                   prcls_tot_stk_rej_qty = 0,
"
"                   prcls_stk_acpt_qty = DECODE(cr1.porl_qc_sel_flag,'N',prcls_lot_qty,0),
"
"                   prcls_stk_rej_qty  = 0
"
"	    WHERE prcls_bu = cr1.porl_bu
"
"	      AND prcls_doc_no = cr1.porl_receipt_no
"
"	      AND prcls_doc_seq_no = cr1.porl_seq_no;
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"      IF cr1.porh_grn_source = 'PO' AND cr1.porl_status = 'R' THEN
"
"
"
"	UPDATE pur_order_hd
"
"	   SET poh_rcpt_rev_flag = CASE WHEN poh_status IN ('R','P') THEN 'Y' ELSE 'N' END
"
"	 WHERE poh_bu = p_bu
"
"	   AND poh_order_pfx = cr1.porl_po_pfx
"
"	   AND poh_order_no = cr1.porl_po_no;
"
"
"
"	BEGIN
"
"	  SELECT pomctrl_po_closure
"
"	    INTO v_po_cls_type
"
"	    FROM pom_control
"
"	   WHERE pomctrl_bu = p_bu
"
"	     AND pomctrl_plnt = cr1.porl_plnt;
"
"	EXCEPTION
"
"	  WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20963,'POM ');
"
"	END;
"
"
"
"	IF v_po_cls_type = 'A' THEN
"
"	  v_rcvd_qty := cr1.porl_accepted_qty + cr1.porl_aod_qty;
"
"	ELSE
"
"	  v_rcvd_qty := cr1.porl_receipt_qty;
"
"	END IF;
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_received_qty = pol_received_qty - v_rcvd_qty,
"
"	       pol_rejected_qty = pol_rejected_qty - cr1.porl_rejected_qty,
"
"	       pol_tot_received_qty = pol_tot_received_qty - cr1.porl_receipt_qty,
"
"	       pol_rcpt_rev_flag = CASE WHEN pol_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	       pol_rcpt_stk_qty = pol_rcpt_stk_qty - (cr1.porl_receipt_qty/cr1.porl_conv_factor)
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = cr1.porl_po_no
"
"	   AND pol_seq_no = cr1.porl_po_seq_no
"
"	   AND pol_basis = 'Q';
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_rcpt_val = pol_rcpt_val - cr1.porl_sc_unit_cost
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = cr1.porl_po_no
"
"	   AND pol_seq_no = cr1.porl_po_seq_no
"
"	   AND pol_basis = 'V';
"
"
"
"        UPDATE pur_order_ln
"
"	   SET pol_received_qty = 0
"
"	 WHERE pol_bu = p_bu
"
"	   AND pol_order_no = cr1.porl_po_no
"
"	   AND pol_seq_no = cr1.porl_po_seq_no
"
"	   AND pol_basis = 'V'
"
"	   AND pol_sc_unit_cost <> pol_rcpt_val;
"
"
"
"        /*UPDATE pur_ord_ln_schedule
"
"	   SET pols_receipt_qty = pols_receipt_qty - v_rcvd_qty,
"
"	       pols_rejected_qty = pols_rejected_qty - cr1.porl_rejected_qty,
"
"	       pols_tot_receipt_qty = pols_tot_receipt_qty - cr1.porl_receipt_qty,
"
"	       pols_rcpt_stk_qty = pols_rcpt_stk_qty - (cr1.porl_receipt_qty/cr1.porl_conv_factor)
"
"	 WHERE pols_bu = p_bu
"
"	   AND pols_order_pfx = cr1.porl_po_pfx
"
"	   AND pols_order_no = cr1.porl_po_no
"
"	   AND pols_seq_no = cr1.porl_po_seq_no
"
"	   AND pols_sub_seq_no = cr1.porl_po_sub_seq_no;*/
"
"
"
"	--proc_upd_pur_order_status(p_bu,cr1.porl_po_no,cr1.porl_po_seq_no,'P',p_user);
"
"
"
"      ELSIF cr1.porh_grn_source = 'SS' AND cr1.porl_status = 'R' THEN
"
"
"
"	IF v_po_cls_type = 'A' THEN
"
"	  v_rcvd_qty := cr1.porl_accepted_qty + cr1.porl_aod_qty;
"
"	ELSE
"
"	  v_rcvd_qty := cr1.porl_receipt_qty;
"
"	END IF;
"
"
"
"	UPDATE suplr_schld_ln
"
"           SET ssln_receipt_qty = ssln_receipt_qty - v_rcvd_qty
"
"         WHERE ssln_bu = p_bu
"
"           AND ssln_plnt = cr1.porl_plnt
"
"           AND ssln_doc_pfx = cr1.porl_ss_doc_pfx
"
"           AND ssln_doc_no = cr1.porl_ss_doc_no
"
"           AND ssln_seq_no = cr1.porl_ss_seq_no;
"
"
"
"        UPDATE suplr_schld_ln_dtls
"
"           SET ssld_recvd_qty = ssld_recvd_qty - v_rcvd_qty
"
"         WHERE ssld_bu = p_bu
"
"           AND ssld_plnt = cr1.porl_plnt
"
"           AND ssld_doc_pfx = cr1.porl_ss_doc_pfx
"
"           AND ssld_doc_no = cr1.porl_ss_doc_no
"
"           AND ssld_seq_no = cr1.porl_ss_seq_no
"
"           AND ssld_sub_seq_no = cr1.porl_ss_sub_seq_no;
"
"
"
"	--proc_upd_suplr_schld_status(p_bu,cr1.porl_plnt,cr1.porl_ss_doc_no,cr1.porl_ss_seq_no,'P',p_user);
"
"
"
"      END IF;
"
"
"
"      IF cr1.porl_status = 'R' THEN
"
"
"
"        IF cr1.porl_po_pfx IS NOT NULL AND cr1.porl_po_no IS NOT NULL THEN
"
"
"
"	 UPDATE pur_order_ln
"
"            SET pol_proc_qty = pol_proc_qty + cr1.porl_receipt_qty,
"
"                pol_excess_qty = pol_excess_qty + cr1.porl_excess_qty
"
"          WHERE pol_bu = p_bu
"
"            AND pol_order_no = cr1.porl_po_no
"
"            AND pol_seq_no = cr1.porl_po_seq_no
"
"	    AND pol_basis = 'Q';
"
"
"
"	 UPDATE pur_order_ln
"
"            SET pol_inproc_val = pol_inproc_val + cr1.porl_sc_unit_cost
"
"          WHERE pol_bu = p_bu
"
"            AND pol_order_no = cr1.porl_po_no
"
"            AND pol_seq_no = cr1.porl_po_seq_no
"
"	    AND pol_basis = 'V';
"
"
"
"	 /*UPDATE pur_ord_ln_schedule
"
"             SET pols_process_qty = pols_process_qty + cr1.porl_receipt_qty,
"
"                 pols_excess_qty = pols_excess_qty + cr1.porl_excess_qty,
"
"                 pols_upd_by = p_user,
"
"                 pols_upd_date = SYSDATE
"
"           WHERE pols_bu = p_bu
"
"             AND pols_order_pfx = cr1.porl_po_pfx
"
"             AND pols_order_no = cr1.porl_po_no
"
"             AND pols_seq_no = cr1.porl_po_seq_no
"
"             AND pols_sub_seq_no = cr1.porl_po_sub_seq_no;*/
"
"
"
"	ELSIF cr1.porl_ss_doc_pfx IS NOT NULL AND cr1.porl_ss_doc_no IS NOT NULL THEN
"
"
"
"	  UPDATE suplr_schld_ln_dtls
"
"	     SET ssld_inproc_qty = ssld_inproc_qty + cr1.porl_receipt_qty,
"
"		 ssld_excs_qty = ssld_excs_qty + cr1.porl_excess_qty,
"
"		 ssld_upd_by = p_user,
"
"		 ssld_upd_date = SYSDATE
"
"	   WHERE ssld_bu = p_bu
"
"	     AND ssld_doc_pfx = cr1.porl_ss_doc_pfx
"
"             AND ssld_doc_no = cr1.porl_ss_doc_no
"
"             AND ssld_seq_no = cr1.porl_ss_seq_no
"
"	     AND ssld_sub_seq_no = cr1.porl_ss_sub_seq_no;
"
"
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"
"
"      UPDATE pur_rcpt_act_qc_spec
"
"         SET praqs_diff_val = 0,
"
"	     praqs_cut_val = 0,
"
"	     praqs_prim_val = 0,
"
"	     praqs_act_val = 0
"
"       WHERE praqs_bu = p_bu
"
"         AND praqs_rcpt_no = cr1.porl_receipt_no
"
"         AND praqs_rcpt_seq_no = cr1.porl_seq_no;
"
"
"
"    END LOOP c1;
"
"
"
"    FOR cr_jrnl IN (SELECT ajh_jrnl_no
"
"                      FROM appl_journals_hist
"
"		     WHERE ajh_bu = p_bu
"
"		       AND ajh_vou_pfx = p_rcpt_pfx
"
"		       AND ajh_vou_no = p_rcpt_no)
"
"    LOOP
"
"
"
"      DELETE FROM gl_jrnl_ln_hist
"
"       WHERE gjlh_bu = p_bu
"
"         AND gjlh_jrnl_no = cr_jrnl.ajh_jrnl_no
"
"         AND gjlh_vou_pfx = p_rcpt_pfx
"
"         AND gjlh_vou_no = p_rcpt_no;
"
"
"
"      DELETE FROM gl_jrnl_hd_hist
"
"       WHERE gjhh_bu = p_bu
"
"         AND gjhh_jrnl_no = cr_jrnl.ajh_jrnl_no
"
"         AND gjhh_vou_pfx = p_rcpt_pfx
"
"         AND gjhh_vou_no = p_rcpt_no;
"
"
"
"      DELETE FROM appl_journals_hist
"
"       WHERE ajh_bu = p_bu
"
"         AND ajh_vou_pfx = p_rcpt_pfx
"
"         AND ajh_vou_no = p_rcpt_no
"
"         AND ajh_appl = 'POM';
"
"
"
"      DELETE FROM appl_journals
"
"       WHERE aj_bu = p_bu
"
"         AND aj_vou_pfx = p_rcpt_pfx
"
"         AND aj_vou_no = p_rcpt_no
"
"         AND aj_appl = 'POM';
"
"
"
"    END LOOP;
"
"
"
"    FOR r_lc IN (SELECT *
"
"                   FROM pur_ord_receipt_hd,pur_rcpt_land_costs
"
"                  WHERE porh_bu = prlc_bu
"
"		    AND porh_receipt_no = prlc_rcpt_no
"
"		    AND prlc_bu = p_bu
"
"                    AND prlc_rcpt_no = p_rcpt_no)
"
"    LOOP
"
"      IF r_lc.prlc_type IN ('I','D') THEN
"
"        UPDATE duty_drawback_hd
"
"           SET ddh_lcn_inprog_amt = ddh_lcn_inprog_amt + r_lc.prlc_tc_amt,
"
"               ddh_lcn_rcpt_amt = ddh_lcn_rcpt_amt - r_lc.prlc_tc_amt
"
"         WHERE ddh_bu = p_bu
"
"           AND ddh_plnt = r_lc.porh_plnt
"
"           AND ddh_doc_no = r_lc.prlc_meis_doc_no
"
"           AND ddh_license_no = r_lc.prlc_meis_lic_no;
"
"      END IF;
"
"    END LOOP;
"
"
"
"
"
"    UPDATE pur_ord_receipt_hd
"
"       SET porh_status = 'N',
"
"           porh_rcpt_rev_flag = CASE WHEN porh_status = 'R' THEN 'Y' ELSE 'N' END,
"
"	   porh_upd_by = p_user,
"
"	   porh_upd_date = SYSDATE,
"
"	   porh_inspn_flag = 'N',
"
"	   porh_jrnl_flag = 'N',
"
"	   porh_fin_status = 'N',
"
"	   porh_fin_flag = 'N',
"
"	   porh_wf_status = 'N'
"
"     WHERE porh_bu = p_bu
"
"       AND porh_receipt_pfx = p_rcpt_pfx
"
"       AND porh_receipt_no = p_rcpt_no
"
"       AND EXISTS(SELECT 1
"
"                    FROM pur_ord_receipt_ln
"
"                   WHERE porl_bu = porh_bu
"
"                     AND porl_plnt = porh_plnt
"
"                     AND porl_receipt_no = porh_receipt_no
"
"                     AND porl_status IN ('N','Q'));
"
"
"
"    Commit;
"
"
"
"  END proc_corr_pur_rcpt;
"
"
"
"  PROCEDURE proc_upd_grn_lm_disc_amt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                                     p_rcpt_pfx		VARCHAR2 DEFAULT NULL,
"
"			             p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"			             p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			            )
"
"  AS
"
"    v_rcpt_tot_cost	NUMBER;
"
"  BEGIN
"
"
"
"    FOR r_prh IN (SELECT porh_lm_disc_amt
"
"                    FROM pur_ord_receipt_hd
"
"		   WHERE porh_bu = p_bu
"
"                     AND porh_receipt_pfx = p_rcpt_pfx
"
"                     AND porh_receipt_no = p_rcpt_no
"
"		     AND porh_lm_disc_amt > 0)
"
"    LOOP
"
"
"
"      SELECT SUM(porl_receipt_qty * porl_sc_unit_cost)
"
"        INTO v_rcpt_tot_cost
"
"        FROM pur_ord_receipt_ln
"
"       WHERE porl_bu = p_bu
"
"         AND porl_receipt_no = p_rcpt_no
"
"         AND porl_status <> 'C';
"
"
"
"      FOR r_prl IN (SELECT porl_seq_no,(porl_receipt_qty * porl_sc_unit_cost) rcpt_amt
"
"                      FROM pur_ord_receipt_ln
"
"		     WHERE porl_bu = p_bu
"
"                       AND porl_receipt_no = p_rcpt_no
"
"                       AND porl_status <> 'C')
"
"      LOOP
"
"        UPDATE pur_ord_receipt_ln
"
"           SET porl_sc_lm_disc_amt = ((r_prh.porh_lm_disc_amt * r_prl.rcpt_amt) / v_rcpt_tot_cost) / porl_receipt_qty,
"
"	       porl_upd_by = p_user,
"
"	       porl_upd_date = SYSDATE
"
"         WHERE porl_bu = p_bu
"
"           AND porl_receipt_no = p_rcpt_no
"
"	   AND porl_seq_no = r_prl.porl_seq_no
"
"           AND porl_status <> 'C';
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"  END proc_upd_grn_lm_disc_amt;
"
"
"
"  PROCEDURE proc_corr_qc_frm_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"                                      p_plnt		pur_ord_receipt_ln.porl_plnt%TYPE,
"
"				      p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"			              p_rcpt_no		pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"				      p_rcpt_seq_no	pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"			              p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"			             )
"
"  AS
"
"    CURSOR c_pr IS
"
"    SELECT *
"
"      FROM pur_ord_receipt_hd,
"
"           pur_ord_receipt_ln,
"
"	   suppliers,products
"
"     WHERE porh_bu = porl_bu
"
"       AND porh_receipt_no = porl_receipt_no
"
"       AND suplr_bu = porh_bu
"
"       AND suplr_suplr_id = porh_suplr_id
"
"       AND prod_bu = porl_bu
"
"       AND prod_id = porl_prod_id
"
"       AND prod_rev = porl_prod_rev
"
"       AND porl_bu = p_bu
"
"       AND porl_receipt_no = p_rcpt_no
"
"       AND porl_seq_no = p_rcpt_seq_no
"
"       AND (porl_tot_accepted_qty + porl_tot_aod_qty + porl_tot_rejected_qty) = 0
"
"       AND porl_qc_doc_pfx IS NOT NULL
"
"       AND porl_qc_doc_no IS NOT NULL
"
"       AND porl_status NOT IN ('C','R','P');
"
"
"
"    v_store_id		VARCHAR2(10);
"
"    var_ord_type	VARCHAR2(2);
"
"    var_ord_pfx		VARCHAR2(5);
"
"    var_ord_no		VARCHAR2(15);
"
"    var_ord_seq_no	NUMBER(5);
"
"    var_ord_sub_seq_no	NUMBER(5);
"
"    var_rcpt_unit_cost	NUMBER;
"
"    var_upd_ref2	VARCHAR2(1000);
"
"    var_process		VARCHAR2(10);
"
"    var_so_type		VARCHAR2(2) := 'NA';
"
"
"
"    v_vou_date		DATE;
"
"    v_vou_year		NUMBER(6);
"
"    v_vou_period	NUMBER(2);
"
"
"
"    v_rcpt_qty		pur_ord_receipt_ln.porl_stock_receipt_qty%TYPE;
"
"
"
"  BEGIN
"
"
"
"    v_vou_date := TRUNC(SYSDATE);
"
"    v_vou_year := func_find_year(p_bu,v_vou_date);
"
"    v_vou_period := func_find_period(p_bu,v_vou_date);
"
"
"
"    FOR r_pr IN c_pr
"
"    LOOP
"
"
"
"      v_store_id := func_find_store_fr_type(p_bu,p_plnt,r_pr.porh_plnt_loc_id,'P');
"
"
"
"      IF r_pr.porh_type = 'ST' THEN
"
"        var_upd_ref2 := 'GRN#(';
"
"      ELSIF r_pr.porh_type = 'SP' THEN
"
"        var_upd_ref2 := 'SRN#(';
"
"      ELSIF r_pr.porh_type = 'RR' THEN
"
"        var_upd_ref2 := 'Replacement GRN#(';
"
"      ELSIF r_pr.porh_type = 'TS' THEN
"
"        var_upd_ref2 := 'Transfer GRN#(';
"
"      ELSIF r_pr.porh_type = 'RW' THEN
"
"        var_upd_ref2 := 'Rework SRN#(';
"
"      ELSIF r_pr.porh_type = 'SV' THEN
"
"        var_upd_ref2 := 'Value Add. SRN#(';
"
"      END IF;
"
"
"
"      IF  r_pr.porh_type = 'SP' THEN
"
"        IF r_pr.porh_grn_source = 'SS' THEN
"
"          var_ord_type := 'SS';
"
"        ELSE
"
"          var_ord_type := 'SC';
"
"        END IF;
"
"      ELSIF r_pr.porh_type = 'SV' THEN
"
"        var_ord_type := 'SV';
"
"      ELSIF r_pr.porh_type = 'RS' THEN
"
"        var_ord_type := 'RS';
"
"      ELSIF r_pr.porh_type = 'RV' THEN
"
"        var_ord_type := 'RV';
"
"      ELSIF r_pr.porh_type = 'ST' THEN
"
"        var_ord_type := 'PR';
"
"      ELSE
"
"        IF r_pr.porh_grn_source = 'SS' THEN
"
"          var_ord_type := 'SS';
"
"        ELSE
"
"          var_ord_type := 'PO';
"
"        END IF;
"
"      END IF;
"
"
"
"      IF r_pr.porl_po_pfx IS NOT NULL AND r_pr.porl_po_no IS NOT NULL THEN
"
"
"
"        var_ord_pfx := r_pr.porl_po_pfx;
"
"        var_ord_no := r_pr.porl_po_no;
"
"        var_ord_seq_no := r_pr.porl_po_seq_no;
"
"        var_ord_sub_seq_no := r_pr.porl_po_sub_seq_no;
"
"
"
"        var_upd_ref2 := SUBSTR(var_upd_ref2||p_rcpt_pfx||'/'||p_rcpt_no||'/'||r_pr.porl_seq_no||')/PO#('||
"
"                               r_pr.porl_po_pfx||'/'||r_pr.porl_po_no||'/'||r_pr.porl_po_seq_no||'/'||
"
"                               r_pr.porl_po_sub_seq_no||')/'||r_pr.suplr_name1,1,200);
"
"
"
"      ELSIF r_pr.porl_ss_doc_pfx IS NOT NULL AND r_pr.porl_ss_doc_no IS NOT NULL THEN
"
"
"
"        var_ord_pfx := r_pr.porl_ss_doc_pfx;
"
"        var_ord_no := r_pr.porl_ss_doc_no;
"
"        var_ord_seq_no := r_pr.porl_ss_seq_no;
"
"        var_ord_sub_seq_no := r_pr.porl_ss_sub_seq_no;
"
"
"
"        var_upd_ref2 := SUBSTR(var_upd_ref2||p_rcpt_pfx||'/'||p_rcpt_no||'/'||r_pr.porl_seq_no||')/Suplr. Schld.#('||
"
"                               r_pr.porl_ss_doc_pfx||'/'||r_pr.porl_ss_doc_no||'/'||r_pr.porl_ss_seq_no||'/'||
"
"                               r_pr.porl_ss_sub_seq_no||')/'||r_pr.suplr_name1,1,200);
"
"
"
"      ELSIF r_pr.porh_grn_source = 'PR' THEN
"
"
"
"        var_ord_pfx := r_pr.porl_pr_pfx;
"
"        var_ord_no := r_pr.porl_pr_no;
"
"        var_ord_seq_no := r_pr.porl_pr_seq_no;
"
"        var_ord_sub_seq_no := r_pr.porl_pr_sub_seq_no;
"
"
"
"        var_upd_ref2 := SUBSTR(var_upd_ref2||p_rcpt_pfx||'/'||p_rcpt_no||'/'||r_pr.porl_seq_no||')/Pur. Rqst.#('||
"
"                               r_pr.porl_pr_pfx||'/'||r_pr.porl_pr_no||'/'||r_pr.porl_pr_seq_no||'/'||
"
"                               r_pr.porl_pr_sub_seq_no||')/'||r_pr.suplr_name1,1,200);
"
"      ELSE
"
"
"
"        var_ord_no := r_pr.porl_receipt_no;
"
"        var_ord_seq_no := r_pr.porl_seq_no;
"
"        var_ord_sub_seq_no := r_pr.porl_seq_no;
"
"
"
"        var_upd_ref2 := SUBSTR(var_upd_ref2||p_rcpt_pfx||'/'||p_rcpt_no||'/'||r_pr.porl_seq_no||
"
"                               ')/Manual GRN/'||r_pr.suplr_name1,1,200);
"
"
"
"      END IF;
"
"
"
"      IF r_pr.porl_so_pfx IS NOT NULL AND r_pr.porl_so_no IS NOT NULL THEN
"
"        var_so_type := 'SO';
"
"      ELSIF r_pr.porl_proj_id IS NOT NULL AND r_pr.porl_task_id IS NOT NULL THEN
"
"        var_so_type := 'P';
"
"      ELSE
"
"        var_so_type := 'NA';
"
"      END IF;
"
"
"
"      IF r_pr.porh_mode = 'PR' THEN
"
"
"
"        v_rcpt_qty := r_pr.porl_stock_receipt_qty;
"
"
"
"        IF r_pr.prod_cost_method = 'MAC' THEN
"
"          var_rcpt_unit_cost := func_find_unitcost(p_bu,r_pr.porl_prod_id,r_pr.porl_prod_rev,v_store_id);
"
"        ELSE
"
"          var_rcpt_unit_cost := func_find_rcpt_batch_unitcost(p_bu,v_store_id,r_pr.porl_prod_id,r_pr.porl_prod_rev,
"
"	                        NULL,r_pr.porl_receipt_no,r_pr.porl_seq_no);
"
"        END IF;
"
"
"
"        proc_upd_stocks(p_bu,
"
"		        v_store_id,
"
"		        NULL,
"
"		        r_pr.porl_prod_id,
"
"		        r_pr.porl_prod_rev,
"
"		        0,
"
"		        0,
"
"		        -v_rcpt_qty,--ROUND(r_pr.porl_receipt_qty/r_pr.porl_conv_factor,3),
"
"		        0,
"
"		        0,
"
"		        var_rcpt_unit_cost,
"
"		        var_rcpt_unit_cost,
"
"		        0,
"
"		        r_pr.porl_net_disc_flag,
"
"		        0,
"
"		        0,
"
"		        0,
"
"		        var_ord_seq_no,
"
"		        var_ord_sub_seq_no,
"
"		        var_ord_pfx,
"
"		        var_ord_no,
"
"		        p_rcpt_pfx,
"
"		        p_rcpt_no,
"
"		        r_pr.porh_suplr_id,
"
"		        v_vou_year,
"
"		        v_vou_period,
"
"		        v_vou_date,
"
"		        NULL,
"
"		        'POM',
"
"		        'GRN',
"
"		        NULL,
"
"		        p_user,
"
"		        SYSDATE,
"
"		        NULL,
"
"		        func_find_product_class(p_bu,r_pr.porl_plnt,r_pr.porl_prod_id,r_pr.porl_prod_rev),
"
"		        NULL,
"
"		        r_pr.porh_type,
"
"		        NULL,
"
"		        r_pr.porl_sc_lm_disc_amt * r_pr.porh_exchange_rate,
"
"		        0,
"
"		        NULL,
"
"		        NULL,
"
"		        NULL,
"
"		        NULL,
"
"		        NULL,
"
"		        r_pr.porl_seq_no,
"
"		        NULL,
"
"		        0,
"
"		        0,
"
"		        r_pr.porl_upd_ref1,
"
"		        var_upd_ref2,
"
"		        p_rcpt_bill_no => r_pr.porh_suplr_doc_no,
"
"		        p_rcpt_bill_date => r_pr.porh_suplr_doc_date,
"
"		        p_rcpt_dc_no => r_pr.porh_dc_no,
"
"		        p_rcpt_dc_date => r_pr.porh_dc_date,
"
"			p_prod_cls_desc => r_pr.porl_prod_cls_desc,
"
"			p_prod_sub_cls_id => r_pr.porl_sub_cls_id,
"
"			p_prod_sub_cls_desc => r_pr.porl_prod_subcls_desc,
"
"			p_prod_grp_id => r_pr.porl_prod_grp,
"
"			p_prod_grp_desc => r_pr.porl_prod_grp_desc,
"
"			p_prod_sub_grp_id => r_pr.porl_prod_subgrp,
"
"			p_prod_sub_grp_desc => r_pr.porl_prod_subgrp_desc,
"
"			p_prod_cls_type => func_find_prod_class_type(p_bu,r_pr.porh_plnt,r_pr.porl_prod_id,r_pr.porl_prod_rev)
"
"		       );
"
"
"
"        IF (r_pr.porl_so_pfx IS NOT NULL AND r_pr.porl_so_no IS NOT NULL) OR
"
"           (r_pr.porl_proj_id IS NOT NULL AND r_pr.porl_task_id IS NOT NULL) THEN
"
"
"
"          proc_upd_so_stocks(p_bu,
"
"	                     v_store_id,
"
"	                     r_pr.porl_prod_id,
"
"	                     r_pr.porl_prod_rev,
"
"	                     -v_rcpt_qty,--ROUND(r_pr.porl_receipt_qty / r_pr.porl_conv_factor,3),
"
"	                     0,
"
"	                     var_rcpt_unit_cost,
"
"	                     r_pr.porl_so_pfx,
"
"	                     r_pr.porl_so_no,
"
"	                     r_pr.porl_so_seq_no,
"
"	                     r_pr.porl_so_sub_seq_no,
"
"	                     TRUNC(v_vou_date),
"
"	                     var_ord_type,
"
"	                     var_ord_pfx,
"
"	                     var_ord_no,
"
"	                     var_ord_seq_no,
"
"	                     NULL,
"
"	                     r_pr.porl_receipt_no,
"
"	                     r_pr.porl_seq_no,
"
"	                     'GRN',
"
"	                     'POM',
"
"	                     r_pr.porl_upd_ref1,
"
"	                     var_upd_ref2,
"
"	                     p_user,
"
"	                     var_so_type,
"
"	                     r_pr.porl_proj_id,
"
"	                     r_pr.porl_task_id,
"
"			     p_so_prj_schld_desc => r_pr.porl_so_schld_desc
"
"	                    );
"
"
"
"        END IF;
"
"
"
"        IF r_pr.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"          FOR cr_ls IN (SELECT *
"
"                         FROM pur_rcpt_lot_serial
"
"                        WHERE prcls_bu = p_bu
"
"                          AND prcls_doc_no = r_pr.porl_receipt_no
"
"                          AND prcls_doc_seq_no = r_pr.porl_seq_no
"
"                          AND prcls_apply_type = 'R')
"
"          LOOP
"
"
"
"            proc_upd_lot_ser_stocks(p_bu,
"
"                                    v_store_id,
"
"                                    r_pr.porl_prod_id,
"
"                                    r_pr.porl_prod_rev,
"
"                                    cr_ls.prcls_sys_ls_no,
"
"                                    -CASE WHEN r_pr.porl_ls_uom_gen_type = 'S' THEN cr_ls.prcls_lot_qty / r_pr.porl_conv_factor ELSE cr_ls.prcls_lot_qty END,
"
"                                    0,
"
"                                    0,
"
"                                    var_rcpt_unit_cost,
"
"				    r_pr.prod_ser_lot_opt,
"
"                                    cr_ls.prcls_lot_no,
"
"                                    cr_ls.prcls_serial_no,
"
"                                    cr_ls.prcls_sou_type,
"
"                                    cr_ls.prcls_sou_id,
"
"                                    cr_ls.prcls_expiry_date,
"
"                                    TRUNC(v_vou_date),
"
"                                    'GRN',
"
"                                    NULL,
"
"                                    r_pr.porl_receipt_no,
"
"                                    r_pr.porl_seq_no,
"
"                                    'POM',
"
"                                    r_pr.porl_upd_ref1,
"
"                                    var_upd_ref2,
"
"                                    p_user
"
"                                   );
"
"
"
"          END LOOP;
"
"
"
"        END IF;
"
"
"
"	v_store_id := func_find_store_fr_type(p_bu,p_plnt,r_pr.porh_plnt_loc_id,'Q');
"
"
"
"	proc_upd_stocks(p_bu,
"
"		        v_store_id,
"
"		        NULL,
"
"		        r_pr.porl_prod_id,
"
"		        r_pr.porl_prod_rev,
"
"		        0,
"
"		        0,
"
"		        v_rcpt_qty,--ROUND(r_pr.porl_receipt_qty/r_pr.porl_conv_factor,3),
"
"		        0,
"
"		        0,
"
"		        var_rcpt_unit_cost,
"
"		        var_rcpt_unit_cost,
"
"		        0,
"
"		        r_pr.porl_net_disc_flag,
"
"		        0,
"
"		        0,
"
"		        0,
"
"		        var_ord_seq_no,
"
"		        var_ord_sub_seq_no,
"
"		        var_ord_pfx,
"
"		        var_ord_no,
"
"		        p_rcpt_pfx,
"
"		        p_rcpt_no,
"
"		        r_pr.porh_suplr_id,
"
"		        v_vou_year,
"
"		        v_vou_period,
"
"		        v_vou_date,
"
"		        NULL,
"
"		        'POM',
"
"		        'GRN',
"
"		        NULL,
"
"		        p_user,
"
"		        SYSDATE,
"
"		        NULL,
"
"		        func_find_product_class(p_bu,r_pr.porl_plnt,r_pr.porl_prod_id,r_pr.porl_prod_rev),
"
"		        NULL,
"
"		        r_pr.porh_type,
"
"		        NULL,
"
"		        r_pr.porl_sc_lm_disc_amt * r_pr.porh_exchange_rate,
"
"		        0,
"
"		        NULL,
"
"		        NULL,
"
"		        NULL,
"
"		        NULL,
"
"		        NULL,
"
"		        r_pr.porl_seq_no,
"
"		        NULL,
"
"		        0,
"
"		        0,
"
"		        r_pr.porl_upd_ref1,
"
"		        var_upd_ref2,
"
"		        p_rcpt_bill_no => r_pr.porh_suplr_doc_no,
"
"		        p_rcpt_bill_date => r_pr.porh_suplr_doc_date,
"
"		        p_rcpt_dc_no => r_pr.porh_dc_no,
"
"		        p_rcpt_dc_date => r_pr.porh_dc_date,
"
"			p_prod_cls_desc => r_pr.porl_prod_cls_desc,
"
"			p_prod_sub_cls_id => r_pr.porl_sub_cls_id,
"
"			p_prod_sub_cls_desc => r_pr.porl_prod_subcls_desc,
"
"			p_prod_grp_id => r_pr.porl_prod_grp,
"
"			p_prod_grp_desc => r_pr.porl_prod_grp_desc,
"
"			p_prod_sub_grp_id => r_pr.porl_prod_subgrp,
"
"			p_prod_sub_grp_desc => r_pr.porl_prod_subgrp_desc,
"
"			p_prod_cls_type => func_find_prod_class_type(p_bu,r_pr.porh_plnt,r_pr.porl_prod_id,r_pr.porl_prod_rev)
"
"		       );
"
"
"
"        IF (r_pr.porl_so_pfx IS NOT NULL AND r_pr.porl_so_no IS NOT NULL) OR
"
"           (r_pr.porl_proj_id IS NOT NULL AND r_pr.porl_task_id IS NOT NULL) THEN
"
"
"
"          proc_upd_so_stocks(p_bu,
"
"	                     v_store_id,
"
"	                     r_pr.porl_prod_id,
"
"	                     r_pr.porl_prod_rev,
"
"	                     v_rcpt_qty,--ROUND(r_pr.porl_receipt_qty/r_pr.porl_conv_factor,3),
"
"	                     0,
"
"	                     var_rcpt_unit_cost,
"
"	                     r_pr.porl_so_pfx,
"
"	                     r_pr.porl_so_no,
"
"	                     r_pr.porl_so_seq_no,
"
"	                     r_pr.porl_so_sub_seq_no,
"
"	                     TRUNC(v_vou_date),
"
"	                     var_ord_type,
"
"	                     var_ord_pfx,
"
"	                     var_ord_no,
"
"	                     var_ord_seq_no,
"
"	                     r_pr.porl_receipt_no,
"
"	                     r_pr.porl_seq_no,
"
"	                     'GRN',
"
"	                     'POM',
"
"	                     r_pr.porl_upd_ref1,
"
"	                     var_upd_ref2,
"
"	                     p_user,
"
"	                     var_so_type,
"
"	                     r_pr.porl_proj_id,
"
"	                     r_pr.porl_task_id,
"
"			     p_so_prj_schld_desc => r_pr.porl_so_schld_desc
"
"	                    );
"
"
"
"        END IF;
"
"
"
"        IF r_pr.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"          FOR cr_ls IN (SELECT *
"
"                          FROM pur_rcpt_lot_serial
"
"                         WHERE prcls_bu = p_bu
"
"                           AND prcls_doc_no = r_pr.porl_receipt_no
"
"                           AND prcls_doc_seq_no = r_pr.porl_seq_no
"
"                           AND prcls_apply_type = 'R')
"
"          LOOP
"
"
"
"            proc_upd_lot_ser_stocks(p_bu,
"
"                                    v_store_id,
"
"                                    r_pr.porl_prod_id,
"
"                                    r_pr.porl_prod_rev,
"
"                                    cr_ls.prcls_sys_ls_no,
"
"                                    CASE WHEN r_pr.porl_ls_uom_gen_type = 'S' THEN cr_ls.prcls_lot_qty / r_pr.porl_conv_factor ELSE cr_ls.prcls_lot_qty END,
"
"                                    0,
"
"                                    0,
"
"                                    var_rcpt_unit_cost,
"
"				    r_pr.prod_ser_lot_opt,
"
"                                    cr_ls.prcls_lot_no,
"
"                                    cr_ls.prcls_serial_no,
"
"                                    cr_ls.prcls_sou_type,
"
"                                    cr_ls.prcls_sou_id,
"
"                                    cr_ls.prcls_expiry_date,
"
"                                    TRUNC(v_vou_date),
"
"                                    'GRN',
"
"                                    NULL,
"
"                                    r_pr.porl_receipt_no,
"
"                                    r_pr.porl_seq_no,
"
"                                    'POM',
"
"                                    r_pr.porl_upd_ref1,
"
"                                    var_upd_ref2,
"
"                                    p_user
"
"                                   );
"
"
"
"          END LOOP;
"
"
"
"        END IF;
"
"
"
"      ELSIF r_pr.porh_mode = 'SC' THEN
"
"        --IF r_pr.porl_matl_type IN ('PR','UP','SDS') THEN
"
"	null;
"
"      END IF;
"
"
"
"      UPDATE pur_ord_receipt_ln
"
"         SET porl_accepted_qty = 0,
"
"	     porl_rejected_qty = 0,
"
"	     porl_aod_qty = 0,
"
"	     porl_prim_rej_qty = 0,
"
"	     porl_sec_rej_qty = 0,
"
"	     porl_stk_accepted_qty = 0,
"
"	     porl_stk_rejected_qty = 0,
"
"	     porl_stk_aod_qty = 0,
"
"	     porl_stk_prim_rej_qty = 0,
"
"	     porl_stk_sec_rej_qty = 0,
"
"	     --porl_qc_qty = r_pr.porl_stock_receipt_qty,
"
"	     porl_status = 'N'
"
"       WHERE porl_bu = p_bu
"
"	 AND porl_receipt_no = p_rcpt_no
"
"	 AND porl_seq_no = p_rcpt_seq_no;
"
"
"
"      UPDATE pur_rcpt_lot_serial
"
"         SET prcls_qty_accepted = 0,
"
"             prcls_tot_accepted = 0,
"
"             prcls_tot_rejected = 0,
"
"             prcls_qty_rejected = 0,
"
"	     prcls_status = 'N'
"
"       WHERE prcls_bu = p_bu
"
"         AND prcls_doc_no = p_rcpt_no
"
"         AND prcls_doc_seq_no = p_rcpt_seq_no;
"
"
"
"
"
"      IF r_pr.porl_qc_doc_pfx IS NOT NULL AND r_pr.porl_qc_doc_no IS NOT NULL THEN
"
"
"
"        UPDATE tqm_qc_ln_hist
"
"           SET tqlnh_status = 'L'
"
"         WHERE tqlnh_bu = p_bu
"
"           AND tqlnh_qc_pfx = r_pr.porl_qc_doc_pfx
"
"           AND tqlnh_qc_no = r_pr.porl_qc_doc_no;
"
"
"
"        UPDATE tqm_qc_hd_hist
"
"           SET tqhdh_status = 'L'
"
"         WHERE tqhdh_bu = p_bu
"
"           AND tqhdh_qc_pfx = r_pr.porl_qc_doc_pfx
"
"           AND tqhdh_qc_no = r_pr.porl_qc_doc_no;
"
"
"
"	pkg_insp_hist.proc_rev_qc_plan_hist(p_bu,r_pr.porl_qc_doc_pfx,r_pr.porl_qc_doc_no);
"
"
"
"	UPDATE tqm_qc_plan_ln
"
"	   SET tqpln_status = 'N',
"
"	       tqpln_accepted_qty = 0,
"
"	       tqpln_aod_qty = 0,
"
"	       tqpln_rejected_qty = 0,
"
"	       tqpln_stk_accept_qty = 0,
"
"	       tqpln_stk_reject_qty = 0
"
"	 WHERE tqpln_bu = p_bu
"
"	   AND tqpln_pln_no = r_pr.porl_qc_doc_no;
"
"
"
"	UPDATE tqm_qc_plan_hd
"
"	   SET tqphd_status = 'N'
"
"	 WHERE tqphd_bu = p_bu
"
"	   AND tqphd_pln_pfx = r_pr.porl_qc_doc_pfx
"
"	   AND tqphd_pln_no = r_pr.porl_qc_doc_no;
"
"
"
"      END IF;
"
"
"
"    END LOOP c_pr;
"
"
"
"  END proc_corr_qc_frm_pur_rcpt;
"
"
"
"  PROCEDURE proc_gen_coil_frm_pur_rcpt(p_bu		pur_ord_receipt_ln.porl_bu%TYPE,
"
"				       p_plnt		pur_ord_receipt_ln.porl_plnt%TYPE,
"
"				       p_rcpt_pfx	VARCHAR2 DEFAULT NULL,
"
"                                       p_rcpt_no	pur_ord_receipt_ln.porl_receipt_no%TYPE,
"
"				       p_prod_id	pur_ord_receipt_ln.porl_prod_id%TYPE,
"
"				       p_prod_rev	pur_ord_receipt_ln.porl_prod_rev%TYPE,
"
"				       p_heat_no	pur_receipt_lot.prlt_heat_no%TYPE,
"
"				       p_test_no	pur_receipt_lot.prlt_test_no%TYPE,
"
"				       p_lot_no		pur_receipt_lot.prlt_lot_no%TYPE,
"
"				       p_coil_no	pur_receipt_lot.prlt_coil_no%TYPE,
"
"				       p_ls_qty		pur_receipt_lot.prlt_lot_qty%TYPE,
"
"				       p_no_of_coil	pur_receipt_lot.prlt_no_of_bale%TYPE,
"
"                                       p_user		pur_ord_receipt_ln.porl_cre_by%TYPE
"
"				      )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
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
"  CURSOR c2 IS
"
"  SELECT porl_thickness,porl_width,porl_length,porl_height,porl_density,porl_inner_dia,porl_prod_outer_dia
"
"    FROM pur_ord_receipt_ln
"
"   WHERE porl_bu = p_bu
"
"     AND porl_receipt_no = p_rcpt_no
"
"     AND porl_prod_id = p_prod_id
"
"     AND porl_prod_rev = p_prod_rev;
"
"
"
"    cr1		c1%ROWTYPE;
"
"    cr2		c2%ROWTYPE;
"
"
"
"    v_coil_no		pur_receipt_lot.prlt_test_no%TYPE;
"
"    v_coil_qty		pur_receipt_lot.prlt_lot_qty%TYPE;
"
"    v_seq_no		pur_receipt_lot.prlt_seq_no%TYPE;
"
"
"
"    v_bal_coil_qty	pur_receipt_lot.prlt_lot_qty%TYPE;
"
"    v_upd_coil_qty	pur_receipt_lot.prlt_lot_qty%TYPE;
"
"
"
"  BEGIN
"
"
"
"    OPEN c1;
"
"    FETCH c1 INTO cr1;
"
"    CLOSE c1;
"
"
"
"    OPEN c2;
"
"    FETCH c2 INTO cr2;
"
"    CLOSE c2;
"
"
"
"    SELECT NVL(MAX(prlt_seq_no),0)
"
"      INTO v_seq_no
"
"      FROM pur_receipt_lot
"
"     WHERE prlt_bu = p_bu
"
"       AND prlt_receipt_no = p_rcpt_no;
"
"
"
"    v_coil_no := p_coil_no;
"
"
"
"    v_coil_qty := CEIL(p_ls_qty / p_no_of_coil);
"
"
"
"    v_bal_coil_qty := p_ls_qty;
"
"
"
"    FOR i IN 1..p_no_of_coil
"
"    LOOP
"
"
"
"      IF v_bal_coil_qty > v_coil_qty THEN
"
"        v_upd_coil_qty := v_coil_qty;
"
"        v_bal_coil_qty := v_bal_coil_qty - v_coil_qty;
"
"      ELSE
"
"        v_upd_coil_qty := v_bal_coil_qty;
"
"	v_bal_coil_qty := 0;
"
"      END IF;
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      INSERT INTO pur_receipt_lot(prlt_bu,
"
"                                  prlt_receipt_no,
"
"                                  prlt_seq_no,
"
"                                  prlt_prod_id,
"
"                                  prlt_prod_rev,
"
"                                  prlt_lot_no,
"
"                                  prlt_heat_no,
"
"                                  prlt_test_no,
"
"				  prlt_coil_no,
"
"                                  prlt_lot_qty,
"
"				  prlt_mfg_date,
"
"				  prlt_cre_by,
"
"				  prlt_cre_date,
"
"				  prlt_thickness,
"
"				  prlt_width,
"
"				  prlt_length,
"
"				  prlt_height,
"
"				  prlt_density,
"
"				  prlt_inner_dia,
"
"				  prlt_prod_outer_dia
"
"				 )
"
"                           VALUES(p_bu,
"
"				  p_rcpt_no,
"
"				  v_seq_no,
"
"				  p_prod_id,
"
"				  p_prod_rev,
"
"				  p_lot_no,
"
"				  p_heat_no,
"
"				  p_test_no,
"
"				  v_coil_no,
"
"				  v_upd_coil_qty,
"
"				  NVL(cr1.porh_suplr_doc_date,cr1.porh_receipt_date),
"
"				  p_user,
"
"				  SYSDATE,
"
"				  cr2.porl_thickness,
"
"				  cr2.porl_width,
"
"				  cr2.porl_length,
"
"				  cr2.porl_height,
"
"				  cr2.porl_density,
"
"				  cr2.porl_inner_dia,
"
"				  cr2.porl_prod_outer_dia
"
"				 );
"
"
"
"      v_coil_no := func_find_next_id(v_coil_no);
"
"
"
"      EXIT WHEN v_bal_coil_qty = 0;
"
"
"
"    END LOOP;
"
"
"
"  END;
"
"
"
"END pkg_pur_rcpt;"
/
