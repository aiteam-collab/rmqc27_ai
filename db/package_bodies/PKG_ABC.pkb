CREATE OR REPLACE
"PACKAGE BODY pkg_abc
"
"AS
"
"
"
"PROCEDURE proc_ins_abc_frm_stk(p_bu		IN	VARCHAR2,
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
"  DELETE FROM prod_abc_cls_ln
"
"   WHERE pacl_bu = p_bu
"
"     AND pacl_doc_no = p_doc_no;
"
"
"
"  FOR r_hd IN (SELECT pach_as_on_date,pach_a_cls,pach_b_cls
"
"                 FROM prod_abc_cls_hd
"
"		WHERE pach_bu = p_bu
"
"		  AND pach_doc_no = p_doc_no)
"
"  LOOP
"
"
"
"    INSERT INTO prod_abc_cls_ln
"
"    SELECT p_bu,p_doc_no,ROW_NUMBER() OVER(ORDER BY sttr_prod_id),sttr_prod_id,sttr_prod_rev,prod_desc11,
"
"           sttr_trans_qty,sttr_trans_unitcost,sttr_trans_val,
"
"	   CASE WHEN sttr_trans_unitcost >= r_hd.pach_a_cls THEN 'A'
"
"	        WHEN sttr_trans_unitcost < r_hd.pach_a_cls AND sttr_trans_unitcost >= r_hd.pach_b_cls THEN 'B'
"
"		ELSE 'C' END,
"
"	   p_user,p_user_emp,'-','-',SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      FROM (
"
"    SELECT sttr_prod_id,sttr_prod_rev,prod_desc11,
"
"           SUM(sttr_trans_qty) sttr_trans_qty,
"
"	   SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_trans_val,
"
"	   SUM(sttr_trans_qty * sttr_bc_unit_cost) / SUM(sttr_trans_qty) sttr_trans_unitcost
"
"    FROM(SELECT sttr_prod_id,sttr_prod_rev,sttr_trans_qty,sttr_bc_unit_cost
"
"	   FROM stock_trans,stores
"
"	  WHERE sttr_bu = store_bu
"
"	    AND sttr_store_id = store_id
"
"	    AND sttr_bu = p_bu
"
"	    AND EXISTS(SELECT 1 FROM prod_abc_cls_plnt WHERE pacp_bu = p_bu AND pacp_doc_no = p_doc_no AND pacp_plnt_loc_id = store_plnt_loc_id AND pacp_sel_flag = 'Y')
"
"	    AND TRUNC(sttr_trans_date) <= r_hd.pach_as_on_date
"
"	    AND sttr_bucket_type = 'QOH'
"
"	  UNION ALL
"
"	 SELECT stsfg_prod_id,stsfg_prod_rev,stsfg_trans_qty,stsfg_unit_cost
"
"           FROM stock_trans_sfg,stores
"
"	  WHERE stsfg_bu = store_bu
"
"	    AND stsfg_store_id = store_id
"
"	    AND stsfg_bu = p_bu
"
"	    AND EXISTS(SELECT 1 FROM prod_abc_cls_plnt WHERE pacp_bu = p_bu AND pacp_doc_no = p_doc_no AND pacp_plnt_loc_id = store_plnt_loc_id AND pacp_sel_flag = 'Y')
"
"	    AND TRUNC(stsfg_trans_date) <= r_hd.pach_as_on_date
"
"	    AND stsfg_bucket_type = 'QOH'),products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"      GROUP BY sttr_prod_id,sttr_prod_rev,prod_desc11
"
"      HAVING SUM(sttr_trans_qty) <> 0);
"
"
"
"  END LOOP;
"
"END proc_ins_abc_frm_stk;
"
"
"
"END pkg_abc;"
/
