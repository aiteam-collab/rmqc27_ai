CREATE OR REPLACE
"PACKAGE BODY pkg_rfq
"
"AS
"
"  PROCEDURE proc_ins_rfq_suplr(p_bu		rfq_hd.rfqhd_bu%TYPE,
"
"			       p_rfq_pfx	rfq_hd.rfqhd_rfq_pfx%TYPE,
"
"			       p_rfq_no		rfq_hd.rfqhd_rfq_no%TYPE,
"
"			       p_user		rfq_hd.rfqhd_cre_by%TYPE
"
"			      )
"
"  AS
"
"    CURSOR c_rfq_sup IS
"
"
"
"SELECT rls_suplr_id
"
"   FROM rfq_ln_suplr,rfq_ln
"
"  WHERE rfqln_bu = rls_bu
"
"    AND rfqln_rfq_no = rls_rfq_no
"
"    AND rfqln_seq_no = rls_seq_no
"
"    AND rls_bu = p_bu
"
"    AND rls_rfq_no = p_rfq_no
"
"    AND rfqln_status <> 'C'
"
" GROUP BY rls_suplr_id;
"
"
"
"    CURSOR c_suplr(c_suplr_id	VARCHAR2) IS
"
"    SELECT suplr_currency,suplr_fob_id,suplr_shipvia_id,suplr_term_id
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = c_suplr_id;
"
"
"
"    r_suplr	c_suplr%ROWTYPE;
"
"
"
"  BEGIN
"
"
"
"    DELETE FROM rfq_suplr
"
"     WHERE rfqsup_bu = p_bu
"
"       AND rfqsup_rfq_no = p_rfq_no;
"
"
"
"    FOR r_rfq_sup IN c_rfq_sup
"
"    LOOP
"
"
"
"      OPEN c_suplr(r_rfq_sup.rls_suplr_id);
"
"      FETCH c_suplr INTO r_suplr;
"
"      CLOSE c_suplr;
"
"
"
"      IF r_suplr.suplr_fob_id IS NULL THEN
"
"        Raise_Application_Error(-20011,'APM Supplier :'||r_rfq_sup.rls_suplr_id);
"
"      END IF;
"
"
"
"      IF r_suplr.suplr_shipvia_id IS NULL THEN
"
"        Raise_Application_Error(-20015,'ADM Supplier :'||r_rfq_sup.rls_suplr_id);
"
"      END IF;
"
"
"
"      IF r_suplr.suplr_term_id IS NULL THEN
"
"        Raise_Application_Error(-20101,'ADM Supplier :'||r_rfq_sup.rls_suplr_id);
"
"      END IF;
"
"
"
"      INSERT INTO rfq_suplr(rfqsup_bu,
"
"			    rfqsup_rfq_no,
"
"			    rfqsup_suplr_id,
"
"			    rfqsup_suplr_curcy,
"
"			    rfqsup_exchange_rate,
"
"			    rfqsup_rfq_date,
"
"			    rfqsup_rqrd_date,
"
"			    rfqsup_promise_date,
"
"			    rfqsup_fob_id,
"
"			    rfqsup_shipvia_id,
"
"			    rfqsup_term_id,
"
"			    rfqsup_cre_by,
"
"			    rfqsup_cre_date,
"
"			    rfqsup_expiry_date
"
"			   )
"
"		     VALUES(p_bu,
"
"			    p_rfq_no,
"
"			    r_rfq_sup.rls_suplr_id,
"
"			    r_suplr.suplr_currency,
"
"			    func_find_exchange_rate(p_bu,r_suplr.suplr_currency,NULL,TRUNC(SYSDATE),'PO'),
"
"			    TRUNC(SYSDATE),
"
"			    TRUNC(SYSDATE)+1,
"
"			    TRUNC(SYSDATE)+1,
"
"			    r_suplr.suplr_fob_id,
"
"			    r_suplr.suplr_shipvia_id,
"
"			    r_suplr.suplr_term_id,
"
"			    p_user,
"
"			    SYSDATE,
"
"			    TRUNC(SYSDATE)+1
"
"			   );
"
"    END LOOP;
"
"    --Commit;
"
"  END;
"
"
"
"  PROCEDURE proc_can_rfq_frm_pq(p_bu		pur_qtn_hd.pqhd_bu%TYPE,
"
"			        p_quote_pfx	pur_qtn_hd.pqhd_quote_pfx%TYPE,
"
"			        p_quote_no	pur_qtn_hd.pqhd_quote_no%TYPE,
"
"				p_seq_no	pur_qtn_ln.pqln_seq_no%TYPE,
"
"				p_user		pur_qtn_ln.pqln_cre_by%TYPE
"
"			       )
"
"  AS
"
"  CURSOR c1 IS
"
"  SELECT *
"
"    FROM pur_qtn_ln
"
"   WHERE pqln_bu = p_bu
"
"     AND pqln_quote_no = p_quote_no
"
"     AND (pqln_seq_no = p_seq_no OR p_seq_no IS NULL)
"
"   ORDER BY pqln_seq_no;
"
"
"
"    v_count	NUMBER;
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
"      UPDATE pur_qtn_ln
"
"         SET pqln_status = 'C',
"
"	     pqln_upd_by = p_user,
"
"	     pqln_upd_date = SYSDATE
"
"       WHERE pqln_bu = p_bu
"
"	 AND pqln_quote_no = p_quote_no
"
"	 AND pqln_seq_no = cr1.pqln_seq_no;
"
"
"
"      SELECT COUNT(*) INTO v_count
"
"        FROM pur_qtn_ln
"
"       WHERE pqln_bu = p_bu
"
"	 AND pqln_rfq_no = cr1.pqln_rfq_no
"
"	 AND pqln_rfq_seq_no = cr1.pqln_rfq_seq_no
"
"	 AND pqln_status <> 'C';
"
"
"
"      IF v_count = 0 THEN
"
"        proc_rfq_ln_cancel(p_bu,p_user,cr1.pqln_rfq_pfx,cr1.pqln_rfq_no,cr1.pqln_rfq_seq_no);
"
"      END IF;
"
"
"
"    END LOOP;
"
"  END proc_can_rfq_frm_pq;
"
"
"
"END pkg_rfq;"
/
