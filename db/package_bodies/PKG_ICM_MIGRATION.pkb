CREATE OR REPLACE
"PACKAGE BODY pkg_icm_migration
"
"AS
"
"   PROCEDURE proc_chk_migrate_table (p_tab_name VARCHAR2)
"
"   AS
"
"      v_tab_cnt   NUMBER;
"
"      v_sql       VARCHAR2 (100);
"
"   BEGIN
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
"
"
"   PROCEDURE proc_ins_attr_group (p_bu       VARCHAR2,
"
"                                  p_fname    VARCHAR2,
"
"                                  p_sep      VARCHAR2,
"
"                                  p_user     VARCHAR2)
"
"   AS
"
"      v_sql      VARCHAR2 (4000);
"
"      v_fpath    VARCHAR2 (200);
"
"      v_max_id   VARCHAR2 (5);
"
"
"
"      TYPE typ_ins IS RECORD
"
"      (
"
"         SM_PRINT_SEQ       NUMBER (5),
"
"         SM_ATTR_GRP_DESC   VARCHAR2 (100)
"
"      );
"
"
"
"      TYPE typ_ins_det IS TABLE OF typ_ins
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      cr_st      typ_ins_det;
"
"
"
"      TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"      c_st       typ_ref_cur;
"
"
"
"      indx       NUMBER := 1;
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"            'CREATE TABLE scm_migration(SM_PRINT_SEQ NUMBER,
"
"    SM_ATTR_GRP_DESC VARCHAR2(50))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_PRINT_SEQ CHAR(255),SM_ATTR_GRP_DESC  CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"      --Raise_Application_Error(-20999,'HRM'||'/'||v_sql);
"
"
"
"      /*  INSERT INTO Test_mig(tm_content) VALUES (v_sql);
"
"        Commit;
"
"      */
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      BEGIN
"
"         OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"
"
"         LOOP
"
"            FETCH c_st INTO cr_st (indx);
"
"
"
"            indx := indx + 1;
"
"            EXIT WHEN c_st%NOTFOUND;
"
"         END LOOP;
"
"
"
"         CLOSE c_st;
"
"
"
"         FOR indx IN 1 .. cr_st.COUNT
"
"         LOOP
"
"            SELECT MAX (PSAG_ATTR_GRP_ID)
"
"              INTO v_max_id
"
"              FROM PROD_SPEC_ATTR_GRP
"
"             WHERE PSAG_BU = P_BU;
"
"
"
"            INSERT INTO PROD_SPEC_ATTR_GRP (PSAG_BU,
"
"                                                    PSAG_ATTR_GRP_ID,
"
"                                                    PSAG_ATTR_GRP_DESC,
"
"                                                    PSAG_PRINT_SEQ,
"
"                                                    PSAG_CRE_BY,
"
"                                                    PSAG_CRE_DATE)
"
"                 VALUES (p_bu,
"
"                         FUNC_GET_NEXT_ID (v_max_id),
"
"                         CR_ST (INDX).SM_ATTR_GRP_DESC,
"
"                         CR_ST (INDX).SM_PRINT_SEQ,
"
"                         p_user,
"
"                         SYSDATE);
"
"         END LOOP;
"
"      END;
"
"
"
"      /*v_sql :=
"
"         'INSERT INTO prod_spec_attr_grp(PSAG_BU,PSAG_ATTR_GRP_ID,PSAG_ATTR_GRP_DESC,PSAG_PRINT_SEQ,
"
"            PSAG_CRE_BY,PSAG_CRE_DATE)
"
"              SELECT '''
"
"         || p_bu
"
"         || ''',func_get_next_id(select max(PSAG_ATTR_GRP_ID) from prod_spec_attr_grp where PSAG_BU ='''
"
"         || p_bu
"
"         || '''),
"
"          SM_ATTR_GRP_DESC,
"
"          SM_PRINT_SEQ,
"
"          '''
"
"         || p_user
"
"         || ''',
"
"         SYSDATE
"
"              FROM scm_migration';
"
"      --Raise_Application_Error(-20999,'HRM'||v_sql);
"
"      EXECUTE IMMEDIATE v_sql;*/
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      --Raise_Application_Error(-20999,'HRM'||'/'||length(v_sql));
"
"
"
"
"
"      COMMIT;
"
"   END proc_ins_attr_group;
"
"
"
"PROCEDURE proc_ins_item_conv_factor (p_bu       VARCHAR2,
"
"                                        p_fname    VARCHAR2,
"
"                                        p_sep      VARCHAR2,
"
"                                        p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (1000);
"
"   BEGIN
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
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      v_sql :=
"
"         'CREATE TABLE SCM_MIGRATION(SM_PROD_ID   VARCHAR2(25),
"
"                                          SM_PROD_REV    NUMBER(5),
"
"                                          SM_FROM_UOM   VARCHAR2(5),
"
"                                          SM_TO_UOM    VARCHAR2(5),
"
"                                          SM_CONV_FACTOR   NUMBER(15,8)
"
"                                          )
"
"                              ORGANIZATION EXTERNAL
"
"                              (TYPE ORACLE_LOADER
"
"                                     DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                     ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                               SKIP 1
"
"                                              FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"                                              MISSING FIELD VALUES ARE NULL
"
"                                              REJECT ROWS WITH ALL NULL FIELDS
"
"                                              (SM_PROD_ID        CHAR(255),
"
"                                               SM_PROD_REV        CHAR(255),
"
"                                               SM_FROM_UOM        CHAR(255),
"
"                                               SM_TO_UOM        CHAR(255),
"
"                                               SM_CONV_FACTOR        CHAR(255)
"
"                                               )
"
"                                                 )
"
"                                  LOCATION ('''
"
"         || p_fname
"
"         || ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      /*DELETE cust_schd_mig_ln
"
"       WHERE csmln_bu = p_bu
"
"         AND csmln_plnt = p_plnt
"
"         AND csmln_doc_no = p_doc_no;*/
"
"
"
"      v_sql :=
"
"         'INSERT INTO UOM_PROD_CONV_FACTORS (UOMPCF_BU,
"
"                           UOMPCF_PROD_ID,
"
"                           UOMPCF_PROD_REV,
"
"                           UOMPCF_PROD_UOM,
"
"                           UOMPCF_UOM_TO,
"
"                           UOMPCF_CONV_FACTOR,
"
"                           UOMPCF_TOL_PCT,
"
"                           UOMPCF_CRE_BY,
"
"                           UOMPCF_CRE_DATE)SELECT '''|| p_bu|| ''',
"
"                                                     SM_PROD_ID,
"
"                                                     SM_PROD_REV,
"
"                                                     SM_FROM_UOM,
"
"                                                     SM_TO_UOM,
"
"                                                     SM_CONV_FACTOR,
"
"                                                     0,
"
"                                                     '''|| p_user|| ''',
"
"                                                     SYSDATE
"
"                                                  FROM SCM_MIGRATION';
"
"
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM'||'\'||v_sql);
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"
"
"
"
"      COMMIT;
"
"   END proc_ins_item_conv_factor;
"
"
"
"
"
"   PROCEDURE proc_ins_prod_spec_attr (p_bu       VARCHAR2,
"
"                                      p_fname    VARCHAR2,
"
"                                      p_sep      VARCHAR2,
"
"                                      p_user     VARCHAR2)
"
"   AS
"
"      v_sql      VARCHAR2 (4000);
"
"      v_fpath    VARCHAR2 (200);
"
"      v_max_id   VARCHAR2 (5);
"
"
"
"      TYPE typ_ins IS RECORD
"
"      (
"
"         SM_PRINT_SEQ       NUMBER (5),
"
"         SM_ATTR_DESC       VARCHAR2 (50),
"
"         SM_DEFLT_VAL       VARCHAR2 (200),
"
"         SM_ATTR_GRP_DESC   VARCHAR2 (50)
"
"      );
"
"
"
"      TYPE typ_ins_det IS TABLE OF typ_ins
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      cr_st      typ_ins_det;
"
"
"
"      TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"      c_st       typ_ref_cur;
"
"
"
"      indx       NUMBER := 1;
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"            'CREATE TABLE scm_migration(SM_PRINT_SEQ NUMBER,
"
"    SM_ATTR_DESC VARCHAR2(50),
"
"    SM_DEFLT_VAL VARCHAR2(200),
"
"    SM_ATTR_GRP_DESC VARCHAR2(50))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_PRINT_SEQ CHAR(255),SM_ATTR_DESC  CHAR(255),
"
"SM_DEFLT_VAL CHAR(255),SM_ATTR_GRP_DESC  CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"      BEGIN
"
"         OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"
"
"         LOOP
"
"            FETCH c_st INTO cr_st (indx);
"
"
"
"            indx := indx + 1;
"
"            EXIT WHEN c_st%NOTFOUND;
"
"         END LOOP;
"
"
"
"         CLOSE c_st;
"
"
"
"         FOR indx IN 1 .. cr_st.COUNT
"
"         LOOP
"
"            SELECT MAX (PSA_ATTR_ID)
"
"              INTO v_max_id
"
"              FROM PROD_SPEC_ATTR
"
"             WHERE PSA_BU = P_BU;
"
"
"
"
"
"            INSERT INTO PROD_SPEC_ATTR (PSA_BU,
"
"                                                PSA_ATTR_ID,
"
"                                                PSA_ATTR_DESC,
"
"                                                PSA_DEFLT_VAL,
"
"                                                PSA_PRINT_SEQ,
"
"                                                PSA_ATTR_GRP_ID,
"
"                                                PSA_CRE_BY,
"
"                                                PSA_CRE_DATE)
"
"                 VALUES (
"
"                           P_BU,
"
"                           FUNC_GET_NEXT_ID (v_max_id),
"
"                           CR_ST (INDX).SM_ATTR_DESC,
"
"                           CR_ST (INDX).SM_DEFLT_VAL,
"
"                           CR_ST (INDX).SM_PRINT_SEQ,
"
"                           (SELECT PSAG_ATTR_GRP_ID
"
"                              FROM PROD_SPEC_ATTR_GRP
"
"                             WHERE PSAG_ATTR_GRP_DESC =
"
"                                      CR_ST (INDX).SM_ATTR_GRP_DESC
"
"                                   AND PSAG_BU = P_BU),
"
"                           P_USER,
"
"                           SYSDATE);
"
"         END LOOP;
"
"      END;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      COMMIT;
"
"   END proc_ins_prod_spec_attr;
"
"
"
"
"
"   PROCEDURE proc_ins_item_pack (p_bu       VARCHAR2,
"
"                                 p_prod_id  VARCHAR2,
"
"				 p_prod_rev VARCHAR2,
"
"                                 p_fname    VARCHAR2,
"
"                                 p_sep      VARCHAR2,
"
"                                 p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (1000);
"
"   BEGIN
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
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      v_sql :=
"
"		 'CREATE TABLE SCM_MIGRATION(SM_CH_PROD_ID   VARCHAR2(25),
"
"                                             SM_CH_PROD_REV    NUMBER(5),
"
"                                             SM_QTY   NUMBER(12,3),
"
"                                             SM_FLAG VARCHAR2(1)
"
"                                            )
"
"                                 ORGANIZATION EXTERNAL
"
"                                 (TYPE ORACLE_LOADER
"
"                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                        ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                  SKIP 1
"
"                                                 FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"                                                 MISSING FIELD VALUES ARE NULL
"
"                                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                                 (SM_CH_PROD_ID        	CHAR(255),
"
"                                                  SM_CH_PROD_REV        CHAR(255),
"
"                                                  SM_QTY          	CHAR(255),
"
"                                                  SM_FLAG    		CHAR(255)
"
"						 )
"
"						)
"
"					LOCATION ('''
"
"					 || p_fname
"
"					 || ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      /*DELETE cust_schd_mig_ln
"
"       WHERE csmln_bu = p_bu
"
"         AND csmln_plnt = p_plnt
"
"         AND csmln_doc_no = p_doc_no;*/
"
"
"
"      v_sql :=
"
"         'INSERT INTO PROD_PACKING_DTLS (PPD_BU,
"
"                                          PPD_CONT_PROD_ID,
"
"                                          PPD_CONT_PROD_REV,
"
"                                          PPD_PACK_PROD_ID,
"
"                                          PPD_PACK_PROD_REV,
"
"                                          PPD_QTY,
"
"                                          PPD_PRIORITY_FLAG,
"
"                                          PPD_CRE_BY,
"
"                                          PPD_CRE_DATE,
"
"                                          PPD_UPD_BY,
"
"                                          PPD_UPD_DATE)
"
"				   SELECT '''|| p_bu|| ''',
"
"					  '''||p_prod_id ||''',
"
"					  '''||p_prod_rev || ''',
"
"					  SM_CH_PROD_ID,
"
"					  SM_CH_PROD_REV,
"
"					  SM_QTY,
"
"					  SM_FLAG,
"
"					  '''
"
"					  || p_user
"
"					  || ''',
"
"					  SYSDATE,
"
"					  NULL,
"
"					  NULL
"
"				     FROM SCM_MIGRATION';
"
"
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM'||'\'||v_sql);
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      COMMIT;
"
"   END proc_ins_item_pack;
"
"
"
"   PROCEDURE proc_ins_bin_prod_ass (p_bu       VARCHAR2,
"
"                                    p_fname    VARCHAR2,
"
"                                    p_sep      VARCHAR2,
"
"                                    p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (200);
"
"
"
"      --v_max_id   VARCHAR2 (5);
"
"
"
"      TYPE typ_ins IS RECORD
"
"      (
"
"         SM_BPA_BIN_ID         VARCHAR2 (25),
"
"         SM_BPA_STORE_ID       VARCHAR2 (25),
"
"         SM_BPA_PROD_ID        VARCHAR2 (25),
"
"         SM_BPA_CAPACITY_UOM   VARCHAR2 (15),
"
"         SM_BPA_CAPACITY       NUMBER
"
"      );
"
"
"
"      TYPE typ_ins_det IS TABLE OF typ_ins
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      cr_st     typ_ins_det;
"
"
"
"      TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"      c_st      typ_ref_cur;
"
"
"
"      indx      NUMBER := 1;
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"         'CREATE TABLE scm_migration(SM_BPA_BIN_ID VARCHAR2 (25),
"
"    SM_BPA_STORE_ID       VARCHAR2 (25),
"
"    SM_BPA_PROD_ID       VARCHAR2 (25),
"
"    SM_BPA_CAPACITY_UOM   VARCHAR2 (15),
"
"    SM_BPA_CAPACITY NUMBER)
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY ''' || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_BPA_BIN_ID CHAR(255),SM_BPA_STORE_ID  CHAR(255), SM_BPA_PROD_ID CHAR(255)
"
"SM_BPA_CAPACITY_UOM CHAR(255),SM_BPA_CAPACITY  CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"      BEGIN
"
"         OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"
"
"         LOOP
"
"            FETCH c_st INTO cr_st (indx);
"
"
"
"            indx := indx + 1;
"
"            EXIT WHEN c_st%NOTFOUND;
"
"         END LOOP;
"
"
"
"         CLOSE c_st;
"
"
"
"         FOR indx IN 1 .. cr_st.COUNT
"
"         LOOP
"
"            INSERT INTO BIN_PROD_ASS (BPA_BU,
"
"                                              BPA_BIN_ID,
"
"                                              BPA_STORE_ID,
"
"                                              BPA_PROD_ID,
"
"                                              BPA_PROD_REV,
"
"                                              BPA_STATUS,
"
"                                              BPA_CAPACITY_UOM,
"
"                                              BPA_CAPACITY,
"
"                                              BPA_CRE_BY,
"
"                                              BPA_CRE_DATE)
"
"                 VALUES (P_BU,
"
"                         CR_ST (INDX).SM_BPA_BIN_ID,
"
"                         CR_ST (INDX).SM_BPA_STORE_ID,
"
"                         CR_ST (INDX).SM_BPA_PROD_ID,
"
"                         0,
"
"                         'A',
"
"                         CR_ST (INDX).SM_BPA_CAPACITY_UOM,
"
"                         CR_ST (INDX).SM_BPA_CAPACITY,
"
"                         P_USER,
"
"                         SYSDATE);
"
"         END LOOP;
"
"      END;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      COMMIT;
"
"   END proc_ins_bin_prod_ass;
"
"
"
"   PROCEDURE proc_ins_purge_item (p_bu       VARCHAR2,
"
"                                  p_fname    VARCHAR2,
"
"                                  p_sep      VARCHAR2,
"
"                                  p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (1000);
"
"   BEGIN
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
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      v_sql :=
"
"         'CREATE TABLE SCM_MIGRATION(SM_PROD_ID   VARCHAR2(25),
"
"                                                SM_PROD_REV    NUMBER(5)
"
"                                                )
"
"                                    ORGANIZATION EXTERNAL
"
"                                    (TYPE ORACLE_LOADER
"
"                                           DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                           ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                     SKIP 1
"
"                                                    FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"                                                    MISSING FIELD VALUES ARE NULL
"
"                                                    REJECT ROWS WITH ALL NULL FIELDS
"
"                                                    (SM_PAR_PROD_ID        CHAR(255),
"
"                                                     SM_PAR_PROD_REV       CHAR(255)
"
"                                                     )
"
"                                                       )
"
"                                        LOCATION ('''
"
"         || p_fname
"
"         || ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      /*DELETE cust_schd_mig_ln
"
"       WHERE csmln_bu = p_bu
"
"         AND csmln_plnt = p_plnt
"
"         AND csmln_doc_no = p_doc_no;*/
"
"
"
"      v_sql :=
"
"         'INSERT INTO INJ_MLD_PURGE_RM (IMPR_BU,
"
"                                 IMPR_PROD_ID,
"
"                                 IMPR_PROD_REV,
"
"                                 IMPR_CRE_BY,
"
"                                 IMPR_CRE_DATE)SELECT ''' || p_bu
"
"         || ''',
"
"                                                           SM_PROD_ID,
"
"                                                           SM_PROD_REV,
"
"                                                           '''
"
"         || p_user
"
"         || ''',
"
"                                                           SYSDATE
"
"                                                           FROM SCM_MIGRATION';
"
"
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM'||'\'||v_sql);
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      COMMIT;
"
"   END proc_ins_purge_item;
"
"
"
"   PROCEDURE proc_ins_prod_parts_cont (p_bu       VARCHAR2,
"
"                                       p_fname    VARCHAR2,
"
"                                       p_sep      VARCHAR2,
"
"                                       p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (200);
"
"   --v_max_id   VARCHAR2 (5);
"
"
"
"
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"         'CREATE TABLE scm_migration(SM_PPC_PAR_PROD_ID VARCHAR2 (25),
"
"    SM_PPC_CHILD_PROD_ID       VARCHAR2 (25),
"
"    SM_PPC_QTY NUMBER)
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_PPC_PAR_PROD_ID CHAR(255),SM_PPC_CHILD_PROD_ID  CHAR(255), SM_PPC_QTY CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      v_sql :=
"
"         'Insert into PROD_PARTS_CONT
"
"   (PPC_BU, PPC_PAR_PROD_ID, PPC_PAR_PROD_REV, PPC_CHILD_PROD_ID, PPC_CHILD_PROD_REV, PPC_QTY, PPC_CRE_BY, PPC_CRE_DATE) SELECT '''
"
"         || p_bu
"
"         || ''',SM_PPC_PAR_PROD_ID,(SELECT PROD_REV FROM PRODUCTS WHERE PROD_ID = SM_PPC_PAR_PROD_ID AND PROD_BU = '''
"
"         || p_bu
"
"         || '''),
"
"                         SM_PPC_CHILD_PROD_ID,(SELECT PROD_REV FROM PRODUCTS WHERE PROD_ID = SM_PPC_CHILD_PROD_ID AND PROD_BU = '''
"
"         || p_bu
"
"         || '''),SM_PPC_QTY,'''
"
"         || p_user
"
"         || ''',SYSDATE
"
"               FROM scm_migration';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      COMMIT;
"
"   END proc_ins_prod_parts_cont;
"
"
"
"   PROCEDURE proc_ins_item_part_inbuilt (p_bu       VARCHAR2,
"
"                                         p_fname    VARCHAR2,
"
"                                         p_sep      VARCHAR2,
"
"                                         p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (1000);
"
"   BEGIN
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
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      v_sql :=
"
"         'CREATE TABLE SCM_MIGRATION(SM_PAR_PROD_ID   VARCHAR2(25),
"
"                                                   SM_PAR_PROD_REV NUMBER(5),
"
"                                                   SM_CH_PROD_ID VARCHAR2(25),
"
"                                                   SM_CH_PROD_REV NUMBER(5),
"
"                                                   SM_QTY NUMBER(12,3)
"
"                                                   )
"
"                                       ORGANIZATION EXTERNAL
"
"                                       (TYPE ORACLE_LOADER
"
"                                              DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                              ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                        SKIP 1
"
"                                                       FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"                                                       MISSING FIELD VALUES ARE NULL
"
"                                                       REJECT ROWS WITH ALL NULL FIELDS
"
"                                                       (SM_PAR_PROD_ID        CHAR(255),
"
"                                                        SM_PAR_PROD_REV       CHAR(255),
"
"                                                        SM_CH_PROD_ID         CHAR(255),
"
"                                                        SM_CH_PROD_REV        CHAR(255),
"
"                                                        SM_QTY                CHAR(255)
"
"                                                        )
"
"                                                          )
"
"                                           LOCATION ('''
"
"         || p_fname
"
"         || ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      /*DELETE cust_schd_mig_ln
"
"       WHERE csmln_bu = p_bu
"
"         AND csmln_plnt = p_plnt
"
"         AND csmln_doc_no = p_doc_no;*/
"
"
"
"      v_sql :=
"
"         'INSERT INTO PROD_TRAD_PARTS_COVERED (PTPC_BU,
"
"                                        PTPC_PROD_ID,
"
"                                        PTPC_PROD_REV,
"
"                                        PTPC_TRAD_PROD_ID,
"
"                                        PTPC_TRAD_PROD_REV,
"
"                                        PTPC_QTY,
"
"                                        PTPC_CRE_BY,
"
"                                        PTPC_CRE_DATE)SELECT '''
"
"         || p_bu
"
"         || ''',
"
"                                                              SM_PAR_PROD_ID,
"
"                                                              SM_PAR_PROD_REV,
"
"                                                              SM_CH_PROD_ID,
"
"                                                              SM_CH_PROD_REV,
"
"                                                              SM_QTY,
"
"                                                              '''
"
"         || p_user
"
"         || ''',
"
"                                                              SYSDATE
"
"                                                              FROM SCM_MIGRATION';
"
"
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM'||'\'||v_sql);
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      COMMIT;
"
"   END proc_ins_item_part_inbuilt;
"
"
"
"   PROCEDURE proc_ins_item_avg_cons_qty (p_bu       VARCHAR2,
"
"                                         p_fname    VARCHAR2,
"
"                                         p_sep      VARCHAR2,
"
"                                         p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (1000);
"
"   BEGIN
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
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      v_sql :=
"
"         'CREATE TABLE SCM_MIGRATION(SM_PLNT   VARCHAR2(10),
"
"                                                      SM_PROD_ID VARCHAR2(25),
"
"                                                      SM_PROD_REV NUMBER(5),
"
"                                                      SM_QTY NUMBER(12,3)
"
"                                                      )
"
"                                          ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                 ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                           SKIP 1
"
"                                                          FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (SM_PLNT        CHAR(255),
"
"                                                           SM_PROD_ID       CHAR(255),
"
"                                                           SM_PROD_REV         CHAR(255),
"
"                                                           SM_QTY        CHAR(255)
"
"                                                           )
"
"                                                             )
"
"                                              LOCATION ('''
"
"         || p_fname
"
"         || ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      /*DELETE cust_schd_mig_ln
"
"       WHERE csmln_bu = p_bu
"
"         AND csmln_plnt = p_plnt
"
"         AND csmln_doc_no = p_doc_no;*/
"
"
"
"      v_sql :=
"
"         'INSERT INTO PROD_AVG_CONS_QTY (PACQ_BU,
"
"                                  PACQ_PLNT,
"
"                                  PACQ_PROD_ID,
"
"                                  PACQ_PROD_REV,
"
"                                  PACQ_CONS_QTY,
"
"                                  PACQ_CRE_BY,
"
"                                  PACQ_CRE_DATE)SELECT ''' || p_bu
"
"         || ''',
"
"                                                                 SM_PLNT,
"
"                                                                 SM_PROD_ID,
"
"                                                                 SM_PROD_REV,
"
"                                                                 SM_QTY,
"
"                                                                 '''
"
"         || p_user
"
"         || ''',
"
"                                                                 SYSDATE
"
"                                                                 FROM SCM_MIGRATION';
"
"
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM'||'\'||v_sql);
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      COMMIT;
"
"   END proc_ins_item_avg_cons_qty;
"
"
"
"   PROCEDURE proc_ins_cast_item_weight (p_bu       VARCHAR2,
"
"                                        p_fname    VARCHAR2,
"
"                                        p_sep      VARCHAR2,
"
"                                        p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (1000);
"
"   BEGIN
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
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      v_sql :=
"
"         'CREATE TABLE SCM_MIGRATION(SM_PROD_ID   VARCHAR2(25),
"
"                             SM_PROD_REV  NUMBER(5),
"
"                             SM_PLAN_UOM  VARCHAR2(5),
"
"                             SM_MIN_GRN_WT  NUMBER(7,2),
"
"                             SM_MAX_GRN_WT  NUMBER(7,2),
"
"                             SM_MIN_DRY_WT  NUMBER(7,2),
"
"                             SM_MAX_DRY_WT  NUMBER(7,2),
"
"                             SM_CAVITY  NUMBER(3),
"
"                             SM_BOX_TYPE  VARCHAR2(10),
"
"                             SM_PER_BOX  NUMBER(12,3),
"
"                             SM_PER_TRAY  NUMBER(12,3)
"
"                                                )
"
"                                          ORGANIZATION EXTERNAL
"
"                                          (TYPE ORACLE_LOADER
"
"                                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                 ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                           SKIP 1
"
"                                                          FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (SM_PROD_ID       CHAR(255),
"
"                                          SM_PROD_REV      CHAR(255),
"
"                                          SM_PLAN_UOM      CHAR(255),
"
"                                          SM_MIN_GRN_WT    CHAR(255),
"
"                                          SM_MAX_GRN_WT    CHAR(255),
"
"                                          SM_MIN_DRY_WT    CHAR(255),
"
"                                          SM_MAX_DRY_WT    CHAR(255),
"
"                                          SM_CAVITY        CHAR(255),
"
"                                          SM_BOX_TYPE      CHAR(255),
"
"                                          SM_PER_BOX       CHAR(255),
"
"                                          SM_PER_TRAY    CHAR(255)
"
"                                                           )
"
"                                                             )
"
"                         LOCATION ('''
"
"         || p_fname
"
"         || ''')) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      /*DELETE cust_schd_mig_ln
"
"       WHERE csmln_bu = p_bu
"
"         AND csmln_plnt = p_plnt
"
"         AND csmln_doc_no = p_doc_no;*/
"
"
"
"
"
"      v_sql :=
"
"         'INSERT INTO CAST_PROD_WEIGHT (CPW_BU,
"
"                                 CPW_PROD_ID,
"
"                                 CPW_PROD_REV,
"
"                                 CPW_MIN_STD_GRN_WT,
"
"                                 CPW_MAX_STD_GRN_WT,
"
"                                 CPW_MIN_STD_DRY_WT,
"
"                                 CPW_MAX_STD_DRY_WT,
"
"                                 CPW_CRE_BY,
"
"                                 CPW_CRE_DATE,
"
"                                 CPW_UPD_BY,
"
"                                 CPW_UPD_DATE,
"
"                                 CPW_NO_OF_CAVITY,
"
"                                 CPW_PLAN_UOM,
"
"                                 CPW_BOX_TYPE,
"
"                                 CPW_QTY_PER_BOX,
"
"                                 CPW_QTY_PER_TRAY)SELECT ''' || p_bu
"
"         || ''',
"
"                                                                 SM_PROD_ID,
"
"                                                                 SM_PROD_REV,
"
"                                                                 SM_MIN_GRN_WT,
"
"                                                                 SM_MAX_GRN_WT,
"
"                                                                 SM_MIN_DRY_WT,
"
"                                                                 SM_MAX_DRY_WT,
"
"                                                                 '''
"
"         || p_user
"
"         || ''',
"
"                                                                 SYSDATE,
"
"                                                                 NULL,
"
"                                                                 NULL,
"
"                                                                 SM_CAVITY,
"
"                                                                 SM_PLAN_UOM,
"
"                                                                 SM_BOX_TYPE,
"
"                                                                 SM_PER_BOX,
"
"                                                                 SM_PER_TRAY
"
"                                                                 FROM SCM_MIGRATION';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      COMMIT;
"
"   END proc_ins_cast_item_weight;
"
"
"
"   PROCEDURE proc_ins_admin_cost_acct_group (p_bu       VARCHAR2,
"
"                                             p_fname    VARCHAR2,
"
"                                             p_sep      VARCHAR2,
"
"                                             p_user     VARCHAR2)
"
"   AS
"
"      v_sql           VARCHAR2 (4000);
"
"      v_fpath         VARCHAR2 (200);
"
"      v_max_id        VARCHAR2 (5);
"
"
"
"      TYPE typ_ins IS RECORD (SM_ACCT_GRP_DESC VARCHAR2 (50));
"
"
"
"      TYPE typ_ins_det IS TABLE OF typ_ins
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      cr_st           typ_ins_det;
"
"
"
"      TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"      c_st            typ_ref_cur;
"
"
"
"      indx            NUMBER := 1;
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"            'CREATE TABLE scm_migration(SM_ACCT_GRP_DESC VARCHAR2(50))
"
"   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"   DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"   ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"   SKIP 1
"
"   FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"   MISSING FIELD VALUES ARE NULL
"
"   REJECT ROWS WITH ALL NULL FIELDS
"
"   (SM_ACCT_GRP_DESC  CHAR(255))
"
"   )
"
"   LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
"   ) REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      BEGIN
"
"         OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"
"
"         LOOP
"
"            FETCH c_st INTO cr_st (indx);
"
"
"
"            indx := indx + 1;
"
"            EXIT WHEN c_st%NOTFOUND;
"
"         END LOOP;
"
"
"
"         CLOSE c_st;
"
"
"
"         FOR indx IN 1 .. cr_st.COUNT
"
"         LOOP
"
"            SELECT MAX (PACAG_GRP_ID)
"
"              INTO v_max_id
"
"              FROM PROD_ADMIN_COST_ACCT_GRP
"
"             WHERE PACAG_BU = p_bu;
"
"
"
"            INSERT INTO PROD_ADMIN_COST_ACCT_GRP (PACAG_BU,
"
"                                                  PACAG_GRP_ID,
"
"                                                  PACAG_GRP_DESC,
"
"                                                  PACAG_CRE_BY,
"
"                                                  PACAG_CRE_DATE,
"
"                                                  PACAG_UPD_BY,
"
"                                                  PACAG_UPD_DATE)
"
"                 VALUES (p_bu,
"
"                         FUNC_GET_NEXT_ID (v_max_id),
"
"                         CR_ST (INDX).SM_ACCT_GRP_DESC,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         NULL,
"
"                         NULL);
"
"         END LOOP;
"
"      END;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      COMMIT;
"
"   END proc_ins_admin_cost_acct_group;
"
"
"
"   PROCEDURE proc_ins_prod_deflt_mfg_entity (p_bu       VARCHAR2,
"
"                                             p_fname    VARCHAR2,
"
"                                             p_sep      VARCHAR2,
"
"                                             p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (200);
"
"   --v_max_id   VARCHAR2 (5);
"
"
"
"
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"            'CREATE TABLE scm_migration(SM_PDME_PROD_ID VARCHAR2 (25),
"
"    SM_PDME_DFLT_MFG_ENTITY       VARCHAR2 (25))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_PDME_PROD_ID CHAR(255),SM_PDME_DFLT_MFG_ENTITY  CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      v_sql :=
"
"         'Insert into prod_deflt_mfg_entity
"
"   (PDME_BU, PDME_PROD_ID, PDME_PROD_REV, PDME_DFLT_MFG_ENTITY, PDME_CRE_BY, PDME_CRE_DATE) SELECT '''
"
"         || p_bu
"
"         || ''',SM_PDME_PROD_ID,(SELECT PROD_REV FROM PRODUCTS WHERE PROD_ID = SM_PDME_PROD_ID AND PROD_BU = '''
"
"         || p_bu
"
"         || '''),
"
"                         SM_PDME_DFLT_MFG_ENTITY,'''
"
"         || p_user
"
"         || ''',SYSDATE
"
"               FROM scm_migration';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      COMMIT;
"
"   END proc_ins_prod_deflt_mfg_entity;
"
"
"
" /*PROCEDURE proc_ins_cast_ally_acct_grp (p_bu       VARCHAR2,
"
"                                          p_fname    VARCHAR2,
"
"                                          p_sep      VARCHAR2,
"
"                                          p_user     VARCHAR2)
"
"   AS
"
"      v_sql           VARCHAR2 (4000);
"
"      v_fpath         VARCHAR2 (200);
"
"      v_max_id        VARCHAR2 (5);
"
"
"
"      TYPE type_ins IS RECORD (SM_CAAG_GRP_DESC VARCHAR2 (50));
"
"
"
"      TYPE type_ins_dtl IS TABLE OF type_ins
"
"                              INDEX BY PLS_INTEGER;
"
"
"
"      CR_SM           type_ins_dtl;
"
"
"
"      TYPE type_ref_crsr IS REF CURSOR;
"
"
"
"      C_SM            type_ref_crsr;
"
"
"
"
"
"      indx            NUMBER := 1;
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"            'CREATE TABLE scm_migration(SM_CAAG_GRP_DESC VARCHAR2 (50))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_CAAG_GRP_DESC CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"      BEGIN
"
"         OPEN C_SM FOR 'SELECT * FROM SCM_MIGRATION';
"
"
"
"         LOOP
"
"            FETCH C_SM INTO CR_SM (INDX);
"
"
"
"            INDX := INDX + 1;
"
"            EXIT WHEN C_SM%NOTFOUND;
"
"         END LOOP;
"
"
"
"         CLOSE C_SM;
"
"
"
"         FOR indx IN 1 .. CR_SM.COUNT
"
"         LOOP
"
"            SELECT MAX (CAAG_GRP_ID)
"
"              INTO v_max_id
"
"              FROM CAST_ALLY_ACCT_GRP
"
"             WHERE CAAG_BU = p_bu;
"
"
"
"            INSERT INTO CAST_ALLY_ACCT_GRP (CAAG_BU,
"
"                                                    CAAG_GRP_ID,
"
"                                                    CAAG_GRP_DESC,
"
"                                                    CAAG_CRE_BY,
"
"                                                    CAAG_CRE_DATE)
"
"                 VALUES (P_BU,
"
"                         FUNC_GET_NEXT_ID (v_max_id),
"
"                         cr_sm (indx).SM_CAAG_GRP_DESC,
"
"                         P_USER,
"
"                         SYSDATE);
"
"         END LOOP;
"
"      END;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      COMMIT;
"
"   END proc_ins_cast_ally_acct_grp;*/
"
"
"
"   PROCEDURE proc_ins_acct_grp_asso (p_bu       VARCHAR2,
"
"                                     p_fname    VARCHAR2,
"
"                                     p_sep      VARCHAR2,
"
"                                     p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (200);
"
"   --v_max_id   VARCHAR2 (5);
"
"
"
"
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"            'CREATE TABLE scm_migration(SM_CAAGA_GRP_DESC VARCHAR2 (50),
"
"    SM_CAAGA_ACCT_ID       VARCHAR2 (10))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_CAAGA_GRP_DESC CHAR(255),SM_CAAGA_ACCT_ID  CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      v_sql :=
"
"         'Insert into cast_ally_acct_grp_asso
"
"   (CAAGA_BU, CAAGA_GRP_ID, CAAGA_ACCT_ID, CAAGA_CRE_BY, CAAGA_CRE_DATE) SELECT '''
"
"         || p_bu
"
"         || ''',(SELECT CAAG_GRP_ID FROM CAST_ALLY_ACCT_GRP WHERE UPPER(CAAG_GRP_DESC) = UPPER(SM_CAAGA_GRP_DESC) AND CAAG_BU = '''
"
"         || p_bu
"
"         || '''),
"
"          SM_CAAGA_ACCT_ID,'''
"
"         || p_user
"
"         || ''',SYSDATE
"
"               FROM scm_migration';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      COMMIT;
"
"   END proc_ins_acct_grp_asso;
"
"
"
"   PROCEDURE proc_ins_adm_grup_assct (p_bu           VARCHAR2,
"
"                                      p_fname        VARCHAR2,
"
"                                      p_sep          VARCHAR2,
"
"                                      p_user         VARCHAR2,
"
"                                      p_result   OUT VARCHAR2)
"
"   IS
"
"      v_mftr_id     VARCHAR2 (10);
"
"      v_sql         VARCHAR2 (4000);
"
"      v_cnt         NUMBER;
"
"
"
"      TYPE prod_ad_cost_asso IS RECORD
"
"      (
"
"         paca_cost_desc    VARCHAR2 (150),
"
"         paca_account_id   VARCHAR2 (10)
"
"      );
"
"
"
"      TYPE p_cost_asso IS TABLE OF prod_ad_cost_asso
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      r_cost_asso   p_cost_asso;
"
"   BEGIN
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      p_result := 'N';
"
"      v_sql :=
"
"         'CREATE TABLE SCM_MIGRATION
"
"                                                  ( paca_cost_desc        VARCHAR2(150),
"
"                                                paca_account_id        VARCHAR2(10)
"
"                                               )
"
"                                       ORGANIZATION EXTERNAL(
"
"                                         TYPE ORACLE_LOADER
"
"                                             DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                             ACCESS PARAMETERS(
"
"                                                   RECORDS DELIMITED BY NEWLINE
"
"                                                   SKIP 1
"
"                                                   FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"                                                   MISSING FIELD VALUES ARE NULL
"
"                                                   REJECT ROWS WITH ALL NULL FIELDS
"
"                                                   (
"
"                                                    paca_cost_desc          CHAR(255),
"
"                                                    paca_account_id              CHAR(255)
"
"                                                    )
"
"                                                                            )
"
"                                                 LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
"                                                 ) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"      EXECUTE IMMEDIATE 'SELECT paca_cost_desc,
"
"                                   paca_account_id
"
"                         FROM SCM_MIGRATION
"
"                        GROUP BY paca_cost_desc,
"
"                              paca_account_id
"
"                         ORDER BY 1'
"
"         BULK COLLECT INTO r_cost_asso;
"
"
"
"      FOR i IN r_cost_asso.FIRST .. r_cost_asso.LAST
"
"      LOOP
"
"         BEGIN
"
"            SELECT pacag_grp_id
"
"              INTO v_mftr_id
"
"              FROM prod_admin_cost_acct_grp
"
"             WHERE pacag_bu = p_bu
"
"                   AND pacag_grp_desc = r_cost_asso (i).paca_cost_desc;
"
"         EXCEPTION
"
"            WHEN NO_DATA_FOUND
"
"            THEN
"
"               RAISE_APPLICATION_ERROR (
"
"                  -20696,
"
"                  'SFC' || ' / ' || r_cost_asso (i).paca_cost_desc);
"
"         END;
"
"
"
"         INSERT INTO PROD_ADMIN_COST_ACCT_GRP_ASSO (PACAGA_BU,
"
"                                                    PACAGA_GRP_ID,
"
"                                                    PACAGA_ACCT_ID,
"
"                                                    PACAGA_CRE_BY,
"
"                                                    PACAGA_CRE_DATE,
"
"                                                    PACAGA_UPD_BY,
"
"                                                    PACAGA_UPD_DATE)
"
"              VALUES (p_bu,
"
"                      v_mftr_id,
"
"                      r_cost_asso (i).paca_account_id,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      NULL,
"
"                      NULL);
"
"	p_result := 'Y';
"
"      END LOOP;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"   END proc_ins_adm_grup_assct;
"
"
"
"   PROCEDURE proc_ins_prod_rm_grade_asso (p_bu       VARCHAR2,
"
"                                          p_fname    VARCHAR2,
"
"                                          p_sep      VARCHAR2,
"
"                                          p_user     VARCHAR2
"
"                                          )
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (200);
"
"
"
"   BEGIN
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
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql :=
"
"        'CREATE TABLE scm_migration(sm_prga_fg_prod_id 		VARCHAR2(25),
"
"				    sm_prga_rm_prod_id       	VARCHAR2(25),
"
"				    sm_prga_type		VARCHAR2(1),
"
"				    sm_prga_deflt_flag 		VARCHAR2(1))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''
"
"         || p_sep
"
"         || '''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(sm_prga_fg_prod_id 	CHAR(255),
"
" sm_prga_rm_prod_id  	CHAR(255),
"
" sm_prga_type		CHAR(255),
"
" sm_prga_deflt_flag 	CHAR(255))
"
")
"
"LOCATION ('''
"
"         || p_fname
"
"         || ''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      v_sql :=
"
"         'Insert into prod_rm_grade_asso
"
"				   (prga_bu,
"
"				    prga_fg_prod_id,
"
"				    prga_fg_prod_rev,
"
"				    prga_rm_prod_id,
"
"				    prga_rm_prod_rev,
"
"				    prga_deflt_flag,
"
"				    prga_type,
"
"				    prga_cre_by,
"
"				    prga_cre_date
"
"				    )
"
"				   SELECT '''|| p_bu ||''',
"
"					  sm_prga_fg_prod_id,
"
"					  (SELECT prod_rev FROM products WHERE prod_id = sm_prga_fg_prod_id AND prod_bu = '''|| p_bu ||'''),
"
"					  sm_prga_rm_prod_id,
"
"					  (SELECT prod_rev FROM products WHERE prod_id = sm_prga_rm_prod_id AND prod_bu = '''|| p_bu ||'''),
"
"					  sm_prga_deflt_flag,
"
"					  sm_prga_type,
"
"					  '''|| p_user ||''',
"
"					  SYSDATE
"
"				     FROM scm_migration';
"
"
"
"      EXECUTE IMMEDIATE v_sql;
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      COMMIT;
"
"
"
"   END proc_ins_prod_rm_grade_asso;
"
"
"
"   PROCEDURE proc_ins_term_cond_group(p_bu       VARCHAR2,
"
"                                           p_fname    VARCHAR2,
"
"                                           p_sep      VARCHAR2,
"
"                                           p_user     VARCHAR2)
"
"      AS
"
"        v_sql      VARCHAR2 (4000);
"
"        v_fpath    VARCHAR2 (200);
"
"        v_max_id   VARCHAR2 (5);
"
"
"
"          TYPE typ_ins IS RECORD
"
"            (
"
"             SM_GRP_DESC   VARCHAR2(50),
"
"             SM_PRINT_SEQ       NUMBER(5)
"
"            );
"
"
"
"            TYPE typ_ins_det IS TABLE OF typ_ins
"
"                                   INDEX BY PLS_INTEGER;
"
"
"
"            cr_st      typ_ins_det;
"
"
"
"            TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"            c_st       typ_ref_cur;
"
"
"
"            indx       NUMBER := 1;
"
"      BEGIN
"
"         SELECT directory_path
"
"           INTO v_fpath
"
"           FROM dba_directories
"
"          WHERE directory_name = 'FILE_ATTACH_DIR';
"
"
"
"         proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"         v_sql :=
"
"            'CREATE TABLE SCM_MIGRATION(SM_GRP_DESC   VARCHAR2(50),
"
"                                        SM_PRINT_SEQ    NUMBER(5)
"
"                                        )
"
"                                 ORGANIZATION EXTERNAL
"
"                                 (TYPE ORACLE_LOADER
"
"                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                        ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                  SKIP 1
"
"                                                 FIELDS TERMINATED BY '''||p_sep||'''
"
"                                                 MISSING FIELD VALUES ARE NULL
"
"                                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                                 (SM_GRP_DESC        CHAR(255),
"
"                                                  SM_PRINT_SEQ       CHAR(255)
"
"                                                  )
"
"                                                    )
"
"                                     LOCATION ('''||p_fname|| ''')) REJECT LIMIT UNLIMITED';
"
"
"
"         EXECUTE IMMEDIATE v_sql;
"
"
"
"         BEGIN
"
"            OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"
"
"            LOOP
"
"               FETCH c_st INTO cr_st (indx);
"
"
"
"               indx := indx + 1;
"
"               EXIT WHEN c_st%NOTFOUND;
"
"            END LOOP;
"
"
"
"            CLOSE c_st;
"
"
"
"            FOR indx IN 1 .. cr_st.COUNT
"
"             LOOP
"
"              SELECT MAX(TAG_GRP_ID)
"
"              INTO v_max_id
"
"              FROM TNC_ATTR_GROUPS
"
"              WHERE TAG_BU = P_BU;
"
"
"
"             INSERT INTO TNC_ATTR_GROUPS (TAG_BU,
"
"                             TAG_GRP_ID,
"
"                             TAG_GRP_DESC,
"
"                             TAG_PRINT_SEQ,
"
"                             TAG_CRE_BY,
"
"                             TAG_CRE_DATE,
"
"                             TAG_UPD_BY,
"
"                             TAG_UPD_DATE)
"
"                          VALUES(p_bu,
"
"                                              FUNC_GET_NEXT_ID(v_max_id),
"
"                                              CR_ST(INDX).SM_GRP_DESC,
"
"                                              CR_ST(INDX).SM_PRINT_SEQ,
"
"                                              p_user,
"
"                                              SYSDATE,
"
"                                                 NULL,
"
"                                                 NULL);
"
"            END LOOP;
"
"        END;
"
"         --RAISE_APPLICATION_ERROR(-20999,'HRM'||'\'||v_sql);
"
"         proc_chk_migrate_table('SCM_MIGRATION');
"
"        COMMIT;
"
"   END proc_ins_term_cond_group;
"
"
"
"      PROCEDURE proc_ins_trm_and_cond(p_bu           VARCHAR2,
"
"                                         p_fname        VARCHAR2,
"
"                                         p_sep          VARCHAR2,
"
"                                         p_user         VARCHAR2,
"
"                                         p_result   OUT VARCHAR2)
"
"      IS
"
"         v_max_id      VARCHAR2(10);
"
"         v_grp_id     VARCHAR2(10);
"
"         v_sql         VARCHAR2(4000);
"
"
"
"         TYPE prod_trm_cond IS RECORD
"
"         (
"
"            ptc_attr_desc     VARCHAR2(50),
"
"            ptc_attr_ext_desc  VARCHAR2(200),
"
"            ptc_attr_type      VARCHAR2(50),
"
"            ptc_attr_grp_desc VARCHAR2(50),
"
"            ptc_attr_print_seq NUMBER(5)
"
"         );
"
"
"
"         TYPE p_ter_con IS TABLE OF prod_trm_cond INDEX BY PLS_INTEGER;
"
"
"
"         r_ter_con   p_ter_con;
"
"	 v_cnt	NUMBER;
"
"      BEGIN
"
"         proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"         p_result := 'N';
"
"         v_sql :=
"
"            'CREATE TABLE SCM_MIGRATION(ptc_attr_desc        VARCHAR2(50),
"
"                                        ptc_attr_ext_desc    VARCHAR2(200),
"
"                                        ptc_attr_type        VARCHAR2(50),
"
"                                        ptc_attr_grp_desc    VARCHAR2(50),
"
"                                        ptc_attr_print_seq   NUMBER(5)
"
"                                          )
"
"                                          ORGANIZATION EXTERNAL(
"
"                                            TYPE ORACLE_LOADER
"
"                                                DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                ACCESS PARAMETERS(
"
"                                                      RECORDS DELIMITED BY NEWLINE
"
"                                                      SKIP 1
"
"                                                      FIELDS TERMINATED BY '''||p_sep||'''
"
"                                                      MISSING FIELD VALUES ARE NULL
"
"                                                      REJECT ROWS WITH ALL NULL FIELDS
"
"                                                      (
"
"                                                       ptc_attr_desc          CHAR(255),
"
"                                                       ptc_attr_ext_desc      CHAR(255),
"
"                                                       ptc_attr_type          CHAR(255),
"
"                                                       ptc_attr_grp_desc      CHAR(255),
"
"                                                       ptc_attr_print_seq      CHAR(255)
"
"                                                       )
"
"                                                        )
"
"                                                    LOCATION ('''||p_fname|| ''')
"
"                                                    ) REJECT LIMIT UNLIMITED';
"
"         EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"         EXECUTE IMMEDIATE 'SELECT ptc_attr_desc,
"
"                                   ptc_attr_ext_desc,
"
"                                   ptc_attr_type,
"
"                                   ptc_attr_grp_desc,
"
"                                   ptc_attr_print_seq
"
"                            FROM SCM_MIGRATION
"
"                           GROUP BY ptc_attr_desc,
"
"                                    ptc_attr_ext_desc,
"
"                                    ptc_attr_type,
"
"                                    ptc_attr_grp_desc,
"
"                                    ptc_attr_print_seq
"
"                            ORDER BY 1'
"
"            BULK COLLECT INTO r_ter_con;
"
"
"
"       FOR i IN r_ter_con.FIRST .. r_ter_con.LAST
"
"        LOOP
"
"            BEGIN
"
"
"
"	    IF r_ter_con(i).ptc_attr_desc IS NULL THEN
"
"	    RAISE_APPLICATION_ERROR (-20999,'Attribute Not found.');
"
"	    END IF;
"
"
"
"               SELECT MAX(TA_ATTR_ID)
"
"                INTO v_max_id
"
"               FROM TNC_ATTR
"
"               WHERE TA_BU = P_BU;
"
"
"
"               SELECT tag_grp_id
"
"                 INTO v_grp_id
"
"                 FROM tnc_attr_groups
"
"                WHERE tag_bu = p_bu
"
"                  AND tag_grp_desc = r_ter_con(i).ptc_attr_grp_desc;
"
"            EXCEPTION
"
"               WHEN NO_DATA_FOUND
"
"               THEN
"
"		   RAISE_APPLICATION_ERROR (-20999,'Group Not found.' || ' / ' || r_ter_con(i).ptc_attr_grp_desc);
"
"            END;
"
"
"
"	    IF r_ter_con(i).ptc_attr_desc IS NOT NULL THEN
"
"	      SELECT COUNT(*) INTO v_cnt
"
"	        FROM tnc_attr
"
"	       WHERE ta_bu = p_bu
"
"	         AND UPPER(ta_attr_desc) = UPPER(r_ter_con(i).ptc_attr_desc);
"
"              IF v_cnt >0 THEN
"
"	       Raise_Application_Error(-20999,'Attribute already found.');
"
"	      END IF;
"
"	    END IF;
"
"
"
"            INSERT INTO TNC_ATTR (TA_BU,
"
"                              TA_ATTR_ID,
"
"                              TA_ATTR_DESC,
"
"                              TA_ATTR_TYPE,
"
"                              TA_PRINT_SEQ,
"
"                              TA_GRP_ID,
"
"                              TA_CRE_BY,
"
"                              TA_CRE_DATE,
"
"                              TA_UPD_BY,
"
"                              TA_UPD_DATE,
"
"                                  TA_ATTR_EXT_DESC)
"
"                                            VALUES (p_bu,
"
"                                                    func_get_next_id(v_max_id),
"
"                                                    UPPER(r_ter_con(i).ptc_attr_desc),
"
"                                                    DECODE(r_ter_con(i).ptc_attr_type,'Destination','A','Delivery Schedule','B','Packing','C','Forwarding','D','Freight','E','Insurance','F','Excise Duty','G','Price Term','H','Load Point','I',
"
"                                   'VAT / CST','J','Payment Detail','K','Special Instruction','L','Service Charge','M','Warranty','N','Remarks','O','Certification Type','P','LD Class','Q',
"
"                                                           'Transporter','R','Gate Pass','S','Unload Point','T','Tolerance','U','Inspection','V'),
"
"                                                    r_ter_con(i).ptc_attr_print_seq,
"
"                                                    v_grp_id,
"
"                                                    p_user,
"
"                                                    SYSDATE,
"
"                                                    NULL,
"
"                                                    NULL,
"
"                                                    r_ter_con(i).ptc_attr_ext_desc);
"
"           END LOOP;
"
"
"
"         proc_chk_migrate_table ('SCM_MIGRATION');
"
"         p_result := 'Y';
"
"   /*EXCEPTION WHEN OTHERS THEN
"
"     p_result :='N';*/
"
"   END proc_ins_trm_and_cond;
"
"
"
"/* ************** Risk Factor ********************** */
"
"PROCEDURE proc_ins_opport_risk_factor (p_bu       VARCHAR2,
"
"                                       p_fname    VARCHAR2,
"
"                                       p_sep      VARCHAR2,
"
"                                       p_user     VARCHAR2)
"
"   AS
"
"      v_sql     VARCHAR2 (4000);
"
"      v_fpath   VARCHAR2 (200);
"
"
"
"TYPE typ_ins IS RECORD
"
"      (
"
"         sm_risk_factor_desc   VARCHAR2 (250)
"
"      );
"
"
"
"      TYPE typ_ins_det IS TABLE OF typ_ins
"
"                             INDEX BY PLS_INTEGER;
"
"
"
"      cr_st      typ_ins_det;
"
"
"
"      TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"      c_st       typ_ref_cur;
"
"
"
"      indx       NUMBER := 1;
"
"      v_max_id	 VARCHAR2(10);
"
"   BEGIN
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
"      --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"      v_sql := 'CREATE TABLE scm_migration(sm_risk_factor_desc 	VARCHAR2(250))
"
"               ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                     DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                     ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                       SKIP 1
"
"                                                       FIELDS TERMINATED BY '''
"
"                                                       || p_sep
"
"                                                       || '''
"
"                                                       MISSING FIELD VALUES ARE NULL
"
"                                                       REJECT ROWS WITH ALL NULL FIELDS
"
"                                                       (sm_risk_factor_desc  CHAR(255)
"
"				        	       )
"
"                                                       )
"
"                                     LOCATION ('''
"
"                                              || p_fname
"
"                                              || ''')
"
"                                     ) REJECT LIMIT UNLIMITED';
"
"      EXECUTE IMMEDIATE v_sql;
"
"      --RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'/'||'/'||p_id||'/'||func_get_next_id(p_id)||'/'||p_user);
"
"
"
"    BEGIN
"
"         OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"
"
"         LOOP
"
"            FETCH c_st INTO cr_st (indx);
"
"
"
"            indx := indx + 1;
"
"            EXIT WHEN c_st%NOTFOUND;
"
"         END LOOP;
"
"
"
"         CLOSE c_st;
"
"
"
"         FOR indx IN 1 .. cr_st.COUNT
"
"         LOOP
"
"           SELECT NVL(MAX(TO_NUMBER(ora_risk_factor_id)),'0001')
"
"             INTO v_max_id
"
"             FROM opport_risk_factors
"
"            WHERE ora_bu = p_bu;
"
"
"
"            INSERT INTO opport_risk_factors(ora_bu,
"
"                                            ora_risk_factor_id,
"
"                                            ora_risk_factor_desc,
"
"                                            ora_cre_by,
"
"                                            ora_cre_date
"
"					    )
"
"                                    VALUES (p_bu,
"
"                                            func_get_next_id(v_max_id),
"
"                                            CR_ST(INDX).sm_risk_factor_desc,
"
"                                            p_user,
"
"                                            SYSDATE);
"
"         END LOOP;
"
"      END;
"
"
"
"    /*v_sql :='INSERT INTO opport_risk_factors(ora_bu,
"
"                                               ora_risk_factor_id,
"
"                                               ora_risk_factor_desc,
"
"                                               ora_cre_by,
"
"                                               ora_cre_date)
"
"                                               SELECT '''|| p_bu
"
"                                                      || ''',func_get_next_id('''
"
"                                                      || p_id
"
"                                                      || '''),
"
"                                                       sm_risk_factor_desc,
"
"                                                       '''
"
"                                                      || p_user
"
"                                                      || ''',SYSDATE
"
"                                                 FROM scm_migration';
"
"
"
"      EXECUTE IMMEDIATE v_sql;*/
"
"
"
"      proc_chk_migrate_table ('SCM_MIGRATION');
"
"
"
"      COMMIT;
"
"END proc_ins_opport_risk_factor;
"
"
"
"END pkg_icm_migration;"
/
