CREATE OR REPLACE
"PACKAGE BODY pkg_sup_perf
"
"AS
"
"  PROCEDURE proc_ins_serv_scr_card(p_bu		VARCHAR2,
"
"                                   p_plnt	VARCHAR2,
"
"				   p_doc_no	VARCHAR2,
"
"				   p_user	VARCHAR2
"
"				  )
"
"  AS
"
"  BEGIN
"
"
"
"    INSERT INTO suplr_serv_scr_card_dtl(ssscd_bu,
"
"					ssscd_doc_no,
"
"					ssscd_suplr_id,
"
"					ssscd_attr_id,
"
"					ssscd_scr,
"
"					ssscd_cre_by,
"
"					ssscd_cre_date
"
"				       )
"
"    SELECT p_bu,p_doc_no,sscd_suplr_id,psr_attribute_id,0,p_user,SYSDATE
"
"      FROM suplr_score_card_detl,perf_service_rating
"
"     WHERE psr_bu = sscd_bu
"
"       AND sscd_bu = p_bu
"
"       AND sscd_doc_no = p_doc_no;
"
"
"
"  END proc_ins_serv_scr_card;
"
"
"
"  PROCEDURE proc_upd_scr_frm_serv(p_bu		VARCHAR2,
"
"                                  p_plnt	VARCHAR2,
"
"				  p_doc_no	VARCHAR2,
"
"				  p_user	VARCHAR2
"
"				 )
"
"  AS
"
"    v_serv_scr	NUMBER;
"
"  BEGIN
"
"    FOR r_serv IN (SELECT ssscd_suplr_id,ssscd_attr_id
"
"                     FROM suplr_serv_scr_card_dtl,perf_service_rating
"
"		    WHERE psr_bu = ssscd_bu
"
"		      AND psr_attribute_id = ssscd_attr_id
"
"		      AND ssscd_bu = p_bu
"
"		      AND ssscd_doc_no = p_doc_no
"
"		      AND psr_attribute_desc1 = 'PPM')
"
"    LOOP
"
"      FOR r_ppm IN (SELECT (SUM(spfln_rej_qty) / SUM(spfln_rept_qty)) * 1000000 ppm_scr
"
"                      FROM suplr_performance_ln
"
"		     WHERE spfln_bu = p_bu
"
"		       AND spfln_doc_no = p_doc_no
"
"		       AND spfln_suplr_id = r_serv.ssscd_suplr_id)
"
"      LOOP
"
"
"
"        IF r_ppm.ppm_scr BETWEEN 0 AND 100 THEN
"
"	  v_serv_scr := 25;
"
"	ELSIF r_ppm.ppm_scr BETWEEN 101 AND 1000 THEN
"
"	  v_serv_scr := 20;
"
"	ELSIF r_ppm.ppm_scr BETWEEN 1001 AND 5000 THEN
"
"	  v_serv_scr := 15;
"
"	ELSIF r_ppm.ppm_scr > 5000 THEN
"
"	  v_serv_scr := 10;
"
"	END IF;
"
"
"
"	UPDATE suplr_serv_scr_card_dtl
"
"	   SET ssscd_scr = v_serv_scr
"
"	 WHERE ssscd_bu = p_bu
"
"	   AND ssscd_doc_no = p_doc_no
"
"	   AND ssscd_suplr_id = r_serv.ssscd_suplr_id
"
"	   AND ssscd_attr_id = r_serv.ssscd_attr_id;
"
"
"
"      END LOOP;
"
"    END LOOP;
"
"  END proc_upd_scr_frm_serv;
"
"
"
"END pkg_sup_perf;"
/
