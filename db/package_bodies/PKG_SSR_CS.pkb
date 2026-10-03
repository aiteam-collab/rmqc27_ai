CREATE OR REPLACE
"PACKAGE BODY pkg_ssr_cs
"
"AS
"
"  PROCEDURE proc_load_ssr_cs(p_bu		VARCHAR2,
"
"			     p_plnt		VARCHAR2,
"
"			     p_plnt_loc_id	VARCHAR2,
"
"			     p_doc_no		VARCHAR2,
"
"			     p_ssr_no	        VARCHAR2,
"
"			     p_fr_date		DATE,
"
"			     p_to_date		DATE,
"
"			     p_user		VARCHAR2,
"
"			     p_res	OUT	VARCHAR2
"
"			     )
"
"
"
"  AS
"
"  v_emp_id	VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr	VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"  v_os_user	VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"  BEGIN
"
"  p_res := 'Y';
"
"
"
"  DELETE FROM ssr_cls_ln
"
"    WHERE scln_bu = p_bu
"
"      AND scln_doc_no = p_doc_no;
"
"
"
"   BEGIN
"
"   --RAISE_APPLICATION_ERROR(-20999,'HRM test'||p_plnt||'~'||p_plnt_loc_id||'~'||p_doc_no||'~'||p_ssr_no||'~'||p_fr_date||'~'||p_to_date);
"
"     INSERT INTO ssr_cls_ln(scln_bu,
"
"                            scln_doc_no,
"
"                            scln_seq_no,
"
"                            scln_ssr_pfx,
"
"                            scln_ssr_no,
"
"                            scln_ssr_seq_no,
"
"                            scln_store_id,
"
"                            scln_store_name,
"
"                            scln_prod_id,
"
"                            scln_prod_rev,
"
"                            scln_prod_desc,
"
"                            scln_pur_uom,
"
"                            scln_rqst_qty,
"
"                            scln_ord_qty,
"
"                            scln_cls_qty,
"
"							scln_cls_inproc_qty,
"
"                            scln_cls_proc_qty,
"
"                            scln_cre_by,
"
"                            scln_cre_emp_id,
"
"                            scln_cre_ip_addr,
"
"                            scln_cre_os_user,
"
"                            scln_cre_date
"
"			   )
"
"     SELECT p_bu,p_doc_no, ROW_NUMBER() OVER (ORDER BY ssrl_rqst_no,ssrl_seq_no) seq_no,
"
"            ssrh_rqst_pfx,ssrh_rqst_no,ssrl_seq_no,
"
"	    ssrh_store_id,(SELECT store_desc1 FROM stores WHERE store_bu = p_bu AND store_id = ssrh_store_id) store_name,
"
"            ssrl_prod_id,ssrl_prod_rev,(SELECT prod_desc11 FROM products WHERE prod_bu = p_bu AND prod_id = ssrl_prod_id AND prod_rev = ssrl_prod_rev) prod_desc,
"
"            ssrl_prod_uom,ssrl_firm_per_qty,(ssrl_inproc_qty),
"
"            ssrl_cls_qty,ssrl_cls_inproc_qty,(ssrl_firm_per_qty -(ssrl_inproc_qty + ssrl_cls_qty + ssrl_cls_inproc_qty)) bal_qty,
"
"	    p_user,v_emp_id,v_ip_addr,v_os_user,SYSDATE
"
"       FROM suplr_sch_rqst_hd t1,suplr_sch_rqst_ln t2
"
"      WHERE ssrh_bu = ssrl_bu
"
"        AND ssrh_rqst_no = ssrl_rqst_no
"
"        AND ssrh_status = 'A'
"
"	    AND (ssrl_firm_per_qty - (ssrl_inproc_qty + ssrl_cls_qty + ssrl_cls_inproc_qty)) > 0
"
"        AND ssrl_status NOT IN ('T', 'R', 'C', 'L')
"
"	AND ssrh_bu = p_bu
"
"	AND ssrh_plnt = p_plnt
"
"	AND ssrh_plnt_loc_id = p_plnt_loc_id
"
"	AND (ssrh_rqst_no = p_ssr_no OR p_ssr_no IS NULL)
"
"	AND (ssrh_rqst_date >= TRUNC(p_fr_date) OR p_fr_date IS NULL)
"
"	AND (ssrh_rqst_date <= TRUNC(p_to_date) OR p_to_date IS NULL)
"
"	/*AND NOT EXISTS(SELECT 1
"
"	                 FROM ssr_cls_hd,ssr_cls_ln
"
"					WHERE schd_bu = scln_bu
"
"					  AND schd_doc_no = scln_doc_no
"
"					  AND scln_bu = ssrl_bu
"
"					  AND scln_ssr_no = ssrl_rqst_no
"
"					  AND scln_ssr_seq_no = ssrl_seq_no
"
"					  --AND scln_sel_flag = 'Y'
"
"					  AND schd_status IN ('E','N')
"
"					  )*/;
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     p_res := 'N';
"
"   END;
"
"  END proc_load_ssr_cs;
"
"
"
"  PROCEDURE proc_cre_ssr_cs(p_bu		VARCHAR2,
"
"			    p_doc_no		VARCHAR2,
"
"			    p_user		VARCHAR2
"
"			   )
"
"
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM ssr_cls_ln
"
"   WHERE scln_bu = p_bu
"
"     AND scln_doc_no = p_doc_no
"
"     AND scln_cls_proc_qty > 0
"
"     AND scln_sel_flag = 'Y';
"
"
"
"  BEGIN
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"    UPDATE suplr_sch_rqst_ln
"
"	   SET ssrl_cls_inproc_qty = ssrl_cls_inproc_qty - cr1.scln_cls_proc_qty,
"
"	       ssrl_cls_qty = ssrl_cls_qty + cr1.scln_cls_proc_qty,
"
"		   ssrl_sel_flag = 'N',
"
"	       ssrl_upd_by = p_user,
"
"	       ssrl_upd_date = SYSDATE
"
"	 WHERE ssrl_bu = p_bu
"
"	   AND ssrl_rqst_no = cr1.scln_ssr_no
"
"	   AND ssrl_seq_no = cr1.scln_ssr_seq_no;
"
"    END LOOP;
"
"  END proc_cre_ssr_cs;
"
"
"
"END pkg_ssr_cs;"
/
