CREATE OR REPLACE
"PACKAGE BODY pkg_mat_iss
"
"AS
"
"  PROCEDURE proc_rev_mat_frm_mi(p_bu		business_units.bu_id%TYPE,
"
"                                p_plnt		inv_stock_trans_hd.isthd_plnt%TYPE,
"
"				p_mi_doc_no	inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                                p_user		appl_users.appluser_id%TYPE,
"
"				p_lang		NUMBER
"
"			       )
"
"  AS
"
"
"
"    CURSOR c_mi IS
"
"    SELECT *
"
"      FROM inv_stock_trans_hd_vw,inv_stock_trans_ln_vw,products
"
"     WHERE isthd_bu = istln_bu
"
"       AND isthd_doc_no = istln_doc_no
"
"       AND prod_bu = istln_bu
"
"       AND prod_id = istln_prod_id
"
"       AND prod_rev = istln_prod_rev
"
"       AND isthd_bu = p_bu
"
"       AND isthd_doc_no = p_mi_doc_no
"
"       AND isthd_status = 'I'
"
"       AND istln_status <> 'C';
"
"
"
"    CURSOR c_ls(c_seq_no	NUMBER) IS
"
"    SELECT isbd_sys_ls_no,isbd_lot_no,isbd_serial_no,isbd_source_type,isbd_source_id,isbd_expiry_date,isbd_stk_trans_qty
"
"      FROM inv_stock_batch_details_vw
"
"     WHERE isbd_bu = p_bu
"
"       AND isbd_issue_doc_no = p_mi_doc_no
"
"       AND isbd_seq_no = c_seq_no
"
"     ORDER BY isbd_sub_seq_no;
"
"
"
"    CURSOR c_lss(c_store_id	VARCHAR2,
"
"	         c_prod_id	VARCHAR2,
"
"	         c_prod_rev	NUMBER,
"
"	         c_sys_ls_no	NUMBER) IS
"
"    SELECT lss_sys_ls_no,lss_lot_no,lss_ser_no,lss_source_type,lss_source_id,lss_expiry_date,(lss_qty_hand - lss_qty_allocated) ls_stk_qty
"
"      FROM lot_ser_stocks
"
"     WHERE lss_bu = p_bu
"
"       AND lss_store_id = c_store_id
"
"       AND lss_prod_id = c_prod_id
"
"       AND lss_prod_rev = c_prod_rev
"
"       AND (lss_sys_ls_no = c_sys_ls_no OR c_sys_ls_no IS NULL)
"
"       AND (TRUNC(lss_expiry_date) >= TRUNC(SYSDATE) OR lss_expiry_date IS NULL)
"
"     ORDER BY lss_sys_ls_no;
"
"
"
"    CURSOR c_cb(c_seq_no	NUMBER) IS
"
"    SELECT istcb_batch_no,istcb_stk_trans_qty,istcb_unit_cost
"
"      FROM inv_stock_trans_cost_batch_vw
"
"     WHERE istcb_bu = p_bu
"
"       AND istcb_doc_no = p_mi_doc_no
"
"       AND istcb_seq_no = c_seq_no
"
"       AND istcb_trans_qty > 0
"
"     ORDER BY istcb_sub_seq_no;
"
"
"
"    CURSOR c_bin(c_store_id	VARCHAR2,
"
"                 c_prod_id	VARCHAR2,
"
"                 c_prod_rev	NUMBER) IS
"
"    SELECT *
"
"      FROM inv_mat_transfer_bin
"
"     WHERE imtb_bu = p_bu
"
"       AND imtb_doc_no = p_mi_doc_no
"
"       AND imtb_store_id = c_store_id
"
"       AND imtb_prod_id = c_prod_id
"
"       AND imtb_prod_rev = c_prod_rev
"
"    ORDER BY imtb_seq_no;
"
"
"
"    CURSOR c_bin1(c_seq_no	VARCHAR2,
"
"                 c_prod_id	VARCHAR2,
"
"                 c_prod_rev	NUMBER) IS
"
"    SELECT *
"
"      FROM inv_mat_issue_bin
"
"     WHERE imib_bu = p_bu
"
"       AND imib_doc_no = p_mi_doc_no
"
"       AND imib_seq_no = c_seq_no
"
"       AND imib_prod_id = c_prod_id
"
"       AND imib_prod_rev = c_prod_rev
"
"    ORDER BY imib_seq_no;
"
"
"
"CURSOR c_prod(c_prod_id		VARCHAR2,
"
"              c_prod_rev	NUMBER)
"
"IS
"
"SELECT prod_ser_lot_opt,
"
"       prod_uom,
"
"       prod_cost_method,
"
"       prod_hsn_code,
"
"       prodplnt_cls prod_cls,
"
"       (SELECT class_desc1
"
"          FROM classes
"
"         WHERE class_bu = prod_bu
"
"           AND class_id = prodplnt_cls)prod_cls_desc,
"
"       prodplnt_sub_cls prod_sub_cls,
"
"       (SELECT subcls_desc1
"
"          FROM sub_classes
"
"         WHERE subcls_bu = prod_bu
"
"           AND subcls_id = prodplnt_sub_cls)prod_subcls_desc,
"
"       prod_group_id,
"
"       (SELECT pgrp_group_desc1
"
"          FROM prod_group
"
"         WHERE pgrp_bu = prod_bu
"
"           AND pgrp_group_id = prod_group_id) prod_grp_desc,
"
"        prod_subgroup_id,
"
"       (SELECT psgrp_subgroup_desc1
"
"          FROM prod_sub_group
"
"         WHERE psgrp_bu = prod_bu
"
"           AND psgrp_subgroup_id = prod_subgroup_id) prod_subgrp_desc,
"
"       (SELECT class_type
"
"          FROM classes
"
"         WHERE class_bu = prod_bu
"
"           AND class_id = prodplnt_cls)prod_cls_type
"
"  FROM prod_plants,products
"
" WHERE prodplnt_bu = prod_bu
"
"   AND prodplnt_prod_id = prod_id
"
"   AND prodplnt_prod_rev = prod_rev
"
"   AND prodplnt_bu = p_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = c_prod_id
"
"   AND prodplnt_prod_rev = c_prod_rev;
"
"
"
"    r_prod		c_prod%ROWTYPE;
"
"    r_lss		c_lss%ROWTYPE;
"
"
"
"    v_doc_type		VARCHAR2(2);
"
"    v_benf_id		VARCHAR2(10);
"
"    v_benf_desc		VARCHAR2(100);
"
"    v_store_id		VARCHAR2(10);
"
"    v_unit_cost		NUMBER;
"
"    v_dc_cnt		NUMBER;
"
"
"
"    v_ls_bal_qty	NUMBER;
"
"    v_ls_upd_qty	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    FOR r_mi IN (SELECT DISTINCT istlnh_rqst_no
"
"                   FROM inv_stock_trans_ln_hist
"
"		  WHERE istlnh_bu = p_bu
"
"		    AND istlnh_doc_no = p_mi_doc_no)
"
"    LOOP
"
"      pkg_inv_hist.proc_rev_mr_hist(p_bu,r_mi.istlnh_rqst_no);
"
"    END LOOP;
"
"
"
"    pkg_inv_hist.proc_rev_mi_hist(p_bu,p_mi_doc_no);
"
"
"
"    FOR r_mi IN c_mi
"
"    LOOP
"
"
"
"      IF r_mi.isthd_doc_oper = 'I' THEN
"
"        v_doc_type := 'MI';
"
"      ELSIF r_mi.isthd_doc_oper = 'T' THEN
"
"        v_doc_type := 'MT';
"
"      END IF;
"
"
"
"      IF r_mi.isthd_issueto_type = 'D' THEN
"
"        v_benf_id := r_mi.isthd_issueto_id;
"
"        v_benf_desc := func_find_dept_desc(p_bu,r_mi.isthd_issueto_id,p_lang);
"
"        v_store_id := NULL;
"
"      ELSIF r_mi.isthd_issueto_type = 'T' THEN
"
"        v_benf_id := r_mi.isthd_issueto_id;
"
"        BEGIN
"
"          SELECT tv_veh_desc1
"
"            INTO v_benf_desc
"
"            FROM transport_vehicles
"
"           WHERE tv_bu = p_bu
"
"             AND tv_vehicle_id = r_mi.isthd_issueto_id;
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN
"
"	    Raise_Application_Error(-20100,'FLM '||p_bu||'/'||r_mi.isthd_issueto_id);
"
"        END;
"
"        v_store_id := NULL;
"
"      ELSIF r_mi.isthd_issueto_type = 'P' THEN
"
"
"
"	v_benf_id := r_mi.isthd_issueto_id;
"
"
"
"        BEGIN
"
"          SELECT prj_name1
"
"            INTO v_benf_desc
"
"            FROM projects
"
"           WHERE prj_bu = p_bu
"
"             AND prj_plnt = p_plnt
"
"             AND prj_proj_id = r_mi.isthd_issueto_id;
"
"
"
"          EXCEPTION WHEN OTHERS THEN v_benf_desc := NULL;
"
"        END;
"
"
"
"        v_store_id := NULL;
"
"      ELSIF r_mi.isthd_issueto_type = 'C' THEN
"
"        v_benf_id := r_mi.isthd_issueto_id;
"
"        v_benf_desc := func_find_party_name(p_bu,r_mi.isthd_issueto_id,p_lang);
"
"        v_store_id := func_find_benf_store(p_bu,p_plnt,r_mi.isthd_plnt_loc_id,r_mi.isthd_issueto_id,'C');
"
"      ELSIF r_mi.isthd_issueto_type IN ('V','X') THEN
"
"        v_benf_id := r_mi.isthd_issueto_id;
"
"        v_benf_desc := func_find_party_name(p_bu,r_mi.isthd_issueto_id,p_lang);
"
"        v_store_id := func_find_benf_store(p_bu,p_plnt,r_mi.isthd_plnt_loc_id,r_mi.isthd_issueto_id,'V');
"
"      ELSIF r_mi.isthd_issueto_type = 'O' THEN
"
"        v_benf_id := r_mi.isthd_issueto_id;
"
"        v_benf_desc := func_find_party_name(p_bu,r_mi.isthd_issueto_id,p_lang);
"
"        v_store_id := NULL;
"
"      ELSE
"
"        v_store_id := r_mi.isthd_issueto_id;
"
"      END IF;
"
"
"
"      --IF r_mi.isthd_issueto_type = 'I' THEN
"
"        v_unit_cost := r_mi.istln_unit_cost;
"
"      /*ELSE
"
"        IF v_store_id IS NOT NULL THEN
"
"          v_unit_cost := func_find_unitcost(p_bu,r_mi.istln_prod_id,r_mi.istln_prod_rev,v_store_id);
"
"        ELSE
"
"          v_unit_cost := 0;
"
"        END IF;
"
"      END IF;*/
"
"
"
"
"
"      SELECT COUNT(*)
"
"        INTO v_dc_cnt
"
"	FROM dc_hd,dc_ln
"
"       WHERE dchd_bu = dcln_bu
"
"         AND dchd_plnt = dcln_plnt
"
"         AND dchd_doc_no = dcln_doc_no
"
"	 AND dcln_bu = p_bu
"
"         AND dcln_plnt = p_plnt
"
"	 AND dcln_doc_no = r_mi.istln_dc_doc_no
"
"	 AND (dcln_cons_inproc_qty > 0 OR dcln_compld_qty > 0 OR dchd_ewb_bill_no IS NOT NULL);
"
"
"
"      IF v_dc_cnt > 0 THEN
"
"        Raise_Application_Error(-20999,'DC already used.');
"
"      END IF;
"
"
"
"      IF r_mi.istln_dc_no IS NOT NULL THEN
"
"
"
"        UPDATE dc_hd
"
"	   SET dchd_status = 'E'
"
"	 WHERE dchd_bu = p_bu
"
"	   AND dchd_plnt = p_plnt
"
"	   AND dchd_doc_no = r_mi.istln_dc_doc_no
"
"	   AND dchd_dc_no = r_mi.istln_dc_no;
"
"
"
"        DELETE FROM dc_match_ln
"
"	 WHERE dcmln_bu = p_bu
"
"	   AND dcmln_dc_doc_no = r_mi.istln_dc_doc_no
"
"	   AND dcmln_dc_no = r_mi.istln_dc_no
"
"	   AND dcmln_dc_seq_no = r_mi.istln_dc_seq_no;
"
"
"
"      END IF;
"
"
"
"      OPEN c_prod(r_mi.istln_prod_id,r_mi.istln_prod_rev);
"
"      FETCH c_prod INTO r_prod;
"
"      CLOSE c_prod;
"
"
"
"      IF r_mi.istln_mat_type = 'S' THEN
"
"
"
"        IF r_mi.isthd_issueto_type NOT IN ('D','P','O','T','S','I') THEN
"
"
"
"          proc_upd_stocks(p_bu,
"
"                          v_store_id,
"
"                          CASE WHEN r_mi.isthd_issueto_type = 'D' THEN v_benf_id ELSE NULL END,
"
"                          r_mi.istln_prod_id,
"
"                          r_mi.istln_prod_rev,
"
"                          0,
"
"                          0,
"
"                          -r_mi.istln_stk_trans_qty,
"
"                          0,
"
"                          0,
"
"                          v_unit_cost,
"
"                          v_unit_cost,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          r_mi.istln_seq_no,
"
"                          0,
"
"                          NULL,
"
"                          r_mi.istln_doc_no,
"
"                          NULL,
"
"                          r_mi.istln_doc_no,
"
"                          CASE WHEN r_mi.isthd_issueto_type = 'V' THEN v_benf_id ELSE NULL END,
"
"                          r_mi.isthd_year,
"
"                          r_mi.isthd_period,
"
"                          r_mi.isthd_trans_date,
"
"                          CASE WHEN r_mi.isthd_issueto_type = 'C' THEN v_benf_id ELSE NULL END,
"
"                          'ICM',
"
"                          v_doc_type,
"
"                          NULL,
"
"                          p_user,
"
"                          SYSDATE,
"
"                          NULL,
"
"                          r_mi.istln_prod_cls,
"
"                          r_mi.istln_ord_no,
"
"                          r_mi.istln_ord_type,
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"                          NULL,
"
"                          NULL,
"
"                          p_qc_qty => 0,
"
"                          p_ref1 => r_mi.istln_reference,
"
"                          p_ref2 => 'MI Reverse',
"
"                          p_swo_type => r_mi.istln_swo_type,
"
"	  	          p_prod_cls_desc => r_prod.prod_cls_desc,
"
"	  	          p_prod_sub_cls_id => r_prod.prod_sub_cls,
"
"	  	          p_prod_sub_cls_desc => r_prod.prod_subcls_desc,
"
"	  	          p_prod_grp_id => r_prod.prod_group_id,
"
"	  	          p_prod_grp_desc	=> r_prod.prod_grp_desc,
"
"	  	          p_prod_sub_grp_id => r_prod.prod_subgroup_id,
"
"	  	          p_prod_sub_grp_desc => r_prod.prod_subgrp_desc,
"
"	  	          p_prod_cls_type => r_prod.prod_cls_type
"
"                         );
"
"
"
"          IF r_mi.prod_indicator = 'I' THEN
"
"
"
"            proc_upd_so_stocks(p_bu,
"
"	    		     v_store_id,
"
"	    		     r_mi.istln_prod_id,
"
"	    		     r_mi.istln_prod_rev,
"
"	    		     -r_mi.istln_stk_trans_qty,
"
"	    		     0,
"
"	    		     v_unit_cost,
"
"	    		     r_mi.istln_so_pfx,
"
"	    		     r_mi.istln_so_no,
"
"	    		     r_mi.istln_so_seq_no,
"
"	    		     r_mi.istln_so_sub_seq_no,
"
"                             r_mi.isthd_trans_date,
"
"	    		     NVL(r_mi.istln_ord_type,'MI'),
"
"	    		     r_mi.istln_ord_pfx,
"
"	    		     NVL(r_mi.istln_ord_no,p_mi_doc_no),
"
"	    		     NULL,
"
"	    		     NULL,
"
"	    		     p_mi_doc_no,
"
"	    		     r_mi.istln_seq_no,
"
"	    		     v_doc_type,
"
"	    		     'ICM',
"
"	    		     r_mi.istln_reference,
"
"	    		     'MI Reverse',
"
"	    		     p_user,
"
"	    		     r_mi.istln_type,
"
"	    		     r_mi.istln_proj_id,
"
"	    		     r_mi.istln_task_id,
"
"	  		     0,
"
"	  		     r_mi.istln_no_of_pcs,
"
"			     p_so_prj_schld_desc => r_mi.istln_so_schld_desc
"
"	    		    );
"
"
"
"
"
"          END IF;
"
"
"
"	  IF r_prod.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"	    FOR r_ls IN c_ls(r_mi.istln_seq_no)
"
"	    LOOP
"
"
"
"	      v_ls_bal_qty := r_ls.isbd_stk_trans_qty;
"
"	      v_ls_upd_qty := v_ls_bal_qty;
"
"
"
"	      /*OPEN c_lss(v_store_id,r_mi.istln_prod_id,r_mi.istln_prod_rev,r_ls.isbd_sys_ls_no);
"
"	      FETCH c_lss INTO r_lss;
"
"	        IF c_lss%FOUND THEN
"
"		  IF v_ls_bal_qty > r_lss.ls_stk_qty THEN
"
"		    v_ls_upd_qty := r_lss.ls_stk_qty;
"
"		    v_ls_bal_qty := v_ls_bal_qty - v_ls_upd_qty;
"
"		  ELSE
"
"		    v_ls_upd_qty := v_ls_bal_qty;
"
"		    v_ls_bal_qty := 0;
"
"		  END IF;
"
"		ELSE
"
"		  v_ls_upd_qty := 0;
"
"		END IF;
"
"	      CLOSE c_lss;*/
"
"
"
"	      proc_upd_lot_ser_stocks(p_bu,
"
"                                      v_store_id,
"
"                                      r_mi.istln_prod_id,
"
"                                      r_mi.istln_prod_rev,
"
"                                      r_ls.isbd_sys_ls_no,
"
"                                      -v_ls_upd_qty,
"
"                                      0,
"
"                                      0,
"
"                                      v_unit_cost,
"
"                                      r_prod.prod_ser_lot_opt,
"
"                                      r_ls.isbd_lot_no,
"
"                                      r_ls.isbd_serial_no,
"
"                                      r_ls.isbd_source_type,
"
"                                      r_ls.isbd_source_id,
"
"                                      r_ls.isbd_expiry_date,
"
"                                      r_mi.isthd_trans_date,
"
"                                      v_doc_type,
"
"                                      NULL,
"
"                                      r_mi.istln_doc_no,
"
"                                      r_mi.istln_seq_no,
"
"                                      'ICM',
"
"                                      r_mi.istln_reference,
"
"                                      'MI Reverse',
"
"                                      p_user
"
"                                     );
"
"
"
"	      /*IF v_ls_bal_qty > 0 THEN
"
"
"
"		FOR r_lss IN c_lss(v_store_id,r_mi.istln_prod_id,r_mi.istln_prod_rev,NULL)
"
"		LOOP
"
"
"
"		  IF v_ls_bal_qty > r_lss.ls_stk_qty THEN
"
"		    v_ls_upd_qty := r_lss.ls_stk_qty;
"
"		    v_ls_bal_qty := v_ls_bal_qty - v_ls_upd_qty;
"
"		  ELSE
"
"		    v_ls_upd_qty := v_ls_bal_qty;
"
"		    v_ls_bal_qty := 0;
"
"		  END IF;
"
"
"
"	          proc_upd_lot_ser_stocks(p_bu,
"
"                                          v_store_id,
"
"                                          r_mi.istln_prod_id,
"
"                                          r_mi.istln_prod_rev,
"
"                                          r_lss.lss_sys_ls_no,
"
"                                          -v_ls_upd_qty,
"
"                                          0,
"
"                                          0,
"
"                                          v_unit_cost,
"
"                                          r_prod.prod_ser_lot_opt,
"
"                                          r_lss.lss_lot_no,
"
"                                          r_lss.lss_ser_no,
"
"                                          r_lss.lss_source_type,
"
"                                          r_lss.lss_source_id,
"
"                                          r_lss.lss_expiry_date,
"
"                                          TRUNC(SYSDATE),--r_mi.isthd_trans_date,
"
"                                          'MI',
"
"                                          NULL,
"
"                                          r_mi.istln_doc_no,
"
"                                          r_mi.istln_seq_no,
"
"                                          'ICM',
"
"                                          r_mi.istln_reference,
"
"                                          'MI Reverse',
"
"                                          p_user
"
"                                         );
"
"
"
"		  EXIT WHEN v_ls_bal_qty <= 0;
"
"
"
"		END LOOP;
"
"
"
"		--Raise_Application_Error(-20999,'HRM ');
"
"
"
"	      END IF;*/
"
"
"
"	      IF (r_mi.isthd_issueto_type = 'W' AND func_find_prod_cons_method(p_bu,r_mi.istln_prod_id,r_mi.istln_prod_rev) = 'P') OR
"
"                 (r_mi.isthd_issueto_type = 'V' AND func_find_prod_os_cons_method(p_bu,r_mi.istln_prod_id,r_mi.istln_prod_rev) = 'P' AND r_mi.istln_ord_no IS NOT NULL) OR
"
"	         (r_mi.isthd_issueto_type = 'W' AND r_mi.istln_par_batch_no IS NOT NULL) THEN
"
"
"
"                proc_insrupd_wip(p_bu,
"
"	  	  	       v_store_id,
"
"	  	  	       r_mi.istln_prod_id,
"
"	  	  	       r_mi.istln_prod_rev,
"
"	  	  	       r_ls.isbd_sys_ls_no,
"
"	  	  	       r_ls.isbd_lot_no,
"
"	  	  	       r_ls.isbd_serial_no,
"
"	  	  	       r_ls.isbd_expiry_date,
"
"	  	  	       r_ls.isbd_source_type,
"
"	  	  	       r_ls.isbd_source_id,
"
"	  	  	       -r_ls.isbd_stk_trans_qty,
"
"	  	  	       0,
"
"	  	  	       r_mi.istln_ord_type,
"
"	  	  	       r_mi.istln_ord_pfx,
"
"	  	  	       r_mi.istln_ord_no,
"
"	  	  	       r_mi.istln_ord_seq_no,
"
"	  	  	       r_mi.istln_ord_sub_seq_no,
"
"	  	  	       p_user,
"
"	  	  	       NULL,
"
"	  	  	       r_mi.istln_so_pfx,
"
"	  	  	       r_mi.istln_so_no,
"
"	  	  	       r_mi.istln_so_seq_no,
"
"	  	  	       r_mi.istln_so_sub_seq_no,
"
"	  	  	       p_proc_id => r_mi.istln_process_id,
"
"	  	  	       p_prod_ord_no => r_mi.istln_po_ord_no,
"
"	  	  	       p_type => r_mi.istln_type,
"
"	  	  	       p_proj_id => r_mi.istln_proj_id,
"
"	  	  	       p_task_id => r_mi.istln_task_id,
"
"	  		       p_ord_trans_no => r_mi.istln_trans_no,
"
"	  		       p_par_batch_no => r_mi.istln_par_batch_no,
"
"	  		       p_so_schld_ref => r_mi.istln_so_schld_desc
"
"	  	  	      );
"
"
"
"              END IF;
"
"
"
"	    END LOOP;
"
"
"
"	  ELSE
"
"
"
"            IF (r_mi.isthd_issueto_type = 'W' AND func_find_prod_cons_method(p_bu,r_mi.istln_prod_id,r_mi.istln_prod_rev) = 'P') OR
"
"               (r_mi.isthd_issueto_type = 'V' AND func_find_prod_os_cons_method(p_bu,r_mi.istln_prod_id,r_mi.istln_prod_rev) = 'P' AND r_mi.istln_ord_no IS NOT NULL) OR
"
"	       (r_mi.isthd_issueto_type = 'W' AND r_mi.istln_par_batch_no IS NOT NULL) THEN
"
"
"
"                proc_insrupd_wip(p_bu,
"
"	  	  	       v_store_id,
"
"	  	  	       r_mi.istln_prod_id,
"
"	  	  	       r_mi.istln_prod_rev,
"
"	  	  	       NULL,
"
"	  	  	       NULL,
"
"	  	  	       NULL,
"
"	  	  	       NULL,
"
"	  	  	       NULL,
"
"	  	  	       NULL,
"
"	  	  	       -r_mi.istln_stk_trans_qty,
"
"	  	  	       0,
"
"	  	  	       r_mi.istln_ord_type,
"
"	  	  	       r_mi.istln_ord_pfx,
"
"	  	  	       r_mi.istln_ord_no,
"
"	  	  	       r_mi.istln_ord_seq_no,
"
"	  	  	       r_mi.istln_ord_sub_seq_no,
"
"	  	  	       p_user,
"
"	  	  	       NULL,
"
"	  	  	       r_mi.istln_so_pfx,
"
"	  	  	       r_mi.istln_so_no,
"
"	  	  	       r_mi.istln_so_seq_no,
"
"	  	  	       r_mi.istln_so_sub_seq_no,
"
"	  	  	       p_proc_id => r_mi.istln_process_id,
"
"	  	  	       p_prod_ord_no => r_mi.istln_po_ord_no,
"
"	  	  	       p_type => r_mi.istln_type,
"
"	  	  	       p_proj_id => r_mi.istln_proj_id,
"
"	  	  	       p_task_id => r_mi.istln_task_id,
"
"	  		       p_ord_trans_no => r_mi.istln_trans_no,
"
"	  		       p_par_batch_no => r_mi.istln_par_batch_no,
"
"	  		       p_so_schld_ref => r_mi.istln_so_schld_desc
"
"	  	  	      );
"
"
"
"            END IF;
"
"
"
"	  END IF;
"
"
"
"	  IF r_prod.prod_cost_method IN ('LIFO','FIFO') AND NOT(r_mi.isthd_issueto_type IN ('S','I') AND r_mi.istln_dc_no IS NOT NULL) THEN
"
"
"
"	    FOR r_cb IN (SELECT *
"
"	                   FROM stock_trans
"
"	  		WHERE sttr_bu = p_bu
"
"	  		  AND sttr_store_id = v_store_id
"
"	  		  AND sttr_prod_id = r_mi.istln_prod_id
"
"	  		  AND sttr_prod_rev = r_mi.istln_prod_rev
"
"	  		  AND sttr_vou_pfx IS NULL
"
"	  		  AND sttr_vou_no = p_mi_doc_no
"
"	  		  AND sttr_vou_line_no = r_mi.istln_seq_no)
"
"	    LOOP
"
"	      proc_upd_stock_batches(p_bu,
"
"	                             v_store_id,
"
"	                             r_mi.istln_prod_id,
"
"	                             r_mi.istln_prod_rev,
"
"	                             r_cb.sttr_batch_no,
"
"	                             0,
"
"	                             r_cb.sttr_trans_qty,
"
"	                             0,
"
"	                             0,
"
"	                             r_cb.sttr_bc_unit_cost,
"
"	                             r_cb.sttr_bc_unit_cost,
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
"                                     r_mi.isthd_trans_date,
"
"	                             NULL,
"
"	                             r_mi.istln_doc_no,
"
"	                             r_mi.istln_seq_no,
"
"	                             'MI',
"
"	                             NULL,
"
"	                             r_mi.istln_doc_no,
"
"	                             r_mi.istln_seq_no,
"
"	                             NULL,
"
"	                             r_mi.istln_prod_cls,
"
"	                             v_doc_type,
"
"	                             'ICM',
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
"	  			   p_prod_cls_desc => r_prod.prod_cls_desc,
"
"	  			   p_prod_subcls => r_prod.prod_sub_cls,
"
"	  			   p_prod_subcls_desc => r_prod.prod_subcls_desc,
"
"	  			   p_prod_grp => r_prod.prod_group_id,
"
"	  			   p_prod_grp_desc => r_prod.prod_grp_desc,
"
"	  			   p_prod_subgrp => r_prod.prod_subgroup_id,
"
"	  			   p_prod_subgrp_desc => r_prod.prod_subgrp_desc,
"
"	  			   p_prod_cls_type => r_prod.prod_cls_type
"
"	                             );
"
"	    END LOOP;
"
"
"
"	  END IF;
"
"
"
"	  IF func_find_store_bin_flag(p_bu,v_store_id) = 'Y' THEN
"
"
"
"	    FOR r_bin In c_bin(v_store_id,r_mi.istln_prod_id,r_mi.istln_prod_rev)
"
"            LOOP
"
"
"
"              proc_upd_bin_stocks(p_bu,
"
"	    			v_store_id,
"
"	    			r_bin.imtb_prod_id,
"
"	    			r_bin.imtb_prod_rev,
"
"	    			r_bin.imtb_bin_id,
"
"	    			r_bin.imtb_sys_ls_no,
"
"	    			r_bin.imtb_lot_no,
"
"	    			r_bin.imtb_ser_no,
"
"	    			r_bin.imtb_source_type,
"
"	    			r_bin.imtb_source_id,
"
"	    			-r_bin.imtb_stk_trans_qty,
"
"	    			0,
"
"	    			0,
"
"	    			0,
"
"	    			v_unit_cost,
"
"                                r_mi.isthd_trans_date,
"
"	    			'MI',
"
"	    			NULL,
"
"	    			r_mi.istln_doc_no,
"
"	    			r_mi.istln_seq_no,
"
"	    			'ICM',
"
"	    			p_user
"
"	    		       );
"
"
"
"            END LOOP;
"
"
"
"          END IF;
"
"
"
"        END IF;
"
"
"
"	proc_upd_stocks(p_bu,
"
"                        r_mi.istln_store_id,
"
"                        CASE WHEN r_mi.isthd_issueto_type = 'D' THEN v_benf_id ELSE NULL END,
"
"                        r_mi.istln_prod_id,
"
"                        r_mi.istln_prod_rev,
"
"                        0,
"
"                        0,
"
"                        r_mi.istln_stk_trans_qty,
"
"                        0,
"
"                        r_mi.istln_stk_trans_qty,
"
"                        v_unit_cost,
"
"                        v_unit_cost,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        r_mi.istln_seq_no,
"
"                        0,
"
"                        NULL,
"
"                        r_mi.istln_doc_no,
"
"                        NULL,
"
"                        r_mi.istln_doc_no,
"
"                        CASE WHEN r_mi.isthd_issueto_type = 'V' THEN v_benf_id ELSE NULL END,
"
"                        r_mi.isthd_year,
"
"                        r_mi.isthd_period,
"
"                        r_mi.isthd_trans_date,
"
"                        CASE WHEN r_mi.isthd_issueto_type = 'C' THEN v_benf_id ELSE NULL END,
"
"                        'ICM',
"
"                        v_doc_type,
"
"                        NULL,
"
"                        p_user,
"
"                        SYSDATE,
"
"                        NULL,
"
"                        r_mi.istln_prod_cls,
"
"                        r_mi.istln_ord_no,
"
"                        r_mi.istln_ord_type,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        p_qc_qty => 0,
"
"                        p_ref1 => r_mi.istln_reference,
"
"                        p_ref2 => 'MI Reverse',
"
"                        p_stock_transit_in => CASE WHEN r_mi.isthd_issueto_type IN ('S','I') THEN -r_mi.istln_stk_trans_qty ELSE 0 END,
"
"                        p_swo_type => r_mi.istln_swo_type,
"
"		        p_prod_cls_desc => r_prod.prod_cls_desc,
"
"		        p_prod_sub_cls_id => r_prod.prod_sub_cls,
"
"		        p_prod_sub_cls_desc => r_prod.prod_subcls_desc,
"
"		        p_prod_grp_id => r_prod.prod_group_id,
"
"		        p_prod_grp_desc	=> r_prod.prod_grp_desc,
"
"		        p_prod_sub_grp_id => r_prod.prod_subgroup_id,
"
"		        p_prod_sub_grp_desc => r_prod.prod_subgrp_desc,
"
"		        p_prod_cls_type => r_prod.prod_cls_type
"
"                       );
"
"
"
"	IF r_mi.prod_indicator = 'I' THEN
"
"
"
"          proc_upd_so_stocks(p_bu,
"
"	  		     r_mi.istln_store_id,
"
"	  		     r_mi.istln_prod_id,
"
"	  		     r_mi.istln_prod_rev,
"
"	  		     r_mi.istln_stk_trans_qty,
"
"	  		     0,
"
"	  		     v_unit_cost,
"
"	  		     r_mi.istln_so_pfx,
"
"	  		     r_mi.istln_so_no,
"
"	  		     r_mi.istln_so_seq_no,
"
"	  		     r_mi.istln_so_sub_seq_no,
"
"                             r_mi.isthd_trans_date,
"
"	  		     NVL(r_mi.istln_ord_type,'MI'),
"
"	  		     NULL,
"
"	  		     p_mi_doc_no,
"
"	  		     NULL,
"
"	  		     NULL,
"
"	  		     p_mi_doc_no,
"
"	  		     r_mi.istln_seq_no,
"
"	  		     v_doc_type,
"
"	  		     'ICM',
"
"	  		     r_mi.istln_reference,
"
"	  		     'MI Reserve',
"
"	  		     p_user,
"
"	  		     r_mi.istln_type,
"
"	  		     r_mi.istln_proj_id,
"
"	  		     r_mi.istln_task_id,
"
"	  		     p_qty_transit => 0,--CASE WHEN var_store_acpt_flag = 'Y' THEN var_trans_qty ELSE 0 END,
"
"			     p_so_prj_schld_desc => r_mi.istln_so_schld_desc
"
"	  		    );
"
"
"
"          proc_upd_so_stocks(p_bu,
"
"	  		     r_mi.istln_store_id,
"
"	  		     r_mi.istln_prod_id,
"
"	  		     r_mi.istln_prod_rev,
"
"	  		     0,
"
"	  		     r_mi.istln_stk_trans_qty,
"
"	  		     v_unit_cost,
"
"	  		     r_mi.istln_so_pfx,
"
"	  		     r_mi.istln_so_no,
"
"	  		     r_mi.istln_so_seq_no,
"
"	  		     r_mi.istln_so_sub_seq_no,
"
"                             r_mi.isthd_trans_date,
"
"	  		     NVL(r_mi.istln_ord_type,'MI'),
"
"	  		     NULL,
"
"	  		     p_mi_doc_no,
"
"	  		     NULL,
"
"	  		     NULL,
"
"	  		     p_mi_doc_no,
"
"	  		     r_mi.istln_seq_no,
"
"	  		     v_doc_type,
"
"	  		     'ICM',
"
"	  		     r_mi.istln_reference,
"
"	  		     'MI Reserve',
"
"	  		     p_user,
"
"	  		     r_mi.istln_type,
"
"	  		     r_mi.istln_proj_id,
"
"	  		     r_mi.istln_task_id,
"
"	  		     p_qty_transit => 0,--CASE WHEN var_store_acpt_flag = 'Y' THEN var_trans_qty ELSE 0 END,
"
"			     p_so_prj_schld_desc => r_mi.istln_so_schld_desc
"
"	  		    );
"
"
"
"        END IF;
"
"
"
"        IF r_prod.prod_ser_lot_opt IN ('L','O','S') THEN
"
"
"
"          FOR r_ls IN c_ls(r_mi.istln_seq_no)
"
"          LOOP
"
"
"
"            proc_upd_lot_ser_stocks(p_bu,
"
"                                    r_mi.istln_store_id,
"
"                                    r_mi.istln_prod_id,
"
"                                    r_mi.istln_prod_rev,
"
"                                    r_ls.isbd_sys_ls_no,
"
"                                    r_ls.isbd_stk_trans_qty,
"
"                                    r_ls.isbd_stk_trans_qty,
"
"                                    CASE WHEN r_mi.isthd_issueto_type IN ('I','S') THEN -r_ls.isbd_stk_trans_qty ELSE 0 END,
"
"                                    v_unit_cost,
"
"                                    r_prod.prod_ser_lot_opt,
"
"                                    r_ls.isbd_lot_no,
"
"                                    r_ls.isbd_serial_no,
"
"                                    r_ls.isbd_source_type,
"
"                                    r_ls.isbd_source_id,
"
"                                    r_ls.isbd_expiry_date,
"
"                                    r_mi.isthd_trans_date,
"
"                                    'MI',
"
"                                    NULL,
"
"                                    r_mi.istln_doc_no,
"
"                                    r_mi.istln_seq_no,
"
"                                    'ICM',
"
"                                    r_mi.istln_reference,
"
"                                    'MI Reverse',
"
"                                    p_user
"
"                                   );
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
"	IF r_prod.prod_cost_method IN ('LIFO','FIFO') THEN
"
"
"
"	    FOR r_cb IN (SELECT *
"
"	                   FROM stock_trans
"
"	  		  WHERE sttr_bu = p_bu
"
"	  		    AND sttr_store_id = r_mi.istln_store_id
"
"	  		    AND sttr_prod_id = r_mi.istln_prod_id
"
"	  		    AND sttr_prod_rev = r_mi.istln_prod_rev
"
"	  		    AND sttr_vou_pfx IS NULL
"
"	  		    AND sttr_vou_no = p_mi_doc_no
"
"	  		    AND sttr_vou_line_no = r_mi.istln_seq_no
"
"			    AND sttr_bucket_type = 'QOH'
"
"			    AND sttr_batch_no IS NOT NULL)
"
"	    LOOP
"
"	      proc_upd_stock_batches(p_bu,
"
"	                             r_mi.istln_store_id,
"
"	                             r_mi.istln_prod_id,
"
"	                             r_mi.istln_prod_rev,
"
"	                             r_cb.sttr_batch_no,
"
"	                             -r_cb.sttr_trans_qty,
"
"	                             0,
"
"	                             -r_cb.sttr_trans_qty,
"
"	                             0,
"
"	                             r_cb.sttr_bc_unit_cost,
"
"	                             r_cb.sttr_bc_unit_cost,
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
"                                     r_mi.isthd_trans_date,
"
"	                             NULL,
"
"	                             r_mi.istln_doc_no,
"
"	                             r_mi.istln_seq_no,
"
"	                             'MI',
"
"	                             NULL,
"
"	                             r_mi.istln_doc_no,
"
"	                             r_mi.istln_seq_no,
"
"	                             NULL,
"
"	                             r_mi.istln_prod_cls,
"
"	                             v_doc_type,
"
"	                             'ICM',
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
"	  			     p_prod_cls_desc => r_prod.prod_cls_desc,
"
"	  			     p_prod_subcls => r_prod.prod_sub_cls,
"
"	  			     p_prod_subcls_desc => r_prod.prod_subcls_desc,
"
"	  			     p_prod_grp => r_prod.prod_group_id,
"
"	  			     p_prod_grp_desc => r_prod.prod_grp_desc,
"
"	  			     p_prod_subgrp => r_prod.prod_subgroup_id,
"
"	  			     p_prod_subgrp_desc => r_prod.prod_subgrp_desc,
"
"	  			     p_prod_cls_type => r_prod.prod_cls_type
"
"	                            );
"
"	    END LOOP;
"
"
"
"	END IF;
"
"
"
"	IF func_find_store_bin_flag(p_bu,r_mi.istln_store_id) = 'Y' THEN
"
"
"
"	  FOR r_bin1 In c_bin1(r_mi.istln_seq_no,r_mi.istln_prod_id,r_mi.istln_prod_rev)
"
"          LOOP
"
"
"
"	    proc_upd_bin_stocks(p_bu,
"
"	    			r_mi.istln_store_id,
"
"	    			r_bin1.imib_prod_id,
"
"	    			r_bin1.imib_prod_rev,
"
"	    			r_bin1.imib_bin_id,
"
"	    			r_bin1.imib_sys_ls_no,
"
"	    			r_bin1.imib_lot_no,
"
"	    			r_bin1.imib_ser_no,
"
"	    			r_bin1.imib_source_type,
"
"	    			r_bin1.imib_source_id,
"
"	    			r_bin1.imib_stk_trans_qty,
"
"	    			0,
"
"	    			0,
"
"	    			0,
"
"	    			v_unit_cost,
"
"                                r_mi.isthd_trans_date,
"
"	    			'MI',
"
"	    			NULL,
"
"	    			r_mi.istln_doc_no,
"
"	    			r_mi.istln_seq_no,
"
"	    			'ICM',
"
"	    			p_user
"
"	    		       );
"
"
"
"	    /*proc_upd_bin_stocks(p_bu,
"
"	    			r_mi.istln_store_id,
"
"	    			r_bin1.imib_prod_id,
"
"	    			r_bin1.imib_prod_rev,
"
"	    			r_bin1.imib_bin_id,
"
"	    			r_bin1.imib_sys_ls_no,
"
"	    			r_bin1.imib_lot_no,
"
"	    			r_bin1.imib_ser_no,
"
"	    			r_bin1.imib_source_type,
"
"	    			r_bin1.imib_source_id,
"
"	    			0,
"
"	    			r_bin1.imib_stk_trans_qty,
"
"	    			0,
"
"	    			0,
"
"	    			v_unit_cost,
"
"                                TRUNC(SYSDATE),--r_mi.isthd_trans_date,
"
"	    			'MI',
"
"	    			NULL,
"
"	    			r_mi.istln_doc_no,
"
"	    			r_mi.istln_seq_no,
"
"	    			'ICM',
"
"	    			p_user
"
"	    		       );*/
"
"
"
"          END LOOP;
"
"	END IF;
"
"
"
"      ELSIF r_mi.istln_mat_type = 'F' THEN
"
"
"
"	Raise_Application_Error(-20007,'POM ');
"
"
"
"      END IF;
"
"
"
"      UPDATE inv_material_request_ln
"
"         SET imrln_issued_qty = imrln_issued_qty - r_mi.istln_trans_qty,
"
"             imrln_mi_allocated_qty = imrln_mi_allocated_qty + r_mi.istln_trans_qty,
"
"             imrln_upd_by = p_user,
"
"             imrln_upd_date = SYSDATE
"
"       WHERE imrln_bu = p_bu
"
"         AND imrln_plnt = p_plnt
"
"         AND imrln_rqst_no = r_mi.istln_rqst_no
"
"         AND imrln_seq_no = r_mi.istln_rqst_seq_no;
"
"
"
"      /*UPDATE mtrl_rqst_ln
"
"         SET mrl_mi_issued_qty = mrl_mi_issued_qty + r_mi.istln_trans_qty,
"
"             mrl_mi_inproc_qty = mrl_mi_inproc_qty - r_mi.istln_trans_qty,
"
"             mrl_upd_by = p_user,
"
"             mrl_upd_date = SYSDATE
"
"       WHERE mrl_bu = p_bu
"
"         AND mrl_plnt = p_plnt
"
"         AND mrl_rqst_no = r_mi.istln_pre_mr_no
"
"         AND mrl_seq_no = r_mi.istln_pre_mr_seq_no;*/
"
"
"
"    END LOOP;
"
"
"
"    UPDATE inv_stock_trans_ln
"
"       SET istln_status = 'N',
"
"	   istln_dc_doc_no = NULL,
"
"	   istln_dc_no = NULL,
"
"	   istln_dc_seq_no = NULL
"
"     WHERE istln_bu = p_bu
"
"       AND istln_doc_no = p_mi_doc_no
"
"       AND istln_status = 'I';
"
"
"
"    UPDATE inv_stock_trans_hd
"
"       SET isthd_status = 'N',
"
"           isthd_jrnl_flag = 'N'
"
"     WHERE isthd_bu = p_bu
"
"       AND isthd_doc_no = p_mi_doc_no;
"
"
"
"    DELETE FROM appl_journals
"
"     WHERE aj_bu = p_bu
"
"       AND aj_appl = 'ICM'
"
"       AND aj_vou_pfx IS NULL
"
"       AND aj_vou_no = p_mi_doc_no;
"
"
"
"    DELETE FROM appl_journals_hist
"
"     WHERE ajh_bu = p_bu
"
"       AND ajh_appl = 'ICM'
"
"       AND ajh_vou_pfx IS NULL
"
"       AND ajh_vou_no = p_mi_doc_no;
"
"
"
"    DELETE FROM gl_jrnl_ln_hist
"
"     WHERE gjlh_bu = p_bu
"
"       AND gjlh_appl = 'ICM'
"
"       AND gjlh_vou_pfx IS NULL
"
"       AND gjlh_vou_no = p_mi_doc_no;
"
"
"
"    DELETE FROM gl_jrnl_hd_hist
"
"     WHERE gjhh_bu = p_bu
"
"       AND gjhh_appl = 'ICM'
"
"       AND gjhh_vou_pfx IS NULL
"
"       AND gjhh_vou_no = p_mi_doc_no;
"
"
"
"    /*DELETE FROM stock_trans
"
"     WHERE sttr_bu = p_bu
"
"       AND sttr_vou_pfx IS NULL
"
"       AND sttr_vou_no = p_mi_doc_no
"
"       AND sttr_appl = 'ICM';
"
"
"
"    DELETE FROM lot_ser_stock_trans
"
"     WHERE lsst_bu = p_bu
"
"       AND lsst_vou_pfx IS NULL
"
"       AND lsst_vou_no = p_mi_doc_no
"
"       AND lsst_appl = 'ICM';
"
"
"
"    DELETE FROM stock_so_trans
"
"     WHERE sstr_bu = p_bu
"
"       AND sstr_rcpt_pfx IS NULL
"
"       AND sstr_rcpt_no = p_mi_doc_no
"
"       AND sstr_appl = 'ICM';*/
"
"
"
"    proc_validate_stocks(p_bu);
"
"
"
"  END proc_rev_mat_frm_mi;
"
"
"
"  PROCEDURE proc_load_mat_frm_mi(p_bu			VARCHAR2,
"
"                                 p_plnt			VARCHAR2,
"
"				 p_plnt_loc_id		VARCHAR2,
"
"				 p_mi_doc_no		VARCHAR2,
"
"				 p_fetch_opt		VARCHAR2,
"
"				 p_gen_type		VARCHAR2,
"
"				 p_prod_id		VARCHAR2,
"
"				 p_prod_rev		NUMBER,
"
"				 p_trans_qty		NUMBER,
"
"				 p_so_type		VARCHAR2,
"
"                                 p_so_pfx		VARCHAR2,
"
"                                 p_so_no		VARCHAR2,
"
"                                 p_so_seq_no		NUMBER,
"
"                                 p_so_sub_seq_no	NUMBER,
"
"                                 p_proj_id		VARCHAR2,
"
"                                 p_task_id		VARCHAR2,
"
"				 p_so_prj_ref		VARCHAR2,
"
"				 p_cust_id		VARCHAR2,
"
"				 p_tool_chrt_no		VARCHAR2,
"
"				 p_miv_no		VARCHAR2,
"
"                                 p_user			VARCHAR2,
"
"				 p_lang			NUMBER
"
"			        )
"
"  AS
"
"    CURSOR c_mih IS
"
"    SELECT isthd_issuefm_store_id
"
"      FROM inv_stock_trans_hd
"
"     WHERE isthd_bu = p_bu
"
"       AND isthd_doc_no = p_mi_doc_no;
"
"
"
"    CURSOR c1 IS
"
"    SELECT LEVEL,bomhd_plnt,par_prod_id,par_prod_rev,child_prod_id,child_prod_rev,bomln_required_qty req_qty,bomln_phantom
"
"      FROM(SELECT bomhd_plnt,bomhd_prod_id par_prod_id,bomhd_prod_rev par_prod_rev,bomln_prod_id child_prod_id,bomln_prod_rev child_prod_rev,
"
"                  bomln_required_qty,bomln_uom,bomln_phantom
"
"             FROM bom_hd,bom_ln
"
"            WHERE bomhd_bu = p_bu
"
"              AND bomhd_status = 'A'
"
"              AND bomhd_primary = 'Y'
"
"              AND bomhd_bu = bomln_bu
"
"              AND bomhd_plnt = bomln_plnt
"
"              AND bomhd_bom_no = bomln_bom_no
"
"              AND TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to
"
"           UNION ALL
"
"           SELECT p_plnt,NULL,NULL,p_prod_id,TO_NUMBER(p_prod_rev),1,func_find_bom_uom(p_bu,p_prod_id,p_prod_rev),'N'
"
"             FROM DUAL)
"
"     WHERE p_gen_type = 'M'
"
"       AND par_prod_id IS NOT NULL
"
"     START WITH par_prod_id IS NULL
"
"   CONNECT BY par_prod_id = prior child_prod_id
"
"    UNION ALL
"
"    SELECT 1,bomhd_plnt,bomhd_prod_id par_prod_id,bomhd_prod_rev par_prod_rev,bomln_prod_id child_prod_id,bomln_prod_rev child_prod_rev,bomln_required_qty req_qty,bomln_phantom
"
"      FROM bom_hd,bom_ln
"
"     WHERE bomhd_bu = p_bu
"
"       AND bomhd_status = 'A'
"
"       AND bomhd_primary = 'Y'
"
"       AND bomhd_bu = bomln_bu
"
"       AND bomhd_plnt = bomln_plnt
"
"       AND bomhd_bom_no = bomln_bom_no
"
"       AND TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to
"
"       AND bomhd_prod_id = p_prod_id
"
"       AND bomhd_prod_rev = p_prod_rev
"
"       AND p_gen_type = 'S'
"
"       AND bomhd_prod_id IS NOT NULL;
"
"
"
"    CURSOR c2 (c_plnt VARCHAR2,
"
"               c_par_prod_id VARCHAR2,
"
"               c_par_prod_rev VARCHAR2,
"
"               c_prod_id VARCHAR2,
"
"               c_prod_rev VARCHAR2)
"
"    IS
"
"    SELECT bomln_prod_id child_prod_id,bomln_prod_rev child_prod_rev,bomln_store_id,bomln_matreq_uom uom,bomln_prod_uom prod_uom,bomln_uom,bomln_conv_factor conv_factor
"
"      FROM bom_hd,routing_ln,bom_ln
"
"     WHERE bomhd_bu = p_bu
"
"       AND bomhd_plnt = p_plnt
"
"       AND bomhd_status = 'A'
"
"       AND bomhd_primary = 'Y'
"
"       AND bomln_phantom = 'N'
"
"       AND bomhd_prod_id = c_par_prod_id
"
"       AND bomhd_prod_rev = c_par_prod_rev
"
"       AND rouln_bu = bomln_bu
"
"       AND rouln_plnt = bomln_plnt
"
"       AND rouln_bom_no = bomln_bom_no
"
"       AND rouln_oprn_seq_no = bomln_oprn_seq_no
"
"       AND bomhd_bu = bomln_bu
"
"       AND bomhd_plnt = bomln_plnt
"
"       AND bomhd_bom_no = bomln_bom_no
"
"       AND bomhd_plnt = c_plnt
"
"       AND bomln_prod_id = c_prod_id
"
"       AND bomln_prod_rev = c_prod_rev
"
"       AND TRUNC (SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to;
"
"
"
"    CURSOR c3(c_par_prod_id        VARCHAR2,
"
"              c_par_prod_rev    NUMBER) IS
"
"    SELECT bomhd_plnt,bomhd_prod_id par_prod_id,bomhd_prod_rev par_prod_rev,bomln_prod_id child_prod_id,bomln_prod_rev child_prod_rev,
"
"           bomln_required_qty,bomln_uom,bomln_phantom
"
"      FROM bom_hd,bom_ln
"
"     WHERE bomhd_bu = p_bu
"
"       AND bomhd_plnt = p_plnt
"
"       AND bomhd_status = 'A'
"
"       AND bomhd_primary = 'Y'
"
"       AND bomhd_bu = bomln_bu
"
"       AND bomhd_plnt = bomln_plnt
"
"       AND bomhd_bom_no = bomln_bom_no
"
"       AND TRUNC(SYSDATE) BETWEEN bomhd_eff_from AND bomhd_eff_to
"
"       AND bomhd_prod_id = c_par_prod_id
"
"       AND bomhd_prod_rev = c_par_prod_rev;
"
"
"
"    TYPE stk_dtls IS RECORD(seq_no		NUMBER,
"
"                            matl_type		VARCHAR2(1),
"
"                            store_id		stores.store_id%TYPE,
"
"                            prod_id		products.prod_id%TYPE,
"
"			    prod_rev		products.prod_rev%TYPE,
"
"			    prod_desc		products.prod_desc11%TYPE,
"
"			    prod_uom		products.prod_uom%TYPE,
"
"			    stk_qty		lot_ser_stocks.lss_qty_hand%TYPE,
"
"		            lot_no		lot_ser_stocks.lss_lot_no%TYPE,
"
"		            ser_no		lot_ser_stocks.lss_ser_no%TYPE,
"
"			    sys_ls_no		lot_ser_stocks.lss_sys_ls_no%TYPE,
"
"			    sou_type		lot_ser_stocks.lss_source_type%TYPE,
"
"			    sou_id		lot_ser_stocks.lss_source_id%TYPE,
"
"			    prod_ord_no		VARCHAR2(15),
"
"			    sf_code		store_sf_stocks.stsfs_sf_code%TYPE,
"
"			    oprn_seq_no		store_sf_stocks.stsfs_oprn_ln_seq_no%TYPE,
"
"			    proc_id		store_sf_stocks.stsfs_process_id%TYPE,
"
"			    unitcost		store_sf_stocks.stsfs_unit_cost%TYPE,
"
"			    so_type		so_qty_on_hand.sqoh_type%TYPE,
"
"			    so_pfx		so_qty_on_hand.sqoh_so_ord_pfx%TYPE,
"
"                            so_no		so_qty_on_hand.sqoh_so_ord_no%TYPE,
"
"			    so_seq_no		so_qty_on_hand.sqoh_seq_no%TYPE,
"
"			    so_sub_seq_no	so_qty_on_hand.sqoh_sub_seq_no%TYPE,
"
"			    proj_id		so_qty_on_hand.sqoh_proj_id%TYPE,
"
"			    task_id		so_qty_on_hand.sqoh_task_id%TYPE,
"
"			    so_ref		so_qty_on_hand.sqoh_so_schld_desc%TYPE,
"
"			    bin_id		bin_stocks.binstk_bin_id%TYPE
"
"		           );
"
"
"
"    TYPE typ_stk IS TABLE OF stk_dtls INDEX BY PLS_INTEGER;
"
"    r_stk_dtls    typ_stk;
"
"
"
"    cr2        c2%ROWTYPE;
"
"
"
"    var_rqst_qty	NUMBER :=0;
"
"    v_seq_no		NUMBER := 0;
"
"    v_uom		VARCHAR2(10);
"
"    v_prod_uom		VARCHAR2(10);
"
"    var_type		VARCHAR2(10);
"
"    v_conv_factor	inv_stock_trans_ln.istln_conv_factor%TYPE;
"
"    v_trans_qty		NUMBER;
"
"
"
"    r_mih	c_mih%ROWTYPE;
"
"
"
"  BEGIN
"
"   --Raise_Application_Error(-20999,'HRM Test'||p_bu||'/'||r_mih.isthd_issuefm_store_id);
"
"    DELETE FROM inv_stock_trans_temp
"
"     WHERE istt_bu = p_bu
"
"       AND istt_doc_no = p_mi_doc_no;
"
"
"
"    OPEN c_mih;
"
"    FETCH c_mih INTO r_mih;
"
"    CLOSE c_mih;
"
"
"
"   -- Raise_Application_Error(-20999,'HRM '||p_bu||'/'||p_fetch_opt||'~'||r_mih.isthd_issuefm_store_id);
"
"
"
"    IF p_fetch_opt = 'S' THEN
"
"    --Raise_Application_Error(-20999,'HRM '||p_bu||'/'||p_fetch_opt||'~'||r_mih.isthd_issuefm_store_id);
"
"      SELECT ROW_NUMBER() OVER (ORDER BY matl_type,prod_id) rno,Qry.*
"
"        BULK COLLECT INTO r_stk_dtls
"
"        FROM (SELECT 'S' matl_type,
"
"		     stock_store_id store_id,
"
"                     stock_prod_id prod_id,
"
"     	             stock_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             NVL((sqoh_so_qty - sqoh_so_alloc_qty),(stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked))) stock_qty,
"
"     	             NULL lot_no,
"
"     	             NULL ser_no,
"
"     	             NULL sys_ls_no,
"
"     	             NULL source_type,
"
"     	             NULL source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = stock_bu AND stcost_store_id = stock_store_id AND stcost_prod_id = stock_prod_id AND stcost_prod_rev = stock_prod_rev),0) unitcost,
"
"	             NVL(sqoh_type,'N') so_type,
"
"	             sqoh_so_ord_pfx so_pfx,
"
"                     sqoh_so_ord_no so_no,
"
"                     sqoh_seq_no so_seq_no,
"
"                     sqoh_sub_seq_no so_sub_seq_no,
"
"                     sqoh_proj_id proj_id,
"
"                     sqoh_task_id task_id,
"
"                     sqoh_so_schld_desc so_ref,
"
"		     NULL bin_id
"
"                FROM stocks,stores,products,so_qty_on_hand
"
"               WHERE stock_bu = store_bu
"
"                 AND stock_store_id = store_id
"
"                 AND prod_bu = stock_bu
"
"                 AND prod_id = stock_prod_id
"
"                 AND prod_rev = stock_prod_rev
"
"                 AND stock_bu = sqoh_bu(+)
"
"                 AND stock_store_id = sqoh_store_id(+)
"
"                 AND stock_prod_id = sqoh_prod_id(+)
"
"                 AND stock_prod_rev = sqoh_prod_rev(+)
"
"                 AND stock_bu = p_bu
"
"                 AND stock_store_id = r_mih.isthd_issuefm_store_id
"
"                 AND (stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked)) > 0
"
"                 AND prod_ser_lot_opt = 'N'
"
"		 AND store_bin_flag = 'N'
"
"	      UNION ALL
"
"              SELECT 'S' matl_type,
"
"		     binstk_store_id store_id,
"
"                     binstk_prod_id prod_id,
"
"     	             binstk_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked)) stock_qty,
"
"     	             NULL lot_no,
"
"     	             NULL ser_no,
"
"     	             NULL sys_ls_no,
"
"     	             NULL source_type,
"
"     	             NULL source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = binstk_bu AND stcost_store_id = binstk_store_id AND stcost_prod_id = binstk_prod_id AND stcost_prod_rev = binstk_prod_rev),0) unitcost,
"
"	             'N' so_type,
"
"	             NULL so_pfx,
"
"                     NULL so_no,
"
"                     NULL so_seq_no,
"
"                     NULL so_sub_seq_no,
"
"                     NULL proj_id,
"
"                     NULL task_id,
"
"                     NULL so_ref,
"
"		     binstk_bin_id bin_id
"
"                FROM bin_stocks,stores,products
"
"               WHERE binstk_bu = store_bu
"
"                 AND binstk_store_id = store_id
"
"                 AND prod_bu = binstk_bu
"
"                 AND prod_id = binstk_prod_id
"
"                 AND prod_rev = binstk_prod_rev
"
"                 AND binstk_bu = p_bu
"
"                 AND binstk_store_id = r_mih.isthd_issuefm_store_id
"
"                 AND (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked))  > 0
"
"                 AND prod_ser_lot_opt = 'N'
"
"		 AND store_bin_flag = 'Y'
"
"              UNION ALL
"
"              SELECT 'S' matl_type,stock_store_id store_id,
"
"                     stock_prod_id prod_id,
"
"     	             stock_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             (lss_qty_hand - lss_qty_allocated) stock_qty,
"
"     	             lss_lot_no lot_no,
"
"     	             lss_ser_no ser_no,
"
"     	             lss_sys_ls_no sys_ls_no,
"
"     	             lss_source_type source_type,
"
"     	             lss_source_id source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = stock_bu AND stcost_store_id = stock_store_id AND stcost_prod_id = stock_prod_id AND stcost_prod_rev = stock_prod_rev),0) unitcost,
"
"	             'N',
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,NULL bin_id
"
"                FROM stocks,stores,lot_ser_stocks,products
"
"               WHERE stock_bu = store_bu
"
"                 AND stock_store_id = store_id
"
"                 AND stock_bu = lss_bu
"
"                 AND stock_store_id = lss_store_id
"
"                 AND stock_prod_id = lss_prod_id
"
"                 AND stock_prod_rev = lss_prod_rev
"
"                 AND prod_bu = stock_bu
"
"                 AND prod_id = stock_prod_id
"
"                 AND prod_rev = stock_prod_rev
"
"                 AND stock_bu = p_bu
"
"                 AND stock_store_id = r_mih.isthd_issuefm_store_id
"
"                 AND (lss_qty_hand - lss_qty_allocated) > 0
"
"                 AND prod_ser_lot_opt <> 'N'
"
"		 AND store_bin_flag = 'N'
"
"              UNION ALL
"
"              SELECT 'S' matl_type,stock_store_id store_id,
"
"                     stock_prod_id prod_id,
"
"     	             stock_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             (lss_qty_hand - lss_qty_allocated) stock_qty,
"
"     	             lss_lot_no lot_no,
"
"     	             lss_ser_no ser_no,
"
"     	             lss_sys_ls_no sys_ls_no,
"
"     	             lss_source_type source_type,
"
"     	             lss_source_id source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = stock_bu AND stcost_store_id = stock_store_id AND stcost_prod_id = stock_prod_id AND stcost_prod_rev = stock_prod_rev),0) unitcost,
"
"	             'N',
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,bsld_bin_id bin_id
"
"                FROM stocks,stores,lot_ser_stocks,products,bin_serial_lot_details
"
"               WHERE stock_bu = store_bu
"
"                 AND stock_store_id = store_id
"
"                 AND stock_bu = lss_bu
"
"                 AND stock_store_id = lss_store_id
"
"                 AND stock_prod_id = lss_prod_id
"
"                 AND stock_prod_rev = lss_prod_rev
"
"		 AND bsld_bu = lss_bu
"
"		 AND bsld_store_id = lss_store_id
"
"		 AND bsld_prod_id = lss_prod_id
"
"		 AND bsld_prod_rev = lss_prod_rev
"
"		 AND bsld_sys_ls_no = lss_sys_ls_no
"
"                 AND prod_bu = stock_bu
"
"                 AND prod_id = stock_prod_id
"
"                 AND prod_rev = stock_prod_rev
"
"                 AND stock_bu = p_bu
"
"                 AND stock_store_id = r_mih.isthd_issuefm_store_id
"
"                 AND (lss_qty_hand - lss_qty_allocated) > 0
"
"                 AND prod_ser_lot_opt <> 'N'
"
"		 AND store_bin_flag = 'Y'
"
"		 AND bsld_sf_code IS NULL
"
"              UNION ALL
"
"              SELECT 'F' matl_type,stsfs_store_id store_id,
"
"                     stsfs_prod_id prod_id,
"
"                     stsfs_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"                     (stsfs_qty - stsfs_alloc_qty) stock_qty,
"
"                     stsfs_lot_no lot_no,
"
"    	             stsfs_serial_no ser_no,
"
"    	             stsfs_sys_ls_no sys_ls_no,
"
"                     stsfs_source_type source_type,
"
"    	             stsfs_source_id source_id,
"
"                     stsfs_ord_no order_no,
"
"                     stsfs_sf_code sf_code,
"
"		     stsfs_oprn_ln_seq_no oprn_seq_no,
"
"                     stsfs_process_id process_id,
"
"	             stsfs_unit_cost unitcost,
"
"	             'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL  bin_id
"
"                FROM store_sf_stocks,products
"
"               WHERE prod_bu = stsfs_bu
"
"	         AND prod_id = stsfs_prod_id
"
"		 AND prod_rev = stsfs_prod_rev
"
"		 AND stsfs_bu = p_bu
"
"                 AND stsfs_store_id = r_mih.isthd_issuefm_store_id
"
"                 AND (stsfs_qty - stsfs_alloc_qty) > 0) Qry;
"
"
"
"      FORALL i IN 1..r_stk_dtls.COUNT
"
"        INSERT INTO inv_stock_trans_temp(istt_bu,
"
"                                         istt_doc_no,
"
"                                         istt_seq_no,
"
"                                         istt_store_id,
"
"                                         istt_prod_type,
"
"                                         istt_prod_id,
"
"                                         istt_prod_rev,
"
"				         istt_prod_desc1,
"
"                                         istt_prod_uom,
"
"                                         istt_uom,
"
"                                         istt_conv_factor,
"
"                                         istt_trans_qty,
"
"                                         istt_so_type,
"
"                                         istt_so_pfx,
"
"                                         istt_so_no,
"
"                                         istt_so_seq_no,
"
"                                         istt_so_sub_seq_no,
"
"                                         istt_proj_id,
"
"                                         istt_task_id,
"
"                                         istt_so_schld_desc,
"
"                                         istt_cre_by,
"
"                                         istt_cre_date,
"
"					 istt_sys_ls_no,
"
"					 istt_lot_no,
"
"					 istt_ser_no,
"
"					 istt_sou_type,
"
"					 istt_sou_id,
"
"					 istt_prod_ord_no,
"
"					 istt_sf_code,
"
"					 istt_bin_id
"
"                                        )
"
"                                  VALUES(p_bu,
"
"                                         p_mi_doc_no,
"
"				         r_stk_dtls(i).seq_no,
"
"				         r_stk_dtls(i).store_id,
"
"				         NULL,
"
"                                         r_stk_dtls(i).prod_id,
"
"                                         r_stk_dtls(i).prod_rev,
"
"				         r_stk_dtls(i).prod_desc,
"
"				         r_stk_dtls(i).prod_uom,
"
"				         r_stk_dtls(i).prod_uom,
"
"				         1,
"
"                                         r_stk_dtls(i).stk_qty,
"
"                                         r_stk_dtls(i).so_type,
"
"                                         r_stk_dtls(i).so_pfx,
"
"                                         r_stk_dtls(i).so_no,
"
"                                         r_stk_dtls(i).so_seq_no,
"
"                                         r_stk_dtls(i).so_sub_seq_no,
"
"                                         r_stk_dtls(i).proj_id,
"
"                                         r_stk_dtls(i).task_id,
"
"                                         r_stk_dtls(i).so_ref,
"
"				         p_user,
"
"				         SYSDATE,
"
"					 r_stk_dtls(i).sys_ls_no,
"
"					 r_stk_dtls(i).lot_no,
"
"					 r_stk_dtls(i).ser_no,
"
"					 r_stk_dtls(i).sou_type,
"
"					 r_stk_dtls(i).sou_id,
"
"					 r_stk_dtls(i).prod_ord_no,
"
"					 r_stk_dtls(i).sf_code,
"
"					 r_stk_dtls(i).bin_id
"
"				        );
"
"
"
"    ELSIF p_fetch_opt = 'B' THEN
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"        IF cr1.bomln_phantom = 'N' THEN
"
"
"
"	  OPEN c2(cr1.bomhd_plnt,cr1.par_prod_id,cr1.par_prod_rev,cr1.child_prod_id,cr1.child_prod_rev);
"
"	  FETCH c2 INTO cr2;
"
"
"
"	    IF c2%FOUND THEN
"
"
"
"	      IF cr2.bomln_uom = cr2.uom THEN
"
"	        var_rqst_qty := (cr1.req_qty * p_trans_qty);
"
"	        v_uom := cr2.uom;
"
"	        v_prod_uom := cr2.prod_uom;
"
"	      ELSE
"
"	        var_rqst_qty := (cr1.req_qty * p_trans_qty) /cr2.conv_factor;
"
"	        v_uom := cr2.uom;
"
"	        v_prod_uom := cr2.prod_uom;
"
"	      END IF;
"
"
"
"              v_conv_factor := func_find_uom_conversion(p_bu,cr1.child_prod_id,cr1.child_prod_rev,v_prod_uom,v_uom);
"
"
"
"              SELECT prodplnt_type INTO var_type
"
"                FROM prod_plants
"
"	       WHERE prodplnt_bu = p_bu
"
"                 AND prodplnt_prod_id = cr1.child_prod_id
"
"                 AND prodplnt_prod_rev = cr1.child_prod_rev
"
"                 AND prodplnt_plnt = p_plnt;
"
"
"
"	      v_seq_no := v_seq_no + 1;
"
"
"
"              INSERT INTO inv_stock_trans_temp(istt_bu,
"
"                                               istt_doc_no,
"
"                                               istt_seq_no,
"
"                                               istt_store_id,
"
"                                               istt_prod_type,
"
"                                               istt_prod_id,
"
"                                               istt_prod_rev,
"
"					       istt_prod_desc1,
"
"                                               istt_prod_uom,
"
"                                               istt_uom,
"
"                                               istt_conv_factor,
"
"                                               istt_trans_qty,
"
"                                               istt_so_type,
"
"                                               istt_so_pfx,
"
"                                               istt_so_no,
"
"                                               istt_so_seq_no,
"
"                                               istt_so_sub_seq_no,
"
"                                               istt_proj_id,
"
"                                               istt_task_id,
"
"                                               istt_so_schld_desc,
"
"                                               istt_cre_by,
"
"                                               istt_cre_date
"
"                                              )
"
"                                         VALUES(p_bu,
"
"                                                p_mi_doc_no,
"
"						v_seq_no,
"
"						r_mih.isthd_issuefm_store_id,
"
"						var_type,
"
"                                                cr1.child_prod_id,
"
"                                                cr1.child_prod_rev,
"
"						(SELECT prod_desc11 FROM products WHERE prod_bu = p_bu AND prod_id = cr1.child_prod_id AND prod_rev = cr1.child_prod_rev),
"
"						v_prod_uom,
"
"						v_uom,
"
"						v_conv_factor,
"
"                                                var_rqst_qty,
"
"                                                p_so_type,
"
"                                                p_so_pfx,
"
"                                                p_so_no,
"
"                                                p_so_seq_no,
"
"                                                p_so_sub_seq_no,
"
"                                                p_proj_id,
"
"                                                p_task_id,
"
"                                                p_so_prj_ref,
"
"						p_user,
"
"						SYSDATE
"
"					       );
"
"
"
"            END IF;
"
"	  CLOSE c2;
"
"
"
"	ELSE
"
"
"
"	  v_trans_qty := (cr1.req_qty * p_trans_qty);
"
"
"
"	  FOR cr3 IN c3(cr1.child_prod_id,cr1.child_prod_rev)
"
"          LOOP
"
"
"
"	    OPEN c2(cr1.bomhd_plnt,cr1.child_prod_id,cr1.child_prod_rev,cr3.child_prod_id,cr3.child_prod_rev);
"
"            FETCH c2 INTO cr2;
"
"              IF c2%FOUND THEN
"
"
"
"                IF cr2.bomln_uom = cr2.uom THEN
"
"                  var_rqst_qty := (cr3.bomln_required_qty * v_trans_qty);
"
"                  v_uom := cr2.uom;
"
"                  v_prod_uom := cr2.prod_uom;
"
"                ELSE
"
"                  var_rqst_qty := (cr3.bomln_required_qty * v_trans_qty) /cr2.conv_factor;
"
"                  v_uom := cr2.uom;
"
"                  v_prod_uom := cr2.prod_uom;
"
"                END IF;
"
"
"
"                v_conv_factor := func_find_uom_conversion(p_bu,cr3.child_prod_id,cr3.child_prod_rev,v_prod_uom,v_uom);
"
"
"
"                SELECT prodplnt_type INTO var_type
"
"                  FROM prod_plants
"
"                 WHERE prodplnt_bu = p_bu
"
"                   AND prodplnt_prod_id = cr3.child_prod_id
"
"                   AND prodplnt_prod_rev = cr3.child_prod_rev
"
"                   AND prodplnt_plnt = p_plnt;
"
"
"
"                INSERT INTO inv_stock_trans_temp(istt_bu,
"
"                                               istt_doc_no,
"
"                                               istt_seq_no,
"
"                                               istt_store_id,
"
"                                               istt_prod_type,
"
"                                               istt_prod_id,
"
"                                               istt_prod_rev,
"
"					       istt_prod_desc1,
"
"                                               istt_prod_uom,
"
"                                               istt_uom,
"
"                                               istt_conv_factor,
"
"                                               istt_trans_qty,
"
"                                               istt_so_type,
"
"                                               istt_so_pfx,
"
"                                               istt_so_no,
"
"                                               istt_so_seq_no,
"
"                                               istt_so_sub_seq_no,
"
"                                               istt_proj_id,
"
"                                               istt_task_id,
"
"                                               istt_so_schld_desc,
"
"                                               istt_cre_by,
"
"                                               istt_cre_date
"
"                                              )
"
"                                         VALUES(p_bu,
"
"                                                p_mi_doc_no,
"
"						v_seq_no,
"
"						r_mih.isthd_issuefm_store_id,
"
"						var_type,
"
"                                                cr3.child_prod_id,
"
"                                                cr3.child_prod_rev,
"
"						(SELECT prod_desc11 FROM products WHERE prod_bu = p_bu AND prod_id = cr3.child_prod_id AND prod_rev = cr3.child_prod_rev),
"
"						v_prod_uom,
"
"						v_uom,
"
"						v_conv_factor,
"
"                                                var_rqst_qty,
"
"                                                p_so_type,
"
"                                                p_so_pfx,
"
"                                                p_so_no,
"
"                                                p_so_seq_no,
"
"                                                p_so_sub_seq_no,
"
"                                                p_proj_id,
"
"                                                p_task_id,
"
"                                                p_so_prj_ref,
"
"						p_user,
"
"						SYSDATE
"
"					       );
"
"
"
"	      END IF;
"
"
"
"	    CLOSE c2;
"
"	  END LOOP;
"
"	END IF;
"
"      END LOOP;
"
"
"
"    ELSIF p_fetch_opt = 'T' THEN
"
"
"
"      /*FOR r_prod IN (SELECT tcl_tool_prod_id,tcl_tool_prod_rev,tcl_tl_station_loc,ppl_dflt_store_id,prodplnt_type,prod_uom
"
"                       FROM tool_chart_hd,tool_chart_ln,prod_plants_loc,prod_plants,products
"
"		      WHERE tch_bu = tcl_bu
"
"		        AND tch_plnt = tcl_plnt
"
"			AND tch_doc_no = tcl_doc_no
"
"			AND tch_rev_no = tcl_rev_no
"
"			AND ppl_bu = tcl_bu
"
"			AND ppl_plnt = tcl_plnt
"
"			AND ppl_prod_id = tcl_tool_prod_id
"
"			AND ppl_prod_rev = tcl_tool_prod_rev
"
"			AND prodplnt_bu = ppl_bu
"
"			AND prodplnt_plnt = ppl_plnt
"
"			AND prodplnt_prod_id = ppl_prod_id
"
"			AND prodplnt_prod_rev = ppl_prod_rev
"
"			AND prod_bu = prodplnt_bu
"
"			AND prod_id = prodplnt_prod_id
"
"			AND prod_rev = prodplnt_prod_rev
"
"			AND tch_bu = p_bu
"
"			AND tch_plnt = p_plnt
"
"			AND ppl_plnt_loc_id = p_plnt_loc_id
"
"			AND tch_tl_cht_no = p_tool_chrt_no
"
"			AND tch_status 	= 'A'
"
"	              GROUP BY tcl_tool_prod_id,tcl_tool_prod_rev,tcl_tl_station_loc,ppl_dflt_store_id,prodplnt_type,prod_uom
"
"		      ORDER BY TO_NUMBER(LTRIM(tcl_tl_station_loc,'S')))
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"
"
"	INSERT INTO inv_stock_trans_temp(istt_bu,
"
"                                         istt_doc_no,
"
"                                         istt_seq_no,
"
"                                         istt_store_id,
"
"                                         istt_prod_type,
"
"                                         istt_prod_id,
"
"                                         istt_prod_rev,
"
"					 istt_prod_desc1,
"
"                                         istt_prod_uom,
"
"                                         istt_uom,
"
"                                         istt_conv_factor,
"
"                                         istt_trans_qty,
"
"                                         istt_tl_station_loc,
"
"                                         istt_so_type,
"
"                                         istt_so_pfx,
"
"                                         istt_so_no,
"
"                                         istt_so_seq_no,
"
"                                         istt_so_sub_seq_no,
"
"                                         istt_proj_id,
"
"                                         istt_task_id,
"
"                                         istt_so_schld_desc,
"
"                                         istt_cre_by,
"
"                                         istt_cre_date
"
"                                        )
"
"                                  VALUES(p_bu,
"
"                                         p_mi_doc_no,
"
"					 v_seq_no,
"
"					 r_mih.isthd_issuefm_store_id,
"
"					 r_prod.prodplnt_type,
"
"                                         r_prod.tcl_tool_prod_id,
"
"                                         r_prod.tcl_tool_prod_rev,
"
"					 (SELECT prod_desc11 FROM products WHERE prod_bu = p_bu AND prod_id = r_prod.tcl_tool_prod_id AND prod_rev = r_prod.tcl_tool_prod_rev),
"
"					 r_prod.prod_uom,
"
"					 r_prod.prod_uom,
"
"					 1,
"
"                                         1,
"
"					 r_prod.tcl_tl_station_loc,
"
"                                         p_so_type,
"
"                                         p_so_pfx,
"
"                                         p_so_no,
"
"                                         p_so_seq_no,
"
"                                         p_so_sub_seq_no,
"
"                                         p_proj_id,
"
"                                         p_task_id,
"
"                                         p_so_prj_ref,
"
"					 p_user,
"
"					 SYSDATE
"
"					);
"
"
"
"      END LOOP;*/NULL; --Commend By Mohamed Yasir
"
"
"
"    ELSIF p_fetch_opt = 'M' THEN
"
"
"
"      FOR r_prod IN (SELECT istlnh_prod_id,istlnh_prod_rev,istlnh_trans_qty,prod_desc11,prodplnt_type,prod_uom
"
"                       FROM inv_stock_trans_hd_hist,inv_stock_trans_ln_hist,prod_plants_loc,prod_plants,products
"
"		      WHERE isthdh_bu= istlnh_bu
"
"                        AND isthdh_doc_no = istlnh_doc_no
"
"		        AND ppl_bu = istlnh_bu
"
"			AND ppl_plnt = isthdh_plnt
"
"			AND ppl_prod_id = istlnh_prod_id
"
"			AND ppl_prod_rev = istlnh_prod_rev
"
"			AND ppl_plnt_loc_id = isthdh_plnt_loc_id
"
"			AND prodplnt_bu = ppl_bu
"
"			AND prodplnt_plnt = ppl_plnt
"
"			AND prodplnt_prod_id = ppl_prod_id
"
"			AND prodplnt_prod_rev = ppl_prod_rev
"
"			AND prod_bu = prodplnt_bu
"
"			AND prod_id = prodplnt_prod_id
"
"			AND prod_rev = prodplnt_prod_rev
"
"			AND istlnh_bu = p_bu
"
"			AND istlnh_doc_no = p_miv_no
"
"			AND istlnh_status <> 'C'
"
"		      ORDER BY istlnh_seq_no)
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"
"
"	INSERT INTO inv_stock_trans_temp(istt_bu,
"
"                                         istt_doc_no,
"
"                                         istt_seq_no,
"
"                                         istt_store_id,
"
"                                         istt_prod_type,
"
"                                         istt_prod_id,
"
"                                         istt_prod_rev,
"
"					 istt_prod_desc1,
"
"                                         istt_prod_uom,
"
"                                         istt_uom,
"
"                                         istt_conv_factor,
"
"                                         istt_trans_qty,
"
"                                         istt_so_type,
"
"                                         istt_so_pfx,
"
"                                         istt_so_no,
"
"                                         istt_so_seq_no,
"
"                                         istt_so_sub_seq_no,
"
"                                         istt_proj_id,
"
"                                         istt_task_id,
"
"                                         istt_so_schld_desc,
"
"                                         istt_cre_by,
"
"                                         istt_cre_date
"
"                                        )
"
"                                  VALUES(p_bu,
"
"                                         p_mi_doc_no,
"
"					 v_seq_no,
"
"					 r_mih.isthd_issuefm_store_id,
"
"					 r_prod.prodplnt_type,
"
"                                         r_prod.istlnh_prod_id,
"
"                                         r_prod.istlnh_prod_rev,
"
"					 r_prod.prod_desc11,
"
"					 r_prod.prod_uom,
"
"					 r_prod.prod_uom,
"
"					 1,
"
"                                         r_prod.istlnh_trans_qty,
"
"                                         p_so_type,
"
"                                         p_so_pfx,
"
"                                         p_so_no,
"
"                                         p_so_seq_no,
"
"                                         p_so_sub_seq_no,
"
"                                         p_proj_id,
"
"                                         p_task_id,
"
"                                         p_so_prj_ref,
"
"					 p_user,
"
"					 SYSDATE
"
"					);
"
"
"
"      END LOOP;
"
"
"
"    END IF;
"
"
"
"  END proc_load_mat_frm_mi;
"
"
"
"  PROCEDURE proc_ins_mat_frm_mi_load(p_bu		VARCHAR2,
"
"				     p_mi_doc_no	VARCHAR2,
"
"				     p_user		VARCHAR2
"
"				    )
"
"  AS
"
"    CURSOR c1 IS
"
"    SELECT *
"
"      FROM inv_stock_trans_temp,products
"
"     WHERE prod_bu = istt_bu
"
"       AND prod_id = istt_prod_id
"
"       AND prod_rev = istt_prod_rev
"
"       AND istt_bu = p_bu
"
"       AND istt_doc_no = p_mi_doc_no
"
"       AND istt_sel_flag = 'Y'
"
"       ORDER BY TO_NUMBER(LTRIM(istt_tl_station_loc,'S'));
"
"
"
"    v_seq_no		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"    SELECT NVL(MAX(istln_seq_no),0) INTO v_seq_no
"
"      FROM inv_stock_trans_ln
"
"     WHERE istln_bu = p_bu
"
"       AND istln_doc_no = p_mi_doc_no;
"
"   --Raise_Application_Error(-20999,'HRM '||v_seq_no);
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_seq_no := v_seq_no + 1;
"
"
"
"      v_unit_cost := func_find_unitcost(p_bu,cr1.istt_prod_id,cr1.istt_prod_rev,cr1.istt_store_id);
"
"
"
"      INSERT INTO inv_stock_trans_ln(istln_bu,
"
"        			     istln_doc_no,
"
"        			     istln_seq_no,
"
"        			     istln_mat_type,
"
"				     istln_store_id,
"
"        			     istln_prod_id,
"
"        			     istln_prod_rev,
"
"        			     istln_uom,
"
"        			     istln_prod_uom,
"
"        			     istln_conv_factor,
"
"        			     istln_prod_cls,
"
"				     istln_prod_cls_desc,
"
"				     istln_prod_subcls,
"
"				     istln_prod_subcls_desc,
"
"        			     istln_rqst_qty,
"
"        			     istln_trans_qty,
"
"				     istln_stk_trans_qty,
"
"        			     istln_excs_qty,
"
"        			     istln_accepted_qty,
"
"        			     istln_trnf_acpt_qty,
"
"        			     istln_unit_cost,
"
"        			     istln_type,
"
"        			     istln_so_pfx,
"
"        			     istln_so_no,
"
"        			     istln_so_seq_no,
"
"        			     istln_so_sub_seq_no,
"
"        			     istln_proj_id,
"
"        			     istln_task_id,
"
"        			     istln_so_schld_desc,
"
"        			     istln_cre_by,
"
"				     istln_cre_emp_id,
"
"				     istln_cre_ip_addr,
"
"				     istln_cre_os_user,
"
"        			     istln_cre_date,
"
"        			     istln_hsn_code,
"
"				     istln_prod_grp,
"
"                                     istln_prod_grp_desc,
"
"                                     istln_prod_subgrp,
"
"                                     istln_prod_subgrp_desc,
"
"				     istln_reference,
"
"				     istln_status,
"
"				     istln_tl_station_loc
"
"			            )
"
"                              VALUES(p_bu,
"
"        			     p_mi_doc_no,
"
"        			     v_seq_no,
"
"        			     'S',
"
"				     cr1.istt_store_id,
"
"        			     cr1.istt_prod_id,
"
"        			     cr1.istt_prod_rev,
"
"        			     cr1.istt_uom,
"
"        			     cr1.istt_prod_uom,
"
"        			     cr1.istt_conv_factor,
"
"        			     cr1.prod_cls,
"
"				     (SELECT class_desc1 FROM classes WHERE class_bu = p_bu AND class_id = cr1.prod_cls),
"
"				     cr1.prod_sub_cls,
"
"				     (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = p_bu AND subcls_id = cr1.prod_sub_cls),
"
"        			     0,
"
"        			     cr1.istt_trans_qty,
"
"				     cr1.istt_trans_qty,
"
"        			     0,
"
"        			     0,
"
"        			     0,
"
"        			     v_unit_cost,
"
"        			     cr1.istt_so_type,
"
"        			     cr1.istt_so_pfx,
"
"        			     cr1.istt_so_no,
"
"        			     cr1.istt_so_seq_no,
"
"        			     cr1.istt_so_sub_seq_no,
"
"        			     cr1.istt_proj_id,
"
"        			     cr1.istt_task_id,
"
"        			     cr1.istt_so_schld_desc,
"
"        			     p_user,
"
"				     v_emp_id,
"
"				     v_ip_addr,
"
"				     v_os_user,
"
"        			     SYSDATE,
"
"        			     cr1.prod_hsn_code,
"
"				     cr1.prod_group_id,
"
"                                     (SELECT pgrp_group_desc1 FROM prod_group WHERE pgrp_bu = p_bu AND pgrp_group_id = cr1.prod_group_id),
"
"                                     cr1.prod_subgroup_id,
"
"                                     (SELECT psgrp_subgroup_desc1 FROM prod_sub_group WHERE psgrp_bu = p_bu AND psgrp_subgroup_id = cr1.prod_subgroup_id),
"
"				     'Material Issuance - Direct',
"
"				     'N',
"
"				     cr1.istt_tl_station_loc
"
"				    );
"
"
"
"    END LOOP;
"
"
"
"    DELETE inv_stock_trans_temp
"
"     WHERE istt_bu = p_bu
"
"       AND istt_doc_no = p_mi_doc_no;
"
"
"
"  END proc_ins_mat_frm_mi_load;
"
"
"
"  PROCEDURE proc_load_stk_frm_mi(p_bu			VARCHAR2,
"
"                                 p_plnt                 VARCHAR2,
"
"				 p_mi_doc_no		VARCHAR2,
"
"				 p_mi_issueto_type      VARCHAR2,
"
"				 p_store_id		VARCHAR2,
"
"                                 p_user			VARCHAR2
"
"			        )
"
"  AS
"
"
"
"    TYPE stk_dtls IS RECORD(seq_no		NUMBER(5),
"
"                            matl_type		VARCHAR2(1),
"
"                            store_id		stores.store_id%TYPE,
"
"                            prod_id		products.prod_id%TYPE,
"
"			    prod_rev		products.prod_rev%TYPE,
"
"			    prod_desc		products.prod_desc11%TYPE,
"
"			    prod_uom		products.prod_uom%TYPE,
"
"			    stk_qty		lot_ser_stocks.lss_qty_hand%TYPE,
"
"		            lot_no		lot_ser_stocks.lss_lot_no%TYPE,
"
"		            ser_no		lot_ser_stocks.lss_ser_no%TYPE,
"
"			    sys_ls_no		lot_ser_stocks.lss_sys_ls_no%TYPE,
"
"			    sou_type		lot_ser_stocks.lss_source_type%TYPE,
"
"			    sou_id		lot_ser_stocks.lss_source_id%TYPE,
"
"			    prod_ord_no		VARCHAR2(30),
"
"			    sf_code		store_sf_stocks.stsfs_sf_code%TYPE,
"
"			    oprn_seq_no		store_sf_stocks.stsfs_oprn_ln_seq_no%TYPE,
"
"			    proc_id		store_sf_stocks.stsfs_process_id%TYPE,
"
"			    unitcost		store_sf_stocks.stsfs_unit_cost%TYPE,
"
"			    so_type		so_qty_on_hand.sqoh_type%TYPE,
"
"			    so_pfx		so_qty_on_hand.sqoh_so_ord_pfx%TYPE,
"
"                            so_no		so_qty_on_hand.sqoh_so_ord_no%TYPE,
"
"			    so_seq_no		so_qty_on_hand.sqoh_seq_no%TYPE,
"
"			    so_sub_seq_no	so_qty_on_hand.sqoh_sub_seq_no%TYPE,
"
"			    proj_id		so_qty_on_hand.sqoh_proj_id%TYPE,
"
"			    task_id		so_qty_on_hand.sqoh_task_id%TYPE,
"
"			    so_ref		so_qty_on_hand.sqoh_so_schld_desc%TYPE,
"
"			    bin_id		store_bins.stbin_bin_id%TYPE,
"
"			    prod_drawing_no     products.prod_drawing_no%TYPE,
"
"			    expiry_date         lot_ser_stocks.lss_expiry_date%TYPE
"
"		           );
"
"
"
"    TYPE typ_stk IS TABLE OF stk_dtls INDEX BY PLS_INTEGER;
"
"    r_stk_dtls    typ_stk;
"
"
"
"  BEGIN
"
"       --Raise_application_error(-20999,'HRM'||'~'||p_bu||'/'||p_mi_doc_no||'~'||p_store_id||'~'||p_user);
"
"    DELETE /*+NOLOGGING*/ inv_stock_trans_temp
"
"     WHERE istt_bu = p_bu
"
"       AND istt_doc_no = p_mi_doc_no;
"
"
"
"      SELECT /*ROW_NUMBER() OVER (ORDER BY matl_type,prod_id)*/ROWNUM rno,Qry.*
"
"        BULK COLLECT INTO r_stk_dtls
"
"        FROM (SELECT 'S' matl_type,
"
"		     stock_store_id store_id,
"
"                     stock_prod_id prod_id,
"
"     	             stock_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             NVL((sqoh_so_qty - sqoh_so_alloc_qty),(stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked))) stock_qty,
"
"     	             NULL lot_no,
"
"     	             NULL ser_no,
"
"     	             NULL sys_ls_no,
"
"     	             NULL source_type,
"
"     	             NULL source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = stock_bu AND stcost_store_id = stock_store_id AND stcost_prod_id = stock_prod_id AND stcost_prod_rev = stock_prod_rev),0) unitcost,
"
"	             NVL(sqoh_type,'N') so_type,
"
"	             sqoh_so_ord_pfx so_pfx,
"
"                     sqoh_so_ord_no so_no,
"
"                     sqoh_seq_no so_seq_no,
"
"                     sqoh_sub_seq_no so_sub_seq_no,
"
"                     sqoh_proj_id proj_id,
"
"                     sqoh_task_id task_id,
"
"                     sqoh_so_schld_desc so_ref,
"
"		     NULL bin_id,--(SELECT stbin_bin_id FROM store_bins WHERE stbin_bu = store_bu AND stbin_store_id = store_id)bin_id,
"
"		     prod_drawing_no,
"
"		     NULL expiry_date
"
"                FROM stocks,stores,products,so_qty_on_hand
"
"               WHERE stock_bu = store_bu
"
"                 AND stock_store_id = store_id
"
"                 AND prod_bu = stock_bu
"
"                 AND prod_id = stock_prod_id
"
"                 AND prod_rev = stock_prod_rev
"
"                 AND stock_bu = sqoh_bu(+)
"
"                 AND stock_store_id = sqoh_store_id(+)
"
"                 AND stock_prod_id = sqoh_prod_id(+)
"
"                 AND stock_prod_rev = sqoh_prod_rev(+)
"
"                 AND stock_bu = p_bu
"
"                 AND ((p_mi_issueto_type <> 'S' AND stock_store_id <> p_store_id) OR p_mi_issueto_type = 'S')--r_mih.isthd_issuefm_store_id
"
"		 AND store_plnt = p_plnt
"
"                 AND (stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked)) > 0
"
"                 AND prod_ser_lot_opt = 'N'
"
"		 AND store_bin_flag = 'N'
"
"		 AND store_physical = 'Y'
"
"		 AND NVL((sqoh_so_qty - sqoh_so_alloc_qty),(stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked))) > 0
"
"	      UNION ALL
"
"              SELECT 'S' matl_type,
"
"		     binstk_store_id store_id,
"
"                     binstk_prod_id prod_id,
"
"     	             binstk_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked)) stock_qty,
"
"     	             NULL lot_no,
"
"     	             NULL ser_no,
"
"     	             NULL sys_ls_no,
"
"     	             NULL source_type,
"
"     	             NULL source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = binstk_bu AND stcost_store_id = binstk_store_id AND stcost_prod_id = binstk_prod_id AND stcost_prod_rev = binstk_prod_rev),0) unitcost,
"
"	             'N' so_type,
"
"	             NULL so_pfx,
"
"                     NULL so_no,
"
"                     NULL so_seq_no,
"
"                     NULL so_sub_seq_no,
"
"                     NULL proj_id,
"
"                     NULL task_id,
"
"                     NULL so_ref,
"
"		     binstk_bin_id bin_id,
"
"		     prod_drawing_no,
"
"		      NULL expiry_date
"
"                FROM bin_stocks,stores,products
"
"               WHERE binstk_bu = store_bu
"
"                 AND binstk_store_id = store_id
"
"                 AND prod_bu = binstk_bu
"
"                 AND prod_id = binstk_prod_id
"
"                 AND prod_rev = binstk_prod_rev
"
"                 AND binstk_bu = p_bu
"
"                 --AND binstk_store_id <> p_store_id
"
"		 AND ((p_mi_issueto_type <> 'S' AND binstk_store_id <> p_store_id) OR p_mi_issueto_type = 'S')
"
"		 AND store_plnt = p_plnt
"
"                 AND (binstk_bin_qoh - (binstk_qty_allocated + binstk_qty_picked))  > 0
"
"                 AND prod_ser_lot_opt = 'N'
"
"		 AND store_bin_flag = 'Y'
"
"		 AND store_physical = 'Y'
"
"              UNION ALL
"
"              SELECT 'S' matl_type,lss_store_id store_id,
"
"                     lss_prod_id prod_id,
"
"     	             lss_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             (lss_qty_hand - lss_qty_allocated) stock_qty,
"
"     	             lss_lot_no lot_no,
"
"     	             lss_ser_no ser_no,
"
"     	             lss_sys_ls_no sys_ls_no,
"
"     	             lss_source_type source_type,
"
"     	             lss_source_id source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = lss_bu AND stcost_store_id = lss_store_id AND stcost_prod_id = lss_prod_id AND stcost_prod_rev = lss_prod_rev),0) unitcost,
"
"	             CASE WHEN lss_so_ref IS NOT NULL THEN 'SO'
"
"		          ELSE 'N'
"
"                     END,
"
"		     lss_so_pfx,
"
"		     lss_so_no,
"
"		     lss_so_seq_no,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     lss_so_ref,
"
"		     NULL bin_id,
"
"		     prod_drawing_no,
"
"		     lss_expiry_date expiry_date
"
"                FROM lot_ser_stocks,stores,products
"
"               WHERE lss_bu = store_bu
"
"                 AND lss_store_id = store_id
"
"                 AND prod_bu = lss_bu
"
"                 AND prod_id = lss_prod_id
"
"                 AND prod_rev = lss_prod_rev
"
"                 AND lss_bu = p_bu
"
"                 --AND lss_store_id <> p_store_id
"
"		 AND ((p_mi_issueto_type <> 'S' AND lss_store_id <> p_store_id) OR p_mi_issueto_type = 'S')
"
"		 AND store_plnt = p_plnt
"
"                 AND (lss_qty_hand - lss_qty_allocated) > 0
"
"		 AND TRUNC(lss_expiry_date) >= TRUNC(SYSDATE)
"
"                 AND prod_ser_lot_opt <> 'N'
"
"		 AND store_bin_flag = 'N'
"
"		 AND store_physical = 'Y'
"
"              UNION ALL
"
"              SELECT 'S' matl_type,lss_store_id store_id,
"
"                     lss_prod_id prod_id,
"
"     	             lss_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"     	             (lss_qty_hand - lss_qty_allocated) stock_qty,
"
"     	             lss_lot_no lot_no,
"
"     	             lss_ser_no ser_no,
"
"     	             lss_sys_ls_no sys_ls_no,
"
"     	             lss_source_type source_type,
"
"     	             lss_source_id source_id,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = lss_bu AND stcost_store_id = lss_store_id AND stcost_prod_id = lss_prod_id AND stcost_prod_rev = lss_prod_rev),0) unitcost,
"
"	             CASE WHEN lss_so_ref IS NOT NULL THEN 'SO'
"
"		          ELSE 'N'
"
"                     END,
"
"		     lss_so_pfx,
"
"		     lss_so_no,
"
"		     lss_so_seq_no,
"
"		     NULL,
"
"		     NULL,
"
"		     NULL,
"
"		     lss_so_ref,
"
"		     bsld_bin_id bin_id,
"
"		     prod_drawing_no,
"
"		     lss_expiry_date expiry_date
"
"                FROM lot_ser_stocks,stores,products,bin_serial_lot_details
"
"               WHERE lss_bu = store_bu
"
"                 AND lss_store_id = store_id
"
"                 AND prod_bu = lss_bu
"
"                 AND prod_id = lss_prod_id
"
"                 AND prod_rev = lss_prod_rev
"
"		 AND bsld_bu = lss_bu
"
"		 AND bsld_store_id = lss_store_id
"
"		 AND bsld_prod_id = lss_prod_id
"
"		 AND bsld_prod_rev = lss_prod_rev
"
"		 AND bsld_sys_ls_no = lss_sys_ls_no
"
"		 AND bsld_sf_code IS NULL
"
"                 AND lss_bu = p_bu
"
"                 AND ((p_mi_issueto_type <> 'S' AND lss_store_id <> p_store_id) OR p_mi_issueto_type = 'S')
"
"		 AND store_plnt = p_plnt
"
"                 AND (lss_qty_hand - lss_qty_allocated) > 0
"
"		 AND TRUNC(lss_expiry_date) >= TRUNC(SYSDATE)
"
"                 AND prod_ser_lot_opt <> 'N'
"
"		 AND store_bin_flag = 'Y'
"
"		 AND store_physical = 'Y'
"
"              UNION ALL
"
"              SELECT 'F' matl_type,stsfs_store_id store_id,
"
"                     stsfs_prod_id prod_id,
"
"                     stsfs_prod_rev prod_rev,
"
"		     prod_desc11,
"
"		     prod_uom,
"
"                     (stsfs_qty - stsfs_alloc_qty) stock_qty,
"
"                     stsfs_lot_no lot_no,
"
"    	             stsfs_serial_no ser_no,
"
"    	             stsfs_sys_ls_no sys_ls_no,
"
"                     stsfs_source_type source_type,
"
"    	             stsfs_source_id source_id,
"
"                     stsfs_ord_no order_no,
"
"                     stsfs_sf_code sf_code,
"
"		     stsfs_oprn_ln_seq_no oprn_seq_no,
"
"                     stsfs_process_id process_id,
"
"	             stsfs_unit_cost unitcost,
"
"	             'N',NULL,NULL,NULL,NULL,NULL,NULL,NULL,
"
"		    NULL,-- (SELECT stbin_bin_id FROM store_bins WHERE stbin_bu = stsfs_bu AND stbin_store_id = stsfs_store_id)bin_id,
"
"		     prod_drawing_no,
"
"		     stsfs_expiry_date expiry_date
"
"                FROM store_sf_stocks,products
"
"               WHERE prod_bu = stsfs_bu
"
"	         AND prod_id = stsfs_prod_id
"
"		 AND prod_rev = stsfs_prod_rev
"
"		 AND stsfs_bu = p_bu
"
"                 --AND stsfs_store_id <> p_store_id
"
"		 AND ((p_mi_issueto_type <> 'S' AND stsfs_store_id <> p_store_id) OR p_mi_issueto_type = 'S')
"
"		 AND stsfs_store_plnt =  p_plnt
"
"		 AND p_mi_issueto_type NOT IN ('E','D','P','I')
"
"		 AND stsfs_expiry_date >= SYSDATE
"
"                 AND (stsfs_qty - stsfs_alloc_qty) > 0) Qry;
"
"      --Raise_application_error(-20999,'HRM'||'~'||p_bu||'/'||p_mi_doc_no||'~'||p_store_id||'~'||p_user);
"
"      FORALL i IN 1..r_stk_dtls.COUNT
"
"
"
"        INSERT INTO inv_stock_trans_temp(istt_bu,
"
"                                         istt_doc_no,
"
"                                         istt_seq_no,
"
"                                         istt_store_id,
"
"                                         istt_prod_type,
"
"                                         istt_prod_id,
"
"                                         istt_prod_rev,
"
"				         istt_prod_desc1,
"
"                                         istt_prod_uom,
"
"                                         istt_uom,
"
"                                         istt_conv_factor,
"
"                                         istt_trans_qty,
"
"                                         istt_so_type,
"
"                                         istt_so_pfx,
"
"                                         istt_so_no,
"
"                                         istt_so_seq_no,
"
"                                         istt_so_sub_seq_no,
"
"                                         istt_proj_id,
"
"                                         istt_task_id,
"
"                                         istt_so_schld_desc,
"
"                                         istt_cre_by,
"
"                                         istt_cre_date,
"
"					 istt_sys_ls_no,
"
"					 istt_lot_no,
"
"					 istt_ser_no,
"
"					 istt_sou_type,
"
"					 istt_sou_id,
"
"					 istt_prod_ord_no,
"
"					 istt_sf_code,
"
"					 istt_bin_id,
"
"					 istt_matl_type,
"
"					 istt_drawing_no,
"
"					 istt_expiry_date,
"
"					 istt_unit_cost
"
"                                        )
"
"                                  VALUES(p_bu,
"
"                                         p_mi_doc_no,
"
"				         r_stk_dtls(i).seq_no,
"
"				         r_stk_dtls(i).store_id,
"
"				         NULL,
"
"                                         r_stk_dtls(i).prod_id,
"
"                                         r_stk_dtls(i).prod_rev,
"
"				         r_stk_dtls(i).prod_desc,
"
"				         r_stk_dtls(i).prod_uom,
"
"				         r_stk_dtls(i).prod_uom,
"
"				         1,
"
"                                         r_stk_dtls(i).stk_qty,
"
"                                         r_stk_dtls(i).so_type,
"
"                                         r_stk_dtls(i).so_pfx,
"
"                                         r_stk_dtls(i).so_no,
"
"                                         r_stk_dtls(i).so_seq_no,
"
"                                         r_stk_dtls(i).so_sub_seq_no,
"
"                                         r_stk_dtls(i).proj_id,
"
"                                         r_stk_dtls(i).task_id,
"
"                                         r_stk_dtls(i).so_ref,
"
"				         p_user,
"
"				         SYSDATE,
"
"					 r_stk_dtls(i).sys_ls_no,
"
"					 r_stk_dtls(i).lot_no,
"
"					 r_stk_dtls(i).ser_no,
"
"					 r_stk_dtls(i).sou_type,
"
"					 r_stk_dtls(i).sou_id,
"
"					 r_stk_dtls(i).prod_ord_no,
"
"					 r_stk_dtls(i).sf_code,
"
"					 r_stk_dtls(i).bin_id,
"
"					 r_stk_dtls(i).matl_type,
"
"					 r_stk_dtls(i).prod_drawing_no,
"
"					 r_stk_dtls(i).expiry_date,
"
"					 r_stk_dtls(i).unitcost
"
"				        );
"
"	EXCEPTION WHEN OTHERS THEN
"
"	Raise_Application_Error(-20999,'HRM'||'-'|| SQLERRM);
"
"
"
"  END;
"
"
"
"  PROCEDURE proc_ins_stk_mat_frm_mi(p_bu		VARCHAR2,
"
"				    p_mi_doc_no		VARCHAR2,
"
"				    p_user		VARCHAR2
"
"				   )
"
"  AS
"
"
"
"    CURSOR c1 IS
"
"    SELECT *
"
"      FROM inv_stock_trans_hd,inv_stock_trans_temp,stores
"
"     WHERE isthd_bu = istt_bu
"
"       AND isthd_doc_no = istt_doc_no
"
"       AND store_bu = istt_bu
"
"       AND store_id = istt_store_id
"
"       AND istt_bu = p_bu
"
"       AND istt_doc_no = p_mi_doc_no
"
"       AND istt_sel_flag = 'Y'
"
"       ORDER BY istt_seq_no ASC;
"
"
"
"    CURSOR c_prod(c_plnt	VARCHAR2,
"
"                  c_prod_id	VARCHAR2,
"
"		  c_prod_rev	VARCHAR2) IS
"
"    SELECT prod_id,prod_rev,prod_uom,prod_hsn_code,prod_ser_lot_opt,prod_cost_method,prod_cb_level,
"
"           prodplnt_cls prod_cls,
"
"           (SELECT class_desc1 FROM classes WHERE class_bu = prod_bu AND class_id = prodplnt_cls) prod_cls_desc,
"
"           prodplnt_sub_cls prod_sub_cls,
"
"           (SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = prod_bu AND subcls_id = prodplnt_sub_cls) prod_subcls_desc,
"
"	   prod_group_id,
"
"	   (SELECT pgrp_group_desc1 FROM prod_group WHERE pgrp_bu = prod_bu AND pgrp_group_id = prod_group_id) prod_grp_desc,
"
"	   prod_subgroup_id,
"
"	   (SELECT psgrp_subgroup_desc1 FROM prod_sub_group WHERE psgrp_bu = prod_bu AND psgrp_subgroup_id = prod_subgroup_id) prod_subgrp_desc,
"
"	   prodplnt_cls_type prod_cls_type,prod_drawing_no,prod_drg_rev
"
"      FROM prod_plants,products
"
"     WHERE prodplnt_bu = prod_bu
"
"       AND prodplnt_prod_id = prod_id
"
"       AND prodplnt_prod_rev = prod_rev
"
"       AND prodplnt_bu = p_bu
"
"       AND prodplnt_plnt = c_plnt
"
"       AND prodplnt_prod_id = c_prod_id
"
"       AND prodplnt_prod_rev = c_prod_rev;
"
"
"
"    CURSOR c_sb(c_store_id	VARCHAR2,
"
"                c_prod_id	VARCHAR2,
"
"	        c_prod_rev	NUMBER,
"
"		c_doc_date	DATE) IS
"
"    SELECT sb_batch_id,sb_bc_unit_cost,SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) stk_qty
"
"      FROM stocks_batches
"
"     WHERE sb_bu = p_bu
"
"       AND sb_store_id = c_store_id
"
"       AND sb_prod_id = c_prod_id
"
"       AND sb_prod_rev = c_prod_rev
"
"       AND TRUNC(sb_trans_date) <= c_doc_date
"
"     GROUP BY sb_batch_id,sb_bc_unit_cost,sb_cost_method
"
"    HAVING SUM(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"     ORDER BY DECODE(sb_cost_method,'FIFO',sb_batch_id,NULL) ASC,
"
"              DECODE(sb_cost_method,'LIFO',sb_batch_id,NULL) DESC;
"
"
"
"    CURSOR c_lsd(c_sys_ls_no	NUMBER) IS
"
"    SELECT plsn_no_of_bale_recvd,plsn_gr_wgt,plsn_tr_wgt,plsn_lot_wgt,plsn_unit_cost
"
"      FROM prod_lot_ser_nos
"
"     WHERE plsn_bu = p_bu
"
"       AND plsn_sys_ls_no = c_sys_ls_no;
"
"
"
"    r_prod		c_prod%ROWTYPE;
"
"    r_lsd		c_lsd%ROWTYPE;
"
"
"
"    v_seq_no		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"    v_roll_seq_no	NUMBER;
"
"
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_ls_vou_pfx	VARCHAR2(5);
"
"    v_ls_vou_no		VARCHAR2(15);
"
"    v_ls_vou_line_no	NUMBER(5);
"
"
"
"    v_cb_bal_qty	NUMBER(12,3);
"
"    v_cb_upd_qty	NUMBER(12,3);
"
"
"
"    v_btk_bal_qty	NUMBER(12,3);
"
"    v_btk_upd_qty	NUMBER(12,3);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"    SELECT NVL(MAX(istln_seq_no),0) INTO v_seq_no
"
"      FROM inv_stock_trans_ln
"
"     WHERE istln_bu = p_bu
"
"       AND istln_doc_no = p_mi_doc_no;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      OPEN c_prod(cr1.isthd_plnt,cr1.istt_prod_id,cr1.istt_prod_rev);
"
"      FETCH c_prod INTO r_prod;
"
"      CLOSE c_prod;
"
"
"
"      UPDATE inv_stock_trans_ln
"
"         SET istln_trans_qty = istln_trans_qty + cr1.istt_trans_qty,
"
"	     istln_stk_trans_qty = istln_stk_trans_qty + cr1.istt_trans_qty,
"
"             istln_accepted_qty = istln_accepted_qty + cr1.istt_trans_qty,
"
"             istln_trnf_acpt_qty = istln_trnf_acpt_qty + cr1.istt_trans_qty,
"
"	     istln_upd_by = p_user,
"
"	     istln_upd_emp_id = v_emp_id,
"
"	     istln_upd_ip_addr = v_ip_addr,
"
"	     istln_upd_os_user = v_os_user,
"
"	     istln_upd_date = SYSDATE
"
"       WHERE istln_bu = p_bu
"
"         AND istln_doc_no = p_mi_doc_no
"
"	 AND istln_status <> 'C'
"
"         AND istln_mat_type = cr1.istt_matl_type
"
"         AND istln_prod_id = cr1.istt_prod_id
"
"	 AND istln_store_id = cr1.istt_store_id
"
"         AND istln_prod_rev = cr1.istt_prod_rev
"
"	 AND (cr1.istt_matl_type = 'S' OR (cr1.istt_matl_type = 'F' AND (istln_po_ord_no = cr1.istt_prod_ord_no OR (istln_po_ord_no IS NULL AND cr1.istt_prod_ord_no IS NULL))
"
"         AND (istln_sf_code = cr1.istt_sf_code OR (istln_sf_code IS NULL AND cr1.istt_sf_code IS NULL))))
"
"       RETURNING istln_seq_no,istln_unit_cost INTO v_seq_no,v_unit_cost;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"      --Raise_Application_Error(-20999,'Item not found.'||p_mi_doc_no||'/'||cr1.istt_matl_type||'/'||cr1.istt_prod_id||'/'||cr1.istt_store_id||'/'||cr1.istt_prod_rev||'/'||cr1.istt_prod_ord_no);
"
"
"
"        SELECT NVL(MAX(istln_seq_no),0)+1 INTO v_seq_no
"
"	  FROM inv_stock_trans_ln
"
"	 WHERE istln_bu = p_bu
"
"	   AND istln_doc_no = p_mi_doc_no;
"
"
"
"        IF cr1.istt_matl_type = 'S' THEN
"
"	  v_unit_cost := func_find_unitcost(p_bu,cr1.istt_prod_id,cr1.istt_prod_rev,cr1.istt_store_id);
"
"	ELSE
"
"	  v_unit_cost := func_find_sfg_unitcost(p_bu,cr1.istt_prod_id,cr1.istt_prod_rev,cr1.istt_store_id,cr1.istt_prod_ord_no,cr1.istt_sf_code,cr1.istt_sys_ls_no);
"
"	END IF;
"
"
"
"        INSERT INTO inv_stock_trans_ln(istln_bu,
"
"        			       istln_doc_no,
"
"        			       istln_seq_no,
"
"        			       istln_mat_type,
"
"				       istln_store_id,
"
"        			       istln_prod_id,
"
"        			       istln_prod_rev,
"
"        			       istln_uom,
"
"        			       istln_prod_uom,
"
"        			       istln_conv_factor,
"
"        			       istln_prod_cls,
"
"				       istln_prod_cls_desc,
"
"				       istln_prod_subcls,
"
"				       istln_prod_subcls_desc,
"
"        			       istln_rqst_qty,
"
"        			       istln_trans_qty,
"
"				       istln_stk_trans_qty,
"
"        			       istln_excs_qty,
"
"        			       istln_accepted_qty,
"
"        			       istln_trnf_acpt_qty,
"
"        			       istln_unit_cost,
"
"        			       istln_type,
"
"        			       istln_so_pfx,
"
"        			       istln_so_no,
"
"        			       istln_so_seq_no,
"
"        			       istln_so_sub_seq_no,
"
"        			       istln_proj_id,
"
"        			       istln_task_id,
"
"        			       istln_so_schld_desc,
"
"        			       istln_cre_by,
"
"				       istln_cre_emp_id,
"
"				       istln_cre_ip_addr,
"
"				       istln_cre_os_user,
"
"        			       istln_cre_date,
"
"        			       istln_hsn_code,
"
"				       istln_prod_grp,
"
"                                       istln_prod_grp_desc,
"
"                                       istln_prod_subgrp,
"
"                                       istln_prod_subgrp_desc,
"
"				       istln_reference,
"
"				       istln_status,
"
"				       istln_po_ord_no,
"
"				       istln_sf_code,
"
"				       istln_drawing_no,
"
"				       istln_drawing_rev
"
"			              )
"
"                                VALUES(p_bu,
"
"        			       p_mi_doc_no,
"
"        			       v_seq_no,
"
"        			       cr1.istt_matl_type,
"
"				       cr1.istt_store_id,
"
"        			       cr1.istt_prod_id,
"
"        			       cr1.istt_prod_rev,
"
"        			       cr1.istt_uom,
"
"        			       cr1.istt_prod_uom,
"
"        			       cr1.istt_conv_factor,
"
"        			       r_prod.prod_cls,
"
"				       r_prod.prod_cls_desc,
"
"				       r_prod.prod_sub_cls,
"
"				       r_prod.prod_subcls_desc,
"
"        			       0,
"
"        			       cr1.istt_trans_qty,
"
"				       cr1.istt_trans_qty,
"
"        			       0,
"
"        			       0,
"
"        			       0,
"
"        			       v_unit_cost,
"
"        			       CASE WHEN cr1.istt_so_type = 'N' THEN 'NA' ELSE cr1.istt_so_type END,
"
"        			       cr1.istt_so_pfx,
"
"        			       cr1.istt_so_no,
"
"        			       cr1.istt_so_seq_no,
"
"        			       cr1.istt_so_sub_seq_no,
"
"        			       cr1.istt_proj_id,
"
"        			       cr1.istt_task_id,
"
"        			       cr1.istt_so_schld_desc,
"
"        			       p_user,
"
"				       v_emp_id,
"
"				       v_ip_addr,
"
"				       v_os_user,
"
"        			       SYSDATE,
"
"        			       r_prod.prod_hsn_code,
"
"				       r_prod.prod_group_id,
"
"                                       r_prod.prod_grp_desc,
"
"                                       r_prod.prod_subgroup_id,
"
"                                       r_prod.prod_subgrp_desc,
"
"				       'Material Issuance - Direct',
"
"				       'N',
"
"				       cr1.istt_prod_ord_no,
"
"				       cr1.istt_sf_code,
"
"				       r_prod.prod_drawing_no,
"
"				       r_prod.prod_drg_rev
"
"				      );
"
"
"
"        IF cr1.istt_matl_type = 'S' THEN
"
"
"
"	  proc_upd_stocks(p_bu,
"
"                          cr1.istt_store_id,
"
"                          NULL,
"
"                          cr1.istt_prod_id,
"
"                          cr1.istt_prod_rev,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          cr1.istt_trans_qty,
"
"                          v_unit_cost,
"
"                          v_unit_cost,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          0,
"
"                          v_seq_no,
"
"                          0,
"
"                          NULL,
"
"                          p_mi_doc_no,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.isthd_year,
"
"                          cr1.isthd_period,
"
"                          cr1.isthd_trans_date,
"
"                          NULL,
"
"                          'ICM',
"
"                          'MI',
"
"                          NULL,
"
"                          p_user,
"
"                          SYSDATE,
"
"                          NULL,
"
"                          r_prod.prod_cls,
"
"                          NULL,
"
"                          'PO',
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"			  p_prod_cls_desc => r_prod.prod_cls_desc,
"
"			  p_prod_sub_cls_id => r_prod.prod_sub_cls,
"
"			  p_prod_sub_cls_desc => r_prod.prod_subcls_desc,
"
"			  p_prod_grp_id => r_prod.prod_group_id,
"
"			  p_prod_grp_desc => r_prod.prod_grp_desc,
"
"			  p_prod_sub_grp_id => r_prod.prod_subgroup_id,
"
"			  p_prod_sub_grp_desc => r_prod.prod_subgrp_desc,
"
"			  p_prod_cls_type => r_prod.prod_cls_type
"
"                         );
"
"
"
"          IF (cr1.istt_so_pfx IS NOT NULL AND cr1.istt_so_no IS NOT NULL) OR (cr1.istt_proj_id IS NOT NULL AND cr1.istt_task_id IS NOT NULL) THEN
"
"
"
"	    proc_upd_so_stocks(p_bu,
"
"	    		       cr1.istt_store_id,
"
"	    		       cr1.istt_prod_id,
"
"	    		       cr1.istt_prod_rev,
"
"	    		       0,
"
"	    		       cr1.istt_trans_qty,
"
"	    		       v_unit_cost,
"
"	    		       cr1.istt_so_pfx,
"
"	    		       cr1.istt_so_no,
"
"	    		       cr1.istt_so_seq_no,
"
"	    		       cr1.istt_so_sub_seq_no,
"
"	    		       cr1.isthd_trans_date,
"
"	    		       'PO',
"
"	    		       NULL,
"
"	    		       NULL,
"
"	    		       NULL,
"
"	    		       NULL,
"
"	    		       p_mi_doc_no,
"
"	    		       v_seq_no,
"
"	    		       'MI',
"
"	    		       'ICM',
"
"	    		       'Material Issuance - Direct',
"
"	    		       'Material Allocated against Sales Order',
"
"	    		       p_user,
"
"	    		       cr1.istt_so_type,
"
"	    		       cr1.istt_proj_id,
"
"	    		       cr1.istt_task_id
"
"	    		      );
"
"
"
"	  END IF;
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
"      IF r_prod.prod_ser_lot_opt = 'N' AND r_prod.prod_cost_method IN ('FIFO','LIFO') THEN
"
"
"
"        v_btk_bal_qty := cr1.istt_trans_qty;
"
"
"
"	FOR r_sb IN c_sb(cr1.istt_store_id,cr1.istt_prod_id,cr1.istt_prod_rev,cr1.isthd_trans_date)
"
"	LOOP
"
"
"
"          IF v_btk_bal_qty > r_sb.stk_qty THEN
"
"            v_btk_upd_qty := r_sb.stk_qty;
"
"            v_btk_bal_qty := v_btk_bal_qty - r_sb.stk_qty;
"
"          ELSE
"
"            v_btk_upd_qty := v_btk_bal_qty;
"
"            v_btk_bal_qty := 0;
"
"          END IF;
"
"
"
"	  UPDATE inv_stock_trans_cost_batch
"
"             SET istcb_trans_qty = istcb_trans_qty + v_btk_upd_qty,
"
"		 istcb_stk_trans_qty = istcb_stk_trans_qty + v_btk_upd_qty,
"
"		 istcb_upd_by = p_user,
"
"		 istcb_upd_date = SYSDATE
"
"	   WHERE istcb_bu = p_bu
"
"             AND istcb_doc_no = p_mi_doc_no
"
"	     AND istcb_seq_no = v_seq_no
"
"	     AND istcb_batch_no = r_sb.sb_batch_id;
"
"
"
"	  IF SQL%NOTFOUND THEN
"
"
"
"            /*proc_upd_stock_batches(p_bu,
"
"			           cr1.istt_store_id,
"
"			           cr1.istt_prod_id,
"
"			           cr1.istt_prod_rev,
"
"			           r_sb.sb_batch_id,
"
"			           0,
"
"			           0,
"
"			           v_btk_upd_qty,
"
"			           0,
"
"			           r_sb.sb_bc_unit_cost,
"
"			           r_sb.sb_bc_unit_cost,
"
"			           0,
"
"			           0,
"
"			           0,
"
"			           0,
"
"			           'N',
"
"			           cr1.isthd_trans_date,
"
"			           NULL,
"
"			           p_mi_doc_no,
"
"			           v_seq_no,
"
"			           'MI',
"
"			           NULL,
"
"			           p_mi_doc_no,
"
"			           v_seq_no,
"
"			           NULL,
"
"			           r_prod.prod_cls,
"
"			           'QC',
"
"			           'ICM',
"
"			           NULL,
"
"			           NULL,
"
"			           NULL,
"
"			           NULL,
"
"			           p_user,
"
"			           p_prod_cls_desc => r_prod.prod_cls_desc,
"
"			           p_prod_subcls => r_prod.prod_sub_cls,
"
"			           p_prod_subcls_desc => r_prod.prod_subcls_desc,
"
"			           p_prod_grp => r_prod.prod_group_id,
"
"			           p_prod_grp_desc => r_prod.prod_grp_desc,
"
"			           p_prod_subgrp => r_prod.prod_subgroup_id,
"
"			           p_prod_subgrp_desc => r_prod.prod_subgrp_desc,
"
"			           p_prod_cls_type => r_prod.prod_cls_type
"
"    	                          );*/
"
"
"
"	    SELECT NVL(MAX(istcb_sub_seq_no),0) + 1 INTO v_sub_seq_no
"
"              FROM inv_stock_trans_cost_batch
"
"             WHERE istcb_bu = p_bu
"
"               AND istcb_doc_no = p_mi_doc_no
"
"               AND istcb_seq_no = v_seq_no;
"
"
"
"            INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"                                                   istcb_doc_no,
"
"                                                   istcb_seq_no,
"
"                                                   istcb_sub_seq_no,
"
"                                                   istcb_batch_no,
"
"                                                   istcb_trans_qty,
"
"						   istcb_stk_trans_qty,
"
"                                                   istcb_unit_cost,
"
"                                                   istcb_cre_by,
"
"						   istcb_cre_emp_id,
"
"						   istcb_cre_ip_addr,
"
"						   istcb_cre_os_user,
"
"                                                   istcb_cre_date,
"
"						   istcb_ins_rec
"
"                                                  )
"
"                                            VALUES(p_bu,
"
"                                                   p_mi_doc_no,
"
"                                                   v_seq_no,
"
"                                                   v_sub_seq_no,
"
"                                                   r_sb.sb_batch_id,
"
"                                                   v_btk_upd_qty,
"
"						   v_btk_upd_qty,
"
"                                                   r_sb.sb_bc_unit_cost,
"
"                                                   p_user,
"
"						   v_emp_id,
"
"						   v_ip_addr,
"
"						   v_os_user,
"
"                                                   SYSDATE,
"
"						   'Y'
"
"                                                  );
"
"
"
"	  END IF;
"
"
"
"	  EXIT WHEN v_btk_bal_qty = 0;
"
"
"
"	END LOOP;
"
"
"
"	IF v_btk_bal_qty > 0 THEN
"
"	  Raise_Application_Error(-20251,'ICM Cost Batch not found.'||v_btk_bal_qty);
"
"	END IF;
"
"
"
"      END IF;
"
"
"
"      UPDATE inv_stock_batch_details
"
"	 SET isbd_trans_qty = isbd_trans_qty + cr1.istt_trans_qty,
"
"	     isbd_stk_trans_qty = isbd_stk_trans_qty + cr1.istt_trans_qty,
"
"	     isbd_trnf_acpt_qty = isbd_trnf_acpt_qty + cr1.istt_trans_qty,
"
"	     isbd_upd_by = p_user,
"
"	     isbd_upd_date = SYSDATE,
"
"	     isbd_ins_rec = 'Y'
"
"       WHERE isbd_bu = p_bu
"
"	 AND isbd_issue_doc_no = p_mi_doc_no
"
"	 AND isbd_seq_no = v_seq_no
"
"	 AND (isbd_sys_ls_no = cr1.istt_sys_ls_no OR (isbd_sys_ls_no IS NULL AND cr1.istt_sys_ls_no IS NULL))
"
"      RETURNING isbd_sub_seq_no INTO v_sub_seq_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"        IF r_prod.prod_ser_lot_opt = 'N' THEN
"
"
"
"	  proc_ins_mat_iss_dtls(p_bu,p_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr1.istt_trans_qty,cr1.istt_trans_qty,0,NULL,cr1.istt_expiry_date,NULL,NULL,p_user,p_unit_cost=> cr1.istt_unit_cost );
"
"
"
"	  IF cr1.store_bin_flag = 'Y' THEN
"
"	    proc_bin_lot_ser_operation(p_bu,
"
"	                               cr1.istt_store_id,
"
"	      			       cr1.istt_prod_id,
"
"	      			       cr1.istt_prod_rev,
"
"	      			       cr1.istt_bin_id,
"
"	      			       NULL,
"
"				       NULL,
"
"	      			       NULL,
"
"	      			       NULL,
"
"	      			       NULL,
"
"	      			       NULL,
"
"	      			       cr1.istt_trans_qty,
"
"	      			       v_unit_cost,
"
"	      			       1,
"
"	      			       cr1.isthd_trans_date,
"
"	      			       'MI',
"
"	      			       NULL,
"
"	      			       p_mi_doc_no,
"
"	      			       v_seq_no,
"
"	      			       'A',
"
"	      			       'ICM',
"
"	      			       p_user
"
"	      			      );
"
"	  END IF;
"
"
"
"	ELSE
"
"
"
"	  OPEN c_lsd(cr1.istt_sys_ls_no);
"
"	  FETCH c_lsd INTO r_lsd;
"
"	  CLOSE c_lsd;
"
"
"
"	  SELECT NVL(MAX(isbd_sub_seq_no),0) + 1 INTO v_sub_seq_no
"
"            FROM inv_stock_batch_details
"
"           WHERE isbd_bu = p_bu
"
"             AND isbd_issue_doc_no = p_mi_doc_no
"
"             AND isbd_seq_no = v_seq_no;
"
"
"
"	  INSERT INTO inv_stock_batch_details(isbd_bu,
"
"	                                      isbd_issue_doc_no,
"
"	                                      isbd_seq_no,
"
"	                                      isbd_sub_seq_no,
"
"	                                      isbd_trans_qty,
"
"					      isbd_stk_trans_qty,
"
"	                                      isbd_trnf_acpt_qty,
"
"	                                      isbd_sys_ls_no,
"
"	                                      isbd_lot_no,
"
"	                                      isbd_serial_no,
"
"					      isbd_mfg_date,
"
"	                                      isbd_expiry_date,
"
"	                                      isbd_source_type,
"
"	                                      isbd_source_id,
"
"	                                      isbd_ins_rec,
"
"	                                      isbd_cre_by,
"
"					      isbd_cre_emp_id,
"
"					      isbd_cre_ip_addr,
"
"					      isbd_cre_os_user,
"
"	                                      isbd_cre_date,
"
"					      isbd_gr_wght,
"
"					      isbd_tr_wght,
"
"					      isbd_nt_wght,
"
"					      isbd_tot_bags,
"
"					      isbd_unit_cost,
"
"					      isbd_test_no,
"
"					      isbd_heat_no
"
"	                                     )
"
"                                       VALUES(p_bu,
"
"	                                      p_mi_doc_no,
"
"	                                      v_seq_no,
"
"	                                      v_sub_seq_no,
"
"	                                      cr1.istt_trans_qty,
"
"					      cr1.istt_trans_qty,
"
"	                                      cr1.istt_trans_qty,
"
"	                                      cr1.istt_sys_ls_no,
"
"	                                      cr1.istt_lot_no,
"
"	                                      cr1.istt_ser_no,
"
"					      cr1.istt_mfg_date,
"
"	                                      cr1.istt_expiry_date,
"
"	                                      cr1.istt_sou_type,
"
"	                                      cr1.istt_sou_id,
"
"	                                      'Y',
"
"	                                      p_user,
"
"					      v_emp_id,
"
"					      v_ip_addr,
"
"					      v_os_user,
"
"	                                      SYSDATE,
"
"					      r_lsd.plsn_gr_wgt,
"
"					      r_lsd.plsn_tr_wgt,
"
"					      r_lsd.plsn_lot_wgt,
"
"					      r_lsd.plsn_no_of_bale_recvd,
"
"					      r_lsd.plsn_unit_cost,
"
"					      (SELECT plsn_test_no FROM prod_lot_ser_nos WHERE plsn_bu = p_bu AND plsn_sys_ls_no = cr1.istt_sys_ls_no),
"
"					      (SELECT plsn_heat_no FROM prod_lot_ser_nos WHERE plsn_bu = p_bu AND plsn_sys_ls_no = cr1.istt_sys_ls_no)
"
"	                                     );
"
"	  /*proc_lot_ser_operation(p_bu,
"
"	                         cr1.istt_store_id,
"
"				 cr1.istt_prod_id,
"
"				 cr1.istt_prod_rev,
"
"	                         r_prod.prod_ser_lot_opt,
"
"	                         cr1.istt_sys_ls_no,
"
"	                         cr1.istt_lot_no,
"
"	                         cr1.istt_ser_no,
"
"	                         NULL,
"
"	                         NULL,
"
"	                         NULL,
"
"	                         NULL,
"
"				 cr1.istt_trans_qty,
"
"				 v_unit_cost,
"
"				 1,
"
"				 'A',
"
"				 cr1.isthd_trans_date,
"
"				 'MI',
"
"				 NULL,
"
"				 p_mi_doc_no,
"
"				 v_seq_no,
"
"				 NULL,
"
"				 'ICM',
"
"				 'Material Issuance - Direct',
"
"				 'Material Issuance - Direct',
"
"				 p_user,
"
"				 p_plnt => cr1.isthd_plnt
"
"				);*/
"
"	END IF;
"
"
"
"      ELSE
"
"
"
"        IF r_prod.prod_ser_lot_opt = 'N' THEN
"
"
"
"	  IF cr1.store_bin_flag = 'Y' THEN
"
"
"
"	    proc_bin_lot_ser_operation(p_bu,
"
"	                               cr1.istt_store_id,
"
"	      			       cr1.istt_prod_id,
"
"	      			       cr1.istt_prod_rev,
"
"	      			       cr1.istt_bin_id,
"
"	      			       NULL,
"
"				       NULL,
"
"	      			       NULL,
"
"	      			       NULL,
"
"	      			       NULL,
"
"	      			       NULL,
"
"	      			       cr1.istt_trans_qty,
"
"	      			       v_unit_cost,
"
"	      			       1,
"
"	      			       cr1.isthd_trans_date,
"
"	      			       'MI',
"
"	      			       NULL,
"
"	      			       p_mi_doc_no,
"
"	      			       v_seq_no,
"
"	      			       'A',
"
"	      			       'ICM',
"
"	      			       p_user
"
"	      			      );
"
"
"
"	  END IF;
"
"
"
"	END IF;
"
"      END IF;
"
"
"
"      --Raise_Application_Error(-20999,p_mi_doc_no||'/'||v_seq_no||'/'||v_sub_seq_no);
"
"     IF r_prod.prod_ser_lot_opt = 'L' AND cr1.istt_roll_no IS NOT NULL THEN
"
"
"
"      SELECT NVL(MAX(istlrd_seq_no),0)+1 INTO v_roll_seq_no
"
"        FROM inv_stock_trans_lot_roll_dtls
"
"       WHERE istlrd_bu = p_bu
"
"         AND istlrd_doc_no = p_mi_doc_no
"
"	 AND istlrd_doc_seq_no = v_seq_no
"
"	 AND istlrd_lot_seq_no = v_sub_seq_no;
"
"
"
"      INSERT INTO inv_stock_trans_lot_roll_dtls(istlrd_bu,
"
"						istlrd_doc_no,
"
"						istlrd_doc_seq_no,
"
"						istlrd_lot_seq_no,
"
"						istlrd_seq_no,
"
"						istlrd_sys_ls_no,
"
"						istlrd_lot_no,
"
"						istlrd_roll_no,
"
"						istlrd_roll_qty,
"
"						istlrd_cre_by,
"
"						istlrd_cre_emp_id,
"
"						istlrd_cre_ip_addr,
"
"						istlrd_cre_os_user,
"
"						istlrd_cre_date
"
"					       )
"
"	                                 VALUES(p_bu,
"
"						p_mi_doc_no,
"
"						v_seq_no,
"
"						v_sub_seq_no,
"
"						v_roll_seq_no,
"
"						cr1.istt_sys_ls_no,
"
"						cr1.istt_lot_no,
"
"						cr1.istt_roll_no,
"
"						cr1.istt_trans_qty,
"
"						p_user,
"
"						v_emp_id,
"
"						v_ip_addr,
"
"						v_os_user,
"
"						SYSDATE
"
"					       );
"
"      proc_upd_lot_roll_stocks(p_bu,
"
"                               cr1.istt_store_id,
"
"                               cr1.istt_prod_id,
"
"                               cr1.istt_prod_rev,
"
"                               cr1.istt_sys_ls_no,
"
"            		       cr1.istt_roll_no,
"
"            		       0,
"
"            		       0,
"
"            		       cr1.istt_trans_qty,
"
"            		       0,
"
"            		       'MI',
"
"            		       TRUNC(cr1.isthd_trans_date),
"
"            		       p_mi_doc_no,
"
"            		       v_seq_no,
"
"            		       p_user
"
"            		      );
"
"
"
"      --proc_validate_stocks(p_bu);
"
"    END IF;
"
"    END LOOP;
"
"
"
"    FOR r_wght IN (SELECT isbd_seq_no,SUM(isbd_gr_wght) isbd_gr_wght,SUM(isbd_tr_wght) isbd_tr_wght,
"
"                          SUM(isbd_nt_wght) isbd_nt_wght,SUM(isbd_tot_bags) isbd_tot_bags
"
"                     FROM inv_stock_batch_details
"
"		    WHERE isbd_bu = p_bu
"
"		      AND isbd_issue_doc_no = p_mi_doc_no
"
"		    GROUP BY isbd_seq_no
"
"		    ORDER BY isbd_seq_no)
"
"    LOOP
"
"
"
"      UPDATE inv_stock_trans_ln
"
"         SET istln_gr_wght = r_wght.isbd_gr_wght,
"
"	     istln_tr_wght = r_wght.isbd_tr_wght,
"
"	     istln_nt_wght = r_wght.isbd_nt_wght,
"
"	     istln_tot_bags = r_wght.isbd_tot_bags
"
"       WHERE istln_bu = p_bu
"
"         AND istln_doc_no = p_mi_doc_no
"
"	 AND istln_seq_no = r_wght.isbd_seq_no;
"
"
"
"    END LOOP;
"
"
"
"    DELETE inv_stock_trans_temp
"
"     WHERE istt_bu = p_bu
"
"       AND istt_doc_no = p_mi_doc_no;
"
"
"
"  END;
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_pur_rcpt(p_bu			VARCHAR2,
"
"				          p_rcpt_no		VARCHAR2,
"
"				          p_user		VARCHAR2,
"
"					  p_user_emp		VARCHAR2,
"
"					  p_lang		NUMBER,
"
"					  p_mi_doc_no	OUT	VARCHAR2
"
"				         )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT 1 Seq_no,'A' Matl_Type,porh_plnt,porh_plnt_loc_id,porh_plnt_loc_name,porh_receipt_date,porh_year,porh_period,porl_storage_store_id
"
"    FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products,pom_control
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
"     AND pomctrl_bu = porh_bu
"
"     AND pomctrl_plnt = porh_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND porl_status <> 'C'
"
"     AND porh_bu = p_bu
"
"     AND porh_receipt_no = p_rcpt_no
"
"     AND (porl_accepted_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN porl_aod_qty ELSE 0 END) > 0
"
"     AND porl_matl_type NOT IN ('PC','CS')
"
"  UNION ALL
"
"  SELECT DISTINCT 2 Seq_no,'D' Matl_Type,porh_plnt,porh_plnt_loc_id,porh_plnt_loc_name,porh_receipt_date,porh_year,porh_period,
"
"         (SELECT store_id
"
"	    FROM stores
"
"	   WHERE store_bu = porh_bu
"
"	     AND store_plnt = porh_plnt
"
"	     AND store_plnt_loc_id = porh_plnt_loc_id
"
"	     AND store_physical = 'A') porl_storage_store_id
"
"    FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products,pom_control
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
"     AND pomctrl_bu = porh_bu
"
"     AND pomctrl_plnt = porh_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND porl_status <> 'C'
"
"     AND porh_bu = p_bu
"
"     AND porh_receipt_no = p_rcpt_no
"
"     AND pomctrl_aod_rqrd_flag = 'Y'
"
"     AND porl_aod_qty > 0
"
"     AND porl_matl_type NOT IN ('PC','CS')
"
"  UNION ALL
"
"  SELECT DISTINCT 3 Seq_no,'R' Matl_Type,porh_plnt,porh_plnt_loc_id,porh_plnt_loc_name,porh_receipt_date,porh_year,porh_period,
"
"         (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = porh_bu
"
"	     AND ppl_plnt = porh_plnt
"
"	     AND ppl_prod_id = porl_prod_id
"
"	     AND ppl_prod_rev = porl_prod_rev
"
"	     AND ppl_plnt_loc_id = porh_plnt_loc_id) porl_storage_store_id
"
"    FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products
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
"     AND prod_stocked = 'Y'
"
"     AND porl_status <> 'C'
"
"     AND porh_bu = p_bu
"
"     AND porh_receipt_no = p_rcpt_no
"
"     AND porl_rejected_qty > 0
"
"     AND porl_matl_type NOT IN ('PC','CS');
"
"
"
"  CURSOR c2(c_matl_type	VARCHAR2,
"
"            c_store_id	VARCHAR2) IS
"
"  SELECT porh_suplr_id,porh_receipt_date,porh_year,porh_period,porh_exchange_rate,porl_receipt_no,porl_seq_no,porl_prod_id,porl_prod_rev,prod_desc11,
"
"         porl_suplr_uom,porl_prod_uom,porl_conv_factor,prod_ser_lot_opt,prod_cost_method,prod_cb_level,prod_expr_flag,
"
"	 porl_cls_id,porl_prod_cls_desc,porl_sub_cls_id,porl_prod_subcls_desc,
"
"	 porl_prod_grp,porl_prod_grp_desc,porl_prod_subgrp,porl_prod_subgrp_desc,
"
"         porl_so_type,porl_so_pfx,porl_so_no,porl_so_seq_no,porl_proj_id,porl_task_id,
"
"         (porl_accepted_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN porl_aod_qty ELSE 0 END) Trans_Qty,
"
"	 (porl_stk_accepted_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN porl_stk_aod_qty ELSE 0 END) Stk_Trans_Qty,
"
"         porl_sc_unit_cost,porl_disc_pct,porl_sc_chrg_amt,porl_sc_lm_disc_amt,porl_bc_land_cost,porl_ap_lc_chrg_amt,porl_bc_oh_cost,porl_upd_ref1,
"
"	 porl_sf_code,porl_prod_ord_no,porl_tar_sf_code,porl_po_no,porl_tar_oprn_seq,porl_tar_proc_id,porl_ge_doc_no,
"
"	 pomctrl_aod_rqrd_flag,porl_so_schld_desc,porl_rebate_unit_cost,
"
"	 porl_fab_item_type,porl_thickness,porl_width,porl_length,porl_height,porl_inner_dia,porl_prod_outer_dia,porl_density,porl_foc_flag
"
"    FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products,pom_control
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
"     AND pomctrl_bu = porh_bu
"
"     AND pomctrl_plnt = porh_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND porl_status <> 'C'
"
"     AND porh_bu = p_bu
"
"     AND porh_receipt_no = p_rcpt_no
"
"     AND porl_storage_store_id = c_store_id
"
"     AND c_matl_type = 'A'
"
"     AND (porl_accepted_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN porl_aod_qty ELSE 0 END) > 0
"
"     AND porl_matl_type NOT IN ('PC','CS')
"
"  UNION ALL
"
"  SELECT porh_suplr_id,porh_receipt_date,porh_year,porh_period,porh_exchange_rate,porl_receipt_no,porl_seq_no,porl_prod_id,porl_prod_rev,prod_desc11,
"
"         porl_suplr_uom,porl_prod_uom,porl_conv_factor,prod_ser_lot_opt,prod_cost_method,prod_cb_level,prod_expr_flag,
"
"	 porl_cls_id,porl_prod_cls_desc,porl_sub_cls_id,porl_prod_subcls_desc,
"
"	 porl_prod_grp,porl_prod_grp_desc,porl_prod_subgrp,porl_prod_subgrp_desc,
"
"         porl_so_type,porl_so_pfx,porl_so_no,porl_so_seq_no,porl_proj_id,porl_task_id,
"
"         porl_aod_qty Trans_Qty,porl_stk_aod_qty Stk_Trans_Qty,
"
"         porl_sc_unit_cost,porl_disc_pct,porl_sc_chrg_amt,porl_sc_lm_disc_amt,porl_bc_land_cost,porl_ap_lc_chrg_amt,porl_bc_oh_cost,porl_upd_ref1,
"
"	 porl_sf_code,porl_prod_ord_no,porl_tar_sf_code,porl_po_no,porl_tar_oprn_seq,porl_tar_proc_id,porl_ge_doc_no,
"
"	 pomctrl_aod_rqrd_flag,porl_so_schld_desc,porl_rebate_unit_cost,
"
"	 porl_fab_item_type,porl_thickness,porl_width,porl_length,porl_height,porl_inner_dia,porl_prod_outer_dia,porl_density,porl_foc_flag
"
"    FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products,pom_control
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
"     AND pomctrl_bu = porh_bu
"
"     AND pomctrl_plnt = porh_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND porl_status <> 'C'
"
"     AND porh_bu = p_bu
"
"     AND porh_receipt_no = p_rcpt_no
"
"     AND (SELECT store_id FROM stores WHERE store_bu = porh_bu AND store_plnt = porh_plnt AND store_plnt_loc_id = porh_plnt_loc_id AND store_physical = 'A') = c_store_id
"
"     AND c_matl_type = 'D'
"
"     AND pomctrl_aod_rqrd_flag = 'Y'
"
"     AND porl_aod_qty > 0
"
"     AND porl_matl_type NOT IN ('PC','CS')
"
"  UNION ALL
"
"  SELECT porh_suplr_id,porh_receipt_date,porh_year,porh_period,porh_exchange_rate,porl_receipt_no,
"
"         porl_seq_no,porl_prod_id,porl_prod_rev,prod_desc11,porl_suplr_uom,porl_prod_uom,porl_conv_factor,
"
"	 prod_ser_lot_opt,prod_cost_method,prod_cb_level,prod_expr_flag,porl_cls_id,porl_prod_cls_desc,porl_sub_cls_id,porl_prod_subcls_desc,
"
"	 porl_prod_grp,porl_prod_grp_desc,porl_prod_subgrp,porl_prod_subgrp_desc,
"
"         porl_so_type,porl_so_pfx,porl_so_no,porl_so_seq_no,porl_proj_id,porl_task_id,
"
"         porl_rejected_qty Trans_Qty,porl_stk_rejected_qty Stk_Trans_Qty,
"
"         porl_sc_unit_cost,porl_disc_pct,porl_sc_chrg_amt,porl_sc_lm_disc_amt,porl_bc_land_cost,porl_ap_lc_chrg_amt,porl_bc_oh_cost,porl_upd_ref1,
"
"	 porl_sf_code,porl_prod_ord_no,porl_tar_sf_code,porl_po_no,porl_tar_oprn_seq,porl_tar_proc_id,porl_ge_doc_no,
"
"	 pomctrl_aod_rqrd_flag,porl_so_schld_desc,porl_rebate_unit_cost,
"
"	 porl_fab_item_type,porl_thickness,porl_width,porl_length,porl_height,porl_inner_dia,porl_prod_outer_dia,porl_density,porl_foc_flag
"
"    FROM pur_ord_receipt_hd,pur_ord_receipt_ln,products,pom_control
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
"     AND pomctrl_bu = porh_bu
"
"     AND pomctrl_plnt = porh_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND porl_status <> 'C'
"
"     AND porh_bu = p_bu
"
"     AND porh_receipt_no = p_rcpt_no
"
"     AND (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = porh_bu
"
"	     AND ppl_plnt = porh_plnt
"
"	     AND ppl_prod_id = porl_prod_id
"
"	     AND ppl_prod_rev = porl_prod_rev
"
"	     AND ppl_plnt_loc_id = porh_plnt_loc_id) = c_store_id
"
"     AND c_matl_type = 'R'
"
"     AND porl_rejected_qty > 0
"
"     AND porl_matl_type NOT IN ('PC','CS')
"
"   ORDER BY porl_seq_no;
"
"
"
"    v_insp_store_id	stores.store_id%TYPE;
"
"    v_mi_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE;
"
"    v_mi_doc_pfx	inv_stock_trans_hd.isthd_doc_pfx%TYPE;
"
"    v_issuer_id		inv_stock_trans_hd.isthd_issuer_id%TYPE;
"
"    v_issuer_name	inv_stock_trans_hd.isthd_issuer_name%TYPE;
"
"    v_issuer_pos_id	inv_stock_trans_hd.isthd_issuer_pos_id%TYPE;
"
"    v_issuer_pos_name	inv_stock_trans_hd.isthd_issuer_pos_name%TYPE;
"
"    dummy1		VARCHAR2(100);
"
"    dummy2		VARCHAR2(100);
"
"
"
"    v_seq_no		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"    v_roll_seq_no	NUMBER;
"
"
"
"    v_rcpt_unitcost	NUMBER(17,5);
"
"
"
"    v_stk_batch_no	stocks_batches.sb_batch_id%TYPE;
"
"    v_dc_no		VARCHAR2(100);
"
"    v_pack_no		VARCHAR2(100);
"
"    v_mr_doc_no		VARCHAR2(100);
"
"
"
"    v_mrv_cre_flag	VARCHAR2(1);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"    TYPE typ_miv IS RECORD(miv_doc_no	VARCHAR2(30));
"
"    TYPE typ_miv_dtls IS TABLE OF typ_miv INDEX BY PLS_INTEGER;
"
"    r_miv	typ_miv_dtls;
"
"    v_index	NUMBER := 0;
"
"
"
"    v_so_seq_no	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_issuer_id,v_issuer_name,v_issuer_pos_id,v_issuer_pos_name,dummy1,dummy2,p_lang);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_insp_store_id := func_find_store_fr_type(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'Q');
"
"
"
"      IF cr1.porl_storage_store_id IS NULL AND cr1.Matl_Type = 'R' THEN
"
"        Raise_Application_Error(-20032,'ICM ');
"
"      END IF;
"
"
"
"      IF cr1.porl_storage_store_id IS NULL AND cr1.Matl_Type = 'D' THEN
"
"        Raise_Application_Error(-20033,'ICM ');
"
"      END IF;
"
"
"
"      v_mi_doc_pfx := func_find_vou_dflt_pfx(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'MIV','MIV');
"
"      --v_mi_doc_no := func_find_icm_next_id(p_bu,cr1.porh_receipt_date,'MI',v_insp_store_id,p_user);
"
"      v_mi_doc_no := func_find_pfx_nextno(p_bu,cr1.porh_receipt_date,func_find_vou_dflt_pfx(p_bu,cr1.porh_plnt,cr1.porh_plnt_loc_id,'MIV','MIV'),p_user);
"
"
"
"      v_index := v_index + 1;
"
"      r_miv(v_index).miv_doc_no := v_mi_doc_no;
"
"
"
"    -- RAISE_APPLICATION_ERROR(-20999,'HRM'||v_mi_doc_no);
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"				     isthd_doc_no,
"
"				     isthd_plnt,
"
"				     isthd_plnt_loc_id,
"
"				     isthd_plnt_loc_name,
"
"				     isthd_doc_oper,
"
"				     isthd_issuefm_store_id,
"
"				     isthd_issueto_type,
"
"				     isthd_issueto_id,
"
"				     isthd_issueto_plnt,
"
"				     isthd_issueto_plnt_loc_id,
"
"				     isthd_trans_date,
"
"				     isthd_year,
"
"				     isthd_period,
"
"				     isthd_status,
"
"				     isthd_reference,
"
"				     isthd_issuer_id,
"
"				     isthd_issuer_name,
"
"				     isthd_issuer_pos_id,
"
"				     isthd_issuer_pos_name,
"
"				     isthd_vou_type,
"
"				     isthd_cre_by,
"
"				     isthd_cre_emp_id,
"
"				     isthd_cre_ip_addr,
"
"				     isthd_cre_os_user,
"
"				     isthd_cre_date,
"
"				     isthd_vou_oper,
"
"				     isthd_doc_pfx,
"
"				     isthd_rqstby_entity
"
"				    )
"
"			      VALUES(p_bu,
"
"				     v_mi_doc_no,
"
"				     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"				     cr1.porh_plnt_loc_name,
"
"				     'T',
"
"				     v_insp_store_id,
"
"				     'S',
"
"				     cr1.porl_storage_store_id,
"
"				     cr1.porh_plnt,
"
"				     cr1.porh_plnt_loc_id,
"
"				     cr1.porh_receipt_date,
"
"				     cr1.porh_year,
"
"				     cr1.porh_period,
"
"				     'N',
"
"				     'MIV '||v_mi_doc_no||' FROM GRN '||p_rcpt_no,
"
"				     v_issuer_id,
"
"				     v_issuer_name,
"
"				     v_issuer_pos_id,
"
"				     v_issuer_pos_name,
"
"				     'GRN',
"
"				     p_user,
"
"				     v_emp_id,
"
"				     v_ip_addr,
"
"				     v_os_user,
"
"				     SYSDATE,
"
"				     cr1.Matl_Type,
"
"				     v_mi_doc_pfx,
"
"				     p_bu
"
"				    );
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.Matl_Type,cr1.porl_storage_store_id)
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"	v_sub_seq_no := 0;
"
"
"
"	IF cr2.porl_foc_flag = 'N' THEN
"
"	v_rcpt_unitcost := ((((cr2.porl_sc_unit_cost + cr2.porl_sc_chrg_amt - cr2.porl_sc_lm_disc_amt) -
"
"                               (cr2.porl_sc_unit_cost * (cr2.porl_disc_pct / 100))) * cr2.porh_exchange_rate) +
"
"			       cr2.porl_ap_lc_chrg_amt + cr2.porl_bc_land_cost + cr2.porl_bc_oh_cost - cr2.porl_rebate_unit_cost) * cr2.porl_conv_factor;
"
"	ELSE
"
"        v_rcpt_unitcost := 0.00001;
"
"        END IF;
"
"	INSERT INTO inv_stock_trans_ln(istln_bu,
"
"				       istln_doc_no,
"
"				       istln_seq_no,
"
"				       istln_mat_type,
"
"				       istln_prod_id,
"
"				       istln_prod_rev,
"
"				       istln_uom,
"
"				       istln_prod_uom,
"
"				       istln_conv_factor,
"
"				       istln_prod_cls,
"
"				       istln_po_ord_no,
"
"				       istln_sf_code,
"
"				       istln_trans_qty,
"
"				       istln_stk_trans_qty,
"
"				       istln_unit_cost,
"
"				       istln_reference,
"
"				       istln_status,
"
"				       istln_type,
"
"				       istln_so_pfx,
"
"				       istln_so_no,
"
"				       istln_so_seq_no,
"
"				       istln_proj_id,
"
"				       istln_task_id,
"
"				       istln_so_schld_desc,
"
"				       istln_grn_no,
"
"				       istln_grn_seq_no,
"
"				       istln_vou_type,
"
"				       istln_vou_no,
"
"				       istln_vou_seq_no,
"
"				       istln_cre_by,
"
"				       istln_cre_emp_id,
"
"				       istln_cre_ip_addr,
"
"				       istln_cre_os_user,
"
"				       istln_cre_date,
"
"				       istln_sou_oprn_seq,
"
"				       istln_sou_proc_id,
"
"				       istln_store_id,
"
"				       istln_rcpt_store_id,
"
"				       istln_ge_doc_no,
"
"				       istln_fab_item_type,
"
"                                       istln_thickness,
"
"                                       istln_width,
"
"                                       istln_length,
"
"                                       istln_height,
"
"                                       istln_inner_dia,
"
"                                       istln_outer_dia,
"
"                                       istln_density
"
"				      )
"
"			        VALUES(p_bu,
"
"				       v_mi_doc_no,
"
"				       v_seq_no,
"
"				       CASE WHEN cr2.porl_tar_sf_code IS NOT NULL THEN 'F' ELSE 'S' END,
"
"				       cr2.porl_prod_id,
"
"				       cr2.porl_prod_rev,
"
"				       cr2.porl_suplr_uom,
"
"				       cr2.porl_prod_uom,
"
"				       cr2.porl_conv_factor,
"
"				       cr2.porl_cls_id,
"
"				       cr2.porl_prod_ord_no,
"
"				       cr2.porl_tar_sf_code,
"
"				       cr2.Trans_Qty,
"
"				       cr2.Stk_Trans_Qty,
"
"				       v_rcpt_unitcost,
"
"				       'MIV '||v_mi_doc_no||'/'||v_seq_no||' FROM GRN '||p_rcpt_no||'/'||cr2.porl_seq_no,
"
"				       'N',
"
"				       cr2.porl_so_type,
"
"				       cr2.porl_so_pfx,
"
"				       cr2.porl_so_no,
"
"				       cr2.porl_so_seq_no,
"
"				       cr2.porl_proj_id,
"
"				       cr2.porl_task_id,
"
"				       cr2.porl_so_schld_desc,
"
"				       p_rcpt_no,
"
"				       cr2.porl_seq_no,
"
"				       'GRN',
"
"				       p_rcpt_no,
"
"				       cr2.porl_seq_no,
"
"				       p_user,
"
"				       v_emp_id,
"
"				       v_ip_addr,
"
"				       v_os_user,
"
"				       SYSDATE,
"
"				       cr2.porl_tar_oprn_seq,
"
"				       cr2.porl_tar_proc_id,
"
"				       v_insp_store_id,
"
"				       cr1.porl_storage_store_id,
"
"				       cr2.porl_ge_doc_no,
"
"				       cr2.porl_fab_item_type,
"
"                                       cr2.porl_thickness,
"
"                                       cr2.porl_width,
"
"                                       cr2.porl_length,
"
"                                       cr2.porl_height,
"
"                                       cr2.porl_inner_dia,
"
"                                       cr2.porl_prod_outer_dia,
"
"                                       cr2.porl_density
"
"                           	      );
"
"	IF cr2.porl_so_schld_desc IS NOT NULL THEN
"
"	  FOR r_so IN (SELECT pormsa_so_prj_ref,pormsa_mrp_alloc_qty
"
"	                  FROM po_rcpt_mrp_so_alloc
"
"			 WHERE pormsa_bu = p_bu
"
"			   AND pormsa_rcpt_no = p_rcpt_no
"
"			   AND pormsa_seq_no = cr2.porl_seq_no
"
"			 ORDER BY pormsa_sub_seq_no)
"
"	  LOOP
"
"
"
"	    SELECT NVL(MAX(istmsa_sub_seq_no),0) + 1 INTO v_so_seq_no
"
"	      FROM inv_stk_trans_mrp_so_alloc
"
"	     WHERE istmsa_bu = p_bu
"
"	       AND istmsa_doc_no = v_mi_doc_no
"
"	       AND istmsa_seq_no = v_seq_no;
"
"
"
"	    INSERT INTO inv_stk_trans_mrp_so_alloc(istmsa_bu,
"
"					           istmsa_doc_no,
"
"					           istmsa_seq_no,
"
"					           istmsa_sub_seq_no,
"
"					           istmsa_so_prj_ref,
"
"					           istmsa_mrp_alloc_qty,
"
"					           istmsa_cre_by,
"
"					           istmsa_cre_emp_id,
"
"					           istmsa_cre_ip_addr,
"
"					           istmsa_cre_os_user,
"
"					           istmsa_cre_date
"
"					          )
"
"					    VALUES(p_bu,
"
"					           v_mi_doc_no,
"
"						   v_seq_no,
"
"						   v_so_seq_no,
"
"						   r_so.pormsa_so_prj_ref,
"
"						   r_so.pormsa_mrp_alloc_qty,
"
"						   p_user,
"
"						   v_emp_id,
"
"						   v_ip_addr,
"
"						   v_os_user,
"
"						   SYSDATE
"
"						  );
"
"	  END LOOP;
"
"	END IF;
"
"
"
"        IF cr2.porl_tar_sf_code IS NULL THEN
"
"	proc_upd_stocks(p_bu,
"
"	                v_insp_store_id,
"
"	                NULL,
"
"	                cr2.porl_prod_id,
"
"	                cr2.porl_prod_rev,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                cr2.Stk_Trans_Qty,
"
"	                v_rcpt_unitcost,
"
"	                v_rcpt_unitcost,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                cr2.porl_seq_no,
"
"	                0,
"
"	                NULL,
"
"	                p_rcpt_no,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                cr1.porh_year,
"
"	                cr1.porh_period,
"
"	                cr1.porh_receipt_date,
"
"	                NULL,
"
"	                'POM',
"
"	                'GRN',
"
"	                NULL,
"
"	                p_user,
"
"	                SYSDATE,
"
"	                NULL,
"
"	                cr2.porl_cls_id,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                0,
"
"		        p_prod_cls_desc => cr2.porl_prod_cls_desc,
"
"		        p_prod_sub_cls_id => cr2.porl_sub_cls_id,
"
"		        p_prod_sub_cls_desc => cr2.porl_prod_subcls_desc,
"
"		        p_prod_grp_id => cr2.porl_prod_grp,
"
"		        p_prod_grp_desc	=> cr2.porl_prod_grp_desc,
"
"		        p_prod_sub_grp_id => cr2.porl_prod_subgrp,
"
"		        p_prod_sub_grp_desc => cr2.porl_prod_subgrp_desc/*,
"
"		        p_prod_cls_type => cr2.prod_cls_type*/
"
"	               );
"
"
"
"        IF cr2.porl_so_schld_desc IS NOT NULL THEN
"
"
"
"	  proc_upd_so_stocks(p_bu,
"
"	    	  	     v_insp_store_id,
"
"	    	  	     cr2.porl_prod_id,
"
"	    	  	     cr2.porl_prod_rev,
"
"	    	  	     0,
"
"	    	  	     cr2.Stk_Trans_Qty,
"
"	    	  	     v_rcpt_unitcost,
"
"	    	  	     cr2.porl_so_pfx,
"
"	    	  	     cr2.porl_so_no,
"
"	    	  	     cr2.porl_so_seq_no,
"
"	    	  	     NULL,
"
"	    	  	     cr1.porh_receipt_date,
"
"	    	  	     'QC',
"
"	    	  	     NULL,
"
"	    	  	     p_rcpt_no,
"
"	    	  	     NULL,
"
"	    	  	     NULL,
"
"	    	  	     p_rcpt_no,
"
"	    	  	     cr2.porl_seq_no,
"
"	    	  	     'GRN',
"
"	    	  	     'POM',
"
"	    	  	     'MIV FROM GRN',
"
"	    	  	     'MIV FROM GRN',
"
"	    	  	     p_user,
"
"	    	  	     cr2.porl_so_type,
"
"	    	  	     cr2.porl_proj_id,
"
"	    	  	     cr2.porl_task_id,
"
"			     p_so_prj_schld_desc => cr2.porl_so_schld_desc
"
"	    	  	    );
"
"
"
"	END IF;
"
"
"
"	IF cr2.prod_ser_lot_opt = 'N' THEN
"
"	  --raise_application_error(-20999,'HRM ');
"
"	  proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user,p_unit_cost =>cr2.porl_sc_unit_cost);
"
"
"
"	  IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	    v_sub_seq_no := v_sub_seq_no + 1;
"
"	   BEGIN
"
"
"
"	    SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	      FROM stocks_batches
"
"	     WHERE sb_bu = p_bu
"
"	       AND sb_store_id = v_insp_store_id
"
"	       AND sb_prod_id = cr2.porl_prod_id
"
"	       AND sb_prod_rev = cr2.porl_prod_rev
"
"	       AND sb_po_no = p_rcpt_no
"
"	       AND sb_receipt_seq_no = cr2.porl_seq_no;
"
"
"
"	  --raise_application_error(-20999,'HRM MI COST BATCH'||v_stk_batch_no);
"
"	    INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						   istcb_doc_no,
"
"						   istcb_seq_no,
"
"						   istcb_sub_seq_no,
"
"						   istcb_batch_no,
"
"						   istcb_trans_qty,
"
"						   istcb_stk_trans_qty,
"
"						   istcb_unit_cost,
"
"						   istcb_cre_by,
"
"						   istcb_cre_emp_id,
"
"						   istcb_cre_ip_addr,
"
"						   istcb_cre_os_user,
"
"						   istcb_cre_date,
"
"						   istcb_ins_rec
"
"						  )
"
"                                            VALUES(p_bu,
"
"					           v_mi_doc_no,
"
"					           v_seq_no,
"
"					           v_sub_seq_no,
"
"					           v_stk_batch_no,
"
"					           cr2.Trans_Qty,
"
"					           cr2.Stk_Trans_Qty,
"
"					           v_rcpt_unitcost,
"
"					           p_user,
"
"						   v_emp_id,
"
"						   v_ip_addr,
"
"						   v_os_user,
"
"					           SYSDATE,
"
"					           'Y'
"
"					          );
"
"	EXCEPTION
"
"		WHEN OTHERS THEN Raise_Application_Error(-20999,'HRM '||v_insp_store_id||'/'||cr2.porl_prod_id);
"
"        END;
"
"	  END IF;
"
"
"
"	ELSE
"
"
"
"	  /*SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"                 prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,prcls_qty_accepted LS_Trans_Qty,
"
"                 (prcls_stk_acpt_qty + prcls_stk_aod_qty) LS_Stk_Trans_Qty
"
"            FROM pur_rcpt_lot_serial
"
"           WHERE prcls_bu = p_bu
"
"	     AND prcls_doc_no = p_rcpt_no
"
"	     AND prcls_doc_seq_no = cr2.porl_seq_no
"
"	     AND (prcls_qty_accepted + prcls_aod_qty) > 0
"
"	     AND cr1.Matl_Type = 'A'
"
"          UNION ALL
"
"          SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"                 prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,prcls_qty_rejected LS_Trans_Qty,
"
"                 prcls_stk_rej_qty LS_Stk_Trans_Qty
"
"            FROM pur_rcpt_lot_serial
"
"           WHERE prcls_bu = p_bu
"
"	     AND prcls_doc_no = p_rcpt_no
"
"	     AND prcls_doc_seq_no = cr2.porl_seq_no
"
"	     AND prcls_stk_rej_qty > 0
"
"	     AND cr1.Matl_Type = 'R'
"
"           ORDER BY prcls_seq_no;*/
"
"
"
"	  FOR r_ls IN (SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,
"
"			      (prcls_qty_accepted + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_aod_qty ELSE 0 END) LS_Trans_Qty,
"
"			      (prcls_stk_acpt_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_stk_aod_qty ELSE 0 END) LS_Stk_Trans_Qty,prcls_mfg_date
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND (prcls_qty_accepted + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_aod_qty ELSE 0 END) > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"			  AND prcls_apply_type = 'R'
"
"		       UNION ALL
"
"		       SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,
"
"			      prcls_aod_qty LS_Trans_Qty,
"
"			      prcls_stk_aod_qty LS_Stk_Trans_Qty,prcls_mfg_date
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND prcls_aod_qty > 0
"
"			  AND cr1.Matl_Type = 'D' AND cr2.pomctrl_aod_rqrd_flag = 'Y'
"
"			  AND prcls_apply_type = 'R'
"
"		       UNION ALL
"
"		       SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,prcls_qty_rejected LS_Trans_Qty,
"
"			      prcls_stk_rej_qty LS_Stk_Trans_Qty,prcls_mfg_date
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND prcls_stk_rej_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			  AND prcls_apply_type = 'R'
"
"			ORDER BY prcls_seq_no)
"
"	  LOOP
"
"	  --raise_application_error(-20999,'HRM MI COST'||v_rcpt_unitcost);
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.prcls_sys_ls_no,r_ls.prcls_lot_no,r_ls.prcls_serial_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.prcls_sou_type,r_ls.prcls_sou_id,r_ls.prcls_expiry_date,r_ls.prcls_mfg_date,p_user,p_unit_cost => v_rcpt_unitcost);
"
"
"
"	    proc_upd_lot_ser_stocks(p_bu,
"
"                                    v_insp_store_id,
"
"                                    cr2.porl_prod_id,
"
"                                    cr2.porl_prod_rev,
"
"                                    r_ls.prcls_sys_ls_no,
"
"                                    0,
"
"                                    r_ls.LS_Stk_Trans_Qty,
"
"                                    0,
"
"                                    v_rcpt_unitcost,
"
"				    cr2.prod_ser_lot_opt,
"
"                                    r_ls.prcls_lot_no,
"
"                                    r_ls.prcls_serial_no,
"
"                                    r_ls.prcls_sou_type,
"
"                                    r_ls.prcls_sou_id,
"
"                                    CASE WHEN cr2.prod_expr_flag = 'Y' THEN r_ls.prcls_expiry_date ELSE NULL END,
"
"                                    TRUNC(cr1.porh_receipt_date),
"
"                                    'GRN',
"
"                                    NULL,
"
"                                    cr2.porl_receipt_no,
"
"                                    cr2.porl_seq_no,
"
"                                    'POM',
"
"                                    cr2.porl_upd_ref1,
"
"                                    'GRN LS Allocation',
"
"                                    p_user,
"
"                                    p_org_lot_no => r_ls.prcls_org_lot_no,
"
"				    p_mix_lot_no => r_ls.prcls_mix_lot_no,
"
"				    p_no_of_bales => r_ls.prcls_no_of_coils
"
"                                   );
"
"
"
"            SELECT isbd_sub_seq_no INTO v_sub_seq_no
"
"	      FROM inv_stock_batch_details
"
"	     WHERE isbd_bu = p_bu
"
"               AND isbd_issue_doc_no = v_mi_doc_no
"
"               AND isbd_seq_no = v_seq_no
"
"               AND isbd_sys_ls_no = r_ls.prcls_sys_ls_no;
"
"
"
"            SELECT NVL(MAX(istlrd_seq_no),0) INTO v_roll_seq_no
"
"              FROM inv_stock_trans_lot_roll_dtls
"
"             WHERE istlrd_bu = p_bu
"
"               AND istlrd_doc_no = v_mi_doc_no
"
"	       AND istlrd_doc_seq_no = v_seq_no
"
"	       AND istlrd_lot_seq_no = v_sub_seq_no;
"
"
"
"            FOR r_roll IN (SELECT *
"
"                             FROM pur_rcpt_lot_roll_dtls
"
"            		    WHERE prlrd_bu = p_bu
"
"                              AND prlrd_rcpt_no = cr2.porl_receipt_no
"
"                              AND prlrd_rcpt_seq_no = cr2.porl_seq_no
"
"                              AND prlrd_lot_seq_no = r_ls.prcls_seq_no
"
"                              AND prlrd_sys_ls_no = r_ls.prcls_sys_ls_no
"
"			    ORDER BY prlrd_roll_no)
"
"            LOOP
"
"
"
"	      v_roll_seq_no := v_roll_seq_no + 1;
"
"
"
"	      INSERT INTO inv_stock_trans_lot_roll_dtls(istlrd_bu,
"
"							istlrd_doc_no,
"
"							istlrd_doc_seq_no,
"
"							istlrd_lot_seq_no,
"
"							istlrd_seq_no,
"
"							istlrd_sys_ls_no,
"
"							istlrd_lot_no,
"
"							istlrd_roll_no,
"
"							istlrd_roll_qty,
"
"							istlrd_cre_by,
"
"							istlrd_cre_emp_id,
"
"							istlrd_cre_ip_addr,
"
"							istlrd_cre_os_user,
"
"							istlrd_cre_date
"
"						       )
"
"	                                         VALUES(p_bu,
"
"						        v_mi_doc_no,
"
"							v_seq_no,
"
"							v_sub_seq_no,
"
"							v_roll_seq_no,
"
"							r_ls.prcls_sys_ls_no,
"
"							r_ls.prcls_lot_no,
"
"							r_roll.prlrd_roll_no,
"
"							r_roll.prlrd_roll_qty,
"
"							p_user,
"
"						        v_emp_id,
"
"						        v_ip_addr,
"
"						        v_os_user,
"
"							SYSDATE
"
"						       );
"
"
"
"              proc_upd_lot_roll_stocks(p_bu,
"
"                                       v_insp_store_id,
"
"                                       cr2.porl_prod_id,
"
"                                       cr2.porl_prod_rev,
"
"                                       r_ls.prcls_sys_ls_no,
"
"            			       r_roll.prlrd_roll_no,
"
"            			       0,
"
"            			       0,
"
"            			       r_roll.prlrd_roll_qty,
"
"            			       0,
"
"            			       'GRN',
"
"            			       TRUNC(cr1.porh_receipt_date),
"
"            			       cr2.porl_receipt_no,
"
"            			       cr2.porl_seq_no,
"
"            			       p_user
"
"            			      );
"
"            END LOOP;
"
"
"
"	    IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	      v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	      SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	        FROM stocks_batches
"
"	       WHERE sb_bu = p_bu
"
"	         AND sb_store_id = v_insp_store_id
"
"	         AND sb_prod_id = cr2.porl_prod_id
"
"	         AND sb_prod_rev = cr2.porl_prod_rev
"
"	         AND sb_po_no = p_rcpt_no
"
"	         AND sb_receipt_seq_no = cr2.porl_seq_no
"
"		 AND sb_sys_ls_no = r_ls.prcls_sys_ls_no;
"
"
"
"              IF cr2.prod_cb_level = 'L' THEN
"
"
"
"	        proc_upd_ls_stk_batch(p_bu,v_insp_store_id,cr2.porl_prod_id,cr2.porl_prod_rev,r_ls.prcls_sys_ls_no,v_stk_batch_no,r_ls.LS_Stk_Trans_Qty,p_user);
"
"
"
"              END IF;
"
"
"
"	      INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						     istcb_doc_no,
"
"						     istcb_seq_no,
"
"						     istcb_sub_seq_no,
"
"						     istcb_batch_no,
"
"						     istcb_trans_qty,
"
"						     istcb_stk_trans_qty,
"
"						     istcb_unit_cost,
"
"						     istcb_cre_by,
"
"						     istcb_cre_date,
"
"						     istcb_ins_rec,
"
"						     istcb_sys_ls_no
"
"						    )
"
"                                              VALUES(p_bu,
"
"					             v_mi_doc_no,
"
"					             v_seq_no,
"
"					             v_sub_seq_no,
"
"					             v_stk_batch_no,
"
"					             r_ls.LS_Trans_Qty,
"
"					             r_ls.LS_Stk_Trans_Qty,
"
"					             v_rcpt_unitcost,
"
"					             p_user,
"
"					             SYSDATE,
"
"					             'Y',
"
"					             r_ls.prcls_sys_ls_no
"
"					            );
"
"
"
"	    END IF;
"
"
"
"	  END LOOP;
"
"
"
"	END IF;
"
"	ELSE
"
"
"
"	  IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user,p_unit_cost => v_rcpt_unitcost);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.porl_prod_ord_no,
"
"                               NULL,
"
"                               cr2.porl_tar_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.porl_prod_id,
"
"                               cr2.porl_prod_rev,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               cr2.Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.porh_plnt,
"
"                               cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.porl_so_pfx,
"
"                               cr2.porl_so_no,
"
"                               cr2.porl_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.porl_receipt_no,
"
"                               cr2.porl_seq_no,
"
"                               cr2.porl_seq_no,
"
"                               TRUNC(cr1.porh_receipt_date),
"
"                               cr1.porh_year,
"
"                               cr1.porh_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.porl_cls_id,
"
"                               cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               cr2.porl_sc_unit_cost,
"
"                               cr2.porl_sc_unit_cost * cr2.porh_exchange_rate,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.porl_so_type,
"
"                               p_proj => cr2.porl_proj_id,
"
"                               p_task => cr2.porl_task_id,
"
"		               p_prod_cls_desc => cr2.porl_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.porl_sub_cls_id,
"
"		               p_prod_sub_cls_desc => cr2.porl_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.porl_prod_grp,
"
"		               p_prod_grp_desc => cr2.porl_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.porl_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.porl_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr2.porl_prod_id,cr2.porl_prod_rev),
"
"			       p_so_schld_desc => cr2.porl_so_schld_desc
"
"                              );
"
"
"
"
"
"	ELSE
"
"
"
"	  FOR r_ls IN (SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,
"
"			      (prcls_qty_accepted + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_aod_qty ELSE 0 END) LS_Trans_Qty,
"
"			      (prcls_stk_acpt_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_stk_aod_qty ELSE 0 END) LS_Stk_Trans_Qty,prcls_mfg_date
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND (prcls_qty_accepted + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_aod_qty ELSE 0 END) > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"			  AND prcls_apply_type = 'R'
"
"		       UNION ALL
"
"		       SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,
"
"			      prcls_aod_qty LS_Trans_Qty,
"
"			      prcls_stk_aod_qty LS_Stk_Trans_Qty,prcls_mfg_date
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND prcls_aod_qty > 0
"
"			  AND cr1.Matl_Type = 'D' AND cr2.pomctrl_aod_rqrd_flag = 'Y'
"
"			  AND prcls_apply_type = 'R'
"
"		       UNION ALL
"
"		       SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,prcls_qty_rejected LS_Trans_Qty,
"
"			      prcls_stk_rej_qty LS_Stk_Trans_Qty,prcls_mfg_date
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND prcls_stk_rej_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			  AND prcls_apply_type = 'R'
"
"			ORDER BY prcls_seq_no)
"
"	  LOOP
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.prcls_sys_ls_no,r_ls.prcls_lot_no,r_ls.prcls_serial_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.prcls_sou_type,r_ls.prcls_sou_id,r_ls.prcls_expiry_date,r_ls.prcls_mfg_date,p_user,p_unit_cost => v_rcpt_unitcost);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.porl_prod_ord_no,
"
"                               NULL,
"
"                               cr2.porl_tar_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.porl_prod_id,
"
"                               cr2.porl_prod_rev,
"
"                               r_ls.prcls_sys_ls_no,
"
"                               r_ls.prcls_lot_no,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               r_ls.LS_Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.porh_plnt,
"
"                               cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.porl_so_pfx,
"
"                               cr2.porl_so_no,
"
"                               cr2.porl_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.porl_receipt_no,
"
"                               cr2.porl_seq_no,
"
"                               cr2.porl_seq_no,
"
"                               TRUNC(cr1.porh_receipt_date),
"
"                               cr1.porh_year,
"
"                               cr1.porh_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.porl_cls_id,
"
"                               cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               cr2.porl_sc_unit_cost,
"
"                               cr2.porl_sc_unit_cost * cr2.porh_exchange_rate,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.porl_so_type,
"
"                               p_proj => cr2.porl_proj_id,
"
"                               p_task => cr2.porl_task_id,
"
"		               p_prod_cls_desc => cr2.porl_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.porl_sub_cls_id,
"
"		               p_prod_sub_cls_desc => cr2.porl_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.porl_prod_grp,
"
"		               p_prod_grp_desc => cr2.porl_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.porl_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.porl_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr2.porl_prod_id,cr2.porl_prod_rev),
"
"			       p_so_schld_desc => cr2.porl_so_schld_desc
"
"                              );
"
"
"
"	  END LOOP;
"
"
"
"	END IF;
"
"	END IF;
"
"
"
"      END LOOP c2;
"
"
"
"
"
"
"
"      /*BEGIN
"
"        SELECT icmctrl_auto_mtr_flag INTO v_mrv_cre_flag
"
"	  FROM icm_control
"
"	 WHERE icmctrl_bu = p_bu;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"	  Raise_Application_Error(-20999,'HRM ');
"
"      END;
"
"
"
"      IF v_mrv_cre_flag = 'Y' THEN
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'N',
"
"	       istlnh_sel_user = NULL
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_sel_flag = 'Y'
"
"	   AND istlnh_sel_user = p_user;
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'Y',
"
"	       istlnh_sel_user = p_user,
"
"	       istlnh_proc_qty = istlnh_trans_qty
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_doc_no = v_mi_doc_no;
"
"
"
"        pkg_mat_rcpt.proc_cre_mrv_frm_miv(p_bu,TRUNC(SYSDATE),p_user,v_mr_doc_no);
"
"
"
"      END IF;*/
"
"
"
"    END LOOP c1;
"
"
"
"    FOR i IN 1..v_index
"
"    LOOP
"
"
"
"      FOR r_mi IN (SELECT *
"
"                     FROM inv_stock_trans_hd
"
"		    WHERE isthd_bu = p_bu
"
"		      AND isthd_doc_no = r_miv(i).miv_doc_no)
"
"      LOOP
"
"      DECLARE
"
"        v_jrnl_res	VARCHAR2(1);
"
"      BEGIN
"
"        IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"          proc_ins_mat_iss_appl_jrnl(p_bu,r_mi.isthd_plnt,r_mi.isthd_doc_no,p_user,p_lang,v_jrnl_res);
"
"	  UPDATE inv_stock_trans_hd
"
"	     SET isthd_jrnl_flag = 'Y'
"
"	   WHERE isthd_bu = p_bu
"
"	     AND isthd_doc_no = r_mi.isthd_doc_no;
"
"        END IF;
"
"      END;
"
"
"
"      proc_issue_mat_frm_mi(p_bu,r_mi.isthd_plnt,r_mi.isthd_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         r_mi.isthd_plnt,
"
"		         r_mi.isthd_trans_date,
"
"		         r_mi.isthd_year,
"
"		         r_mi.isthd_period,
"
"		         NULL,
"
"		         r_mi.isthd_doc_no,
"
"		         NULL,
"
"		         'ICM',
"
"		         p_user,
"
"		         1,
"
"		         'MIV '||r_mi.isthd_doc_no||' FROM GRN '||p_rcpt_no
"
"		        );
"
"      END IF;
"
"      END LOOP;
"
"    END LOOP;
"
"
"
"    IF v_mi_doc_no IS NOT NULL THEN
"
"      p_mi_doc_no := func_find_order_no_substr(v_mi_doc_no);
"
"    END IF;
"
"
"
"  END proc_cre_miv_doc_frm_pur_rcpt;
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_mrv(p_bu		VARCHAR2,
"
"				     p_rcpt_no		VARCHAR2,
"
"				     p_user		VARCHAR2,
"
"				     p_user_emp		VARCHAR2,
"
"				     p_lang			NUMBER,
"
"				     p_mi_doc_no	OUT	VARCHAR2
"
"				    )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT isthd_plnt,isthd_plnt_loc_id,isthd_plnt_loc_name,isthd_trans_date,isthd_year,isthd_period,
"
"         istln_rcpt_store_id,isthd_cust_id
"
"    FROM inv_stock_trans_hd,inv_stock_trans_ln,products,prod_plants,stores
"
"   WHERE isthd_bu = istln_bu
"
"     AND isthd_doc_no = istln_doc_no
"
"     AND prod_bu = istln_bu
"
"     AND prod_id = istln_prod_id
"
"     AND prod_rev = istln_prod_rev
"
"     AND prodplnt_bu = istln_bu
"
"     AND prodplnt_plnt = isthd_plnt
"
"     AND prodplnt_prod_id = istln_prod_id
"
"     AND prodplnt_prod_rev = istln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND istln_status <> 'C'
"
"     AND store_bu = istln_bu
"
"     AND store_id = istln_rcpt_store_id
"
"     AND isthd_bu = p_bu
"
"     AND isthd_doc_no = p_rcpt_no
"
"     AND istln_mat_type = 'F'
"
"     AND INSTR(istln_sf_code,'0') = 0
"
"     AND store_physical <> 'J'
"
"     AND prodplnt_fpi_flag = 'Y'
"
"     AND istln_vou_type IN ('SFR','GRN')
"
"     AND isthd_vou_oper = 'A'
"
"     ;
"
"
"
"  CURSOR c2(c_store_id	VARCHAR2) IS
"
"  SELECT *
"
"    FROM inv_stock_trans_hd,inv_stock_trans_ln,products,prod_plants,stores
"
"   WHERE isthd_bu = istln_bu
"
"     AND isthd_doc_no = istln_doc_no
"
"     AND prod_bu = istln_bu
"
"     AND prod_id = istln_prod_id
"
"     AND prod_rev = istln_prod_rev
"
"     AND prodplnt_bu = istln_bu
"
"     AND prodplnt_plnt = isthd_plnt
"
"     AND prodplnt_prod_id = istln_prod_id
"
"     AND prodplnt_prod_rev = istln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND istln_status <> 'C'
"
"     AND store_bu = istln_bu
"
"     AND store_id = istln_rcpt_store_id
"
"     AND isthd_bu = p_bu
"
"     AND isthd_doc_no = p_rcpt_no
"
"     AND istln_mat_type = 'F'
"
"     AND INSTR(istln_sf_code,'0') = 0
"
"     --AND store_physical = 'Y'
"
"     AND prodplnt_fpi_flag = 'Y'
"
"     AND istln_vou_type IN ('SFR','GRN')
"
"     AND isthd_vou_oper = 'A'
"
"     AND istln_rcpt_store_id = c_store_id
"
"     ;
"
"
"
"    v_insp_store_id	stores.store_id%TYPE;
"
"    v_mi_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE;
"
"    v_mi_doc_pfx	inv_stock_trans_hd.isthd_doc_pfx%TYPE;
"
"    v_issuer_id		inv_stock_trans_hd.isthd_issuer_id%TYPE;
"
"    v_issuer_name	inv_stock_trans_hd.isthd_issuer_name%TYPE;
"
"    v_issuer_pos_id	inv_stock_trans_hd.isthd_issuer_pos_id%TYPE;
"
"    v_issuer_pos_name	inv_stock_trans_hd.isthd_issuer_pos_name%TYPE;
"
"    dummy1		VARCHAR2(100);
"
"    dummy2		VARCHAR2(100);
"
"
"
"    v_seq_no		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"
"
"    v_rcpt_unitcost	NUMBER;
"
"
"
"    v_stk_batch_no	stocks_batches.sb_batch_id%TYPE;
"
"    v_dc_no		VARCHAR2(100);
"
"    v_pack_no		VARCHAR2(100);
"
"    v_mr_doc_no		VARCHAR2(100);
"
"
"
"    v_mrv_cre_flag	VARCHAR2(1);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"    TYPE typ_ls IS TABLE OF inv_stock_batch_details%ROWTYPE INDEX BY PLS_INTEGER;
"
"    r_ls_blk		typ_ls;
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_issuer_id,v_issuer_name,v_issuer_pos_id,v_issuer_pos_name,dummy1,dummy2,p_lang);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_insp_store_id := func_find_store_fr_type(p_bu,cr1.isthd_plnt,cr1.isthd_plnt_loc_id,'Q');
"
"
"
"      v_mi_doc_pfx := func_find_vou_dflt_pfx(p_bu,cr1.isthd_plnt,cr1.isthd_plnt_loc_id,'MIV','MIV');
"
"      --v_mi_doc_no := func_find_icm_next_id(p_bu,cr1.porh_receipt_date,'MI',v_insp_store_id,p_user);
"
"      v_mi_doc_no := func_find_pfx_nextno(p_bu,cr1.isthd_trans_date,func_find_vou_dflt_pfx(p_bu,cr1.isthd_plnt,cr1.isthd_plnt_loc_id,'MIV','MIV'),p_user);
"
"
"
"    -- RAISE_APPLICATION_ERROR(-20999,'HRM'||v_mi_doc_no);
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"				     isthd_doc_no,
"
"				     isthd_plnt,
"
"				     isthd_plnt_loc_id,
"
"				     isthd_plnt_loc_name,
"
"				     isthd_doc_oper,
"
"				     isthd_issueto_type,
"
"				     isthd_issueto_id,
"
"				     isthd_issueto_plnt,
"
"				     isthd_issueto_plnt_loc_id,
"
"				     isthd_trans_date,
"
"				     isthd_year,
"
"				     isthd_period,
"
"				     isthd_status,
"
"				     isthd_reference,
"
"				     isthd_issuer_id,
"
"				     isthd_issuer_name,
"
"				     isthd_issuer_pos_id,
"
"				     isthd_issuer_pos_name,
"
"				     isthd_vou_type,
"
"				     isthd_cre_by,
"
"				     isthd_cre_emp_id,
"
"				     isthd_cre_ip_addr,
"
"				     isthd_cre_os_user,
"
"				     isthd_cre_date,
"
"				     isthd_vou_oper,
"
"				     isthd_doc_pfx,
"
"				     isthd_inspection_type,
"
"				     isthd_cust_id
"
"				    )
"
"			      VALUES(p_bu,
"
"				     v_mi_doc_no,
"
"				     cr1.isthd_plnt,
"
"				     cr1.isthd_plnt_loc_id,
"
"				     cr1.isthd_plnt_loc_name,
"
"				     'T',
"
"				     'Q',
"
"				     v_insp_store_id,--cr1.istln_rcpt_store_id,
"
"				     cr1.isthd_plnt,
"
"				     cr1.isthd_plnt_loc_id,
"
"				     cr1.isthd_trans_date,
"
"				     cr1.isthd_year,
"
"				     cr1.isthd_period,
"
"				     'N',
"
"				     'FPI PROCESS - MIV '||v_mi_doc_no||' FROM MRV '||p_rcpt_no,
"
"				     v_issuer_id,
"
"				     v_issuer_name,
"
"				     v_issuer_pos_id,
"
"				     v_issuer_pos_name,
"
"				     'FPI',
"
"				     p_user,
"
"				     v_emp_id,
"
"				     v_ip_addr,
"
"				     v_os_user,
"
"				     SYSDATE,
"
"				     'A',
"
"				     v_mi_doc_pfx,
"
"				     'FI',
"
"				     cr1.isthd_cust_id
"
"				    );
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.istln_rcpt_store_id)
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"	v_sub_seq_no := 0;
"
"
"
"	v_rcpt_unitcost := cr2.istln_unit_cost;
"
"
"
"	INSERT INTO inv_stock_trans_ln(istln_bu,
"
"				       istln_doc_no,
"
"				       istln_seq_no,
"
"				       istln_mat_type,
"
"				       istln_prod_id,
"
"				       istln_prod_rev,
"
"				       istln_uom,
"
"				       istln_prod_uom,
"
"				       istln_conv_factor,
"
"				       istln_prod_cls,
"
"				       istln_po_ord_no,
"
"				       istln_sf_code,
"
"				       istln_trans_qty,
"
"				       istln_stk_trans_qty,
"
"				       istln_unit_cost,
"
"				       istln_reference,
"
"				       istln_status,
"
"				       istln_type,
"
"				       istln_so_pfx,
"
"				       istln_so_no,
"
"				       istln_so_seq_no,
"
"				       istln_proj_id,
"
"				       istln_task_id,
"
"				       istln_so_schld_desc,
"
"				       istln_vou_type,
"
"				       istln_vou_no,
"
"				       istln_vou_seq_no,
"
"				       istln_cre_by,
"
"				       istln_cre_emp_id,
"
"				       istln_cre_ip_addr,
"
"				       istln_cre_os_user,
"
"				       istln_cre_date,
"
"				       istln_sou_oprn_seq,
"
"				       istln_sou_proc_id,
"
"				       istln_store_id,
"
"				       istln_rcpt_store_id
"
"				      )
"
"			        VALUES(p_bu,
"
"				       v_mi_doc_no,
"
"				       v_seq_no,
"
"				       'F',
"
"				       cr2.istln_prod_id,
"
"				       cr2.istln_prod_rev,
"
"				       cr2.istln_uom,
"
"				       cr2.istln_prod_uom,
"
"				       cr2.istln_conv_factor,
"
"				       cr2.istln_prod_cls,
"
"				       cr2.istln_po_ord_no,
"
"				       cr2.istln_sf_code,
"
"				       cr2.istln_trans_qty,
"
"				       cr2.istln_stk_trans_qty,
"
"				       v_rcpt_unitcost,
"
"				       'FPI - MIV '||v_mi_doc_no||'/'||v_seq_no||' FROM MRV '||p_rcpt_no||'/'||cr2.istln_seq_no,
"
"				       'N',
"
"				       cr2.istln_type,
"
"				       cr2.istln_so_pfx,
"
"				       cr2.istln_so_no,
"
"				       cr2.istln_so_seq_no,
"
"				       cr2.istln_proj_id,
"
"				       cr2.istln_task_id,
"
"				       cr2.istln_so_schld_desc,
"
"				       'MRV',
"
"				       p_rcpt_no,
"
"				       cr2.istln_seq_no,
"
"				       p_user,
"
"				       v_emp_id,
"
"				       v_ip_addr,
"
"				       v_os_user,
"
"				       SYSDATE,
"
"				       cr2.istln_sou_oprn_seq,
"
"				       cr2.istln_sou_proc_id,
"
"				       cr1.istln_rcpt_store_id,
"
"				       v_insp_store_id
"
"                           	      );
"
"
"
"        IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	  proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.istln_trans_qty,cr2.istln_stk_trans_qty,0,NULL,NULL,NULL,NULL,p_user,
"
"	  p_unit_cost => v_rcpt_unitcost);
"
"
"
"	  proc_upd_sf_stocks(p_bu,
"
"                             cr2.istln_po_ord_no,
"
"                             NULL,
"
"                             cr2.istln_sf_code,
"
"                             cr1.istln_rcpt_store_id,
"
"                             cr2.istln_prod_id,
"
"                             cr2.istln_prod_rev,
"
"                             NULL,
"
"                             NULL,
"
"                             NULL,
"
"                             NULL,
"
"                             0,
"
"                             cr2.istln_stk_trans_qty,
"
"                             v_rcpt_unitcost,
"
"                             cr1.isthd_plnt,
"
"                             NULL,
"
"                             NULL,
"
"                             cr2.istln_so_pfx,
"
"                             cr2.istln_so_no,
"
"                             cr2.istln_so_seq_no,
"
"                             NULL,
"
"                             NULL,
"
"                             cr2.isthd_doc_no,
"
"                             NULL,
"
"                             cr2.isthd_doc_no,
"
"                             cr2.istln_seq_no,
"
"                             cr2.istln_seq_no,
"
"                             TRUNC(cr1.isthd_trans_date),
"
"                             cr1.isthd_year,
"
"                             cr1.isthd_period,
"
"                             cr2.prod_cost_method,
"
"                             'MRV',
"
"                             'ICM',
"
"                             cr2.istln_prod_cls,
"
"                             cr2.istln_reference,
"
"                             'Check',
"
"                             cr2.istln_unit_cost,
"
"                             cr2.istln_unit_cost,
"
"                             'SC',
"
"                             p_user,
"
"                             NULL,
"
"                             p_type => cr2.istln_type,
"
"                             p_proj => cr2.istln_proj_id,
"
"                             p_task => cr2.istln_task_id,
"
"		             p_prod_cls_desc => cr2.istln_prod_cls_desc,
"
"		             p_prod_sub_cls_id => cr2.istln_prod_subcls,
"
"		             p_prod_sub_cls_desc => cr2.istln_prod_subcls_desc,
"
"		             p_prod_grp_id => cr2.istln_prod_grp,
"
"		             p_prod_grp_desc => cr2.istln_prod_grp_desc,
"
"		             p_prod_sub_grp_id => cr2.istln_prod_subgrp,
"
"		             p_prod_sub_grp_desc => cr2.istln_prod_subgrp_desc,
"
"		             p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr2.istln_prod_id,cr2.istln_prod_rev),
"
"			     p_so_schld_desc => cr2.istln_so_schld_desc
"
"                            );
"
"
"
"	ELSE
"
"
"
"	  SELECT *
"
"            BULK COLLECT INTO r_ls_blk
"
"            FROM inv_stock_batch_details
"
"           WHERE isbd_bu = p_bu
"
"             AND isbd_issue_doc_no = p_rcpt_no
"
"             AND isbd_seq_no = cr2.istln_seq_no
"
"           ORDER BY isbd_sub_seq_no;
"
"
"
"	  FORALL i IN 1..r_ls_blk.COUNT
"
"	  INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                                              isbd_issue_doc_no,
"
"                                              isbd_seq_no,
"
"                                              isbd_sub_seq_no,
"
"                                              isbd_sys_ls_no,
"
"                                              isbd_lot_no,
"
"                                              isbd_serial_no,
"
"                                              isbd_source_type,
"
"                                              isbd_source_id,
"
"                                              isbd_trans_qty,
"
"					      isbd_stk_trans_qty,
"
"                                              isbd_excs_qty,
"
"                                              isbd_trnf_acpt_qty,
"
"                                              isbd_ins_rec,
"
"                                              isbd_cre_by,
"
"					      isbd_cre_emp_id,
"
"					      isbd_cre_ip_addr,
"
"					      isbd_cre_os_user,
"
"                                              isbd_cre_date,
"
"                                              isbd_heat_no,
"
"                                              isbd_test_no,
"
"					      isbd_act_wght,
"
"					      isbd_expiry_date,
"
"					      isbd_unit_cost,
"
"					      isbd_mfg_date
"
"                                             )
"
"                                       VALUES(p_bu,
"
"                                              v_mi_doc_no,
"
"                                              v_seq_no,
"
"                                              r_ls_blk(i).isbd_sub_seq_no,
"
"                                              r_ls_blk(i).isbd_sys_ls_no,
"
"                                              r_ls_blk(i).isbd_lot_no,
"
"                                              r_ls_blk(i).isbd_serial_no,
"
"                                              r_ls_blk(i).isbd_source_type,
"
"                                              r_ls_blk(i).isbd_source_id,
"
"                                              r_ls_blk(i).isbd_trans_qty,
"
"					      r_ls_blk(i).isbd_stk_trans_qty,
"
"                                              r_ls_blk(i).isbd_excs_qty,
"
"                                              r_ls_blk(i).isbd_trans_qty,
"
"                                              'N',
"
"                                              p_user,
"
"					      p_user_emp,
"
"					      v_ip_addr,
"
"					      v_os_user,
"
"                                              SYSDATE,
"
"                                              r_ls_blk(i).isbd_heat_no,
"
"                                              r_ls_blk(i).isbd_test_no,
"
"					      r_ls_blk(i).isbd_stk_trans_qty * 1,
"
"					      r_ls_blk(i).isbd_expiry_date,
"
"					      r_ls_blk(i).isbd_unit_cost,
"
"					      r_ls_blk(i).isbd_mfg_date
"
"                                             );
"
"
"
"	  FORALL i IN 1..r_ls_blk.COUNT
"
"	  UPDATE store_sf_stocks
"
"             SET stsfs_alloc_qty = stsfs_alloc_qty + r_ls_blk(i).isbd_stk_trans_qty,
"
"                 stsfs_upd_receipt_pfx = NULL,
"
"                 stsfs_upd_receipt_no = cr2.istln_doc_no,
"
"                 stsfs_upd_receipt_seq_no = cr2.istln_seq_no,
"
"                 stsfs_upd_seq_no = cr2.istln_seq_no,
"
"                 stsfs_trans_date = TRUNC(cr2.isthd_trans_date),
"
"                 stsfs_trans_year = cr2.isthd_year,
"
"                 stsfs_trans_period = cr2.isthd_period,
"
"                 stsfs_cost_method = cr2.prod_cost_method,
"
"                 stsfs_upd_source_doc = 'MR',
"
"                 stsfs_upd_appl = 'ICM',
"
"                 stsfs_upd_ref1 = cr2.istln_reference,
"
"                 stsfs_upd_ref2 = 'Material Issue',
"
"                 stsfs_upd_fc_cost = r_ls_blk(i).isbd_unit_cost,
"
"                 stsfs_upd_bc_cost = r_ls_blk(i).isbd_unit_cost,
"
"                 stsfs_upd_class_id = cr2.istln_prod_cls,
"
"                 stsfs_upd_ord_type = cr2.istln_ord_type,
"
"                 stsfs_upd_by = p_user,
"
"                 stsfs_upd_emp_id = p_user_emp,
"
"                 stsfs_upd_ip_addr = v_ip_addr,
"
"                 stsfs_upd_os_user = v_os_user,
"
"                 stsfs_upd_date = SYSDATE,
"
"                 stsfs_upd_adj_pfx = NULL,
"
"                 stsfs_upd_prod_cls_desc = cr2.istln_prod_cls_desc,
"
"                 stsfs_upd_prod_subcls_id = cr2.istln_prod_subcls,
"
"                 stsfs_upd_prod_subcls_desc = cr2.istln_prod_subcls_desc,
"
"                 stsfs_upd_prod_grp_id = cr2.istln_prod_grp,
"
"                 stsfs_upd_prod_grp_desc = cr2.istln_prod_grp_desc,
"
"                 stsfs_upd_prod_subgrp_id = cr2.istln_prod_subgrp,
"
"                 stsfs_upd_prod_subgrp_desc = cr2.istln_prod_subgrp_desc
"
"           WHERE stsfs_bu = p_bu
"
"	     AND stsfs_store_id = cr2.istln_rcpt_store_id
"
"	     AND stsfs_prod_id = cr2.istln_prod_id
"
"	     AND stsfs_prod_rev = cr2.istln_prod_rev
"
"	     AND NVL(stsfs_ord_no,'0') = NVL(cr2.istln_po_ord_no,'0')
"
"	     AND stsfs_sf_code = cr2.istln_sf_code
"
"	     AND NVL(stsfs_sys_ls_no,'0') = NVL(r_ls_blk(i).isbd_sys_ls_no,'0');
"
"
"
"	  /*FOR r_ls IN (SELECT *
"
"	                 FROM inv_stock_batch_details
"
"			WHERE isbd_bu = p_bu
"
"			  AND isbd_issue_doc_no = p_rcpt_no
"
"			  AND isbd_seq_no = cr2.istln_seq_no
"
"			ORDER BY isbd_sub_seq_no)
"
"	  LOOP
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.isbd_sys_ls_no,r_ls.isbd_lot_no,r_ls.isbd_serial_no,r_ls.isbd_trans_qty,r_ls.isbd_stk_trans_qty,0,r_ls.isbd_source_type,r_ls.isbd_source_id,r_ls.isbd_expiry_date,cr1.isthd_trans_date,p_user,p_unit_cost => v_rcpt_unitcost);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.istln_po_ord_no,
"
"                               NULL,
"
"                               cr2.istln_sf_code,
"
"                               cr1.istln_rcpt_store_id,
"
"                               cr2.istln_prod_id,
"
"                               cr2.istln_prod_rev,
"
"                               r_ls.isbd_sys_ls_no,
"
"                               r_ls.isbd_lot_no,
"
"                               NULL,
"
"                               r_ls.isbd_expiry_date,
"
"                               0,
"
"                               r_ls.isbd_stk_trans_qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.isthd_plnt,
"
"                               r_ls.isbd_source_id,
"
"                               r_ls.isbd_source_type,
"
"                               cr2.istln_so_pfx,
"
"                               cr2.istln_so_no,
"
"                               cr2.istln_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.isthd_doc_no,
"
"                               NULL,
"
"                               cr2.isthd_doc_no,
"
"                               cr2.istln_seq_no,
"
"                               cr2.istln_seq_no,
"
"                               TRUNC(cr1.isthd_trans_date),
"
"                               cr1.isthd_year,
"
"                               cr1.isthd_period,
"
"                               cr2.prod_cost_method,
"
"                               'MRV',
"
"                               'ICM',
"
"                               cr2.istln_prod_cls,
"
"                               cr2.istln_reference,
"
"                               'Check',
"
"                               cr2.istln_unit_cost,
"
"                               cr2.istln_unit_cost,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.istln_type,
"
"                               p_proj => cr2.istln_proj_id,
"
"                               p_task => cr2.istln_task_id,
"
"		               p_prod_cls_desc => cr2.istln_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.istln_prod_subcls,
"
"		               p_prod_sub_cls_desc => cr2.istln_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.istln_prod_grp,
"
"		               p_prod_grp_desc => cr2.istln_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.istln_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.istln_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.isthd_plnt,cr2.istln_prod_id,cr2.istln_prod_rev),
"
"			       p_so_schld_desc => cr2.istln_so_schld_desc
"
"                              );
"
"
"
"	  END LOOP;*/
"
"
"
"	END IF;
"
"
"
"      END LOOP c2;
"
"
"
"      DECLARE
"
"        v_jrnl_res	VARCHAR2(1);
"
"      BEGIN
"
"        IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"          proc_ins_mat_iss_appl_jrnl(p_bu,cr1.isthd_plnt,v_mi_doc_no,p_user,p_lang,v_jrnl_res);
"
"
"
"	  UPDATE inv_stock_trans_hd
"
"	     SET isthd_jrnl_flag = 'Y'
"
"	   WHERE isthd_bu = p_bu
"
"	     AND isthd_doc_no = v_mi_doc_no;
"
"
"
"        END IF;
"
"      END;
"
"
"
"      proc_issue_mat_frm_mi(p_bu,cr1.isthd_plnt,v_mi_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         cr1.isthd_plnt,
"
"		         cr1.isthd_trans_date,
"
"		         cr1.isthd_year,
"
"		         cr1.isthd_period,
"
"		         NULL,
"
"		         v_mi_doc_no,
"
"		         NULL,
"
"		         'ICM',
"
"		         p_user,
"
"		         1,
"
"		         'MIV '||v_mi_doc_no||' FROM MRV '||p_rcpt_no
"
"		        );
"
"      END IF;
"
"
"
"      /*BEGIN
"
"        SELECT icmctrl_auto_mtr_flag INTO v_mrv_cre_flag
"
"	  FROM icm_control
"
"	 WHERE icmctrl_bu = p_bu;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"	  Raise_Application_Error(-20999,'HRM ');
"
"      END;
"
"
"
"      IF v_mrv_cre_flag = 'Y' THEN
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'N',
"
"	       istlnh_sel_user = NULL
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_sel_flag = 'Y'
"
"	   AND istlnh_sel_user = p_user;
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'Y',
"
"	       istlnh_sel_user = p_user,
"
"	       istlnh_proc_qty = istlnh_trans_qty
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_doc_no = v_mi_doc_no;
"
"
"
"        pkg_mat_rcpt.proc_cre_mrv_frm_miv(p_bu,TRUNC(SYSDATE),p_user,v_mr_doc_no);
"
"
"
"      END IF;*/
"
"
"
"    END LOOP c1;
"
"
"
"    IF v_mi_doc_no IS NOT NULL THEN
"
"      p_mi_doc_no := func_find_order_no_substr(v_mi_doc_no);
"
"    END IF;
"
"
"
"  END proc_cre_miv_doc_frm_mrv;
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_qc_compl(p_bu			VARCHAR2,
"
"				          p_qc_no		VARCHAR2,
"
"				          p_user		VARCHAR2,
"
"					  p_user_emp		VARCHAR2,
"
"					  p_lang		NUMBER,
"
"					  p_mi_doc_no	OUT	VARCHAR2
"
"				         )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT 1 Seq_no,'A' Matl_Type,tqhd_plnt,tqhd_plnt_loc_id,tqhd_plnt_loc_name,tqhd_date,tqhd_year,tqhd_period,
"
"         CASE WHEN tqhd_insp_mode = 'PD' THEN tqhd_qc_id ELSE tqln_store_id END tqln_store_id,
"
"         tqhd_cust_id
"
"    FROM tqm_qc_hd,tqm_qc_ln,products,pom_control
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND pomctrl_bu(+) = tqhd_bu
"
"     AND pomctrl_plnt(+) = tqhd_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND (tqln_accept_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN tqln_aod_qty ELSE 0 END) > 0
"
"  UNION ALL
"
"  SELECT DISTINCT 2 Seq_no,'D' Matl_Type,tqhd_plnt,tqhd_plnt_loc_id,tqhd_plnt_loc_name,tqhd_date,tqhd_year,tqhd_period,
"
"         (SELECT store_id
"
"	    FROM stores
"
"	   WHERE store_bu = tqhd_bu
"
"	     AND store_plnt = tqhd_plnt
"
"	     AND store_plnt_loc_id = tqhd_plnt_loc_id
"
"	     AND store_physical = 'A') tqln_store_id,tqhd_cust_id
"
"    FROM tqm_qc_hd,tqm_qc_ln,products,pom_control
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND pomctrl_bu(+) = tqhd_bu
"
"     AND pomctrl_plnt(+) = tqhd_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND pomctrl_aod_rqrd_flag = 'Y'
"
"     AND tqln_aod_qty > 0
"
"  UNION ALL
"
"  SELECT DISTINCT 3 Seq_no,'R' Matl_Type,tqhd_plnt,tqhd_plnt_loc_id,tqhd_plnt_loc_name,tqhd_date,tqhd_year,tqhd_period,
"
"         (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = tqhd_bu
"
"	     AND ppl_plnt = tqhd_plnt
"
"	     AND ppl_prod_id = tqln_prod_id
"
"	     AND ppl_prod_rev = tqln_prod_rev
"
"	     AND ppl_plnt_loc_id = tqhd_plnt_loc_id) tqln_store_id,tqhd_cust_id
"
"    FROM tqm_qc_hd,tqm_qc_ln,products
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND tqln_reject_qty > 0
"
"    -- AND (tqln_reject_qty - (tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty)) > 0
"
" /*UNION ALL
"
"  SELECT DISTINCT 4 Seq_no,'S' Matl_Type,tqhd_plnt,tqhd_plnt_loc_id,tqhd_plnt_loc_name,tqhd_date,tqhd_year,tqhd_period,
"
"         (SELECT ppl_scrp_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = tqhd_bu
"
"	     AND ppl_plnt = tqhd_plnt
"
"	     AND ppl_prod_id = tqln_prod_id
"
"	     AND ppl_prod_rev = tqln_prod_rev
"
"	     AND ppl_plnt_loc_id = tqhd_plnt_loc_id) tqln_store_id
"
"    FROM tqm_qc_hd,tqm_qc_ln,products
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND tqln_reject_qty > 0
"
"     AND (tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty) > 0*/;
"
"
"
"  CURSOR c2(c_matl_type	VARCHAR2,
"
"            c_store_id	VARCHAR2) IS
"
"  SELECT tqhd_date,tqhd_year,tqhd_period,1 tqln_exchange_rate,tqln_vou_type,tqln_vou_no,tqln_vou_line_no,
"
"         tqln_seq_no,tqln_prod_id,tqln_prod_rev,prod_desc11,tqln_uom,tqln_prod_uom,tqln_conv_factor,
"
"	 prod_ser_lot_opt,prod_cost_method,prod_expr_flag,tqln_prod_cls,tqln_prod_cls_desc,tqln_prod_subcls,tqln_prod_subcls_desc,
"
"	 tqln_prod_grp,tqln_prod_grp_desc,tqln_prod_subgrp,tqln_prod_subgrp_desc,
"
"         tqln_so_type,tqln_so_pfx,tqln_so_no,tqln_so_seq_no,tqln_proj_id,tqln_task_id,tqln_so_schld_desc,
"
"         (tqln_accept_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN tqln_aod_qty ELSE 0 END) Trans_Qty,
"
"	 (tqln_stk_accept_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN tqln_stk_aod_qty ELSE 0 END) Stk_Trans_Qty, tqln_unit_cost,
"
"	 tqln_sf_code,tqln_prod_ord_no,tqhd_sou_sf_code,tqhd_sou_oprn_seq,tqhd_sou_proc_id,tqhd_tar_sf_code,tqhd_tar_oprn_seq,tqhd_tar_proc_id,
"
"	 tqln_rwk_vou_type,pomctrl_aod_rqrd_flag,tqhd_insp_mode,tqln_insp_rqst_no,tqln_insp_rqst_seq_no,tqhd_exp_date,tqhd_mfg_date
"
"    FROM tqm_qc_hd,tqm_qc_ln,products,pom_control
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND pomctrl_bu(+) = tqhd_bu
"
"     AND pomctrl_plnt(+) = tqhd_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND c_store_id = CASE WHEN tqhd_insp_mode = 'PD' THEN tqhd_qc_id ELSE tqln_store_id END
"
"     AND c_matl_type = 'A'
"
"     AND (tqln_accept_qty + CASE WHEN pomctrl_aod_rqrd_flag = 'N' THEN tqln_aod_qty ELSE 0 END) > 0
"
"  UNION ALL
"
"  SELECT tqhd_date,tqhd_year,tqhd_period,1 tqln_exchange_rate,tqln_vou_type,tqln_vou_no,tqln_vou_line_no,
"
"         tqln_seq_no,tqln_prod_id,tqln_prod_rev,prod_desc11,tqln_uom,tqln_prod_uom,tqln_conv_factor,
"
"	 prod_ser_lot_opt,prod_cost_method,prod_expr_flag,tqln_prod_cls,tqln_prod_cls_desc,tqln_prod_subcls,tqln_prod_subcls_desc,
"
"	 tqln_prod_grp,tqln_prod_grp_desc,tqln_prod_subgrp,tqln_prod_subgrp_desc,
"
"         tqln_so_type,tqln_so_pfx,tqln_so_no,tqln_so_seq_no,tqln_proj_id,tqln_task_id,tqln_so_schld_desc,
"
"         tqln_aod_qty Trans_Qty,
"
"	 tqln_stk_aod_qty Stk_Trans_Qty, tqln_unit_cost,
"
"	 tqln_sf_code,tqln_prod_ord_no,tqhd_sou_sf_code,tqhd_sou_oprn_seq,tqhd_sou_proc_id,tqhd_tar_sf_code,tqhd_tar_oprn_seq,tqhd_tar_proc_id,
"
"	 tqln_rwk_vou_type,pomctrl_aod_rqrd_flag,tqhd_insp_mode,tqln_insp_rqst_no,tqln_insp_rqst_seq_no,tqhd_exp_date,tqhd_mfg_date
"
"    FROM tqm_qc_hd,tqm_qc_ln,products,pom_control
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND pomctrl_bu(+) = tqhd_bu
"
"     AND pomctrl_plnt(+) = tqhd_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND (SELECT store_id FROM stores
"
"	   WHERE store_bu = tqhd_bu
"
"	     AND store_plnt = tqhd_plnt
"
"	     AND store_plnt_loc_id = tqhd_plnt_loc_id
"
"	     AND store_physical = 'A') = c_store_id
"
"     AND c_matl_type = 'D'
"
"     AND pomctrl_aod_rqrd_flag = 'Y'
"
"     AND tqln_aod_qty > 0
"
"  UNION ALL
"
"  SELECT tqhd_date,tqhd_year,tqhd_period,1 tqln_exchange_rate,tqln_vou_type,tqln_vou_no,tqln_vou_line_no,
"
"         tqln_seq_no,tqln_prod_id,tqln_prod_rev,prod_desc11,tqln_uom,tqln_prod_uom,tqln_conv_factor,
"
"	 prod_ser_lot_opt,prod_cost_method,prod_expr_flag,tqln_prod_cls,tqln_prod_cls_desc,tqln_prod_subcls,tqln_prod_subcls_desc,
"
"	 tqln_prod_grp,tqln_prod_grp_desc,tqln_prod_subgrp,tqln_prod_subgrp_desc,
"
"         tqln_so_type,tqln_so_pfx,tqln_so_no,tqln_so_seq_no,tqln_proj_id,tqln_task_id,tqln_so_schld_desc,
"
"         tqln_reject_qty Trans_Qty,tqln_stk_reject_qty Stk_Trans_Qty, tqln_unit_cost,
"
"	 tqln_sf_code,tqln_prod_ord_no,tqhd_sou_sf_code,tqhd_sou_oprn_seq,tqhd_sou_proc_id,tqhd_tar_sf_code,tqhd_tar_oprn_seq,tqhd_tar_proc_id,
"
"	 tqln_rwk_vou_type,pomctrl_aod_rqrd_flag,tqhd_insp_mode,tqln_insp_rqst_no,tqln_insp_rqst_seq_no,tqhd_exp_date,tqhd_mfg_date
"
"    FROM tqm_qc_hd,tqm_qc_ln,products,pom_control
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND pomctrl_bu(+) = tqhd_bu
"
"     AND pomctrl_plnt(+) = tqhd_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = tqhd_bu
"
"	     AND ppl_plnt = tqhd_plnt
"
"	     AND ppl_prod_id = tqln_prod_id
"
"	     AND ppl_prod_rev = tqln_prod_rev
"
"	     AND ppl_plnt_loc_id = tqhd_plnt_loc_id) = c_store_id
"
"     AND c_matl_type = 'R'
"
"     AND tqln_reject_qty > 0
"
"     --AND (tqln_reject_qty - (tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty)) > 0
"
"  --UNION ALL
"
"   /*SELECT tqhd_date,tqhd_year,tqhd_period,1 tqln_exchange_rate,tqln_vou_type,tqln_vou_no,tqln_vou_line_no,
"
"         tqln_seq_no,tqln_prod_id,tqln_prod_rev,
"
"         prod_desc11,prod_pur_uom,prod_uom,tqln_conv_factor,
"
"prod_ser_lot_opt,
"
"prod_cost_method,
"
"prod_expr_flag,
"
"prod_cls,
"
"func_find_class_qry_desc(tqln_bu,prod_cls,1)tqln_prod_cls_desc,
"
"prod_sub_cls,
"
"func_find_subclass_qry_desc(tqln_bu,prod_cls,1)tqln_prod_subcls_desc,
"
"prod_group_id,
"
"NULL tqln_prod_grp_desc,
"
"prod_subgroup_id,
"
"NULL tqln_prod_subgrp_desc,
"
" tqln_so_type,tqln_so_pfx,tqln_so_no,tqln_so_seq_no,tqln_proj_id,tqln_task_id,tqln_so_schld_desc,
"
"        Trans_Qty, Stk_Trans_Qty,tqln_unit_cost,
"
"     tqln_sf_code,tqln_prod_ord_no,tqhd_sou_sf_code,tqhd_sou_oprn_seq,tqhd_sou_proc_id,tqhd_tar_sf_code,tqhd_tar_oprn_seq,tqhd_tar_proc_id,
"
"     tqln_rwk_vou_type,pomctrl_aod_rqrd_flag,tqhd_insp_mode,tqln_insp_rqst_no,tqln_insp_rqst_seq_no,tqhd_exp_date,tqhd_mfg_date
"
"     FROM(
"
"   select tqln_bu,tqhd_date,tqhd_year,tqhd_period,1 tqln_exchange_rate,tqln_vou_type,tqln_vou_no,tqln_vou_line_no,
"
"         tqln_seq_no,tqln_conv_factor,tqln_so_type,tqln_so_pfx,tqln_so_no,tqln_so_seq_no,tqln_proj_id,tqln_task_id,tqln_so_schld_desc,
"
"         (tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty) Trans_Qty,(tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty) Stk_Trans_Qty,0 tqln_unit_cost,
"
"     NULL tqln_sf_code,tqln_prod_ord_no,tqhd_sou_sf_code,tqhd_sou_oprn_seq,tqhd_sou_proc_id,tqhd_tar_sf_code,tqhd_tar_oprn_seq,tqhd_tar_proc_id,
"
"     tqln_rwk_vou_type,pomctrl_aod_rqrd_flag,tqhd_insp_mode,tqln_insp_rqst_no,tqln_insp_rqst_seq_no,
"
"          (SELECT prod_scrap_prod_id FROM products  WHERE  prod_bu = tqln_bu AND prod_id = tqln_prod_id AND prod_rev = tqln_prod_rev)  tqln_prod_id,
"
"          (SELECT prod_scrap_prod_rev FROM products  WHERE prod_bu = tqln_bu AND prod_id = tqln_prod_id AND prod_rev = tqln_prod_rev)  tqln_prod_rev
"
"     FROM tqm_qc_hd,tqm_qc_ln,pom_control
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND pomctrl_bu(+) = tqhd_bu
"
"     AND pomctrl_plnt(+) = tqhd_plnt
"
"    -- AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND (SELECT ppl_scrp_store_id
"
"        FROM prod_plants_loc
"
"       WHERE ppl_bu = tqhd_bu
"
"         AND ppl_plnt = tqhd_plnt
"
"         AND ppl_prod_id = tqln_prod_id
"
"         AND ppl_prod_rev = tqln_prod_rev
"
"         AND ppl_plnt_loc_id = tqhd_plnt_loc_id) = c_store_id
"
"     AND c_matl_type = 'S'
"
"     AND tqln_reject_qty > 0
"
"     AND (tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty) > 0),products
"
"  WHERE prod_bu         = tqln_bu
"
"    AND prod_id     = tqln_prod_id
"
"    AND prod_Rev    = tqln_prod_rev
"
"    AND prod_stocked = 'Y'*/
"
"  /*SELECT tqhd_date,tqhd_year,tqhd_period,1 tqln_exchange_rate,tqln_vou_type,tqln_vou_no,tqln_vou_line_no,
"
"         tqln_seq_no,prod_scrap_prod_id tqln_prod_id,prod_scrap_prod_rev tqln_prod_rev,
"
"	 (SELECT prod_desc11 FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev)prod_desc11,
"
"	 (SELECT prod_pur_uom FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) tqln_uom,
"
"	 (SELECT prod_uom  FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) tqln_prod_uom,
"
"	 tqln_conv_factor,
"
"	 (SELECT prod_ser_lot_opt FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) prod_ser_lot_opt,
"
"	 (SELECT prod_cost_method FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) prod_cost_method,
"
"	 (SELECT prod_expr_flag FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) prod_expr_flag,
"
"	 (SELECT prod_cls FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) tqln_prod_cls,
"
"	 NULL tqln_prod_cls_desc,
"
"	 (SELECT prod_sub_cls FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) tqln_prod_subcls,
"
"	 NULL tqln_prod_subcls_desc,
"
"	 (SELECT prod_group_id FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) tqln_prod_grp,
"
"	 NULL tqln_prod_grp_desc,
"
"	 (SELECT prod_subgroup_id FROM products WHERE prod_bu = tqln_bu AND prod_id = prod_scrap_prod_id AND prod_rev = prod_scrap_prod_rev) tqln_prod_subgrp,
"
"	 NULL tqln_prod_subgrp_desc,
"
"         tqln_so_type,tqln_so_pfx,tqln_so_no,tqln_so_seq_no,tqln_proj_id,tqln_task_id,tqln_so_schld_desc,
"
"         (tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty) Trans_Qty,(tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty) Stk_Trans_Qty,0 tqln_unit_cost,
"
"	 tqln_sf_code,tqln_prod_ord_no,tqhd_sou_sf_code,tqhd_sou_oprn_seq,tqhd_sou_proc_id,tqhd_tar_sf_code,tqhd_tar_oprn_seq,tqhd_tar_proc_id,
"
"	 tqln_rwk_vou_type,pomctrl_aod_rqrd_flag,tqhd_insp_mode,tqln_insp_rqst_no,tqln_insp_rqst_seq_no,tqhd_exp_date,tqhd_mfg_date
"
"    FROM tqm_qc_hd,tqm_qc_ln,products,pom_control
"
"   WHERE tqhd_bu = tqln_bu
"
"     AND tqhd_qc_no = tqln_qc_no
"
"     AND prod_bu = tqln_bu
"
"     AND prod_id = tqln_prod_id
"
"     AND prod_rev = tqln_prod_rev
"
"     AND pomctrl_bu(+) = tqhd_bu
"
"     AND pomctrl_plnt(+) = tqhd_plnt
"
"     AND prod_stocked = 'Y'
"
"     AND tqln_status <> 'C'
"
"     AND tqhd_bu = p_bu
"
"     AND tqhd_qc_no = p_qc_no
"
"     AND (SELECT ppl_scrp_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = tqhd_bu
"
"	     AND ppl_plnt = tqhd_plnt
"
"	     AND ppl_prod_id = tqln_prod_id
"
"	     AND ppl_prod_rev = tqln_prod_rev
"
"	     AND ppl_plnt_loc_id = tqhd_plnt_loc_id) = c_store_id
"
"     AND c_matl_type = 'S'
"
"     AND tqln_reject_qty > 0
"
"     AND (tqln_rec_pri_scrap_qty + tqln_rec_sec_scrap_qty) > 0*/
"
"   ORDER BY tqln_seq_no;
"
"
"
"    v_insp_store_id	stores.store_id%TYPE;
"
"    v_mi_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE;
"
"    v_mi_doc_pfx	inv_stock_trans_hd.isthd_doc_pfx%TYPE;
"
"    v_issuer_id		inv_stock_trans_hd.isthd_issuer_id%TYPE;
"
"    v_issuer_name	inv_stock_trans_hd.isthd_issuer_name%TYPE;
"
"    v_issuer_pos_id	inv_stock_trans_hd.isthd_issuer_pos_id%TYPE;
"
"    v_issuer_pos_name	inv_stock_trans_hd.isthd_issuer_pos_name%TYPE;
"
"    dummy1		VARCHAR2(100);
"
"    dummy2		VARCHAR2(100);
"
"
"
"    v_seq_no		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"    v_roll_seq_no	NUMBER;
"
"
"
"    v_rcpt_unitcost	NUMBER;
"
"    v_cb_unit_cost	NUMBER;
"
"
"
"    v_stk_batch_no	stocks_batches.sb_batch_id%TYPE;
"
"    v_dc_no		VARCHAR2(100);
"
"    v_pack_no		VARCHAR2(100);
"
"    v_mr_doc_no		VARCHAR2(100);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"    v_cb_bal_qty	stocks_batches.sb_qty_in%TYPE;
"
"    v_cb_upd_qty	stocks_batches.sb_qty_in%TYPE;
"
"
"
"    v_sou_vou_no	VARCHAR2(30);
"
"    v_sou_vou_line_no	NUMBER;
"
"
"
"    TYPE typ_miv IS RECORD(miv_doc_no	VARCHAR2(30));
"
"    TYPE typ_miv_dtls IS TABLE OF typ_miv INDEX BY PLS_INTEGER;
"
"    r_miv	typ_miv_dtls;
"
"    v_index	NUMBER := 0;
"
"
"
"    v_so_seq_no	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_issuer_id,v_issuer_name,v_issuer_pos_id,v_issuer_pos_name,dummy1,dummy2,p_lang);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_insp_store_id := func_find_store_fr_type(p_bu,cr1.tqhd_plnt,cr1.tqhd_plnt_loc_id,'Q');
"
"
"
"      IF v_insp_store_id IS NULL THEN
"
"         Raise_Application_Error(-20270,'ICM');
"
"      END IF;
"
"
"
"      IF cr1.tqln_store_id IS NULL AND cr1.Matl_Type = 'A' THEN
"
"        Raise_Application_Error(-20032,'ICM Accept');
"
"      END IF;
"
"
"
"      IF cr1.tqln_store_id IS NULL AND cr1.Matl_Type = 'R' THEN
"
"        Raise_Application_Error(-20032,'ICM Reject'||p_qc_no||'~'||cr1.tqhd_plnt);
"
"      END IF;
"
"
"
"      IF cr1.tqln_store_id IS NULL AND cr1.Matl_Type = 'S' THEN
"
"         Raise_Application_Error(-20032,'ICM Scrap');
"
"      END IF;
"
"
"
"      --v_mi_doc_no := func_find_icm_next_id(p_bu,cr1.tqhd_date,'MI',v_insp_store_id,p_user);
"
"      v_mi_doc_pfx := func_find_vou_dflt_pfx(p_bu,cr1.tqhd_plnt,cr1.tqhd_plnt_loc_id,'MIV','MIV');
"
"      v_mi_doc_no := func_find_pfx_nextno(p_bu,cr1.tqhd_date,func_find_vou_dflt_pfx(p_bu,cr1.tqhd_plnt,cr1.tqhd_plnt_loc_id,'MIV','MIV'),p_user);
"
"
"
"      v_index := v_index + 1;
"
"      r_miv(v_index).miv_doc_no := v_mi_doc_no;
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"				     isthd_doc_no,
"
"				     isthd_plnt,
"
"				     isthd_plnt_loc_id,
"
"				     isthd_plnt_loc_name,
"
"				     isthd_doc_oper,
"
"				     isthd_issuefm_store_id,
"
"				     isthd_issueto_type,
"
"				     isthd_issueto_id,
"
"				     isthd_issueto_plnt,
"
"				     isthd_issueto_plnt_loc_id,
"
"				     isthd_trans_date,
"
"				     isthd_year,
"
"				     isthd_period,
"
"				     isthd_status,
"
"				     isthd_reference,
"
"				     isthd_issuer_id,
"
"				     isthd_issuer_name,
"
"				     isthd_issuer_pos_id,
"
"				     isthd_issuer_pos_name,
"
"				     isthd_vou_type,
"
"				     isthd_cre_by,
"
"				     isthd_cre_emp_id,
"
"				     isthd_cre_ip_addr,
"
"				     isthd_cre_os_user,
"
"				     isthd_cre_date,
"
"				     isthd_vou_oper,
"
"				     isthd_doc_pfx,
"
"				     isthd_cust_id,
"
"				     isthd_rqstby_entity
"
"				    )
"
"			      VALUES(p_bu,
"
"				     v_mi_doc_no,
"
"				     cr1.tqhd_plnt,
"
"				     cr1.tqhd_plnt_loc_id,
"
"				     cr1.tqhd_plnt_loc_name,
"
"				     'T',
"
"				     v_insp_store_id,
"
"				     'S',
"
"				     cr1.tqln_store_id,
"
"				     cr1.tqhd_plnt,
"
"				     cr1.tqhd_plnt_loc_id,
"
"				     cr1.tqhd_date,
"
"				     cr1.tqhd_year,
"
"				     cr1.tqhd_period,
"
"				     'N',
"
"				     'MIV '||v_mi_doc_no||' FROM QC '||p_qc_no,
"
"				     v_issuer_id,
"
"				     v_issuer_name,
"
"				     v_issuer_pos_id,
"
"				     v_issuer_pos_name,
"
"				     'GRN',
"
"				     p_user,
"
"				     v_emp_id,
"
"				     v_ip_addr,
"
"				     v_os_user,
"
"				     SYSDATE,
"
"				     cr1.Matl_Type,
"
"				     v_mi_doc_pfx,
"
"				     cr1.tqhd_cust_id,
"
"				     p_bu
"
"				    );
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.Matl_Type,cr1.tqln_store_id)
"
"      LOOP
"
"
"
"	/*IF cr1.Matl_Type ='S' THEN
"
"	   Raise_Application_Error(-20999,'HRM '||cr1.tqln_store_id||'~'||cr2.tqln_prod_id||'~'||cr2.tqln_prod_rev||'~'||cr2.prod_desc11||'~'||cr2.tqln_prod_uom);
"
"	END IF; */
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"	v_sub_seq_no := 0;
"
"
"
"	IF cr2.tqln_vou_type = 'GRN' AND cr2.tqln_sf_code IS NULL THEN
"
"	  SELECT porl_sc_unit_cost INTO v_rcpt_unitcost
"
"	    FROM pur_ord_receipt_ln
"
"	   WHERE porl_bu = p_bu
"
"	     AND porl_receipt_no = cr2.tqln_vou_no
"
"	     AND porl_seq_no = cr2.tqln_vou_line_no;
"
"	ELSIF cr2.tqln_vou_type = 'GRN' AND cr2.tqln_sf_code IS NOT NULL THEN
"
"	  SELECT porl_scon_mat_unit_cost INTO v_rcpt_unitcost
"
"	    FROM pur_ord_receipt_ln
"
"	   WHERE porl_bu = p_bu
"
"	     AND porl_receipt_no = cr2.tqln_vou_no
"
"	     AND porl_seq_no = cr2.tqln_vou_line_no;
"
"	 ELSIF cr2.tqln_vou_type = 'CMR' AND cr2.tqln_sf_code IS NULL THEN
"
"          SELECT  cmtln_unit_cost  INTO v_rcpt_unitcost
"
"           FROM cust_mat_trans_ln
"
"          WHERE cmtln_bu = p_bu
"
"            AND cmtln_doc_no = cr2.tqln_vou_no
"
"            AND cmtln_plnt =  cr1.tqhd_plnt
"
"            AND cmtln_seq_no = cr2.tqln_vou_line_no;
"
"	ELSE
"
"	  v_rcpt_unitcost := cr2.tqln_unit_cost;
"
"	END IF;
"
"
"
"	/*IF v_rcpt_unitcost = 0 THEN
"
"	  Raise_Application_Error(-20999,v_rcpt_unitcost);
"
"	END IF;*/
"
"
"
"	INSERT INTO inv_stock_trans_ln(istln_bu,
"
"				       istln_doc_no,
"
"				       istln_seq_no,
"
"				       istln_mat_type,
"
"				       istln_prod_id,
"
"				       istln_prod_rev,
"
"				       istln_uom,
"
"				       istln_prod_uom,
"
"				       istln_conv_factor,
"
"				       istln_prod_cls,
"
"				       istln_trans_qty,
"
"				       istln_stk_trans_qty,
"
"				       istln_unit_cost,
"
"				       istln_reference,
"
"				       istln_status,
"
"				       istln_type,
"
"				       istln_so_pfx,
"
"				       istln_so_no,
"
"				       istln_so_seq_no,
"
"				       istln_proj_id,
"
"				       istln_task_id,
"
"				       istln_so_schld_desc,
"
"				       istln_grn_no,
"
"				       istln_grn_seq_no,
"
"				       istln_vou_type,
"
"				       istln_vou_no,
"
"				       istln_vou_seq_no,
"
"				       istln_cre_by,
"
"				       istln_cre_emp_id,
"
"				       istln_cre_ip_addr,
"
"				       istln_cre_os_user,
"
"				       istln_cre_date,
"
"				       istln_po_ord_no,
"
"				       istln_sf_code,
"
"				       istln_sou_oprn_seq,
"
"				       istln_sou_proc_id,
"
"				       istln_rwk_vou_type
"
"				      )
"
"			        VALUES(p_bu,
"
"				       v_mi_doc_no,
"
"				       v_seq_no,
"
"				       CASE WHEN cr2.tqln_sf_code IS NULL THEN 'S' ELSE 'F' END,
"
"				       cr2.tqln_prod_id,
"
"				       cr2.tqln_prod_rev,
"
"				       cr2.tqln_uom,
"
"				       cr2.tqln_prod_uom,
"
"				       cr2.tqln_conv_factor,
"
"				       (SELECT prod_cls FROM products WHERE prod_bu = p_bu AND prod_id = cr2.tqln_prod_id AND prod_rev = cr2.tqln_prod_rev),--cr2.tqln_prod_cls,
"
"				       cr2.Trans_Qty,
"
"				       cr2.Stk_Trans_Qty,
"
"				       v_rcpt_unitcost,
"
"				       'MIV '||v_mi_doc_no||'/'||v_seq_no||' FROM QC '||p_qc_no||'/'||cr2.tqln_seq_no,
"
"				       'N',
"
"				       cr2.tqln_so_type,
"
"				       cr2.tqln_so_pfx,
"
"				       cr2.tqln_so_no,
"
"				       cr2.tqln_so_seq_no,
"
"				       cr2.tqln_proj_id,
"
"				       cr2.tqln_task_id,
"
"				       cr2.tqln_so_schld_desc,
"
"				       cr2.tqln_vou_no,
"
"				       cr2.tqln_vou_line_no,
"
"				       cr2.tqln_vou_type,
"
"				       cr2.tqln_vou_no,
"
"				       cr2.tqln_vou_line_no,
"
"				       p_user,
"
"				       v_emp_id,
"
"				       v_ip_addr,
"
"				       v_os_user,
"
"				       SYSDATE,
"
"				       cr2.tqln_prod_ord_no,
"
"				       cr2.tqln_sf_code,
"
"				       CASE WHEN cr2.tqhd_insp_mode ='ME' THEN cr2.tqhd_sou_oprn_seq ELSE cr2.tqhd_tar_oprn_seq END,
"
"				       CASE WHEN cr2.tqhd_insp_mode ='ME' THEN cr2.tqhd_sou_proc_id ELSE cr2.tqhd_tar_proc_id END,
"
"				       cr2.tqln_rwk_vou_type
"
"                           	      );
"
"
"
"        IF cr2.tqln_sf_code IS NULL THEN
"
"	proc_upd_stocks(p_bu,
"
"	                v_insp_store_id,
"
"	                NULL,
"
"	                cr2.tqln_prod_id,
"
"	                cr2.tqln_prod_rev,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                cr2.Stk_Trans_Qty,
"
"	                v_rcpt_unitcost,
"
"	                v_rcpt_unitcost,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                cr2.tqln_vou_line_no,
"
"	                0,
"
"	                NULL,
"
"	                cr2.tqln_vou_no,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                cr1.tqhd_year,
"
"	                cr1.tqhd_period,
"
"	                cr1.tqhd_date,
"
"	                NULL,
"
"	                'POM',
"
"	                'GRN',
"
"	                NULL,
"
"	                p_user,
"
"	                SYSDATE,
"
"	                NULL,
"
"	                cr2.tqln_prod_cls,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                0,
"
"		        p_prod_cls_desc => cr2.tqln_prod_cls_desc,
"
"		        p_prod_sub_cls_id => cr2.tqln_prod_subcls,
"
"		        p_prod_sub_cls_desc => cr2.tqln_prod_subcls_desc,
"
"		        p_prod_grp_id => cr2.tqln_prod_grp,
"
"		        p_prod_grp_desc	=> cr2.tqln_prod_grp_desc,
"
"		        p_prod_sub_grp_id => cr2.tqln_prod_subgrp,
"
"		        p_prod_sub_grp_desc => cr2.tqln_prod_subgrp_desc
"
"	               );
"
"
"
"        IF cr2.tqln_so_schld_desc IS NOT NULL THEN
"
"
"
"
"
"	FOR r_so IN (SELECT pormsa_so_prj_ref,pormsa_mrp_alloc_qty
"
"	                  FROM po_rcpt_mrp_so_alloc
"
"			 WHERE pormsa_bu = p_bu
"
"			   AND pormsa_rcpt_no = cr2.tqln_vou_no
"
"			   AND pormsa_seq_no = cr2.tqln_vou_line_no
"
"			 ORDER BY pormsa_sub_seq_no)
"
"	  LOOP
"
"
"
"	  SELECT NVL(MAX(istmsa_sub_seq_no),0) + 1 INTO v_so_seq_no
"
"	    FROM inv_stk_trans_mrp_so_alloc
"
"	   WHERE istmsa_bu = p_bu
"
"	     AND istmsa_doc_no = v_mi_doc_no
"
"	     AND istmsa_seq_no = v_seq_no;
"
"
"
"	  INSERT INTO inv_stk_trans_mrp_so_alloc(istmsa_bu,
"
"					         istmsa_doc_no,
"
"					         istmsa_seq_no,
"
"					         istmsa_sub_seq_no,
"
"					         istmsa_so_prj_ref,
"
"					         istmsa_mrp_alloc_qty,
"
"					         istmsa_cre_by,
"
"					         istmsa_cre_emp_id,
"
"					         istmsa_cre_ip_addr,
"
"					         istmsa_cre_os_user,
"
"					         istmsa_cre_date
"
"					        )
"
"					  VALUES(p_bu,
"
"					         v_mi_doc_no,
"
"						 v_seq_no,
"
"						 v_so_seq_no,
"
"						 r_so.pormsa_so_prj_ref,
"
"						 r_so.pormsa_mrp_alloc_qty,
"
"						 p_user,
"
"						 v_emp_id,
"
"						 v_ip_addr,
"
"						 v_os_user,
"
"						 SYSDATE
"
"						);
"
"	END LOOP;
"
"
"
"	  proc_upd_so_stocks(p_bu,
"
"	    	  	     v_insp_store_id,
"
"	    	  	     cr2.tqln_prod_id,
"
"	    	  	     cr2.tqln_prod_rev,
"
"	    	  	     0,
"
"	    	  	     cr2.Stk_Trans_Qty,
"
"	    	  	     v_rcpt_unitcost,
"
"	    	  	     cr2.tqln_so_pfx,
"
"	    	  	     cr2.tqln_so_no,
"
"	    	  	     cr2.tqln_so_seq_no,
"
"	    	  	     NULL,
"
"	    	  	     cr1.tqhd_date,
"
"	    	  	     'QC',
"
"	    	  	     NULL,
"
"	    	  	     cr2.tqln_vou_no,
"
"	    	  	     NULL,
"
"	    	  	     NULL,
"
"	    	  	     cr2.tqln_vou_no,
"
"	    	  	     cr2.tqln_vou_line_no,
"
"	    	  	     'GRN',
"
"	    	  	     'POM',
"
"	    	  	     'MIV FROM GRN',
"
"	    	  	     'MIV FROM GRN',
"
"	    	  	     p_user,
"
"	    	  	     cr2.tqln_so_type,
"
"	    	  	     cr2.tqln_proj_id,
"
"	    	  	     cr2.tqln_task_id,
"
"			     p_so_prj_schld_desc => cr2.tqln_so_schld_desc
"
"	    	  	    );
"
"	END IF;
"
"
"
"
"
"
"
"	IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	  proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user,p_unit_cost => v_rcpt_unitcost);
"
"
"
"	  IF cr2.prod_cost_method <> 'MAC' THEN
"
"	 --  Raise_Application_Error(-20999,'HRM 777 -'||v_insp_store_id||'/'||cr2.tqln_vou_no||'/'||cr2.tqln_prod_id);
"
"
"
"	    v_cb_bal_qty := cr2.Stk_Trans_Qty;
"
"
"
"            BEGIN
"
"              SELECT istlnh_doc_no,istlnh_seq_no INTO v_sou_vou_no,v_sou_vou_line_no
"
"                FROM inv_stock_trans_hd_hist,inv_stock_trans_ln_hist
"
"               WHERE isthdh_bu = istlnh_bu
"
"	         AND isthdh_doc_no = istlnh_doc_no
"
"		 AND isthdh_issueto_type = 'Q'
"
"		 AND istlnh_bu = p_bu
"
"	         AND istlnh_vou_type = 'IR'
"
"                 AND istlnh_vou_no = cr2.tqln_insp_rqst_no
"
"		 AND istlnh_vou_seq_no = cr2.tqln_insp_rqst_seq_no
"
"                 AND istlnh_rcpt_store_id = v_insp_store_id
"
"                 AND cr2.tqhd_insp_mode IN ('PD','ST');
"
"
"
"            EXCEPTION WHEN OTHERS THEN
"
"              v_sou_vou_no := cr2.tqln_vou_no;
"
"	      v_sou_vou_line_no := cr2.tqln_vou_line_no;
"
"            END;
"
"
"
"	    FOR r_cb IN (SELECT sb_batch_id,(sb_qty_in - sb_qty_out) Stk_Qty,sb_bc_unit_cost--MAX(sb_batch_id) INTO v_stk_batch_no
"
"	                   FROM stocks_batches
"
"	                  WHERE sb_bu = p_bu
"
"	                    AND sb_store_id = v_insp_store_id
"
"	                    AND sb_prod_id = cr2.tqln_prod_id
"
"	                    AND sb_prod_rev = cr2.tqln_prod_rev
"
"	                    AND sb_po_no = v_sou_vou_no
"
"	                    AND sb_receipt_seq_no = v_sou_vou_line_no
"
"			  ORDER BY sb_batch_id)
"
"	    LOOP
"
"
"
"	      v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	      IF v_cb_bal_qty > r_cb.Stk_Qty THEN
"
"	        v_cb_upd_qty := r_cb.Stk_Qty;
"
"		v_cb_bal_qty := v_cb_bal_qty - v_cb_upd_qty;
"
"	      ELSE
"
"	        v_cb_upd_qty := v_cb_bal_qty;
"
"		v_cb_bal_qty := 0;
"
"	      END IF;
"
"
"
"	    /*SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	      FROM stocks_batches
"
"	     WHERE sb_bu = p_bu
"
"	       AND sb_store_id = v_insp_store_id
"
"	       AND sb_prod_id = cr2.tqln_prod_id
"
"	       AND sb_prod_rev = cr2.tqln_prod_rev
"
"	       AND sb_po_no = cr2.tqln_vou_no
"
"	       AND sb_receipt_seq_no = cr2.tqln_vou_line_no;
"
"
"
"	    SELECT sb_bc_unit_cost INTO v_cb_unit_cost
"
"	      FROM stocks_batches
"
"	     WHERE sb_bu = p_bu
"
"	       AND sb_store_id = v_insp_store_id
"
"	       AND sb_prod_id = cr2.tqln_prod_id
"
"	       AND sb_prod_rev = cr2.tqln_prod_rev
"
"	       AND sb_batch_id = v_stk_batch_no;*/
"
"
"
"       /* IF v_insp_store_id = 'INSP WH-U5' AND cr2.tqln_vou_no ='MI05-2425-00287' THEN
"
"	   Raise_Application_Error(-20999,'HRM test -'||r_cb.sb_batch_id||'/'||r_cb.Stk_Qty||'/'||r_cb.sb_bc_unit_cost);
"
"	END IF;
"
"
"
"	IF p_qc_no = 'ID49-2425-00045' THEN
"
"	     Raise_application_error(-20999,'HRM Test '||v_insp_store_id||'~'||cr2.tqln_prod_id||'~'||cr2.tqln_prod_rev||'~'||cr2.tqln_vou_no||'~'||cr2.tqln_vou_line_no);
"
"	END IF;*/
"
"
"
"	      INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						     istcb_doc_no,
"
"						     istcb_seq_no,
"
"						     istcb_sub_seq_no,
"
"						     istcb_batch_no,
"
"						     istcb_trans_qty,
"
"						     istcb_stk_trans_qty,
"
"						     istcb_unit_cost,
"
"						     istcb_cre_by,
"
"						     istcb_cre_emp_id,
"
"						     istcb_cre_ip_addr,
"
"						     istcb_cre_os_user,
"
"						     istcb_cre_date,
"
"						     istcb_ins_rec
"
"						    )
"
"                                              VALUES(p_bu,
"
"					             v_mi_doc_no,
"
"					             v_seq_no,
"
"					             v_sub_seq_no,
"
"					             r_cb.sb_batch_id,
"
"					             v_cb_upd_qty / (cr2.Stk_Trans_Qty / cr2.Trans_Qty),--cr2.Trans_Qty,
"
"					             v_cb_upd_qty,--cr2.Stk_Trans_Qty,
"
"					             r_cb.sb_bc_unit_cost,
"
"					             p_user,
"
"						     v_emp_id,
"
"						     v_ip_addr,
"
"						     v_os_user,
"
"					             SYSDATE,
"
"					             'Y'
"
"					            );
"
"
"
"	      EXIT WHEN v_cb_bal_qty = 0;
"
"
"
"	    END LOOP;
"
"
"
"	  END IF;
"
"
"
"	ELSE
"
"
"
"         IF cr2.tqhd_exp_date IS NOT NULL THEN
"
"
"
"	    UPDATE tqm_lot_serial_nos
"
"	       SET tqmls_expiry_date = cr2.tqhd_exp_date
"
"	     WHERE tqmls_bu = p_bu
"
"	       AND tqmls_qc_no = p_qc_no;
"
"
"
"         END IF;
"
"
"
"
"
"	  FOR r_ls IN (SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,tqmls_heat_no,tqmls_test_no,
"
"			      (tqmls_accepted_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_aod_qty ELSE 0 END) LS_Trans_Qty,
"
"			      (tqmls_stk_acpt_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_stk_aod_qty ELSE 0 END) LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND (tqmls_accepted_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_aod_qty ELSE 0 END) > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"		       UNION ALL
"
"		       SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,tqmls_heat_no,tqmls_test_no,
"
"			      tqmls_aod_qty LS_Trans_Qty,tqmls_stk_aod_qty LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND tqmls_aod_qty > 0
"
"			  AND cr1.Matl_Type = 'D'
"
"			  AND cr2.pomctrl_aod_rqrd_flag = 'Y'
"
"		       UNION ALL
"
"		       SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,tqmls_heat_no,tqmls_test_no,tqmls_rejected_qty LS_Trans_Qty,
"
"			      tqmls_stk_rej_qty LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND tqmls_stk_rej_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			ORDER BY tqmls_qc_doc_sub_seq_no)
"
"
"
"	  LOOP
"
"
"
"	  	UPDATE prod_lot_ser_nos
"
"	           SET plsn_expiry_date = r_ls.tqmls_expiry_date
"
"	         WHERE plsn_bu = p_bu
"
"		   AND plsn_sys_ls_no = r_ls.tqmls_sys_ls_no
"
"		   AND plsn_expiry_date <> r_ls.tqmls_expiry_date;
"
"
"
"		UPDATE prod_lot_ser_nos
"
"	           SET plsn_mfg_date = cr2.tqhd_mfg_date
"
"	         WHERE plsn_bu = p_bu
"
"		   AND plsn_sys_ls_no = r_ls.tqmls_sys_ls_no
"
"		   AND plsn_mfg_date <> cr2.tqhd_mfg_date;
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.tqmls_sys_ls_no,r_ls.tqmls_lot_no,r_ls.tqmls_serial_no,r_ls.LS_Trans_Qty,
"
"	                          r_ls.LS_Stk_Trans_Qty,0,r_ls.tqmls_source_type,r_ls.tqmls_source_id,r_ls.tqmls_expiry_date,cr2.tqhd_mfg_date,p_user,
"
"	                          p_heat_no => r_ls.tqmls_heat_no,p_test_no => r_ls.tqmls_test_no,p_unit_cost => v_rcpt_unitcost);
"
"
"
"	    proc_upd_lot_ser_stocks(p_bu,
"
"                                    v_insp_store_id,
"
"                                    cr2.tqln_prod_id,
"
"                                    cr2.tqln_prod_rev,
"
"                                    r_ls.tqmls_sys_ls_no,
"
"                                    0,
"
"                                    r_ls.LS_Stk_Trans_Qty,
"
"                                    0,
"
"                                    v_rcpt_unitcost,
"
"				    cr2.prod_ser_lot_opt,
"
"                                    r_ls.tqmls_lot_no,
"
"                                    r_ls.tqmls_serial_no,
"
"                                    r_ls.tqmls_source_type,
"
"                                    r_ls.tqmls_source_id,
"
"                                    CASE WHEN cr2.prod_expr_flag = 'Y' THEN r_ls.tqmls_expiry_date ELSE NULL END,
"
"                                    TRUNC(cr1.tqhd_date),
"
"                                    'GRN',
"
"                                    NULL,
"
"                                    cr2.tqln_vou_no,
"
"                                    cr2.tqln_vou_line_no,
"
"                                    'POM',
"
"                                    'QC',--cr2.porl_upd_ref1,
"
"                                    'GRN LS Allocation',
"
"                                    p_user,
"
"                                    p_org_lot_no => r_ls.tqmls_org_lot_no,
"
"				    p_mix_lot_no => r_ls.tqmls_mix_lot_no
"
"                                   );
"
"
"
"            SELECT isbd_sub_seq_no INTO v_sub_seq_no
"
"	      FROM inv_stock_batch_details
"
"	     WHERE isbd_bu = p_bu
"
"               AND isbd_issue_doc_no = v_mi_doc_no
"
"               AND isbd_seq_no = v_seq_no
"
"               AND isbd_sys_ls_no = r_ls.tqmls_sys_ls_no;
"
"
"
"	    SELECT NVL(MAX(istlrd_seq_no),0) INTO v_roll_seq_no
"
"              FROM inv_stock_trans_lot_roll_dtls
"
"             WHERE istlrd_bu = p_bu
"
"               AND istlrd_doc_no = v_mi_doc_no
"
"	       AND istlrd_doc_seq_no = v_seq_no
"
"	       AND istlrd_lot_seq_no = v_sub_seq_no;
"
"
"
"            FOR r_roll IN (SELECT prlrd_roll_no,prlrd_roll_qty
"
"                             FROM pur_rcpt_lot_roll_dtls
"
"            		    WHERE prlrd_bu = p_bu
"
"                              AND prlrd_rcpt_no = cr2.tqln_vou_no
"
"                              AND prlrd_rcpt_seq_no = cr2.tqln_vou_line_no
"
"                              AND prlrd_sys_ls_no = r_ls.tqmls_sys_ls_no
"
"			    --ORDER BY prlrd_roll_no
"
"			   UNION ALL
"
"			   SELECT sslrd_new_roll_no,sslrd_roll_qty
"
"			     FROM store_stock_lot_roll_dtls
"
"			    WHERE sslrd_bu = p_bu
"
"                              AND sslrd_doc_no = cr2.tqln_vou_no
"
"                              AND sslrd_doc_seq_no = cr2.tqln_vou_line_no
"
"                              AND sslrd_lot_seq_no = r_ls.tqmls_qc_doc_sub_seq_no
"
"                              AND sslrd_sys_ls_no = r_ls.tqmls_sys_ls_no
"
"			    --ORDER BY sslrd_new_roll_no
"
"			    )
"
"            LOOP
"
"
"
"	      v_roll_seq_no := v_roll_seq_no + 1;
"
"
"
"	      INSERT INTO inv_stock_trans_lot_roll_dtls(istlrd_bu,
"
"							istlrd_doc_no,
"
"							istlrd_doc_seq_no,
"
"							istlrd_lot_seq_no,
"
"							istlrd_seq_no,
"
"							istlrd_sys_ls_no,
"
"							istlrd_lot_no,
"
"							istlrd_roll_no,
"
"							istlrd_roll_qty,
"
"							istlrd_cre_by,
"
"							istlrd_cre_emp_id,
"
"							istlrd_cre_ip_addr,
"
"							istlrd_cre_os_user,
"
"							istlrd_cre_date
"
"						       )
"
"	                                         VALUES(p_bu,
"
"						        v_mi_doc_no,
"
"							v_seq_no,
"
"							v_sub_seq_no,
"
"							v_roll_seq_no,
"
"							r_ls.tqmls_sys_ls_no,
"
"							r_ls.tqmls_lot_no,
"
"							r_roll.prlrd_roll_no,
"
"							r_roll.prlrd_roll_qty,
"
"							p_user,
"
"						        v_emp_id,
"
"						        v_ip_addr,
"
"						        v_os_user,
"
"							SYSDATE
"
"						       );
"
"
"
"              proc_upd_lot_roll_stocks(p_bu,
"
"                                       v_insp_store_id,
"
"                                       cr2.tqln_prod_id,
"
"                                       cr2.tqln_prod_rev,
"
"                                       r_ls.tqmls_sys_ls_no,
"
"            			       r_roll.prlrd_roll_no,
"
"            			       0,
"
"            			       0,
"
"            			       r_roll.prlrd_roll_qty,
"
"            			       0,
"
"            			       CASE WHEN cr2.tqhd_insp_mode IN('PR','SC') THEN  'GRN'
"
"				            WHEN cr2.tqhd_insp_mode = 'ME' THEN  'ME'
"
"				       END,
"
"            			       TRUNC(cr1.tqhd_date),
"
"            			       cr2.tqln_vou_no,
"
"            			       cr2.tqln_vou_line_no,
"
"            			       p_user
"
"            			      );
"
"            END LOOP;
"
"
"
"	    IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	    /*IF v_insp_store_id = 'INSP WH-U5' AND cr2.tqln_prod_id = 'FG00012' AND cr2.tqln_vou_no = 'MI05-2425-00287' THEN
"
"	       raise_application_error(-20999,'HRM test');
"
"	    END IF;*/
"
"
"
"	    /*IF cr2.tqln_prod_id = 'FG-SI-100001' AND cr2.tqln_vou_no = 'IREQ-2425-00455' THEN
"
"	      raise_application_error(-20999,'HRM test '||v_insp_store_id||'~'||cr2.tqln_vou_no||'~'||cr2.tqln_vou_line_no);
"
"	    END IF;*/
"
"
"
"	    v_cb_bal_qty := r_ls.LS_Stk_Trans_Qty;
"
"
"
"            BEGIN
"
"              SELECT istlnh_doc_no,istlnh_seq_no INTO v_sou_vou_no,v_sou_vou_line_no
"
"                FROM inv_stock_trans_hd_hist,inv_stock_trans_ln_hist
"
"               WHERE isthdh_bu = istlnh_bu
"
"	         AND isthdh_doc_no = istlnh_doc_no
"
"		 AND isthdh_issueto_type = 'Q'
"
"		 AND istlnh_bu = p_bu
"
"	         AND istlnh_vou_type = 'IR'
"
"                 AND istlnh_vou_no = cr2.tqln_insp_rqst_no
"
"		 AND istlnh_vou_seq_no = cr2.tqln_insp_rqst_seq_no
"
"                 AND istlnh_rcpt_store_id = v_insp_store_id
"
"                 AND cr2.tqhd_insp_mode IN ('PD','ST');
"
"
"
"            EXCEPTION WHEN OTHERS THEN
"
"              v_sou_vou_no := cr2.tqln_vou_no;
"
"	      v_sou_vou_line_no := cr2.tqln_vou_line_no;
"
"            END;
"
"
"
"	    FOR r_cb IN (SELECT sb_batch_id,(sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) Stk_Qty,sb_bc_unit_cost
"
"	                   FROM stocks_batches
"
"	                  WHERE sb_bu = p_bu
"
"	                    AND sb_store_id = v_insp_store_id
"
"	                    AND sb_prod_id = cr2.tqln_prod_id
"
"	                    AND sb_prod_rev = cr2.tqln_prod_rev
"
"	                    AND sb_po_no = v_sou_vou_no
"
"	                    AND sb_receipt_seq_no = v_sou_vou_line_no
"
"			    AND (sb_sys_ls_no = r_ls.tqmls_sys_ls_no OR sb_sys_ls_no IS NULL)
"
"			    AND (sb_qty_in - (sb_qty_out + sb_qty_allocated + sb_qty_picked)) > 0
"
"			  ORDER BY sb_batch_id)
"
"	    LOOP
"
"
"
"	      IF v_cb_bal_qty > r_cb.Stk_Qty THEN
"
"	        v_cb_upd_qty := r_cb.Stk_Qty;
"
"		v_cb_bal_qty := v_cb_bal_qty - v_cb_upd_qty;
"
"	      ELSE
"
"	        v_cb_upd_qty := v_cb_bal_qty;
"
"		v_cb_bal_qty := 0;
"
"	      END IF;
"
"
"
"	      v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	      /*SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	        FROM stocks_batches
"
"	       WHERE sb_bu = p_bu
"
"	         AND sb_store_id = v_insp_store_id
"
"	         AND sb_prod_id = cr2.tqln_prod_id
"
"	         AND sb_prod_rev = cr2.tqln_prod_rev
"
"	         AND sb_po_no = cr2.tqln_vou_no
"
"	         AND sb_receipt_seq_no = cr2.tqln_vou_line_no;
"
"
"
"	    SELECT sb_bc_unit_cost INTO v_cb_unit_cost
"
"	      FROM stocks_batches
"
"	     WHERE sb_bu = p_bu
"
"	       AND sb_store_id = v_insp_store_id
"
"	       AND sb_prod_id = cr2.tqln_prod_id
"
"	       AND sb_prod_rev = cr2.tqln_prod_rev
"
"	       AND sb_batch_id = v_stk_batch_no;*/
"
"
"
"	      --Raise_Application_Error(-20999,'HRM '||v_stk_batch_no);
"
"	      INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						     istcb_doc_no,
"
"						     istcb_seq_no,
"
"						     istcb_sub_seq_no,
"
"						     istcb_batch_no,
"
"						     istcb_trans_qty,
"
"						     istcb_stk_trans_qty,
"
"						     istcb_unit_cost,
"
"						     istcb_cre_by,
"
"						     istcb_cre_emp_id,
"
"						     istcb_cre_ip_addr,
"
"						     istcb_cre_os_user,
"
"						     istcb_cre_date,
"
"						     istcb_ins_rec,
"
"						     istcb_sys_ls_no
"
"						    )
"
"                                              VALUES(p_bu,
"
"					             v_mi_doc_no,
"
"					             v_seq_no,
"
"					             v_sub_seq_no,
"
"					             r_cb.sb_batch_id,--v_stk_batch_no,
"
"					             v_cb_upd_qty,--r_ls.LS_Trans_Qty,
"
"					             v_cb_upd_qty,--r_ls.LS_Stk_Trans_Qty,
"
"					             r_cb.sb_bc_unit_cost,--v_cb_unit_cost,
"
"					             p_user,
"
"						     v_emp_id,
"
"						     v_ip_addr,
"
"						     v_os_user,
"
"					             SYSDATE,
"
"					             'Y',
"
"					             r_ls.tqmls_sys_ls_no
"
"					            );
"
"	      EXIT WHEN v_cb_bal_qty = 0;
"
"
"
"	    END LOOP;
"
"	    END IF;
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
"	ELSE
"
"
"
"	  IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	    v_rcpt_unitcost := func_find_sfg_unitcost(p_bu,cr2.tqln_prod_id,cr2.tqln_prod_rev,v_insp_store_id,cr2.tqln_prod_ord_no,cr2.tqln_sf_code,NULL);
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user,p_unit_cost =>v_rcpt_unitcost);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.tqln_prod_ord_no,
"
"                               NULL,
"
"                               cr2.tqln_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.tqln_prod_id,
"
"                               cr2.tqln_prod_rev,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               cr2.Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.tqhd_plnt,
"
"                               NULL,--cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.tqln_so_pfx,
"
"                               cr2.tqln_so_no,
"
"                               cr2.tqln_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,--cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               TRUNC(cr1.tqhd_date),
"
"                               cr1.tqhd_year,
"
"                               cr1.tqhd_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.tqln_prod_cls,
"
"                               'QC',--cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               v_rcpt_unitcost,--cr2.porl_sc_unit_cost,
"
"                               v_rcpt_unitcost,--cr2.porl_sc_unit_cost * cr2.porh_exchange_rate,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.tqln_so_type,
"
"                               p_proj => cr2.tqln_proj_id,
"
"                               p_task => cr2.tqln_task_id,
"
"		               p_prod_cls_desc => cr2.tqln_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.tqln_prod_subcls,
"
"		               p_prod_sub_cls_desc => cr2.tqln_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.tqln_prod_grp,
"
"		               p_prod_grp_desc => cr2.tqln_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.tqln_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.tqln_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.tqhd_plnt,cr2.tqln_prod_id,cr2.tqln_prod_rev),
"
"			       p_so_schld_desc =>cr2.tqln_so_schld_desc
"
"                              );
"
"
"
"	ELSE
"
"
"
"	  FOR r_ls IN (SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,tqmls_heat_no,tqmls_test_no,
"
"			      (tqmls_accepted_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_aod_qty ELSE 0 END) LS_Trans_Qty,
"
"			      (tqmls_stk_acpt_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_stk_aod_qty ELSE 0 END) LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND (tqmls_accepted_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_aod_qty ELSE 0 END) > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"		       UNION ALL
"
"		       SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,tqmls_heat_no,tqmls_test_no,
"
"			      tqmls_aod_qty LS_Trans_Qty,tqmls_stk_aod_qty LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND tqmls_aod_qty > 0
"
"			  AND cr1.Matl_Type = 'D' AND cr2.pomctrl_aod_rqrd_flag = 'Y'
"
"		       UNION ALL
"
"		       SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,tqmls_heat_no,tqmls_test_no,tqmls_rejected_qty LS_Trans_Qty,
"
"			      tqmls_stk_rej_qty LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND tqmls_stk_rej_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			ORDER BY tqmls_qc_doc_sub_seq_no)
"
"	  LOOP
"
"
"
"	    v_rcpt_unitcost := func_find_sfg_unitcost(p_bu,cr2.tqln_prod_id,cr2.tqln_prod_rev,v_insp_store_id,cr2.tqln_prod_ord_no,cr2.tqln_sf_code,r_ls.tqmls_sys_ls_no);
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.tqmls_sys_ls_no,r_ls.tqmls_lot_no,r_ls.tqmls_serial_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.tqmls_source_type,r_ls.tqmls_source_id,NULL,NULL,p_user,
"
"	                          p_heat_no => r_ls.tqmls_heat_no,p_test_no => r_ls.tqmls_test_no,
"
"				  p_unit_cost => v_rcpt_unitcost);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.tqln_prod_ord_no,
"
"                               NULL,
"
"                               cr2.tqln_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.tqln_prod_id,
"
"                               cr2.tqln_prod_rev,
"
"                               r_ls.tqmls_sys_ls_no,
"
"                               r_ls.tqmls_lot_no,
"
"                               NULL,
"
"                               r_ls.tqmls_expiry_date,
"
"                               0,
"
"                               r_ls.LS_Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.tqhd_plnt,
"
"                               NULL,--cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.tqln_so_pfx,
"
"                               cr2.tqln_so_no,
"
"                               cr2.tqln_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,--cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               TRUNC(cr1.tqhd_date),
"
"                               cr1.tqhd_year,
"
"                               cr1.tqhd_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.tqln_prod_cls,
"
"                               'QC',--cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               v_rcpt_unitcost,
"
"                               v_rcpt_unitcost,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.tqln_so_type,
"
"                               p_proj => cr2.tqln_proj_id,
"
"                               p_task => cr2.tqln_task_id,
"
"		               p_prod_cls_desc => cr2.tqln_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.tqln_prod_subcls,
"
"		               p_prod_sub_cls_desc => cr2.tqln_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.tqln_prod_grp,
"
"		               p_prod_grp_desc => cr2.tqln_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.tqln_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.tqln_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.tqhd_plnt,cr2.tqln_prod_id,cr2.tqln_prod_rev),
"
"			       p_so_schld_desc => cr2.tqln_so_schld_desc
"
"                              );
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
"	END IF;
"
"
"
"	  UPDATE rework_order_comp_hd
"
"             SET rwochd_miv_no = v_mi_doc_no
"
"           WHERE rwochd_bu = p_bu
"
"             AND rwochd_plnt = cr1.tqhd_plnt
"
"             AND rwochd_doc_no = cr2.tqln_vou_no;  --Added By Mohamed Yasir
"
"
"
"	SELECT SUM(isbd_trans_qty * isbd_unit_cost) / SUM(isbd_trans_qty) INTO v_rcpt_unitcost
"
"	  FROM inv_stock_batch_details
"
"	 WHERE isbd_bu = p_bu
"
"	   AND isbd_issue_doc_no = v_mi_doc_no
"
"	   AND isbd_seq_no = v_seq_no;
"
"
"
"        IF v_rcpt_unitcost = 0 THEN
"
"          Raise_Application_Error(-20999,'Testing');
"
"        END IF;
"
"
"
"	UPDATE inv_stock_trans_ln
"
"	   SET istln_unit_cost = v_rcpt_unitcost
"
"	 WHERE istln_bu = p_bu
"
"	   AND istln_doc_no = v_mi_doc_no
"
"	   AND istln_seq_no = v_seq_no;
"
"
"
"      END LOOP c2;
"
"
"
"      /*DECLARE
"
"        v_jrnl_res	VARCHAR2(1);
"
"	v_jrnl_cnt	NUMBER;
"
"      BEGIN
"
"
"
"        IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"          proc_ins_mat_iss_appl_jrnl(p_bu,cr1.tqhd_plnt,v_mi_doc_no,p_user,p_lang,v_jrnl_res);
"
"
"
"	  IF v_jrnl_res = 'Y' THEN
"
"
"
"	    SELECT COUNT(*) INTO v_jrnl_cnt
"
"	      FROM appl_journals
"
"	     WHERE aj_bu = p_bu
"
"	       AND aj_vou_no = v_mi_doc_no;
"
"
"
"	    IF v_jrnl_cnt = 0 THEN
"
"	      Raise_Application_Error(-20999,'Journal not created.');
"
"	    END IF;
"
"
"
"	    UPDATE inv_stock_trans_hd
"
"	       SET isthd_jrnl_flag = 'Y'
"
"	     WHERE isthd_bu = p_bu
"
"	       AND isthd_doc_no = v_mi_doc_no;
"
"
"
"	  ELSE
"
"
"
"	    Raise_Application_Error(-20999,'Journal not created.');
"
"
"
"	  END IF;
"
"
"
"        END IF;
"
"
"
"      END;
"
"
"
"      proc_issue_mat_frm_mi(p_bu,cr1.tqhd_plnt,v_mi_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         cr1.tqhd_plnt,
"
"		         cr1.tqhd_date,
"
"		         cr1.tqhd_year,
"
"		         cr1.tqhd_period,
"
"		         NULL,
"
"		         v_mi_doc_no,
"
"		         NULL,
"
"		         'ICM',
"
"		         p_user,
"
"		         1,
"
"		         'MIV '||v_mi_doc_no||' FROM QC '||p_qc_no
"
"		        );
"
"
"
"      END IF;*/
"
"    END LOOP c1;
"
"
"
"    FOR i IN 1..v_index
"
"    LOOP
"
"
"
"      FOR r_mi IN (SELECT *
"
"                     FROM inv_stock_trans_hd
"
"		    WHERE isthd_bu = p_bu
"
"		      AND isthd_doc_no = r_miv(i).miv_doc_no)
"
"      LOOP
"
"      DECLARE
"
"        v_jrnl_res	VARCHAR2(1);
"
"      BEGIN
"
"        IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"          proc_ins_mat_iss_appl_jrnl(p_bu,r_mi.isthd_plnt,r_mi.isthd_doc_no,p_user,p_lang,v_jrnl_res);
"
"	  UPDATE inv_stock_trans_hd
"
"	     SET isthd_jrnl_flag = 'Y'
"
"	   WHERE isthd_bu = p_bu
"
"	     AND isthd_doc_no = r_mi.isthd_doc_no;
"
"        END IF;
"
"      END;
"
"
"
"      proc_issue_mat_frm_mi(p_bu,r_mi.isthd_plnt,r_mi.isthd_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         r_mi.isthd_plnt,
"
"		         r_mi.isthd_trans_date,
"
"		         r_mi.isthd_year,
"
"		         r_mi.isthd_period,
"
"		         NULL,
"
"		         r_mi.isthd_doc_no,
"
"		         NULL,
"
"		         'ICM',
"
"		         p_user,
"
"		         1,
"
"		         'MIV '||r_mi.isthd_doc_no||' FROM QC '||p_qc_no
"
"		        );
"
"      END IF;
"
"      END LOOP;
"
"    END LOOP;
"
"
"
"    IF v_mi_doc_no IS NOT NULL THEN
"
"      p_mi_doc_no := func_find_order_no_substr(v_mi_doc_no);
"
"    END IF;
"
"
"
"  END proc_cre_miv_doc_frm_qc_compl;
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_cmr(p_bu			VARCHAR2,
"
"				     p_plnt			VARCHAR2,
"
"				     p_doc_no			VARCHAR2,
"
"				     p_user			VARCHAR2,
"
"				     p_user_emp		VARCHAR2,
"
"				     p_lang			NUMBER,
"
"				     p_mi_doc_no	OUT	VARCHAR2
"
"				    )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT 1 Seq_no,'A' Matl_Type,cmthd_plnt,cmthd_plnt_loc_id,cmthd_plnt_loc_name,cmthd_doc_date,
"
"         func_find_cmr_storeid(cmthd_bu,cmthd_plnt,cmthd_plnt_loc_id,cmthd_cust_id,cmtln_prod_id,cmtln_prod_rev,icmctrl_cmr_rcpt_store_type) cmtln_store_id
"
"    FROM cust_mat_trans_hd,cust_mat_trans_ln,products,icm_control
"
"   WHERE cmthd_bu = cmtln_bu
"
"     AND cmthd_plnt = cmtln_plnt
"
"     AND cmthd_doc_no = cmtln_doc_no
"
"     AND prod_bu = cmtln_bu
"
"     AND prod_id = cmtln_prod_id
"
"     AND prod_rev = cmtln_prod_rev
"
"     AND icmctrl_bu = cmthd_bu
"
"     AND prod_stocked = 'Y'
"
"     AND cmtln_status <> 'C'
"
"     AND cmthd_bu = p_bu
"
"     AND cmthd_plnt = p_plnt
"
"     AND cmthd_doc_no = p_doc_no
"
"     AND cmtln_accept_qty > 0
"
"  UNION ALL
"
"  SELECT DISTINCT 2 Seq_no,'R' Matl_Type,cmthd_plnt,cmthd_plnt_loc_id,cmthd_plnt_loc_name,cmthd_doc_date,
"
"         (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = cmthd_bu
"
"	     AND ppl_plnt = cmthd_plnt
"
"	     AND ppl_prod_id = cmtln_prod_id
"
"	     AND ppl_prod_rev = cmtln_prod_rev
"
"	     AND ppl_plnt_loc_id = cmthd_plnt_loc_id) cmtln_store_id
"
"    FROM cust_mat_trans_hd,cust_mat_trans_ln,products,icm_control
"
"   WHERE cmthd_bu = cmtln_bu
"
"     AND cmthd_plnt = cmtln_plnt
"
"     AND cmthd_doc_no = cmtln_doc_no
"
"     AND prod_bu = cmtln_bu
"
"     AND prod_id = cmtln_prod_id
"
"     AND prod_rev = cmtln_prod_rev
"
"     AND icmctrl_bu = cmthd_bu
"
"     AND prod_stocked = 'Y'
"
"     AND cmtln_status <> 'C'
"
"     AND cmthd_bu = p_bu
"
"     AND cmthd_plnt = p_plnt
"
"     AND cmthd_doc_no = p_doc_no
"
"     AND cmtln_reject_qty > 0;
"
"
"
"  CURSOR c2(c_matl_type	VARCHAR2,
"
"            c_store_id	VARCHAR2) IS
"
"  SELECT cmthd_cust_id,cmthd_doc_date,cmtln_seq_no,cmtln_prod_id,cmtln_prod_rev,prod_desc11,cmtln_unit_cost,cmtln_prod_uom,
"
"         cmtln_conv_factor,cmtln_sf_code,cmtln_accept_qty Trans_Qty,cmtln_accept_qty Stk_Trans_Qty,
"
"	 prod_cls,(SELECT class_desc1 FROM classes WHERE class_bu = prod_bu AND class_id = prod_cls) prod_cls_desc,
"
"	 prod_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = prod_bu AND subcls_id = prod_sub_cls) prod_sub_cls_desc,
"
"	 prod_group_id prod_grp,(SELECT pgrp_group_desc1 FROM prod_group WHERE pgrp_bu = prod_bu AND pgrp_group_id = prod_group_id) prod_grp_desc,
"
"	 prod_subgroup_id prod_sub_grp,(SELECT psgrp_subgroup_desc1 FROM prod_sub_group WHERE psgrp_bu = prod_bu AND psgrp_subgroup_id = prod_subgroup_id) prod_sub_grp_desc,
"
"	 prod_ser_lot_opt,prod_cost_method,prod_expr_flag,cmtln_so_schld_desc,cmtln_so_type,cmtln_so_ord_no,cmtln_so_ord_pfx,
"
"	 cmtln_so_seq_no,cmtln_proj_id,cmtln_task_id
"
"    FROM cust_mat_trans_hd,cust_mat_trans_ln,products,icm_control
"
"   WHERE cmthd_bu = cmtln_bu
"
"     AND cmthd_plnt = cmtln_plnt
"
"     AND cmthd_doc_no = cmtln_doc_no
"
"     AND prod_bu = cmtln_bu
"
"     AND prod_id = cmtln_prod_id
"
"     AND prod_rev = cmtln_prod_rev
"
"     AND icmctrl_bu = cmthd_bu
"
"     AND prod_stocked = 'Y'
"
"     AND cmtln_status <> 'C'
"
"     AND cmthd_bu = p_bu
"
"     AND cmthd_plnt = p_plnt
"
"     AND cmthd_doc_no = p_doc_no
"
"     AND func_find_cmr_storeid(cmthd_bu,cmthd_plnt,cmthd_plnt_loc_id,cmthd_cust_id,cmtln_prod_id,cmtln_prod_rev,icmctrl_cmr_rcpt_store_type) = c_store_id
"
"     AND c_matl_type = 'A'
"
"     AND cmtln_accept_qty > 0
"
"  UNION ALL
"
"  SELECT cmthd_cust_id,cmthd_doc_date,cmtln_seq_no,cmtln_prod_id,cmtln_prod_rev,prod_desc11,cmtln_unit_cost,cmtln_prod_uom,
"
"         cmtln_conv_factor,cmtln_sf_code,cmtln_reject_qty Trans_Qty,cmtln_reject_qty Stk_Trans_Qty,
"
"	 prod_cls,(SELECT class_desc1 FROM classes WHERE class_bu = prod_bu AND class_id = prod_cls) prod_cls_desc,
"
"	 prod_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = prod_bu AND subcls_id = prod_sub_cls) prod_sub_cls_desc,
"
"	 prod_group_id prod_grp,(SELECT pgrp_group_desc1 FROM prod_group WHERE pgrp_bu = prod_bu AND pgrp_group_id = prod_group_id) prod_grp_desc,
"
"	 prod_subgroup_id prod_sub_grp,(SELECT psgrp_subgroup_desc1 FROM prod_sub_group WHERE psgrp_bu = prod_bu AND psgrp_subgroup_id = prod_subgroup_id) prod_sub_grp_desc,
"
"	 prod_ser_lot_opt,prod_cost_method,prod_expr_flag,cmtln_so_schld_desc,cmtln_so_type,cmtln_so_ord_no,cmtln_so_ord_pfx,
"
"	 cmtln_so_seq_no,cmtln_proj_id,cmtln_task_id
"
"    FROM cust_mat_trans_hd,cust_mat_trans_ln,products,icm_control
"
"   WHERE cmthd_bu = cmtln_bu
"
"     AND cmthd_plnt = cmtln_plnt
"
"     AND cmthd_doc_no = cmtln_doc_no
"
"     AND prod_bu = cmtln_bu
"
"     AND prod_id = cmtln_prod_id
"
"     AND prod_rev = cmtln_prod_rev
"
"     AND icmctrl_bu = cmthd_bu
"
"     AND prod_stocked = 'Y'
"
"     AND cmtln_status <> 'C'
"
"     AND cmthd_bu = p_bu
"
"     AND cmthd_plnt = p_plnt
"
"     AND cmthd_doc_no = p_doc_no
"
"     AND (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = cmthd_bu
"
"	     AND ppl_plnt = cmthd_plnt
"
"	     AND ppl_prod_id = cmtln_prod_id
"
"	     AND ppl_prod_rev = cmtln_prod_rev
"
"	     AND ppl_plnt_loc_id = cmthd_plnt_loc_id) = c_store_id
"
"     AND c_matl_type = 'R'
"
"     AND cmtln_reject_qty > 0
"
"   ORDER BY cmtln_seq_no;
"
"
"
"    v_insp_store_id	stores.store_id%TYPE;
"
"    v_mi_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE;
"
"    v_mi_doc_pfx	inv_stock_trans_hd.isthd_doc_pfx%TYPE;
"
"    v_issuer_id		inv_stock_trans_hd.isthd_issuer_id%TYPE;
"
"    v_issuer_name	inv_stock_trans_hd.isthd_issuer_name%TYPE;
"
"    v_issuer_pos_id	inv_stock_trans_hd.isthd_issuer_pos_id%TYPE;
"
"    v_issuer_pos_name	inv_stock_trans_hd.isthd_issuer_pos_name%TYPE;
"
"    dummy1		VARCHAR2(100);
"
"    dummy2		VARCHAR2(100);
"
"
"
"    v_seq_no		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"
"
"    v_rcpt_unitcost	NUMBER;
"
"
"
"    v_stk_batch_no	stocks_batches.sb_batch_id%TYPE;
"
"    v_dc_no		VARCHAR2(100);
"
"    v_pack_no		VARCHAR2(100);
"
"    v_mr_doc_no		VARCHAR2(100);
"
"
"
"    v_mrv_cre_flag	VARCHAR2(1);
"
"
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_issuer_id,v_issuer_name,v_issuer_pos_id,v_issuer_pos_name,dummy1,dummy2,p_lang);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_insp_store_id := func_find_store_fr_type(p_bu,cr1.cmthd_plnt,cr1.cmthd_plnt_loc_id,'Q');
"
"
"
"      IF cr1.cmtln_store_id IS NULL AND cr1.Matl_Type = 'R' THEN
"
"        Raise_Application_Error(-20032,'ICM ');
"
"      END IF;
"
"
"
"      v_mi_doc_pfx := func_find_vou_dflt_pfx(p_bu,cr1.cmthd_plnt,cr1.cmthd_plnt_loc_id,'MIV','MIV');
"
"      --v_mi_doc_no := func_find_icm_next_id(p_bu,cr1.porh_receipt_date,'MI',v_insp_store_id,p_user);
"
"      v_mi_doc_no := func_find_pfx_nextno(p_bu,cr1.cmthd_doc_date,func_find_vou_dflt_pfx(p_bu,cr1.cmthd_plnt,cr1.cmthd_plnt_loc_id,'MIV','MIV'),p_user);
"
"
"
"
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"				     isthd_doc_no,
"
"				     isthd_plnt,
"
"				     isthd_plnt_loc_id,
"
"				     isthd_plnt_loc_name,
"
"				     isthd_doc_oper,
"
"				     isthd_issuefm_store_id,
"
"				     isthd_issueto_type,
"
"				     isthd_issueto_id,
"
"				     isthd_issueto_plnt,
"
"				     isthd_issueto_plnt_loc_id,
"
"				     isthd_trans_date,
"
"				     isthd_year,
"
"				     isthd_period,
"
"				     isthd_status,
"
"				     isthd_reference,
"
"				     isthd_issuer_id,
"
"				     isthd_issuer_name,
"
"				     isthd_issuer_pos_id,
"
"				     isthd_issuer_pos_name,
"
"				     isthd_vou_type,
"
"				     isthd_cre_by,
"
"				     isthd_cre_emp_id,
"
"				     isthd_cre_ip_addr,
"
"				     isthd_cre_os_user,
"
"				     isthd_cre_date,
"
"				     isthd_vou_oper,
"
"				     isthd_doc_pfx
"
"				    )
"
"			      VALUES(p_bu,
"
"				     v_mi_doc_no,
"
"				     cr1.cmthd_plnt,
"
"				     cr1.cmthd_plnt_loc_id,
"
"				     cr1.cmthd_plnt_loc_name,
"
"				     'T',
"
"				     v_insp_store_id,
"
"				     'S',
"
"				     cr1.cmtln_store_id,
"
"				     cr1.cmthd_plnt,
"
"				     cr1.cmthd_plnt_loc_id,
"
"				     cr1.cmthd_doc_date,
"
"				     func_find_year(p_bu,cr1.cmthd_doc_date),
"
"				     func_find_period(p_bu,cr1.cmthd_doc_date),
"
"				     'N',
"
"				     'MIV '||v_mi_doc_no||' FROM CMR '||p_doc_no,
"
"				     v_issuer_id,
"
"				     v_issuer_name,
"
"				     v_issuer_pos_id,
"
"				     v_issuer_pos_name,
"
"				     'CMR',
"
"				     p_user,
"
"				     p_user_emp,
"
"				     v_ip_addr,
"
"				     v_os_user,
"
"				     SYSDATE,
"
"				     cr1.Matl_Type,
"
"				     v_mi_doc_pfx
"
"				    );
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.Matl_Type,cr1.cmtln_store_id)
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"	v_sub_seq_no := 0;
"
"
"
"	v_rcpt_unitcost := cr2.cmtln_unit_cost * cr2.cmtln_conv_factor;
"
"
"
"	INSERT INTO inv_stock_trans_ln(istln_bu,
"
"				       istln_doc_no,
"
"				       istln_seq_no,
"
"				       istln_mat_type,
"
"				       istln_prod_id,
"
"				       istln_prod_rev,
"
"				       istln_uom,
"
"				       istln_prod_uom,
"
"				       istln_conv_factor,
"
"				       istln_prod_cls,
"
"				       istln_trans_qty,
"
"				       istln_stk_trans_qty,
"
"				       istln_unit_cost,
"
"				       istln_reference,
"
"				       istln_status,
"
"				       istln_vou_type,
"
"				       istln_vou_no,
"
"				       istln_vou_seq_no,
"
"				       istln_cre_by,
"
"				       istln_cre_emp_id,
"
"				       istln_cre_ip_addr,
"
"				       istln_cre_os_user,
"
"				       istln_cre_date,
"
"				       istln_store_id,
"
"				       istln_rcpt_store_id,
"
"				       istln_so_schld_desc,
"
"				       istln_type,
"
"				       istln_so_no,
"
"				       istln_so_seq_no,
"
"				       istln_proj_id,
"
"				       istln_task_id
"
"				      )
"
"			        VALUES(p_bu,
"
"				       v_mi_doc_no,
"
"				       v_seq_no,
"
"				       'S',
"
"				       cr2.cmtln_prod_id,
"
"				       cr2.cmtln_prod_rev,
"
"				       cr2.cmtln_prod_uom,
"
"				       cr2.cmtln_prod_uom,
"
"				       cr2.cmtln_conv_factor,
"
"				       cr2.prod_cls,
"
"				       cr2.Trans_Qty,
"
"				       cr2.Stk_Trans_Qty,
"
"				       v_rcpt_unitcost,
"
"				       'MIV '||v_mi_doc_no||'/'||v_seq_no||' FROM CMR '||p_doc_no||'/'||cr2.cmtln_seq_no,
"
"				       'N',
"
"				       'CMR',
"
"				       p_doc_no,
"
"				       cr2.cmtln_seq_no,
"
"				       p_user,
"
"				       p_user_emp,
"
"				       v_ip_addr,
"
"				       v_os_user,
"
"				       SYSDATE,
"
"				       v_insp_store_id,
"
"				       cr1.cmtln_store_id,
"
"				       cr2.cmtln_so_schld_desc,
"
"				       cr2.cmtln_so_type,
"
"				       cr2.cmtln_so_ord_no,
"
"				       cr2.cmtln_so_seq_no,
"
"				       cr2.cmtln_proj_id,
"
"				       cr2.cmtln_task_id
"
"                           	      );
"
"
"
"        IF cr2.cmtln_sf_code IS NULL THEN
"
"
"
"	  proc_upd_stocks(p_bu,
"
"	                  v_insp_store_id,
"
"	                  NULL,
"
"	                  cr2.cmtln_prod_id,
"
"	                  cr2.cmtln_prod_rev,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  cr2.Stk_Trans_Qty,
"
"	                  v_rcpt_unitcost,
"
"	                  v_rcpt_unitcost,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  cr2.cmtln_seq_no,
"
"	                  0,
"
"	                  NULL,
"
"	                  p_doc_no,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  func_find_year(p_bu,cr1.cmthd_doc_date),
"
"	                  func_find_period(p_bu,cr1.cmthd_doc_date),
"
"	                  cr1.cmthd_doc_date,
"
"	                  NULL,
"
"	                  'POM',
"
"	                  'GRN',
"
"	                  NULL,
"
"	                  p_user,
"
"	                  SYSDATE,
"
"	                  NULL,
"
"	                  cr2.prod_cls,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  0,
"
"		          p_prod_cls_desc => cr2.prod_cls_desc,
"
"		          p_prod_sub_cls_id => cr2.prod_sub_cls,
"
"		          p_prod_sub_cls_desc => cr2.prod_sub_cls_desc,
"
"		          p_prod_grp_id => cr2.prod_grp,
"
"		          p_prod_grp_desc => cr2.prod_grp_desc,
"
"		          p_prod_sub_grp_id => cr2.prod_sub_grp,
"
"		          p_prod_sub_grp_desc => cr2.prod_sub_grp_desc/*,
"
"		          p_prod_cls_type => cr2.prod_cls_type*/
"
"	                 );
"
"
"
"	    IF cr2.cmtln_so_schld_desc IS NOT NULL THEN
"
"
"
"	        proc_upd_so_stocks(p_bu,
"
"	    	  	           v_insp_store_id,
"
"	    	  	           cr2.cmtln_prod_id,
"
"	    	  	           cr2.cmtln_prod_rev,
"
"	    	  	           0,
"
"	    	  	           cr2.Stk_Trans_Qty,
"
"	    	  	           v_rcpt_unitcost,
"
"	    	  	           cr2.cmtln_so_ord_pfx,
"
"	    	  	           cr2.cmtln_so_ord_no,
"
"	    	  	           cr2.cmtln_so_seq_no,
"
"	    	  	           NULL,
"
"	    	  	           cr1.cmthd_doc_date,
"
"	    	  	           'CMR',
"
"	    	  	           NULL,
"
"	    	  	           p_doc_no,
"
"	    	  	           NULL,
"
"	    	  	           NULL,
"
"	    	  	           p_doc_no,
"
"	    	  	           cr2.cmtln_seq_no,
"
"	    	  	           'GRN',
"
"	    	  	           'POM',
"
"	    	  	           'MIV FROM CMR',
"
"	    	  	           'MIV FROM CMR',
"
"	    	  	           p_user,
"
"	    	  	           cr2.cmtln_so_type,
"
"	    	  	           cr2.cmtln_proj_id,
"
"	    	  	           cr2.cmtln_task_id,
"
"			           p_so_prj_schld_desc => cr2.cmtln_so_schld_desc
"
"	    	  	           );
"
"
"
"            END IF;
"
"
"
"	IF cr2.prod_ser_lot_opt = 'N' THEN
"
"	-- raise_application_error(-20999,'HRM '||'-'||v_rcpt_unitcost);
"
"	  proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user,p_unit_cost => v_rcpt_unitcost);
"
"
"
"	  IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	    v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	   BEGIN
"
"
"
"	    SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	      FROM stocks_batches
"
"	     WHERE sb_bu = p_bu
"
"	       AND sb_store_id = v_insp_store_id
"
"	       AND sb_prod_id = cr2.cmtln_prod_id
"
"	       AND sb_prod_rev = cr2.cmtln_prod_rev
"
"	       AND sb_po_no = p_doc_no
"
"	       AND sb_receipt_seq_no = cr2.cmtln_seq_no;
"
"
"
"	  --raise_application_error(-20999,'HRM MI COST BATCH'||v_stk_batch_no);
"
"	    INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						   istcb_doc_no,
"
"						   istcb_seq_no,
"
"						   istcb_sub_seq_no,
"
"						   istcb_batch_no,
"
"						   istcb_trans_qty,
"
"						   istcb_stk_trans_qty,
"
"						   istcb_unit_cost,
"
"						   istcb_cre_by,
"
"						   istcb_cre_emp_id,
"
"						   istcb_cre_ip_addr,
"
"						   istcb_cre_os_user,
"
"						   istcb_cre_date,
"
"						   istcb_ins_rec
"
"						  )
"
"                                            VALUES(p_bu,
"
"					           v_mi_doc_no,
"
"					           v_seq_no,
"
"					           v_sub_seq_no,
"
"					           v_stk_batch_no,
"
"					           cr2.Trans_Qty,
"
"					           cr2.Stk_Trans_Qty,
"
"					           v_rcpt_unitcost,
"
"					           p_user,
"
"						   p_user_emp,
"
"						   v_ip_addr,
"
"						   v_os_user,
"
"					           SYSDATE,
"
"					           'Y'
"
"					          );
"
"	EXCEPTION
"
"	WHEN OTHERS THEN Raise_Application_Error(-20999,'HRM '||v_insp_store_id||'/'||cr2.cmtln_prod_id);
"
"        END;
"
"	  END IF;
"
"
"
"	ELSE
"
"
"
"	  FOR r_ls IN (SELECT cmld_seq_no,cmld_sys_ls_no,cmld_lot_no,cmld_ser_no,cmld_source_type,cmld_source_id,cmld_expiry_date,
"
"			      cmld_accept_qty LS_Trans_Qty,cmld_accept_qty LS_Stk_Trans_Qty
"
"	                 FROM cust_mat_lot_dtls
"
"			WHERE cmld_bu = p_bu
"
"			  AND cmld_plnt = p_plnt
"
"			  AND cmld_doc_no = p_doc_no
"
"			  AND cmld_seq_no = cr2.cmtln_seq_no
"
"			  AND cmld_accept_qty > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"		       UNION ALL
"
"		       SELECT cmld_seq_no,cmld_sys_ls_no,cmld_lot_no,cmld_ser_no,cmld_source_type,cmld_source_id,cmld_expiry_date,
"
"	                      cmld_reject_qty LS_Trans_Qty,cmld_reject_qty LS_Stk_Trans_Qty
"
"	                 FROM cust_mat_lot_dtls
"
"			WHERE cmld_bu = p_bu
"
"			  AND cmld_plnt = p_plnt
"
"			  AND cmld_doc_no = p_doc_no
"
"			  AND cmld_seq_no = cr2.cmtln_seq_no
"
"			  AND cmld_reject_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			ORDER BY cmld_seq_no)
"
"	  LOOP
"
"	  --raise_application_error(-20999,'HRM MI COST'||v_rcpt_unitcost);
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.cmld_sys_ls_no,r_ls.cmld_lot_no,r_ls.cmld_ser_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.cmld_source_type,r_ls.cmld_source_id,NULL,NULL,p_user,p_unit_cost =>v_rcpt_unitcost);
"
"
"
"	    proc_upd_lot_ser_stocks(p_bu,
"
"                                    v_insp_store_id,
"
"                                    cr2.cmtln_prod_id,
"
"                                    cr2.cmtln_prod_rev,
"
"                                    r_ls.cmld_sys_ls_no,
"
"                                    0,
"
"                                    r_ls.LS_Stk_Trans_Qty,
"
"                                    0,
"
"                                    v_rcpt_unitcost,
"
"				    cr2.prod_ser_lot_opt,
"
"                                    r_ls.cmld_lot_no,
"
"                                    r_ls.cmld_ser_no,
"
"                                    r_ls.cmld_source_type,
"
"                                    r_ls.cmld_source_id,
"
"                                    CASE WHEN cr2.prod_expr_flag = 'Y' THEN r_ls.cmld_expiry_date ELSE NULL END,
"
"                                    TRUNC(cr1.cmthd_doc_date),
"
"                                    'CMR',
"
"                                    NULL,
"
"                                    p_doc_no,
"
"                                    cr2.cmtln_seq_no,
"
"                                    'ICM',
"
"                                    'CMR Allocation',
"
"                                    'CMR LS Allocation',
"
"                                    p_user
"
"                                   );
"
"
"
"	    IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	      v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	      SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	        FROM stocks_batches
"
"	       WHERE sb_bu = p_bu
"
"	         AND sb_store_id = v_insp_store_id
"
"	         AND sb_prod_id = cr2.cmtln_prod_id
"
"	         AND sb_prod_rev = cr2.cmtln_prod_rev
"
"	         AND sb_po_no = p_doc_no
"
"	         AND sb_receipt_seq_no = cr2.cmtln_seq_no;
"
"
"
"	      INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						     istcb_doc_no,
"
"						     istcb_seq_no,
"
"						     istcb_sub_seq_no,
"
"						     istcb_batch_no,
"
"						     istcb_trans_qty,
"
"						     istcb_stk_trans_qty,
"
"						     istcb_unit_cost,
"
"						     istcb_cre_by,
"
"						     istcb_cre_date,
"
"						     istcb_ins_rec,
"
"						     istcb_sys_ls_no
"
"						    )
"
"                                              VALUES(p_bu,
"
"					             v_mi_doc_no,
"
"					             v_seq_no,
"
"					             v_sub_seq_no,
"
"					             v_stk_batch_no,
"
"					             r_ls.LS_Trans_Qty,
"
"					             r_ls.LS_Stk_Trans_Qty,
"
"					             v_rcpt_unitcost,
"
"					             p_user,
"
"					             SYSDATE,
"
"					             'Y',
"
"					             r_ls.cmld_sys_ls_no
"
"					            );
"
"	    END IF;
"
"
"
"	  END LOOP;
"
"
"
"	END IF;
"
"	ELSE
"
"	  NULL;
"
"	  /*IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,p_user);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.porl_prod_ord_no,
"
"                               NULL,
"
"                               cr2.porl_tar_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.porl_prod_id,
"
"                               cr2.porl_prod_rev,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               cr2.Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.porh_plnt,
"
"                               cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.porl_so_pfx,
"
"                               cr2.porl_so_no,
"
"                               cr2.porl_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.porl_receipt_no,
"
"                               cr2.porl_seq_no,
"
"                               cr2.porl_seq_no,
"
"                               TRUNC(cr1.porh_receipt_date),
"
"                               cr1.porh_year,
"
"                               cr1.porh_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.porl_cls_id,
"
"                               cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               cr2.porl_sc_unit_cost,
"
"                               cr2.porl_sc_unit_cost * cr2.porh_exchange_rate,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.porl_so_type,
"
"                               p_proj => cr2.porl_proj_id,
"
"                               p_task => cr2.porl_task_id,
"
"		               p_prod_cls_desc => cr2.porl_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.porl_sub_cls_id,
"
"		               p_prod_sub_cls_desc => cr2.porl_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.porl_prod_grp,
"
"		               p_prod_grp_desc => cr2.porl_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.porl_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.porl_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr2.porl_prod_id,cr2.porl_prod_rev)
"
"                              );
"
"
"
"	ELSE
"
"
"
"	  FOR r_ls IN (SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,
"
"			      (prcls_qty_accepted + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_aod_qty ELSE 0 END) LS_Trans_Qty,
"
"			      (prcls_stk_acpt_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_stk_aod_qty ELSE 0 END) LS_Stk_Trans_Qty
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND (prcls_qty_accepted + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN prcls_aod_qty ELSE 0 END) > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"			  AND prcls_apply_type = 'R'
"
"		       UNION ALL
"
"		       SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,
"
"			      prcls_aod_qty LS_Trans_Qty,
"
"			      prcls_stk_aod_qty LS_Stk_Trans_Qty
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND prcls_aod_qty > 0
"
"			  AND cr1.Matl_Type = 'D' AND cr2.pomctrl_aod_rqrd_flag = 'Y'
"
"			  AND prcls_apply_type = 'R'
"
"		       UNION ALL
"
"		       SELECT prcls_seq_no,prcls_sys_ls_no,prcls_lot_no,prcls_serial_no,prcls_sou_type,prcls_sou_id,prcls_expiry_date,
"
"	                      prcls_org_lot_no,prcls_mix_lot_no,prcls_no_of_coils,prcls_qty_rejected LS_Trans_Qty,
"
"			      prcls_stk_rej_qty LS_Stk_Trans_Qty
"
"	                 FROM pur_rcpt_lot_serial
"
"			WHERE prcls_bu = p_bu
"
"			  AND prcls_doc_no = p_rcpt_no
"
"			  AND prcls_doc_seq_no = cr2.porl_seq_no
"
"			  AND prcls_stk_rej_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			  AND prcls_apply_type = 'R'
"
"			ORDER BY prcls_seq_no)
"
"	  LOOP
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.prcls_sys_ls_no,r_ls.prcls_lot_no,r_ls.prcls_serial_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.prcls_sou_type,r_ls.prcls_sou_id,NULL,p_user);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.porl_prod_ord_no,
"
"                               NULL,
"
"                               cr2.porl_tar_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.porl_prod_id,
"
"                               cr2.porl_prod_rev,
"
"                               r_ls.prcls_sys_ls_no,
"
"                               r_ls.prcls_lot_no,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               r_ls.LS_Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.porh_plnt,
"
"                               cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.porl_so_pfx,
"
"                               cr2.porl_so_no,
"
"                               cr2.porl_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.porl_receipt_no,
"
"                               cr2.porl_seq_no,
"
"                               cr2.porl_seq_no,
"
"                               TRUNC(cr1.porh_receipt_date),
"
"                               cr1.porh_year,
"
"                               cr1.porh_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.porl_cls_id,
"
"                               cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               cr2.porl_sc_unit_cost,
"
"                               cr2.porl_sc_unit_cost * cr2.porh_exchange_rate,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.porl_so_type,
"
"                               p_proj => cr2.porl_proj_id,
"
"                               p_task => cr2.porl_task_id,
"
"		               p_prod_cls_desc => cr2.porl_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.porl_sub_cls_id,
"
"		               p_prod_sub_cls_desc => cr2.porl_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.porl_prod_grp,
"
"		               p_prod_grp_desc => cr2.porl_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.porl_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.porl_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.porh_plnt,cr2.porl_prod_id,cr2.porl_prod_rev)
"
"                              );
"
"
"
"	  END LOOP;
"
"
"
"	END IF;*/
"
"	END IF;
"
"
"
"      END LOOP c2;
"
"
"
"      proc_issue_mat_frm_mi(p_bu,cr1.cmthd_plnt,v_mi_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      /*BEGIN
"
"        SELECT icmctrl_auto_mtr_flag INTO v_mrv_cre_flag
"
"	  FROM icm_control
"
"	 WHERE icmctrl_bu = p_bu;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"	  Raise_Application_Error(-20999,'HRM ');
"
"      END;
"
"
"
"      IF v_mrv_cre_flag = 'Y' THEN
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'N',
"
"	       istlnh_sel_user = NULL
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_sel_flag = 'Y'
"
"	   AND istlnh_sel_user = p_user;
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'Y',
"
"	       istlnh_sel_user = p_user,
"
"	       istlnh_proc_qty = istlnh_trans_qty
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_doc_no = v_mi_doc_no;
"
"
"
"        pkg_mat_rcpt.proc_cre_mrv_frm_miv(p_bu,TRUNC(SYSDATE),p_user,v_mr_doc_no);
"
"
"
"      END IF;*/
"
"
"
"    END LOOP c1;
"
"
"
"    IF v_mi_doc_no IS NOT NULL THEN
"
"      p_mi_doc_no := func_find_order_no_substr(v_mi_doc_no);
"
"    END IF;
"
"  END proc_cre_miv_doc_frm_cmr;
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_mat_rtn(p_bu			VARCHAR2,
"
"				         p_plnt			VARCHAR2,
"
"				         p_doc_no		VARCHAR2,
"
"				         p_user			VARCHAR2,
"
"				         p_user_emp		VARCHAR2,
"
"				         p_lang			NUMBER,
"
"				         p_mi_doc_no	OUT	VARCHAR2
"
"				        )
"
"  AS
"
"
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT 1 Seq_no,'A' Matl_Type,ssthd_plnt,ssthd_plnt_loc_id,ssthd_plnt_loc_name,ssthd_date,ssthd_year,ssthd_period,ssthd_to_store_id
"
"    FROM store_stock_trans_hd,store_stock_trans_ln,products
"
"   WHERE ssthd_bu = sstln_bu
"
"     AND ssthd_doc_no = sstln_doc_no
"
"     AND prod_bu = sstln_bu
"
"     AND prod_id = sstln_prod_id
"
"     AND prod_rev = sstln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND sstln_status <> 'C'
"
"     AND ssthd_bu = p_bu
"
"     AND ssthd_doc_no = p_doc_no
"
"     AND sstln_accepted_qty > 0
"
"  UNION ALL
"
"  SELECT DISTINCT 3 Seq_no,'R' Matl_Type,ssthd_plnt,ssthd_plnt_loc_id,ssthd_plnt_loc_name,ssthd_date,ssthd_year,ssthd_period,
"
"         (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = ssthd_bu
"
"	     AND ppl_plnt = ssthd_plnt
"
"	     AND ppl_prod_id = sstln_prod_id
"
"	     AND ppl_prod_rev = sstln_prod_rev
"
"	     AND ppl_plnt_loc_id = ssthd_plnt_loc_id) ssthd_to_store_id
"
"    FROM store_stock_trans_hd,store_stock_trans_ln,products
"
"   WHERE ssthd_bu = sstln_bu
"
"     AND ssthd_doc_no = sstln_doc_no
"
"     AND prod_bu = sstln_bu
"
"     AND prod_id = sstln_prod_id
"
"     AND prod_rev = sstln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND sstln_status <> 'C'
"
"     AND ssthd_bu = p_bu
"
"     AND ssthd_doc_no = p_doc_no
"
"     AND sstln_rejected_qty > 0;
"
"
"
"  CURSOR c2(c_matl_type	VARCHAR2,
"
"            c_store_id	VARCHAR2) IS
"
"  SELECT ssthd_plnt,ssthd_date,ssthd_year,ssthd_period,sstln_seq_no,sstln_prod_id,sstln_prod_rev,prod_desc11,sstln_uom,sstln_prod_uom,sstln_conv_factor,
"
"         prod_ser_lot_opt,prod_cost_method,prod_expr_flag,prodplnt_cls,sstln_prod_cls_desc,sstln_prod_sub_cls,sstln_prod_subcls_desc,
"
"	 sstln_prod_grp,sstln_prod_grp_desc,sstln_prod_subgrp,sstln_prod_subgrp_desc,
"
"         sstln_so_type,sstln_so_order_pfx,sstln_so_ord_no,sstln_so_line_no,sstln_proj_id,sstln_task_id,
"
"         sstln_accepted_qty Trans_Qty,sstln_accepted_qty Stk_Trans_Qty,sstln_unit_cost,sstln_sf_code,sstln_po_ord_no,sstln_so_schld_desc,
"
"	 sstln_oprn_ln_seq_no,sstln_process_id
"
"    FROM store_stock_trans_hd,store_stock_trans_ln,products,prod_plants
"
"   WHERE ssthd_bu = sstln_bu
"
"     AND ssthd_doc_no = sstln_doc_no
"
"     AND prod_bu = sstln_bu
"
"     AND prod_id = sstln_prod_id
"
"     AND prod_rev = sstln_prod_rev
"
"     AND prodplnt_bu = sstln_bu
"
"     AND prodplnt_plnt = ssthd_plnt
"
"     AND prodplnt_prod_id = sstln_prod_id
"
"     AND prodplnt_prod_rev = sstln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND sstln_status <> 'C'
"
"     AND ssthd_bu = p_bu
"
"     AND ssthd_doc_no = p_doc_no
"
"     AND ssthd_to_store_id = c_store_id
"
"     AND c_matl_type = 'A'
"
"     AND sstln_accepted_qty > 0
"
"  UNION ALL
"
"  SELECT ssthd_plnt,ssthd_date,ssthd_year,ssthd_period,sstln_seq_no,sstln_prod_id,sstln_prod_rev,prod_desc11,sstln_uom,sstln_prod_uom,sstln_conv_factor,
"
"         prod_ser_lot_opt,prod_cost_method,prod_expr_flag,prodplnt_cls,sstln_prod_cls_desc,sstln_prod_sub_cls,sstln_prod_subcls_desc,
"
"	 sstln_prod_grp,sstln_prod_grp_desc,sstln_prod_subgrp,sstln_prod_subgrp_desc,
"
"         sstln_so_type,sstln_so_order_pfx,sstln_so_ord_no,sstln_so_line_no,sstln_proj_id,sstln_task_id,
"
"         sstln_rejected_qty Trans_Qty,sstln_rejected_qty Stk_Trans_Qty,sstln_unit_cost,sstln_sf_code,sstln_po_ord_no,sstln_so_schld_desc,
"
"	 sstln_oprn_ln_seq_no,sstln_process_id
"
"    FROM store_stock_trans_hd,store_stock_trans_ln,products,prod_plants
"
"   WHERE ssthd_bu = sstln_bu
"
"     AND ssthd_doc_no = sstln_doc_no
"
"     AND prod_bu = sstln_bu
"
"     AND prod_id = sstln_prod_id
"
"     AND prod_rev = sstln_prod_rev
"
"     AND prodplnt_bu = sstln_bu
"
"     AND prodplnt_plnt = ssthd_plnt
"
"     AND prodplnt_prod_id = sstln_prod_id
"
"     AND prodplnt_prod_rev = sstln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     AND sstln_status <> 'C'
"
"     AND ssthd_bu = p_bu
"
"     AND ssthd_doc_no = p_doc_no
"
"     AND (SELECT ppl_rejt_store_id
"
"	    FROM prod_plants_loc
"
"	   WHERE ppl_bu = ssthd_bu
"
"	     AND ppl_plnt = ssthd_plnt
"
"	     AND ppl_prod_id = sstln_prod_id
"
"	     AND ppl_prod_rev = sstln_prod_rev
"
"	     AND ppl_plnt_loc_id = ssthd_plnt_loc_id) = c_store_id
"
"     AND c_matl_type = 'R'
"
"     AND sstln_rejected_qty > 0
"
"   ORDER BY sstln_seq_no;
"
"
"
"    v_insp_store_id	stores.store_id%TYPE;
"
"    v_mi_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE;
"
"    v_mi_doc_pfx        inv_stock_trans_hd.isthd_doc_pfx%TYPE;
"
"    v_issuer_id		inv_stock_trans_hd.isthd_issuer_id%TYPE;
"
"    v_issuer_name	inv_stock_trans_hd.isthd_issuer_name%TYPE;
"
"    v_issuer_pos_id	inv_stock_trans_hd.isthd_issuer_pos_id%TYPE;
"
"    v_issuer_pos_name	inv_stock_trans_hd.isthd_issuer_pos_name%TYPE;
"
"    dummy1		VARCHAR2(100);
"
"    dummy2		VARCHAR2(100);
"
"
"
"    v_seq_no		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"    v_roll_seq_no	NUMBER;
"
"
"
"    v_rcpt_unitcost	NUMBER;
"
"
"
"    v_stk_batch_no	stocks_batches.sb_batch_id%TYPE;
"
"    v_dc_no		VARCHAR2(100);
"
"    v_pack_no		VARCHAR2(100);
"
"    v_mr_doc_no		VARCHAR2(100);
"
"
"
"    v_mrv_cre_flag	VARCHAR2(1);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"    TYPE typ_miv IS RECORD(miv_doc_no	VARCHAR2(30));
"
"    TYPE typ_miv_dtls IS TABLE OF typ_miv INDEX BY PLS_INTEGER;
"
"    r_miv	typ_miv_dtls;
"
"    v_index	NUMBER := 0;
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_issuer_id,v_issuer_name,v_issuer_pos_id,v_issuer_pos_name,dummy1,dummy2,p_lang);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_insp_store_id := func_find_store_fr_type(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'Q');
"
"
"
"      IF cr1.ssthd_to_store_id IS NULL AND cr1.Matl_Type = 'R' THEN
"
"        Raise_Application_Error(-20032,'ICM ');
"
"      END IF;
"
"
"
"      --v_mi_doc_no := func_find_icm_next_id(p_bu,cr1.porh_receipt_date,'MI',v_insp_store_id,p_user);
"
"      v_mi_doc_pfx := func_find_vou_dflt_pfx(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'MIV','MIV');
"
"      v_mi_doc_no := func_find_pfx_nextno(p_bu,cr1.ssthd_date,func_find_vou_dflt_pfx(p_bu,cr1.ssthd_plnt,cr1.ssthd_plnt_loc_id,'MIV','MIV'),p_user);
"
"
"
"      v_index := v_index + 1;
"
"      r_miv(v_index).miv_doc_no := v_mi_doc_no;
"
"
"
"    -- RAISE_APPLICATION_ERROR(-20999,'HRM'||v_mi_doc_no);
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"				     isthd_doc_no,
"
"				     isthd_plnt,
"
"				     isthd_plnt_loc_id,
"
"				     isthd_plnt_loc_name,
"
"				     isthd_doc_oper,
"
"				     isthd_issuefm_store_id,
"
"				     isthd_issueto_type,
"
"				     isthd_issueto_id,
"
"				     isthd_issueto_plnt,
"
"				     isthd_issueto_plnt_loc_id,
"
"				     isthd_trans_date,
"
"				     isthd_year,
"
"				     isthd_period,
"
"				     isthd_status,
"
"				     isthd_reference,
"
"				     isthd_issuer_id,
"
"				     isthd_issuer_name,
"
"				     isthd_issuer_pos_id,
"
"				     isthd_issuer_pos_name,
"
"				     isthd_vou_type,
"
"				     isthd_cre_by,
"
"				     isthd_cre_emp_id,
"
"				     isthd_cre_ip_addr,
"
"				     isthd_cre_os_user,
"
"				     isthd_cre_date,
"
"				     isthd_vou_oper,
"
"				     isthd_doc_pfx
"
"				    )
"
"			      VALUES(p_bu,
"
"				     v_mi_doc_no,
"
"				     cr1.ssthd_plnt,
"
"				     cr1.ssthd_plnt_loc_id,
"
"				     cr1.ssthd_plnt_loc_name,
"
"				     'T',
"
"				     v_insp_store_id,
"
"				     'S',
"
"				     cr1.ssthd_to_store_id,
"
"				     cr1.ssthd_plnt,
"
"				     cr1.ssthd_plnt_loc_id,
"
"				     cr1.ssthd_date,
"
"				     cr1.ssthd_year,
"
"				     cr1.ssthd_period,
"
"				     'N',
"
"				     'MIV '||v_mi_doc_no||' FROM MTRN '||p_doc_no,
"
"				     v_issuer_id,
"
"				     v_issuer_name,
"
"				     v_issuer_pos_id,
"
"				     v_issuer_pos_name,
"
"				     'ME',
"
"				     p_user,
"
"				     v_emp_id,
"
"				     v_ip_addr,
"
"				     v_os_user,
"
"				     SYSDATE,
"
"				     cr1.Matl_Type,
"
"				     v_mi_doc_pfx
"
"				    );
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2(cr1.Matl_Type,cr1.ssthd_to_store_id)
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"	v_sub_seq_no := 0;
"
"
"
"	v_rcpt_unitcost := cr2.sstln_unit_cost;
"
"
"
"	INSERT INTO inv_stock_trans_ln(istln_bu,
"
"				       istln_doc_no,
"
"				       istln_seq_no,
"
"				       istln_mat_type,
"
"				       istln_prod_id,
"
"				       istln_prod_rev,
"
"				       istln_uom,
"
"				       istln_prod_uom,
"
"				       istln_conv_factor,
"
"				       istln_prod_cls,
"
"				       istln_po_ord_no,
"
"				       istln_sf_code,
"
"				       istln_trans_qty,
"
"				       istln_stk_trans_qty,
"
"				       istln_unit_cost,
"
"				       istln_reference,
"
"				       istln_status,
"
"				       istln_type,
"
"				       istln_so_pfx,
"
"				       istln_so_no,
"
"				       istln_so_seq_no,
"
"				       istln_proj_id,
"
"				       istln_task_id,
"
"				       istln_so_schld_desc,
"
"				       istln_grn_no,
"
"				       istln_grn_seq_no,
"
"				       istln_vou_type,
"
"				       istln_vou_no,
"
"				       istln_vou_seq_no,
"
"				       istln_cre_by,
"
"				       istln_cre_emp_id,
"
"				       istln_cre_ip_addr,
"
"				       istln_cre_os_user,
"
"				       istln_cre_date,
"
"				       istln_store_id,
"
"				       istln_rcpt_store_id,
"
"				       istln_sou_proc_id,
"
"				       istln_sou_oprn_seq
"
"				      )
"
"			        VALUES(p_bu,
"
"				       v_mi_doc_no,
"
"				       v_seq_no,
"
"				       CASE WHEN cr2.sstln_sf_code IS NOT NULL THEN 'F' ELSE 'S' END,
"
"				       cr2.sstln_prod_id,
"
"				       cr2.sstln_prod_rev,
"
"				       cr2.sstln_prod_uom,
"
"				       cr2.sstln_prod_uom,
"
"				       1,
"
"				       cr2.prodplnt_cls,
"
"				       cr2.sstln_po_ord_no,
"
"				       cr2.sstln_sf_code,
"
"				       cr2.Trans_Qty,
"
"				       cr2.Stk_Trans_Qty,
"
"				       v_rcpt_unitcost,
"
"				       'MIV '||v_mi_doc_no||'/'||v_seq_no||' FROM MTRN '||p_doc_no||'/'||cr2.sstln_seq_no,
"
"				       'N',
"
"				       cr2.sstln_so_type,
"
"				       cr2.sstln_so_order_pfx,
"
"				       cr2.sstln_so_ord_no,
"
"				       cr2.sstln_so_line_no,
"
"				       cr2.sstln_proj_id,
"
"				       cr2.sstln_task_id,
"
"				       cr2.sstln_so_schld_desc,
"
"				       p_doc_no,
"
"				       cr2.sstln_seq_no,
"
"				       'ME',
"
"				       p_doc_no,
"
"				       cr2.sstln_seq_no,
"
"				       p_user,
"
"				       v_emp_id,
"
"				       v_ip_addr,
"
"				       v_os_user,
"
"				       SYSDATE,
"
"				       v_insp_store_id,
"
"				       cr1.ssthd_to_store_id,
"
"				       cr2.sstln_process_id,
"
"				       cr2.sstln_oprn_ln_seq_no
"
"                           	      );
"
"
"
"        IF cr2.sstln_sf_code IS NULL THEN
"
"	proc_upd_stocks(p_bu,
"
"	                v_insp_store_id,
"
"	                NULL,
"
"	                cr2.sstln_prod_id,
"
"	                cr2.sstln_prod_rev,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                cr2.Stk_Trans_Qty,
"
"	                v_rcpt_unitcost,
"
"	                v_rcpt_unitcost,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                0,
"
"	                cr2.sstln_seq_no,
"
"	                0,
"
"	                NULL,
"
"	                p_doc_no,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                cr1.ssthd_year,
"
"	                cr1.ssthd_period,
"
"	                cr1.ssthd_date,
"
"	                NULL,
"
"	                'ICM',
"
"	                'ME',
"
"	                NULL,
"
"	                p_user,
"
"	                SYSDATE,
"
"	                NULL,
"
"	                cr2.prodplnt_cls,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                NULL,
"
"	                0,
"
"		        p_prod_cls_desc => cr2.sstln_prod_cls_desc,
"
"		        p_prod_sub_cls_id => cr2.sstln_prod_sub_cls,
"
"		        p_prod_sub_cls_desc => cr2.sstln_prod_subcls_desc,
"
"		        p_prod_grp_id => cr2.sstln_prod_grp,
"
"		        p_prod_grp_desc	=> cr2.sstln_prod_grp_desc,
"
"		        p_prod_sub_grp_id => cr2.sstln_prod_subgrp,
"
"		        p_prod_sub_grp_desc => cr2.sstln_prod_subgrp_desc/*,
"
"		        p_prod_cls_type => cr2.prod_cls_type*/
"
"	               );
"
"
"
"        IF cr2.sstln_so_schld_desc IS NOT NULL OR cr2.sstln_proj_id IS NOT NULL THEN
"
"	  proc_upd_so_stocks(p_bu,
"
"	    	  	     v_insp_store_id,
"
"	    	  	     cr2.sstln_prod_id,
"
"	    	  	     cr2.sstln_prod_rev,
"
"	    	  	     0,
"
"	    	  	     cr2.Stk_Trans_Qty,
"
"	    	  	     v_rcpt_unitcost,
"
"	    	  	     cr2.sstln_so_order_pfx,
"
"	    	  	     cr2.sstln_so_ord_no,
"
"	    	  	     cr2.sstln_so_line_no,
"
"	    	  	     NULL,
"
"	    	  	     cr1.ssthd_date,
"
"	    	  	     'QC',
"
"	    	  	     NULL,
"
"	    	  	     p_doc_no,
"
"	    	  	     NULL,
"
"	    	  	     NULL,
"
"	    	  	     p_doc_no,
"
"	    	  	     cr2.sstln_seq_no,
"
"	    	  	     'MTRN',
"
"	    	  	     'ICM',
"
"	    	  	     'MIV FROM MTRN',
"
"	    	  	     'MIV FROM MTRN',
"
"	    	  	     p_user,
"
"	    	  	     cr2.sstln_so_type,
"
"	    	  	     cr2.sstln_proj_id,
"
"	    	  	     cr2.sstln_task_id,
"
"			     p_so_prj_schld_desc => cr2.sstln_so_schld_desc
"
"	    	  	    );
"
"	END IF;
"
"
"
"	IF cr2.prod_ser_lot_opt = 'N' THEN
"
"	  --raise_application_error(-20999,'HRM ');
"
"	  proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user,p_unit_cost => cr2.sstln_unit_cost);--p_unit_cost =>v_rcpt_unitcost);
"
"
"
"	  IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	    v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	   BEGIN
"
"
"
"	    SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	      FROM stocks_batches
"
"	     WHERE sb_bu = p_bu
"
"	       AND sb_store_id = v_insp_store_id
"
"	       AND sb_prod_id = cr2.sstln_prod_id
"
"	       AND sb_prod_rev = cr2.sstln_prod_rev
"
"	       AND sb_po_no = p_doc_no
"
"	       AND sb_receipt_seq_no = cr2.sstln_seq_no;
"
"
"
"	  --raise_application_error(-20999,'HRM MI COST BATCH'||v_stk_batch_no);
"
"	    INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						   istcb_doc_no,
"
"						   istcb_seq_no,
"
"						   istcb_sub_seq_no,
"
"						   istcb_batch_no,
"
"						   istcb_trans_qty,
"
"						   istcb_stk_trans_qty,
"
"						   istcb_unit_cost,
"
"						   istcb_cre_by,
"
"						   istcb_cre_emp_id,
"
"						   istcb_cre_ip_addr,
"
"						   istcb_cre_os_user,
"
"						   istcb_cre_date,
"
"						   istcb_ins_rec
"
"						  )
"
"                                            VALUES(p_bu,
"
"					           v_mi_doc_no,
"
"					           v_seq_no,
"
"					           v_sub_seq_no,
"
"					           v_stk_batch_no,
"
"					           cr2.Trans_Qty,
"
"					           cr2.Stk_Trans_Qty,
"
"					           v_rcpt_unitcost,
"
"					           p_user,
"
"						   v_emp_id,
"
"						   v_ip_addr,
"
"						   v_os_user,
"
"					           SYSDATE,
"
"					           'Y'
"
"					          );
"
"	EXCEPTION
"
"	WHEN OTHERS THEN Raise_Application_Error(-20999,'HRM '||v_insp_store_id||'/'||cr2.sstln_prod_id);
"
"END;
"
"	  END IF;
"
"
"
"	ELSE
"
"
"
"	  FOR r_ls IN (SELECT sstd_sub_seq_no,sstd_sys_ls_no,sstd_lot_no,sstd_ser_no,sstd_source_type,sstd_source_id,sstd_expiry_date,
"
"			      sstd_accepted_qty LS_Trans_Qty,sstd_accepted_qty LS_Stk_Trans_Qty
"
"	                 FROM store_stock_trans_dtls
"
"			WHERE sstd_bu = p_bu
"
"			  AND sstd_doc_no = p_doc_no
"
"			  AND sstd_seq_no = cr2.sstln_seq_no
"
"			  AND sstd_accepted_qty > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"		       UNION ALL
"
"		       SELECT sstd_sub_seq_no,sstd_sys_ls_no,sstd_lot_no,sstd_ser_no,sstd_source_type,sstd_source_id,sstd_expiry_date,
"
"		              sstd_rejected_qty LS_Trans_Qty,sstd_rejected_qty LS_Stk_Trans_Qty
"
"	                 FROM store_stock_trans_dtls
"
"			WHERE sstd_bu = p_bu
"
"			  AND sstd_doc_no = p_doc_no
"
"			  AND sstd_seq_no = cr2.sstln_seq_no
"
"			  AND sstd_rejected_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			ORDER BY sstd_sub_seq_no)
"
"	  LOOP
"
"	  --raise_application_error(-20999,'HRM MI COST'||v_rcpt_unitcost);
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.sstd_sys_ls_no,r_ls.sstd_lot_no,r_ls.sstd_ser_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.sstd_source_type,r_ls.sstd_source_id,NULL,NULL,p_user,p_unit_cost =>v_rcpt_unitcost);
"
"
"
"	    proc_upd_lot_ser_stocks(p_bu,
"
"                                    v_insp_store_id,
"
"                                    cr2.sstln_prod_id,
"
"                                    cr2.sstln_prod_rev,
"
"                                    r_ls.sstd_sys_ls_no,
"
"                                    0,
"
"                                    r_ls.LS_Stk_Trans_Qty,
"
"                                    0,
"
"                                    v_rcpt_unitcost,
"
"				    cr2.prod_ser_lot_opt,
"
"                                    r_ls.sstd_lot_no,
"
"                                    r_ls.sstd_ser_no,
"
"                                    r_ls.sstd_source_type,
"
"                                    r_ls.sstd_source_id,
"
"                                    CASE WHEN cr2.prod_expr_flag = 'Y' THEN r_ls.sstd_expiry_date ELSE NULL END,
"
"                                    TRUNC(cr1.ssthd_date),
"
"                                    'ME',
"
"                                    NULL,
"
"                                    p_doc_no,
"
"                                    cr2.sstln_seq_no,
"
"                                    'ICM',
"
"                                    'MTRN LS',
"
"                                    'MTRN LS Allocation',
"
"                                    p_user
"
"                                   );
"
"
"
"            SELECT isbd_sub_seq_no INTO v_sub_seq_no
"
"	      FROM inv_stock_batch_details
"
"	     WHERE isbd_bu = p_bu
"
"	       AND isbd_issue_doc_no = v_mi_doc_no
"
"	       AND isbd_seq_no = v_seq_no
"
"	       AND isbd_sys_ls_no = r_ls.sstd_sys_ls_no;
"
"
"
"            SELECT NVL(MAX(istlrd_seq_no),0) INTO v_roll_seq_no
"
"              FROM inv_stock_trans_lot_roll_dtls
"
"             WHERE istlrd_bu = p_bu
"
"               AND istlrd_doc_no = v_mi_doc_no
"
"	       AND istlrd_doc_seq_no = v_seq_no
"
"	       AND istlrd_lot_seq_no = v_sub_seq_no;
"
"
"
"            FOR r_roll IN (SELECT *
"
"                             FROM store_stock_lot_roll_dtls
"
"            		    WHERE sslrd_bu = p_bu
"
"                              AND sslrd_doc_no = p_doc_no
"
"                              AND sslrd_doc_seq_no = cr2.sstln_seq_no
"
"                              AND sslrd_lot_seq_no = r_ls.sstd_sub_seq_no
"
"                              AND sslrd_sys_ls_no = r_ls.sstd_sys_ls_no
"
"			    ORDER BY sslrd_new_roll_no)
"
"            LOOP
"
"
"
"	      v_roll_seq_no := v_roll_seq_no + 1;
"
"
"
"	      INSERT INTO inv_stock_trans_lot_roll_dtls(istlrd_bu,
"
"							istlrd_doc_no,
"
"							istlrd_doc_seq_no,
"
"							istlrd_lot_seq_no,
"
"							istlrd_seq_no,
"
"							istlrd_sys_ls_no,
"
"							istlrd_lot_no,
"
"							istlrd_roll_no,
"
"							istlrd_roll_qty,
"
"							istlrd_cre_by,
"
"							istlrd_cre_emp_id,
"
"							istlrd_cre_ip_addr,
"
"							istlrd_cre_os_user,
"
"							istlrd_cre_date
"
"						       )
"
"	                                         VALUES(p_bu,
"
"						        v_mi_doc_no,
"
"							v_seq_no,
"
"							v_sub_seq_no,
"
"							v_roll_seq_no,
"
"							r_ls.sstd_sys_ls_no,
"
"							r_ls.sstd_lot_no,
"
"							r_roll.sslrd_new_roll_no,
"
"							r_roll.sslrd_roll_qty,
"
"							p_user,
"
"						        v_emp_id,
"
"						        v_ip_addr,
"
"						        v_os_user,
"
"							SYSDATE
"
"						       );
"
"
"
"              proc_upd_lot_roll_stocks(p_bu,
"
"                                       v_insp_store_id,
"
"                                       cr2.sstln_prod_id,
"
"                                       cr2.sstln_prod_rev,
"
"                                       r_ls.sstd_sys_ls_no,
"
"            			       r_roll.sslrd_new_roll_no,
"
"            			       0,
"
"            			       0,
"
"            			       r_roll.sslrd_roll_qty,
"
"            			       0,
"
"            			       'MI',
"
"            			       TRUNC(cr1.ssthd_date),
"
"            			       v_mi_doc_no,
"
"            			       v_seq_no,
"
"            			       p_user
"
"            			      );
"
"            END LOOP;
"
"
"
"	    IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	      v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	      SELECT MAX(sb_batch_id) INTO v_stk_batch_no
"
"	        FROM stocks_batches
"
"	       WHERE sb_bu = p_bu
"
"	         AND sb_store_id = v_insp_store_id
"
"	         AND sb_prod_id = cr2.sstln_prod_id
"
"	         AND sb_prod_rev = cr2.sstln_prod_rev
"
"	         AND sb_po_no = p_doc_no
"
"	         AND sb_receipt_seq_no = cr2.sstln_seq_no
"
"		 AND sb_sys_ls_no = r_ls.sstd_sys_ls_no;
"
"
"
"	      INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						     istcb_doc_no,
"
"						     istcb_seq_no,
"
"						     istcb_sub_seq_no,
"
"						     istcb_batch_no,
"
"						     istcb_trans_qty,
"
"						     istcb_stk_trans_qty,
"
"						     istcb_unit_cost,
"
"						     istcb_cre_by,
"
"						     istcb_cre_date,
"
"						     istcb_ins_rec,
"
"						     istcb_sys_ls_no
"
"						    )
"
"                                              VALUES(p_bu,
"
"					             v_mi_doc_no,
"
"					             v_seq_no,
"
"					             v_sub_seq_no,
"
"					             v_stk_batch_no,
"
"					             r_ls.LS_Trans_Qty,
"
"					             r_ls.LS_Stk_Trans_Qty,
"
"					             v_rcpt_unitcost,
"
"					             p_user,
"
"					             SYSDATE,
"
"					             'Y',
"
"					             r_ls.sstd_sys_ls_no
"
"					            );
"
"	    END IF;
"
"
"
"	  END LOOP;
"
"
"
"	END IF;
"
"	ELSE
"
"
"
"	  IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user,cr2.sstln_unit_cost);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.sstln_po_ord_no,
"
"                               NULL,
"
"                               cr2.sstln_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.sstln_prod_id,
"
"                               cr2.sstln_prod_rev,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               cr2.Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.ssthd_plnt,
"
"                               NULL,
"
"                               'V',
"
"                               cr2.sstln_so_order_pfx,
"
"                               cr2.sstln_so_ord_no,
"
"                               cr2.sstln_so_line_no,
"
"                               NULL,
"
"                               NULL,
"
"                               p_doc_no,
"
"                               NULL,
"
"                               p_doc_no,
"
"                               cr2.sstln_seq_no,
"
"                               cr2.sstln_seq_no,
"
"                               TRUNC(cr1.ssthd_date),
"
"                               cr1.ssthd_year,
"
"                               cr1.ssthd_period,
"
"                               cr2.prod_cost_method,
"
"                               'ME',
"
"                               'ICM',
"
"                               cr2.prodplnt_cls,
"
"                               'Material Return',
"
"                               'Material Return',
"
"                               cr2.sstln_unit_cost,
"
"                               cr2.sstln_unit_cost,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.sstln_so_type,
"
"                               p_proj => cr2.sstln_proj_id,
"
"                               p_task => cr2.sstln_task_id,
"
"		               p_prod_cls_desc => cr2.sstln_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.sstln_prod_sub_cls,
"
"		               p_prod_sub_cls_desc => cr2.sstln_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.sstln_prod_grp,
"
"		               p_prod_grp_desc => cr2.sstln_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.sstln_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.sstln_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.ssthd_plnt,cr2.sstln_prod_id,cr2.sstln_prod_rev),
"
"			       p_so_schld_desc => cr2.sstln_so_schld_desc
"
"                              );
"
"
"
"	ELSE
"
"
"
"	  FOR r_ls IN (SELECT sstd_sub_seq_no,sstd_sys_ls_no,sstd_lot_no,sstd_ser_no,sstd_source_type,sstd_source_id,sstd_expiry_date,
"
"			      sstd_accepted_qty LS_Trans_Qty,sstd_accepted_qty LS_Stk_Trans_Qty
"
"	                 FROM store_stock_trans_dtls
"
"			WHERE sstd_bu = p_bu
"
"			  AND sstd_doc_no = p_doc_no
"
"			  AND sstd_seq_no = cr2.sstln_seq_no
"
"			  AND sstd_accepted_qty > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"		       UNION ALL
"
"		       SELECT sstd_sub_seq_no,sstd_sys_ls_no,sstd_lot_no,sstd_ser_no,sstd_source_type,sstd_source_id,sstd_expiry_date,
"
"		              sstd_rejected_qty LS_Trans_Qty,sstd_rejected_qty LS_Stk_Trans_Qty
"
"	                 FROM store_stock_trans_dtls
"
"			WHERE sstd_bu = p_bu
"
"			  AND sstd_doc_no = p_doc_no
"
"			  AND sstd_seq_no = cr2.sstln_seq_no
"
"			  AND sstd_rejected_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			ORDER BY sstd_sub_seq_no)
"
"	  LOOP
"
"	  --Raise_Application_Error(-20999,'HRM '||'~'||cr2.sstln_unit_cost);
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.sstd_sys_ls_no,r_ls.sstd_lot_no,r_ls.sstd_ser_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.sstd_source_type,r_ls.sstd_source_id,NULL,NULL,p_user,p_unit_cost =>cr2.sstln_unit_cost);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.sstln_po_ord_no,
"
"                               NULL,
"
"                               cr2.sstln_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.sstln_prod_id,
"
"                               cr2.sstln_prod_rev,
"
"                               r_ls.sstd_sys_ls_no,
"
"                               r_ls.sstd_lot_no,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               r_ls.LS_Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.ssthd_plnt,
"
"                               NULL,
"
"                               'V',
"
"                               cr2.sstln_so_order_pfx,
"
"                               cr2.sstln_so_ord_no,
"
"                               cr2.sstln_so_line_no,
"
"                               NULL,
"
"                               NULL,
"
"                               p_doc_no,
"
"                               NULL,
"
"                               p_doc_no,
"
"                               cr2.sstln_seq_no,
"
"                               cr2.sstln_seq_no,
"
"                               TRUNC(cr1.ssthd_date),
"
"                               cr1.ssthd_year,
"
"                               cr1.ssthd_period,
"
"                               cr2.prod_cost_method,
"
"                               'ME',
"
"                               'ICM',
"
"                               cr2.prodplnt_cls,
"
"                               'Material Return',
"
"                               'Material Return',
"
"                               cr2.sstln_unit_cost,
"
"                               cr2.sstln_unit_cost,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.sstln_so_type,
"
"                               p_proj => cr2.sstln_proj_id,
"
"                               p_task => cr2.sstln_task_id,
"
"		               p_prod_cls_desc => cr2.sstln_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.sstln_prod_sub_cls,
"
"		               p_prod_sub_cls_desc => cr2.sstln_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.sstln_prod_grp,
"
"		               p_prod_grp_desc => cr2.sstln_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.sstln_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.sstln_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.ssthd_plnt,cr2.sstln_prod_id,cr2.sstln_prod_rev),
"
"			       p_so_schld_desc => cr2.sstln_so_schld_desc
"
"                              );
"
"
"
"	  END LOOP;
"
"
"
"	END IF;
"
"	END IF;
"
"
"
"      END LOOP c2;
"
"
"
"      --proc_issue_mat_frm_mi(p_bu,cr1.ssthd_plnt,v_mi_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      /*BEGIN
"
"        SELECT icmctrl_auto_mtr_flag INTO v_mrv_cre_flag
"
"	  FROM icm_control
"
"	 WHERE icmctrl_bu = p_bu;
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"	  Raise_Application_Error(-20999,'HRM ');
"
"      END;
"
"
"
"      IF v_mrv_cre_flag = 'Y' THEN
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'N',
"
"	       istlnh_sel_user = NULL
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_sel_flag = 'Y'
"
"	   AND istlnh_sel_user = p_user;
"
"
"
"        UPDATE inv_stock_trans_ln_hist
"
"	   SET istlnh_sel_flag = 'Y',
"
"	       istlnh_sel_user = p_user,
"
"	       istlnh_proc_qty = istlnh_trans_qty
"
"         WHERE istlnh_bu = p_bu
"
"	   AND istlnh_doc_no = v_mi_doc_no;
"
"
"
"        pkg_mat_rcpt.proc_cre_mrv_frm_miv(p_bu,TRUNC(SYSDATE),p_user,v_mr_doc_no);
"
"
"
"      END IF;*/
"
"
"
"    END LOOP c1;
"
"
"
"    FOR i IN 1..v_index
"
"    LOOP
"
"
"
"      FOR r_mi IN (SELECT *
"
"                     FROM inv_stock_trans_hd
"
"		    WHERE isthd_bu = p_bu
"
"		      AND isthd_doc_no = r_miv(i).miv_doc_no)
"
"      LOOP
"
"        DECLARE
"
"          v_jrnl_res	VARCHAR2(1);
"
"        BEGIN
"
"          IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"            proc_ins_mat_iss_appl_jrnl(p_bu,r_mi.isthd_plnt,r_mi.isthd_doc_no,p_user,p_lang,v_jrnl_res);
"
"	    UPDATE inv_stock_trans_hd
"
"	       SET isthd_jrnl_flag = 'Y'
"
"	     WHERE isthd_bu = p_bu
"
"	       AND isthd_doc_no = r_mi.isthd_doc_no;
"
"          END IF;
"
"        END;
"
"
"
"        proc_issue_mat_frm_mi(p_bu,r_mi.isthd_plnt,r_mi.isthd_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         r_mi.isthd_plnt,
"
"		         r_mi.isthd_trans_date,
"
"		         r_mi.isthd_year,
"
"		         r_mi.isthd_period,
"
"		         NULL,
"
"		         r_mi.isthd_doc_no,
"
"		         NULL,
"
"		         'ICM',
"
"		         p_user,
"
"		         1,
"
"		         'MIV '||r_mi.isthd_doc_no||' FROM MTRN '||p_doc_no
"
"		        );
"
"      END IF;
"
"      END LOOP;
"
"    END LOOP;
"
"
"
"    IF v_mi_doc_no IS NOT NULL THEN
"
"      p_mi_doc_no := func_find_order_no_substr(v_mi_doc_no);
"
"    END IF;
"
"  END proc_cre_miv_doc_frm_mat_rtn;
"
"
"
"  PROCEDURE proc_cre_miv_doc_frm_qc_rqst(p_bu			VARCHAR2,
"
"				         p_pln_no		VARCHAR2,
"
"				         p_user			VARCHAR2,
"
"					 p_user_emp		VARCHAR2,
"
"					 p_lang			NUMBER,
"
"					 p_mi_doc_no	OUT	VARCHAR2
"
"				        )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT DISTINCT tqphd_plnt,tqphd_plnt_loc_id,tqphd_plnt_loc_name,tqphd_pln_date,tqphd_pln_year,tqphd_pln_period,tqphd_insp_mode
"
"    FROM tqm_qc_plan_hd,tqm_qc_plan_ln,products
"
"   WHERE tqphd_bu = tqpln_bu
"
"     AND tqphd_pln_no = tqpln_pln_no
"
"     AND prod_bu = tqpln_bu
"
"     AND prod_id = tqpln_prod_id
"
"     AND prod_rev = tqpln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     --AND tqpln_status <> 'C'
"
"     AND tqphd_bu = p_bu
"
"     AND tqphd_pln_no = p_pln_no;
"
"
"
"  CURSOR c2 IS
"
"  SELECT tqphd_pln_date,tqphd_pln_year,tqphd_pln_period,1 tqpln_exchange_rate,tqpln_vou_type,tqpln_vou_no,tqpln_vou_line_no,
"
"         tqpln_pln_no,tqpln_seq_no,tqpln_store_id,tqpln_prod_id,tqpln_prod_rev,prod_desc11,tqpln_uom,tqpln_prod_uom,tqpln_conv_factor,
"
"	 prod_ser_lot_opt,prod_cost_method,prod_expr_flag,tqpln_prod_cls,tqpln_prod_cls_desc,tqpln_prod_subcls,tqpln_prod_subcls_desc,
"
"	 tqpln_prod_grp,tqpln_prod_grp_desc,tqpln_prod_subgrp,tqpln_prod_subgrp_desc,
"
"         tqpln_so_type,tqpln_so_no,tqpln_so_seq_no,tqpln_proj_id,tqpln_task_id,tqpln_so_schld_desc,
"
"         tqpln_receipt_qty Trans_Qty,tqpln_receipt_qty Stk_Trans_Qty,0 tqpln_unit_cost,tqpln_sf_code,
"
"	 tqpln_prod_ord_no,tqpln_sou_sf_code,tqpln_sou_oprn_seq,tqpln_sou_proc_id,tqpln_tar_oprn_seq,tqpln_tar_proc_id
"
"    FROM tqm_qc_plan_hd,tqm_qc_plan_ln,products
"
"   WHERE tqphd_bu = tqpln_bu
"
"     AND tqphd_pln_no = tqpln_pln_no
"
"     AND prod_bu = tqpln_bu
"
"     AND prod_id = tqpln_prod_id
"
"     AND prod_rev = tqpln_prod_rev
"
"     AND prod_stocked = 'Y'
"
"     --AND tqpln_status <> 'C'
"
"     AND tqphd_bu = p_bu
"
"     AND tqphd_pln_no = p_pln_no
"
"   ORDER BY tqpln_seq_no;
"
"
"
"    v_insp_store_id	stores.store_id%TYPE;
"
"    v_mi_doc_no		inv_stock_trans_hd.isthd_doc_no%TYPE;
"
"    v_mi_doc_pfx	inv_stock_trans_hd.isthd_doc_pfx%TYPE;
"
"    v_issuer_id		inv_stock_trans_hd.isthd_issuer_id%TYPE;
"
"    v_issuer_name	inv_stock_trans_hd.isthd_issuer_name%TYPE;
"
"    v_issuer_pos_id	inv_stock_trans_hd.isthd_issuer_pos_id%TYPE;
"
"    v_issuer_pos_name	inv_stock_trans_hd.isthd_issuer_pos_name%TYPE;
"
"    dummy1		VARCHAR2(100);
"
"    dummy2		VARCHAR2(100);
"
"
"
"    v_seq_no		NUMBER;
"
"    v_sub_seq_no	NUMBER;
"
"
"
"    v_rcpt_unitcost	NUMBER;
"
"    v_cb_unit_cost	NUMBER;
"
"
"
"    v_stk_batch_no	stocks_batches.sb_batch_id%TYPE;
"
"    v_dc_no		VARCHAR2(100);
"
"    v_pack_no		VARCHAR2(100);
"
"    v_mr_doc_no		VARCHAR2(100);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"    v_cb_bal_qty	stocks_batches.sb_qty_in%TYPE;
"
"    v_cb_upd_qty	stocks_batches.sb_qty_in%TYPE;
"
"    v_pd_vou_no		VARCHAR2(30);
"
"
"
"  BEGIN
"
"
"
"    proc_get_emp_det(p_bu,p_user,v_issuer_id,v_issuer_name,v_issuer_pos_id,v_issuer_pos_name,dummy1,dummy2,p_lang);
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      v_insp_store_id := func_find_store_fr_type(p_bu,cr1.tqphd_plnt,cr1.tqphd_plnt_loc_id,'Q');
"
"
"
"      IF v_insp_store_id IS NULL THEN
"
"         Raise_Application_Error(-20270,'ICM');
"
"      END IF;
"
"
"
"      v_mi_doc_pfx := func_find_vou_dflt_pfx(p_bu,cr1.tqphd_plnt,cr1.tqphd_plnt_loc_id,'MIV','MIV');
"
"      v_mi_doc_no := func_find_pfx_nextno(p_bu,cr1.tqphd_pln_date,func_find_vou_dflt_pfx(p_bu,cr1.tqphd_plnt,cr1.tqphd_plnt_loc_id,'MIV','MIV'),p_user);
"
"
"
"      INSERT INTO inv_stock_trans_hd(isthd_bu,
"
"				     isthd_doc_no,
"
"				     isthd_plnt,
"
"				     isthd_plnt_loc_id,
"
"				     isthd_plnt_loc_name,
"
"				     isthd_doc_oper,
"
"				     isthd_issuefm_store_id,
"
"				     isthd_issueto_type,
"
"				     isthd_issueto_id,
"
"				     isthd_issueto_plnt,
"
"				     isthd_issueto_plnt_loc_id,
"
"				     isthd_trans_date,
"
"				     isthd_year,
"
"				     isthd_period,
"
"				     isthd_status,
"
"				     isthd_reference,
"
"				     isthd_issuer_id,
"
"				     isthd_issuer_name,
"
"				     isthd_issuer_pos_id,
"
"				     isthd_issuer_pos_name,
"
"				     isthd_vou_type,
"
"				     isthd_cre_by,
"
"				     isthd_cre_emp_id,
"
"				     isthd_cre_ip_addr,
"
"				     isthd_cre_os_user,
"
"				     isthd_cre_date,
"
"				     isthd_vou_oper,
"
"				     isthd_doc_pfx,
"
"				     isthd_inspection_type
"
"				    )
"
"			      VALUES(p_bu,
"
"				     v_mi_doc_no,
"
"				     cr1.tqphd_plnt,
"
"				     cr1.tqphd_plnt_loc_id,
"
"				     cr1.tqphd_plnt_loc_name,
"
"				     'T',
"
"				     NULL,
"
"				     'Q',
"
"				     v_insp_store_id,
"
"				     cr1.tqphd_plnt,
"
"				     cr1.tqphd_plnt_loc_id,
"
"				     cr1.tqphd_pln_date,
"
"				     cr1.tqphd_pln_year,
"
"				     cr1.tqphd_pln_period,
"
"				     'N',
"
"				     'MIV '||v_mi_doc_no||' FROM IR '||p_pln_no,
"
"				     v_issuer_id,
"
"				     v_issuer_name,
"
"				     v_issuer_pos_id,
"
"				     v_issuer_pos_name,
"
"				     'IR',
"
"				     p_user,
"
"				     v_emp_id,
"
"				     v_ip_addr,
"
"				     v_os_user,
"
"				     SYSDATE,
"
"				     'A',
"
"				     v_mi_doc_pfx,
"
"				     cr1.tqphd_insp_mode
"
"				    );
"
"
"
"      v_seq_no := 0;
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"	v_sub_seq_no := 0;
"
"
"
"        v_rcpt_unitcost := func_find_unitcost(p_bu,cr2.tqpln_prod_id,cr2.tqpln_prod_rev,cr2.tqpln_store_id);
"
"
"
"	INSERT INTO inv_stock_trans_ln(istln_bu,
"
"				       istln_doc_no,
"
"				       istln_seq_no,
"
"				       istln_mat_type,
"
"				       istln_store_id,
"
"				       istln_rcpt_store_id,
"
"				       istln_prod_id,
"
"				       istln_prod_rev,
"
"				       istln_uom,
"
"				       istln_prod_uom,
"
"				       istln_conv_factor,
"
"				       istln_prod_cls,
"
"				       istln_trans_qty,
"
"				       istln_stk_trans_qty,
"
"				       istln_unit_cost,
"
"				       istln_reference,
"
"				       istln_status,
"
"				       istln_type,
"
"				       istln_so_pfx,
"
"				       istln_so_no,
"
"				       istln_so_seq_no,
"
"				       istln_proj_id,
"
"				       istln_task_id,
"
"				       istln_so_schld_desc,
"
"				       istln_vou_type,
"
"				       istln_vou_no,
"
"				       istln_vou_seq_no,
"
"				       istln_cre_by,
"
"				       istln_cre_emp_id,
"
"				       istln_cre_ip_addr,
"
"				       istln_cre_os_user,
"
"				       istln_cre_date,
"
"				       istln_po_ord_no,
"
"				       istln_sf_code,
"
"				       istln_sou_oprn_seq,
"
"				       istln_sou_proc_id
"
"				      )
"
"			        VALUES(p_bu,
"
"				       v_mi_doc_no,
"
"				       v_seq_no,
"
"				       CASE WHEN cr2.tqpln_sf_code IS NULL THEN 'S' ELSE 'F' END,
"
"				       cr2.tqpln_store_id,
"
"				       v_insp_store_id,
"
"				       cr2.tqpln_prod_id,
"
"				       cr2.tqpln_prod_rev,
"
"				       cr2.tqpln_uom,
"
"				       cr2.tqpln_prod_uom,
"
"				       cr2.tqpln_conv_factor,
"
"				       NVL(cr2.tqpln_prod_cls,func_find_product_class(p_bu,cr1.tqphd_plnt,cr2.tqpln_prod_id,cr2.tqpln_prod_rev)),
"
"				       cr2.Trans_Qty,
"
"				       cr2.Stk_Trans_Qty,
"
"				       v_rcpt_unitcost,
"
"				       'MIV '||v_mi_doc_no||'/'||v_seq_no||' FROM IR '||p_pln_no||'/'||cr2.tqpln_seq_no,
"
"				       'N',
"
"				       cr2.tqpln_so_type,
"
"				       NULL,
"
"				       cr2.tqpln_so_no,
"
"				       cr2.tqpln_so_seq_no,
"
"				       cr2.tqpln_proj_id,
"
"				       NULL,
"
"				       cr2.tqpln_so_schld_desc,
"
"				       'IR',
"
"				       p_pln_no,
"
"				       cr2.tqpln_seq_no,
"
"				       p_user,
"
"				       v_emp_id,
"
"				       v_ip_addr,
"
"				       v_os_user,
"
"				       SYSDATE,
"
"				       cr2.tqpln_prod_ord_no,
"
"				       cr2.tqpln_sf_code,
"
"				       cr2.tqpln_sou_oprn_seq,
"
"				       cr2.tqpln_sou_proc_id
"
"                           	      );
"
"
"
"        IF cr2.tqpln_sf_code IS NULL THEN
"
"
"
"	  proc_upd_stocks(p_bu,
"
"	                  cr2.tqpln_store_id,
"
"	                  NULL,
"
"	                  cr2.tqpln_prod_id,
"
"	                  cr2.tqpln_prod_rev,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  -cr2.Stk_Trans_Qty,
"
"	                  v_rcpt_unitcost,
"
"	                  v_rcpt_unitcost,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  cr2.tqpln_seq_no,
"
"	                  0,
"
"	                  NULL,
"
"	                  p_pln_no,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  cr1.tqphd_pln_year,
"
"	                  cr1.tqphd_pln_period,
"
"	                  cr1.tqphd_pln_date,
"
"	                  NULL,
"
"	                  'TQM',
"
"	                  'QC',
"
"	                  NULL,
"
"	                  p_user,
"
"	                  SYSDATE,
"
"	                  NULL,
"
"	                  cr2.tqpln_prod_cls,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  0,
"
"		          p_prod_cls_desc => cr2.tqpln_prod_cls_desc,
"
"		          p_prod_sub_cls_id => cr2.tqpln_prod_subcls,
"
"		          p_prod_sub_cls_desc => cr2.tqpln_prod_subcls_desc,
"
"		          p_prod_grp_id => cr2.tqpln_prod_grp,
"
"		          p_prod_grp_desc => cr2.tqpln_prod_grp_desc,
"
"		          p_prod_sub_grp_id => cr2.tqpln_prod_subgrp,
"
"		          p_prod_sub_grp_desc => cr2.tqpln_prod_subgrp_desc
"
"	                 );
"
"
"
"          IF cr2.tqpln_so_no IS NOT NULL OR cr2.tqpln_proj_id IS NOT NULL THEN
"
"	    proc_upd_so_stocks(p_bu,
"
"	    	  	       cr2.tqpln_store_id,
"
"	    	  	       cr2.tqpln_prod_id,
"
"	    	  	       cr2.tqpln_prod_rev,
"
"	    	  	       0,
"
"	    	  	       -cr2.Stk_Trans_Qty,
"
"	    	  	       v_rcpt_unitcost,
"
"	    	  	       NULL,
"
"	    	  	       cr2.tqpln_so_no,
"
"	    	  	       cr2.tqpln_so_seq_no,
"
"	    	  	       NULL,
"
"	    	  	       cr1.tqphd_pln_date,
"
"	    	  	       'QC',
"
"	    	  	       NULL,
"
"	    	  	       p_pln_no,
"
"	    	  	       NULL,
"
"	    	  	       NULL,
"
"	    	  	       p_pln_no,
"
"	    	  	       cr2.tqpln_seq_no,
"
"	    	  	       'QC',
"
"	    	  	       'TQM',
"
"	    	  	       'MIV FROM QC',
"
"	    	  	       'MIV FROM QC',
"
"	    	  	       p_user,
"
"	    	  	       cr2.tqpln_so_type,
"
"	    	  	       cr2.tqpln_proj_id,
"
"	    	  	       p_so_prj_schld_desc => cr2.tqpln_so_no
"
"	    	  	      );
"
"	  END IF;
"
"
"
"	  /*IF cr2.prod_ser_lot_opt <> 'N' THEN
"
"	    FOR r_ls IN (SELECT *
"
"	                   FROM tqm_qc_plan_lot_serial_dtls
"
"			  WHERE tqplsd_bu = p_bu
"
"                            AND tqplsd_pln_no = p_pln_no
"
"	                    AND tqplsd_seq_no = v_seq_no)
"
"	  END IF;*/
"
"
"
"	  proc_upd_stocks(p_bu,
"
"	                  cr2.tqpln_store_id,
"
"	                  NULL,
"
"	                  cr2.tqpln_prod_id,
"
"	                  cr2.tqpln_prod_rev,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  cr2.Stk_Trans_Qty,
"
"	                  v_rcpt_unitcost,
"
"	                  v_rcpt_unitcost,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  0,
"
"	                  v_seq_no,
"
"	                  0,
"
"	                  NULL,
"
"	                  v_mi_doc_no,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  cr1.tqphd_pln_year,
"
"	                  cr1.tqphd_pln_period,
"
"	                  cr1.tqphd_pln_date,
"
"	                  NULL,
"
"	                  'ICM',
"
"	                  'MI',
"
"	                  NULL,
"
"	                  p_user,
"
"	                  SYSDATE,
"
"	                  NULL,
"
"	                  cr2.tqpln_prod_cls,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  NULL,
"
"	                  0,
"
"		          p_prod_cls_desc => cr2.tqpln_prod_cls_desc,
"
"		          p_prod_sub_cls_id => cr2.tqpln_prod_subcls,
"
"		          p_prod_sub_cls_desc => cr2.tqpln_prod_subcls_desc,
"
"		          p_prod_grp_id => cr2.tqpln_prod_grp,
"
"		          p_prod_grp_desc => cr2.tqpln_prod_grp_desc,
"
"		          p_prod_sub_grp_id => cr2.tqpln_prod_subgrp,
"
"		          p_prod_sub_grp_desc => cr2.tqpln_prod_subgrp_desc
"
"	                 );
"
"
"
"          IF cr2.tqpln_so_no IS NOT NULL OR cr2.tqpln_proj_id IS NOT NULL THEN
"
"	    proc_upd_so_stocks(p_bu,
"
"	    	  	       cr2.tqpln_store_id,
"
"	    	  	       cr2.tqpln_prod_id,
"
"	    	  	       cr2.tqpln_prod_rev,
"
"	    	  	       0,
"
"	    	  	       cr2.Stk_Trans_Qty,
"
"	    	  	       v_rcpt_unitcost,
"
"	    	  	       NULL,
"
"	    	  	       cr2.tqpln_so_no,
"
"	    	  	       cr2.tqpln_so_seq_no,
"
"	    	  	       NULL,
"
"	    	  	       cr1.tqphd_pln_date,
"
"	    	  	       'MI',
"
"	    	  	       NULL,
"
"	    	  	       v_mi_doc_no,
"
"	    	  	       NULL,
"
"	    	  	       NULL,
"
"	    	  	       v_mi_doc_no,
"
"	    	  	       v_seq_no,
"
"	    	  	       'MI',
"
"	    	  	       'ICM',
"
"	    	  	       'MIV FROM QC',
"
"	    	  	       'MIV FROM QC',
"
"	    	  	       p_user,
"
"	    	  	       cr2.tqpln_so_type,
"
"	    	  	       cr2.tqpln_proj_id,
"
"	    	  	       p_so_prj_schld_desc => cr2.tqpln_so_no
"
"	    	  	      );
"
"	  END IF;
"
"
"
"	  IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user);
"
"
"
"	    IF func_find_store_bin_flag(p_bu,cr2.tqpln_store_id) = 'Y' THEN
"
"	      FOR r_ls IN (SELECT tqplsd_sub_seq_no,tqplsd_bin_id,
"
"				tqplsd_lot_qty LS_Trans_Qty,tqplsd_lot_qty LS_Stk_Trans_Qty
"
"	                   FROM tqm_qc_plan_lot_serial_dtls
"
"			  WHERE tqplsd_bu = p_bu
"
"                            AND tqplsd_pln_no = p_pln_no
"
"	                    AND tqplsd_seq_no = cr2.tqpln_seq_no
"
"			  ORDER BY tqplsd_sub_seq_no)
"
"	    LOOP
"
"	      proc_upd_bin_stocks(p_bu,
"
"			          cr2.tqpln_store_id,
"
"			          cr2.tqpln_prod_id,
"
"			          cr2.tqpln_prod_rev,
"
"			          r_ls.tqplsd_bin_id,
"
"			          NULL,
"
"			          NULL,
"
"			          NULL,
"
"			          NULL,
"
"			          NULL,
"
"			          0,
"
"			          -r_ls.LS_Stk_Trans_Qty,
"
"			          0,
"
"			          0,
"
"			          v_rcpt_unitcost,
"
"			          TRUNC(cr1.tqphd_pln_date),
"
"			          'MI',
"
"			          NULL,
"
"			          v_mi_doc_no,
"
"			          v_seq_no,
"
"			          'ICM',
"
"			          p_user,
"
"			          p_crate_id => NULL,
"
"			          p_prod_ord_no => NULL,
"
"			          p_sf_code => NULL
"
"			         );
"
"
"
"	        INSERT INTO inv_mat_issue_bin(imib_bu,
"
"                                        imib_doc_no,
"
"                                        imib_seq_no,
"
"                                        imib_prod_id,
"
"                                        imib_prod_rev,
"
"                                        imib_bin_id,
"
"                                        imib_crate_id,
"
"                                        imib_sys_ls_no,
"
"                                        imib_lot_no,
"
"                                        imib_ser_no,
"
"                                        imib_source_type,
"
"                                        imib_source_id,
"
"                                        imib_trans_qty,
"
"                                        imib_stk_trans_qty,
"
"                                        imib_rec_flag,
"
"                                        imib_cre_by,
"
"                                        imib_cre_emp_id,
"
"                                        imib_cre_ip_addr,
"
"                                        imib_cre_os_user,
"
"                                        imib_cre_date
"
"                                       )
"
"                                 VALUES(p_bu,
"
"                                        v_mi_doc_no,
"
"                                        v_seq_no,
"
"                                        cr2.tqpln_prod_id,
"
"                                        cr2.tqpln_prod_rev,
"
"                                        r_ls.tqplsd_bin_id,
"
"                                        NULL,
"
"                                        NULL,--cr1.bsld_sys_ls_no,
"
"                                        NULL,--cr1.bsld_lot_no,
"
"                                        NULL,--cr1.bsld_ser_no,
"
"                                        NULL,--cr1.bsld_source_type,
"
"                                        NULL,--cr1.bsld_source_id,
"
"                                        r_ls.LS_Stk_Trans_Qty,
"
"                                        r_ls.LS_Stk_Trans_Qty,
"
"                                        'N',
"
"                                        p_user,
"
"                                        p_user_emp,
"
"                                        '-',
"
"                                        '-',
"
"                                        SYSDATE
"
"                                       );
"
"	      END LOOP;
"
"	    END IF;
"
"
"
"	    IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	      v_cb_bal_qty := cr2.Stk_Trans_Qty;
"
"
"
"	      FOR r_cb IN (SELECT tqpcb_batch_no,tqpcb_insp_qty Stk_Qty,tqpcb_unit_cost
"
"	                     FROM tqm_qc_plan_cost_batch
"
"	                    WHERE tqpcb_bu = p_bu
"
"	                      AND tqpcb_pln_no = cr2.tqpln_pln_no
"
"	                      AND tqpcb_seq_no = cr2.tqpln_seq_no
"
"			    ORDER BY tqpcb_sub_seq_no)
"
"	      LOOP
"
"
"
"	        v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	        IF v_cb_bal_qty > r_cb.Stk_Qty THEN
"
"	          v_cb_upd_qty := r_cb.Stk_Qty;
"
"		  v_cb_bal_qty := v_cb_bal_qty - v_cb_upd_qty;
"
"	        ELSE
"
"	          v_cb_upd_qty := v_cb_bal_qty;
"
"		  v_cb_bal_qty := 0;
"
"	        END IF;
"
"
"
"		proc_upd_stock_batches(p_bu,
"
"			               cr2.tqpln_store_id,
"
"			               cr2.tqpln_prod_id,
"
"			               cr2.tqpln_prod_rev,
"
"			               r_cb.tqpcb_batch_no,
"
"			               0,
"
"			               0,
"
"			               -v_cb_upd_qty,
"
"			               0,
"
"			               r_cb.tqpcb_unit_cost,
"
"			               r_cb.tqpcb_unit_cost,
"
"			               0,
"
"			               0,
"
"			               0,
"
"			               0,
"
"			               'N',
"
"			               cr1.tqphd_pln_date,
"
"			               NULL,
"
"			               cr2.tqpln_pln_no,
"
"			               cr2.tqpln_seq_no,
"
"			               'MI',
"
"			               NULL,
"
"			               cr2.tqpln_pln_no,
"
"			               cr2.tqpln_seq_no,
"
"			               NULL,
"
"			               cr2.tqpln_prod_cls,
"
"			               'QC',
"
"			               'ICM',
"
"			               NULL,
"
"			               NULL,
"
"			               NULL,
"
"			               NULL,
"
"			               p_user,
"
"			               p_prod_cls_desc => cr2.tqpln_prod_cls_desc,
"
"			               p_prod_subcls => cr2.tqpln_prod_subcls,
"
"			               p_prod_subcls_desc => cr2.tqpln_prod_subcls_desc,
"
"			               p_prod_grp => cr2.tqpln_prod_grp,
"
"			               p_prod_grp_desc => cr2.tqpln_prod_grp_desc,
"
"			               p_prod_subgrp => cr2.tqpln_prod_subgrp,
"
"			               p_prod_subgrp_desc => cr2.tqpln_prod_subgrp_desc
"
"    	                              );
"
"
"
"	        INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						       istcb_doc_no,
"
"						       istcb_seq_no,
"
"						       istcb_sub_seq_no,
"
"						       istcb_batch_no,
"
"						       istcb_trans_qty,
"
"						       istcb_stk_trans_qty,
"
"						       istcb_unit_cost,
"
"						       istcb_cre_by,
"
"						       istcb_cre_emp_id,
"
"						       istcb_cre_ip_addr,
"
"						       istcb_cre_os_user,
"
"						       istcb_cre_date,
"
"						       istcb_ins_rec
"
"						      )
"
"                                                VALUES(p_bu,
"
"					               v_mi_doc_no,
"
"					               v_seq_no,
"
"					               v_sub_seq_no,
"
"					               r_cb.tqpcb_batch_no,
"
"					               v_cb_upd_qty / (cr2.Stk_Trans_Qty / cr2.Trans_Qty),--cr2.Trans_Qty,
"
"					               v_cb_upd_qty,--cr2.Stk_Trans_Qty,
"
"					               r_cb.tqpcb_unit_cost,
"
"					               p_user,
"
"						       v_emp_id,
"
"						       v_ip_addr,
"
"						       v_os_user,
"
"					               SYSDATE,
"
"					               'Y'
"
"					              );
"
"
"
"	        EXIT WHEN v_cb_bal_qty = 0;
"
"
"
"	      END LOOP;
"
"
"
"	    END IF;
"
"
"
"	  ELSE
"
"
"
"	    FOR r_ls IN (SELECT tqplsd_sub_seq_no,tqplsd_sys_ls_no,tqplsd_lot_no,tqplsd_serial_no,tqplsd_source_type,
"
"	                        tqplsd_source_id,tqplsd_expiry_date,tqplsd_bin_id,
"
"				tqplsd_lot_qty LS_Trans_Qty,tqplsd_lot_qty LS_Stk_Trans_Qty,tqplsd_unit_cost
"
"	                   FROM tqm_qc_plan_lot_serial_dtls
"
"			  WHERE tqplsd_bu = p_bu
"
"                            AND tqplsd_pln_no = p_pln_no
"
"	                    AND tqplsd_seq_no = cr2.tqpln_seq_no
"
"			  ORDER BY tqplsd_sub_seq_no)
"
"	    LOOP
"
"
"
"	      proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.tqplsd_sys_ls_no,r_ls.tqplsd_lot_no,r_ls.tqplsd_serial_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.tqplsd_source_type,r_ls.tqplsd_source_id,r_ls.tqplsd_expiry_date,NULL,p_user,p_unit_cost=> r_ls.tqplsd_unit_cost);
"
"
"
"	      IF func_find_store_bin_flag(p_bu,cr2.tqpln_store_id) = 'Y' THEN
"
"
"
"	        proc_upd_bin_stocks(p_bu,
"
"			            cr2.tqpln_store_id,
"
"			            cr2.tqpln_prod_id,
"
"			            cr2.tqpln_prod_rev,
"
"			            r_ls.tqplsd_bin_id,
"
"			            r_ls.tqplsd_sys_ls_no,
"
"			            r_ls.tqplsd_lot_no,
"
"			            r_ls.tqplsd_serial_no,
"
"			            r_ls.tqplsd_source_type,
"
"			            r_ls.tqplsd_source_id,
"
"			            0,
"
"			            -r_ls.LS_Stk_Trans_Qty,
"
"			            0,
"
"			            0,
"
"			            v_rcpt_unitcost,
"
"			            TRUNC(cr1.tqphd_pln_date),
"
"			            'MI',
"
"			            NULL,
"
"			            v_mi_doc_no,
"
"			            v_seq_no,
"
"			            'ICM',
"
"			            p_user,
"
"			            p_crate_id => NULL,
"
"			            p_prod_ord_no => NULL,
"
"			            p_sf_code => NULL
"
"			           );
"
"
"
"	        INSERT INTO inv_mat_issue_bin(imib_bu,
"
"                                        imib_doc_no,
"
"                                        imib_seq_no,
"
"                                        imib_prod_id,
"
"                                        imib_prod_rev,
"
"                                        imib_bin_id,
"
"                                        imib_crate_id,
"
"                                        imib_sys_ls_no,
"
"                                        imib_lot_no,
"
"                                        imib_ser_no,
"
"                                        imib_source_type,
"
"                                        imib_source_id,
"
"                                        imib_trans_qty,
"
"                                        imib_stk_trans_qty,
"
"                                        imib_rec_flag,
"
"                                        imib_cre_by,
"
"                                        imib_cre_emp_id,
"
"                                        imib_cre_ip_addr,
"
"                                        imib_cre_os_user,
"
"                                        imib_cre_date
"
"                                       )
"
"                                 VALUES(p_bu,
"
"                                        v_mi_doc_no,
"
"                                        v_seq_no,
"
"                                        cr2.tqpln_prod_id,
"
"                                        cr2.tqpln_prod_rev,
"
"                                        r_ls.tqplsd_bin_id,
"
"                                        NULL,
"
"                                        r_ls.tqplsd_sys_ls_no,
"
"                                        r_ls.tqplsd_lot_no,
"
"                                        r_ls.tqplsd_serial_no,
"
"                                        r_ls.tqplsd_source_type,
"
"                                        r_ls.tqplsd_source_id,
"
"                                        r_ls.LS_Stk_Trans_Qty,
"
"                                        r_ls.LS_Stk_Trans_Qty,
"
"                                        'N',
"
"                                        p_user,
"
"                                        p_user_emp,
"
"                                        '-',
"
"                                        '-',
"
"                                        SYSDATE
"
"                                       );
"
"
"
"	      END IF;
"
"
"
"	      proc_upd_lot_ser_stocks(p_bu,
"
"                                      cr2.tqpln_store_id,
"
"                                      cr2.tqpln_prod_id,
"
"                                      cr2.tqpln_prod_rev,
"
"                                      r_ls.tqplsd_sys_ls_no,
"
"                                      0,
"
"                                      -r_ls.LS_Stk_Trans_Qty,
"
"                                      0,
"
"                                      v_rcpt_unitcost,
"
"				      cr2.prod_ser_lot_opt,
"
"                                      r_ls.tqplsd_lot_no,
"
"                                      r_ls.tqplsd_serial_no,
"
"                                      r_ls.tqplsd_source_type,
"
"                                      r_ls.tqplsd_source_id,
"
"                                      CASE WHEN cr2.prod_expr_flag = 'Y' THEN r_ls.tqplsd_expiry_date ELSE NULL END,
"
"                                      TRUNC(cr1.tqphd_pln_date),
"
"                                      'QC',
"
"                                      NULL,
"
"                                      p_pln_no,
"
"                                      cr2.tqpln_seq_no,
"
"                                      'TQM',
"
"                                      'QC',--cr2.porl_upd_ref1,
"
"                                      'LS Allocation',
"
"                                      p_user
"
"                                     );
"
"
"
"	      proc_upd_lot_ser_stocks(p_bu,
"
"                                      cr2.tqpln_store_id,
"
"                                      cr2.tqpln_prod_id,
"
"                                      cr2.tqpln_prod_rev,
"
"                                      r_ls.tqplsd_sys_ls_no,
"
"                                      0,
"
"                                      r_ls.LS_Stk_Trans_Qty,
"
"                                      0,
"
"                                      v_rcpt_unitcost,
"
"				      cr2.prod_ser_lot_opt,
"
"                                      r_ls.tqplsd_lot_no,
"
"                                      r_ls.tqplsd_serial_no,
"
"                                      r_ls.tqplsd_source_type,
"
"                                      r_ls.tqplsd_source_id,
"
"                                      CASE WHEN cr2.prod_expr_flag = 'Y' THEN r_ls.tqplsd_expiry_date ELSE NULL END,
"
"                                      TRUNC(cr1.tqphd_pln_date),
"
"                                      'MI',
"
"                                      NULL,
"
"                                      v_mi_doc_no,
"
"                                      v_seq_no,
"
"                                      'ICM',
"
"                                      'MI',--cr2.porl_upd_ref1,
"
"                                      'LS Allocation',
"
"                                      p_user
"
"                                     );
"
"
"
"	      IF cr2.prod_cost_method <> 'MAC' THEN
"
"
"
"	        v_cb_bal_qty := r_ls.LS_Stk_Trans_Qty;
"
"
"
"	        FOR r_cb IN (SELECT tqpcb_batch_no,tqpcb_insp_qty Stk_Qty,tqpcb_unit_cost
"
"	                       FROM tqm_qc_plan_cost_batch
"
"	                      WHERE tqpcb_bu = p_bu
"
"	                        AND tqpcb_pln_no = cr2.tqpln_pln_no
"
"	                        AND tqpcb_seq_no = cr2.tqpln_seq_no
"
"				AND tqpcb_sys_ls_no = r_ls.tqplsd_sys_ls_no
"
"			    ORDER BY tqpcb_sub_seq_no)
"
"	        LOOP
"
"
"
"	          IF v_cb_bal_qty > r_cb.Stk_Qty THEN
"
"	            v_cb_upd_qty := r_cb.Stk_Qty;
"
"		    v_cb_bal_qty := v_cb_bal_qty - v_cb_upd_qty;
"
"	          ELSE
"
"	            v_cb_upd_qty := v_cb_bal_qty;
"
"		    v_cb_bal_qty := 0;
"
"	          END IF;
"
"
"
"		proc_upd_stock_batches(p_bu,
"
"			               cr2.tqpln_store_id,
"
"			               cr2.tqpln_prod_id,
"
"			               cr2.tqpln_prod_rev,
"
"			               r_cb.tqpcb_batch_no,
"
"			               0,
"
"			               0,
"
"			               -v_cb_upd_qty,
"
"			               0,
"
"			               r_cb.tqpcb_unit_cost,
"
"			               r_cb.tqpcb_unit_cost,
"
"			               0,
"
"			               0,
"
"			               0,
"
"			               0,
"
"			               'N',
"
"			               cr1.tqphd_pln_date,
"
"			               NULL,
"
"			               cr2.tqpln_pln_no,
"
"			               cr2.tqpln_seq_no,
"
"			               'MI',
"
"			               NULL,
"
"			               cr2.tqpln_pln_no,
"
"			               cr2.tqpln_seq_no,
"
"			               NULL,
"
"			               cr2.tqpln_prod_cls,
"
"			               'QC',
"
"			               'ICM',
"
"			               NULL,
"
"			               NULL,
"
"			               NULL,
"
"			               NULL,
"
"			               p_user,
"
"			               p_prod_cls_desc => cr2.tqpln_prod_cls_desc,
"
"			               p_prod_subcls => cr2.tqpln_prod_subcls,
"
"			               p_prod_subcls_desc => cr2.tqpln_prod_subcls_desc,
"
"			               p_prod_grp => cr2.tqpln_prod_grp,
"
"			               p_prod_grp_desc => cr2.tqpln_prod_grp_desc,
"
"			               p_prod_subgrp => cr2.tqpln_prod_subgrp,
"
"			               p_prod_subgrp_desc => cr2.tqpln_prod_subgrp_desc
"
"    	                              );
"
"
"
"	          v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	          --Raise_Application_Error(-20999,'HRM '||v_stk_batch_no);
"
"	          INSERT INTO inv_stock_trans_cost_batch(istcb_bu,
"
"						         istcb_doc_no,
"
"						         istcb_seq_no,
"
"						         istcb_sub_seq_no,
"
"						         istcb_batch_no,
"
"						         istcb_trans_qty,
"
"						         istcb_stk_trans_qty,
"
"						         istcb_unit_cost,
"
"						         istcb_cre_by,
"
"						         istcb_cre_emp_id,
"
"						         istcb_cre_ip_addr,
"
"						         istcb_cre_os_user,
"
"						         istcb_cre_date,
"
"						         istcb_ins_rec,
"
"						         istcb_sys_ls_no
"
"						        )
"
"                                                  VALUES(p_bu,
"
"					                 v_mi_doc_no,
"
"					                 v_seq_no,
"
"					                 v_sub_seq_no,
"
"					                 r_cb.tqpcb_batch_no,--v_stk_batch_no,
"
"					                 v_cb_upd_qty,--r_ls.LS_Trans_Qty,
"
"					                 v_cb_upd_qty,--r_ls.LS_Stk_Trans_Qty,
"
"					                 r_cb.tqpcb_unit_cost,--v_cb_unit_cost,
"
"					                 p_user,
"
"						         v_emp_id,
"
"						         v_ip_addr,
"
"						         v_os_user,
"
"					                 SYSDATE,
"
"					                 'Y',
"
"					                 r_ls.tqplsd_sys_ls_no
"
"					                );
"
"	          EXIT WHEN v_cb_bal_qty = 0;
"
"	        END LOOP;
"
"	      END IF;
"
"
"
"	    END LOOP;
"
"
"
"	  END IF;
"
"
"
"	ELSE
"
"
"
"	  /*IF cr2.prod_ser_lot_opt = 'N' THEN
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,NULL,NULL,NULL,cr2.Trans_Qty,cr2.Stk_Trans_Qty,0,NULL,NULL,NULL,NULL,p_user);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.tqln_prod_ord_no,
"
"                               NULL,
"
"                               cr2.tqln_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.tqln_prod_id,
"
"                               cr2.tqln_prod_rev,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               cr2.Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.tqhd_plnt,
"
"                               NULL,--cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.tqln_so_pfx,
"
"                               cr2.tqln_so_no,
"
"                               cr2.tqln_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,--cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               TRUNC(cr1.tqhd_date),
"
"                               cr1.tqhd_year,
"
"                               cr1.tqhd_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.tqln_prod_cls,
"
"                               'QC',--cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               v_rcpt_unitcost,--cr2.porl_sc_unit_cost,
"
"                               v_rcpt_unitcost,--cr2.porl_sc_unit_cost * cr2.porh_exchange_rate,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.tqln_so_type,
"
"                               p_proj => cr2.tqln_proj_id,
"
"                               p_task => cr2.tqln_task_id,
"
"		               p_prod_cls_desc => cr2.tqln_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.tqln_prod_subcls,
"
"		               p_prod_sub_cls_desc => cr2.tqln_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.tqln_prod_grp,
"
"		               p_prod_grp_desc => cr2.tqln_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.tqln_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.tqln_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.tqhd_plnt,cr2.tqln_prod_id,cr2.tqln_prod_rev)
"
"                              );
"
"
"
"	ELSE
"
"
"
"	  FOR r_ls IN (SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,
"
"			      (tqmls_accepted_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_aod_qty ELSE 0 END) LS_Trans_Qty,
"
"			      (tqmls_stk_acpt_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_stk_aod_qty ELSE 0 END) LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND (tqmls_accepted_qty + CASE WHEN cr2.pomctrl_aod_rqrd_flag = 'N' THEN tqmls_aod_qty ELSE 0 END) > 0
"
"			  AND cr1.Matl_Type = 'A'
"
"		       UNION ALL
"
"		       SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,
"
"			      tqmls_aod_qty LS_Trans_Qty,tqmls_stk_aod_qty LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND tqmls_aod_qty > 0
"
"			  AND cr1.Matl_Type = 'D' AND cr2.pomctrl_aod_rqrd_flag = 'Y'
"
"		       UNION ALL
"
"		       SELECT tqmls_qc_doc_sub_seq_no,tqmls_sys_ls_no,tqmls_lot_no,tqmls_serial_no,tqmls_source_type,tqmls_source_id,tqmls_expiry_date,
"
"	                      tqmls_org_lot_no,tqmls_mix_lot_no,tqmls_rejected_qty LS_Trans_Qty,
"
"			      tqmls_stk_rej_qty LS_Stk_Trans_Qty
"
"	                 FROM tqm_lot_serial_nos
"
"			WHERE tqmls_bu = p_bu
"
"			  AND tqmls_qc_no = p_qc_no
"
"			  AND tqmls_qc_doc_seq_no = cr2.tqln_seq_no
"
"			  AND tqmls_stk_rej_qty > 0
"
"			  AND cr1.Matl_Type = 'R'
"
"			ORDER BY tqmls_qc_doc_sub_seq_no)
"
"	  LOOP
"
"
"
"	    proc_ins_mat_iss_dtls(p_bu,v_mi_doc_no,v_seq_no,r_ls.tqmls_sys_ls_no,r_ls.tqmls_lot_no,r_ls.tqmls_serial_no,r_ls.LS_Trans_Qty,r_ls.LS_Stk_Trans_Qty,0,r_ls.tqmls_source_type,r_ls.tqmls_source_id,NULL,NULL,p_user);
"
"
"
"	    proc_upd_sf_stocks(p_bu,
"
"                               cr2.tqln_prod_ord_no,
"
"                               NULL,
"
"                               cr2.tqln_sf_code,
"
"                               v_insp_store_id,
"
"                               cr2.tqln_prod_id,
"
"                               cr2.tqln_prod_rev,
"
"                               r_ls.tqmls_sys_ls_no,
"
"                               r_ls.tqmls_lot_no,
"
"                               NULL,
"
"                               NULL,
"
"                               0,
"
"                               r_ls.LS_Stk_Trans_Qty,
"
"                               v_rcpt_unitcost,
"
"                               cr1.tqhd_plnt,
"
"                               NULL,--cr2.porh_suplr_id,
"
"                               'V',
"
"                               cr2.tqln_so_pfx,
"
"                               cr2.tqln_so_no,
"
"                               cr2.tqln_so_seq_no,
"
"                               NULL,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,--cr2.porl_po_no,
"
"                               NULL,
"
"                               cr2.tqln_vou_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               cr2.tqln_vou_line_no,
"
"                               TRUNC(cr1.tqhd_date),
"
"                               cr1.tqhd_year,
"
"                               cr1.tqhd_period,
"
"                               cr2.prod_cost_method,
"
"                               'GRN',
"
"                               'POM',
"
"                               cr2.tqln_prod_cls,
"
"                               'QC',--cr2.porl_upd_ref1,
"
"                               'Check',
"
"                               v_rcpt_unitcost,
"
"                               v_rcpt_unitcost,
"
"                               'SC',
"
"                               p_user,
"
"                               NULL,
"
"                               p_type => cr2.tqln_so_type,
"
"                               p_proj => cr2.tqln_proj_id,
"
"                               p_task => cr2.tqln_task_id,
"
"		               p_prod_cls_desc => cr2.tqln_prod_cls_desc,
"
"		               p_prod_sub_cls_id => cr2.tqln_prod_subcls,
"
"		               p_prod_sub_cls_desc => cr2.tqln_prod_subcls_desc,
"
"		               p_prod_grp_id => cr2.tqln_prod_grp,
"
"		               p_prod_grp_desc => cr2.tqln_prod_grp_desc,
"
"		               p_prod_sub_grp_id => cr2.tqln_prod_subgrp,
"
"		               p_prod_sub_grp_desc => cr2.tqln_prod_subgrp_desc,
"
"		               p_prod_cls_type => func_find_prod_class_type(p_bu,cr1.tqhd_plnt,cr2.tqln_prod_id,cr2.tqln_prod_rev)
"
"                              );
"
"
"
"	  END LOOP;
"
"
"
"	END IF;*/
"
"	NULL;
"
"
"
"	END IF;
"
"      END LOOP c2;
"
"
"
"      DECLARE
"
"        v_jrnl_res	VARCHAR2(1);
"
"	v_jrnl_cnt	NUMBER;
"
"      BEGIN
"
"
"
"        IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"          proc_ins_mat_iss_appl_jrnl(p_bu,cr1.tqphd_plnt,v_mi_doc_no,p_user,p_lang,v_jrnl_res);
"
"
"
"	  IF v_jrnl_res = 'Y' THEN
"
"
"
"	    SELECT COUNT(*) INTO v_jrnl_cnt
"
"	      FROM appl_journals
"
"	     WHERE aj_bu = p_bu
"
"	       AND aj_vou_no = v_mi_doc_no;
"
"
"
"	    IF v_jrnl_cnt = 0 THEN
"
"	      Raise_Application_Error(-20999,'Journal not created.');
"
"	    END IF;
"
"
"
"	    UPDATE inv_stock_trans_hd
"
"	       SET isthd_jrnl_flag = 'Y'
"
"	     WHERE isthd_bu = p_bu
"
"	       AND isthd_doc_no = v_mi_doc_no;
"
"
"
"	  ELSE
"
"
"
"	    Raise_Application_Error(-20999,'Journal not created.');
"
"
"
"	  END IF;
"
"
"
"        END IF;
"
"
"
"      END;
"
"
"
"      proc_issue_mat_frm_mi(p_bu,cr1.tqphd_plnt,v_mi_doc_no,p_user,p_user_emp,p_lang,v_dc_no,v_pack_no);
"
"
"
"      IF func_find_inv_method(p_bu) IN ('T','S') THEN
"
"
"
"        proc_ins_gl_jrnl(p_bu,
"
"                         cr1.tqphd_plnt,
"
"		         cr1.tqphd_pln_date,
"
"		         cr1.tqphd_pln_year,
"
"		         cr1.tqphd_pln_period,
"
"		         NULL,
"
"		         v_mi_doc_no,
"
"		         NULL,
"
"		         'ICM',
"
"		         p_user,
"
"		         1,
"
"		         'MIV '||v_mi_doc_no||' FROM QC '||p_pln_no
"
"		        );
"
"
"
"      END IF;
"
"    END LOOP c1;
"
"
"
"    IF v_mi_doc_no IS NOT NULL THEN
"
"      p_mi_doc_no := func_find_order_no_substr(v_mi_doc_no);
"
"    END IF;
"
"
"
"  END proc_cre_miv_doc_frm_qc_rqst;
"
"
"
"END pkg_mat_iss;"
/
