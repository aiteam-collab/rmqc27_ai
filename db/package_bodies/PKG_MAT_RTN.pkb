CREATE OR REPLACE
"PACKAGE BODY pkg_mat_rtn
"
"AS
"
"  PROCEDURE proc_load_doc_frm_mrtn(p_bu			VARCHAR2,
"
"                                   p_doc_no		VARCHAR2,
"
"                                   p_frm_wh_type	VARCHAR2,
"
"				   p_frm_wh_id		VARCHAR2,
"
"				   p_sou_type		VARCHAR2,
"
"				   p_matl_type		VARCHAR2,
"
"				   p_mi_doc_no		VARCHAR2,
"
"				   p_prod_ord_no	VARCHAR2,
"
"				   p_lot_no		VARCHAR2,
"
"				   p_ser_no		VARCHAR2,
"
"				   p_res_id		VARCHAR2,
"
"				   p_user		VARCHAR2
"
"				  )
"
"  AS
"
"
"
"    TYPE stk_dtls IS RECORD(store_id		inv_stock_trans_hd_hist.isthdh_issueto_id%TYPE,
"
"                            prod_id		inv_stock_trans_ln_hist.istlnh_prod_id%TYPE,
"
"			    prod_rev		inv_stock_trans_ln_hist.istlnh_prod_rev%TYPE,
"
"			    stk_qty		inv_stock_batch_details_hist.isbdh_trans_qty%TYPE,
"
"		            lot_no		inv_stock_batch_details_hist.isbdh_lot_no%TYPE,
"
"		            ser_no		inv_stock_batch_details_hist.isbdh_serial_no%TYPE,
"
"			    sys_ls_no		inv_stock_batch_details_hist.isbdh_sys_ls_no%TYPE,
"
"			    sou_type		inv_stock_batch_details_hist.isbdh_source_type%TYPE,
"
"			    sou_id		inv_stock_batch_details_hist.isbdh_source_id%TYPE,
"
"		            crate_id		VARCHAR2(10),
"
"			    trans_no		stock_wip_order_qty.swoq_trans_no%TYPE,
"
"			    ord_type		VARCHAR2(6),
"
"			    ord_no		inv_stock_trans_ln_hist.istlnh_ord_no%TYPE,
"
"			    sf_code		inv_stock_trans_ln_hist.istlnh_sf_code%TYPE,
"
"			    oprn_seq_no		inv_stock_trans_ln_hist.istlnh_oprn_ln_seq_no%TYPE,
"
"			    proc_id		inv_stock_trans_ln_hist.istlnh_process_id%TYPE,
"
"			    expiry_date		DATE,
"
"			    ord_trans_no	VARCHAR2(30),
"
"			    unitcost		inv_stock_trans_ln_hist.istlnh_unit_cost%TYPE,
"
"			    batch_no		lot_ser_stocks.lss_batch_no%TYPE,
"
"			    so_type		inv_stock_trans_ln_hist.istlnh_type%TYPE,
"
"			    so_pfx		inv_stock_trans_ln_hist.istlnh_so_pfx%TYPE,
"
"                            so_no		inv_stock_trans_ln_hist.istlnh_so_no%TYPE,
"
"			    so_seq_no		inv_stock_trans_ln_hist.istlnh_so_seq_no%TYPE,
"
"			    so_sub_seq_no	inv_stock_trans_ln_hist.istlnh_so_sub_seq_no%TYPE,
"
"			    proj_id		inv_stock_trans_ln_hist.istlnh_proj_id%TYPE,
"
"			    task_id		inv_stock_trans_ln_hist.istlnh_task_id%TYPE,
"
"			    so_ref		inv_stock_trans_ln_hist.istlnh_so_schld_desc%TYPE,
"
"			    mi_doc_no		inv_stock_trans_ln_hist.istlnh_doc_no%TYPE,
"
"			    mi_seq_no		inv_stock_trans_ln_hist.istlnh_seq_no%TYPE,
"
"			    mi_sub_seq_no	inv_stock_batch_details_hist.isbdh_sub_seq_no%TYPE,
"
"			    prod_uom            products.prod_uom%TYPE,
"
"			    heat_no		inv_stock_batch_details_hist.isbdh_heat_no%TYPE,
"
"			    test_no		inv_stock_batch_details_hist.isbdh_test_no%TYPE,
"
"			    batch_id 		stocks_batches.sb_batch_id%TYPE,
"
"			    conv_factor         inv_stock_trans_ln_hist.istlnh_conv_factor%TYPE
"
"		           );
"
"
"
"    TYPE typ_mrl IS TABLE OF stk_dtls INDEX BY PLS_INTEGER;
"
"    r_mrl    typ_mrl;
"
"    dml_errors EXCEPTION;
"
"    PRAGMA EXCEPTION_INIT(dml_errors, -24381);
"
"    v_bc_cnt   NUMBER;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM temp_mat_return
"
"     WHERE tmr_bu = p_bu;
"
"
"
"    --Raise_application_error(-20999,'HRM'||p_sou_type||'~'||p_frm_wh_id||'~'||p_matl_type);
"
"
"
"    IF p_sou_type = 'S' THEN
"
"
"
"      SELECT * BULK COLLECT INTO r_mrl
"
"        FROM (SELECT swoq_store_id store_id,
"
"                     swoq_prod_id prod_id,
"
"                     swoq_prod_rev prod_rev,
"
"                     (swoq_qty - swoq_qty_allocated) stock_qty,
"
"                     swoq_lot_no lot_no,
"
"                     swoq_ser_no ser_no,
"
"                     swoq_sys_ls_no sys_ls_no,
"
"                     swoq_source_type source_type,
"
"                     swoq_source_id source_id,
"
"                     swoq_crate_id crate_id,
"
"                     swoq_trans_no trans_no,
"
"                     'S' order_type,
"
"                     swoq_order_no order_no,
"
"                     NULL sf_code,
"
"		     swoq_oprn_ln_seq_no oprn_seq_no,
"
"                     NULL process_id,
"
"                     swoq_expiry_date expiry_date,
"
"                     null swoq_ord_trans_no,
"
"                     NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = swoq_bu AND stcost_store_id = swoq_store_id AND stcost_prod_id = swoq_prod_id AND stcost_prod_rev = swoq_prod_rev),0) unitcost,
"
"                     NULL Batch_No,
"
"                     'N' so_type,
"
"		     NULL so_pfx,
"
"		     NULL so_no,
"
"		     NULL so_seq_no,
"
"		     NULL so_sub_seq_no,
"
"		     NULL proj_id,
"
"		     NULL task_id,
"
"		     NULL so_ref,
"
"		     NULL mi_doc_no,
"
"		     NULL mi_seq_no,
"
"		     NULL mi_sub_seq_no,
"
"		     prod_uom,
"
"		     NULL heat_no,
"
"		     swoq_test_no test_no,
"
"		     swoq_batch_id batch_id,
"
"		     NULL conv_factor
"
"                FROM stock_wip_order_qty,stores,products
"
"               WHERE swoq_bu = store_bu
"
"                 AND swoq_store_id = store_id
"
"                 AND prod_bu = swoq_bu
"
"                 AND prod_id = swoq_prod_id
"
"                 AND prod_rev = swoq_prod_rev
"
"                 AND swoq_bu = p_bu
"
"                 AND swoq_order_type = 'PO'
"
"                 AND swoq_store_id = p_frm_wh_id
"
"                 AND prod_cons_type = 'P'
"
"                 AND (swoq_qty - swoq_qty_allocated) > 0
"
"                 --AND store_physical NOT IN ('N','L')
"
"                 AND p_frm_wh_type = 'W'
"
"		 AND (p_matl_type = 'S' OR p_matl_type = 'A')
"
"              UNION ALL
"
"              SELECT stock_store_id store_id,
"
"                     stock_prod_id prod_id,
"
"     	             stock_prod_rev prod_rev,
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
"	             NULL crate_id,
"
"     	             NULL trans_no,
"
"	             'S' order_type,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"     	             NULL expiry_date ,
"
"     	             NULL swoq_ord_trans_no,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = stock_bu AND stcost_store_id = stock_store_id AND stcost_prod_id = stock_prod_id AND stcost_prod_rev = stock_prod_rev),0) unitcost,
"
"	             NULL batch_no,
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
"		     NULL mi_doc_no,
"
"		     NULL mi_seq_no,
"
"		     NULL mi_sub_seq_no,
"
"		     prod_uom,
"
"		     NULL heat_no,
"
"		     NULL test_no,
"
"		     NULL batch_id,
"
"		     NULL conv_factor
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
"                 AND stock_store_id = p_frm_wh_id
"
"                 AND (stock_qty_hand - (stock_qty_mi_allocated + stock_qty_picked)) > 0
"
"                 --AND (sqoh_so_qty - sqoh_so_alloc_qty) > 0
"
"                 AND (prod_cons_type = 'L' OR (prod_cons_type = 'P' AND p_frm_wh_type <> 'W'))
"
"                 AND prod_ser_lot_opt = 'N'
"
"		 AND (p_matl_type = 'S' OR p_matl_type = 'A')
"
"              UNION ALL
"
"              SELECT stock_store_id store_id,
"
"                     stock_prod_id prod_id,
"
"     	             stock_prod_rev prod_rev,
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
"	             NULL crate_id,
"
"     	             NULL trans_no,
"
"	             'S' order_type,
"
"     	             NULL order_no,
"
"     	             NULL sf_code,
"
"		     NULL oprn_seq_no,
"
"     	             NULL process_id,
"
"     	             lss_expiry_date expiry_date,
"
"     	             NULL swoq_ord_trans_no,
"
"	             NVL((SELECT stcost_cost FROM stock_costs WHERE stcost_bu = stock_bu AND stcost_store_id = stock_store_id AND stcost_prod_id = stock_prod_id AND stcost_prod_rev = stock_prod_rev),0) unitcost,
"
"	             lss_batch_no,
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
"		     NULL,
"
"		     NULL mi_doc_no,
"
"		     NULL mi_seq_no,
"
"		     NULL mi_sub_seq_no,
"
"		     prod_uom,
"
"		     lss_heat_no heat_no,
"
"		     lss_test_no test_no,
"
"		     NULL batch_id,
"
"		     NULL conv_factor
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
"                 AND stock_store_id = p_frm_wh_id
"
"                 AND (lss_qty_hand - lss_qty_allocated) > 0
"
"                 AND (prod_cons_type = 'L' OR (prod_cons_type = 'P' AND p_frm_wh_type <> 'W'))
"
"                 AND prod_ser_lot_opt <> 'N'
"
"		 AND (p_matl_type = 'S' OR p_matl_type = 'A')
"
"		 AND(lss_lot_no =p_lot_no OR p_lot_no IS NULL)
"
"		 AND(lss_ser_no =p_ser_no OR p_ser_no IS NULL)
"
"              UNION ALL
"
"              SELECT stsfs_store_id store_id,
"
"                     stsfs_prod_id prod_id,
"
"                     stsfs_prod_rev prod_rev,
"
"                     NVL((sfsos_qty - sfsos_allocated_qty),(stsfs_qty - stsfs_alloc_qty)) stock_qty,
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
"	             NULL crate_id,
"
"    	             stsfs_trans_no trans_no,
"
"	             'F' order_type,
"
"                     stsfs_ord_no order_no,
"
"                     stsfs_sf_code sf_code,
"
"		     stsfs_oprn_ln_seq_no oprn_seq_no,
"
"                     stsfs_process_id process_id,
"
"                     stsfs_expiry_date expiry_date,
"
"                     NULL swoq_ord_trans_no,
"
"	             stsfs_unit_cost unitcost,
"
"	             NULL Batch_No,
"
"	             sfsos_type,
"
"                     sfsos_so_prefix,
"
"                     sfsos_so_no,
"
"                     sfsos_so_seq_no,
"
"                     sfsos_so_sub_seq_no,
"
"                     sfsos_proj_id,
"
"                     sfsos_task_id,
"
"                     sfsos_so_schld_desc,
"
"		     NULL mi_doc_no,NULL mi_seq_no,NULL mi_sub_seq_no,NULL prod_uom,
"
"		     (SELECT plsn_heat_no FROM prod_lot_ser_nos WHERE plsn_bu = p_bu AND plsn_sys_ls_no = stsfs_sys_ls_no) heat_no,
"
"		     (SELECT plsn_test_no FROM prod_lot_ser_nos WHERE plsn_bu = p_bu AND plsn_sys_ls_no = stsfs_sys_ls_no) test_no,
"
"		     stsfs_batch_id batch_id,NULL conv_factor
"
"                FROM store_sf_stocks,store_sf_so_stock
"
"               WHERE stsfs_bu = sfsos_bu(+)
"
"                 AND stsfs_trans_no = sfsos_trans_no(+)
"
"	         AND stsfs_bu = p_bu
"
"                 AND stsfs_store_id = p_frm_wh_id
"
"                 AND (stsfs_qty - stsfs_alloc_qty) > 0
"
"		 AND (p_matl_type = 'F' OR p_matl_type = 'A')
"
"		 AND (stsfs_ord_no = p_prod_ord_no OR p_prod_ord_no IS NULL)
"
"		 AND (stsfs_lot_no = p_lot_no OR p_lot_no IS NULL)
"
"		 AND (stsfs_serial_no = p_ser_no OR p_ser_no IS NULL)
"
"		);
"
"
"
"    --Raise_Application_Error(-20999,'HRM '||p_matl_type);
"
"    FORALL i IN 1..r_mrl.COUNT
"
"    INSERT INTO temp_mat_return(tmr_bu,
"
"				tmr_doc_no,
"
"				tmr_store_id,
"
"				tmr_prod_id,
"
"				tmr_prod_rev,
"
"				tmr_avil_qty,
"
"				tmr_trans_qty,
"
"				tmr_sel_flag,
"
"				tmr_lot_no,
"
"				tmr_serial_no,
"
"				tmr_sys_ls_no,
"
"				tmr_expiry_date,
"
"				tmr_source_id,
"
"				tmr_source_type,
"
"				tmr_cre_by,
"
"				tmr_cre_date,
"
"				tmr_unit_cost,
"
"				tmr_sg_flag,
"
"				tmr_po_ord_no,
"
"				tmr_sf_code,
"
"				tmr_oprn_ln_seq_no,
"
"				tmr_process_id,
"
"				tmr_ord_trans_no,
"
"				tmr_tr_wgt,
"
"				tmr_crate_id,
"
"				tmr_batch_no,
"
"				tmr_so_type,
"
"				tmr_so_order_pfx,
"
"				tmr_so_ord_no,
"
"				tmr_so_line_no,
"
"				tmr_so_sub_seq_no,
"
"				tmr_proj_id,
"
"				tmr_task_id,
"
"				tmr_so_schld_desc,
"
"				tmr_prod_uom,
"
"				tmr_heat_no,
"
"				tmr_test_no,
"
"				tmr_conv_factor,
"
"				tmr_batch_id
"
"			       )
"
"                         VALUES(p_bu,
"
"				p_doc_no,
"
"				r_mrl(i).store_id,
"
"				r_mrl(i).prod_id,
"
"				r_mrl(i).prod_rev,
"
"				r_mrl(i).stk_qty,
"
"				r_mrl(i).stk_qty,
"
"				'N',
"
"				r_mrl(i).lot_no,
"
"				r_mrl(i).ser_no,
"
"				r_mrl(i).sys_ls_no,
"
"				r_mrl(i).expiry_date,
"
"				r_mrl(i).sou_id,
"
"				r_mrl(i).sou_type,
"
"				p_user,
"
"				SYSDATE,
"
"				r_mrl(i).unitcost,
"
"				r_mrl(i).ord_type,
"
"				r_mrl(i).ord_no,
"
"				r_mrl(i).sf_code,
"
"				r_mrl(i).oprn_seq_no,
"
"				r_mrl(i).proc_id,
"
"				r_mrl(i).trans_no,
"
"				0,
"
"				r_mrl(i).crate_id,
"
"				r_mrl(i).batch_no,
"
"				r_mrl(i).so_type,
"
"				r_mrl(i).so_pfx,
"
"				r_mrl(i).so_no,
"
"				r_mrl(i).so_seq_no,
"
"				r_mrl(i).so_sub_seq_no,
"
"				r_mrl(i).proj_id,
"
"				r_mrl(i).task_id,
"
"				r_mrl(i).so_ref,
"
"				r_mrl(i).prod_uom,
"
"				r_mrl(i).heat_no,
"
"			        r_mrl(i).test_no,
"
"				1,
"
"				r_mrl(i).batch_id
"
"			       );
"
"
"
"    ELSE
"
"
"
"      --Raise_Application_Error(-20999,'HRM '||p_frm_wh_type||'~'||p_mi_doc_no||'~'||p_prod_ord_no||'~'||p_res_id||'~'||p_lot_no||'~'||p_ser_no||'~'||p_matl_type);
"
"      SELECT isthdh_issueto_id,istlnh_prod_id,istlnh_prod_rev,(isbdh_trans_qty - (isbdh_rtn_inproc_qty + isbdh_rtn_qty)),
"
"             isbdh_lot_no,isbdh_serial_no,isbdh_sys_ls_no,
"
"             isbdh_source_type,isbdh_source_id,NULL,NULL,istlnh_mat_type,istlnh_ord_no,
"
"	     istlnh_sf_code,istlnh_oprn_ln_seq_no,istlnh_process_id,isbdh_expiry_date,NULL,istlnh_unit_cost,isbdh_batch_no,
"
"	     istlnh_type,istlnh_so_pfx,istlnh_so_no,istlnh_so_seq_no,istlnh_so_sub_seq_no,
"
"	     istlnh_proj_id,istlnh_task_id,istlnh_so_schld_desc,istlnh_doc_no,istlnh_seq_no,isbdh_sub_seq_no,istlnh_prod_uom,isbdh_heat_no,isbdh_test_no,
"
"	     (SELECT sb_batch_id
"
"	        FROM stocks_batches
"
"	       WHERE sb_bu = istlnh_bu
"
"	         AND sb_store_id = isthdh_issueto_id
"
"		 AND sb_prod_id = istlnh_prod_id
"
"		 AND sb_prod_rev = istlnh_prod_rev
"
"		 AND sb_sys_ls_no = isbdh_sys_ls_no
"
"		 AND EXISTS(SELECT 1
"
"		              FROM inv_stock_trans_ln_hist t2
"
"			     WHERE t2.istlnh_bu = l1.istlnh_bu
"
"			       AND t2.istlnh_mi_doc_no = l1.istlnh_doc_no
"
"			       AND t2.istlnh_mi_seq_no = l1.istlnh_seq_no
"
"			       AND t2.istlnh_bu = sb_bu
"
"			       AND t2.istlnh_doc_no = sb_po_no
"
"			       AND t2.istlnh_seq_no = sb_receipt_seq_no
"
"			       AND t2.istlnh_status = 'I')) isbdh_batch_id,istlnh_conv_factor
"
"        BULK COLLECT INTO r_mrl
"
"        FROM inv_stock_trans_hd_hist H1,inv_stock_trans_ln_hist l1,inv_stock_batch_details_hist
"
"       WHERE isthdh_bu = istlnh_bu
"
"         AND isthdh_doc_no = istlnh_doc_no
"
"	 AND isbdh_bu = istlnh_bu
"
"	 AND isbdh_issue_doc_no = istlnh_doc_no
"
"	 AND isbdh_seq_no = istlnh_seq_no
"
"	 AND isthdh_doc_oper <> 'R'
"
"	 AND isthdh_issueto_type <> 'Q'
"
"         AND isthdh_status = 'I'
"
"         AND istlnh_status = 'I'
"
"         --AND isthdh_issueto_type IN ('D','P','O')
"
"         AND isthdh_issueto_id = CASE WHEN p_frm_wh_type = 'E' THEN (SELECT store_inv_id FROM stores WHERE store_bu = p_bu AND store_id = p_frm_wh_id) ELSE p_frm_wh_id END
"
"         AND isthdh_bu = p_bu
"
"	 AND (isthdh_doc_no = p_mi_doc_no OR p_mi_doc_no IS NULL)
"
"	 AND (istlnh_po_ord_no = p_prod_ord_no OR p_prod_ord_no IS NULL)
"
"	 AND (isthdh_res_id = p_res_id OR p_res_id IS NULL)
"
"	 AND (isbdh_lot_no = p_lot_no OR p_lot_no IS NULL)
"
"	 AND (isbdh_serial_no = p_ser_no OR p_ser_no IS NULL)
"
"	 AND (istlnh_mat_type = p_matl_type OR p_matl_type = 'A')
"
"	 AND (isbdh_trans_qty - (isbdh_rtn_inproc_qty + isbdh_rtn_qty)) > 0
"
"	 AND ((p_frm_wh_type NOT IN ('D','P')
"
"	 AND EXISTS(SELECT 1
"
"                          FROM inv_stock_trans_hd_hist H2,inv_stock_trans_ln_hist L2
"
"                         WHERE H2.isthdh_bu = L2.istlnh_bu
"
"			   AND H2.isthdh_doc_no = L2.istlnh_doc_no
"
"			   AND L2.istlnh_bu = L1.istlnh_bu
"
"                           AND L2.istlnh_mi_doc_no = L1.istlnh_doc_no
"
"			   AND L2.istlnh_mi_seq_no = L1.istlnh_seq_no
"
"			   AND H2.isthdh_doc_oper = 'R'
"
"			   AND L2.istlnh_status = 'I'))
"
"        OR p_frm_wh_type IN('D','P'));
"
"  --Raise_Application_Error(-20999,'HRM'||'~'||p_frm_wh_type);
"
"  --  BEGIN
"
"    FORALL i IN 1..r_mrl.COUNT --SAVE EXCEPTIONS
"
"    INSERT INTO temp_mat_return(tmr_bu,
"
"				tmr_doc_no,
"
"				tmr_store_id,
"
"				tmr_prod_id,
"
"				tmr_prod_rev,
"
"				tmr_avil_qty,
"
"				tmr_trans_qty,
"
"				tmr_sel_flag,
"
"				tmr_lot_no,
"
"				tmr_serial_no,
"
"				tmr_sys_ls_no,
"
"				tmr_expiry_date,
"
"				tmr_source_id,
"
"				tmr_source_type,
"
"				tmr_cre_by,
"
"				tmr_cre_date,
"
"				tmr_unit_cost,
"
"				tmr_sg_flag,
"
"				tmr_po_ord_no,
"
"				tmr_sf_code,
"
"				tmr_oprn_ln_seq_no,
"
"				tmr_process_id,
"
"				tmr_ord_trans_no,
"
"				tmr_tr_wgt,
"
"				tmr_crate_id,
"
"				tmr_batch_no,
"
"				tmr_so_type,
"
"				tmr_so_order_pfx,
"
"				tmr_so_ord_no,
"
"				tmr_so_line_no,
"
"				tmr_so_sub_seq_no,
"
"				tmr_proj_id,
"
"				tmr_task_id,
"
"				tmr_so_schld_desc,
"
"				tmr_iss_doc_no,
"
"				tmr_iss_seq_no,
"
"				tmr_iss_sub_seq_no,
"
"				tmr_prod_uom,
"
"				tmr_heat_no,
"
"				tmr_test_no,
"
"				tmr_batch_id,
"
"				tmr_conv_factor
"
"			       )
"
"                         VALUES(p_bu,
"
"				p_doc_no,
"
"				r_mrl(i).store_id,
"
"				r_mrl(i).prod_id,
"
"				r_mrl(i).prod_rev,
"
"				r_mrl(i).stk_qty,
"
"				r_mrl(i).stk_qty,
"
"				'N',
"
"				r_mrl(i).lot_no,
"
"				r_mrl(i).ser_no,
"
"				r_mrl(i).sys_ls_no,
"
"				r_mrl(i).expiry_date,
"
"				r_mrl(i).sou_id,
"
"				r_mrl(i).sou_type,
"
"				p_user,
"
"				SYSDATE,
"
"				r_mrl(i).unitcost,
"
"				r_mrl(i).ord_type,
"
"				r_mrl(i).ord_no,
"
"				r_mrl(i).sf_code,
"
"				r_mrl(i).oprn_seq_no,
"
"				r_mrl(i).proc_id,
"
"				r_mrl(i).trans_no,
"
"				0,
"
"				r_mrl(i).crate_id,
"
"				r_mrl(i).batch_no,
"
"				r_mrl(i).so_type,
"
"				r_mrl(i).so_pfx,
"
"				r_mrl(i).so_no,
"
"				r_mrl(i).so_seq_no,
"
"				r_mrl(i).so_sub_seq_no,
"
"				r_mrl(i).proj_id,
"
"				r_mrl(i).task_id,
"
"				r_mrl(i).so_ref,
"
"				r_mrl(i).mi_doc_no,
"
"				r_mrl(i).mi_seq_no,
"
"				r_mrl(i).mi_sub_seq_no,
"
"				r_mrl(i).prod_uom,
"
"				r_mrl(i).heat_no,
"
"				r_mrl(i).test_no,
"
"				r_mrl(i).batch_id,
"
"				NVL(r_mrl(i).conv_factor,1)
"
"			       );
"
"	/*EXCEPTION
"
"		WHEN dml_errors THEN
"
"		  v_bc_cnt := SQL%BULK_EXCEPTIONS.count;
"
"		FOR i IN 1..v_bc_cnt
"
"		LOOP
"
"		  Raise_Application_Error(-20999,'HRM'||'~'||'Error: ' || i ||
"
"                                                 ' Array Index: ' || SQL%BULK_EXCEPTIONS(i).error_index ||
"
"                                                 ' Message: ' || SQLERRM(-SQL%BULK_EXCEPTIONS(i).ERROR_CODE));
"
"		END LOOP;
"
"	END;*/
"
"    END IF;
"
"
"
"  END proc_load_doc_frm_mrtn;
"
"
"
"  PROCEDURE proc_ins_mat_rtn_frm_load(p_bu	VARCHAR2,
"
"				      p_plnt	VARCHAR2,
"
"				      p_doc_no	VARCHAR2,
"
"				      p_user	VARCHAR2
"
"				     )
"
"  AS
"
"
"
"    CURSOR c_mrt IS
"
"    SELECT ssthd_fm_store_id,ssthd_to_store_id
"
"      FROM store_stock_trans_hd
"
"     WHERE ssthd_bu = p_bu
"
"       AND ssthd_doc_no = p_doc_no;
"
"
"
"    CURSOR c1 IS
"
"    SELECT tmr_sg_flag,tmr_prod_id,tmr_prod_rev,prod_uom,tmr_store_id,tmr_trans_qty,tmr_unit_cost,
"
"           tmr_po_ord_no,tmr_process_id,tmr_sf_code,
"
"           tmr_so_type,tmr_so_order_pfx,tmr_so_ord_no,tmr_so_line_no,tmr_so_sub_seq_no,tmr_so_schld_desc,tmr_proj_id,tmr_task_id,
"
"           tmr_iss_doc_no,tmr_iss_seq_no,tmr_iss_doc_date,tmr_mnt_task_id,tmr_mnt_oprn_id,tmr_mnt_wc_id,tmr_cap_asset_id,tmr_ord_trans_no,
"
"           tmr_dc_doc_no,tmr_dc_seq_no,
"
"		   tmr_oprn_ln_seq_no
"
"      FROM temp_mat_return,products
"
"     WHERE tmr_bu = prod_bu
"
"       AND tmr_prod_id = prod_id
"
"       AND tmr_prod_rev = prod_rev
"
"       AND tmr_bu = p_bu
"
"       AND tmr_doc_no = p_doc_no
"
"       AND tmr_trans_qty > 0
"
"       AND tmr_sel_flag = 'Y';
"
"
"
"    r_mrt		c_mrt%ROWTYPE;
"
"
"
"    v_seq_no		NUMBER;
"
"    v_unit_cost		NUMBER;
"
"
"
"    v_qc_rqrd_flag	VARCHAR2(1);
"
"
"
"    v_emp_id	VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr	VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user	VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM store_stock_trans_cost_batch
"
"     WHERE sstcb_bu = p_bu
"
"       AND sstcb_doc_no = p_doc_no;
"
"
"
"    DELETE FROM store_stock_trans_dtls
"
"     WHERE sstd_bu = p_bu
"
"       AND sstd_doc_no = p_doc_no;
"
"
"
"    DELETE FROM store_stock_trans_ln
"
"     WHERE sstln_bu = p_bu
"
"       AND sstln_doc_no = p_doc_no;
"
"
"
"    OPEN c_mrt;
"
"    FETCH c_mrt INTO r_mrt;
"
"    CLOSE c_mrt;
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"      IF func_find_product_mr_qc_req(p_bu,p_plnt,cr1.tmr_prod_id,cr1.tmr_prod_rev) = 'FP' THEN
"
"        v_qc_rqrd_flag := 'N';
"
"      ELSE
"
"        v_qc_rqrd_flag := 'Y';
"
"      END IF;
"
"
"
"      UPDATE store_stock_trans_ln
"
"         SET sstln_trans_qty = cr1.tmr_trans_qty,
"
"             sstln_accepted_qty = CASE WHEN v_qc_rqrd_flag = 'Y' THEN 0 ELSE cr1.tmr_trans_qty END
"
"       WHERE sstln_bu = p_bu
"
"         AND sstln_doc_no = p_doc_no
"
"         AND sstln_prod_id = cr1.tmr_prod_id
"
"         AND sstln_prod_rev = cr1.tmr_prod_rev
"
"       RETURNING sstln_seq_no INTO v_seq_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"        IF cr1.tmr_sg_flag = 'S' THEN
"
"          v_unit_cost := func_find_unitcost(p_bu,cr1.tmr_prod_id,cr1.tmr_prod_rev,cr1.tmr_store_id);
"
"        ELSE
"
"          v_unit_cost := cr1.tmr_unit_cost;
"
"        END IF;
"
"
"
"        SELECT NVL(MAX(sstln_seq_no),0) + 1 INTO v_seq_no
"
"          FROM store_stock_trans_ln
"
"         WHERE sstln_bu = p_bu
"
"           AND sstln_doc_no = p_doc_no;
"
"
"
"        INSERT INTO store_stock_trans_ln(sstln_bu,
"
"                                         sstln_doc_no,
"
"                                         sstln_seq_no,
"
"    				         sstln_sg_flag,
"
"                                         sstln_prod_id,
"
"                                         sstln_prod_rev,
"
"                                         sstln_prod_uom,
"
"                                         sstln_trans_qty,
"
"                                         sstln_accepted_qty,
"
"                                         sstln_unit_cost,
"
"                                         sstln_cre_by,
"
"    			                 sstln_cre_emp_id,
"
"    			                 sstln_cre_ip_addr,
"
"    			                 sstln_cre_os_user,
"
"                                         sstln_cre_date,
"
"                                         sstln_po_ord_no,
"
"                                         sstln_process_id,
"
"                                         sstln_so_order_pfx,
"
"                                         sstln_so_ord_no,
"
"                                         sstln_so_line_no,
"
"                                         sstln_so_sub_seq_no,
"
"                                         sstln_so_schld_desc,
"
"                                         sstln_so_type,
"
"                                         sstln_proj_id,
"
"                                         sstln_task_id,
"
"                                         sstln_sf_code,
"
"                                         sstln_conv_factor,
"
"                                         sstln_status,
"
"                                         sstln_mi_doc_no,
"
"                                         sstln_mi_seq_no,
"
"                                         sstln_mi_doc_date,
"
"                                         sstln_mnt_task_id,
"
"                                         sstln_mnt_oprn_id,
"
"                                         sstln_mnt_wc_id,
"
"                                         sstln_cap_asset_id,
"
"                                         sstln_ord_trans_no,
"
"    			                 sstln_store_id,
"
"    			                 sstln_to_store_id,
"
"    			                 sstln_dc_doc_no,
"
"    			                 sstln_dc_seq_no,
"
"								 sstln_oprn_ln_seq_no
"
"    				        )
"
"    				  VALUES(p_bu,
"
"                                         p_doc_no,
"
"                                         v_seq_no,
"
"    				         cr1.tmr_sg_flag,
"
"                                         cr1.tmr_prod_id,
"
"                                         cr1.tmr_prod_rev,
"
"                                         cr1.prod_uom,
"
"                                         cr1.tmr_trans_qty,
"
"                                         CASE WHEN v_qc_rqrd_flag = 'Y' THEN 0 ELSE cr1.tmr_trans_qty END,
"
"                                         cr1.tmr_unit_cost,
"
"                                         p_user,
"
"    			                 v_emp_id,
"
"    			                 v_ip_addr,
"
"    			                 v_os_user,
"
"                                         SYSDATE,
"
"                                         cr1.tmr_po_ord_no,
"
"                                         cr1.tmr_process_id,
"
"                                         cr1.tmr_so_order_pfx,
"
"                                         cr1.tmr_so_ord_no,
"
"                                         cr1.tmr_so_line_no,
"
"                                         cr1.tmr_so_sub_seq_no,
"
"                                         cr1.tmr_so_schld_desc,
"
"                                         cr1.tmr_so_type,
"
"                                         cr1.tmr_proj_id,
"
"                                         cr1.tmr_task_id,
"
"                                         cr1.tmr_sf_code,
"
"                                         1,
"
"                                         CASE WHEN v_qc_rqrd_flag = 'Y' THEN 'N' ELSE 'Q' END,
"
"                                         cr1.tmr_iss_doc_no,
"
"                                         cr1.tmr_iss_seq_no,
"
"                                         cr1.tmr_iss_doc_date,
"
"                                         cr1.tmr_mnt_task_id,
"
"                                         cr1.tmr_mnt_oprn_id,
"
"                                         cr1.tmr_mnt_wc_id,
"
"                                         cr1.tmr_cap_asset_id,
"
"                                         cr1.tmr_ord_trans_no,
"
"    			                 r_mrt.ssthd_fm_store_id,
"
"    			                 r_mrt.ssthd_to_store_id,
"
"                                         cr1.tmr_dc_doc_no,
"
"                                         cr1.tmr_dc_seq_no,
"
"					 cr1.tmr_oprn_ln_seq_no
"
"    				      );
"
"      END IF;
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
"  PROCEDURE proc_ins_insp_stk_frm_mr(p_bu	VARCHAR2,
"
"				     p_plnt	VARCHAR2,
"
"				     p_doc_no	VARCHAR2,
"
"				     p_user	VARCHAR2
"
"				    )
"
"  AS
"
"
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM store_stock_trans_hd
"
"   WHERE ssthd_bu = p_bu
"
"     AND ssthd_plnt = p_plnt
"
"     AND ssthd_doc_no = p_doc_no;
"
"
"
"  CURSOR c2 IS
"
"  SELECT *
"
"    FROM store_stock_trans_ln,products
"
"   WHERE prod_bu = sstln_bu
"
"     AND prod_id = sstln_prod_id
"
"     AND prod_rev = sstln_prod_rev
"
"     AND sstln_bu = p_bu
"
"     AND sstln_doc_no = p_doc_no
"
"     AND prod_stocked = 'Y'
"
"   ORDER BY sstln_seq_no;
"
"
"
"    v_qc_store_id	stores.store_id%TYPE;
"
"    v_unit_cost		store_stock_trans_ln.sstln_unit_cost%TYPE;
"
"
"
"  BEGIN
"
"
"
"    FOR r_mr IN (SELECT sstln_bu,sstln_doc_no,sstln_seq_no,sstln_unit_cost,
"
"                        SUM(sstcb_trans_qty * sstcb_unit_cost)/SUM(sstcb_trans_qty) Avg_Cost
"
"                   FROM store_stock_trans_ln_vw,store_stk_trans_cost_batch_vw,products
"
"		  WHERE sstcb_bu = sstln_bu
"
"		    AND sstcb_doc_no = sstln_doc_no
"
"		    AND sstcb_seq_no = sstln_seq_no
"
"		    AND prod_bu = sstln_bu
"
"		    AND prod_id = sstln_prod_id
"
"		    AND prod_rev = sstln_prod_rev
"
"		    AND sstln_bu = p_bu
"
"                    AND sstln_doc_no = p_doc_no
"
"		    AND prod_cost_method IN ('FIFO','LIFO')
"
"		  GROUP BY sstln_bu,sstln_doc_no,sstln_seq_no,sstln_unit_cost
"
"	         HAVING sstln_unit_cost <> ROUND(SUM(sstcb_trans_qty * sstcb_unit_cost)/SUM(sstcb_trans_qty),5))
"
"    LOOP
"
"
"
"      UPDATE store_stock_trans_ln_hist
"
"         SET sstlnh_unit_cost = r_mr.Avg_Cost
"
"       WHERE sstlnh_bu = p_bu
"
"         AND sstlnh_doc_no = p_doc_no
"
"         AND sstlnh_seq_no = r_mr.sstln_seq_no;
"
"
"
"      UPDATE store_stock_trans_ln
"
"         SET sstln_unit_cost = r_mr.Avg_Cost
"
"       WHERE sstln_bu = p_bu
"
"         AND sstln_doc_no = p_doc_no
"
"         AND sstln_seq_no = r_mr.sstln_seq_no;
"
"
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
"      v_qc_store_id := func_find_store_fr_type(p_bu,p_plnt,cr1.ssthd_plnt_loc_id,'Q');
"
"
"
"      FOR cr2 IN c2
"
"      LOOP
"
"
"
"	IF cr2.sstln_sg_flag = 'S' AND cr1.ssthd_fm_doc_type IN ('W','E','S') THEN
"
"	  /* *****************STANDARD MATERIAL***************** */
"
"
"
"	  v_unit_cost := func_find_unitcost(p_bu,cr2.sstln_prod_id,cr2.sstln_prod_rev,cr1.ssthd_fm_store_id);
"
"
"
"	  IF cr2.prod_cost_method = 'MAC' THEN
"
"
"
"	    UPDATE store_stock_trans_ln
"
"               SET sstln_unit_cost = v_unit_cost
"
"             WHERE sstln_bu = p_bu
"
"               AND sstln_doc_no = p_doc_no
"
"               AND sstln_seq_no = cr2.sstln_seq_no;
"
"
"
"	  END IF;
"
"
"
"	  proc_upd_stocks(p_bu,
"
"                          cr1.ssthd_fm_store_id,
"
"                          NULL,
"
"                          cr2.sstln_prod_id,
"
"                          cr2.sstln_prod_rev,
"
"                          0,
"
"                          0,
"
"                          -cr2.sstln_trans_qty,
"
"                          0,
"
"                          -cr2.sstln_trans_qty,
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
"                          cr2.sstln_seq_no,
"
"                          0,
"
"                          NULL,
"
"                          p_doc_no,
"
"                          NULL,
"
"                          NULL,
"
"                          NULL,
"
"                          cr1.ssthd_year,
"
"                          cr1.ssthd_period,
"
"                          cr1.ssthd_date,
"
"                          NULL,
"
"                          'ICM',
"
"                          'ME',
"
"                          NULL,
"
"                          p_user,
"
"                          SYSDATE,
"
"                          NULL,
"
"                          cr2.sstln_prod_cls,
"
"                          p_doc_no,
"
"                          'PO',
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
"                          0,
"
"                          NULL,
"
"                          NULL,
"
"                          0,
"
"                          0,
"
"                          'Material return from WIP Decrease',
"
"                          'Material Return',
"
"                          0,
"
"                          0,
"
"                          p_prod_cls_desc => cr2.sstln_prod_cls_desc,
"
"                          p_prod_sub_cls_id => cr2.sstln_prod_sub_cls,
"
"                          p_prod_sub_cls_desc => cr2.sstln_prod_subcls_desc,
"
"                          p_prod_grp_id	 => cr2.sstln_prod_grp,
"
"                          p_prod_grp_desc => cr2.sstln_prod_grp_desc,
"
"                          p_prod_sub_grp_id => cr2.sstln_prod_subgrp,
"
"                          p_prod_sub_grp_desc => cr2.sstln_prod_subgrp_desc,
"
"                          p_prod_cls_type => cr2.sstln_prod_cls_type,
"
"			  p_vou_type => 'MRTN',
"
"			  p_sub_vou_type => 'MRTN'
"
"                         );
"
"
"
"	  IF cr2.sstln_so_ord_no IS NOT NULL OR cr2.sstln_proj_id IS NOT NULL THEN
"
"
"
"	    proc_upd_so_stocks(p_bu,
"
"	                       cr1.ssthd_fm_store_id,
"
"			       cr2.sstln_prod_id,
"
"			       cr2.sstln_prod_rev,
"
"			       -cr2.sstln_trans_qty,
"
"			       -cr2.sstln_trans_qty,
"
"			       v_unit_cost,
"
"			       cr2.sstln_so_order_pfx,
"
"			       cr2.sstln_so_ord_no,
"
"			       cr2.sstln_so_line_no,
"
"			       cr2.sstln_so_sub_seq_no,
"
"			       cr1.ssthd_date,
"
"			       'PO',
"
"			       NULL,
"
"			       p_doc_no,
"
"			       cr2.sstln_seq_no,
"
"			       NULL,
"
"			       NULL,
"
"			       NULL,
"
"			       'ME',
"
"			       'ICM',
"
"			       'Material Return',
"
"			       'Material Return' || '#(' || p_doc_no || ')',
"
"			       p_user,
"
"			       cr2.sstln_so_type,
"
"			       cr2.sstln_proj_id,
"
"			       cr2.sstln_task_id
"
"			      );
"
"
"
"	  END IF;
"
"
"
"	  IF cr2.prod_cost_method IN ('LIFO','FIFO') THEN
"
"
"
"	    FOR r_cb IN (SELECT sstcb_seq_no,sstcb_batch_no,sstcb_trans_qty,sstcb_unit_cost
"
"                           FROM store_stock_trans_cost_batch
"
"                          WHERE sstcb_bu = p_bu
"
"                            AND sstcb_doc_no = p_doc_no
"
"                            AND sstcb_seq_no = cr2.sstln_seq_no
"
"                            AND sstcb_batch_no IS NOT NULL
"
"			  ORDER BY sstcb_sub_seq_no)
"
"	    LOOP
"
"	      proc_upd_stock_batches(p_bu,
"
"	                             cr1.ssthd_fm_store_id,
"
"				     cr2.sstln_prod_id,
"
"				     cr2.sstln_prod_rev,
"
"				     r_cb.sstcb_batch_no,
"
"				     0,
"
"				     cr2.sstln_trans_qty,
"
"				     -cr2.sstln_trans_qty,
"
"				     0,
"
"				     r_cb.sstcb_unit_cost,
"
"				     0,
"
"				     0,
"
"				     0,
"
"				     0,
"
"				     0,
"
"				     'N',
"
"				     cr1.ssthd_date,
"
"				     NULL,
"
"				     p_doc_no,
"
"				     cr2.sstln_seq_no,
"
"				     'PO',
"
"				     NULL,
"
"				     p_doc_no,
"
"				     cr2.sstln_seq_no,
"
"				     NULL,
"
"				     cr2.sstln_prod_cls,
"
"				     'ME',
"
"				     'ICM',
"
"				     NULL,
"
"				     NULL,
"
"				     NULL,
"
"				     NULL,
"
"				     p_user,
"
"				     p_prod_cls_desc => cr2.sstln_prod_cls_desc,
"
"				     p_prod_subcls => cr2.sstln_prod_sub_cls,
"
"				     p_prod_subcls_desc => cr2.sstln_prod_subcls_desc,
"
"				     p_prod_grp => cr2.sstln_prod_grp,
"
"				     p_prod_grp_desc => cr2.sstln_prod_grp_desc,
"
"				     p_prod_subgrp => cr2.sstln_prod_subgrp,
"
"				     p_prod_subgrp_desc => cr2.sstln_prod_subgrp_desc,
"
"				     p_prod_cls_type => cr2.sstln_prod_cls_type
"
"                                    );
"
"	    END LOOP;
"
"
"
"	  END IF;
"
"
"
"	ELSIF cr2.sstln_sg_flag = 'F' AND cr1.ssthd_fm_doc_type IN ('W','E','S') THEN
"
"	  /* *****************SEMI-FINISHED MATERIAL***************** */
"
"	  NULL;
"
"	END IF;
"
"
"
"      END LOOP c2;
"
"
"
"    END LOOP c1;
"
"
"
"  END proc_ins_insp_stk_frm_mr;
"
"
"
"END;"
/
