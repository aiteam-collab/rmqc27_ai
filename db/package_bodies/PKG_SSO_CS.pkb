CREATE OR REPLACE
"PACKAGE BODY pkg_sso_cs
"
"AS
"
"  PROCEDURE proc_load_sso_cs(p_bu		VARCHAR2,
"
"			     p_plnt		VARCHAR2,
"
"			     p_plnt_loc_id	VARCHAR2,
"
"			     p_suplr_id         VARCHAR2,
"
"			     p_doc_no		VARCHAR2,
"
"			     p_sso_no 		VARCHAR2,
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
"    v_emp_id	VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr	VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"    v_os_user	VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"  BEGIN
"
"
"
"    p_res := 'Y';
"
"
"
"    DELETE FROM sso_cls_temp
"
"     WHERE sct_bu = p_bu
"
"       AND sct_doc_no = p_doc_no;
"
"
"
"    INSERT INTO sso_cls_temp(sct_bu,
"
"                             sct_doc_no,
"
"                             sct_seq_no,
"
"			     sct_sso_pfx,
"
"			     sct_sso_no,
"
"			     sct_sso_seq_no,
"
"			     sct_sso_sub_seq_no,
"
"			     sct_suplr_id,
"
"                             sct_suplr_name,
"
"			     sct_prod_id,
"
"                             sct_prod_rev,
"
"                             sct_prod_desc,
"
"                             sct_pur_uom,
"
"			     sct_schld_qty,
"
"                             sct_rcpt_qty,
"
"                             sct_rcpt_inproc_qty,
"
"                             sct_cls_qty,
"
"			     sct_cls_inproc_qty,
"
"                             sct_cls_proc_qty,
"
"                             sct_cre_by,
"
"                             sct_cre_emp_id,
"
"                             sct_cre_ip_addr,
"
"                             sct_cre_os_user,
"
"                             sct_cre_date
"
"			  )
"
"     SELECT p_bu,p_doc_no, ROW_NUMBER() OVER (ORDER BY ssln_doc_no,ssln_seq_no) seq_no,sshd_doc_pfx,sshd_doc_no,ssln_seq_no,ssld_sub_seq_no,
"
"            sshd_suplr_id,(SELECT suplr_name1 FROM suppliers WHERE suplr_bu = p_bu AND suplr_suplr_id = sshd_suplr_id ) suplr_name,
"
"            ssln_prod_id,ssln_prod_rev,(SELECT prod_desc11 FROM products WHERE prod_bu = p_bu AND prod_id = ssln_prod_id AND prod_rev = ssln_prod_rev) prod_desc,
"
"            ssln_prod_uom,ssld_schld_qty,ssld_recvd_qty,ssld_inproc_qty,ssld_cls_qty,ssld_cls_inproc_qty,
"
"	    (ssld_schld_qty - (ssld_recvd_qty + ssld_inproc_qty + ssld_cls_qty + ssld_cls_inproc_qty)) bal_qty,
"
"            p_user,v_emp_id,v_ip_addr,v_os_user,SYSDATE
"
"       FROM suplr_schld_hd,suplr_schld_ln,suplr_schld_ln_dtls
"
"      WHERE sshd_bu = ssln_bu
"
"        AND sshd_doc_no = ssln_doc_no
"
"	AND ssln_bu = ssld_bu
"
"	AND ssln_doc_no = ssld_doc_no
"
"	AND ssln_seq_no = ssld_seq_no
"
"	AND sshd_status IN('A','P')
"
"	AND (ssld_schld_qty - (ssld_recvd_qty + ssld_inproc_qty + ssld_cls_qty + ssld_cls_inproc_qty)) > 0
"
"	AND ssln_status IN ('A','P')
"
"	AND sshd_bu = p_bu
"
"	AND sshd_plnt = p_plnt
"
"	AND sshd_plnt_loc_id = p_plnt_loc_id
"
"	AND (sshd_suplr_id = p_suplr_id OR p_suplr_id IS NULL)
"
"	AND (ssln_doc_no = p_sso_no OR p_sso_no IS NULL)
"
"	AND (sshd_doc_date >= TRUNC(p_fr_date) OR p_fr_date IS NULL)
"
"	AND (sshd_doc_date <= TRUNC(p_to_date) OR p_to_date IS NULL)
"
"	AND NOT EXISTS(SELECT 1
"
"	                 FROM sso_cls_hd,sso_cls_ln
"
"			WHERE schd_bu = scln_bu
"
"			  AND schd_doc_no = scln_doc_no
"
"			  AND scln_bu = ssln_bu
"
"			  AND scln_sso_no = ssln_doc_no
"
"			  AND scln_sso_seq_no = ssln_seq_no
"
"			  AND scln_sel_flag = 'Y'
"
"			  AND schd_status IN ('E','N'))
"
"   ORDER BY sshd_doc_no,ssln_seq_no,ssld_sub_seq_no;
"
"
"
"  END proc_load_sso_cs;
"
"
"
"  PROCEDURE proc_ins_sso_cs_line(p_bu		VARCHAR2,
"
"			         p_doc_no	VARCHAR2,
"
"			         p_user		VARCHAR2
"
"			         )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM sso_cls_temp
"
"   WHERE sct_bu = p_bu
"
"     AND sct_doc_no = p_doc_no
"
"     AND sct_cls_proc_qty > 0
"
"     AND sct_sel_flag = 'Y'
"
"     AND sct_sel_user = p_user;
"
"
"
"v_seq_no	NUMBER(5);
"
"v_emp_id	VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"v_ip_addr	VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user	VARCHAR2(50) := Audit_Info.Get_Os_User;
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
"	UPDATE sso_cls_ln
"
"	   SET scln_cls_proc_qty = scln_cls_proc_qty + cr1.sct_cls_proc_qty
"
"	 WHERE scln_bu = p_bu
"
"	   AND scln_doc_no = p_doc_no
"
"	   AND scln_sso_pfx = cr1.sct_sso_pfx
"
"	   AND scln_sso_no = cr1.sct_sso_no
"
"	   AND scln_sso_seq_no = cr1.sct_sso_seq_no
"
"	   AND scln_sso_sub_seq_no = cr1.sct_sso_sub_seq_no
"
"	 RETURNING scln_seq_no INTO v_seq_no;
"
"
"
"	IF SQL%NOTFOUND THEN
"
"
"
"        SELECT NVL(MAX(scln_seq_no),0) + 1
"
"	  INTO v_seq_no
"
"	  FROM sso_cls_ln
"
"	 WHERE scln_bu = p_bu
"
"	   AND scln_doc_no = p_doc_no;
"
"
"
"        INSERT INTO sso_cls_ln(scln_bu,
"
"                               scln_doc_no,
"
"                               scln_seq_no,
"
"			       scln_sso_pfx,
"
"			       scln_sso_no,
"
"			       scln_sso_seq_no,
"
"			       scln_sso_sub_seq_no,
"
"			       scln_suplr_id,
"
"                               scln_suplr_name,
"
"			       scln_prod_id,
"
"                               scln_prod_rev,
"
"                               scln_prod_desc,
"
"                               scln_pur_uom,
"
"			       scln_schld_qty,
"
"                               scln_rcpt_qty,
"
"                               scln_rcpt_inproc_qty,
"
"                               scln_cls_qty,
"
"			       scln_cls_inproc_qty,
"
"                               scln_cls_proc_qty,
"
"                               scln_cre_by,
"
"                               scln_cre_emp_id,
"
"                               scln_cre_ip_addr,
"
"                               scln_cre_os_user,
"
"                               scln_cre_date
"
"			       )
"
"                         VALUES(p_bu,
"
"                                p_doc_no,
"
"                                v_seq_no,
"
"			        cr1.sct_sso_pfx,
"
"			        cr1.sct_sso_no,
"
"			        cr1.sct_sso_seq_no,
"
"			        cr1.sct_sso_sub_seq_no,
"
"			        cr1.sct_suplr_id,
"
"                                cr1.sct_suplr_name,
"
"			        cr1.sct_prod_id,
"
"                                cr1.sct_prod_rev,
"
"                                cr1.sct_prod_desc,
"
"                                cr1.sct_pur_uom,
"
"			        cr1.sct_schld_qty,
"
"                                cr1.sct_rcpt_qty,
"
"                                cr1.sct_rcpt_inproc_qty,
"
"                                cr1.sct_cls_qty,
"
"			        cr1.sct_cls_inproc_qty,
"
"                                cr1.sct_cls_proc_qty,
"
"                                p_user,
"
"                                v_emp_id,
"
"                                v_ip_addr,
"
"                                v_os_user,
"
"                                SYSDATE
"
"			       );
"
"        END IF;
"
"    END LOOP;
"
"  END proc_ins_sso_cs_line;
"
"
"
"  PROCEDURE proc_cre_sso_cs(p_bu		VARCHAR2,
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
"    FROM sso_cls_ln
"
"   WHERE scln_bu = p_bu
"
"     AND scln_doc_no = p_doc_no
"
"     AND scln_cls_proc_qty > 0;
"
"     --AND scln_sel_flag = 'Y';
"
"
"
"  BEGIN
"
"
"
"    FOR cr1 IN c1
"
"    LOOP
"
"
"
"        UPDATE suplr_schld_ln
"
"	   SET ssln_cls_qty = ssln_cls_qty + cr1.scln_cls_proc_qty,
"
"	       ssln_sel_flag = 'N',
"
"	       ssln_upd_by = p_user,
"
"	       ssln_upd_date = SYSDATE
"
"         WHERE ssln_bu = p_bu
"
"           AND ssln_doc_no = cr1.scln_sso_no
"
"	   AND ssln_seq_no = cr1.scln_sso_seq_no;
"
"
"
"        UPDATE suplr_schld_ln_dtls
"
"	   SET ssld_cls_qty = ssld_cls_qty + cr1.scln_cls_proc_qty,
"
"	       ssld_cls_inproc_qty = ssld_cls_inproc_qty - cr1.scln_cls_proc_qty,
"
"	       ssld_sel_flag = 'N',
"
"	       ssld_upd_by = p_user,
"
"	       ssld_upd_date = SYSDATE
"
"	 WHERE ssld_bu = p_bu
"
"           AND ssld_doc_no = cr1.scln_sso_no
"
"           AND ssld_seq_no = cr1.scln_sso_seq_no
"
"           AND ssld_sub_seq_no = cr1.scln_sso_sub_seq_no;
"
"
"
"    END LOOP;
"
"
"
"  END proc_cre_sso_cs;
"
"
"
"END pkg_sso_cs;"
/
