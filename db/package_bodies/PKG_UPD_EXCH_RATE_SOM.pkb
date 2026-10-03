CREATE OR REPLACE
"PACKAGE BODY pkg_upd_exch_rate_som
"
"AS
"
"
"
"PROCEDURE proc_upd_exch_rate_so(p_bu            VARCHAR2,
"
"                                p_ord_no        VARCHAR2,
"
"                                p_user            VARCHAR2)
"
"AS
"
"CURSOR c1
"
"IS
"
"SELECT soh_currency,soh_order_date
"
"  FROM sales_order_hd
"
" WHERE soh_bu = p_bu
"
"   AND soh_order_no = p_ord_no;
"
"
"
"
"
"CURSOR c2
"
"IS
"
"SELECT *
"
"  FROM sales_order_hd,
"
"       sales_order_qtys
"
" WHERE soh_bu = soq_bu
"
"   AND soh_order_no = soq_order_no
"
"   AND soh_bu = p_bu
"
"   AND soh_order_no = p_ord_no;
"
"
"
"cr1                c1%ROWTYPE;
"
"v_tax_pct        NUMBER(5);
"
"v_cgst_pct        NUMBER(5);
"
"v_sgst_pct        NUMBER(5);
"
"v_utgst_pct        NUMBER(5);
"
"v_cess_pct        NUMBER(5);
"
"v_igst_amt        NUMBER(17);
"
"v_cgst_amt        NUMBER(17);
"
"v_sgst_amt        NUMBER(17);
"
"v_utgst_amt        NUMBER(17);
"
"v_cess_amt        NUMBER(17);
"
"v_cess_rate     NUMBER;
"
"BEGIN
"
"
"
"  OPEN c1;
"
"  FETCH c1 INTO cr1;
"
"    IF c1%FOUND THEN
"
"
"
"        UPDATE sales_order_hd
"
"           SET soh_exchange_rate = func_find_exchange_rate(p_bu,cr1.soh_currency,NULL,cr1.soh_order_date,'SO')
"
"         WHERE soh_bu = p_bu
"
"           AND soh_order_no = p_ord_no;
"
"
"
"    END IF;
"
"   CLOSE c1;
"
"
"
"    FOR cr2 IN c2
"
"    LOOP
"
"
"
"      proc_get_hsn_tax_pct (p_bu,
"
"                            cr2.soq_hsn_code,
"
"                            cr2.soh_order_date,
"
"                            cr2.soh_gst_cust_type,
"
"                            cr2.soq_gst_input_type,
"
"                            cr2.soq_gst_exempt_flag,
"
"                            cr2.soq_qty_ordered,
"
"                            ((cr2.soq_qty_ordered * cr2.soq_price)- NVL(cr2.soq_tot_disc_amt,0)),
"
"                            v_tax_pct,
"
"                            v_cgst_pct,
"
"                            v_sgst_pct,
"
"                            v_utgst_pct,
"
"                            v_cess_pct,
"
"                            v_cess_rate,
"
"                            v_igst_amt,
"
"                            v_cgst_amt,
"
"                            v_sgst_amt,
"
"                            v_utgst_amt,
"
"                            v_cess_amt);
"
"
"
"       UPDATE sales_order_qtys
"
"          SET soq_tax_pct = v_tax_pct,
"
"              soq_cgst_pct = v_cgst_pct,
"
"              soq_sgst_pct = v_sgst_pct,
"
"              soq_utgst_pct = v_utgst_pct,
"
"              soq_cess_pct = v_cess_pct,
"
"              soq_igst_amt = v_igst_amt,
"
"              soq_cgst_amt = v_cgst_amt,
"
"              soq_sgst_amt = v_sgst_amt,
"
"              soq_utgst_amt = v_utgst_amt,
"
"              soq_cess_amt = v_cess_amt
"
"        WHERE soq_bu = cr2.soh_bu
"
"          AND soq_order_no = cr2.soq_order_no
"
"          AND soq_seq_no = cr2.soq_seq_no;
"
"
"
"
"
"
"
"     proc_upd_sales_amt(p_bu,
"
"                        cr2.soh_order_no,
"
"                        cr2.soh_order_type,
"
"                        p_user);
"
"
"
"    END LOOP c2;
"
"END proc_upd_exch_rate_so;
"
"
"
"PROCEDURE proc_upd_exch_rate_si(p_bu        VARCHAR2,
"
"                                p_plnt        VARCHAR2,
"
"                                p_doc_no    VARCHAR2,
"
"                                p_date        DATE,
"
"                                p_user        VARCHAR2)
"
"AS
"
"v_curcy        VARCHAR2(10);
"
"BEGIN
"
"
"
"  BEGIN
"
"    SELECT sihd_currency
"
"      INTO v_curcy
"
"      FROM sales_invoices_hd
"
"     WHERE sihd_bu = p_bu
"
"      AND sihd_plant = p_plnt
"
"      AND sihd_doc_no = p_doc_no;
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_curcy := NULL;
"
"  END;
"
"
"
"        UPDATE sales_invoices_hd
"
"           SET sihd_exchange_rate = func_find_exchange_rate(p_bu,v_curcy,NULL,p_date,'SO')
"
"         WHERE sihd_bu = p_bu
"
"           AND sihd_plant = p_plnt
"
"           AND sihd_doc_no = p_doc_no;
"
"
"
"        proc_upd_si_tax_det_frm_loc(p_bu,p_plnt,p_doc_no);
"
"
"
"END proc_upd_exch_rate_si;
"
"
"
"END pkg_upd_exch_rate_som;"
/
