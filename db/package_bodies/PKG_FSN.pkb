CREATE OR REPLACE
"PACKAGE BODY pkg_fsn
"
"AS
"
"
"
"PROCEDURE proc_ins_fsn_frm_stk(p_bu		IN	VARCHAR2,
"
"			       p_doc_no		IN	VARCHAR2,
"
"			       p_user		IN	VARCHAR2,
"
"			       p_user_emp	IN	VARCHAR2
"
"			      )
"
"AS
"
"BEGIN
"
"
"
"  DELETE FROM inv_fsn_store_dtls
"
"   WHERE ifsd_bu = p_bu
"
"     AND ifsd_doc_no = p_doc_no;
"
"
"
"  DELETE FROM inv_fsn_prod_dtls
"
"   WHERE ifpd_bu = p_bu
"
"     AND ifpd_doc_no = p_doc_no;
"
"
"
"  FOR r_hd IN (SELECT ifh_as_on_date,ifh_f_days,ifh_s_days
"
"                 FROM inv_fsn_hd
"
"		WHERE ifh_bu = p_bu
"
"		  AND ifh_doc_no = p_doc_no)
"
"  LOOP
"
"  --RAISE_APPLICATION_ERROR(-20999,p_bu||p_doc_no);
"
"  BEGIN
"
"    INSERT INTO inv_fsn_store_dtls
"
"    SELECT p_bu,p_doc_no,ROW_NUMBER() OVER(ORDER BY sttr_store_id,sttr_prod_id),sttr_store_id,sttr_prod_id,sttr_prod_rev,prod_desc11,sttr_sf_code,
"
"           sttr_trans_qty,sttr_trans_unitcost,sttr_trans_val,sttr_trans_date,sttr_due_days,
"
"	   CASE WHEN sttr_due_days <= r_hd.ifh_f_days THEN 'F'
"
"	        WHEN sttr_due_days > r_hd.ifh_f_days AND sttr_due_days <= r_hd.ifh_s_days THEN 'S'
"
"		ELSE 'N' END,
"
"	   p_user,p_user_emp,'-','-',SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      FROM (
"
"    SELECT sttr_store_id,sttr_prod_id,sttr_prod_rev,prod_desc11,sttr_sf_code,
"
"           SUM(sttr_trans_qty) sttr_trans_qty,
"
"	   SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_trans_val,
"
"	   SUM(sttr_trans_qty * sttr_bc_unit_cost) / SUM(sttr_trans_qty) sttr_trans_unitcost,
"
"	   MAX(sttr_trans_date) sttr_trans_date,
"
"	   (r_hd.ifh_as_on_date - MAX(sttr_trans_date)) sttr_due_days
"
"    FROM(SELECT sttr_trans_date,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_trans_qty,sttr_bc_unit_cost,NULL sttr_sf_code
"
"	   FROM stock_trans,stores
"
"	  WHERE sttr_bu = store_bu
"
"	    AND sttr_store_id = store_id
"
"	    AND sttr_bu = p_bu
"
"	    AND EXISTS(SELECT 1 FROM inv_fsn_plnt WHERE ifp_bu = p_bu AND ifp_doc_no = p_doc_no AND ifp_plnt_loc_id = store_plnt_loc_id AND ifp_sel_flag = 'Y')
"
"	    AND TRUNC(sttr_trans_date) <= r_hd.ifh_as_on_date
"
"	    AND sttr_bucket_type = 'QOH'
"
"	  UNION ALL
"
"	 SELECT stsfg_trans_date,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_trans_qty,stsfg_unit_cost,stsfg_sf_code
"
"           FROM stock_trans_sfg,stores
"
"	  WHERE stsfg_bu = store_bu
"
"	    AND stsfg_store_id = store_id
"
"	    AND stsfg_bu = p_bu
"
"	    AND EXISTS(SELECT 1 FROM inv_fsn_plnt WHERE ifp_bu = p_bu AND ifp_doc_no = p_doc_no AND ifp_plnt_loc_id = store_plnt_loc_id AND ifp_sel_flag = 'Y')
"
"	    AND TRUNC(stsfg_trans_date) <= r_hd.ifh_as_on_date
"
"	    AND stsfg_bucket_type = 'QOH'),products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"      GROUP BY sttr_store_id,sttr_prod_id,sttr_prod_rev,prod_desc11,sttr_sf_code
"
"      HAVING SUM(sttr_trans_qty) <> 0);
"
"
"
"   EXCEPTION    WHEN OTHERS THEN
"
"     Raise_application_Error(-20999,SQLERRM);
"
"    END;
"
"
"
"    INSERT INTO inv_fsn_prod_dtls
"
"    SELECT p_bu,p_doc_no,ROW_NUMBER() OVER(ORDER BY sttr_prod_id),sttr_prod_id,sttr_prod_rev,prod_desc11,sttr_sf_code,
"
"           sttr_trans_qty,sttr_trans_unitcost,sttr_trans_val,sttr_trans_date,sttr_due_days,
"
"	   CASE WHEN sttr_due_days <= r_hd.ifh_f_days THEN 'F'
"
"	        WHEN sttr_due_days > r_hd.ifh_f_days AND sttr_due_days <= r_hd.ifh_s_days THEN 'S'
"
"		ELSE 'N' END,
"
"	   p_user,p_user_emp,'-','-',SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      FROM (
"
"    SELECT sttr_prod_id,sttr_prod_rev,prod_desc11,sttr_sf_code,
"
"           SUM(sttr_trans_qty) sttr_trans_qty,
"
"	   SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_trans_val,
"
"	   SUM(sttr_trans_qty * sttr_bc_unit_cost) / SUM(sttr_trans_qty) sttr_trans_unitcost,
"
"	   MAX(sttr_trans_date) sttr_trans_date,
"
"	   (r_hd.ifh_as_on_date - MAX(sttr_trans_date)) sttr_due_days
"
"    FROM(SELECT sttr_trans_date,sttr_prod_id,sttr_prod_rev,sttr_trans_qty,sttr_bc_unit_cost,NULL sttr_sf_code
"
"	   FROM stock_trans,stores
"
"	  WHERE sttr_bu = store_bu
"
"	    AND sttr_store_id = store_id
"
"	    AND sttr_bu = p_bu
"
"	    AND EXISTS(SELECT 1 FROM inv_fsn_plnt WHERE ifp_bu = p_bu AND ifp_doc_no = p_doc_no AND ifp_plnt_loc_id = store_plnt_loc_id AND ifp_sel_flag = 'Y')
"
"	    AND TRUNC(sttr_trans_date) <= r_hd.ifh_as_on_date
"
"	    AND sttr_bucket_type = 'QOH'
"
"	  UNION ALL
"
"	 SELECT stsfg_trans_date,stsfg_prod_id,stsfg_prod_rev,stsfg_trans_qty,stsfg_unit_cost,stsfg_sf_code
"
"           FROM stock_trans_sfg,stores
"
"	  WHERE stsfg_bu = store_bu
"
"	    AND stsfg_store_id = store_id
"
"	    AND stsfg_bu = p_bu
"
"	    AND EXISTS(SELECT 1 FROM inv_fsn_plnt WHERE ifp_bu = p_bu AND ifp_doc_no = p_doc_no AND ifp_plnt_loc_id = store_plnt_loc_id AND ifp_sel_flag = 'Y')
"
"	    AND TRUNC(stsfg_trans_date) <= r_hd.ifh_as_on_date
"
"	    AND stsfg_bucket_type = 'QOH'),products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"      GROUP BY sttr_prod_id,sttr_prod_rev,prod_desc11,sttr_sf_code
"
"      HAVING SUM(sttr_trans_qty) <> 0);
"
"
"
"  END LOOP;
"
"
"
"
"
"END proc_ins_fsn_frm_stk;
"
"
"
"END pkg_fsn;"
/
