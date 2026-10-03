CREATE OR REPLACE
"PACKAGE BODY pkg_stk
"
"AS
"
"
"
"  PROCEDURE proc_gen_stk_stmt(p_bu	VARCHAR2,
"
"			      p_fr_date	DATE,
"
"			      p_to_date	DATE,
"
"			      p_user	VARCHAR2
"
"			     )
"
"  AS
"
"
"
"  TYPE typ_stk_item IS TABLE OF stock_stmt_plnt_wh_subcls_item%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_item	typ_stk_item;
"
"
"
"  TYPE typ_stk_mon IS TABLE OF stock_stmt_plnt_wh_subcls_mon%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_mon	typ_stk_mon;
"
"
"
"  TYPE typ_stk_day IS TABLE OF stock_stmt_plnt_wh_subcls_day%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_day	typ_stk_day;
"
"
"
"  TYPE typ_stk_trans IS TABLE OF stock_stmt_plnt_wh_scd_trans%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_trans	typ_stk_trans;
"
"
"
"  TYPE typ_stk_subcls IS TABLE OF stock_stmt_plnt_wh_subcls%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_subcls	typ_stk_subcls;
"
"
"
"  TYPE typ_stk_cls IS TABLE OF stock_stmt_plnt_wh_cls%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_cls	typ_stk_cls;
"
"
"
"  TYPE typ_stk_wh IS TABLE OF stock_stmt_plnt_wh%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_wh	typ_stk_wh;
"
"
"
"  TYPE typ_stk_plnt IS TABLE OF stock_stmt_plnt%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_plnt	typ_stk_plnt;
"
"
"
"  v_st_date	DATE;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM stock_stmt_plnt_wh_subcls_item
"
"     WHERE sspwsci_bu = p_bu
"
"       AND sspwsci_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_plnt_wh_scd_trans
"
"     WHERE sspwst_bu = p_bu
"
"       AND sspwst_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_plnt_wh_subcls_day
"
"     WHERE sspwsd_bu = p_bu
"
"       AND sspwsd_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_plnt_wh_subcls_mon
"
"     WHERE sspwsm_bu = p_bu
"
"       AND sspwsm_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_plnt_wh_subcls
"
"     WHERE sspwsc_bu = p_bu
"
"       AND sspwsc_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_plnt_wh_cls
"
"     WHERE sspwc_bu = p_bu
"
"       AND sspwc_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_plnt_wh
"
"     WHERE sspw_bu = p_bu
"
"       AND sspw_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_plnt
"
"     WHERE ssp_bu = p_bu
"
"       AND ssp_user = p_user;
"
"
"
"    WITH stk_dtls AS
"
"    (SELECT sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code,
"
"            SUM(Op_Qty) Op_Qty,SUM(IOH_Qty) IOH_Qty,SUM(DOH_Qty) DOH_Qty,SUM(Op_Qty)+SUM(IOH_Qty)-SUM(DOH_Qty) CL_Qty,
"
"            ROUND(SUM(Op_Val),2) Op_Val,ROUND(SUM(IOH_Val),2) IOH_Val,ROUND(SUM(DOH_Val),2) DOH_Val,ROUND(SUM(Op_Val)+SUM(IOH_Val)-SUM(DOH_Val),2) CL_Val
"
"       FROM (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    SUM(sttr_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(sttr_trans_qty * sttr_bc_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) < p_fr_date
"
"                AND sttr_bucket_type = 'QOH'
"
"              GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"             HAVING SUM(sttr_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    0 Op_Qty,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty*sttr_bc_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty * sttr_bc_unit_cost) ELSE 0 END) DOH_Qty
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) BETWEEN p_fr_date AND p_to_date
"
"                AND sttr_bucket_type = 'QOH'
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    SUM(stsfg_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(stsfg_trans_qty * stsfg_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) < p_fr_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"              GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code
"
"             HAVING SUM(stsfg_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    0 Op_Qty,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty * stsfg_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty * stsfg_unit_cost) ELSE 0 END) DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) BETWEEN p_fr_date AND p_to_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"	    )
"
"      GROUP BY sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code)
"
"    SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"           store_plnt,(SELECT bup_name1 FROM bus_unit_plants WHERE bup_bu = sttr_bu AND bup_plant_id = store_plnt),
"
"	   sttr_store_id,store_desc1,
"
"	   prodplnt_cls,(SELECT class_desc1 FROM classes WHERE class_bu = sttr_bu AND class_id = prodplnt_cls),
"
"	   prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"           sttr_prod_id,sttr_prod_rev,prod_desc11,sttr_prod_ord_no,sttr_sf_code,
"
"           OP_Qty,IOH_Qty,DOH_Qty,CL_Qty,OP_Val,IOH_Val,DOH_Val,CL_Val,
"
"	   CASE WHEN Op_Qty > 0 THEN OP_Val/Op_Qty ELSE 0 END OP_Unit_Cost,
"
"	   CASE WHEN IOH_Qty > 0 THEN IOH_Val/IOH_Qty ELSE 0 END IOH_Unit_Cost,
"
"	   CASE WHEN DOH_Qty > 0 THEN DOH_Val/DOH_Qty ELSE 0 END DOH_Unit_Cost,
"
"	   CASE WHEN CL_Qty > 0 THEN CL_Val/CL_Qty ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_item
"
"      FROM stk_dtls,stores,products,prod_plants
"
"     WHERE store_bu = sttr_bu
"
"       AND store_id = sttr_store_id
"
"       AND prod_bu = sttr_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"       AND prodplnt_bu = prod_bu
"
"       AND prodplnt_plnt = store_plnt
"
"       AND prodplnt_prod_id = prod_id
"
"       AND prodplnt_prod_rev = prod_rev
"
"       AND sttr_bu = p_bu
"
"     ORDER BY sttr_bu,sttr_store_id,sttr_prod_ord_no NULLS FIRST,sttr_sf_code NULLS FIRST,sttr_prod_id,sttr_prod_rev;
"
"
"
"    FORALL i IN 1..r_stk_item.COUNT
"
"      INSERT INTO stock_stmt_plnt_wh_subcls_item VALUES r_stk_item(i);
"
"
"
"    FOR r_mon IN (SELECT fp_bu,fp_year,fp_period,fp_from_date,fp_end_date
"
"                    FROM fin_periods
"
"                   WHERE fp_bu = p_bu
"
"                     AND fp_year = (SELECT t2.fp_year FROM fin_periods t2 WHERE t2.fp_bu = p_bu AND p_fr_date BETWEEN t2.fp_from_date AND t2.fp_end_date)
"
"		   ORDER BY fp_period)
"
"    LOOP
"
"
"
"      WITH stk_dtls AS
"
"      (SELECT sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code,
"
"              SUM(Op_Qty) Op_Qty,SUM(IOH_Qty) IOH_Qty,SUM(DOH_Qty) DOH_Qty,SUM(Op_Qty)+SUM(IOH_Qty)-SUM(DOH_Qty) CL_Qty,
"
"              ROUND(SUM(Op_Val),2) Op_Val,ROUND(SUM(IOH_Val),2) IOH_Val,ROUND(SUM(DOH_Val),2) DOH_Val,ROUND(SUM(Op_Val)+SUM(IOH_Val)-SUM(DOH_Val),2) CL_Val
"
"       FROM (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    SUM(sttr_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(sttr_trans_qty * sttr_bc_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) < r_mon.fp_from_date
"
"                AND sttr_bucket_type = 'QOH'
"
"              GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"             HAVING SUM(sttr_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    0 Op_Qty,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty*sttr_bc_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty * sttr_bc_unit_cost) ELSE 0 END) DOH_Qty
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) BETWEEN r_mon.fp_from_date AND r_mon.fp_end_date
"
"                AND sttr_bucket_type = 'QOH'
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    SUM(stsfg_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(stsfg_trans_qty * stsfg_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) < r_mon.fp_from_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"              GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code
"
"             HAVING SUM(stsfg_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    0 Op_Qty,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty * stsfg_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty * stsfg_unit_cost) ELSE 0 END) DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) BETWEEN r_mon.fp_from_date AND r_mon.fp_end_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"	    )
"
"      GROUP BY sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code)
"
"      SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"             store_plnt,(SELECT bup_name1 FROM bus_unit_plants WHERE bup_bu = sttr_bu AND bup_plant_id = store_plnt),
"
"	     sttr_store_id,store_desc1,
"
"	     prodplnt_cls,(SELECT class_desc1 FROM classes WHERE class_bu = sttr_bu AND class_id = prodplnt_cls),
"
"	     prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"             r_mon.fp_year,r_mon.fp_period,
"
"             SUM(OP_Qty),SUM(IOH_Qty),SUM(DOH_Qty),SUM(CL_Qty),SUM(OP_Val),SUM(IOH_Val),SUM(DOH_Val),SUM(CL_Val),
"
"	     CASE WHEN SUM(Op_Qty) > 0 THEN SUM(OP_Val)/SUM(Op_Qty) ELSE 0 END OP_Unit_Cost,
"
"	     CASE WHEN SUM(IOH_Qty) > 0 THEN SUM(IOH_Val)/SUM(IOH_Qty) ELSE 0 END IOH_Unit_Cost,
"
"	     CASE WHEN SUM(DOH_Qty) > 0 THEN SUM(DOH_Val)/SUM(DOH_Qty) ELSE 0 END DOH_Unit_Cost,
"
"	     CASE WHEN SUM(CL_Qty) > 0 THEN SUM(CL_Val)/SUM(CL_Qty) ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_mon
"
"      FROM stk_dtls,stores,products,prod_plants
"
"     WHERE store_bu = sttr_bu
"
"       AND store_id = sttr_store_id
"
"       AND prod_bu = sttr_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"       AND prodplnt_bu = prod_bu
"
"       AND prodplnt_plnt = store_plnt
"
"       AND prodplnt_prod_id = prod_id
"
"       AND prodplnt_prod_rev = prod_rev
"
"       AND sttr_bu = p_bu
"
"     GROUP BY sttr_bu,store_plnt,sttr_store_id,store_desc1,prodplnt_cls,prodplnt_sub_cls;
"
"
"
"      FORALL i IN 1..r_stk_mon.COUNT
"
"      INSERT INTO stock_stmt_plnt_wh_subcls_mon VALUES r_stk_mon(i);
"
"
"
"      v_st_date := r_mon.fp_from_date;
"
"      LOOP
"
"
"
"
"
"      WITH stk_dtls AS
"
"      (SELECT sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code,
"
"              SUM(Op_Qty) Op_Qty,SUM(IOH_Qty) IOH_Qty,SUM(DOH_Qty) DOH_Qty,SUM(Op_Qty)+SUM(IOH_Qty)-SUM(DOH_Qty) CL_Qty,
"
"              ROUND(SUM(Op_Val),2) Op_Val,ROUND(SUM(IOH_Val),2) IOH_Val,ROUND(SUM(DOH_Val),2) DOH_Val,ROUND(SUM(Op_Val)+SUM(IOH_Val)-SUM(DOH_Val),2) CL_Val
"
"       FROM (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    SUM(sttr_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(sttr_trans_qty * sttr_bc_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) < v_st_date
"
"                AND sttr_bucket_type = 'QOH'
"
"              GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"             HAVING SUM(sttr_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    0 Op_Qty,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty*sttr_bc_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty * sttr_bc_unit_cost) ELSE 0 END) DOH_Qty
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) = v_st_date
"
"                AND sttr_bucket_type = 'QOH'
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    SUM(stsfg_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(stsfg_trans_qty * stsfg_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) < v_st_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"              GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code
"
"             HAVING SUM(stsfg_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    0 Op_Qty,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty * stsfg_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty * stsfg_unit_cost) ELSE 0 END) DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) = v_st_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"	    )
"
"      GROUP BY sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code)
"
"      SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"             store_plnt,(SELECT bup_name1 FROM bus_unit_plants WHERE bup_bu = sttr_bu AND bup_plant_id = store_plnt),
"
"	     sttr_store_id,store_desc1,
"
"	     prodplnt_cls,(SELECT class_desc1 FROM classes WHERE class_bu = sttr_bu AND class_id = prodplnt_cls),
"
"	     prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"             r_mon.fp_year,r_mon.fp_period,v_st_date,
"
"             SUM(OP_Qty),SUM(IOH_Qty),SUM(DOH_Qty),SUM(CL_Qty),SUM(OP_Val),SUM(IOH_Val),SUM(DOH_Val),SUM(CL_Val),
"
"	     CASE WHEN SUM(Op_Qty) > 0 THEN SUM(OP_Val)/SUM(Op_Qty) ELSE 0 END OP_Unit_Cost,
"
"	     CASE WHEN SUM(IOH_Qty) > 0 THEN SUM(IOH_Val)/SUM(IOH_Qty) ELSE 0 END IOH_Unit_Cost,
"
"	     CASE WHEN SUM(DOH_Qty) > 0 THEN SUM(DOH_Val)/SUM(DOH_Qty) ELSE 0 END DOH_Unit_Cost,
"
"	     CASE WHEN SUM(CL_Qty) > 0 THEN SUM(CL_Val)/SUM(CL_Qty) ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_day
"
"      FROM stk_dtls,stores,products,prod_plants
"
"     WHERE store_bu = sttr_bu
"
"       AND store_id = sttr_store_id
"
"       AND prod_bu = sttr_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"       AND prodplnt_bu = prod_bu
"
"       AND prodplnt_plnt = store_plnt
"
"       AND prodplnt_prod_id = prod_id
"
"       AND prodplnt_prod_rev = prod_rev
"
"       AND sttr_bu = p_bu
"
"     GROUP BY sttr_bu,store_plnt,sttr_store_id,store_desc1,prodplnt_cls,prodplnt_sub_cls;
"
"
"
"        FORALL i IN 1..r_stk_day.COUNT
"
"        INSERT INTO stock_stmt_plnt_wh_subcls_day VALUES r_stk_day(i);
"
"
"
"
"
"      WITH stk_dtls AS
"
"      (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"              sttr_source_doc,sttr_vou_pfx,sttr_vou_no,sttr_vou_line_no,
"
"              sttr_trans_qty Trans_Qty,sttr_bc_unit_cost Trans_Unit_Cost,(sttr_trans_qty * sttr_bc_unit_cost) Trans_Val
"
"         FROM stock_trans
"
"        WHERE sttr_bu = p_bu
"
"          AND TRUNC(sttr_trans_date) = v_st_date
"
"          AND sttr_bucket_type = 'QOH'
"
"       UNION ALL
"
"       SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"              stsfg_source_doc,stsfg_vou_pfx,stsfg_vou_no,stsfg_vou_line_no,
"
"	      stsfg_trans_qty Trans_Qty,stsfg_unit_cost Trans_Unit_Cost,(stsfg_trans_qty * stsfg_unit_cost) Trans_Val
"
"         FROM stock_trans_sfg
"
"        WHERE stsfg_bu = p_bu
"
"          AND TRUNC(stsfg_trans_date) = v_st_date
"
"          AND stsfg_bucket_type = 'QOH')
"
"      SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"             store_plnt,(SELECT bup_name1 FROM bus_unit_plants WHERE bup_bu = sttr_bu AND bup_plant_id = store_plnt),
"
"	     sttr_store_id,store_desc1,
"
"	     prodplnt_cls,(SELECT class_desc1 FROM classes WHERE class_bu = sttr_bu AND class_id = prodplnt_cls),
"
"	     prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"             r_mon.fp_year,r_mon.fp_period,v_st_date,sttr_source_doc,sttr_vou_pfx,sttr_vou_no,sttr_vou_line_no,
"
"	     sttr_prod_id,sttr_prod_rev,prod_desc11,Trans_Qty,Trans_Unit_Cost,Trans_Val
"
"        BULK COLLECT INTO r_stk_trans
"
"        FROM stk_dtls,stores,products,prod_plants
"
"       WHERE store_bu = sttr_bu
"
"         AND store_id = sttr_store_id
"
"         AND prod_bu = sttr_bu
"
"         AND prod_id = sttr_prod_id
"
"         AND prod_rev = sttr_prod_rev
"
"         AND prodplnt_bu = prod_bu
"
"         AND prodplnt_plnt = store_plnt
"
"         AND prodplnt_prod_id = prod_id
"
"         AND prodplnt_prod_rev = prod_rev
"
"         AND sttr_bu = p_bu;
"
"
"
"      FORALL i IN 1..r_stk_Trans.COUNT
"
"        INSERT INTO stock_stmt_plnt_wh_scd_trans VALUES r_stk_Trans(i);
"
"
"
"	EXIT WHEN v_st_date = r_mon.fp_end_date;
"
"	v_st_date := v_st_date + 1;
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"    SELECT p_bu,p_user,p_fr_date,p_to_date,sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,sspwsci_cls_id,sspwsci_cls_desc,
"
"           sspwsci_subcls_id,sspwsci_subcls_desc,OP_Qty,IOH_Qty,DOH_Qty,CL_Qty,OP_Val,IOH_Val,DOH_Val,CL_Val,
"
"	   CASE WHEN Op_Qty > 0 THEN OP_Val/Op_Qty ELSE 0 END OP_Unit_Cost,
"
"	   CASE WHEN IOH_Qty > 0 THEN IOH_Val/IOH_Qty ELSE 0 END IOH_Unit_Cost,
"
"	   CASE WHEN DOH_Qty > 0 THEN DOH_Val/DOH_Qty ELSE 0 END DOH_Unit_Cost,
"
"	   CASE WHEN CL_Qty > 0 THEN CL_Val/CL_Qty ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_subcls
"
"      FROM (SELECT sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,sspwsci_cls_id,sspwsci_cls_desc,sspwsci_subcls_id,sspwsci_subcls_desc,
"
"	           SUM(sspwsci_op_qty) Op_Qty,SUM(sspwsci_ioh_qty) IOH_Qty,SUM(sspwsci_doh_qty) DOH_Qty,SUM(sspwsci_cl_qty) CL_Qty,
"
"                   SUM(sspwsci_op_val) Op_Val,SUM(sspwsci_ioh_val) IOH_Val,SUM(sspwsci_doh_val) DOH_Val,SUM(sspwsci_cl_val) CL_Val
"
"              FROM stock_stmt_plnt_wh_subcls_item
"
"             WHERE sspwsci_bu = p_bu
"
"               AND sspwsci_user = p_user
"
"	     GROUP BY sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,sspwsci_cls_id,sspwsci_cls_desc,sspwsci_subcls_id,sspwsci_subcls_desc);
"
"
"
"    FORALL i IN 1..r_stk_subcls.COUNT
"
"      INSERT INTO stock_stmt_plnt_wh_subcls VALUES r_stk_subcls(i);
"
"
"
"    SELECT p_bu,p_user,p_fr_date,p_to_date,sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,sspwsci_cls_id,sspwsci_cls_desc,
"
"           OP_Qty,IOH_Qty,DOH_Qty,CL_Qty,OP_Val,IOH_Val,DOH_Val,CL_Val,
"
"	   CASE WHEN Op_Qty > 0 THEN OP_Val/Op_Qty ELSE 0 END OP_Unit_Cost,
"
"	   CASE WHEN IOH_Qty > 0 THEN IOH_Val/IOH_Qty ELSE 0 END IOH_Unit_Cost,
"
"	   CASE WHEN DOH_Qty > 0 THEN DOH_Val/DOH_Qty ELSE 0 END DOH_Unit_Cost,
"
"	   CASE WHEN CL_Qty > 0 THEN CL_Val/CL_Qty ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_cls
"
"      FROM (SELECT sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,sspwsci_cls_id,sspwsci_cls_desc,
"
"	           SUM(sspwsci_op_qty) Op_Qty,SUM(sspwsci_ioh_qty) IOH_Qty,SUM(sspwsci_doh_qty) DOH_Qty,SUM(sspwsci_cl_qty) CL_Qty,
"
"                   SUM(sspwsci_op_val) Op_Val,SUM(sspwsci_ioh_val) IOH_Val,SUM(sspwsci_doh_val) DOH_Val,SUM(sspwsci_cl_val) CL_Val
"
"              FROM stock_stmt_plnt_wh_subcls_item
"
"             WHERE sspwsci_bu = p_bu
"
"               AND sspwsci_user = p_user
"
"	     GROUP BY sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,sspwsci_cls_id,sspwsci_cls_desc);
"
"
"
"    FORALL i IN 1..r_stk_cls.COUNT
"
"      INSERT INTO stock_stmt_plnt_wh_cls VALUES r_stk_cls(i);
"
"
"
"    SELECT p_bu,p_user,p_fr_date,p_to_date,sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,
"
"           OP_Qty,IOH_Qty,DOH_Qty,CL_Qty,OP_Val,IOH_Val,DOH_Val,CL_Val,
"
"	   CASE WHEN Op_Qty > 0 THEN OP_Val/Op_Qty ELSE 0 END OP_Unit_Cost,
"
"	   CASE WHEN IOH_Qty > 0 THEN IOH_Val/IOH_Qty ELSE 0 END IOH_Unit_Cost,
"
"	   CASE WHEN DOH_Qty > 0 THEN DOH_Val/DOH_Qty ELSE 0 END DOH_Unit_Cost,
"
"	   CASE WHEN CL_Qty > 0 THEN CL_Val/CL_Qty ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_wh
"
"      FROM (SELECT sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc,
"
"	           SUM(sspwsci_op_qty) Op_Qty,SUM(sspwsci_ioh_qty) IOH_Qty,SUM(sspwsci_doh_qty) DOH_Qty,SUM(sspwsci_cl_qty) CL_Qty,
"
"                   SUM(sspwsci_op_val) Op_Val,SUM(sspwsci_ioh_val) IOH_Val,SUM(sspwsci_doh_val) DOH_Val,SUM(sspwsci_cl_val) CL_Val
"
"              FROM stock_stmt_plnt_wh_subcls_item
"
"             WHERE sspwsci_bu = p_bu
"
"               AND sspwsci_user = p_user
"
"	     GROUP BY sspwsci_plnt,sspwsci_plnt_desc,sspwsci_store_id,sspwsci_store_desc);
"
"
"
"    FORALL i IN 1..r_stk_wh.COUNT
"
"      INSERT INTO stock_stmt_plnt_wh VALUES r_stk_wh(i);
"
"
"
"    SELECT p_bu,p_user,p_fr_date,p_to_date,sspwsci_plnt,sspwsci_plnt_desc,
"
"           OP_Qty,IOH_Qty,DOH_Qty,CL_Qty,OP_Val,IOH_Val,DOH_Val,CL_Val,
"
"	   CASE WHEN Op_Qty > 0 THEN OP_Val/Op_Qty ELSE 0 END OP_Unit_Cost,
"
"	   CASE WHEN IOH_Qty > 0 THEN IOH_Val/IOH_Qty ELSE 0 END IOH_Unit_Cost,
"
"	   CASE WHEN DOH_Qty > 0 THEN DOH_Val/DOH_Qty ELSE 0 END DOH_Unit_Cost,
"
"	   CASE WHEN CL_Qty > 0 THEN CL_Val/CL_Qty ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_plnt
"
"      FROM (SELECT sspwsci_plnt,sspwsci_plnt_desc,
"
"	           SUM(sspwsci_op_qty) Op_Qty,SUM(sspwsci_ioh_qty) IOH_Qty,SUM(sspwsci_doh_qty) DOH_Qty,SUM(sspwsci_cl_qty) CL_Qty,
"
"                   SUM(sspwsci_op_val) Op_Val,SUM(sspwsci_ioh_val) IOH_Val,SUM(sspwsci_doh_val) DOH_Val,SUM(sspwsci_cl_val) CL_Val
"
"              FROM stock_stmt_plnt_wh_subcls_item
"
"             WHERE sspwsci_bu = p_bu
"
"               AND sspwsci_user = p_user
"
"	     GROUP BY sspwsci_plnt,sspwsci_plnt_desc);
"
"
"
"    FORALL i IN 1..r_stk_plnt.COUNT
"
"      INSERT INTO stock_stmt_plnt VALUES r_stk_plnt(i);
"
"
"
"    Commit;
"
"
"
"  END proc_gen_stk_stmt;
"
"
"
"  PROCEDURE proc_gen_stk_stmt1(p_bu		VARCHAR2,
"
"                               p_plnt		VARCHAR2,
"
"							   p_fr_date	DATE,
"
"							   p_to_date	DATE,
"
"							   p_user		VARCHAR2
"
"			      )
"
"  AS
"
"
"
"  TYPE typ_stk_mon IS TABLE OF stock_stmt_subcls_mon%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_mon	typ_stk_mon;
"
"
"
"  TYPE typ_stk_day IS TABLE OF stock_stmt_subcls_day%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_day	typ_stk_day;
"
"
"
"  TYPE typ_stk_trans IS TABLE OF stock_stmt_subcls_trans%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_trans	typ_stk_trans;
"
"
"
"  TYPE typ_stk_subcls IS TABLE OF stock_stmt_subcls%ROWTYPE INDEX BY PLS_INTEGER;
"
"  r_stk_subcls	typ_stk_subcls;
"
"
"
"
"
"  v_st_date	DATE;
"
"
"
"  BEGIN
"
"
"
"
"
"    DELETE FROM stock_stmt_subcls_trans
"
"     WHERE ssst_bu = p_bu
"
"       AND ssst_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_subcls_day
"
"     WHERE sssd_bu = p_bu
"
"       AND sssd_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_subcls_mon
"
"     WHERE sssm_bu = p_bu
"
"       AND sssm_user = p_user;
"
"
"
"    DELETE FROM stock_stmt_subcls
"
"     WHERE sssc_bu = p_bu
"
"       AND sssc_user = p_user;
"
"
"
"
"
"    FOR r_mon IN (SELECT fp_bu,fp_year,fp_period,fp_from_date,fp_end_date
"
"                    FROM fin_periods
"
"                   WHERE fp_bu = p_bu
"
"                     AND fp_year = (SELECT t2.fp_year FROM fin_periods t2 WHERE t2.fp_bu = p_bu AND p_fr_date BETWEEN t2.fp_from_date AND t2.fp_end_date)
"
"		   ORDER BY fp_period)
"
"    LOOP
"
"
"
"      WITH stk_dtls AS
"
"      (SELECT sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code,
"
"              SUM(Op_Qty) Op_Qty,SUM(IOH_Qty) IOH_Qty,SUM(DOH_Qty) DOH_Qty,SUM(Op_Qty)+SUM(IOH_Qty)-SUM(DOH_Qty) CL_Qty,
"
"              ROUND(SUM(Op_Val),2) Op_Val,ROUND(SUM(IOH_Val),2) IOH_Val,ROUND(SUM(DOH_Val),2) DOH_Val,ROUND(SUM(Op_Val)+SUM(IOH_Val)-SUM(DOH_Val),2) CL_Val
"
"       FROM (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    SUM(sttr_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(sttr_trans_qty * sttr_bc_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) < r_mon.fp_from_date
"
"                AND sttr_bucket_type = 'QOH'
"
"              GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"             HAVING SUM(sttr_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    0 Op_Qty,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty*sttr_bc_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty * sttr_bc_unit_cost) ELSE 0 END) DOH_Qty
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) BETWEEN r_mon.fp_from_date AND r_mon.fp_end_date
"
"                AND sttr_bucket_type = 'QOH'
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    SUM(stsfg_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(stsfg_trans_qty * stsfg_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) < r_mon.fp_from_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"              GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code
"
"             HAVING SUM(stsfg_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    0 Op_Qty,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty * stsfg_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty * stsfg_unit_cost) ELSE 0 END) DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) BETWEEN r_mon.fp_from_date AND r_mon.fp_end_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"	    )
"
"      GROUP BY sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code)
"
"      SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"	     prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"             r_mon.fp_year,r_mon.fp_period,
"
"             SUM(OP_Qty),SUM(IOH_Qty),SUM(DOH_Qty),SUM(CL_Qty),SUM(OP_Val),SUM(IOH_Val),SUM(DOH_Val),SUM(CL_Val),
"
"	     CASE WHEN SUM(Op_Qty) > 0 THEN SUM(OP_Val)/SUM(Op_Qty) ELSE 0 END OP_Unit_Cost,
"
"	     CASE WHEN SUM(IOH_Qty) > 0 THEN SUM(IOH_Val)/SUM(IOH_Qty) ELSE 0 END IOH_Unit_Cost,
"
"	     CASE WHEN SUM(DOH_Qty) > 0 THEN SUM(DOH_Val)/SUM(DOH_Qty) ELSE 0 END DOH_Unit_Cost,
"
"	     CASE WHEN SUM(CL_Qty) > 0 THEN SUM(CL_Val)/SUM(CL_Qty) ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_mon
"
"      FROM stk_dtls,stores,products,prod_plants
"
"     WHERE store_bu = sttr_bu
"
"       AND store_id = sttr_store_id
"
"       AND prod_bu = sttr_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"       AND prodplnt_bu = prod_bu
"
"       AND prodplnt_plnt = store_plnt
"
"       AND prodplnt_prod_id = prod_id
"
"       AND prodplnt_prod_rev = prod_rev
"
"       AND sttr_bu = p_bu
"
"       AND (store_plnt = p_plnt OR (store_plnt IS NULL AND p_plnt IS NULL))
"
"     GROUP BY sttr_bu,prodplnt_sub_cls;
"
"
"
"      FORALL i IN 1..r_stk_mon.COUNT
"
"      INSERT INTO stock_stmt_subcls_mon VALUES r_stk_mon(i);
"
"
"
"      v_st_date := r_mon.fp_from_date;
"
"      LOOP
"
"
"
"
"
"      WITH stk_dtls AS
"
"      (SELECT sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code,
"
"              SUM(Op_Qty) Op_Qty,SUM(IOH_Qty) IOH_Qty,SUM(DOH_Qty) DOH_Qty,SUM(Op_Qty)+SUM(IOH_Qty)-SUM(DOH_Qty) CL_Qty,
"
"              ROUND(SUM(Op_Val),2) Op_Val,ROUND(SUM(IOH_Val),2) IOH_Val,ROUND(SUM(DOH_Val),2) DOH_Val,ROUND(SUM(Op_Val)+SUM(IOH_Val)-SUM(DOH_Val),2) CL_Val
"
"       FROM (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    SUM(sttr_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(sttr_trans_qty * sttr_bc_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) < v_st_date
"
"                AND sttr_bucket_type = 'QOH'
"
"              GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"             HAVING SUM(sttr_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    0 Op_Qty,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty*sttr_bc_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty * sttr_bc_unit_cost) ELSE 0 END) DOH_Qty
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) = v_st_date
"
"                AND sttr_bucket_type = 'QOH'
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    SUM(stsfg_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(stsfg_trans_qty * stsfg_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) < v_st_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"              GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code
"
"             HAVING SUM(stsfg_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    0 Op_Qty,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty * stsfg_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty * stsfg_unit_cost) ELSE 0 END) DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) = v_st_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"	    )
"
"      GROUP BY sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code)
"
"      SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"	     prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"             r_mon.fp_year,r_mon.fp_period,v_st_date,
"
"             SUM(OP_Qty),SUM(IOH_Qty),SUM(DOH_Qty),SUM(CL_Qty),SUM(OP_Val),SUM(IOH_Val),SUM(DOH_Val),SUM(CL_Val),
"
"	     CASE WHEN SUM(Op_Qty) > 0 THEN SUM(OP_Val)/SUM(Op_Qty) ELSE 0 END OP_Unit_Cost,
"
"	     CASE WHEN SUM(IOH_Qty) > 0 THEN SUM(IOH_Val)/SUM(IOH_Qty) ELSE 0 END IOH_Unit_Cost,
"
"	     CASE WHEN SUM(DOH_Qty) > 0 THEN SUM(DOH_Val)/SUM(DOH_Qty) ELSE 0 END DOH_Unit_Cost,
"
"	     CASE WHEN SUM(CL_Qty) > 0 THEN SUM(CL_Val)/SUM(CL_Qty) ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_day
"
"      FROM stk_dtls,stores,products,prod_plants
"
"     WHERE store_bu = sttr_bu
"
"       AND store_id = sttr_store_id
"
"       AND prod_bu = sttr_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"       AND prodplnt_bu = prod_bu
"
"       AND prodplnt_plnt = store_plnt
"
"       AND prodplnt_prod_id = prod_id
"
"       AND prodplnt_prod_rev = prod_rev
"
"       AND sttr_bu = p_bu
"
"       AND (store_plnt = p_plnt OR (store_plnt IS NULL AND p_plnt IS NULL))
"
"     GROUP BY sttr_bu,prodplnt_sub_cls;
"
"
"
"        FORALL i IN 1..r_stk_day.COUNT
"
"        INSERT INTO stock_stmt_subcls_day VALUES r_stk_day(i);
"
"
"
"
"
"      WITH stk_dtls AS
"
"      (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"              sttr_source_doc,sttr_vou_pfx,sttr_vou_no,sttr_vou_line_no,
"
"              sttr_trans_qty Trans_Qty,sttr_bc_unit_cost Trans_Unit_Cost,(sttr_trans_qty * sttr_bc_unit_cost) Trans_Val
"
"         FROM stock_trans
"
"        WHERE sttr_bu = p_bu
"
"          AND TRUNC(sttr_trans_date) = v_st_date
"
"          AND sttr_bucket_type = 'QOH'
"
"       UNION ALL
"
"       SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"              stsfg_source_doc,stsfg_vou_pfx,stsfg_vou_no,stsfg_vou_line_no,
"
"	      stsfg_trans_qty Trans_Qty,stsfg_unit_cost Trans_Unit_Cost,(stsfg_trans_qty * stsfg_unit_cost) Trans_Val
"
"         FROM stock_trans_sfg
"
"        WHERE stsfg_bu = p_bu
"
"          AND TRUNC(stsfg_trans_date) = v_st_date
"
"          AND stsfg_bucket_type = 'QOH')
"
"      SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"             store_plnt,(SELECT bup_name1 FROM bus_unit_plants WHERE bup_bu = sttr_bu AND bup_plant_id = store_plnt),
"
"	     sttr_store_id,store_desc1,
"
"	     prodplnt_cls,(SELECT class_desc1 FROM classes WHERE class_bu = sttr_bu AND class_id = prodplnt_cls),
"
"	     prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"             r_mon.fp_year,r_mon.fp_period,v_st_date,sttr_source_doc,sttr_vou_pfx,sttr_vou_no,sttr_vou_line_no,
"
"	     sttr_prod_id,sttr_prod_rev,prod_desc11,Trans_Qty,Trans_Unit_Cost,Trans_Val
"
"        BULK COLLECT INTO r_stk_trans
"
"        FROM stk_dtls,stores,products,prod_plants
"
"       WHERE store_bu = sttr_bu
"
"         AND store_id = sttr_store_id
"
"         AND prod_bu = sttr_bu
"
"         AND prod_id = sttr_prod_id
"
"         AND prod_rev = sttr_prod_rev
"
"         AND prodplnt_bu = prod_bu
"
"         AND prodplnt_plnt = store_plnt
"
"         AND prodplnt_prod_id = prod_id
"
"         AND prodplnt_prod_rev = prod_rev
"
"         AND sttr_bu = p_bu
"
"	 AND (store_plnt = p_plnt OR (store_plnt IS NULL AND p_plnt IS NULL));
"
"
"
"      FORALL i IN 1..r_stk_Trans.COUNT
"
"        INSERT INTO stock_stmt_subcls_trans VALUES r_stk_Trans(i);
"
"
"
"	EXIT WHEN v_st_date = r_mon.fp_end_date;
"
"	v_st_date := v_st_date + 1;
"
"      END LOOP;
"
"
"
"    END LOOP;
"
"
"
"      WITH stk_dtls AS
"
"      (SELECT sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code,
"
"              SUM(Op_Qty) Op_Qty,SUM(IOH_Qty) IOH_Qty,SUM(DOH_Qty) DOH_Qty,SUM(Op_Qty)+SUM(IOH_Qty)-SUM(DOH_Qty) CL_Qty,
"
"              ROUND(SUM(Op_Val),2) Op_Val,ROUND(SUM(IOH_Val),2) IOH_Val,ROUND(SUM(DOH_Val),2) DOH_Val,ROUND(SUM(Op_Val)+SUM(IOH_Val)-SUM(DOH_Val),2) CL_Val
"
"       FROM (SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    SUM(sttr_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(sttr_trans_qty * sttr_bc_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) < p_fr_date
"
"                AND sttr_bucket_type = 'QOH'
"
"              GROUP BY sttr_bu,sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"             HAVING SUM(sttr_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT sttr_bu,'S' sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,NULL sttr_prod_ord_no,NULL sttr_sf_code,
"
"                    0 Op_Qty,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN sttr_trans_qty > 0 THEN sttr_trans_qty*sttr_bc_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN sttr_trans_qty < 0 THEN ABS(sttr_trans_qty * sttr_bc_unit_cost) ELSE 0 END) DOH_Qty
"
"               FROM stock_trans
"
"              WHERE sttr_bu = p_bu
"
"                AND TRUNC(sttr_trans_date) BETWEEN p_fr_date AND p_to_date
"
"                AND sttr_bucket_type = 'QOH'
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    SUM(stsfg_trans_qty) Op_Qty,0 IOH_Qty,0 DOH_Qty,
"
"                    SUM(stsfg_trans_qty * stsfg_unit_cost) Op_Val,0 IOH_Val,0 DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) < p_fr_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"              GROUP BY stsfg_bu,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code
"
"             HAVING SUM(stsfg_trans_qty) <> 0
"
"             UNION ALL
"
"             SELECT stsfg_bu,'F' sttr_mat_type,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_ord_no,stsfg_sf_code,
"
"                    0 Op_Qty,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty ELSE 0 END) IOH_Qty,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty) ELSE 0 END) DOH_Qty,
"
"                    0 Op_Val,(CASE WHEN stsfg_trans_qty > 0 THEN stsfg_trans_qty * stsfg_unit_cost ELSE 0 END) IOH_Val,(CASE WHEN stsfg_trans_qty < 0 THEN ABS(stsfg_trans_qty * stsfg_unit_cost) ELSE 0 END) DOH_Val
"
"               FROM stock_trans_sfg
"
"              WHERE stsfg_bu = p_bu
"
"                AND TRUNC(stsfg_trans_date) BETWEEN p_fr_date AND p_to_date
"
"                AND stsfg_bucket_type = 'QOH'
"
"	    )
"
"      GROUP BY sttr_bu,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_prod_ord_no,sttr_sf_code)
"
"      SELECT p_bu,p_user,p_fr_date,p_to_date,
"
"	     prodplnt_sub_cls,(SELECT subcls_desc1 FROM sub_classes WHERE subcls_bu = sttr_bu AND subcls_id = prodplnt_sub_cls),
"
"             SUM(OP_Qty),SUM(IOH_Qty),SUM(DOH_Qty),SUM(CL_Qty),SUM(OP_Val),SUM(IOH_Val),SUM(DOH_Val),SUM(CL_Val),
"
"	     CASE WHEN SUM(Op_Qty) > 0 THEN SUM(OP_Val)/SUM(Op_Qty) ELSE 0 END OP_Unit_Cost,
"
"	     CASE WHEN SUM(IOH_Qty) > 0 THEN SUM(IOH_Val)/SUM(IOH_Qty) ELSE 0 END IOH_Unit_Cost,
"
"	     CASE WHEN SUM(DOH_Qty) > 0 THEN SUM(DOH_Val)/SUM(DOH_Qty) ELSE 0 END DOH_Unit_Cost,
"
"	     CASE WHEN SUM(CL_Qty) > 0 THEN SUM(CL_Val)/SUM(CL_Qty) ELSE 0 END CL_Unit_Cost
"
"      BULK COLLECT INTO r_stk_subcls
"
"      FROM stk_dtls,stores,products,prod_plants
"
"     WHERE store_bu = sttr_bu
"
"       AND store_id = sttr_store_id
"
"       AND prod_bu = sttr_bu
"
"       AND prod_id = sttr_prod_id
"
"       AND prod_rev = sttr_prod_rev
"
"       AND prodplnt_bu = prod_bu
"
"       AND prodplnt_plnt = store_plnt
"
"       AND prodplnt_prod_id = prod_id
"
"       AND prodplnt_prod_rev = prod_rev
"
"       AND sttr_bu = p_bu
"
"       AND (store_plnt = p_plnt OR (store_plnt IS NULL AND p_plnt IS NULL))
"
"     GROUP BY sttr_bu,prodplnt_sub_cls;
"
"
"
"    FORALL i IN 1..r_stk_subcls.COUNT
"
"      INSERT INTO stock_stmt_subcls VALUES r_stk_subcls(i);
"
"
"
"    Commit;
"
"
"
"  END proc_gen_stk_stmt1;
"
"
"
"  PROCEDURE proc_gen_stk_ledger(p_bu		VARCHAR2,
"
"                                p_plnt		VARCHAR2,
"
"                                p_store_id	VARCHAR2,
"
"                                p_prod_id	VARCHAR2,
"
"                                p_prod_rev	NUMBER,
"
"                                p_cls_id	VARCHAR2,
"
"                                p_subcls_id	VARCHAR2,
"
"                                p_date_from	DATE,
"
"                                p_date_to	DATE,
"
"                                p_mat_type	VARCHAR2,
"
"                                p_user		VARCHAR2
"
"			       )
"
"  AS
"
"  BEGIN
"
"    NULL;
"
"  END proc_gen_stk_ledger;
"
"
"
"  PROCEDURE proc_gen_stmt_frm_stk_jrnl(p_bu		VARCHAR2,
"
"			               p_plnt		VARCHAR2,
"
"			               p_gl_acct	VARCHAR2,
"
"                                       p_date_from	DATE,
"
"                                       p_date_to	DATE,
"
"                                       p_user		VARCHAR2,
"
"                                       p_user_emp	VARCHAR2
"
"			              )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM stk_jrnl_acct_stmt WHERE sjas_bu = p_bu;
"
"
"
"    INSERT INTO stk_jrnl_acct_stmt
"
"    SELECT p_bu,NVL(gl_acct,'-'),NVL(gl_acct_desc,'-'),stk_val,Jrnl_Amt,ROUND(stk_val-Jrnl_Amt,2) Diff_Amt,p_user,p_user_emp,'-','-',SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      FROM(SELECT gl_acct,(SELECT glac_acct_desc1 FROM gl_accts WHERE glac_bu  = sttr_bu AND glac_acct = gl_acct) gl_acct_desc,ROUND(SUM(stk_val),2) stk_val,
"
"	          NVL((SELECT SUM(gjlh_bc_db_amt-gjlh_bc_cr_amt)
"
"		         FROM gl_jrnl_hd_hist,gl_jrnl_ln_hist
"
"		        WHERE gjhh_bu = gjlh_bu
"
"		          AND gjhh_jrnl_type = gjlh_jrnl_type
"
"		          AND gjhh_jrnl_no = gjlh_jrnl_no
"
"		          AND gjhh_jrnl_sfx = gjlh_jrnl_sfx
"
"		          AND gjhh_status <> 'C'
"
"		          AND gjlh_bu = sttr_bu
"
"		          AND gjlh_gl_acct = gl_acct
"
"			  AND (gjhh_plnt = p_plnt OR p_plnt IS NULL)
"
"		          AND gjhh_bu = p_bu
"
"		          AND gjhh_jrnl_date <= p_date_to),0) Jrnl_Amt
"
"             FROM (SELECT sttr_bu,store_plnt,sttr_trans_date,store_gl_acct gl_acct,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_trans_qty * sttr_bc_unit_cost stk_val
"
"                     FROM stock_trans,stores
"
"                    WHERE sttr_bu = store_bu
"
"                      AND sttr_store_id = store_id
"
"                      AND sttr_bucket_type = 'QOH'
"
"                      AND sttr_bu = p_bu
"
"                   UNION ALL
"
"                   SELECT stsfg_bu,store_plnt,stsfg_trans_date,store_gl_acct gl_acct,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_trans_qty * stsfg_unit_cost stk_val
"
"                     FROM stock_trans_sfg,stores
"
"                    WHERE stsfg_bu = store_bu
"
"                      AND stsfg_store_id = store_id
"
"                      AND stsfg_bucket_type = 'QOH'
"
"                      AND stsfg_bu = p_bu
"
"		   UNION ALL
"
"		   SELECT sttr_bu,sttr_store_plnt,sttr_trans_date,(SELECT fmc_acct FROM fin_mgmt_control WHERE fmc_bu = sttr_bu AND fmc_acct_type = 'SIT') gl_acct,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_trans_qty * sttr_bc_unit_cost stk_val
"
"                     FROM stock_trans
"
"                    WHERE sttr_bucket_type = 'SIT'
"
"                      AND sttr_bu = p_bu
"
"                   UNION ALL
"
"                   SELECT stsfg_bu,stsfg_store_plnt,stsfg_trans_date,(SELECT fmc_acct FROM fin_mgmt_control WHERE fmc_bu = stsfg_bu AND fmc_acct_type = 'SIT') gl_acct,stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_trans_qty * stsfg_unit_cost stk_val
"
"                     FROM stock_trans_sfg
"
"                    WHERE stsfg_bucket_type = 'SIT'
"
"                      AND stsfg_bu = p_bu)
"
"            WHERE sttr_trans_date <= p_date_to
"
"	      AND (gl_acct = p_gl_acct OR p_gl_acct IS NULL)
"
"	      AND (store_plnt = p_plnt OR p_plnt IS NULL)
"
"            GROUP BY sttr_bu,gl_acct) Qry
"
"            ORDER BY 1;
"
"    Commit;
"
"  END proc_gen_stmt_frm_stk_jrnl;
"
"
"
"  PROCEDURE proc_gen_doc_stmt_frm_stk_jrnl(p_bu		VARCHAR2,
"
"			                   p_plnt	VARCHAR2,
"
"			                   p_gl_acct	VARCHAR2,
"
"                                           p_date_from	DATE,
"
"                                           p_date_to	DATE,
"
"                                           p_user	VARCHAR2,
"
"                                           p_user_emp	VARCHAR2
"
"			                  )
"
"  AS
"
"  BEGIN
"
"
"
"    DELETE FROM stk_jrnl_acct_stmt_dtls WHERE sjasd_bu = p_bu;
"
"
"
"    INSERT INTO stk_jrnl_acct_stmt_dtls
"
"    SELECT p_bu,NVL(sttr_gl_acct,'-'),(SELECT glac_acct_desc1 FROM gl_accts WHERE glac_bu  = sttr_bu AND glac_acct = sttr_gl_acct) gl_acct_desc,
"
"           sttr_vou_no,ROUND(SUM(stk_val),2),ROUND(SUM(Jrnl_Amt),2),ROUND(SUM(stk_val-Jrnl_Amt),2),p_user,p_user_emp,'-','-',SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      FROM(SELECT sttr_bu,store_plnt,store_gl_acct sttr_gl_acct,
"
"                  sttr_vou_no sttr_vou_no,sttr_trans_qty * sttr_bc_unit_cost stk_val,0 Jrnl_Amt
"
"             FROM stock_trans,stores
"
"            WHERE sttr_bu = store_bu
"
"              AND sttr_store_id = store_id
"
"              AND sttr_bucket_type = 'QOH'
"
"              AND sttr_bu = p_bu
"
"	      AND TRUNC(sttr_trans_date) BETWEEN p_date_from AND p_date_to
"
"           UNION ALL
"
"           SELECT stsfg_bu,store_plnt,store_gl_acct gl_acct,
"
"                  stsfg_vou_no stsfg_vou_no,stsfg_trans_qty * stsfg_unit_cost stk_val,0 Jrnl_Amt
"
"             FROM stock_trans_sfg,stores
"
"            WHERE stsfg_bu = store_bu
"
"              AND stsfg_store_id = store_id
"
"              AND stsfg_bucket_type = 'QOH'
"
"              AND stsfg_bu = p_bu
"
"	      AND TRUNC(stsfg_trans_date) BETWEEN p_date_from AND p_date_to
"
"	   UNION ALL
"
"           SELECT sttr_bu,sttr_store_plnt,(SELECT fmc_acct FROM fin_mgmt_control WHERE fmc_bu = sttr_bu AND fmc_acct_type = 'SIT') sttr_gl_acct,
"
"                  sttr_vou_no sttr_vou_no,sttr_trans_qty * sttr_bc_unit_cost stk_val,0 Jrnl_Amt
"
"             FROM stock_trans
"
"            WHERE sttr_bucket_type = 'SIT'
"
"              AND sttr_bu = p_bu
"
"	      AND TRUNC(sttr_trans_date) BETWEEN p_date_from AND p_date_to
"
"           UNION ALL
"
"           SELECT stsfg_bu,stsfg_store_plnt,(SELECT fmc_acct FROM fin_mgmt_control WHERE fmc_bu = stsfg_bu AND fmc_acct_type = 'SIT') gl_acct,
"
"                  stsfg_vou_no stsfg_vou_no,stsfg_trans_qty * stsfg_unit_cost stk_val,0 Jrnl_Amt
"
"             FROM stock_trans_sfg
"
"            WHERE stsfg_bucket_type = 'SIT'
"
"              AND stsfg_bu = p_bu
"
"	      AND TRUNC(stsfg_trans_date) BETWEEN p_date_from AND p_date_to
"
"	   UNION ALL
"
"	   SELECT gjlh_bu,gjhh_plnt,gjlh_gl_acct,gjlh_vou_no,0 stk_val,SUM(gjlh_bc_db_amt-gjlh_bc_cr_amt) jrnl_amt
"
"	     FROM (
"
"	   SELECT gjlh_bu,gjhh_plnt,gjlh_gl_acct,gjlh_vou_no,gjlh_bc_db_amt,gjlh_bc_cr_amt
"
"             FROM gl_jrnl_hd_hist,gl_jrnl_ln_hist
"
"            WHERE gjhh_bu = gjlh_bu
"
"              AND gjhh_jrnl_type = gjlh_jrnl_type
"
"              AND gjhh_jrnl_no = gjlh_jrnl_no
"
"              AND gjhh_jrnl_sfx = gjlh_jrnl_sfx
"
"              AND gjhh_status <> 'C'
"
"              AND gjhh_bu = p_bu
"
"	      AND TRUNC(gjhh_jrnl_date) BETWEEN p_date_from AND p_date_to
"
"	      AND (EXISTS(SELECT 1 FROM stores WHERE store_bu = gjlh_bu AND store_gl_acct = gjlh_gl_acct) OR
"
"	           EXISTS(SELECT 1 FROM fin_mgmt_control WHERE fmc_bu = gjlh_bu AND fmc_acct = gjlh_gl_acct AND fmc_acct_type = 'SIT'))
"
"            )
"
"	    GROUP BY gjlh_bu,gjhh_plnt,gjlh_gl_acct,gjlh_vou_no)
"
"     WHERE (sttr_gl_acct = p_gl_acct OR p_gl_acct IS NULL)
"
"       AND (store_plnt = p_plnt OR p_plnt IS NULL)
"
"     GROUP BY sttr_bu,sttr_gl_acct,sttr_vou_no
"
"     ORDER BY 1;
"
"
"
"    Commit;
"
"
"
"  END proc_gen_doc_stmt_frm_stk_jrnl;
"
"
"
"END pkg_stk;"
/
