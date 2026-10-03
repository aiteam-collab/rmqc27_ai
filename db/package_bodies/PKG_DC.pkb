CREATE OR REPLACE
"PACKAGE BODY pkg_dc
"
"AS
"
"
"
"  PROCEDURE proc_alloc_bin_frm_dc_mat_rcpt(p_bu			VARCHAR2,
"
"                                           p_plnt		VARCHAR2,
"
"					   p_doc_no		VARCHAR2,
"
"					   p_seq_no		NUMBER,
"
"                                           p_user		VARCHAR2,
"
"					   p_res	OUT	VARCHAR2
"
"				          )
"
"  AS
"
"
"
"    CURSOR c_dc IS
"
"    SELECT dchd_bu,dchd_plnt,dchd_doc_no,dcln_seq_no,dchd_suplr_id,dchd_source_frm,dcln_prod_id,dcln_prod_rev,
"
"           dclsd_sys_ls_no,dclsd_lot_no,dclsd_serial_no,dclsd_source_type,dclsd_source_id,NVL(dclsd_act_rcpt_qty,dcln_act_rcpt_qty) dc_qty
"
"      FROM dc_hd,dc_ln,dc_lot_serial_dtls
"
"     WHERE dchd_bu = dcln_bu
"
"       AND dchd_plnt = dcln_plnt
"
"       AND dchd_doc_no = dcln_doc_no
"
"       AND dclsd_bu(+) = dcln_bu
"
"       AND dclsd_plnt(+) = dcln_plnt
"
"       AND dclsd_doc_no(+) = dcln_doc_no
"
"       AND dclsd_seq_no(+) = dcln_seq_no
"
"       AND dchd_type = 'MT'
"
"       AND dchd_other_type IN ('I', 'B', 'W')
"
"       AND dchd_status = 'L'
"
"       AND (dcln_qty - (dcln_compld_qty + dcln_cons_inproc_qty)) > 0
"
"       AND dchd_bu = p_bu
"
"       AND dchd_plnt = p_plnt
"
"       AND dchd_doc_no = p_doc_no
"
"       AND dcln_seq_no = p_seq_no
"
"       AND dcln_proc_qty > 0
"
"     ORDER BY dchd_doc_no,dcln_seq_no;
"
"
"
"    CURSOR c_bin(c_store_id	VARCHAR2,
"
"                 c_prod_id	VARCHAR2,
"
"		 c_prod_rev	NUMBER) IS
"
"    SELECT *
"
"      FROM (
"
"    SELECT stbin_type,bpa_bin_id,
"
"           (SELECT (bpa_capacity - NVL(SUM(binstk_bin_qoh + binstk_tmp_qty),0))
"
"              FROM bin_stocks
"
"             WHERE binstk_bu = bpa_bu
"
"               AND binstk_store_id = bpa_store_id
"
"               AND binstk_prod_id = bpa_prod_id
"
"               AND binstk_prod_rev = bpa_prod_rev
"
"               AND binstk_bin_id = bpa_bin_id) avail_qty
"
"      FROM (SELECT bpa_bu,bpa_bin_id,bpa_prod_id,bpa_prod_rev,bpa_store_id,bpa_capacity,stbin_type
"
"              FROM bin_prod_ass,store_bins
"
"             WHERE bpa_bu = stbin_bu
"
"               AND bpa_bin_id = stbin_bin_id
"
"               AND bpa_store_id =  stbin_store_id
"
"               AND stbin_type <> 'B'
"
"               AND bpa_bu = p_bu
"
"               AND bpa_store_id = c_store_id
"
"               AND bpa_prod_id = c_prod_id
"
"               AND bpa_prod_rev = c_prod_rev
"
"               AND bpa_status = 'A'
"
"            UNION ALL
"
"            SELECT stbin_bu,stbin_bin_id bpa_bin_id,c_prod_id bpa_prod_id,
"
"	           c_prod_rev bpa_prod_rev,c_store_id bpa_store_id,
"
"	           CASE WHEN stbin_chk_cpcy_flag = 'Y' THEN stbin_capacity ELSE 99999999 END bpa_capacity,
"
"                   stbin_type
"
"              FROM store_bins
"
"             WHERE stbin_bu = p_bu
"
"               AND stbin_bin_id IS NOT NULL
"
"               AND stbin_store_id = c_store_id
"
"               AND stbin_type = 'B'))
"
"      WHERE avail_qty > 0
"
"     ORDER BY DECODE(stbin_type,'S',1,'D',2,'B',3,4),bpa_bin_id;
"
"
"
"    r_bin		c_bin%ROWTYPE;
"
"
"
"    v_sub_seq_no	NUMBER := 0;
"
"
"
"    v_bal_qty		NUMBER(12,3);
"
"    v_upd_qty		NUMBER(12,3);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_os_User;
"
"
"
"  BEGIN
"
"
"
"    p_res := 'N';
"
"
"
"    DELETE FROM dc_mat_rcpt_bin_dtls
"
"     WHERE dmrbd_bu = p_bu
"
"       AND dmrbd_plnt = p_plnt
"
"       AND dmrbd_doc_no = p_doc_no;
"
"
"
"    v_sub_seq_no := 0;
"
"
"
"    FOR r_dc IN c_dc
"
"    LOOP
"
"
"
"      v_bal_qty := r_dc.dc_qty;
"
"
"
"      OPEN c_bin(r_dc.dchd_suplr_id,r_dc.dcln_prod_id,r_dc.dcln_prod_rev);
"
"      FETCH c_bin INTO r_bin;
"
"        IF c_bin%NOTFOUND THEN
"
"          Raise_Application_Error(-20284,'ICM '||'~'||r_dc.dchd_suplr_id||'~'||r_dc.dcln_prod_id||'~'||r_dc.dcln_prod_rev);
"
"        END IF;
"
"      CLOSE c_bin;
"
"
"
"      FOR r_bin IN c_bin(r_dc.dchd_suplr_id,r_dc.dcln_prod_id,r_dc.dcln_prod_rev)
"
"      LOOP
"
"
"
"	IF v_bal_qty > r_bin.avail_qty THEN
"
"	  v_upd_qty := r_bin.avail_qty;
"
"	  v_bal_qty := v_bal_qty - r_bin.avail_qty;
"
"	ELSE
"
"	  v_upd_qty := v_bal_qty;
"
"	  v_bal_qty := 0;
"
"	END IF;
"
"
"
"	v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"	INSERT INTO dc_mat_rcpt_bin_dtls(dmrbd_bu,
"
"	                                 dmrbd_plnt,
"
"					 dmrbd_doc_no,
"
"					 dmrbd_seq_no,
"
"					 dmrbd_sub_seq_no,
"
"					 dmrbd_store_id,
"
"					 dmrbd_prod_id,
"
"					 dmrbd_prod_rev,
"
"					 dmrbd_sys_ls_no,
"
"					 dmrbd_lot_no,
"
"					 dmrbd_ser_no,
"
"					 dmrbd_source_type,
"
"					 dmrbd_source_id,
"
"					 dmrbd_bin_id,
"
"					 dmrbd_trans_qty,
"
"					 dmrbd_stk_trans_qty,
"
"					 dmrbd_cre_by,
"
"					 dmrbd_cre_emp_id,
"
"					 dmrbd_cre_ip_addr,
"
"					 dmrbd_cre_os_user,
"
"					 dmrbd_cre_date
"
"					)
"
"				  VALUES(p_bu,
"
"				         p_plnt,
"
"					 p_doc_no,
"
"					 r_dc.dcln_seq_no,
"
"					 v_sub_seq_no,
"
"					 r_dc.dchd_suplr_id,
"
"					 r_dc.dcln_prod_id,
"
"					 r_dc.dcln_prod_rev,
"
"					 r_dc.dclsd_sys_ls_no,
"
"					 r_dc.dclsd_lot_no,
"
"					 r_dc.dclsd_serial_no,
"
"					 r_dc.dclsd_source_type,
"
"					 r_dc.dclsd_source_id,
"
"					 r_bin.bpa_bin_id,
"
"					 v_upd_qty,
"
"					 v_upd_qty,
"
"					 p_user,
"
"					 v_emp_id,
"
"					 v_ip_addr,
"
"					 v_os_user,
"
"					 SYSDATE
"
"					);
"
"
"
"	IF v_bal_qty = 0 THEN
"
"	  p_res := 'Y';
"
"	  EXIT;
"
"	ELSE
"
"	  p_res := 'N';
"
"	END IF;
"
"
"
"      END LOOP c_bin;
"
"
"
"    END LOOP c_dc;
"
"
"
"  END proc_alloc_bin_frm_dc_mat_rcpt;
"
"
"
"  PROCEDURE proc_alloc_bin_frm_dc_mt_rcpt1(p_bu			VARCHAR2,
"
"					   p_lr_no		VARCHAR2,
"
"                                           p_user		VARCHAR2,
"
"					   p_res	OUT	VARCHAR2
"
"				          )
"
"  AS
"
"
"
"    CURSOR c_dc IS
"
"    SELECT dchd_bu,dchd_plnt,dchd_llr_no,dchd_suplr_id,dcln_prod_id,dcln_prod_rev,SUM(dcln_gr_wght) dc_qty
"
"      FROM dc_hd,dc_ln
"
"     WHERE dchd_bu = dcln_bu
"
"       AND dchd_plnt = dcln_plnt
"
"       AND dchd_doc_no = dcln_doc_no
"
"       AND dchd_type = 'MT'
"
"       AND dchd_other_type IN ('I', 'B', 'W')
"
"       AND dchd_status = 'L'
"
"       AND (dcln_qty - (dcln_compld_qty + dcln_cons_inproc_qty)) > 0
"
"       AND dchd_bu = p_bu
"
"       AND dchd_llr_no = p_lr_no
"
"       AND dcln_proc_qty > 0
"
"     GROUP BY dchd_bu,dchd_plnt,dchd_llr_no,dchd_suplr_id,dcln_prod_id,dcln_prod_rev
"
"     ORDER BY dchd_llr_no;
"
"
"
"    CURSOR c_bin(c_store_id	VARCHAR2,
"
"                 c_prod_id	VARCHAR2,
"
"		 c_prod_rev	NUMBER) IS
"
"    SELECT *
"
"      FROM (
"
"    SELECT stbin_type,bpa_bin_id,
"
"           (SELECT (bpa_capacity - NVL(SUM(binstk_bin_qoh + binstk_tmp_qty),0))
"
"              FROM bin_stocks
"
"             WHERE binstk_bu = bpa_bu
"
"               AND binstk_store_id = bpa_store_id
"
"               AND binstk_prod_id = bpa_prod_id
"
"               AND binstk_prod_rev = bpa_prod_rev
"
"               AND binstk_bin_id = bpa_bin_id) avail_qty
"
"      FROM (SELECT bpa_bu,bpa_bin_id,bpa_prod_id,bpa_prod_rev,bpa_store_id,bpa_capacity,stbin_type
"
"              FROM bin_prod_ass,store_bins
"
"             WHERE bpa_bu = stbin_bu
"
"               AND bpa_bin_id = stbin_bin_id
"
"               AND bpa_store_id =  stbin_store_id
"
"               AND stbin_type <> 'B'
"
"               AND bpa_bu = p_bu
"
"               AND bpa_store_id = c_store_id
"
"               AND bpa_prod_id = c_prod_id
"
"               AND bpa_prod_rev = c_prod_rev
"
"               AND bpa_status = 'A'
"
"            UNION ALL
"
"            SELECT stbin_bu,stbin_bin_id bpa_bin_id,c_prod_id bpa_prod_id,
"
"	           c_prod_rev bpa_prod_rev,c_store_id bpa_store_id,
"
"	           CASE WHEN stbin_chk_cpcy_flag = 'Y' THEN stbin_capacity ELSE 99999999 END bpa_capacity,
"
"                   stbin_type
"
"              FROM store_bins
"
"             WHERE stbin_bu = p_bu
"
"               AND stbin_bin_id IS NOT NULL
"
"               AND stbin_store_id = c_store_id
"
"               AND stbin_type = 'B'))
"
"      WHERE avail_qty > 0
"
"     ORDER BY DECODE(stbin_type,'S',1,'D',2,'B',3,4),bpa_bin_id;
"
"
"
"    r_bin		c_bin%ROWTYPE;
"
"
"
"    v_seq_no	NUMBER := 0;
"
"
"
"    v_bal_qty		NUMBER(12,3);
"
"    v_upd_qty		NUMBER(12,3);
"
"
"
"    v_emp_id		VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr		VARCHAR2(20) := Audit_Info.Get_ip_Address;
"
"    v_os_user		VARCHAR2(50) := Audit_Info.Get_os_User;
"
"
"
"  BEGIN
"
"
"
"    p_res := 'N';
"
"
"
"    DELETE FROM mat_rcpt_bin_dtls
"
"     WHERE mrbd_bu = p_bu
"
"       AND mrbd_lr_no = p_lr_no;
"
"
"
"    v_seq_no := 0;
"
"
"
"    FOR r_dc IN c_dc
"
"    LOOP
"
"
"
"      v_bal_qty := r_dc.dc_qty;
"
"
"
"      OPEN c_bin(r_dc.dchd_suplr_id,r_dc.dcln_prod_id,r_dc.dcln_prod_rev);
"
"      FETCH c_bin INTO r_bin;
"
"        IF c_bin%NOTFOUND THEN
"
"          Raise_Application_Error(-20284,'ICM '||'~'||r_dc.dchd_suplr_id||'~'||r_dc.dcln_prod_id||'~'||r_dc.dcln_prod_rev);
"
"        END IF;
"
"      CLOSE c_bin;
"
"
"
"      FOR r_bin IN c_bin(r_dc.dchd_suplr_id,r_dc.dcln_prod_id,r_dc.dcln_prod_rev)
"
"      LOOP
"
"
"
"	IF v_bal_qty > r_bin.avail_qty THEN
"
"	  v_upd_qty := r_bin.avail_qty;
"
"	  v_bal_qty := v_bal_qty - r_bin.avail_qty;
"
"	ELSE
"
"	  v_upd_qty := v_bal_qty;
"
"	  v_bal_qty := 0;
"
"	END IF;
"
"
"
"	v_seq_no := v_seq_no + 1;
"
"
"
"	INSERT INTO mat_rcpt_bin_dtls(mrbd_bu,
"
"					 mrbd_lr_no,
"
"					 mrbd_seq_no,
"
"					 mrbd_bin_id,
"
"					 mrbd_trans_qty,
"
"					 mrbd_cre_by,
"
"					 mrbd_cre_emp_id,
"
"					 mrbd_cre_ip_addr,
"
"					 mrbd_cre_os_user,
"
"					 mrbd_cre_date
"
"					)
"
"				  VALUES(p_bu,
"
"					 p_lr_no,
"
"					 v_seq_no,
"
"					 r_bin.bpa_bin_id,
"
"					 v_upd_qty,
"
"					 p_user,
"
"					 v_emp_id,
"
"					 v_ip_addr,
"
"					 v_os_user,
"
"					 SYSDATE
"
"					);
"
"
"
"	IF v_bal_qty = 0 THEN
"
"	  p_res := 'Y';
"
"	  EXIT;
"
"	ELSE
"
"	  p_res := 'N';
"
"	END IF;
"
"
"
"      END LOOP c_bin;
"
"
"
"    END LOOP c_dc;
"
"
"
"  END proc_alloc_bin_frm_dc_mt_rcpt1;
"
"
"
"END pkg_dc;"
/
