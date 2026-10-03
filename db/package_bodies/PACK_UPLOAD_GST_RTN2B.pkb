CREATE OR REPLACE
"PACKAGE BODY        pack_upload_gst_rtn2b
"
"AS
"
"   PROCEDURE proc_chk_del_temp_tab (p_bu VARCHAR2, p_doc_no VARCHAR2)
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"         SELECT table_name
"
"           FROM user_tables
"
"          WHERE table_name = 'TEMP_GSTR2B_AIC_LN';
"
"
"
"      cr1   c1%ROWTYPE;
"
"   BEGIN
"
"      OPEN c1;
"
"      FETCH c1 INTO cr1;
"
"
"
"      IF c1%FOUND
"
"      THEN
"
"         EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_AIC_LN';
"
"      END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      DELETE FROM gstr2a_aic_ln
"
"            WHERE gstaln_bu = p_bu AND gstaln_doc_no = p_doc_no;
"
"
"
"      DELETE FROM gstr2a_aic_ln_load;
"
"   END;
"
"
"
"   PROCEDURE proc_upd_upload_data (p_bu           VARCHAR2,
"
"                                   p_doc_no       VARCHAR2,
"
"                                   p_type         VARCHAR2,
"
"                                   p_res      OUT VARCHAR2)
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"         SELECT COUNT (*) v_cnt
"
"           FROM gstr2b_rec_ln
"
"          WHERE     g2brln_bu = p_bu
"
"                AND g2brln_doc_no = p_doc_no
"
"                AND g2brln_type = p_type;
"
"
"
"      cr1        c1%ROWTYPE;
"
"
"
"      v_result   VARCHAR2 (1) := 'N';
"
"   BEGIN
"
"      UPDATE gstr2b_rec_ln
"
"         SET g2brln_gstin_no = TRIM (g2brln_gstin_no),
"
"             g2brln_legal_name = TRIM (g2brln_legal_name),
"
"             g2brln_inv_no = TRIM (g2brln_inv_no),
"
"             g2brln_inv_type = TRIM (g2brln_inv_type),
"
"             g2brln_supply_type = TRIM (g2brln_supply_type),
"
"             g2brln_inv_date = TRIM (g2brln_inv_date),
"
"             g2brln_inv_val = TRIM (g2brln_inv_val),
"
"             g2brln_supply_place = TRIM (g2brln_supply_place),
"
"             g2brln_rcm = TRIM (g2brln_rcm),
"
"             g2brln_rate = TRIM (g2brln_rate),
"
"             g2brln_tax_val = TRIM (g2brln_tax_val),
"
"             g2brln_igst_val = TRIM (g2brln_igst_val),
"
"             g2brln_cgst_val = TRIM (g2brln_cgst_val),
"
"             g2brln_sgst_val = TRIM (g2brln_sgst_val),
"
"             g2brln_cess_val = TRIM (g2brln_cess_val),
"
"             g2brln_gstr_filing_period = TRIM (g2brln_gstr_filing_period),
"
"             g2brln_gstr_filing_date = TRIM (g2brln_gstr_filing_date),
"
"             g2brln_itc_availability = TRIM (g2brln_itc_availability),
"
"             g2brln_reason = TRIM (g2brln_reason),
"
"             g2brln_appl_pct = TRIM (g2brln_appl_pct),
"
"             g2brln_source = TRIM (g2brln_source),
"
"             g2brln_irn = TRIM (g2brln_irn),
"
"             g2brln_irn_date = TRIM (g2brln_irn_date),
"
"             g2brln_inv_org_type = TRIM (g2brln_inv_org_type),
"
"             g2brln_inv_org_no = TRIM (g2brln_inv_org_no),
"
"             g2brln_inv_org_date = TRIM (g2brln_inv_org_date),
"
"             g2brln_itc_eligibility = TRIM (g2brln_itc_eligibility),
"
"             g2brln_isd_doc_type = TRIM (g2brln_isd_doc_type),
"
"             g2brln_isd_org_no = TRIM (g2brln_isd_org_no),
"
"             g2brln_isd_org_date = TRIM (g2brln_isd_org_date),
"
"             g2brln_ref_date = TRIM (g2brln_ref_date),
"
"             g2brln_port_code = TRIM (g2brln_port_code),
"
"             g2brln_bill_no = TRIM (g2brln_bill_no),
"
"             g2brln_bill_date = TRIM (g2brln_bill_date),
"
"             g2brln_amended = TRIM (g2brln_amended)
"
"       WHERE g2brln_bu = p_bu AND g2brln_doc_no = p_doc_no;
"
"
"
"      UPDATE gstr2b_rec_ln
"
"         SET --g2brln_rcm = NVL (decode(g2brln_rcm,'Yes','Y','No','N'), 'N'),
"
"             --g2brln_itc_availability = NVL (decode(g2brln_itc_availability,'Yes','Y','No','N'), 'N'),
"
"             g2brln_tax_val = NVL (g2brln_tax_val, 0),
"
"             g2brln_rate = NVL (g2brln_rate, 0),
"
"             g2brln_igst_val = NVL (g2brln_igst_val, 0),
"
"             g2brln_cgst_val = NVL (g2brln_cgst_val, 0),
"
"             g2brln_sgst_val = NVL (g2brln_sgst_val, 0),
"
"             g2brln_cess_val = NVL (g2brln_cess_val, 0)
"
"       WHERE g2brln_bu = p_bu AND g2brln_doc_no = p_doc_no;
"
"
"
"      OPEN c1;
"
"
"
"      FETCH c1 INTO cr1;
"
"
"
"      IF cr1.v_cnt = 0
"
"      THEN
"
"         v_result := 'N';
"
"      ELSE
"
"         v_result := 'Y';
"
"      END IF;
"
"
"
"      CLOSE c1;
"
"
"
"      p_res := v_result;
"
"   END;
"
"
"
"   /* GST Return B2B */
"
"
"
"   PROCEDURE proc_upload_gst_b2b (p_bu           VARCHAR2,
"
"                                  p_doc_no       VARCHAR2,
"
"                                  p_gstin_no       VARCHAR2,
"
"                                  p_type         VARCHAR2,
"
"                                  p_dir          VARCHAR2,
"
"                                  p_file_name    VARCHAR2,
"
"                                  p_user         VARCHAR2,
"
"                                  p_prev_record       VARCHAR2)
"
"   IS
"
"   BEGIN
"
"      /*EXECUTE IMMEDIATE
"
"         'CREATE TABLE TEMP_GSTR2B_AIC_LN( tg2bln_GSTIN_NO             VARCHAR2(500),
"
"                                                                                              tg2bln_LEGAL_NAME          VARCHAR2(500),
"
"                                                                                              tg2bln_INV_NO              VARCHAR2(500),
"
"                                                                                              tg2bln_INV_TYPE            VARCHAR2(500),
"
"                                                                                              tg2bln_INV_DATE           VARCHAR2(500),
"
"                                                                                              tg2bln_INV_VAL             VARCHAR2(500),
"
"                                                                                              tg2bln_SUPPLY_PLACE      VARCHAR2(500),
"
"                                                                                              tg2bln_RCM                 VARCHAR2(500),
"
"                                                                                              tg2bln_RATE                VARCHAR2(500),
"
"                                                                                              tg2bln_TAX_VAL             VARCHAR2(500),
"
"                                                                                              tg2bln_IGST_VAL         VARCHAR2(500),
"
"                                                                                              tg2bln_CGST_VAL          VARCHAR2(500),
"
"                                                                                              tg2bln_SGST_VAL            VARCHAR2(500),
"
"                                                                                              tg2bln_CESS_VAL           VARCHAR2(500),
"
"                                                                                              tg2bln_GSTR_FILING_PERIOD  VARCHAR2(500),
"
"                                                                                              tg2bln_GSTR_FILING_DATE    VARCHAR2(500),
"
"                                                                                              tg2bln_ITC_AVAILABILITY    VARCHAR2(500),
"
"                                                                                              tg2bln_REASON              VARCHAR2(500),
"
"                                                                                              tg2bln_APPL_PCT            VARCHAR2(500),
"
"                                                                                              tg2bln_SOURCE              VARCHAR2(500),
"
"                                                                                              tg2bln_IRN                 VARCHAR2(500),
"
"                                                                                              tg2bln_IRN_DATE         VARCHAR2(500))
"
"                         ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY '
"
"         || p_dir
"
"         || '
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE SKIP 6
"
"                                       FIELDS TERMINATED BY ''|''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS(  tg2bln_GSTIN_NO             CHAR(255),
"
"                                                                                                      tg2bln_LEGAL_NAME          CHAR(255),
"
"                                                                                                      tg2bln_INV_NO              CHAR(255),
"
"                                                                                                      tg2bln_INV_TYPE            CHAR(255),
"
"                                                                                                      tg2bln_INV_DATE          CHAR(255),
"
"                                                                                                      tg2bln_INV_VAL             CHAR(255),
"
"                                                                                                      tg2bln_SUPPLY_PLACE      CHAR(255),
"
"                                                                                                      tg2bln_RCM                 CHAR(255),
"
"                                                                                                      tg2bln_RATE                CHAR(255),
"
"                                                                                                      tg2bln_TAX_VAL             CHAR(255),
"
"                                                                                                      tg2bln_IGST_VAL        CHAR(255),
"
"                                                                                                      tg2bln_CGST_VAL          CHAR(255),
"
"                                                                                                      tg2bln_SGST_VAL            CHAR(255),
"
"                                                                                                      tg2bln_CESS_VAL         CHAR(255),
"
"                                                                                                      tg2bln_GSTR_FILING_PERIOD  CHAR(255),
"
"                                                                                                      tg2bln_GSTR_FILING_DATE    CHAR(255),
"
"                                                                                                      tg2bln_ITC_AVAILABILITY    CHAR(255),
"
"                                                                                                      tg2bln_REASON             CHAR(255),
"
"                                                                                                      tg2bln_APPL_PCT            CHAR(255),
"
"                                                                                                      tg2bln_SOURCE              CHAR(255),
"
"                                                                                                      tg2bln_IRN                 CHAR(255),
"
"                                                                                                      tg2bln_IRN_DATE         CHAR(255)))
"
"                                 LOCATION ('
"
"         || p_dir
"
"         || ':'
"
"         || CHR (39)
"
"         || p_file_name
"
"         || CHR (39)
"
"         || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE 'DELETE FROM gstr2b_load_ln';*/
"
"
"
"      BEGIN
"
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_REC_LN';
"
"      EXCEPTION
"
"            WHEN OTHERS THEN
"
"               NULL;
"
"      END;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE TEMP_GSTR2B_REC_LN AS (SELECT *FROM TABLE(as_read_xlsx.read(as_read_xlsx.file2blob('''||p_dir||''','''||p_file_name||'''),''B2B'')) WHERE ROW_NR>6)';
"
"
"
"      DELETE FROM gstr2b_rec_ln WHERE g2brln_bu=p_bu AND g2brln_doc_no=p_doc_no AND g2brln_type = 'B2B';
"
"
"
"      EXECUTE IMMEDIATE '
"
"      INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                         g2brln_doc_no,
"
"                                         g2brln_type,
"
"                                         g2brln_seq_no,
"
"                                         g2brln_gstin_no,
"
"                                         g2brln_legal_name,
"
"                                         g2brln_inv_no,
"
"                                         g2brln_inv_type,
"
"                                         g2brln_inv_date,
"
"                                         g2brln_inv_val,
"
"                                         g2brln_supply_place,
"
"                                         g2brln_rcm,
"
"                                         g2brln_rate,
"
"                                         g2brln_tax_val,
"
"                                         g2brln_igst_val,
"
"                                         g2brln_cgst_val,
"
"                                         g2brln_sgst_val,
"
"                                         g2brln_cess_val,
"
"                                         g2brln_gstr_filing_period,
"
"                                         g2brln_gstr_filing_date,
"
"                                         g2brln_itc_availability,
"
"                                         g2brln_reason,
"
"                                         g2brln_appl_pct,
"
"                                         g2brln_source,
"
"                                         g2brln_irn,
"
"                                         g2brln_irn_date,
"
"                                         g2brln_cre_by,
"
"                                         g2brln_cre_date)
"
"                             SELECT '||CHR(39)||p_bu||CHR(39)||','||
"
"                                         CHR(39)||p_doc_no||CHR(39)||','||
"
"                                         CHR(39)||'B2B'||CHR(39)||',
"
"                                         ROWNUM,
"
"                                         C1,
"
"                                         C2,
"
"                                         C3,
"
"                                         C4,
"
"                                         TO_DATE(C6,CASE WHEN INSTR(C6,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         C7,
"
"                                         C8,
"
"                                         CASE WHEN C9 = ''Yes'' THEN ''Y'' ELSE ''N'' END,
"
"                                         NULL,--C10,
"
"                                         nvl(ROUND(C10,2),0),
"
"                                         nvl(ROUND(C11,2),0),
"
"                                         nvl(ROUND(C12,2),0),
"
"                                         nvl(ROUND(C13,2),0),
"
"                                         nvl(ROUND(C14,2),0),
"
"                                         C15,
"
"                                         TO_DATE(C16,CASE WHEN INSTR(C16,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         CASE WHEN C17 = ''Yes'' THEN ''Y'' ELSE ''N'' END,
"
"                                         C18,
"
"                                         REPLACE(C19,''%'',NULL),
"
"                                         C20,
"
"                                         C21,
"
"                                         CASE WHEN C22 IS NOT NULL THEN TO_DATE(C22,CASE WHEN INSTR(C22,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END) END,'||
"
"                                         CHR(39)||p_user||CHR(39)||',
"
"                                         SYSDATE
"
"                               FROM (SELECT *
"
"                                            FROM (SELECT row_nr,col_nr,string_val,number_val,date_val
"
"                                                         FROM temp_gstr2b_rec_ln)
"
"                                            PIVOT(MIN(COALESCE(string_val,TO_CHAR(number_val),TO_CHAR(date_val))) FOR col_nr IN (1 ""C1"",2 ""C2"",3 ""C3"",4 ""C4"",5 ""C6"",6 ""C7"",7 ""C8"",8 ""C9"",9 ""C10"",10 ""C11"",11 ""C12"",12 ""C13"",13 ""C14"",14 ""C15"",15 ""C16"",16 ""C17"",17 ""C18"",18 ""C19"",19 ""C20"",20 ""C21"",21 ""C22""))
"
"                                            )';
"
"
"
"                                  if p_prev_record = 'Y' then
"
"                                     INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                                                             g2brln_doc_no,
"
"                                                                             g2brln_type,
"
"                                                                             g2brln_seq_no,
"
"                                                                             g2brln_gstin_no,
"
"                                                                             g2brln_legal_name,
"
"                                                                             g2brln_inv_no,
"
"                                                                             g2brln_inv_type,
"
"                                                                             g2brln_inv_date,
"
"                                                                             g2brln_inv_val,
"
"                                                                             g2brln_supply_place,
"
"                                                                             g2brln_rcm,
"
"                                                                             g2brln_rate,
"
"                                                                             g2brln_tax_val,
"
"                                                                             g2brln_igst_val,
"
"                                                                             g2brln_cgst_val,
"
"                                                                             g2brln_sgst_val,
"
"                                                                             g2brln_cess_val,
"
"                                                                             g2brln_gstr_filing_period,
"
"                                                                             g2brln_gstr_filing_date,
"
"                                                                             g2brln_itc_availability,
"
"                                                                             g2brln_reason,
"
"                                                                             g2brln_appl_pct,
"
"                                                                             g2brln_source,
"
"                                                                             g2brln_irn,
"
"                                                                             g2brln_irn_date,
"
"                                                                             g2brln_cre_by,
"
"                                                                             g2brln_cre_date,
"
"                                                                             g2brln_prev_docs_no)
"
"                                                                 SELECT      p_bu,
"
"                                                                             p_doc_no,
"
"                                                                             g2brln_type,
"
"                                                                             (SELECT NVL(MAX(g2brln_seq_no),0)
"
"                                                                                FROM gstr2b_rec_ln
"
"                                                                              WHERE g2brln_bu = p_bu
"
"                                                                                  AND g2brln_doc_no = p_doc_no)+ROWNUM,
"
"                                                                             g2brln_gstin_no,
"
"                                                                             g2brln_legal_name,
"
"                                                                             g2brln_inv_no,
"
"                                                                             g2brln_inv_type,
"
"                                                                             g2brln_inv_date,
"
"                                                                             g2brln_inv_val,
"
"                                                                             g2brln_supply_place,
"
"                                                                             g2brln_rcm,
"
"                                                                             g2brln_rate,
"
"                                                                             g2brln_tax_val,
"
"                                                                             g2brln_igst_val,
"
"                                                                             g2brln_cgst_val,
"
"                                                                             g2brln_sgst_val,
"
"                                                                             g2brln_cess_val,
"
"                                                                             g2brln_gstr_filing_period,
"
"                                                                             g2brln_gstr_filing_date,
"
"                                                                             g2brln_itc_availability,
"
"                                                                             g2brln_reason,
"
"                                                                             g2brln_appl_pct,
"
"                                                                             g2brln_source,
"
"                                                                             g2brln_irn,
"
"                                                                             g2brln_irn_date,
"
"                                                                             p_user,
"
"                                                                             SYSDATE,
"
"                                                                             g2brln_doc_no
"
"                                                                   FROM gstr2b_rec_ln
"
"                                                                 WHERE g2brln_bu = p_bu
"
"                                                                      AND g2brln_type = 'B2B'
"
"                                                                      AND g2brln_match_status = 'N'
"
"--                                                                      and g2brln_ref is null
"
"                                                                       AND TO_NUMBER (g2brln_doc_no) < TO_NUMBER (p_doc_no)
"
"                                                                       aND TO_NUMBER (g2brln_doc_no) =  (SELECT mAX(g2brhd_doc_no)
"
"                                                                                 FROM gstr2b_rec_hd
"
"                                                                                WHERE     g2brhd_bu = p_bu
"
"                                                                                      AND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                                                                      AND g2brhd_doc_no < TO_NUMBER (p_doc_no)
"
"                                                                                      AND g2brhd_status = 'P')
"
"                                                                      AND EXISTS ( SELECT 1
"
"                                                                                           FROM gstr2b_rec_hd
"
"                                                                                         WHERE g2brhd_bu = p_bu
"
"                                                                                         aND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                                                                             AND g2brhd_doc_no = TO_NUMBER(g2brln_doc_no)
"
"                                                                                             AND g2brhd_status = 'P');
"
"                                             end if;
"
"   END;
"
"
"
"   /* End of GST Return B2B */
"
"
"
"   /* GST Return B2BA */
"
"
"
"   PROCEDURE proc_upload_gst_b2ba (p_bu           VARCHAR2,
"
"                                   p_doc_no       VARCHAR2,
"
"                                   p_gstin_no       VARCHAR2,
"
"                                   p_dir          VARCHAR2,
"
"                                   p_file_name    VARCHAR2,
"
"                                   p_user         VARCHAR2,
"
"                                   p_prev_record       VARCHAR2)
"
"   IS
"
"   BEGIN
"
"      BEGIN
"
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_REC_LN';
"
"      EXCEPTION
"
"            WHEN OTHERS THEN
"
"               NULL;
"
"      END;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE TEMP_GSTR2B_REC_LN AS (SELECT *FROM TABLE(as_read_xlsx.read(as_read_xlsx.file2blob('''||p_dir||''','''||p_file_name||'''),''B2BA'')) WHERE ROW_NR>7)';
"
"
"
"      DELETE FROM gstr2b_rec_ln WHERE g2brln_bu=p_bu AND g2brln_doc_no=p_doc_no AND g2brln_type = 'B2BA';
"
"
"
"      EXECUTE IMMEDIATE '
"
"      INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                         g2brln_doc_no,
"
"                                         g2brln_type,
"
"                                         g2brln_seq_no,
"
"                                         g2brln_inv_org_no,
"
"                                         g2brln_inv_org_date,
"
"                                         g2brln_gstin_no,
"
"                                         g2brln_legal_name,
"
"                                         g2brln_inv_no,
"
"                                         g2brln_inv_type,
"
"                                         g2brln_inv_date,
"
"                                         g2brln_inv_val,
"
"                                         g2brln_supply_place,
"
"                                         g2brln_rcm,
"
"                                         g2brln_rate,
"
"                                         g2brln_tax_val,
"
"                                         g2brln_igst_val,
"
"                                         g2brln_cgst_val,
"
"                                         g2brln_sgst_val,
"
"                                         g2brln_cess_val,
"
"                                           g2brln_itc_tax_val,
"
"                                          g2brln_itc_igst_val,
"
"                                          g2brln_itc_cgst_val,
"
"                                          g2brln_itc_sgst_val,
"
"                                          g2brln_itc_cess_val,
"
"                                          g2brln_remarks,
"
"                                          g2brln_gstr_filing_period,
"
"                                          g2brln_gstr_filing_date,
"
"                                          g2brln_itc_availability,
"
"                                          g2brln_reason,
"
"                                          g2brln_appl_pct,
"
"                                         g2brln_cre_by,
"
"                                         g2brln_cre_date)
"
"                             SELECT '||CHR(39)||p_bu||CHR(39)||','||
"
"                                         CHR(39)||p_doc_no||CHR(39)||','||
"
"                                         CHR(39)||'B2BA'||CHR(39)||',
"
"                                         ROWNUM,
"
"                                         C1,
"
"                                         TO_DATE(C2,CASE WHEN INSTR(C2,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         C3,
"
"                                         C4,
"
"                                         C5,
"
"                                         C6,
"
"                                         TO_DATE(C7,CASE WHEN INSTR(C7,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         C8,
"
"                                         C9,
"
"                                         CASE WHEN C10= ''Yes'' THEN ''Y'' ELSE ''N'' END,
"
"                                         NULL, --C11,
"
"                                         NVL(ROUND(C11,2),0),
"
"                                         NVL(ROUND(C12,2),0),
"
"                                         NVL(ROUND(C13,2),0),
"
"                                         NVL(ROUND(C14,2),0),
"
"                                         NVL(ROUND(C15,2),0),
"
"                                         nvl(ROUND( REPLACE(C16,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C17,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C18,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C19,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C20,''NA'',0),2),0),
"
"                                         C21,
"
"                                         C22,
"
"                                         TO_DATE(C23,CASE WHEN INSTR(C23,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         CASE WHEN C24 = ''Yes'' THEN ''Y'' ELSE ''N'' END,
"
"                                         C25,
"
"                                         REPLACE(C26,''%'',NULL),'||
"
"                                         CHR(39)||p_user||CHR(39)||',
"
"                                         SYSDATE
"
"                               FROM (SELECT *
"
"                                            FROM (SELECT row_nr,col_nr,string_val,number_val,date_val
"
"                                                         FROM temp_gstr2b_rec_ln)
"
"                                            PIVOT(MIN(COALESCE(string_val,TO_CHAR(number_val),TO_CHAR(date_val))) FOR col_nr IN (1 ""C1"",2 ""C2"",3 ""C3"",4 ""C4"",5 ""C5"",6 ""C6"",7 ""C7"",8 ""C8"",9 ""C9"",10 ""C10"",11 ""C11"",12 ""C12"",13 ""C13"",14 ""C14"",15 ""C15"",16 ""C16"",17 ""C17"",18 ""C18"",19 ""C19"",20 ""C20"",21 ""C21"",22 ""C22"",23 ""C23"",24 ""C24"",25 ""C25"",26 ""C26""))
"
"                                            )';
"
"
"
"
"
"
"
"      IF p_prev_record = 'Y'
"
"      THEN
"
"         INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                    g2brln_doc_no,
"
"                                    g2brln_type,
"
"                                    g2brln_seq_no,
"
"                                    g2brln_gstin_no,
"
"                                    g2brln_legal_name,
"
"                                    g2brln_inv_no,
"
"                                    g2brln_inv_type,
"
"                                    g2brln_inv_date,
"
"                                    g2brln_inv_val,
"
"                                    g2brln_supply_place,
"
"                                    g2brln_rcm,
"
"                                    g2brln_rate,
"
"                                    g2brln_tax_val,
"
"                                    g2brln_igst_val,
"
"                                    g2brln_cgst_val,
"
"                                    g2brln_sgst_val,
"
"                                    g2brln_cess_val,
"
"                                    g2brln_gstr_filing_period,
"
"                                    g2brln_gstr_filing_date,
"
"                                    g2brln_itc_availability,
"
"                                    g2brln_reason,
"
"                                    g2brln_appl_pct,
"
"                                    g2brln_source,
"
"                                    g2brln_irn,
"
"                                    g2brln_irn_date,
"
"                                    g2brln_cre_by,
"
"                                    g2brln_cre_date,
"
"                                    g2brln_prev_docs_no)
"
"            SELECT p_bu,
"
"                   p_doc_no,
"
"                   g2brln_type,
"
"                   (SELECT NVL (MAX (g2brln_seq_no), 0)
"
"                      FROM gstr2b_rec_ln
"
"                     WHERE g2brln_bu = p_bu AND g2brln_doc_no = p_doc_no)
"
"                   + ROWNUM,
"
"                   g2brln_gstin_no,
"
"                   g2brln_legal_name,
"
"                   g2brln_inv_no,
"
"                   g2brln_inv_type,
"
"                   g2brln_inv_date,
"
"                   g2brln_inv_val,
"
"                   g2brln_supply_place,
"
"                   g2brln_rcm,
"
"                   g2brln_rate,
"
"                   g2brln_tax_val,
"
"                   g2brln_igst_val,
"
"                   g2brln_cgst_val,
"
"                   g2brln_sgst_val,
"
"                   g2brln_cess_val,
"
"                   g2brln_gstr_filing_period,
"
"                   g2brln_gstr_filing_date,
"
"                   g2brln_itc_availability,
"
"                   g2brln_reason,
"
"                   g2brln_appl_pct,
"
"                   g2brln_source,
"
"                   g2brln_irn,
"
"                   g2brln_irn_date,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   g2brln_doc_no
"
"              FROM gstr2b_rec_ln
"
"             WHERE     g2brln_bu = p_bu
"
"                   AND g2brln_type = 'B2BA'
"
"                   AND g2brln_match_status = 'N'
"
"                   AND g2brln_ref IS NULL
"
"                   AND TO_NUMBER (g2brln_doc_no) < TO_NUMBER (p_doc_no)
"
"                   AND TO_NUMBER (g2brln_doc_no) =
"
"                          (SELECT MAX (g2brhd_doc_no)
"
"                             FROM gstr2b_rec_hd
"
"                            WHERE     g2brhd_bu = p_bu
"
"                                  AND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                  AND g2brhd_doc_no < TO_NUMBER (p_doc_no)
"
"                                  AND g2brhd_status = 'P')
"
"                   AND EXISTS
"
"                          (SELECT 1
"
"                             FROM gstr2b_rec_hd
"
"                            WHERE g2brhd_bu = p_bu
"
"                                  AND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                  AND g2brhd_doc_no =
"
"                                         TO_NUMBER (g2brln_doc_no)
"
"                                  AND g2brhd_status = 'P');
"
"      END IF;
"
"
"
"         IF SQL%FOUND THEN
"
"                UPDATE gstr2b_rec_hd SET g2brhd_pre_record = 'Y'
"
"                    WHERE g2brhd_bu = p_bu
"
"                     AND g2brhd_doc_no = P_DOC_NO;
"
"           ELSE
"
"                    UPDATE gstr2b_rec_hd SET g2brhd_pre_record = 'N'
"
"                    WHERE g2brhd_bu = p_bu
"
"                     AND g2brhd_doc_no = P_DOC_NO;
"
"           END IF;
"
"
"
"   END;
"
"
"
"   /* End of GST Return B2BA */
"
"
"
"   /* GST Return CDNR */
"
"
"
"   PROCEDURE proc_upload_gst_cdnr (p_bu           VARCHAR2,
"
"                                   p_doc_no       VARCHAR2,
"
"                                   p_gstin_no       VARCHAR2,
"
"                                   p_type         VARCHAR2,
"
"                                   p_dir          VARCHAR2,
"
"                                   p_file_name    VARCHAR2,
"
"                                   p_user         VARCHAR2,
"
"                                   p_prev_record       VARCHAR2)
"
"   IS
"
"   BEGIN
"
"      /*
"
"      EXECUTE IMMEDIATE
"
"         'CREATE TABLE TEMP_GSTR2B_AIC_LN(tgstaln_uin_no                    VARCHAR2(500),
"
"                                tgstaln_legal_name                VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_type            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_no            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_date            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_value            VARCHAR2(500),
"
"                                tgstaln_reason                    VARCHAR2(500),
"
"                                tgstaln_rate                    VARCHAR2(500),
"
"                                tgstaln_taxable_value                VARCHAR2(500),
"
"                                tgstaln_igst                    VARCHAR2(500),
"
"                                tgstaln_cgst                    VARCHAR2(500),
"
"                                tgstaln_sgst                    VARCHAR2(500),
"
"                                tgstaln_cess                    VARCHAR2(500),
"
"                                tgstaln_party_rtn_status            VARCHAR2(500))
"
"                         ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY '
"
"         || p_dir
"
"         || '
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE SKIP 6
"
"                                       FIELDS TERMINATED BY ''|''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS(tgstaln_uin_no                CHAR(255),
"
"                                               tgstaln_legal_name                CHAR(255),
"
"                                               tgstaln_inv_note_doc_type            CHAR(255),
"
"                                               tgstaln_inv_note_doc_no            CHAR(255),
"
"                                               tgstaln_inv_note_doc_date            CHAR(255),
"
"                                               tgstaln_inv_note_doc_value            CHAR(255),
"
"                                               tgstaln_reason                CHAR(255),
"
"                                               tgstaln_rate                    CHAR(255),
"
"                                               tgstaln_taxable_value            CHAR(255),
"
"                                               tgstaln_igst                    CHAR(255),
"
"                                               tgstaln_cgst                    CHAR(255),
"
"                                               tgstaln_sgst                    CHAR(255),
"
"                                               tgstaln_cess                    CHAR(255),
"
"                                               tgstaln_party_rtn_status            CHAR(255)))
"
"                                 LOCATION ('
"
"         || p_dir
"
"         || ':'
"
"         || CHR (39)
"
"         || p_file_name
"
"         || CHR (39)
"
"         || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE
"
"         'INSERT INTO gstr2a_aic_ln_load(gstalnl_seq_no            ,
"
"                                  gstalnl_gstin_uin_no        ,
"
"                                      gstalnl_legal_name        ,
"
"                                      gstalnl_inv_note_doc_type    ,
"
"                                      gstalnl_inv_note_doc_no        ,
"
"                                      gstalnl_inv_note_doc_date    ,
"
"                                      gstalnl_inv_note_doc_value    ,
"
"                                      gstalnl_reason            ,
"
"                                      gstalnl_rate            ,
"
"                            gstalnl_taxable_value        ,
"
"                            gstalnl_igst            ,
"
"                            gstalnl_cgst            ,
"
"                            gstalnl_sgst            ,
"
"                            gstalnl_cess            ,
"
"                            gstalnl_party_rtn_status    ) (select *from(select rownum rnum,q.* from(select *from table(as_read_xlsx.read(as_read_xlsx.file2blob(''DOC'',''33AAACU0718Q1Z7_012022_R2A.xlsx''),''CDNR'')))q) WHERE rnum>6)';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_AIC_LN';
"
"
"
"      DELETE FROM gstr2a_aic_ln_load
"
"            WHERE gstalnl_rate = '-';
"
"
"
"      DELETE FROM gstr2a_aic_ln_load
"
"            WHERE gstalnl_inv_note_doc_no IS NULL;
"
"      */
"
"      BEGIN
"
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_REC_LN';
"
"      EXCEPTION
"
"            WHEN OTHERS THEN
"
"               NULL;
"
"      END;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE TEMP_GSTR2B_REC_LN AS (SELECT *FROM TABLE(as_read_xlsx.read(as_read_xlsx.file2blob('''||p_dir||''','''||p_file_name||'''),''B2B-CDNR'')) WHERE ROW_NR>6)';
"
"
"
"      DELETE FROM gstr2b_rec_ln WHERE g2brln_bu=p_bu AND g2brln_doc_no=p_doc_no AND g2brln_type = 'B2B-CDNR';
"
"
"
"      EXECUTE IMMEDIATE '
"
"      INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                         g2brln_doc_no,
"
"                                         g2brln_type,
"
"                                         g2brln_seq_no,
"
"                                         g2brln_gstin_no,
"
"                                         g2brln_legal_name,
"
"                                         g2brln_inv_no,
"
"                                         g2brln_inv_type,
"
"                                         g2brln_inv_supply_type,
"
"                                         g2brln_inv_date,
"
"                                         g2brln_inv_val,
"
"                                         g2brln_supply_place,
"
"                                         g2brln_rcm,
"
"                                         g2brln_rate,
"
"                                         g2brln_tax_val,
"
"                                         g2brln_igst_val,
"
"                                         g2brln_cgst_val,
"
"                                         g2brln_sgst_val,
"
"                                         g2brln_cess_val,
"
"                                         g2brln_itc_tax_val,
"
"                                         g2brln_itc_igst_val,
"
"                                         g2brln_itc_cgst_val,
"
"                                         g2brln_itc_sgst_val,
"
"                                         g2brln_itc_cess_val,
"
"                                         g2brln_remarks,
"
"                                         g2brln_gstr_filing_period,
"
"                                         g2brln_gstr_filing_date,
"
"                                         g2brln_itc_availability,
"
"                                         g2brln_reason,
"
"                                         g2brln_appl_pct,
"
"                                         g2brln_source,
"
"                                         g2brln_irn,
"
"                                         g2brln_irn_date,
"
"                                         g2brln_cre_by,
"
"                                         g2brln_cre_date)
"
"                             SELECT '||CHR(39)||p_bu||CHR(39)||','||
"
"                                         CHR(39)||p_doc_no||CHR(39)||','||
"
"                                         CHR(39)||'B2B-CDNR'||CHR(39)||',
"
"                                         ROWNUM,
"
"                                         C1,
"
"                                         C2,
"
"                                         C3,
"
"                                         C4,
"
"                                         C5,
"
"                                         TO_DATE(C6,CASE WHEN INSTR(C6,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         C7,
"
"                                         C8,
"
"                                         CASE WHEN C9 = ''Yes'' THEN ''Y'' ELSE ''N'' END,
"
"                                         NULL, --C10,
"
"                                          nvl(ROUND(C10,2),0),
"
"                                         nvl(ROUND(C11,2),0),
"
"                                         nvl(ROUND(C12,2),0),
"
"                                         nvl(ROUND(C13,2),0),
"
"                                         nvl(ROUND(C14,2),0),
"
"                                         nvl(ROUND( REPLACE(C15,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C16,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C17,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C18,''NA'',0),2),0),
"
"                                         nvl(ROUND( REPLACE(C19,''NA'',0),2),0),
"
"                                         C20,
"
"                                         C21,
"
"                                         TO_DATE(C22,CASE WHEN INSTR(C22,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         CASE WHEN C23 = ''Yes'' THEN ''Y'' ELSE ''N'' END,
"
"                                         C24,
"
"                                         REPLACE(C25,''%'',NULL),
"
"                                         C26,
"
"                                         C27,
"
"                                         CASE WHEN C28 IS NOT NULL THEN TO_DATE(C28,CASE WHEN INSTR(C28,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END) END,'||
"
"                                         CHR(39)||p_user||CHR(39)||',
"
"                                         SYSDATE
"
"                               FROM (SELECT *
"
"                                            FROM (SELECT row_nr,col_nr,string_val,number_val,date_val
"
"                                                         FROM temp_gstr2b_rec_ln)
"
"                                            PIVOT(MIN(COALESCE(string_val,TO_CHAR(number_val),TO_CHAR(date_val))) FOR col_nr IN (1 ""C1"",2 ""C2"",3 ""C3"",4 ""C4"",5 ""C5"",6 ""C6"",7 ""C7"",8 ""C8"",9 ""C9"",10 ""C10"",11 ""C11"",12 ""C12"",13 ""C13"",14 ""C14"",15 ""C15"",16 ""C16"",17 ""C17"",18 ""C18"",19 ""C19"",20 ""C20"",21 ""C21"",22 ""C22"",23 ""C23"",24 ""C24"",25 ""C25"",26 ""C26"",27 ""C27"",28 ""C28""))
"
"                                            )';
"
"
"
"      /*
"
"      INSERT INTO gstr2b_rec_ln (gstaln_bu,
"
"                                 gstaln_doc_no,
"
"                                 gstaln_type,
"
"                                 gstaln_seq_no,
"
"                                 gstaln_gstin_uin_no,
"
"                                 gstaln_legal_name,
"
"                                 gstaln_inv_note_doc_type,
"
"                                 gstaln_inv_note_doc_no,
"
"                                 gstaln_inv_note_doc_date,
"
"                                 gstaln_inv_note_doc_value,
"
"                                 gstaln_reason,
"
"                                 gstaln_rate,
"
"                                 gstaln_taxable_value,
"
"                                 gstaln_igst,
"
"                                 gstaln_cgst,
"
"                                 gstaln_sgst,
"
"                                 gstaln_cess,
"
"                                 gstaln_party_rtn_status,
"
"                                 gstaln_cre_by,
"
"                                 gstaln_cre_date)
"
"           SELECT p_bu,
"
"                  p_doc_no,
"
"                  p_type,
"
"                  gstalnl_seq_no,
"
"                  gstalnl_gstin_uin_no,
"
"                  gstalnl_legal_name,
"
"                  gstalnl_inv_note_doc_type,
"
"                  gstalnl_inv_note_doc_no,
"
"                  TO_DATE (gstalnl_inv_note_doc_date, 'DD.MM.RRRR'),
"
"                  gstalnl_inv_note_doc_value,
"
"                  gstalnl_reason,
"
"                  gstalnl_rate,
"
"                  gstalnl_taxable_value,
"
"                  gstalnl_igst,
"
"                  gstalnl_cgst,
"
"                  gstalnl_sgst,
"
"                  gstalnl_cess,
"
"                  gstalnl_party_rtn_status,
"
"                  p_user,
"
"                  SYSDATE
"
"             FROM gstr2a_aic_ln_load
"
"         ORDER BY gstalnl_seq_no ASC;
"
"        */
"
"
"
"
"
"
"
"      IF p_prev_record = 'Y'
"
"      THEN
"
"         INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                    g2brln_doc_no,
"
"                                    g2brln_type,
"
"                                    g2brln_seq_no,
"
"                                    g2brln_gstin_no,
"
"                                    g2brln_legal_name,
"
"                                    g2brln_inv_no,
"
"                                    g2brln_inv_type,
"
"                                    g2brln_inv_date,
"
"                                    g2brln_inv_val,
"
"                                    g2brln_supply_place,
"
"                                    g2brln_rcm,
"
"                                    g2brln_rate,
"
"                                    g2brln_tax_val,
"
"                                    g2brln_igst_val,
"
"                                    g2brln_cgst_val,
"
"                                    g2brln_sgst_val,
"
"                                    g2brln_cess_val,
"
"                                    g2brln_itc_tax_val,
"
"                                    g2brln_itc_igst_val,
"
"                                    g2brln_itc_cgst_val,
"
"                                    g2brln_itc_sgst_val,
"
"                                    g2brln_itc_cess_val,
"
"                                    g2brln_remarks,
"
"                                    g2brln_gstr_filing_period,
"
"                                    g2brln_gstr_filing_date,
"
"                                    g2brln_itc_availability,
"
"                                    g2brln_reason,
"
"                                    g2brln_appl_pct,
"
"                                    g2brln_source,
"
"                                    g2brln_irn,
"
"                                    g2brln_irn_date,
"
"                                    g2brln_cre_by,
"
"                                    g2brln_cre_date,
"
"                                    g2brln_prev_docs_no)
"
"            SELECT p_bu,
"
"                   p_doc_no,
"
"                   g2brln_type,
"
"                   (SELECT NVL (MAX (g2brln_seq_no), 0)
"
"                      FROM gstr2b_rec_ln
"
"                     WHERE g2brln_bu = p_bu AND g2brln_doc_no = p_doc_no)
"
"                   + ROWNUM,
"
"                   g2brln_gstin_no,
"
"                   g2brln_legal_name,
"
"                   g2brln_inv_no,
"
"                   g2brln_inv_type,
"
"                   g2brln_inv_date,
"
"                   g2brln_inv_val,
"
"                   g2brln_supply_place,
"
"                   g2brln_rcm,
"
"                   g2brln_rate,
"
"                   g2brln_tax_val,
"
"                   g2brln_igst_val,
"
"                   g2brln_cgst_val,
"
"                   g2brln_sgst_val,
"
"                   g2brln_cess_val,
"
"                   g2brln_itc_tax_val,
"
"                   g2brln_itc_igst_val,
"
"                   g2brln_itc_cgst_val,
"
"                   g2brln_itc_sgst_val,
"
"                   g2brln_itc_cess_val,
"
"                   g2brln_remarks,
"
"                   g2brln_gstr_filing_period,
"
"                   g2brln_gstr_filing_date,
"
"                   g2brln_itc_availability,
"
"                   g2brln_reason,
"
"                   g2brln_appl_pct,
"
"                   g2brln_source,
"
"                   g2brln_irn,
"
"                   g2brln_irn_date,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   g2brln_doc_no
"
"              FROM gstr2b_rec_ln
"
"             WHERE     g2brln_bu = p_bu
"
"                   AND g2brln_type = 'B2B-CDNR'
"
"                   AND g2brln_match_status = 'N'
"
"                   AND g2brln_ref IS NULL
"
"                   AND TO_NUMBER (g2brln_doc_no) < TO_NUMBER (p_doc_no)
"
"                   AND TO_NUMBER (g2brln_doc_no) =
"
"                          (SELECT MAX (g2brhd_doc_no)
"
"                             FROM gstr2b_rec_hd
"
"                            WHERE     g2brhd_bu = p_bu
"
"                                  AND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                  AND g2brhd_doc_no < TO_NUMBER (p_doc_no)
"
"                                  AND g2brhd_status = 'P')
"
"                   AND EXISTS
"
"                          (SELECT 1
"
"                             FROM gstr2b_rec_hd
"
"                            WHERE g2brhd_bu = p_bu
"
"                                  AND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                  AND g2brhd_doc_no =
"
"                                         TO_NUMBER (g2brln_doc_no)
"
"                                  AND g2brhd_status = 'P');
"
"      END IF;
"
"
"
"         IF SQL%FOUND THEN
"
"                UPDATE gstr2b_rec_hd SET g2brhd_pre_record = 'Y'
"
"                    WHERE g2brhd_bu = p_bu
"
"                     AND g2brhd_doc_no = P_DOC_NO;
"
"           ELSE
"
"                    UPDATE gstr2b_rec_hd SET g2brhd_pre_record = 'N'
"
"                    WHERE g2brhd_bu = p_bu
"
"                     AND g2brhd_doc_no = P_DOC_NO;
"
"           END IF;
"
"   END;
"
"
"
"   /* End of GST Return CDNR */
"
"
"
"   /* GST Return IMPG */
"
"
"
"   PROCEDURE proc_upload_gst_impg (p_bu           VARCHAR2,
"
"                                   p_doc_no       VARCHAR2,
"
"                                   p_gstin_no       VARCHAR2,
"
"                                   p_dir          VARCHAR2,
"
"                                   p_file_name    VARCHAR2,
"
"                                   p_user         VARCHAR2,
"
"                                   p_prev_record       VARCHAR2)
"
"   IS
"
"   BEGIN
"
"
"
"      BEGIN
"
"            EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_REC_LN';
"
"      EXCEPTION
"
"            WHEN OTHERS THEN
"
"               NULL;
"
"      END;
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE TEMP_GSTR2B_REC_LN AS (SELECT *FROM TABLE(as_read_xlsx.read(as_read_xlsx.file2blob('''||p_dir||''','''||p_file_name||'''),''IMPG'')) WHERE ROW_NR>6)';
"
"
"
"      DELETE FROM gstr2b_rec_ln WHERE g2brln_bu=p_bu AND g2brln_doc_no=p_doc_no AND g2brln_type = 'IMPG';
"
"
"
"      EXECUTE IMMEDIATE '
"
"      INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                         g2brln_doc_no,
"
"                                         g2brln_type,
"
"                                         g2brln_seq_no,
"
"                                         g2brln_ref_date,
"
"                                         g2brln_port_code,
"
"                                         g2brln_bill_no,
"
"                                         g2brln_bill_date,
"
"                                         g2brln_tax_val,
"
"                                         g2brln_igst_val,
"
"                                         g2brln_cess_val,
"
"                                         g2brln_amended,
"
"                                         g2brln_cre_by,
"
"                                         g2brln_cre_date)
"
"                             SELECT '||CHR(39)||p_bu||CHR(39)||','||
"
"                                         CHR(39)||p_doc_no||CHR(39)||','||
"
"                                         CHR(39)||'IMPG'||CHR(39)||',
"
"                                         ROWNUM,
"
"                                         TO_DATE(C1,CASE WHEN INSTR(C1,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         C2,
"
"                                         C3,
"
"                                         TO_DATE(C4,CASE WHEN INSTR(C4,''/'')>0 THEN ''DD/MM/YYYY'' ELSE ''DD-MON-YY'' END),
"
"                                         C5,
"
"                                         C6,
"
"                                         C7,
"
"                                          ''N'',  /* DECODE(C8,''Yes'',''Y'',''No'',''N''),*/
"
"                                         '|| CHR(39)||p_user||CHR(39)||',
"
"                                         SYSDATE
"
"                               FROM (SELECT *
"
"                                            FROM (SELECT row_nr,col_nr,string_val,number_val,date_val
"
"                                                         FROM temp_gstr2b_rec_ln)
"
"                                            PIVOT(MIN(COALESCE(string_val,TO_CHAR(number_val),TO_CHAR(date_val))) FOR col_nr IN (1 ""C1"",2 ""C2"",3 ""C3"",4 ""C4"",5 ""C5"",6 ""C6"",7 ""C7"",8 ""C8""))
"
"                                            )';
"
"
"
"
"
"
"
"              IF p_prev_record = 'Y'
"
"      THEN
"
"         INSERT INTO gstr2b_rec_ln (g2brln_bu,
"
"                                    g2brln_doc_no,
"
"                                    g2brln_type,
"
"                                    g2brln_seq_no,
"
"                                    g2brln_gstin_no,
"
"                                    g2brln_legal_name,
"
"                                    g2brln_inv_no,
"
"                                    g2brln_inv_type,
"
"                                    g2brln_inv_date,
"
"                                    g2brln_inv_val,
"
"                                    g2brln_supply_place,
"
"                                    g2brln_rcm,
"
"                                    g2brln_rate,
"
"                                    g2brln_tax_val,
"
"                                    g2brln_igst_val,
"
"                                    g2brln_cgst_val,
"
"                                    g2brln_sgst_val,
"
"                                    g2brln_cess_val,
"
"                                    g2brln_gstr_filing_period,
"
"                                    g2brln_gstr_filing_date,
"
"                                    g2brln_itc_availability,
"
"                                    g2brln_reason,
"
"                                    g2brln_appl_pct,
"
"                                    g2brln_source,
"
"                                    g2brln_irn,
"
"                                    g2brln_irn_date,
"
"                                    g2brln_cre_by,
"
"                                    g2brln_cre_date,
"
"                                    g2brln_prev_docs_no,
"
"                                    g2brln_ref_date,
"
"                                    g2brln_port_code,
"
"                                    g2brln_bill_no,
"
"                                    g2brln_bill_date)
"
"            SELECT p_bu,
"
"                   p_doc_no,
"
"                   g2brln_type,
"
"                   (SELECT NVL (MAX (g2brln_seq_no), 0)
"
"                      FROM gstr2b_rec_ln
"
"                     WHERE g2brln_bu = p_bu AND g2brln_doc_no = p_doc_no)
"
"                   + ROWNUM,
"
"                   g2brln_gstin_no,
"
"                   g2brln_legal_name,
"
"                   g2brln_inv_no,
"
"                   g2brln_inv_type,
"
"                   g2brln_inv_date,
"
"                   g2brln_inv_val,
"
"                   g2brln_supply_place,
"
"                   g2brln_rcm,
"
"                   g2brln_rate,
"
"                   g2brln_tax_val,
"
"                   g2brln_igst_val,
"
"                   g2brln_cgst_val,
"
"                   g2brln_sgst_val,
"
"                   g2brln_cess_val,
"
"                   g2brln_gstr_filing_period,
"
"                   g2brln_gstr_filing_date,
"
"                   g2brln_itc_availability,
"
"                   g2brln_reason,
"
"                   g2brln_appl_pct,
"
"                   g2brln_source,
"
"                   g2brln_irn,
"
"                   g2brln_irn_date,
"
"                   p_user,
"
"                   SYSDATE,
"
"                   g2brln_doc_no,
"
"                   g2brln_ref_date,
"
"                   g2brln_port_code,
"
"                   g2brln_bill_no,
"
"                   g2brln_bill_date
"
"              FROM gstr2b_rec_ln
"
"             WHERE     g2brln_bu = p_bu
"
"                   AND g2brln_type = 'IMPG'
"
"                   AND g2brln_match_status = 'N'
"
"                   AND g2brln_ref IS NULL
"
"                   AND TO_NUMBER (g2brln_doc_no) < TO_NUMBER (p_doc_no)
"
"                   AND TO_NUMBER (g2brln_doc_no) =
"
"                          (SELECT MAX (g2brhd_doc_no)
"
"                             FROM gstr2b_rec_hd
"
"                            WHERE     g2brhd_bu = p_bu
"
"                                  AND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                  AND g2brhd_doc_no < TO_NUMBER (p_doc_no)
"
"                                  AND g2brhd_status = 'P')
"
"                   AND EXISTS
"
"                          (SELECT 1
"
"                             FROM gstr2b_rec_hd
"
"                            WHERE g2brhd_bu = p_bu
"
"                                  AND G2BRHD_GSTIN_NO = p_gstin_no
"
"                                  AND g2brhd_doc_no =
"
"                                         TO_NUMBER (g2brln_doc_no)
"
"                                  AND g2brhd_status = 'P');
"
"      END IF;
"
"
"
"
"
"         IF SQL%FOUND THEN
"
"                UPDATE gstr2b_rec_hd SET g2brhd_pre_record = 'Y'
"
"                    WHERE g2brhd_bu = p_bu
"
"                     AND g2brhd_doc_no = P_DOC_NO;
"
"           ELSE
"
"                    UPDATE gstr2b_rec_hd SET g2brhd_pre_record = 'N'
"
"                    WHERE g2brhd_bu = p_bu
"
"                     AND g2brhd_doc_no = P_DOC_NO;
"
"           END IF;
"
"
"
"      END;
"
"
"
"   /* End of GST Return IMPG */
"
"
"
"   /* GST Return CDNRA */
"
"
"
"   PROCEDURE proc_upload_gst_cdnra (p_bu           VARCHAR2,
"
"                                    p_doc_no       VARCHAR2,
"
"                                    p_gstin_no       VARCHAR2,
"
"                                    p_type         VARCHAR2,
"
"                                    p_dir          VARCHAR2,
"
"                                    p_file_name    VARCHAR2,
"
"                                    p_user         VARCHAR2,
"
"                                    p_prev_record       VARCHAR2)
"
"   IS
"
"   BEGIN
"
"      EXECUTE IMMEDIATE
"
"         'CREATE TABLE TEMP_GSTR2B_AIC_LN(tgstaln_inv_note_doc_type            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_no            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_date            VARCHAR2(500),
"
"                                   tgstaln_uin_no                    VARCHAR2(500),
"
"                                tgstaln_legal_name                VARCHAR2(500),
"
"                                tgstaln_rev_inv_note_doc_type            VARCHAR2(500),
"
"                                tgstaln_rev_inv_note_doc_date            VARCHAR2(500),
"
"                                tgstaln_rev_inv_note_doc_no            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_value            VARCHAR2(500),
"
"                                tgstaln_supply_place                VARCHAR2(500),
"
"                                tgstaln_rate                    VARCHAR2(500),
"
"                                tgstaln_taxable_value                VARCHAR2(500),
"
"                                tgstaln_igst                    VARCHAR2(500),
"
"                                tgstaln_cgst                    VARCHAR2(500),
"
"                                tgstaln_sgst                    VARCHAR2(500),
"
"                                tgstaln_cess                    VARCHAR2(500),
"
"                                tgstaln_party_rtn_status            VARCHAR2(500))
"
"                         ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY '
"
"         || p_dir
"
"         || '
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE SKIP 6
"
"                                       FIELDS TERMINATED BY ''|''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS(tgstaln_inv_note_doc_type            CHAR(255),
"
"                                               tgstaln_inv_note_doc_no            CHAR(255),
"
"                                               tgstaln_inv_note_doc_date            CHAR(255),
"
"                                               tgstaln_uin_no                CHAR(255),
"
"                                               tgstaln_legal_name                CHAR(255),
"
"                                               tgstaln_rev_inv_note_doc_type        CHAR(255),
"
"                                               tgstaln_rev_inv_note_doc_date        CHAR(255),
"
"                                               tgstaln_rev_inv_note_doc_no            CHAR(255),
"
"                                               tgstaln_inv_note_doc_value            CHAR(255),
"
"                                               tgstaln_supply_place                CHAR(255),
"
"                                               tgstaln_rate                    CHAR(255),
"
"                                               tgstaln_taxable_value            CHAR(255),
"
"                                               tgstaln_igst                    CHAR(255),
"
"                                               tgstaln_cgst                    CHAR(255),
"
"                                               tgstaln_sgst                    CHAR(255),
"
"                                               tgstaln_cess                    CHAR(255),
"
"                                               tgstaln_party_rtn_status            CHAR(255)))
"
"                                 LOCATION ('
"
"         || p_dir
"
"         || ':'
"
"         || CHR (39)
"
"         || p_file_name
"
"         || CHR (39)
"
"         || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE
"
"         'INSERT INTO gstr2a_aic_ln_load(gstalnl_seq_no            ,
"
"                                  gstalnl_inv_note_doc_type    ,
"
"                                      gstalnl_inv_note_doc_no        ,
"
"                                      gstalnl_inv_note_doc_date    ,
"
"                                      gstalnl_gstin_uin_no        ,
"
"                                      gstalnl_legal_name        ,
"
"                                      gstalnl_rev_inv_note_doc_type    ,
"
"                                      gstalnl_rev_inv_note_doc_date    ,
"
"                                      gstalnl_rev_inv_note_doc_no    ,
"
"                                      gstalnl_inv_note_doc_value    ,
"
"                                      gstalnl_supply_place        ,
"
"                                      gstalnl_rate            ,
"
"                            gstalnl_taxable_value        ,
"
"                            gstalnl_igst            ,
"
"                            gstalnl_cgst            ,
"
"                            gstalnl_sgst            ,
"
"                            gstalnl_cess            ,
"
"                            gstalnl_party_rtn_status    ) SELECT ROWNUM                ,
"
"                                                 tgstaln_inv_note_doc_type    ,
"
"                                                   tgstaln_inv_note_doc_no      ,
"
"                                                   tgstaln_inv_note_doc_date    ,
"
"                                                   tgstaln_uin_no            ,
"
"                                                   tgstaln_legal_name        ,
"
"                                                   tgstaln_rev_inv_note_doc_type    ,
"
"                                                   tgstaln_rev_inv_note_doc_date    ,
"
"                                                   tgstaln_rev_inv_note_doc_no    ,
"
"                                                   tgstaln_inv_note_doc_value    ,
"
"                                                   tgstaln_supply_place        ,
"
"                                                   tgstaln_rate            ,
"
"                                                   tgstaln_taxable_value        ,
"
"                                                   tgstaln_igst            ,
"
"                                                   tgstaln_cgst            ,
"
"                                                   tgstaln_sgst            ,
"
"                                                   tgstaln_cess            ,
"
"                                                   tgstaln_party_rtn_status
"
"                                                FROM TEMP_GSTR2B_AIC_LN';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_AIC_LN';
"
"
"
"      DELETE FROM gstr2a_aic_ln_load
"
"            WHERE gstalnl_rate = '-';
"
"
"
"      DELETE FROM gstr2a_aic_ln_load
"
"            WHERE gstalnl_inv_note_doc_no IS NULL;
"
"
"
"      INSERT INTO gstr2a_aic_ln (gstaln_bu,
"
"                                 gstaln_doc_no,
"
"                                 gstaln_type,
"
"                                 gstaln_seq_no,
"
"                                 gstaln_inv_note_doc_type,
"
"                                 gstaln_inv_note_doc_no,
"
"                                 gstaln_inv_note_doc_date,
"
"                                 gstaln_gstin_uin_no,
"
"                                 gstaln_legal_name,
"
"                                 gstaln_rev_inv_note_doc_type,
"
"                                 gstaln_rev_inv_note_doc_date,
"
"                                 gstaln_rev_inv_note_doc_no,
"
"                                 gstaln_inv_note_doc_value,
"
"                                 gstaln_supply_place,
"
"                                 gstaln_rate,
"
"                                 gstaln_taxable_value,
"
"                                 gstaln_igst,
"
"                                 gstaln_cgst,
"
"                                 gstaln_sgst,
"
"                                 gstaln_cess,
"
"                                 gstaln_party_rtn_status,
"
"                                 gstaln_cre_by,
"
"                                 gstaln_cre_date)
"
"           SELECT p_bu,
"
"                  p_doc_no,
"
"                  p_type,
"
"                  gstalnl_seq_no,
"
"                  gstalnl_inv_note_doc_type,
"
"                  gstalnl_inv_note_doc_no,
"
"                  TO_DATE (gstalnl_inv_note_doc_date, 'DD.MM.RRRR'),
"
"                  gstalnl_gstin_uin_no,
"
"                  gstalnl_legal_name,
"
"                  gstalnl_rev_inv_note_doc_type,
"
"                  TO_DATE (gstalnl_rev_inv_note_doc_date, 'DD.MM.RRRR'),
"
"                  gstalnl_rev_inv_note_doc_no,
"
"                  gstalnl_inv_note_doc_value,
"
"                  gstalnl_supply_place,
"
"                  gstalnl_rate,
"
"                  gstalnl_taxable_value,
"
"                  gstalnl_igst,
"
"                  gstalnl_cgst,
"
"                  gstalnl_sgst,
"
"                  gstalnl_cess,
"
"                  gstalnl_party_rtn_status,
"
"                  p_user,
"
"                  SYSDATE
"
"             FROM gstr2a_aic_ln_load
"
"         ORDER BY gstalnl_seq_no ASC;
"
"   END;
"
"
"
"   /* End of GST Return CDNRA */
"
"
"
"   /* GST Return ISD */
"
"
"
"   PROCEDURE proc_upload_gst_isd (p_bu           VARCHAR2,
"
"                                  p_doc_no       VARCHAR2,
"
"                                  p_type         VARCHAR2,
"
"                                  p_dir          VARCHAR2,
"
"                                  p_file_name    VARCHAR2,
"
"                                  p_user         VARCHAR2)
"
"   IS
"
"   BEGIN
"
"      EXECUTE IMMEDIATE
"
"         'CREATE TABLE TEMP_GSTR2B_AIC_LN(tgstaln_itc_egbl                VARCHAR2(500),
"
"                                tgstaln_uin_no                    VARCHAR2(500),
"
"                                tgstaln_legal_name                VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_type            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_no            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_date            VARCHAR2(500),
"
"                                tgstaln_cr_note_no                VARCHAR2(500),
"
"                                tgstaln_cr_note_date                VARCHAR2(500),
"
"                                tgstaln_org_inv_no                VARCHAR2(500),
"
"                                tgstaln_org_inv_date                VARCHAR2(500),
"
"                                tgstaln_igst                    VARCHAR2(500),
"
"                                tgstaln_cgst                    VARCHAR2(500),
"
"                                tgstaln_sgst                    VARCHAR2(500),
"
"                                tgstaln_cess                    VARCHAR2(500),
"
"                                tgstaln_party_rtn_status            VARCHAR2(500))
"
"                         ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY '
"
"         || p_dir
"
"         || '
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE SKIP 6
"
"                                       FIELDS TERMINATED BY ''|''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS(tgstaln_itc_egbl                CHAR(255),
"
"                                               tgstaln_uin_no                CHAR(255),
"
"                                               tgstaln_legal_name                CHAR(255),
"
"                                               tgstaln_inv_note_doc_type            CHAR(255),
"
"                                               tgstaln_inv_note_doc_no            CHAR(255),
"
"                                               tgstaln_inv_note_doc_date            CHAR(255),
"
"                                               tgstaln_cr_note_no                CHAR(255),
"
"                                               tgstaln_cr_note_date                CHAR(255),
"
"                                               tgstaln_org_inv_no                CHAR(255),
"
"                                               tgstaln_org_inv_date                CHAR(255),
"
"                                               tgstaln_igst                    CHAR(255),
"
"                                               tgstaln_cgst                    CHAR(255),
"
"                                               tgstaln_sgst                    CHAR(255),
"
"                                               tgstaln_cess                    CHAR(255),
"
"                                               tgstaln_party_rtn_status            CHAR(255)))
"
"                                 LOCATION ('
"
"         || p_dir
"
"         || ':'
"
"         || CHR (39)
"
"         || p_file_name
"
"         || CHR (39)
"
"         || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE
"
"         'INSERT INTO gstr2a_aic_ln_load(gstalnl_seq_no            ,
"
"                                  gstalnl_itc_egbl        ,
"
"                             gstalnl_gstin_uin_no        ,
"
"                             gstalnl_legal_name        ,
"
"                             gstalnl_inv_note_doc_type    ,
"
"                             gstalnl_inv_note_doc_no        ,
"
"                             gstalnl_inv_note_doc_date    ,
"
"                             gstalnl_cr_note_no        ,
"
"                             gstalnl_cr_note_date        ,
"
"                             gstalnl_org_inv_no        ,
"
"                             gstalnl_org_inv_date        ,
"
"                             gstalnl_igst            ,
"
"                             gstalnl_cgst            ,
"
"                             gstalnl_sgst            ,
"
"                             gstalnl_cess            ,
"
"                             gstalnl_party_rtn_status    ) SELECT ROWNUM                ,
"
"                                                  tgstaln_itc_egbl        ,
"
"                                                    tgstaln_uin_no            ,
"
"                                                    tgstaln_legal_name        ,
"
"                                                    tgstaln_inv_note_doc_type    ,
"
"                                                    tgstaln_inv_note_doc_no    ,
"
"                                                    tgstaln_inv_note_doc_date    ,
"
"                                                    tgstaln_cr_note_no        ,
"
"                                                    tgstaln_cr_note_date        ,
"
"                                                    tgstaln_org_inv_no        ,
"
"                                                    tgstaln_org_inv_date        ,
"
"                                                    tgstaln_igst            ,
"
"                                                    tgstaln_cgst            ,
"
"                                                    tgstaln_sgst            ,
"
"                                                    tgstaln_cess            ,
"
"                                                    tgstaln_party_rtn_status
"
"                                                FROM TEMP_GSTR2B_AIC_LN';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_AIC_LN';
"
"
"
"      /*
"
"      DELETE
"
"        FROM gstr2a_aic_ln_load
"
"       WHERE gstalnl_rate = '-';
"
"
"
"      DELETE
"
"        FROM gstr2a_aic_ln_load
"
"       WHERE gstalnl_inv_note_doc_no IS NULL;*/
"
"
"
"      INSERT INTO gstr2a_aic_ln (gstaln_bu,
"
"                                 gstaln_doc_no,
"
"                                 gstaln_type,
"
"                                 gstaln_seq_no,
"
"                                 gstaln_itc_egbl,
"
"                                 gstaln_gstin_uin_no,
"
"                                 gstaln_legal_name,
"
"                                 gstaln_inv_note_doc_type,
"
"                                 gstaln_inv_note_doc_no,
"
"                                 gstaln_inv_note_doc_date,
"
"                                 gstaln_cr_note_no,
"
"                                 gstaln_cr_note_date,
"
"                                 gstaln_org_inv_no,
"
"                                 gstaln_org_inv_date,
"
"                                 gstaln_igst,
"
"                                 gstaln_cgst,
"
"                                 gstaln_sgst,
"
"                                 gstaln_cess,
"
"                                 gstaln_party_rtn_status,
"
"                                 gstaln_cre_by,
"
"                                 gstaln_cre_date)
"
"           SELECT p_bu,
"
"                  p_doc_no,
"
"                  p_type,
"
"                  gstalnl_seq_no,
"
"                  gstalnl_itc_egbl,
"
"                  gstalnl_gstin_uin_no,
"
"                  gstalnl_legal_name,
"
"                  gstalnl_inv_note_doc_type,
"
"                  gstalnl_inv_note_doc_no,
"
"                  gstalnl_inv_note_doc_date,
"
"                  gstalnl_cr_note_no,
"
"                  gstalnl_cr_note_date,
"
"                  gstalnl_org_inv_no,
"
"                  gstalnl_org_inv_date,
"
"                  gstalnl_igst,
"
"                  gstalnl_cgst,
"
"                  gstalnl_sgst,
"
"                  gstalnl_cess,
"
"                  gstalnl_party_rtn_status,
"
"                  p_user,
"
"                  SYSDATE
"
"             FROM gstr2a_aic_ln_load
"
"         ORDER BY gstalnl_seq_no ASC;
"
"   END;
"
"
"
"   /* End of GST Return ISD */
"
"
"
"   /* GST Return ISDA */
"
"
"
"   PROCEDURE proc_upload_gst_isda (p_bu           VARCHAR2,
"
"                                   p_doc_no       VARCHAR2,
"
"                                   p_type         VARCHAR2,
"
"                                   p_dir          VARCHAR2,
"
"                                   p_file_name    VARCHAR2,
"
"                                   p_user         VARCHAR2)
"
"   IS
"
"   BEGIN
"
"      EXECUTE IMMEDIATE
"
"         'CREATE TABLE TEMP_GSTR2B_AIC_LN(tgstaln_inv_note_doc_type            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_no            VARCHAR2(500),
"
"                                tgstaln_inv_note_doc_date            VARCHAR2(500),
"
"                                tgstaln_itc_egbl                VARCHAR2(500),
"
"                                tgstaln_uin_no                    VARCHAR2(500),
"
"                                tgstaln_legal_name                VARCHAR2(500),
"
"                                tgstaln_rev_inv_note_doc_type            VARCHAR2(500),
"
"                                tgstaln_rev_inv_note_doc_no            VARCHAR2(500),
"
"                                tgstaln_rev_inv_note_doc_date            VARCHAR2(500),
"
"                                tgstaln_cr_note_no                VARCHAR2(500),
"
"                                tgstaln_cr_note_date                VARCHAR2(500),
"
"                                tgstaln_org_inv_no                VARCHAR2(500),
"
"                                tgstaln_org_inv_date                VARCHAR2(500),
"
"                                tgstaln_igst                    VARCHAR2(500),
"
"                                tgstaln_cgst                    VARCHAR2(500),
"
"                                tgstaln_sgst                    VARCHAR2(500),
"
"                                tgstaln_cess                    VARCHAR2(500),
"
"                                tgstaln_party_rtn_status            VARCHAR2(500))
"
"                         ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER DEFAULT DIRECTORY '
"
"         || p_dir
"
"         || '
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE SKIP 6
"
"                                       FIELDS TERMINATED BY ''|''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS(tgstaln_inv_note_doc_type            CHAR(255),
"
"                                               tgstaln_inv_note_doc_no            CHAR(255),
"
"                                               tgstaln_inv_note_doc_date            CHAR(255),
"
"                                               tgstaln_itc_egbl                CHAR(255),
"
"                                               tgstaln_uin_no                CHAR(255),
"
"                                               tgstaln_legal_name                CHAR(255),
"
"                                               tgstaln_rev_inv_note_doc_type        CHAR(255),
"
"                                               tgstaln_rev_inv_note_doc_no            CHAR(255),
"
"                                               tgstaln_rev_inv_note_doc_date        CHAR(255),
"
"                                               tgstaln_cr_note_no                CHAR(255),
"
"                                               tgstaln_cr_note_date                CHAR(255),
"
"                                               tgstaln_org_inv_no                CHAR(255),
"
"                                               tgstaln_org_inv_date                CHAR(255),
"
"                                               tgstaln_igst                    CHAR(255),
"
"                                               tgstaln_cgst                    CHAR(255),
"
"                                               tgstaln_sgst                    CHAR(255),
"
"                                               tgstaln_cess                    CHAR(255),
"
"                                               tgstaln_party_rtn_status            CHAR(255)))
"
"                                 LOCATION ('
"
"         || p_dir
"
"         || ':'
"
"         || CHR (39)
"
"         || p_file_name
"
"         || CHR (39)
"
"         || ')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE
"
"         'INSERT INTO gstr2a_aic_ln_load(gstalnl_seq_no            ,
"
"                                  gstalnl_inv_note_doc_type    ,
"
"                            gstalnl_inv_note_doc_no      ,
"
"                            gstalnl_inv_note_doc_date    ,
"
"                            gstalnl_itc_egbl          ,
"
"                            gstalnl_uin_no              ,
"
"                            gstalnl_legal_name          ,
"
"                            gstalnl_rev_inv_note_doc_type    ,
"
"                            gstalnl_rev_inv_note_doc_no    ,
"
"                            gstalnl_rev_inv_note_doc_date    ,
"
"                            gstalnl_cr_note_no        ,
"
"                            gstalnl_cr_note_date        ,
"
"                            gstalnl_org_inv_no        ,
"
"                            gstalnl_org_inv_date        ,
"
"                            gstalnl_igst            ,
"
"                            gstalnl_cgst            ,
"
"                            gstalnl_sgst            ,
"
"                            gstalnl_cess            ,
"
"                            gstalnl_party_rtn_status    ) SELECT ROWNUM                ,
"
"                                                 tgstaln_inv_note_doc_type    ,
"
"                                                    tgstaln_inv_note_doc_no      ,
"
"                                                    tgstaln_inv_note_doc_date    ,
"
"                                                    tgstaln_itc_egbl          ,
"
"                                                    tgstaln_uin_no              ,
"
"                                                    tgstaln_legal_name          ,
"
"                                                    tgstaln_rev_inv_note_doc_type    ,
"
"                                                    tgstaln_rev_inv_note_doc_no    ,
"
"                                                    tgstaln_rev_inv_note_doc_date    ,
"
"                                                    tgstaln_cr_note_no        ,
"
"                                                    tgstaln_cr_note_date        ,
"
"                                                    tgstaln_org_inv_no        ,
"
"                                                    tgstaln_org_inv_date        ,
"
"                                                    tgstaln_igst            ,
"
"                                                    tgstaln_cgst            ,
"
"                                                    tgstaln_sgst            ,
"
"                                                    tgstaln_cess            ,
"
"                                                    tgstaln_party_rtn_status
"
"                                                FROM TEMP_GSTR2B_AIC_LN';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE TEMP_GSTR2B_AIC_LN';
"
"
"
"      DELETE FROM gstr2a_aic_ln_load
"
"            WHERE gstalnl_rate = '-';
"
"
"
"      DELETE FROM gstr2a_aic_ln_load
"
"            WHERE gstalnl_inv_note_doc_no IS NULL;
"
"
"
"      INSERT INTO gstr2a_aic_ln (gstaln_bu,
"
"                                 gstaln_doc_no,
"
"                                 gstaln_type,
"
"                                 gstaln_seq_no,
"
"                                 gstaln_inv_note_doc_type,
"
"                                 gstaln_inv_note_doc_no,
"
"                                 gstaln_inv_note_doc_date,
"
"                                 gstaln_itc_egbl,
"
"                                 gstaln_gstin_uin_no,
"
"                                 gstaln_legal_name,
"
"                                 gstaln_rev_inv_note_doc_type,
"
"                                 gstaln_rev_inv_note_doc_no,
"
"                                 gstaln_rev_inv_note_doc_date,
"
"                                 gstaln_cr_note_no,
"
"                                 gstaln_cr_note_date,
"
"                                 gstaln_org_inv_no,
"
"                                 gstaln_org_inv_date,
"
"                                 gstaln_igst,
"
"                                 gstaln_cgst,
"
"                                 gstaln_sgst,
"
"                                 gstaln_cess,
"
"                                 gstaln_party_rtn_status,
"
"                                 gstaln_cre_by,
"
"                                 gstaln_cre_date)
"
"           SELECT p_bu,
"
"                  p_doc_no,
"
"                  p_type,
"
"                  gstalnl_seq_no,
"
"                  gstalnl_inv_note_doc_type,
"
"                  gstalnl_inv_note_doc_no,
"
"                  gstalnl_inv_note_doc_date,
"
"                  gstalnl_itc_egbl,
"
"                  gstalnl_gstin_uin_no,
"
"                  gstalnl_legal_name,
"
"                  gstalnl_rev_inv_note_doc_type,
"
"                  gstalnl_rev_inv_note_doc_no,
"
"                  gstalnl_rev_inv_note_doc_date,
"
"                  gstalnl_cr_note_no,
"
"                  gstalnl_cr_note_date,
"
"                  gstalnl_org_inv_no,
"
"                  gstalnl_org_inv_date,
"
"                  gstalnl_igst,
"
"                  gstalnl_cgst,
"
"                  gstalnl_sgst,
"
"                  gstalnl_cess,
"
"                  gstalnl_party_rtn_status,
"
"                  p_user,
"
"                  SYSDATE
"
"             FROM gstr2a_aic_ln_load
"
"         ORDER BY gstalnl_seq_no ASC;
"
"   END;
"
"
"
"   /* End of GST Return ISDA */
"
"
"
"   PROCEDURE proc_upload_gst_rtn2b (p_bu              VARCHAR2,
"
"                                    p_doc_no          VARCHAR2,
"
"                                    p_dir             VARCHAR2,
"
"                                    p_file_name       VARCHAR2,
"
"                                    p_user            VARCHAR2,
"
"                                    p_prev_record       VARCHAR2,
"
"                                    p_res         OUT VARCHAR2)
"
"   IS
"
"      CURSOR c1
"
"      IS
"
"         SELECT *
"
"           FROM gstr2b_rec_hd
"
"          WHERE g2brhd_bu = p_bu AND g2brhd_doc_no = p_doc_no;
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
"      IF c1%NOTFOUND
"
"      THEN
"
"         raise_application_error (-20072,
"
"                                  'HRM' || '~' || p_bu || '~' || p_doc_no);
"
"      ELSE
"
"         proc_chk_del_temp_tab (p_bu, p_doc_no);
"
"
"
"         --IF cr1.g2brhd_type = 'B2B'
"
"         --THEN
"
"
"
"            proc_upload_gst_b2b (p_bu,
"
"                                 p_doc_no,
"
"                                 cr1.g2brhd_gstin_no,
"
"                                 'B2B', --cr1.g2brhd_type,
"
"                                 p_dir,
"
"                                 p_file_name,
"
"                                 p_user,
"
"                                 p_prev_record);
"
"         --END IF;
"
"
"
"         --IF cr1.g2brhd_type = 'B2BA'
"
"         --THEN
"
"            proc_upload_gst_b2ba (p_bu,
"
"                                  p_doc_no,
"
"                                  cr1.g2brhd_gstin_no,
"
"                                  p_dir,
"
"                                  p_file_name,
"
"                                  p_user,
"
"                                  p_prev_record);
"
"         --END IF;
"
"
"
"         --IF cr1.g2brhd_type = 'CDNR'
"
"         --THEN
"
"            proc_upload_gst_cdnr (p_bu,
"
"                                  p_doc_no,
"
"                                  cr1.g2brhd_gstin_no,
"
"                                  'CDNR', --cr1.g2brhd_type,
"
"                                  p_dir,
"
"                                  p_file_name,
"
"                                  p_user,
"
"                                  p_prev_record);
"
"         --END IF;
"
"
"
"         proc_upload_gst_impg (p_bu,
"
"                                  p_doc_no,
"
"                                  cr1.g2brhd_gstin_no,
"
"                                  p_dir,
"
"                                  p_file_name,
"
"                                  p_user,
"
"                                  p_prev_record);
"
"
"
"         IF cr1.g2brhd_type = 'CDNRA'
"
"         THEN
"
"            proc_upload_gst_cdnra (p_bu,
"
"                                   p_doc_no,
"
"                                   cr1.g2brhd_gstin_no,
"
"                                   cr1.g2brhd_type,
"
"                                   p_dir,
"
"                                   p_file_name,
"
"                                   p_user,
"
"                                   p_prev_record);
"
"         END IF;
"
"
"
"         IF cr1.g2brhd_type = 'ISD'
"
"         THEN
"
"            proc_upload_gst_isd (p_bu,
"
"                                 p_doc_no,
"
"                                 cr1.g2brhd_type,
"
"                                 p_dir,
"
"                                 p_file_name,
"
"                                 p_user);
"
"         END IF;
"
"
"
"         IF cr1.g2brhd_type = 'ISDA'
"
"         THEN
"
"            proc_upload_gst_isda (p_bu,
"
"                                  p_doc_no,
"
"                                  cr1.g2brhd_type,
"
"                                  p_dir,
"
"                                  p_file_name,
"
"                                  p_user);
"
"         END IF;
"
"
"
"
"
"         proc_upd_upload_data (p_bu,
"
"                               p_doc_no,
"
"                               cr1.g2brhd_type,
"
"                               p_res);
"
"
"
"
"
"      END IF;
"
"
"
"      CLOSE c1;
"
"   END;
"
"END;"
/
