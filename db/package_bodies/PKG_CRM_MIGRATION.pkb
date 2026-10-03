CREATE OR REPLACE
"PACKAGE BODY pkg_crm_migration
"
"AS
"
"
"
"  PROCEDURE proc_chk_migrate_table (p_tab_name VARCHAR2)
"
"  AS
"
"      v_tab_cnt   NUMBER;
"
"      v_sql       VARCHAR2 (100);
"
"  BEGIN
"
"      SELECT COUNT (table_name)
"
"        INTO v_tab_cnt
"
"        FROM user_tables
"
"       WHERE table_name = p_tab_name;
"
"
"
"      IF v_tab_cnt <> 0
"
"      THEN
"
"         v_sql := 'DROP TABLE ' || p_tab_name;
"
"
"
"         EXECUTE IMMEDIATE v_sql;
"
"      END IF;
"
"   END;
"
"/*******************************************************************Sponsors CFG0150*******************************************************************/
"
"
"
"PROCEDURE  proc_ins_spons(p_bu       VARCHAR2,
"
"                          p_fname    VARCHAR2,
"
"                          p_sep      VARCHAR2,
"
"                          p_user     VARCHAR2)
"
"AS
"
"
"
"v_sql     VARCHAR2(4000);
"
"v_fpath   VARCHAR2(200);
"
"v_type    VARCHAR2(10);
"
"v_type_id VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_SPONSOR_DESC1 VARCHAR2(50));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"   BEGIN
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
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"        v_sql := 'CREATE TABLE scm_migration(SM_SPONSOR_DESC1    VARCHAR2(50))
"
"                         ORGANIZATION EXTERNAL
"
"                         (TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep|| '''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                         (SM_SPONSOR_DESC1   CHAR(255)
"
"                          ))
"
"                         LOCATION ('''||p_fname|| ''')
"
"                         )REJECT LIMIT UNLIMITED';
"
"
"
"EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(mkgs_sponsor_id)
"
"        INTO v_type
"
"        FROM mkg_sponsors
"
"       WHERE mkgs_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"       INSERT INTO mkg_sponsors(mkgs_bu,
"
"                 mkgs_sponsor_id,
"
"                 mkgs_sponsor_desc1,
"
"                 mkgs_cre_by,
"
"                 mkgs_cre_date)
"
"                          VALUES(p_bu,
"
"                                 v_type_id,
"
"                                 cr_st(indx).sm_sponsor_desc1,
"
"                                 p_user,
"
"                                 SYSDATE
"
"                                 );
"
"   END LOOP;
"
"   END;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      Commit;
"
"
"
"   END proc_ins_spons;
"
"
"
"/*******************************************************************Target Audience CFG0150*******************************************************************/
"
"
"
" PROCEDURE  proc_ins_target_audience(p_bu       VARCHAR2,
"
"                                    p_fname    VARCHAR2,
"
"                                    p_sep      VARCHAR2,
"
"                                    p_user     VARCHAR2)
"
" AS
"
"
"
" v_sql     VARCHAR2(4000);
"
" v_fpath   VARCHAR2(200);
"
" v_type    VARCHAR2(10);
"
" v_type_id VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_TAR_AUD_DESC1 VARCHAR2(50));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"   BEGIN
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
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"        v_sql := 'CREATE TABLE scm_migration(SM_TAR_AUD_DESC1    VARCHAR2(50))
"
"                         ORGANIZATION EXTERNAL
"
"                         (TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep|| '''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                         (SM_TAR_AUD_DESC1   CHAR(255)
"
"                          ))
"
"                         LOCATION ('''||p_fname|| ''')
"
"                         )REJECT LIMIT UNLIMITED';
"
"
"
"EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(mkgta_tar_aud_id)
"
"        INTO v_type
"
"        FROM mkg_target_audience
"
"       WHERE mkgta_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"       INSERT INTO mkg_target_audience(mkgta_bu,
"
"                        mkgta_tar_aud_id,
"
"                        mkgta_tar_aud_desc1,
"
"                        mkgta_cre_by,
"
"                        mkgta_cre_date)
"
"                  VALUES(p_bu,
"
"                     v_type_id,
"
"                     cr_st(indx).sm_tar_aud_desc1,
"
"                     p_user,
"
"                     SYSDATE
"
"                     );
"
"   END LOOP;
"
"   END;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      Commit;
"
"
"
"   END proc_ins_target_audience;
"
"
"
"/*******************************************************************Lead Stages CFG0150*******************************************************************/
"
"PROCEDURE proc_ins_lead_cls_reasn (p_bu       VARCHAR2,
"
"                      p_fname    VARCHAR2,
"
"                      p_sep      VARCHAR2,
"
"                      p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_LDR_DESC1 VARCHAR2(30));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_LDR_DESC1 VARCHAR2(30))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_LDR_DESC1  CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(ldr_reason_id)
"
"        INTO v_type
"
"        FROM lead_disq_reason
"
"       WHERE ldr_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"        INSERT INTO lead_disq_reason(ldr_bu,
"
"                    ldr_reason_id,
"
"                    ldr_desc1,
"
"                    ldr_cre_by,
"
"                    ldr_cre_date
"
"                    )
"
"                    VALUES (p_bu,
"
"                        v_type_id,
"
"                        cr_st(indx).sm_ldr_desc1,
"
"                        p_user,
"
"                        SYSDATE
"
"                        );
"
"   END LOOP;
"
"   END;
"
"
"
"    proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_lead_cls_reasn;
"
"
"
"/*******************************************************************Lead Close Reason  CFG0150*******************************************************************/
"
"
"
"PROCEDURE proc_ins_crm_group (p_bu       VARCHAR2,
"
"                      p_fname    VARCHAR2,
"
"                      p_sep      VARCHAR2,
"
"                      p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_LDR_DESC1 VARCHAR2(30));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_LDR_DESC1 VARCHAR2(30))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_LDR_DESC1  CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"   SELECT MAX(fag_group_id)
"
"   INTO v_type
"
"   FROM feas_attr_group
"
"   WHERE fag_bu = p_bu;
"
"    v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"        INSERT INTO feas_attr_group(fag_bu,
"
"                    fag_group_id,
"
"                    fag_name,
"
"                    fag_cre_by,
"
"                    fag_cre_date
"
"                    )
"
"                    VALUES (p_bu,
"
"                        v_type_id,
"
"                        cr_st(indx).sm_ldr_desc1,
"
"                        p_user,
"
"                        SYSDATE
"
"                        );
"
"   END LOOP;
"
"   END;
"
"
"
"    proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_crm_group;
"
"
"
" PROCEDURE  proc_ins_lead_stages(p_bu       VARCHAR2,
"
"                                p_fname    VARCHAR2,
"
"                                p_sep      VARCHAR2,
"
"                                p_user     VARCHAR2)
"
" AS
"
"
"
" v_sql     VARCHAR2(4000);
"
" v_fpath   VARCHAR2(200);
"
" v_type    VARCHAR2(10);
"
" v_type_id VARCHAR2(10);
"
" v_seq_no  NUMBER(5);
"
"
"
"TYPE typ_ins IS RECORD (SM_LDS_DESC1 VARCHAR2(30),
"
"                        SM_EXT_DESC  VARCHAR2(200),
"
"                        SM_LDS_SEQ   NUMBER(5),
"
"                        SM_LDS_DAYS  NUMBER(4));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"   BEGIN
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
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"        v_sql := 'CREATE TABLE scm_migration(SM_LDS_DESC1 VARCHAR2(30),
"
"                         SM_EXT_DESC  VARCHAR2(200),
"
"                         SM_LDS_SEQ   NUMBER(5),
"
"                         SM_LDS_DAYS  NUMBER(4))
"
"                         ORGANIZATION EXTERNAL
"
"                         (TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep|| '''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                         (SM_LDS_DESC1 CHAR(255),
"
"                          SM_EXT_DESC  CHAR(255),
"
"                          SM_LDS_SEQ   CHAR(255),
"
"                          SM_LDS_DAYS  CHAR(255)
"
"                          ))
"
"                         LOCATION ('''||p_fname|| ''')
"
"                         )REJECT LIMIT UNLIMITED';
"
"
"
"EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(lds_stage_id)
"
"        INTO v_type
"
"        FROM lead_stages
"
"       WHERE lds_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"       SELECT NVL(MAX(lds_seq),0)+1
"
"         INTO v_seq_no
"
"         FROM lead_stages
"
"     WHERE lds_bu = p_bu;
"
"
"
"       INSERT INTO lead_stages(lds_bu,
"
"                lds_stage_id,
"
"                lds_desc1,
"
"                lds_ext_desc,
"
"                lds_seq,
"
"                lds_days,
"
"                lds_cre_by,
"
"                lds_cre_date)
"
"                 VALUES(p_bu,
"
"                v_type_id,
"
"                cr_st(indx).sm_lds_desc1,
"
"                cr_st(indx).sm_ext_desc,
"
"                v_seq_no,
"
"                cr_st(indx).sm_lds_days,
"
"                p_user,
"
"                SYSDATE
"
"                );
"
"   END LOOP;
"
"   END;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      Commit;
"
"
"
"   END proc_ins_lead_stages;
"
"
"
"/*******************************************************************Enquiry Close Reason CFG0150*******************************************************************/
"
"PROCEDURE proc_ins_enq_cls_reasn (p_bu       VARCHAR2,
"
"                      p_fname    VARCHAR2,
"
"                      p_sep      VARCHAR2,
"
"                      p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_OCR_DESC1 VARCHAR2(30));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_OCR_DESC1 VARCHAR2(30))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_OCR_DESC1  CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(ocr_reason_id)
"
"        INTO v_type
"
"        FROM opport_close_reason
"
"       WHERE ocr_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"        INSERT INTO opport_close_reason(ocr_bu,
"
"                    ocr_reason_id,
"
"                    ocr_desc1,
"
"                    ocr_cre_by,
"
"                    ocr_cre_date
"
"                    )
"
"                    VALUES (p_bu,
"
"                        v_type_id,
"
"                        cr_st(indx).sm_ocr_desc1,
"
"                        p_user,
"
"                        SYSDATE
"
"                        );
"
"   END LOOP;
"
"   END;
"
"
"
"    proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_enq_cls_reasn;
"
"/*********************************************************Enquiry Stage CFG0150********************************************************/
"
"PROCEDURE proc_ins_enq_stg (p_bu       VARCHAR2,
"
"                      p_fname    VARCHAR2,
"
"                      p_sep      VARCHAR2,
"
"                      p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_OPSS_STAGE_DESC1   VARCHAR2(30),
"
"                        SM_OPSS_COMP_PCT      NUMBER(3),
"
"                        SM_OPSS_SEQ_NO        NUMBER(5),
"
"                        SM_OPSS_DAYS          NUMBER(4),
"
"                        SM_OPSS_STAGE_TYPE    VARCHAR2(3));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"v_seq        NUMBER := 0;
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_OPSS_STAGE_DESC1   VARCHAR2(30),
"
"                                          SM_OPSS_COMP_PCT      NUMBER(3),
"
"                                          SM_OPSS_SEQ_NO        NUMBER(5),
"
"                                          SM_OPSS_DAYS          NUMBER(4),
"
"                                          SM_OPSS_STAGE_TYPE    VARCHAR2(3))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_OPSS_STAGE_DESC1   CHAR(255),
"
"                                            SM_OPSS_COMP_PCT      CHAR(255),
"
"                                            SM_OPSS_SEQ_NO        CHAR(255),
"
"                                            SM_OPSS_DAYS          CHAR(255),
"
"                                            SM_OPSS_STAGE_TYPE    CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"
"
" -- RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(opss_stage_id)
"
"        INTO v_type
"
"        FROM opport_sales_stage
"
"       WHERE opss_bu = p_bu;
"
"
"
"       v_type_id := func_get_next_id(v_type);
"
"
"
"   END;
"
"
"
"   BEGIN
"
"      SELECT MAX(NVL(opss_seq_no,0)) + 1
"
"        INTO v_seq
"
"        FROM opport_sales_stage
"
"       WHERE opss_bu = p_bu;
"
"
"
"   END;
"
"
"
"
"
"        INSERT INTO opport_sales_stage(opss_bu,
"
"                    opss_stage_id,
"
"                    opss_stage_desc1,
"
"                    opss_comp_pct,
"
"                    opss_seq_no,
"
"                    opss_days,
"
"                    opss_stage_type,
"
"                    opss_cre_by,
"
"                    opss_cre_date,
"
"            opss_dflt_flag
"
"                    )
"
"                    VALUES (p_bu,
"
"                        v_type_id,
"
"                        cr_st(indx).SM_opss_stage_desc1,
"
"                        cr_st(indx).SM_opss_comp_pct,
"
"                        NVL(cr_st(indx).SM_opss_seq_no,v_seq),
"
"                        cr_st(indx).SM_opss_days,
"
"                        NVL(cr_st(indx).SM_opss_stage_type,'QI'),
"
"                        p_user,
"
"                        SYSDATE,
"
"            'N'
"
"                        );
"
"   END LOOP;
"
"   END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_enq_stg;
"
"/********************************************************************Sales Area CFG0210***************************************/
"
"PROCEDURE proc_ins_sales_area_mig (p_bu       VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep      VARCHAR2,
"
"                       p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_area      VARCHAR2(5);
"
"v_area_id   VARCHAR2(5);
"
"v_sa_emp_id VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_SA_DESC1 VARCHAR2(30),
"
"                        SM_SA_EMP_ID VARCHAR2(10));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_SA_DESC1 VARCHAR2(30),
"
"                                          SM_SA_EMP_ID VARCHAR2(10))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_SA_DESC1  CHAR(255),
"
"                        SM_SA_EMP_ID  CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"	BEGIN
"
"		SELECT emp_emp_id
"
"		  INTO v_sa_emp_id
"
"		  FROM employees
"
"		 WHERE emp_bu = p_bu
"
"		   AND emp_emp_id = cr_st(indx).sm_sa_emp_id;
"
"	EXCEPTION WHEN NO_DATA_FOUND THEN
"
"	  RAISE_APPLICATION_ERROR(-20099,'SOM'||'/'||cr_st(indx).sm_sa_emp_id);
"
"	END;
"
"
"
"
"
"
"
"     SELECT MAX(sa_area)
"
"        INTO v_area
"
"        FROM sales_areas
"
"       WHERE sa_bu = p_bu;
"
"       v_area_id := func_get_next_id(v_area);
"
"
"
"	 proc_chk_and_space(cr_st(indx).sm_sa_desc1);
"
"
"
"
"
"
"
"    INSERT INTO sales_areas(sa_bu,
"
"                sa_area,
"
"                sa_area_desc1,
"
"                sa_area_desc2,
"
"                sa_resp_emp_id,
"
"                sa_cre_by,
"
"                sa_cre_date
"
"                   )
"
"            VALUES (p_bu,
"
"                    v_area_id,
"
"                cr_st(indx).sm_sa_desc1,
"
"                NULL,
"
"                v_sa_emp_id,
"
"                p_user,
"
"                SYSDATE
"
"                );
"
"   END LOOP;
"
"   END;
"
"
"
"    proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_sales_area_mig;
"
"
"
"/********************************************************************Sales Territories CFG0210***************************************/
"
"PROCEDURE proc_ins_sales_terr_mig (p_bu       VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep      VARCHAR2,
"
"                       p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"v_st_emp_id VARCHAR2(10);
"
"v_sa_area   VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_ST_DESC1    VARCHAR2(30),
"
"                        SM_ST_EMP_ID   VARCHAR2(30),
"
"                        SM_AREA        VARCHAR2(30));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_ST_DESC1   VARCHAR2(30),
"
"                                          SM_ST_EMP_ID  VARCHAR2(10),
"
"                                          SM_AREA        VARCHAR2(30)
"
"                      )
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_ST_DESC1     CHAR(255),
"
"                                            SM_ST_EMP_ID  CHAR(255),
"
"                                            SM_AREA         CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"  IF cr_st(indx).sm_st_desc1 IS NULL THEN
"
"      RAISE_APPLICATION_ERROR(-20981 ,'SOM');
"
"  ELSIF cr_st(indx).sm_st_emp_id IS NULL THEN
"
"      RAISE_APPLICATION_ERROR(-20024,'SOM');
"
"  ELSIF cr_st(indx).sm_area IS NULL THEN
"
"      RAISE_APPLICATION_ERROR(-20023,'SOM');
"
"  END IF;
"
"
"
"BEGIN
"
"	SELECT emp_emp_id
"
"	  INTO v_st_emp_id
"
"	  FROM employees
"
"	 WHERE emp_bu = p_bu
"
"	   AND emp_emp_id = cr_st(indx).sm_st_emp_id;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"  RAISE_APPLICATION_ERROR(-20099,'SOM'||'/'||cr_st(indx).sm_st_emp_id);
"
"END;
"
"
"
"BEGIN
"
"	SELECT sa_area
"
"	  INTO v_sa_area
"
"	  FROM sales_areas
"
"	 WHERE sa_bu = p_bu
"
"	   AND sa_area_desc1 = cr_st(indx).sm_area;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"  RAISE_APPLICATION_ERROR(-20049,'SOM'||'/'||cr_st(indx).sm_area);
"
"END;
"
"
"
"     SELECT MAX(sat_terr_id)
"
"        INTO v_type
"
"        FROM sales_area_terr
"
"       WHERE sat_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"
"
"	   proc_chk_and_space(cr_st(indx).sm_st_desc1);
"
"
"
"    INSERT INTO sales_area_terr(sat_bu,
"
"                    sat_terr_id,
"
"                    sat_terr_desc1,
"
"                    sat_terr_desc2,
"
"                    sat_sarea_id,
"
"                    sat_resp_emp_id,
"
"                    sat_cre_by,
"
"                    sat_cre_date
"
"                        )
"
"                VALUES (p_bu,
"
"                        v_type_id,
"
"                        cr_st(indx).sm_st_desc1,
"
"                        NULL,
"
"                        v_sa_area,
"
"                        cr_st(indx).sm_st_emp_id,
"
"                        p_user,
"
"                        SYSDATE
"
"                        );
"
"   END LOOP;
"
"   END;
"
"
"
"    proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_sales_terr_mig;
"
"
"
"/********************************************************************Sales Sub Territories CFG0210***************************************/
"
"
"
"PROCEDURE proc_ins_sales_sub_terr_mig (p_bu       VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep      VARCHAR2,
"
"                       p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"v_terr_id   VARCHAR2(10);
"
"v_sp        VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_ST_DESC    VARCHAR2(30),
"
"                        SM_TERR_DESC  VARCHAR2(30),
"
"                        SM_EMP_ID     VARCHAR2(10),
"
"						SM_EMP_NAME   VARCHAR2(100),
"
"                        SM_SP_DESC    VARCHAR2(30)
"
"               );
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"BEGIN
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"     proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_ST_DESC   VARCHAR2(30),
"
"                                          SM_TERR_DESC VARCHAR2(30),
"
"                                          SM_EMP_ID    VARCHAR2(10),
"
"										  SM_EMP_NAME  VARCHAR2(100),
"
"										  SM_SP_DESC   VARCHAR2(30)
"
"                                          )
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_ST_DESC    CHAR(255),
"
"                        SM_TERR_DESC  CHAR(255),
"
"                        SM_EMP_ID     CHAR(255),
"
"						SM_EMP_NAME   CHAR(255),
"
"                        SM_SP_DESC    CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    SELECT MAX(sst_sub_terr_id)
"
"      INTO v_type
"
"      FROM sales_sub_terr
"
"     WHERE sst_bu = p_bu;
"
"
"
"    v_type_id := func_get_next_id(v_type);
"
"
"
"	BEGIN
"
"    SELECT sat_terr_id
"
"      INTO v_terr_id
"
"      FROM sales_area_terr
"
"     WHERE sat_bu = p_bu
"
"       AND sat_terr_desc1 = cr_st(indx).sm_terr_desc;
"
"	EXCEPTION WHEN OTHERS THEN
"
"	  RAISE_APPLICATION_ERROR(-20999,'Territory not found.');
"
"	END;
"
"
"
"	IF cr_st(indx).sm_sp_desc IS NOT NULL THEN
"
"		BEGIN
"
"		SELECT sp_person
"
"		  INTO v_sp
"
"			  FROM sales_persons
"
"			 WHERE sp_bu = p_bu
"
"			   AND sp_person_name1 = cr_st(indx).sm_sp_desc;
"
"		EXCEPTION WHEN OTHERS THEN
"
"		  RAISE_APPLICATION_ERROR(-20999,'Sales Person not found.');
"
"		END;
"
"    END IF;
"
"
"
"		proc_chk_and_space(cr_st(indx).sm_st_desc);
"
"
"
"    INSERT INTO sales_sub_terr(sst_bu,
"
"                               sst_sub_terr_id,
"
"                   sst_desc1,
"
"                   sst_terr_id,
"
"                   sst_resp_emp_id,
"
"                   sst_sp_id,
"
"                   sst_cre_by,
"
"                   sst_cre_date
"
"                   )
"
"                 VALUES(p_bu,
"
"                        v_type_id,
"
"                    cr_st(indx).sm_st_desc,
"
"                    v_terr_id,
"
"                    cr_st(indx).sm_emp_id,
"
"                    v_sp,
"
"                    p_user,
"
"                    SYSDATE
"
"                   );
"
"  END LOOP;
"
"END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"END proc_ins_sales_sub_terr_mig;
"
"
"
"/********************************************************************Sales Person CFG0210***************************************/
"
"
"
"PROCEDURE proc_ins_sales_person_mig(p_bu       VARCHAR2,
"
"                    p_fname    VARCHAR2,
"
"                    p_sep      VARCHAR2,
"
"                    p_user     VARCHAR2)
"
"AS
"
"v_sql           VARCHAR2(4000);
"
"v_fpath         VARCHAR2(200);
"
"v_type          VARCHAR2(10);
"
"v_type_id       VARCHAR2(10);
"
"v_sub_terr_id    VARCHAR2(10);
"
"v_emp_id    VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_SP_DESC    VARCHAR2(50),
"
"                        SM_SP_TYPE    VARCHAR2(30),
"
"                        SM_EMP_ID    VARCHAR2(30),
"
"            SM_SUB_TERR   VARCHAR2(30),
"
"            SM_CATEGORY   VARCHAR2(30)
"
"               );
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"BEGIN
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"     proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_SP_DESC   VARCHAR2(50),
"
"                                          SM_SP_TYPE   VARCHAR2(30),
"
"                                          SM_EMP_ID   VARCHAR2(30),
"
"                      SM_SUB_TERR  VARCHAR2(30),
"
"                      SM_CATEGORY   VARCHAR2(30)
"
"                                          )
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_SP_DESC    CHAR(255),
"
"                                             SM_SP_TYPE   CHAR(255),
"
"                                             SM_EMP_ID  CHAR(255),
"
"                         SM_SUB_TERR  CHAR(255),
"
"                         SM_CATEGORY  CHAR(255)
"
"                                           ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"
"
"SELECT MAX(sp_person)
"
"  INTO v_type
"
"  FROM sales_persons
"
" WHERE sp_bu = p_bu;
"
"
"
"BEGIN
"
"  SELECT sst_sub_terr_id
"
"    INTO v_sub_terr_id
"
"	FROM sales_sub_terr
"
"   WHERE sst_bu = p_bu
"
"	 AND sst_desc1 = cr_st(indx).sm_sub_terr;
"
"    --func_find_sub_terr_desc(p_bu,v_sub_terr_id,1);
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      raise_application_error (-20586, 'SOM'||v_sub_terr_id);
"
"END;
"
"/*
"
"BEGIN
"
"    SELECT emp_emp_id
"
"      INTO v_emp_id
"
"      FROM employees
"
"     WHERE emp_bu = p_bu
"
"       AND emp_first_name1 = cr_st(indx).sm_emp_name;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"  RAISE_APPLICATION_ERROR(-20821,'HRM'||'/'||cr_st(indx).sm_emp_name);
"
"END;  */
"
"
"
"
"
"
"
"BEGIN
"
"    SELECT emp_emp_id
"
"      INTO v_emp_id
"
"      FROM employees
"
"     WHERE emp_bu = p_bu
"
"       AND emp_emp_id = cr_st(indx).sm_emp_id;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"  RAISE_APPLICATION_ERROR(-20821,'HRM'||'/'||v_emp_id);
"
"END;
"
"
"
"    v_type_id := func_get_next_id(v_type);
"
"
"
"	proc_chk_and_space(cr_st(indx).sm_sp_desc);
"
"
"
"    INSERT INTO sales_persons(sp_bu,
"
"                              sp_person,
"
"                  sp_person_name1,
"
"                  sp_type,
"
"                  sp_emp_id,
"
"                  sp_sub_terr_id,
"
"                  sp_category_id,
"
"                  sp_cre_by,
"
"                  sp_cre_date,
"
"				  sp_active_flag,
"
"				  sp_cust_dflt_flag
"
"                 )
"
"               VALUES(p_bu,
"
"                      v_type_id,
"
"                  cr_st(indx).sm_sp_desc,
"
"                  DECODE(UPPER(cr_st(indx).sm_sp_type),'AGENT (SUPPLIER)','A',
"
"                                                       'DEALER (SUPPLIER)','D',
"
"                                       'EMPLOYEE','E',
"
"                                       'AGENT (CUSTOMER)','C',
"
"                                       'DEALER (CUSTOMER)','S'),
"
"                  v_emp_id,
"
"                  v_sub_terr_id,
"
"                                  DECODE(UPPER(cr_st(indx).sm_category),'MANAGER','M',
"
"                                                        'SALES PERSON','S',
"
"                                    'INTERNAL SALES REPRESENTATIVE','ISR',
"
"                                    'DELIVERY SALES REPRESENTATIVE','DSR'),
"
"                  p_user,
"
"                  SYSDATE,
"
"				  'Y',
"
"				  'N'
"
"                  );
"
"  END LOOP;
"
"END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"END proc_ins_sales_person_mig;
"
"
"
"/********************************************************************GATE NO. CFG0183***************************************/
"
"
"
"PROCEDURE proc_ins_gate_enty_mig (     p_bu       VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep      VARCHAR2,
"
"                       p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_DESC    VARCHAR2(50));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"v_cnt	     NUMBER;
"
"BEGIN
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"     proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(
"
"                      SM_DESC    VARCHAR2(50))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_DESC    CHAR(255)
"
"
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"        SELECT MAX(gdl_gate_no)
"
"          INTO v_type
"
"          FROM gate_dtls
"
"         WHERE gdl_bu = p_bu;
"
"    v_type_id := func_get_next_id(v_type);
"
"
"
"    IF cr_st(indx).sm_desc IS NOT NULL THEN
"
"      v_cnt :=0;
"
"      SELECT COUNT(*) INTO v_cnt
"
"        FROM gate_dtls
"
"       WHERE gdl_bu = p_bu
"
"         AND UPPER(gdl_desc1) =UPPER(cr_st(indx).sm_desc);
"
"
"
"	IF v_cnt >0 THEN
"
"	  Raise_Application_Error(-20999,'Cannot insert duplicate entry.');
"
"	END IF;
"
"    END IF;
"
"
"
"    INSERT INTO GATE_DTLS(    gdl_bu,
"
"                gdl_gate_no,
"
"                gdl_desc1,
"
"                gdl_cre_by,
"
"                gdl_cre_date
"
"                )
"
"             VALUES(p_bu,
"
"                    v_type_id,
"
"                    UPPER(cr_st(indx).sm_desc),
"
"                    p_user,
"
"                    SYSDATE
"
"                    );
"
"  END LOOP;
"
"END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"END proc_ins_gate_enty_mig;
"
"/********************************************************************GATE KEEPER. CFG0183***************************************/
"
"
"
"PROCEDURE proc_ins_gate_keeper_mig (   p_bu       VARCHAR2,
"
"                                       p_fname    VARCHAR2,
"
"                                       p_sep      VARCHAR2,
"
"                                       p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"
"
"
"
"TYPE typ_ins IS RECORD (sk_name        VARCHAR2(50),
"
"                        sk_emp_id      VARCHAR2(10),
"
"                    sk_emp_name    VARCHAR2(50));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"BEGIN
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"     proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(
"
"                      sk_name        VARCHAR2(50),
"
"                      sk_emp_id      VARCHAR2(10),
"
"                      sk_emp_name    VARCHAR2(50))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (sk_name        CHAR(255),
"
"                        sk_emp_id      CHAR(255),
"
"                        sk_emp_name    CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"BEGIN
"
"
"
"
"
"
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"    SELECT MAX(gk_id)
"
"      INTO v_type
"
"      FROM gate_keeper
"
"     WHERE gk_bu = p_bu;
"
"
"
"    v_type_id := func_get_next_id(v_type);
"
"
"
"   DECLARE
"
"	v_count		NUMBER(5);
"
"   BEGIN
"
"   SELECT COUNT(*)
"
"     INTO v_count
"
"     FROM GATE_KEEPER
"
"    WHERE gk_bu = p_bu
"
"      AND gk_emp_id = cr_st(indx).sk_emp_id;
"
"
"
"   --  Raise_Application_Error(-20999,p_bu||'~'||v_type_id||'~'||cr_st(indx).sk_emp_id||'~'||v_count);
"
"
"
"     IF v_count > 0 THEN
"
"	Raise_Application_Error(-20999,'Gate Keeper already exist.');
"
"     END IF;
"
"
"
"   END;
"
"   IF cr_st(indx).sk_emp_id IS NULL THEN
"
"     Raise_Application_Error(-20999,'Employee ID must be entered.');
"
"   END IF;
"
"
"
"   IF cr_st(indx).sk_emp_name IS NULL THEN
"
"     Raise_Application_Error(-20999,'Employee Name must be entered.');
"
"   END IF;
"
"
"
"    INSERT INTO GATE_KEEPER(    gk_bu,
"
"                gk_id,
"
"                gk_name,
"
"                gk_emp_id,
"
"                gk_emp_name,
"
"                gk_cre_by,
"
"                gk_cre_emp_id,
"
"                gk_cre_ip_addr,
"
"                gk_cre_os_user,
"
"                gk_cre_date
"
"                )
"
"             VALUES(p_bu,
"
"                v_type_id,
"
"                    cr_st(indx).sk_name,
"
"                cr_st(indx).sk_emp_id,
"
"                cr_st(indx).sk_emp_name,
"
"                p_user,
"
"                func_find_emp_id(p_bu,p_user),
"
"                Audit_Info.Get_Ip_Address,
"
"                Audit_Info.Get_Os_User,
"
"                sysdate
"
"                    );
"
"  END LOOP;
"
"END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"END proc_ins_gate_keeper_mig;
"
"
"
"  /*******************************************************************Major Class CFG0190*******************************************************************/
"
"
"
"PROCEDURE  proc_ins_major_class(p_bu       VARCHAR2,
"
"                                p_fname    VARCHAR2,
"
"                                p_sep      VARCHAR2,
"
"                                p_user     VARCHAR2,
"
"				p_res      OUT    VARCHAR2
"
"				 )
"
"AS
"
"
"
"v_sql     VARCHAR2(4000);
"
"v_fpath   VARCHAR2(200);
"
"v_type    VARCHAR2(10);
"
"v_type_id VARCHAR2(10);
"
"v_res 	VARCHAR2(1):='Y';
"
"v_cnt	NUMBER;
"
"
"
"TYPE typ_ins IS RECORD (V_CLS_DESC VARCHAR2(50));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"   BEGIN
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
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"        v_sql := 'CREATE TABLE scm_migration(V_CLS_DESC    VARCHAR2(50))
"
"                         ORGANIZATION EXTERNAL
"
"                         (TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep|| ''' OPTIONALLY ENCLOSED BY ''""''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                         (V_CLS_DESC   CHAR(255)
"
"                          ))
"
"                         LOCATION ('''||p_fname|| ''')
"
"                         )REJECT LIMIT UNLIMITED';
"
"
"
"EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
" p_res := 'N';
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"  DELETE
"
"    FROM scm_mig_excep
"
"   WHERE sme_bu =p_bu;
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"  IF cr_st(indx).v_cls_desc IS NULL THEN
"
"    proc_ins_scm_mig_exp(p_bu,
"
"					'CFG0190',
"
"					'MAJOR CLASS',
"
"					cr_st(indx).v_cls_desc,
"
"					'Major class must be entered.',
"
"					p_user);
"
"	     v_res :='N';
"
"  END IF;
"
"    SELECT COUNT(*) INTO v_cnt
"
"      FROM mjr_classes
"
"	WHERE mc_bu = p_bu
"
"	  AND mc_mjr_cls_desc = cr_st(indx).v_cls_desc;
"
"	IF v_cnt >0 THEN
"
"	     proc_ins_scm_mig_exp(p_bu,
"
"					      'CFG0190',
"
"					      'MAJOR CLASS',
"
"					      cr_st(indx).v_cls_desc,
"
"					      'Major class already found.',
"
"					      p_user);
"
"	     v_res :='N';
"
"	END IF;
"
"  END LOOP;
"
"  commit;
"
"
"
"   IF cr_st.COUNT = 0 THEN
"
"      Raise_Application_Error(-20999,'Major Class must be enter');
"
"   END IF;
"
"
"
"  IF v_res ='N' THEN
"
"    raise_application_error(-20478,'ICM');
"
"  END IF;
"
"  IF v_res ='Y' THEN
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(MC_MJR_CLS_ID)
"
"        INTO v_type
"
"        FROM mjr_classes
"
"       WHERE MC_BU = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"
"
"       INSERT INTO mjr_classes( mc_bu,
"
"                                mc_mjr_cls_id,
"
"                                mc_mjr_cls_desc,
"
"                                mc_cre_by,
"
"                                mc_cre_date)
"
"                          VALUES(p_bu,
"
"                                 v_type_id,
"
"                                 cr_st(indx).v_cls_desc,
"
"                                 p_user,
"
"                                 SYSDATE
"
"                                 );
"
"				      p_res := 'Y';
"
"   END LOOP;
"
"    IF SQL%NOTFOUND THEN
"
"      raise_application_error(-20660,'APM');
"
"      END IF;
"
"   END IF;
"
"   END;
"
"
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      Commit;
"
"
"
"   END proc_ins_major_class;
"
"
"
"/********************************************************************Dept Grp Asso. CFG0150***************************************/
"
"
"
"PROCEDURE proc_ins_dept_grp_asso_mig ( p_bu       VARCHAR2,
"
"                                       p_fname    VARCHAR2,
"
"                                       p_sep      VARCHAR2,
"
"                                       p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"v_group_id  VARCHAR2(10);
"
"v_dept_id   VARCHAR2(10);
"
"TYPE typ_ins IS RECORD (ga_dept_desc        VARCHAR2(50),
"
"                        ga_grp_desc      VARCHAR2(50));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"BEGIN
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"     proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(
"
"                      ga_dept_desc        VARCHAR2(50),
"
"                      ga_grp_desc      VARCHAR2(10))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (ga_dept_desc        CHAR(255),
"
"                        ga_grp_desc      CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"    SELECT fag_group_id
"
"      INTO v_group_id
"
"          FROM feas_attr_group
"
"         WHERE fag_bu = p_bu
"
"           AND fag_name = cr_st(indx).ga_grp_desc;
"
"
"
"    SELECT dept_id
"
"      INTO v_dept_id
"
"      FROM departments
"
"     WHERE dept_bu= p_bu
"
"       AND dept_name1= cr_st(indx).ga_dept_desc;
"
"
"
"
"
"
"
"    INSERT INTO DEPT_FEAS_ATTR_GROUP(dfag_bu,
"
"                                     dfag_dept_id,
"
"                                     dfag_attr_group,
"
"                                     dfag_cre_by,
"
"                                     dfag_cre_date
"
"                                    )
"
"                            VALUES (p_bu,
"
"                                    v_dept_id,
"
"                                    v_group_id,
"
"                                    p_user,
"
"                                    sysdate
"
"                                    );
"
"  END LOOP;
"
"END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"END proc_ins_dept_grp_asso_mig;
"
"
"
"
"
"/********************************************************************ENQ PARA . CFG0150***************************************/
"
"
"
"PROCEDURE proc_ins_enq_para (p_bu       VARCHAR2,
"
"                      p_fname    VARCHAR2,
"
"                      p_sep      VARCHAR2,
"
"                      p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"v_group_id  VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_QATTR_ATTR_NAME1    VARCHAR2(500),
"
"                        SM_GRP_DESC            VARCHAR2(30));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"v_seq_no     NUMBER;
"
"
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_QATTR_ATTR_NAME1    VARCHAR2(500),
"
"                                          SM_GRP_DESC            VARCHAR2(30))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_QATTR_ATTR_NAME1      CHAR(255),
"
"                                            SM_GRP_DESC              CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(qattr_attr_id)
"
"        INTO v_type
"
"            FROM quotation_attr
"
"           WHERE qattr_bu = p_bu;
"
"      v_type_id := func_get_next_id(v_type);
"
"
"
"      SELECT fag_group_id
"
"        INTO v_group_id
"
"        FROM feas_attr_group
"
"       WHERE fag_bu = p_bu
"
"         AND fag_name = cr_st(indx).sm_grp_desc;
"
"
"
"   END;
"
"
"
"SELECT NVL(MAX(qattr_print_seq_no),0)+1
"
"  INTO v_seq_no
"
"  FROM quotation_attr
"
" WHERE qattr_bu = p_bu;
"
"
"
"        INSERT INTO quotation_attr(qattr_bu,
"
"                    qattr_attr_id,
"
"                    qattr_print_seq_no,
"
"                    qattr_attr_name1,
"
"                    qattr_group_id,
"
"                    qattr_cre_by,
"
"                    qattr_cre_date,
"
"            qattr_pom,
"
"            qattr_som,
"
"            qattr_quote_feas_flag
"
"                    )
"
"                    VALUES (p_bu,
"
"                            v_type_id,
"
"                            v_seq_no,
"
"                cr_st(indx).sm_qattr_attr_name1,
"
"                v_group_id,
"
"                            p_user,
"
"                            SYSDATE,
"
"                'N',
"
"                'Y',
"
"                'Y'
"
"                            );
"
"   END LOOP;
"
"   END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_enq_para;
"
"
"
"/*******************************************************************Classes CFG0190*******************************************************************/
"
"
"
"PROCEDURE proc_ins_class  (p_bu         VARCHAR2,
"
"                           p_fname      VARCHAR2,
"
"                           p_sep        VARCHAR2,
"
"                           p_user       VARCHAR2
"
"                           )
"
"AS
"
"v_sql         			VARCHAR2(4000);
"
"v_fpath       			VARCHAR2(200);
"
"v_type        			VARCHAR2(10);
"
"v_type_id     			VARCHAR2(10);
"
"v_class_id    			VARCHAR2(50);
"
"v_mjrclass_id 			VARCHAR2(50);
"
"v_cost_sub_element 		VARCHAR2(50);
"
"v_res				VARCHAR2(1):='Y';
"
"v_mjr_cls				NUMBER;
"
"v_acc				NUMBER;
"
"v_res1				VARCHAR2(1);
"
"v_class_type			VARCHAR2(200);
"
"
"
"TYPE typ_ins IS RECORD (v_class_desc         	VARCHAR2(150),
"
"                        v_item_no          		VARCHAR2(20),
"
"				    v_major_class_desc     	VARCHAR2(150),
"
"				    v_type             		VARCHAR2(200),
"
"				    v_account          		NUMBER(10)
"
"				    );
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"
"
"  BEGIN
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(v_class_desc     VARCHAR2(150),
"
"								  v_item_no       VARCHAR2(20),
"
"								  v_major_class_desc VARCHAR2(150),
"
"								  v_type VARCHAR2(200),
"
"								  v_account NUMBER(10))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''  OPTIONALLY ENCLOSED BY ''""''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (v_class_desc        CHAR(255),
"
"								   v_item_no              CHAR(255),
"
"								   v_major_class_desc      CHAR(255),
"
"								   v_type             CHAR(255),
"
"								   v_account          CHAR(255)
"
"                                            ))
"
"                                            LOCATION ('''||p_fname|| ''')
"
"                                            )REJECT LIMIT UNLIMITED';
"
"
"
"EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"BEGIN
"
"   DELETE
"
"     FROM scm_mig_excep
"
"    WHERE sme_bu =p_bu;
"
"
"
"    OPEN c_st FOR 'SELECT *  FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"    EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"
"
"    SELECT MAX(class_id)
"
"      INTO v_type
"
"      FROM classes
"
"     WHERE class_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"
"
"   IF cr_st(indx).v_class_desc IS NULL THEN
"
"
"
"     proc_ins_scm_mig_exp(p_bu,
"
"					 'CFG0190',
"
"					 'CLASSES',
"
"					 NULL,
"
"					 'Class must be entered.',
"
"					 p_user);
"
"	v_res :='N';
"
"   END IF;
"
"
"
"
"
"
"
"   IF cr_st(indx).v_major_class_desc IS NULL THEN
"
"      proc_ins_scm_mig_exp(p_bu,
"
"					 'CFG0190',
"
"					 'CLASSES',
"
"					 NULL,
"
"					 'Major class must be entered.',
"
"					 p_user);
"
"	v_res :='N';
"
"    ELSE
"
"      SELECT COUNT(*)
"
"	   INTO v_mjr_cls
"
"	   FROM mjr_classes
"
"	  WHERE mc_bu = p_bu
"
"	    AND mc_active_flag = 'Y'
"
"	    AND mc_mjr_cls_desc = cr_st(indx).v_major_class_desc;
"
"     IF v_mjr_cls = 0 THEN
"
"	 proc_ins_scm_mig_exp(p_bu,
"
"					 'CFG0190',
"
"					 'CLASSES',
"
"					 cr_st(indx).v_major_class_desc,
"
"					 'Major class not found.',
"
"					 p_user);
"
"	  v_res :='N';
"
"	END IF;
"
"    END IF;
"
"
"
"    IF cr_st(indx).v_type IS NULL THEN
"
"      proc_ins_scm_mig_exp(p_bu,
"
"					 'CFG0190',
"
"					 'CLASSES',
"
"					 NULL,
"
"					 'Class Type must be entered.',
"
"					 p_user);
"
"	v_res :='N';
"
"    END IF;
"
"
"
"	BEGIN
"
"	SELECT COUNT(*)
"
"	  INTO v_acc
"
"	  FROM gl_accts
"
"         WHERE glac_bu = P_BU
"
"           AND glac_acct_type = 'E'
"
"	   AND glac_acct = cr_st(indx).v_account;
"
"        EXCEPTION WHEN OTHERS THEN
"
"              IF cr_st(indx).v_account IS NULL   THEN
"
"                  proc_ins_scm_mig_exp(p_bu,
"
"				       'CFG0190',
"
"				       'CLASSES',
"
"				       cr_st(indx).v_account,
"
"				       'Account not found.',
"
"				       p_user);
"
"	        v_res :='N';
"
"	      END IF;
"
"        END;
"
"
"
"       /*IF cr_st(indx).v_account IS NULL   THEN
"
"
"
"	 proc_ins_scm_mig_exp(p_bu,
"
"					 'CFG0190',
"
"					 'CLASSES',
"
"					 cr_st(indx).v_account,
"
"					 'Account not found.',
"
"					 p_user);
"
"	 v_res :='N';
"
"	END IF;*/
"
"	COMMIT;
"
"END LOOP;
"
"
"
"   IF cr_st.COUNT = 0 THEN
"
"      Raise_Application_Error(-20999,'Class must be enter');
"
"   END IF;
"
"  IF v_res ='N' THEN
"
"    RAISE_APPLICATION_ERROR(-20478,'ICM');
"
"  END IF;
"
"
"
"IF v_res ='Y' THEN
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    SELECT MAX(class_id)
"
"      INTO v_type
"
"      FROM classes
"
"     WHERE class_bu = p_bu;
"
"       v_type_id := func_get_next_id(v_type);
"
"
"
"
"
"    BEGIN
"
"    SELECT mc_mjr_cls_id
"
"      INTO v_mjrclass_id
"
"      FROM mjr_classes
"
"     WHERE mc_bu = p_bu
"
"       AND mc_mjr_cls_desc = cr_st(indx).v_major_class_desc;
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      RAISE_APPLICATION_ERROR(-20029,'ICM'||'/'||cr_st(indx).v_major_class_desc);
"
"    END;
"
"
"
"    BEGIN
"
"    SELECT  DECODE (UPPER(cr_st(indx).v_type),'RAW MATERIAL','RM',
"
"                                 'BOUGHT OUT','CO',
"
"                                 'CONSUMABLE','CN',
"
"                                 'PACKING MATERIAL','PM',
"
"                                 'SPARE PART','SP',
"
"                                 'FINISHED GOOD(MFG)','FG',
"
"                                 'FINISHED GOOD(TRADING)','TG',
"
"                                 'ASSEMBLY','AS',
"
"                                 'SEMI FINISHED GOOD','SF',
"
"                                 'FIXED ASSET','FA',
"
"                                 'TOOL','TO',
"
"                                 'TOOL-CONSUMABLES','TC',
"
"                                 'INSTRUMENT','IN',
"
"                                 'SCRAP','RP',
"
"                                 'SERVICE','SV',
"
"                                 'OTHERS','OT',
"
"                                 'EQUIPMENT','EQ',
"
"                                 'EQUIPMENT SERVICES','ES',
"
"                                 'BY PRODUCT','BP',
"
"                                 'CHARGES','CH',
"
"                                 'JOB WORK CHARGES','JW',
"
"                                 'FRIEGHT','FR',
"
"								 'IGST','IG'
"
"                                 )TYPE1 INTO v_class_type  FROM dual;
"
"
"
"   IF v_class_type IS NULL THEN
"
"      proc_ins_scm_mig_exp(p_bu,
"
"					 'CFG0190',
"
"					 'CLASSES',
"
"					 NULL,
"
"					 'Class type not found.'||'-'||cr_st(indx).v_type,
"
"					 p_user);
"
"	v_res :='N';
"
"
"
"    END IF;
"
"    END;
"
"
"
"
"
"  --RAISE_APPLICATION_ERROR (-20999,'HRM'||'/'||cr_st(indx).v_type);
"
"
"
"      INSERT INTO classes(class_bu ,
"
"              class_id,
"
"              class_desc1,
"
"              class_prod_code,
"
"              class_mjr_cls_id,
"
"              class_type,
"
"              class_pur_acct,
"
"              class_cre_by,
"
"              class_cre_date,
"
"	      class_active_flag
"
"                )
"
"              VALUES
"
"                  (p_bu,
"
"               v_type_id,
"
"               cr_st(indx).v_class_desc,
"
"               cr_st(indx).v_item_no,
"
"               v_mjrclass_id,
"
"	       v_class_type,
"
"              /* DECODE (UPPER(cr_st(indx).v_type),'RAW MATERIAL','RM',
"
"                                 'BOUGHT OUT','CO',
"
"                                 'CONSUMABLE','CN',
"
"                                 'PACKING MATERIAL','PM',
"
"                                 'SPARE PART','SP',
"
"                                 'Finished Good(MFG)','FG',
"
"                                 'FINISHED GOOD(TRADING)','TG',
"
"                                 'ASSEMBLY','AS',
"
"                                 'SEMI FINISHED GOOD','SF',
"
"                                 'FIXED ASSET','FA',
"
"                                 'TOOL','TO',
"
"                                 'TOOL-CONSUMABLES','TC',
"
"                                 'INSTRUMENT','IN',
"
"                                 'SCRAP','RP',
"
"                                 'SERVICE','SV',
"
"                                 'OTHERS','OT',
"
"                                 'EQUIPMENT','EQ',
"
"                                 'EQUIPMENT SERVICES','ES',
"
"                                 'BY PRODUCT','BP',
"
"                                 'CHARGES','CH',
"
"                                 'JOB WORK CHARGES','JW',
"
"                                 'FRIEGHT','FR',
"
"				 'IGST','IG'
"
"                                 ),*/
"
"               cr_st(indx).v_account,
"
"               p_user,
"
"               SYSDATE   ,
"
"               'Y'
"
"               );
"
"
"
"   END LOOP;
"
"   IF SQL%NOTFOUND THEN
"
"   raise_application_error(-20660,'APM');
"
"  END IF;
"
"  END IF;
"
"END;
"
"
"
"    proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_class;
"
"
"
"/***************************************************Quotation -> Attribute CFG0150******************************************************/
"
"
"
"PROCEDURE proc_ins_quot_attr_mig (p_bu       VARCHAR2,
"
"                      p_fname    VARCHAR2,
"
"                      p_sep      VARCHAR2,
"
"                                  p_user     VARCHAR2)
"
"AS
"
"v_sql       VARCHAR2(4000);
"
"v_fpath     VARCHAR2(200);
"
"v_type      VARCHAR2(10);
"
"v_type_id   VARCHAR2(10);
"
"v_group_id  VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_QATTR_ATTR_NAME1    VARCHAR2(500));
"
"
"
"TYPE typ_ins_det IS TABLE OF typ_ins INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx         NUMBER := 1;
"
"v_seq_no     NUMBER;
"
"
"
"  BEGIN
"
"
"
"    SELECT directory_path
"
"      INTO v_fpath
"
"      FROM dba_directories
"
"     WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"     v_sql := 'CREATE TABLE scm_migration(SM_QATTR_ATTR_NAME1    VARCHAR2(500))
"
"                                           ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep|| '''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_QATTR_ATTR_NAME1      CHAR(255)
"
"                                            ))
"
"                       LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_st;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"   BEGIN
"
"      SELECT MAX(qattr_attr_id)
"
"        INTO v_type
"
"        FROM quotation_attr
"
"       WHERE qattr_bu = p_bu;
"
"
"
"      v_type_id := func_get_next_id(v_type);
"
"   END;
"
"
"
"SELECT NVL(MAX(qattr_print_seq_no),0)+1
"
"  INTO v_seq_no
"
"  FROM quotation_attr
"
" WHERE qattr_bu = p_bu;
"
"
"
"
"
"        INSERT INTO quotation_attr(qattr_bu,
"
"                               qattr_print_seq_no,
"
"                                   qattr_attr_id,
"
"                                   qattr_attr_name1,
"
"                                   qattr_cre_by,
"
"                                   qattr_cre_date,
"
"                                   qattr_pom,
"
"                                   qattr_som,
"
"                                   qattr_quote_feas_flag
"
"                                  )
"
"                            VALUES(p_bu,
"
"                                   v_seq_no,
"
"                       v_type_id,
"
"                                   cr_st(indx).sm_qattr_attr_name1,
"
"                                   p_user,
"
"                                   SYSDATE,
"
"                                   'N',
"
"                                   'Y',
"
"                                   'N'
"
"                                  );
"
"   END LOOP;
"
"   END;
"
"
"
"   proc_chk_migrate_table ('SCM_MIGRATION');
"
"    Commit;
"
"
"
"  END proc_ins_quot_attr_mig;
"
"
"
"/*************************************************Open Sc Migration***********************************************************/
"
"PROCEDURE proc_ins_open_SCO_mig_ln(p_bu      		VARCHAr2,
"
"				   p_doc_no  		VARCHAr2,
"
"				   p_fname   		VARCHAR2,
"
"				   p_sep       		VARCHAR2,
"
"				   p_user       	VARCHAR2
"
"				  )
"
"AS
"
"
"
"v_sql        	VARCHAR2(4000);
"
"v_fpath         VARCHAR2(200);
"
"v_seq_no    	NUMBER;
"
"
"
"TYPE typ_osc IS RECORD (osc_unit_loc        	VARCHAR2(100),
"
"                        osc_unit        	VARCHAR2(100),
"
"			osc_level_type		VARCHAR2(10),
"
"			osc_reference           VARCHAR2(100),
"
"			osc_prod_id        	VARCHAR2(100),
"
"			osc_prod_rev        	NUMBER(5),
"
"			osc_suplr_id        	VARCHAR2(50),
"
"			osc_eff_from        	DATE,
"
"			osc_eff_to        	DATE,
"
"			osc_process		VARCHAR2(250),
"
"			osc_batch_qty         	NUMBER(17,5),
"
"			osc_batch_cost         	NUMBER(17,5),
"
"			osc_min_flag		VARCHAR2(1)
"
"			);
"
"
"
"TYPE typ_osc_tab IS TABLE OF typ_osc INDEX BY PLS_INTEGER;
"
"r_osc    typ_osc_tab;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_ref    typ_ref_cur;
"
"indx    NUMBER := 0;
"
"
"
"v_plnt			VARCHAR2(100);
"
"v_plnt_loc_id		VARCHAR2(150);
"
"v_suplr_id		VARCHAR2(100);
"
"v_prod_desc		VARCHAR2(150);
"
"v_res			VARCHAR(1);
"
"v_uom			VARCHAR2(10);
"
"v_process		VARCHAR2(200);
"
"v_line			NUMBER(5);
"
"BEGIN
"
"
"
"  SELECT directory_path
"
"    INTO v_fpath
"
"    FROM dba_directories
"
"   WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"    proc_chk_migrate_table ('SCM_MIGRATION');
"
"    v_sql := 'CREATE TABLE scm_migration(osc_unit_loc        		VARCHAR2(100),
"
"					 osc_unit        		VARCHAR2(100),
"
"					 osc_level_type			VARCHAR2(10),
"
"					 osc_reference          	VARCHAR2(100),
"
"					 osc_prod_id        		VARCHAR2(100),
"
"					 osc_prod_rev        		NUMBER(5),
"
"					 osc_suplr_id        		VARCHAR2(50),
"
"					 osc_eff_from        		DATE,
"
"					 osc_eff_to        		DATE,
"
"					 osc_process			VARCHAR2(250),
"
"					 osc_batch_qty         		NUMBER(17,5),
"
"					 osc_batch_cost         	NUMBER(17,5),
"
"					 osc_min_flag			VARCHAR2(1)
"
"					)
"
"              ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                    ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                      SKIP 1
"
"                              FIELDS TERMINATED BY '''||p_sep||'''  OPTIONALLY ENCLOSED BY ''""''
"
"                              MISSING FIELD VALUES ARE NULL
"
"                              REJECT ROWS WITH ALL NULL FIELDS
"
"                              (osc_unit_loc       CHAR(255),
"
"			       osc_unit        	  CHAR(255),
"
"			       osc_level_type	  CHAR(255),
"
"			       osc_reference      CHAR(255),
"
"			       osc_prod_id        CHAR(255),
"
"			       osc_prod_rev       CHAR(255),
"
"			       osc_suplr_id       CHAR(255),
"
"			       osc_eff_from       CHAR(255),
"
"			       osc_eff_to         CHAR(255),
"
"			       osc_process	  CHAR(255),
"
"			       osc_batch_qty      CHAR(255),
"
"			       osc_batch_cost     CHAR(255),
"
"			       osc_min_flag       CHAR(255)
"
"                              )
"
"                             ) LOCATION ('''||p_fname||''')
"
"                   ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE open_sc_mig_ln
"
"   WHERE osml_bu = p_bu
"
"     AND osml_doc_no = p_doc_no;
"
"
"
"  DELETE
"
"    FROM open_sc_mig_exc
"
"  WHERE osme_bu =p_bu;
"
"
"
"  v_seq_no := 0;
"
"  v_res :='Y';
"
"
"
"  OPEN c_ref FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    indx := indx + 1;
"
"    FETCH c_ref INTO r_osc(indx);
"
"    EXIT WHEN c_ref%NOTFOUND;
"
"
"
"   v_seq_no := v_seq_no + 1;
"
"
"
"   IF r_osc(indx).osc_unit_loc IS NULL THEN
"
"      Raise_Application_Error(-20999,'File not loaded.');
"
"   END IF;
"
"
"
"    IF r_osc(indx).osc_unit IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bup_plant_id INTO v_plnt
"
"	  FROM bus_unit_plants
"
"         WHERE bup_bu = p_bu
"
"           AND (bup_plant_id = UPPER(r_osc(indx).osc_unit) OR bup_name1 = UPPER(r_osc(indx).osc_unit));
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"         proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Unit not found.',
"
"				  p_user
"
"				  );
"
"        v_res :='N';
"
"      END;
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_unit_loc IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bupld_loc_id INTO v_plnt_loc_id
"
"	  FROM bus_unit_plants_loc_dtls
"
"         WHERE bupld_bu = p_bu
"
"           AND (bupld_loc_id = UPPER(r_osc(indx).osc_unit_loc) OR UPPER(bupld_loc_name) = UPPER(r_osc(indx).osc_unit_loc));
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Location not found. - '||r_osc(indx).osc_unit_loc,
"
"				  p_user
"
"				  );
"
"       v_res :='N';
"
"      END;
"
"    END IF;
"
"
"
"    v_suplr_id :=NULL;
"
"
"
"    IF r_osc(indx).osc_suplr_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT suplr_suplr_id INTO v_suplr_id
"
"         FROM suppliers
"
"        WHERE suplr_bu = p_bu
"
"          AND(TRIM(UPPER(suplr_suplr_id)) = TRIM(UPPER(r_osc(indx).osc_suplr_id)) OR UPPER(suplr_name1) =TRIM(UPPER(r_osc(indx).osc_suplr_id)));
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Supplier not found.',
"
"				  p_user
"
"				  );
"
"        v_res :='N';
"
"      END;
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_prod_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT prod_desc11 INTO v_prod_desc
"
"          FROM products
"
"	 WHERE prod_bu = p_bu
"
"	   AND prod_id = UPPER(r_osc(indx).osc_prod_id)
"
"	   AND prod_rev = NVL(UPPER(r_osc(indx).osc_prod_rev),0);
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Item not found.',
"
"				  p_user
"
"				  );
"
"	v_res :='N';
"
"      END;
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_process IS NOT NULL THEN
"
"     BEGIN
"
"       SELECT DISTINCT mfgo_oprn_id INTO v_process
"
"	 FROM(SELECT mfgo_oprn_id
"
"		FROM mfg_oprns_plnt,mfg_oprns
"
"	       WHERE mfgop_bu = mfgo_bu
"
"                 AND mfgop_oprn_id = mfgo_oprn_id
"
"                 AND mfgo_bu = p_bu
"
"                 AND mfgop_plnt = v_plnt
"
"                 AND mfgo_oprn_flag IN ('O','B')
"
"		 AND mfgo_oprn_id = TRIM(r_osc(indx).osc_process) OR mfgo_desc1 = TRIM(r_osc(indx).osc_process)
"
"		 AND ROWNUM =1);
"
"     EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Process not found. - '||r_osc(indx).osc_process,
"
"				  p_user
"
"				  );
"
"        v_res :='N';
"
"     END;
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_batch_qty <=0 OR r_osc(indx).osc_batch_qty IS NULL THEN
"
"      proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Batch qty. greater than zero.',
"
"				  p_user
"
"				  );
"
"	v_res :='N';
"
"    END IF;
"
"
"
"     IF r_osc(indx).osc_batch_cost <=0 OR r_osc(indx).osc_batch_cost IS NULL THEN
"
"          proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Batch cost greater than zero.',
"
"				  p_user
"
"				  );
"
"	v_res :='N';
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_level_type NOT IN('SIP','IP','P','SP') THEN
"
"          proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Level Type not found.',
"
"				  p_user
"
"				  );
"
"	v_res :='N';
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_eff_from IS NULL THEN
"
"         proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Eff. From must be entered. ',
"
"				  p_user
"
"				  );
"
"	v_res :='N';
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_eff_to IS NULL THEN
"
"       proc_ins_open_sc_mig_exp(p_bu,
"
"				  v_seq_no,
"
"				  'Eff. To must be entered. ',
"
"				  p_user
"
"				  );
"
"	v_res :='N';
"
"    END IF;
"
"
"
"
"
"
"
"  END LOOP;
"
"  CLOSE c_ref;
"
"  Commit;
"
"
"
"  IF v_res ='Y' THEN
"
"
"
"    OPEN c_ref FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"
"
"    indx := indx + 1;
"
"    FETCH c_ref INTO r_osc(indx);
"
"    EXIT WHEN c_ref%NOTFOUND;
"
"
"
"    v_process :=NULL;
"
"    v_uom     :=NULL;
"
"    v_plnt    :=NULL;
"
"    v_plnt_loc_id :=NULL;
"
"
"
"    IF r_osc(indx).osc_unit_loc IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bupld_loc_id INTO v_plnt_loc_id
"
"	  FROM bus_unit_plants_loc_dtls
"
"         WHERE bupld_bu = p_bu
"
"           AND (bupld_loc_id = UPPER(r_osc(indx).osc_unit_loc) OR bupld_loc_name = UPPER(r_osc(indx).osc_unit_loc));
"
"      EXCEPTION WHEN OTHERS THEN
"
"        NULL;
"
"      END;
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_unit IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bup_plant_id INTO v_plnt
"
"	  FROM bus_unit_plants
"
"         WHERE bup_bu = p_bu
"
"           AND (bup_plant_id = UPPER(r_osc(indx).osc_unit) OR bup_name1 = UPPER(r_osc(indx).osc_unit));
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        NULL;
"
"      END;
"
"    END IF;
"
"
"
"    IF r_osc(indx).osc_process IS NOT NULL THEN
"
"     BEGIN
"
"       SELECT DISTINCT mfgo_oprn_id INTO v_process
"
"	 FROM(SELECT mfgo_oprn_id
"
"		FROM mfg_oprns_plnt,mfg_oprns
"
"	       WHERE mfgop_bu = mfgo_bu
"
"                 AND mfgop_oprn_id = mfgo_oprn_id
"
"                 AND mfgo_bu = p_bu
"
"                 AND mfgop_plnt = v_plnt
"
"                 AND mfgo_oprn_flag IN ('O','B')
"
"		 AND (mfgo_oprn_id = TRIM(r_osc(indx).osc_process) OR TRIM(mfgo_desc1) = TRIM(r_osc(indx).osc_process))
"
"		 AND ROWNUM =1);
"
"     EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       --NULL;
"
"        v_res :='N';
"
"       RAISE_APPLICATION_ERROR(-20999,'Process not found. '||TRIM(r_osc(indx).osc_process)||'/'||v_plnt);
"
"     END;
"
"    END IF;
"
"
"
"
"
"
"
"    IF r_osc(indx).osc_process IS NOT NULL THEN
"
"    BEGIN
"
"	SELECT DISTINCT mfgo_uom
"
"		   INTO v_uom
"
"		  FROM(
"
"		  SELECT mfgo_uom
"
"		   FROM mfg_oprns_plnt,mfg_oprns
"
"		  WHERE mfgop_bu = mfgo_bu
"
"		    AND mfgop_oprn_id = mfgo_oprn_id
"
"		    AND mfgo_bu = p_bu
"
"		    AND mfgop_plnt = v_plnt
"
"		    AND mfgo_oprn_id =v_process
"
"		    AND mfgo_oprn_flag IN ('O','B')
"
"                    AND r_osc(indx).osc_level_type IN('SP','P')
"
"        UNION ALL
"
"        SELECT mfgo_uom
"
"          FROM bom_hd, routing_ln,mfg_oprns
"
"         WHERE bomhd_bu = rouln_bu
"
"           AND bomhd_plnt = rouln_plnt
"
"           AND bomhd_bom_no = rouln_bom_no
"
"           AND mfgo_bu = rouln_bu
"
"           AND mfgo_oprn_id = rouln_oprn_id
"
"           AND bomhd_bu  = p_bu
"
"           AND mfgo_oprn_id =v_process
"
"           AND bomhd_prod_id = r_osc(indx).osc_prod_id
"
"	   AND r_osc(indx).osc_level_type IN('SIP','IP'));
"
"    EXCEPTION WHEN OTHERS THEN
"
"
"
"      SELECT mfgo_uom INTO v_uom
"
"        FROM mfg_oprns
"
"       WHERE  mfgo_bu = p_bu
"
"         AND  mfgo_oprn_id = v_process;
"
"    END;
"
"    END IF;
"
"
"
"    SELECT NVL(MAX(osml_seq_no),0)+1 INTO v_line
"
"      FROM open_sc_mig_ln
"
"     WHERE osml_bu = p_bu
"
"       AND osml_doc_no = p_doc_no;
"
"
"
"    INSERT INTO open_sc_mig_ln(osml_bu,
"
"			       osml_doc_no,
"
"			       osml_seq_no,
"
"			       osml_plnt,
"
"			       osml_plnt_loc_id,
"
"			       osml_plnt_loc_name,
"
"			       osml_po_date,
"
"			       osml_level_type,
"
"			       osml_eff_from,
"
"			       osml_eff_to,
"
"			       osml_suplr_id,
"
"			       osml_prod_id,
"
"			       osml_prod_rev,
"
"			       osml_ref,
"
"			       osml_proc_id,
"
"			       osml_unit_cost,
"
"			       osml_batch_qty,
"
"			       osml_min_flag,
"
"			       osml_uom,
"
"			       osml_cre_by,
"
"			       osml_cre_ip_addr,
"
"			       osml_cre_os_user,
"
"			       osml_cre_date,
"
"			       osml_cre_emp_id
"
"		               )
"
"		         VALUES(p_bu,
"
"                                p_doc_no,
"
"                                v_line,
"
"                                v_plnt,
"
"                                v_plnt_loc_id,
"
"				func_find_plnt_loc_qry_desc(p_bu,v_plnt_loc_id),
"
"				SYSDATE,
"
"                                r_osc(indx).osc_level_type,
"
"                                r_osc(indx).osc_eff_from,
"
"                                r_osc(indx).osc_eff_to,
"
"			        v_suplr_id,
"
"				--TRIM(UPPER(r_osc(indx).osc_suplr_id)),
"
"                                r_osc(indx).osc_prod_id,
"
"                                NVL(r_osc(indx).osc_prod_rev,0),
"
"				r_osc(indx).osc_reference,
"
"				v_process,
"
"                                NVL(r_osc(indx).osc_batch_cost,0),
"
"				r_osc(indx).osc_batch_qty,
"
"				NVL(r_osc(indx).osc_min_flag,'N'),
"
"				v_uom,
"
"                                p_user,
"
"                                Audit_Info.Get_IP_Address,
"
"				Audit_Info.Get_OS_User,
"
"				SYSDATE,
"
"				func_find_emp_id(p_bu,p_user)
"
"                                );
"
"  END LOOP;
"
"  CLOSE c_ref;
"
"  ELSIF v_res ='N' THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Refer Exception.');
"
"  END IF;
"
"  proc_chk_migrate_table ('SCM_MIGRATION');
"
"  Commit;
"
"END proc_ins_open_SCO_mig_ln;
"
"
"
"END pkg_crm_migration;"
/
