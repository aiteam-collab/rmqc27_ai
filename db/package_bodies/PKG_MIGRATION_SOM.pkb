CREATE OR REPLACE
"PACKAGE BODY pkg_migration_som
"
"AS
"
"
"
"PROCEDURE proc_chk_migrate_table(p_tab_name    VARCHAR2)
"
"AS
"
"
"
"v_tab_cnt    NUMBER;
"
"v_sql        VARCHAR2(100);
"
"
"
"BEGIN
"
"
"
"  SELECT COUNT(table_name)
"
"    INTO v_tab_cnt
"
"    FROM user_tables
"
"   WHERE table_name = p_tab_name;
"
"
"
"  IF v_tab_cnt <> 0 THEN
"
"    v_sql := 'DROP TABLE '||p_tab_name;
"
"    EXECUTE IMMEDIATE v_sql;
"
"  END IF;
"
"
"
"END;
"
"
"
"
"
"PROCEDURE proc_ins_sal_inv_mig(p_bu        business_units.bu_id%TYPE,
"
"                    p_doc_no    sales_invoice_mig_hd.simh_doc_no%TYPE,
"
"                    p_fname        sales_invoice_mig_hd.simh_file_name%TYPE,
"
"                    p_sep        VARCHAR2,
"
"                    p_user        sales_invoice_mig_hd.simh_cre_by%TYPE
"
"                ) --AUTHIDCURRENT_USER
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"v_tax   VARCHAR2(200);
"
"v_tax_cls VARCHAR2(200);
"
"v_plnt_loc_id VARCHAR2(100);
"
"
"
"BEGIN
"
"    BEGIN
"
"
"
"      SELECT directory_path
"
"        INTO v_fpath
"
"        FROM dba_directories
"
"       WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20014,'WFM');
"
"    END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_UNIT_LOC_ID     VARCHAR2(10),
"
"                                         SM_UNIT            VARCHAR2(10),
"
"					 SM_TYPE	    VARCHAR2(6),
"
"                                         SM_INV_PFX            VARCHAR2(5),
"
"                                         SM_INV_NO            VARCHAR2(30),
"
"                                         SM_INV_DATE        DATE,
"
"                                         SM_CUST_ID         VARCHAR2(10),
"
"                                         SM_PROD_ID            VARCHAR2(100),
"
"                                         SM_PROD_REV        NUMBER(5),
"
"                                         SM_PROD_DESC         VARCHAR2(150),
"
"                                         SM_UOM             VARCHAR2(5),
"
"                                         SM_QTY             NUMBER(15,5),
"
"                                         SM_PRICE             NUMBER(15,5),
"
"                                         SM_DISC_PCT             NUMBER(18,5),
"
"					 SM_DISC_AMT  		 NUMBER (18,5),
"
"					 SM_HSN_CODE	       VARCHAR2(25),
"
"                                         SM_CUST_PO_NO         VARCHAR2(100),
"
"                                         SM_CUST_PO_DATE    DATE,
"
"                                         SM_EXE_RATE         NUMBER(13,8),
"
"                                         SM_OLD_INV_PFX        VARCHAR2(5),
"
"                                         SM_OLD_INV_NO         VARCHAR2(30),
"
"                                         SM_OLD_INV_SEQ_NO     NUMBER(5),
"
"					 SM_REVERSE_FLAG       VARCHAR2(1)
"
"					 )
"
"              ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"              DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"              ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"              SKIP 1
"
"              FIELDS TERMINATED BY '''||p_sep||''' OPTIONALLY ENCLOSED BY ''""''
"
"              MISSING FIELD VALUES ARE NULL
"
"              REJECT ROWS WITH ALL NULL FIELDS
"
"                    (SM_UNIT_LOC_ID     CHAR(255),
"
"                     SM_UNIT              CHAR(255),
"
"		     SM_TYPE		  CHAR(255),
"
"                     SM_INV_PFX            CHAR(255),
"
"                     SM_INV_NO            CHAR(255),
"
"                     SM_INV_DATE        CHAR(255),
"
"                     SM_CUST_ID          CHAR(255),
"
"                     SM_PROD_ID          CHAR(255),
"
"                     SM_PROD_REV         CHAR(255),
"
"                     SM_PROD_DESC         CHAR(255),
"
"                     SM_UOM             CHAR(255),
"
"                     SM_QTY             CHAR(255),
"
"                     SM_PRICE             CHAR(255),
"
"                     SM_DISC_PCT             CHAR(255),
"
"		     SM_DISC_AMT	     CHAR(255),
"
"		     SM_HSN_CODE	      CHAR(255),
"
"                     SM_CUST_PO_NO         CHAR(255),
"
"                     SM_CUST_PO_DATE    CHAR(255) ,
"
"                     SM_EXE_RATE         CHAR(255),
"
"                     SM_OLD_INV_PFX        CHAR(255),
"
"                     SM_OLD_INV_NO         CHAR(255),
"
"                     SM_OLD_INV_SEQ_NO     CHAR(255),
"
"		     SM_REVERSE_FLAG	   CHAR(255)
"
"		     ))
"
"                    LOCATION ('''||p_fname||''')
"
"                    ) REJECT LIMIT UNLIMITED';
"
"--date_format DATE mask ""dd-mm-yyyy""
"
"    EXECUTE IMMEDIATE v_sql;
"
"
"
"      DELETE sales_invoice_mig_ln
"
"       WHERE siml_bu = p_bu
"
"         AND siml_doc_no = p_doc_no;
"
"
"
"      v_sql := 'INSERT INTO sales_invoice_mig_ln(siml_bu,
"
"                                                 siml_doc_no,
"
"                                                 siml_seq_no,
"
"                                                 siml_plnt_loc_id,
"
"                                                 siml_plnt,
"
"                                                 siml_inv_pfx,
"
"                                                 siml_inv_no,
"
"                                                 siml_inv_date,
"
"                                                 siml_cust_id,
"
"                                                 siml_prod_id,
"
"                                                 siml_prod_rev,
"
"                                                 siml_prod_desc1,
"
"                                                 siml_uom,
"
"                                                 siml_inv_qty,
"
"                                                 siml_price,
"
"                                                 siml_cust_po_no,
"
"                                                 siml_cust_po_date,
"
"                                                 siml_exchange_rate,
"
"                                                 siml_old_inv_pfx,
"
"                                                 siml_old_inv_no,
"
"                                                 siml_old_inv_seq_no,
"
"                                                 siml_cre_by,
"
"                                                 siml_cre_date,
"
"                                                 siml_store_id,
"
"						 siml_disc_pct,
"
"						 siml_spl_disc_pct,
"
"						 siml_cash_disc_pct,
"
"						 siml_hsn_code,
"
"						 siml_disc_amt,
"
"						 siml_reverse_flag,
"
"						 siml_type
"
"						 )
"
"                                        SELECT '''||p_bu||''',
"
"                                               '''||p_doc_no||''',
"
"                                               ROWNUM,
"
"                                               sm_unit_loc_id,
"
"                                               sm_unit,
"
"                                               sm_inv_pfx,
"
"                                               sm_inv_no,
"
"                                               sm_inv_date,
"
"                                               sm_cust_id,
"
"                                               sm_prod_id,
"
"                                               sm_prod_rev,
"
"                                               sm_prod_desc,
"
"                                               sm_uom,
"
"                                               NVL(sm_qty,0),
"
"                                               NVL(sm_price,0),
"
"                                               sm_cust_po_no,
"
"                                               sm_cust_po_date,
"
"                                               NVL(sm_exe_rate,1),
"
"                                               sm_old_inv_pfx,
"
"                                               sm_old_inv_no,
"
"                                               sm_old_inv_seq_no,
"
"                                               '''||p_user||''',
"
"                                               SYSDATE,
"
"                                               NULL,
"
"					       NVL(sm_disc_pct,0),
"
"					       0,
"
"					       0,
"
"					       sm_hsn_code,
"
"					       NVL(sm_disc_amt,0),
"
"					       NVL(sm_reverse_flag,''N''),
"
"					       sm_type
"
"                                          FROM scm_migration';
"
"
"
"    EXECUTE IMMEDIATE v_sql;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_sal_inv_mig;
"
"
"
"PROCEDURE proc_ins_si_mig_excep(p_bu        business_units.bu_id%TYPE,
"
"                                p_doc_no    sales_invoice_mig_hd.simh_doc_no%TYPE,
"
"                                p_user      sales_invoice_mig_hd.simh_cre_by%TYPE
"
"                               )
"
"AS
"
"
"
"CURSOR c_cntl IS
"
"SELECT somctrl_cust_prod_req_flag
"
"  FROM som_control
"
" WHERE somctrl_bu = p_bu;
"
"
"
"CURSOR c01 IS
"
"SELECT *
"
"  FROM sales_invoice_mig_ln
"
" WHERE siml_bu = p_bu
"
"   AND siml_doc_no = p_doc_no;
"
"
"
"CURSOR c1(c_cust_id varchar2)
"
"    IS
"
" SELECT *
"
"   FROM suppliers
"
"  WHERE suplr_bu = p_bu
"
"    AND suplr_suplr_id = c_cust_id
"
"    AND suplr_status = 'A';
"
"
"
"CURSOR c2(c_prod_id varchar2,
"
"          c_prod_rev number)
"
"    IS
"
"SELECT prod_id,
"
"       prod_rev,
"
"       prod_desc11,
"
"       ppl_dflt_store_id prodplnt_deflt_store_id,
"
"       ppl_ship_store_id prodplnt_ship_store_id,
"
"       prod_hsn_code
"
"  FROM products,prod_plants,prod_plants_loc
"
" WHERE prod_bu = prodplnt_bu
"
"   AND prod_id = prodplnt_prod_id
"
"   AND prod_rev = prodplnt_prod_rev
"
"   AND prodplnt_bu = ppl_bu
"
"   AND prodplnt_plnt = ppl_plnt
"
"   AND prodplnt_prod_id = ppl_prod_id
"
"   AND prodplnt_prod_rev = ppl_prod_rev
"
"   AND prod_status = 'A'
"
"   AND prodplnt_status = 'A'
"
"   AND prod_saleable = 'Y'
"
"   AND prod_bu = p_bu
"
"   AND prod_id = c_prod_id
"
"   AND prod_rev = c_prod_rev;
"
"
"
"CURSOR c3(c_plnt  VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM bus_unit_plants
"
" WHERE bup_bu = p_bu
"
"   AND bup_plant_id = c_plnt;
"
"
"
"CURSOR c4(c_uom   VARCHAR2)
"
"    IS
"
" SELECT uom_uom
"
"   FROM unit_of_measures
"
"  WHERE uom_bu = p_bu
"
"    AND uom_uom = c_uom;
"
"
"
"CURSOR c5 (c_cust_id     VARCHAR2,
"
"           c_prod_id     VARCHAR2,
"
"           c_prod_rev    NUMBER)
"
"    IS
"
"SELECT *
"
"  FROM cust_prod
"
" WHERE custp_bu = p_bu
"
"   AND custp_cust_id = c_cust_id
"
"   AND custp_prod_id = c_prod_id
"
"   AND custp_prod_rev = c_prod_rev;
"
"
"
"CURSOR c6 (c_store_id varchar2)
"
"    IS
"
"SELECT store_id,store_desc1, store_desc2
"
"  FROM stores
"
" WHERE store_bu = p_bu
"
"   AND store_id = c_store_id;
"
"
"
"CURSOR c7 IS
"
"SELECT *
"
"  FROM sales_invoice_mig_ln
"
" WHERE siml_bu = p_bu
"
"   AND siml_doc_no = p_doc_no
"
"   AND siml_cust_po_no IS NULL;
"
"
"
"CURSOR c8 IS
"
"SELECT *
"
"  FROM sales_invoice_mig_ln
"
" WHERE siml_bu = p_bu
"
"   AND siml_doc_no = p_doc_no
"
"   AND siml_cust_po_date IS NULL;
"
"
"
"CURSOR c9(c_plnt_loc_id  VARCHAR2,c_plnt VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM bus_unit_plants_loc_dtls
"
" WHERE bupld_bu = p_bu
"
"   AND bupld_plnt = c_plnt
"
"   AND bupld_loc_id = c_plnt_loc_id;
"
"
"
"CURSOR c10 (c_plnt VARCHAR2,c_inv_pfx VARCHAR2,c_inv_no VARCHAR2) IS
"
"  SELECT *
"
"    FROM sales_invoices_hd
"
"   WHERE sihd_bu = p_bu
"
"     AND sihd_plant = c_plnt
"
"     AND sihd_exc_inv_pfx = c_inv_pfx
"
"     AND sihd_exc_inv_no = c_inv_no
"
"     AND sihd_status NOT IN ('C');
"
"
"
"CURSOR c11(c_hsn_code   VARCHAR2)IS
"
"SELECT *
"
"  FROM hsn_sac_tax_rates
"
" WHERE hstr_bu = p_bu
"
"   AND hstr_status = 'A'
"
"   AND hstr_hsnsac_code = c_hsn_code;
"
"
"
"CURSOR c12(c_plnt VARCHAR2,c_plnt_loc_id VARCHAR2,c_inv_pfx VARCHAR2,c_type VARCHAR2)
"
"IS
"
"SELECT apsta_pfx
"
"  FROM appl_pfx_sub_types_asso,
"
"	   appl_doc_pfx_loc,
"
"	   appl_doc_prefixes
"
" WHERE apsta_bu = adpl_bu
"
"   AND apsta_pfx = adpl_pfx
"
"   AND adp_bu = adpl_bu
"
"   AND adp_pfx = adpl_pfx
"
"   AND adp_plnt = adpl_plnt
"
"   AND apsta_bu = p_bu
"
"   AND apsta_vou_type = 'SI'
"
"   AND apsta_sub_type = c_type--'SIG'
"
"   AND apsta_plnt = c_plnt
"
"   AND adpl_loc_id = c_plnt_loc_id
"
"   AND adpl_dflt_loc = 'Y'
"
"   AND apsta_pfx = c_inv_pfx;
"
"
"
"CURSOR c13(c_seq_no		NUMBER) IS
"
"SELECT *
"
"  FROM sales_invoice_mig_ln
"
" WHERE siml_bu = p_bu
"
"   AND siml_doc_no = p_doc_no
"
"   AND siml_seq_no = c_seq_no
"
"   AND siml_cust_po_date > TRUNC(SYSDATE);
"
"
"
"
"
"CURSOR c14(c_seq_no		NUMBER) IS
"
"SELECT *
"
"  FROM sales_invoice_mig_ln
"
" WHERE siml_bu = p_bu
"
"   AND siml_doc_no = p_doc_no
"
"   AND siml_seq_no = c_seq_no
"
"   AND siml_exchange_rate < 1;
"
"
"
"CURSOR c15(c_type	VARCHAR2)
"
"IS
"
"SELECT DISTINCT apst_sub_type_desc
"
"  FROM appl_vou_sub_types
"
" WHERE apst_bu = p_bu
"
"    AND apst_sub_type = c_type
"
"   AND apst_vou_type = 'SI';
"
"
"
"v_seq_no    NUMBER;
"
"cr1         c1%ROWTYPE;
"
"cr2         c2%ROWTYPE;
"
"cr3         c3%ROWTYPE;
"
"cr4         c4%ROWTYPE;
"
"cr5         c5%ROWTYPE;
"
"cr6         c6%ROWTYPE;
"
"cr7         c7%ROWTYPE;
"
"cr8         c8%ROWTYPE;
"
"cr9         c9%ROWTYPE;
"
"cr_cntl        c_cntl%ROWTYPE;
"
"cr10         c10%ROWTYPE;
"
"cr11         c11%ROWTYPE;
"
"cr12		 c12%ROWTYPE;
"
"cr13		 c13%ROWTYPE;
"
"cr14		 c14%ROWTYPE;
"
"cr15	         c15%ROWTYPE;
"
"v_stk_qty	NUMBER;
"
"v_store_id	VARCHAR2(10);
"
"v_ship_store_id   VARCHAR2(10);
"
"v_ls_stk		NUMBER;
"
"
"
"BEGIN
"
"
"
"  DELETE
"
"    FROM sales_invoice_mig_excep
"
"   WHERE sime_bu = p_bu
"
"     AND sime_doc_no = p_doc_no;
"
"
"
"  OPEN c_cntl;
"
"  FETCH c_cntl INTO cr_cntl;
"
"  CLOSE c_cntl;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"
"
"    OPEN c1(cr01.siml_cust_id);
"
"    FETCH c1 INTO cr1;
"
"      IF c1%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_cust_id ||'-'||'Customer not found.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c1;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"    OPEN c2(cr01.siml_prod_id,cr01.siml_prod_rev);
"
"    FETCH c2 INTO cr2;
"
"      IF c2%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id,
"
"                                            cr01.siml_prod_rev,
"
"                                            cr01.siml_prod_id ||'/'||cr01.siml_prod_rev ||'-'||'Item not found' ,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      ELSE
"
"
"
"		IF cr01.siml_hsn_code IS NULL AND cr2.prod_hsn_code IS NULL THEN
"
"
"
"		  INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id,
"
"                                            cr01.siml_prod_rev,
"
"                                            cr01.siml_prod_id ||'/'||cr01.siml_prod_rev ||'-'||'HSNSAC Code not found' ,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"		END IF;
"
"
"
"      END IF;
"
"    CLOSE c2;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"    OPEN c3(cr01.siml_plnt);
"
"    FETCH c3 INTO cr3;
"
"      IF c3%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_plnt||'-'||'Unit not found.' ,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c3;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"    OPEN c9(cr01.siml_plnt_loc_id,cr01.siml_plnt);
"
"    FETCH c9 INTO cr9;
"
"      IF c9%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_plnt_loc_id||'-'||'Unit Location not found.' ,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c9;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"    OPEN c4(cr01.siml_uom);
"
"    FETCH c4 INTO cr4;
"
"      IF c4%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_uom||'-'||'UOM not found.' ,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c4;
"
"  END LOOP;
"
"
"
"  IF cr_cntl.somctrl_cust_prod_req_flag = 'Y' THEN
"
"    FOR cr01 IN c01
"
"    LOOP
"
"      OPEN c5(cr01.siml_cust_id,cr01.siml_prod_id,cr01.siml_prod_rev);
"
"      FETCH c5 INTO cr5;
"
"        IF c5%NOTFOUND THEN
"
"
"
"          INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                              sime_doc_no,
"
"                                              sime_seq_no,
"
"                                              sime_plnt,
"
"                                              sime_cust_id,
"
"                                              sime_prod_id,
"
"                                              sime_prod_rev,
"
"                                              sime_reference,
"
"                                              sime_cre_by,
"
"                                              sime_cre_date
"
"                                             )
"
"                                       VALUES(p_bu,
"
"                                              p_doc_no,
"
"                                              cr01.siml_seq_no,
"
"                                              NULL,
"
"                                              NULL,
"
"                                              NULL,
"
"                                              NULL,
"
"                                              cr01.siml_plnt||'/'||cr01.siml_cust_id||'/'||cr01.siml_prod_id||'/'||cr01.siml_prod_rev||'-'||'Customer item not found.' ,
"
"                                              p_user,
"
"                                              SYSDATE
"
"                                                );
"
"        END IF;
"
"      CLOSE c5;
"
"    END LOOP;
"
"  END IF;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"    IF cr01.siml_inv_pfx IS NULL OR cr01.siml_inv_no IS NULL THEN
"
"      INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_cust_id,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            'Inv. Pfx./No. must be entered.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"    ELSE
"
"
"
"    OPEN c10(cr01.siml_plnt,cr01.siml_inv_pfx,cr01.siml_inv_no);
"
"    FETCH c10 INTO cr10;
"
"      IF c10%FOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_cust_id,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            'Invoice No. already exists '||'-'||cr01.siml_inv_pfx||'-'||cr01.siml_inv_no,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c10;
"
"    END IF;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"
"
"    OPEN c12(cr01.siml_plnt,cr01.siml_plnt_loc_id,cr01.siml_inv_pfx,cr01.siml_type);
"
"    FETCH c12 INTO cr12;
"
"      IF c12%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_inv_pfx ||'-'||'Invoice prefix not found.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c12;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"    OPEN c15(cr01.siml_type);
"
"    FETCH c15 INTO cr15;
"
"      IF c15%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_type||'-'||'SI Type not found.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c15;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"    OPEN c11(cr01.siml_hsn_code);
"
"    FETCH c11 INTO cr11;
"
"      IF c11%NOTFOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_hsn_code||'-'||'HSN Code not found.' ,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c11;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"
"
"	IF LENGTH(cr01.siml_inv_qty) > 9 OR cr01.siml_inv_qty IS NULL THEN
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Qty. ~ '||cr01.siml_inv_qty,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"	END IF;
"
"
"
"	IF LENGTH(cr01.siml_price) > 10  OR cr01.siml_price IS NULL THEN
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Price ~ '||cr01.siml_price,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"	END IF;
"
"
"
"	/*IF LENGTH(cr01.siml_disc_amt) > 13  OR cr01.siml_disc_amt IS NOT NULL THEN
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Disc. Amt. ~ '||cr01.siml_disc_amt,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"	END IF;*/
"
"
"
"	IF cr01.siml_inv_qty IS NOT NULL THEN
"
"	BEGIN
"
" 	  proc_isalphanumeric(cr01.siml_inv_qty);
"
"    EXCEPTION WHEN OTHERS THEN
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Qty. ~ '||cr01.siml_inv_qty,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"    END;
"
"	END IF;
"
"	IF cr01.siml_price IS NOT NULL THEN
"
"	BEGIN
"
"	  proc_isalphanumeric(cr01.siml_price);
"
"	EXCEPTION WHEN OTHERS THEN
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Price ~ '||cr01.siml_price,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"	END;
"
"	END IF;
"
"
"
"
"
"	IF cr01.siml_disc_amt IS NOT NULL THEN
"
"	BEGIN
"
"	  proc_isalphanumeric(cr01.siml_disc_amt);
"
"	EXCEPTION WHEN OTHERS THEN
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Disc. Amt. ~ '||cr01.siml_disc_amt,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"	END;
"
"	END IF;
"
"
"
"	IF cr01.siml_inv_qty IS NOT NULL AND ((cr01.siml_inv_qty - FLOOR(cr01.siml_inv_qty))) <> TRUNC(((cr01.siml_inv_qty - FLOOR(cr01.siml_inv_qty))),2) THEN
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Qty. ~ '||cr01.siml_inv_qty,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"	END IF;
"
"
"
"	IF cr01.siml_price IS NOT NULL AND ((cr01.siml_price - FLOOR(cr01.siml_price))) <> TRUNC(((cr01.siml_price - FLOOR(cr01.siml_price))),2) THEN
"
"
"
"	   INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Invalid Price ~ '||cr01.siml_price,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"
"
"	END IF;
"
"
"
"    IF cr01.siml_inv_qty <= 0 OR cr01.siml_price <= 0 THEN
"
"          INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Quantity/price must be greater than zero.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"
"
"
"
"      IF cr01.siml_disc_amt < 0 THEN
"
"          INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Disc. Amt. should be greater than zero.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"
"
"
"
"      IF cr01.siml_disc_amt > 0 AND cr01.siml_disc_pct > 0 THEN
"
"          INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_prod_id ||'-'||'Disc. % and Disc. Amt. should not be given.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"
"
"  IF cr01.siml_plnt_loc_id IS NOT NULL AND cr01.siml_plnt IS NOT NULL AND cr01.siml_prod_id IS NOT NULL THEN
"
"  BEGIN
"
"  SELECT ppl_ship_store_id
"
"    INTO v_ship_store_id
"
"    FROM prod_plants_loc
"
"   WHERE ppl_bu = p_bu
"
"     AND ppl_plnt = cr01.siml_plnt
"
"     AND ppl_plnt_loc_id = cr01.siml_plnt_loc_id
"
"     AND ppl_prod_id =  cr01.siml_prod_id
"
"     AND ppl_prod_rev =  cr01.siml_prod_rev;
"
"  EXCEPTION WHEN OTHERS THEN
"
"    v_ship_store_id := NULL;
"
"  END;
"
"
"
"   IF v_ship_store_id IS NULL THEN
"
"    INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            cr01.siml_plnt||'-'||cr01.siml_plnt_loc_id ||'-'||cr01.siml_prod_id||'/'||'Ship warehouse not found.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"   ELSE
"
"
"
"  IF cr01.siml_type = 'SISCR' THEN
"
"    BEGIN
"
"     SELECT ppl_scrp_store_id
"
"       INTO v_store_id
"
"       FROM prod_plants_loc
"
"      WHERE ppl_bu = p_bu
"
"        AND ppl_plnt = cr01.siml_plnt
"
"        AND ppl_plnt_loc_id = cr01.siml_plnt_loc_id
"
"        AND ppl_prod_id = cr01.siml_prod_id
"
"        AND ppl_prod_rev = cr01.siml_prod_rev;
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_store_id := NULL;
"
"    END;
"
"  ELSE
"
"    v_store_id := func_find_ship_storeid(p_bu,cr01.siml_plnt,cr01.siml_plnt_loc_id,cr01.siml_prod_id,cr01.siml_prod_rev,'N');
"
"  END IF;
"
"    v_stk_qty := func_find_curr_stk_hand(p_bu,v_store_id,cr01.siml_prod_id,cr01.siml_prod_rev) ;
"
"
"
"
"
"      IF cr01.siml_inv_qty > v_stk_qty THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            v_store_id||'/'||cr01.siml_prod_id ||'-'||'Quantity on hand is low.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"
"
"	 ELSIF cr01.siml_inv_qty <= v_stk_qty AND func_find_prod_ser_lot_type (p_bu,cr01.siml_prod_id,cr01.siml_prod_rev) IN ('L','O','S') THEN
"
"
"
"		BEGIN
"
"		  SELECT NVL(SUM(lss_qty_hand - lss_qty_allocated),0)
"
"		    INTO v_ls_stk
"
"			FROM lot_ser_Stocks,products
"
"		   WHERE lss_bu = prod_bu
"
"		     AND lss_prod_id = prod_id
"
"			 AND lss_prod_rev = prod_rev
"
"			 AND lss_bu = p_bu
"
"		     AND lss_store_id = v_store_id
"
"			 AND lss_prod_id = cr01.siml_prod_id
"
"			 AND lss_prod_rev = cr01.siml_prod_rev
"
"			 AND (lss_qty_hand - lss_qty_allocated) > 0
"
"			 AND lss_vou_date <= NVL(TRUNC(cr01.siml_inv_date),TRUNC(SYSDATE))
"
"             AND ( (prod_expr_flag = 'Y'
"
"                               AND ADD_MONTHS (TRUNC (lss_expiry_date),
"
"                                               -prod_chk_exp_mon) >=
"
"                                      TRUNC (SYSDATE))
"
"                             OR prod_expr_flag = 'N')
"
"             AND lss_hold_flag = 'N';
"
"		EXCEPTION WHEN NO_DATA_FOUND THEN
"
"		  v_ls_stk := 0;
"
"		END;
"
"		--RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_store_id||'~'||cr01.siml_prod_id||'~'||v_stk_qty||'~'||cr01.siml_inv_qty||'~'||v_ls_stk);
"
"		IF cr01.siml_inv_qty > v_ls_stk THEN
"
"
"
"		  INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_plnt,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            v_store_id||'/'||cr01.siml_prod_id ||'-'||'Lot/Serial Stock Quantity is low.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"		END IF;
"
"	 END IF;
"
"  END IF;
"
"  END IF;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"
"
"    OPEN c13(cr01.siml_seq_no);
"
"    FETCH c13 INTO cr13;
"
"      IF c13%FOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            cr01.siml_cust_id,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            'Customer PO date should not be greater than current date.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c13;
"
"  END LOOP;
"
"
"
"  FOR cr01 IN c01
"
"  LOOP
"
"
"
"    OPEN c14(cr01.siml_seq_no);
"
"    FETCH c14 INTO cr14;
"
"      IF c14%FOUND THEN
"
"
"
"        INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            cr01.siml_seq_no,
"
"                                            NULL,
"
"                                            cr01.siml_cust_id,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            'Exchange rate should be greater than 1.',
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"      END IF;
"
"    CLOSE c14;
"
"  END LOOP;
"
"
"
"  FOR r_inv IN (
"
"
"
"		SELECT siml_cust_id,siml_inv_pfx,siml_inv_no,COUNT(*)
"
"  FROM (
"
"   SELECT siml_plnt,
"
"                   siml_inv_pfx,
"
"                   siml_inv_no,
"
"                   siml_inv_date,
"
"                   siml_cust_id,
"
"                   suplr_sales_person,
"
"                   suplr_name1,
"
"                   suplr_currency,
"
"                   suplr_term_id,
"
"                   suplr_fob_id,
"
"                   suplr_shipvia_id,
"
"                   suplr_sales_area,
"
"                   suplr_sales_terr,
"
"                   suplr_sub_terr_id,
"
"                   siml_plnt_loc_id,
"
"           siml_cust_po_no,
"
"           siml_cust_po_date,
"
"           suplr_ar_term_id
"
"              FROM sales_invoice_mig_ln, suppliers
"
"             WHERE     siml_bu = p_bu
"
"                   AND siml_doc_no = p_doc_no
"
"                   AND siml_bu = suplr_bu
"
"                   AND siml_cust_id = suplr_suplr_id
"
"                   AND suplr_status = 'A'
"
"          GROUP BY siml_plnt,
"
"                   siml_inv_pfx,
"
"                   siml_inv_no,
"
"                   siml_inv_date,
"
"                   siml_cust_id,
"
"                   suplr_sales_person,
"
"                   suplr_name1,
"
"                   suplr_currency,
"
"                   suplr_term_id,
"
"                   suplr_fob_id,
"
"                   suplr_shipvia_id,
"
"                   suplr_sales_area,
"
"                   suplr_sales_terr,
"
"                   suplr_sub_terr_id,
"
"                   siml_plnt_loc_id,
"
"           siml_cust_po_no,siml_cust_po_date,
"
"           suplr_ar_term_id
"
"           )
"
"           GROUP BY siml_inv_pfx,siml_inv_no,siml_cust_id
"
"		   HAVING COUNT(*) > 1)
"
"  LOOP
"
"
"
"    INSERT INTO sales_invoice_mig_excep(sime_bu,
"
"                                            sime_doc_no,
"
"                                            sime_seq_no,
"
"                                            sime_plnt,
"
"                                            sime_cust_id,
"
"                                            sime_prod_id,
"
"                                            sime_prod_rev,
"
"                                            sime_reference,
"
"                                            sime_cre_by,
"
"                                            sime_cre_date
"
"                                           )
"
"                                     VALUES(p_bu,
"
"                                            p_doc_no,
"
"                                            1,
"
"                                            r_inv.siml_cust_id,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            NULL,
"
"                                            'Duplicate Invoice No. Details'||'~'||r_inv.siml_inv_pfx||'~'||r_inv.siml_inv_no,
"
"                                            p_user,
"
"                                            SYSDATE
"
"                                           );
"
"  END LOOP;
"
"
"
"Commit;
"
"
"
"END proc_ins_si_mig_excep;
"
"
"
"END pkg_migration_som;"
/
