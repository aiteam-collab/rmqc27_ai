CREATE OR REPLACE
"PACKAGE BODY pkg_suplr_bills
"
"AS
"
"PROCEDURE proc_upd_gl_acct_cc (p_bu       VARCHAR2,
"
"                               p_doc_pfx  VARCHAR2,
"
"							   p_doc_no   VARCHAR2
"
"							   )
"
"IS
"
"   CURSOR c_hd
"
"   IS
"
"      SELECT suphd_suplr_doc_date suphd_doc_date,
"
"	         suphd_proj_id,
"
"			 suphd_terr_id,
"
"			 suphd_gst_class,
"
"			 suphd_grn_refer,
"
"			 suphd_pur_type,
"
"			 suphd_cpc_code
"
"        FROM suplr_doc_hd
"
"       WHERE suphd_bu = p_bu
"
"	     AND suphd_pfx = p_doc_pfx
"
"         AND suphd_doc_no = p_doc_no;
"
"
"
"   CURSOR C1
"
"   IS
"
"      SELECT supln_bu,
"
"             supln_doc_no,
"
"             supln_seq_no,
"
"			 supln_type,
"
"	         supln_prod_id,
"
"             supln_prod_rev,
"
"             supln_plnt,
"
"             supln_hsn_code,
"
"             supln_prod_cls,
"
"             supln_prod_sub_cls,
"
"             supln_dept_id,
"
"             supln_so_pfx,
"
"             supln_so_no,
"
"             supln_proj_id,
"
"             supln_prj_lvl,
"
"             supln_ref_plnt,
"
"             supln_tcf_id,
"
"			 supln_tax_pct,
"
"             supln_tax_exmpt_flag,
"
"             supln_ap_gl_acct,
"
"			 supln_acct_desc,
"
"             supln_ap_cc_code,
"
"             supln_store_id,
"
"             supln_plnt_loc_id
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_type <> 'C';
"
"
"
"   CURSOR c0 (
"
"      c_hsn_code  VARCHAR2,
"
"      c_date      DAtE)
"
"   IS
"
"      SELECT hstr_code_type
"
"        FROM hsn_sac_tax_rates
"
"	   WHERE hstr_bu = p_bu
"
"         AND hstr_status = 'A'
"
"		 AND c_date BETWEEN hstr_date_from AND hstr_date_to
"
"         AND hstr_hsnsac_code = c_hsn_code;
"
"
"
"   CURSOR c2 (
"
"      c_tax_pct NUMBER,
"
"	  c_hsn_sac_type  VARCHAR2)
"
"   IS
"
"      SELECT gioa_io_pct,
"
"             gioa_igst_acct
"
"        FROM gst_ip_op_acct
"
"       WHERE gioa_bu = p_bu
"
"	     AND gioa_trans_type = 'PDF'
"
"		 AND gioa_io_pct = c_tax_pct
"
"		 AND gioa_hsn_sac_type = c_hsn_sac_type
"
"		 AND gioa_active_flag = 'Y';
"
"
"
"   v_tax_pct    NUMBER;
"
"   v_mat_type   VARCHAR2 (100);
"
"   v_store_id   VARCHAR2 (100);
"
"   v_class_id   VARCHAR2 (20);
"
"   v_db_acct    VARCHAR2 (20);
"
"   v_cc_code    VARCHAR2 (100);
"
"   cr_hd        c_hd%ROWTYPE;
"
"   cr0          c0%ROWTYPE;
"
"   cr2          c2%ROWTYPE;
"
"BEGIN
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"      v_tax_pct :=func_find_hsn_sac_pct (p_bu,cr1.supln_hsn_code,cr_hd.suphd_doc_date);
"
"
"
"       BEGIN
"
"			 SELECT DECODE (prodplnt_cls_type,'SV', DECODE (prod_stocked, 'N', 'D', 'S'),'S')
"
"			   INTO v_mat_type
"
"			   FROM prod_plants, products
"
"			  WHERE prodplnt_bu = p_bu
"
"				AND prodplnt_prod_id = cr1.supln_prod_id
"
"				AND prodplnt_prod_rev = cr1.supln_prod_rev
"
"				AND prodplnt_plnt = cr1.supln_plnt
"
"				AND prod_bu = prodplnt_bu
"
"				AND prod_id = prodplnt_prod_id
"
"				AND prod_rev = prodplnt_prod_rev;
"
"
"
"			 SELECT NVL (cr1.supln_store_id,func_find_deflt_storeid (p_bu,cr1.supln_plnt,cr1.supln_plnt_loc_id,cr1.supln_prod_id,cr1.supln_prod_rev,'N'))
"
"			   INTO v_store_id
"
"			   FROM DUAL;
"
"
"
"	  EXCEPTION
"
"          WHEN OTHERS
"
"          THEN
"
"            v_mat_type := 'S';
"
"       END;
"
"
"
"	   BEGIN
"
"          SELECT class_type
"
"			INTO v_class_id
"
"			FROM classes
"
"		   WHERE class_bu = p_bu AND class_id = cr1.supln_prod_cls;
"
"       EXCEPTION
"
"          WHEN OTHERS
"
"          THEN
"
"            v_mat_type := 'S';
"
"       END;
"
"
"
"       IF v_class_id <> 'IG'
"
"	   THEN
"
"		  proc_find_line_gl_acct (
"
"			 p_bu,
"
"			 v_store_id,
"
"			 cr_hd.suphd_terr_id,
"
"			 cr1.supln_prod_cls,
"
"			 cr1.supln_prod_sub_cls,
"
"			 cr1.supln_dept_id,
"
"			 CASE
"
"				WHEN cr1.supln_so_pfx || cr1.supln_so_no IS NULL
"
"				THEN
"
"				   CASE
"
"					  WHEN func_find_apm_pur_acct_src (p_bu) = '03'
"
"					  THEN
"
"						 CASE
"
"							WHEN cr1.supln_proj_id IS NULL
"
"							THEN
"
"							   CASE
"
"								  WHEN cr1.supln_prj_lvl IS NULL
"
"								  THEN
"
"									 func_find_proj_id (p_bu,cr_hd.suphd_proj_id,1)
"
"								  ELSE
"
"									 cr1.supln_prj_lvl
"
"							   END
"
"							ELSE
"
"							   cr1.supln_proj_id
"
"						 END
"
"					  ELSE
"
"						 cr1.supln_proj_id
"
"				   END
"
"				ELSE
"
"				   cr1.supln_proj_id
"
"			 END,
"
"			 cr1.supln_so_pfx,
"
"			 cr1.supln_so_no,
"
"			 v_db_acct,
"
"			 'PR',
"
"			 cr1.supln_ref_plnt,
"
"			 v_mat_type,
"
"			 p_tcf_id        => cr1.supln_tcf_id,
"
"			 p_prod_id       => cr1.supln_prod_id,
"
"			 p_tc_pct        => cr1.supln_tax_pct,
"
"			 p_gst_type      => cr_hd.suphd_gst_class,
"
"			 p_gst_supply    => cr1.supln_tax_exmpt_flag,
"
"			 p_plnt_loc_id   => cr1.supln_plnt_loc_id);
"
"	   ELSE
"
"	      OPEN c0(cr1.supln_hsn_code,cr_hd.suphd_doc_date);
"
"
"
"          FETCH c0 INTO cr0;
"
"
"
"		  OPEN c2 (v_tax_pct,cr0.hstr_code_type);
"
"
"
"		  FETCH c2 INTO cr2;
"
"
"
"		  IF cr1.supln_ap_gl_acct IS NULL
"
"		  THEN
"
"			  IF C2%NOTFOUND
"
"			  THEN
"
"				 raise_application_error (-20356,'SOM' || 'PDF' || '~' || cr1.supln_tax_pct);
"
"			  END IF;
"
"
"
"				v_db_acct := cr2.gioa_igst_acct;
"
"
"
"			 UPDATE suplr_doc_ln
"
"				SET supln_ap_gl_acct = v_db_acct,
"
"					supln_acct_desc  = CASE WHEN v_db_acct IS NOT NULL THEN func_find_gl_acct_desc(p_bu,v_db_acct,1) END,
"
"					supln_ap_cc_code = CASE WHEN supln_ap_cc_code IS NULL THEN cr_hd.suphd_cpc_code ELSE supln_ap_cc_code END
"
"			  WHERE supln_bu = cr1.supln_bu
"
"				AND supln_doc_no = cr1.supln_doc_no
"
"				AND supln_seq_no = cr1.supln_seq_no;
"
"		  END IF;
"
"		  v_db_acct :=NULL;
"
"
"
"		  CLOSE c2;
"
"
"
"		  CLOSE c0;
"
"
"
"       END IF;
"
"
"
"       IF  ((cr1.supln_ap_gl_acct IS NULL AND v_db_acct IS NOT NULL) OR (cr1.supln_acct_desc IS NULL AND cr1.supln_ap_gl_acct IS NOT NULL))
"
"       THEN
"
"         UPDATE suplr_doc_ln
"
"            SET supln_ap_gl_acct = CASE WHEN supln_ap_gl_acct IS NULL THEN v_db_acct ELSE supln_ap_gl_acct END,
"
"			    supln_acct_desc  = CASE WHEN supln_ap_gl_acct IS NULL THEN func_find_gl_acct_desc(p_bu,v_db_acct,1)
"
"				ELSE func_find_gl_acct_desc(p_bu,cr1.supln_ap_gl_acct,1) END
"
"          WHERE supln_bu = cr1.supln_bu
"
"			AND supln_doc_no = cr1.supln_doc_no
"
"			AND supln_seq_no = cr1.supln_seq_no;
"
"       END IF;
"
"
"
"	   IF cr_hd.suphd_grn_refer = 'SCO'
"
"       THEN
"
"		 UPDATE suplr_doc_proc_ln
"
"			SET sdpl_ap_gl_acct = v_db_acct
"
"		  WHERE sdpl_bu = p_bu
"
"			AND sdpl_doc_no = p_doc_no
"
"			AND sdpl_seq_no = cr1.supln_seq_no
"
"			AND sdpl_ap_gl_acct IS NULL;
"
"       END IF;
"
"
"
"       v_cc_code :=
"
"         func_find_pur_cc_code (
"
"            p_bu,
"
"            cr1.supln_ref_plnt,
"
"            'PR',
"
"            NULL,
"
"            cr1.supln_dept_id,
"
"            CASE
"
"               WHEN cr1.supln_so_pfx || cr1.supln_so_no IS NULL
"
"               THEN
"
"                  CASE
"
"                     WHEN func_find_apm_pur_acct_src (p_bu) = '03'
"
"                     THEN
"
"                        CASE
"
"                           WHEN cr1.supln_proj_id IS NULL
"
"                           THEN
"
"                              CASE
"
"                                 WHEN cr1.supln_prj_lvl IS NULL
"
"                                 THEN
"
"                                    func_find_proj_id (
"
"                                       p_bu,
"
"                                       cr_hd.suphd_proj_id,
"
"                                       1)
"
"                                 ELSE
"
"                                    cr1.supln_prj_lvl
"
"                              END
"
"                           ELSE
"
"                              cr1.supln_proj_id
"
"                        END
"
"                     ELSE
"
"                        cr1.supln_proj_id
"
"                  END
"
"               ELSE
"
"                  cr1.supln_proj_id
"
"            END,
"
"            cr1.supln_so_pfx,
"
"            cr1.supln_so_no,
"
"            cr1.supln_prod_cls,
"
"            cr1.supln_prod_sub_cls,
"
"            cr1.supln_ref_plnt,
"
"            p_prod_id   => cr1.supln_prod_id,
"
"            p_loc_id    => cr1.supln_plnt_loc_id);
"
"
"
"       IF cr1.supln_ap_cc_code IS NULL
"
"       THEN
"
"		  UPDATE suplr_doc_ln
"
"             SET supln_ap_cc_code = v_cc_code
"
"           WHERE supln_bu = cr1.supln_bu
"
"		 	 AND supln_doc_no = cr1.supln_doc_no
"
"			 AND supln_seq_no = cr1.supln_seq_no;
"
"       END IF;
"
"
"
"	   IF cr_hd.suphd_grn_refer = 'SCO'
"
"       THEN
"
"		 UPDATE suplr_doc_proc_ln
"
"			SET sdpl_ap_cc_code = v_cc_code
"
"		  WHERE sdpl_bu = p_bu
"
"			AND sdpl_doc_no = p_doc_no
"
"			AND sdpl_seq_no = cr1.supln_seq_no;
"
"       END IF;
"
"
"
"   END LOOP;
"
"END proc_upd_gl_acct_cc;
"
"
"
"PROCEDURE proc_upd_tds_src_dtls (p_bu           VARCHAR2,
"
"                                 p_doc_pfx      VARCHAR2,
"
"							     p_doc_no       VARCHAR2)
"
"IS
"
"   CURSOR c_hd
"
"   IS
"
"      SELECT suphd_suplr_id,
"
"	         suphd_grn_refer,
"
"			 suphd_pur_type
"
"	    FROM suplr_doc_hd
"
"	   WHERE suphd_bu = p_bu
"
"		 AND suphd_doc_no = p_doc_no
"
"		 AND suphd_pfx = p_doc_pfx;
"
"
"
"   CURSOR c1
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_unit_cost > 0
"
"		 AND supln_type IN ('C','LC')
"
"         AND supln_gen_flag = 'Y';
"
"
"
"   CURSOR c2 (c_suplr_id VARCHAR2,
"
"      c_bfcry_id VARCHAR2)
"
"   IS
"
"      SELECT *
"
"        FROM suplr_bill_ded
"
"       WHERE sbd_bu = p_bu
"
"         AND sbd_suplr_id = c_suplr_id
"
"         AND sbd_ded_suplr_id = c_bfcry_id;
"
"
"
"   CURSOR c3 (
"
"      c_us_id VARCHAR2)
"
"   IS
"
"      SELECT tus_prim_id, tus_id
"
"        FROM tds_under_sections
"
"       WHERE tus_bu = p_bu
"
"         AND (tus_wop_suplr_id = c_us_id
"
"          OR tus_cf_suplr_id = c_us_id
"
"          OR tus_ih_suplr_id = c_us_id);
"
"
"
"   CURSOR c4 (
"
"      c_us_id VARCHAR2)
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_tds_us_id = c_us_id
"
"		 AND supln_type IN ('C','LC')
"
"         AND supln_tds_us_id IS NOT NULL;
"
"
"
"   CURSOR c04 (c_grn_refer VARCHAR2,
"
"      c_us_id VARCHAR2)
"
"   IS
"
"      SELECT supln_doc_no,supln_tds_us_id,supln_ap_cc_code
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_tds_us_id = c_us_id
"
"         AND supln_tds_us_id IS NOT NULL
"
"		 AND supln_type = 'I'
"
"         AND c_grn_refer NOT IN ('SCO')
"
"	   GROUP BY supln_doc_no,supln_tds_us_id,supln_ap_cc_code
"
"      UNION ALL
"
"      SELECT supln_doc_no,sdpl_tds_us_id supln_tds_us_id,supln_ap_cc_code
"
"        FROM suplr_doc_ln,suplr_doc_proc_ln
"
"       WHERE supln_bu = sdpl_bu
"
"         AND supln_doc_no = sdpl_doc_no
"
"         AND supln_seq_no = sdpl_seq_no
"
"         AND supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND sdpl_tds_us_id = c_us_id
"
"         AND sdpl_tds_us_id IS NOT NULL
"
"         AND c_grn_refer IN ('SCO')
"
"	   GROUP BY supln_doc_no,sdpl_tds_us_id ,supln_ap_cc_code
"
"	  UNION ALL
"
"      SELECT supln_doc_no,supln_tds_us_id,supln_ap_cc_code
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_tds_us_id = c_us_id
"
"         AND supln_tds_us_id IS NOT NULL
"
"         AND c_grn_refer IN ('SCO')
"
"		 AND NOT EXISTS
"
"                (SELECT 1
"
"                   FROM suplr_doc_proc_ln
"
"                  WHERE sdpl_bu = supln_bu
"
"                    AND sdpl_doc_no = supln_doc_no
"
"                    AND sdpl_seq_no = supln_seq_no)
"
"	   GROUP BY supln_doc_no,supln_tds_us_id ,supln_ap_cc_code;
"
"
"
"   cr04   c04%ROWTYPE;
"
"
"
"   CURSOR c5 (c_tds_us_id VARCHAR)
"
"   IS
"
"      SELECT *
"
"        FROM tds_under_sections
"
"       WHERE tus_bu = p_bu AND tus_id = c_tds_us_id;
"
"
"
"   cr5              c5%ROWTYPE;
"
"   cr_hd            c_hd%ROWTYPE;
"
"   v_apm_proj_req   VARCHAR2(1):=func_find_apm_prj_req_flag(p_bu);
"
"BEGIN
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"      FOR cr2 IN c2 (cr_hd.suphd_suplr_id,cr1.supln_bfcry_id)
"
"      LOOP
"
"         FOR cr3 IN c3 (cr2.sbd_ded_suplr_id)
"
"         LOOP
"
"            FOR cr4 IN c4 (cr3.tus_id)
"
"            LOOP
"
"               OPEN c5 (cr4.supln_tds_us_id);
"
"
"
"               FETCH c5 INTO cr5;
"
"
"
"               UPDATE suplr_doc_ln
"
"                  SET supln_tds_src_acct = cr1.supln_ap_gl_acct,
"
"                      supln_tds_src_pct = cr1.supln_appl_pct,
"
"                      supln_tds_exempt_cert_no = cr1.supln_tds_exempt_cert_no
"
"                WHERE supln_bu = p_bu
"
"                  AND supln_doc_no = cr4.supln_doc_no
"
"                  AND supln_tds_us_id = cr3.tus_id
"
"                  --AND supln_dr_cr = 'DR'
"
"				  AND supln_type IN ('C','LC')
"
"                  AND supln_tds_us_id IS NOT NULL
"
"				  AND ((v_apm_proj_req = 'C' AND supln_ap_cc_code = cr1.supln_ap_cc_code) OR (v_apm_proj_req <> 'C'));
"
"
"
"               CLOSE c5;
"
"            END LOOP;
"
"
"
"            FOR cr04 IN c04 (cr_hd.suphd_grn_refer,cr3.tus_id)
"
"            LOOP
"
"               OPEN c5 (cr04.supln_tds_us_id);
"
"
"
"               FETCH c5 INTO cr5;
"
"
"
"               IF cr_hd.suphd_grn_refer NOT IN ('SCO')
"
"               THEN
"
"                  UPDATE suplr_doc_ln
"
"                     SET supln_tds_src_acct = cr1.supln_ap_gl_acct,
"
"                         supln_tds_src_pct = cr1.supln_appl_pct
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = cr04.supln_doc_no
"
"                     AND supln_tds_us_id = cr3.tus_id
"
"                     AND supln_tds_us_id IS NOT NULL
"
"					 AND ((v_apm_proj_req = 'C' AND supln_ap_cc_code = cr1.supln_ap_cc_code) OR (v_apm_proj_req <> 'C'));
"
"
"
"               ELSIF cr_hd.suphd_grn_refer IN ('SCO')
"
"               THEN
"
"                  UPDATE suplr_doc_ln
"
"                     SET supln_tds_src_acct = cr1.supln_ap_gl_acct,
"
"                         supln_tds_src_pct = cr1.supln_appl_pct
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = cr04.supln_doc_no
"
"                     AND cr04.supln_tds_us_id = cr3.tus_id
"
"                     AND cr04.supln_tds_us_id IS NOT NULL
"
"					 AND ((v_apm_proj_req = 'C' AND supln_ap_cc_code = cr1.supln_ap_cc_code) OR (v_apm_proj_req <> 'C'));
"
"               END IF;
"
"               CLOSE c5;
"
"            END LOOP;
"
"         END LOOP;
"
"      END LOOP;
"
"   END LOOP;
"
"
"
"   DECLARE
"
"      CURSOR c1
"
"      IS
"
"         SELECT *
"
"           FROM suplr_doc_ln
"
"          WHERE supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no
"
"            AND supln_unit_cost > 0
"
"			AND supln_contra_flag = 'Y'
"
"			AND supln_gen_flag = 'Y'
"
"            AND supln_bfcry_id IS NOT NULL;
"
"
"
"      CURSOR c2 (c_suplr_id VARCHAR2,
"
"         c_bfcry_id VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM suplr_bill_ded
"
"          WHERE sbd_bu = p_bu
"
"            AND sbd_suplr_id = c_suplr_id
"
"            AND sbd_ded_suplr_id = c_bfcry_id;
"
"
"
"      CURSOR c3 (
"
"         c_us_id VARCHAR2)
"
"      IS
"
"         SELECT tus_prim_id, tus_id
"
"           FROM tds_under_sections
"
"          WHERE tus_bu = p_bu
"
"            AND (   tus_wop_suplr_id = c_us_id
"
"                 OR tus_cf_suplr_id = c_us_id
"
"                 OR tus_ih_suplr_id = c_us_id);
"
"
"
"      CURSOR c4 (
"
"         c_us_id VARCHAR2)
"
"      IS
"
"         SELECT *
"
"           FROM suplr_doc_ln
"
"          WHERE supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no
"
"            AND supln_tds_us_id = c_us_id
"
"            AND supln_tds_us_id IS NOT NULL;
"
"
"
"      CURSOR c04 (c_us_id VARCHAR2)
"
"      IS
"
"         SELECT supln_doc_no,
"
"                supln_tds_us_id,
"
"                supln_unit_cost,
"
"                supln_inv_qty,
"
"                supln_inv_disc_amt,
"
"                supln_lm_disc_amt,
"
"                supln_tds_src_pct,
"
"				supln_assbl_val,
"
"			    supln_seq_no,
"
"				supln_ap_cc_code,
"
"			    CASE WHEN supln_gst_rev_tax_flag = 'N' THEN
"
"				(supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt)
"
"				ELSE 0
"
"				END supln_tax_amt
"
"           FROM suplr_doc_ln
"
"          WHERE supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no
"
"            AND supln_tds_us_id = c_us_id
"
"            AND supln_tds_us_id IS NOT NULL
"
"			AND NOT EXISTS
"
"                (SELECT 1
"
"                   FROM suplr_doc_proc_ln
"
"                  WHERE sdpl_bu = supln_bu
"
"                    AND sdpl_plnt = supln_plnt
"
"                    AND sdpl_doc_no = supln_doc_no
"
"                    AND sdpl_seq_no = supln_seq_no)
"
"         UNION ALL
"
"         SELECT supln_doc_no,
"
"                sdpl_tds_us_id supln_tds_us_id,
"
"                supln_unit_cost,
"
"                supln_inv_qty,
"
"                supln_inv_disc_amt,
"
"                supln_lm_disc_amt,
"
"                supln_tds_src_pct,
"
"				supln_assbl_val,
"
"			    supln_seq_no,
"
"				supln_ap_cc_code,
"
"			    CASE WHEN supln_gst_rev_tax_flag = 'N' THEN
"
"				(supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt)
"
"				ELSE 0
"
"				END supln_tax_amt
"
"           FROM suplr_doc_ln, suplr_doc_proc_ln
"
"          WHERE supln_bu = sdpl_bu
"
"            AND supln_doc_no = sdpl_doc_no
"
"            AND supln_seq_no = sdpl_seq_no
"
"            AND supln_bu = p_bu
"
"			AND supln_type = 'I'
"
"            AND supln_doc_no = p_doc_no
"
"            AND sdpl_tds_us_id = c_us_id
"
"            AND sdpl_tds_us_id IS NOT NULL;
"
"
"
"      CURSOR c5 (c_tds_us_id VARCHAR)
"
"      IS
"
"         SELECT *
"
"           FROM tds_under_sections
"
"          WHERE tus_bu = p_bu AND tus_id = c_tds_us_id;
"
"
"
"      cr5              c5%ROWTYPE;
"
"	  v_inc_tax_flag   VARCHAR2(1);
"
"      v_assbl_val_on   VARCHAR2(1);
"
"      v_assbl_val      NUMBER;
"
"   BEGIN
"
"      FOR cr1 IN c1
"
"      LOOP
"
"         FOR cr2 IN c2 (cr_hd.suphd_suplr_id,cr1.supln_bfcry_id)
"
"         LOOP
"
"            FOR cr3 IN c3 (cr2.sbd_ded_suplr_id)
"
"            LOOP
"
"               FOR cr4 IN c4 (cr3.tus_id)
"
"               LOOP
"
"                  OPEN c5 (cr4.supln_tds_us_id);
"
"
"
"                  FETCH c5 INTO cr5;
"
"				  BEGIN
"
"					  SELECT tus_inc_tax_flag,tus_assbl_val_on
"
"						INTO v_inc_tax_flag,v_assbl_val_on
"
"					    FROM tds_under_sections
"
"					   WHERE tus_bu = p_bu
"
"						 AND tus_id = cr3.tus_id;
"
"					  EXCEPTION WHEN OTHERS THEN
"
"						     v_inc_tax_flag := 'N';
"
"				  END;
"
"
"
"                  IF v_assbl_val_on = 'B'
"
"				  THEN
"
"					v_assbl_val := cr4.supln_assbl_val;
"
"				  ELSIF v_assbl_val_on = 'A'
"
"				  THEN
"
"					  SELECT NVL (SUM (((porl_accepted_qty + porl_sec_rej_qty)* cr4.supln_receipt_qty/ porl_receipt_qty)
"
"										 * (porl_sc_unit_cost - porl_sc_lm_disc_amt- porl_disc_amt)),0)
"
"                        INTO v_assbl_val
"
"						FROM pur_ord_receipt_ln_view
"
"					   WHERE porl_bu = cr4.supln_bu
"
"						 AND porl_receipt_no = cr4.supln_receipt_no
"
"						 AND porl_seq_no = cr4.supln_rct_seq_no
"
"						 AND porl_status = 'R';
"
"				  ELSIF v_assbl_val_on = 'L'
"
"				  THEN
"
"					v_assbl_val := (cr4.supln_receipt_qty * cr4.supln_pur_unit_cost -(cr4.supln_inv_disc_amt + cr4.supln_lm_disc_amt));
"
"				  ELSIF v_assbl_val_on = 'G'
"
"				  THEN
"
"					v_assbl_val := (((cr4.supln_receipt_qty - cr4.supln_rej_qty) * cr4.supln_unit_cost)- cr4.supln_grn_disc_amt - cr4.supln_grn_lm_disc_amt);
"
"				  END IF;
"
"
"
"                  IF cr_hd.suphd_pur_type = 'O'
"
"				  THEN
"
"		            v_assbl_val := cr4.supln_assbl_val;
"
"		          END IF;
"
"
"
"                     IF cr1.supln_ded_assbl_value <> 0
"
"					 THEN
"
"				      UPDATE suplr_doc_ln
"
"						 SET supln_tds_src_assbl_val = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((v_assbl_val/cr1.supln_ded_assbl_value) *cr1.supln_tds_assbl_val,2)
"
"							                           ELSE ROUND(((v_assbl_val + NVL(cr4.supln_cgst_amt + cr4.supln_sgst_amt + cr4.supln_igst_amt + cr4.supln_utgst_amt + cr4.supln_cess_amt,0))/cr1.supln_ded_assbl_value) *cr1.supln_tds_assbl_val,2)END,
"
"							 supln_tds_src_amt = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((v_assbl_val/cr1.supln_ded_assbl_value) *cr1.supln_unit_cost,2)
"
"								                 ELSE ROUND(((v_assbl_val + NVL(cr4.supln_cgst_amt + cr4.supln_sgst_amt + cr4.supln_igst_amt + cr4.supln_utgst_amt + cr4.supln_cess_amt,0))/cr1.supln_ded_assbl_value) *cr1.supln_unit_cost,2) END,
"
"							 supln_tds_exempt_cert_no = cr4.supln_tds_exempt_cert_no
"
"					   WHERE supln_bu = p_bu
"
"						 AND supln_doc_no = cr4.supln_doc_no
"
"						 AND supln_tds_us_id = cr3.tus_id
"
"						 AND supln_tds_us_id IS NOT NULL
"
"                         AND supln_seq_no = cr4.supln_seq_no
"
"                         AND supln_tds_us_id = cr1.supln_src_tds_us_id
"
"						 AND ((cr4.supln_ap_cc_code = cr1.supln_ap_cc_code AND v_apm_proj_req = 'C') OR v_apm_proj_req <> 'C');
"
"
"
"					  ELSIF cr1.supln_ded_assbl_value = 0 AND cr1.supln_tds_assbl_val <> 0
"
"					  THEN
"
"				      UPDATE suplr_doc_ln
"
"						 SET supln_tds_src_assbl_val = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((cr1.supln_tds_assbl_val/cr1.supln_tds_assbl_val) *cr1.supln_tds_assbl_val,2)
"
"							                           ELSE ROUND(((cr1.supln_tds_assbl_val + NVL(cr4.supln_cgst_amt + cr4.supln_sgst_amt + cr4.supln_igst_amt + cr4.supln_utgst_amt + cr4.supln_cess_amt,0))/cr1.supln_tds_assbl_val) *cr1.supln_tds_assbl_val,2)END,
"
"							 supln_tds_src_amt = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((cr1.supln_tds_assbl_val/cr1.supln_tds_assbl_val) *cr1.supln_unit_cost,2)
"
"								                    ELSE ROUND(((cr1.supln_tds_assbl_val + NVL(cr4.supln_cgst_amt + cr4.supln_sgst_amt + cr4.supln_igst_amt + cr4.supln_utgst_amt + cr4.supln_cess_amt,0))/cr1.supln_tds_assbl_val) *cr1.supln_unit_cost,2) END,
"
"							 supln_tds_exempt_cert_no = cr4.supln_tds_exempt_cert_no
"
"					   WHERE supln_bu = p_bu
"
"						 AND supln_doc_no = cr4.supln_doc_no
"
"						 AND supln_tds_us_id = cr3.tus_id
"
"						 AND supln_tds_us_id IS NOT NULL
"
"                         AND supln_seq_no = cr4.supln_seq_no
"
"                         AND supln_tds_us_id = cr1.supln_src_tds_us_id
"
"						 AND ((cr4.supln_ap_cc_code = cr1.supln_ap_cc_code AND v_apm_proj_req = 'C') OR v_apm_proj_req <> 'C');
"
"                      END IF;
"
"                  CLOSE c5;
"
"               END LOOP;
"
"               FOR cr04 IN c04 (cr3.tus_id)
"
"               LOOP
"
"                  OPEN c5 (cr04.supln_tds_us_id);
"
"
"
"                  FETCH c5 INTO cr5;
"
"
"
"				  BEGIN
"
"					  SELECT tus_inc_tax_flag
"
"						INTO v_inc_tax_flag
"
"					    FROM tds_under_sections
"
"					   WHERE tus_bu = p_bu
"
"						 AND tus_id = cr3.tus_id;
"
"					  EXCEPTION WHEN OTHERS THEN
"
"						     v_inc_tax_flag := 'N';
"
"				  END;
"
"
"
"                  IF cr_hd.suphd_grn_refer NOT IN ('SCO')
"
"                  THEN
"
"                        IF cr1.supln_ded_assbl_value <> 0 THEN
"
"					     UPDATE suplr_doc_ln
"
"							SET supln_tds_src_assbl_val = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((cr04.supln_assbl_val/cr1.supln_ded_assbl_value) *cr1.supln_tds_assbl_val,2)
"
"							                             ELSE ROUND(((cr04.supln_assbl_val + NVL(cr04.supln_tax_amt,0))/cr1.supln_ded_assbl_value) *cr1.supln_tds_assbl_val,2)END,
"
"								supln_tds_src_amt = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((cr04.supln_assbl_val/cr1.supln_ded_assbl_value) *cr1.supln_unit_cost,2)
"
"								                    ELSE ROUND(((cr04.supln_assbl_val + NVL(cr04.supln_tax_amt,0))/cr1.supln_ded_assbl_value) *cr1.supln_unit_cost,2) END
"
"						  WHERE supln_bu = p_bu
"
"							AND supln_doc_no = cr04.supln_doc_no
"
"							AND supln_tds_us_id = cr3.tus_id
"
"							AND supln_tds_us_id IS NOT NULL
"
"							AND supln_seq_no = cr04.supln_seq_no
"
"							AND supln_tds_us_id = cr1.supln_src_tds_us_id
"
"							AND 1=2
"
"							AND (supln_ap_cc_code = cr1.supln_ap_cc_code AND v_apm_proj_req = 'C' OR v_apm_proj_req <> 'C');
"
"					    END IF;
"
"                  ELSIF cr_hd.suphd_grn_refer IN ('SCO')
"
"                  THEN
"
"					     UPDATE suplr_doc_ln
"
"							SET supln_tds_src_assbl_val = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((cr04.supln_assbl_val/cr1.supln_ded_assbl_value) *cr1.supln_tds_assbl_val,2)
"
"							                             ELSE ROUND(((cr04.supln_assbl_val + NVL(cr04.supln_tax_amt,0))/cr1.supln_ded_assbl_value) *cr1.supln_tds_assbl_val,2)END,
"
"								supln_tds_src_amt = CASE WHEN v_inc_tax_flag = 'N' THEN ROUND((cr04.supln_assbl_val/cr1.supln_ded_assbl_value) *cr1.supln_unit_cost,2)
"
"								                    ELSE ROUND(((cr04.supln_assbl_val + NVL(cr04.supln_tax_amt,0))/cr1.supln_ded_assbl_value) *cr1.supln_unit_cost,2) END
"
"						  WHERE supln_bu = p_bu
"
"							AND supln_doc_no = cr04.supln_doc_no
"
"							AND supln_tds_us_id = cr3.tus_id
"
"							AND supln_tds_us_id = cr1.supln_src_tds_us_id
"
"							AND supln_seq_no = cr04.supln_seq_no
"
"							AND (supln_ap_cc_code = cr1.supln_ap_cc_code AND v_apm_proj_req = 'C' OR v_apm_proj_req <> 'C');
"
"                  END IF;
"
"
"
"                  CLOSE c5;
"
"               END LOOP;
"
"            END LOOP;
"
"         END LOOP;
"
"      END LOOP;
"
"   END;
"
"   CLOSE c_hd;
"
"END proc_upd_tds_src_dtls;
"
"
"
"PROCEDURE proc_upd_tcs_src_dtls (p_bu         VARCHAR2,
"
"                                 p_doc_pfx    VARCHAR2,
"
"								 p_doc_no     VARCHAR2)
"
"IS
"
"   CURSOR c1
"
"   IS
"
"      SELECT supln_seq_no,supln_doc_no
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_unit_cost > 0
"
"         AND supln_tcs_gen_flg = 'Y';
"
"
"
"   CURSOR c2 (
"
"      c_seq_no    NUMBER)
"
"   IS
"
"      SELECT supln_ap_gl_acct,supln_seq_no
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_unit_cost > 0
"
"         AND supln_seq_no = c_seq_no
"
"         AND supln_tcs_gen_flg = 'Y';
"
"
"
"
"
"BEGIN
"
"   FOR cr1 IN c1
"
"   LOOP
"
"      FOR cr2 IN c2 (cr1.supln_seq_no)
"
"      LOOP
"
"		   UPDATE suplr_doc_ln
"
"			  SET supln_tcs_src_acct = cr2.supln_ap_gl_acct
"
"			WHERE supln_bu = p_bu
"
"			  AND supln_doc_no = cr1.supln_doc_no
"
"			  AND supln_seq_no = cr2.supln_seq_no
"
"			  AND supln_dr_cr = 'DR'
"
"			  AND supln_tcs_gen_flg = 'Y';
"
"      END LOOP;
"
"   END LOOP;
"
"END proc_upd_tcs_src_dtls;
"
"
"
"PROCEDURE proc_chk_hsn_sac_code(p_bu        VARCHAR2,
"
"                                p_doc_no    VARCHAR2,
"
"								p_grn_refer VARCHAR2
"
"                                )
"
"IS
"
"   CURSOR c_hd
"
"   IS
"
"      SELECT suphd_jrnl_flag,suphd_tds_flag
"
"        FROM suplr_doc_hd
"
"       WHERE suphd_bu = p_bu
"
"         AND suphd_doc_no = p_doc_no;
"
"
"
"   CURSOR c1
"
"   IS
"
"	  SELECT 1
"
"		FROM suplr_doc_ln, gl_accts
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_bu = glac_bu
"
"		 AND supln_ap_gl_acct = glac_acct
"
"		 AND glac_sub_grp_type IN ('DNT');
"
"
"
"
"
"   CURSOR c2
"
"   IS
"
"	  SELECT COUNT (*) V_COUNT
"
"		FROM suplr_doc_ln, gl_accts
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_bu = glac_bu
"
"		 AND supln_ap_gl_acct = glac_acct
"
"		 AND glac_sub_grp_type NOT IN ('DNT')
"
"		 AND supln_bfcry_id IS NULL
"
"		 AND supln_hsn_code IS NOT NULL;
"
"
"
"
"
"   CURSOR c4
"
"   IS
"
"	  SELECT 1, 'B' TYPE
"
"		FROM suplr_doc_ln
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_hsn_code IS NOT NULL
"
"		 AND supln_tax_pct > 0
"
"		 AND supln_gst_rev_tax_flag ='Y'
"
"		 AND supln_gst_rev_tax_cat IS NULL
"
"	  UNION ALL
"
"	  SELECT 1, 'A' TYPE
"
"		FROM suplr_doc_ln
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_hsn_code IS NOT NULL
"
"		 AND supln_tax_pct > 0
"
"		 AND supln_gst_rev_tax_flag ='Y'
"
"		 AND supln_gst_rev_tax_cat IS NULL;
"
"
"
"   CURSOR c5(c_seq_no  NUMBER)
"
"   IS
"
"	  SELECT 1
"
"		FROM suplr_doc_dist_adj
"
"	   WHERE sdda_bu = p_bu
"
"		 AND sdda_seq_no = c_seq_no
"
"		 AND sdda_doc_no = p_doc_no;
"
"
"
"   CURSOR c6
"
"   IS
"
"	  SELECT supln_seq_no
"
"		FROM suplr_doc_ln, gl_accts
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_bu = glac_bu
"
"		 AND supln_ap_gl_acct = glac_acct
"
"		 AND glac_sub_grp_type IN ('STK');
"
"
"
"   cr_hd   c_hd%ROWTYPE;
"
"   cr1     c1%ROWTYPE;
"
"   cr2     c2%ROWTYPE;
"
"   cr4     c4%ROWTYPE;
"
"   cr5     c5%ROWTYPE;
"
"BEGIN
"
"
"
"   IF func_find_base_currency (p_bu) = 'INR' AND p_grn_refer <> 'LC'
"
"   THEN
"
"      OPEN c_hd;
"
"
"
"      FETCH c_hd INTO cr_hd;
"
"
"
"      CLOSE c_hd;
"
"
"
"	  OPEN c1;
"
"
"
"	  FETCH c1 INTO cr1;
"
"
"
"	  IF c1%FOUND
"
"	  THEN
"
"		 OPEN c2;
"
"
"
"		 FETCH c2 INTO cr2;
"
"
"
"		 IF c2%notfound OR cr2.v_count = 0 AND cr_hd.suphd_jrnl_flag||cr_hd.suphd_tds_flag ='NN'
"
"		 THEN
"
"			raise_application_error (-20999,'HSN/SAC Code must be entered');
"
"		 END IF;
"
"
"
"		 CLOSE c2;
"
"	  END IF;
"
"
"
"	  CLOSE c1;
"
"
"
"	  OPEN c4;
"
"
"
"	  FETCH c4 INTO cr4;
"
"
"
"	  IF c4%FOUND
"
"	  THEN
"
"		 IF cr4.TYPE = 'A' AND cr_hd.suphd_jrnl_flag||cr_hd.suphd_tds_flag ='NN'
"
"		 THEN
"
"			raise_application_error (-20999,'RCM Category must be entered.');
"
"		 ELSIF cr4.TYPE = 'B' AND cr_hd.suphd_jrnl_flag||cr_hd.suphd_tds_flag ='NN'
"
"		 THEN
"
"			raise_application_error (-20999,'RCM Category must be entered.');
"
"		 END IF;
"
"	  END IF;
"
"
"
"	  CLOSE c4;
"
"
"
"   END IF;
"
"   IF p_grn_refer IN('PO','EXP')
"
"   THEN
"
"      FOR cr6 IN c6
"
"	  LOOP
"
"		  OPEN c5(cr6.supln_seq_no);
"
"
"
"		  FETCH c5 INTO cr5;
"
"
"
"		  IF c5%NOTFOUND
"
"		  THEN
"
"			 raise_application_error (-20999,'Distribute GRN Details must be entered for line no. -'||cr6.supln_seq_no);
"
"		  END IF;
"
"
"
"		  CLOSE c5;
"
"      END LOOP;
"
"   END IF;
"
"END;
"
"---Process For Update Subcontract process To Invoice Lines
"
"PROCEDURE proc_upd_sub_amt(p_bu        VARCHAR2,
"
"                           p_doc_pfx   VARCHAR2,
"
"                           p_doc_no    VARCHAR2,
"
"						   p_seq_no    NUMBER
"
"						   )
"
"IS
"
"   CURSOR c_hd
"
"   IS
"
"      SELECT suphd_plant,
"
"	         suphd_suplr_doc_date suphd_doc_date,
"
"             suphd_suplr_id,
"
"             suphd_currency,
"
"			 suphd_exchange_rate,
"
"             suphd_grn_refer,
"
"             suphd_term_id,
"
"			 suphd_plnt_loc_id,
"
"			 suphd_gst_class,
"
"			 suphd_alow_igst_csgst_tax,
"
"			 suphd_cpc_code,
"
"			 suphd_pur_type
"
"        FROM suplr_doc_hd
"
"       WHERE suphd_bu = p_bu
"
"		 AND suphd_pfx = p_doc_pfx
"
"		 AND suphd_doc_no = p_doc_no;
"
"
"
"   CURSOR c_ln
"
"   IS
"
"      SELECT supln_trd_disc_pct,
"
"             supln_spl_disc_pct,
"
"			 supln_cash_disc_pct
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_seq_no = p_seq_no;
"
"
"
"   CURSOR c1
"
"   IS
"
"      SELECT SUM(sdpl_proc_qty)sdpl_proc_qty,
"
"	         SUM(sdpl_rcpt_proc_qty)sdpl_rcpt_proc_qty,
"
"	         sdpl_proc_cost,
"
"			 sdpl_grn_proc_cost
"
"		FROM(
"
"      SELECT SUM(sdpl_proc_qty)sdpl_proc_qty,
"
"	         SUM(sdpl_rcpt_proc_qty)sdpl_rcpt_proc_qty,
"
"	         sdpl_proc_cost,
"
"			 sdpl_grn_proc_cost
"
"        FROM suplr_doc_proc_ln
"
"       WHERE sdpl_bu = p_bu
"
"	     AND sdpl_doc_no = p_doc_no
"
"		 AND sdpl_seq_no = p_seq_no
"
"	GROUP BY sdpl_proc_cost,sdpl_grn_proc_cost)
"
"	GROUP BY sdpl_proc_cost,sdpl_grn_proc_cost;
"
"
"
"   CURSOR c1a
"
"   IS
"
"      SELECT sdpl_hsn_code,sdpl_tds_us_id
"
"        FROM suplr_doc_proc_ln
"
"       WHERE sdpl_bu = p_bu
"
"	     AND sdpl_doc_no = p_doc_no
"
"		 AND sdpl_seq_no = p_seq_no;
"
"
"
"   cr_hd     	      c_hd%ROWTYPE;
"
"   cr_ln     	      c_ln%ROWTYPE;
"
"   cr1     	          c1%ROWTYPE;
"
"   cr1a    	          c1a%ROWTYPE;
"
"   v_hsn_code         VARCHAR2(10);
"
"   v_rnd              NUMBER(5):= func_find_appl_rnddigit (p_bu);
"
"   v_tax_pct          NUMBER(5,2);
"
"   v_cess_pct         NUMBER(5,2);
"
"   v_cnt              NUMBER;
"
"   v_cess_rate        NUMBER (18, 3) := 0;
"
"   v_line_amt         NUMBER (18, 3) := 0;
"
"   v_trd_assbl_val    NUMBER (18, 3) := 0;
"
"   v_trd_disc_amt     NUMBER (18, 3) := 0;
"
"   v_spl_assbl_val    NUMBER (18, 3) := 0;
"
"   v_spl_disc_amt     NUMBER (18, 3) := 0;
"
"   v_cash_assbl_val   NUMBER (18, 3) := 0;
"
"   v_cash_disc_amt    NUMBER (18, 3) := 0;
"
"   v_tot_disc_amt     NUMBER (18, 3) := 0;
"
"BEGIN
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   OPEN c_ln;
"
"
"
"   FETCH c_ln INTO cr_ln;
"
"
"
"   CLOSE c_ln;
"
"
"
"   OPEN c1;
"
"
"
"   FETCH c1 INTO cr1;
"
"
"
"   OPEN c1a;
"
"
"
"   FETCH c1a INTO cr1a;
"
"
"
"   IF c1%FOUND
"
"   THEN
"
"       BEGIN
"
"	      SELECT SUM(v_cnt) INTO v_cnt
"
"		    FROM(
"
"		  SELECT COUNT(DISTINCT sdpl_hsn_code)v_cnt
"
"			FROM suplr_doc_proc_ln
"
"		   WHERE sdpl_bu = p_bu
"
"			 AND sdpl_doc_no = p_doc_no
"
"			 AND sdpl_seq_no = p_seq_no
"
"		GROUP BY sdpl_hsn_code,
"
"				 sdpl_proc_cost);
"
"	     IF v_cnt > 1 THEN
"
"		   raise_application_error(-20999,'Different Cost is given in the process.');
"
"	     END IF;
"
"		 EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
"
"	   END;
"
"       BEGIN
"
"	      SELECT SUM(v_cnt) INTO v_cnt
"
"		    FROM(
"
"		  SELECT COUNT(DISTINCT sdpl_hsn_code)v_cnt
"
"			FROM suplr_doc_proc_ln
"
"		   WHERE sdpl_bu = p_bu
"
"			 AND sdpl_doc_no = p_doc_no
"
"			 AND sdpl_seq_no = p_seq_no
"
"             AND sdpl_hsn_code IS NOT NULL
"
"		GROUP BY sdpl_hsn_code);
"
"	     IF v_cnt > 1 THEN
"
"		   raise_application_error(-20999,'Different SAC Code is given in the process.');
"
"	     END IF;
"
"		 EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
"
"	   END;
"
"
"
"	   BEGIN
"
"	      SELECT SUM(v_cnt) INTO v_cnt
"
"		    FROM(
"
"		  SELECT COUNT(DISTINCT sdpl_tds_us_id)v_cnt
"
"			FROM suplr_doc_proc_ln
"
"		   WHERE sdpl_bu = p_bu
"
"			 AND sdpl_doc_no = p_doc_no
"
"			 AND sdpl_seq_no = p_seq_no
"
"             AND sdpl_tds_us_id IS NOT NULL
"
"		GROUP BY sdpl_tds_us_id);
"
"	     IF v_cnt > 1 THEN
"
"		   raise_application_error(-20999,'Different TDS u/s ID Code is given in the process.');
"
"	     END IF;
"
"		 EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
"
"	   END;
"
"
"
"	   BEGIN
"
"		   SELECT CASE WHEN cr_hd.suphd_gst_class = 'I' THEN hstr_igst_tax_pct
"
"					   WHEN cr_hd.suphd_gst_class = 'M' THEN hstr_igst_tax_pct
"
"					   WHEN cr_hd.suphd_gst_class = 'L' THEN (hstr_cgst_tax_pct + hstr_sgst_tax_pct)
"
"					   WHEN cr_hd.suphd_gst_class = 'U' THEN (hstr_cgst_tax_pct + hstr_utgst_tax_pct)
"
"					   ELSE 0
"
"				  END,hstr_gst_cess_tax_pct,hstr_gst_cess_rate
"
"			 INTO v_tax_pct,v_cess_pct,v_cess_rate
"
"			 FROM hsn_sac_tax_rates
"
"			WHERE hstr_bu = p_bu
"
"			  AND hstr_hsnsac_code = cr1a.sdpl_hsn_code
"
"			  AND (TO_DATE(cr_hd.suphd_doc_date) BETWEEN TRUNC (hstr_date_from) AND TRUNC (hstr_date_to))
"
"			  AND hstr_status = 'A'
"
"			  AND func_find_base_currency(p_bu) = cr_hd.suphd_currency;
"
"		  EXCEPTION WHEN OTHERS THEN v_tax_pct := 0;v_cess_pct :=0;
"
"	   END;
"
"			v_line_amt := cr1.sdpl_proc_qty * cr1.sdpl_proc_cost;
"
"			v_trd_assbl_val := v_line_amt;
"
"			v_trd_disc_amt  := (v_trd_assbl_val * (cr_ln.supln_trd_disc_pct / 100));
"
"			v_spl_assbl_val := v_line_amt - v_trd_disc_amt;
"
"			v_spl_disc_amt := (v_spl_assbl_val * (cr_ln.supln_spl_disc_pct / 100));
"
"			v_cash_assbl_val := (v_spl_assbl_val - v_spl_disc_amt);
"
"			v_cash_disc_amt := (v_cash_assbl_val * (cr_ln.supln_cash_disc_pct / 100));
"
"			v_tot_disc_amt := NVL (v_trd_disc_amt + v_spl_disc_amt + v_cash_disc_amt, 0);
"
"
"
"		   UPDATE suplr_doc_ln
"
"			  SET supln_inv_qty   = cr1.sdpl_proc_qty,
"
"				  supln_unit_cost = cr1.sdpl_proc_cost,
"
"				  supln_receipt_qty   = CASE WHEN cr_hd.suphd_pur_type = 'W' AND cr1.sdpl_rcpt_proc_qty > 0 THEN cr1.sdpl_rcpt_proc_qty ELSE 0 END,
"
"				  supln_pur_unit_cost = CASE WHEN cr_hd.suphd_pur_type = 'W' AND cr1.sdpl_grn_proc_cost > 0 THEN cr1.sdpl_grn_proc_cost ELSE 0 END,
"
"				  supln_assbl_val = v_line_amt,
"
"				  supln_tax_pct   = v_tax_pct,
"
"				  supln_cess_pct  = v_cess_pct,
"
"				  supln_igst_amt  = CASE WHEN cr_hd.suphd_gst_class IN('I','M') THEN (v_line_amt * v_tax_pct/ 100) ELSE 0 END,
"
"				  supln_sgst_amt  = CASE WHEN cr_hd.suphd_gst_class = 'L' THEN (v_line_amt * v_tax_pct/ 100/2) ELSE 0 END,
"
"				  supln_cgst_amt  = CASE WHEN cr_hd.suphd_gst_class = 'L' THEN (v_line_amt * v_tax_pct/ 100/2) ELSE 0 END,
"
"				  supln_utgst_amt = CASE WHEN cr_hd.suphd_gst_class = 'U' THEN (v_line_amt * v_tax_pct/ 100/2) ELSE 0 END,
"
"				  supln_cess_amt  = CASE WHEN v_cess_pct > 0 THEN (v_line_amt * v_cess_pct/ 100)
"
"				                         WHEN v_cess_rate > 0 THEN (v_line_amt * v_cess_rate)
"
"								    ELSE 0 END,
"
"				  supln_trd_assbl_val = v_trd_assbl_val,
"
"				  supln_trd_disc_amt  = v_trd_disc_amt,
"
"				  supln_spl_assbl_val = v_spl_assbl_val,
"
"				  supln_spl_disc_amt = v_spl_disc_amt,
"
"				  supln_cash_assbl_val = v_cash_assbl_val,
"
"				  supln_cash_disc_amt = v_cash_disc_amt,
"
"				  supln_inv_disc_amt = ROUND (NVL (v_tot_disc_amt, 0),v_rnd),
"
"				  supln_hsn_code   = cr1a.sdpl_hsn_code,
"
"                  supln_tds_us_id = cr1a.sdpl_tds_us_id
"
"			WHERE supln_bu = p_bu
"
"			  AND supln_doc_no = p_doc_no
"
"			  AND supln_seq_no = p_seq_no;
"
"
"
"       CLOSE c1a;
"
"
"
"	   CLOSE c1;
"
"	END IF;
"
"END;
"
"
"
"---Procedure to validate bills
"
" PROCEDURE proc_validate_bills (p_bu                VARCHAR2,
"
"					            p_doc_pfx           VARCHAR2,
"
"					            p_doc_no            VARCHAR2
"
"								)
"
"IS
"
"   CURSOR c_hd
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_hd
"
"       WHERE suphd_bu = p_bu
"
"         AND suphd_doc_no = p_doc_no
"
"         AND suphd_pfx = p_doc_pfx;
"
"
"
"   CURSOR c_ln
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"		 AND supln_contra_flag = 'N'
"
"		 AND supln_input_type = 'N';
"
"
"
"   CURSOR c1
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_ln,gl_accts
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"		 AND supln_contra_flag = 'N'
"
"		 AND supln_ap_gl_acct IS NOT NULL
"
"         AND supln_ap_gl_acct = glac_acct
"
"         AND supln_bu = glac_bu;
"
"
"
"   CURSOR c2
"
"   IS
"
"      SELECT supln_seq_no,pcc_ac_lvl_prj
"
"        FROM suplr_doc_ln,profit_cost_centers
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"		 AND supln_ref_plnt = pcc_ac_plnt
"
"		 AND pcc_default_flag = 'Y'
"
"         AND supln_ap_cc_code = pcc_cc_code
"
"         AND supln_bu = pcc_bu;
"
"
"
"   CURSOR c3
"
"   IS
"
"	  SELECT COUNT(*) cnt
"
"		FROM suplr_doc_ln
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_tax_exmpt_flag = 'G'
"
"		 AND supln_hsn_code IS NULL
"
"		 AND supln_bfcry_id IS NULL;
"
"
"
"   CURSOR c4
"
"   IS
"
"      SELECT supln_seq_no
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no;
"
"
"
"   CURSOR c5(c_seq_no  NUMBER)
"
"   IS
"
"      SELECT SUM(apdra_share_pct)apdra_share_pct
"
"        FROM ap_doc_recr_acct
"
"       WHERE apdra_bu = p_bu
"
"         AND apdra_doc_no = p_doc_no
"
"         AND apdra_seq_no = c_seq_no;
"
"
"
"   CURSOR c6(c_loc_name  VARCHAR2)
"
"   IS
"
"      SELECT *
"
"	    FROM suplr_ship_loc
"
"	   WHERE ssl_bu = p_bu
"
"         AND ssl_loc_name1 = c_loc_name;
"
"
"
"   CURSOR c7(c_currency  VARCHAR2)
"
"   IS
"
"      SELECT *
"
"        FROM currencies
"
"       WHERE curcy_bu = p_bu
"
"		 AND curcy_id = c_currency
"
"		 AND curcy_chk_rng_flag = 'Y';
"
"
"
"   CURSOR c_cp
"
"   IS
"
"      SELECT COUNT(*)cnt
"
"        FROM (
"
"      SELECT supln_tds_us_id
"
"        FROM suplr_doc_ln
"
"       WHERE supln_bu = p_bu
"
"         AND supln_doc_no = p_doc_no
"
"         AND supln_contra_flag = 'N'
"
"         AND supln_tds_appl_flag = 'Y'
"
"         AND supln_tds_us_id IS NOT NULL
"
"       GROUP BY supln_tds_us_id
"
"      HAVING COUNT(DISTINCT supln_ap_cc_code) > 1 AND COUNT(DISTINCT supln_dr_cr) > 1);
"
"
"
"   CURSOR c_cr
"
"   IS
"
"      SELECT COUNT(*)cnt
"
"		FROM (
"
"			SELECT supln_tds_us_id
"
"			  FROM suplr_doc_ln
"
"			 WHERE supln_bu = p_bu
"
"			   AND supln_doc_no = p_doc_no
"
"			   AND supln_contra_flag = 'N'
"
"			   AND supln_tds_appl_flag = 'Y'
"
"			   AND supln_tds_us_id IS NOT NULL
"
"			 GROUP BY supln_tds_us_id
"
"			HAVING SUM(CASE WHEN supln_dr_cr = 'CR' THEN 1 ELSE 0 END) > 0
"
"			   AND SUM(CASE WHEN supln_dr_cr = 'DR' THEN 1 ELSE 0 END) = 0
"
"		     );
"
"
"
"  cr3             c3%ROWTYPE;
"
"  cr5             c5%ROWTYPE;
"
"  cr6             c6%ROWTYPE;
"
"  cr7             c7%ROWTYPE;
"
"  cr_hd           c_hd%ROWTYPE;
"
"  cr_cp           c_cp%ROWTYPE;
"
"  cr_cr           c_cr%ROWTYPE;
"
"  v_apm_proj_req  VARCHAR2 (1):= func_find_apm_prj_req_flag(p_bu);
"
"BEGIN
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF cr_hd.suphd_term_id IS NULL
"
"   THEN
"
"      UPDATE suplr_doc_hd
"
"	     SET suphd_term_id = (SELECT suplr_term_id FROM suppliers WHERE suplr_bu = p_bu AND suphd_suplr_id = suplr_suplr_id)
"
"	   WHERE suphd_bu = p_bu
"
"         AND suphd_pfx = p_doc_pfx
"
"         AND suphd_doc_no = p_doc_no;
"
"   END IF;
"
"
"
"   OPEN c7(cr_hd.suphd_currency);
"
"
"
"   FETCH c7 INTO cr7;
"
"
"
"   IF c7%FOUND AND cr_hd.suphd_exchange_rate NOT BETWEEN cr7.curcy_min_ex_rate
"
"      AND cr7.curcy_max_ex_rate AND cr_hd.suphd_jrnl_flag = 'N'
"
"   THEN
"
"	  raise_application_error (-20999,'Exchange Rate Range Exceeds.');
"
"   END IF;
"
"
"
"   CLOSE c7;
"
"
"
"   OPEN c_cp;
"
"
"
"   FETCH c_cp INTO cr_cp;
"
"
"
"   IF cr_cp.cnt > 0 AND cr_hd.suphd_tds_flag||cr_hd.suphd_jrnl_flag ='NN' AND v_apm_proj_req = 'C'
"
"   THEN
"
"	  raise_application_error (-20999,'Merge not possible due to different CPC codes under the same TDS u/s Id.');
"
"   END IF;
"
"
"
"   CLOSE c_cp;
"
"
"
"   OPEN c_cr;
"
"
"
"   FETCH c_cr INTO cr_cr;
"
"
"
"   IF cr_cr.cnt = 1 AND cr_hd.suphd_tds_flag||cr_hd.suphd_jrnl_flag ='NN' AND v_apm_proj_req = 'C'
"
"   THEN
"
"	  raise_application_error (-20999,'Merge not possible due to different CPC codes under the same TDS u/s Id.');
"
"   END IF;
"
"
"
"   CLOSE c_cr;
"
"
"
"   IF (cr_hd.suphd_pan_no IS NULL OR cr_hd.suphd_gstin_no IS NULL)
"
"   THEN
"
"      OPEN c6(cr_hd.suphd_bill_loc_name);
"
"
"
"      FETCH c6 INTO cr6;
"
"
"
"	  IF c6%FOUND
"
"	  THEN
"
"	    UPDATE suplr_doc_hd
"
"		   SET suphd_gstin_no = cr6.ssl_gst_no,
"
"		       suphd_pan_no   = func_find_party_pan_no(p_bu,cr_hd.suphd_suplr_id,1),
"
"               suphd_pan_avail = CASE WHEN cr6.ssl_gst_no IS NOT NULL THEN 'W' ELSE 'O' END,
"
"			   suphd_suplr_type = cr6.ssl_gst_type,
"
"			   suphd_gst_class  = cr6.ssl_type,
"
"			   suphd_pur_gst_cls  = cr6.ssl_type
"
"		 WHERE suphd_bu = p_bu
"
"		   AND suphd_pfx = p_doc_pfx
"
"           AND suphd_doc_no = p_doc_no;
"
"      END IF;
"
"
"
"      CLOSE c6;
"
"   END IF;
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF cr_hd.suphd_pan_no IS NULL
"
"   THEN
"
"        UPDATE suplr_doc_hd
"
"		   SET suphd_pan_avail = 'O'
"
"		 WHERE suphd_bu = p_bu
"
"		   AND suphd_pfx = p_doc_pfx
"
"           AND suphd_doc_no = p_doc_no;
"
"   END IF;
"
"
"
"   IF cr_hd.suphd_gst_class = 'M'
"
"   THEN
"
"      UPDATE suplr_doc_ln
"
"		 SET supln_tds_appl_flag = 'N',
"
"		     supln_tds_us_id = NULL
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_input_type = 'M'
"
"		 AND supln_contra_flag = 'N'
"
"		 AND supln_doc_no = p_doc_no;
"
"   END IF;
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF cr_hd.suphd_grn_refer IN ('EXP','PR') AND cr_hd.suphd_jrnl_flag = 'N' AND cr_hd.suphd_tds_flag = 'N'
"
"	 THEN
"
"		DECLARE
"
"		   CURSOR C1
"
"		   IS
"
"			  SELECT 1
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND ((supln_tax_exmpt_flag <> 'A' AND supln_input_type = 'A') OR (supln_tax_exmpt_flag = 'A'
"
"				 AND supln_input_type NOT IN ('A')))
"
"				 AND supln_type = 'C';
"
"
"
"		   CURSOR C2
"
"		   IS
"
"			  SELECT 1
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND (supln_tax_exmpt_flag = 'A' AND supln_input_type = 'A')
"
"				 AND ((supln_hsn_code IS NOT NULL) OR (supln_tax_set_id IS NOT NULL))
"
"				 AND supln_type = 'C';
"
"
"
"		   CURSOR C3
"
"		   IS
"
"			  SELECT supln_seq_no, supln_hsn_code, supln_tax_set_id
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND supln_tax_exmpt_flag = 'G'
"
"				 AND supln_type = 'C';
"
"
"
"		   cr1        c1%ROWTYPE;
"
"		   cr2        c2%ROWTYPE;
"
"		   cr3        c3%ROWTYPE;
"
"		   v_lc_cnt   NUMBER;
"
"		BEGIN
"
"		   OPEN c1;
"
"
"
"		   FETCH c1 INTO cr1;
"
"
"
"		   IF c1%FOUND
"
"		   THEN
"
"			  raise_application_error(-20999,'Type/supply type should be in not applicable.');
"
"		   END IF;
"
"
"
"		   CLOSE c1;
"
"
"
"		   OPEN c2;
"
"
"
"		   FETCH c2 INTO cr2;
"
"
"
"		   IF c2%FOUND
"
"		   THEN
"
"			  raise_application_error (-20999,'Type/Supply Type is Not Applicable, Please remove HSN/SAC Code.');
"
"		   END IF;
"
"
"
"		   CLOSE c2;
"
"
"
"		END;
"
"	 END IF;
"
"
"
"	 IF cr_hd.suphd_grn_refer NOT IN ('EXP') AND cr_hd.suphd_jrnl_flag = 'N' AND cr_hd.suphd_tds_flag = 'N'
"
"	 THEN
"
"		DECLARE
"
"		   CURSOR C1
"
"		   IS
"
"			  SELECT 1
"
"				FROM suplr_doc_ln,classes
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND class_type NOT IN('IG','CH')
"
"                 AND class_bu = supln_bu
"
"				 AND class_id = supln_prod_cls
"
"				 AND ((supln_tax_exmpt_flag <> 'A' AND supln_input_type IN('A')) OR (supln_tax_exmpt_flag = 'A'
"
"				 AND supln_input_type NOT IN('A','M')));
"
"
"
"		   CURSOR C2
"
"		   IS
"
"			  SELECT 1
"
"				FROM suplr_doc_ln,classes
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND class_type NOT IN('IG','CH')
"
"                 AND class_bu = supln_bu
"
"				 AND class_id = supln_prod_cls
"
"				 AND (supln_tax_exmpt_flag = 'A' AND supln_input_type = 'A')
"
"				 AND ( (supln_hsn_code IS NOT NULL)OR (supln_tax_set_id IS NOT NULL));
"
"
"
"		   CURSOR C3
"
"		   IS
"
"			  SELECT supln_hsn_code, supln_tax_set_id
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND supln_tax_exmpt_flag = 'G'
"
"				 AND supln_bfcry_id IS NULL
"
"				 AND supln_type = 'C';
"
"
"
"		   cr1   c1%ROWTYPE;
"
"		   cr2   c2%ROWTYPE;
"
"		   cr3   c3%ROWTYPE;
"
"		BEGIN
"
"		   OPEN c1;
"
"
"
"		   FETCH c1 INTO cr1;
"
"
"
"		   IF c1%FOUND
"
"		   THEN
"
"			  raise_application_error (-20999,'Type/Supply Type should not be in (Not Applicable).');
"
"		   END IF;
"
"
"
"		   CLOSE c1;
"
"
"
"		   OPEN c2;
"
"
"
"		   FETCH C2 INTO CR2;
"
"
"
"		   IF C2%FOUND
"
"		   THEN
"
"			  raise_application_error (-20999,'Type/Supply Type is Not Applicable, Please remove HSN/SAC Code.');
"
"		   END IF;
"
"
"
"		   CLOSE c2;
"
"
"
"		   OPEN c3;
"
"
"
"		   FETCH c3 INTO cr3;
"
"
"
"		   IF C3%FOUND AND cr_hd.suphd_grn_refer NOT IN ('SCO') AND cr_hd.suphd_jrnl_flag = 'N' AND cr_hd.suphd_tds_flag = 'N'
"
"		   THEN
"
"			  IF cr3.supln_hsn_code IS NULL
"
"			  THEN
"
"				 raise_application_error (-20999,'For GST Supply HSN Code must be entered.');
"
"			  END IF;
"
"		   END IF;
"
"
"
"		   CLOSE C3;
"
"		END;
"
"	 END IF;
"
"	 BEGIN
"
"   FOR cr_ln IN c_ln
"
"   LOOP
"
"       IF cr_ln.supln_input_type = 'N'
"
"       THEN
"
"		  IF cr_ln.supln_inelgbl_type = 'J'
"
"			 AND cr_ln.supln_inelgbl_sub_type NOT IN ('NB', 'RI', 'ES')
"
"		  THEN
"
"			 UPDATE suplr_doc_ln
"
"			    SET supln_inelgbl_sub_type = 'A'
"
"			  WHERE supln_bu = p_bu
"
"                AND supln_doc_no = p_doc_no
"
"				AND supln_seq_no = cr_ln.supln_seq_no;
"
"		  END IF;
"
"       END IF;
"
"
"
"	   IF  cr_ln.supln_input_type = 'N' AND cr_ln.supln_inelgbl_type='A' THEN
"
"			raise_application_error (-20999,'Invalid Section type.'||'Line No. -'||cr_ln.supln_seq_no);
"
"	   END IF;
"
"
"
"	   IF cr_ln.supln_input_type = 'N'
"
"	   THEN
"
"		  IF cr_ln.supln_inelgbl_type = 'I'
"
"			 AND cr_ln.supln_inelgbl_sub_type NOT IN
"
"					('MV', 'SG', 'SF', 'MC', 'TB', 'WC', 'GS', 'GB', 'GL')
"
"		  THEN
"
"			 raise_application_error (-20999,'Invalid Sub Section type.'||'Line No. -'||cr_ln.supln_seq_no);
"
"		  END IF;
"
"
"
"		  IF cr_ln.supln_inelgbl_type = 'J'
"
"			 AND cr_ln.supln_inelgbl_sub_type NOT IN ('NB', 'RI', 'ES')
"
"		  THEN
"
"			 raise_application_error (-20999,'Invalid Sub Section type.'||'Line No. -'||cr_ln.supln_seq_no);
"
"		  END IF;
"
"
"
"		  IF cr_ln.supln_inelgbl_type = 'K'
"
"			 AND cr_ln.supln_inelgbl_sub_type NOT IN ('CG')
"
"		  THEN
"
"			 raise_application_error (-20999,'Invalid Sub Section type.'||'Line No. -'||cr_ln.supln_seq_no);
"
"		  END IF;
"
"	   END IF;
"
"   END LOOP;
"
"
"
"   FOR cr1 IN c1
"
"   LOOP
"
"      IF UPPER(cr1.supln_acct_desc) <> UPPER(cr1.glac_acct_desc1) AND cr_hd.suphd_jrnl_flag = 'N'
"
"	  THEN
"
"	    raise_application_error(-20999,'GL Acct. No. & GL Acct. Desc. is diff in line no - '||cr1.supln_seq_no);
"
"	  END IF;
"
"   END LOOP;
"
"
"
"   IF v_apm_proj_req = 'Y'
"
"   THEN
"
"	   FOR cr2 IN c2
"
"	   LOOP
"
"	      UPDATE suplr_doc_ln
"
"		     SET supln_prj_lvl = cr2.pcc_ac_lvl_prj
"
"		   WHERE supln_bu = p_bu
"
"             AND supln_seq_no = cr2.supln_seq_no
"
"             AND supln_doc_no = p_doc_no;
"
"	   END LOOP;
"
"   END IF;
"
"
"
"   OPEN c3;
"
"
"
"   FETCH c3 INTO cr3;
"
"
"
"   IF cr3.cnt > 0 AND cr_hd.suphd_currency = 'INR' AND cr_hd.suphd_jrnl_flag||cr_hd.suphd_tds_flag ='NN'
"
"   THEN
"
"		raise_application_error (-20999,'HSN/SAC Code must be entered.');
"
"   END IF;
"
"
"
"   CLOSE c3;
"
"
"
"   FOR cr4 IN c4
"
"   LOOP
"
"      OPEN c5(cr4.supln_seq_no);
"
"
"
"	  FETCH c5 INTO cr5;
"
"
"
"	  IF cr5.apdra_share_pct < 100
"
"	  THEN
"
"		 raise_application_error (-20999,'Sum of Share Percentage less then 100%. Line No. - '||cr4.supln_seq_no);
"
"	  ELSIF cr5.apdra_share_pct > 100
"
"	  THEN
"
"		 raise_application_error (-20999,'Sum of Share Percentage Greater then 100%. Line No. - '||cr4.supln_seq_no);
"
"	  END IF;
"
"
"
"	  CLOSE c5;
"
"   END LOOP;
"
"END;
"
"END proc_validate_bills;
"
"
"
"---Procedure For update GRN/PO Details
"
"PROCEDURE proc_suphd_po_grn_det (
"
"    p_bu      VARCHAR2,
"
"    p_doc_pfx VARCHAR2,
"
"    p_doc_no  VARCHAR2
"
")
"
"IS
"
"    v_appl_ref_date_ctrl VARCHAR2(1);
"
"    v_po_det             VARCHAR2(4000);
"
"    v_grn_det            VARCHAR2(4000);
"
"BEGIN
"
"    SELECT NVL(glmctrl_ref_w_wo_date, 'N')
"
"      INTO v_appl_ref_date_ctrl
"
"      FROM glm_control
"
"     WHERE glmctrl_bu = p_bu;
"
"
"
"    FOR i IN (
"
"        SELECT DISTINCT supln_receipt_no AS receipt_no
"
"          FROM suplr_doc_ln
"
"         WHERE supln_bu = p_bu
"
"           AND supln_doc_no = p_doc_no
"
"           AND supln_receipt_no IS NOT NULL
"
"    )
"
"    LOOP
"
"        ------------------------------------------------------------------
"
"        -- Build PO Details
"
"        ------------------------------------------------------------------
"
"        FOR j IN (
"
"            SELECT DISTINCT
"
"                   l.porl_po_no ||
"
"                   CASE
"
"                       WHEN v_appl_ref_date_ctrl = 'Y' AND l.porl_po_date IS NOT NULL
"
"					   THEN
"
"                            '(' ||
"
"                            TO_CHAR(
"
"                                l.porl_po_date,
"
"                                (SELECT DISTINCT applctrl_df
"
"                                   FROM appl_control
"
"                                  WHERE applctrl_bu = h.porh_bu)
"
"                            ) || ')'
"
"                       ELSE ''
"
"                   END AS po_det
"
"              FROM pur_ord_receipt_hd_view h
"
"              JOIN pur_ord_receipt_ln_view l
"
"                ON l.porl_bu = h.porh_bu
"
"               AND l.porl_receipt_no = h.porh_receipt_no
"
"             WHERE h.porh_bu = p_bu
"
"               AND h.porh_receipt_no = i.receipt_no
"
"        )
"
"        LOOP
"
"            v_po_det :=
"
"                SUBSTR(
"
"                    v_po_det ||
"
"                    CASE WHEN v_po_det IS NULL THEN NULL ELSE ',' END ||
"
"                    j.po_det,
"
"                    1,
"
"                    4000
"
"                );
"
"        END LOOP;
"
"
"
"        ------------------------------------------------------------------
"
"        -- Build GRN Details
"
"        ------------------------------------------------------------------
"
"        FOR j IN (
"
"            SELECT DISTINCT
"
"                   h.porh_receipt_no ||
"
"                   CASE
"
"                       WHEN v_appl_ref_date_ctrl = 'Y' AND h.porh_receipt_date IS NOT NULL
"
"					   THEN
"
"                            '(' ||
"
"                            TO_CHAR(
"
"                                h.porh_receipt_date,
"
"                                (SELECT DISTINCT applctrl_df
"
"                                   FROM appl_control
"
"                                  WHERE applctrl_bu = h.porh_bu)
"
"                            ) || ')'
"
"                       ELSE ''
"
"                   END AS grn_det
"
"              FROM pur_ord_receipt_hd_view h
"
"             WHERE h.porh_bu = p_bu
"
"               AND h.porh_receipt_no = i.receipt_no
"
"        )
"
"        LOOP
"
"            v_grn_det :=
"
"                SUBSTR(
"
"                    v_grn_det ||
"
"                    CASE WHEN v_grn_det IS NULL THEN NULL ELSE ',' END ||
"
"                    j.grn_det,
"
"                    1,
"
"                    4000
"
"                );
"
"        END LOOP;
"
"    END LOOP;
"
"
"
"    UPDATE suplr_doc_hd
"
"       SET suphd_po_det  = v_po_det,
"
"           suphd_grn_det = v_grn_det
"
"     WHERE suphd_bu = p_bu
"
"       AND suphd_doc_no = p_doc_no;
"
"
"
"END proc_suphd_po_grn_det;
"
"
"
"---Procedure For Create TDS For Supplier Bill Booking
"
"
"
" PROCEDURE proc_cre_tds (p_bu                VARCHAR2,
"
"					     p_user              VARCHAR2,
"
"					     p_doc_no            VARCHAR2,
"
"					     p_doc_pfx           VARCHAR2,
"
"					     p_plnt              VARCHAR2,
"
"					     p_tds_flag   IN OUT VARCHAR2,
"
"						 p_adv_tds           VARCHAR2 DEFAULT NULL
"
"						 )
"
"IS
"
"   CURSOR c_hd
"
"   IS
"
"      SELECT *
"
"        FROM suplr_doc_hd
"
"       WHERE suphd_bu = p_bu
"
"         AND suphd_doc_no = p_doc_no
"
"         AND suphd_pfx = p_doc_pfx;
"
"
"
"   cr_hd            c_hd%ROWTYPE;
"
"   v_cnt            NUMBER;
"
"   v_rcm            VARCHAR2(20);
"
"   v_base_curr      VARCHAR2(10):=func_find_base_currency(p_bu);
"
"   v_apm_proj_req   VARCHAR2(1) := func_find_apm_prj_req_flag(p_bu);
"
"BEGIN
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF p_tds_flag = 'Y' AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('PRW','STW','SCOO','LCW','POW') THEN
"
"
"
"	 DECLARE
"
"       CURSOR c1
"
"       IS
"
"	      SELECT SUM(v_cnt)v_cnt
"
"		    FROM(
"
"		  SELECT COUNT (*) v_cnt
"
"			FROM suplr_doc_ln
"
"		   WHERE supln_bu = p_bu
"
"			 AND supln_doc_no = p_doc_no
"
"			 AND supln_receipt_no IS NOT NULL
"
"			 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type NOT IN('POW')
"
"		  UNION ALL
"
"          SELECT COUNT (*) v_cnt
"
"			FROM suplr_doc_ln
"
"		   WHERE supln_bu = p_bu
"
"			 AND supln_doc_no = p_doc_no
"
"			 AND supln_po_no IS NOT NULL
"
"			 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('POW'));
"
"
"
"	   CURSOR c2
"
"       IS
"
"		  SELECT COUNT (*) v_cnt
"
"			FROM suplr_doc_ln,suplr_doc_proc_ln
"
"		   WHERE supln_bu = p_bu
"
"		     AND supln_bu = sdpl_bu
"
"			 AND supln_seq_no = sdpl_seq_no
"
"             AND supln_doc_no = sdpl_doc_no
"
"			 AND supln_doc_no = p_doc_no
"
"			 AND supln_type = 'I';
"
"
"
"           cr1   c1%ROWTYPE;
"
"		   cr2   c2%ROWTYPE;
"
"	   BEGIN
"
"		   OPEN c1;
"
"
"
"		   FETCH c1 INTO cr1;
"
"
"
"		   OPEN c2;
"
"
"
"		   FETCH c2 INTO cr2;
"
"
"
"		   IF  cr1.v_cnt = 0 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type NOT IN('SCOO')
"
"		   THEN
"
"	      	raise_application_error(-20999,'Document will not be Proceed without Reference line.');
"
"		   END IF;
"
"
"
"		   IF  cr2.v_cnt = 0 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('SCOO')
"
"		   THEN
"
"	      	raise_application_error(-20999,'Line Process details must be entered');
"
"		   END IF;
"
"
"
"		   CLOSE c2;
"
"
"
"		   CLOSE C1;
"
"		END;
"
"   END IF;
"
"
"
"   IF cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('SCOW') THEN
"
"	   DECLARE
"
"		  CURSOR c1
"
"		  IS
"
"		  SELECT COUNT (*) v_cnt
"
"			FROM suplr_doc_proc_ln
"
"		   WHERE sdpl_bu = p_bu
"
"			 AND sdpl_doc_no = p_doc_no
"
"			 AND sdpl_receipt_no IS NOT NULL;
"
"
"
"		 cr1   c1%ROWTYPE;
"
"	   BEGIN
"
"		   OPEN c1;
"
"
"
"		   FETCH c1 INTO cr1;
"
"
"
"		   IF  cr1.v_cnt = 0
"
"		   THEN
"
"			  raise_application_error(-20999,'Document will not be Proceed without Reference line.');
"
"		   END IF;
"
"
"
"		   CLOSE C1;
"
"	   END;
"
"   END IF;
"
"
"
"   BEGIN
"
"      SELECT COUNT(*)cnt
"
"		INTO v_cnt
"
"		FROM suplr_doc_ln
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no;
"
"
"
"	  IF v_cnt = 0 THEN
"
"		 raise_application_error(-20352,'ICM');
"
"	  END IF;
"
"
"
"	  SELECT COUNT(*)cnt
"
"		INTO v_cnt
"
"		FROM suplr_doc_ln
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no
"
"		 AND supln_ap_cc_code IS NULL;
"
"
"
"	  IF v_cnt > 0 AND p_tds_flag = 'Y' THEN
"
"		 raise_application_error(-20999,'CPC Code not found.');
"
"	  END IF;
"
"   END;
"
"
"
"   IF cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('SCOW') THEN
"
"       DECLARE
"
"	      CURSOR c1
"
"	      IS
"
"		  SELECT COUNT (*) v_cnt
"
"			FROM suplr_doc_proc_ln
"
"		   WHERE sdpl_bu = p_bu
"
"			 AND sdpl_doc_no = p_doc_no
"
"			 AND sdpl_receipt_no IS NOT NULL;
"
"
"
"		 cr1   c1%ROWTYPE;
"
"	   BEGIN
"
"		   OPEN c1;
"
"
"
"		   FETCH c1 INTO cr1;
"
"
"
"		   IF  cr1.v_cnt = 0
"
"		   THEN
"
"			  raise_application_error(-20999,'Document will not be Proceed without Reference line.');
"
"		   END IF;
"
"
"
"		   CLOSE C1;
"
"	   END;
"
"   END IF;
"
"
"
"   --proc_insert_child_sup_bill_ded(p_bu,cr_hd.suphd_suplr_id);
"
"   proc_validate_bills(p_bu,p_doc_pfx,p_doc_no);
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF cr_hd.suphd_grn_refer = 'EXP'
"
"   THEN
"
"      UPDATE suplr_doc_hd
"
"         SET suphd_lm_bfr_disc_amt = 0, suphd_lm_disc_amt = 0
"
"       WHERE suphd_bu = p_bu
"
"         AND suphd_doc_no = p_doc_no
"
"         AND suphd_pfx = p_doc_pfx;
"
"   END IF;
"
"
"
"   IF cr_hd.suphd_suplr_type <> 'R' AND cr_hd.suphd_alow_rcm_tax = 'Y'  AND cr_hd.suphd_currency = v_base_curr
"
"   THEN
"
"	  UPDATE suplr_doc_hd
"
"	     SET suphd_alow_rcm_tax = 'N'
"
"	   WHERE suphd_bu = p_bu
"
"		 AND suphd_pfx = p_doc_pfx
"
"		 AND suphd_doc_no = p_doc_no;
"
"   ELSIF cr_hd.suphd_suplr_type = 'R' AND cr_hd.suphd_alow_rcm_tax = 'N'  AND cr_hd.suphd_currency = v_base_curr
"
"   THEN
"
"      UPDATE suplr_doc_ln
"
"	     SET supln_gst_rev_tax_flag = 'N',supln_gst_rev_tax_cat = NULL
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_doc_no = p_doc_no;
"
"   END IF;
"
"
"
"   IF (cr_hd.suphd_suplr_type = 'U' OR cr_hd.suphd_suplr_type = 'R' AND cr_hd.suphd_alow_rcm_tax = 'Y')
"
"   AND cr_hd.suphd_currency = v_base_curr
"
"   THEN
"
"      BEGIN
"
"	     SELECT grtc_cat_id
"
"		   INTO v_rcm
"
"		   FROM gst_rev_tax_cat
"
"		  WHERE grtc_bu = p_bu
"
"            AND grtc_active_flag = 'Y'
"
"			AND grtc_default_flag = 'Y';
"
"	     EXCEPTION WHEN OTHERS THEN NULL;
"
"	  END;
"
"	  UPDATE suplr_doc_ln
"
"		 SET supln_gst_rev_tax_cat = v_rcm
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_hsn_code IS NOT NULL
"
"		 AND supln_tax_pct > 0
"
"		 AND supln_gst_rev_tax_cat IS NULL
"
"		 AND supln_doc_no = p_doc_no;
"
"
"
"	  UPDATE suplr_doc_ln
"
"		 SET supln_gst_rev_tax_flag = 'Y'
"
"	   WHERE supln_bu = p_bu
"
"		 AND supln_hsn_code IS NOT NULL
"
"		 AND supln_tax_pct > 0
"
"		 AND supln_doc_no = p_doc_no;
"
"   END IF;
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF p_tds_flag = 'Y'
"
"   THEN
"
"       DECLARE
"
"         CURSOR c1
"
"         IS
"
"           SELECT suplr_tds_appl
"
"             FROM suppliers
"
"            WHERE suplr_bu = p_bu
"
"              AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"              AND suplr_status = 'A';
"
"
"
"         CURSOR c3
"
"         IS
"
"           SELECT supln_doc_no,
"
"                  supln_prod_id,
"
"                  supln_prod_rev,
"
"                  supln_tds_us_id
"
"             FROM suplr_doc_ln
"
"            WHERE supln_bu = p_bu
"
"              AND supln_doc_no = p_doc_no;
"
"
"
"         cr1        c1%ROWTYPE;
"
"		 v_tds_src  VARCHAR2(1);
"
"		 v_us_id    VARCHAR2(10);
"
"       BEGIN
"
"
"
"		  SELECT apmc_tds_src
"
"		    INTO v_tds_src
"
"            FROM apm_control
"
"           WHERE apmc_bu= p_bu;
"
"
"
"           FOR cr3 IN c3
"
"           LOOP
"
"              OPEN c1;
"
"
"
"              FETCH c1 INTO cr1;
"
"				  IF cr1.suplr_tds_appl = 'Y'  AND cr_hd.suphd_grn_refer IN ('PR','EXP','LC','PO')
"
"				  THEN
"
"				      IF v_tds_src <> 'S'
"
"				      THEN
"
"					      BEGIN
"
"							   SELECT prod_tds_us_id
"
"								 INTO v_us_id
"
"								 FROM products
"
"      	                        WHERE prod_bu = p_bu
"
"      	                          AND prod_id = cr3.supln_prod_id
"
"					              AND prod_rev = cr3.supln_prod_rev;
"
"					        EXCEPTION WHEN NO_DATA_FOUND THEN v_us_id := NULL;
"
"				          END;
"
"
"
"							  UPDATE suplr_doc_ln
"
"								 SET supln_tds_us_id = v_us_id
"
"							   WHERE supln_bu = p_bu
"
"								 AND supln_doc_no = p_doc_no
"
"								 AND supln_prod_id = cr3.supln_prod_id
"
"								 AND supln_prod_rev = cr3.supln_prod_rev
"
"								 AND supln_tds_us_id IS NULL;
"
"					  ELSE
"
"                       	   BEGIN
"
"				              SELECT sbd_tds_us_id
"
"							    INTO v_us_id
"
"								FROM suplr_bill_ded
"
"							   WHERE sbd_bu = p_bu
"
"								 AND sbd_suplr_id = cr_hd.suphd_suplr_id
"
"								 AND sbd_fin_year = cr_hd.suphd_doc_year
"
"								 AND ROWNUM = 1;
"
"							  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"								 v_us_id := NULL;
"
"						   END;
"
"
"
"				          UPDATE suplr_doc_ln
"
"				             SET supln_tds_us_id = v_us_id
"
"				           WHERE supln_bu = p_bu
"
"				             AND supln_doc_no = p_doc_no
"
"							 AND supln_contra_flag = 'N'
"
"							 AND supln_tds_us_id IS NULL;
"
"		              END IF;
"
"				   ELSIF cr1.suplr_tds_appl = 'N'
"
"				   THEN
"
"					   UPDATE suplr_doc_ln
"
"						  SET supln_tds_us_id = NULL
"
"						WHERE supln_bu = p_bu
"
"						  AND supln_doc_no = p_doc_no
"
"						  AND supln_prod_id = cr3.supln_prod_id
"
"						  AND supln_prod_rev = cr3.supln_prod_rev;
"
"				   END IF;
"
"              CLOSE c1;
"
"           END LOOP;
"
"       END;
"
"
"
"   END IF;
"
"
"
"   IF p_tds_flag = 'Y' --AND cr_hd.suphd_tds_exmp_flag = 'N'
"
"   THEN
"
"	   DECLARE
"
"		   CURSOR c1
"
"		   IS
"
"			  SELECT suplr_tds_appl
"
"				FROM suppliers
"
"			   WHERE suplr_bu = p_bu
"
"				 AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"				 AND suplr_party_type NOT IN('N','A')
"
"				 AND suplr_status = 'A';
"
"
"
"		  cr1   c1%ROWTYPE;
"
"	   BEGIN
"
"
"
"		   OPEN C1;
"
"
"
"		   FETCH C1 INTO CR1;
"
"
"
"		   IF C1%FOUND AND CR1.suplr_tds_appl = 'T' AND v_base_curr = cr_hd.suphd_currency
"
"		   THEN
"
"			  raise_application_error (-20999,'Select the TDS Applicable type.');
"
"		   END IF;
"
"
"
"		   /*IF C1%FOUND AND CR1.suplr_tds_appl = 'Y' THEN
"
"		      UPDATE suplr_doc_ln
"
"			     SET supln_tds_appl_flag = 'N',
"
"				     supln_tcs_us_id     = NULL,
"
"                     supln_tds_us_id     = NULL
"
"			   WHERE supln_bu = p_bu
"
"                 AND supln_dr_cr = 'CR'
"
"                 AND supln_doc_no = p_doc_no;
"
"		   END IF;*/
"
"		   IF v_base_curr <> cr_hd.suphd_currency
"
"		   THEN
"
"		      UPDATE suplr_doc_ln
"
"			     SET supln_tds_appl_flag = 'N',
"
"				     supln_tcs_us_id     = NULL,
"
"                     supln_tds_us_id     = NULL
"
"			   WHERE supln_bu = p_bu
"
"                 AND supln_doc_no = p_doc_no;
"
"		   END IF;
"
"		   CLOSE C1;
"
"	   END;
"
"   END IF;
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF p_tds_flag = 'Y' THEN
"
"      DECLARE
"
"	   CURSOR c1
"
"	   IS
"
"		  SELECT Count(*) cnt
"
"			FROM suplr_doc_ln,classes
"
"		   WHERE supln_bu = p_bu
"
"			 AND supln_doc_no = p_doc_no
"
"			 AND supln_tax_exmpt_flag = 'G'
"
"			 AND class_bu = supln_bu
"
"			 AND class_type <> 'IG'
"
"			 AND supln_prod_cls = class_id
"
"			 AND supln_hsn_code IS NULL
"
"			 AND supln_bfcry_id IS NULL;
"
"	    cr1  c1%ROWTYPE;
"
"
"
"	  BEGIN
"
"		OPEN c1;
"
"
"
"		FETCH c1 INTO cr1;
"
"
"
"		IF cr1.cnt > 0 AND cr_hd.suphd_currency = v_base_curr THEN
"
"			raise_application_error (-20999,'HSN/SAC Code must be entered.');
"
"		END IF;
"
"
"
"		CLOSE C1;
"
"	  END;
"
"   END IF;
"
"
"
"   proc_chk_hsn_sac_code(p_bu,p_doc_no,cr_hd.suphd_grn_refer);
"
"
"
"   IF p_tds_flag = 'Y'
"
"   THEN
"
"      DECLARE
"
"         CURSOR c1
"
"         IS
"
"            SELECT supln_seq_no
"
"              FROM suplr_doc_hd,suplr_doc_ln
"
"             WHERE suphd_bu = p_bu
"
"               AND suphd_grn_refer IN ('PR','EXP','LC','PO')
"
"               AND suphd_pfx = p_doc_pfx
"
"               AND suphd_doc_no = p_doc_no
"
"               AND supln_bu = suphd_bu
"
"			   AND suphd_jrnl_flag = 'N'
"
"			   AND supln_doc_no = suphd_doc_no
"
"			   AND suphd_tds_exmp_flag = 'N'
"
"			   AND supln_contra_flag = 'N'
"
"			   AND supln_dr_cr = 'DR'
"
"			   AND supln_bfcry_id IS NULL
"
"			   AND supln_tds_us_id IS NULL
"
"			   AND supln_tds_appl_flag = 'Y'
"
"			   AND supln_type = 'I'
"
"			   AND NOT EXISTS(SELECT 1
"
"						   FROM classes
"
"						  WHERE class_bu = supln_bu
"
"							AND class_id = supln_prod_cls
"
"							AND class_type = 'IG')
"
"			   AND EXISTS(SELECT 1
"
"					 	    FROM suppliers
"
"						   WHERE suplr_bu = suphd_bu
"
"						     AND suplr_suplr_id = suphd_suplr_id
"
"						     AND suplr_tds_appl = 'Y')
"
"			UNION ALL
"
"            SELECT supln_seq_no
"
"              FROM suplr_doc_hd,suplr_doc_ln
"
"             WHERE suphd_bu = p_bu
"
"               AND suphd_grn_refer IN ('PR','EXP','LC','PO')
"
"               AND suphd_pfx = p_doc_pfx
"
"               AND suphd_doc_no = p_doc_no
"
"               AND supln_bu = suphd_bu
"
"			   AND suphd_jrnl_flag = 'N'
"
"			   AND supln_dr_cr = 'DR'
"
"			   AND supln_doc_no = suphd_doc_no
"
"			   AND suphd_tds_exmp_flag = 'N'
"
"			   AND supln_contra_flag = 'N'
"
"			   AND supln_tds_appl_flag = 'Y'
"
"			   AND supln_bfcry_id IS NULL
"
"			   AND supln_tds_us_id IS NULL
"
"			   AND supln_type <> 'I'
"
"			   AND NOT EXISTS(SELECT 1
"
"						   FROM classes
"
"						  WHERE class_bu = supln_bu
"
"							AND class_id = supln_prod_cls
"
"							AND class_type = 'IG')
"
"			   AND NOT EXISTS(SELECT 1
"
"                                FROM gl_accts
"
"							   WHERE glac_bu = p_bu
"
"							     AND glac_acct = supln_ap_gl_acct
"
"							     AND glac_tds_flag = 'N')
"
"			   AND EXISTS(SELECT 1
"
"					 	    FROM suppliers
"
"						   WHERE suplr_bu = suphd_bu
"
"						     AND suplr_suplr_id = suphd_suplr_id
"
"						     AND suplr_tds_appl = 'Y');
"
"         cr1   c1%ROWTYPE;
"
"		 v_cnt NUMBER;
"
"      BEGIN
"
"         OPEN C1;
"
"
"
"         FETCH C1 INTO CR1;
"
"
"
"         IF C1%FOUND AND v_base_curr = cr_hd.suphd_currency
"
"         THEN
"
"            raise_application_error (-20999, 'TDS u/s No. must be entered for line no.- '||cr1.supln_seq_no);
"
"         END IF;
"
"
"
"         CLOSE C1;
"
"      END;
"
"   END IF;
"
"
"
"   DECLARE
"
"		CURSOR c1
"
"		IS
"
"		   SELECT sdpl_subseq_no
"
"			 FROM suplr_doc_hd,suplr_doc_proc_ln,suppliers
"
"			WHERE suphd_bu = p_bu
"
"			  AND suphd_grn_refer = 'SCO'
"
"			  AND suphd_pfx = p_doc_pfx
"
"			  AND suphd_doc_no = p_doc_no
"
"              AND suphd_tds_exmp_flag = 'N'
"
"              AND suplr_bu = p_bu
"
"			  AND suplr_suplr_id = suphd_suplr_id
"
"			  AND suplr_tds_appl = 'Y'
"
"			  AND sdpl_bu = p_bu
"
"			  AND sdpl_plnt = suphd_plant
"
"			  AND sdpl_doc_no = p_doc_no
"
"			  AND sdpl_tds_us_id IS NULL
"
"			  AND sdpl_tds_appl_flag = 'Y';
"
"
"
"		cr1   c1%ROWTYPE;
"
"   BEGIN
"
"		OPEN C1;
"
"
"
"		FETCH C1 INTO CR1;
"
"
"
"		IF C1%FOUND AND p_tds_flag = 'Y' AND v_base_curr = cr_hd.suphd_currency
"
"		THEN
"
"		   raise_application_error (-20999,'TDS u/s No. must be entered for line no.- '||cr1.sdpl_subseq_no);
"
"		END IF;
"
"
"
"		CLOSE C1;
"
"   END;
"
"
"
"   ---Process for update TDS not applicable for tax class---
"
"   DECLARE
"
"     CURSOR c1
"
"	 IS
"
"	   SELECT suplr_currency,tus_id,supln_seq_no
"
"	     FROM suplr_doc_ln,tds_under_sections,suppliers
"
"	    WHERE supln_bu = p_bu
"
"		  AND supln_doc_no = p_doc_no
"
"		  AND supln_tds_appl_flag = 'Y'
"
"		  AND tus_bu = supln_bu
"
"	      AND tus_id = supln_tds_us_id
"
"		  AND suplr_party_type = 'T'
"
"          AND suplr_bu = supln_bu
"
"		  AND cr_hd.suphd_grn_refer <> 'SCO'
"
"		  AND suplr_currency <> cr_hd.suphd_currency
"
"	      AND (tus_ih_suplr_id = suplr_suplr_id
"
"	      OR  tus_cf_suplr_id = suplr_suplr_id
"
"	      OR  tus_wop_suplr_id = suplr_suplr_id
"
"	      OR  tus_spec_id = suplr_suplr_id)
"
"	   UNION ALL
"
"	   SELECT suplr_currency,tus_id,Sdpl_subseq_no
"
"	     FROM suplr_doc_proc_ln,tds_under_sections,suppliers
"
"	    WHERE sdpl_bu = p_bu
"
"		  AND sdpl_doc_no = p_doc_no
"
"		  AND sdpl_tds_appl_flag = 'Y'
"
"		  AND tus_bu = sdpl_bu
"
"	      AND tus_id = sdpl_tds_us_id
"
"		  AND suplr_party_type = 'T'
"
"		  AND suplr_tds_appl = 'Y'
"
"          AND suplr_bu = sdpl_bu
"
"          AND cr_hd.suphd_grn_refer = 'SCO'
"
"          AND suplr_currency <> cr_hd.suphd_currency
"
"	      AND (tus_ih_suplr_id = suplr_suplr_id
"
"	      OR  tus_cf_suplr_id = suplr_suplr_id
"
"	      OR  tus_wop_suplr_id = suplr_suplr_id
"
"	      OR  tus_spec_id = suplr_suplr_id);
"
"
"
"     cr1     	c1%ROWTYPE;
"
"     v_cnt   	NUMBER;
"
"	 v_tds_appl VARCHAR2(1);
"
"   BEGIN
"
"      SELECT suplr_tds_appl
"
"	    INTO v_tds_appl
"
"		FROM suppliers
"
"	   WHERE suplr_bu = p_bu
"
"		 AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"       SELECT SUM(cnt)cnt
"
"	     INTO v_cnt
"
"	     FROM (SELECT COUNT(*)cnt
"
"				 FROM suplr_doc_ln,tds_under_sections,suppliers
"
"				WHERE supln_bu = p_bu
"
"				  AND supln_doc_no = p_doc_no
"
"				  AND supln_tds_appl_flag = 'Y'
"
"				  AND tus_bu = supln_bu
"
"				  AND tus_id = supln_tds_us_id
"
"				  AND supln_tds_us_id IS NOT NULL
"
"				  AND suplr_party_type = 'T'
"
"				  AND suplr_bu = supln_bu
"
"				  AND supln_contra_flag = 'N'
"
"				  AND suplr_currency = v_base_curr
"
"				  AND (tus_ih_suplr_id = suplr_suplr_id
"
"				  OR  tus_cf_suplr_id = suplr_suplr_id
"
"				  OR  tus_wop_suplr_id = suplr_suplr_id
"
"				  OR  tus_spec_id = suplr_suplr_id)
"
"				  AND NOT EXISTS
"
"					(SELECT 1
"
"					   FROM suplr_doc_proc_ln
"
"					  WHERE sdpl_bu = supln_bu
"
"						AND sdpl_plnt = supln_plnt
"
"						AND sdpl_doc_no = supln_doc_no
"
"						AND sdpl_seq_no = supln_seq_no)
"
"				  AND NOT EXISTS(SELECT 1
"
"						           FROM classes
"
"						          WHERE class_bu = supln_bu
"
"							        AND class_id = supln_prod_cls
"
"							        AND class_type IN('IG'))
"
"			   UNION ALL
"
"			   SELECT COUNT(*)cnt
"
"				 FROM suplr_doc_proc_ln,tds_under_sections
"
"				WHERE sdpl_bu = p_bu
"
"				  AND sdpl_doc_no = p_doc_no
"
"				  AND sdpl_tds_appl_flag = 'Y'
"
"				  AND tus_bu = sdpl_bu
"
"				  AND sdpl_tds_us_id IS NOT NULL
"
"				  AND tus_id = sdpl_tds_us_id
"
"				  AND NOT EXISTS(SELECT 1
"
"						           FROM classes
"
"						          WHERE class_bu = sdpl_bu
"
"							        AND class_id = sdpl_cls_id
"
"							        AND class_type IN('IG')));
"
"
"
"	   IF v_cnt = 0	AND p_tds_flag = 'Y' AND cr_hd.suphd_tds_exmp_flag = 'N' AND v_tds_appl = 'Y'
"
"	      AND cr_hd.suphd_currency = v_base_curr
"
"	   THEN
"
"	      raise_application_error(-20999,'Please select TDS Applicable type.');
"
"	   END IF;
"
"
"
"	   IF v_base_curr = cr_hd.suphd_currency
"
"	   THEN
"
"		   UPDATE suplr_doc_ln
"
"			  SET supln_tds_us_id = NULL
"
"			WHERE supln_bu = p_bu
"
"			  AND supln_doc_no = p_doc_no
"
"			  AND supln_type <> 'C'
"
"			  AND EXISTS(SELECT 1
"
"						   FROM classes
"
"						  WHERE class_bu = supln_bu
"
"							AND class_id = supln_prod_cls
"
"							AND class_type = 'IG');
"
"
"
"           UPDATE suplr_doc_ln
"
"			  SET supln_tds_us_id = NULL
"
"			WHERE supln_bu = p_bu
"
"			  AND supln_doc_no = p_doc_no
"
"			  AND supln_tds_us_id IS NOT NULL
"
"			  AND supln_tds_appl_flag = 'N'
"
"              AND supln_contra_flag = 'N';
"
"	   END IF;
"
"
"
"	   OPEN c1;
"
"
"
"	   FETCH c1 INTO cr1;
"
"
"
"	   IF c1%FOUND THEN
"
"	      raise_application_error(-20999,'TDS u/s Currency does not match.-'||cr1.tus_id);
"
"	   END IF;
"
"
"
"	   CLOSE c1;
"
"
"
"   END;
"
"
"
"   DECLARE
"
"      CURSOR C122
"
"      IS
"
"         SELECT 1
"
"           FROM suplr_doc_hd_hist_vw1
"
"          WHERE suphd_bu = p_bu
"
"            AND suphd_suplr_id = cr_hd.suphd_suplr_id
"
"            AND suphd_status IN ('P', 'O','N')
"
"            AND suphd_suplr_doc_no = cr_hd.suphd_suplr_doc_no
"
"			AND suphd_doc_no <> p_doc_no
"
"            AND suphd_doc_type = cr_hd.suphd_doc_type
"
"            AND suphd_doc_type IN ( 'CN','SB','PTN');
"
"
"
"      cr122   c122%ROWTYPE;
"
"   BEGIN
"
"      OPEN c122;
"
"
"
"      FETCH c122 INTO cr122;
"
"
"
"      IF c122%FOUND AND p_tds_flag = 'Y'
"
"      THEN
"
"         raise_application_error (-20999, 'Bill No. already Exist.');
"
"      END IF;
"
"
"
"      CLOSE c122;
"
"   END;
"
"
"
"
"
"   DECLARE
"
"      CURSOR C1
"
"      IS
"
"         SELECT glmctrl_gst_usage
"
"           FROM glm_control
"
"          WHERE glmctrl_bu = p_bu;
"
"
"
"      cr1   c1%ROWTYPE;
"
"   BEGIN
"
"      OPEN c1;
"
"
"
"      FETCH c1 INTO cr1;
"
"
"
"      IF c1%FOUND
"
"      THEN
"
"         IF CR1.glmctrl_gst_usage = 'N'
"
"         THEN
"
"            raise_application_error (-20999,'Please check the GST/VAT Control.');
"
"         END IF;
"
"      END IF;
"
"
"
"      CLOSE c1;
"
"   END;
"
"
"
"   IF cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN ('SCOO') AND p_tds_flag = 'Y'
"
"   THEN
"
"      UPDATE suplr_doc_proc_ln
"
"         SET sdpl_pc_flag = 'Y'
"
"       WHERE sdpl_bu = p_bu
"
"         AND sdpl_doc_no = p_doc_no;
"
"   ELSIF cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN ('SCOO') AND p_tds_flag = 'N'
"
"   THEN
"
"      UPDATE suplr_doc_proc_ln
"
"         SET sdpl_pc_flag = 'N'
"
"       WHERE sdpl_bu = p_bu
"
"         AND sdpl_doc_no = p_doc_no;
"
"   END IF;
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"		proc_upd_amount_apm1010(p_bu,
"
"		                        p_doc_pfx,
"
"								p_doc_no,
"
"								cr_hd.suphd_currency,
"
"								cr_hd.suphd_doc_type,
"
"								cr_hd.suphd_grn_refer,
"
"                                cr_hd.suphd_suplr_id);
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF cr_hd.suphd_doc_type NOT IN ( 'CN','SB')
"
"   THEN
"
"      raise_application_error (-20999,'Deductions not applicable for this document type.');
"
"   END IF;
"
"
"
"   IF cr_hd.suphd_currency <> v_base_curr
"
"   THEN
"
"      raise_application_error (-20999,'Deductions not applicable for Foreign Currency');
"
"   END IF;
"
"
"
"   IF cr_hd.suphd_suplr_doc_no IS NULL
"
"   THEN
"
"      raise_application_error (-20999, 'Bill No. must be entered.');
"
"   END IF;
"
"
"
"   IF cr_hd.suphd_suplr_doc_date IS NULL
"
"   THEN
"
"      raise_application_error (-20999, 'Bill Date must be entered.');
"
"   END IF;
"
"
"
"   IF cr_hd.suphd_grn_refer IN ('PR','SCO','ST') AND p_tds_flag = 'Y'
"
"   THEN
"
"      proc_sum_lm_disc_apex (p_bu, p_doc_pfx, p_doc_no);
"
"
"
"      proc_sum_disc_apex (p_bu, p_doc_pfx, p_doc_no);
"
"   END IF;
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   /* Supplier Bill Round off control in CFG0050*/
"
"   DECLARE
"
"      v_bill_rnd   NUMBER;
"
"   BEGIN
"
"      v_bill_rnd := func_find_party_bill_rnd (p_bu, cr_hd.suphd_suplr_id,1);
"
"
"
"      IF cr_hd.suphd_sc_tot_amt = 0
"
"      THEN
"
"         UPDATE suplr_doc_hd
"
"            SET suphd_sc_tot_amt = ROUND (cr_hd.suphd_bill_amt, v_bill_rnd)
"
"          WHERE suphd_bu = p_bu
"
"            AND suphd_pfx = p_doc_no
"
"            AND suphd_doc_no = p_doc_no;
"
"      ELSE
"
"         UPDATE suplr_doc_hd
"
"            SET suphd_sc_tot_amt = ROUND (cr_hd.suphd_bill_amt, v_bill_rnd)
"
"          WHERE suphd_bu = p_bu
"
"            AND suphd_pfx = p_doc_no
"
"            AND suphd_doc_no = p_doc_no;
"
"      END IF;
"
"
"
"      IF cr_hd.suphd_rnd_off_amt = 0
"
"      THEN
"
"         UPDATE suplr_doc_hd
"
"            SET suphd_rnd_off_amt = (cr_hd.suphd_bill_amt - cr_hd.suphd_sc_tot_amt) * -1
"
"          WHERE suphd_bu = p_bu
"
"            AND suphd_pfx = p_doc_no
"
"            AND suphd_doc_no = p_doc_no;
"
"      END IF;
"
"   END;
"
"
"
"   OPEN c_hd;
"
"
"
"   FETCH c_hd INTO cr_hd;
"
"
"
"   CLOSE c_hd;
"
"
"
"   IF cr_hd.suphd_sc_tot_amt IS NULL OR cr_hd.suphd_sc_tot_amt = 0
"
"   THEN
"
"      raise_application_error (-20999, 'Bill Amt is Zero');
"
"   END IF;
"
"
"
"   DECLARE
"
"      CURSOR c1
"
"      IS
"
"         SELECT 1
"
"           FROM suplr_doc_hd, suplr_doc_ln
"
"          WHERE suphd_bu = supln_bu
"
"            AND suphd_doc_no = supln_doc_no
"
"            AND suphd_bu = p_bu
"
"            AND suphd_pfx = p_doc_pfx
"
"            AND suphd_doc_no = p_doc_no
"
"            AND supln_dept_id IS NULL
"
"            AND EXISTS
"
"                   (SELECT 1
"
"                      FROM apm_control
"
"                     WHERE apmc_bu = p_bu
"
"                       AND ((apmc_pur_acct_src = '02' AND suphd_grn_refer IN ('PR')) OR (apmc_sc_acct_src = '02' AND suphd_grn_refer IN ('SCO'))));
"
"
"
"      cr1   c1%ROWTYPE;
"
"   BEGIN
"
"      OPEN c1;
"
"
"
"      FETCH c1 INTO cr1;
"
"
"
"      IF c1%FOUND
"
"      THEN
"
"         raise_application_error (-20999, 'Department must be entered.');
"
"      END IF;
"
"
"
"      CLOSE c1;
"
"   END;
"
"
"
"   DECLARE
"
"      CURSOR c1
"
"      IS
"
"         SELECT suplr_tds_appl,suplr_tds_flag
"
"           FROM suppliers
"
"          WHERE suplr_bu = p_bu AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"      CURSOR c2
"
"      IS
"
"         SELECT 1
"
"           FROM suppliers
"
"          WHERE suplr_bu = p_bu
"
"            AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"            AND suplr_pan_no IS NOT NULL;
"
"
"
"
"
"      CURSOR C3
"
"      IS
"
"         SELECT COUNT (*) v_count
"
"           FROM suplr_doc_ln, products
"
"          WHERE supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no
"
"            AND supln_bu = prod_bu
"
"            AND supln_prod_id = prod_id
"
"            AND supln_prod_rev = prod_rev
"
"            AND prod_stocked = 'Y';
"
"
"
"      CURSOR C4
"
"      IS
"
"         SELECT 1
"
"           FROM suplr_doc_ln
"
"          WHERE supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no;
"
"            /*AND (supln_gen_flag = 'Y'
"
"                 OR supln_ap_gl_acct IN
"
"                       (SELECT glac_acct
"
"                          FROM gl_accts
"
"                         WHERE glac_bu = p_bu
"
"                           AND glac_tds_us_id IS NOT NULL
"
"                           AND glac_tds_flag = 'Y'
"
"                           AND glac_pan_no IS NOT NULL));*/
"
"
"
"      CURSOR C5
"
"      IS
"
"         SELECT tus_ded_val_on
"
"           FROM tds_under_sections, suplr_doc_ln
"
"          WHERE tus_bu = p_bu
"
"            AND tus_bu = supln_bu
"
"            AND tus_id = supln_tds_us_id
"
"            AND supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no
"
"         UNION ALL
"
"         SELECT tus_ded_val_on
"
"           FROM tds_under_sections, suplr_doc_ln
"
"          WHERE tus_bu = p_bu
"
"            AND tus_bu = supln_bu
"
"            AND tus_id = supln_tds_us_id
"
"            AND supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no;
"
"
"
"      cr1              c1%ROWTYPE;
"
"      cr2              c2%ROWTYPE;
"
"      cr3              c3%ROWTYPE;
"
"      cr4              c4%ROWTYPE;
"
"      cr5              c5%ROWTYPE;
"
"      v_cnt            NUMBER;
"
"      v_type           VARCHAR2 (1);
"
"      v_count          NUMBER (10);
"
"      v_count1         NUMBER (10);
"
"      v_count2         NUMBER (10);
"
"      v_ref            VARCHAR2 (2000);
"
"      v_ref1           VARCHAR2 (2000);
"
"      v_ref2           VARCHAR2 (2000);
"
"      v_pan_avl        VARCHAR2 (1);
"
"      v_apply_tds      VARCHAR2 (1);
"
"      post_alert       NUMBER;
"
"      v_tds_appl       VARCHAR2 (1);
"
"      v_tds_flag       VARCHAR2 (1) := 'N';
"
"	  v_tds_flag1      VARCHAR2 (1) := 'N';
"
"      v_esi_flag       VARCHAR2 (1) := 'N';
"
"      v_pf_flag        VARCHAR2 (1) := 'N';
"
"      v_adv_tds_flag   VARCHAR2 (1) := 'N';
"
"      v_ded_cnt        NUMBER;
"
"      v_non_stk        VARCHAR2 (1) := 'N';
"
"      v_exp_tds        VARCHAR2 (1) := 'N';
"
"   BEGIN
"
"      IF p_tds_flag = 'Y'
"
"      THEN
"
"         IF cr_hd.suphd_grn_refer IN ('PR')
"
"         THEN
"
"            v_type := 'P';
"
"         ELSIF cr_hd.suphd_grn_refer IN ('SCO')
"
"         THEN
"
"            v_type := 'S';
"
"         ELSIF cr_hd.suphd_grn_refer IN ('EXP', 'LC')
"
"         THEN
"
"            v_type := 'E';
"
"         END IF;
"
"
"
"		 IF cr_hd.suphd_grn_refer NOT IN ('ST')
"
"         THEN
"
"			 proc_chk_tds_suplr (p_bu,
"
"								 p_doc_pfx,
"
"								 p_doc_no,
"
"								 cr_hd.suphd_suplr_id,
"
"								 p_tds_flag);
"
"         END IF;
"
"
"
"         OPEN c1;
"
"
"
"         FETCH c1 INTO cr1;
"
"
"
"         IF c1%FOUND
"
"         THEN
"
"            v_tds_appl  := cr1.suplr_tds_appl;
"
"
"
"            IF cr_hd.suphd_grn_refer IN ('PR')
"
"            THEN
"
"               FOR CR1
"
"                  IN (SELECT supln_seq_no
"
"                        FROM suplr_doc_ln
"
"                       WHERE supln_bu = p_bu
"
"                         AND supln_doc_no = p_doc_no
"
"                         --AND supln_plnt = p_plnt
"
"                         AND supln_tds_us_id IS NULL
"
"                         AND EXISTS
"
"                                (SELECT 1
"
"                                   FROM suppliers
"
"                                  WHERE suplr_bu = p_bu
"
"                                    AND suplr_status = 'A'
"
"                                    AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                                    AND suplr_tds_flag = 'Y'))
"
"               LOOP
"
"                  v_ref := v_ref || ',' || cr1.supln_seq_no;
"
"               END LOOP;
"
"
"
"               v_ref := SUBSTR (v_ref, 2, LENGTH (v_ref));
"
"            END IF;
"
"
"
"            IF cr_hd.suphd_grn_refer IN ('SCO')
"
"            THEN
"
"               SELECT COUNT (*)
"
"                 INTO v_count
"
"                 FROM suplr_doc_proc_ln
"
"                WHERE sdpl_bu = p_bu
"
"                  AND sdpl_plnt = p_plnt
"
"                  AND sdpl_doc_no = p_doc_no
"
"                  AND sdpl_tds_us_id IS NULL
"
"                  AND EXISTS
"
"                         (SELECT 1
"
"                            FROM suppliers
"
"                           WHERE suplr_bu = p_bu AND suplr_status = 'A'
"
"                             AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                             AND suplr_tds_flag = 'Y');
"
"
"
"               FOR CR1
"
"                  IN (SELECT sdpl_seq_no, sdpl_subseq_no
"
"                        FROM suplr_doc_proc_ln
"
"                       WHERE sdpl_bu = p_bu
"
"                         AND sdpl_plnt = p_plnt
"
"                         AND sdpl_doc_no = p_doc_no
"
"                         AND sdpl_tds_us_id IS NULL
"
"                         AND EXISTS
"
"                                (SELECT 1
"
"                                   FROM suppliers
"
"                                  WHERE suplr_bu = p_bu
"
"                                    AND suplr_status = 'A'
"
"                                    AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                                    AND suplr_tds_flag = 'Y'))
"
"               LOOP
"
"                  v_ref1 :=
"
"                        v_ref1
"
"                     || ','
"
"                     || cr1.sdpl_seq_no
"
"                     || '/'
"
"                     || cr1.sdpl_subseq_no;
"
"               END LOOP;
"
"
"
"               v_ref1 := SUBSTR (v_ref1, 2, LENGTH (v_ref1));
"
"            END IF;
"
"
"
"            IF cr_hd.suphd_grn_refer IN ('EXP') AND cr_hd.suphd_tds_exmp_flag = 'N'
"
"            THEN
"
"               SELECT COUNT (*)
"
"                 INTO v_count2
"
"                 FROM suplr_doc_ln
"
"                WHERE supln_bu = p_bu
"
"                  AND supln_doc_no = p_doc_no
"
"                  AND supln_tds_us_id IS NULL
"
"                  AND EXISTS
"
"                         (SELECT 1
"
"                            FROM gl_accts
"
"                           WHERE glac_bu = p_bu
"
"                             AND glac_acct = supln_ap_gl_acct
"
"                             AND glac_acct_status = 'A'
"
"                             AND glac_tds_us_id IS NOT NULL);
"
"
"
"               FOR CR1
"
"                  IN (SELECT supln_seq_no
"
"                        FROM suplr_doc_ln
"
"                       WHERE supln_bu = p_bu
"
"                         AND supln_doc_no = p_doc_no
"
"                         AND supln_tds_us_id IS NULL
"
"                         AND EXISTS
"
"                                (SELECT 1
"
"                                   FROM gl_accts
"
"                                  WHERE glac_bu = p_bu
"
"                                    AND glac_acct = supln_ap_gl_acct
"
"                                    AND glac_acct_status = 'A'
"
"                                    AND glac_tds_us_id IS NOT NULL))
"
"               LOOP
"
"                  v_ref2 := v_ref2 || ',' || cr1.supln_seq_no;
"
"               END LOOP;
"
"
"
"               v_ref2 := SUBSTR (v_ref2, 2, LENGTH (v_ref2));
"
"            END IF;
"
"
"
"            DELETE suplr_doc_ln
"
"             WHERE supln_bu = p_bu
"
"               AND supln_doc_no = p_doc_no
"
"               AND supln_tcs_gen_flg = 'N'
"
"               AND supln_gen_flag = 'Y'
"
"			   AND supln_type = 'C';
"
"
"
"            proc_chk_tds_esi_appl (p_bu,
"
"                                   p_doc_pfx,
"
"                                   p_doc_no,
"
"                                   cr_hd.suphd_doc_date,
"
"                                   cr_hd.suphd_suplr_id,
"
"                                   cr_hd.suphd_grn_refer,
"
"                                   v_tds_flag,
"
"                                   v_esi_flag,
"
"                                   v_pf_flag,
"
"                                   v_adv_tds_flag);
"
"
"
"			IF p_adv_tds = 'Y' THEN		--caution alert
"
"               v_adv_tds_flag :='Y';
"
"			ELSE
"
"   			   v_adv_tds_flag :='N';
"
"			END IF;
"
"
"
"            OPEN c2;                                  -- PAN Detail Validation
"
"
"
"            FETCH c2 INTO cr2;
"
"
"
"            IF c2%NOTFOUND
"
"            THEN
"
"               v_pan_avl := 'N';
"
"            ELSE
"
"               v_pan_avl := 'Y';
"
"            END IF;
"
"
"
"            CLOSE c2;
"
"
"
"            IF cr_hd.suphd_reverse_flag = 'N'
"
"            THEN
"
"               IF v_pan_avl = 'Y'
"
"               THEN
"
"                  UPDATE suplr_doc_hd
"
"                     SET suphd_pan_avail = 'W'
"
"                   WHERE suphd_bu = p_bu
"
"                     AND suphd_pfx = p_doc_no
"
"                     AND suphd_doc_no = p_doc_no;
"
"               ELSE
"
"                  UPDATE suplr_doc_hd
"
"                     SET suphd_pan_avail = 'O'
"
"                   WHERE suphd_bu = p_bu
"
"                     AND suphd_pfx = p_doc_no
"
"                     AND suphd_doc_no = p_doc_no;
"
"               END IF;
"
"            END IF;
"
"
"
"			DECLARE
"
"               CURSOR c1
"
"               IS
"
"               SELECT suplr_pan_no pan_no
"
"                 FROM suppliers
"
"                WHERE suplr_bu = p_bu
"
"				  AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"				  AND suplr_pan_no IS NOT NULL;
"
"
"
"                cr1   c1%ROWTYPE;
"
"            BEGIN
"
"				OPEN c1;
"
"
"
"				FETCH c1 INTO cr1;
"
"
"
"				IF c1%FOUND
"
"				THEN
"
"				   IF cr_hd.suphd_pan_avail = 'W'
"
"				   THEN
"
"					  UPDATE suplr_doc_hd
"
"					     SET suphd_pan_no = cr1.pan_no
"
"					   WHERE suphd_bu = p_bu
"
"						 AND suphd_pfx = p_doc_no
"
"						 AND suphd_doc_no = p_doc_no;
"
"				   ELSE
"
"					  UPDATE suplr_doc_hd
"
"					     SET suphd_pan_no = NULL
"
"					   WHERE suphd_bu = p_bu
"
"						 AND suphd_pfx = p_doc_no
"
"						 AND suphd_doc_no = p_doc_no;
"
"				   END IF;
"
"				END IF;
"
"
"
"				CLOSE c1;
"
"            END;
"
"
"
"            v_apply_tds := 'Y';
"
"
"
"            OPEN c3;
"
"
"
"            FETCH C3 INTO cr3;
"
"
"
"            IF cr3.v_count = 0
"
"            THEN
"
"               v_non_stk := 'Y';
"
"            END IF;
"
"
"
"            CLOSE C3;
"
"
"
"
"
"            OPEN c4;
"
"
"
"            FETCH c4 INTO cr4;
"
"
"
"            IF c4%FOUND
"
"            THEN
"
"               v_exp_tds := 'Y';
"
"            END IF;
"
"
"
"            CLOSE c4;
"
"
"
"            IF v_apply_tds = 'Y'
"
"            THEN
"
"               ------proc_upd_tds_us----------
"
"               DECLARE
"
"                  v_tds_us_id   VARCHAR2 (20);
"
"                  v_tds_appl    VARCHAR2 (1);
"
"               BEGIN
"
"                  SELECT suplr_tds_appl
"
"                    INTO v_tds_appl
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"                     AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"                  IF func_find_ap_tds_src (p_bu) = 'S'
"
"                     AND v_tds_appl = 'Y'
"
"                     AND cr_hd.suphd_doc_type = 'SB' AND cr_hd.suphd_tds_exmp_flag = 'N'
"
"                  THEN
"
"                     BEGIN
"
"                        SELECT sbd_tds_us_id
"
"                          INTO v_tds_us_id
"
"                          FROM suplr_bill_ded
"
"                         WHERE sbd_bu = p_bu
"
"                           AND sbd_suplr_id = cr_hd.suphd_suplr_id
"
"                           AND sbd_fin_year = func_find_year (p_bu,TO_DATE (cr_hd.suphd_doc_date));
"
"
"
"                        UPDATE suplr_doc_ln
"
"                           SET supln_tds_us_id = v_tds_us_id
"
"                         WHERE supln_bu = p_bu
"
"                           AND supln_doc_no = p_doc_no
"
"						   AND supln_contra_flag = 'N'
"
"						   AND cr_hd.suphd_grn_refer <> 'SCO';
"
"
"
"                        UPDATE suplr_doc_proc_ln
"
"                           SET sdpl_tds_us_id = v_tds_us_id
"
"                         WHERE sdpl_bu = p_bu
"
"                           AND sdpl_doc_no = p_doc_no
"
"						   AND cr_hd.suphd_grn_refer = 'SCO';
"
"                     EXCEPTION
"
"                        WHEN NO_DATA_FOUND
"
"                        THEN
"
"                           raise_application_error (-20999,'TDS u/s No. not found in Supplier master.');
"
"                        WHEN TOO_MANY_ROWS
"
"                        THEN
"
"                           NULL;
"
"                     END;
"
"                  END IF;
"
"               END;
"
"
"
"               ------------------------------------------------------
"
"               IF v_tds_appl = 'Y' OR v_exp_tds = 'Y'
"
"               THEN
"
"                  IF v_tds_flag = 'Y' AND v_tds_appl = 'Y'
"
"                  THEN
"
"                     IF cr_hd.suphd_tds_exmp_flag = 'N'
"
"                        AND (TO_DATE (cr_hd.suphd_suplr_doc_date) < '19-jun-2021' OR (TO_DATE (cr_hd.suphd_suplr_doc_date) >='19-jun-2021'))
"
"                     THEN
"
"
"
"                        proc_calc_tds_details (
"
"                           p_bu,
"
"                           p_plnt,
"
"                           p_doc_pfx,
"
"                           p_doc_no,
"
"                           TO_DATE (cr_hd.suphd_doc_date),
"
"                           cr_hd.suphd_suplr_id,
"
"                           cr_hd.suphd_pan_avail,
"
"                           cr_hd.suphd_currency,
"
"                           cr_hd.suphd_grn_refer,
"
"                           v_adv_tds_flag,
"
"                           p_user,
"
"                           cr_hd.suphd_plnt_loc_id);
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  DECLARE
"
"                     v_tds_apply   VARCHAR2 (1);
"
"                  BEGIN
"
"                     SELECT suplr_tds_appl
"
"                       INTO v_tds_apply
"
"                       FROM suppliers
"
"                      WHERE suplr_bu = p_bu
"
"                        AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"                     IF cr_hd.suphd_tds_exmp_flag = 'N' AND v_tds_appl = 'Y'
"
"                        AND (TO_DATE (cr_hd.suphd_suplr_doc_date) >='19-jun-2021' AND v_tds_apply = 'Y')
"
"                     THEN
"
"
"
"                        proc_calc_tds_details_grn (
"
"                           p_bu,
"
"                           p_plnt,
"
"                           p_doc_pfx,
"
"                           p_doc_no,
"
"                           TO_DATE (cr_hd.suphd_doc_date),
"
"                           cr_hd.suphd_suplr_id,
"
"                           cr_hd.suphd_pan_avail,
"
"                           cr_hd.suphd_currency,
"
"                           cr_hd.suphd_grn_refer,
"
"                           v_adv_tds_flag,
"
"                           p_user,
"
"                           cr_hd.suphd_plnt_loc_id);
"
"                     END IF;
"
"                  END;
"
"               END IF;
"
"
"
"               IF v_esi_flag = 'Y'
"
"               THEN
"
"                  proc_calc_esi_details (p_bu,
"
"                                         p_plnt,
"
"                                         p_doc_pfx,
"
"                                         p_doc_no,
"
"                                         TO_DATE (cr_hd.suphd_doc_date),
"
"                                         cr_hd.suphd_suplr_id,
"
"                                         cr_hd.suphd_currency,
"
"                                         cr_hd.suphd_grn_refer,
"
"                                         p_user,
"
"                                         cr_hd.suphd_plnt_loc_id);
"
"               END IF;
"
"
"
"               IF v_pf_flag = 'Y'
"
"               THEN
"
"                  proc_calc_pf_details (p_bu,
"
"                                        p_plnt,
"
"                                        p_doc_pfx,
"
"                                        p_doc_no,
"
"                                        TO_DATE (cr_hd.suphd_doc_date),
"
"                                        cr_hd.suphd_suplr_id,
"
"                                        cr_hd.suphd_currency,
"
"                                        cr_hd.suphd_grn_refer,
"
"                                        p_user,
"
"                                        cr_hd.suphd_plnt_loc_id);
"
"               END IF;
"
"
"
"			   IF v_apm_proj_req = 'C' AND cr_hd.suphd_tds_exmp_flag = 'N'
"
"			   THEN
"
"				   proc_upd_recalc_tds_dtls(p_bu,
"
"											p_plnt,
"
"											p_doc_pfx,
"
"											p_doc_no,
"
"											p_user);
"
"			   END IF;
"
"               p_tds_flag := 'Y';
"
"
"
"               SELECT COUNT (*)
"
"                 INTO v_ded_cnt
"
"                 FROM suplr_doc_ln
"
"                WHERE supln_bu = p_bu
"
"                  AND supln_doc_no = p_doc_no
"
"                  AND (supln_gen_flag = 'Y' OR supln_ap_gl_acct IN
"
"                         (SELECT glac_acct
"
"                            FROM gl_accts
"
"                           WHERE glac_bu = p_bu
"
"                             AND glac_tds_us_id IS NOT NULL
"
"                             AND glac_tds_flag = 'Y'
"
"                             AND glac_pan_no IS NOT NULL
"
"							 ));
"
"
"
"               IF v_ded_cnt > 0
"
"               THEN
"
"			       proc_upd_tds_src_dtls(p_bu,p_doc_pfx,p_doc_no);
"
"
"
"				   UPDATE suplr_doc_hd
"
"					  SET suphd_tds_flag = 'Y',
"
"					      suphd_upd_by = p_user,
"
"						  suphd_upd_emp_id = func_find_emp_id(p_bu,p_user),
"
"						  suphd_upd_date = SYSDATE,
"
"						  suphd_upd_ip_addr = Audit_Info.Get_IP_Address,
"
"                          suphd_upd_os_user = Audit_Info.Get_OS_User
"
"					WHERE suphd_bu = p_bu
"
"					  AND suphd_doc_no = p_doc_no
"
"					  AND suphd_pfx = p_doc_pfx;
"
"                    p_tds_flag := 'Y';
"
"               ELSE
"
"				   UPDATE suplr_doc_hd
"
"					  SET suphd_tds_flag = 'N'
"
"					WHERE suphd_bu = p_bu
"
"					  AND suphd_doc_no = p_doc_no
"
"					  AND suphd_pfx = p_doc_pfx;
"
"					p_tds_flag := 'N';
"
"               END IF;
"
"            END IF;
"
"         END IF;
"
"      ELSIF p_tds_flag = 'N'
"
"      THEN
"
"	     UPDATE suplr_doc_ln
"
"			SET supln_tds_src_assbl_val = 0,
"
"				supln_tds_src_amt = 0,
"
"				supln_tds_src_pct = 0,
"
"				supln_tds_exempt_cert_no = NULL,
"
"				supln_tds_src_acct = NULL
"
"		  WHERE supln_bu = p_bu
"
"		    AND supln_doc_no = p_doc_no
"
"			AND supln_tds_us_id IS NOT NULL;
"
"
"
"	     DELETE suplr_doc_adv_tds_adj
"
"          WHERE sdata_bu = p_bu
"
"            AND sdata_doc_no = p_doc_no;
"
"
"
"         DELETE suplr_adv_tds_ded_dtls
"
"		  WHERE satdd_bu  = p_bu
"
"            AND satdd_doc_no  = p_doc_no;
"
"
"
"         DELETE suplr_doc_ln
"
"          WHERE supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no
"
"            AND supln_tcs_gen_flg = 'N'
"
"            AND supln_gen_flag = 'Y'
"
"            AND supln_type = 'C';
"
"
"
"	 	 UPDATE suplr_doc_hd
"
"		    SET suphd_tds_flag = 'N'
"
"		  WHERE suphd_bu = p_bu
"
"		    AND suphd_doc_no = p_doc_no
"
"		    AND suphd_pfx = p_doc_pfx;
"
"
"
"      END IF;
"
"   END;
"
"END proc_cre_tds;
"
"
"
"---Procedure For Journal Creation Bill Book
"
"
"
"PROCEDURE proc_cre_jrnl (p_bu                 VARCHAR2,
"
"					     p_user               VARCHAR2,
"
"					     p_doc_no             VARCHAR2,
"
"					     p_doc_pfx            VARCHAR2,
"
"					     p_plnt               VARCHAR2,
"
"					     p_jrnl_flag   IN OUT VARCHAR2,
"
"						 p_adv_tds           VARCHAR2 DEFAULT NULL)
"
"   IS
"
"      CURSOR c_hd
"
"      IS
"
"         SELECT *
"
"           FROM suplr_doc_hd
"
"          WHERE suphd_bu = p_bu
"
"            AND suphd_doc_no = p_doc_no
"
"            AND suphd_pfx = p_doc_pfx;
"
"
"
"      CURSOR c_ln
"
"      IS
"
"         SELECT *
"
"           FROM suplr_doc_ln
"
"          WHERE supln_bu = p_bu
"
"            AND supln_doc_no = p_doc_no;
"
"
"
"    cr_hd            c_hd%ROWTYPE;
"
"	cr_ln            c_ln%ROWTYPE;
"
"	v_cfc_code       VARCHAR2(20);
"
"	v_cnt            NUMBER(5);
"
"	v_jrnl_cnt       NUMBER(5);
"
"	v_rcm            VARCHAR2(20);
"
"	v_res_dist       VARCHAR2(1000);
"
"	v_err_dist       VARCHAR2(2000);
"
"	v_tds_flag       suplr_doc_hd.suphd_tds_flag%TYPE;
"
"	v_contr_flag     VARCHAR2(1) := func_find_contra_jrnl_src (p_bu);
"
"	v_base_curr      VARCHAR2(10):= func_find_base_currency(p_bu);
"
"	v_apm_proj_req   VARCHAR2(1):= func_find_apm_prj_req_flag(p_bu);
"
"BEGIN
"
"    OPEN c_hd;
"
"
"
"    FETCH c_hd INTO cr_hd;
"
"
"
"    CLOSE c_hd;
"
"
"
"	  IF cr_hd.suphd_cpc_code IS NULL THEN
"
"	     raise_application_error(-20999,'CPC Code must be entered.');
"
"      END IF;
"
"
"
"      IF p_jrnl_flag = 'Y' AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('PRW','STW','SCOO','LCW','POW') THEN
"
"
"
"		 DECLARE
"
"		   CURSOR c1
"
"		   IS
"
"		      SELECT SUM(v_cnt)v_cnt
"
"		        FROM(
"
"			  SELECT COUNT (*) v_cnt
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND supln_receipt_no IS NOT NULL
"
"				 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type NOT IN('POW')
"
"			  UNION ALL
"
"			  SELECT COUNT (*) v_cnt
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND supln_po_no IS NOT NULL
"
"				 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('POW'));
"
"
"
"		   CURSOR c2
"
"		   IS
"
"			  SELECT COUNT (*) v_cnt
"
"				FROM suplr_doc_ln,suplr_doc_proc_ln
"
"			   WHERE supln_bu = p_bu
"
"			     AND supln_bu = sdpl_bu
"
"				 AND supln_seq_no = sdpl_seq_no
"
"				 AND supln_doc_no = sdpl_doc_no
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND supln_type = 'I';
"
"
"
"			   cr1   c1%ROWTYPE;
"
"			   cr2   c2%ROWTYPE;
"
"		   BEGIN
"
"			   OPEN c1;
"
"
"
"			   FETCH c1 INTO cr1;
"
"
"
"			   OPEN c2;
"
"
"
"			   FETCH c2 INTO cr2;
"
"
"
"			   IF  cr1.v_cnt = 0 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type NOT IN('SCOO')
"
"			   THEN
"
"				   raise_application_error(-20999,'Document will not be Proceed without Reference line.');
"
"			   END IF;
"
"
"
"			   IF  cr2.v_cnt = 0 AND cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('SCOO')
"
"			   THEN
"
"			       raise_application_error(-20999,'Line Process details must be entered.');
"
"			   END IF;
"
"
"
"			   CLOSE c2;
"
"
"
"			   CLOSE C1;
"
"			END;
"
"      END IF;
"
"
"
"	  IF cr_hd.suphd_grn_refer||cr_hd.suphd_pur_type IN('SCOW') THEN
"
"		   DECLARE
"
"			  CURSOR c1
"
"			  IS
"
"			  SELECT COUNT (*) v_cnt
"
"				FROM suplr_doc_proc_ln
"
"			   WHERE sdpl_bu = p_bu
"
"				 AND sdpl_doc_no = p_doc_no
"
"				 AND sdpl_receipt_no IS NOT NULL;
"
"
"
"			 cr1   c1%ROWTYPE;
"
"		   BEGIN
"
"			   OPEN c1;
"
"
"
"			   FETCH c1 INTO cr1;
"
"
"
"			   IF  cr1.v_cnt = 0
"
"			   THEN
"
"				  raise_application_error(-20999,'Document will not be Proceed without Reference line.');
"
"			   END IF;
"
"
"
"			   CLOSE C1;
"
"		   END;
"
"      END IF;
"
"
"
"      BEGIN
"
"		  SELECT COUNT(*)cnt
"
"			INTO v_cnt
"
"			FROM suplr_doc_ln
"
"		   WHERE supln_bu = p_bu
"
"			 AND supln_doc_no = p_doc_no;
"
"
"
"		  IF v_cnt = 0 THEN
"
"			 raise_application_error(-20352,'ICM');
"
"		  END IF;
"
"
"
"		  SELECT COUNT(*)cnt
"
"			INTO v_cnt
"
"			FROM suplr_doc_ln
"
"		   WHERE supln_bu = p_bu
"
"			 AND supln_doc_no = p_doc_no
"
"			 AND supln_ap_cc_code IS NULL;
"
"
"
"		  IF v_cnt > 0 AND p_jrnl_flag = 'Y' THEN
"
"			 raise_application_error(-20999,'CPC Code not found.');
"
"		  END IF;
"
"      END;
"
"
"
"	  -----Distribute GRN Line-----
"
"	  IF cr_hd.suphd_grn_refer IN('EXP','PO')
"
"	  THEN
"
"	      proc_ins_distr_grn_suphd(p_bu,p_doc_pfx,p_doc_no,p_user,v_err_dist,v_res_dist);
"
"
"
"		  IF v_err_dist IS NOT NULL
"
"		  THEN
"
"		     raise_application_error (-20999,v_err_dist);
"
"		  END IF;
"
"      END IF;
"
"
"
"	  IF p_jrnl_flag = 'Y'
"
"	  THEN
"
"		 IF cr_hd.suphd_exchange_rate <= 0
"
"		 THEN
"
"		    raise_application_error (-20999,'Exchange rate should be greater than zero');
"
"		 END IF;
"
"	  END IF;
"
"
"
"	  IF cr_hd.suphd_suplr_type <> 'R' AND cr_hd.suphd_alow_rcm_tax = 'Y'  AND cr_hd.suphd_currency = v_base_curr THEN
"
"	       UPDATE suplr_doc_hd
"
"		      SET suphd_alow_rcm_tax = 'N'
"
"			WHERE suphd_bu = p_bu
"
"			  AND suphd_pfx = p_doc_pfx
"
"              AND suphd_doc_no = p_doc_no;
"
"      ELSIF cr_hd.suphd_suplr_type = 'R' AND cr_hd.suphd_alow_rcm_tax = 'N'  AND cr_hd.suphd_currency = v_base_curr THEN
"
"		   UPDATE suplr_doc_ln
"
"		  	  SET supln_gst_rev_tax_flag = 'N',
"
"			      supln_gst_rev_tax_cat = NULL
"
"		    WHERE supln_bu = p_bu
"
"			  AND supln_doc_no = p_doc_no;
"
"      END IF;
"
"
"
"	  IF (cr_hd.suphd_suplr_type = 'U' OR cr_hd.suphd_suplr_type = 'R' AND cr_hd.suphd_alow_rcm_tax = 'Y')
"
"	  AND cr_hd.suphd_currency = v_base_curr
"
"      THEN
"
"		  BEGIN
"
"			 SELECT grtc_cat_id
"
"			   INTO v_rcm
"
"			   FROM gst_rev_tax_cat
"
"			  WHERE grtc_bu = p_bu
"
"				AND grtc_active_flag = 'Y'
"
"				AND grtc_default_flag = 'Y';
"
"			 EXCEPTION WHEN OTHERS THEN NULL;
"
"		  END;
"
"		  UPDATE suplr_doc_ln
"
"		     SET supln_gst_rev_tax_cat = v_rcm
"
"		   WHERE supln_bu = p_bu
"
"			 AND supln_hsn_code IS NOT NULL
"
"			 AND supln_tax_pct > 0
"
"			 AND supln_gst_rev_tax_cat IS NULL
"
"			 AND supln_doc_no = p_doc_no;
"
"
"
"		  UPDATE suplr_doc_ln
"
"			 SET supln_gst_rev_tax_flag = 'Y'
"
"		   WHERE supln_bu = p_bu
"
"			 AND supln_hsn_code IS NOT NULL
"
"			 AND supln_tax_pct > 0
"
"			 AND supln_doc_no = p_doc_no;
"
"	  END IF;
"
"
"
"	  OPEN c_hd;
"
"
"
"      FETCH c_hd INTO cr_hd;
"
"
"
"      CLOSE c_hd;
"
"
"
"	  IF cr_hd.suphd_grn_refer IN ('SCO', 'ST', 'PR','PO') AND p_jrnl_flag = 'Y'
"
"         THEN
"
"            DECLARE
"
"               CURSOR c1
"
"               IS
"
"                  SELECT COUNT (*) v_cnt
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"                     AND supln_type = 'I'
"
"                     AND supln_inv_disc_amt > 0;
"
"
"
"               cr1   c1%ROWTYPE;
"
"            BEGIN
"
"               OPEN c1;
"
"
"
"               FETCH c1 INTO cr1;
"
"
"
"               IF cr1.v_cnt = 0
"
"               THEN
"
"                  IF cr_hd.suphd_lm_disc_amt <> 0
"
"                  THEN
"
"
"
"                     proc_calc_dist_lm_disc (p_bu,
"
"                                             p_doc_pfx,
"
"                                             p_doc_no);
"
"
"
"                     proc_cre_suplr_doc_tax(p_bu,cr_hd.suphd_plant,p_doc_pfx,p_doc_no);
"
"
"
"                  ELSIF cr_hd.suphd_lm_bfr_disc_amt <> 0
"
"                  THEN
"
"                     proc_calc_dist_bfr_lm_disc (p_bu,
"
"                                                 p_doc_pfx,
"
"                                                 p_doc_no);
"
"
"
"                     proc_cre_suplr_doc_tax(p_bu,cr_hd.suphd_plant,p_doc_pfx,p_doc_no);
"
"
"
"                  END IF;
"
"               END IF;
"
"
"
"               CLOSE c1;
"
"            END;
"
"            proc_ins_suplr_doc_chrg_shr (p_bu,p_doc_pfx,p_doc_no,p_user);
"
"
"
"            proc_sum_lm_disc_apex (p_bu, p_doc_pfx, p_doc_no);
"
"
"
"            proc_sum_disc_apex (p_bu, p_doc_pfx, p_doc_no);
"
"      END IF;
"
"
"
"	  proc_suphd_po_grn_det(p_bu, p_doc_pfx, p_doc_no);
"
"
"
"      IF p_jrnl_flag = 'Y' --AND cr_hd.suphd_tds_exmp_flag = 'N'
"
"	  THEN
"
"	   DECLARE
"
"		   CURSOR c1
"
"		   IS
"
"			  SELECT suplr_tds_appl
"
"				FROM suppliers
"
"			   WHERE suplr_bu = p_bu
"
"				 AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"				 AND suplr_tcs_appl <> 'Y'
"
"				 AND suplr_party_type NOT IN('N','A')
"
"				 AND suplr_status = 'A';
"
"
"
"		  cr1   c1%ROWTYPE;
"
"	   BEGIN
"
"
"
"		   OPEN C1;
"
"
"
"		   FETCH C1 INTO CR1;
"
"
"
"		   IF C1%FOUND AND CR1.suplr_tds_appl = 'T'
"
"		   THEN
"
"			  raise_application_error (-20999,'Select the TDS Applicable type.');
"
"		   END IF;
"
"
"
"		   CLOSE C1;
"
"	   END;
"
"      END IF;
"
"	  /*Calculation For TDS Deduction*/
"
"	  IF  cr_hd.suphd_tds_flag = 'N' AND p_jrnl_flag = 'Y'
"
"		  AND v_base_curr  = cr_hd.suphd_currency
"
"		  AND cr_hd.suphd_doc_type IN ('SB', 'CN')
"
"      THEN
"
"	     v_tds_flag := 'Y';
"
"		 proc_cre_tds(p_bu,
"
"		              p_user,
"
"					  p_doc_no,
"
"					  p_doc_pfx,
"
"					  p_plnt,
"
"					  v_tds_flag,
"
"					  p_adv_tds);
"
"	  END IF;
"
"
"
"	  OPEN c_hd;
"
"
"
"      FETCH c_hd INTO cr_hd;
"
"
"
"      CLOSE c_hd;
"
"
"
"      IF cr_hd.suphd_grn_refer IN ('PR','SCO','ST','PO') THEN
"
"           FOR cr_ln IN c_ln
"
"           LOOP
"
"               IF cr_ln.supln_type = 'I' AND cr_hd.suphd_jrnl_flag = 'N'
"
"               THEN
"
"                   DECLARE
"
"                       CURSOR C1
"
"                       IS
"
"                          SELECT 1
"
"                            FROM prod_plants, products, prod_plants_loc
"
"                           WHERE prodplnt_bu = prod_bu
"
"                             AND prodplnt_prod_id = prod_id
"
"                             AND prodplnt_prod_rev = prod_rev
"
"                             AND prodplnt_bu = p_bu
"
"                             AND prodplnt_prod_id = ppl_prod_id
"
"                             AND prodplnt_plnt = ppl_plnt
"
"                             AND prodplnt_prod_rev = ppl_prod_rev
"
"                             AND ppl_bu = prodplnt_bu
"
"                             AND ppl_plnt = cr_ln.supln_ref_plnt
"
"                             AND ppl_plnt_loc_id = cr_ln.supln_ref_plnt_loc_id
"
"                             AND ppl_prod_id = cr_ln.supln_prod_id
"
"                             AND ppl_prod_rev = cr_ln.supln_prod_rev
"
"							 AND prod_status = 'A'
"
"                             AND prodplnt_status = 'A';
"
"
"
"                       CR1          C1%ROWTYPE;
"
"                       v_mat_type   VARCHAR2 (10);
"
"                    BEGIN
"
"                       OPEN C1;
"
"
"
"                       FETCH C1 INTO CR1;
"
"
"
"					   IF C1%NOTFOUND
"
"                       THEN
"
"                          raise_application_error(-20999,'Item is not associated with this unit. - '||cr_ln.supln_prod_id||'/ Line No.'||cr_ln.supln_seq_no);
"
"                       END IF;
"
"
"
"                       CLOSE C1;
"
"                    END;
"
"                END IF;
"
"             END LOOP c_ln;
"
"      END IF;
"
"
"
"      IF p_jrnl_flag = 'N'
"
"      THEN
"
"            IF cr_hd.suphd_grn_refer IN ('EXP')
"
"            THEN
"
"               UPDATE suplr_doc_ln
"
"                  SET supln_tds_src_acct = NULL,
"
"                      supln_tds_src_pct = 0,
"
"                      supln_tds_src_assbl_val = 0,
"
"                      supln_tds_src_amt = 0
"
"                WHERE supln_bu = p_bu
"
"                  AND supln_doc_no = p_doc_no
"
"				  AND supln_type = 'C';
"
"            ELSIF cr_hd.suphd_grn_refer NOT IN ('EXP')
"
"            THEN
"
"               UPDATE suplr_doc_ln
"
"                  SET supln_tds_src_acct = NULL,
"
"                      supln_tds_src_pct = 0,
"
"                      supln_tds_src_assbl_val = 0,
"
"                      supln_tds_src_amt = 0
"
"                WHERE supln_bu = p_bu
"
"                  AND supln_doc_no = p_doc_no;
"
"            END IF;
"
"      END IF;
"
"
"
"      proc_upd_gl_acct_cc (p_bu,p_doc_pfx,p_doc_no);
"
"
"
"      IF p_jrnl_flag = 'Y' THEN
"
"		DECLARE
"
"		   CURSOR c1
"
"		   IS
"
"			  SELECT Count(*) cnt
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND supln_tax_exmpt_flag = 'G'
"
"				 AND supln_hsn_code IS NULL
"
"				 AND supln_bfcry_id IS NULL;
"
"		cr1  c1%ROWTYPE;
"
"
"
"		BEGIN
"
"			OPEN c1;
"
"
"
"			FETCH c1 INTO cr1;
"
"
"
"			IF cr1.cnt > 0 AND cr_hd.suphd_currency = v_base_curr THEN
"
"				raise_application_error (-20999,'HSN/SAC Code must be entered.');
"
"			END IF;
"
"
"
"			CLOSE C1;
"
"		END;
"
"	  END IF;
"
"
"
"      IF p_jrnl_flag = 'Y'
"
"      THEN
"
"		DECLARE
"
"		   CURSOR c1
"
"		   IS
"
"			  SELECT supln_ap_gl_acct
"
"				FROM suplr_doc_ln
"
"			   WHERE supln_bu = p_bu
"
"				 AND supln_doc_no = p_doc_no
"
"				 AND supln_tcs_us_id IS NULL
"
"				 AND supln_type = 'C'
"
"				 AND v_base_curr = cr_hd.suphd_currency;
"
"
"
"		   CURSOR c2 (
"
"			  c_acct VARCHAR2)
"
"		   IS
"
"			  SELECT glac_tcs_us_id, glac_acct
"
"				FROM gl_accts
"
"			   WHERE glac_bu = p_bu
"
"				 AND glac_acct = c_acct
"
"				 AND glac_tcs_us_id IS NOT NULL;
"
"
"
"		   cr2   c2%ROWTYPE;
"
"		BEGIN
"
"		   FOR cr1 IN c1
"
"		   LOOP
"
"			  OPEN c2 (cr1.supln_ap_gl_acct);
"
"
"
"			  FETCH c2 INTO cr2;
"
"
"
"			  IF c2%FOUND AND p_jrnl_flag = 'Y'
"
"			  THEN
"
"				 raise_application_error (-20999,'TCS u/s No. must be entered.');
"
"			  END IF;
"
"
"
"			  CLOSE c2;
"
"		   END LOOP;
"
"		END;
"
"      END IF;
"
"
"
"	  IF cr_hd.suphd_tds_exmp_flag = 'N' AND v_base_curr = cr_hd.suphd_currency
"
"	  THEN
"
"		DECLARE
"
"		   v_cnt        NUMBER;
"
"		   v_tds_appl   VARCHAR2 (1);
"
"		BEGIN
"
"		   SELECT COUNT (*)
"
"			 INTO v_tds_appl
"
"			 FROM suppliers
"
"			WHERE suplr_bu = p_bu
"
"			  AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"			  AND suplr_tds_appl = 'Y';
"
"
"
"
"
"		   SELECT COUNT (*)
"
"			 INTO v_cnt
"
"			 FROM (SELECT 1
"
"					 FROM suplr_doc_ln
"
"					WHERE supln_bu = p_bu
"
"					  AND supln_doc_no = p_doc_no
"
"					  AND supln_tds_us_id IS NOT NULL
"
"					  AND supln_type = 'C'
"
"				   UNION ALL
"
"				   SELECT 1
"
"					 FROM suplr_doc_ln
"
"					WHERE supln_bu = p_bu
"
"					  AND supln_doc_no = p_doc_no
"
"					  AND supln_tds_us_id IS NOT NULL
"
"					  AND supln_type = 'I'
"
"					  AND NOT EXISTS
"
"								 (SELECT 1
"
"									FROM suplr_doc_proc_ln
"
"								   WHERE sdpl_bu = supln_bu
"
"									 AND sdpl_doc_no = supln_doc_no)
"
"				   UNION ALL
"
"				   SELECT 1
"
"					 FROM suplr_doc_proc_ln
"
"					WHERE sdpl_bu = p_bu
"
"					  AND sdpl_doc_no = p_doc_no
"
"					  AND sdpl_tds_us_id IS NOT NULL
"
"					  AND sdpl_tds_appl_flag = 'Y'
"
"				   UNION ALL
"
"				   SELECT 1
"
"					 FROM suplr_doc_ln, products
"
"					WHERE supln_bu = p_bu
"
"					  AND supln_doc_no = p_doc_no
"
"					  AND supln_bu = prod_bu
"
"					  AND supln_prod_id = prod_id
"
"					  AND supln_prod_rev = prod_rev
"
"					  AND (supln_tds_us_id IS NOT NULL OR prod_esi_appl_flag = 'Y' OR prod_pf_appl_flag = 'Y')
"
"					  AND NOT EXISTS
"
"								 (SELECT 1
"
"									FROM suplr_doc_proc_ln
"
"								   WHERE sdpl_bu = supln_bu
"
"									 AND sdpl_doc_no = supln_doc_no));
"
"
"
"
"
"		   IF cr_hd.suphd_tds_flag = 'N' AND v_cnt > 0 AND v_tds_appl > 0 AND p_jrnl_flag = 'Y'
"
"		   THEN
"
"			  raise_application_error (-20999, 'Deductions not applied.');
"
"		   END IF;
"
"		END;
"
"	  END IF;
"
"
"
"	 DECLARE
"
"		CURSOR C1
"
"		IS
"
"		   SELECT *
"
"			 FROM suplr_doc_ln
"
"			WHERE supln_bu = p_bu
"
"			  AND supln_doc_no = p_doc_no
"
"			  AND supln_input_type = 'N'
"
"			  AND (supln_inelgbl_type = 'A' OR supln_inelgbl_sub_type = 'A')
"
"			  AND supln_type = 'C';
"
"
"
"		v_ref   VARCHAR2 (50);
"
"		cr1     c1%ROWTYPE;
"
"	 BEGIN
"
"		FOR cr1 IN c1
"
"		LOOP
"
"		   v_ref := v_ref || '-' || cr1.supln_seq_no;
"
"		END LOOP;
"
"
"
"		OPEN c1;
"
"
"
"		FETCH C1 INTO CR1;
"
"
"
"		IF C1%FOUND
"
"		THEN
"
"		   raise_application_error (-20999,'Ineligible section / sub section not given for line '|| v_ref);
"
"		END IF;
"
"
"
"		CLOSE C1;
"
"	 END;
"
"
"
"	 DECLARE
"
"		CURSOR c1
"
"		IS
"
"		   SELECT SUM (v_cnt) v_cnt
"
"			 FROM (SELECT COUNT (*) v_cnt
"
"					 FROM suplr_doc_hd, suplr_doc_ln
"
"					WHERE suphd_bu = supln_bu
"
"					  AND suphd_doc_no = supln_doc_no
"
"					  AND supln_bu = p_bu
"
"					  AND supln_doc_no = p_doc_no
"
"					  AND supln_type = 'I'
"
"					  AND supln_gst_rev_tax_flag = 'N'
"
"					  AND supln_hsn_code IS NOT NULL
"
"					  AND suphd_currency <> v_base_curr
"
"				   UNION ALL
"
"				   SELECT COUNT (*) v_cnt
"
"					 FROM suplr_doc_hd, suplr_doc_ln
"
"					WHERE suphd_bu = supln_bu
"
"					  AND suphd_doc_no = supln_doc_no
"
"					  AND supln_bu = p_bu
"
"					  AND supln_doc_no = p_doc_no
"
"					  AND supln_type = 'C'
"
"					  AND supln_gst_rev_tax_flag = 'N'
"
"					  AND supln_hsn_code IS NOT NULL
"
"					  AND suphd_currency <> v_base_curr);
"
"
"
"		cr1   c1%ROWTYPE;
"
"
"
"		CURSOR C2
"
"		IS
"
"		   SELECT ssl_country
"
"			 FROM suplr_ship_loc,business_units
"
"			WHERE ssl_bu = p_bu
"
"			  AND ssl_suplr_id = cr_hd.suphd_suplr_id
"
"			  AND ssl_loc_name1 = cr_hd.suphd_bill_loc_name
"
"			  AND bu_id = ssl_bu
"
"		      AND ssl_country = bu_country;
"
"
"
"		cr2   c2%ROWTYPE;
"
"	 BEGIN
"
"		OPEN c2;
"
"
"
"		FETCH c2 INTO cr2;
"
"
"
"		IF c2%NOTFOUND
"
"		THEN
"
"		   OPEN c1;
"
"
"
"		   FETCH c1 INTO cr1;
"
"
"
"		   IF c1%FOUND AND cr1.v_cnt <> 0 AND cr_hd.suphd_grn_refer <> 'LC'
"
"		   AND cr_hd.suphd_currency = v_base_curr
"
"		   THEN
"
"			  raise_application_error (-20999,'RCM Tax Only applicable.');
"
"		   END IF;
"
"
"
"		   CLOSE c1;
"
"		END IF;
"
"
"
"		CLOSE C2;
"
"	 END;
"
"
"
"	 DECLARE
"
"		CURSOR c1
"
"		IS
"
"		   SELECT 1
"
"			 FROM suplr_doc_hd,suplr_doc_proc_ln,suppliers
"
"			WHERE suphd_bu = p_bu
"
"			  AND suphd_grn_refer IN ('SCO')
"
"			  AND suphd_jrnl_flag = 'N'
"
"			  AND suphd_pfx = p_doc_pfx
"
"			  AND suphd_doc_no = p_doc_no
"
"              AND suphd_tds_exmp_flag = 'N'
"
"              AND suplr_bu = p_bu
"
"			  AND suplr_suplr_id = suphd_suplr_id
"
"			  AND suplr_tds_appl = 'Y'
"
"			  AND sdpl_bu = p_bu
"
"			  AND sdpl_plnt = cr_hd.suphd_plant
"
"			  AND sdpl_doc_no = p_doc_no
"
"			  AND sdpl_tds_us_id IS NULL
"
"			  AND sdpl_tds_appl_flag = 'Y';
"
"
"
"		cr1   c1%ROWTYPE;
"
"	 BEGIN
"
"		OPEN C1;
"
"
"
"		FETCH C1 INTO CR1;
"
"
"
"		IF C1%FOUND
"
"		THEN
"
"		   raise_application_error (-20999,'TDS u/s No. must be entered.');
"
"		END IF;
"
"
"
"		CLOSE C1;
"
"	 END;
"
"
"
"
"
"	 IF cr_hd.suphd_grn_refer IN ('PR','SCO','ST')
"
"		AND p_jrnl_flag = 'Y'
"
"	 THEN
"
"
"
"		proc_sum_lm_disc_apex (p_bu, p_doc_pfx, p_doc_no);
"
"
"
"		proc_sum_disc_apex (p_bu, p_doc_pfx, p_doc_no);
"
"	 END IF;
"
"
"
"	 OPEN c_hd;
"
"
"
"	 FETCH c_hd INTO cr_hd;
"
"
"
"	 CLOSE c_hd;
"
"
"
"	 DECLARE
"
"		CURSOR C1
"
"		IS
"
"		   SELECT glmctrl_gst_usage
"
"			 FROM glm_control
"
"			WHERE glmctrl_bu = p_bu;
"
"
"
"		cr1   c1%ROWTYPE;
"
"	 BEGIN
"
"		OPEN c1;
"
"
"
"		FETCH c1 INTO cr1;
"
"
"
"		IF c1%FOUND
"
"		THEN
"
"		   IF CR1.glmctrl_gst_usage = 'N'
"
"		   THEN
"
"			  raise_application_error (-20999,'Please check the GST/VAT Control.');
"
"		   END IF;
"
"		END IF;
"
"
"
"		CLOSE c1;
"
"	 END;
"
"
"
"	 --validate for HSN/SAC
"
"	 proc_validate_bills(p_bu,p_doc_pfx,p_doc_no);
"
"
"
"	 OPEN c_hd;
"
"
"
"     FETCH c_hd INTO cr_hd;
"
"
"
"     CLOSE c_hd;
"
"
"
"	 IF cr_hd.suphd_grn_refer IN ('LC')
"
"		AND cr_hd.suphd_gst_suplr_name IS NULL
"
"	 THEN
"
"		DECLARE
"
"		   CURSOR c1
"
"		   IS
"
"			  SELECT suplr_name1
"
"				FROM suppliers
"
"			   WHERE suplr_bu = p_bu
"
"				 AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"		   cr1   c1%ROWTYPE;
"
"		BEGIN
"
"		   OPEN c1;
"
"
"
"		   FETCH c1 INTO cr1;
"
"
"
"		   IF c1%FOUND
"
"		   THEN
"
"			  UPDATE suplr_doc_hd
"
"				 SET suphd_gst_suplr_name = cr1.suplr_name1
"
"			   WHERE suphd_bu = p_bu
"
"				 AND suphd_doc_no = p_doc_no
"
"				 AND suphd_pfx = p_doc_pfx;
"
"		   END IF;
"
"
"
"		   CLOSE c1;
"
"		END;
"
"	 END IF;
"
"
"
"	 DECLARE
"
"		CURSOR c1
"
"		IS
"
"		   SELECT NVL (SUM (DECODE (sda_dr_cr,'DR', sda_adj_amt,'CR', sda_adj_amt * -1)),0)sda_adj_amt
"
"			 FROM suplr_doc_adj
"
"			WHERE sda_bu = p_bu
"
"			  AND sda_doc_no = p_doc_no;
"
"
"
"		cr1   c1%ROWTYPE;
"
"	 BEGIN
"
"	    IF func_find_apm_auto_adj_flag (p_bu) = 'Y'
"
"        THEN
"
"		   DELETE suplr_doc_adj
"
"		    WHERE sda_bu = p_bu
"
"			  AND sda_adv_sys_flag ='M'
"
"			  AND sda_doc_no = p_doc_no;
"
"        END IF;
"
"
"
"		OPEN c1;
"
"
"
"		FETCH c1 INTO cr1;
"
"
"
"		IF c1%FOUND AND p_jrnl_flag = 'Y'
"
"		THEN
"
"		   IF cr1.sda_adj_amt > cr_hd.suphd_sc_tot_amt
"
"		   THEN
"
"			  raise_application_error (-20999,'Adjustment Amt. should not be greater than Document Amt.');
"
"		   END IF;
"
"		END IF;
"
"
"
"		CLOSE c1;
"
"	 END;
"
"
"
"      IF cr_hd.suphd_tax_flag = 'N' AND p_jrnl_flag = 'N'
"
"      THEN
"
"            DELETE suplr_doc_ln
"
"             WHERE supln_bu = p_bu
"
"               AND supln_doc_no = p_doc_no
"
"               AND supln_tcs_gen_flg = 'Y';
"
"      END IF;
"
"
"
"         IF p_jrnl_flag = 'N'
"
"         THEN
"
"            DELETE suplr_doc_po_val
"
"             WHERE sdpv_bu = p_bu
"
"               AND sdpv_doc_no = p_doc_no;
"
"         END IF;
"
"
"
"         IF p_jrnl_flag = 'Y'
"
"         THEN
"
"            DECLARE
"
"               CURSOR C1
"
"               IS
"
"                  SELECT COUNT (1) v_sales_cnt
"
"                    FROM suplr_doc_sinv_dist_adj
"
"                   WHERE sdsda_bu = p_bu
"
"                     AND sdsda_doc_pfx = p_doc_pfx
"
"                     AND sdsda_doc_no = p_doc_no
"
"                     AND EXISTS
"
"                            (SELECT 1
"
"                               FROM suplr_doc_ln
"
"                              WHERE supln_bu = sdsda_bu
"
"                                AND supln_doc_no = sdsda_doc_no
"
"                                AND supln_seq_no = sdsda_seq_no
"
"                                AND supln_list_bill_si = 'S');
"
"
"
"
"
"               CURSOR c2
"
"               IS
"
"                  SELECT COUNT (1) v_sales_dist_cnt
"
"                    FROM suplr_doc_sinv_dist_ln_adj
"
"                   WHERE sdsdla_bu = p_bu
"
"                     AND sdsdla_doc_pfx = p_doc_pfx
"
"                     AND sdsdla_doc_no = p_doc_no;
"
"
"
"               cr1   c1%ROWTYPE;
"
"               cr2   c2%ROWTYPE;
"
"            BEGIN
"
"               OPEN c1;
"
"
"
"               FETCH c1 INTO cr1;
"
"
"
"               OPEN c2;
"
"
"
"               FETCH c2 INTO cr2;
"
"
"
"               IF cr1.v_sales_cnt > 0 AND cr2.v_sales_dist_cnt = 0
"
"               THEN
"
"                  raise_application_error (-20999, 'Distribute the Invoice.');
"
"               END IF;
"
"
"
"               CLOSE c2;
"
"
"
"               CLOSE c1;
"
"            END;
"
"         END IF;
"
"
"
"         IF p_jrnl_flag = 'Y'
"
"         THEN
"
"            proc_upd_tds_src_dtls (p_bu,p_doc_pfx,p_doc_no);
"
"            proc_upd_tcs_src_dtls (p_bu,p_doc_pfx,p_doc_no);
"
"         END IF;
"
"
"
"         IF p_jrnl_flag = 'Y' AND cr_hd.suphd_grn_refer NOT IN ('EXP')
"
"         THEN
"
"            IF func_find_apm_prj_req_flag (p_bu) = 'Y'
"
"            THEN
"
"               DECLARE
"
"                  CURSOR c1
"
"                  IS
"
"                     SELECT DISTINCT
"
"                            CASE
"
"                               WHEN porl_proj_id IS NOT NULL
"
"                               THEN
"
"                                  func_find_lvl_prj_id (p_bu,porl_proj_id,porl_plnt)
"
"                               ELSE
"
"                                  func_find_lvl_prj_id (p_bu,porl_so_pfx || porl_so_no,porl_plnt)
"
"                            END
"
"                               supln_proj_id,
"
"                            supln_doc_no suphd_doc_no
"
"                       FROM suplr_doc_ln, pur_ord_receipt_ln_view, gl_lvl_prj
"
"                      WHERE supln_bu = porl_bu
"
"                        AND supln_bu = glp_bu
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND porl_bu = p_bu
"
"                        AND supln_receipt_no = porl_receipt_no
"
"                        AND cr_hd.suphd_grn_refer IN ('PR', 'SCO', 'ST')
"
"                        AND CASE
"
"                               WHEN porl_proj_id IS NOT NULL
"
"                               THEN
"
"                                  func_find_lvl_prj_id (p_bu,
"
"                                                        porl_proj_id,
"
"                                                        porl_plnt)
"
"                               ELSE
"
"                                  func_find_lvl_prj_id (
"
"                                     p_bu,
"
"                                     porl_so_pfx || porl_so_no,
"
"                                     porl_plnt)
"
"                            END
"
"                               IS NOT NULL;
"
"
"
"
"
"                  CURSOR c2 (c_proj_id VARCHAR2)
"
"                  IS
"
"                     SELECT suphd_proj_id ln_proj_id, suphd_pfx, suphd_doc_no
"
"                       FROM suplr_doc_hd
"
"                      WHERE suphd_bu = p_bu
"
"                        AND suphd_doc_no = p_doc_no
"
"                        AND suphd_pfx = p_doc_pfx
"
"                        AND suphd_proj_id IS NOT NULL
"
"                        AND suphd_proj_id = c_proj_id;
"
"
"
"                  cr1          c1%ROWTYPE;
"
"                  cr2          c2%ROWTYPE;
"
"                  v_project    VARCHAR2 (15);
"
"                  post_alert   NUMBER;
"
"                  v_nf         NUMBER := 0;
"
"                  v_fnd        NUMBER := 0;
"
"               BEGIN
"
"                  FOR CR1 IN C1
"
"                  LOOP
"
"                     OPEN c2 (cr1.supln_proj_id);
"
"
"
"                     FETCH c2 INTO cr2;
"
"
"
"                     IF c2%NOTFOUND
"
"                     THEN
"
"                        V_NF := V_NF + 1;
"
"                     END IF;
"
"
"
"                     IF c2%FOUND
"
"                     THEN
"
"                        v_fnd := v_fnd + 1;
"
"                     END IF;
"
"
"
"                     CLOSE c2;
"
"                  END LOOP;
"
"
"
"               END;
"
"            END IF;
"
"         END IF;
"
"
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"                 SELECT sddla_bu,
"
"                        sddla_grn_pfx,
"
"                        sddla_grn_no,
"
"                        sddla_grnln_seq_no,
"
"                        SUM (
"
"                           DECODE (sdda_adj_type,
"
"                                   'C', sddla_adj_unit_cost,
"
"                                   -1 * sddla_adj_unit_cost))
"
"                           amt
"
"                   FROM suplr_doc_dist_ln_adj, suplr_doc_dist_adj
"
"                  WHERE sdda_bu = sddla_bu
"
"                    AND sdda_doc_no = sddla_doc_no
"
"                    AND sdda_seq_no = sddla_seq_no
"
"                    AND sdda_sub_seq_no = sddla_sub_seq_no
"
"                    AND sddla_bu = p_bu
"
"                    AND sddla_doc_no = p_doc_no
"
"               GROUP BY sddla_bu,
"
"                        sddla_grn_pfx,
"
"                        sddla_grn_no,
"
"                        sddla_grnln_seq_no;
"
"
"
"            CURSOR c2 (c_rcpt_no        VARCHAR2,
"
"               c_rcpt_seq_no    NUMBER)
"
"            IS
"
"               SELECT porl_sc_unit_cost,
"
"                      porh_exchange_rate,
"
"                      porl_ap_lc_chrg_amt
"
"                 FROM pur_ord_receipt_hd_view, pur_ord_receipt_ln_view
"
"                WHERE porh_bu = p_bu
"
"                  AND porh_bu = porl_bu
"
"                  AND porh_receipt_no = porl_receipt_no
"
"                  AND porh_receipt_no = c_rcpt_no
"
"                  AND porl_seq_no = c_rcpt_seq_no
"
"                  AND porl_status NOT IN ('C');
"
"
"
"            cr2   c2%ROWTYPE;
"
"         BEGIN
"
"            FOR cr1 IN c1
"
"            LOOP
"
"               OPEN c2 (cr1.sddla_grn_no,
"
"                        cr1.sddla_grnln_seq_no);
"
"
"
"               FETCH c2 INTO cr2;
"
"
"
"               IF c2%FOUND
"
"                  AND   (cr2.porl_sc_unit_cost * cr2.porh_exchange_rate)
"
"                      + cr2.porl_ap_lc_chrg_amt
"
"                      + cr1.amt < 0
"
"               THEN
"
"                  raise_application_error (-20999,'Post Charge decreases the GRN line Unit Cost to lesser than zero.Revise the Distribution Amount.');
"
"               END IF;
"
"
"
"               CLOSE c2;
"
"            END LOOP;
"
"         END;
"
"
"
"         IF p_jrnl_flag = 'Y'
"
"         THEN
"
"            IF cr_hd.suphd_suplr_doc_no IS NULL
"
"            THEN
"
"               raise_application_error (-20999, 'Bill No. must be entered.');
"
"            END IF;
"
"
"
"            IF cr_hd.suphd_suplr_doc_date IS NULL
"
"            THEN
"
"               raise_application_error (-20999, 'Bill Date must be entered.');
"
"            END IF;
"
"
"
"            DECLARE
"
"               CURSOR c0
"
"               IS
"
"                  SELECT suplr_gst_edit_flag
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"                     AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"               v_state_code   VARCHAR2 (200);
"
"               v_vat_class    VARCHAR2 (200);
"
"               v_vat_type     VARCHAR2 (200);
"
"               v_pin_no       VARCHAR2 (200);
"
"            BEGIN
"
"               FOR cr0 IN c0
"
"               LOOP
"
"                  IF cr0.suplr_gst_edit_flag = 'N'
"
"                  THEN
"
"				    BEGIN
"
"                     SELECT state_code,
"
"                            ssl_vat_clsfn,
"
"                            ssl_vat_type,
"
"                            ssl_pin_no
"
"                       INTO v_state_code,
"
"                            v_vat_class,
"
"                            v_vat_type,
"
"                            v_pin_no
"
"                       FROM suplr_ship_loc, states
"
"                      WHERE state_bu = ssl_bu
"
"                        AND ssl_state = state_id
"
"                        AND ssl_bu = p_bu
"
"                        AND ssl_suplr_id = cr_hd.suphd_suplr_id
"
"                        AND ssl_loc_name1 = cr_hd.suphd_bill_loc_name;
"
"						EXCEPTION WHEN OTHERS THEN NULL;
"
"					END;
"
"                  END IF;
"
"
"
"                  UPDATE suplr_doc_hd
"
"                     SET suphd_state_code = v_state_code,
"
"                         suphd_pin_no = v_pin_no
"
"                   WHERE suphd_bu = p_bu
"
"                     AND suphd_doc_no = p_doc_no
"
"                     AND suphd_pfx = p_doc_pfx;
"
"               END LOOP;
"
"
"
"            END;
"
"
"
"            IF LENGTH (cr_hd.suphd_gstin_no) <> 15
"
"            THEN
"
"               raise_application_error (-20999,'GST No. length should be 15 digit ');
"
"            END IF;
"
"
"
"            IF LENGTH (cr_hd.suphd_state_code) = 2
"
"            THEN
"
"               IF SUBSTR (cr_hd.suphd_gstin_no, 1, 2) <> cr_hd.suphd_state_code
"
"               THEN
"
"                  raise_application_error (-20999,'First two digit must be with equal to State code.');
"
"               END IF;
"
"            ELSIF LENGTH (cr_hd.suphd_state_code) = 3
"
"            THEN
"
"               IF SUBSTR (cr_hd.suphd_gstin_no, 1, 3) <> cr_hd.suphd_state_code
"
"               THEN
"
"                  raise_application_error (-20999,'First three digit must be with equal to State code.');
"
"               END IF;
"
"            END IF;
"
"
"
"            OPEN c_hd;
"
"
"
"            FETCH c_hd INTO cr_hd;
"
"
"
"            CLOSE c_hd;
"
"
"
"            proc_upd_amount_apm1010(p_bu,
"
"                                    p_doc_pfx,
"
"                                    p_doc_no,
"
"                                    cr_hd.suphd_currency,
"
"                                    cr_hd.suphd_doc_type,
"
"                                    cr_hd.suphd_grn_refer,
"
"                                    cr_hd.suphd_suplr_id);
"
"            OPEN c_hd;
"
"
"
"            FETCH c_hd INTO cr_hd;
"
"
"
"            CLOSE c_hd;
"
"            /*
"
"            DECLARE
"
"      	       c_fin_exch_rate_flag   varchar2(1);
"
"            BEGIN
"
"
"
"              SELECT glmctrl_fin_exch_rate_flag
"
"			    INTO c_fin_exch_rate_flag
"
"                FROM glm_control
"
"               WHERE glmctrl_bu = p_bu;
"
"
"
"	          IF cr_hd.suphd_exchange_rate = 0 OR c_fin_exch_rate_flag = 'Y'
"
"	     	  THEN
"
"	             UPDATE suplr_doc_ln
"
"				    SET supln_exchange_rate = cr_hd.suphd_exchange_rate
"
"			      WHERE supln_bu = p_bu
"
"					AND supln_doc_no = p_doc_no;
"
"	          END IF;
"
"			END; */
"
"
"
"            proc_chk_hsn_sac_code (p_bu,p_doc_no,cr_hd.suphd_grn_refer);
"
"
"
"            UPDATE suplr_doc_hd
"
"               SET suphd_ref_unit = p_plnt
"
"             WHERE suphd_bu = p_bu
"
"               AND suphd_doc_no = p_doc_no
"
"               AND suphd_pfx = p_doc_pfx;
"
"
"
"            IF cr_hd.suphd_grn_refer NOT IN('LC','SCO')
"
"            THEN
"
"                proc_upd_supln_grn_qty (p_bu, p_doc_pfx, p_doc_no);
"
"		    END IF;
"
"
"
"            p_jrnl_flag := 'Y';
"
"         END IF;
"
"
"
"         OPEN c_hd;
"
"
"
"         FETCH c_hd INTO cr_hd;
"
"
"
"         CLOSE c_hd;
"
"
"
"		 DECLARE
"
"		   v_tcs_flag   VARCHAR2 (10);
"
"		   v_cnt        NUMBER(5);
"
"		 BEGIN
"
"		   SELECT suplr_tcs_appl
"
"			 INTO v_tcs_flag
"
"			 FROM suppliers
"
"			WHERE suplr_bu = p_bu
"
"			  AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"		   SELECT COUNT(*)
"
"             INTO v_cnt
"
"             FROM suplr_doc_ln
"
"            WHERE supln_bu = p_bu
"
"			  AND supln_tcs_us_id IS NOT NULL
"
"              AND supln_doc_no = p_doc_no;
"
"
"
"		   IF cr_hd.suphd_tds_flag = 'N' AND p_jrnl_flag = 'Y' AND v_tcs_flag = 'Y' AND v_cnt > 0
"
"		   THEN
"
"			  proc_calc_tcs_details (p_bu,
"
"									 p_plnt,
"
"									 p_doc_pfx,
"
"									 p_doc_no,
"
"									 TRUNC (cr_hd.suphd_doc_date),
"
"									 cr_hd.suphd_suplr_id,
"
"									 cr_hd.suphd_currency,
"
"									 p_user,
"
"									 cr_hd.suphd_grn_refer,
"
"									 cr_hd.suphd_plnt_loc_id);
"
"		   END IF;
"
"         END;
"
"
"
"
"
"         OPEN c_hd;
"
"
"
"         FETCH c_hd INTO cr_hd;
"
"
"
"         CLOSE c_hd;
"
"             proc_upd_amount_apm1010(p_bu,
"
"                                     p_doc_pfx,
"
"                                     p_doc_no,
"
"                                     cr_hd.suphd_currency,
"
"                                     cr_hd.suphd_doc_type,
"
"                                     cr_hd.suphd_grn_refer,
"
"                                     cr_hd.suphd_suplr_id);
"
"
"
"         OPEN c_hd;
"
"
"
"         FETCH c_hd INTO cr_hd;
"
"
"
"         CLOSE c_hd;
"
"
"
"         IF     cr_hd.suphd_tds_flag <> 'Y'
"
"            AND cr_hd.suphd_doc_type IN ('SB')
"
"            AND p_jrnl_flag = 'Y'
"
"         THEN
"
"            DECLARE
"
"               CURSOR c1
"
"               IS
"
"                  SELECT suplr_tds_flag, suplr_esi_flag, suplr_pf_flag
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"					 AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"					 AND (suplr_esi_flag = 'Y' OR suplr_tds_flag = 'Y' OR suplr_pf_flag = 'Y');
"
"
"
"               CURSOR c2
"
"               IS
"
"                  SELECT supln_seq_no, supln_ap_gl_acct, supln_tds_us_id
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"                     AND supln_tds_us_id IS NOT NULL
"
"					 AND supln_type = 'C';
"
"
"
"               CURSOR c2_1
"
"               IS
"
"                  SELECT supln_seq_no, supln_ap_gl_acct, supln_tds_us_id
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"					 AND supln_type = 'C';
"
"
"
"               CURSOR c4
"
"               IS
"
"                  SELECT 1
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"                     AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                     AND suplr_tds_flag = 'N';
"
"
"
"               CURSOR c5 (
"
"                  c_acct VARCHAR2)
"
"               IS
"
"                  SELECT glac_acct
"
"                    FROM gl_accts
"
"                   WHERE glac_bu = p_bu
"
"                     AND glac_acct = c_acct
"
"                     AND glac_esi_appl_flag = 'Y';
"
"
"
"               CURSOR c05 (
"
"                  c_acct VARCHAR2)
"
"               IS
"
"                  SELECT glac_acct
"
"                    FROM gl_accts
"
"                   WHERE glac_bu = p_bu
"
"                     AND glac_acct = c_acct
"
"                     AND glac_pf_appl_flag = 'Y';
"
"
"
"               CURSOR c6
"
"               IS
"
"                  SELECT suplr_suplr_id
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"                     AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                     AND suplr_esi_flag = 'N';
"
"
"
"               CURSOR c06
"
"               IS
"
"                  SELECT suplr_suplr_id
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"                     AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                     AND suplr_pf_flag = 'N';
"
"
"
"               CURSOR c7
"
"               IS
"
"                  SELECT supln_seq_no,
"
"                         supln_prod_id,
"
"                         supln_prod_rev,
"
"                         supln_tds_us_id
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"                     AND supln_tds_us_id IS NOT NULL;
"
"
"
"               CURSOR c7_1
"
"               IS
"
"                  SELECT supln_seq_no,
"
"                         supln_prod_id,
"
"                         supln_prod_rev,
"
"                         supln_tds_us_id
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no;
"
"
"
"               CURSOR c8 (
"
"                  c_prod_id     VARCHAR2,
"
"                  c_prod_rev    NUMBER)
"
"               IS
"
"                  SELECT prod_id
"
"                    FROM products
"
"                   WHERE prod_bu = p_bu
"
"                     AND prod_id = c_prod_id
"
"                     AND (prod_rev = c_prod_rev OR c_prod_rev IS NULL)
"
"                     AND prod_tds_us_id IS NOT NULL;
"
"
"
"               CURSOR c9 (
"
"                  c_prod_id     VARCHAR2,
"
"                  c_prod_rev    NUMBER)
"
"               IS
"
"                  SELECT prod_id
"
"                    FROM products
"
"                   WHERE prod_bu = p_bu
"
"                     AND prod_id = c_prod_id
"
"                     AND (prod_rev = c_prod_rev OR c_prod_rev IS NULL)
"
"                     AND prod_esi_appl_flag = 'Y';
"
"
"
"               CURSOR c09 (
"
"                  c_prod_id     VARCHAR2,
"
"                  c_prod_rev    NUMBER)
"
"               IS
"
"                  SELECT prod_id
"
"                    FROM products
"
"                   WHERE prod_bu = p_bu
"
"                     AND prod_id = c_prod_id
"
"                     AND (prod_rev = c_prod_rev OR c_prod_rev IS NULL)
"
"                     AND prod_pf_appl_flag = 'Y';
"
"
"
"               CURSOR c11
"
"               IS
"
"                  SELECT sdpl_subseq_no,
"
"                         sdpl_prod_id,
"
"                         sdpl_prod_rev,
"
"                         sdpl_tds_us_id
"
"                    FROM suplr_doc_proc_ln
"
"                   WHERE sdpl_bu = p_bu
"
"                     AND sdpl_doc_no = p_doc_no
"
"                     AND sdpl_tds_us_id IS NOT NULL;
"
"
"
"               CURSOR c11_1
"
"               IS
"
"                  SELECT sdpl_subseq_no,
"
"                         sdpl_prod_id,
"
"                         sdpl_prod_rev,
"
"                         sdpl_tds_us_id
"
"                    FROM suplr_doc_proc_ln
"
"                   WHERE sdpl_bu = p_bu
"
"                     AND sdpl_doc_no = p_doc_no;
"
"
"
"               CURSOR c12 (
"
"                  c_tds_no VARCHAR2)
"
"               IS
"
"                  SELECT *
"
"                    FROM suplr_bill_ded
"
"                   WHERE sbd_bu = p_bu
"
"                     AND sbd_suplr_id = cr_hd.suphd_suplr_id
"
"                     AND sbd_tds_us_id = c_tds_no;
"
"
"
"               CURSOR c23
"
"               IS
"
"                  SELECT supln_seq_no, supln_ap_gl_acct, supln_tds_us_id
"
"                    FROM suplr_doc_hd, suplr_doc_ln
"
"                   WHERE suphd_bu = supln_bu
"
"                     AND suphd_doc_no = supln_doc_no
"
"                     AND supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"                     AND supln_tds_us_id IS NOT NULL
"
"                     AND suphd_doc_type NOT IN('DN', 'CN');
"
"
"
"               CURSOR c24
"
"               IS
"
"                  SELECT supln_seq_no,
"
"                         supln_prod_id,
"
"                         supln_prod_rev,
"
"                         supln_tds_us_id
"
"                    FROM suplr_doc_hd, suplr_doc_ln
"
"                   WHERE suphd_bu = supln_bu
"
"                     AND suphd_doc_no = supln_doc_no
"
"                     AND supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"                     AND supln_tds_us_id IS NOT NULL
"
"                     AND suphd_doc_type  NOT IN ('DN', 'CN');
"
"
"
"               CURSOR c25
"
"               IS
"
"                  SELECT sdpl_subseq_no,
"
"                         sdpl_prod_id,
"
"                         sdpl_prod_rev,
"
"                         sdpl_tds_us_id
"
"                    FROM suplr_doc_hd, suplr_doc_proc_ln
"
"                   WHERE suphd_bu = sdpl_bu
"
"                     AND suphd_doc_no = sdpl_doc_no
"
"                     AND sdpl_bu = p_bu
"
"                     AND sdpl_doc_no = p_doc_no
"
"                     AND sdpl_tds_us_id IS NOT NULL
"
"                     AND suphd_doc_type NOT IN('DN', 'CN');
"
"
"
"               CURSOR c26
"
"               IS
"
"                  SELECT suplr_suplr_id
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"                     AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                     AND suplr_esi_flag = 'Y';
"
"
"
"               CURSOR c27
"
"               IS
"
"                  SELECT suplr_suplr_id
"
"                    FROM suppliers
"
"                   WHERE suplr_bu = p_bu
"
"                     AND suplr_suplr_id = cr_hd.suphd_suplr_id
"
"                     AND suplr_pf_flag = 'Y';
"
"
"
"               v_cnt        NUMBER;
"
"               v_type       VARCHAR2 (1);
"
"               cr1          c1%ROWTYPE;
"
"               cr4          c4%ROWTYPE;
"
"               cr5          c5%ROWTYPE;
"
"               cr05         c05%ROWTYPE;
"
"               cr6          c6%ROWTYPE;
"
"               cr06         c06%ROWTYPE;
"
"               cr8          c8%ROWTYPE;
"
"               cr9          c9%ROWTYPE;
"
"               cr09         c09%ROWTYPE;
"
"               cr12         c12%ROWTYPE;
"
"               cr23         c23%ROWTYPE;
"
"               cr24         c24%ROWTYPE;
"
"               cr25         c25%ROWTYPE;
"
"               cr26         c26%ROWTYPE;
"
"               cr27         c27%ROWTYPE;
"
"               v_bill_rnd   NUMBER;
"
"            BEGIN
"
"
"
"               v_bill_rnd := func_find_party_bill_rnd (p_bu, cr_hd.suphd_suplr_id,1);
"
"
"
"               FOR cr2_1 IN c2_1
"
"               LOOP
"
"
"
"                  OPEN c5 (cr2_1.supln_ap_gl_acct);
"
"
"
"                  FETCH c5 INTO cr5;
"
"
"
"                  IF c5%FOUND
"
"                  THEN
"
"                     OPEN c6;
"
"
"
"                     FETCH c6 INTO cr6;
"
"
"
"                     IF c6%FOUND
"
"                        AND cr_hd.suphd_esi_exmp_flag = 'N'
"
"                        AND cr_hd.suphd_currency = 'INR' AND cr_hd.suphd_party_type IN('S','C')
"
"                     THEN
"
"                        raise_application_error (-20999,'Please check the ESI flag for this Supplier.');
"
"                     END IF;
"
"
"
"                     CLOSE c6;
"
"                  END IF;
"
"
"
"                  CLOSE c5;
"
"
"
"                  OPEN c05 (cr2_1.supln_ap_gl_acct);
"
"
"
"                  FETCH c05 INTO cr05;
"
"
"
"                  IF c05%FOUND
"
"                  THEN
"
"
"
"                     OPEN c06;
"
"
"
"                     FETCH c06 INTO cr06;
"
"
"
"                     IF c06%FOUND AND cr_hd.suphd_currency = 'INR' AND cr_hd.suphd_party_type IN('S','C')
"
"                     THEN
"
"                        raise_application_error (-20999,'Please check the PF flag for this Supplier.');
"
"                     END IF;
"
"
"
"                     CLOSE c06;
"
"                  END IF;
"
"
"
"                  CLOSE c05;
"
"               END LOOP c2_1;
"
"
"
"               IF cr_hd.suphd_grn_refer NOT IN ('SCO') AND cr_hd.suphd_party_type IN('S','C')
"
"               THEN
"
"                  FOR cr7_1 IN c7_1
"
"                  LOOP
"
"                     OPEN c9 (cr7_1.supln_prod_id, cr7_1.supln_prod_rev);
"
"
"
"                     FETCH c9 INTO cr9;
"
"
"
"                     IF c9%FOUND
"
"                     THEN
"
"                        OPEN c6;
"
"
"
"                        FETCH c6 INTO cr6;
"
"
"
"                        IF c6%FOUND
"
"                           AND cr_hd.suphd_esi_exmp_flag = 'N'
"
"                           AND cr_hd.suphd_currency = 'INR'
"
"                        THEN
"
"                           raise_application_error (-20999,'Please check the ESI flag for this Supplier.');
"
"                        END IF;
"
"
"
"                        CLOSE c6;
"
"                     END IF;
"
"
"
"                     CLOSE c9;
"
"
"
"                     OPEN c09 (cr7_1.supln_prod_id, cr7_1.supln_prod_rev);
"
"
"
"                     FETCH c09 INTO cr09;
"
"
"
"                     IF c09%FOUND
"
"                     THEN
"
"                        OPEN c06;
"
"
"
"                        FETCH c06 INTO cr06;
"
"
"
"                        IF c06%FOUND AND cr_hd.suphd_currency = 'INR'
"
"                        THEN
"
"                           raise_application_error (-20999,'Please check the PF flag for this Supplier.');
"
"                        END IF;
"
"
"
"                        CLOSE c06;
"
"                     END IF;
"
"
"
"                     CLOSE c09;
"
"                  END LOOP c7_1;
"
"               END IF;
"
"
"
"               IF cr_hd.suphd_grn_refer IN ('SCO') AND cr_hd.suphd_party_type IN('S','C')
"
"               THEN
"
"                  FOR cr11_1 IN c11_1
"
"                  LOOP
"
"                     OPEN c9 (cr11_1.sdpl_prod_id, cr11_1.sdpl_prod_rev);
"
"
"
"                     FETCH c9 INTO cr9;
"
"
"
"                     IF c9%FOUND
"
"                     THEN
"
"                        OPEN c6;
"
"
"
"                        FETCH c6 INTO cr6;
"
"
"
"                        IF     c6%FOUND
"
"                           AND cr_hd.suphd_esi_exmp_flag = 'N'
"
"                           AND cr_hd.suphd_currency = 'INR'
"
"                        THEN
"
"                           raise_application_error (-20999,'Please check the ESI flag for this Supplier.');
"
"                        END IF;
"
"
"
"                        CLOSE c6;
"
"                     END IF;
"
"
"
"                     CLOSE c9;
"
"
"
"                     OPEN c09 (cr11_1.sdpl_prod_id, cr11_1.sdpl_prod_rev);
"
"
"
"                     FETCH c09 INTO cr09;
"
"
"
"                     IF c09%FOUND
"
"                     THEN
"
"                        OPEN c06;
"
"
"
"                        FETCH c06 INTO cr06;
"
"
"
"                        IF c06%FOUND AND cr_hd.suphd_currency = 'INR'
"
"                        THEN
"
"                           raise_application_error (-20999,'Please check the PF flag for this Supplier.');
"
"                        END IF;
"
"
"
"                        CLOSE c06;
"
"                     END IF;
"
"
"
"                     CLOSE c09;
"
"                  END LOOP c11_1;
"
"               END IF;
"
"
"
"
"
"               IF cr_hd.suphd_grn_refer NOT IN ('LC')
"
"               THEN
"
"                  OPEN c1;
"
"
"
"                  FETCH c1 INTO cr1;
"
"
"
"                  IF c1%FOUND
"
"                  THEN
"
"                     IF cr1.suplr_tds_flag = 'Y'
"
"                     THEN
"
"
"
"                        OPEN c23;
"
"
"
"                        FETCH c23 INTO cr23;
"
"
"
"                        IF c23%FOUND AND cr_hd.suphd_tds_flag = 'N'
"
"                        THEN
"
"                           raise_application_error (-20999,'Please Apply Deductions1.');
"
"                        END IF;
"
"
"
"                        CLOSE c23;
"
"
"
"
"
"                        OPEN c24;
"
"
"
"                        FETCH c24 INTO cr24;
"
"
"
"                        IF c24%FOUND AND cr_hd.suphd_tds_flag = 'N'
"
"                        THEN
"
"                           raise_application_error (-20999,'Please Apply Deductions2.');
"
"                        END IF;
"
"
"
"                        CLOSE c24;
"
"
"
"
"
"                        OPEN c25;
"
"
"
"                        FETCH c25 INTO cr25;
"
"
"
"                        IF c25%FOUND AND cr_hd.suphd_tds_flag = 'N'
"
"                        THEN
"
"                           raise_application_error (-20999,'Please Apply Deductions3.');
"
"                        END IF;
"
"
"
"                        CLOSE c25;
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  CLOSE c1;
"
"               END IF;
"
"            END;
"
"         END IF;
"
"
"
"       OPEN c_hd;
"
"
"
"       FETCH c_hd INTO cr_hd;
"
"
"
"       CLOSE c_hd;
"
"
"
"             IF p_jrnl_flag = 'Y'
"
"             THEN
"
"				 DECLARE
"
"					CURSOR c1
"
"					IS
"
"					   SELECT suphd_plant, suphd_doc_no, suphd_pfx
"
"						 FROM suplr_doc_hd
"
"						WHERE suphd_bu = p_bu
"
"						  AND suphd_doc_no = p_doc_no
"
"						  AND suphd_pfx = p_doc_pfx
"
"						  AND suphd_proj_id IS NULL;
"
"
"
"					CURSOR c2 (
"
"					   c_plnt VARCHAR2)
"
"					IS
"
"					   SELECT bedscc_ac_lvl_prj pcc_ac_lvl_prj,
"
"							  func_find_gl_level_desc (p_bu,
"
"													   5,
"
"													   bedscc_ac_lvl_prj,
"
"													   1)
"
"								 pcc_desc
"
"						 FROM be_dflt_sc_cc
"
"						WHERE bedscc_bu = p_bu
"
"							  AND func_find_glm_bs_lvl (p_bu) = 'E'
"
"					   UNION ALL
"
"					   SELECT budscc_ac_lvl_prj pcc_ac_lvl_prj,
"
"							  func_find_gl_level_desc (p_bu,
"
"													   5,
"
"													   budscc_ac_lvl_prj,
"
"													   1)
"
"								 pcc_desc
"
"						 FROM bu_dflt_sc_cc
"
"						WHERE budscc_bu = p_bu
"
"						  AND func_find_glm_bs_lvl (p_bu) = 'U'
"
"						  AND budscc_plnt = c_plnt;
"
"
"
"					cr1   c1%ROWTYPE;
"
"					cr2   c2%ROWTYPE;
"
"				 BEGIN
"
"					OPEN c1;
"
"
"
"					FETCH c1 INTO cr1;
"
"
"
"					IF c1%FOUND
"
"					THEN
"
"					   OPEN c2 (cr1.suphd_plant);
"
"
"
"					   FETCH c2 INTO cr2;
"
"
"
"					   IF c2%FOUND
"
"					   THEN
"
"						  UPDATE suplr_doc_hd
"
"							 SET suphd_proj_id = cr2.pcc_ac_lvl_prj
"
"						   WHERE suphd_bu = p_bu
"
"							 AND suphd_doc_no = p_doc_no
"
"							 AND suphd_pfx = p_doc_pfx;
"
"					   END IF;
"
"
"
"					   CLOSE c2;
"
"					END IF;
"
"
"
"					CLOSE c1;
"
"				 END;
"
"             END IF;
"
"
"
"	    ---newly added process
"
"
"
"        IF func_find_glm_gst_flg (p_bu) = 'Y' AND p_jrnl_flag = 'Y'
"
"	    THEN
"
"		   proc_web_upd_gst_cls_type (p_bu,
"
"									  cr_hd.suphd_suplr_id,
"
"									  p_doc_pfx,
"
"									  p_doc_no,
"
"									  p_plnt,
"
"									  cr_hd.suphd_bill_loc_name);
"
"
"
"		   proc_cre_suplr_doc_tax(p_bu, p_plnt,p_doc_pfx, p_doc_no);
"
"
"
"		   proc_upd_amount_apm1010 (p_bu,p_doc_pfx,p_doc_no,cr_hd.suphd_currency,cr_hd.suphd_doc_type,cr_hd.suphd_grn_refer,cr_hd.suphd_suplr_id);
"
"
"
"		   Proc_upd_gst_values (p_bu, p_doc_pfx, p_doc_no);
"
"	    END IF;
"
"
"
"        OPEN c_hd;
"
"
"
"        FETCH c_hd INTO cr_hd;
"
"
"
"        CLOSE c_hd;
"
"
"
"         BEGIN
"
"            proc_ins_proj_det (p_bu,
"
"                               p_doc_pfx,
"
"                               p_doc_no,
"
"                               cr_hd.suphd_doc_type,
"
"                               cr_hd.suphd_sc_tot_amt,
"
"                               cr_hd.suphd_rnd_off_amt,
"
"                               p_user);
"
"         END;
"
"
"
"         DECLARE
"
"            v_rnd   NUMBER (12, 3);
"
"         BEGIN
"
"            v_rnd := func_find_appl_rnddigit (p_bu);
"
"
"
"            Proc_ins_disc (
"
"               p_bu,
"
"               cr_hd.suphd_plant,
"
"               p_doc_pfx,
"
"               p_doc_no,
"
"               cr_hd.suphd_doc_type,
"
"               cr_hd.suphd_doc_date,
"
"               NVL (cr_hd.suphd_suplr_doc_date, cr_hd.suphd_doc_date),
"
"               cr_hd.suphd_term_id,
"
"               ROUND (cr_hd.suphd_sc_tot_amt - cr_hd.suphd_sc_disc_amt,
"
"                      v_rnd),
"
"               ROUND (cr_hd.suphd_bill_tax_amt, v_rnd),
"
"               p_user,
"
"               SYSDATE,
"
"               cr_hd.suphd_check_flag,
"
"               NULL,
"
"               cr_hd.suphd_currency,
"
"               cr_hd.suphd_grn_refer);
"
"         END;
"
"
"
"
"
"         IF p_jrnl_flag = 'Y'
"
"         THEN
"
"            IF cr_hd.suphd_lc_flag = 'N'
"
"            THEN
"
"               DECLARE
"
"                  CURSOR c1
"
"                  IS
"
"                     SELECT COUNT (*) COUNT
"
"                       FROM suplr_doc_hd, suplr_doc_ln, pur_order_hd
"
"                      WHERE suphd_bu = p_bu
"
"                        AND p_plnt = suphd_plant
"
"                        AND p_doc_pfx = suphd_pfx
"
"                        AND p_doc_no = suphd_doc_no
"
"                        AND cr_hd.suphd_suplr_id = suphd_suplr_id
"
"                        AND suphd_bu = supln_bu
"
"                        AND suphd_doc_no = supln_doc_no
"
"                        AND poh_bu = supln_bu
"
"                        AND poh_order_pfx = supln_po_pfx
"
"                        AND poh_order_no = supln_po_no
"
"                        AND poh_lc_req_flag = 'Y';
"
"
"
"                  cr1   c1%ROWTYPE;
"
"               BEGIN
"
"                  OPEN c1;
"
"
"
"                  FETCH c1 INTO cr1;
"
"
"
"                  IF c1%FOUND AND cr1.COUNT <> 0
"
"                  THEN
"
"                     raise_application_error (-20999, 'LC is Required.');
"
"                  END IF;
"
"
"
"                  CLOSE C1;
"
"               END;
"
"            END IF;
"
"         END IF;
"
"
"
"         ------**** For LM Amount Mismatch ***
"
"         DECLARE
"
"            CURSOR c1
"
"            IS
"
"               SELECT NVL (SUM (supln_lm_disc_amt), 0) supln_lm_disc_amt
"
"                 FROM suplr_doc_ln
"
"                WHERE supln_bu = p_bu
"
"                  AND supln_doc_no = p_doc_no;
"
"
"
"            cr1        c1%ROWTYPE;
"
"            v_lm_amt   NUMBER;
"
"         BEGIN
"
"            OPEN c1;
"
"
"
"            FETCH c1 INTO cr1;
"
"
"
"            v_lm_amt := cr_hd.suphd_lm_disc_amt;
"
"
"
"            IF c1%FOUND
"
"            THEN
"
"               IF cr1.supln_lm_disc_amt <> v_lm_amt
"
"               THEN
"
"                  raise_application_error (-20999,'LM Amount is not matched with line amount.');
"
"               END IF;
"
"            END IF;
"
"
"
"            CLOSE c1;
"
"         END;
"
"
"
"         OPEN c_hd;
"
"
"
"         FETCH c_hd INTO cr_hd;
"
"
"
"         CLOSE c_hd;
"
"         -------------------------------------------------Landed cost ----
"
"         BEGIN
"
"            IF cr_hd.suphd_suplr_doc_no IS NULL
"
"            THEN
"
"               raise_application_error (-20999,'Bill number must be entered.');
"
"            END IF;
"
"
"
"            IF cr_hd.suphd_grn_refer IN ('ST')
"
"            THEN                                                       ---ALEX
"
"               IF cr_hd.suphd_plant <> cr_hd.suphd_ref_unit
"
"               THEN
"
"                  raise_application_error (-20999,'Sou.Unit And Ref.Unit Must be Same');
"
"               END IF;
"
"            END IF;
"
"
"
"
"
"            BEGIN
"
"               FOR cr1
"
"                  IN (SELECT supln_bfcry_id, supln_bfcry_type
"
"                        FROM suplr_doc_hd, suplr_doc_ln
"
"                       WHERE suphd_bu = supln_bu
"
"                         AND suphd_doc_no = supln_doc_no
"
"                         AND suphd_plant = supln_plnt
"
"                         AND suphd_bu = p_bu
"
"                         AND suphd_pfx = p_doc_pfx
"
"                         AND suphd_doc_no = p_doc_no
"
"                         AND supln_bfcry_type = 'T')
"
"               LOOP
"
"                  IF cr1.supln_bfcry_id IS NULL
"
"                     AND cr1.supln_bfcry_type IN ('T')
"
"                  THEN
"
"                     raise_application_error (-20999,'Bfcry./Tax ID Should not be null.');
"
"                  END IF;
"
"               END LOOP;
"
"            END;
"
"
"
"            IF p_jrnl_flag = 'Y'
"
"            THEN
"
"               DECLARE
"
"                  due_date   DATE;
"
"               BEGIN
"
"                  SELECT MIN (NVL (sdd_due_date, TRUNC (SYSDATE)))
"
"                    INTO due_date
"
"                    FROM suplr_doc_disc
"
"                   WHERE sdd_bu = p_bu
"
"                     AND sdd_doc_no = p_doc_no;
"
"
"
"                  IF due_date < TRUNC (cr_hd.suphd_doc_date)
"
"                  THEN
"
"                     raise_application_error (-20999,'Due date should be greater than or equal to document date.');
"
"                  END IF;
"
"
"
"                  IF TRUNC (cr_hd.suphd_doc_date) > TRUNC (SYSDATE)
"
"                  THEN
"
"                     raise_application_error (-20999,'Document date should be less than or equal to Current date.');
"
"                  END IF;
"
"               END;
"
"            END IF;
"
"
"
"            DECLARE
"
"               CURSOR c1
"
"               IS
"
"				  SELECT supln_doc_no,
"
"					     supln_seq_no,
"
"					     supln_unit_cost
"
"				    FROM suplr_doc_ln
"
"				   WHERE supln_bu = p_bu
"
"				     AND supln_doc_no = p_doc_no
"
"				     AND supln_currency = cr_hd.suphd_currency
"
"				     AND supln_type = 'C'
"
"			    ORDER BY supln_doc_no, supln_seq_no;
"
"
"
"               CURSOR c2
"
"               IS
"
"                  SELECT supln_doc_no sdlitc_doc_no,
"
"                         supln_seq_no sdlitc_seq_no,
"
"                         NVL (SUM (supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt), 0) sdlitc_tax_amt
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"                     AND supln_type = 'I'
"
"					 AND supln_gst_rev_tax_flag = 'N'
"
"                     AND supln_hsn_code IS NOT NULL
"
"                ORDER BY sdlitc_doc_no, sdlitc_seq_no;
"
"
"
"               CURSOR c4
"
"               IS
"
"                  SELECT 1
"
"                    FROM suplr_doc_hd, suplr_doc_ln
"
"                   WHERE suphd_bu = supln_bu
"
"                     AND suphd_doc_no = supln_doc_no
"
"                     AND suphd_bu = p_bu
"
"                     AND suphd_pfx = p_doc_pfx
"
"                     AND suphd_doc_no = p_doc_no
"
"                     AND suphd_grn_refer IN('PR', 'SCO', 'ST')
"
"                     AND supln_tcf_id IS NULL;
"
"
"
"               CURSOR c5
"
"               IS
"
"                  SELECT 1
"
"                    FROM suplr_doc_hd, suplr_doc_ln
"
"                   WHERE suphd_bu = supln_bu
"
"                     AND suphd_doc_no = supln_doc_no
"
"                     AND suphd_bu = p_bu
"
"                     AND suphd_pfx = p_doc_pfx
"
"                     AND suphd_doc_no = p_doc_no
"
"                     AND supln_dept_id IS NULL
"
"                     AND EXISTS
"
"                            (SELECT 1
"
"                               FROM apm_control
"
"                              WHERE apmc_bu = p_bu
"
"                                    AND ( (apmc_pur_acct_src = '02'
"
"                                           AND suphd_grn_refer IN
"
"                                                  ('PR'))
"
"                                         OR (apmc_sc_acct_src = '02'
"
"                                             AND suphd_grn_refer IN
"
"                                                    ('SCO'))));
"
"
"
"
"
"
"
"               v_rnd   NUMBER := 0;
"
"               v_amt   VARCHAR2 (30);
"
"               cr4     c4%ROWTYPE;
"
"               cr5     c5%ROWTYPE;
"
"            BEGIN
"
"
"
"               IF cr_hd.suphd_currency = v_base_curr
"
"               THEN
"
"                  v_rnd := func_find_appl_rnddigit (p_bu);
"
"               ELSE
"
"                  v_rnd := Func_find_currency_dec (p_bu, cr_hd.suphd_currency);
"
"               END IF;
"
"
"
"               OPEN c5;
"
"
"
"               FETCH c5 INTO cr5;
"
"
"
"               IF c5%FOUND
"
"               THEN
"
"                  raise_application_error (-20999,'Department must be entered.');
"
"               END IF;
"
"
"
"               CLOSE c5;
"
"
"
"            END;
"
"
"
"            OPEN c_hd;
"
"
"
"            FETCH c_hd INTO cr_hd;
"
"
"
"            CLOSE c_hd;
"
"
"
"            IF p_jrnl_flag = 'Y'
"
"            THEN
"
"               DECLARE
"
"			      v_rnd           NUMBER := 0;
"
"
"
"                  CURSOR c1
"
"                  IS
"
"                     SELECT SUM (ROUND((supln_inv_qty * supln_unit_cost) - (supln_inv_disc_amt + supln_lm_disc_amt),v_rnd))
"
"                               line_amt
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND supln_type = 'I';
"
"
"
"                  CURSOR c2
"
"                  IS
"
"                     SELECT SUM (tax_amount) tax_amount,
"
"                            SUM (tax_amount_dr) tax_amount_dr,
"
"                            SUM (tax_amount_cr) tax_amount_cr,
"
"                            SUM (grn_tax_amount) grn_tax_amount
"
"                       FROM (SELECT 0 tax_amount,
"
"                                    SUM(supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt) tax_amount_dr,
"
"                                    0 tax_amount_cr,
"
"                                    0 grn_tax_amount
"
"                               FROM suplr_doc_ln
"
"                              WHERE supln_bu = p_bu
"
"                                AND supln_doc_no = p_doc_no
"
"								AND supln_gst_rev_tax_flag = 'N'
"
"								AND supln_contra_flag = 'N'
"
"                                AND supln_dr_cr = 'DR'
"
"                                AND supln_type = 'C'
"
"                             UNION ALL
"
"						     SELECT 0 tax_amount,
"
"									0 tax_amount_dr,
"
"									SUM(supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt) tax_amount_cr,
"
"									0 grn_tax_amount
"
"								FROM suplr_doc_ln
"
"							   WHERE supln_bu = p_bu
"
"								 AND supln_doc_no = p_doc_no
"
"								 AND supln_contra_flag = 'N'
"
"								 AND supln_gst_rev_tax_flag = 'N'
"
"								 AND supln_dr_cr = 'CR'
"
"								 AND supln_type = 'C'
"
"                              UNION ALL
"
"                              SELECT SUM(supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt) tax_amount,
"
"                                     0 tax_amount_dr,
"
"                                     0 tax_amount_cr,
"
"                                     0 grn_tax_amount
"
"								FROM suplr_doc_ln
"
"							   WHERE supln_bu = p_bu
"
"								 AND supln_doc_no = p_doc_no
"
"								 AND supln_contra_flag = 'N'
"
"								 AND supln_gst_rev_tax_flag = 'N'
"
"								 AND supln_type IN('I'));
"
"
"
"                  CURSOR c2a
"
"                  IS
"
"                      SELECT NVL (SUM (supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt), 0) tax_amount
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_plnt = p_plnt
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND supln_gst_rev_tax_flag = 'N'
"
"                        AND supln_type = 'C';
"
"
"
"                  CURSOR c3
"
"                  IS
"
"                     SELECT SUM (supln_unit_cost) dist_amt
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND supln_currency = cr_hd.suphd_currency
"
"                        AND supln_contra_flag = 'N'
"
"                        AND supln_type = 'C';
"
"
"
"                  CURSOR c4
"
"                  IS
"
"                       SELECT NVL (SUM (sdd_due_amt), 0) var_sum_due_amt,
"
"                              MAX (sdd_seq_no) var_seq_no,
"
"                              sdd_due_type var_due_type,
"
"                              NVL (SUM (sdd_mtrl_pct), 0) var_mtrl_pct,
"
"                              NVL (SUM (sdd_tax_pct), 0) var_tax_pct
"
"                         FROM suplr_doc_disc
"
"                        WHERE sdd_bu = p_bu
"
"                          AND sdd_doc_no = p_doc_no
"
"                     GROUP BY sdd_due_type;
"
"
"
"                  CURSOR c5
"
"                  IS
"
"                     SELECT (NVL (SUM (supln_unit_cost), 0)) dist_amt
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND supln_contra_flag = 'N'
"
"                        AND supln_dr_cr = 'DR'
"
"                        AND supln_type IN('C');
"
"
"
"                  CURSOR c7
"
"                  IS
"
"                     SELECT (NVL (SUM (supln_unit_cost), 0)) dist_amt
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND supln_contra_flag = 'N'
"
"                        AND supln_dr_cr = 'CR'
"
"                        AND supln_type IN('C');
"
"
"
"                  CURSOR c10
"
"                  IS
"
"                     SELECT NVL (SUM (supln_igst_amt + supln_cgst_amt + supln_sgst_amt + supln_utgst_amt + supln_cess_amt), 0) inv_tax_amt
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND supln_gst_rev_tax_flag = 'N'
"
"                        AND supln_type = 'I';
"
"
"
"                  CURSOR c11(c_seq_no  NUMBER)
"
"                  IS
"
"					 SELECT NVL((sdpl_proc_cost), 0) proc_cost
"
"					   FROM suplr_doc_ln, suplr_doc_proc_ln
"
"					  WHERE sdpl_bu = supln_bu
"
"						AND sdpl_doc_no = supln_doc_no
"
"						AND sdpl_seq_no = supln_seq_no
"
"						AND supln_bu = p_bu
"
"						AND supln_seq_no = c_seq_no
"
"						AND supln_doc_no = p_doc_no
"
"						AND supln_type = 'I';
"
"
"
"				  CURSOR c11a
"
"                  IS
"
"						 SELECT supln_unit_cost unit_cost,
"
"								supln_seq_no
"
"						   FROM suplr_doc_ln, suplr_doc_proc_ln
"
"						  WHERE sdpl_bu = supln_bu
"
"							AND sdpl_doc_no = supln_doc_no
"
"							AND sdpl_seq_no = supln_seq_no
"
"							AND supln_bu = p_bu
"
"							AND supln_doc_no = p_doc_no
"
"							AND supln_type = 'I';
"
"
"
"                  CURSOR c12
"
"                  IS
"
"                     SELECT NVL (SUM (sdpl_proc_qty), 0) proc_qty,
"
"                            NVL ((supln_inv_qty), 0) inv_qty,
"
"							supln_seq_no
"
"				       FROM(SELECT NVL ((sdpl_proc_qty), 0) sdpl_proc_qty,
"
"                                   NVL ((supln_inv_qty), 0) supln_inv_qty,
"
"                                   supln_seq_no
"
"							  FROM suplr_doc_ln, suplr_doc_proc_ln
"
"							 WHERE sdpl_bu = supln_bu
"
"						       AND sdpl_doc_no = supln_doc_no
"
"							   AND sdpl_seq_no = supln_seq_no
"
"							   AND supln_bu = p_bu
"
"							   AND supln_doc_no = p_doc_no
"
"							   AND supln_type = 'I')
"
"				   GROUP BY supln_inv_qty,supln_seq_no;
"
"
"
"                  CURSOR c13
"
"                  IS
"
"                     SELECT COUNT (1) cnt
"
"                       FROM suplr_doc_hd
"
"                      WHERE suphd_bu = p_bu
"
"                        AND suphd_suplr_id = cr_hd.suphd_suplr_id
"
"                        AND suphd_doc_year = cr_hd.suphd_doc_year
"
"                        AND suphd_suplr_doc_no = cr_hd.suphd_suplr_doc_no
"
"                        AND suphd_doc_type  = cr_hd.suphd_doc_type
"
"                        AND suphd_doc_type IN( 'CN', 'PTN','SB')
"
"                        AND suphd_pfx || suphd_doc_no <> p_doc_pfx || p_doc_no
"
"                        AND suphd_status IN ('P', 'N', 'O');
"
"
"
"                  CURSOR c14
"
"                  IS
"
"                     SELECT DISTINCT supln_exchange_rate
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_doc_no = p_doc_no;
"
"
"
"                  CURSOR c16
"
"                  IS
"
"                     SELECT sdda_seq_no, sdda_sub_seq_no
"
"                       FROM suplr_doc_dist_adj
"
"                      WHERE sdda_bu = p_bu
"
"                        AND sdda_doc_no = p_doc_no;
"
"
"
"                  CURSOR c17 (
"
"                     c_seq_no        NUMBER,
"
"                     c_sub_seq_no    NUMBER)
"
"                  IS
"
"                       SELECT sddla_seq_no,
"
"                              c_sub_seq_no,
"
"                              NVL (SUM (sddla_ln_adj_val), 0) adj_val
"
"                         FROM suplr_doc_dist_ln_adj
"
"                        WHERE sddla_bu = p_bu
"
"                          AND sddla_doc_no = p_doc_no
"
"                          AND sddla_seq_no = c_seq_no
"
"                          AND (sddla_sub_seq_no = c_sub_seq_no OR c_sub_seq_no IS NULL)
"
"                     GROUP BY sddla_seq_no, c_sub_seq_no;
"
"
"
"                  CURSOR c18 (
"
"                     c_seq_no NUMBER)
"
"                  IS
"
"                     SELECT NVL (SUM (supln_unit_cost * supln_exchange_rate),0)
"
"                            dist_amt
"
"                       FROM suplr_doc_ln
"
"                      WHERE supln_bu = p_bu
"
"                        AND supln_doc_no = p_doc_no
"
"                        AND supln_seq_no = c_seq_no;
"
"
"
"                  cr1             c1%ROWTYPE;
"
"                  cr2             c2%ROWTYPE;
"
"				  cr2a            c2a%ROWTYPE;
"
"                  cr3             c3%ROWTYPE;
"
"                  cr4             c4%ROWTYPE;
"
"                  cr5             c5%ROWTYPE;
"
"                  cr7             c7%ROWTYPE;
"
"				  cr10            c10%ROWTYPE;
"
"                  cr11            c11%ROWTYPE;
"
"				  cr12            c12%ROWTYPE;
"
"                  cr13            c13%ROWTYPE;
"
"                  cr14            c14%ROWTYPE;
"
"                  cr16            c16%ROWTYPE;
"
"                  cr17            c17%ROWTYPE;
"
"                  cr18            c18%ROWTYPE;
"
"                  v_due_disc      NUMBER := 0;
"
"                  v_rndof_amt     NUMBER := 0;
"
"                  post_alert      NUMBER;
"
"                  v_post_flag     VARCHAR2 (1) := 'N';
"
"                  tds_amt         NUMBER := 0;
"
"				  v_bill_rnd      NUMBER := 0;
"
"                  v_rnd_amt       NUMBER := 0;
"
"                  v_adj_val       NUMBER := 0;
"
"                  v_cnt           NUMBER := 0;
"
"                  v_adj_flag      VARCHAR2 (1);
"
"                  v_cnt1          NUMBER := 0;
"
"                  v_ln_cnt        NUMBER := 0;
"
"                  v_land_cnt      NUMBER := 0;
"
"                  v_tot_tax_amt   NUMBER := 0;
"
"               BEGIN
"
"
"
"                  v_rnd := func_find_appl_rnddigit (p_bu);
"
"				  v_bill_rnd := func_find_party_bill_rnd (p_bu, cr_hd.suphd_suplr_id,1);
"
"                  v_rndof_amt := ROUND(ABS ((cr_hd.suphd_bill_amt - cr_hd.suphd_sc_tot_amt) * -1),v_rnd);
"
"
"
"                  FOR cr16 IN c16
"
"                  LOOP
"
"                     v_adj_val := 0;
"
"
"
"                     FOR cr17 IN c17 (cr16.sdda_seq_no, NULL)
"
"                     LOOP
"
"                        v_adj_val := v_adj_val + ROUND (cr17.adj_val, 2);
"
"                     END LOOP c17;
"
"
"
"                     OPEN c17 (cr16.sdda_seq_no, cr16.sdda_sub_seq_no);
"
"
"
"                     FETCH c17 INTO cr17;
"
"
"
"                     IF c17%NOTFOUND OR cr17.adj_val = 0 AND cr_hd.suphd_grn_refer IN('EXP','PO')
"
"                     THEN
"
"                        raise_application_error (-20999,'Distribute the GRN Lines.');
"
"                     END IF;
"
"
"
"                     CLOSE c17;
"
"                  END LOOP c16;
"
"
"
"                  IF cr_hd.suphd_grn_refer IN ('SCO')
"
"                  THEN
"
"                     FOR cr11a IN c11a
"
"                     LOOP
"
"
"
"                        OPEN c11(cr11a.supln_seq_no);
"
"
"
"                        FETCH c11 INTO cr11;
"
"
"
"                        IF cr11.proc_cost <> cr11a.unit_cost
"
"                        THEN
"
"                           raise_application_error (-20999,'Process Cost Should be equal To Unit Cost..'||cr11.proc_cost||'-'||cr11a.unit_cost);
"
"                        END IF;
"
"
"
"						CLOSE c11;
"
"                     END LOOP;
"
"
"
"                     FOR cr12 IN c12
"
"                     LOOP
"
"                        IF cr12.inv_qty <> cr12.proc_qty
"
"                        THEN
"
"                           raise_application_error (-20999,'Process Qty. Should be equal To Inv. Qty..'||cr12.proc_qty||'-'||cr12.inv_qty||'/'||'Line No. -'||cr12.supln_seq_no);
"
"                        END IF;
"
"                     END LOOP;
"
"                  END IF;
"
"
"
"                  OPEN c13;
"
"
"
"                  FETCH c13 INTO cr13;
"
"
"
"                  IF c13%FOUND AND cr13.cnt > 0
"
"                  THEN
"
"                     raise_application_error (-20999,'Bill No. already Exist.');
"
"                  END IF;
"
"
"
"                  CLOSE c13;
"
"
"
"                  IF cr_hd.suphd_ref_unit IS NULL
"
"                  THEN
"
"                     raise_application_error (-20999,'Reference unit must be entered.');
"
"                  END IF;
"
"
"
"                  ----------***********Direct  GRN&Purchase************---------------
"
"                  OPEN c1;
"
"
"
"                  FETCH c1 INTO cr1;
"
"
"
"                  OPEN c2;
"
"
"
"                  FETCH c2 INTO cr2;
"
"
"
"                  OPEN c3;
"
"
"
"                  FETCH c3 INTO cr3;
"
"
"
"                  OPEN c4;
"
"
"
"                  FETCH c4 INTO cr4;
"
"
"
"                  OPEN c5;
"
"
"
"                  FETCH c5 INTO cr5;
"
"
"
"                  OPEN c7;
"
"
"
"                  FETCH c7 INTO cr7;
"
"
"
"                  OPEN c14;
"
"
"
"                  FETCH c14 INTO cr14;
"
"
"
"                  SELECT COUNT (*)
"
"                    INTO v_due_disc
"
"                    FROM suplr_doc_disc
"
"                   WHERE sdd_bu = p_bu
"
"                     AND sdd_plant = cr_hd.suphd_plant
"
"                     AND sdd_doc_no = p_doc_no;
"
"
"
"                  SELECT COUNT (*)
"
"                    INTO v_cnt
"
"                    FROM suplr_doc_hd
"
"                   WHERE suphd_bu = p_bu
"
"                     AND suphd_pfx = p_doc_pfx
"
"                     AND suphd_doc_no = p_doc_no
"
"                     AND suphd_doc_type NOT IN ('SB');
"
"
"
"                  SELECT COUNT (*)
"
"                    INTO v_cnt1
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no
"
"                     AND supln_bfcry_id IS NOT NULL
"
"                     AND supln_contra_flag = 'Y';
"
"
"
"                  SELECT COUNT (*)
"
"                    INTO v_ln_cnt
"
"                    FROM suplr_doc_ln
"
"                   WHERE supln_bu = p_bu
"
"                     AND supln_doc_no = p_doc_no;
"
"
"
"                  IF cr_hd.suphd_doc_type IN  ('SB')
"
"                     AND cr_hd.suphd_grn_refer IN('SCO', 'ST', 'PR','PO')
"
"                  THEN
"
"                     IF v_ln_cnt <= 0
"
"                     THEN
"
"                        raise_application_error (-20999,'Line details not found.');
"
"                     ELSE
"
"                        IF v_base_curr = cr_hd.suphd_currency
"
"                        THEN
"
"                           IF (ABS (
"
"                                    NVL (ROUND (cr2.tax_amount, v_rnd), 0)
"
"                                  + NVL (ROUND (cr1.line_amt, v_rnd),0)
"
"                                  + NVL (ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd),0)
"
"                                  - NVL (ROUND ((cr7.dist_amt + cr2.tax_amount_cr),v_rnd),0)
"
"                                  - NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),0))) > 0
"
"                           THEN
"
"                              IF (ABS (
"
"                                     (NVL (ROUND (cr2.tax_amount, v_rnd), 0)
"
"                                      + NVL (ROUND (cr1.line_amt, v_rnd), 0)
"
"                                      + NVL (ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd),0)
"
"                                      - NVL (ROUND ((cr7.dist_amt+ cr2.tax_amount_cr),v_rnd),0))
"
"                                      - NVL (ROUND (cr_hd.suphd_sc_tot_amt,v_rnd),0))) > v_rndof_amt
"
"                              THEN
"
"                                 raise_application_error (-20999,'Please change the Total / Material Amount '||
"
"								 ROUND (cr2.tax_amount, v_rnd)||'/'||
"
"                                 ROUND (cr1.line_amt, v_rnd) ||'/'||
"
"                                 ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd)||'/'||
"
"                                 ROUND ((cr7.dist_amt + cr2.tax_amount_cr),v_rnd)||'/'||
"
"                                 ROUND (cr_hd.suphd_sc_tot_amt, v_bill_rnd)
"
"								 );
"
"                              ELSE
"
"                                 p_jrnl_flag := 'Y';
"
"                              END IF;
"
"                           END IF;
"
"
"
"						   ELSE
"
"                             IF (NVL (ROUND (cr2.tax_amount, v_rnd), 0)
"
"                               + NVL (ROUND (cr1.line_amt, v_rnd), 0)
"
"                               + NVL (ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd),0)
"
"                               - NVL (ROUND ((cr7.dist_amt + cr2.tax_amount_cr),v_rnd),0))
"
"							   <> NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),0)
"
"                           THEN
"
"                              IF (ABS (
"
"                                     (NVL (ROUND (cr2.tax_amount, v_rnd), 0)
"
"                                     + NVL (ROUND (cr1.line_amt, v_rnd), 0)
"
"                                     + NVL (ROUND ((cr5.dist_amt+ cr2.tax_amount_dr),v_rnd),0)
"
"                                     - NVL (ROUND ((cr7.dist_amt+ cr2.tax_amount_cr),v_rnd),0))
"
"                                     - NVL (ROUND (cr_hd.suphd_sc_tot_amt,v_rnd),0))) > v_rndof_amt
"
"                              THEN
"
"                                 raise_application_error (-20999,'Please change the Total / Material Amount'
"
"								 ||
"
"								 ROUND (cr2.tax_amount, v_rnd)||'/'||(
"
"                                 ROUND (cr1.line_amt, v_rnd) ||'/'||
"
"                                 ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd))||'/'||
"
"                                 ROUND ((cr7.dist_amt + cr2.tax_amount_cr),v_rnd)||'/'||
"
"                                 ROUND (cr_hd.suphd_sc_tot_amt, v_rnd)
"
"								 ||'/'||cr_hd.suphd_sc_tot_amt);
"
"                              ELSE
"
"                                 p_jrnl_flag := 'Y';
"
"                              END IF;
"
"                           END IF;
"
"                        END IF;
"
"                     END IF;
"
"
"
"                     IF cr_hd.suphd_term_id IS NULL
"
"                     THEN
"
"                        raise_application_error (-20999,'Pay Term must be entered.');
"
"                     END IF;
"
"
"
"                     IF cr_hd.suphd_exchange_rate IS NULL
"
"                     THEN
"
"                        raise_application_error (-20999,'Exchange Rate should be greater than zero.');
"
"                     END IF;
"
"
"
"                     IF NVL (ROUND (cr4.var_sum_due_amt, v_rnd), 0) <>
"
"                           NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd), 0)
"
"                     THEN
"
"                        raise_application_error (-20999,'Due amount should equal to total amount.');
"
"                     END IF;
"
"
"
"                     IF cr4.var_mtrl_pct = 0 OR cr4.var_tax_pct = 0
"
"                     THEN
"
"                        raise_application_error (-20999,'Material/Tax % Should be greater than Zero.');
"
"                     END IF;
"
"
"
"                     IF v_due_disc = 0
"
"                     THEN
"
"                        raise_application_error (-20999,'Please change the Total / Material Amount');
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  CLOSE c7;
"
"
"
"                  CLOSE c5;
"
"
"
"                  CLOSE c4;
"
"
"
"                  CLOSE c3;
"
"
"
"                  CLOSE c2;
"
"
"
"                  CLOSE c1;
"
"
"
"                  ------------------***********************Expense and Credit documents**********------------------------
"
"                  OPEN c2;
"
"
"
"                  FETCH c2 INTO cr2;
"
"
"
"                  OPEN c3;
"
"
"
"                  FETCH c3 INTO cr3;
"
"
"
"                  OPEN c4;
"
"
"
"                  FETCH c4 INTO cr4;
"
"
"
"                  OPEN c5;
"
"
"
"                  FETCH c5 INTO cr5;
"
"
"
"                  OPEN c7;
"
"
"
"                  FETCH c7 INTO cr7;
"
"
"
"                  IF cr_hd.suphd_doc_type IN('SB', 'CN')
"
"                     AND cr_hd.suphd_grn_refer IN ('EXP', 'SMG')
"
"                  THEN
"
"                     IF cr5.dist_amt = 0 AND cr7.dist_amt = 0
"
"                     THEN
"
"                        nuLL;
"
"                     END IF;
"
"
"
"                     IF v_base_curr = cr_hd.suphd_currency
"
"                     THEN
"
"                        IF ABS (
"
"                              ( ( (NVL (
"
"                                      ROUND (
"
"                                         (cr5.dist_amt + cr2.tax_amount_dr),
"
"                                         v_rnd),
"
"                                      0)
"
"                                   - NVL (
"
"                                        ROUND (
"
"                                           (cr7.dist_amt + cr2.tax_amount_cr),
"
"                                           v_rnd),
"
"                                        0))
"
"                                 + NVL (ROUND (cr2.tax_amount, v_rnd), 0))
"
"                               - NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),
"
"                                      0))) > 0
"
"                        THEN
"
"                           IF ABS (
"
"                                 ( ( (NVL (
"
"                                         ROUND (
"
"                                            (cr5.dist_amt + cr2.tax_amount_dr),
"
"                                            v_rnd),
"
"                                         0)
"
"                                      - NVL (
"
"                                           ROUND (
"
"                                              (cr7.dist_amt
"
"                                               + cr2.tax_amount_cr),
"
"                                              v_rnd),
"
"                                           0))
"
"                                    + NVL (ROUND (cr2.tax_amount, v_rnd), 0))
"
"                                  - NVL (
"
"                                       ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),
"
"                                       0))) > v_rndof_amt
"
"                           THEN
"
"
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Please change the Total / Material Amount '||cr_hd.suphd_sc_tot_amt||'~'||cr2.tax_amount||'~'||cr7.dist_amt||'~'||cr5.dist_amt||'~'||cr2.tax_amount_dr||'~'|| cr2.tax_amount_cr||'~'||(
"
"                                 ( ( (NVL (
"
"                                         ROUND (
"
"                                            (cr5.dist_amt + cr2.tax_amount_dr),
"
"                                            v_rnd),
"
"                                         0)
"
"                                      - NVL (
"
"                                           ROUND (
"
"                                              (cr7.dist_amt
"
"                                               + cr2.tax_amount_cr),
"
"                                              v_rnd),
"
"                                           0))
"
"                                    + NVL (ROUND (cr2.tax_amount, v_rnd), 0))
"
"                                  - NVL (
"
"                                       ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),
"
"                                       0)))||'~'||v_rndof_amt);
"
"                           ELSE
"
"                              p_jrnl_flag := 'Y';
"
"
"
"
"
"                           END IF;
"
"                        END IF;
"
"                     ELSE
"
"                        IF (NVL (
"
"                               ROUND ( (cr5.dist_amt + cr2.tax_amount_dr),
"
"                                      v_rnd),
"
"                               0)
"
"                            - NVL (
"
"                                 ROUND ( (cr7.dist_amt - +cr2.tax_amount_cr),
"
"                                        v_rnd),
"
"                                 0)
"
"                            + NVL (ROUND (cr2.tax_amount, v_rnd), 0)) <>
"
"                              NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd), 0)
"
"                        THEN
"
"                           --alert_msg('1','N');
"
"                           IF ABS (
"
"                                 ( ( (NVL (
"
"                                         ROUND (
"
"                                            (cr5.dist_amt + cr2.tax_amount_dr),
"
"                                            v_rnd),
"
"                                         0)
"
"                                      - NVL (
"
"                                           ROUND (
"
"                                              (cr7.dist_amt
"
"                                               + cr2.tax_amount_cr),
"
"                                              v_rnd),
"
"                                           0))
"
"                                    + NVL (ROUND (cr2.tax_amount, v_rnd), 0))
"
"                                  - NVL (
"
"                                       ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),
"
"                                       0))) > v_rndof_amt
"
"                           THEN
"
"
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Please change the Total / Material Amount');
"
"                           ELSE
"
"                              p_jrnl_flag := 'Y';
"
"                           END IF;
"
"                        END IF;
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  CLOSE c7;
"
"
"
"                  CLOSE c5;
"
"
"
"                  CLOSE c4;
"
"
"
"                  CLOSE c3;
"
"
"
"                  CLOSE c2;
"
"
"
"                  -- 08-JAN-2023
"
"                       proc_upd_amount_apm1010 (p_bu,
"
"                                                p_doc_pfx,
"
"                                                p_doc_no,
"
"                                                cr_hd.suphd_currency,
"
"                                                cr_hd.suphd_doc_type,
"
"                                                cr_hd.suphd_grn_refer,
"
"                                                cr_hd.suphd_suplr_id);
"
"
"
"                  ------------------DEBIT documents------------------------
"
"                  OPEN c2;
"
"
"
"                  FETCH c2 INTO cr2;
"
"
"
"                  OPEN c3;
"
"
"
"                  FETCH c3 INTO cr3;
"
"
"
"                  OPEN c4;
"
"
"
"                  FETCH c4 INTO cr4;
"
"
"
"                  OPEN c5;
"
"
"
"                  FETCH c5 INTO cr5;
"
"
"
"                  OPEN c7;
"
"
"
"                  FETCH c7 INTO cr7;
"
"
"
"                  IF cr_hd.suphd_doc_type IN('DN')
"
"                     AND cr_hd.suphd_grn_refer IN ('LC', 'N')
"
"                  THEN
"
"                     IF v_base_curr = cr_hd.suphd_currency
"
"                     THEN
"
"                        IF ((NVL (ROUND ( (cr7.dist_amt + cr2.tax_amount_cr),v_rnd),0) - NVL (ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd),0)) + NVL (ROUND (cr2.tax_amount, v_rnd), 0)) - NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd), 0) >0
"
"                        THEN
"
"                           IF ( (NVL (ROUND ((cr7.dist_amt + cr2.tax_amount_cr),v_rnd),0)- NVL (ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd),0))+ NVL (ROUND (cr2.tax_amount, v_rnd), 0))- NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),0) > v_rndof_amt
"
"                           THEN
"
"                              raise_application_error (-20999,'Please change the Total / Material Amount');
"
"                           ELSE
"
"                              p_jrnl_flag := 'Y';
"
"                           END IF;
"
"                        END IF;
"
"                     ELSE
"
"                        IF (NVL (ROUND ( (cr7.dist_amt + cr2.tax_amount_cr),v_rnd),0)
"
"                            - NVL (ROUND ( (cr5.dist_amt + cr2.tax_amount_dr),v_rnd),0)
"
"                            + NVL (ROUND (cr2.tax_amount, v_rnd), 0)) <>
"
"                              NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd), 0)
"
"                        THEN
"
"                           IF ( (NVL (ROUND ((cr7.dist_amt + cr2.tax_amount_cr),v_rnd),0)
"
"                                 - NVL (ROUND ((cr5.dist_amt + cr2.tax_amount_dr),v_rnd),0)
"
"                                 + NVL (ROUND (cr2.tax_amount, v_rnd), 0)
"
"                                 - NVL (ROUND (cr_hd.suphd_sc_tot_amt, v_rnd),0))) > v_rndof_amt
"
"                           THEN
"
"                              raise_application_error (-20999,'Please change the Total / Material Amount');
"
"                           ELSE
"
"                              p_jrnl_flag := 'Y';
"
"                           END IF;
"
"                        END IF;
"
"                     END IF;
"
"                  END IF;
"
"
"
"                  CLOSE c7;
"
"
"
"                  CLOSE c5;
"
"
"
"                  CLOSE c4;
"
"
"
"                  CLOSE c3;
"
"
"
"                  CLOSE c2;
"
"
"
"                  IF cr_hd.suphd_suplr_doc_no IS NULL
"
"                  THEN
"
"                     raise_application_error (-20999,'Bill number must be entered.');
"
"                  END IF;
"
"
"
"                  IF cr_hd.suphd_suplr_reference IS NULL
"
"                  THEN
"
"                     --raise_application_error (-20999,'Narration must be entered.');
"
"					  DECLARE
"
"						   CURSOR c1
"
"						   IS
"
"							  SELECT apmc_suplr_doc_narr_opt
"
"								FROM apm_control
"
"							   WHERE apmc_bu = p_bu;
"
"
"
"						   CURSOR c2
"
"						   IS
"
"							  SELECT supln_prod_desc1
"
"								FROM suplr_doc_ln
"
"							   WHERE supln_bu = p_bu
"
"								 AND supln_doc_no = p_doc_no
"
"								 AND supln_plnt = p_plnt
"
"							GROUP BY supln_prod_desc1;
"
"
"
"						   CURSOR c3
"
"						   IS
"
"							  SELECT DISTINCT (supln_receipt_pfx || supln_receipt_no) recpt_no
"
"								FROM suplr_doc_ln
"
"							   WHERE supln_bu = p_bu
"
"								 AND supln_doc_no = p_doc_no
"
"								 AND supln_plnt = p_plnt;
"
"
"
"						   CURSOR c4 (
"
"							  c_rcpt_no VARCHAR2)
"
"						   IS
"
"							  SELECT porh_narr1
"
"								FROM pur_ord_receipt_hd_view
"
"							   WHERE porh_bu = p_bu
"
"								 AND porh_receipt_pfx || porh_receipt_no = c_rcpt_no;
"
"
"
"						   cr1      c1%ROWTYPE;
"
"						   cr4      c4%ROWTYPE;
"
"						   cr3      c3%ROWTYPE;
"
"						   v_desc   VARCHAR2 (5000);
"
"						   v_suplr  VARCHAR2 (5000);
"
"					  BEGIN
"
"						   OPEN c1;
"
"
"
"						   FETCH c1 INTO cr1;
"
"
"
"						   SELECT suplr_name1
"
"							 INTO v_suplr
"
"							 FROM suppliers
"
"							WHERE suplr_bu = p_bu
"
"							  AND suplr_suplr_id = cr_hd.suphd_suplr_id;
"
"
"
"						   IF cr_hd.suphd_grn_refer = 'EXP'
"
"						   THEN
"
"							 UPDATE suplr_doc_hd
"
"								SET suphd_suplr_reference ='EXPENSE ENTRY FOR ' || v_suplr ||' Bill No. '||suphd_suplr_doc_no||
"
"										       ' Bill Date '|| suphd_suplr_doc_date
"
"							  WHERE suphd_bu = p_bu
"
"								AND suphd_pfx = p_doc_pfx
"
"								AND suphd_doc_no = p_doc_no;
"
"						   ELSE
"
"							  IF cr1.apmc_suplr_doc_narr_opt = '01'
"
"							  THEN
"
"								 FOR cr2 IN c2
"
"								 LOOP
"
"								   IF v_desc IS NULL THEN
"
"									  v_desc := UPPER(cr2.supln_prod_desc1);
"
"								   ELSE
"
"									  v_desc := v_desc || ' , ' || UPPER(cr2.supln_prod_desc1);
"
"								   END IF;
"
"								 END LOOP;
"
"
"
"								 IF cr_hd.suphd_grn_refer NOT IN ('EXP','LC')
"
"                                 THEN
"
"									 UPDATE suplr_doc_hd
"
"										SET suphd_suplr_reference =
"
"											   SUBSTR ('PURCHASE OF ' || RTRIM (v_desc), 1, 500)
"
"									  WHERE suphd_bu = p_bu
"
"										AND suphd_pfx = p_doc_pfx
"
"										AND suphd_doc_no = p_doc_no;
"
"							     ELSIF cr_hd.suphd_grn_refer IN ('LC')
"
"                                 THEN
"
"								     UPDATE suplr_doc_hd
"
"										SET suphd_suplr_reference =
"
"											   SUBSTR ('LANDED COST FOR ' || RTRIM (v_desc), 1, 500)
"
"									  WHERE suphd_bu = p_bu
"
"										AND suphd_pfx = p_doc_pfx
"
"										AND suphd_doc_no = p_doc_no;
"
"								 END IF;
"
"							  ELSIF cr1.apmc_suplr_doc_narr_opt = '02'
"
"							  THEN
"
"								 FOR cr3 IN c3
"
"								 LOOP
"
"									OPEN c4 (cr3.recpt_no);
"
"
"
"									FETCH c4 INTO cr4;
"
"
"
"									   v_desc := cr4.porh_narr1;
"
"
"
"                                       IF v_desc IS NULL
"
"									   THEN
"
"                                         FOR cr2 IN c2
"
"										 LOOP
"
"										   IF v_desc IS NULL THEN
"
"											  v_desc := UPPER(cr2.supln_prod_desc1);
"
"										   ELSE
"
"											  v_desc := v_desc || ' , ' || UPPER(cr2.supln_prod_desc1);
"
"										   END IF;
"
"										 END LOOP;
"
"                                       END IF;
"
"
"
"									CLOSE c4;
"
"								 END LOOP;
"
"
"
"								 OPEN c3;
"
"
"
"								 FETCH c3 INTO cr3;
"
"
"
"								 IF c3%NOTFOUND OR cr3.recpt_no IS NULL
"
"								 THEN
"
"
"
"									FOR cr2 IN c2
"
"								    LOOP
"
"									   IF v_desc IS NULL THEN
"
"										  v_desc := UPPER(cr2.supln_prod_desc1);
"
"									   ELSE
"
"										  v_desc := v_desc || ' , ' || UPPER(cr2.supln_prod_desc1);
"
"									   END IF;
"
"									END LOOP;
"
"
"
"									IF cr_hd.suphd_grn_refer NOT IN ('EXP','LC')
"
"                                    THEN
"
"										UPDATE suplr_doc_hd
"
"										   SET suphd_suplr_reference =
"
"												  SUBSTR ('PURCHASE OF ' || RTRIM (v_desc),
"
"															 1,
"
"															 500)
"
"										 WHERE suphd_bu = p_bu
"
"										   AND suphd_pfx = p_doc_pfx
"
"										   AND suphd_doc_no = p_doc_no;
"
"									ELSIF cr_hd.suphd_grn_refer IN ('LC')
"
"									THEN
"
"                                        UPDATE suplr_doc_hd
"
"										   SET suphd_suplr_reference =
"
"												  SUBSTR ('LANDED COST FOR ' || RTRIM (v_desc),
"
"															 1,
"
"															 500)
"
"										 WHERE suphd_bu = p_bu
"
"										   AND suphd_pfx = p_doc_pfx
"
"										   AND suphd_doc_no = p_doc_no;
"
"									END IF;
"
"								 END IF;
"
"
"
"								 UPDATE suplr_doc_hd
"
"									SET suphd_suplr_reference = CASE WHEN suphd_grn_refer IN ('LC') THEN
"
"										   SUBSTR ('LANDED COST FOR '|| v_suplr ||' Bill No. '||suphd_suplr_doc_no||
"
"										       ' Bill Date '|| suphd_suplr_doc_date||' '
"
"										       || RTRIM (v_desc),1,500)
"
"										   ELSE
"
"										   SUBSTR ('PURCHASE OF '|| v_suplr ||' Bill No. '||suphd_suplr_doc_no||
"
"										       ' Bill Date '|| suphd_suplr_doc_date||' '
"
"										       || RTRIM (v_desc),1,500)
"
"										   END
"
"								  WHERE suphd_bu = p_bu
"
"									AND suphd_pfx = p_doc_pfx
"
"									AND suphd_doc_no = p_doc_no;
"
"							  END IF;
"
"						   END IF;
"
"					   END;
"
"                  END IF;
"
"
"
"                  IF cr_hd.suphd_sc_tot_amt = 0
"
"                  THEN
"
"                     raise_application_error (-20999,'Please change the Total / Material Amount');
"
"                  END IF;
"
"
"
"                  OPEN c1;
"
"
"
"                  FETCH c1 INTO cr1;
"
"
"
"                  CLOSE c1;
"
"
"
"                  IF cr_hd.suphd_grn_refer IN ('PR', 'SCO','PO') AND p_jrnl_flag = 'Y'
"
"                  THEN
"
"                     DECLARE
"
"                        CURSOR c1
"
"                        IS
"
"                             SELECT supln_po_pfx, supln_po_no, suphd_sc_tot_amt
"
"                               FROM suplr_doc_hd, suplr_doc_ln
"
"                              WHERE suphd_bu = supln_bu
"
"                                AND suphd_doc_no = supln_doc_no
"
"                                AND supln_bu = p_bu
"
"                                AND supln_doc_no = p_doc_no
"
"                           GROUP BY supln_po_pfx,
"
"                                    supln_po_no,
"
"                                    suphd_sc_tot_amt;
"
"
"
"                        CURSOR c2 (
"
"                           c_po_pfx    VARCHAR2,
"
"                           c_po_no     VARCHAR2,
"
"                           c_amt       NUMBER)
"
"                        IS
"
"                           SELECT par_doc_no
"
"                             FROM pending_payables_vw_hist,
"
"                                  suplr_doc_po_ref,
"
"                                  bank_trans_ref_det_hist_vw
"
"                            WHERE (pdd_bal_amt - pdd_in_progress) > 0
"
"                              AND par_status = 'P'
"
"                              AND par_bu = p_bu
"
"                              AND par_doc_type IN ('DN', 'SI', 'P')
"
"                              AND par_acct_type = 'AD'
"
"                              AND par_bu = btr_bu
"
"                              AND par_src_doc_no = btr_ord_no
"
"                              AND sdpr_bu = par_bu
"
"                              AND sdpr_doc_no = par_doc_no
"
"                              AND btr_doc_pfx = c_po_pfx
"
"                              AND btr_doc_no = c_po_no
"
"                              AND sdpr_po_pfx = c_po_pfx
"
"                              AND sdpr_po_no = c_po_no
"
"                              AND par_suplr_doc_no = c_po_no
"
"                              AND par_suplr_id = cr_hd.suphd_suplr_id
"
"							  AND NOT EXISTS
"
"										 (SELECT 1
"
"											FROM suplr_doc_adj
"
"										   WHERE sda_bu = p_bu
"
"											 AND sda_doc_no = p_doc_no
"
"											 AND sda_bu = par_bu
"
"											 AND sda_adj_doc_no = par_doc_no)
"
"                              AND c_amt >
"
"                                     (SELECT NVL (SUM (sda_adj_amt), 0)
"
"                                        FROM suplr_doc_adj
"
"                                       WHERE sda_bu = p_bu
"
"                                         AND sda_doc_no = p_doc_no
"
"                                         AND sda_po_pfx = c_po_pfx
"
"                                         AND sda_po_no = c_po_no);
"
"
"
"                        cr2              c2%ROWTYPE;
"
"                        cancel_alert     NUMBER;
"
"                        var_issue_flag   VARCHAR2 (1);
"
"                     BEGIN
"
"                        FOR cr1 IN c1
"
"                        LOOP
"
"                           OPEN c2 (cr1.supln_po_pfx,
"
"                                    cr1.supln_po_no,
"
"                                    cr_hd.suphd_sc_tot_amt);
"
"
"
"                           FETCH c2 INTO cr2;
"
"
"
"                           IF c2%FOUND
"
"                           THEN
"
"                              proc_ins_adj_doc (p_bu,
"
"                                                cr_hd.suphd_plant,
"
"                                                p_doc_pfx,
"
"                                                p_doc_no,
"
"                                                'S',
"
"                                                cr_hd.suphd_suplr_id,
"
"                                                cr_hd.suphd_currency,
"
"                                                trunc (cr_hd.suphd_doc_date),
"
"                                                cr_hd.suphd_acct_type,
"
"                                                p_user);
"
"
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Advance document exists against the Bill. Refer document '
"
"                                 || '~'
"
"                                 || cr2.par_doc_no
"
"                                 || ' and adjustment the same.');
"
"                           END IF;
"
"
"
"                           CLOSE c2;
"
"                        END LOOP;
"
"                     END;
"
"                  END IF;
"
"
"
"                  --IF func_find_apm_auto_adj_flag (p_bu) = 'Y'
"
"                  --THEN
"
"                     DECLARE
"
"                        CURSOR c1
"
"                        IS
"
"                           SELECT DISTINCT supln_po_pfx, supln_po_no
"
"                             FROM suplr_doc_hd, suplr_doc_ln
"
"                            WHERE suphd_bu = supln_bu
"
"                              AND suphd_doc_no = supln_doc_no
"
"                              AND suphd_bu = p_bu
"
"                              AND suphd_pfx = p_doc_pfx
"
"                              AND suphd_doc_no = p_doc_no;
"
"
"
"                        CURSOR c2 (
"
"                           c_po_pfx    VARCHAR2,
"
"                           c_po_no     VARCHAR2)
"
"                        IS
"
"                           SELECT DISTINCT btrans_ord_pfx, btrans_ord_no
"
"                             FROM bank_trans_hist_vw,
"
"                                  bank_trans_ref_det_hist_vw
"
"                            WHERE btrans_bu = btr_bu
"
"                              AND btrans_ord_no = btr_ord_no
"
"                              AND btrans_bu = p_bu
"
"                              AND btr_doc_pfx = c_po_pfx
"
"                              AND btr_doc_no = c_po_no
"
"                              AND btrans_type = 'AD'
"
"                              AND btrans_status = 'P'
"
"                              AND btrans_advice_pfx IS NULL
"
"                              AND btrans_advice_no IS NULL;
"
"
"
"                        cr2   c2%ROWTYPE;
"
"                     BEGIN
"
"                        FOR cr1 IN c1
"
"                        LOOP
"
"                           OPEN c2 (cr1.supln_po_pfx, cr1.supln_po_no);
"
"
"
"                           FETCH c2 INTO cr2;
"
"
"
"                           IF c2%FOUND
"
"                           THEN
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Adv.PO Document is Pending in Payment Advice.'
"
"                                 || ' - '
"
"                                 || cr2.btrans_ord_pfx
"
"                                 || cr2.btrans_ord_no);
"
"                           END IF;
"
"
"
"                           CLOSE c2;
"
"                        END LOOP;
"
"                     END;
"
"
"
"                     DECLARE
"
"                        CURSOR c1
"
"                        IS
"
"                           SELECT DISTINCT supln_po_pfx, supln_po_no
"
"                             FROM suplr_doc_hd, suplr_doc_ln
"
"                            WHERE suphd_bu = supln_bu
"
"                              AND suphd_doc_no = supln_doc_no
"
"                              AND suphd_bu = p_bu
"
"                              AND suphd_pfx = p_doc_pfx
"
"                              AND suphd_doc_no = p_doc_no
"
"						   UNION ALL
"
"						  SELECT DISTINCT sdpl_po_pfx, sdpl_po_no
"
"							 FROM suplr_doc_ln,suplr_doc_proc_ln
"
"						    WHERE sdpl_bu = supln_bu
"
"							  AND sdpl_doc_no = supln_doc_no
"
"							  AND supln_bu = p_bu
"
"							  AND supln_doc_no = p_doc_no ;
"
"
"
"                        CURSOR c2 (
"
"                           c_po_no     VARCHAR2)
"
"                        IS
"
"                           SELECT DISTINCT btrans_ord_pfx, btrans_ord_no
"
"                             FROM bank_trans, bank_trans_ref_det
"
"                            WHERE btrans_bu = btr_bu
"
"                              AND btrans_ord_no = btr_ord_no
"
"                              AND btrans_bu = p_bu
"
"                              AND btr_doc_no = c_po_no
"
"                              AND btrans_type <> 'AD';
"
"
"
"					    CURSOR c3 (
"
"								c_po_no     VARCHAR2)
"
"						IS
"
"						   SELECT *
"
"							 FROM adv_pay_rqst_hd
"
"							WHERE aprh_bu = p_bu
"
"							  AND (aprh_rqst_adv_amt - (aprh_pymnt_amt + NVL (aprh_inprg_amt, 0) + aprh_close_amt )) <> 0
"
"							  AND aprh_status = 'A'
"
"							  AND aprh_suplr_id = cr_hd.suphd_suplr_id
"
"							  AND aprh_po_no = c_po_no;
"
"
"
"						cr2   c2%ROWTYPE;
"
"                        cr3   c3%ROWTYPE;
"
"                     BEGIN
"
"                        FOR cr1 IN c1
"
"                        LOOP
"
"                           OPEN c2 (cr1.supln_po_no);
"
"
"
"                           FETCH c2 INTO cr2;
"
"
"
"                           IF c2%FOUND
"
"                           THEN
"
"                              raise_application_error (
"
"                                 -20999,
"
"                                 'Adv.PO Document is in Draft/Entry Completed status.'
"
"                                 || ' - '
"
"                                 || cr2.btrans_ord_no);
"
"                           END IF;
"
"
"
"                           CLOSE c2;
"
"
"
"						   OPEN c3 (cr1.supln_po_no);
"
"
"
"						   FETCH c3 INTO cr3;
"
"
"
"							IF c3%FOUND
"
"							THEN
"
"								raise_application_error(-20999,'Advance Document is pending for this supplier. Advance Doc.No. '||' - '|| cr3.aprh_doc_no);
"
"							END IF;
"
"
"
"						   CLOSE c3;
"
"                        END LOOP;
"
"                     END;
"
"                  --END IF;
"
"
"
"                  IF func_find_apm_auto_adj_flag (p_bu) = 'Y'
"
"                  THEN
"
"				     DELETE suplr_doc_adj
"
"					  WHERE sda_bu = p_bu
"
"					    AND sda_adv_sys_flag ='M'
"
"						AND sda_doc_no = p_doc_no;
"
"
"
"                     proc_auto_suplr_bills (p_bu,p_doc_no,p_doc_pfx,p_user);
"
"
"
"                       DECLARE
"
"						  CURSOR c1
"
"						   IS
"
"							  SELECT COUNT (*) rec_cnt
"
"								FROM suplr_doc_adj
"
"							   WHERE sda_bu = p_bu
"
"								 AND sda_doc_no = p_doc_no;
"
"
"
"						   cr1   c1%ROWTYPE;
"
"					   BEGIN
"
"						   OPEN c1;
"
"
"
"						   FETCH c1 INTO cr1;
"
"
"
"						   IF cr1.rec_cnt > 0
"
"						   THEN
"
"							  proc_ins_po_summary (p_bu,
"
"												   p_doc_pfx,
"
"												   p_doc_no,
"
"												   p_user);
"
"						   END IF;
"
"
"
"						   CLOSE C1;
"
"					   END;
"
"
"
"					 proc_auto_suplr_bills (p_bu,p_doc_no,p_doc_pfx,p_user);
"
"
"
"                     proc_upd_suplr_doc_adj_amt (p_bu, p_doc_pfx, p_doc_no);
"
"
"
"			         ----For auto adj document net amt & adj amt is equal then only Reduce the TDS amt----
"
"					 IF v_contr_flag IN('C','S') AND v_apm_proj_req  <> 'C'
"
"					 THEN
"
"					   DECLARE
"
"					     v_tds_amt      NUMBER :=0;
"
"						 v_adj_amt      NUMBER :=0;
"
"                         v_adj_doc_no 	VARCHAR2(30);
"
"					   BEGIN
"
"						 SELECT SUM(supln_unit_cost)supln_unit_cost
"
"						   INTO v_tds_amt
"
"						   FROM suplr_doc_ln
"
"						  WHERE supln_bu = p_bu
"
"							AND supln_contra_flag = 'Y'
"
"							AND supln_gen_flag = 'Y'
"
"							AND supln_doc_no = p_doc_no;
"
"
"
"                         IF v_tds_amt > 0
"
"                         THEN
"
"							 UPDATE suplr_doc_adj
"
"								SET sda_adj_amt = CASE WHEN sda_adj_amt =  cr_hd.suphd_sc_tot_amt
"
"								                  THEN sda_adj_amt - v_tds_amt
"
"												  ELSE sda_adj_amt + cr_hd.suphd_bill_tax_amt - v_tds_amt
"
"												  END
"
"
"
"							  WHERE sda_bu = p_bu
"
"								AND sda_doc_no = p_doc_no
"
"								AND sda_adj_amt > v_tds_amt
"
"								AND ROWNUM = 1;
"
"						 ELSE
"
"						     SELECT SUM(sda_adj_amt)sda_adj_amt,sda_adj_doc_no
"
"							   INTO v_adj_amt,v_adj_doc_no
"
"							   FROM suplr_doc_adj
"
"							  WHERE sda_bu = p_bu
"
"								AND sda_doc_no = p_doc_no
"
"								AND sda_adj_amt > cr_hd.suphd_sc_tot_amt
"
"								AND ROWNUM = 1
"
"					       GROUP BY sda_adj_doc_no;
"
"
"
"                             UPDATE suplr_doc_adj
"
"								SET sda_adj_amt = ABS(v_adj_amt - cr_hd.suphd_sc_tot_amt)
"
"							  WHERE sda_bu = p_bu
"
"								AND sda_doc_no = p_doc_no
"
"								AND sda_adj_doc_no = v_adj_doc_no;
"
"					     END IF;
"
"                        EXCEPTION WHEN OTHERS THEN v_tds_amt :=0;
"
"					   END;
"
"				     END IF;
"
"				  ELSIF v_contr_flag IN('C','S') AND v_apm_proj_req = 'C'
"
"				  THEN
"
"                     DECLARE
"
"					   CURSOR c1
"
"					   IS
"
"					     SELECT supln_ap_cc_code,SUM(supln_unit_cost)supln_unit_cost
"
"						   FROM suplr_doc_ln
"
"						  WHERE supln_bu = p_bu
"
"							AND supln_contra_flag = 'Y'
"
"							AND supln_gen_flag = 'Y'
"
"							AND supln_doc_no = p_doc_no
"
"						 HAVING SUM(supln_unit_cost) <> 0
"
"						  GROUP BY supln_ap_cc_code;
"
"					 BEGIN
"
"					   FOR cr1 IN c1
"
"                       LOOP
"
"					     UPDATE suplr_doc_adj
"
"							SET sda_adj_amt = ABS(sda_adj_amt - cr1.supln_unit_cost)
"
"						  WHERE sda_bu = p_bu
"
"							AND sda_doc_no = p_doc_no
"
"							AND sda_proj_id = cr1.supln_ap_cc_code;
"
"                       END LOOP;
"
"                     END;
"
"                  END IF;
"
"
"
"                  IF v_apm_proj_req IN ('Y','C','N')
"
"                  THEN
"
"                       DECLARE
"
"						CURSOR c1
"
"						IS
"
"						   SELECT suphd_proj_id
"
"							 FROM suplr_doc_hd
"
"							WHERE suphd_bu = p_bu
"
"							  AND suphd_doc_no = p_doc_no;
"
"
"
"						CURSOR c2 (
"
"						   c_proj_id VARCHAR2)
"
"						IS
"
"						   SELECT 1
"
"							 FROM suplr_doc_adj
"
"							WHERE sda_bu = p_bu
"
"							  AND sda_doc_no = p_doc_no
"
"							  AND sda_proj_id <> c_proj_id;
"
"
"
"                        CURSOR c3
"
"						IS
"
"						   SELECT *
"
"							 FROM suplr_doc_adj
"
"							WHERE sda_bu = p_bu
"
"							  AND sda_doc_no = p_doc_no;
"
"
"
"						CURSOR c4(c_doc_no VARCHAR2)
"
"						IS
"
"						   SELECT *
"
"							 FROM work_flow_doc_control
"
"							WHERE wfdc_bu = p_bu
"
"							  AND wfdc_status = 'N'
"
"							  AND wfdc_doc_no = c_doc_no;
"
"
"
"						cr1   c1%ROWTYPE;
"
"						cr2   c2%ROWTYPE;
"
"						cr3   c3%ROWTYPE;
"
"						cr4   c4%ROWTYPE;
"
"						v_cnt NUMBER;
"
"                       BEGIN
"
"						   OPEN c1;
"
"
"
"						   FETCH c1 INTO cr1;
"
"
"
"						   IF c1%FOUND
"
"						   THEN
"
"						      OPEN c2 (cr1.suphd_proj_id);
"
"
"
"						      FETCH c2 INTO cr2;
"
"
"
"						      IF c2%FOUND AND v_apm_proj_req = 'Y'
"
"						      THEN
"
"						   	     raise_application_error (-20999,'Different Project cannot be Adjust.');
"
"						      END IF;
"
"
"
"						      CLOSE c2;
"
"						   END IF;
"
"
"
"						   CLOSE c1;
"
"
"
"						   SELECT COUNT(*)cnt
"
"						     INTO v_cnt
"
"							 FROM suplr_doc_disc
"
"							WHERE sdd_bu = p_bu
"
"							  AND sdd_doc_no = p_doc_no
"
"							  AND sdd_due_date IS NULL;
"
"
"
"						   OPEN c3;
"
"
"
"						   FETCH c3 INTO cr3;
"
"
"
"						   IF c3%FOUND AND v_cnt > 0
"
"						   THEN
"
"						      raise_application_error (-20999,'Please enter the due date or change the payment term when an adjusted document exists.');
"
"						   END IF;
"
"
"
"						   CLOSE c3;
"
"
"
"						   FOR cr3 IN c3
"
"						   LOOP
"
"						      OPEN c4(cr3.sda_adj_src_doc_no);
"
"
"
"							  FETCH c4 INTO cr4;
"
"
"
"							  IF c4%FOUND
"
"							  THEN
"
"							     raise_application_error (-20999,'An adjusted document already exists in the workflow with Draft status.');
"
"							  END IF;
"
"
"
"							  CLOSE c4;
"
"						   END LOOP;
"
"
"
"                       END;
"
"                   END IF;
"
"
"
"
"
"                   DECLARE
"
"                     CURSOR c1
"
"                     IS
"
"                        SELECT sdpv_po_pfx,sdpv_po_no
"
"                          FROM suplr_doc_po_val
"
"                         WHERE sdpv_bu = p_bu
"
"                           AND sdpv_doc_no = p_doc_no;
"
"
"
"                     CURSOR c2 (
"
"                        c_po_no     VARCHAR2)
"
"                     IS
"
"                        SELECT sdpv_doc_no suphd_doc_no
"
"                          FROM suplr_doc_po_val
"
"                         WHERE sdpv_bu = p_bu
"
"                           AND sdpv_doc_no <> p_doc_no
"
"                           AND sdpv_po_no = c_po_no
"
"                           AND NOT EXISTS
"
"                                      (SELECT 1
"
"                                         FROM suplr_doc_hd_hist
"
"                                        WHERE suphdh_bu = p_bu
"
"                                          AND suphdh_doc_no = sdpv_doc_no
"
"                                          AND suphdh_status = 'P');
"
"
"
"                     cr1   c1%ROWTYPE;
"
"                     cr2   c2%ROWTYPE;
"
"                   BEGIN
"
"                       OPEN c1;
"
"
"
"                       FETCH c1 INTO cr1;
"
"
"
"                       IF c1%FOUND
"
"                       THEN
"
"
"
"                       OPEN c2 (cr1.sdpv_po_no);
"
"
"
"                       FETCH c2 INTO cr2;
"
"
"
"                       IF c2%FOUND
"
"                       THEN
"
"					       raise_application_error(-20999,'Already adjust document in draft status please post this Vou.No. - '||cr2.suphd_doc_no);
"
"
"
"                           DELETE suplr_doc_adj
"
"                            WHERE sda_bu = p_bu
"
"                              AND sda_doc_no = p_doc_no;
"
"
"
"                           DELETE suplr_doc_po_val
"
"                            WHERE sdpv_bu = p_bu
"
"                              AND sdpv_doc_no = p_doc_no;
"
"                       END IF;
"
"
"
"                       CLOSE c2;
"
"
"
"                       END IF;
"
"
"
"                       CLOSE c1;
"
"                   END;
"
"				   /*CF Code Updates*/
"
"				   BEGIN
"
"					  v_cfc_code := func_find_cf_code_dflt(p_bu,'SB');
"
"
"
"					  UPDATE suplr_doc_ln
"
"                         SET supln_cf_code = v_cfc_code
"
"  					   WHERE supln_bu = p_bu
"
"					     AND supln_cf_code IS NULL
"
"                         AND supln_doc_no = p_doc_no;
"
"				   END;
"
"
"
"				   UPDATE suplr_doc_hd
"
"					  SET suphd_doc_year = func_find_year(p_bu,cr_hd.suphd_doc_date),
"
"					      suphd_doc_period = func_find_period(p_bu,cr_hd.suphd_doc_date)
"
"					WHERE suphd_bu = p_bu
"
"					  AND suphd_pfx = p_doc_pfx
"
"					  AND suphd_doc_no = p_doc_no;
"
"
"
"                  /*Line wise AP GL Account validation*/
"
"                   BEGIN                                             -- 'T'  Inventory Method.
"
"                       IF p_jrnl_flag = 'Y' AND func_find_inv_method (p_bu) <> 'T'
"
"                       THEN
"
"                           SELECT COUNT (*)
"
"                             INTO v_cnt
"
"                             FROM suplr_doc_ln
"
"                            WHERE supln_bu = p_bu
"
"                              AND supln_doc_no = p_doc_no
"
"                              AND supln_ap_gl_acct IS NULL;
"
"
"
"                           IF v_cnt > 0
"
"                           THEN
"
"                              raise_application_error (-20999,'Purchase GL Account not found.');
"
"                           END IF;
"
"                       END IF;
"
"                   END;
"
"
"
"                   IF v_cnt <> 0 AND v_cnt1 <> 0
"
"                   THEN
"
"                      v_adj_flag := 'Y';
"
"                   ELSE
"
"                      v_adj_flag := 'N';
"
"                   END IF;
"
"
"
"                   OPEN c_hd;
"
"
"
"                   FETCH c_hd INTO cr_hd;
"
"
"
"                   CLOSE c_hd;
"
"
"
"				   DELETE appl_journals
"
"                    WHERE aj_bu = p_bu
"
"                      AND aj_vou_pfx = p_doc_pfx
"
"                      AND aj_vou_no = p_doc_no;
"
"
"
"                   IF cr_hd.suphd_sc_tot_amt IS NULL
"
"                      OR cr_hd.suphd_sc_tot_amt = 0
"
"                   THEN
"
"                      raise_application_error (-20999, 'Bill Amt is Zero');
"
"                   ELSE
"
"                     proc_ins_appl_apm_jrnl (
"
"                        p_bu,
"
"                        cr_hd.suphd_plant,
"
"                        cr_hd.suphd_ref_unit,
"
"                        1,
"
"                        p_doc_pfx,
"
"                        p_doc_no,
"
"                        cr_hd.suphd_doc_date,
"
"                        cr_hd.suphd_doc_year,
"
"                        cr_hd.suphd_doc_period,
"
"                        cr_hd.suphd_suplr_id,
"
"                        cr_hd.suphd_doc_type,
"
"                        cr_hd.suphd_suplr_reference,
"
"                        cr_hd.suphd_sc_tot_amt,
"
"                        cr_hd.suphd_sc_mat_amt,
"
"                        cr_hd.suphd_currency,
"
"                        cr_hd.suphd_exchange_rate,
"
"                        cr14.supln_exchange_rate,
"
"                        cr_hd.suphd_grn_refer,
"
"						cr_hd.suphd_pur_type,
"
"                        cr_hd.suphd_land_cost_flag,
"
"                        cr_hd.suphd_lcg_doc_type,
"
"                        'N',
"
"                        cr_hd.suphd_cre_by,
"
"                        cr_hd.suphd_cre_date,
"
"                        'N',
"
"                        cr_hd.suphd_acct_type,
"
"                        cr_hd.suphd_terr_id,
"
"                        cr_hd.suphd_suplr_doc_no,
"
"                        cr_hd.suphd_suplr_doc_date,
"
"                        0,
"
"                        NULL,
"
"                        NULL,
"
"                        NULL,
"
"                        0,
"
"                        0,
"
"                        cr_hd.suphd_gst_suplr_name,
"
"                        cr_hd.suphd_state_code,
"
"                        cr_hd.suphd_gstin_no,
"
"                        cr_hd.suphd_gst_class,
"
"                        cr_hd.suphd_suplr_type,
"
"                        cr_hd.suphd_boe_date,
"
"                        cr_hd.suphd_boe_no,
"
"                        cr_hd.suphd_port_code,
"
"                        'N',
"
"                        NULL,
"
"						NULL,
"
"                        cr_hd.suphd_pin_no,
"
"                        NULL,
"
"                        NULL,
"
"                        cr_hd.suphd_grn_refer,
"
"                        p_plnt_loc_id   => cr_hd.suphd_plnt_loc_id);
"
"
"
"                     proc_upd_chrg_nonchrg_amt (p_bu,
"
"                                                p_plnt,
"
"                                                p_doc_pfx,
"
"                                                p_doc_no);
"
"
"
"                     CLOSE c14;
"
"
"
"                     p_jrnl_flag := 'Y';
"
"
"
"                   END IF;
"
"
"
"				  SELECT COUNT(*)cnt
"
"				    INTO v_jrnl_cnt
"
"				    FROM appl_jrnl_vw
"
"				   WHERE aj_bu = p_bu
"
"					 AND aj_vou_pfx = p_doc_pfx
"
"					 AND aj_vou_no = p_doc_no;
"
"
"
"				   IF v_jrnl_cnt > 0
"
"				   THEN
"
"					   UPDATE suplr_doc_hd
"
"						  SET suphd_jrnl_flag = 'Y',
"
"						      suphd_upd_by = p_user,
"
"							  suphd_upd_emp_id = func_find_emp_id(p_bu,p_user),
"
"							  suphd_upd_date = SYSDATE,
"
"							  suphd_upd_ip_addr = Audit_Info.Get_IP_Address,
"
"                              suphd_upd_os_user = Audit_Info.Get_OS_User
"
"						WHERE suphd_bu = p_bu
"
"						  AND suphd_doc_no = p_doc_no
"
"						  AND suphd_pfx = p_doc_pfx;
"
"					    p_jrnl_flag := 'Y';
"
"				   ELSIF v_jrnl_cnt = 0
"
"				   THEN
"
"					   UPDATE suplr_doc_hd
"
"						  SET suphd_jrnl_flag = 'N'
"
"						WHERE suphd_bu = p_bu
"
"						  AND suphd_doc_no = p_doc_no
"
"						  AND suphd_pfx = p_doc_pfx;
"
"					    p_jrnl_flag := 'N';
"
"				   END IF;
"
"
"
"               END;
"
"            ---*****After journal created(ends)***-----
"
"            ELSIF p_jrnl_flag = 'N'
"
"            THEN
"
"
"
"               DELETE appl_journals
"
"                WHERE aj_bu = p_bu
"
"                  AND aj_vou_pfx = p_doc_pfx
"
"                  AND aj_vou_no = p_doc_no;
"
"
"
"               UPDATE suplr_doc_hd
"
"                  SET suphd_tds_flag = 'N',
"
"				      suphd_jrnl_flag = 'N',
"
"					  --suphd_rnd_off_amt = 0,
"
"					  suphd_upd_by = p_user,
"
"					  suphd_upd_emp_id = func_find_emp_id(p_bu,p_user),
"
"					  suphd_upd_date = SYSDATE,
"
"					  suphd_upd_ip_addr = Audit_Info.Get_IP_Address,
"
"                      suphd_upd_os_user = Audit_Info.Get_OS_User
"
"                WHERE suphd_bu = p_bu
"
"                  AND suphd_doc_no = p_doc_no
"
"                  AND suphd_pfx = p_doc_pfx;
"
"
"
"               DELETE suplr_doc_adv_tds_adj
"
"                WHERE sdata_bu = p_bu
"
"                  AND sdata_doc_no = p_doc_no;
"
"
"
"			   DELETE suplr_adv_tds_ded_dtls
"
"			    WHERE satdd_bu  = p_bu
"
"                  AND satdd_doc_no  = p_doc_no;
"
"
"
"               DELETE suplr_doc_ln
"
"                WHERE supln_bu = p_bu
"
"                  AND supln_doc_no = p_doc_no
"
"                  AND supln_tcs_gen_flg = 'N'
"
"                  AND supln_gen_flag = 'Y'
"
"				  AND supln_type = 'C';
"
"
"
"            ---*****After deleting journal (ends)***-----
"
"            END IF;
"
"
"
"         END;
"
"   END proc_cre_jrnl;
"
"
"
"END pkg_suplr_bills;"
/
