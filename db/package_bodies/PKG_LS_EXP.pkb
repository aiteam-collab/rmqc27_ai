CREATE OR REPLACE
"PACKAGE BODY pkg_ls_exp
"
"AS
"
"
"
"  PROCEDURE proc_load_exp_ls_frm_ls_stk(p_bu		VARCHAR2,
"
"			                p_plnt		VARCHAR2,
"
"				        p_doc_no	VARCHAR2,
"
"				        p_user		VARCHAR2
"
"			               )
"
"  AS
"
"
"
"
"
"CURSOR c1
"
"  IS
"
"SELECT --ROW_NUMBER() OVER (ORDER BY lss_store_id,lss_prod_id,lss_sys_ls_no) r_no,
"
"ROWNUM r_no,
"
"           lss_store_id,store_desc1,lss_prod_id,lss_prod_rev,prod_desc11,lss_sys_ls_no,lss_lot_no,lss_ser_no,plsn_mfg_date,lss_expiry_date,'N'
"
"      FROM (SELECT lss_store_id,store_desc1,lss_prod_id,lss_prod_rev,prod_desc11,lss_sys_ls_no,lss_lot_no,lss_ser_no,
"
"				(SELECT plsn_mfg_date
"
"				   FROM prod_lot_ser_nos
"
"				  WHERE plsn_bu = lss_bu
"
"				    AND plsn_sys_ls_no = lss_sys_ls_no) plsn_mfg_date,lss_expiry_date
"
"              FROM lot_ser_stocks,stores,products--,prod_lot_ser_nos
"
"             WHERE lss_bu = store_bu
"
"               AND lss_store_id = store_id
"
"	       AND prod_bu = lss_bu
"
"	       AND prod_id = lss_prod_id
"
"	       AND prod_rev = lss_prod_rev/*
"
"	       AND plsn_bu = lss_bu
"
"	       AND plsn_sys_ls_no = lss_sys_ls_no*/
"
"	       /*AND NOT EXISTS(SELECT 1
"
"	                        FROM lot_ser_upd_exp_hd,lot_ser_upd_exp_ln
"
"	                       WHERE lsueh_bu = lsuel_bu
"
"				 AND lsueh_plnt = lsuel_plnt
"
"				 AND lsueh_doc_no = lsuel_doc_no
"
"				 AND lsuel_sys_ls_no = lss_sys_ls_no
"
"				 AND lsueh_bu = p_bu
"
"				 AND lsueh_status = 'N')*/
"
"               AND lss_bu = p_bu
"
"               AND store_plnt = p_plnt
"
"             --  AND TRUNC(lss_expiry_date - 15 ) < TRUNC(SYSDATE)
"
"               AND lss_qty_hand > 0
"
"	           AND prod_expr_flag = 'Y'
"
"		   );
"
"
"
"   -- TYPE typ_lse IS TABLE OF lot_ser_upd_exp_temp%ROWTYPE INDEX BY PLS_INTEGER;
"
"   -- r_lse	typ_lse;
"
"
"
"   TYPE t1 IS TABLE OF c1%ROWTYPE INDEX BY PLS_INTEGER;
"
"   cr1  t1;
"
"
"
"    v_emp_id	VARCHAR2(30);
"
"    v_ip_addr	VARCHAR2(30);
"
"    v_os_user	VARCHAR2(50);
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM lot_ser_upd_exp_temp
"
"     WHERE lsuet_bu = p_bu
"
"       AND lsuet_plnt = p_plnt
"
"       AND lsuet_doc_no = p_doc_no;
"
"
"
"    v_emp_id := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr := Audit_Info.Get_Ip_Address();
"
"    v_os_user := Audit_Info.Get_Os_User();
"
"  /*
"
"    SELECT p_bu,p_plnt,p_doc_no,ROW_NUMBER() OVER (ORDER BY lss_store_id,lss_prod_id,lss_sys_ls_no) r_no,
"
"           lss_store_id,store_desc1,lss_prod_id,lss_prod_rev,prod_desc11,lss_sys_ls_no,lss_lot_no,lss_ser_no,plsn_mfg_date,lss_expiry_date,'N',
"
"	   p_user,v_emp_id,v_ip_addr,v_os_user,SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      BULK COLLECT INTO r_lse
"
"      FROM (SELECT lss_store_id,store_desc1,lss_prod_id,lss_prod_rev,prod_desc11,lss_sys_ls_no,lss_lot_no,lss_ser_no,plsn_mfg_date,lss_expiry_date
"
"              FROM lot_ser_stocks,stores,products,prod_lot_ser_nos
"
"             WHERE lss_bu = store_bu
"
"               AND lss_store_id = store_id
"
"	       AND prod_bu = lss_bu
"
"	       AND prod_id = lss_prod_id
"
"	       AND prod_rev = lss_prod_rev
"
"	       AND plsn_bu = lss_bu
"
"	       AND plsn_sys_ls_no = lss_sys_ls_no
"
"	       AND NOT EXISTS(SELECT 1
"
"	                        FROM lot_ser_upd_exp_hd,lot_ser_upd_exp_ln
"
"	                       WHERE lsueh_bu = lsuel_bu
"
"							 AND lsueh_plnt = lsuel_plnt
"
"							 AND lsueh_doc_no = lsuel_doc_no
"
"							 AND lsuel_sys_ls_no = lss_sys_ls_no
"
"							 AND lsueh_bu = p_bu
"
"							 AND lsueh_status = 'N')
"
"               AND store_bu = p_bu
"
"               AND store_plnt = p_plnt
"
"               AND TRUNC(lss_expiry_date) < TRUNC(SYSDATE)
"
"               AND lss_qty_hand > 0
"
"	       AND prod_expr_flag = 'Y');
"
"
"
"    FORALL i IN 1..r_lse.COUNT()
"
"      INSERT INTO lot_ser_upd_exp_temp VALUES r_lse(i); */
"
"	  OPEN c1;
"
"	  FETCH c1  BULK COLLECT INTO cr1;
"
"	  --  IF c1%FOUND THEN
"
"	      --Raise_Application_Error(-20999,'HRM'||'-'||cr1(i).plsn_mfg_date);
"
"	    FORALL i IN 1..cr1.COUNT()
"
"
"
"
"
"	    INSERT INTO lot_ser_upd_exp_temp(lsuet_bu ,
"
"					    lsuet_plnt,
"
"					    lsuet_doc_no,
"
"					    lsuet_seq_no,
"
"					    lsuet_store_id,
"
"					    lsuet_store_desc,
"
"					    lsuet_prod_id,
"
"					    lsuet_prod_rev,
"
"					    lsuet_prod_desc,
"
"					    lsuet_sys_ls_no,
"
"					    lsuet_lot_no,
"
"					    lsuet_ser_no,
"
"					    lsuet_mfg_date,
"
"					    lsuet_exp_date,
"
"					    lsuet_sel_flag,
"
"					    lsuet_cre_by,
"
"					    lsuet_cre_emp_id,
"
"					    lsuet_cre_ip_addr,
"
"					    lsuet_cre_os_user,
"
"					    lsuet_cre_date
"
"					    )
"
"				     VALUES(p_bu ,
"
"					    p_plnt,
"
"					    p_doc_no,
"
"					    cr1(i).r_no,
"
"					    cr1(i).lss_store_id,--lsuet_store_id       ,
"
"					    cr1(i).store_desc1,--lsuet_store_desc     ,
"
"					    cr1(i).lss_prod_id,--lsuet_prod_id        ,
"
"					    cr1(i).lss_prod_rev,--lsuet_prod_rev       ,
"
"					    cr1(i).prod_desc11,--lsuet_prod_desc      ,
"
"					    cr1(i).lss_sys_ls_no,--lsuet_sys_ls_no      ,
"
"					    cr1(i).lss_lot_no,--lsuet_lot_no         ,
"
"					    cr1(i).lss_ser_no,--lsuet_ser_no         ,
"
"					    cr1(i).plsn_mfg_date,--lsuet_mfg_date       ,
"
"					    cr1(i).lss_expiry_date,--lsuet_exp_date       ,
"
"					    'N' ,--lsuet_sel_flag       ,
"
"					   p_user,
"
"					    v_emp_id,
"
"					    v_ip_addr,
"
"					    v_os_user,
"
"					    SYSDATE );
"
"		--END IF;
"
"
"
"	  CLOSE c1;
"
"
"
"
"
"
"
"    Commit;
"
"
"
"  END proc_load_exp_ls_frm_ls_stk;
"
"
"
"  PROCEDURE proc_ins_ls_frm_ls_exp(p_bu		VARCHAR2,
"
"			           p_plnt	VARCHAR2,
"
"				   p_doc_no	VARCHAR2,
"
"				   p_user	VARCHAR2
"
"			          )
"
"  AS
"
"
"
"    TYPE typ_lse IS TABLE OF lot_ser_upd_exp_ln%ROWTYPE INDEX BY PLS_INTEGER;
"
"    r_lse	typ_lse;
"
"
"
"    v_emp_id	VARCHAR2(10);
"
"    v_ip_addr	VARCHAR2(20);
"
"    v_os_user	VARCHAR2(50);
"
"    v_seq_no	NUMBER;
"
"
"
"  BEGIN
"
"
"
"    v_emp_id := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr := Audit_Info.Get_Ip_Address();
"
"    v_os_user := Audit_Info.Get_Os_User();
"
"
"
"    SELECT NVL(MAX(lsuel_seq_no),0)
"
"      INTO v_seq_no
"
"      FROM lot_ser_upd_exp_ln
"
"     WHERE lsuel_bu = p_bu
"
"       AND lsuel_plnt = p_plnt
"
"       AND lsuel_doc_no = p_doc_no;
"
"
"
"    SELECT p_bu,p_plnt,p_doc_no,v_seq_no+ROW_NUMBER() OVER (ORDER BY lsuet_seq_no) r_no,
"
"           lsuet_store_id,lsuet_store_desc,lsuet_prod_id,lsuet_prod_rev,lsuet_prod_desc,
"
"	   lsuet_sys_ls_no,lsuet_lot_no,lsuet_ser_no,lsuet_mfg_date,lsuet_exp_date,NULL,
"
"	   p_user,v_emp_id,v_ip_addr,v_os_user,SYSDATE,NULL,NULL,NULL,NULL,NULL
"
"      BULK COLLECT INTO r_lse
"
"      FROM (SELECT lsuet_seq_no,lsuet_store_id,lsuet_store_desc,lsuet_prod_id,lsuet_prod_rev,lsuet_prod_desc,
"
"                   lsuet_sys_ls_no,lsuet_lot_no,lsuet_ser_no,lsuet_mfg_date,lsuet_exp_date
"
"	      FROM lot_ser_upd_exp_temp
"
"	     WHERE lsuet_bu = p_bu
"
"	       AND lsuet_plnt = p_plnt
"
"	       AND lsuet_doc_no = p_doc_no
"
"	       AND lsuet_sel_flag = 'Y');
"
"
"
"    FORALL i IN 1..r_lse.COUNT
"
"      INSERT INTO lot_ser_upd_exp_ln VALUES r_lse(i);
"
"
"
"    Commit;
"
"
"
"  END proc_ins_ls_frm_ls_exp;
"
"
"
"  PROCEDURE proc_upd_ls_frm_ls_exp(p_bu		VARCHAR2,
"
"			           p_plnt	VARCHAR2,
"
"				   p_doc_no	VARCHAR2,
"
"				   p_user	VARCHAR2
"
"			          )
"
"  AS
"
"    TYPE typ_ls_rec IS RECORD(store_id	VARCHAR2(10),
"
"                              prod_id	VARCHAR2(100),
"
"			      prod_rev	NUMBER(5),
"
"			      sys_ls_no	NUMBER(15),
"
"			      exp_date	DATE
"
"			     );
"
"    TYPE typ_ls IS TABLE OF typ_ls_rec INDEX BY PLS_INTEGER;
"
"    r_ls	typ_ls;
"
"  BEGIN
"
"
"
"    SELECT lsuel_store_id,lsuel_prod_id,lsuel_prod_rev,lsuel_sys_ls_no,lsuel_new_exp_date
"
"      BULK COLLECT INTO r_ls
"
"      FROM lot_ser_upd_exp_ln
"
"     WHERE lsuel_bu = p_bu
"
"       AND lsuel_plnt = p_plnt
"
"       AND lsuel_doc_no = p_doc_no;
"
"
"
"    FORALL i IN 1..r_ls.COUNT
"
"      UPDATE lot_ser_stocks
"
"         SET lss_expiry_date = r_ls(i).exp_date
"
"       WHERE lss_bu = p_bu
"
"         AND lss_store_id = r_ls(i).store_id
"
"	 AND lss_prod_id = r_ls(i).prod_id
"
"	 AND lss_prod_rev = r_ls(i).prod_rev
"
"	 AND lss_sys_ls_no = r_ls(i).sys_ls_no;
"
"
"
"
"
"   FORALL i IN 1..r_ls.COUNT
"
"      UPDATE prod_lot_ser_nos
"
"         SET plsn_expiry_date = r_ls(i).exp_date
"
"       WHERE plsn_bu = p_bu
"
"	 AND plsn_prod_id = r_ls(i).prod_id
"
"	 AND plsn_prod_rev = r_ls(i).prod_rev
"
"	 AND plsn_sys_ls_no = r_ls(i).sys_ls_no;
"
"
"
"    Commit;
"
"
"
"  END proc_upd_ls_frm_ls_exp;
"
"
"
"END pkg_ls_exp;"
/
