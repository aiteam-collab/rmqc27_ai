CREATE OR REPLACE
"PACKAGE BODY pkg_inv_aging
"
"AS
"
"
"
"PROCEDURE proc_ins_inv_aging(p_bu		IN	VARCHAR2,
"
"			     p_doc_no		IN	VARCHAR2,
"
"			     p_date		IN	DATE,
"
"			     p_user		IN	VARCHAR2
"
"			    )
"
"IS
"
"
"
"CURSOR c1 IS
"
"WITH tab_days AS
"
"(SELECT 1 seq,iahd_param_day_01 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_01 IS NOT NULL
"
"UNION ALL
"
"SELECT 2 seq,iahd_param_day_02 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_02 IS NOT NULL
"
"UNION ALL
"
"SELECT 3 seq,iahd_param_day_03 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_03 IS NOT NULL
"
"UNION ALL
"
"SELECT 4 seq,iahd_param_day_04 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_04 IS NOT NULL
"
"UNION ALL
"
"SELECT 5 seq,iahd_param_day_05 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_05 IS NOT NULL
"
"UNION ALL
"
"SELECT 6 seq,iahd_param_day_06 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_06 IS NOT NULL
"
"UNION ALL
"
"SELECT 7 seq,iahd_param_day_07 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_07 IS NOT NULL
"
"UNION ALL
"
"SELECT 8 seq,iahd_param_day_08 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_08 IS NOT NULL)
"
"SELECT seq,iapr_days FROM tab_days
"
"UNION ALL
"
"SELECT 99 seq,MAX(iapr_days) FROM tab_days
"
"ORDER BY Seq;
"
"
"
"CURSOR c_ctrl IS
"
"SELECT icmctrl_slow_mov_days,icmctrl_non_mov_days
"
"  FROM icm_control
"
" WHERE icmctrl_bu = p_bu;
"
"
"
"r_ctrl		c_ctrl%ROWTYPE;
"
"
"
"TYPE typ_stk IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" store_id	stores.store_id%TYPE,
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_val	NUMBER(17,2),
"
" trans_date	DATE,
"
" due_days	NUMBER(5)
"
");
"
"
"
"TYPE typ_prod IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_val	NUMBER(17,2),
"
" trans_date	DATE,
"
" due_days	NUMBER(5),
"
" param_seq_no	NUMBER(5),
"
" param_desc	VARCHAR2(50)
"
");
"
"
"
"TYPE typ_stk_dtl IS TABLE OF typ_stk INDEX BY PLS_INTEGER;
"
"rec_stk_dtl	typ_stk_dtl;
"
"
"
"TYPE typ_prod_dtl IS TABLE OF typ_prod INDEX BY PLS_INTEGER;
"
"rec_prod_dtl	typ_prod_dtl;
"
"
"
"indx		NUMBER;
"
"v_tot_param	NUMBER;
"
"v_param_seq_no	NUMBER;
"
"v_start_day	NUMBER;
"
"v_type		VARCHAR2(1);
"
"
"
"BEGIN
"
"
"
"  DELETE FROM inv_aging_stk_dtls
"
"   WHERE iasd_bu = p_bu
"
"     AND iasd_doc_no = p_doc_no;
"
"
"
"  DELETE FROM inv_aging_prod_dtls
"
"   WHERE iapd_bu = p_bu
"
"     AND iapd_doc_no = p_doc_no;
"
"
"
"  SELECT ROWNUM,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_sf_code,sttr_trans_qty,sttr_unit_cost,sttr_trans_val,sttr_trans_date,sttr_due_days
"
"    BULK COLLECT INTO rec_stk_dtl
"
"    FROM(SELECT 'ST' sttr_mat_type,
"
"		sttr_store_id,
"
"                sttr_prod_id,
"
"		sttr_prod_rev,
"
"		NULL sttr_sf_code,
"
"		SUM(sttr_trans_qty) sttr_trans_qty,
"
"		SUM(sttr_trans_qty * sttr_bc_unit_cost)/SUM(sttr_trans_qty) sttr_unit_cost,
"
"		SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_trans_val,
"
"		MAX(sttr_trans_date) sttr_trans_date,
"
"		(p_date - MAX (sttr_trans_date)) sttr_due_days
"
"	   FROM stock_trans
"
"	  WHERE sttr_bu = p_bu
"
"	    AND TRUNC(sttr_trans_date) <= p_date
"
"	    AND sttr_bucket_type = 'QOH'
"
"	 HAVING SUM(sttr_trans_qty) <> 0
"
"	  GROUP BY sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"	  UNION ALL
"
"	 SELECT 'SF' stsfg_mat_type,
"
"	        stsfg_store_id,
"
"		stsfg_prod_id,
"
"		stsfg_prod_rev,
"
"		stsfg_sf_code,
"
"		SUM(stsfg_trans_qty) sttr_trans_qty,
"
"		SUM(stsfg_trans_qty * stsfg_unit_cost)/SUM(stsfg_trans_qty) sttr_unit_cost,
"
"		SUM(stsfg_trans_qty * stsfg_unit_cost) sttr_trans_val,
"
"		MAX(stsfg_trans_date) sttr_trans_date,
"
"		(p_date - MAX (stsfg_trans_date)) sttr_due_days
"
"           FROM stock_trans_sfg
"
"	  WHERE stsfg_bu = p_bu
"
"	    AND TRUNC(stsfg_trans_date) <= p_date
"
"	    AND stsfg_bucket_type = 'QOH'
"
"	 HAVING SUM(stsfg_trans_qty) <> 0
"
"	  GROUP BY stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_sf_code);
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_stk_dtl.COUNT
"
"      INSERT INTO inv_aging_stk_dtls(iasd_bu,
"
"				     iasd_doc_no,
"
"				     iasd_seq_no,
"
"				     iasd_mat_type,
"
"				     iasd_store_id,
"
"				     iasd_prod_id,
"
"				     iasd_prod_rev,
"
"				     iasd_sf_code,
"
"				     iasd_trans_qty,
"
"				     iasd_unit_cost,
"
"				     iasd_trans_val,
"
"				     iasd_trans_date,
"
"				     iasd_due_days,
"
"				     iasd_cre_by,
"
"				     iasd_cre_date
"
"				    )
"
"			      VALUES(p_bu,
"
"				     p_doc_no,
"
"				     rec_stk_dtl(indx).seq_no,
"
"				     rec_stk_dtl(indx).mat_type,
"
"				     rec_stk_dtl(indx).store_id,
"
"				     rec_stk_dtl(indx).prod_id,
"
"				     rec_stk_dtl(indx).prod_rev,
"
"				     rec_stk_dtl(indx).sf_code,
"
"				     rec_stk_dtl(indx).trans_qty,
"
"				     rec_stk_dtl(indx).unit_cost,
"
"				     rec_stk_dtl(indx).trans_val,
"
"				     rec_stk_dtl(indx).trans_date,
"
"				     rec_stk_dtl(indx).due_days,
"
"				     p_user,
"
"				     SYSDATE
"
"				    );
"
"  END;
"
"
"
"  v_param_seq_no := 1;
"
"  indx := 1;
"
"  v_start_day := 1;
"
"
"
"  SELECT COUNT(*)
"
"    INTO v_tot_param
"
"    FROM inv_aging_param
"
"   WHERE iapr_bu = p_bu
"
"     AND iapr_doc_no = p_doc_no;
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"    IF cr1.seq = 99 THEN
"
"      v_type := 'L';
"
"    ELSE
"
"      v_type := 'B';
"
"    END IF;
"
"
"
"    FOR rec_prod IN (WITH prod_dtls AS
"
"                     (SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,
"
"		             SUM(iasd_trans_qty) iasd_trans_qty,
"
"			     SUM(iasd_trans_qty * iasd_unit_cost) / SUM(iasd_trans_qty) iasd_unit_cost,
"
"			     SUM(iasd_trans_val) iasd_trans_val,
"
"			     MAX(iasd_trans_date) iasd_trans_date,
"
"			     (p_date - MAX (iasd_trans_date)) iasd_due_days
"
"			FROM inv_aging_stk_dtls
"
"		       WHERE iasd_bu = p_bu
"
"                         AND iasd_doc_no = p_doc_no
"
"		       GROUP BY iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code)
"
"		     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		            iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"		       FROM(SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		                   iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"		              FROM prod_dtls
"
"			     WHERE iasd_due_days <= 0
"
"			       AND v_type = 'F'
"
"			     UNION ALL
"
"			    SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days BETWEEN v_start_day AND cr1.iapr_days
"
"			       AND v_type = 'B'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			            iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			       FROM prod_dtls
"
"			      WHERE iasd_due_days >= v_start_day
"
"			        AND v_type = 'L')
"
"		       ORDER BY iasd_due_days)
"
"    LOOP
"
"      rec_prod_dtl(indx).seq_no := indx;
"
"      rec_prod_dtl(indx).mat_type := rec_prod.iasd_mat_type;
"
"      rec_prod_dtl(indx).prod_id := rec_prod.iasd_prod_id;
"
"      rec_prod_dtl(indx).prod_rev := rec_prod.iasd_prod_rev;
"
"      rec_prod_dtl(indx).sf_code := rec_prod.iasd_sf_code;
"
"      rec_prod_dtl(indx).trans_qty := rec_prod.iasd_trans_qty;
"
"      rec_prod_dtl(indx).trans_val := rec_prod.iasd_trans_val;
"
"      rec_prod_dtl(indx).unit_cost := rec_prod.iasd_unit_cost;
"
"      rec_prod_dtl(indx).trans_date := rec_prod.iasd_trans_date;
"
"      rec_prod_dtl(indx).due_days := rec_prod.iasd_due_days;
"
"      rec_prod_dtl(indx).param_seq_no := v_param_seq_no;
"
"      IF v_type = 'B' THEN
"
"        rec_prod_dtl(indx).param_desc := v_start_day||'-'||cr1.iapr_days||' DAYS';
"
"      ELSE
"
"        rec_prod_dtl(indx).param_desc := 'ABOVE '||cr1.iapr_days||' DAYS';
"
"      END IF;
"
"      indx := indx + 1;
"
"    END LOOP;
"
"
"
"    UPDATE inv_aging_stk_dtls
"
"       SET iasd_param_seq_no = v_param_seq_no
"
"     WHERE iasd_bu = p_bu
"
"       AND iasd_doc_no = p_doc_no
"
"       AND ((v_type = 'B' AND (iasd_due_days BETWEEN v_start_day AND cr1.iapr_days)) OR
"
"             (v_type = 'L' AND iasd_due_days >= v_start_day));
"
"
"
"    v_start_day := cr1.iapr_days + 1;
"
"    v_param_seq_no := v_param_seq_no + 1;
"
"  END LOOP;
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_prod_dtl.COUNT
"
"      INSERT INTO inv_aging_prod_dtls(iapd_bu,
"
"				      iapd_doc_no,
"
"				      iapd_seq_no,
"
"				      iapd_mat_type,
"
"				      iapd_prod_id,
"
"				      iapd_prod_rev,
"
"				      iapd_sf_code,
"
"				      iapd_trans_qty,
"
"				      iapd_unit_cost,
"
"				      iapd_trans_val,
"
"				      iapd_trans_date,
"
"				      iapd_due_days,
"
"				      iapd_param_seq_no,
"
"				      iapd_param_desc,
"
"				      iapd_cre_by,
"
"				      iapd_cre_date
"
"				     )
"
"			       VALUES(p_bu,
"
"				      p_doc_no,
"
"				      rec_prod_dtl(indx).seq_no,
"
"				      rec_prod_dtl(indx).mat_type,
"
"				      rec_prod_dtl(indx).prod_id,
"
"				      rec_prod_dtl(indx).prod_rev,
"
"				      rec_prod_dtl(indx).sf_code,
"
"				      rec_prod_dtl(indx).trans_qty,
"
"				      rec_prod_dtl(indx).unit_cost,
"
"				      rec_prod_dtl(indx).trans_val,
"
"				      rec_prod_dtl(indx).trans_date,
"
"				      rec_prod_dtl(indx).due_days,
"
"				      rec_prod_dtl(indx).param_seq_no,
"
"				      rec_prod_dtl(indx).param_desc,
"
"				      p_user,
"
"				      SYSDATE
"
"				     );
"
"  END;
"
"
"
"  /*OPEN c_ctrl;
"
"  FETCH c_ctrl INTO r_ctrl;
"
"  CLOSE c_ctrl;
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'N'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days <= r_ctrl.icmctrl_non_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'S'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days > r_ctrl.icmctrl_non_mov_days
"
"		   AND iapd_due_days <= r_ctrl.icmctrl_slow_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'F'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days >= r_ctrl.icmctrl_slow_mov_days);*/
"
"
"
"  Commit;
"
"
"
"END proc_ins_inv_aging;
"
"
"
"PROCEDURE proc_ins_batch_inv_aging(p_bu		IN	VARCHAR2,
"
"			           p_doc_no	IN	VARCHAR2,
"
"			           p_date	IN	DATE,
"
"			           p_user	IN	VARCHAR2
"
"			          )
"
"IS
"
"
"
"CURSOR c1 IS
"
"SELECT iapr_days
"
"  FROM (SELECT iapr_days
"
"          FROM inv_aging_param
"
"         WHERE iapr_bu = p_bu
"
"           AND iapr_doc_no = p_doc_no
"
"        UNION ALL
"
"        SELECT MAX(iapr_days)+1
"
"          FROM inv_aging_param
"
"         WHERE iapr_bu = p_bu
"
"           AND iapr_doc_no = p_doc_no)
"
" ORDER BY iapr_days;
"
"
"
"CURSOR c_ctrl IS
"
"SELECT icmctrl_slow_mov_days,icmctrl_non_mov_days
"
"  FROM icm_control
"
" WHERE icmctrl_bu = p_bu;
"
"
"
"r_ctrl		c_ctrl%ROWTYPE;
"
"
"
"TYPE typ_stk IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" store_id	stores.store_id%TYPE,
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_val	NUMBER(17,2),
"
" trans_date	DATE,
"
" due_days	NUMBER(5)
"
");
"
"
"
"TYPE typ_prod IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_val	NUMBER(17,2),
"
" trans_date	DATE,
"
" due_days	NUMBER(5),
"
" param_seq_no	NUMBER(5)
"
");
"
"
"
"TYPE typ_stk_dtl IS TABLE OF typ_stk INDEX BY PLS_INTEGER;
"
"rec_stk_dtl	typ_stk_dtl;
"
"
"
"TYPE typ_prod_dtl IS TABLE OF typ_prod INDEX BY PLS_INTEGER;
"
"rec_prod_dtl	typ_prod_dtl;
"
"
"
"indx		NUMBER;
"
"v_tot_param	NUMBER;
"
"v_param_seq_no	NUMBER;
"
"v_start_day	NUMBER;
"
"v_type		VARCHAR2(1);
"
"
"
"BEGIN
"
"
"
"  DELETE FROM inv_aging_stk_dtls
"
"   WHERE iasd_bu = p_bu
"
"     AND iasd_doc_no = p_doc_no;
"
"
"
"  DELETE FROM inv_aging_prod_dtls
"
"   WHERE iapd_bu = p_bu
"
"     AND iapd_doc_no = p_doc_no;
"
"
"
"  SELECT ROWNUM,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_sf_code,sttr_trans_qty,sttr_unit_cost,sttr_trans_val,sttr_trans_date,sttr_due_days
"
"    BULK COLLECT INTO rec_stk_dtl
"
"    FROM(SELECT 'ST' sttr_mat_type,
"
"		sttr_store_id,
"
"                sttr_prod_id,
"
"		sttr_prod_rev,
"
"		sttr_batch_no,
"
"		NULL sttr_sf_code,
"
"		SUM(sttr_trans_qty) sttr_trans_qty,
"
"		SUM(sttr_trans_qty * sttr_bc_unit_cost)/SUM(sttr_trans_qty) sttr_unit_cost,
"
"		SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_trans_val,
"
"		MAX(sttr_trans_date) sttr_trans_date,
"
"		(p_date - MAX(sttr_trans_date)) sttr_due_days
"
"	   FROM stock_trans
"
"	  WHERE sttr_bu = p_bu
"
"	    AND TRUNC(sttr_trans_date) <= p_date
"
"	    AND sttr_bucket_type = 'QOH'
"
"	 HAVING SUM(sttr_trans_qty) <> 0
"
"	  GROUP BY sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_batch_no
"
"	  UNION ALL
"
"	 SELECT 'SF' stsfg_mat_type,
"
"	        stsfg_store_id,
"
"		stsfg_prod_id,
"
"		stsfg_prod_rev,
"
"		NULL stsfg_batch_no,
"
"		stsfg_sf_code,
"
"		SUM(stsfg_trans_qty) sttr_trans_qty,
"
"		SUM(stsfg_trans_qty * stsfg_unit_cost)/SUM(stsfg_trans_qty) sttr_unit_cost,
"
"		SUM(stsfg_trans_qty * stsfg_unit_cost) sttr_trans_val,
"
"		MAX(stsfg_trans_date) sttr_trans_date,
"
"		(p_date - MAX (stsfg_trans_date)) sttr_due_days
"
"           FROM stock_trans_sfg
"
"	  WHERE stsfg_bu = p_bu
"
"	    AND TRUNC(stsfg_trans_date) <= p_date
"
"	    AND stsfg_bucket_type = 'QOH'
"
"	 HAVING SUM(stsfg_trans_qty) <> 0
"
"	  GROUP BY stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_sf_code);
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_stk_dtl.COUNT
"
"      INSERT INTO inv_aging_stk_dtls(iasd_bu,
"
"				     iasd_doc_no,
"
"				     iasd_seq_no,
"
"				     iasd_mat_type,
"
"				     iasd_store_id,
"
"				     iasd_prod_id,
"
"				     iasd_prod_rev,
"
"				     iasd_sf_code,
"
"				     iasd_trans_qty,
"
"				     iasd_unit_cost,
"
"				     iasd_trans_val,
"
"				     iasd_trans_date,
"
"				     iasd_due_days,
"
"				     iasd_cre_by,
"
"				     iasd_cre_date
"
"				    )
"
"			      VALUES(p_bu,
"
"				     p_doc_no,
"
"				     rec_stk_dtl(indx).seq_no,
"
"				     rec_stk_dtl(indx).mat_type,
"
"				     rec_stk_dtl(indx).store_id,
"
"				     rec_stk_dtl(indx).prod_id,
"
"				     rec_stk_dtl(indx).prod_rev,
"
"				     rec_stk_dtl(indx).sf_code,
"
"				     rec_stk_dtl(indx).trans_qty,
"
"				     rec_stk_dtl(indx).unit_cost,
"
"				     rec_stk_dtl(indx).trans_val,
"
"				     rec_stk_dtl(indx).trans_date,
"
"				     rec_stk_dtl(indx).due_days,
"
"				     p_user,
"
"				     SYSDATE
"
"				    );
"
"  END;
"
"
"
"  v_param_seq_no := 1;
"
"  indx := 1;
"
"  v_start_day := 1;
"
"
"
"  SELECT COUNT(*)
"
"    INTO v_tot_param
"
"    FROM inv_aging_param
"
"   WHERE iapr_bu = p_bu
"
"     AND iapr_doc_no = p_doc_no;
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"    IF c1%ROWCOUNT = 1 AND cr1.iapr_days <= 0 THEN
"
"      v_type := 'F';
"
"    ELSIF c1%ROWCOUNT = (v_tot_param + 1) THEN
"
"      v_type := 'L';
"
"    ELSE
"
"      v_type := 'B';
"
"    END IF;
"
"
"
"    FOR rec_prod IN (WITH prod_dtls AS
"
"                     (SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,
"
"		             SUM(iasd_trans_qty) iasd_trans_qty,
"
"			     SUM(iasd_trans_qty * iasd_unit_cost) / SUM(iasd_trans_qty) iasd_unit_cost,
"
"			     SUM(iasd_trans_val) iasd_trans_val,
"
"			     iasd_trans_date iasd_trans_date,
"
"			     (p_date - iasd_trans_date) iasd_due_days
"
"			FROM inv_aging_stk_dtls
"
"		       WHERE iasd_bu = p_bu
"
"                         AND iasd_doc_no = p_doc_no
"
"                      HAVING SUM(iasd_trans_qty) > 0
"
"		       GROUP BY iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_date)
"
"		     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		            iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"		       FROM(SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		                   iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"		              FROM prod_dtls
"
"			     WHERE iasd_due_days <= 0
"
"			       AND v_type = 'F'
"
"			     UNION ALL
"
"			    SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days BETWEEN v_start_day AND cr1.iapr_days
"
"			       AND v_type = 'B'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			            iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			       FROM prod_dtls
"
"			      WHERE iasd_due_days >= v_start_day
"
"			        AND v_type = 'L')
"
"		       ORDER BY iasd_due_days)
"
"    LOOP
"
"      rec_prod_dtl(indx).seq_no := indx;
"
"      rec_prod_dtl(indx).mat_type := rec_prod.iasd_mat_type;
"
"      rec_prod_dtl(indx).prod_id := rec_prod.iasd_prod_id;
"
"      rec_prod_dtl(indx).prod_rev := rec_prod.iasd_prod_rev;
"
"      rec_prod_dtl(indx).sf_code := rec_prod.iasd_sf_code;
"
"      rec_prod_dtl(indx).trans_qty := rec_prod.iasd_trans_qty;
"
"      rec_prod_dtl(indx).unit_cost := rec_prod.iasd_unit_cost;
"
"      rec_prod_dtl(indx).trans_val := rec_prod.iasd_trans_val;
"
"      rec_prod_dtl(indx).trans_date := rec_prod.iasd_trans_date;
"
"      rec_prod_dtl(indx).due_days := rec_prod.iasd_due_days;
"
"      rec_prod_dtl(indx).param_seq_no := v_param_seq_no;
"
"      indx := indx + 1;
"
"    END LOOP;
"
"
"
"    UPDATE inv_aging_stk_dtls
"
"       SET iasd_param_seq_no = v_param_seq_no
"
"     WHERE iasd_bu = p_bu
"
"       AND iasd_doc_no = p_doc_no
"
"       AND ((v_type = 'F' AND iasd_due_days <= cr1.iapr_days) OR
"
"            (v_type = 'L' AND iasd_due_days >= cr1.iapr_days) OR
"
"	    (v_type = 'B' AND iasd_due_days BETWEEN v_start_day AND cr1.iapr_days));
"
"
"
"    v_start_day := cr1.iapr_days + 1;
"
"    v_param_seq_no := v_param_seq_no + 1;
"
"  END LOOP;
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_prod_dtl.COUNT
"
"      INSERT INTO inv_aging_prod_dtls(iapd_bu,
"
"				      iapd_doc_no,
"
"				      iapd_seq_no,
"
"				      iapd_mat_type,
"
"				      iapd_prod_id,
"
"				      iapd_prod_rev,
"
"				      iapd_sf_code,
"
"				      iapd_trans_qty,
"
"				      iapd_unit_cost,
"
"				      iapd_trans_val,
"
"				      iapd_trans_date,
"
"				      iapd_due_days,
"
"				      iapd_param_seq_no,
"
"				      iapd_cre_by,
"
"				      iapd_cre_date
"
"				     )
"
"			       VALUES(p_bu,
"
"				      p_doc_no,
"
"				      rec_prod_dtl(indx).seq_no,
"
"				      rec_prod_dtl(indx).mat_type,
"
"				      rec_prod_dtl(indx).prod_id,
"
"				      rec_prod_dtl(indx).prod_rev,
"
"				      rec_prod_dtl(indx).sf_code,
"
"				      rec_prod_dtl(indx).trans_qty,
"
"				      rec_prod_dtl(indx).unit_cost,
"
"				      rec_prod_dtl(indx).trans_val,
"
"				      rec_prod_dtl(indx).trans_date,
"
"				      rec_prod_dtl(indx).due_days,
"
"				      rec_prod_dtl(indx).param_seq_no,
"
"				      p_user,
"
"				      SYSDATE
"
"				     );
"
"  END;
"
"
"
"  /*OPEN c_ctrl;
"
"  FETCH c_ctrl INTO r_ctrl;
"
"  CLOSE c_ctrl;
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'N'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days <= r_ctrl.icmctrl_non_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'S'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days >= r_ctrl.icmctrl_slow_mov_days
"
"		   AND iapd_due_days < r_ctrl.icmctrl_non_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'F'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days >= r_ctrl.icmctrl_slow_mov_days);*/
"
"
"
"  Commit;
"
"
"
"END proc_ins_batch_inv_aging;
"
"
"
"PROCEDURE proc_ins_so_inv_aging(p_bu		IN	VARCHAR2,
"
"			        p_doc_no	IN	VARCHAR2,
"
"			        p_date		IN	DATE,
"
"			        p_user		IN	VARCHAR2
"
"			       )
"
"IS
"
"CURSOR c1 IS
"
"SELECT iapr_days
"
"  FROM (SELECT iapr_days
"
"          FROM inv_aging_param
"
"         WHERE iapr_bu = p_bu
"
"           AND iapr_doc_no = p_doc_no
"
"        UNION ALL
"
"        SELECT MAX(iapr_days)+1
"
"          FROM inv_aging_param
"
"         WHERE iapr_bu = p_bu
"
"           AND iapr_doc_no = p_doc_no)
"
" ORDER BY iapr_days;
"
"
"
"CURSOR c_ctrl IS
"
"SELECT icmctrl_slow_mov_days,icmctrl_non_mov_days
"
"  FROM icm_control
"
" WHERE icmctrl_bu = p_bu;
"
"
"
"r_ctrl		c_ctrl%ROWTYPE;
"
"
"
"TYPE typ_stk IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" store_id	stores.store_id%TYPE,
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_date	DATE,
"
" due_days	NUMBER(5),
"
" so_schld_desc	VARCHAR2(200)
"
");
"
"
"
"TYPE typ_prod IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_date	DATE,
"
" due_days	NUMBER(5),
"
" param_seq_no	NUMBER(5)
"
");
"
"
"
"TYPE typ_stk_dtl IS TABLE OF typ_stk INDEX BY PLS_INTEGER;
"
"rec_stk_dtl	typ_stk_dtl;
"
"
"
"TYPE typ_prod_dtl IS TABLE OF typ_prod INDEX BY PLS_INTEGER;
"
"rec_prod_dtl	typ_prod_dtl;
"
"
"
"indx		NUMBER;
"
"v_tot_param	NUMBER;
"
"v_param_seq_no	NUMBER;
"
"v_start_day	NUMBER;
"
"v_type		VARCHAR2(1);
"
"
"
"BEGIN
"
"
"
"  DELETE FROM inv_aging_stk_dtls
"
"   WHERE iasd_bu = p_bu
"
"     AND iasd_doc_no = p_doc_no;
"
"
"
"  DELETE FROM inv_aging_prod_dtls
"
"   WHERE iapd_bu = p_bu
"
"     AND iapd_doc_no = p_doc_no;
"
"
"
"  SELECT ROWNUM,sstr_mat_type,sstr_store_id,sstr_prod_id,sstr_prod_rev,sstr_sf_code,sstr_trans_qty,sstr_unit_cost,sstr_trans_date,sstr_due_days,
"
"         sstr_so_schld_desc
"
"    BULK COLLECT INTO rec_stk_dtl
"
"    FROM(SELECT 'ST' sstr_mat_type,
"
"		sstr_store_id,
"
"                sstr_prod_id,
"
"		sstr_prod_rev,
"
"		sstr_so_schld_desc,
"
"		NULL sstr_sf_code,
"
"		SUM(sstr_trans_qty) sstr_trans_qty,
"
"		ROUND(SUM(sstr_trans_qty * sstr_unit_cost)/SUM(sstr_trans_qty),5) sstr_unit_cost,
"
"		MAX(sstr_trans_date) sstr_trans_date,
"
"		(p_date - MAX(sstr_trans_date)) sstr_due_days
"
"	   FROM stock_so_trans
"
"	  WHERE sstr_bu = p_bu
"
"	    AND TRUNC(sstr_trans_date) <= p_date
"
"	    --AND sttr_bucket_type = 'QOH'
"
"	 HAVING SUM(sstr_trans_qty) <> 0
"
"	  GROUP BY sstr_store_id,sstr_prod_id,sstr_prod_rev,sstr_so_schld_desc
"
"	  UNION ALL
"
"	 SELECT 'SF' sfstr_mat_type,
"
"	        sfstr_store_id,
"
"		sfstr_prod_id,
"
"		sfstr_prod_rev,
"
"		sfstr_so_schld_desc,
"
"		sfstr_sf_code,
"
"		SUM(sfstr_trans_qty) sfstr_trans_qty,
"
"		SUM(sfstr_trans_qty * sfstr_unit_cost)/SUM(sfstr_trans_qty) sfstr_unit_cost,
"
"		MAX(sfstr_trans_date) sfstr_trans_date,
"
"		(p_date - MAX (sfstr_trans_date)) sfstr_due_days
"
"           FROM stock_sf_so_trans
"
"	  WHERE sfstr_bu = p_bu
"
"	    AND TRUNC(sfstr_trans_date) <= p_date
"
"	    --AND sfstr_bucket_type = 'QOH'
"
"	 HAVING SUM(sfstr_trans_qty) <> 0
"
"	  GROUP BY sfstr_store_id,sfstr_prod_id,sfstr_prod_rev,sfstr_sf_code,sfstr_so_schld_desc)
"
"	/*WHERE EXISTS(SELECT 1
"
"	               FROM sales_order_hd
"
"		      WHERE soh_bu = p_bu
"
"		        AND soh_order_pfx = sstr_so_pfx
"
"			AND soh_order_no = sstr_so_no
"
"			AND soh_sales_person = p_sales_person)*/;
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_stk_dtl.COUNT
"
"      INSERT INTO inv_aging_stk_dtls(iasd_bu,
"
"				     iasd_doc_no,
"
"				     iasd_seq_no,
"
"				     iasd_mat_type,
"
"				     iasd_store_id,
"
"				     iasd_prod_id,
"
"				     iasd_prod_rev,
"
"				     iasd_sf_code,
"
"				     iasd_trans_qty,
"
"				     iasd_unit_cost,
"
"				     iasd_trans_val,
"
"				     iasd_trans_date,
"
"				     iasd_due_days,
"
"				     iasd_so_schld_desc,
"
"				     iasd_cre_by,
"
"				     iasd_cre_date
"
"				    )
"
"			      VALUES(p_bu,
"
"				     p_doc_no,
"
"				     rec_stk_dtl(indx).seq_no,
"
"				     rec_stk_dtl(indx).mat_type,
"
"				     rec_stk_dtl(indx).store_id,
"
"				     rec_stk_dtl(indx).prod_id,
"
"				     rec_stk_dtl(indx).prod_rev,
"
"				     rec_stk_dtl(indx).sf_code,
"
"				     rec_stk_dtl(indx).trans_qty,
"
"				     rec_stk_dtl(indx).unit_cost,
"
"				     rec_stk_dtl(indx).trans_qty * rec_stk_dtl(indx).unit_cost,
"
"				     rec_stk_dtl(indx).trans_date,
"
"				     rec_stk_dtl(indx).due_days,
"
"				     rec_stk_dtl(indx).so_schld_desc,
"
"				     p_user,
"
"				     SYSDATE
"
"				    );
"
"  END;
"
"
"
"
"
"  v_param_seq_no := 1;
"
"  indx := 1;
"
"  v_start_day := 1;
"
"
"
"  SELECT COUNT(*)
"
"    INTO v_tot_param
"
"    FROM inv_aging_param
"
"   WHERE iapr_bu = p_bu
"
"     AND iapr_doc_no = p_doc_no;
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"    IF c1%ROWCOUNT = 1 THEN
"
"      v_type := 'F';
"
"    ELSIF c1%ROWCOUNT = (v_tot_param + 1) THEN
"
"      v_type := 'L';
"
"    ELSE
"
"      v_type := 'B';
"
"    END IF;
"
"
"
"    FOR rec_prod IN (WITH prod_dtls AS
"
"                     (SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,
"
"		             SUM(iasd_trans_qty) iasd_trans_qty,
"
"			     SUM(iasd_trans_qty * iasd_unit_cost) / SUM(iasd_trans_qty) iasd_unit_cost,
"
"			     iasd_trans_date iasd_trans_date,
"
"			     (p_date - iasd_trans_date) iasd_due_days
"
"			FROM inv_aging_stk_dtls
"
"		       WHERE iasd_bu = p_bu
"
"                         AND iasd_doc_no = p_doc_no
"
"                      HAVING SUM(iasd_trans_qty) > 0
"
"		       GROUP BY iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_date)
"
"		     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		            iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"		       FROM(SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		                   iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"		              FROM prod_dtls
"
"			     WHERE iasd_due_days <= cr1.iapr_days
"
"			       AND v_type = 'F'
"
"			     UNION ALL
"
"			    SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days BETWEEN v_start_day AND cr1.iapr_days
"
"			       AND v_type = 'B'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			            iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"			       FROM prod_dtls
"
"			      WHERE iasd_due_days >= v_start_day
"
"			        AND v_type = 'L')
"
"		       ORDER BY iasd_due_days)
"
"    LOOP
"
"      rec_prod_dtl(indx).seq_no := indx;
"
"      rec_prod_dtl(indx).mat_type := rec_prod.iasd_mat_type;
"
"      rec_prod_dtl(indx).prod_id := rec_prod.iasd_prod_id;
"
"      rec_prod_dtl(indx).prod_rev := rec_prod.iasd_prod_rev;
"
"      rec_prod_dtl(indx).sf_code := rec_prod.iasd_sf_code;
"
"      rec_prod_dtl(indx).trans_qty := rec_prod.iasd_trans_qty;
"
"      rec_prod_dtl(indx).unit_cost := rec_prod.iasd_unit_cost;
"
"      rec_prod_dtl(indx).trans_date := rec_prod.iasd_trans_date;
"
"      rec_prod_dtl(indx).due_days := rec_prod.iasd_due_days;
"
"      rec_prod_dtl(indx).param_seq_no := v_param_seq_no;
"
"      indx := indx + 1;
"
"    END LOOP;
"
"    v_start_day := cr1.iapr_days + 1;
"
"    v_param_seq_no := v_param_seq_no + 1;
"
"  END LOOP;
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_prod_dtl.COUNT
"
"      INSERT INTO inv_aging_prod_dtls(iapd_bu,
"
"				      iapd_doc_no,
"
"				      iapd_seq_no,
"
"				      iapd_mat_type,
"
"				      iapd_prod_id,
"
"				      iapd_prod_rev,
"
"				      iapd_sf_code,
"
"				      iapd_trans_qty,
"
"				      iapd_unit_cost,
"
"				      iapd_trans_val,
"
"				      iapd_trans_date,
"
"				      iapd_due_days,
"
"				      iapd_param_seq_no,
"
"				      iapd_cre_by,
"
"				      iapd_cre_date
"
"				     )
"
"			       VALUES(p_bu,
"
"				      p_doc_no,
"
"				      rec_prod_dtl(indx).seq_no,
"
"				      rec_prod_dtl(indx).mat_type,
"
"				      rec_prod_dtl(indx).prod_id,
"
"				      rec_prod_dtl(indx).prod_rev,
"
"				      rec_prod_dtl(indx).sf_code,
"
"				      rec_prod_dtl(indx).trans_qty,
"
"				      rec_prod_dtl(indx).unit_cost,
"
"				      rec_prod_dtl(indx).trans_qty * rec_prod_dtl(indx).unit_cost,
"
"				      rec_prod_dtl(indx).trans_date,
"
"				      rec_prod_dtl(indx).due_days,
"
"				      rec_prod_dtl(indx).param_seq_no,
"
"				      p_user,
"
"				      SYSDATE
"
"				     );
"
"  END;
"
"
"
"  /*OPEN c_ctrl;
"
"  FETCH c_ctrl INTO r_ctrl;
"
"  CLOSE c_ctrl;
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'N'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days <= r_ctrl.icmctrl_non_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'S'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days >= r_ctrl.icmctrl_slow_mov_days
"
"		   AND iapd_due_days < r_ctrl.icmctrl_non_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'F'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days >= r_ctrl.icmctrl_slow_mov_days);*/
"
"
"
"  Commit;
"
"
"
"END proc_ins_so_inv_aging;
"
"
"
"PROCEDURE proc_ins_ls_inv_aging(p_bu		IN	VARCHAR2,
"
"			        p_doc_no	IN	VARCHAR2,
"
"			        p_date		IN	DATE,
"
"			        p_user		IN	VARCHAR2
"
"			       )
"
"IS
"
"CURSOR c_hd IS
"
"SELECT *
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no;
"
"
"
"CURSOR c1 IS
"
"WITH tab_days AS
"
"(SELECT 1 seq,iahd_param_day_01 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_01 IS NOT NULL
"
"UNION ALL
"
"SELECT 2 seq,iahd_param_day_02 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_02 IS NOT NULL
"
"UNION ALL
"
"SELECT 3 seq,iahd_param_day_03 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_03 IS NOT NULL
"
"UNION ALL
"
"SELECT 4 seq,iahd_param_day_04 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_04 IS NOT NULL
"
"UNION ALL
"
"SELECT 5 seq,iahd_param_day_05 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_05 IS NOT NULL
"
"UNION ALL
"
"SELECT 6 seq,iahd_param_day_06 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_06 IS NOT NULL
"
"UNION ALL
"
"SELECT 7 seq,iahd_param_day_07 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_07 IS NOT NULL
"
"UNION ALL
"
"SELECT 8 seq,iahd_param_day_08 iapr_days
"
"  FROM inv_aging_hd
"
" WHERE iahd_bu = p_bu
"
"   AND iahd_doc_no = p_doc_no
"
"   AND iahd_param_day_08 IS NOT NULL)
"
"SELECT seq,iapr_days FROM tab_days
"
"UNION ALL
"
"SELECT 99 seq,MAX(iapr_days) FROM tab_days
"
"ORDER BY Seq;
"
"/*SELECT iapr_days
"
"  FROM (SELECT iapr_days
"
"          FROM inv_aging_param
"
"         WHERE iapr_bu = p_bu
"
"           AND iapr_doc_no = p_doc_no
"
"        UNION ALL
"
"        SELECT MAX(iapr_days)+1
"
"          FROM inv_aging_param
"
"         WHERE iapr_bu = p_bu
"
"           AND iapr_doc_no = p_doc_no)
"
" ORDER BY iapr_days;*/
"
"
"
"CURSOR c_ctrl IS
"
"SELECT icmctrl_slow_mov_days,icmctrl_non_mov_days
"
"  FROM icm_control
"
" WHERE icmctrl_bu = p_bu;
"
"
"
"  r_hd		c_hd%ROWTYPE;
"
"r_ctrl		c_ctrl%ROWTYPE;
"
"
"
"TYPE typ_stk IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" store_id	stores.store_id%TYPE,
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sys_ls_no	NUMBER(15),
"
" lot_no		VARCHAR2(50),
"
" sf_code	VARCHAR2(200),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_date	DATE,
"
" due_days	NUMBER(5)
"
");
"
"
"
"TYPE typ_prod IS RECORD
"
"(seq_no		NUMBER(10),
"
" mat_type	VARCHAR2(2),
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sys_ls_no	NUMBER(15),
"
" lot_no		VARCHAR2(50),
"
" sf_code	VARCHAR2(200),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_date	DATE,
"
" due_days	NUMBER(10),
"
" param_seq_no	NUMBER(10),
"
" param_desc	VARCHAR2(50)
"
");
"
"
"
"TYPE typ_stk_dtl IS TABLE OF typ_stk INDEX BY PLS_INTEGER;
"
"rec_stk_dtl	typ_stk_dtl;
"
"
"
"TYPE typ_prod_dtl IS TABLE OF typ_prod INDEX BY PLS_INTEGER;
"
"rec_prod_dtl	typ_prod_dtl;
"
"
"
"indx		NUMBER;
"
"v_tot_param	NUMBER;
"
"v_param_seq_no	NUMBER;
"
"v_start_day	NUMBER;
"
"v_type		VARCHAR2(1);
"
"v_st_due_days	NUMBER := 0;
"
"
"
"BEGIN
"
"
"
"  OPEN c_hd;
"
"  FETCH c_hd INTO r_hd;
"
"  CLOSE c_hd;
"
"
"
"  DELETE FROM inv_aging_stk_dtls
"
"   WHERE iasd_bu = p_bu
"
"     AND iasd_doc_no = p_doc_no;
"
"
"
"  DELETE FROM inv_aging_prod_dtls
"
"   WHERE iapd_bu = p_bu
"
"     AND iapd_doc_no = p_doc_no;
"
"
"
"  SELECT ROW_NUMBER() OVER(ORDER BY sttr_due_days),sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_sys_ls_no,lsst_lot_no,
"
"         sttr_sf_code,sttr_trans_qty,sttr_unit_cost,sttr_trans_date,sttr_due_days
"
"    BULK COLLECT INTO rec_stk_dtl
"
"    FROM(SELECT 'ST' sttr_mat_type,
"
"		lsst_store_id sttr_store_id,
"
"                lsst_prod_id sttr_prod_id,
"
"		lsst_prod_rev sttr_prod_rev,
"
"		lsst_sys_ls_no sttr_sys_ls_no,
"
"		lsst_lot_no,
"
"		NULL sttr_sf_code,
"
"		SUM(lsst_trans_qty) sttr_trans_qty,
"
"		SUM(lsst_trans_qty * lsst_unit_cost)/SUM(lsst_trans_qty) sttr_unit_cost,
"
"		MAX(CASE WHEN r_hd.iahd_ag_dt_type = 'M' THEN plsn_mfg_date ELSE lsst_trans_date END) sttr_trans_date,
"
"		(p_date - MAX(CASE WHEN r_hd.iahd_ag_dt_type = 'M' THEN plsn_mfg_date ELSE lsst_trans_date END)) sttr_due_days
"
"	   FROM lot_ser_stock_trans,stores,prod_lot_ser_nos,products,classes
"
"	  WHERE store_bu = lsst_bu
"
"	    AND store_id = lsst_store_id
"
"	    AND plsn_bu = lsst_bu
"
"	    AND plsn_sys_ls_no = lsst_sys_ls_no
"
"	    AND prod_bu = lsst_bu
"
"            AND prod_id = lsst_prod_id
"
"            AND prod_rev = lsst_prod_rev
"
"	    AND class_bu = prod_bu
"
"	    AND class_id = prod_cls
"
"	    AND lsst_bu = p_bu
"
"	    AND TRUNC(lsst_trans_date) <= p_date
"
"	    AND lsst_bucket_type = 'QOH'
"
"	    AND prod_ser_lot_opt <> 'N'
"
"	    AND (r_hd.iahd_matl_type = 'A' OR
"
"	         (r_hd.iahd_matl_type = 'R' AND class_type = 'RM') OR
"
"		 (r_hd.iahd_matl_type = 'F' AND class_type = 'FG'))
"
"	    AND (r_hd.iahd_wh_type = 'A' OR
"
"	         (r_hd.iahd_wh_type = 'ST' AND store_physical = 'Y') OR
"
"		 (r_hd.iahd_wh_type = 'WP' AND store_physical = 'W') OR
"
"		 (r_hd.iahd_wh_type = 'SC' AND store_physical = 'V'))
"
"	 HAVING SUM(lsst_trans_qty) <> 0
"
"	  GROUP BY lsst_store_id,lsst_prod_id,lsst_prod_rev,lsst_sys_ls_no,lsst_lot_no
"
"	  UNION ALL
"
"	 SELECT 'ST' sttr_mat_type,
"
"		sttr_store_id,
"
"                sttr_prod_id,
"
"		sttr_prod_rev,
"
"		NULL sttr_sys_ls_no,
"
"		NULL sttr_lot_no,
"
"		NULL sttr_sf_code,
"
"		SUM(sttr_trans_qty) sttr_trans_qty,
"
"		SUM(sttr_trans_qty * sttr_bc_unit_cost)/SUM(sttr_trans_qty) sttr_unit_cost,
"
"		MAX(sttr_trans_date) sttr_trans_date,
"
"		(p_date - MAX(sttr_trans_date)) sttr_due_days
"
"	   FROM stock_trans,stores,products,classes
"
"	  WHERE sttr_bu = store_bu
"
"	    AND sttr_store_id = store_id
"
"	    AND prod_bu = sttr_bu
"
"            AND prod_id = sttr_prod_id
"
"            AND prod_rev = sttr_prod_rev
"
"	    AND class_bu = prod_bu
"
"	    AND class_id = prod_cls
"
"	    AND sttr_bu = p_bu
"
"	    AND TRUNC(sttr_trans_date) <= p_date
"
"	    AND sttr_bucket_type = 'QOH'
"
"	    AND prod_ser_lot_opt = 'N'
"
"	    AND (r_hd.iahd_matl_type = 'A' OR
"
"	         (r_hd.iahd_matl_type = 'R' AND class_type = 'RM') OR
"
"		 (r_hd.iahd_matl_type = 'F' AND class_type = 'FG'))
"
"	    AND (r_hd.iahd_wh_type = 'A' OR
"
"	         (r_hd.iahd_wh_type = 'ST' AND store_physical = 'Y') OR
"
"		 (r_hd.iahd_wh_type = 'WP' AND store_physical = 'W') OR
"
"		 (r_hd.iahd_wh_type = 'SC' AND store_physical = 'V'))
"
"	 HAVING SUM(sttr_trans_qty) <> 0
"
"	  GROUP BY sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"	  UNION ALL
"
"	 SELECT 'SF' stsfg_mat_type,
"
"	        stsfg_store_id,
"
"		stsfg_prod_id,
"
"		stsfg_prod_rev,
"
"		stsfg_sys_ls_no,
"
"		stsfg_lot_no,
"
"		stsfg_sf_code,
"
"		SUM(stsfg_trans_qty) sttr_trans_qty,
"
"		SUM(stsfg_trans_qty * stsfg_unit_cost)/SUM(stsfg_trans_qty) sttr_unit_cost,
"
"		MAX(stsfg_trans_date) sttr_trans_date,
"
"		(p_date - MAX (stsfg_trans_date)) sttr_due_days
"
"           FROM stock_trans_sfg,stores
"
"	  WHERE stsfg_bu = store_bu
"
"	    AND stsfg_store_id = store_id
"
"	    AND stsfg_bu = p_bu
"
"	    AND TRUNC(stsfg_trans_date) <= p_date
"
"	    AND stsfg_bucket_type = 'QOH'
"
"	    AND (r_hd.iahd_matl_type = 'A' OR r_hd.iahd_matl_type = 'W')
"
"	    AND (r_hd.iahd_wh_type = 'A' OR
"
"	         (r_hd.iahd_wh_type = 'ST' AND store_physical = 'Y') OR
"
"		 (r_hd.iahd_wh_type = 'WP' AND store_physical = 'W') OR
"
"		 (r_hd.iahd_wh_type = 'SC' AND store_physical = 'V'))
"
"	 HAVING SUM(stsfg_trans_qty) <> 0
"
"	  GROUP BY stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_sf_code,stsfg_sys_ls_no,stsfg_lot_no);
"
"  --Raise_Application_Error(-20999,r_hd.iahd_wh_type||'/'||r_hd.iahd_matl_type);
"
"  BEGIN
"
"    FORALL indx IN 1..rec_stk_dtl.COUNT
"
"
"
"      INSERT INTO inv_aging_stk_dtls(iasd_bu,
"
"				     iasd_doc_no,
"
"				     iasd_seq_no,
"
"				     iasd_mat_type,
"
"				     iasd_store_id,
"
"				     iasd_prod_id,
"
"				     iasd_prod_rev,
"
"				     iasd_sys_ls_no,
"
"				     iasd_lot_no,
"
"				     iasd_sf_code,
"
"				     iasd_trans_qty,
"
"				     iasd_trans_val,
"
"				     iasd_unit_cost,
"
"				     iasd_trans_date,
"
"				     iasd_due_days,
"
"				     iasd_cre_by,
"
"				     iasd_cre_date
"
"				    )
"
"			      VALUES(p_bu,
"
"				     p_doc_no,
"
"				     rec_stk_dtl(indx).seq_no,
"
"				     rec_stk_dtl(indx).mat_type,
"
"				     rec_stk_dtl(indx).store_id,
"
"				     rec_stk_dtl(indx).prod_id,
"
"				     rec_stk_dtl(indx).prod_rev,
"
"				     rec_stk_dtl(indx).sys_ls_no,
"
"				     rec_stk_dtl(indx).lot_no,
"
"				     rec_stk_dtl(indx).sf_code,
"
"				     rec_stk_dtl(indx).trans_qty,
"
"				     rec_stk_dtl(indx).trans_qty * rec_stk_dtl(indx).unit_cost,
"
"				     rec_stk_dtl(indx).unit_cost,
"
"				     rec_stk_dtl(indx).trans_date,
"
"				     rec_stk_dtl(indx).due_days,
"
"				     p_user,
"
"				     SYSDATE
"
"				    );
"
"  END;
"
"
"
"  v_param_seq_no := 1;
"
"  indx := 1;
"
"  v_start_day := 0;
"
"
"
"  SELECT COUNT(*)
"
"    INTO v_tot_param
"
"    FROM inv_aging_param
"
"   WHERE iapr_bu = p_bu
"
"     AND iapr_doc_no = p_doc_no;
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"    IF cr1.seq = 99 THEN
"
"      v_type := 'L';
"
"    ELSE
"
"      v_type := 'B';
"
"    END IF;
"
"
"
"    FOR rec_prod IN (WITH prod_dtls AS
"
"                     (SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sys_ls_no,iasd_lot_no,iasd_sf_code,
"
"		             SUM(iasd_trans_qty) iasd_trans_qty,
"
"			     SUM(iasd_trans_qty * iasd_unit_cost) / SUM(iasd_trans_qty) iasd_unit_cost,
"
"			     iasd_trans_date iasd_trans_date,
"
"			     (p_date - iasd_trans_date) iasd_due_days
"
"			FROM inv_aging_stk_dtls
"
"		       WHERE iasd_bu = p_bu
"
"                         AND iasd_doc_no = p_doc_no
"
"                      HAVING SUM(iasd_trans_qty) > 0
"
"		       GROUP BY iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sys_ls_no,iasd_lot_no,iasd_sf_code,iasd_trans_date)
"
"		     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sys_ls_no,iasd_lot_no,iasd_sf_code,iasd_trans_qty,
"
"		            iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"		       FROM(SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sys_ls_no,iasd_lot_no,iasd_sf_code,iasd_trans_qty,
"
"		                   iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"		              FROM prod_dtls
"
"			     WHERE iasd_due_days <= 0
"
"			       AND v_type = 'F'
"
"			     UNION ALL
"
"			    SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sys_ls_no,iasd_lot_no,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days BETWEEN v_start_day AND cr1.iapr_days
"
"			       AND v_type = 'B'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sys_ls_no,iasd_lot_no,iasd_sf_code,iasd_trans_qty,
"
"			            iasd_unit_cost,iasd_trans_date,iasd_due_days
"
"			       FROM prod_dtls
"
"			      WHERE iasd_due_days >= v_start_day
"
"			        AND v_type = 'L')
"
"		       ORDER BY iasd_due_days)
"
"    LOOP
"
"      rec_prod_dtl(indx).seq_no := indx;
"
"      rec_prod_dtl(indx).mat_type := rec_prod.iasd_mat_type;
"
"      rec_prod_dtl(indx).prod_id := rec_prod.iasd_prod_id;
"
"      rec_prod_dtl(indx).prod_rev := rec_prod.iasd_prod_rev;
"
"      rec_prod_dtl(indx).sys_ls_no := rec_prod.iasd_sys_ls_no;
"
"      rec_prod_dtl(indx).lot_no := rec_prod.iasd_lot_no;
"
"      rec_prod_dtl(indx).sf_code := rec_prod.iasd_sf_code;
"
"      rec_prod_dtl(indx).trans_qty := rec_prod.iasd_trans_qty;
"
"      rec_prod_dtl(indx).unit_cost := rec_prod.iasd_unit_cost;
"
"      rec_prod_dtl(indx).trans_date := rec_prod.iasd_trans_date;
"
"      rec_prod_dtl(indx).due_days := rec_prod.iasd_due_days;
"
"      rec_prod_dtl(indx).param_seq_no := v_param_seq_no;
"
"      IF v_type = 'B' THEN
"
"        rec_prod_dtl(indx).param_desc := v_start_day||'-'||cr1.iapr_days||' DAYS';
"
"      ELSE
"
"        rec_prod_dtl(indx).param_desc := 'ABOVE '||cr1.iapr_days||' DAYS';
"
"      END IF;
"
"      indx := indx + 1;
"
"    END LOOP;
"
"
"
"    UPDATE inv_aging_stk_dtls
"
"       SET iasd_param_seq_no = v_param_seq_no,
"
"           iasd_param_desc = CASE WHEN v_type = 'B' THEN v_start_day||'-'||cr1.iapr_days||' DAYS' ELSE 'ABOVE '||cr1.iapr_days||' DAYS' END
"
"     WHERE iasd_bu = p_bu
"
"       AND iasd_doc_no = p_doc_no
"
"       AND ((v_type = 'B' AND (iasd_due_days BETWEEN v_start_day AND cr1.iapr_days)) OR
"
"             (v_type = 'L' AND iasd_due_days >= v_start_day));
"
"
"
"    v_start_day := cr1.iapr_days + 1;
"
"    v_param_seq_no := v_param_seq_no + 1;
"
"  END LOOP;
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_prod_dtl.COUNT
"
"      INSERT INTO inv_aging_prod_dtls(iapd_bu,
"
"				      iapd_doc_no,
"
"				      iapd_seq_no,
"
"				      iapd_mat_type,
"
"				      iapd_prod_id,
"
"				      iapd_prod_rev,
"
"				      iapd_sys_ls_no,
"
"				      iapd_lot_no,
"
"				      iapd_sf_code,
"
"				      iapd_trans_qty,
"
"				      iapd_trans_val,
"
"				      iapd_unit_cost,
"
"				      iapd_trans_date,
"
"				      iapd_due_days,
"
"				      iapd_param_seq_no,
"
"				      iapd_param_desc,
"
"				      iapd_cre_by,
"
"				      iapd_cre_date
"
"				     )
"
"			       VALUES(p_bu,
"
"				      p_doc_no,
"
"				      rec_prod_dtl(indx).seq_no,
"
"				      rec_prod_dtl(indx).mat_type,
"
"				      rec_prod_dtl(indx).prod_id,
"
"				      rec_prod_dtl(indx).prod_rev,
"
"				      rec_prod_dtl(indx).sys_ls_no,
"
"				      rec_prod_dtl(indx).lot_no,
"
"				      rec_prod_dtl(indx).sf_code,
"
"				      rec_prod_dtl(indx).trans_qty,
"
"				      rec_prod_dtl(indx).trans_qty * rec_prod_dtl(indx).unit_cost,
"
"				      rec_prod_dtl(indx).unit_cost,
"
"				      rec_prod_dtl(indx).trans_date,
"
"				      rec_prod_dtl(indx).due_days,
"
"				      rec_prod_dtl(indx).param_seq_no,
"
"				      rec_prod_dtl(indx).param_desc,
"
"				      p_user,
"
"				      SYSDATE
"
"				     );
"
"  END;
"
"
"
"  /*OPEN c_ctrl;
"
"  FETCH c_ctrl INTO r_ctrl;
"
"  CLOSE c_ctrl;
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'N'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days <= r_ctrl.icmctrl_non_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'S'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days >= r_ctrl.icmctrl_slow_mov_days
"
"		   AND iapd_due_days < r_ctrl.icmctrl_non_mov_days);
"
"
"
"  UPDATE products
"
"     SET prod_fsn_analysis = 'F'
"
"   WHERE EXISTS(SELECT 1
"
"                  FROM inv_aging_prod_dtls
"
"		 WHERE iapd_bu = p_bu
"
"		   AND iapd_plnt = p_plnt
"
"		   AND iapd_doc_no = p_doc_no
"
"		   AND iapd_mat_type = 'ST'
"
"		   AND iapd_prod_id = prod_id
"
"		   AND iapd_prod_rev = prod_rev
"
"		   AND iapd_due_days >= r_ctrl.icmctrl_slow_mov_days);*/
"
"
"
"  Commit;
"
"
"
"END proc_ins_ls_inv_aging;
"
"
"
"/*PROCEDURE proc_ins_fsn_analy(p_bu		IN	VARCHAR2,
"
"                             p_plnt		IN	VARCHAR2,
"
"			     p_doc_no		IN	VARCHAR2,
"
"			     p_date		IN	DATE,
"
"			     p_user		IN	VARCHAR2
"
"			    )
"
"IS
"
"
"
"CURSOR c1 IS
"
"SELECT fap_fsn_type,fap_seq_no,fap_oper,fap_from_dur,fap_from_dur_type,fap_to_dur,fap_to_dur_type
"
"  FROM fsn_analy_param
"
" WHERE fap_bu = p_bu
"
"   AND fap_plnt = p_plnt
"
"   AND fap_doc_no = p_doc_no
"
" ORDER BY TO_NUMBER(DECODE(fap_fsn_type,'F',1,'S',2,'N',3));
"
"
"
"TYPE typ_stk IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" store_id	stores.store_id%TYPE,
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_val	NUMBER(17,2),
"
" trans_date	DATE,
"
" due_days	NUMBER(5)
"
");
"
"
"
"TYPE typ_prod IS RECORD
"
"(seq_no		NUMBER(5),
"
" mat_type	VARCHAR2(2),
"
" prod_id	products.prod_id%TYPE,
"
" prod_rev	products.prod_rev%TYPE,
"
" sf_code	VARCHAR2(50),
"
" trans_qty	NUMBER(12,3),
"
" unit_cost	NUMBER(17,5),
"
" trans_val	NUMBER(17,2),
"
" trans_date	DATE,
"
" due_days	NUMBER(5),
"
" param_seq_no	NUMBER(5)
"
");
"
"
"
"TYPE typ_stk_dtl IS TABLE OF typ_stk INDEX BY PLS_INTEGER;
"
"rec_stk_dtl	typ_stk_dtl;
"
"
"
"TYPE typ_prod_dtl IS TABLE OF typ_prod INDEX BY PLS_INTEGER;
"
"rec_prod_dtl	typ_prod_dtl;
"
"
"
"indx		NUMBER;
"
"v_param_seq_no	NUMBER;
"
"
"
"v_from_feq	NUMBER;
"
"v_to_feq	NUMBER;
"
"
"
"BEGIN
"
"
"
"  DELETE FROM inv_aging_stk_dtls
"
"   WHERE iasd_bu = p_bu
"
"     AND iasd_plnt = p_plnt
"
"     AND iasd_doc_no = p_doc_no;
"
"
"
"  DELETE FROM inv_aging_prod_dtls
"
"   WHERE iapd_bu = p_bu
"
"     AND iapd_plnt = p_plnt
"
"     AND iapd_doc_no = p_doc_no;
"
"
"
"  SELECT ROWNUM,sttr_mat_type,sttr_store_id,sttr_prod_id,sttr_prod_rev,sttr_sf_code,sttr_trans_qty,sttr_unit_cost,sttr_trans_val,sttr_trans_date,sttr_due_days
"
"    BULK COLLECT INTO rec_stk_dtl
"
"    FROM(SELECT 'ST' sttr_mat_type,
"
"		sttr_store_id,
"
"                sttr_prod_id,
"
"		sttr_prod_rev,
"
"		NULL sttr_sf_code,
"
"		SUM(sttr_trans_qty) sttr_trans_qty,
"
"		SUM(sttr_trans_qty * sttr_bc_unit_cost)/SUM(sttr_trans_qty) sttr_unit_cost,
"
"		SUM(sttr_trans_qty * sttr_bc_unit_cost) sttr_trans_val,
"
"		MAX(sttr_trans_date) sttr_trans_date,
"
"		(p_date - MAX (sttr_trans_date)) sttr_due_days
"
"	   FROM stock_trans
"
"	  WHERE sttr_bu = p_bu
"
"	    AND func_find_store_plnt(sttr_bu,sttr_store_id) = p_plnt
"
"	    AND TRUNC(sttr_trans_date) <= p_date
"
"	    AND sttr_bucket_type = 'QOH'
"
"	 HAVING SUM(sttr_trans_qty) <> 0
"
"	  GROUP BY sttr_store_id,sttr_prod_id,sttr_prod_rev
"
"	  UNION ALL
"
"	 SELECT 'SF' stsfg_mat_type,
"
"	        stsfg_store_id,
"
"		stsfg_prod_id,
"
"		stsfg_prod_rev,
"
"		stsfg_sf_code,
"
"		SUM(stsfg_trans_qty) sttr_trans_qty,
"
"		SUM(stsfg_trans_qty * stsfg_unit_cost)/SUM(stsfg_trans_qty) sttr_unit_cost,
"
"		SUM(stsfg_trans_qty * stsfg_unit_cost) sttr_trans_val,
"
"		MAX(stsfg_trans_date) sttr_trans_date,
"
"		(p_date - MAX (stsfg_trans_date)) sttr_due_days
"
"           FROM stock_trans_sfg
"
"	  WHERE stsfg_bu = p_bu
"
"	    AND stsfg_store_plnt = p_plnt
"
"	    AND TRUNC(stsfg_trans_date) <= p_date
"
"	    AND stsfg_bucket_type = 'QOH'
"
"	 HAVING SUM(stsfg_trans_qty) <> 0
"
"	  GROUP BY stsfg_store_id,stsfg_prod_id,stsfg_prod_rev,stsfg_sf_code);
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_stk_dtl.COUNT
"
"      INSERT INTO inv_aging_stk_dtls(iasd_bu,
"
"	                             iasd_plnt,
"
"				     iasd_doc_no,
"
"				     iasd_seq_no,
"
"				     iasd_mat_type,
"
"				     iasd_store_id,
"
"				     iasd_prod_id,
"
"				     iasd_prod_rev,
"
"				     iasd_sf_code,
"
"				     iasd_trans_qty,
"
"				     iasd_unit_cost,
"
"				     iasd_trans_val,
"
"				     iasd_trans_date,
"
"				     iasd_due_days,
"
"				     iasd_cre_by,
"
"				     iasd_cre_date
"
"				    )
"
"			      VALUES(p_bu,
"
"			             p_plnt,
"
"				     p_doc_no,
"
"				     rec_stk_dtl(indx).seq_no,
"
"				     rec_stk_dtl(indx).mat_type,
"
"				     rec_stk_dtl(indx).store_id,
"
"				     rec_stk_dtl(indx).prod_id,
"
"				     rec_stk_dtl(indx).prod_rev,
"
"				     rec_stk_dtl(indx).sf_code,
"
"				     rec_stk_dtl(indx).trans_qty,
"
"				     rec_stk_dtl(indx).unit_cost,
"
"				     rec_stk_dtl(indx).trans_val,
"
"				     rec_stk_dtl(indx).trans_date,
"
"				     rec_stk_dtl(indx).due_days,
"
"				     p_user,
"
"				     SYSDATE
"
"				    );
"
"  END;
"
"
"
"  v_param_seq_no := 1;
"
"  indx := 1;
"
"
"
"  FOR cr1 IN c1
"
"  LOOP
"
"
"
"    IF cr1.fap_from_dur_type = 'D' THEN
"
"      v_from_feq := cr1.fap_from_dur;
"
"    ELSIF cr1.fap_from_dur_type = 'M' THEN
"
"      v_from_feq := p_date-ADD_MONTHS(p_date,-cr1.fap_from_dur);
"
"    ELSE
"
"      v_from_feq := p_date-ADD_MONTHS(p_date,-(cr1.fap_from_dur*12));
"
"    END IF;
"
"
"
"    IF cr1.fap_to_dur_type = 'D' THEN
"
"      v_to_feq := cr1.fap_to_dur;
"
"    ELSIF cr1.fap_to_dur_type = 'M' THEN
"
"      v_to_feq := p_date-ADD_MONTHS(p_date,-cr1.fap_to_dur);
"
"    ELSE
"
"      v_to_feq := p_date-ADD_MONTHS(p_date,-(cr1.fap_to_dur*12));
"
"    END IF;
"
"
"
"    FOR rec_prod IN (WITH prod_dtls AS
"
"                     (SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,
"
"		             SUM(iasd_trans_qty) iasd_trans_qty,
"
"			     SUM(iasd_trans_qty * iasd_unit_cost) / SUM(iasd_trans_qty) iasd_unit_cost,
"
"			     SUM(iasd_trans_val) iasd_trans_val,
"
"			     MAX(iasd_trans_date) iasd_trans_date,
"
"			     (p_date - MAX (iasd_trans_date)) iasd_due_days
"
"			FROM inv_aging_stk_dtls
"
"		       WHERE iasd_bu = p_bu
"
"		         AND iasd_plnt = p_plnt
"
"                         AND iasd_doc_no = p_doc_no
"
"		       GROUP BY iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code)
"
"		     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		            iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"		       FROM(SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"		                   iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"		              FROM prod_dtls
"
"			     WHERE iasd_due_days > v_from_feq
"
"			       AND cr1.fap_oper = 'GT'
"
"			     UNION ALL
"
"			    SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days >= v_from_feq
"
"			       AND cr1.fap_oper = 'GTEQ'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days = v_from_feq
"
"			       AND cr1.fap_oper = 'EQ'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days < v_from_feq
"
"			       AND cr1.fap_oper = 'LT'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days <= v_from_feq
"
"			       AND cr1.fap_oper = 'LTEQ'
"
"			     UNION ALL
"
"			     SELECT iasd_mat_type,iasd_prod_id,iasd_prod_rev,iasd_sf_code,iasd_trans_qty,
"
"			           iasd_unit_cost,iasd_trans_val,iasd_trans_date,iasd_due_days
"
"			      FROM prod_dtls
"
"			     WHERE iasd_due_days BETWEEN v_from_feq AND v_to_feq
"
"			       AND cr1.fap_oper = 'BET')
"
"		       ORDER BY iasd_due_days)
"
"    LOOP
"
"      rec_prod_dtl(indx).seq_no := indx;
"
"      rec_prod_dtl(indx).mat_type := rec_prod.iasd_mat_type;
"
"      rec_prod_dtl(indx).prod_id := rec_prod.iasd_prod_id;
"
"      rec_prod_dtl(indx).prod_rev := rec_prod.iasd_prod_rev;
"
"      rec_prod_dtl(indx).sf_code := rec_prod.iasd_sf_code;
"
"      rec_prod_dtl(indx).trans_qty := rec_prod.iasd_trans_qty;
"
"      rec_prod_dtl(indx).trans_val := rec_prod.iasd_trans_val;
"
"      rec_prod_dtl(indx).unit_cost := rec_prod.iasd_unit_cost;
"
"      rec_prod_dtl(indx).trans_date := rec_prod.iasd_trans_date;
"
"      rec_prod_dtl(indx).due_days := rec_prod.iasd_due_days;
"
"      rec_prod_dtl(indx).param_seq_no := cr1.fap_seq_no;
"
"      indx := indx + 1;
"
"    END LOOP;
"
"    --v_param_seq_no := v_param_seq_no + 1;
"
"  END LOOP;
"
"
"
"  BEGIN
"
"    FORALL indx IN 1..rec_prod_dtl.COUNT
"
"      INSERT INTO inv_aging_prod_dtls(iapd_bu,
"
"	                              iapd_plnt,
"
"				      iapd_doc_no,
"
"				      iapd_seq_no,
"
"				      iapd_mat_type,
"
"				      iapd_prod_id,
"
"				      iapd_prod_rev,
"
"				      iapd_sf_code,
"
"				      iapd_trans_qty,
"
"				      iapd_unit_cost,
"
"				      iapd_trans_val,
"
"				      iapd_trans_date,
"
"				      iapd_due_days,
"
"				      iapd_param_seq_no,
"
"				      iapd_cre_by,
"
"				      iapd_cre_date
"
"				     )
"
"			       VALUES(p_bu,
"
"			              p_plnt,
"
"				      p_doc_no,
"
"				      rec_prod_dtl(indx).seq_no,
"
"				      rec_prod_dtl(indx).mat_type,
"
"				      rec_prod_dtl(indx).prod_id,
"
"				      rec_prod_dtl(indx).prod_rev,
"
"				      rec_prod_dtl(indx).sf_code,
"
"				      rec_prod_dtl(indx).trans_qty,
"
"				      rec_prod_dtl(indx).unit_cost,
"
"				      rec_prod_dtl(indx).trans_val,
"
"				      rec_prod_dtl(indx).trans_date,
"
"				      rec_prod_dtl(indx).due_days,
"
"				      rec_prod_dtl(indx).param_seq_no,
"
"				      p_user,
"
"				      SYSDATE
"
"				     );
"
"  END;
"
"
"
"  Commit;
"
"
"
"END proc_ins_fsn_analy;*/
"
"
"
"END pkg_inv_aging;"
/
