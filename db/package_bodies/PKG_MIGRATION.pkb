CREATE OR REPLACE
"PACKAGE BODY pkg_migration
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
"PROCEDURE proc_mig_stores(p_bu        VARCHAR2,
"
"                          p_fname    VARCHAR2,
"
"              p_user    VARCHAR2,
"
"              p_res        OUT    VARCHAR2
"
"             )
"
"AS
"
"
"
"CURSOR c_ul(c_plnt    VARCHAR2,
"
"            c_loc_id    VARCHAR2) IS
"
"SELECT *
"
"  FROM bus_unit_plants_loc_dtls
"
" WHERE bupld_bu = p_bu
"
"   AND bupld_plnt = c_plnt
"
"   AND bupld_loc_id = c_loc_id;
"
"
"
"r_ul    c_ul%ROWTYPE;
"
"
"
"TYPE typ_rec_stores IS RECORD (SM_PLNT        VARCHAR2(10),
"
"                               SM_PLNT_LOC_ID    VARCHAR2(10),
"
"                   SM_STORE_ID    VARCHAR2(10),
"
"                   SM_STORE_DESC    VARCHAR2(100),
"
"                   SM_TYPE        VARCHAR2(100),
"
"                   SM_BENF_ID    VARCHAR2(10),
"
"                   SM_LOCATOR    VARCHAR2(1),
"
"                   SM_SALEABLE    VARCHAR2(1),
"
"                   SM_JOURNAL    VARCHAR2(1),
"
"                   SM_BANK_STMT    VARCHAR2(1),
"
"                   SM_DFLT_WIP    VARCHAR2(1)
"
"                  );
"
"TYPE typ_stores IS TABLE OF typ_rec_stores INDEX BY PLS_INTEGER;
"
"r_st    typ_stores;
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"v_indx        NUMBER := 1;
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(1000);
"
"
"
"v_emp_id    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"v_type        VARCHAR2(1);
"
"v_inv_id    VARCHAR2(10);
"
"
"
"BEGIN
"
"
"
" p_res := 'N';
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(SM_PLNT        VARCHAR2(10),
"
"                                       SM_PLNT_LOC_ID    VARCHAR2(10),
"
"                       SM_STORE_ID    VARCHAR2(10),
"
"                       SM_STORE_DESC    VARCHAR2(100),
"
"                       SM_TYPE        VARCHAR2(100),
"
"                       SM_BENF_ID    VARCHAR2(10),
"
"                       SM_LOCATOR    VARCHAR2(1),
"
"                       SM_SALEABLE    VARCHAR2(1),
"
"                       SM_JOURNAL    VARCHAR2(1),
"
"                       SM_BANK_STMT    VARCHAR2(1),
"
"                       SM_DFLT_WIP    VARCHAR2(1)
"
"                                      )
"
"                 ORGANIZATION EXTERNAL
"
"                 (TYPE ORACLE_LOADER
"
"               DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"               ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"               SKIP 1
"
"              FIELDS TERMINATED BY '','' OPTIONALLY ENCLOSED BY ''""''
"
"                  MISSING FIELD VALUES ARE NULL
"
"                  REJECT ROWS WITH ALL NULL FIELDS
"
"              (SM_PLNT        CHAR(255),
"
"           SM_PLNT_LOC_ID    CHAR(255),
"
"           SM_STORE_ID        CHAR(255),
"
"           SM_STORE_DESC    CHAR(255),
"
"           SM_TYPE        CHAR(255),
"
"           SM_BENF_ID        CHAR(255),
"
"           SM_LOCATOR        CHAR(255),
"
"           SM_SALEABLE        CHAR(255),
"
"           SM_JOURNAL        CHAR(255),
"
"           SM_BANK_STMT        CHAR(255),
"
"           SM_DFLT_WIP        CHAR(255)
"
"          ))
"
"                LOCATION ('''||p_fname||''')) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  OPEN c_st FOR 'SELECT *
"
"                   FROM scm_migration';
"
"  LOOP
"
"
"
"    FETCH c_st INTO r_st(v_indx);
"
"    EXIT WHEN c_st%NOTFOUND;
"
"   --  Raise_Application_Error(-20999,'HRM'||'~'||r_st(v_indx).sm_type);
"
"
"
"    OPEN c_ul(r_st(v_indx).sm_plnt,r_st(v_indx).sm_plnt_loc_id);
"
"    FETCH c_ul INTO r_ul;
"
"      IF c_ul%NOTFOUND THEN
"
"        Raise_Application_Error(-20999,'Plant Location not found.'||'-'||r_st(v_indx).sm_plnt||'-'||r_st(v_indx).sm_plnt_loc_id);
"
"      END IF;
"
"    CLOSE c_ul;
"
"
"
"    IF UPPER(r_st(v_indx).sm_type) = 'STANDARD' THEN
"
"      v_type := 'Y';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'REJECTION' THEN
"
"      v_type := 'J';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'SCRAP' THEN
"
"      v_type := 'S';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'WIP' THEN
"
"      v_type := 'W';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'INSPECTION' THEN
"
"      v_type := 'Q';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'REJECT' THEN
"
"      v_type := 'J';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'SUBCONTRACTOR' THEN
"
"      v_type := 'V';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'CUSTOMER' THEN
"
"     v_type := 'C';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'AOD' THEN
"
"     v_type := 'A';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'EXCESS' THEN
"
"     v_type := 'X';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'INWARD/INSPECTION' THEN
"
"     v_type := 'Q';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'PRE DISPATCH' THEN
"
"     v_type := 'T';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'FINAL INSPECTION' THEN
"
"     v_type := 'F';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'SAMPLE' THEN
"
"     v_type := 'B';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'VEHICLE' THEN
"
"     v_type := 'H';
"
"    ELSIF UPPER(r_st(v_indx).sm_type) = 'REPAIR' THEN
"
"     v_type := 'R';
"
"    ELSIF TRIM(UPPER(r_st(v_indx).sm_type)) = 'CUST. SERV. (DC)' THEN
"
"     v_type := 'E';
"
"    ELSIF TRIM(UPPER(r_st(v_indx).sm_type)) = 'EMP.(DC)' THEN
"
"     v_type := 'N';
"
"    ELSIF TRIM(UPPER(r_st(v_indx).sm_type)) = 'EMP.(GC)' THEN
"
"     v_type := 'L';
"
"     ELSIF TRIM(UPPER(r_st(v_indx).sm_type)) = 'R AND D' THEN
"
"     v_type := 'D';
"
"     ELSIF TRIM(UPPER(r_st(v_indx).sm_type)) = 'CUST. SERV. (GC)' THEN
"
"     v_type := 'G';
"
"      ELSIF TRIM(UPPER(r_st(v_indx).sm_type)) = 'DEMO/EXHIBITION' THEN
"
"     v_type := 'M';
"
"    ELSE
"
"      Raise_Application_Error(-20999,'Warehouse type not found.');
"
"    END IF;
"
"
"
"    IF TRIM(r_st(v_indx).sm_store_id) IS NULL THEN
"
"      Raise_Application_Error(-20999,'Warehouse ID must be entered.');
"
"    END IF;
"
"
"
"     IF r_st(v_indx).sm_store_desc IS NULL THEN
"
"      Raise_Application_Error(-20999,'Warehouse Desc. must be entered.');
"
"    END IF;
"
"
"
"    IF LENGTH(r_st(v_indx).sm_store_desc) > 30 THEN
"
"        Raise_Application_Error(-20999,'Warehouse Desc. allowed 30 characters only.');
"
"    END IF;
"
"
"
"    IF v_type ='V' AND r_st(v_indx).sm_benf_id IS NULL THEN
"
"      Raise_Application_Error(-20999,'Supplier must be entered.');
"
"    END IF;
"
"
"
"    IF v_type ='D' AND r_st(v_indx).sm_benf_id IS NULL THEN
"
"      Raise_Application_Error(-20999,'Department must be entered.');
"
"    END IF;
"
"
"
"    IF r_st(v_indx).sm_benf_id IS NOT NULL THEN
"
"    DECLARE
"
"      CURSOR c1 IS
"
"        SELECT store_id,description
"
"          FROM (SELECT description, store_id, issto
"
"              FROM (SELECT DECODE ((SELECT applctrl_desc_level
"
"                           FROM appl_control
"
"                          WHERE applctrl_bu = p_bu),
"
"                           1, suplr_name1,
"
"                           NVL (suplr_name2, suplr_name1))
"
"                      description,
"
"                       suplr_suplr_id store_id,
"
"                       'V' issto
"
"                  FROM suppliers
"
"                 WHERE suplr_bu = p_bu AND suplr_status = 'A'
"
"                UNION
"
"                SELECT DECODE (
"
"                      (SELECT applctrl_desc_level
"
"                         FROM appl_control
"
"                        WHERE applctrl_bu = p_bu),
"
"                      1, (   emp_first_name1
"
"                          || ' '
"
"                          || emp_middle_name1
"
"                          || ' '
"
"                          || emp_last_name1),
"
"                      (   emp_first_name2
"
"                       || ' '
"
"                       || emp_middle_name2
"
"                       || ' '
"
"                       || emp_last_name2))
"
"                      empname,
"
"                       emp_emp_id store_id,
"
"                       'N' issto
"
"                  FROM employees
"
"                 WHERE emp_bu = p_bu AND emp_status = 'A'
"
"                UNION
"
"                SELECT DECODE (
"
"                      (SELECT applctrl_desc_level
"
"                         FROM appl_control
"
"                        WHERE applctrl_bu = p_bu),
"
"                      1, (   emp_first_name1
"
"                          || ' '
"
"                          || emp_middle_name1
"
"                          || ' '
"
"                          || emp_last_name1),
"
"                      (   emp_first_name2
"
"                       || ' '
"
"                       || emp_middle_name2
"
"                       || ' '
"
"                       || emp_last_name2))
"
"                      empname,
"
"                       emp_emp_id store_id,
"
"                       'L' issto
"
"                  FROM employees
"
"                 WHERE emp_bu = p_bu AND emp_status = 'A'
"
"                UNION
"
"                SELECT DECODE ( (SELECT applctrl_desc_level
"
"                           FROM appl_control
"
"                          WHERE applctrl_bu = p_bu),
"
"                           1, suplr_name1,
"
"                           NVL (suplr_name2, suplr_name1))
"
"                      description,
"
"                       suplr_suplr_id store_id,
"
"                       'V' issto
"
"                  FROM suppliers
"
"                 WHERE     suplr_bu = p_bu
"
"                       AND suplr_status = 'A'
"
"                       AND suplr_party_type = 'C'
"
"                UNION
"
"                SELECT DECODE ( (SELECT applctrl_desc_level
"
"                           FROM appl_control
"
"                          WHERE applctrl_bu = p_bu),
"
"                           1, dept_name1,
"
"                           NVL (dept_name2, dept_name1))
"
"                      description,
"
"                       dept_id store_id,
"
"                       'D' issto
"
"                  FROM departments
"
"                 WHERE dept_bu = p_bu
"
"                       AND dept_plnt = r_st(v_indx).sm_plnt
"
"                UNION
"
"                SELECT DECODE ( (SELECT applctrl_desc_level
"
"                           FROM appl_control
"
"                          WHERE applctrl_bu = p_bu),
"
"                           1, prj_name1,
"
"                           NVL (prj_name2, prj_name1))
"
"                      description,
"
"                       prj_proj_id store_id,
"
"                       'P' issto
"
"                  FROM projects
"
"                 WHERE prj_bu = p_bu AND prj_status = 'A'
"
"                UNION
"
"                SELECT DECODE ( (SELECT applctrl_desc_level
"
"                           FROM appl_control
"
"                          WHERE applctrl_bu = p_bu),
"
"                           1, prj_name1,
"
"                           NVL (prj_name2, prj_name1))
"
"                      description,
"
"                       prj_proj_id store_id,
"
"                       'I' issto
"
"                  FROM projects
"
"                 WHERE prj_bu = p_bu AND prj_status = 'A'
"
"                UNION
"
"                SELECT tv_veh_desc1 description,
"
"                       tv_vehicle_id store_id,
"
"                       'H' issto
"
"                  FROM transport_vehicles
"
"                 WHERE tv_bu = p_bu
"
"                UNION
"
"                SELECT DECODE ( (SELECT applctrl_desc_level
"
"                           FROM appl_control
"
"                          WHERE applctrl_bu = p_bu),
"
"                           1, suplr_name1,
"
"                           NVL (suplr_name2, suplr_name1))
"
"                      description,
"
"                       suplr_suplr_id store_id,
"
"                       'C' issto
"
"                  FROM suppliers
"
"                 WHERE     suplr_bu = p_bu
"
"                       AND suplr_status = 'A'
"
"                       AND suplr_party_type IN ('C', 'N'))
"
"             WHERE issto = v_type
"
"             )
"
"           WHERE (UPPER(store_id)=r_st(v_indx).sm_benf_id OR UPPER(description)=r_st(v_indx).sm_benf_id);
"
"
"
"    cr1   c1%ROWTYPE;
"
"    BEGIN
"
"      OPEN c1 ;
"
"      FETCH c1 INTO cr1;
"
"      IF c1%FOUND THEN
"
"        v_inv_id    :=cr1.store_id;
"
"      ELSE
"
"        Raise_Application_Error(-20999,'Suplr./Cust./Emp. not found.');
"
"      END IF;
"
"    END;
"
"    END IF;
"
"
"
"    INSERT INTO stores(store_bu,
"
"                       store_plnt,
"
"               store_plnt_loc_id,
"
"               store_plnt_loc_name,
"
"               store_id,
"
"               store_desc1,
"
"               store_physical,
"
"               store_inv_id,
"
"               store_bin_flag,
"
"               store_saleable_flag,
"
"               store_perp_jrnl_req_flag,
"
"               store_deflt_wip,
"
"               store_addr1,
"
"               store_addr2,
"
"               store_addr3,
"
"               store_city,
"
"               store_state,
"
"               store_country,
"
"               store_zip,
"
"               store_tele1,
"
"               store_email1,
"
"               store_website1,
"
"               store_cre_by,
"
"               store_cre_emp_id,
"
"               store_cre_ip_addr,
"
"               store_cre_os_user,
"
"               store_cre_date,
"
"               store_bnk_fin_stat_flag
"
"              )
"
"                VALUES(p_bu,
"
"               r_st(v_indx).sm_plnt,
"
"               r_st(v_indx).sm_plnt_loc_id,
"
"               r_ul.bupld_loc_name,
"
"               TRIM(r_st(v_indx).sm_store_id),
"
"               r_st(v_indx).sm_store_desc,
"
"               v_type,
"
"               v_inv_id,--r_st(v_indx).sm_benf_id,
"
"               NVL(r_st(v_indx).sm_locator,'N'),
"
"               NVL(r_st(v_indx).sm_saleable,'N'),
"
"               NVL(r_st(v_indx).sm_journal,'N'),
"
"               NVL(r_st(v_indx).sm_dflt_wip,'N'),
"
"               r_ul.bupld_addr1,
"
"               r_ul.bupld_addr2,
"
"               r_ul.bupld_addr3,
"
"               r_ul.bupld_city,
"
"                       r_ul.bupld_state,
"
"                       r_ul.bupld_country,
"
"                       r_ul.bupld_zip,
"
"                       r_ul.bupld_tele1,
"
"                       r_ul.bupld_email1,
"
"                       r_ul.bupld_website1,
"
"               p_user,
"
"               v_emp_id,
"
"               v_ip_addr,
"
"               v_os_user,
"
"               SYSDATE,
"
"               NVL(r_st(v_indx).sm_bank_stmt,'N')
"
"              );
"
"
"
"    v_indx := v_indx + 1;
"
"     p_res := 'Y';
"
"  END LOOP;
"
"
"
"END proc_mig_stores;
"
"
"
"PROCEDURE proc_ins_cust_schld_mirg(p_bu        VARCHAR2,
"
"                                   p_plnt    VARCHAR2,
"
"                                   p_doc_no    VARCHAR2,
"
"                   p_fname    VARCHAR2,
"
"                   p_sep    VARCHAR2,
"
"                   p_user    VARCHAR2
"
"                   )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(1000);
"
"
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
"
"
"  EXECUTE IMMEDIATE 'DROP TABLE scm_migration';
"
"
"
"  v_sql := 'CREATE TABLE scm_migration(SM_PROD_ID    VARCHAR2(100),
"
"                       SM_UOM    VARCHAR2(10),
"
"                       SM_WEEK1    NUMBER,
"
"                     SM_WEEK2    NUMBER,
"
"                     SM_WEEK3    NUMBER,
"
"                     SM_WEEK4    NUMBER,
"
"                     SM_WEEK5    NUMBER,
"
"                     SM_WEEK6    NUMBER,
"
"                     SM_WEEK7    NUMBER,
"
"                     SM_WEEK8    NUMBER,
"
"                     SM_WEEK9    NUMBER,
"
"                     SM_WEEK10    NUMBER,
"
"                     SM_WEEK11    NUMBER,
"
"                     SM_WEEK12    NUMBER,
"
"                     SM_WEEK13    NUMBER,
"
"                     SM_WEEK14    NUMBER,
"
"                     SM_WEEK15    NUMBER,
"
"                     SM_WEEK16    NUMBER,
"
"                     SM_WEEK17    NUMBER,
"
"                     SM_WEEK18    NUMBER,
"
"                     SM_WEEK19    NUMBER,
"
"                     SM_WEEK20    NUMBER,
"
"                     SM_WEEK21    NUMBER,
"
"                     SM_WEEK22    NUMBER,
"
"                     SM_WEEK23    NUMBER,
"
"                     SM_WEEK24    NUMBER,
"
"                     SM_WEEK25    NUMBER,
"
"                     SM_WEEK26    NUMBER,
"
"                     SM_WEEK27    NUMBER,
"
"                     SM_WEEK28    NUMBER
"
"                    )
"
"                           ORGANIZATION EXTERNAL
"
"                           (TYPE ORACLE_LOADER
"
"                                  DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                  ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                            SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep||'''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_PROD_ID        CHAR(255),
"
"                                        SM_UOM        CHAR(255),
"
"                                SM_WEEK1        CHAR(255),
"
"                                SM_WEEK2        CHAR(255),
"
"                                SM_WEEK3        CHAR(255),
"
"                                SM_WEEK4        CHAR(255),
"
"                                SM_WEEK5        CHAR(255),
"
"                                SM_WEEK6        CHAR(255),
"
"                                SM_WEEK7        CHAR(255),
"
"                                SM_WEEK8        CHAR(255),
"
"                                SM_WEEK9        CHAR(255),
"
"                                SM_WEEK10        CHAR(255),
"
"                                SM_WEEK11        CHAR(255),
"
"                                SM_WEEK12        CHAR(255),
"
"                                SM_WEEK13        CHAR(255),
"
"                                SM_WEEK14        CHAR(255),
"
"                                SM_WEEK15        CHAR(255),
"
"                                SM_WEEK16        CHAR(255),
"
"                                SM_WEEK17        CHAR(255),
"
"                                SM_WEEK18        CHAR(255),
"
"                                SM_WEEK19        CHAR(255),
"
"                                SM_WEEK20        CHAR(255),
"
"                                SM_WEEK21        CHAR(255),
"
"                                SM_WEEK22        CHAR(255),
"
"                                SM_WEEK23        CHAR(255),
"
"                                SM_WEEK24        CHAR(255),
"
"                                SM_WEEK25        CHAR(255),
"
"                                SM_WEEK26        CHAR(255),
"
"                                SM_WEEK27        CHAR(255),
"
"                                SM_WEEK28        CHAR(255)
"
"                               )
"
"                                                 )
"
"                               LOCATION ('''||p_fname||''')) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE cust_schd_mig_ln
"
"   WHERE csmln_bu = p_bu
"
"     AND csmln_plnt = p_plnt
"
"     AND csmln_doc_no = p_doc_no;
"
"
"
"  v_sql := 'INSERT INTO cust_schd_mig_ln(csmln_bu,csmln_plnt,csmln_doc_no,csmln_seq_no,
"
"              csmln_prod_id,csmln_prod_rev,csmln_uom,csmln_week1,csmln_week2,csmln_week3,
"
"          csmln_week4,csmln_week5,csmln_week6,csmln_week7,csmln_week8,csmln_week9,
"
"          csmln_week10,csmln_week11,csmln_week12,csmln_week13,csmln_week14,csmln_week15,
"
"          csmln_week16,csmln_week17,csmln_week18,csmln_week19,csmln_week20,csmln_week21,
"
"          csmln_week22,csmln_week23,csmln_week24,csmln_week25,csmln_week26,csmln_week27,
"
"          csmln_week28,csmln_total_qty,csmln_cre_by,csmln_cre_date)
"
"              SELECT '''||p_bu||''','''||p_plnt||''','''||p_doc_no||''',ROWNUM,
"
"          sm_prod_id,0,sm_uom,sm_week1,sm_week2,sm_week3,sm_week4,sm_week5,
"
"          sm_week6,sm_week7,sm_week8,sm_week9,sm_week10,sm_week11,sm_week12,
"
"          sm_week13,sm_week14,sm_week15,sm_week16,sm_week17,sm_week18,sm_week19,
"
"          sm_week20,sm_week21,sm_week22,sm_week23,sm_week24,sm_week25,sm_week26,
"
"          sm_week27,sm_week28,NVL((sm_week1+sm_week2+sm_week3+sm_week4+sm_week5+
"
"          sm_week6+sm_week7+sm_week8+sm_week9+sm_week10+sm_week11+sm_week12+
"
"          sm_week13+sm_week14+sm_week15+sm_week16+sm_week17+sm_week18+sm_week19+
"
"          sm_week20+sm_week21+sm_week22+sm_week23+sm_week24+sm_week25+sm_week26+
"
"          sm_week27+sm_week28),0),'''||p_user||''',SYSDATE
"
"               FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"Commit;
"
"
"
"END proc_ins_cust_schld_mirg;
"
"
"
"PROCEDURE proc_ins_cust_schld(p_bu         VARCHAR2,
"
"                              p_plnt    VARCHAR2,
"
"                              p_doc_no    VARCHAR2,
"
"                              p_fname    VARCHAR2,
"
"                              p_sep        VARCHAR2,
"
"                              p_user    VARCHAR2,
"
"                              p_res OUT VARCHAR2
"
"                             )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
"
"BEGIN
"
"p_res := 'N';
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
"   --Raise_Application_Error(-20999,'HRM'||'-'||v_fpath);
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"    v_sql := 'CREATE TABLE scm_migration(SM_CUST_ID VARCHAR2(10),SM_CUST_NAME VARCHAR2(100),SM_PROD_ID VARCHAR2(100),
"
"    SM_PROD_DESC VARCHAR2(150),SM_SCHLD_TYPE VARCHAR2(2),SM_CLS_ID VARCHAR2(100),SM_PO_NO VARCHAR2(100),SM_PO_DATE DATE,SM_WEEK1 NUMBER,SM_WEEK2 NUMBER,SM_WEEK3 NUMBER,
"
"SM_WEEK4 NUMBER,SM_DAY1 NUMBER,SM_DAY2 NUMBER,SM_DAY3 NUMBER,SM_DAY4 NUMBER,SM_DAY5 NUMBER,SM_DAY6 NUMBER,SM_DAY7 NUMBER,
"
"SM_DAY8 NUMBER,SM_DAY9 NUMBER,SM_DAY10 NUMBER,SM_DAY11 NUMBER,SM_DAY12 NUMBER,SM_DAY13 NUMBER,SM_DAY14 NUMBER,SM_DAY15 NUMBER,
"
"SM_DAY16 NUMBER,SM_DAY17 NUMBER,SM_DAY18 NUMBER,SM_DAY19 NUMBER,SM_DAY20 NUMBER,SM_DAY21 NUMBER,SM_DAY22 NUMBER,SM_DAY23 NUMBER,
"
"SM_DAY24 NUMBER,SM_DAY25 NUMBER,SM_DAY26 NUMBER,SM_DAY27 NUMBER,SM_DAY28 NUMBER,SM_DAY29 NUMBER,SM_DAY30 NUMBER,SM_DAY31 NUMBER,
"
"SM_TEN1 NUMBER,SM_TEN2 NUMBER,SM_TEN3 NUMBER,SM_TEN4 NUMBER,SM_TEN5 NUMBER,SM_TOTAL NUMBER)
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_CUST_ID  CHAR(255),SM_CUST_NAME CHAR(255),SM_PROD_ID  CHAR(255),SM_PROD_DESC CHAR(255),SM_SCHLD_TYPE CHAR(255),SM_CLS_ID  CHAR(255),SM_PO_NO  CHAR(255),SM_PO_DATE CHAR(255),SM_WEEK1  CHAR(255),
"
"SM_WEEK2  CHAR(255),SM_WEEK3  CHAR(255),SM_WEEK4  CHAR(255),SM_DAY1  CHAR(255),SM_DAY2  CHAR(255),SM_DAY3  CHAR(255),
"
"SM_DAY4  CHAR(255),SM_DAY5  CHAR(255),SM_DAY6  CHAR(255),SM_DAY7  CHAR(255),SM_DAY8  CHAR(255),SM_DAY9  CHAR(255),
"
"SM_DAY10  CHAR(255),SM_DAY11  CHAR(255),SM_DAY12  CHAR(255),SM_DAY13  CHAR(255),SM_DAY14  CHAR(255),SM_DAY15  CHAR(255),
"
"SM_DAY16  CHAR(255),SM_DAY17  CHAR(255),SM_DAY18  CHAR(255),SM_DAY19  CHAR(255),SM_DAY20  CHAR(255),SM_DAY21  CHAR(255),
"
"SM_DAY22  CHAR(255),SM_DAY23  CHAR(255),SM_DAY24  CHAR(255),SM_DAY25  CHAR(255),SM_DAY26  CHAR(255),SM_DAY27  CHAR(255),
"
"SM_DAY28  CHAR(255),SM_DAY29  CHAR(255),SM_DAY30  CHAR(255),SM_DAY31  CHAR(255),SM_TEN1  CHAR(255),SM_TEN2  CHAR(255),
"
"SM_TEN3  CHAR(255),SM_TEN4  CHAR(255),SM_TEN5  CHAR(255),SM_TOTAL  CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"--Raise_Application_Error(-20999,'HRM'||'/'||v_sql);
"
"
"
"/*  INSERT INTO Test_mig(tm_content) VALUES (v_sql);
"
"  Commit;
"
"*/
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE cust_schd_ln_mig
"
"   WHERE csl_bu = p_bu
"
"     AND csl_plnt = p_plnt
"
"     AND csl_doc_no = p_doc_no;
"
"
"
"  v_sql := 'INSERT INTO cust_schd_ln_mig(csl_bu,csl_plnt,csl_doc_no,csl_seq_no,
"
"            csl_cust_id,csl_cust_desc,csl_prod_id,csl_prod_desc,csl_schld_type,csl_class_id,
"
"            csl_po_no,csl_po_date,csl_week1,csl_week2,csl_week3,csl_week4,csl_day1,
"
"            csl_day2,csl_day3,csl_day4,csl_day5,csl_day6,csl_day7,csl_day8,csl_day9,
"
"            csl_day10,csl_day11,csl_day12,csl_day13,csl_day14,csl_day15,
"
"          csl_day16,csl_day17,csl_day18,csl_day19,csl_day20,csl_day21,
"
"          csl_day22,csl_day23,csl_day24,csl_day25,csl_day26,csl_day27,
"
"          csl_day28,csl_day29,csl_day30,csl_day31,csl_ten1,csl_ten2,
"
"          csl_ten3,csl_ten4,csl_ten5,csl_total,csl_cre_by,csl_cre_date)
"
"              SELECT '''||p_bu||''','''||p_plnt||''','''||p_doc_no||''',ROWNUM,
"
"              sm_cust_id,sm_cust_name,sm_prod_id,sm_prod_desc,sm_schld_type,(SELECT spc_class_id
"
"                                 FROM sales_price_classes
"
"                                WHERE spc_bu = '''||p_bu||'''
"
"                                AND spc_class_desc = sm_cls_id),
"
"          sm_po_no,sm_po_date,              sm_week1,sm_week2,sm_week3,sm_week4,sm_day1,sm_day2,
"
"              sm_day3,sm_day4,sm_day5,sm_day6,sm_day7,sm_day8,sm_day9,
"
"              sm_day10,sm_day11,sm_day12,sm_day13,sm_day14,sm_day15,
"
"              sm_day16,sm_day17,sm_day18,sm_day19,sm_day20,sm_day21,
"
"              sm_day22,sm_day23,sm_day24,sm_day25,sm_day26,sm_day27,
"
"              sm_day28,sm_day29,sm_day30,sm_day31,sm_ten1,sm_ten2,
"
"              sm_ten3,sm_ten4,sm_ten5,sm_total,'''||p_user||''',SYSDATE
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"       IF SQL%FOUND THEN
"
"
"
"            p_res := 'Y';
"
"
"
"       END IF;
"
"
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  --Raise_Application_Error(-20999,'HRM'||'/'||length(v_sql));
"
"
"
"  Commit;
"
"
"
"END proc_ins_cust_schld;
"
"
"
"
"
"PROCEDURE proc_ins_sales_ord_ln(p_bu        VARCHAR2,
"
"                                p_ord_pfx    VARCHAR2,
"
"                 p_ord_no    VARCHAR2,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        VARCHAR2,
"
"                 p_res    OUT    VARCHAR2
"
"                   )
"
"AS
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath         VARCHAR2(100);
"
"v_soq_seq_no    NUMBER;
"
"v_seq              NUMBER;
"
"PROCEDURE proc_load_so_line
"
"AS
"
"
"
"TYPE typ_mirg IS RECORD (seq_no                NUMBER(5),
"
"                         prod_id               VARCHAR2(1000),
"
"             prod_rev              NUMBER(5),
"
"                         prod_desc             VARCHAR2(1500),
"
"             prod_uom              VARCHAR2(10),
"
"             unitcost              VARCHAR2(15),--NUMBER(17,5),
"
"             price_cls             VARCHAR2(10),
"
"             disc_pct              VARCHAR2(3),--NUMBER(5,2),
"
"             ord_qty               VARCHAR2(15),--NUMBER(15,3),
"
"             po_no                 VARCHAR2(100),
"
"             po_date               DATE,
"
"             hsn_code              VARCHAR2(20),
"
"             rqrd_date             DATE,
"
"                         shipfrm_loc_name       VARCHAR2(500),
"
"             cpc_code        VARCHAR2(200),
"
"             gst_type        VARCHAR2(2),
"
"             gst_input_type        VARCHAR2(2),
"
"             sale_gl_acct        VARCHAR2(100)
"
"             );
"
"
"
"TYPE typ_mirg_dtls IS TABLE OF typ_mirg INDEX BY PLS_INTEGER;
"
"
"
"r_mirg_dtls    typ_mirg_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_sm      typ_ref_cur;
"
"indx     NUMBER := 0;
"
"
"
"CURSOR c_prod(c_plnt    VARCHAR2,
"
"              c_prod_id    VARCHAR2) IS
"
"SELECT *
"
"  FROM products,prod_plants
"
" WHERE prod_bu = prodplnt_bu
"
"   AND prod_id = prodplnt_prod_id
"
"   AND prod_rev = prodplnt_prod_rev
"
"   AND prodplnt_bu = p_bu
"
"   AND prodplnt_plnt = c_plnt
"
"   AND prodplnt_prod_id = c_prod_id
"
"   AND prodplnt_prod_rev = 0;
"
"
"
"r_prod        c_prod%ROWTYPE;
"
"v_cust_prod_id    cust_prod.custp_cust_prod_id%TYPE;
"
"v_cust_prod_desc    cust_prod.custp_cust_prod_desc%TYPE;
"
"v_price_basis    cust_prod.custp_price_basis%TYPE;
"
"v_loc_id    VARCHAR2(10);
"
"v_sales_area    suppliers.suplr_sales_area%TYPE;
"
"v_price        NUMBER;
"
"v_mprice    NUMBER;
"
"v_disc        NUMBER;
"
"v_catalog_no    VARCHAR2(30);
"
"v_contr_no    VARCHAR2(30);
"
"v_amd_no    NUMBER;
"
"v_amd_date    DATE;
"
"v_sale_uom    VARCHAR2(5);
"
"v_po_no        VARCHAR2(30);
"
"v_po_date    DATE;
"
"v_po_ref    VARCHAR2(100);
"
"v_po_seq_no    NUMBER(5);
"
"v_tax_set_id    VARCHAR2(10);
"
"v_tcf_id    VARCHAR2(10);
"
"v_last_amd_no    NUMBER(5);
"
"v_seq_no    NUMBER(5) := 0;
"
"v_conv_factor    NUMBER(15,8);
"
"v_sub_seq_no    NUMBER;
"
"v_cm_seq_no    NUMBER;
"
"v_cls_id        VARCHAR2 (10);
"
"v_cust_item_req    VARCHAR2(1);
"
"v_sales_price_cls    VARCHAR2(10);
"
"v_loc_id1    VARCHAR2(10);
"
"v_currency    VARCHAR2(10);
"
"v_so_date    DATE;
"
"v_hsn_code                VARCHAR2(25);
"
"v_hsn_code1                VARCHAR2(25);
"
"v_order_date            DATE;
"
"v_gst_cust_type            VARCHAR2(1);
"
"v_gst_exempt_flag        VARCHAR2(1);
"
"v_gst_types_of_supply    VARCHAR2(1);
"
"v_tax_pct                 NUMBER;--NUMBER(10,8);
"
"v_cgst_pct                NUMBER;--NUMBER(10,8);
"
"v_sgst_pct                NUMBER;--NUMBER(10,8);
"
"v_utgst_pct               NUMBER;--NUMBER(10,8);
"
"v_cess_pct                NUMBER;--NUMBER(10,8);
"
"v_igst_amt                NUMBER;--NUMBER(15,2);
"
"v_cgst_amt                NUMBER;--NUMBER(15,2);
"
"v_sgst_amt                NUMBER;--NUMBER(15,2);
"
"v_utgst_amt               NUMBER;--NUMBER(15,2);
"
"v_cess_amt                NUMBER;--NUMBER(15,2);
"
"v_disc_amt                NUMBER;--NUMBER(18,5);
"
"v_tot_disc_amt            NUMBER;--NUMBER(18,5);
"
"v_so_plnt        VARCHAR2(10);
"
"v_so_plnt_loc        VARCHAR2(10);
"
"v_exp_seq_no        NUMBER;
"
"v_ref            VARCHAR2(4000);
"
"v_so_cc_id        VARCHAR2(100);
"
"v_ss_seq_no        NUMBER;
"
"v_cess_rate        NUMBER;
"
"v_shipfrm_loc_id    VARCHAR2(200);
"
"v_dflt_store_id        VARCHAR2(200);
"
"v_schld_desc_rule    VARCHAR2(500);
"
"v_schld_desc         VARCHAR2(500);
"
"v_lvl             VARCHAR2(1);
"
"
"
"BEGIN
"
"
"
" p_res := 'N';
"
"
"
" DELETE
"
"   FROM sales_ord_line_mig_excep
"
"  WHERE solme_bu = p_bu
"
"    AND solme_order_no = p_ord_no;
"
"
"
"  DELETE sales_order_qtys
"
"   WHERE soq_bu = p_bu
"
"     AND soq_order_no = p_ord_no;
"
"
"
"  FOR r_so IN (SELECT soh_plant,soh_cust_id,soh_order_date,soh_plnt_loc_id
"
"                 FROM sales_order_hd
"
"        WHERE soh_bu = p_bu
"
"          AND soh_order_pfx = p_ord_pfx
"
"          AND soh_order_no = p_ord_no)
"
"  LOOP
"
"
"
"    OPEN c_sm FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"      indx := indx + 1;
"
"      FETCH c_sm INTO r_mirg_dtls(indx);
"
"      EXIT WHEN c_sm%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_sm;
"
"
"
"    FOR indx IN 1..r_mirg_dtls.COUNT
"
"    LOOP
"
"
"
"      v_ref := NULL;
"
"
"
"    IF LENGTH(r_mirg_dtls(indx).ord_qty) > 9 OR r_mirg_dtls(indx).ord_qty IS NULL THEN
"
"      v_ref := v_ref|| ' , ' || 'Invalid Qty.'||r_mirg_dtls(indx).prod_id;
"
"    END IF;
"
"
"
"    IF LENGTH(r_mirg_dtls(indx).unitcost) > 10  OR r_mirg_dtls(indx).unitcost IS NULL THEN
"
"      v_ref := v_ref|| ' , ' || 'Invalid Price.'||r_mirg_dtls(indx).prod_id;
"
"    END IF;
"
"
"
"    IF r_mirg_dtls(indx).ord_qty IS NOT NULL THEN
"
"    BEGIN
"
"       proc_isalphanumeric(r_mirg_dtls(indx).ord_qty);
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_ref := v_ref|| ' , ' || 'Invalid Qty.'||r_mirg_dtls(indx).prod_id;
"
"    END;
"
"    END IF;
"
"    IF r_mirg_dtls(indx).unitcost IS NOT NULL THEN
"
"    BEGIN
"
"      proc_isalphanumeric(r_mirg_dtls(indx).unitcost);
"
"    EXCEPTION WHEN OTHERS THEN
"
"      v_ref := v_ref|| ' , ' || 'Invalid Price.'||r_mirg_dtls(indx).prod_id;
"
"    END;
"
"    END IF;
"
"
"
"    IF r_mirg_dtls(indx).po_date > SYSDATE THEN
"
"      v_ref := v_ref|| ' , ' ||'Future date not allowed.'||r_mirg_dtls(indx).prod_id;
"
"    END IF;
"
"
"
"    IF TRIM(r_mirg_dtls(indx).prod_id) <>  r_mirg_dtls(indx).prod_id THEN
"
"      v_ref := v_ref|| ' , ' ||'Invalid Item.'||r_mirg_dtls(indx).prod_id;
"
"    END IF;
"
"
"
"    IF TRIM(r_mirg_dtls(indx).prod_desc) <>  r_mirg_dtls(indx).prod_desc THEN
"
"      v_ref := v_ref|| ' , ' ||'Invalid item description.'||r_mirg_dtls(indx).prod_id;
"
"    END IF;
"
"
"
"    IF r_mirg_dtls(indx).ord_qty IS NOT NULL AND ((r_mirg_dtls(indx).ord_qty - FLOOR(r_mirg_dtls(indx).ord_qty))) <> TRUNC(((r_mirg_dtls(indx).ord_qty - FLOOR(r_mirg_dtls(indx).ord_qty))),2) THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Qty.'||r_mirg_dtls(indx).prod_id;
"
"    END IF;
"
"
"
"    IF r_mirg_dtls(indx).unitcost IS NOT NULL AND ((r_mirg_dtls(indx).unitcost - FLOOR(r_mirg_dtls(indx).unitcost))) <> TRUNC(((r_mirg_dtls(indx).unitcost - FLOOR(r_mirg_dtls(indx).unitcost))),2) THEN
"
"       v_ref := v_ref|| ' , ' || 'Invalid Price.'||r_mirg_dtls(indx).prod_id;
"
"    END IF;
"
"
"
"      OPEN c_prod(r_so.soh_plant,r_mirg_dtls(indx).prod_id);
"
"      FETCH c_prod INTO r_prod;
"
"        IF c_prod%NOTFOUND THEN
"
"          v_ref := v_ref|| ' , ' ||'Item not found.'||r_mirg_dtls(indx).prod_id;
"
"        ELSE
"
"
"
"        BEGIN
"
"        SELECT prodplnt_cust_asso
"
"          INTO v_cust_item_req
"
"          FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"           AND prodplnt_prod_id = r_prod.prod_id
"
"           AND prodplnt_prod_rev = r_prod.prod_rev
"
"           AND prodplnt_plnt = r_so.soh_plant
"
"           AND prodplnt_status = 'A';
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          v_cust_item_req := 'N';
"
"        END;
"
"
"
"
"
"    IF v_cust_item_req = 'Y' THEN
"
"
"
"      v_cust_prod_id := func_find_cust_prod(p_bu,
"
"                                            r_so.soh_cust_id,
"
"                        r_prod.prod_id,
"
"                        r_prod.prod_rev
"
"                            );
"
"    v_cust_prod_desc := func_find_prod_qry_desc(p_bu,r_prod.prod_id,r_prod.prod_rev,1);
"
"      BEGIN
"
"          SELECT custp_uom,custp_hsn_code,custp_price_basis
"
"            INTO v_sale_uom,v_hsn_code,v_price_basis
"
"                FROM cust_prod
"
"               WHERE custp_bu = p_bu
"
"             AND custp_cust_id = r_so.soh_cust_id
"
"             AND custp_prod_id = r_prod.prod_id
"
"             AND custp_prod_rev = r_prod.prod_rev
"
"                 AND custp_prod_flag = 'Y';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_ref := v_ref|| ' , ' ||'Customer Item not found.'||r_mirg_dtls(indx).prod_id||'-'||r_so.soh_cust_id;
"
"      END;
"
"
"
"
"
"    ELSE
"
"
"
"      v_cust_prod_id := NULL;
"
"      v_cust_prod_desc := NULL;
"
"      v_sale_uom := NULL;
"
"      BEGIN
"
"      SELECT prod_hsn_code,prod_sale_uom
"
"        INTO v_hsn_code,v_sale_uom
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = r_prod.prod_id
"
"         AND prod_rev = r_prod.prod_rev
"
"         AND prod_status = 'A';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_hsn_code := NULL;
"
"    v_sale_uom := NULL;
"
"      END;
"
"
"
"      BEGIN
"
"      SELECT suplr_sales_price_source
"
"        INTO v_price_basis
"
"        FROM suppliers
"
"       WHERE suplr_bu = p_bu
"
"         AND suplr_suplr_id = r_so.soh_cust_id
"
"         AND suplr_status = 'A';
"
"      END;
"
"
"
"    END IF;
"
"BEGIN
"
"     SELECT ghc_hsn_code
"
"       INTO v_hsn_code1
"
"       FROM gst_hsn_codes, hsn_sac_tax_rates
"
"      WHERE hstr_bu = p_bu
"
"        AND hstr_hsnsac_code = ghc_hsn_code
"
"        AND ghc_hsn_code = TRIM(r_mirg_dtls(indx).hsn_code)
"
"        AND TRUNC (SYSDATE) BETWEEN TRUNC (hstr_date_from)
"
"                                    AND TRUNC (hstr_date_to)
"
"            AND hstr_status = 'A'
"
"   ORDER BY 1;
"
"EXCEPTION WHEN OTHERS THEN
"
"   v_ref := v_ref|| ' , ' ||'HSN code not found.'||r_mirg_dtls(indx).hsn_code||'-'||r_mirg_dtls(indx).prod_id;
"
"END;
"
"
"
"SELECT TRUNC(soh_order_date),soh_plant , soh_plnt_loc_id,soh_cc_id
"
"          INTO v_so_date , v_so_plnt , v_so_plnt_loc,v_so_cc_id
"
"          FROM sales_order_hd
"
"         WHERE soh_bu = p_bu
"
"           AND soh_order_no = p_ord_no;
"
"
"
"IF r_mirg_dtls(indx).shipfrm_loc_name IS NOT NULL THEN
"
"v_shipfrm_loc_id := null;
"
"BEGIN
"
"  SELECT bupld_loc_id
"
"    INTO v_shipfrm_loc_id
"
"   FROM bus_unit_plants_loc_dtls
"
"  WHERE bupld_bu = p_bu
"
"    AND bupld_loc_name = r_mirg_dtls(indx).shipfrm_loc_name;
"
"EXCEPTION WHEN OTHERS THEN
"
"   v_ref := v_ref|| ' , ' ||'Shipfrm. Loc. not found.'||r_mirg_dtls(indx).shipfrm_loc_name;
"
"END;
"
"ELSE
"
"   v_ref := v_ref|| ' , ' ||'Shipfrm. Loc. must be entered.'||'-'||r_mirg_dtls(indx).prod_id||' - '||r_mirg_dtls(indx).shipfrm_loc_name;
"
"END IF;
"
"
"
"
"
"BEGIN
"
"  SELECT ppl_dflt_store_id
"
"    INTO v_dflt_store_id
"
"    FROM prod_plants_loc
"
"   WHERE ppl_bu = p_bu
"
"     AND ppl_plnt = v_so_plnt
"
"     AND ppl_plnt_loc_id = v_shipfrm_loc_id
"
"     AND ppl_prod_id = r_prod.prod_id
"
"     AND ppl_prod_rev = r_prod.prod_rev;
"
"EXCEPTION WHEN OTHERS THEN
"
"   v_ref := v_ref|| ' , ' ||'Item not associated with Unit Location.'||r_prod.prod_id||'/'||r_mirg_dtls(indx).shipfrm_loc_name;
"
"END;
"
"    /*  v_price_basis := func_find_cust_so_price_basis(p_bu,
"
"                                                     r_so.soh_plant,
"
"                                                     r_so.soh_cust_id,
"
"                             r_prod.prod_id,
"
"                             r_prod.prod_rev,
"
"                             v_cust_prod_id
"
"                             );    */
"
"
"
"      v_cls_id := func_find_product_class (p_bu,
"
"                                             r_so.soh_plant,
"
"                                             r_prod.prod_id,
"
"                                             r_prod.prod_rev
"
"                                             );
"
"
"
"   --raise_application_error(-20999,'HRM'||'/'||v_cls_id);
"
"
"
"      BEGIN
"
"      SELECT suplr_currency
"
"        INTO v_currency
"
"        FROM suppliers
"
"       WHERE suplr_bu = p_bu
"
"         AND suplr_suplr_id = r_so.soh_cust_id
"
"         AND suplr_mode_sal = 'Y';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_ref := v_ref|| ' , ' ||'Supplier currency not found.'||r_so.soh_cust_id;
"
"      END;
"
"
"
"      BEGIN
"
"      SELECT somctrl_so_ref_lvl,somctrl_schld_desc_rule
"
"        INTO v_lvl,v_schld_desc_rule
"
"        FROM som_control
"
"       WHERE somctrl_bu = p_bu;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_ref := v_ref|| ' , ' ||'So Ref. Rule not found.';
"
"      END;
"
"
"
"      IF v_schld_desc_rule IS NULL THEN
"
"         v_ref := v_ref|| ' , ' ||'So Ref. Rule not found.';
"
"      END IF;
"
"
"
"      BEGIN
"
"      SELECT soh_sales_area
"
"        INTO v_sales_area
"
"        FROM sales_order_hd
"
"       WHERE soh_bu = p_bu
"
"         AND soh_order_pfx = p_ord_pfx
"
"         AND soh_order_no = p_ord_no;
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_sales_area := NULL;
"
"      END;
"
"
"
"      BEGIN
"
"      SELECT spc_class_id
"
"        INTO v_sales_price_cls
"
"        FROM sales_price_classes
"
"       WHERE spc_bu = p_bu
"
"         AND spc_class_desc = TRIM(r_mirg_dtls(indx).price_cls)
"
"         AND spc_active_flag = 'Y';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_sales_price_cls := NULL;
"
"      END;
"
"
"
"      IF v_sales_price_cls IS NULL THEN
"
"      BEGIN
"
"      SELECT spc_class_id
"
"        INTO v_sales_price_cls
"
"        FROM sales_price_classes
"
"       WHERE spc_bu = p_bu
"
"         AND spc_sel_flag = 'Y';
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_sales_price_cls := NULL;
"
"      END;
"
"      END IF;
"
"
"
"      v_sale_uom := NVL(v_sale_uom,r_prod.prod_uom);
"
"      v_conv_factor := func_find_uom_conversion (p_bu,
"
"                                     r_prod.prod_id,
"
"                                     r_prod.prod_rev,
"
"                                     r_prod.prod_uom,
"
"                                     v_sale_uom
"
"                               );
"
"
"
"
"
"/*IF r_prod.prod_id NOT IN ('FG-CS-40001','FG-CS-40100','HK-FG-DISSIMILAR-10001') THEN
"
"Raise_Application_error(-20999,p_bu||'~'||r_prod.prod_id||'~'||r_so.soh_plant||'~'||v_sale_uom||'~'||v_sales_price_cls);
"
"END IF;    */
"
" --RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||r_mirg_dtls(indx).shipfrm_loc_name||'/'||v_ref);
"
"      IF v_price_basis <> 'U' THEN
"
"      proc_find_sales_price_mig1(p_bu,
"
"                                r_so.soh_plant,
"
"                                r_so.soh_cust_id,
"
"                                v_sales_area,
"
"                                v_sales_price_cls,
"
"                                r_prod.prod_id,
"
"                                r_prod.prod_rev,
"
"                                r_mirg_dtls(indx).ord_qty,
"
"                                r_so.soh_order_date,
"
"                                v_price_basis,
"
"                                v_sale_uom,
"
"                                NULL,
"
"                                r_prod.prodplnt_deflt_store_id,
"
"                                'S',
"
"                                v_price,
"
"                                v_mprice,
"
"                                v_disc,
"
"                                v_catalog_no,
"
"                                v_contr_no,
"
"                                v_amd_no,
"
"                                v_amd_date,
"
"                                v_po_no,
"
"                                v_po_date,
"
"                                v_po_ref,
"
"                                v_po_seq_no,
"
"                                v_tax_set_id,
"
"                                v_tcf_id,
"
"                                v_last_amd_no,
"
"                                NULL,
"
"                                'SO',
"
"                                v_currency,
"
"                r_so.soh_plnt_loc_id,
"
"                p_res => v_ref
"
"                   );
"
"
"
"
"
"
"
"      ELSE
"
"            v_price := r_mirg_dtls(indx).unitcost;
"
"        v_disc := r_mirg_dtls(indx).disc_pct;
"
"        v_catalog_no := NULL;
"
"        v_contr_no := NULL;
"
"        v_amd_no := NULL;
"
"        v_amd_date := NULL;
"
"        v_po_no := NULL;
"
"        v_po_date := NULL;
"
"        v_po_ref := NULL;
"
"        v_po_seq_no := NULL;
"
"        v_tax_set_id := NULL;
"
"        v_tcf_id := NULL;
"
"        v_last_amd_no := NULL;
"
"      END IF;
"
"
"
"      END IF;
"
"
"
"     IF v_ref IS NOT NULL THEN
"
"        SELECT NVL(MAX(solme_seq_no),0) + 1
"
"          INTO v_exp_seq_no
"
"          FROM sales_ord_line_mig_excep
"
"         WHERE solme_bu = p_bu
"
"           AND solme_order_no = p_ord_no;
"
"
"
"      INSERT INTO sales_ord_line_mig_excep(solme_bu,
"
"                                           solme_order_no,
"
"                                           solme_seq_no ,
"
"                                           solme_reference ,
"
"                                           solme_cre_by ,
"
"                                           solme_cre_ip_addr,
"
"                                           solme_cre_os_user,
"
"                                           solme_cre_emp_id ,
"
"                                           solme_cre_date)
"
"                                    VALUES(p_bu,
"
"                                           p_ord_no,
"
"                                           v_exp_seq_no,
"
"                                           LTRIM(v_ref,','),
"
"                                           p_user,
"
"                                           Audit_Info.Get_IP_Address,
"
"                                           Audit_Info.Get_OS_User,
"
"                                           func_find_emp_id(p_bu,p_user),
"
"                                           SYSDATE);
"
"      END IF;
"
"
"
"      IF v_ref IS NULL THEN
"
"
"
"      IF /*v_hsn_code IS NOT NULL AND*/ v_price > 0 THEN
"
"
"
"        BEGIN
"
"        SELECT soh_gst_cust_type,soh_order_date
"
"          INTO v_gst_cust_type,v_order_date
"
"          FROM sales_order_hd
"
"         WHERE soh_bu = p_bu
"
"           AND soh_order_pfx = p_ord_pfx
"
"           AND soh_order_no =  p_ord_no;
"
"        END;
"
"
"
"        BEGIN
"
"        SELECT prod_gst_exempt_flag,prod_gst_types_of_supply
"
"          INTO v_gst_exempt_flag,v_gst_types_of_supply
"
"          FROM products
"
"         WHERE prod_bu = p_bu
"
"           AND prod_id = r_prod.prod_id
"
"           AND prod_rev = r_prod.prod_rev
"
"           AND prod_status = 'A';
"
"        END;
"
"
"
"        v_disc_amt := NVL(((r_mirg_dtls(indx).ord_qty/v_conv_factor)*v_price)*(v_disc/100),0);
"
"        v_tot_disc_amt := ROUND((v_disc_amt),2);
"
"
"
"        proc_get_hsn_tax_pct(p_bu,
"
"                             v_hsn_code1,
"
"                             v_order_date,
"
"                             v_gst_cust_type,
"
"                 NVL(r_mirg_dtls(indx).gst_input_type,v_gst_types_of_supply),
"
"                 NVL(r_mirg_dtls(indx).gst_type,v_gst_exempt_flag),
"
"                 r_mirg_dtls(indx).ord_qty,
"
"                             ((r_mirg_dtls(indx).ord_qty * v_price) - v_tot_disc_amt),
"
"                             v_tax_pct,
"
"                             v_cgst_pct,
"
"                             v_sgst_pct,
"
"                             v_utgst_pct,
"
"                             v_cess_pct,
"
"                 v_cess_rate,
"
"                             v_igst_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_utgst_amt,
"
"                             v_cess_amt
"
"                             );
"
"      END IF;
"
"
"
"
"
"
"
"       --RAISE_APPLICATION_ERROR(-20999,'TEST');
"
"          UPDATE sales_order_qtys
"
"         SET soq_qty_ordered = soq_qty_ordered + r_mirg_dtls(indx).ord_qty,
"
"             soq_qty_due = soq_qty_due + r_mirg_dtls(indx).ord_qty,
"
"             soq_to_ordered = soq_to_ordered + r_mirg_dtls(indx).ord_qty,
"
"             soq_hsn_code = NVL(v_hsn_code,v_hsn_code1)
"
"       WHERE soq_bu = p_bu
"
"         AND soq_order_no = p_ord_no
"
"         AND soq_prod_id = r_prod.prod_id
"
"         AND soq_prod_rev = r_prod.prod_rev
"
"         AND (soq_sales_price_class = v_sales_price_cls OR (soq_sales_price_class IS NULL AND v_sales_price_cls IS NULL))
"
"         AND (soq_cust_po_no = r_mirg_dtls(indx).po_no OR (r_mirg_dtls(indx).po_no IS NULL AND soq_cust_po_no IS NULL))
"
"         AND (soq_rqrd_date = r_mirg_dtls(indx).rqrd_date OR (r_mirg_dtls(indx).rqrd_date IS NULL AND soq_rqrd_date IS NULL))
"
"         and soq_status <> 'L'
"
"      RETURNING soq_seq_no INTO v_seq_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"     --  RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||v_shipfrm_loc_id||'/'||r_mirg_dtls(indx).shipfrm_loc_name||'/'||v_dflt_store_id);
"
"        SELECT NVL(MAX(soq_seq_no),0) + 1
"
"              INTO v_seq_no
"
"              FROM sales_order_qtys
"
"             WHERE soq_bu = p_bu
"
"               AND soq_order_no = p_ord_no;
"
"
"
"
"
"IF v_lvl = 'L' THEN
"
"  v_schld_desc := func_find_so_schld_desc(p_bu,p_ord_no,v_seq_no);
"
"ELSE
"
"  v_schld_desc := NULL;
"
"END IF;
"
"
"
"                      INSERT INTO sales_order_qtys(soq_bu,
"
"                        soq_order_no,
"
"                        soq_seq_no,
"
"                        soq_print_seq_no,
"
"                        soq_prod_id,
"
"                        soq_prod_rev,
"
"                        soq_prod_desc1,
"
"                        soq_sales_price_class,
"
"                        soq_class_id,
"
"                        soq_qty_ordered,
"
"                        soq_uom,
"
"                        soq_prod_uom,
"
"                        soq_conv_factor,
"
"                        soq_price,
"
"                        soq_disc_pct,
"
"                        soq_disc_amt,
"
"                        soq_status,
"
"                        soq_price_basis,
"
"                        soq_price_uom,
"
"                        soq_price_conv_factor,
"
"                        soq_cust_prod_id,
"
"            soq_cust_prod_desc,
"
"                        soq_amd_no,
"
"                        soq_amd_date,
"
"                        soq_catalog_no,
"
"                        soq_cust_po_no,
"
"                        soq_cust_po_date,
"
"                        soq_cre_by,
"
"                        soq_cre_date,
"
"                        soq_qty_due,
"
"                        soq_to_ordered,
"
"                        soq_schld_desc,
"
"                        soq_rqrd_date,
"
"                        soq_trd_assbl_val,
"
"                        soq_hsn_code,
"
"                        soq_tot_disc_amt,
"
"                        soq_tax_pct,
"
"                        soq_cgst_pct,
"
"                        soq_sgst_pct,
"
"                        soq_utgst_pct,
"
"                        soq_cess_pct,
"
"                        soq_igst_amt,
"
"                        soq_cgst_amt,
"
"                        soq_sgst_amt,
"
"                        soq_utgst_amt,
"
"                        soq_cess_amt,
"
"            soq_shipfrm_loc_id,
"
"            soq_shipfrm_loc_name,
"
"                        soq_store_id,
"
"            soq_store_name,
"
"            soq_sal_cc_id,
"
"            soq_cust_tax_charge_flag,
"
"            soq_gst_exempt_flag,
"
"            soq_gst_input_type,
"
"            soq_sal_acct_id
"
"                        )
"
"                    VALUES(p_bu,
"
"                           p_ord_no,
"
"                           v_seq_no,
"
"                           r_mirg_dtls(indx).seq_no,
"
"                           r_prod.prod_id,
"
"                           r_prod.prod_rev,
"
"                           r_prod.prod_desc11,
"
"                           v_sales_price_cls,
"
"                           v_cls_id,
"
"                           NVL(r_mirg_dtls(indx).ord_qty,0),
"
"                           v_sale_uom,
"
"                           NVL(r_mirg_dtls(indx).prod_uom,r_prod.prod_uom),
"
"                           v_conv_factor,
"
"                           NVL(v_price,0),
"
"                           NVL(v_disc,0),
"
"                           NVL(((r_mirg_dtls(indx).ord_qty/v_conv_factor)*v_price)*(v_disc/100),0),
"
"                           'N',
"
"                           v_price_basis,
"
"                           NVL(r_mirg_dtls(indx).prod_uom,r_prod.prod_uom),
"
"                           1,
"
"                           v_cust_prod_id,
"
"               v_cust_prod_desc,
"
"                           v_amd_no,
"
"                           v_amd_date,
"
"                           v_catalog_no,
"
"                           r_mirg_dtls(indx).po_no,
"
"                           r_mirg_dtls(indx).po_date,
"
"                           p_user,
"
"                           SYSDATE,
"
"                           r_mirg_dtls(indx).ord_qty,
"
"                           r_mirg_dtls(indx).ord_qty,
"
"                           v_schld_desc,--func_find_so_schld_desc(p_bu,p_ord_pfx,p_ord_no,v_seq_no,TRUNC(v_so_date),r_prod.prod_id),
"
"                           NVL(r_mirg_dtls(indx).rqrd_date,TRUNC(SYSDATE)), --TRUNC(v_so_date),
"
"                           (r_mirg_dtls(indx).ord_qty * NVL(v_price,0)),
"
"                           NVL(v_hsn_code,v_hsn_code1),
"
"                           NVL(v_tot_disc_amt,0),
"
"                           NVL(v_tax_pct,0),
"
"                           NVL(v_cgst_pct,0),
"
"                           NVL(v_sgst_pct,0),
"
"                           NVL(v_utgst_pct,0),
"
"                           NVL(v_cess_pct,0),
"
"                           NVL(v_igst_amt,0),
"
"                           NVL(v_cgst_amt,0),
"
"                           NVL(v_sgst_amt,0),
"
"                           NVL(v_utgst_amt,0),
"
"                           NVL(v_cess_amt,0),
"
"               v_shipfrm_loc_id,
"
"               r_mirg_dtls(indx).shipfrm_loc_name,
"
"                           v_dflt_store_id,
"
"               func_find_store_qry_desc(p_bu,v_dflt_store_id,1),
"
"               NVL(r_mirg_dtls(indx).cpc_code,v_so_cc_id),
"
"               CASE WHEN v_currency = func_find_base_currency(p_bu) THEN 'Y' ELSE 'N' END,
"
"               NVL(r_mirg_dtls(indx).gst_type,v_gst_exempt_flag),
"
"               NVL(r_mirg_dtls(indx).gst_input_type,v_gst_types_of_supply),
"
"               r_mirg_dtls(indx).sale_gl_acct
"
"                           );
"
"      END IF;
"
"
"
"      DELETE
"
"        FROM so_shipset_prod
"
"         WHERE ssp_bu = p_bu
"
"         AND ssp_order_no = p_ord_no
"
"         AND ssp_seq_no = v_seq_no;
"
"
"
"      FOR r_ship IN (SELECT ps_ss_prod_id,ps_ss_prod_rev,ps_ss_qty
"
"                       FROM prod_shipset,prod_plants_loc
"
"                      WHERE ppl_bu = ps_bu
"
"                        AND ppl_plnt = v_so_plnt
"
"                        AND ppl_plnt_loc_id = v_so_plnt_loc
"
"                        AND ppl_prod_id = ps_ss_prod_id
"
"                        AND ppl_prod_rev = ps_ss_prod_rev
"
"                        AND ps_bu = p_bu
"
"                        AND ps_fg_prod_id = r_prod.prod_id
"
"                        AND ps_fg_prod_rev  = r_prod.prod_rev)
"
"      LOOP
"
"
"
"        SELECT NVL(MAX(ssp_sub_seq_no),0) + 1
"
"          INTO v_ss_seq_no
"
"          FROM so_shipset_prod
"
"            WHERE ssp_bu = p_bu
"
"           AND ssp_order_no = p_ord_no
"
"           AND ssp_seq_no = v_seq_no;
"
"
"
"        INSERT INTO so_shipset_prod(ssp_bu,
"
"                                    ssp_order_no,
"
"                                    ssp_seq_no,
"
"                                    ssp_sub_seq_no,
"
"                                    ssp_prod_id,
"
"                                    ssp_prod_rev,
"
"                                    ssp_prod_desc,
"
"                                    ssp_uom,
"
"                                    ssp_opport_qty,
"
"                                    ssp_cre_by,
"
"                                    ssp_cre_date
"
"                                   )
"
"                             VALUES(p_bu,
"
"                                    p_ord_no,
"
"                                    v_seq_no,
"
"                                    v_ss_seq_no,
"
"                                    r_ship.ps_ss_prod_id,
"
"                                    r_ship.ps_ss_prod_rev,
"
"                                    func_find_prod_desc(p_bu,r_ship.ps_ss_prod_id,r_ship.ps_ss_prod_rev,1),
"
"                                    func_find_product_uom(p_bu,r_ship.ps_ss_prod_id,r_ship.ps_ss_prod_rev),
"
"                                    NVL(r_ship.ps_ss_qty,0),
"
"                                    p_user,
"
"                                    SYSDATE
"
"                               );
"
"
"
"      END LOOP;
"
"
"
"      proc_upd_sales_amt(p_bu,p_ord_no,'SOG',p_user);
"
"    END IF;
"
"
"
"      CLOSE c_prod;
"
"      p_res := 'Y';
"
"
"
"    END LOOP;
"
"  END LOOP;
"
"
"
"             --EXCEPTION WHEN NO_DATA_FOUND THEN RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||v_sale_uom||'/'||v_sales_area||'/'||v_loc_id);
"
"END proc_load_so_line;
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE scm_migration(SM_SEQ_NO    NUMBER,
"
"                         SM_PROD_ID    VARCHAR2(1000),
"
"                         SM_PROD_DESC    VARCHAR2(1500),
"
"                       SM_UNIT_COST    VARCHAR2(15),
"
"                       SM_PRICE_CLS    VARCHAR2(10),
"
"                       SM_DISC_PCT    VARCHAR2(3),
"
"                       SM_ORD_QTY    VARCHAR2(15),
"
"                       SM_PO_NO        VARCHAR2(100),
"
"                       SM_PO_DATE    DATE,
"
"                       SM_HSN_CODE   VARCHAR2(20),
"
"                       SM_RQRD_DATE  DATE,
"
"               SM_SHIPFRM_LOC_NAME VARCHAR2(200)
"
"                      )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                  DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                  ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                            SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep||'''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_SEQ_NO        CHAR(255),
"
"                                SM_PROD_ID        CHAR(255),
"
"                                SM_PROD_DESC    CHAR(255),
"
"                                SM_UNIT_COST    CHAR(255),
"
"                                SM_PRICE_CLS    CHAR(255),
"
"                                SM_DISC_PCT        CHAR(255),
"
"                                SM_ORD_QTY        CHAR(255),
"
"                                    SM_PO_NO        CHAR(255),
"
"                                    SM_PO_DATE        CHAR(255),
"
"                                    SM_HSN_CODE   CHAR(255),
"
"                                    SM_RQRD_DATE  CHAR(255),
"
"                    SM_SHIPFRM_LOC_NAME CHAR(255)
"
"                                )
"
"                                                 )
"
"                               LOCATION ('''||p_fname||''')
"
"                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"  BEGIN
"
"           SELECT jva_exl_seq.NEXTVAL INTO v_seq FROM DUAL;
"
"
"
"         INSERT INTO EXCEL_GENERATE_QUERY (EGQ_NO,
"
"                                           EGQ_QUERY,
"
"                                           EGQ_CRE_BY,
"
"                                           EGQ_CRE_DATE,
"
"                                           EGQ_BUS_FUN)
"
"              VALUES (v_seq,
"
"                      v_sql,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      'SOM1040');
"
"   END;
"
"  /*DELETE FROM sales_order_qtys
"
"   WHERE soq_bu = p_bu
"
"     AND soq_order_no = p_ord_no;*/
"
"
"
"  proc_load_so_line;
"
"
"
"  Commit;
"
"
"
"END proc_ins_sales_ord_ln;
"
"
"
"
"
"/*PROCEDURE proc_ins_pos_item_mig(p_bu        VARCHAR2,
"
"                p_plnt        VARCHAR2,
"
"                p_fname        VARCHAR2,
"
"                p_sep        VARCHAR2,
"
"                p_user        VARCHAR2
"
"                   )
"
"IS
"
"
"
"CURSOR c_store
"
"IS
"
"  SELECT posdw_store_id
"
"    FROM pos_branch_dflt_warehouse
"
"   WHERE posdw_bu = p_bu
"
"     AND posdw_plnt = p_plnt
"
"     AND posdw_deflt_inv_flag = 'Y';
"
"
"
"v_prod_cnt            NUMBER;
"
"v_uom_cnt            NUMBER;
"
"v_subcls_cnt            NUMBER;
"
"v_color_cnt            NUMBER;
"
"v_size_cnt            NUMBER;
"
"v_cls_id            VARCHAR2(10);
"
"v_sql                VARCHAR2(4000);
"
"v_fpath                VARCHAR2(100);
"
"v_store_id            VARCHAR2(10);
"
"v_cls_type            VARCHAR2(2);
"
"v_sub_elmnt            VARCHAR2(10);
"
"v_po_pfx            VARCHAR2(5);
"
"v_imp_po_pfx            VARCHAR2(5);
"
"v_dom_rct_pfx            VARCHAR2(5);
"
"v_imp_rct_pfx            VARCHAR2(5);
"
"v_sc_pfx            VARCHAR2(5);
"
"v_sc_grn_pfx            VARCHAR2(5);
"
"v_prod_stocked            VARCHAR2(1);
"
"v_prod_saleable            VARCHAR2(1);
"
"v_prod_tc_req_flag        VARCHAR2(1);
"
"v_prod_dim_stk_req_flag        VARCHAR2(1);
"
"v_prod_ser_lot_opt        VARCHAR2(1);
"
"v_prod_ser_no_opt        VARCHAR2(1);
"
"v_prod_warr_flag        VARCHAR2(1);
"
"v_prod_warr_per            NUMBER;
"
"v_prod_warr_type        VARCHAR2(1);
"
"v_prod_expr_flag        VARCHAR2(1);
"
"v_prod_indicator        VARCHAR2(1);
"
"v_prod_shelf_life_freq        VARCHAR2(1);
"
"v_prod_shelf_freq_period    NUMBER;
"
"v_prod_lead_time_source        VARCHAR2(1);
"
"v_prod_cons_type        VARCHAR2(1);
"
"v_prod_os_cons_type        VARCHAR2(1);
"
"v_prod_cost_method        VARCHAR2(5);
"
"v_prod_tolr_type        VARCHAR2(1);
"
"v_pur_price_basis        sub_class_item_dflt_val.scidv_pur_price_basis%TYPE;
"
"v_mps_mrp            sub_class_item_dflt_val.scidv_mps_mrp%TYPE;
"
"v_strategy            sub_class_item_dflt_val.scidv_strategy%TYPE;
"
"v_id_plng_pct            sub_class_item_dflt_val.scidv_id_plng_pct%TYPE;
"
"v_hsn_code            sub_class_item_dflt_val.scidv_hsn_code%TYPE;
"
"v_app_sup_pur_flag        sub_class_item_dflt_val.scidv_app_sup_pur_flag%TYPE;
"
"v_app_sup_sc_flag        sub_class_item_dflt_val.scidv_app_sup_sc_flag%TYPE;
"
"v_prod_type            sub_class_item_dflt_val.scidv_prod_type%TYPE;
"
"v_gar_bom_rqrd_flag        sub_class_item_dflt_val.scidv_gar_bom_rqrd_flag%TYPE;
"
"v_rcpt_type            sub_class_item_dflt_val.scidv_rcpt_type%TYPE;
"
"v_qc_oper            sub_class_item_dflt_val.scidv_qc_oper%TYPE;
"
"v_grn_crit_type            sub_class_item_dflt_val.scidv_grn_crit_type%TYPE;
"
"v_cmr_crit_type            sub_class_item_dflt_val.scidv_cmr_crit_type%TYPE;
"
"v_mr_crit_type            sub_class_item_dflt_val.scidv_mr_crit_type%TYPE;
"
"v_sr_crit_type            sub_class_item_dflt_val.scidv_sr_crit_type%TYPE;
"
"v_rw_crit_type            sub_class_item_dflt_val.scidv_rw_crit_type%TYPE;
"
"v_mfg_source            sub_class_item_dflt_val.scidv_mfg_source%TYPE;
"
"v_stk_val_method        sub_class_item_dflt_val.scidv_stk_val_method%TYPE;
"
"v_first_oprn_mnt        sub_class_item_dflt_val.scidv_first_oprn_mrevent%TYPE;
"
"v_rest_oprn_mnt            sub_class_item_dflt_val.scidv_rest_oprn_mrevent%TYPE;
"
"v_lot_rule            VARCHAR2(100);
"
"v_rest_dimn_type        VARCHAR2(1);
"
"
"
"cr_store    c_store%ROWTYPE;
"
"
"
"TYPE typ_mirg IS RECORD (sm_code    VARCHAR2(25),
"
"                         sm_prod_desc    VARCHAR2(150),
"
"                         sm_uom        VARCHAR2(5),
"
"                         sm_sub_cls    VARCHAR2(10),
"
"                         sm_category    VARCHAR2(10),
"
"                         sm_grade    VARCHAR2(10),
"
"                         sm_size    VARCHAR2(10),
"
"                         sm_make    VARCHAR2(10),
"
"                         sm_model    VARCHAR2(10),
"
"                         sm_color    VARCHAR2(10),
"
"                         sm_style    VARCHAR2(10),
"
"                         sm_pack_size    VARCHAR2(10),
"
"                         sm_sub_grp    VARCHAR2(10),
"
"                         sm_grp        VARCHAR2(10),
"
"                         sm_vert_class    VARCHAR2(10),
"
"                         sm_size_range    VARCHAR2(100),
"
"                         sm_plnt    VARCHAR2(10),
"
"                         sm_store    VARCHAR2(10),
"
"                         sm_qty        NUMBER,
"
"                         sm_rate    NUMBER
"
"                        );
"
"
"
"TYPE typ_mirg_dtls IS TABLE OF typ_mirg INDEX BY PLS_INTEGER;
"
"
"
"r_mirg_dtls    typ_mirg_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_sm      typ_ref_cur;
"
"indx     NUMBER := 1;
"
"v_code    VARCHAR2(25);
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE scm_migration(sm_code        VARCHAR2(25),
"
"                         sm_prod_desc    VARCHAR2(150),
"
"                         sm_uom        VARCHAR2(5),
"
"                         sm_sub_cls    VARCHAR2(10),
"
"                         sm_category    VARCHAR2(10),
"
"                         sm_grade        VARCHAR2(10),
"
"                         sm_size        VARCHAR2(10),
"
"                         sm_make        VARCHAR2(10),
"
"                         sm_model        VARCHAR2(10),
"
"                         sm_color        VARCHAR2(10),
"
"                         sm_style        VARCHAR2(10),
"
"                         sm_pack_size    VARCHAR2(10),
"
"                         sm_sub_grp    VARCHAR2(10),
"
"                         sm_grp        VARCHAR2(10),
"
"                         sm_vert_class    VARCHAR2(10),
"
"                         sm_size_range    VARCHAR2(100),
"
"                         sm_plnt        VARCHAR2(10),
"
"                         sm_store        VARCHAR2(10),
"
"                         sm_qty        NUMBER,
"
"                         sm_rate        NUMBER
"
"                        )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                  DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                  ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                            SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep||'''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (sm_code        CHAR(255),
"
"                                            sm_prod_desc    CHAR(255),
"
"                                            sm_uom        CHAR(255),
"
"                                            sm_sub_cls        CHAR(255),
"
"                                            sm_category        CHAR(255),
"
"                                            sm_grade        CHAR(255),
"
"                                            sm_size        CHAR(255),
"
"                                            sm_make        CHAR(255),
"
"                                            sm_model        CHAR(255),
"
"                                            sm_color        CHAR(255),
"
"                                            sm_style        CHAR(255),
"
"                                            sm_pack_size    CHAR(255),
"
"                                            sm_sub_grp        CHAR(255),
"
"                                            sm_grp        CHAR(255),
"
"                                            sm_vert_class    CHAR(255),
"
"                                            sm_size_range    CHAR(255),
"
"                                            sm_plnt        CHAR(255),
"
"                                            sm_store        CHAR(255),
"
"                                            sm_qty        CHAR(255),
"
"                                            sm_rate        CHAR(255)
"
"                                           )
"
"                                                 )
"
"                               LOCATION ('''||p_fname||''')
"
"                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"    OPEN c_sm FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"      FETCH c_sm INTO r_mirg_dtls(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_sm%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_sm;
"
"
"
"    FOR indx IN 1..r_mirg_dtls.COUNT
"
"    LOOP
"
"
"
"      SELECT COUNT(1)
"
"        INTO v_prod_cnt
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = r_mirg_dtls(indx).sm_code;
"
"
"
"      IF v_prod_cnt > 0 THEN
"
"        Raise_Application_Error(-20360,'ICM ');
"
"      END IF;
"
"
"
"      SELECT COUNT(1)
"
"        INTO v_uom_cnt
"
"        FROM unit_of_measures
"
"       WHERE uom_bu = p_bu
"
"         AND uom_uom = r_mirg_dtls(indx).sm_uom;
"
"
"
"      IF v_uom_cnt = 0 THEN
"
"        Raise_Application_Error(-20275,'ICM '||r_mirg_dtls(indx).sm_uom);
"
"      END IF;
"
"
"
"      SELECT COUNT(1)
"
"        INTO v_subcls_cnt
"
"        FROM sub_classes
"
"       WHERE subcls_bu = p_bu
"
"         AND subcls_id = r_mirg_dtls(indx).sm_sub_cls;
"
"
"
"      IF v_subcls_cnt = 0 THEN
"
"        Raise_Application_Error(-20272,'ICM '||r_mirg_dtls(indx).sm_sub_cls);
"
"      END IF;
"
"
"
"      SELECT COUNT(1)
"
"        INTO v_color_cnt
"
"        FROM gar_colors
"
"       WHERE gcolor_bu = p_bu
"
"         AND gcolor_id = r_mirg_dtls(indx).sm_color;
"
"
"
"      IF v_color_cnt = 0 THEN
"
"        Raise_Application_Error(-20741,'CRM '||r_mirg_dtls(indx).sm_color);
"
"      END IF;
"
"
"
"      SELECT COUNT(1)
"
"        INTO v_size_cnt
"
"        FROM gar_sizes
"
"       WHERE gsize_bu = p_bu
"
"         AND gsize_id = r_mirg_dtls(indx).sm_size;
"
"
"
"      IF v_size_cnt = 0 THEN
"
"        Raise_Application_Error(-20742,'CRM '||r_mirg_dtls(indx).sm_size);
"
"      END IF;
"
"
"
"      SELECT subcls_parcls_id
"
"        INTO v_cls_id
"
"    FROM sub_classes
"
"       WHERE subcls_bu = p_bu
"
"         AND subcls_id = r_mirg_dtls(indx).sm_sub_cls;
"
"
"
"      SELECT class_type,
"
"             class_sub_elements
"
"        INTO v_cls_type,
"
"             v_sub_elmnt
"
"        FROM classes
"
"       WHERE class_bu = p_bu
"
"         AND class_id = v_cls_id;
"
"
"
"      INSERT INTO products(prod_bu,
"
"                     prod_id,
"
"                     prod_rev,
"
"                    -- prod_bar_code,
"
"                     prod_desc11,
"
"                     prod_uom,
"
"                     prod_sub_cls,
"
"                     prod_cls,
"
"                     prod_gar_size,
"
"                     prod_gar_color,
"
"                     prod_gar_category,
"
"                     prod_grade_id,
"
"                     prod_make_id,
"
"                     prod_model,
"
"                     prod_pack_size,
"
"                     prod_subgroup_id,
"
"                     prod_group_id,
"
"                     prod_vert_class_id,
"
"                     prod_cre_by,
"
"                     prod_cre_date,
"
"               --prod_reg_date,
"
"               prod_thickness,
"
"               prod_width,
"
"               prod_length,
"
"               prod_net_weight,
"
"                     prod_status,
"
"                     prod_stocked,
"
"                     prod_saleable,
"
"                     prod_tc_req_flag,
"
"                     prod_dim_stk_req_flag,
"
"                     prod_ser_lot_opt,
"
"                     prod_ser_no_opt,
"
"                     prod_warr_flag,
"
"                     prod_warr_per,
"
"                     prod_warr_type,
"
"                     prod_expr_flag,
"
"                     prod_shelf_life_freq,
"
"                     prod_shelf_freq_period,
"
"                     prod_lead_time_source,
"
"                     prod_cons_type,
"
"                     prod_os_cons_type,
"
"                     prod_cost_method,
"
"                     prod_tolr_type,
"
"                     prod_mps_mrp,
"
"                     prod_strategy,
"
"                     prod_id_plng_pct,
"
"                     prod_pur_price_basis,
"
"               prod_stk_val_method
"
"                          )
"
"                    VALUES(p_bu,
"
"                           r_mirg_dtls(indx).sm_code,
"
"                           0,
"
"                          -- r_mirg_dtls(indx).sm_code,
"
"                           r_mirg_dtls(indx).sm_prod_desc,
"
"                           r_mirg_dtls(indx).sm_uom,
"
"                           r_mirg_dtls(indx).sm_sub_cls,
"
"                           v_cls_id,
"
"                           r_mirg_dtls(indx).sm_size,
"
"                           r_mirg_dtls(indx).sm_color,
"
"                           r_mirg_dtls(indx).sm_category,
"
"                           r_mirg_dtls(indx).sm_grade,
"
"                           r_mirg_dtls(indx).sm_make,
"
"                           r_mirg_dtls(indx).sm_model,
"
"                           r_mirg_dtls(indx).sm_pack_size,
"
"                           r_mirg_dtls(indx).sm_sub_grp,
"
"                           r_mirg_dtls(indx).sm_grp,
"
"                           r_mirg_dtls(indx).sm_vert_class,
"
"                           p_user,
"
"                           SYSDATE,
"
"               --SYSDATE,
"
"               0,
"
"               0,
"
"               0,
"
"               0,
"
"                           'A',
"
"                     v_prod_stocked,
"
"                     v_prod_saleable,
"
"                     v_prod_tc_req_flag,
"
"                     v_prod_dim_stk_req_flag,
"
"                     v_prod_ser_lot_opt,
"
"                     v_prod_ser_no_opt,
"
"                     v_prod_warr_flag,
"
"                     v_prod_warr_per,
"
"                     v_prod_warr_type,
"
"                     v_prod_expr_flag,
"
"                     v_prod_shelf_life_freq,
"
"                     v_prod_shelf_freq_period,
"
"                     v_prod_lead_time_source,
"
"                     v_prod_cons_type,
"
"                     v_prod_os_cons_type,
"
"                     v_prod_cost_method,
"
"                     v_prod_tolr_type,
"
"                     v_mps_mrp,
"
"                     v_strategy,
"
"                     v_id_plng_pct,
"
"                     v_pur_price_basis,
"
"               v_stk_val_method
"
"                          );
"
"
"
"      proc_ins_prodplnt_prefix(p_bu,
"
"                               p_plnt,
"
"                               r_mirg_dtls(indx).sm_sub_cls,
"
"                               v_po_pfx,
"
"                               v_dom_rct_pfx,
"
"                               v_imp_po_pfx,
"
"                               v_imp_rct_pfx,
"
"                               v_sc_pfx,
"
"                               v_sc_grn_pfx
"
"                              );
"
"
"
"      OPEN c_store;
"
"      FETCH c_store INTO cr_store;
"
"        IF c_store%NOTFOUND THEN
"
"          Raise_Application_Error(-20270,'ICM');
"
"        ELSE
"
"          v_store_id := cr_store.posdw_store_id;
"
"        END IF;
"
"      CLOSE c_store;
"
"
"
"      INSERT INTO prod_plants(prodplnt_bu,
"
"                        prodplnt_prod_id,
"
"                        prodplnt_prod_rev,
"
"                        prodplnt_prod_desc11,
"
"                        prodplnt_plnt,
"
"                        prodplnt_deflt_store_id,
"
"                        prodplnt_ship_store_id,
"
"                        prodplnt_cre_by,
"
"                        prodplnt_cre_date,
"
"                        prodplnt_cls,
"
"                        prodplnt_sub_cls,
"
"                        prodplnt_sub_elmnt,
"
"                        prodplnt_type,
"
"                        prodplnt_cls_type,
"
"                        prodplnt_status,
"
"                        prodplnt_rcpt_type,
"
"                        prodplnt_po_pfx,
"
"                        prodplnt_imp_po_pfx,
"
"                        prodplnt_dom_rct_pfx,
"
"                        prodplnt_imp_rct_pfx,
"
"                        prodplnt_sc_pfx,
"
"                        prodplnt_sc_grn_pfx,
"
"                        prodplnt_buyer_id,
"
"                  prodplnt_qc_oper,
"
"                  prodplnt_crit_type,
"
"                  prodplnt_mt_crit_type,
"
"                  prodplnt_mr_crit_type,
"
"                  prodplnt_sr_crit_type,
"
"                              prodplnt_rw_crit_type,
"
"                              prodplnt_source,
"
"                              prodplnt_first_oprn_mrevent,
"
"                              prodplnt_rest_oprn_mrevent
"
"                       )
"
"                     VALUES(p_bu,
"
"                            r_mirg_dtls(indx).sm_code,
"
"                            0,
"
"                            r_mirg_dtls(indx).sm_prod_desc,
"
"                            r_mirg_dtls(indx).sm_plnt,
"
"                            r_mirg_dtls(indx).sm_store,
"
"                            r_mirg_dtls(indx).sm_store,
"
"                            p_user,
"
"                            SYSDATE,
"
"                            v_cls_id,
"
"                            r_mirg_dtls(indx).sm_sub_cls,
"
"                            v_sub_elmnt,
"
"                            'P',
"
"                            v_cls_type,
"
"                            'A',
"
"                            'M',
"
"                            v_po_pfx,
"
"                            v_imp_po_pfx,
"
"                            v_dom_rct_pfx,
"
"                            v_imp_rct_pfx,
"
"                            v_sc_pfx,
"
"                            v_sc_grn_pfx,
"
"                            NULL,
"
"                              v_qc_oper,
"
"                  v_grn_crit_type,
"
"                  v_cmr_crit_type,
"
"                  v_mr_crit_type,
"
"                  v_sr_crit_type ,
"
"                              v_rw_crit_type,
"
"                              v_mfg_source,
"
"                              v_first_oprn_mnt,
"
"                              v_rest_oprn_mnt
"
"                           );
"
"
"
"    END LOOP;
"
"
"
"END proc_ins_pos_item_mig;*/
"
"
"
"PROCEDURE proc_ins_open_so_mig(p_bu     VARCHAR2,
"
"                               p_plnt    VARCHAR2,
"
"                               p_doc_no    VARCHAR2,
"
"                   p_fname    VARCHAR2,
"
"                   p_sep    VARCHAR2,
"
"                   p_user    VARCHAR2,
"
"                   p_res OUT VARCHAR2
"
"                  )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_seq_no    NUMBER;
"
"v_sub_seq_no    NUMBER;
"
"
"
"TYPE typ_ins_gpi IS RECORD (SM_CUST_ID             VARCHAR2(10),
"
"                SM_PO_NO             VARCHAR2(100),
"
"                SM_PO_DATE             DATE,
"
"                            SM_START_DATE         DATE,
"
"                            SM_END_DATE         DATE,
"
"                            SM_PROD_ID             VARCHAR2(100),
"
"                            SM_UOM              VARCHAR2(5),
"
"                            SM_PRICE             NUMBER,
"
"                            SM_CUST_PO_SEQ_NO       NUMBER,
"
"                            SM_DISC_PCT          NUMBER(5,2),
"
"                SM_CC_CODE            VARCHAR2(100),
"
"                SM_HSN_CODE            VARCHAR2(30)
"
"                            );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"p_res  := 'N';
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"       v_sql := 'CREATE TABLE scm_migration(SM_CUST_ID         VARCHAR2(10),
"
"                                            SM_PO_NO         VARCHAR2(100),
"
"                                            SM_PO_DATE         DATE,
"
"                                            SM_START_DATE     DATE,
"
"                                            SM_END_DATE     DATE,
"
"                                            SM_PROD_ID         VARCHAR2(100),
"
"                                            SM_UOM          VARCHAR2(5),
"
"                                            SM_PRICE         NUMBER,
"
"                                            SM_CUST_PO_SEQ_NO   NUMBER,
"
"                                            SM_DISC_PCT      NUMBER(5,2),
"
"                        SM_CC_CODE        VARCHAR2(100),
"
"                        SM_HSN_CODE        VARCHAR2(30)
"
"                                            )
"
"        ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"        ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"        SKIP 1
"
"        FIELDS TERMINATED BY '''||p_sep||'''
"
"        MISSING FIELD VALUES ARE NULL
"
"        REJECT ROWS WITH ALL NULL FIELDS(SM_CUST_ID          CHAR(255),
"
"                                         SM_PO_NO          CHAR(255),
"
"                                         SM_PO_DATE         CHAR(255),
"
"                                         SM_START_DATE      CHAR(255),
"
"                                         SM_END_DATE          CHAR(255),
"
"                                         SM_PROD_ID          CHAR(255),
"
"                                         SM_UOM         CHAR(255),
"
"                                                 SM_PRICE          CHAR(255),
"
"                                                 SM_CUST_PO_SEQ_NO      CHAR(255),
"
"                                                 SM_DISC_PCT         CHAR(255),
"
"                         SM_CC_CODE        CHAR(255),
"
"                         SM_HSN_CODE        CHAR(255)
"
"                                                 )
"
" )
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"Commit;
"
"
"
"BEGIN
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
"    --raise_application_error(-20999,'HRM'||'-'||p_sep);
"
"
"
"  DELETE sales_rate_contr_mig_ln
"
"   WHERE srcml_bu = p_bu
"
"     AND srcml_plnt = p_plnt
"
"     AND srcml_doc_no = p_doc_no;
"
"
"
"  DELETE sal_rate_contr_mig_oth_chrgs
"
"   WHERE srcmoc_bu = p_bu
"
"     AND srcmoc_plnt = p_plnt
"
"     AND srcmoc_doc_no = p_doc_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"     SELECT NVL(MAX(TO_NUMBER(srcml_seq_no)),0)+1
"
"       INTO v_seq_no
"
"       FROM sales_rate_contr_mig_ln
"
"      WHERE srcml_bu = p_bu
"
"        AND srcml_plnt = p_plnt
"
"        AND srcml_doc_no = p_doc_no;
"
"            INSERT INTO sales_rate_contr_mig_ln(srcml_bu,
"
"                        srcml_plnt,
"
"                        srcml_doc_no,
"
"                        srcml_seq_no,
"
"                        srcml_cust_id,
"
"                        srcml_po_no,
"
"                        srcml_po_date,
"
"                        srcml_start_date,
"
"                        srcml_end_date,
"
"                        srcml_prod_id,
"
"                        srcml_uom,
"
"                        srcml_prod_rev,
"
"                        srcml_price,
"
"                        srcml_cust_po_seq_no,
"
"                        srcml_disc_pct,
"
"                        srcml_tax_set_id,
"
"                        srcml_cre_by,
"
"                        srcml_cre_date,
"
"                        srcml_cc_code,
"
"                        srcml_hsn_code,
"
"                        srcml_chrg_qty,
"
"                        srcml_chrg_amt
"
"                        )
"
"                                         VALUES(p_bu,
"
"                                                p_plnt,
"
"                                                p_doc_no,
"
"                                                v_seq_no,
"
"                                                UPPER(TRIM(cr_st(indx).sm_cust_id)),
"
"                                                UPPER(TRIM(cr_st(indx).sm_po_no)),
"
"                                                TRUNC(cr_st(indx).sm_po_date),
"
"                                                cr_st(indx).sm_start_date,
"
"                                                cr_st(indx).sm_end_date,
"
"                                                UPPER(TRIM(cr_st(indx).sm_prod_id)),
"
"                                                UPPER(TRIM(cr_st(indx).sm_uom)),
"
"                                                0,
"
"                                                NVL(cr_st(indx).sm_price,0),
"
"                                                (CASE WHEN cr_st(indx).sm_cust_po_seq_no IS NULL THEN v_seq_no WHEN cr_st(indx).sm_cust_po_seq_no IS NOT NULL THEN cr_st(indx).sm_cust_po_seq_no END),
"
"                                                NVL(cr_st(indx).sm_disc_pct,0),
"
"                                                NULL,
"
"                                                p_user,
"
"                                                SYSDATE,
"
"                        TRIM(cr_st(indx).sm_cc_code),
"
"                        TRIM(cr_st(indx).sm_hsn_code),
"
"                        0,--NVL(cr_st(indx).sm_chrg_qty,0),
"
"                        0--NVL(cr_st(indx).sm_chrg_amt,0)
"
"                                                );
"
"
"
"    /* SELECT NVL(MAX(TO_NUMBER(srcmoc_sub_seq_no)),0)+1
"
"       INTO v_sub_seq_no
"
"       FROM sal_rate_contr_mig_oth_chrgs
"
"      WHERE srcmoc_bu = p_bu
"
"        AND srcmoc_plnt = p_plnt
"
"        AND srcmoc_doc_no = p_doc_no
"
"        AND srcmoc_seq_no = v_seq_no;
"
"
"
"       INSERT INTO sal_rate_contr_mig_oth_chrgs(srcmoc_bu,
"
"                        srcmoc_plnt,
"
"                        srcmoc_doc_no,
"
"                        srcmoc_seq_no,
"
"                        srcmoc_sub_seq_no,
"
"                        srcmoc_prod_id,
"
"                        srcmoc_prod_rev,
"
"                        srcmoc_hsn_code,
"
"                        srcmoc_qty,
"
"                        srcmoc_chrg_basis,
"
"                        srcmoc_chrg_pct,
"
"                        srcmoc_chrg_amt,
"
"                        srcmoc_gst_exempt_flag,
"
"                        srcmoc_gst_input_type,
"
"                        srcmoc_tcs_avail_flag,
"
"                        srcmoc_ln_prod_id,
"
"                        srcmoc_ln_prod_rev,
"
"                        srcmoc_cre_by,
"
"                        srcmoc_cre_ip_addr,
"
"                        srcmoc_cre_os_user,
"
"                        srcmoc_cre_emp_id,
"
"                        srcmoc_cre_date
"
"                        )
"
"                                         VALUES(p_bu,
"
"                                                p_plnt,
"
"                                                p_doc_no,
"
"                                                v_seq_no,
"
"                                                v_sub_seq_no,
"
"                                                UPPER(TRIM(cr_st(indx).sm_chrg_prod_id)),
"
"                                                NVL(cr_st(indx).sm_chrg_prod_rev,0),
"
"                                                NULL,
"
"                                                NVL(cr_st(indx).sm_chrg_qty,0),
"
"                                                'V',
"
"                                                0,
"
"                                                NVL(cr_st(indx).sm_chrg_amt,0),
"
"                                                'N',
"
"                                                'I',
"
"                                                'Y',
"
"                                                UPPER(TRIM(cr_st(indx).sm_prod_id)),
"
"                                                0,
"
"                                                p_user,
"
"                        Audit_Info.Get_IP_Address,
"
"                        Audit_Info.Get_OS_User,
"
"                        func_find_emp_id(p_bu,p_user),
"
"                        SYSDATE
"
"                                                );     */
"
"
"
"    p_res := 'Y';
"
"    END LOOP;
"
"  END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"END proc_ins_open_so_mig;
"
"
"
"PROCEDURE proc_ins_stk_cnt_mig(p_bu               business_units.bu_id%TYPE,
"
"                               p_plnt        stock_count_hd.schd_plnt%TYPE,
"
"                   p_ord_no        stock_count_hd.schd_ord_no%TYPE,
"
"                   p_store_id    stock_count_hd.schd_store_id%TYPE,
"
"                   p_file_name        stock_count_hd.schd_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user             stock_count_hd.schd_cre_by%TYPE,
"
"                   p_res    OUT    VARCHAR2,
"
"                   p_emp_user  VARCHAR2
"
"                  )
"
"AS
"
"
"
"CURSOR c_sch IS
"
"SELECT *
"
"  FROM stock_count_hd
"
" WHERE schd_bu = p_bu
"
"   AND schd_ord_no = p_ord_no;
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
"
"TYPE typ_stk_ctn IS RECORD(tsc_prod_id        VARCHAR2(100),
"
"                           tsc_prod_rev        NUMBER(5),
"
"               tsc_uom        VARCHAR2(5),
"
"               tsc_prod_ord_no    VARCHAR2(30),
"
"               tsc_compl_oper    VARCHAR2(110),
"
"               tsc_compl_proc_id    VARCHAR2(10),
"
"               tsc_lot_no        VARCHAR2(50),
"
"               tsc_ser_no        VARCHAR2(50),
"
"               tsc_so_pj_ref    VARCHAR2(200),
"
"                           tsc_qty         NUMBER(12,3),
"
"               tsc_bin_id VARCHAR2 (10)
"
"                          );
"
"
"
"TYPE typ_stk_ctn_dtls IS TABLE OF typ_stk_ctn INDEX BY PLS_INTEGER;
"
"r_sc    typ_stk_ctn_dtls;
"
"
"
"indx     NUMBER := 1;
"
"
"
"v_seq_no    NUMBER;
"
"
"
"r_sch        c_sch%ROWTYPE;
"
"
"
"v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"v_prod_indicator   stock_count_ln.scln_prod_indicator%TYPE;
"
"v_ser_lot_opt      stock_count_ln.scln_lot_type%TYPE;
"
"v_so_type          stock_count_ln.scln_so_type%TYPE;
"
"v_so_no            stock_count_ln.scln_so_no%TYPE;
"
"v_proj_id          stock_count_ln.scln_proj_id%TYPE;
"
"v_sys_ls_no        stock_count_ln.scln_sys_ls_no%TYPE;
"
"v_bin_id       stock_count_ln.scln_bin_id%TYPE;
"
"
"
"BEGIN
"
"
"
"  p_res := 'N';
"
"
"
"  OPEN c_sch;
"
"  FETCH c_sch INTO r_sch;
"
"  CLOSE c_sch;
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"v_sql := 'CREATE TABLE SCM_MIGRATION(SCLT_PROD_ID VARCHAR2(100),
"
"                     SCLT_PROD_REV NUMBER(5),
"
"                     SCLT_UOM VARCHAR2(5),
"
"                     SCLT_PROD_ORD_NO VARCHAR2(30),
"
"                     SCLT_COMPL_OPER VARCHAR2(110),
"
"                     SCLT_COMPL_PROC_ID VARCHAR2(10),
"
"                     SCLT_LOT_NO VARCHAR2(50),
"
"                     SCLT_SER_NO VARCHAR2(50),
"
"                     SCLT_SO_PJ_REF VARCHAR2(200),
"
"                     SCLT_PHY_COUNT_QTY NUMBER(12,3),
"
"             SCLT_BIN_ID VARCHAR2 (10)
"
"                    )
"
"                                    ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                    ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                    SKIP 1
"
"                    FIELDS TERMINATED BY '''||p_sep||'''
"
"                    MISSING FIELD VALUES ARE NULL
"
"                    REJECT ROWS WITH ALL NULL FIELDS
"
"                    (SCLT_PROD_ID  CHAR(255),
"
"                     SCLT_PROD_REV  CHAR(255),
"
"                     SCLT_UOM  CHAR(255),
"
"                     SCLT_PROD_ORD_NO CHAR(255),
"
"                     SCLT_COMPL_OPER CHAR(255),
"
"                     SCLT_COMPL_PROC_ID CHAR(255),
"
"                     SCLT_LOT_NO CHAR(255),
"
"                     SCLT_SER_NO CHAR(255),
"
"                     SCLT_SO_PJ_REF CHAR(255),
"
"                     SCLT_PHY_COUNT_QTY CHAR(255),
"
"             SCLT_BIN_ID CHAR(255)
"
"                    ))
"
"                    LOCATION ('''||p_file_name||''')
"
"                    ) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  EXECUTE IMMEDIATE 'SELECT * FROM SCM_MIGRATION'
"
"    BULK COLLECT INTO r_sc;
"
"
"
"
"
"  FOR indx IN 1..r_sc.COUNT
"
"  LOOP
"
"
"
"  -- Raise_Application_Error(-20999,'HRM'||'-'||r_sc(indx).tsc_qty||'-'||r_sc(indx).tsc_unit_cost);
"
"
"
"    UPDATE stock_count_ln
"
"       SET scln_phy_qty = r_sc(indx).tsc_qty
"
"           --scln_unit_cost = r_sc(indx).tsc_unit_cost
"
"     WHERE scln_bu = p_bu
"
"       AND (scln_ord_no = p_ord_no OR  p_ord_no IS NULL)
"
"       AND scln_prod_id = r_sc(indx).tsc_prod_id
"
"       AND scln_prod_rev = r_sc(indx).tsc_prod_rev
"
"       AND (scln_prod_ord_no = r_sc(indx).tsc_prod_ord_no OR (scln_prod_ord_no IS NULL AND r_sc(indx).tsc_prod_ord_no IS NULL))
"
"       AND (scln_compld_oprn_seq = r_sc(indx).tsc_compl_oper OR (scln_compld_oprn_seq IS NULL AND r_sc(indx).tsc_compl_oper IS NULL))
"
"       AND (scln_compld_proc_id = r_sc(indx).tsc_compl_proc_id OR (scln_compld_proc_id IS NULL AND r_sc(indx).tsc_compl_proc_id IS NULL))
"
"       AND (scln_lot_no = r_sc(indx).tsc_lot_no OR (scln_lot_no IS NULL AND r_sc(indx).tsc_lot_no IS NULL))
"
"       AND (scln_serial_no = r_sc(indx).tsc_ser_no OR (scln_serial_no IS NULL AND r_sc(indx).tsc_ser_no IS NULL))
"
"       AND (scln_bin_id = r_sc(indx).tsc_bin_id OR (scln_bin_id IS NULL AND r_sc(indx).tsc_bin_id IS NULL))
"
"       AND (scln_so_schld_desc = r_sc(indx).tsc_so_pj_ref OR (scln_so_schld_desc IS NULL AND r_sc(indx).tsc_so_pj_ref IS NULL));
"
"
"
"    IF SQL%NOTFOUND THEN
"
"
"
"      SELECT NVL(MAX(scln_seq_no),0) + 1
"
"        INTO v_seq_no
"
"        FROM stock_count_ln
"
"       WHERE scln_bu = p_bu
"
"         AND scln_ord_no = p_ord_no;
"
"
"
"  IF r_sc(indx).tsc_ser_no IS NOT NULL AND r_sc(indx).tsc_qty > 1 THEN
"
"   Raise_Application_Error(-20999,'Quantity shoud not be greater than one for Serial item'||'~'||r_sc(indx).tsc_prod_id||'~'||r_sc(indx).tsc_prod_rev);
"
"  END IF;
"
"
"
"
"
"IF r_sc(indx).tsc_prod_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT prod_indicator,
"
"           prod_ser_lot_opt
"
"      INTO v_prod_indicator,
"
"           v_ser_lot_opt
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = UPPER(r_sc(indx).tsc_prod_id)
"
"       AND prod_rev = NVL(UPPER(r_sc(indx).tsc_prod_rev),0);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"     v_prod_indicator := 'N';
"
"     v_ser_lot_opt := 'N';
"
"      END;
"
"END IF;
"
"
"
"IF r_sc(indx).tsc_so_pj_ref IS NOT NULL AND v_prod_indicator = 'I' THEN
"
"BEGIN
"
"SELECT Order_Type,
"
"       so_no,
"
"       prj_id
"
"  INTO v_so_type,
"
"       v_so_no,
"
"       v_proj_id
"
"  FROM (
"
"SELECT 'SO' Order_Type,
"
"       soh_order_no so_no,
"
"       NULL prj_id
"
"      FROM sales_order_hd
"
"     WHERE soh_bu = p_bu
"
"       AND soh_plant = p_plnt
"
"       AND soh_order_type ='SOG'
"
"       AND soh_status = 'A'
"
"       AND soh_order_no = r_sc(indx).tsc_so_pj_ref
"
"    UNION ALL
"
"    SELECT 'P' Order_type,NULL so_no,prj_proj_id prj_id
"
"      FROM projects
"
"     WHERE prj_bu = p_bu
"
"       AND prj_plnt = p_plnt
"
"       AND prj_status = 'A'
"
"       AND prj_proj_id = r_sc(indx).tsc_so_pj_ref
"
"       );
"
" EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20015,'SOM');
"
"END;
"
"
"
"END IF;
"
"
"
"
"
"IF v_ser_lot_opt = 'L' AND r_sc(indx).tsc_lot_no IS NULL THEN
"
"        Raise_Application_Error(-20969,'ICM');
"
"ELSIF v_ser_lot_opt = 'S' AND r_sc(indx).tsc_ser_no IS NULL THEN
"
"        Raise_Application_Error(-20970,'ICM');
"
"END IF;
"
"
"
" IF r_sc(indx).tsc_lot_no IS NOT NULL THEN
"
"  BEGIN
"
"
"
"  SELECT DISTINCT lss_sys_ls_no
"
"   INTO v_sys_ls_no
"
"  FROM lot_ser_stocks,stores,products
"
"  WHERE lss_bu = store_bu
"
"    AND lss_store_id = store_id
"
"    AND prod_bu = lss_bu
"
"    AND prod_id = lss_prod_id
"
"    AND prod_rev = lss_prod_rev
"
"    AND lss_bu = p_bu
"
"    AND lss_store_id = p_store_id
"
"    AND prod_ser_lot_opt = 'L'
"
"    AND prod_id = r_sc(indx).tsc_prod_id
"
"    AND prod_rev = r_sc(indx).tsc_prod_rev
"
"    AND lss_lot_no = r_sc(indx).tsc_lot_no;
"
"
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"v_sys_ls_no := null;
"
"END;
"
"END IF;
"
"
"
"IF r_sc(indx).tsc_bin_id IS NOT NULL THEN
"
"BEGIN
"
"SELECT stbin_bin_id
"
"  INTO v_bin_id
"
"  FROM store_bins,stores
"
" WHERE stbin_bu = store_bu
"
"    AND stbin_store_id = store_id
"
"    AND store_bu = p_bu
"
"    AND store_id = p_store_id
"
"    AND store_plnt = p_plnt
"
"    AND store_bin_flag = 'Y'
"
"    AND stbin_bin_id = r_sc(indx).tsc_bin_id;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20999,'Locator is not found.'||'~'||r_sc(indx).tsc_bin_id);
"
"END;
"
"END IF;
"
"
"
"
"
"
"
"
"
"      INSERT INTO stock_count_ln(scln_bu,
"
"                                 scln_ord_no,
"
"                                 scln_seq_no,
"
"                                 scln_matl_type,
"
"                                 scln_store_id,
"
"                                 scln_prod_id,
"
"                                 scln_prod_rev,
"
"                                 scln_prod_cls,
"
"                                 scln_prod_subcls,
"
"                                 scln_uom,
"
"                                 scln_prod_ord_no,
"
"                                 scln_compld_oprn_seq,
"
"                                 scln_compld_proc_id,
"
"                                 scln_lot_no,
"
"                                 scln_serial_no,
"
"                                 scln_so_schld_desc,
"
"                                 scln_sys_qty,
"
"                                 scln_phy_qty,
"
"                                 scln_unit_cost,
"
"                                 scln_prod_grp,
"
"                                 scln_prod_subgrp,
"
"                                 scln_cre_by,
"
"                                 scln_cre_date,
"
"                                 scln_cre_emp_id,
"
"                                 scln_cre_ip_addr,
"
"                                 scln_cre_os_user,
"
"                                 scln_prod_indicator,
"
"                                 scln_lot_type,
"
"                                 scln_source_type,
"
"                                 scln_source_id,
"
"                                 scln_test_no,
"
"                                 scln_heat_no,
"
"                                 scln_so_type,
"
"                                 scln_so_no,
"
"                                 scln_proj_id,
"
"                 scln_sys_ls_no,
"
"                 scln_bin_id,
"
"                 scln_mfg_date,
"
"                 scln_expiry_date
"
"                                )
"
"                          VALUES(p_bu,
"
"                                 p_ord_no,
"
"                                 v_seq_no,
"
"                                 CASE WHEN r_sc(indx).tsc_compl_proc_id IS NULL THEN 'S' ELSE 'F' END,
"
"                                 p_store_id,
"
"                                 r_sc(indx).tsc_prod_id,
"
"                                 r_sc(indx).tsc_prod_rev,
"
"                                 func_find_product_class(p_bu,r_sch.schd_plnt,r_sc(indx).tsc_prod_id,r_sc(indx).tsc_prod_rev),
"
"                                 func_find_product_subclass(p_bu,r_sch.schd_plnt,r_sc(indx).tsc_prod_id,r_sc(indx).tsc_prod_rev),
"
"                                 func_find_product_uom(p_bu,r_sc(indx).tsc_prod_id,r_sc(indx).tsc_prod_rev),
"
"                                 r_sc(indx).tsc_prod_ord_no,
"
"                                 r_sc(indx).tsc_compl_oper,
"
"                                 r_sc(indx).tsc_compl_proc_id,
"
"                                 CASE WHEN v_ser_lot_opt = 'L' THEN r_sc(indx).tsc_lot_no ELSE NULL END,
"
"                                 CASE WHEN v_ser_lot_opt = 'S' THEN r_sc(indx).tsc_ser_no ELSE NULL END,
"
"                                 CASE WHEN v_prod_indicator = 'N' THEN NULL ELSE r_sc(indx).tsc_so_pj_ref END,
"
"                                 0,
"
"                                 NVL(r_sc(indx).tsc_qty,0),
"
"                                 0,
"
"                                 func_find_prod_group_id(p_bu,r_sc(indx).tsc_prod_id,r_sc(indx).tsc_prod_rev),
"
"                                 func_find_prod_subgroup_id(p_bu,r_sc(indx).tsc_prod_id,r_sc(indx).tsc_prod_rev),
"
"                                 p_user,
"
"                                 SYSDATE,
"
"                                 p_emp_user,
"
"                                 v_ip_addr,
"
"                                 v_os_user,
"
"                                 NVL(v_prod_indicator,'N'),
"
"                                 NVL(v_ser_lot_opt,'N'),
"
"                                'S',
"
"                                 p_store_id,
"
"                                 r_sc(indx).tsc_lot_no,
"
"                                 r_sc(indx).tsc_lot_no,
"
"                                 CASE WHEN v_prod_indicator = 'N' THEN 'NA' ELSE NVL(v_so_type,'NA') END,
"
"                                 CASE WHEN v_prod_indicator = 'N' THEN NULL ELSE v_so_no END,
"
"                                 CASE WHEN v_prod_indicator = 'N' THEN NULL ELSE v_proj_id END,
"
"                         v_sys_ls_no,
"
"                 v_bin_id,
"
"                 TRUNC(SYSDATE),
"
"                 func_find_prod_exp_date(p_bu,r_sc(indx).tsc_prod_id,r_sc(indx).tsc_prod_rev,TRUNC(r_sch.schd_count_date))
"
"                                );
"
"                    p_res := 'Y';
"
"    END IF;
"
"
"
"  END LOOP;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_stk_cnt_mig;
"
"
"
"PROCEDURE proc_ins_stk_adj_mig(p_bu           business_units.bu_id%TYPE,
"
"                   p_plnt          stock_adj_trans_hd.sathd_plnt%TYPE,
"
"                   p_ord_no          stock_adj_trans_hd.sathd_ord_no%TYPE,
"
"                   p_store_id     stock_adj_trans_hd.sathd_store_id%TYPE,
"
"                   p_file_name    stock_adj_trans_hd.sathd_file_name%TYPE,
"
"                   p_sep          VARCHAR2,
"
"                   p_user         stock_adj_trans_hd.sathd_cre_by%TYPE,
"
"                   p_res    OUT    VARCHAR2
"
"                  )
"
"AS
"
"
"
"CURSOR c_prod(c_prod_id        VARCHAR2,
"
"              c_prod_rev    NUMBER) IS
"
"SELECT *
"
"  FROM products
"
" WHERE prod_bu = p_bu
"
"   AND prod_id = c_prod_id
"
"   AND prod_rev = c_prod_rev;
"
"
"
"  r_prod        c_prod%ROWTYPE;
"
"
"
"v_sql            CLOB;
"
"v_sql_lot        VARCHAR2(4000);
"
"v_sql_so        VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_seq_no        NUMBER(5);
"
"v_sub_seq_no        NUMBER;
"
"
"
"v_satln_uom        VARCHAR2(5);
"
"v_conv_factor        NUMBER(15,8);
"
"v_expr_flag        VARCHAR2(2);
"
"v_shelf_life_freq    VARCHAR2(200);
"
"v_shelf_freq_period    NUMBER;
"
"
"
"TYPE typ_stk_adj IS RECORD (sat_id_typ        VARCHAR2(1),
"
"                            sat_prod_id        VARCHAR2(100),
"
"                            sat_prod_rev    NUMBER(5),
"
"                            sat_prod_desc    VARCHAR2(150),
"
"                            sat_prod_ord_no     VARCHAR2(30),
"
"                sat_comp_oprn_no    VARCHAR2(20),
"
"                            sat_comp_proc_desc    VARCHAR2(100),
"
"                            sat_lot_no         VARCHAR2(50),
"
"                sat_test_no        VARCHAR2(50),
"
"                sat_heat_no        VARCHAR2(50),
"
"                            sat_serial_no    VARCHAR2(50),
"
"                            sat_so_proj_ref         VARCHAR2(200),
"
"                            sat_stk_qty        NUMBER(12,3),
"
"                            sat_unit_cost    NUMBER(17,5),
"
"                            sat_upd_po         VARCHAR2(1),
"
"                            sat_upd_pq         VARCHAR2(1),
"
"                            sat_upd_dc         VARCHAR2(1),
"
"                            sat_sc_rqrd_flag     VARCHAR2(1),
"
"                            sat_mfg_date    DATE,
"
"                sat_exp_date    DATE,
"
"                            sat_locator        VARCHAR2(100),
"
"                sat_ord_type    VARCHAR2(4),
"
"                sat_sco_pfx        VARCHAR2(5),
"
"                sat_sco_no        VARCHAR2(30),
"
"                sat_sco_seq_no    NUMBER(5)
"
"                           );
"
"
"
"TYPE typ_stk_adj_dtls IS TABLE OF typ_stk_adj INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_stk_adj_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"v_adj_pfx        stock_adjust_prefixes.sap_prefix%TYPE;
"
"v_adj_oper        stock_adjust_prefixes.sap_oper%TYPE;
"
"v_count            NUMBER(5);
"
"v_category        VARCHAR2(10);
"
"v_locator        VARCHAR2(10);
"
"v_exp_cnt        NUMBER(5);
"
"v_ser_lot_opt        VARCHAR(1);
"
"v_prod_cnt        NUMBER;
"
"v_sco_cnt        NUMBER;
"
"v_sco_pfx_cnt    NUMBER;
"
"v_prodplnt_cnt        NUMBER;
"
"v_proj_cnt        NUMBER(5);
"
"v_proj_desc        VARCHAR(200);
"
"v_proc_seq        stock_adj_trans_ln.satln_oprn_ln_seq_no%TYPE;
"
"v_proc_id        stock_adj_trans_ln.satln_process_id%TYPE;
"
"v_upd_queue_flag    VARCHAR2(1) := 'N';
"
"v_unit_cost        stock_adj_trans_ln.satln_unit_cost%TYPE;
"
"v_sys_ls_no        stock_adj_trans_bin.satb_sys_ls_no%TYPE;
"
"
"
"v_proc_cnt        NUMBER;
"
"v_bom_no        stock_adj_trans_ln.satln_bom_no%TYPE;
"
"v_sf_code        stock_adj_trans_ln.satln_sf_code%TYPE;
"
"v_cre_prod_ord_flag    VARCHAR2(1) := 'N';
"
"
"
"v_ls_type    products.prod_ser_lot_opt%TYPE;
"
"var_bom_no      stock_adj_trans_ln.satln_bom_no%TYPE;
"
" var_bom_name  VARCHAR(200);
"
" v_so_order_no     VARCHAR(200);
"
"
"
" v_so_type    stock_adj_trans_ln.satln_so_type%TYPE;
"
" v_so_no    stock_adj_trans_ln.satln_so_no%TYPE;
"
" v_so_seq_no    stock_adj_trans_ln.satln_so_seq_no%TYPE;
"
" v_proj_id    stock_adj_trans_ln.satln_proj_id%TYPE;
"
" v_task_id    stock_adj_trans_ln.satln_task_id%TYPE;
"
" v_so_ref    stock_adj_trans_ln.satln_so_schld_desc%TYPE;
"
"
"
" PROCEDURE  proc_ins_stk_adj_exp
"
" (p_bu        VARCHAR2,
"
"  p_ord_no    VARCHAR2,
"
"  p_type    VARCHAR2,
"
"  p_prod_id    VARCHAR2,
"
"  p_prod_rev    NUMBER,
"
"  p_prod_desc1    VARCHAR2,
"
"  p_exp_msg    VARCHAR2,
"
"  p_user    VARCHAR2)
"
" IS
"
" BEGIN
"
"   INSERT INTO stock_adj_mig_exp(same_bu,
"
"                                 same_ord_no,
"
"                 same_id_type,
"
"                 same_prod_id,
"
"                 same_prod_rev,
"
"                 same_prod_desc1,
"
"                 same_exp_msg,
"
"                 same_cre_by,
"
"                 same_cre_date)
"
"                          VALUES(p_bu,
"
"                     p_ord_no,
"
"                 p_type,
"
"                 p_prod_id,
"
"                 p_prod_rev,
"
"                 p_prod_desc1,
"
"                 p_exp_msg,
"
"                 p_user,
"
"                 SYSDATE);
"
" END;
"
"
"
"
"
"BEGIN
"
"
"
"  p_res := 'N';
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE SCM_MIGRATION(sat_id_typ        VARCHAR(1),
"
"                                         sat_prod_id        VARCHAR2(100),
"
"                                         sat_prod_rev        NUMBER(5),
"
"                                         sat_prod_desc        VARCHAR(150),
"
"                                         sat_prod_ord_no    VARCHAR(30),
"
"                     sat_comp_oprn_no    VARCHAR2(20),
"
"                                         sat_comp_proc_desc    VARCHAR(100),
"
"                                         sat_lot_no        VARCHAR(50),
"
"                     sat_test_no        VARCHAR2(50),
"
"                     sat_heat_no        VARCHAR2(50),
"
"                                         sat_serial_no        VARCHAR(50),
"
"                                         sat_so_proj_ref        VARCHAR(200),
"
"                                         sat_stk_qty        NUMBER(12,3),
"
"                                         sat_unit_cost        NUMBER(17,5),
"
"                                         sat_upd_po        VARCHAR2(1),
"
"                                         sat_upd_pq        VARCHAR2(1),
"
"                                         sat_upd_dc        VARCHAR2(1),
"
"                                         sat_sc_rqrd_flag    VARCHAR2(1),
"
"                                         sat_mfg_date        DATE,
"
"                     sat_exp_date        DATE,
"
"                                         sat_locator        VARCHAR2(100),
"
"                     sat_ord_type        VARCHAR2(4),
"
"                     sat_sco_pfx        VARCHAR2(5),
"
"                     sat_sco_no        VARCHAR2(30),
"
"                     sat_sco_seq_no        NUMBER(5)
"
"                                        )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '''||p_sep||''' OPTIONALLY ENCLOSED BY ''""''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (sat_id_typ          CHAR(255),
"
"                                         sat_prod_id          CHAR(255),
"
"                                         sat_prod_rev         CHAR(255),
"
"                                         sat_prod_desc      CHAR(255),
"
"                                         sat_prod_ord_no      CHAR(255),
"
"                                         sat_comp_oprn_no    CHAR(255),
"
"                     sat_comp_proc_desc    CHAR(255),
"
"                                         sat_lot_no         CHAR(255),
"
"                     sat_test_no         CHAR(255),
"
"                     sat_heat_no         CHAR(255),
"
"                                         sat_serial_no         CHAR(255),
"
"                                         sat_so_proj_ref         CHAR(255),
"
"                                         sat_stk_qty         CHAR(255),
"
"                                         sat_unit_cost         CHAR(255),
"
"                                         sat_upd_po         CHAR(255),
"
"                                         sat_upd_pq         CHAR(255),
"
"                                         sat_upd_dc         CHAR(255),
"
"                                         sat_sc_rqrd_flag     CHAR(255),
"
"                                         sat_mfg_date   CHAR(255),
"
"                                         sat_exp_date        CHAR(255) ,
"
"                                     sat_locator        CHAR(255),
"
"                     sat_ord_type        CHAR(255),
"
"                     sat_sco_pfx        CHAR(255),
"
"                     sat_sco_no        CHAR(255),
"
"                     sat_sco_seq_no        CHAR(255)
"
"                                        ))
"
"                                        LOCATION ('''||p_file_name||''')
"
"                                        )REJECT LIMIT UNLIMITED';
"
"
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE
"
"    FROM stock_adj_mig_exp
"
"   WHERE same_bu = p_bu
"
"     AND same_ord_no = p_ord_no;
"
"
"
"  OPEN c_st FOR 'SELECT NVL(sat_id_typ,''I'') sat_id_typ,sat_prod_id,sat_prod_rev,sat_prod_desc,sat_prod_ord_no,sat_comp_oprn_no,
"
"                        sat_comp_proc_desc,sat_lot_no,sat_test_no,sat_heat_no,sat_serial_no,sat_so_proj_ref,sat_stk_qty,
"
"            TO_NUMBER(REPLACE(NVL(sat_unit_cost,0),'','')) sat_unit_cost,sat_upd_po,sat_upd_pq,sat_upd_dc,sat_sc_rqrd_flag,
"
"            sat_mfg_date,sat_exp_date,sat_locator,sat_ord_type,sat_sco_pfx,sat_sco_no,sat_sco_seq_no
"
"                   FROM scm_migration
"
"                  WHERE sat_prod_id IS NOT NULL';
"
"  LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"    EXIT WHEN c_st%NOTFOUND;
"
"
"
"
"
"      --Raise_Application_Error(-20999,'HRM '||cr_st(indx).sat_id_typ);
"
"
"
"    IF cr_st(indx).sat_id_typ NOT IN ('I','D') OR cr_st(indx).sat_id_typ IS NULL THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Invalid Type',p_user);
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_prod_id IS NULL THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Item ID must be entered.',p_user);
"
"    ELSE
"
"      BEGIN
"
"
"
"        SELECT COUNT(*) INTO v_prod_cnt
"
"          FROM products
"
"         WHERE prod_bu = p_bu
"
"           AND prod_id = cr_st(indx).sat_prod_id
"
"           AND prod_rev = cr_st(indx).sat_prod_rev;
"
"
"
"        IF v_prod_cnt = 0 THEN
"
"          proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Item not found in master.',p_user);
"
"        END IF;
"
"
"
"      END;
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_ord_type NOT IN ('PO','SCOP','SCOV','NA')THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Invalid Ord. Type.',p_user);
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_sco_no IS NOT NULL THEN
"
"      BEGIN
"
"
"
"        SELECT COUNT(*) INTO v_sco_cnt
"
"          FROM pur_order_hd,pur_order_ln
"
"         WHERE poh_bu = pol_bu
"
"           AND poh_order_no = poL_order_no
"
"           AND poh_bu = p_bu
"
"           AND poh_mode = 'SC'
"
"           AND poh_order_no = cr_st(indx).sat_sco_no
"
"       AND poh_order_pfx = cr_st(indx).sat_sco_pfx
"
"       AND poh_type = cr_st(indx).sat_ord_type;
"
"
"
"        IF v_sco_cnt = 0 THEN
"
"          proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'SCO No. not found.',p_user);
"
"        END IF;
"
"      END;
"
"    END IF;
"
"
"
"      IF cr_st(indx).sat_sco_pfx IS NOT NULL THEN
"
"        BEGIN
"
"
"
"      SELECT COUNT(*) INTO v_sco_pfx_cnt
"
"        FROM pur_order_hd,pur_order_ln
"
"       WHERE poh_bu = pol_bu
"
"         AND poh_order_no = poL_order_no
"
"         AND poh_bu = p_bu
"
"         AND poh_mode = 'SC'
"
"     AND poh_order_pfx = cr_st(indx).sat_sco_pfx
"
"     AND poh_type = cr_st(indx).sat_ord_type;
"
"
"
"      IF v_sco_pfx_cnt = 0 THEN
"
"        proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'SCO Pfx. not found.',p_user);
"
"      END IF;
"
"    END;
"
"   END IF;
"
"
"
"    IF cr_st(indx).sat_stk_qty IS NULL THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Quantity should not be null.',p_user);
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_stk_qty <= 0 THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Quantity should be greater than zero.',p_user);
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_serial_no IS NOT NULL AND cr_st(indx).sat_stk_qty <> 1 THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Serial Item Quantity should be one.',p_user);
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_unit_cost IS NULL AND cr_st(indx).sat_id_typ <> 'D' THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Unit cost should not be null.',p_user);
"
"    END IF;
"
"
"
"    /*IF cr_st(indx).sat_proj IS NOT NULL THEN
"
"       BEGIN
"
"         SELECT COUNT(*) INTO v_proj_cnt
"
"           FROM projects
"
"          WHERE prj_bu = p_bu
"
"            AND prj_plnt = p_plnt
"
"            AND prj_proj_id = cr_st(indx).sat_proj
"
"            AND prj_status <> 'N';
"
"       END;
"
"       IF v_proj_cnt = 0 THEN
"
"          proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Project not found.',p_user);
"
"       END IF;
"
"    END IF;*/
"
"
"
"    IF cr_st(indx).sat_unit_cost <= 0 AND cr_st(indx).sat_id_typ <> 'D' THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Unit cost should be greater than zero.',p_user);
"
"    END IF;
"
"
"
"    BEGIN
"
"      SELECT COUNT(*) INTO v_prodplnt_cnt
"
"        FROM prod_plants
"
"       WHERE prodplnt_bu = p_bu
"
"         AND prodplnt_plnt = p_plnt
"
"     AND prodplnt_prod_id = cr_st(indx).sat_prod_id
"
"         AND prodplnt_prod_rev = cr_st(indx).sat_prod_rev;
"
"
"
"      IF v_prodplnt_cnt = 0 THEN
"
"        proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Item not associated with the unit.',p_user);
"
"      END IF;
"
"    END;
"
"
"
"    IF cr_st(indx).sat_comp_proc_desc IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT COUNT(*) INTO v_proc_cnt
"
"          FROM mfg_oprns
"
"         WHERE mfgo_bu = p_bu
"
"           AND mfgo_desc1 = cr_st(indx).sat_comp_proc_desc;
"
"
"
"        IF v_proc_cnt = 0 THEN
"
"          proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Process not found - '||cr_st(indx).sat_comp_proc_desc,p_user);
"
"        END IF;
"
"      END;
"
"
"
"      IF cr_st(indx).sat_comp_oprn_no IS NULL THEN
"
"        proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Completed Operation No. must be entered.',p_user);
"
"      END IF;
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_id_typ = 'D' AND cr_st(indx).sat_comp_proc_desc IS NOT NULL THEN
"
"
"
"      BEGIN
"
"
"
"        SELECT prod_ser_lot_opt INTO v_ls_type
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = cr_st(indx).sat_prod_id
"
"       AND prod_rev = cr_st(indx).sat_prod_rev;
"
"
"
"    IF v_ls_type = 'L' AND cr_st(indx).sat_lot_no IS NULL THEN
"
"          proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Lot No. must be entered.',p_user);
"
"    ELSIF v_ls_type = 'S' AND cr_st(indx).sat_serial_no IS NULL THEN
"
"      proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Serial No. must be entered.',p_user);
"
"    END IF;
"
"
"
"    IF v_ls_type = 'L' AND cr_st(indx).sat_lot_no IS NOT NULL THEN
"
"
"
"          BEGIN
"
"            SELECT bomhd_bom_no INTO v_bom_no
"
"              FROM bom_hd
"
"             WHERE bomhd_bu = p_bu
"
"               AND bomhd_plnt = p_plnt
"
"               AND bomhd_prod_id = cr_st(indx).sat_prod_id
"
"               AND bomhd_prod_rev = cr_st(indx).sat_prod_rev
"
"               AND TRUNC (SYSDATE) BETWEEN TRUNC (bomhd_eff_from)AND TRUNC (bomhd_eff_to)
"
"               AND bomhd_status = 'A'
"
"               AND bomhd_primary = 'Y';
"
"          EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN
"
"          proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'BOM not found.',p_user);
"
"          END;
"
"
"
"          v_sf_code := NULL;
"
"
"
"          FOR r_proc IN (SELECT pror_seq_no
"
"                           FROM prod_order_routing_view
"
"                          WHERE pror_bu = p_bu
"
"                            AND pror_plnt = p_plnt
"
"                            AND pror_ord_no = cr_st(indx).sat_prod_ord_no
"
"                            AND cr_st(indx).sat_prod_ord_no IS NOT NULL
"
"                          UNION ALL
"
"                         SELECT rouln_oprn_no
"
"                           FROM routing_ln
"
"                          WHERE rouln_bu = p_bu
"
"                            AND rouln_plnt = p_plnt
"
"                            AND rouln_bom_no = v_bom_no
"
"                            AND cr_st(indx).sat_prod_ord_no IS NULL
"
"             )
"
"          LOOP
"
"            v_sf_code := v_sf_code||'0';
"
"          END LOOP;
"
"
"
"          FOR r_tar IN (SELECT proc_seq pror_seq_no
"
"                          FROM (SELECT ROW_NUMBER() OVER (ORDER BY pror_seq_no ASC) proc_seq,pror_seq_no,pror_oprn_id,pror_oprn_ln_seq,mfgo_desc1
"
"                                  FROM prod_order_routing_view,mfg_oprns
"
"                                 WHERE mfgo_bu = pror_bu
"
"                                   AND mfgo_oprn_id = pror_oprn_id
"
"                                   AND pror_bu = p_bu
"
"                                   AND pror_plnt = p_plnt
"
"                                   AND pror_ord_no = cr_st(indx).sat_prod_ord_no)
"
"                         WHERE mfgo_desc1 = cr_st(indx).sat_comp_proc_desc
"
"                           AND pror_oprn_ln_seq = cr_st(indx).sat_comp_oprn_no
"
"                           AND cr_st(indx).sat_prod_ord_no IS NOT NULL
"
"                         UNION ALL
"
"                        SELECT proc_seq
"
"                          FROM (SELECT ROW_NUMBER() OVER (ORDER BY rouln_oprn_no ASC) proc_seq,rouln_oprn_no,rouln_oprn_ln_seq,rouln_oprn_id,mfgo_desc1
"
"                                  FROM routing_ln,mfg_oprns
"
"                                 WHERE mfgo_bu = rouln_bu
"
"                                   AND mfgo_oprn_id = rouln_oprn_id
"
"                                   AND rouln_bu = p_bu
"
"                                   AND rouln_plnt = p_plnt
"
"                                   AND rouln_bom_no = v_bom_no)
"
"                         WHERE mfgo_desc1 = cr_st(indx).sat_comp_proc_desc
"
"                           AND rouln_oprn_ln_seq = cr_st(indx).sat_comp_oprn_no
"
"                           AND cr_st(indx).sat_prod_ord_no IS NULL
"
"                         ORDER BY 1)
"
"          LOOP
"
"            FOR i IN 1..r_tar.pror_seq_no
"
"            LOOP
"
"              v_sf_code := func_find_upd_prod_sfg_code(v_sf_code,i);
"
"            END LOOP;
"
"          END LOOP;
"
"
"
"      BEGIN
"
"
"
"            SELECT stsfs_sys_ls_no INTO v_sys_ls_no
"
"              FROM store_sf_stocks
"
"             WHERE stsfs_bu = p_bu
"
"               AND stsfs_store_id = p_store_id
"
"               AND stsfs_prod_id = cr_st(indx).sat_prod_id
"
"               AND stsfs_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"           AND stsfs_sf_code = v_sf_code
"
"               AND (stsfs_ord_no = cr_st(indx).sat_prod_ord_no OR (stsfs_ord_no IS NULL AND cr_st(indx).sat_prod_ord_no IS NULL))
"
"               AND (stsfs_lot_no = cr_st(indx).sat_lot_no OR (stsfs_lot_no IS NULL AND cr_st(indx).sat_lot_no IS NULL))
"
"           AND stsfs_qty >= 0;
"
"      EXCEPTION
"
"        WHEN OTHERS THEN
"
"            proc_ins_stk_adj_exp(p_bu,cr_st(indx).sat_prod_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Lot No. stock not available.',p_user);
"
"          END;
"
"
"
"      BEGIN
"
"            SELECT SUM(stsfs_qty * stsfs_unit_cost)/SUM(stsfs_qty) INTO v_unit_cost
"
"              FROM store_sf_stocks
"
"             WHERE stsfs_bu = p_bu
"
"               AND stsfs_store_id = p_store_id
"
"               AND stsfs_prod_id = cr_st(indx).sat_prod_id
"
"               AND stsfs_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"               AND (stsfs_ord_no = cr_st(indx).sat_prod_ord_no OR (stsfs_ord_no IS NULL AND cr_st(indx).sat_prod_ord_no IS NULL))
"
"               AND stsfs_sf_code = v_sf_code
"
"               AND (stsfs_sys_ls_no = v_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND v_sys_ls_no IS NULL))
"
"               AND stsfs_qty > 0;
"
"      EXCEPTION
"
"        WHEN OTHERS THEN
"
"            proc_ins_stk_adj_exp(p_bu,cr_st(indx).sat_prod_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Lot No. stock not available..',p_user);
"
"          END;
"
"
"
"    END IF;
"
"
"
"      EXCEPTION
"
"        WHEN OTHERS THEN NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    BEGIN
"
"      SELECT prod_ser_lot_opt INTO v_ls_type
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = cr_st(indx).sat_prod_id
"
"         AND prod_rev = cr_st(indx).sat_prod_rev;
"
"      IF v_ls_type = 'L' AND cr_st(indx).sat_serial_no IS NOT NULL THEN
"
"        proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Lot No. item Serial No. not allowed.',p_user);
"
"      ELSIF v_ls_type = 'S' AND cr_st(indx).sat_lot_no IS NOT NULL THEN
"
"        proc_ins_stk_adj_exp(p_bu,p_ord_no,cr_st(indx).sat_id_typ,cr_st(indx).sat_prod_id,cr_st(indx).sat_prod_rev,cr_st(indx).sat_prod_desc,'Serial No. item Lot No. not allowed.',p_user);
"
"      END IF;
"
"    EXCEPTION
"
"      WHEN OTHERS THEN NULL;
"
"    END;
"
"
"
"  END LOOP;
"
"  CLOSE c_st;
"
"
"
"  BEGIN
"
"    SELECT COUNT(*) INTO v_exp_cnt
"
"      FROM stock_adj_mig_exp
"
"     WHERE same_bu = p_bu
"
"       AND same_ord_no = p_ord_no;
"
"  END;
"
"
"
"  IF v_exp_cnt > 0 THEN
"
"    Commit;
"
"    Raise_Application_Error(-20300,'PLN ');
"
"  END IF;
"
"
"
"  OPEN c_st FOR 'SELECT NVL(sat_id_typ,''I'') sat_id_typ,sat_prod_id,sat_prod_rev,sat_prod_desc,sat_prod_ord_no,sat_comp_oprn_no,
"
"                        sat_comp_proc_desc,sat_lot_no,sat_test_no,sat_heat_no,sat_serial_no,sat_so_proj_ref,
"
"            sat_stk_qty,TO_NUMBER(REPLACE(sat_unit_cost,'','')) sat_unit_cost,
"
"            sat_upd_po,sat_upd_pq,sat_upd_dc,sat_sc_rqrd_flag,sat_mfg_date,sat_exp_date,sat_locator,
"
"        sat_ord_type,sat_sco_pfx,sat_sco_no,sat_sco_seq_no
"
"           FROM scm_migration';
"
"  LOOP
"
"
"
"
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_st;
"
"
"
"  DELETE FROM stock_adj_trans_bin
"
"   WHERE satb_bu = p_bu
"
"     AND satb_ord_no = p_ord_no;
"
"
"
"  DELETE FROM stock_adj_trans_ln
"
"   WHERE satln_bu = p_bu
"
"     AND satln_ord_no = p_ord_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    BEGIN
"
"      SELECT sap_prefix,sap_oper
"
"        INTO v_adj_pfx,v_adj_oper
"
"        FROM stock_adjust_prefixes
"
"       WHERE sap_bu = p_bu
"
"         AND sap_oper = TRIM(cr_st(indx).sat_id_typ)
"
"     AND sap_status = 'A'
"
"     AND ROWNUM = 1;
"
"    /*EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN */
"
"    END;
"
"
"
"    /*IF cr_st(indx).sat_category IS NOT NULL THEN
"
"        BEGIN
"
"          SELECT gpc_id
"
"            INTO v_category
"
"            FROM gar_prod_category
"
"           WHERE gpc_bu = p_bu
"
"             AND gpc_name = TRIM(cr_st(indx).sat_category);
"
"        EXCEPTION
"
"          WHEN OTHERS THEN v_category := NULL;
"
"      END;
"
"    ELSE
"
"      v_category := NULL;
"
"    END IF;*/
"
"
"
"    IF cr_st(indx).sat_locator IS NOT NULL THEN
"
"        BEGIN
"
"          SELECT stbin_bin_id
"
"            INTO v_locator
"
"          FROM (SELECT stbin_bin_id
"
"                  FROM store_bins,stock_adj_trans_hd
"
"                 WHERE stbin_bu = sathd_bu
"
"                   AND sathd_bu = p_bu
"
"                   AND sathd_ord_no = p_ord_no
"
"                   AND stbin_store_id = sathd_store_id
"
"                   AND stbin_type <> 'S'
"
"                   AND (stbin_bin_desc1 = TRIM(cr_st(indx).sat_locator) OR stbin_bin_id = TRIM(cr_st(indx).sat_locator))
"
"                UNION ALL
"
"                SELECT stbin_bin_id
"
"                  FROM store_bins,stock_adj_trans_hd,bin_prod_ass
"
"                 WHERE stbin_bu = sathd_bu
"
"                   AND sathd_bu = p_bu
"
"                   AND sathd_ord_no = p_ord_no
"
"                   AND stbin_store_id = sathd_store_id
"
"                   AND stbin_bu = bpa_bu
"
"                   AND stbin_store_id = bpa_store_id
"
"                   AND stbin_bin_id = bpa_bin_id
"
"                   AND bpa_prod_id = cr_st(indx).sat_prod_id
"
"                   AND bpa_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"                   AND stbin_type = 'S'
"
"                   AND bpa_status = 'A'
"
"                   AND (stbin_bin_desc1 = TRIM(cr_st(indx).sat_locator) OR stbin_bin_id = TRIM(cr_st(indx).sat_locator))
"
"                   AND bpa_capacity >= cr_st(indx).sat_stk_qty);
"
"        EXCEPTION WHEN OTHERS THEN
"
"          Raise_Application_error(-20284,'ICM');
"
"      END;
"
"    ELSE
"
"      v_locator := NULL;
"
"    END IF;
"
"
"
"    v_satln_uom   := func_find_product_uom(p_bu,cr_st(indx).sat_prod_id,NVL(cr_st(indx).sat_prod_rev,0));
"
"    v_conv_factor := func_find_uom_conversion(p_bu,
"
"                           cr_st(indx).sat_prod_id,
"
"                           NVL(cr_st(indx).sat_prod_rev,0),
"
"                           v_satln_uom,
"
"                           v_satln_uom
"
"                               );
"
"
"
"    IF cr_st(indx).sat_prod_id IS NULL THEN
"
"      Raise_Application_Error(-20260,'ICM ');
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_stk_qty IS NULL OR cr_st(indx).sat_stk_qty <= 0 THEN
"
"      Raise_Application_Error(-20045,'ICM ');
"
"    END IF;
"
"
"
"    IF TRIM(cr_st(indx).sat_id_typ) <> 'D' AND (cr_st(indx).sat_unit_cost IS NULL OR cr_st(indx).sat_unit_cost <= 0) THEN
"
"      Raise_Application_Error(-20005,'ICM ');
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_so_proj_ref IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT sprv_sop_type,sprv_so_no,sprv_so_seq_no,sprv_proj_id,sprv_task_id
"
"      INTO v_so_type,v_so_no,v_so_seq_no,v_proj_id,v_task_id
"
"      FROM so_proj_ref_vw
"
"     WHERE sprv_bu = p_bu
"
"       AND sprv_plnt = p_plnt
"
"       AND sprv_sop_ref = cr_st(indx).sat_so_proj_ref;
"
"
"
"        v_so_ref := cr_st(indx).sat_so_proj_ref;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20999,'SO/Project Reference not found.');
"
"      END;
"
"    ELSE
"
"      v_so_type := 'NA';
"
"      v_so_no := NULL;
"
"      v_so_seq_no := NULL;
"
"      v_proj_id := NULL;
"
"      v_task_id := NULL;
"
"      v_so_ref := NULL;
"
"    END IF;
"
"
"
"IF v_proj_id IS NOT NULL THEN
"
"       BEGIN
"
"         SELECT prj_name1 INTO v_proj_desc
"
"           FROM projects
"
"          WHERE prj_bu = p_bu
"
"            AND prj_plnt = p_plnt
"
"            AND prj_proj_id = v_proj_id
"
"            AND prj_status <> 'N';
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN
"
"         Raise_Application_Error(-20651,'PRJ'||'~'||v_proj_id);
"
"       END;
"
"END IF;
"
"
"
"    OPEN c_prod(cr_st(indx).sat_prod_id,NVL(cr_st(indx).sat_prod_rev,0));
"
"    FETCH c_prod INTO r_prod;
"
"    CLOSE c_prod;
"
"
"
"    IF cr_st(indx).sat_comp_proc_desc IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bomhd_bom_no INTO v_bom_no
"
"          FROM bom_hd
"
"         WHERE bomhd_bu = p_bu
"
"           AND bomhd_plnt = p_plnt
"
"           AND bomhd_prod_id = cr_st(indx).sat_prod_id
"
"           AND bomhd_prod_rev = cr_st(indx).sat_prod_rev
"
"           AND TRUNC (SYSDATE) BETWEEN TRUNC (bomhd_eff_from)AND TRUNC (bomhd_eff_to)
"
"           AND bomhd_status = 'A'
"
"       AND bomhd_primary = 'Y';
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20999,'HRM BOM not found.'||p_plnt||'/'||cr_st(indx).sat_prod_id||cr_st(indx).sat_prod_rev);
"
"      END;
"
"
"
"      v_sf_code := NULL;
"
"
"
"      FOR r_proc IN (SELECT rouln_oprn_no,rouln_oprn_ln_seq,rouln_oprn_id,mfgo_desc1
"
"                   FROM bom_hd,routing_ln,mfg_oprns
"
"              WHERE bomhd_bu = rouln_bu
"
"                AND bomhd_plnt = rouln_plnt
"
"                AND bomhd_bom_no = rouln_bom_no
"
"                AND mfgo_bu = rouln_bu
"
"                AND mfgo_oprn_id = rouln_oprn_id
"
"                AND bomhd_bu = p_bu
"
"                AND bomhd_plnt = p_plnt
"
"                AND bomhd_prod_id = cr_st(indx).sat_prod_id
"
"                AND bomhd_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"                AND bomhd_primary = 'Y'
"
"                AND bomhd_status = 'A'
"
"              ORDER BY rouln_oprn_no ASC)
"
"      LOOP
"
"        v_sf_code := v_sf_code||'0';
"
"      END LOOP;
"
"
"
"      FOR r_tar IN (SELECT ROWNUM rno,rouln_oprn_no,rouln_oprn_ln_seq,rouln_oprn_id,mfgo_desc1
"
"                  FROM (SELECT rouln_oprn_no,rouln_oprn_ln_seq,rouln_oprn_id,mfgo_desc1
"
"                          FROM bom_hd,routing_ln,mfg_oprns
"
"                     WHERE bomhd_bu = rouln_bu
"
"                       AND bomhd_plnt = rouln_plnt
"
"                       AND bomhd_bom_no = rouln_bom_no
"
"                       AND mfgo_bu = rouln_bu
"
"                       AND mfgo_oprn_id = rouln_oprn_id
"
"                       AND bomhd_bu = p_bu
"
"                       AND bomhd_plnt = p_plnt
"
"                       AND bomhd_prod_id = cr_st(indx).sat_prod_id
"
"                       AND bomhd_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"                       AND bomhd_primary = 'Y'
"
"                       AND bomhd_status = 'A'
"
"                     ORDER BY rouln_oprn_no ASC))
"
"      LOOP
"
"        IF cr_st(indx).sat_comp_oprn_no = r_tar.rouln_oprn_ln_seq AND cr_st(indx).sat_comp_proc_desc = r_tar.mfgo_desc1 THEN
"
"      v_sf_code := func_find_upd_prod_sfg_code(v_sf_code,r_tar.rno);
"
"      EXIT;
"
"    ELSE
"
"      v_sf_code := func_find_upd_prod_sfg_code(v_sf_code,r_tar.rno);
"
"    END IF;
"
"      END LOOP;
"
"    ELSE
"
"      v_sf_code := NULL;
"
"    END IF;
"
"
"
"    UPDATE stock_adj_trans_ln
"
"       SET satln_trans_qty = satln_trans_qty + cr_st(indx).sat_stk_qty
"
"     WHERE satln_bu = p_bu
"
"       AND satln_ord_no = p_ord_no
"
"       AND satln_adj_prefix = v_adj_pfx
"
"       AND satln_prod_id = cr_st(indx).sat_prod_id
"
"       AND satln_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"       AND (satln_so_schld_desc = v_so_ref OR (satln_so_schld_desc IS NULL AND v_so_ref IS NULL))
"
"       AND (satln_po_ord_no  = cr_st(indx).sat_prod_ord_no OR (satln_po_ord_no IS NULL AND cr_st(indx).sat_prod_ord_no IS NULL))
"
"       AND (satln_sf_code = v_sf_code OR (satln_sf_code IS NULL AND v_sf_code IS NULL))
"
"       AND ((TRIM(cr_st(indx).sat_id_typ) = 'I' AND satln_unit_cost = cr_st(indx).sat_unit_cost) OR TRIM(cr_st(indx).sat_id_typ) = 'D')
"
"       AND (satln_os_ord_pfx = cr_st(indx).sat_sco_pfx OR (satln_os_ord_pfx IS NULL AND cr_st(indx).sat_sco_pfx IS NULL))
"
"       AND (satln_os_ord_no = cr_st(indx).sat_sco_no OR (satln_os_ord_no IS NULL AND cr_st(indx).sat_sco_no IS NULL))
"
"       AND (satln_os_ord_seq_no = cr_st(indx).sat_sco_seq_no OR (satln_os_ord_seq_no IS NULL AND cr_st(indx).sat_sco_seq_no IS NULL))
"
"     RETURNING satln_seq_no INTO v_seq_no;
"
"
"
"    IF SQL%NOTFOUND THEN
"
"
"
"      BEGIN
"
"        SELECT COUNT(*)
"
"      INTO v_count
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = cr_st(indx).sat_prod_id
"
"       AND prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"       AND prod_status = 'A';
"
"         IF v_count = 0 THEN
"
"       RAISE_APPLICATION_ERROR(-20260,'ICM');
"
"     END IF;
"
"      END;
"
"
"
"      IF TRIM(cr_st(indx).sat_id_typ) = 'D' THEN
"
"
"
"        IF cr_st(indx).sat_comp_proc_desc IS NULL THEN
"
"          v_unit_cost := func_find_unitcost(p_bu,cr_st(indx).sat_prod_id,NVL(cr_st(indx).sat_prod_rev,0),p_store_id);
"
"        ELSE
"
"
"
"      IF cr_st(indx).sat_lot_no IS NOT NULL OR cr_st(indx).sat_serial_no IS NOT NULL THEN
"
"            BEGIN
"
"              SELECT stsfs_sys_ls_no
"
"                INTO v_sys_ls_no
"
"                FROM store_sf_stocks
"
"               WHERE stsfs_bu = p_bu
"
"                 AND stsfs_store_id = p_store_id
"
"                 AND stsfs_prod_id = cr_st(indx).sat_prod_id
"
"                 AND stsfs_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"                 AND (stsfs_ord_no = cr_st(indx).sat_prod_ord_no OR (stsfs_ord_no IS NULL AND cr_st(indx).sat_prod_ord_no IS NULL))
"
"                 AND stsfs_sf_code = v_sf_code
"
"                 AND (stsfs_lot_no = cr_st(indx).sat_lot_no OR (stsfs_lot_no IS NULL AND cr_st(indx).sat_lot_no IS NULL))
"
"                 AND stsfs_qty > 0;
"
"            EXCEPTION
"
"              WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20251,'ICM ');
"
"            END;
"
"      ELSE
"
"        v_sys_ls_no := NULL;
"
"      END IF;
"
"
"
"
"
"          BEGIN
"
"            SELECT SUM(stsfs_qty * stsfs_unit_cost)/SUM(stsfs_qty)
"
"              INTO v_unit_cost
"
"              FROM store_sf_stocks
"
"             WHERE stsfs_bu = p_bu
"
"               AND stsfs_store_id = p_store_id
"
"               AND stsfs_prod_id = cr_st(indx).sat_prod_id
"
"               AND stsfs_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"               AND (stsfs_ord_no = cr_st(indx).sat_prod_ord_no OR (stsfs_ord_no IS NULL AND cr_st(indx).sat_prod_ord_no IS NULL))
"
"               AND stsfs_sf_code = v_sf_code
"
"               AND (stsfs_sys_ls_no = v_sys_ls_no OR (stsfs_sys_ls_no IS NULL AND v_sys_ls_no IS NULL))
"
"               AND stsfs_qty > 0;
"
"          EXCEPTION
"
"            WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20251,'ICM ');
"
"          END;
"
"
"
"-- v_unit_cost := func_find_sfg_unitcost(p_bu,cr_st(indx).sat_prod_id,NVL(cr_st(indx).sat_prod_rev,0),p_store_id,cr_st(indx).sat_prod_ord_no,v_sf_code,NULL);
"
"        END IF;
"
"      ELSE
"
"        v_unit_cost := cr_st(indx).sat_unit_cost;
"
"    v_sys_ls_no := NULL;
"
"      END IF;
"
"
"
"     IF v_unit_cost IS NULL THEN
"
"        Raise_Application_Error(-20005,'ICM '||p_bu||'/'||cr_st(indx).sat_prod_id||'/'||NVL(cr_st(indx).sat_prod_rev,0)
"
"    ||'/'||p_store_id||'/'||cr_st(indx).sat_prod_ord_no||'/'||v_sf_code||'/'||cr_st(indx).sat_lot_no||'/'||v_sys_ls_no||'/'||cr_st(indx).sat_comp_proc_desc||'-'||v_unit_cost);
"
"      END IF;
"
"
"
"      BEGIN
"
"        IF v_sf_code IS NOT NULL AND INSTR(v_sf_code,'1') <> 0 THEN
"
"
"
"      IF TRIM(cr_st(indx).sat_id_typ) = 'D' THEN
"
"        v_upd_queue_flag := 'Y';
"
"      END IF;
"
"
"
"      IF TRIM(cr_st(indx).sat_id_typ) = 'I' THEN
"
"        v_cre_prod_ord_flag := 'Y';
"
"      END IF;
"
"
"
"      IF cr_st(indx).sat_prod_ord_no IS NOT NULL THEN
"
"        BEGIN
"
"        SELECT pror_oprn_ln_seq,pror_oprn_id
"
"          INTO v_proc_seq,v_proc_id
"
"          FROM (SELECT ROWNUM rno,pror_seq_no,pror_oprn_ln_seq,pror_oprn_id
"
"                  FROM (SELECT pror_seq_no,pror_oprn_ln_seq,pror_oprn_id
"
"                  FROM prod_order_routing
"
"             WHERE pror_bu = p_bu
"
"               AND pror_plnt = p_plnt
"
"               AND pror_ord_no = cr_st(indx).sat_prod_ord_no
"
"             ORDER BY pror_seq_no ASC))
"
"         WHERE rno = INSTR(v_sf_code,'1',-1);
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20999,'HRM Prod. Order not found.'||p_plnt||'/'||cr_st(indx).sat_prod_ord_no);
"
"        END;
"
"      ELSE
"
"        BEGIN
"
"        SELECT rouln_oprn_ln_seq,rouln_oprn_id
"
"          INTO v_proc_seq,v_proc_id
"
"          FROM (SELECT ROWNUM rno,rouln_oprn_no,rouln_oprn_ln_seq,rouln_oprn_id
"
"                  FROM (SELECT rouln_oprn_no,rouln_oprn_ln_seq,rouln_oprn_id
"
"                  FROM bom_hd,routing_ln
"
"             WHERE bomhd_bu = rouln_bu
"
"               AND bomhd_plnt = rouln_plnt
"
"               AND bomhd_bom_no = rouln_bom_no
"
"               AND bomhd_bu = p_bu
"
"               AND bomhd_plnt = p_plnt
"
"               AND bomhd_prod_id = cr_st(indx).sat_prod_id
"
"               AND bomhd_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"               AND bomhd_primary = 'Y'
"
"               AND bomhd_status = 'A'
"
"             ORDER BY rouln_oprn_no ASC))
"
"         WHERE rno = INSTR(v_sf_code,'1',-1);
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN Raise_Application_Error(-20999,'HRM BOM not found.'||p_plnt||'/'||cr_st(indx).sat_prod_id||cr_st(indx).sat_prod_rev);
"
"        END;
"
"      END IF;
"
"    ELSE
"
"      v_proc_seq := NULL;
"
"      v_proc_id := NULL;
"
"      v_upd_queue_flag := 'N';--NVL(cr_st(indx).sat_upd_pq,'N');
"
"        END IF;
"
"      END;
"
"
"
"      SELECT NVL(MAX(satln_seq_no),0) + 1
"
"        INTO v_seq_no
"
"        FROM stock_adj_trans_ln
"
"       WHERE satln_bu = p_bu
"
"         AND satln_ord_no = p_ord_no;
"
"
"
"
"
"BEGIN
"
"   SELECT bomhd_bom_no,
"
"          bomhd_bom_name
"
"     INTO var_bom_no,
"
"          var_bom_name
"
"      FROM bom_hd
"
"     WHERE bomhd_bu = p_bu
"
"       AND bomhd_plnt = p_plnt
"
"       AND bomhd_prod_id = cr_st(indx).sat_prod_id
"
"       AND bomhd_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"       AND (TRUNC (SYSDATE) BETWEEN TRUNC (bomhd_eff_from)AND TRUNC (bomhd_eff_to))
"
"       AND bomhd_status = 'A'
"
"       AND bomhd_primary = 'Y';
"
"EXCEPTION WHEN OTHERS THEN
"
"   var_bom_no := NULL;
"
"   var_bom_name := NULL;
"
"END;
"
"
"
"
"
"      INSERT INTO stock_adj_trans_ln(satln_bu,
"
"                     satln_ord_no,
"
"                     satln_seq_no,
"
"                     satln_adj_prefix,
"
"             satln_adj_oper,
"
"                     satln_prod_id,
"
"                     satln_prod_rev,
"
"                     satln_uom,
"
"                     satln_prod_uom,
"
"                     satln_conv_factor,
"
"                     satln_class_id,
"
"                     satln_trans_qty,
"
"                     satln_unit_cost,
"
"                     satln_status,
"
"                     satln_prodn_ord_flag,
"
"                     satln_mat_type,
"
"                     satln_dc_cre_flag,
"
"                     satln_upd_prodn_queue,
"
"                     satln_sc_rqrd_flag,
"
"                     satln_po_ord_no,
"
"                     satln_sf_code,
"
"                     satln_cre_by,
"
"                     satln_cre_date,
"
"                     satln_so_type,
"
"                     satln_so_no,
"
"             satln_so_seq_no,
"
"                     satln_proj_id,
"
"             satln_task_id,
"
"                     satln_so_schld_desc,
"
"                     satln_oprn_ln_seq_no,
"
"                     satln_process_id,
"
"             satln_ord_type,
"
"             satln_os_ord_pfx,
"
"             satln_os_ord_no,
"
"             satln_os_ord_seq_no,
"
"         satln_bom_no,
"
"         satln_bom_name,
"
"         satln_ls_opt
"
"            )
"
"                  VALUES(p_bu,
"
"                         p_ord_no,
"
"                         v_seq_no,
"
"                         v_adj_pfx,v_adj_oper,
"
"                         cr_st(indx).sat_prod_id,
"
"                         NVL(cr_st(indx).sat_prod_rev,0),
"
"                         v_satln_uom,
"
"                         v_satln_uom,
"
"                         v_conv_factor,
"
"                         func_find_product_class(p_bu,p_plnt,cr_st(indx).sat_prod_id,NVL(cr_st(indx).sat_prod_rev,0)),
"
"                         cr_st(indx).sat_stk_qty,
"
"                         v_unit_cost,--cr_st(indx).sat_unit_cost,
"
"                         'E',
"
"                         v_cre_prod_ord_flag,--NVL(cr_st(indx).sat_upd_po,'N'),
"
"                         CASE WHEN v_sf_code IS NULL THEN 'S' ELSE 'F' END,
"
"                         NVL(cr_st(indx).sat_upd_dc,'N'),
"
"                         v_upd_queue_flag,
"
"                         NVL(cr_st(indx).sat_sc_rqrd_flag,'N'),
"
"                         cr_st(indx).sat_prod_ord_no,
"
"                         v_sf_code,
"
"                         p_user,
"
"                         SYSDATE,
"
"                         v_so_type,v_so_no,v_so_seq_no,v_proj_id,v_task_id,v_so_ref,
"
"                     v_proc_seq,
"
"                     v_proc_id,
"
"                     CASE WHEN cr_st(indx).sat_ord_type IS NULL /*AND v_cre_prod_ord_flag = 'Y'*/ THEN 'PO' ELSE NVL(cr_st(indx).sat_ord_type,'NA') END,
"
"                     cr_st(indx).sat_sco_pfx,
"
"                     cr_st(indx).sat_sco_no,
"
"                     cr_st(indx).sat_sco_seq_no,
"
"                 var_bom_no,
"
"                 var_bom_name,
"
"             (SELECT prod_ser_lot_opt FROM products  WHERE prod_bu = p_bu
"
"                         AND prod_id = cr_st(indx).sat_prod_id
"
"                        AND prod_rev = NVL(cr_st(indx).sat_prod_rev,0))
"
"                        );
"
"
"
"      p_res := 'Y';
"
"    END IF;
"
"   /* IF cr_st(indx).sat_prod_id = 'FG1151015' THEN
"
"       Raise_application_error(-20999,'HRM'||'/'||cr_st(indx).sat_lot_no||'/'||cr_st(indx).sat_serial_no||'/'||cr_st(indx).sat_stk_qty);
"
"    END IF;   */
"
"
"
"    BEGIN
"
"      SELECT prod_ser_lot_opt,prod_expr_flag,prod_shelf_life_freq,prod_shelf_freq_period
"
"        INTO v_ser_lot_opt,v_expr_flag,v_shelf_life_freq,v_shelf_freq_period
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = cr_st(indx).sat_prod_id
"
"         AND prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"         AND prod_status = 'A';
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_ser_lot_opt := 'N';
"
"      v_expr_flag:= 'N';
"
"      v_shelf_life_freq := 'M';
"
"      v_shelf_freq_period := 0;
"
"    END;
"
"
"
"  --Raise_Application_Error(-20999,'HRM'||'-'||v_ser_lot_opt||'-'||cr_st(indx).sat_lot_no||'-'||v_locator);
"
"
"
"    IF (v_ser_lot_opt NOT IN ('N') AND (cr_st(indx).sat_lot_no IS NOT NULL OR cr_st(indx).sat_serial_no IS NOT NULL OR v_locator IS NOT NULL)) OR v_locator IS NOT NULL THEN
"
"
"
"      /*UPDATE stock_adj_trans_bin
"
"         SET satb_trans_qty  = satb_trans_qty + cr_st(indx).sat_stk_qty
"
"       WHERE satb_bu = p_bu
"
"         AND satb_ord_no = p_ord_no
"
"         AND satb_seq_no = v_seq_no
"
"         AND (satb_lot_no = cr_st(indx).sat_lot_no OR cr_st(indx).sat_lot_no IS NULL)
"
"     AND (satb_test_no = cr_st(indx).sat_test_no OR cr_st(indx).sat_test_no IS NULL)
"
"     AND (satb_heat_no = cr_st(indx).sat_heat_no OR cr_st(indx).sat_heat_no IS NULL)
"
"         AND (satb_ser_no = cr_st(indx).sat_serial_no OR cr_st(indx).sat_serial_no IS NULL)
"
"     AND (satb_length = cr_st(indx).sat_length OR cr_st(indx).sat_length IS NULL)
"
"     AND (satb_bin_id = v_locator OR v_locator IS NULL)
"
"       RETURNING satb_sub_seq_no INTO v_sub_seq_no;*/ --Comment by Mohamed Yasir
"
"
"
"  --Raise_Application_Error(-20999,cr_st(indx).sat_mfg_date||'~'||cr_st(indx).sat_exp_date);
"
"
"
"     --IF SQL%NOTFOUND THEN
"
"
"
"
"
"
"
"
"
"        SELECT NVL(MAX(satb_sub_seq_no),0) + 1
"
"          INTO v_sub_seq_no
"
"          FROM stock_adj_trans_bin
"
"         WHERE satb_bu = p_bu
"
"           AND satb_ord_no = p_ord_no
"
"           AND satb_seq_no = v_seq_no;
"
"
"
"        INSERT INTO stock_adj_trans_bin(satb_bu,
"
"                        satb_ord_no,
"
"                        satb_seq_no,
"
"                        satb_sub_seq_no,
"
"                        satb_trans_qty,
"
"                        satb_sys_ls_no,
"
"                        satb_lot_no,
"
"                        satb_test_no,
"
"                        satb_ser_no,
"
"                        satb_gross_weight,
"
"                        satb_tar_weight,
"
"                        satb_lot_wgt,
"
"                        satb_cre_by,
"
"                        satb_cre_date,
"
"                    satb_source_id,
"
"                    satb_source_type,
"
"                    satb_mfg_date,
"
"                    satb_bin_id,
"
"                    satb_heat_no,
"
"                    satb_expiry_date
"
"                       )
"
"                     VALUES(p_bu,
"
"                        p_ord_no,
"
"                        v_seq_no,
"
"                        v_sub_seq_no,
"
"                        cr_st(indx).sat_stk_qty,
"
"                        CASE WHEN v_ser_lot_opt = 'N' THEN NULL ELSE v_sys_ls_no END,
"
"                        CASE WHEN v_ser_lot_opt = 'N' THEN NULL ELSE cr_st(indx).sat_lot_no END,
"
"                        CASE WHEN v_ser_lot_opt = 'N' THEN NULL ELSE cr_st(indx).sat_test_no END,
"
"                        CASE WHEN v_ser_lot_opt = 'N' THEN NULL ELSE cr_st(indx).sat_serial_no END,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        p_user,
"
"                        SYSDATE,
"
"                    p_store_id,
"
"                    'O',
"
"                    NVL(cr_st(indx).sat_mfg_date,TRUNC(SYSDATE)),
"
"                    v_locator,
"
"                    CASE WHEN v_ser_lot_opt = 'N' THEN NULL ELSE cr_st(indx).sat_heat_no END,
"
"                    /*CASE WHEN v_expr_flag = 'Y' THEN
"
"                         (CASE WHEN v_shelf_life_freq = 'D' THEN TRUNC(NVL(cr_st(indx).sat_mfg_date,TRUNC(SYSDATE)))+v_shelf_freq_period
"
"                              WHEN v_shelf_life_freq = 'M' THEN ADD_MONTHS(TRUNC(NVL(cr_st(indx).sat_mfg_date,TRUNC(SYSDATE))),v_shelf_freq_period)
"
"                              WHEN v_shelf_life_freq = 'Y' THEN ADD_MONTHS(TRUNC(NVL(cr_st(indx).sat_mfg_date,TRUNC(SYSDATE))),(v_shelf_freq_period * 12))
"
"                         END)
"
"                    ELSE NULL
"
"                    END*/
"
"                    cr_st(indx).sat_exp_date
"
"                       );
"
"      --END IF;
"
"
"
"    END IF;
"
"
"
"  END LOOP;
"
"
"
"  --proc_ins_stk_adj_lot_ser(p_bu,p_ord_no,p_user);
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_stk_adj_mig;
"
"
"
"
"
"PROCEDURE proc_ins_open_po_mig(p_bu        business_units.bu_id%TYPE,
"
"                               p_doc_no        pur_rate_contr_mig_hd.prcmh_doc_no%TYPE,
"
"                               p_fname        pur_rate_contr_mig_hd.prcmh_file_name%TYPE,
"
"                               p_sep        VARCHAR2,
"
"                       p_res  OUT    VARCHAR2,
"
"                               p_user        pur_rate_contr_mig_hd.prcmh_cre_by%TYPE
"
"                              )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_seq_no    NUMBER;
"
"
"
"TYPE typ_opo IS RECORD (opo_unit_loc        VARCHAR2(100),
"
"                        opo_unit        VARCHAR2(100),
"
"            opo_suplr_id        VARCHAR2(10),
"
"            opo_suplr_name        VARCHAR2(100),
"
"            opo_eff_from        DATE,
"
"            opo_eff_to        DATE,
"
"            opo_prod_id        VARCHAR2(100),
"
"            opo_prod_rev        NUMBER(5),
"
"            opo_prod_desc        VARCHAR2(150),
"
"            opo_uom            VARCHAR2(5),
"
"            opo_price         NUMBER(17,5),
"
"            opo_cpc_code            VARCHAR2(100),
"
"            opo_hsn_code        VARCHAR2(30),
"
"            opo_disc_pct        NUMBER(5,2),
"
"                        opo_reference           VARCHAR2(100)
"
"               );
"
"
"
"TYPE typ_opo_tab IS TABLE OF typ_opo INDEX BY PLS_INTEGER;
"
"r_opo    typ_opo_tab;
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
"v_plnt        bus_unit_plants.bup_plant_id%TYPE;
"
"v_plnt_loc_id    bus_unit_plants_loc_dtls.bupld_loc_id%TYPE;
"
"v_suplr_name    suppliers.suplr_name1%TYPE;
"
"v_prod_desc    products.prod_desc11%TYPE;
"
"v_tax_set_id    VARCHAR2(10);
"
"v_cpc_code      profit_cost_centers.pcc_cc_code%TYPE;
"
"v_chk_suplr    VARCHAR2(100);
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(sm_unit_loc        VARCHAR2(100),
"
"                                         sm_unit        VARCHAR2(100),
"
"                     sm_suplr_id        VARCHAR2(10),
"
"                     sm_suplr_name        VARCHAR2(100),
"
"                     sm_eff_from        DATE,
"
"                     sm_eff_to        DATE,
"
"                     sm_prod_id        VARCHAR2(100),
"
"                     sm_prod_rev        NUMBER(5),
"
"                     sm_prod_desc        VARCHAR2(150),
"
"                     sm_uom         VARCHAR2(5),
"
"                     sm_price         NUMBER(17,5),
"
"                     sm_cpc_code            VARCHAR2(100),
"
"                     sm_hsn_code        VARCHAR2(30),
"
"                     sm_disc_pct        NUMBER(5,2),
"
"                     sm_reference           VARCHAR2(100)
"
"                     )
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
"                              (SM_UNIT_LOC CHAR(255),
"
"                               SM_UNIT CHAR(255),
"
"                               SM_SUPLR_ID CHAR(255),
"
"                               SM_SUPLR_NAME CHAR(255),
"
"                               SM_EFF_FROM CHAR(255),
"
"                               SM_EFF_TO CHAR(255),
"
"                               SM_PROD_ID  CHAR(255),
"
"                               SM_PROD_REV  CHAR(255),
"
"                               SM_PROD_DESC  CHAR(255),
"
"                               SM_UOM  CHAR(255),
"
"                               SM_PRICE  CHAR(255),
"
"                               SM_CPC_CODE CHAR(255),
"
"                               SM_HSN_CODE CHAR(255),
"
"                               SM_DISC_PCT CHAR(255),
"
"                               SM_REFERENCE CHAR(255)
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
"  DELETE pur_rate_contr_mig_ln
"
"   WHERE prcml_bu = p_bu
"
"     AND prcml_doc_no = p_doc_no;
"
"
"
"  p_res := 'N';
"
"
"
"  v_seq_no := 0;
"
"
"
"  OPEN c_ref FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"
"
"    indx := indx + 1;
"
"    FETCH c_ref INTO r_opo(indx);
"
"    EXIT WHEN c_ref%NOTFOUND;
"
"
"
"IF r_opo(indx).opo_unit IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Unit must be entered.');
"
"END IF;
"
"
"
"IF r_opo(indx).opo_unit IS NOT NULL THEN
"
"    BEGIN
"
"        SELECT bup_plant_id INTO v_plnt
"
"          FROM bus_unit_plants
"
"                 WHERE bup_bu = p_bu
"
"           AND (bup_plant_id = UPPER(r_opo(indx).opo_unit) OR bup_name1 = UPPER(r_opo(indx).opo_unit));
"
"    EXCEPTION
"
"         WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20483,'Unit not found. ');
"
"        END;
"
"END IF;
"
"
"
"IF r_opo(indx).opo_unit_loc IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Location must be entered.');
"
"END IF;
"
"
"
"    IF r_opo(indx).opo_unit_loc IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bupld_loc_id INTO v_plnt_loc_id
"
"          FROM bus_unit_plants_loc_dtls
"
"         WHERE bupld_bu = p_bu
"
"           AND (bupld_loc_id = UPPER(r_opo(indx).opo_unit_loc) OR bupld_loc_name = UPPER(r_opo(indx).opo_unit_loc));
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20483,'Unit not found. ');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_suplr_id IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Supplier ID must be entered.');
"
"    END IF;
"
"
"
"
"
"    IF r_opo(indx).opo_suplr_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT suplr_name1 INTO v_suplr_name
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = UPPER(r_opo(indx).opo_suplr_id);
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20118,'Supplier not  found.');
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_suplr_name IS NULL THEN
"
"    raise_application_error(-20999,'Supplier name must be entered.');
"
"    END IF;
"
"
"
"     IF r_opo(indx).opo_suplr_name IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT suplr_name1 INTO v_chk_suplr
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = UPPER(r_opo(indx).opo_suplr_id)
"
"       AND suplr_name1 = UPPER(r_opo(indx).opo_suplr_name);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20999,' Supplier name not found.');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_prod_id IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Item must be entered.');
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_prod_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT prod_desc11 INTO v_prod_desc
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = UPPER(r_opo(indx).opo_prod_id)
"
"       AND prod_rev = NVL(UPPER(r_opo(indx).opo_prod_rev),0);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20260,'ICM '||UPPER(r_opo(indx).opo_prod_id));
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_cpc_code IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'CPC code must be entered.');
"
"    END IF;
"
"
"
"
"
"    IF r_opo(indx).opo_cpc_code IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT  pcc_cc_code INTO v_cpc_code
"
"      FROM profit_cost_centers
"
"     WHERE pcc_bu = p_bu
"
"       AND pcc_cc_code = UPPER(r_opo(indx).opo_cpc_code);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20999,'HRM '||'CPC code not found');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_eff_from IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Start date must be entered.');
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_eff_to IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'End date must be entered.');
"
"    END IF;
"
"
"
"    IF r_opo(indx).opo_price IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'Price must be entered.');
"
"    END IF;
"
"
"
"    v_seq_no := v_seq_no + 1;
"
"
"
"    INSERT INTO pur_rate_contr_mig_ln(prcml_bu,
"
"                      prcml_doc_no,
"
"                      prcml_seq_no,
"
"                                      prcml_plnt,
"
"                      prcml_plnt_loc_id,
"
"                      prcml_suplr_id,
"
"                      prcml_suplr_name,
"
"                      prcml_po_start_date,
"
"                      prcml_po_end_date,
"
"                      prcml_prod_id,
"
"                      prcml_prod_rev,
"
"                      prcml_prod_desc,
"
"                      prcml_uom,
"
"                      prcml_po_price,
"
"                      prcml_disc_pct,
"
"                      prcml_cre_by,
"
"                      prcml_cre_date,
"
"                      prcml_cpc_code,
"
"                      prcml_reference,
"
"                      prcml_hsn_code,
"
"                      prcml_po_qty,
"
"                      prcml_excp_rqrd_flag,
"
"                      prcml_status
"
"                     )
"
"                   VALUES(p_bu,
"
"                          p_doc_no,
"
"                      v_seq_no,
"
"                      v_plnt,
"
"                      v_plnt_loc_id,
"
"                      r_opo(indx).opo_suplr_id,
"
"                      v_suplr_name,
"
"                      r_opo(indx).opo_eff_from,
"
"                      r_opo(indx).opo_eff_to,
"
"                      r_opo(indx).opo_prod_id,
"
"                      NVL(r_opo(indx).opo_prod_rev,0),
"
"                      v_prod_desc,
"
"                      r_opo(indx).opo_uom,
"
"                      r_opo(indx).opo_price,
"
"                      r_opo(indx).opo_disc_pct,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      r_opo(indx).opo_cpc_code,
"
"                      r_opo(indx).opo_reference,
"
"                      r_opo(indx).opo_hsn_code,
"
"                      0,
"
"                      'N',
"
"                      'N'
"
"                     );
"
"
"
"   p_res   :=   'Y';
"
"
"
"  END LOOP;
"
"  CLOSE c_ref;
"
"
"
"  /*v_sql := 'INSERT INTO pur_rate_contr_mig_ln(prcml_bu,prcml_plnt,prcml_doc_no,prcml_seq_no,
"
"            prcml_suplr_id,prcml_po_start_date,prcml_po_end_date,
"
"            prcml_prod_id,prcml_prod_rev,prcml_uom,prcml_po_price,prcml_disc_pct,prcml_tax_set_id,prcml_cre_by,prcml_cre_date)
"
"              SELECT '''||p_bu||''',sm_unit,'''||p_doc_no||''',ROWNUM,
"
"              sm_suplr_id,sm_eff_from,sm_eff_to,sm_prod_id,'''||0||''',sm_uom,sm_price,sm_disc_pct,sm_tax_set_id,
"
"              '''||p_user||''',SYSDATE
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;*/
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_open_po_mig;
"
"
"
"PROCEDURE proc_ins_open_sc_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        sc_rate_contr_mig_hd.scrcmh_doc_no%TYPE,
"
"                   p_fname        sc_rate_contr_mig_hd.scrcmh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        sc_rate_contr_mig_hd.scrcmh_cre_by%TYPE
"
"                  )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_seq_no    NUMBER;
"
"v_ln_seq_no    NUMBER;
"
"v_proc_seq_no    NUMBER;
"
"
"
"TYPE typ_opo IS RECORD (osco_unit_loc        VARCHAR2(100),
"
"                        osco_unit        VARCHAR2(100),
"
"            osco_suplr_id        VARCHAR2(10),
"
"            osco_suplr_name        VARCHAR2(100),
"
"            osco_eff_from        DATE,
"
"            osco_eff_to        DATE,
"
"            osco_prod_id        VARCHAR2(100),
"
"            osco_prod_rev        NUMBER(5),
"
"            osco_prod_desc        VARCHAR2(150),
"
"            osco_uom        VARCHAR2(5),
"
"            osco_disc_pct        NUMBER(5,2),
"
"            osco_tax_set_desc    VARCHAR2(10),
"
"            osco_hsn_code           VARCHAR2(25),
"
"            osco_oprn_no        VARCHAR2(110),
"
"            osco_process        VARCHAR2(100),
"
"            osco_price         NUMBER(17,5)
"
"               );
"
"
"
"TYPE typ_opo_tab IS TABLE OF typ_opo INDEX BY PLS_INTEGER;
"
"r_opo    typ_opo_tab;
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
"v_plnt        bus_unit_plants.bup_plant_id%TYPE;
"
"v_plnt_loc_id    bus_unit_plants_loc_dtls.bupld_loc_id%TYPE;
"
"v_suplr_name    suppliers.suplr_name1%TYPE;
"
"v_prod_desc    products.prod_desc11%TYPE;
"
"v_proc_id    mfg_oprns.mfgo_desc1%TYPE;
"
"v_hsn_sac_code  hsn_sac_tax_rates.hstr_hsnsac_code%TYPE;
"
"
"
"v_emp_id        VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"v_ip_addr        VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user        VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
"
"v_prod_id      products.prod_id%TYPE;
"
"v_prod_rev    NUMBER(6);
"
"v_prod_uom    VARCHAR2(10);
"
"v_prod_hsn    VARCHAR2(25);
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(sm_unit_loc        VARCHAR2(100),
"
"                                         sm_unit        VARCHAR2(100),
"
"                     sm_suplr_id        VARCHAR2(10),
"
"                     sm_suplr_name        VARCHAR2(100),
"
"                     sm_eff_from        DATE,
"
"                     sm_eff_to        DATE,
"
"                     sm_prod_id        VARCHAR2(100),
"
"                     sm_prod_rev        NUMBER(5),
"
"                     sm_prod_desc        VARCHAR2(150),
"
"                     sm_uom         VARCHAR2(5),
"
"                     sm_disc_pct        NUMBER(5,2),
"
"                     sm_tax_set_desc    VARCHAR2(100),
"
"                     sm_hsn_code            VARCHAR2(25),
"
"                     sm_oprn_no        VARCHAR2(110),
"
"                     sm_process        VARCHAR2(100),
"
"                     sm_price         NUMBER(17,5)
"
"                    )
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
"                              (SM_UNIT_LOC CHAR(255),
"
"                               SM_UNIT CHAR(255),
"
"                               SM_SUPLR_ID CHAR(255),
"
"                               SM_SUPLR_NAME CHAR(255),
"
"                               SM_EFF_FROM CHAR(255),
"
"                               SM_EFF_TO CHAR(255),
"
"                               SM_PROD_ID  CHAR(255),
"
"                               SM_PROD_REV  CHAR(255),
"
"                               SM_PROD_DESC  CHAR(255),
"
"                               SM_UOM  CHAR(255),
"
"                               SM_DISC_PCT CHAR(255),
"
"                               SM_TAX_SET_DESC CHAR(255),
"
"                               SM_HSN_CODE CHAR(255),
"
"                               SM_OPRN_NO CHAR(255),
"
"                               SM_PROCESS CHAR(255),
"
"                               SM_PRICE  CHAR(255)
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
"  DELETE FROM sc_rate_contr_mig_proc
"
"   WHERE scrcmp_bu = p_bu
"
"     AND scrcmp_doc_no = p_doc_no;
"
"
"
"  DELETE FROM sc_rate_contr_mig_ln
"
"   WHERE scrcml_bu = p_bu
"
"     AND scrcml_doc_no = p_doc_no;
"
"
"
"  v_seq_no := 0;
"
"
"
"  OPEN c_ref FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"
"
"    indx := indx + 1;
"
"    FETCH c_ref INTO r_opo(indx);
"
"    EXIT WHEN c_ref%NOTFOUND;
"
"
"
"    IF r_opo(indx).osco_unit IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bup_plant_id INTO v_plnt
"
"      FROM bus_unit_plants
"
"     WHERE bup_bu = p_bu
"
"       AND (bup_plant_id = UPPER(r_opo(indx).osco_unit) OR bup_name1 = UPPER(r_opo(indx).osco_unit));
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20483,'ADM ');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).osco_unit_loc IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bupld_loc_id INTO v_plnt_loc_id
"
"      FROM bus_unit_plants_loc_dtls
"
"     WHERE bupld_bu = p_bu
"
"       AND (bupld_loc_id = UPPER(r_opo(indx).osco_unit_loc) OR bupld_loc_name = UPPER(r_opo(indx).osco_unit_loc));
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20483,'ADM ');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).osco_suplr_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT suplr_name1 INTO v_suplr_name
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = UPPER(r_opo(indx).osco_suplr_id);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20118,'APM ');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).osco_prod_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT prod_desc11 INTO v_prod_desc
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = UPPER(r_opo(indx).osco_prod_id)
"
"       AND prod_rev = NVL(UPPER(r_opo(indx).osco_prod_rev),0);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20260,'ICM '||UPPER(r_opo(indx).osco_prod_id));
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).osco_process IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT mfgo_oprn_id INTO v_proc_id
"
"      FROM mfg_oprns
"
"     WHERE mfgo_bu = p_bu
"
"       AND mfgo_desc1 = UPPER(r_opo(indx).osco_process);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20016,'ADM '||UPPER(r_opo(indx).osco_process));
"
"      END;
"
"    END IF;
"
"
"
"   IF r_opo(indx).osco_hsn_code IS NOT NULL THEN
"
"    BEGIN
"
"      SELECT hstr_hsnsac_code INTO v_hsn_sac_code
"
"            FROM hsn_sac_tax_rates
"
"           WHERE hstr_bu = p_bu
"
"             AND hstr_hsnsac_code = UPPER(r_opo(indx).osco_hsn_code);
"
"    EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20439,'TAX'||UPPER(r_opo(indx).osco_hsn_code));
"
"        END;
"
"    END IF;
"
"
"
"
"
"    BEGIN
"
"
"
"      SELECT scrcml_seq_no
"
"        INTO v_ln_seq_no
"
"        FROM sc_rate_contr_mig_ln
"
"       WHERE scrcml_bu = p_bu
"
"         AND scrcml_doc_no = p_doc_no
"
"         AND scrcml_plnt = v_plnt
"
"         AND scrcml_plnt_loc_id = v_plnt_loc_id
"
"         AND scrcml_suplr_id = r_opo(indx).osco_suplr_id
"
"         AND scrcml_prod_id = r_opo(indx).osco_prod_id
"
"         AND scrcml_prod_rev = NVL(r_opo(indx).osco_prod_rev,0);
"
"
"
"    EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN
"
"
"
"        v_seq_no := v_seq_no + 1;
"
"    v_ln_seq_no := v_seq_no;
"
"
"
"        INSERT INTO sc_rate_contr_mig_ln(scrcml_bu,
"
"                         scrcml_doc_no,
"
"                         scrcml_seq_no,
"
"                                         scrcml_plnt,
"
"                         scrcml_plnt_loc_id,
"
"                         scrcml_suplr_id,
"
"                         scrcml_suplr_name,
"
"                         scrcml_po_start_date,
"
"                         scrcml_po_end_date,
"
"                         scrcml_prod_id,
"
"                         scrcml_prod_rev,
"
"                         scrcml_prod_desc,
"
"                         scrcml_uom,
"
"                         scrcml_disc_pct,
"
"                         scrcml_cre_by,
"
"                     scrcml_cre_emp_id,
"
"                     scrcml_cre_ip_addr,
"
"                     scrcml_cre_os_uscr,
"
"                         scrcml_cre_date
"
"                        )
"
"                      VALUES(p_bu,
"
"                             p_doc_no,
"
"                         v_ln_seq_no,
"
"                         v_plnt,
"
"                         v_plnt_loc_id,
"
"                         r_opo(indx).osco_suplr_id,
"
"                         v_suplr_name,
"
"                         r_opo(indx).osco_eff_from,
"
"                         r_opo(indx).osco_eff_to,
"
"                         r_opo(indx).osco_prod_id,
"
"                         NVL(r_opo(indx).osco_prod_rev,0),
"
"                         v_prod_desc,
"
"                         r_opo(indx).osco_uom,
"
"                         r_opo(indx).osco_disc_pct,
"
"                         p_user,
"
"                     v_emp_id,
"
"                     v_ip_addr,
"
"                     v_os_user,
"
"                         SYSDATE
"
"                        );
"
"    END;
"
"
"
"    --Process
"
"
"
"    SELECT mfgo_prod_id,mfgo_prod_rev,mfgo_uom,(SELECT prod_hsn_code
"
"                                                  FROM products
"
"                            WHERE prod_bu = p_bu AND prod_id = mfgo_prod_id AND prod_rev = mfgo_prod_rev) hsn_code
"
"      INTO v_prod_id,v_prod_rev,v_prod_uom,v_prod_hsn
"
"      FROM mfg_oprns
"
"     WHERE mfgo_bu = p_bu
"
"       AND mfgo_oprn_id = v_proc_id;
"
"
"
"
"
"    SELECT NVL(MAX(scrcmp_sub_seq_no),0) + 1
"
"      INTO v_proc_seq_no
"
"      FROM sc_rate_contr_mig_proc
"
"     WHERE scrcmp_bu = p_bu
"
"       AND scrcmp_doc_no = p_doc_no
"
"       AND scrcmp_seq_no = v_ln_seq_no;
"
"
"
"    INSERT INTO sc_rate_contr_mig_proc(scrcmp_bu,
"
"                                       scrcmp_doc_no,
"
"                       scrcmp_seq_no,
"
"                       scrcmp_sub_seq_no,
"
"                       scrcmp_oprn_seq_no,
"
"                       scrcmp_oprn_ln_seq_no,
"
"                       scrcmp_process,
"
"                       scrcmp_lab_cost,
"
"                       scrcmp_prod_id,
"
"                       scrcmp_prod_rev,
"
"                       scrcmp_hsn_code,
"
"                       scrcmp_uom,
"
"                       scrcmp_batch_qty,
"
"                       scrcmp_batch_cost,
"
"                       scrcmp_conv_factor,
"
"                       scrcmp_cre_by,
"
"                       scrcmp_cre_emp_id,
"
"                       scrcmp_cre_ip_addr,
"
"                       scrcmp_cre_os_user,
"
"                       scrcmp_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_ln_seq_no,
"
"                       v_proc_seq_no,
"
"                       v_proc_seq_no,
"
"                       r_opo(indx).osco_oprn_no,
"
"                       v_proc_id,
"
"                       r_opo(indx).osco_price,
"
"                       v_prod_id,
"
"                       v_prod_rev,
"
"                       v_prod_hsn,--v_hsn_sac_code,
"
"                       v_prod_uom,
"
"                       1,
"
"                       r_opo(indx).osco_price,
"
"                       1,
"
"                       p_user,
"
"                       v_emp_id,
"
"                       v_ip_addr,
"
"                       v_os_user,
"
"                       SYSDATE
"
"                      );
"
"
"
"  END LOOP;
"
"  CLOSE c_ref;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_open_sc_mig;
"
"
"
"PROCEDURE proc_ins_sco_stk_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_plnt        upd_stk_opbal_hd.usoh_plnt%TYPE,
"
"                   p_doc_no        upd_stk_opbal_hd.usoh_doc_no%TYPE,
"
"                   p_fname        upd_stk_opbal_hd.usoh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        upd_stk_opbal_hd.usoh_cre_by%TYPE,
"
"                   p_out  OUT   VARCHAR2
"
"                  )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_seq_no    NUMBER;
"
"v_ln_seq_no    NUMBER;
"
"v_ls_seq_no    NUMBER;
"
"v_proc_seq_no    NUMBER;
"
"
"
"TYPE typ_opo IS RECORD (sco_unit_loc        VARCHAR2(100),
"
"            sco_suplr_id        VARCHAR2(10),
"
"            sco_suplr_name        VARCHAR2(100),
"
"            sco_prod_id        VARCHAR2(100),
"
"            sco_prod_rev        NUMBER(5),
"
"            sco_prod_desc        VARCHAR2(150),
"
"        sco_hsn_code     VARCHAR2(30),
"
"            sco_prod_ord_no        VARCHAR2(15),
"
"            sco_compl_oprn_no    VARCHAR2(110),
"
"            sco_compl_process    VARCHAR2(100),
"
"            sco_lot_no        VARCHAR2(50),
"
"            sco_compl_qty        NUMBER(12,3),
"
"            sco_unit_cost        NUMBER(17,5),
"
"            sco_old_dc_no        VARCHAR2(30),
"
"            sco_sc_oprn_no        VARCHAR2(110),
"
"            sco_sc_process        VARCHAR2(100),
"
"            sco_sc_proc_cost    NUMBER(17,5),
"
"            sco_so_schld_desc    VARCHAR2(200)
"
"               );
"
"
"
"TYPE typ_opo_tab IS TABLE OF typ_opo INDEX BY PLS_INTEGER;
"
"r_opo    typ_opo_tab;
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
"v_plnt        bus_unit_plants.bup_plant_id%TYPE;
"
"v_plnt_loc_id    bus_unit_plants_loc_dtls.bupld_loc_id%TYPE;
"
"v_suplr_name    suppliers.suplr_name1%TYPE;
"
"v_prod_desc    products.prod_desc11%TYPE;
"
"
"
"v_compl_proc_id    mfg_oprns.mfgo_oprn_id%TYPE;
"
"v_os_proc_id    mfg_oprns.mfgo_oprn_id%TYPE;
"
"
"
"v_bom_no    bom_hd.bomhd_bom_no%TYPE;
"
"v_bom_name    bom_hd.bomhd_bom_name%TYPE;
"
"v_sf_code    upd_stk_opbal_ln.usol_sf_code%TYPE;
"
"
"
"v_emp_id        VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"v_ip_addr        VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user        VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"v_ord_type    VARCHAR2(2);
"
"v_so_pfx    VARCHAR2(5);
"
"v_so_no        VARCHAR2(30);
"
"v_so_seq_no    NUMBER(5);
"
"v_proj_id    VARCHAR2(15);
"
"v_cnt        NUMBER(5);
"
"
"
"BEGIN
"
"
"
" p_out := 'N';
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(sm_unit_loc        VARCHAR2(100),
"
"                     sm_suplr_id        VARCHAR2(10),
"
"                     sm_suplr_name        VARCHAR2(100),
"
"                     sm_prod_id        VARCHAR2(100),
"
"                     sm_prod_rev        NUMBER(5),
"
"                     sm_prod_desc        VARCHAR2(150),
"
"             sm_hsn_code         VARCHAR2(30),
"
"                     sm_prod_ord_no     VARCHAR2(15),
"
"                     sm_compl_oprn_no    VARCHAR2(110),
"
"                     sm_compl_process    VARCHAR2(100),
"
"                     sm_lot_no        VARCHAR2(50),
"
"                     sm_compl_qty        NUMBER(12,3),
"
"                     sm_unit_cost        NUMBER(17,5),
"
"                     sm_old_dc_no        VARCHAR2(30),
"
"                     sm_sc_oprn_no        VARCHAR2(110),
"
"                     sm_sc_process        VARCHAR2(100),
"
"                     sm_sc_proc_cost    NUMBER(17,5),
"
"                     sm_so_schld_desc       VARCHAR2(200)
"
"                    )
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
"                              (sm_unit_loc CHAR(255),
"
"                               sm_suplr_id CHAR(255),
"
"                               sm_suplr_name CHAR(255),
"
"                               sm_prod_id  CHAR(255),
"
"                               sm_prod_rev  CHAR(255),
"
"                               sm_prod_desc  CHAR(255),
"
"                   sm_hsn_code   CHAR(255),
"
"                               sm_prod_ord_no CHAR(255),
"
"                               sm_compl_oprn_no  CHAR(255),
"
"                               sm_compl_process CHAR(255),
"
"                               sm_lot_no CHAR(255),
"
"                               sm_compl_qty CHAR(255),
"
"                               sm_unit_cost CHAR(255),
"
"                               sm_old_dc_no CHAR(255),
"
"                               sm_sc_oprn_no CHAR(255),
"
"                               sm_sc_process  CHAR(255),
"
"                               sm_sc_proc_cost CHAR(255),
"
"                               sm_so_schld_desc CHAR(255)
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
"  DELETE FROM upd_stk_opbal_proc
"
"   WHERE usop_bu = p_bu
"
"     AND usop_plnt = p_plnt
"
"     AND usop_doc_no = p_doc_no;
"
"
"
"  DELETE FROM upd_stk_mtrl_opbal
"
"   WHERE usmo_bu = p_bu
"
"     AND usmo_plnt = p_plnt
"
"     AND usmo_doc_no = p_doc_no;
"
"
"
"  DELETE FROM upd_stk_opbal_lot_ser
"
"   WHERE usols_bu = p_bu
"
"     AND usols_plnt = p_plnt
"
"     AND usols_doc_no = p_doc_no;
"
"
"
"  DELETE FROM upd_stk_opbal_ln
"
"   WHERE usol_bu = p_bu
"
"     AND usol_plnt = p_plnt
"
"     AND usol_doc_no = p_doc_no;
"
"
"
"  v_seq_no := 0;
"
"
"
"  OPEN c_ref FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"
"
"    indx := indx + 1;
"
"    FETCH c_ref INTO r_opo(indx);
"
"    EXIT WHEN c_ref%NOTFOUND;
"
"
"
"    /*IF r_opo(indx).osco_unit IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bup_plant_id INTO v_plnt
"
"      FROM bus_unit_plants
"
"     WHERE bup_bu = p_bu
"
"       AND (bup_plant_id = UPPER(r_opo(indx).osco_unit) OR bup_name1 = UPPER(r_opo(indx).osco_unit));
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20483,'ADM ');
"
"      END;
"
"    END IF;*/
"
"
"
"    IF r_opo(indx).sco_unit_loc IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT bupld_loc_id INTO v_plnt_loc_id
"
"      FROM bus_unit_plants_loc_dtls
"
"     WHERE bupld_bu = p_bu
"
"       AND (bupld_loc_id = UPPER(r_opo(indx).sco_unit_loc) OR bupld_loc_name = UPPER(r_opo(indx).sco_unit_loc));
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20483,'ADM ');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).sco_suplr_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT suplr_name1 INTO v_suplr_name
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = UPPER(r_opo(indx).sco_suplr_id);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20118,'APM ');
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).sco_prod_id IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT prod_desc11 INTO v_prod_desc
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = UPPER(r_opo(indx).sco_prod_id)
"
"       AND prod_rev = NVL(UPPER(r_opo(indx).sco_prod_rev),0);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20260,'ICM '||UPPER(r_opo(indx).sco_prod_id));
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).sco_compl_process IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT mfgo_oprn_id INTO v_compl_proc_id
"
"      FROM mfg_oprns
"
"     WHERE mfgo_bu = p_bu
"
"       AND mfgo_desc1 = UPPER(r_opo(indx).sco_compl_process);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20016,'ADM '||UPPER(r_opo(indx).sco_compl_process));
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).sco_sc_process IS NOT NULL THEN
"
"      BEGIN
"
"        SELECT mfgo_oprn_id INTO v_os_proc_id
"
"      FROM mfg_oprns
"
"     WHERE mfgo_bu = p_bu
"
"       AND mfgo_desc1 = UPPER(r_opo(indx).sco_sc_process);
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"      Raise_Application_Error(-20016,'ADM '||UPPER(r_opo(indx).sco_sc_process));
"
"      END;
"
"    END IF;
"
"
"
"    IF r_opo(indx).sco_sc_proc_cost IS NULL THEN
"
"      Raise_Application_Error(-20999,'Proc. cost must be entered.');
"
"    END IF;
"
"
"
"    <<LINE>>
"
"    BEGIN
"
"
"
"      UPDATE upd_stk_opbal_ln
"
"         SET usol_fg_ord_qty = usol_fg_ord_qty + r_opo(indx).sco_compl_qty
"
"       WHERE usol_bu = p_bu
"
"         AND usol_plnt = p_plnt
"
"         AND usol_doc_no = p_doc_no
"
"         AND usol_plnt_loc_id = v_plnt_loc_id
"
"         AND usol_suplr_id = r_opo(indx).sco_suplr_id
"
"         AND usol_fg_prod_id = r_opo(indx).sco_prod_id
"
"         AND usol_fg_prod_rev = NVL(r_opo(indx).sco_prod_rev,0)
"
"     AND (usol_old_dc_no = r_opo(indx).sco_old_dc_no OR (usol_old_dc_no IS NULL AND r_opo(indx).sco_old_dc_no IS NULL))
"
"     AND (usol_comp_oprn_no = r_opo(indx).sco_compl_oprn_no OR (usol_comp_oprn_no IS NULL AND r_opo(indx).sco_compl_oprn_no IS NULL))
"
"     AND (usol_comp_proc_id = v_compl_proc_id OR (usol_comp_proc_id IS NULL AND v_compl_proc_id IS NULL))
"
"     AND (NVL(usol_lot_no,'0') = NVL(r_opo(indx).sco_lot_no,'0'))
"
"       RETURNING usol_seq_no INTO v_ln_seq_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"        SELECT NVL(MAX(usol_seq_no),0)+1
"
"      INTO v_ln_seq_no
"
"      FROM upd_stk_opbal_ln
"
"     WHERE usol_bu = p_bu
"
"           AND usol_plnt = p_plnt
"
"           AND usol_doc_no = p_doc_no;
"
"
"
"        BEGIN
"
"          SELECT bomhd_bom_no,bomhd_bom_name
"
"        INTO v_bom_no,v_bom_name
"
"            FROM bom_hd
"
"           WHERE bomhd_bu = p_bu
"
"             AND bomhd_plnt = p_plnt
"
"             AND bomhd_prod_id = r_opo(indx).sco_prod_id
"
"             AND bomhd_prod_rev = r_opo(indx).sco_prod_rev
"
"             AND bomhd_primary = 'Y'
"
"             AND bomhd_status = 'A';
"
"        EXCEPTION
"
"          WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20999,'HRM BOM not found.');
"
"        END;
"
"
"
"    v_sf_code := NULL;
"
"
"
"    FOR r_rou IN (SELECT *
"
"                    FROM routing_ln
"
"               WHERE rouln_bu = p_bu
"
"                 AND rouln_plnt = p_plnt
"
"             AND rouln_bom_no = v_bom_no
"
"               ORDER BY rouln_oprn_seq_no)
"
"    LOOP
"
"      v_sf_code := v_sf_code||'0';
"
"    END LOOP;
"
"
"
"    IF r_opo(indx).sco_compl_oprn_no IS NOT NULL AND v_compl_proc_id IS NOT NULL THEN
"
"      FOR r_rou IN (SELECT seq,rouln_oprn_ln_seq,rouln_oprn_id
"
"                      FROM (SELECT ROW_NUMBER() OVER (ORDER BY rouln_oprn_no) seq,rouln_oprn_ln_seq,rouln_oprn_id
"
"                              FROM routing_ln
"
"                           WHERE rouln_bu = p_bu
"
"                             AND rouln_plnt = p_plnt
"
"                         AND rouln_bom_no = v_bom_no)
"
"                 WHERE rouln_oprn_ln_seq = r_opo(indx).sco_compl_oprn_no
"
"               AND rouln_oprn_id = v_compl_proc_id
"
"                   ORDER BY seq)
"
"      LOOP
"
"          v_sf_code := LPAD(SUBSTR(v_sf_code,r_rou.seq+1),LENGTH(v_sf_code),'1');
"
"      END LOOP;
"
"    END IF;
"
"
"
"    v_so_no         :=NULL;
"
"    v_proj_id         :=NULL;
"
"    v_so_seq_no        :=NULL;
"
"    v_so_pfx        :=NULL;
"
"
"
"    IF r_opo(indx).sco_so_schld_desc IS NOT NULL THEN
"
"      BEGIN
"
"      SELECT Order_type,soh_order_pfx,soh_order_no,soq_seq_no,proj_id
"
"             INTO v_ord_type,v_so_pfx,v_so_no,v_so_seq_no,v_proj_id
"
"             FROM(
"
"       SELECT 'SO' Order_type,soh_order_pfx,soh_order_no,soq_seq_no,NULL proj_id
"
"             FROM sales_order_hd,sales_order_qtys,som_control,icm_control
"
"             WHERE soh_bu = soq_bu
"
"               AND soh_order_no = soq_order_no
"
"               AND soh_bu = somctrl_bu
"
"               AND soh_bu = icmctrl_bu
"
"           AND soh_bu = p_bu
"
"               AND soh_plant = p_plnt
"
"               AND soh_order_type = 'SOG'
"
"               AND soh_order_no = r_opo(indx).sco_so_schld_desc
"
"               AND soh_status = 'A'
"
"           UNION ALL
"
"           SELECT 'P',NULL,NULL,NULL,prj_proj_id
"
"             FROM projects
"
"             WHERE prj_bu = p_bu
"
"               AND prj_plnt = p_plnt
"
"               AND prj_status = 'A'
"
"               AND prj_proj_id = r_opo(indx).sco_so_schld_desc);
"
"      EXCEPTION WHEN OTHERS THEN
"
"                v_ord_type := 'NA';
"
"                v_so_pfx := NULL;
"
"                 v_so_no := NULL;
"
"        v_so_seq_no := NULL;
"
"                v_proj_id := NULL;
"
"      END;
"
"     /*BEGIN
"
"       SELECT Order_type,soh_order_pfx,soh_order_no,soq_seq_no,proj_id
"
"             INTO v_ord_type,v_so_pfx,v_so_no,v_so_seq_no,v_proj_id
"
"             FROM(
"
"         SELECT  'SO' Order_type,soh_order_pfx,soh_order_no,soq_seq_no,NULL proj_id
"
"               FROM sales_order_hd,sales_order_qtys,som_control,icm_control
"
"              WHERE soh_bu = soq_bu
"
"                AND soh_order_no = soq_order_no
"
"                AND soh_bu = p_bu
"
"                AND soh_plant = p_plnt
"
"                AND soh_order_type = 'SOG'
"
"                AND soh_status IN ('A')
"
"                AND soq_status IN ('A')
"
"                AND soh_bu = somctrl_bu
"
"                AND soh_bu = icmctrl_bu
"
"                AND soq_schld_desc = r_opo(indx).sco_so_schld_desc
"
"                AND ((((soq_qty_ordered - (soq_in_process_qty + soq_qty_invoiced + soq_cs_qty)) > 0 AND somctrl_so_ref_compld_req_flag = 'N') OR somctrl_so_ref_compld_req_flag = 'Y') )
"
"             UNION ALL
"
"             SELECT 'P',NULL,NULL,NULL,prj_proj_id
"
"               FROM projects,som_control
"
"              WHERE prj_bu = somctrl_bu
"
"                AND prj_bu = p_bu
"
"                AND prj_plnt = p_plnt
"
"                AND ((prj_status = 'A' AND somctrl_so_ref_compld_req_flag = 'N') OR (prj_status IN ('A','C') AND somctrl_so_ref_compld_req_flag = 'Y'))
"
"                AND  prj_task_desc = r_opo(indx).sco_so_schld_desc);
"
"         EXCEPTION WHEN OTHERS THEN
"
"                v_ord_type := 'NA';
"
"                v_so_pfx := NULL;
"
"                 v_so_no := NULL;
"
"        v_so_seq_no := NULL;
"
"                v_proj_id := NULL;
"
"         END; */--Comment by Mohamed Yasir
"
"    END IF;
"
"
"
"
"
"    IF r_opo(indx).sco_hsn_code IS NOT NULL THEN
"
"      BEGIN
"
"       SELECT COUNT(*) INTO v_cnt
"
"         FROM gst_hsn_codes,hsn_sac_tax_rates
"
"        WHERE hstr_bu = p_bu
"
"          AND hstr_hsnsac_code = ghc_hsn_code
"
"          AND TRUNC(SYSDATE) BETWEEN TRUNC(hstr_date_from) AND TRUNC(hstr_date_to)
"
"          AND hstr_status = 'A'
"
"          AND hstr_hsnsac_code = r_opo(indx).sco_hsn_code;
"
"
"
"     IF v_cnt = 0 THEN
"
"        Raise_Application_Error(-20999,'HSN Code not found.');
"
"     END IF;
"
"     END;
"
"    END IF;
"
"
"
"    --raise_application_error(-20999,'HRM '||r_opo(indx).sco_prod_id||'~'||r_opo(indx).sco_prod_rev);
"
"
"
"        INSERT INTO upd_stk_opbal_ln(usol_bu,
"
"                                     usol_plnt,
"
"                     usol_doc_no,
"
"                     usol_seq_no,
"
"                     --usol_plnt_loc_id,
"
"                     usol_suplr_id,
"
"                     --usol_suplr_name,
"
"                     usol_fg_prod_id,
"
"                     usol_fg_prod_rev,
"
"                     --usol_prod_desc,
"
"                     usol_comp_oprn_no,
"
"                     usol_comp_proc_id,
"
"                     usol_comp_proc_desc,
"
"                     usol_sf_code,
"
"                     usol_fg_ord_qty,
"
"                     usol_fg_unit_cost,
"
"                     usol_bom_no,
"
"                     usol_bom_name,
"
"                     usol_cre_by,
"
"                     usol_cre_emp_id,
"
"                     usol_cre_ip_addr,
"
"                     usol_cre_os_user,
"
"                     usol_cre_date,
"
"                     usol_plnt_loc_id,
"
"                     usol_old_dc_no,
"
"                     usol_prod_ord_no,
"
"                     usol_so_schld_desc,
"
"                     usol_so_type,
"
"                     usol_so_pfx,
"
"                     usol_so_no,
"
"                     usol_so_seq_no,
"
"                     usol_proj_id,
"
"             usol_hsn_code,
"
"             usol_lot_no,
"
"             usol_ls_type
"
"                     )
"
"                  VALUES(p_bu,
"
"                         p_plnt,
"
"                     p_doc_no,
"
"                     v_ln_seq_no,
"
"                     --v_plnt_loc_id,
"
"                     r_opo(indx).sco_suplr_id,
"
"                     --v_suplr_name,
"
"                     r_opo(indx).sco_prod_id,
"
"                     NVL(r_opo(indx).sco_prod_rev,0),
"
"                     --v_prod_desc,
"
"                     r_opo(indx).sco_compl_oprn_no,
"
"                     v_compl_proc_id,
"
"                     UPPER(r_opo(indx).sco_compl_process),
"
"                     v_sf_code,
"
"                     r_opo(indx).sco_compl_qty,
"
"                     r_opo(indx).sco_unit_cost,
"
"                     v_bom_no,
"
"                     v_bom_name,
"
"                     p_user,
"
"                     v_emp_id,
"
"                     v_ip_addr,
"
"                     v_os_user,
"
"                     SYSDATE,
"
"                     v_plnt_loc_id,
"
"                     r_opo(indx).sco_old_dc_no,
"
"                     r_opo(indx).sco_prod_ord_no,
"
"                     r_opo(indx).sco_so_schld_desc,
"
"                     NVL(v_ord_type,'NA'),
"
"                     v_so_pfx,
"
"                     v_so_no,
"
"                     v_so_seq_no,
"
"                     v_proj_id,
"
"             r_opo(indx).sco_hsn_code,
"
"             r_opo(indx).sco_lot_no,
"
"             (SELECT prod_ser_lot_opt FROM products WHERE prod_bu = p_bu AND prod_id = r_opo(indx).sco_prod_id AND prod_rev = NVL(r_opo(indx).sco_prod_rev,0))
"
"                    );
"
"      END IF;
"
"
"
"    END;
"
"
"
"    /*<<LOT_SER>>
"
"    BEGIN
"
"
"
"      UPDATE upd_stk_opbal_lot_ser
"
"         SET usols_qty = usols_qty + r_opo(indx).sco_compl_qty
"
"       WHERE usols_bu = p_bu
"
"         AND usols_plnt = p_plnt
"
"     AND usols_doc_no = p_doc_no
"
"     AND usols_seq_no = v_ln_seq_no
"
"     AND usols_lot_no = r_opo(indx).sco_lot_no
"
"       RETURNING usols_sub_seq_no INTO v_ls_seq_no;
"
"
"
"      IF SQL%NOTFOUND THEN
"
"
"
"        SELECT NVL(MAX(usols_sub_seq_no),0) + 1
"
"      INTO v_ls_seq_no
"
"      FROM upd_stk_opbal_lot_ser
"
"     WHERE usols_bu = p_bu
"
"           AND usols_plnt = p_plnt
"
"       AND usols_doc_no = p_doc_no
"
"       AND usols_seq_no = v_ln_seq_no;
"
"
"
"    INSERT INTO upd_stk_opbal_lot_ser(usols_bu,
"
"                      usols_plnt,
"
"                      usols_doc_no,
"
"                      usols_seq_no,
"
"                      usols_sub_seq_no,
"
"                      usols_sys_ls_no,
"
"                      usols_lot_no,
"
"                      usols_ser_no,
"
"                      usols_qty,
"
"                      usols_cre_by,
"
"                      usols_cre_emp_id,
"
"                      usols_cre_ip_addr,
"
"                      usols_cre_os_user,
"
"                      usols_cre_date
"
"                     )
"
"                               VALUES(p_bu,
"
"                          p_plnt,
"
"                      p_doc_no,
"
"                      v_ln_seq_no,
"
"                      v_ls_seq_no,
"
"                      NULL,
"
"                      r_opo(indx).sco_lot_no,
"
"                      NULL,
"
"                      r_opo(indx).sco_compl_qty,
"
"                      p_user,
"
"                      v_emp_id,
"
"                      v_ip_addr,
"
"                      v_os_user,
"
"                      SYSDATE
"
"                     );
"
"
"
"      END IF;
"
"
"
"    END;*/
"
"
"
"    <<PROCESS>>
"
"    BEGIN
"
"      SELECT usop_sub_seq_no
"
"        INTO v_proc_seq_no
"
"        FROM upd_stk_opbal_proc
"
"       WHERE usop_bu = p_bu
"
"         AND usop_plnt = p_plnt
"
"         AND usop_doc_no = p_doc_no
"
"         AND usop_seq_no = v_ln_seq_no
"
"     AND usop_oprn_no = r_opo(indx).sco_sc_oprn_no
"
"     AND usop_proc_id = v_os_proc_id;
"
"    EXCEPTION
"
"      WHEN NO_DATA_FOUND THEN
"
"
"
"        SELECT NVL(MAX(usop_sub_seq_no),0) + 1
"
"          INTO v_proc_seq_no
"
"          FROM upd_stk_opbal_proc
"
"         WHERE usop_bu = p_bu
"
"           AND usop_plnt = p_plnt
"
"       AND usop_doc_no = p_doc_no
"
"           AND usop_seq_no = v_ln_seq_no;
"
"
"
"    INSERT INTO upd_stk_opbal_proc(usop_bu,
"
"                                       usop_plnt,
"
"                       usop_doc_no,
"
"                       usop_seq_no,
"
"                       usop_sub_seq_no,
"
"                       usop_oprn_seq_no,
"
"                       usop_oprn_no,
"
"                       usop_proc_id,
"
"                       usop_proc_desc,
"
"                       usop_proc_cost,
"
"                       usop_cre_by,
"
"                       usop_cre_emp_id,
"
"                       usop_cre_ip_addr,
"
"                       usop_cre_os_user,
"
"                       usop_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_plnt,
"
"                       p_doc_no,
"
"                       v_ln_seq_no,
"
"                       v_proc_seq_no,
"
"                       v_proc_seq_no,
"
"                       r_opo(indx).sco_sc_oprn_no,
"
"                       v_os_proc_id,
"
"                       UPPER(r_opo(indx).sco_sc_process),
"
"                       r_opo(indx).sco_sc_proc_cost,
"
"                       p_user,
"
"                       v_emp_id,
"
"                       v_ip_addr,
"
"                       v_os_user,
"
"                       SYSDATE
"
"                      );
"
"    END;
"
"       p_out := 'Y';
"
"  END LOOP;
"
"  CLOSE c_ref;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_sco_stk_mig;
"
"
"
"/*PROCEDURE proc_ins_pend_po_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        pur_order_mig_ln.poml_doc_no%TYPE,
"
"                   p_fname        pur_order_mig_hd.pomh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        pur_order_mig_hd.pomh_cre_by%TYPE,
"
"                   p_res      OUT   VARCHAR2
"
"                   )
"
"AS
"
"
"
"v_sql       VARCHAR2(8000);
"
"v_fpath     VARCHAR2(200);
"
"v_cnt       NUMBER(5);
"
"v_chk_cnt   NUMBER(5);
"
"v_tab_cnt   NUMBER(5);
"
"
"
"BEGIN
"
"   p_res := 'N';
"
" --raise_application_error(-20999,'HRM'||p_bu||'-'||p_doc_no||'-'||p_fname||'-'||p_sep||'-'||p_user);
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PLNT_LOC_NAME VARCHAR2(50),
"
"                                         SM_PLNT_DESC VARCHAR2(150),
"
"                                         SM_SUPLR_ID VARCHAR2(10),
"
"                                         SM_BUYER_ID VARCHAR2(150),
"
"                                        SM_PROD_ID VARCHAR2(100),
"
"                                        SM_PROD_REV NUMBER(5),
"
"                                        SM_SUPLR_UOM VARCHAR2(5),
"
"                                        SM_PROJECT  VARCHAR(10),
"
"                                        SM_CPC_CODE VARCHAR2(100),
"
"                                        SM_SO_PFX VARCHAR2(5),
"
"                                        SM_SO_NO VARCHAR2(10),
"
"                                        SM_SO_SEQ_NO NUMBER(5),
"
"                                        SM_SO_SUB_SEQ_NO NUMBER(5),
"
"                                        SM_RQRD_DATE DATE,
"
"                                        SM_PROM_DATE DATE,
"
"                                        SM_ORD_QTY NUMBER(12,3),
"
"                                        SM_UNIT_COST NUMBER(17,5),
"
"                                SM_TRD_DISC_PCT NUMBER(5,2),
"
"                                        SM_CURRENCY VARCHAR2(5),
"
"                                        SM_EXCHANGE_RATE NUMBER(13,8),
"
"                                        SM_TYPE VARCHAR2(2),
"
"                                        SM_PO_DATE    DATE,
"
"                                        SM_RCPT_QTY NUMBER(12,3),
"
"                                        SM_OLD_PO_NO    VARCHAR2(50),
"
"                                        SM_HSN_CODE    VARCHAR2(30),
"
"                                        SM_REMARKS    VARCHAR2(300)
"
"                                       )
"
"                                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '''||p_sep||'''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (SM_PLNT_LOC_NAME  CHAR(255),
"
"                     SM_PLNT_DESC  CHAR(255),
"
"                     SM_SUPLR_ID  CHAR(255),
"
"                     SM_BUYER_ID  CHAR(255),
"
"                     SM_PROD_ID  CHAR(255),
"
"                     SM_PROD_REV  CHAR(255),
"
"                     SM_SUPLR_UOM  CHAR(255),
"
"                     SM_PROJECT CHAR(255),
"
"                     SM_CPC_CODE CHAR(255),
"
"                     SM_SO_PFX CHAR(255),
"
"                     SM_SO_NO CHAR(255),
"
"                     SM_SO_SEQ_NO CHAR(255),
"
"                     SM_SO_SUB_SEQ_NO CHAR(255),
"
"                     SM_RQRD_DATE CHAR(255),
"
"                     SM_PROM_DATE CHAR(255),
"
"                     SM_ORD_QTY CHAR(255),
"
"                     SM_UNIT_COST CHAR(255),
"
"             SM_TRD_DISC_PCT CHAR(255),
"
"                     SM_CURRENCY CHAR(255),
"
"                     SM_EXCHANGE_RATE CHAR(255),
"
"                     SM_TYPE CHAR(255),
"
"                     SM_PO_DATE CHAR(255),
"
"                     SM_RCPT_QTY CHAR(255),
"
"                     SM_OLD_PO_NO  CHAR(255),
"
"                     SM_HSN_CODE     CHAR(255),
"
"                     SM_REMARKS    CHAR(255)))
"
"                    LOCATION ('''||p_fname||''')
"
"                    ) REJECT LIMIT UNLIMITED';
"
"
"
"
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"
"
"
"
"
"
"  DELETE pur_order_mig_ln
"
"   WHERE poml_bu = p_bu
"
"     AND poml_doc_no = p_doc_no;
"
"
"
"
"
"     v_sql := 'INSERT INTO pur_order_mig_ln(poml_bu,
"
"                                            poml_plnt,
"
"                        poml_doc_no,
"
"                        poml_seq_no,
"
"                        poml_suplr_id,
"
"                        poml_buyer_id,
"
"                        poml_prod_id,
"
"                        poml_prod_rev,
"
"                        poml_suplr_uom,
"
"                        poml_prod_uom,
"
"                        poml_ordered_qty,
"
"                        poml_sc_unit_cost,
"
"                        poml_so_pfx,
"
"                        poml_so_no,
"
"                        poml_so_seq_no,
"
"                        poml_so_sub_seq_no,
"
"                        poml_proj_id,
"
"                        poml_required_date,
"
"                        poml_promise_date,
"
"                        poml_exchange_rate,
"
"                        poml_currency,
"
"                        poml_prod_type,
"
"                        poml_cre_by,
"
"                        poml_cre_date,
"
"                        poml_ord_date,
"
"                        poml_receipt_qty,
"
"                        poml_old_po_no,
"
"                        poml_plnt_loc_id,
"
"                        poml_plnt_loc_name,
"
"                        poml_hsn_code,
"
"                        poml_remarks,
"
"                        poml_cc_code,
"
"                        poml_store_id,
"
"            poml_trd_disc_pct)
"
"                        SELECT '''||p_bu||''',
"
"                            (SELECT bup_plant_id
"
"                           FROM bus_unit_plants
"
"                          WHERE bup_bu = '''||p_bu||'''
"
"                            AND (bup_name1 = UPPER(TRIM(sm_plnt_desc)) OR
"
"                                 bup_plant_id = UPPER(TRIM(sm_plnt_desc)))),
"
"                        '''||p_doc_no||''',
"
"                        ROWNUM,
"
"                         sm_suplr_id,
"
"                         (SELECT buyer_id
"
"                            FROM buyers
"
"                           WHERE  buyer_bu = '''||p_bu||'''
"
"                             AND UPPER(buyer_id) = UPPER(TRIM(sm_buyer_id))),
"
"                        sm_prod_id,
"
"                        NVL(sm_prod_rev,0),
"
"                        sm_suplr_uom,
"
"                        sm_suplr_uom,
"
"                        NVL(sm_ord_qty,0),
"
"                        nvl(sm_unit_cost,0),
"
"                        sm_so_pfx,
"
"                        sm_so_no,
"
"                        sm_so_seq_no,
"
"                        sm_so_sub_seq_no,
"
"                        sm_project,
"
"                        TO_DATE(sm_rqrd_date),
"
"                        TO_DATE(sm_prom_date),
"
"                        NVL(sm_exchange_rate,1),
"
"                        sm_currency,
"
"                        NVL(sm_type,''ST''),
"
"                        '''||p_user||''',
"
"                        SYSDATE,
"
"                        TO_CHAR(sm_po_date),
"
"                        NVL(sm_rcpt_qty,0),
"
"                        sm_old_po_no,
"
"                        UPPER(TRIM(sm_plnt_loc_name)),
"
"                       (SELECT bupld_loc_name
"
"                          FROM bus_unit_plants_loc_dtls
"
"                         WHERE bupld_bu = '''||p_bu||'''
"
"                           AND bupld_loc_id = UPPER(TRIM(sm_plnt_loc_name))),
"
"                       sm_hsn_code,
"
"                       sm_remarks,
"
"                       sm_cpc_code,
"
"                       (SELECT PPL_DFLT_STORE_ID
"
"                          FROM PROD_PLANTS_LOC
"
"                         WHERE PPL_BU='''||p_bu||'''
"
"                           AND PPL_PLNT=(SELECT bup_plant_id
"
"                                           FROM bus_unit_plants
"
"                                          WHERE bup_bu = '''||p_bu||'''
"
"                                            AND (bup_name1 = UPPER(TRIM(sm_plnt_desc)) OR
"
"                                                 bup_plant_id = UPPER(TRIM(sm_plnt_desc))))
"
"                           AND ppl_prod_id = sm_prod_id
"
"                           AND ppl_prod_rev = sm_prod_rev
"
"                           AND ppl_plnt_loc_id = UPPER(TRIM(sm_plnt_loc_name))),
"
"               sm_trd_disc_pct
"
"                                     FROM scm_migration';
"
"
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
"
"  SELECT COUNT(*)
"
"    INTO v_cnt
"
"    FROM pur_order_mig_ln
"
"   WHERE poml_bu = p_bu
"
"     AND poml_doc_no = p_doc_no
"
"     AND ROWNUM = 1;
"
"  EXCEPTION WHEN OTHERS THEN
"
"  v_cnt := 0;
"
"  END;
"
"
"
"  IF v_cnt > 0 THEN
"
"     p_res := 'Y';
"
"  END IF;
"
"
"
"   proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  COMMIT;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"  Raise_Application_Error(-20999,'File not found.');
"
"END proc_ins_pend_po_mig;*/
"
"
"
"PROCEDURE proc_ins_pend_po_mig(p_bu        business_units.bu_id%TYPE,
"
"                               p_doc_no    pur_order_mig_ln.poml_doc_no%TYPE,
"
"                               p_fname     pur_order_mig_hd.pomh_file_name%TYPE,
"
"                               p_sep       VARCHAR2,
"
"                               p_user      pur_order_mig_hd.pomh_cre_by%TYPE,
"
"                               p_res       OUT   VARCHAR2
"
"                              )
"
"AS
"
"
"
" CURSOR c1 IS
"
" SELECT table_name
"
"   FROM user_tables
"
"  WHERE table_name = 'SCM_MIGRATION';
"
"
"
"
"
" CURSOR c_plnt_loc(c_plnt_loc VARCHAR2) IS
"
" SELECT *
"
"   FROM bus_unit_plants_loc_dtls
"
"   WHERE bupld_bu = p_bu
"
"     AND bupld_loc_id = UPPER(TRIM(c_plnt_loc));
"
"
"
" CURSOR c_plnt(c_plnt_desc  VARCHAR2) IS
"
" SELECT *
"
"   FROM bus_unit_plants
"
"  WHERE bup_bu = p_bu
"
"    AND bup_name1 = UPPER(TRIM(c_plnt_desc)) OR bup_plant_id = UPPER(TRIM(c_plnt_desc));
"
"
"
" CURSOR c_buyer(c_buyer VARCHAR2) IS
"
" SELECT *
"
"   FROM buyers
"
"  WHERE buyer_bu = p_bu
"
"    AND UPPER(buyer_id) = UPPER(TRIM(c_buyer));
"
"
"
"   CURSOR c_prod(c_prod_id    VARCHAR2,
"
"                 c_prod_rev    NUMBER) IS
"
"  SELECT *
"
"    FROM products
"
"   WHERE prod_bu = p_bu
"
"     AND prod_id = c_prod_id
"
"     AND prod_rev = c_prod_rev;
"
"
"
"  CURSOR c_uom(c_uom    VARCHAR2) IS
"
"  SELECT *
"
"    FROM unit_of_measures
"
"   WHERE uom_bu = p_bu
"
"     AND uom_uom = c_uom
"
"     AND uom_active_Flag = 'Y';
"
"
"
"  CURSOR c_so_ref(c_plnt      VARCHAR2,
"
"         c_so_ref    VARCHAR2) IS
"
"  SELECT *
"
"    FROM so_proj_ref_vw
"
"   WHERE sprv_bu = p_bu
"
"     AND sprv_plnt = c_plnt
"
"     AND sprv_sop_ref = c_so_ref;
"
"
"
"
"
"   CURSOR c_dlt_wh(c_plnt VARCHAR2,
"
"                   c_plnt_loc VARCHAR2,
"
"                   c_prod_id VARCHAR2,
"
"           c_prod_rev VARCHAR2) IS
"
"   SELECT *
"
"     FROM prod_plants_loc
"
"    WHERE ppl_bu = p_bu
"
"      AND ppl_plnt = c_plnt
"
"      AND ppl_plnt_loc_id = c_plnt_loc
"
"      AND ppl_prod_id = c_prod_id
"
"      AND ppl_prod_rev = c_prod_rev;
"
"
"
" cr1        c1%ROWTYPE;
"
" r_plnt_loc    c_plnt_loc%ROWTYPE;
"
" r_dlt_wh       c_dlt_wh%ROWTYPE;
"
" r_plnt        c_plnt%ROWTYPE;
"
" r_prod        c_prod%ROWTYPE;
"
" r_uom        c_uom%ROWTYPE;
"
" r_buyer    c_buyer%ROWTYPE;
"
" r_so_ref    c_so_ref%ROWTYPE;
"
"
"
"
"
"TYPE typ_ct IS RECORD (SM_PLNT_LOC_NAME        VARCHAR2(50),
"
"                       SM_PLNT_DESC        VARCHAR2(150),
"
"                       SM_SUPLR_ID        VARCHAR2(10),
"
"                       SM_BUYER_ID        VARCHAR2(150),
"
"                       SM_PROD_ID        VARCHAR2(100),
"
"                       SM_PROD_REV        NUMBER(5),
"
"                       SM_SUPLR_UOM        VARCHAR2(5),
"
"                       SM_CPC_CODE        VARCHAR2(100),
"
"                       SM_SO_PRJ_REF        VARCHAR2(100),
"
"                       SM_RQRD_DATE             DATE,
"
"                       SM_PROM_DATE             DATE,
"
"                       SM_ORD_QTY        NUMBER(12,3),
"
"                       SM_UNIT_COST        NUMBER(17,5),
"
"               SM_TRD_DISC_PCT        NUMBER(5,2),
"
"                       SM_CURRENCY        VARCHAR2(5),
"
"                       SM_EXCHANGE_RATE        NUMBER(13,8),
"
"                       SM_TYPE            VARCHAR2(5),
"
"                       SM_PO_DATE        DATE,
"
"                       SM_RCPT_QTY        NUMBER(12,3),
"
"                       SM_OLD_PO_NO            VARCHAR2(50),
"
"                       SM_HSN_CODE        VARCHAR2(30),
"
"                       SM_REMARKS            VARCHAR2(300),
"
"               SM_PUR_ACCT        VARCHAR2(20)
"
"                      );
"
"
"
"TYPE typ_ct_dtls IS TABLE OF typ_ct INDEX BY PLS_INTEGER;
"
"
"
"  r_ct      typ_ct_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"
"
"  c_ct         typ_ref_cur;
"
"
"
"indx        NUMBER := 1;
"
"v_sql       VARCHAR2(8000);
"
"v_fpath     VARCHAR2(200);
"
"v_cnt       NUMBER(5);
"
"v_chk_cnt   NUMBER(5);
"
"v_seq_no    NUMBER;
"
"var_uom        VARCHAR2 (20);
"
"
"
"
"
"
"
"BEGIN
"
"
"
" DELETE FROM pur_order_mig_ln
"
"  WHERE poml_bu = p_bu
"
"    AND poml_doc_no = p_doc_no;
"
"
"
"  p_res := 'N';
"
" --raise_application_error(-20999,'HRM'||p_bu||'-'||p_doc_no||'-'||p_fname||'-'||p_sep||'-'||p_user);
"
"
"
"OPEN  c1;
"
"FETCH c1 INTO cr1;
"
"  IF c1%FOUND THEN
"
"    EXECUTE IMMEDIATE 'DROP TABLE SCM_MIGRATION';
"
"  END IF;
"
"CLOSE c1;
"
"
"
"    v_sql := 'CREATE TABLE SCM_MIGRATION(SM_PLNT_LOC_NAME VARCHAR2(50),
"
"                                                SM_PLNT_DESC VARCHAR2(150),
"
"                                                SM_SUPLR_ID VARCHAR2(10),
"
"                                                SM_BUYER_ID VARCHAR2(150),
"
"                                                SM_PROD_ID VARCHAR2(100),
"
"                                                SM_PROD_REV NUMBER(5),
"
"                                                SM_SUPLR_UOM VARCHAR2(5),
"
"                                                SM_CPC_CODE VARCHAR2(100),
"
"                                                SM_SO_PRJ_REF VARCHAR2(100),
"
"                                                SM_RQRD_DATE DATE,
"
"                                                SM_PROM_DATE DATE,
"
"                                                SM_ORD_QTY NUMBER(12,3),
"
"                                                SM_UNIT_COST NUMBER(17,5),
"
"                                        SM_TRD_DISC_PCT NUMBER(5,2),
"
"                                                SM_CURRENCY VARCHAR2(5),
"
"                                                SM_EXCHANGE_RATE NUMBER(13,8),
"
"                                                SM_TYPE VARCHAR2(5),
"
"                                                SM_PO_DATE    DATE,
"
"                                                SM_RCPT_QTY NUMBER(12,3),
"
"                                                SM_OLD_PO_NO    VARCHAR2(50),
"
"                                                SM_HSN_CODE    VARCHAR2(30),
"
"                                                SM_REMARKS    VARCHAR2(300),
"
"                        SM_PUR_ACCT   VARCHAR2(20)
"
"                                               )
"
"                                              ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                              DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                              ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                              SKIP 1
"
"                                              FIELDS TERMINATED BY '''||p_sep||'''
"
"                                              MISSING FIELD VALUES ARE NULL
"
"                                              REJECT ROWS WITH ALL NULL FIELDS
"
"                                             (SM_PLNT_LOC_NAME  CHAR(255),
"
"                                              SM_PLNT_DESC  CHAR(255),
"
"                                              SM_SUPLR_ID  CHAR(255),
"
"                                              SM_BUYER_ID  CHAR(255),
"
"                                              SM_PROD_ID  CHAR(255),
"
"                                              SM_PROD_REV  CHAR(255),
"
"                                              SM_SUPLR_UOM  CHAR(255),
"
"                                              SM_CPC_CODE CHAR(255),
"
"                                              SM_SO_PRJ_REF CHAR(255),
"
"                                              SM_RQRD_DATE CHAR(255),
"
"                                              SM_PROM_DATE CHAR(255),
"
"                                              SM_ORD_QTY CHAR(255),
"
"                                              SM_UNIT_COST CHAR(255),
"
"                                      SM_TRD_DISC_PCT CHAR(255),
"
"                                              SM_CURRENCY CHAR(255),
"
"                                              SM_EXCHANGE_RATE CHAR(255),
"
"                                              SM_TYPE CHAR(255),
"
"                                              SM_PO_DATE CHAR(255),
"
"                                              SM_RCPT_QTY CHAR(255),
"
"                                              SM_OLD_PO_NO  CHAR(255),
"
"                                              SM_HSN_CODE     CHAR(255),
"
"                                              SM_REMARKS    CHAR(255),
"
"                          SM_PUR_ACCT   CHAR(255)))
"
"                                              LOCATION ('''||p_fname||''')
"
"                                             ) REJECT LIMIT UNLIMITED';
"
"
"
"   EXECUTE IMMEDIATE v_sql;
"
"   OPEN c_ct FOR 'SELECT * FROM SCM_MIGRATION';
"
"
"
"
"
"LOOP
"
"
"
"
"
"
"
"  FETCH c_ct INTO r_ct(indx);
"
"   EXIT WHEN c_ct%NOTFOUND;
"
"
"
"--Raise_Application_Error(-20999,'Testing.');
"
"
"
"  IF r_ct(indx).sm_plnt_loc_name IS NULL THEN
"
"    Raise_Application_Error(-20999,'Location must be entered.');
"
"  END IF;
"
"
"
"     OPEN c_plnt_loc(r_ct(indx).sm_plnt_loc_name);
"
"     FETCH c_plnt_loc INTO r_plnt_loc;
"
"
"
"     IF c_plnt_loc%NOTFOUND THEN
"
"       RAISE_APPLICATION_ERROR(-20999,'Location not found.');
"
"     END IF;
"
"
"
"     CLOSE c_plnt_loc;
"
"
"
"  IF r_ct(indx).sm_plnt_desc IS NULL THEN
"
"       Raise_Application_Error(-20999,'Unit must be entered.');
"
"  END IF;
"
"
"
"     OPEN c_plnt(r_ct(indx).sm_plnt_desc);
"
"     FETCH c_plnt INTO r_plnt;
"
"     CLOSE c_plnt;
"
"
"
"     OPEN c_buyer(r_ct(indx).sm_buyer_id);
"
"     FETCH c_buyer INTO r_buyer;
"
"     CLOSE c_buyer;
"
"
"
"  IF r_ct(indx).sm_suplr_id IS NULL THEN
"
"      Raise_Application_Error(-20999,'Supplier must be entered.');
"
"  END IF;
"
"
"
"  IF r_ct(indx).sm_prod_id IS NULL THEN
"
"     Raise_Application_Error(-20999,'Item must be entered.');
"
"  END IF;
"
"
"
"  IF r_ct(indx).sm_prod_rev IS NULL THEN
"
"     Raise_Application_Error(-20999,'Rev. must be entered.');
"
"  END IF;
"
"
"
"  IF r_ct(indx).sm_pur_acct IS NULL THEN
"
"    Raise_Application_Error(-20999,'GL Account must be entered.');
"
"  END IF;
"
"
"
"     OPEN c_prod(r_ct(indx).sm_prod_id,r_ct(indx).sm_prod_rev);
"
"     FETCH c_prod INTO r_prod;
"
"     CLOSE c_prod;
"
"
"
"     OPEN c_so_ref(r_plnt.bup_plant_id,r_ct(indx).sm_so_prj_ref);
"
"     FETCH c_so_ref INTO r_so_ref;
"
"     CLOSE c_so_ref;
"
"
"
"     OPEN c_dlt_wh(r_plnt.bup_plant_id,r_ct(indx).sm_plnt_loc_name,r_ct(indx).sm_prod_id,r_ct(indx).sm_prod_rev);
"
"     FETCH c_dlt_wh INTO r_dlt_wh;
"
"     CLOSE c_dlt_wh;
"
"
"
"
"
"
"
"  /*IF r_ct(indx).sm_ord_qty IS NULL THEN
"
"       Raise_Application_Error(-20999,'Qty. must be entered.');
"
"  END IF;
"
"
"
"  IF r_ct(indx).sm_unit_cost IS NULL THEN
"
"       Raise_Application_Error(-20999,'Unit cost must be entered.');
"
"  END IF;
"
"
"
"  IF r_ct(indx).sm_currency IS NULL THEN
"
"       Raise_Application_Error(-20999,'Currency must be entered.');
"
"  END IF;*/
"
"
"
"  /*IF r_ct(indx).sm_prom_date IS NULL THEN
"
"       Raise_Application_Error(-20999,'Promise date must be entered.');
"
"  END IF;
"
"
"
"  IF r_ct(indx).sm_rqrd_date IS NULL THEN
"
"       Raise_Application_Error(-20999,'Required date must be entered.');
"
"  END IF;
"
"
"
"   IF r_ct(indx).sm_hsn_code IS NULL THEN
"
"       Raise_Application_Error(-20999,'HSN code must be entered.');
"
"  END IF;
"
"  */
"
"
"
"  IF r_ct(indx).sm_suplr_uom IS NULL THEN
"
"    RAISE_APPLICATION_ERROR(-20999,'UOM Must be entered.');
"
"  ELSIF r_ct(indx).sm_suplr_uom IS NOT NULL THEN
"
"    OPEN c_uom(r_ct(indx).sm_suplr_uom);
"
"    FETCH c_uom INTO r_uom;
"
"      IF c_uom%NOTFOUND THEN
"
"          Raise_Application_Error(-20275,'ICM'||'~'||r_ct(indx).sm_suplr_uom);
"
"      END IF;
"
"     CLOSE c_uom;
"
"  END IF;
"
"
"
"     /* IF func_find_app_sup_rqrd_flag(p_bu,r_plnt.bup_plant_id,r_ct(indx).sm_prod_id,r_ct(indx).sm_prod_rev) = 'Y' THEN
"
"      var_uom := func_find_suplr_uom(p_bu,r_ct(indx).sm_suplr_id,r_ct(indx).sm_prod_id,r_ct(indx).sm_prod_rev);
"
"    ELSE
"
"      var_uom := r_ct(indx).sm_suplr_uom;
"
"    END IF;*/
"
"
"
"     SELECT NVL(MAX(poml_seq_no),0)+1
"
"       INTO v_seq_no
"
"       FROM pur_order_mig_ln
"
"      WHERE poml_bu = p_bu
"
"        AND poml_doc_no = p_doc_no;
"
"
"
"
"
"
"
"
"
"              INSERT INTO pur_order_mig_ln(poml_bu,
"
"                                           poml_plnt,
"
"                                           poml_doc_no,
"
"                                           poml_seq_no,
"
"                                           poml_suplr_id,
"
"                                           poml_buyer_id,
"
"                                           poml_prod_id,
"
"                                           poml_prod_rev,
"
"                                           poml_suplr_uom,
"
"                                           poml_prod_uom,
"
"                                           poml_ordered_qty,
"
"                                           poml_sc_unit_cost,
"
"                                           poml_required_date,
"
"                                           poml_promise_date,
"
"                                           poml_exchange_rate,
"
"                                           poml_currency,
"
"                                           poml_cre_by,
"
"                                           poml_cre_date,
"
"                                           poml_ord_date,
"
"                                           poml_receipt_qty,
"
"                                           poml_old_po_no,
"
"                                           poml_plnt_loc_id,
"
"                                           poml_plnt_loc_name,
"
"                                           poml_hsn_code,
"
"                                           poml_remarks,
"
"                                           poml_cc_code,
"
"                                           poml_store_id,
"
"                               poml_trd_disc_pct,
"
"                       poml_pur_acct,
"
"                       poml_so_schld_desc,
"
"                       poml_po_type
"
"                      )
"
"                            VALUES(p_bu,
"
"                           r_plnt.bup_plant_id,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_ct(indx).sm_suplr_id,
"
"                       r_ct(indx).sm_buyer_id,
"
"                       r_ct(indx).sm_prod_id,
"
"                       r_ct(indx).sm_prod_rev,
"
"                       r_ct(indx).sm_suplr_uom,
"
"                       r_ct(indx).sm_suplr_uom,
"
"                       NVL(r_ct(indx).sm_ord_qty,0),
"
"                       NVL(r_ct(indx).sm_unit_cost,0),
"
"                       TO_DATE(r_ct(indx).sm_rqrd_date),
"
"                                           TO_DATE(r_ct(indx).sm_prom_date),
"
"                       NVL(r_ct(indx).sm_exchange_rate,1),
"
"                       r_ct(indx).sm_currency,
"
"                       p_user,
"
"                       SYSDATE,
"
"                                           TO_CHAR(r_ct(indx).sm_po_date),
"
"                                           NVL(r_ct(indx).sm_rcpt_qty,0),
"
"                                           r_ct(indx).sm_old_po_no,
"
"                       UPPER(TRIM(r_ct(indx).sm_plnt_loc_name)),
"
"                       r_plnt_loc.bupld_loc_name,
"
"                       r_ct(indx).sm_hsn_code,
"
"                                           r_ct(indx).sm_remarks,
"
"                                           r_ct(indx).sm_cpc_code,
"
"                       r_dlt_wh.ppl_dflt_store_id,
"
"                       r_ct(indx).sm_trd_disc_pct,
"
"                       r_ct(indx).sm_pur_acct,
"
"                       r_ct(indx).sm_so_prj_ref,
"
"                       r_ct(indx).sm_type
"
"                       );
"
"
"
"
"
"      indx := indx + 1;
"
"      p_res := 'Y';
"
"
"
"  END LOOP;
"
"  EXECUTE IMMEDIATE 'DROP TABLE SCM_MIGRATION';
"
"
"
"
"
"END proc_ins_pend_po_mig;
"
"
"
"PROCEDURE proc_ins_srcm_mig(p_bu        business_units.bu_id%TYPE,
"
"                   p_doc_no        sal_rtn_cm_mig_ln.srcml_doc_no%TYPE,
"
"                   p_fname        sal_rtn_cm_mig_hd.srcmh_file_name%TYPE,
"
"                   p_sep        VARCHAR2,
"
"                   p_user        sal_rtn_cm_mig_hd.srcmh_cre_by%TYPE
"
"                   )
"
"AS
"
"
"
"v_seq_no    NUMBER;
"
"v_dept        VARCHAR2(200);
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"ar_class VARCHAR2(200);
"
"
"
"TYPE typ_ins_gpi IS RECORD (SM_PLNT VARCHAR2(10),
"
"             SM_CUST_ID VARCHAR2(10),
"
"             SM_AR_CLASS VARCHAR2(100),
"
"             SM_PROD_ID VARCHAR2(100),
"
"             SM_PROD_REV NUMBER(5),
"
"             SM_ORD_QTY NUMBER(12,3),
"
"             SM_UNIT_COST NUMBER(17,5),
"
"             SM_DISC_PCT NUMBER(17,5),
"
"             SM_DISC_AMT NUMBER(17,5),
"
"             SM_STORE_ID VARCHAR2(250),
"
"             SM_REFERENCE VARCHAR2(2000));
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PLNT VARCHAR2(10),
"
"                                         SM_CUST_ID VARCHAR2(10),
"
"                                         SM_AR_CLASS VARCHAR2(100),
"
"                     SM_PROD_ID VARCHAR2(100),
"
"                     SM_PROD_REV NUMBER(5),
"
"                     SM_ORD_QTY NUMBER(12,3),
"
"                     SM_UNIT_COST NUMBER(17,5),
"
"                     SM_DISC_PCT NUMBER(17,5),
"
"                     SM_DISC_AMT NUMBER(17,5),
"
"                     SM_STORE_ID VARCHAR2(250),
"
"                     SM_REFERENCE VARCHAR2(2000))
"
"                                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '''||p_sep||'''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (SM_PLNT  CHAR(255),
"
"                     SM_CUST_ID  CHAR(255),
"
"                     SM_AR_CLASS  CHAR(255),
"
"                     SM_PROD_ID  CHAR(255),
"
"                     SM_PROD_REV  CHAR(255),
"
"                     SM_ORD_QTY CHAR(255),
"
"                     SM_UNIT_COST CHAR(255),
"
"                     SM_DISC_PCT CHAR(255),
"
"                     SM_DISC_AMT CHAR(255),
"
"                     SM_STORE_ID  CHAR(255),
"
"                     SM_REFERENCE  CHAR(255)))
"
"                    LOCATION ('''||p_fname||''')
"
"                    ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"  /*Commit;
"
"  Raise_Application_Error(-20999,'HRM');*/
"
"
"
"
"
"  /*DELETE sal_rtn_cm_mig_ln
"
"   WHERE srcml_bu = p_bu
"
"     AND srcml_doc_no = p_doc_no; */
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
"     BEGIN
"
"        SELECT aadc_cls_id
"
"      INTO ar_class
"
"      FROM ap_ar_doc_class
"
"     WHERE aadc_bu = p_bu
"
"       --AND aadc_doc_type = 'SR'
"
"       --AND aadc_deflt_flag = 'Y'
"
"           AND aadc_cls_desc = TRIM(cr_st(indx).sm_ar_class);
"
"
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN
"
"         ar_class := NULL;
"
"     END;
"
"
"
"     BEGIN
"
"        SELECT dept_id
"
"          INTO v_dept
"
"      FROM departments
"
"     WHERE dept_bu = p_bu
"
"           AND dept_name1 = TRIM(cr_st(indx).sm_store_id);
"
"
"
"            EXCEPTION WHEN OTHERS THEN
"
"              --ar_class := NULL;
"
"              Raise_Application_Error(-20999,'HRM'||'~'||v_dept);
"
"     END;
"
"
"
"      SELECT NVL(MAX(srcml_seq_no),0) + 1
"
"        INTO v_seq_no
"
"        FROM sal_rtn_cm_mig_ln
"
"       WHERE srcml_bu = p_bu
"
"         AND srcml_doc_no = p_doc_no;
"
"
"
"                  INSERT INTO sal_rtn_cm_mig_ln(srcml_bu,
"
"                        srcml_plnt,
"
"                        srcml_doc_no,
"
"                        srcml_seq_no,
"
"                        srcml_cust_id,
"
"                        srcml_prod_id,
"
"                        srcml_prod_rev,
"
"                        srcml_ordered_qty,
"
"                        srcml_unit_cost,
"
"                        srcml_disc_pct,
"
"                        srcml_disc_amt,
"
"                        srcml_from_store_id,
"
"                        srcml_ar_class,
"
"                        srcml_reference,
"
"                        srcml_cre_by,
"
"                        srcml_cre_date)
"
"                                     VALUES(p_bu,
"
"                            cr_st(indx).sm_plnt,
"
"                        p_doc_no,
"
"                        v_seq_no,
"
"                                            cr_st(indx).sm_cust_id,
"
"                        cr_st(indx).sm_prod_id,
"
"                        cr_st(indx).sm_prod_rev,
"
"                        cr_st(indx).sm_ord_qty,
"
"                                            cr_st(indx).sm_unit_cost,
"
"                        cr_st(indx).sm_disc_pct,
"
"                        cr_st(indx).sm_disc_amt,
"
"                        v_dept,
"
"                        ar_class,
"
"                        cr_st(indx).sm_reference,
"
"                        p_user,
"
"                        SYSDATE
"
"                        );
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_srcm_mig;
"
"
"
"
"
"PROCEDURE proc_ins_pend_so_mig1(p_bu        business_units.bu_id%TYPE,
"
"                    p_doc_no    sales_order_mig_hd.somh_doc_no%TYPE,
"
"                    p_fname        sales_order_mig_hd.somh_file_name%TYPE,
"
"                    p_sep        VARCHAR2,
"
"                    p_user        sales_order_mig_hd.somh_cre_by%TYPE,
"
"                    p_res    OUT VARCHAR2
"
"                ) --AUTHIDCURRENT_USER
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_sql1     VARCHAR2(20000);
"
"v_fpath    VARCHAR2(200);
"
"v_tax   VARCHAR2(200);
"
"v_tax_cls VARCHAR2(200);
"
"v_plnt_loc_id VARCHAR2(100);
"
"v_seq        NUMBER;
"
"v_lead_time  NUMBER(10);
"
"v_cust_lead_time  NUMBER(10);
"
"v_po_date_time          DATE;
"
"v_rqrd_date_time        DATE;
"
"v_desp_date             DATE;
"
"v_desp_date1            DATE;
"
"v_desp_date2            DATE;
"
"v_seq_no    NUMBER(5) := 0;
"
"
"
"TYPE typ_ins_gpi IS RECORD (SM_UNIT_LOC_ID VARCHAR2(10),
"
"                                        SM_UNIT        VARCHAR2(10),
"
"                                         SM_CUST_ID         VARCHAR2(10),
"
"                     SM_PROD_ID        VARCHAR2(100),
"
"                     SM_PROD_REV        NUMBER(5),
"
"                     SM_PROD_DESC         VARCHAR2(150),
"
"                     SM_UOM         VARCHAR2(5),
"
"                     SM_QTY         VARCHAR2(100),--NUMBER(15,5),
"
"                     SM_PRICE       VARCHAR2(100),  --NUMBER(15,5),
"
"                     SM_DISC_PCT    VARCHAR2(20),  --NUMBER(10,2),
"
"                     SM_ORD_DATE            DATE,
"
"                     SM_REQ_DATE         DATE,
"
"                     SM_CUST_PO_NO         VARCHAR2(100),
"
"                     SM_PO_DATE         DATE,
"
"                     SM_EXE_RATE         VARCHAR2(30),--NUMBER(13,8),
"
"                     SM_OLD_SO_PFX         VARCHAR2(5),
"
"                     SM_OLD_SO_NO         VARCHAR2(30),
"
"                     SM_OLD_SO_SEQ_NO     NUMBER(5),
"
"                     SM_CC_CODE          VARCHAR2(100),
"
"                     SM_HSN_CODE VARCHAR2(25),
"
"             SM_GST_TYPE         VARCHAR2(1),
"
"                     SM_INPUT_TYPE         VARCHAR2(1),
"
"                     SM_GL_ACCT             VARCHAR2(20));
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"
"
"BEGIN
"
"p_res  := 'N';
"
"
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
"
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_UNIT_LOC_ID VARCHAR2(10),
"
"                                        SM_UNIT        VARCHAR2(10),
"
"                                         SM_CUST_ID         VARCHAR2(10),
"
"                     SM_PROD_ID        VARCHAR2(100),
"
"                     SM_PROD_REV        NUMBER(5),
"
"                     SM_PROD_DESC         VARCHAR2(150),
"
"                     SM_UOM         VARCHAR2(5),
"
"                     SM_QTY         VARCHAR2(100),--NUMBER(15,5),
"
"                     SM_PRICE       VARCHAR2(100),--NUMBER(15,5),
"
"                     SM_DISC_PCT    VARCHAR2(20),--NUMBER(10,2),
"
"                     SM_ORD_DATE            DATE,
"
"                     SM_REQ_DATE         DATE,
"
"                     SM_CUST_PO_NO         VARCHAR2(100),
"
"                     SM_PO_DATE         DATE,
"
"                     SM_EXE_RATE         VARCHAR2(30),--NUMBER(13,8),
"
"                     SM_OLD_SO_PFX         VARCHAR2(5),
"
"                     SM_OLD_SO_NO         VARCHAR2(30),
"
"                     SM_OLD_SO_SEQ_NO     NUMBER(5),
"
"                     SM_CC_CODE          VARCHAR2(100),
"
"                     SM_HSN_CODE VARCHAR2(25),
"
"             SM_GST_TYPE         VARCHAR2(1),
"
"                     SM_INPUT_TYPE         VARCHAR2(1),
"
"                     SM_GL_ACCT             VARCHAR2(20)
"
"             )
"
"                    ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                    ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                    SKIP 1
"
"                    FIELDS TERMINATED BY '''||p_sep||''' OPTIONALLY ENCLOSED BY ''""''
"
"                    MISSING FIELD VALUES ARE NULL
"
"                    REJECT ROWS WITH ALL NULL FIELDS
"
"                    (SM_UNIT_LOC_ID CHAR(255),
"
"                     SM_UNIT          CHAR(255),
"
"                     SM_CUST_ID          CHAR(255),
"
"                     SM_PROD_ID          CHAR(255),
"
"                     SM_PROD_REV         CHAR(255),
"
"                     SM_PROD_DESC         CHAR(255),
"
"                     SM_UOM         CHAR(255),
"
"                     SM_QTY         CHAR(255),
"
"                     SM_PRICE         CHAR(255),
"
"                     SM_DISC_PCT    CHAR(255),
"
"                     SM_ORD_DATE         CHAR(255),
"
"                     SM_REQ_DATE         CHAR(255),
"
"                     SM_CUST_PO_NO         CHAR(255),
"
"                     SM_PO_DATE         CHAR(255),
"
"                     SM_EXE_RATE         CHAR(255),
"
"                     SM_OLD_SO_PFX         CHAR(255),
"
"                     SM_OLD_SO_NO         CHAR(255),
"
"                     SM_OLD_SO_SEQ_NO     CHAR(255),
"
"             SM_CC_CODE          CHAR(255),
"
"             SM_HSN_CODE      CHAR(255),
"
"             SM_GST_TYPE         CHAR(255),
"
"             SM_INPUT_TYPE       CHAR(255),
"
"             SM_GL_ACCT          CHAR(255)
"
"         ))
"
"                    LOCATION ('''||p_fname||''')
"
"                    ) REJECT LIMIT UNLIMITED';
"
"
"
"  BEGIN
"
"           SELECT jva_exl_seq.NEXTVAL INTO v_seq FROM DUAL;
"
"
"
"         INSERT INTO EXCEL_GENERATE_QUERY (EGQ_NO,
"
"                                           EGQ_QUERY,
"
"                                           EGQ_CRE_BY,
"
"                                           EGQ_CRE_DATE,
"
"                                           EGQ_BUS_FUN)
"
"              VALUES (v_seq,
"
"                      v_sql,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      'SOM1040');
"
"   END;
"
"
"
"   Commit;
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"       DELETE sales_order_mig_ln
"
"        WHERE soml_bu = p_bu
"
"          AND soml_doc_no = p_doc_no;
"
"
"
" ---Lead Time
"
"
"
"  --for v_rqrd_date in (select * from scm_migration)
"
"  --LOOP
"
"OPEN c_st FOR 'SELECT * FROM scm_migration';
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
"
"
"FOR indx IN 1..cr_st.COUNT
"
" LOOP
"
"
"
"/*
"
"BEGIN
"
"SELECT custp_fix_lead_time
"
"  INTO v_lead_time
"
"        FROM cust_prod
"
"       WHERE     custp_bu = p_bu
"
"             AND custp_cust_id = cr_st(indx).sm_cust_id
"
"             AND custp_prod_id = cr_st(indx).sm_prod_id;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"v_lead_time := 0;
"
"END;   */
"
"
"
"
"
"
"
"/*BEGIN
"
"  SELECT splsa_lead_time
"
"  INTO v_cust_lead_time
"
"    FROM suplr_plant_loc_sub_asso
"
"   WHERE splsa_bu = p_bu
"
"     AND splsa_cust_id = cr_st(indx).sm_cust_id;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"v_cust_lead_time := 0;
"
"END;
"
"
"
"       v_po_date_time := cr_st(indx).sm_ord_date + NVL(v_lead_time,0);
"
"       v_rqrd_date_time := cr_st(indx).sm_ord_date - NVL(v_cust_lead_time,0);
"
"
"
"        IF v_po_date_time > v_rqrd_date_time
"
"        THEN
"
"           v_desp_date := v_po_date_time;
"
"        ELSIF v_po_date_time < v_rqrd_date_time
"
"        THEN
"
"           v_desp_date := v_rqrd_date_time;
"
"        END IF;
"
"
"
"       /* IF v_po_date_time = v_rqrd_date_time
"
"        THEN
"
"           v_desp_date := cr_st(indx).sm_ord_date;
"
"        END IF;
"
"
"
"BEGIN
"
"      SELECT wcln_date
"
"        INTO v_desp_date1
"
"        FROM workday_calendar_hd, workday_calendar_ln
"
"       WHERE     wchd_bu = wcln_bu
"
"             AND wchd_plnt = wcln_plnt
"
"             AND wchd_clndr_no = wcln_clndr_no
"
"             AND wchd_bu = p_bu
"
"             AND wchd_plnt = cr_st(indx).sm_unit
"
"             AND wchd_year >=
"
"                    func_find_year (p_bu, v_desp_date)
"
"             AND wchd_status = 'A'
"
"             AND wcln_holiday = 'N'
"
"             AND TRUNC (wcln_date) >= TRUNC (v_desp_date)
"
"             AND ROWNUM = 1
"
"    ORDER BY wcln_date;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_desp_date1 := v_desp_date;
"
"END;
"
"
"
"    v_desp_date2 := v_desp_date1; */
"
"
"
"
"
"        SELECT NVL(MAX(SOML_SEQ_NO),0) + 1
"
"              INTO v_seq_no
"
"              FROM SALES_ORDER_MIG_LN
"
"             WHERE SOML_BU = p_bu
"
"               AND SOML_DOC_NO = p_doc_no;
"
"
"
"                     v_sql1 := 'INSERT INTO SALES_ORDER_MIG_LN(SOML_BU,
"
"                                                              SOML_DOC_NO,
"
"                                                              SOML_SEQ_NO,
"
"                                                              SOML_PLNT_LOC_ID,
"
"                                                              SOML_PLANT,
"
"                                                              SOML_CUST_ID,
"
"                                                              SOML_PROD_ID,
"
"                                                              SOML_PROD_REV,
"
"                                                              SOML_PROD_DESC1,
"
"                                                              SOML_LOT_TYPE,
"
"                                                              SOML_UOM,
"
"                                                              SOML_QTY_ORDERED,
"
"                                                              SOML_PRICE,
"
"                                                              SOML_DISC_PCT,
"
"                                                              SOML_ORDER_DATE,
"
"                                                              SOML_RQRD_DATE,
"
"                                                              SOML_CUST_PO_NO,
"
"                                                              SOML_CUST_PO_DATE,
"
"                                                              SOML_EXCHANGE_RATE,
"
"                                                              SOML_OLD_SO_PFX,
"
"                                                              SOML_OLD_SO_NO,
"
"                                                              SOML_OLD_SO_SEQ_NO,
"
"                                                              SOML_CRE_BY,
"
"                                                              SOML_CRE_DATE,
"
"                                                              --SOML_STORE_ID,
"
"                                                              SOML_CC_CODE,
"
"                                                              SOML_HSN_CODE,
"
"                                  SOML_GST_EXEMPT_FLAG,
"
"                                                              SOML_INPUT_TYPE,
"
"                                                              SOML_SAL_ACCT_ID
"
"                                  )
"
"                                                       SELECT '''||p_bu||''',
"
"                                                          '''||p_doc_no||''',
"
"                                  ROWNUM,
"
"                                  SM_UNIT_LOC_ID,
"
"                                  SM_UNIT,
"
"                                  SM_CUST_ID,
"
"                                  TRIM(SM_PROD_ID),
"
"                                  SM_PROD_REV , --func_find_max_prod_rev('''||p_bu||''',sm_prod_id),
"
"                                  SM_PROD_DESC, --func_find_prod_qry_desc('''||p_bu||''',TRIM(SM_PROD_ID),sm_prod_rev,1),
"
"                                  ''R'',
"
"                                  SM_UOM,
"
"                                  NVL(SM_QTY,0),
"
"                                  ROUND(NVL(SM_PRICE,0),2),
"
"                                  NVL(SM_DISC_PCT,0),
"
"                                  NVL(SM_ORD_DATE,SYSDATE),
"
"                                  SM_REQ_DATE,--NVL('''||v_desp_date2||''',SM_REQ_DATE),
"
"                                  SM_CUST_PO_NO,
"
"                                  SM_PO_DATE,
"
"                                  NVL(SM_EXE_RATE,1),
"
"                                  SM_OLD_SO_PFX,
"
"                                  SM_OLD_SO_NO,
"
"                                  SM_OLD_SO_SEQ_NO,
"
"                                  '''||p_user||''',
"
"                                  SYSDATE,
"
"                                  --func_find_ship_storeid('''||p_bu||''',SM_UNIT,SM_UNIT_LOC_ID,TRIM(SM_PROD_ID),sm_prod_rev,''Y''),
"
"                                  TRIM(sm_cc_code),
"
"                                  SM_HSN_CODE,
"
"                  SM_GST_TYPE,
"
"                                  SM_INPUT_TYPE,
"
"                                  SM_GL_ACCT
"
"                              FROM scm_migration';
"
"
"
"--end loop;
"
"END LOOP;
"
"
"
"IF v_sql1 IS NOT NULL THEN
"
"  EXECUTE IMMEDIATE v_sql1;
"
"ELSE
"
"  p_res  := 'N';
"
"END IF;
"
"
"
"  IF SQL%FOUND THEN
"
"    p_res  := 'Y';
"
"  END IF;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_pend_so_mig1;
"
"
"
"
"
"PROCEDURE proc_ins_pend_so_mig(p_bu            VARCHAR2,
"
"                   p_doc_no            VARCHAR2,
"
"                   p_fname            VARCHAR2,
"
"                   p_sep            VARCHAR2,
"
"                   p_user            VARCHAR2,
"
"                   p_res   OUT         VARCHAR2
"
"                  )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_tax           VARCHAR2(200);
"
"v_tax_cls       VARCHAR2(200);
"
"v_cat_id    VARCHAR2(5);
"
"v_exe_id    VARCHAR2(10);
"
"v_seq_no     NUMBER(7);
"
"v_price         VARCHAR2(200);
"
"v_class         VARCHAR2(200);
"
"v_prod_id    VARCHAR2(100);
"
"v_prod_rev     NUMBER(5);
"
"
"
"
"
"TYPE typ_ins_gpi IS RECORD (sm_type                    VARCHAR2(1),
"
"                            sm_cust_id                VARCHAR2(25),
"
"                            sm_prod_id                VARCHAR2(100),
"
"                            sm_prod_rev                NUMBER(5),
"
"                            sm_uom                    VARCHAR2(30),
"
"                            sm_ctlg_id               VARCHAR2(25),
"
"                            sm_cust_item            VARCHAR2(100),
"
"                            sm_cust_item_desc         VARCHAR2(150),
"
"                            sm_hsn_code             VARCHAR2(100),
"
"                            sm_price_basis            VARCHAR2(2));
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"p_res  := 'N';
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"       v_sql := 'CREATE TABLE SCM_MIGRATION(SM_TYPE              VARCHAR2(1),
"
"                                            SM_CUST_ID        VARCHAR2(25),
"
"                                            SM_PROD_ID        VARCHAR2(100),
"
"                                            SM_PROD_REV       NUMBER(5),
"
"                                            SM_UOM            VARCHAR2(30),
"
"                                            SM_CTLG_ID        VARCHAR2(25),
"
"                                            SM_CUST_ITEM      VARCHAR2(100),
"
"                                            SM_CUST_ITEM_DESC VARCHAR2(150),
"
"                                            SM_HSN_CODE       VARCHAR2(100),
"
"                                            SM_PRICE_BASIS    VARCHAR2(2))
"
"                    ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                    ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                    SKIP 1
"
"                    FIELDS TERMINATED BY '''||p_sep||'''
"
"                    MISSING FIELD VALUES ARE NULL
"
"                    REJECT ROWS WITH ALL NULL FIELDS
"
"                    (SM_TYPE            CHAR(255),
"
"                     SM_CUST_ID            CHAR(255),
"
"                     SM_PROD_ID            CHAR(255),
"
"                     SM_PROD_REV        CHAR(255),
"
"                     SM_UOM             CHAR(255),
"
"                     SM_CTLG_ID         CHAR(255),
"
"                     SM_CUST_ITEM       CHAR(255),
"
"                     SM_CUST_ITEM_DESC  CHAR(255),
"
"                     SM_HSN_CODE         CHAR(255),
"
"                     SM_PRICE_BASIS     CHAR(255))
"
"                     )
"
"                    LOCATION ('''||p_fname||''')
"
"                    ) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
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
"   DELETE cust_prod_mig_ln
"
"    WHERE cpml_bu = p_bu
"
"      AND cpml_doc_no = p_doc_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"  --RAISE_APPLICATION_ERROR(-20999,cr_st(indx).sm_cust_id);
"
"  BEGIN
"
"  SELECT sc_ctlg_id
"
"    INTO v_cat_id
"
"    FROM sales_catalog
"
"   WHERE sc_bu = p_bu
"
"     AND sc_ctlg_desc = UPPER(TRIM(cr_st(indx).sm_ctlg_id));
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_cat_id := NULL;
"
"  END;
"
"
"
"
"
"  BEGIN
"
"    SELECT spc_class_id
"
"      INTO v_class
"
"      FROM sales_price_classes
"
"     WHERE spc_bu = p_bu
"
"       AND spc_sel_flag = 'Y' ;
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_class := NULL;
"
"  END;
"
"
"
"   SELECT NVL(MAX(cpml_seq_no),0) + 1
"
"      INTO v_seq_no
"
"      FROM cust_prod_mig_ln
"
"     WHERE cpml_bu = p_bu
"
"       AND cpml_doc_no = p_doc_no;
"
"
"
"  INSERT INTO cust_prod_mig_ln(cpml_bu,
"
"                               cpml_doc_no,
"
"                               cpml_seq_no,
"
"                               cpml_cust_id,
"
"                               cpml_prod_id,
"
"                               cpml_prod_rev,
"
"                               cpml_cust_prod_id,
"
"                               cpml_cust_prod_desc,
"
"                               cpml_uom,
"
"                               cpml_price_basis,
"
"                               cpml_type,
"
"                               cpml_class_id,
"
"                               /*cpml_drawing_no,
"
"                               cpml_drg_rev,
"
"                               cpml_drg_date,*/
"
"                               cpml_tcf_id,
"
"                               cpml_hsn_code,
"
"                               cpml_ctlg_id,
"
"                               cpml_cre_by,
"
"                               cpml_cre_date)
"
"                        VALUES(p_bu,
"
"                               p_doc_no,
"
"                               v_seq_no,
"
"                               cr_st(indx).sm_cust_id,
"
"                               cr_st(indx).sm_prod_id,
"
"                               cr_st(indx).sm_prod_rev,
"
"                               cr_st(indx).sm_cust_item , --cr_st(indx).sm_prod_id,
"
"                               cr_st(indx).sm_cust_item_desc,
"
"                               cr_st(indx).sm_uom,
"
"                               NVL(cr_st(indx).sm_price_basis,'U'),
"
"                               NVL(cr_st(indx).sm_type,'S'),
"
"                               v_class,
"
"                              /* cr_st(indx).sm_drg_no ,
"
"                               cr_st(indx).sm_drg_rev ,
"
"                               cr_st(indx).sm_drg_date ,*/
"
"                               NULL,
"
"                               cr_st(indx).sm_hsn_code ,
"
"                               v_cat_id,
"
"                               p_user,
"
"                               SYSDATE);
"
"  p_res  := 'Y';
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_pend_so_mig;
"
"
"
"PROCEDURE proc_ins_enqry_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_doc_no        opport_hd.ophd_doc_no%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        opport_hd.ophd_cre_by%TYPE
"
"                 )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PLNT VARCHAR2(10),SM_ITEM_GRP VARCHAR2(10),SM_PROD_ID VARCHAR2(100),SM_PROD_REV NUMBER(5),SM_PROD_DESC VARCHAR(150),SM_UOM NUMBER(5),SM_CUST_PROD_ID VARCHAR2(100),SM_CUST_PROD_DESC  VARCHAR2(150),
"
"    SM_REG_QTY NUMBER(12,3),SM_SAM_QTY NUMBER(12,3),SM_PILOT_QTY NUMBER(12,3))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_PLNT  CHAR(255),SM_ITEM_GRP  CHAR(255),SM_PROD_ID  CHAR(255),SM_PROD_REV  CHAR(255),SM_PROD_DESC  CHAR(255),SM_UOM  CHAR(255),SM_CUST_PROD_ID CHAR(255),SM_CUST_PROD_DESC CHAR(255),
"
"SM_REG_QTY CHAR(255),SM_SAM_QTY CHAR(255),SM_PILOT_QTY CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE opport_prod
"
"   WHERE oprd_bu = p_bu
"
"     AND oprd_doc_no = p_doc_no;
"
"
"
"  v_sql := 'INSERT INTO opport_prod(oprd_bu,oprd_plnt,oprd_doc_no,oprd_seq_no,
"
"            oprd_prod_group,oprd_prod_id,oprd_prod_rev,oprd_prod_desc1,oprd_uom,oprd_cust_prod_id,oprd_cust_prod_desc,
"
"            oprd_qty,oprd_samp_lot_qty,oprd_pilot_lot_qty,oprd_cre_by,oprd_cre_date)
"
"              SELECT '''||p_bu||''',sm_plnt,'''||p_doc_no||''',ROWNUM,
"
"              sm_item_grp,sm_prod_id,sm_prod_rev,sm_prod_desc,sm_uom,sm_cust_prod_id,sm_cust_prod_desc,
"
"              sm_reg_qty,sm_sam_qty,sm_pilot_qty,'''||p_user||''',SYSDATE
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_enqry_mig;
"
"
"
"PROCEDURE proc_ins_leads_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_lead_no        mktg_leads.ml_lead_no%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        mktg_leads.ml_cre_by%TYPE
"
"                 )
"
"AS
"
"
"
"CURSOR c1 (c_whatsap_no    NUMBER) IS
"
"
"
"   SELECT COUNT(*) var_cnt,ml_whatsapp_no
"
"     FROM mktg_leads
"
"    WHERE ml_bu = p_bu
"
"      AND ml_whatsapp_no = c_whatsap_no
"
"      AND ml_status <> 'C'
"
"      AND ml_whatsapp_no IS NOT NULL
"
" GROUP BY ml_whatsapp_no;
"
"
"
" cr1 c1%ROWTYPE;
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_lead_no        VARCHAR2(30);
"
"v_act_doc_no            VARCHAR2(15);
"
"var_comp_name        VARCHAR2(50);
"
"var_addr1        VARCHAR2(50);
"
"
"
"v_city_id        VARCHAR2(10);
"
"v_state_id        VARCHAR2(10);
"
"v_cntry_id        VARCHAR2(10);
"
"v_sp_id            VARCHAR2(10);
"
"v_campgn_id        VARCHAR2(10);
"
"v_lead_source_id    VARCHAR2(10);
"
"v_owner_id        VARCHAR2(10);
"
"v_stage_id        VARCHAR2(10);
"
"v_sub_terr_id        VARCHAR2(10);
"
"v_terr_id        VARCHAR2(10);
"
"v_sales_area_id        VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_CONT_FIR_NAME VARCHAR2(100),
"
"                        SM_TITLE    VARCHAR2(50),
"
"                        SM_COMP_NAME    VARCHAR2(100),
"
"                        SM_ADDR1 VARCHAR2(50),
"
"                        SM_ADDR2 VARCHAR2(50),
"
"                        SM_ADDR3 VARCHAR2(50),
"
"                        SM_CITY VARCHAR(100),
"
"                        SM_STATE VARCHAR(100),
"
"                        SM_COUNTRY VARCHAR(100),
"
"                        SM_TELEPHONE1  VARCHAR2(30),
"
"                        SM_TELEPHONE2  VARCHAR2(30),
"
"                        SM_MOBILE NUMBER(30),
"
"                        SM_WHATSAPP_NO NUMBER(30),
"
"                        SM_FAX VARCHAR2(30),
"
"                        SM_URL VARCHAR2(50),
"
"                        SM_WEBSITE VARCHAR2(30),
"
"                        SM_SAL_PER VARCHAR2(100),
"
"                        SM_COMPAIGN VARCHAR2(100),
"
"                        SM_LEAD_SOURCE VARCHAR2(100),
"
"                        SM_OWNER VARCHAR2(100),
"
"                        SM_STAGE VARCHAR2(100),
"
"                        SM_CURRENCY VARCHAR2(5),
"
"                        SM_REMARKS VARCHAR2(500),
"
"                        SM_ACT_TYPE VARCHAR2(2),
"
"                        SM_NA_DATE DATE,
"
"                        SM_SUB_TERR VARCHAR2(30)
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_CONT_FIR_NAME VARCHAR2(100),SM_TITLE VARCHAR2(50),SM_COMP_NAME VARCHAR2(100),SM_ADDR1 VARCHAR2(50),SM_ADDR2 VARCHAR2(50),SM_ADDR3 VARCHAR2(50),SM_CITY VARCHAR(30),SM_STATE VARCHAR(30),SM_COUNTRY VARCHAR(30),SM_TELEPHONE1  VARCHAR2(300),
"
"    SM_TELEPHONE2  VARCHAR2(30),SM_MOBILE NUMBER(30),SM_WHATSAPP_NO NUMBER(30),SM_FAX VARCHAR2(30),SM_URL VARCHAR2(50),SM_WEBSITE VARCHAR2(30),SM_SAL_PER VARCHAR2(100),SM_COMPAIGN VARCHAR2(100),SM_LEAD_SOURCE VARCHAR2(100),SM_OWNER VARCHAR2(100),SM_STAGE VARCHAR2(10),SM_CURRENCY VARCHAR2(5),SM_REMARKS VARCHAR2(500),SM_ACT_TYPE VARCHAR2(2),SM_NA_DATE DATE,SM_SUB_TERR VARCHAR2(30))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_CONT_FIR_NAME  CHAR(255),SM_TITLE CHAR(255),SM_COMP_NAME CHAR(255),SM_ADDR1  CHAR(50),SM_ADDR2  CHAR(50),SM_ADDR3  CHAR(50),SM_CITY  CHAR(255),SM_STATE  CHAR(255),SM_COUNTRY CHAR(255),SM_TELEPHONE1 CHAR(255),
"
" SM_TELEPHONE2 CHAR(255),SM_MOBILE CHAR(255),SM_WHATSAPP_NO CHAR(255),SM_FAX CHAR(255),SM_URL CHAR(255),SM_WEBSITE CHAR(255),SM_SAL_PER CHAR(255),SM_COMPAIGN CHAR(255),SM_LEAD_SOURCE CHAR(255),SM_OWNER CHAR(255),SM_STAGE CHAR(255),SM_CURRENCY CHAR(255),SM_REMARKS CHAR(255),SM_ACT_TYPE CHAR(255),SM_NA_DATE CHAR(255),SM_SUB_TERR CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"COMMIT;
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM');
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
"    IF (cr_st(indx).sm_city) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT city_id
"
"          INTO v_city_id
"
"          FROM cities
"
"         WHERE city_name1 = TRIM(UPPER(cr_st(indx).sm_city));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20005,'ADM'||'/'||(cr_st(indx).sm_city));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_state) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT state_id
"
"          INTO v_state_id
"
"          FROM states
"
"         WHERE state_name1 = TRIM(UPPER(cr_st(indx).sm_state));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20044,'ADM'||'/'||UPPER(cr_st(indx).sm_state));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_country) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT cntry_id
"
"          INTO v_cntry_id
"
"          FROM countries
"
"         WHERE cntry_name1 = TRIM(UPPER(cr_st(indx).sm_country));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20007,'ADM'||'/'||(cr_st(indx).sm_country));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_sal_per) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sp_person
"
"          INTO v_sp_id
"
"      FROM sales_persons
"
"         WHERE sp_bu = p_bu
"
"           AND sp_person_name1 = TRIM(UPPER(cr_st(indx).sm_sal_per));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20421,'CRM'||'/'||TRIM(UPPER(cr_st(indx).sm_sal_per)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_compaign) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT crmc_campaign_id
"
"          INTO v_campgn_id
"
"      FROM crm_campaigns
"
"     WHERE crmc_bu  = p_bu
"
"       AND crmc_desc1 = UPPER(cr_st(indx).sm_compaign);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"         Raise_application_error(-20738,'CRM'||'/'||TRIM(UPPER(cr_st(indx).sm_compaign)));
"
"          --v_campgn_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_lead_source) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT ls_source_id
"
"          INTO v_lead_source_id
"
"      FROM lead_sources
"
"     WHERE ls_bu  = p_bu
"
"       AND ls_desc1 = UPPER(cr_st(indx).sm_lead_source);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20748,'CRM'||'/'||TRIM(UPPER(cr_st(indx).sm_lead_source)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_owner) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT emp_emp_id
"
"          INTO v_owner_id
"
"      FROM employees
"
"     WHERE emp_bu = p_bu
"
"       AND emp_first_name1 = UPPER(cr_st(indx).sm_owner);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          --v_owner_id := NULL;
"
"         Raise_application_error(-20993,'PRM'||'/'||TRIM(UPPER(cr_st(indx).sm_owner)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_stage) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT lds_stage_id
"
"          INTO v_stage_id
"
"          FROM lead_stages
"
"         WHERE lds_bu  = p_bu
"
"           AND lds_desc1 = UPPER(cr_st(indx).sm_stage);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          --v_stage_id := NULL;
"
"         Raise_application_error(-20650,'PRJ'||'/'||TRIM(UPPER(cr_st(indx).sm_stage)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"      IF (cr_st(indx).sm_sub_terr) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sst_sub_terr_id
"
"          INTO v_sub_terr_id
"
"          FROM sales_sub_terr,sales_area_terr
"
"         WHERE sst_bu = sat_bu
"
"           AND sst_terr_id = sat_terr_id
"
"           AND sst_bu = p_bu
"
"           AND sst_desc1 = TRIM(UPPER(cr_st(indx).sm_sub_terr));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20586,'SOM'||'/'||TRIM(UPPER(cr_st(indx).sm_sub_terr)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"      IF (cr_st(indx).sm_sub_terr) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sst_terr_id
"
"          INTO v_terr_id
"
"          FROM sales_sub_terr
"
"         WHERE sst_bu = p_bu
"
"           AND sst_sub_terr_id = v_sub_terr_id;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_terr_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"      IF (cr_st(indx).sm_sub_terr) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sat_sarea_id
"
"          INTO v_sales_area_id
"
"          FROM sales_area_terr
"
"         WHERE sat_bu= p_bu
"
"           AND sat_terr_id = v_terr_id;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_sales_area_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"  SELECT NVL(MAX(TO_NUMBER(ml_lead_no)),0)+ 1
"
"    INTO v_lead_no
"
"    FROM mktg_leads
"
"   WHERE ml_bu = p_bu;
"
"
"
"  -- Raise_Application_Error(-20999,'HRM'||'/'||p_bu,v_lead_no);
"
"
"
"  IF LENGTH(cr_st(indx).sm_addr1) >= 50 THEN
"
"    var_addr1 := SUBSTR(cr_st(indx).sm_addr1,1,50);
"
"  ELSE
"
"    var_addr1 := cr_st(indx).sm_addr1;
"
"  END IF;
"
"
"
"  IF LENGTH(cr_st(indx).sm_comp_name) >= 50 THEN
"
"    var_comp_name := SUBSTR(cr_st(indx).sm_comp_name,1,50);
"
"  ELSE
"
"    var_comp_name := cr_st(indx).sm_comp_name;
"
"  END IF;
"
"
"
"OPEN c1(cr_st(indx).sm_whatsapp_no);
"
"FETCH c1 INTO cr1;
"
"  IF c1%FOUND THEN
"
"    IF cr1.var_cnt > 1 THEN
"
"      Raise_application_error(-20005,'MKG');
"
"    END IF;
"
"  END IF;
"
"CLOSE c1;
"
"
"
" IF v_state_id IS NULL THEN
"
"    proc_find_state_cntry(p_bu,v_city_id,v_state_id,v_cntry_id);
"
" END IF;
"
"
"
"  INSERT INTO mktg_leads(ml_bu,
"
"                         ml_lead_no,
"
"                         ml_lead_date,
"
"                         ml_cp_name,
"
"                         ml_title,
"
"                         ml_comp_name,
"
"                 ml_addr1,
"
"                 ml_addr2,
"
"                 ml_addr3,
"
"                 ml_city_id,
"
"                 ml_state_id,
"
"                 ml_cntry_id,
"
"                 ml_tel1,
"
"                 ml_tel2,
"
"                 ml_mobile,
"
"                 ml_fax,
"
"                 ml_url,
"
"                 ml_website,
"
"                 ml_sp_id,
"
"                 ml_campaign_id,
"
"                 ml_lead_source,
"
"                 ml_lead_owner,
"
"                 ml_lead_stage,
"
"                 ml_rev_curcy,
"
"                 ml_cre_by,
"
"                 ml_cre_date,
"
"                 ml_cp_exist_type,
"
"             ml_person_pfx,
"
"             ml_city_name,
"
"             ml_state_name,
"
"             ml_cntry_name,
"
"             ml_status,
"
"             ml_la_type,
"
"             ml_na_type,
"
"             ml_tel_cntry_code1,
"
"             ml_tel_cntry_code2,
"
"             ml_mob_cntry_code,
"
"             ml_whatsapp_no,
"
"             ml_remarks,
"
"             ml_sub_terr,
"
"             ml_terr_id,
"
"             ml_sales_area
"
"                 )
"
"                 VALUES(p_bu,
"
"                        v_lead_no,
"
"                        TRUNC(SYSDATE),
"
"                        UPPER(cr_st(indx).sm_cont_fir_name),
"
"                        cr_st(indx).sm_title,
"
"                        UPPER(var_comp_name), --cr_st(indx).sm_comp_name,
"
"                        UPPER(var_addr1), --cr_st(indx).sm_addr1,
"
"                        UPPER(cr_st(indx).sm_addr2),
"
"                        UPPER(cr_st(indx).sm_addr3),
"
"                        v_city_id,
"
"                        v_state_id,
"
"                        v_cntry_id,
"
"                        cr_st(indx).sm_telephone1,
"
"                        cr_st(indx).sm_telephone2,
"
"                        cr_st(indx).sm_mobile,
"
"                        cr_st(indx).sm_fax,
"
"                        cr_st(indx).sm_url,
"
"                        cr_st(indx).sm_website,
"
"                        v_sp_id,
"
"                        v_campgn_id,
"
"                        v_lead_source_id,
"
"                        v_owner_id,
"
"                        v_stage_id,
"
"                        TRIM(cr_st(indx).sm_currency),
"
"                        p_user,
"
"                        SYSDATE,
"
"                        'L',
"
"                        'Mr.',
"
"                        cr_st(indx).sm_city,
"
"                        cr_st(indx).sm_state,
"
"                        cr_st(indx).sm_country,
"
"                        'N',
"
"                        'DV',
"
"                        'DV',
"
"                        '+91',
"
"                        '+91',
"
"                        '+91',
"
"                        cr_st(indx).sm_whatsapp_no,
"
"                        cr_st(indx).sm_remarks,
"
"                        v_sub_terr_id,
"
"                        v_terr_id,
"
"                        v_sales_area_id
"
"                        );
"
"
"
"    SELECT NVL(MAX(TO_NUMBER(csdal_doc_no)),1000000000)+1
"
"      INTO v_act_doc_no
"
"      FROM crm_sp_dly_actvty_log
"
"     WHERE csdal_bu = p_bu;
"
"
"
"          INSERT INTO crm_sp_dly_actvty_log(csdal_bu,
"
"                        csdal_doc_no,
"
"                        csdal_doc_date,
"
"                        csdal_ac_type,
"
"                        csdal_ac_id,
"
"                        csdal_pa_type,
"
"                        csdal_pa_date,
"
"                        csdal_pa_desc,
"
"                        csdal_ca_type,
"
"                        csdal_ca_date,
"
"                        csdal_ca_desc,
"
"                        csdal_time_from,
"
"                        csdal_time_to,
"
"                        csdal_na_type,
"
"                        csdal_na_date,
"
"                        csdal_na_desc,
"
"                        csdal_status,
"
"                        csdal_km_travel,
"
"                        csdal_sp_id,
"
"                        csdal_from_place,
"
"                        csdal_to_place,
"
"                        csdal_cur_stage_id,
"
"                        csdal_nxt_stage_id,
"
"                        csdal_pa_sp_id,
"
"                        csdal_ca_sp_id,
"
"                        csdal_na_sp_id,
"
"                        csdal_ac_name,
"
"                        csdal_ca_pers_intrct,
"
"                        csdal_sp_lat,
"
"                        csdal_sp_long,
"
"                        csdal_opr_no,
"
"                        csdal_quo_no,
"
"                        csdal_per_designation,
"
"                        csdal_cur_machine_used,
"
"                        csdal_product_interst,
"
"                        csdal_job_perform,
"
"                        csdal_plnt,
"
"                        csdal_flowup_close_flag,
"
"                        csdal_close_reason,
"
"                        csdal_latitude,
"
"                        csdal_longitude,
"
"                        csdal_geo_location,
"
"                        csdal_na_comp_date,
"
"                        csdal_daily_activity_doc_no,
"
"                        csdal_cre_by,
"
"                        csdal_cre_ip_addr,
"
"                        csdal_cre_os_user,
"
"                        csdal_cre_date
"
"                        )
"
"                          VALUES(p_bu,
"
"                         v_act_doc_no,
"
"                         SYSDATE,
"
"                         'L',
"
"                         v_lead_no,
"
"                         cr_st(indx).sm_act_type,
"
"                         SYSDATE,
"
"                         NULL,
"
"                         cr_st(indx).sm_act_type,
"
"                         SYSDATE,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         cr_st(indx).sm_act_type,
"
"                         cr_st(indx).sm_na_date,
"
"                         cr_st(indx).sm_remarks,
"
"                         'P',
"
"                         0,
"
"                         v_sp_id,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         v_sp_id,
"
"                         v_sp_id,
"
"                         v_sp_id,
"
"                         var_comp_name,
"
"                         cr_st(indx).sm_cont_fir_name,
"
"                         0,
"
"                         0,
"
"                         NULL,
"
"                         NULL,
"
"                         cr_st(indx).sm_title,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         'N',
"
"                         NULL,
"
"                         0,
"
"                         0,
"
"                         NULL,
"
"                         NULL,
"
"                         NULL,
"
"                         p_user,
"
"                         Audit_Info.Get_IP_Address,
"
"                         Audit_Info.Get_OS_User,
"
"                         SYSDATE
"
"                         );
"
"      UPDATE mktg_leads
"
"         SET ml_la_type = cr_st(indx).sm_act_type,
"
"             ml_la_brief = 'FROM MIGRAION',
"
"             ml_la_date = SYSDATE,
"
"             ml_la_by = v_sp_id,
"
"             ml_na_type = cr_st(indx).sm_act_type,
"
"             ml_na_date = cr_st(indx).sm_na_date,
"
"             ml_na_by = v_sp_id,
"
"             ml_na_brief = cr_st(indx).sm_remarks
"
"       WHERE ml_bu = p_bu
"
"         AND ml_lead_no = v_lead_no;
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_leads_mig;
"
"
"
"/*PROCEDURE proc_ins_leads_mach_mig(p_bu        business_units.bu_id%TYPE,
"
"                       p_lead_no    mktg_leads.ml_lead_no%TYPE,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep        VARCHAR2,
"
"                       p_user    mktg_leads.ml_cre_by%TYPE
"
"                       )
"
"AS
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_lead_no        VARCHAR2(30);
"
"var_comp_name        VARCHAR2(50);
"
"var_addr1        VARCHAR2(50);
"
"
"
"v_mach_id        VARCHAR2(10);
"
"v_veh_id        VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (SM_VEH_NAME VARCHAR2(500),SM_VEH_EX_MODEL VARCHAR2(50),SM_VEH_MFG_YEAR NUMBER(10),SM_MACH_NAME VARCHAR2(500),SM_EX_ROCK_BK_NAME VARCHAR2(50),SM_MACH_MFG_YEAR NUMBER(10),SM_SURVEY_TYPE VARCHAR(2),SM_OPERATOR_NAME VARCHAR2(500),SM_OPER_MOBL_NO NUMBER(10),SM_SUPERVISOR_NAME VARCHAR2(500),
"
"    SM_SUPR_MOBL_NO NUMBER(10)
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_VEH_NAME VARCHAR2(500),SM_VEH_EX_MODEL VARCHAR2(50),SM_VEH_MFG_YEAR NUMBER(10),SM_MACH_NAME VARCHAR2(500),SM_EX_ROCK_BK_NAME VARCHAR2(50),SM_MACH_MFG_YEAR NUMBER(10),SM_SURVEY_TYPE VARCHAR(2),SM_OPERATOR_NAME VARCHAR2(500),SM_OPER_MOBL_NO NUMBER(10),SM_SUPERVISOR_NAME VARCHAR2(500),
"
"    SM_SUPR_MOBL_NO NUMBER(10))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_VEH_NAME CHAR(255),SM_VEH_EX_MODEL CHAR(255),SM_VEH_MFG_YEAR CHAR(255),SM_MACH_NAME CHAR(255),SM_EX_ROCK_BK_NAME CHAR(255),SM_MACH_MFG_YEAR CHAR(255),SM_SURVEY_TYPE CHAR(255),SM_OPERATOR_NAME CHAR(255),SM_OPER_MOBL_NO CHAR(255),SM_SUPERVISOR_NAME CHAR(255),
"
"    SM_SUPR_MOBL_NO CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"COMMIT;
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM');
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
"    IF (cr_st(indx).sm_veh_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT mevd_ex_veh_id
"
"          INTO v_veh_id
"
"          FROM mkg_ex_veh_details
"
"         WHERE mevd_bu = p_bu
"
"           AND mevd_ex_veh_name = TRIM((cr_st(indx).sm_veh_name));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20100,'FLM'||'/'||TRIM((cr_st(indx).sm_veh_name)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_mach_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT merbd_ex_rk_brk_id
"
"          INTO v_mach_id
"
"          FROM mkg_ex_rk_brk_details
"
"         WHERE merbd_bu = p_bu
"
"           AND merbd_ex_rk_brk_name = TRIM((cr_st(indx).sm_mach_name));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20654,'PRJ'||'/'||TRIM((cr_st(indx).sm_mach_name)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"  INSERT INTO mktg_ex_mach_det(mld_bu,mld_lead_no,mld_ex_veh_det,mld_ex_model_name,mld_ex_rock_brk_det,mld_ex_rock_brk_model,
"
"                                           mld_ex_veh_year,mld_ex_rock_brk_year,mld_survey_type,mld_mach_opr_name,
"
"                                           mld_opr_mobl_no,mld_mach_supr_name,mld_supr_mobl_no,mld_ex_veh_id,mld_ex_rock_brk_id,
"
"                                         mld_cre_by,mld_cre_date
"
"                 )
"
"                 VALUES(p_bu,
"
"                        p_lead_no,
"
"                        cr_st(indx).sm_veh_name,
"
"                        cr_st(indx).sm_veh_ex_model,
"
"                        cr_st(indx).sm_mach_name,
"
"                        cr_st(indx).sm_ex_rock_bk_name,
"
"                        cr_st(indx).sm_veh_mfg_year,
"
"                        cr_st(indx).sm_mach_mfg_year,
"
"                        cr_st(indx).sm_survey_type,
"
"                        cr_st(indx).sm_operator_name,
"
"                        cr_st(indx).sm_oper_mobl_no,
"
"                        cr_st(indx).sm_supervisor_name,
"
"                        cr_st(indx).sm_supr_mobl_no,
"
"                        v_veh_id,
"
"                        v_mach_id,
"
"                        p_user,
"
"                        SYSDATE
"
"                        );
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_leads_mach_mig;*/
"
"
"
"PROCEDURE proc_ins_prosp_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_doc_no        prospects_migr_hd.pmhd_doc_no%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        prospects_migr_hd.pmhd_cre_by%TYPE
"
"                 )
"
"AS
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"var_addr1        VARCHAR2(50);
"
"var_addr2        VARCHAR2(50);
"
"var_addr3        VARCHAR2(50);
"
"v_city_id        VARCHAR2(5);
"
"v_state_id        VARCHAR2(5);
"
"v_cntry_id        VARCHAR2(5);
"
"v_sp_id            VARCHAR2(5);
"
"v_campgn_id        VARCHAR2(10);
"
"v_source_id        VARCHAR2(10);
"
"v_sub_trr        VARCHAR2(10);
"
"v_trr_id        VARCHAR2(10);
"
"v_sa_id            VARCHAR2(5);
"
"v_sub_grp        VARCHAR2(10);
"
"v_grp_id        VARCHAR2(10);
"
"v_seq_no        NUMBER(5);
"
"
"
"
"
"
"
"
"
"
"
"TYPE typ_ins IS RECORD ( SM_PROS_NAME         VARCHAR2(50),
"
"             SM_CITY         VARCHAR(30),
"
"             SM_STATE         VARCHAR(30),
"
"             SM_COUNTRY         VARCHAR(30),
"
"             SM_ADDR1         VARCHAR2(50),
"
"             SM_ADDR2         VARCHAR2(50),
"
"             SM_ADDR3         VARCHAR2(50),
"
"             SM_ZIP_CODE          VARCHAR2(15),
"
"             SM_MOBILE_NO         VARCHAR2(30),
"
"             SM_TELE          VARCHAR2(30),
"
"             SM_FAX         VARCHAR2(30),
"
"             SM_EMAIL         VARCHAR2(50),
"
"             SM_WEBSITE         VARCHAR2(50),
"
"             SM_SUB_TERR         VARCHAR2(30),
"
"             SM_TERR         VARCHAR2(30),
"
"             SM_SAL_AREA         VARCHAR2(30),
"
"             SM_SAL_PER         VARCHAR2(50),
"
"             SM_SUB_GRP         VARCHAR2(30),
"
"             SM_GRP         VARCHAR2(30),
"
"             SM_SOURCE         VARCHAR2(50),
"
"             SM_COMPAIGN         VARCHAR2(50),
"
"             SM_CURRENCY         VARCHAR2(10),
"
"             SM_BRIEF        VARCHAR2(1000)
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PROS_NAME         VARCHAR2(50),
"
"                                         SM_CITY         VARCHAR(30),
"
"                                         SM_STATE         VARCHAR(30),
"
"                                         SM_COUNTRY         VARCHAR(30),
"
"                                         SM_ADDR1         VARCHAR2(50),
"
"                                         SM_ADDR2         VARCHAR2(50),
"
"                                         SM_ADDR3         VARCHAR2(50),
"
"                                         SM_ZIP_CODE          VARCHAR2(15),
"
"                                         SM_MOBILE_NO         VARCHAR2(30),
"
"                                         SM_TELE          VARCHAR2(30),
"
"                                         SM_FAX         VARCHAR2(30),
"
"                                         SM_EMAIL         VARCHAR2(50),
"
"                                         SM_WEBSITE         VARCHAR2(50),
"
"                                         SM_SUB_TERR         VARCHAR2(30),
"
"                                         SM_TERR         VARCHAR2(30),
"
"                                         SM_SAL_AREA         VARCHAR2(30),
"
"                                         SM_SAL_PER         VARCHAR2(50),
"
"                                         SM_SUB_GRP         VARCHAR2(30),
"
"                                         SM_GRP         VARCHAR2(30),
"
"                                         SM_SOURCE         VARCHAR2(50),
"
"                                         SM_COMPAIGN         VARCHAR2(50),
"
"                                         SM_CURRENCY         VARCHAR2(10),
"
"                                         SM_BRIEF         VARCHAR2(1000)
"
"                                         )
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"                    (SM_PROS_NAME         CHAR(255),
"
"                     SM_CITY         CHAR(255),
"
"                     SM_STATE         CHAR(255),
"
"                     SM_COUNTRY        CHAR(255),
"
"                     SM_ADDR1         CHAR(255),
"
"                     SM_ADDR2         CHAR(255),
"
"                     SM_ADDR3         CHAR(255),
"
"                     SM_ZIP_CODE          CHAR(255),
"
"                     SM_MOBILE_NO         CHAR(255),
"
"                     SM_TELE          CHAR(255),
"
"                     SM_FAX         CHAR(255),
"
"                     SM_EMAIL         CHAR(255),
"
"                     SM_WEBSITE         CHAR(255),
"
"                     SM_SUB_TERR         CHAR(255),
"
"                     SM_TERR         CHAR(255),
"
"                     SM_SAL_AREA         CHAR(255),
"
"                     SM_SAL_PER         CHAR(255),
"
"                     SM_SUB_GRP         CHAR(255),
"
"                     SM_GRP         CHAR(255),
"
"                     SM_SOURCE         CHAR(255),
"
"                     SM_COMPAIGN         CHAR(255),
"
"                     SM_CURRENCY         CHAR(255),
"
"                     SM_BRIEF         CHAR(255))
"
"                    )
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
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
"    IF (cr_st(indx).sm_city) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT city_id
"
"          INTO v_city_id
"
"          FROM cities
"
"         WHERE city_name1 = TRIM((cr_st(indx).sm_city));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20005,'ADM'||'/'||(cr_st(indx).sm_city));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_state) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT state_id
"
"          INTO v_state_id
"
"          FROM states
"
"         WHERE state_name1 = TRIM(UPPER(cr_st(indx).sm_state));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20044,'ADM'||'/'||UPPER(cr_st(indx).sm_state));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_country) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT cntry_id
"
"          INTO v_cntry_id
"
"          FROM countries
"
"         WHERE cntry_name1 = TRIM(UPPER(cr_st(indx).sm_country));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20007,'ADM'||'/'||(cr_st(indx).sm_country));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_sal_per) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sp_person
"
"          INTO v_sp_id
"
"      FROM sales_persons
"
"         WHERE sp_bu = p_bu
"
"           AND sp_person_name1 = TRIM(UPPER(cr_st(indx).sm_sal_per));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20421,'CRM'||'/'||TRIM(UPPER(cr_st(indx).sm_sal_per)));
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF (cr_st(indx).sm_compaign) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT crmc_campaign_id
"
"          INTO v_campgn_id
"
"      FROM crm_campaigns
"
"     WHERE crmc_bu  = p_bu
"
"       AND crmc_desc1 = UPPER(cr_st(indx).sm_compaign);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_campgn_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_source) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT ls_source_id
"
"          INTO v_source_id
"
"      FROM lead_sources
"
"     WHERE ls_bu  = p_bu
"
"       AND ls_desc1 = UPPER(cr_st(indx).sm_source);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_source_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_sub_terr) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sst_sub_terr_id
"
"          INTO v_sub_trr
"
"      FROM sales_sub_terr
"
"     WHERE sst_bu = p_bu
"
"       AND sst_desc1 = UPPER(cr_st(indx).sm_sub_terr);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_sub_trr := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_terr) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sst_terr_id
"
"          INTO v_trr_id
"
"          FROM sales_sub_terr
"
"         WHERE sst_bu  = p_bu
"
"           AND sst_desc1 = UPPER(cr_st(indx).sm_terr);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_trr_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_sal_area) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sa_area
"
"          INTO v_sa_id
"
"          FROM sales_areas
"
"         WHERE sa_bu  = p_bu
"
"           AND sa_area_desc1 = UPPER(cr_st(indx).sm_sal_area);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_sa_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    /*IF UPPER(cr_st(indx).sm_sub_grp) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT csg_subgrp_id
"
"          INTO v_sub_grp
"
"          FROM customer_sub_groups
"
"         WHERE csg_bu  = p_bu
"
"           AND csg_desc1 = UPPER(cr_st(indx).sm_sub_grp);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_sub_grp := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_grp) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT custgrp_group_id
"
"          INTO v_grp_id
"
"          FROM customer_groups
"
"         WHERE custgrp_bu  = p_bu
"
"           AND custgrp_desc1 = UPPER(cr_st(indx).sm_grp);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_grp_id := NULL;
"
"      END;
"
"
"
"    END IF; */
"
"
"
"
"
"  IF LENGTH(cr_st(indx).sm_addr1) >= 50 THEN
"
"    var_addr1 := SUBSTR(cr_st(indx).sm_addr1,1,50);
"
"  ELSE
"
"    var_addr1 := cr_st(indx).sm_addr1;
"
"  END IF;
"
"
"
" IF LENGTH(cr_st(indx).sm_addr2) >= 50 THEN
"
"   var_addr2 := SUBSTR(cr_st(indx).sm_addr2,1,50);
"
" ELSE
"
"   var_addr2 := cr_st(indx).sm_addr2;
"
" END IF;
"
"
"
" IF LENGTH(cr_st(indx).sm_addr3) >= 50 THEN
"
"    var_addr3 := SUBSTR(cr_st(indx).sm_addr3,1,50);
"
" ELSE
"
"    var_addr3 := cr_st(indx).sm_addr3;
"
" END IF;
"
"
"
"       SELECT NVL(MAX(pmln_seq_no),0) + 1
"
"     INTO v_seq_no
"
"     FROM prospects_migr_ln
"
"    WHERE pmln_bu = p_bu
"
"      AND pmln_doc_no = p_doc_no;
"
"
"
"            INSERT INTO prospects_migr_ln(pmln_bu,
"
"                      pmln_doc_no,
"
"                      pmln_seq_no ,
"
"                      pmln_pros_id,
"
"                      pmln_pros_name ,
"
"                      pmln_city_id,
"
"                      pmln_state_id ,
"
"                      pmln_cntry_id,
"
"                      pmln_addr1,
"
"                      pmln_addr2,
"
"                      pmln_addr3,
"
"                      pmln_zip_code ,
"
"                      pmln_mobile_no,
"
"                      pmln_tele,
"
"                      pmln_fax,
"
"                      pmln_email,
"
"                      pmln_website ,
"
"                      pmln_sub_terr_id,
"
"                      pmln_terr_id ,
"
"                      pmln_sales_area ,
"
"                      pmln_sales_person,
"
"                      --pmln_sub_grp_id ,
"
"                      --pmln_grp_id ,
"
"                      pmln_source_id ,
"
"                      pmln_camp_id,
"
"                      pmln_curry,
"
"                      pmln_brief,
"
"                      pmln_cre_by,
"
"                      pmln_cre_date
"
"                      )
"
"                                   VALUES(p_bu,
"
"                                          p_doc_no,
"
"                                          v_seq_no,
"
"                                          func_find_crm_pros_next_id(p_bu,p_user),
"
"                      cr_st(indx).sm_pros_name,
"
"                      v_city_id,
"
"                      v_state_id,
"
"                      v_cntry_id ,
"
"                      var_addr1,
"
"                      var_addr2 ,
"
"                      var_addr3 ,
"
"                      cr_st(indx).sm_zip_code ,
"
"                      cr_st(indx).sm_mobile_no,
"
"                      cr_st(indx).sm_tele,
"
"                      cr_st(indx).sm_fax ,
"
"                      cr_st(indx).sm_email,
"
"                      cr_st(indx).sm_website,
"
"                      v_sub_trr ,
"
"                      v_trr_id ,
"
"                      v_sa_id ,
"
"                      v_sp_id,
"
"                      --v_sub_grp,
"
"                      --v_grp_id ,
"
"                      v_source_id,
"
"                      v_campgn_id ,
"
"                      cr_st(indx).sm_currency,
"
"                      cr_st(indx).sm_brief,
"
"                      p_user,
"
"                      SYSDATE
"
"                      );
"
"
"
"   END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"END proc_ins_prosp_mig;
"
"
"
"PROCEDURE proc_ins_instr_mig(p_bu        business_units.bu_id%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        qc_instruments.qi_cre_by%TYPE
"
"                 )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_lead_no    VARCHAR2(30);
"
"v_plnt        VARCHAR2(10);
"
"v_sub_grp    VARCHAR2(10);
"
"v_grp        VARCHAR2(10);
"
"v_make        VARCHAR2(10);
"
"v_model        VARCHAR2(10);
"
"v_loc_name    VARCHAR2(10);
"
"v_calib_met    VARCHAR2(10);
"
"
"
"TYPE typ_ins IS RECORD (sm_plnt VARCHAR2(100),
"
"            sm_inst_id VARCHAR2(10),
"
"            sm_inst_name VARCHAR2(50),
"
"            sm_sub_grp VARCHAR2(100),
"
"            sm_grp VARCHAR2(100),
"
"            sm_make VARCHAR2(100),
"
"            sm_model VARCHAR2(100),
"
"            sm_loc_type VARCHAR2(1),
"
"            sm_location VARCHAR2(100),
"
"            sm_calib_met VARCHAR2(100),
"
"            sm_serial_no VARCHAR2(20),
"
"            sm_calib_agen VARCHAR2(100),
"
"            sm_owner VARCHAR(10),
"
"            sm_uom VARCHAR(10),
"
"            sm_range_min VARCHAR2(50),
"
"            sm_range_max  VARCHAR2(50),
"
"            sm_range  VARCHAR2(50),
"
"            sm_lst_cnt VARCHAR2(50),
"
"            sm_acpt_criteria VARCHAR2(50),
"
"            sm_freq_basis VARCHAR2(2),
"
"            sm_period    VARCHAR2(20),
"
"            sm_var_basis    VARCHAR2(50),
"
"            sm_last_cab     DATE,
"
"            sm_next_cab     DATE,
"
"            sm_ad_not_day      VARCHAR2(15)
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PLNT VARCHAR2(100),SM_INST_ID VARCHAR2(10),SM_INST_NAME VARCHAR2(50),SM_SUB_GRP VARCHAR2(100),SM_GRP VARCHAR2(100),SM_MAKE VARCHAR2(100),SM_MODEL VARCHAR2(100),SM_LOC_TYPE VARCHAR2(1),SM_LOCATION VARCHAR2(100),
"
"    SM_CALIB_MET VARCHAR2(100),SM_SERIAL_NO VARCHAR2(20),SM_CALIB_AGEN VARCHAR2(100),SM_OWNER VARCHAR(10),SM_UOM VARCHAR(10),SM_RANGE_MIN VARCHAR2(50),SM_RANGE_MAX  VARCHAR2(50),SM_RANGE  VARCHAR2(50),SM_LST_CNT VARCHAR2(50),
"
"    SM_ACPT_CRITERIA VARCHAR2(50),SM_FREQ_BASIS VARCHAR2(2),SM_PERIOD VARCHAR2(20),sm_var_basis  VARCHAR2(15),sm_last_cab  DATE,SM_NEXT_CAB DATE,sm_ad_not_day  VARCHAR2(50))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_PLNT CHAR(255),SM_INST_ID CHAR(255),SM_INST_NAME CHAR(255),SM_SUB_GRP CHAR(255),SM_GRP CHAR(255),SM_MAKE CHAR(255),SM_MODEL CHAR(255),SM_LOC_TYPE CHAR(255),SM_LOCATION CHAR(255),
"
"    SM_CALIB_MET CHAR(255),SM_SERIAL_NO CHAR(255),SM_CALIB_AGEN CHAR(255),SM_OWNER CHAR(255),SM_UOM CHAR(255),SM_RANGE_MIN CHAR(255),SM_RANGE_MAX  CHAR(255),SM_RANGE  CHAR(255),SM_LST_CNT CHAR(255),
"
"    SM_ACPT_CRITERIA CHAR(255),SM_FREQ_BASIS CHAR(255),SM_PERIOD CHAR(255),sm_var_basis CHAR(255),sm_last_cab  CHAR(255),SM_NEXT_CAB CHAR(255),sm_ad_not_day  CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"EXECUTE IMMEDIATE v_sql;
"
"
"
"  BEGIN
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
"--raise_application_error(-20999,'HRM' );
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    IF UPPER(cr_st(indx).sm_plnt) IS NOT NULL THEN
"
"      BEGIN
"
"
"
"      SELECT bup_plant_id
"
"        INTO v_plnt
"
"        FROM bus_unit_plants
"
"       WHERE bup_bu = p_bu
"
"         AND (bup_name1 = UPPER(cr_st(indx).sm_plnt) OR bup_plant_id = UPPER(cr_st(indx).sm_plnt));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20483,'ADM');
"
"      END;
"
"    END IF;
"
"    IF UPPER(cr_st(indx).sm_sub_grp) IS NOT NULL THEN
"
"      BEGIN
"
"
"
"      SELECT qisg_subgrp_id
"
"        INTO v_sub_grp
"
"        FROM qc_instr_sub_group
"
"       WHERE qisg_bu = p_bu
"
"         AND qisg_subgrp_desc = TRIM(UPPER(cr_st(indx).sm_sub_grp));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20466,'PLN');
"
"      END;
"
"    END IF;
"
"    IF UPPER(cr_st(indx).sm_grp) IS NOT NULL THEN
"
"      BEGIN
"
"
"
"      SELECT qig_group_id
"
"        INTO v_grp
"
"        FROM qc_instr_groups
"
"       WHERE qig_bu = p_bu
"
"         AND qig_group_desc1 = TRIM(UPPER(cr_st(indx).sm_grp));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20400,'ICM');
"
"      END;
"
"    END IF;
"
"    IF UPPER(cr_st(indx).sm_make) IS NOT NULL THEN
"
"      BEGIN
"
"
"
"      SELECT pm_mak_id
"
"        INTO v_make
"
"        FROM product_make
"
"       WHERE pm_bu = p_bu
"
"         AND pm_mak_desc1 = TRIM(UPPER(cr_st(indx).sm_make));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20415,'ICM'||'~'||TRIM(UPPER(cr_st(indx).sm_make))||'~');
"
"      END;
"
"    END IF;
"
"    IF UPPER(cr_st(indx).sm_model) IS NOT NULL THEN
"
"      BEGIN
"
"
"
"      SELECT pmds_model_id
"
"        INTO v_model
"
"        FROM product_models
"
"       WHERE pmds_bu = p_bu
"
"         AND pmds_model_desc = TRIM(UPPER(cr_st(indx).sm_model));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20101,'ICM');
"
"      END;
"
"    END IF;
"
"    IF UPPER(cr_st(indx).sm_location) IS NOT NULL AND UPPER(cr_st(indx).sm_loc_type) = 'O' THEN
"
"      BEGIN
"
"
"
"      SELECT suplr_suplr_id
"
"        INTO v_loc_name
"
"        FROM suppliers
"
"       WHERE suplr_bu = p_bu
"
"         AND suplr_name1 = TRIM(UPPER(cr_st(indx).sm_location));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20118,'APM');
"
"      END;
"
"    END IF;
"
"    IF UPPER(cr_st(indx).sm_location) IS NOT NULL AND UPPER(cr_st(indx).sm_loc_type) = 'I' THEN
"
"      BEGIN
"
"
"
"      SELECT qil_loc_id
"
"        INTO v_loc_name
"
"        FROM qc_inst_loc
"
"       WHERE qil_bu = p_bu
"
"         AND qil_plnt = v_plnt
"
"         AND qil_loc_name = TRIM(UPPER(cr_st(indx).sm_location));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20629,'MNT');
"
"      END;
"
"    END IF;
"
"    IF UPPER(cr_st(indx).sm_calib_met) IS NOT NULL  THEN
"
"      BEGIN
"
"
"
"      SELECT qcm_mthd_id
"
"        INTO v_calib_met
"
"        FROM qc_cali_mthd
"
"       WHERE qcm_bu = p_bu
"
"         AND qcm_mthd_name = TRIM(UPPER(cr_st(indx).sm_calib_met));
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        Raise_Application_Error(-20629,'MNT');
"
"      END;
"
"    END IF;
"
"--raise_application_error(-20999,'HRM' );
"
"    INSERT INTO qc_instruments(qi_bu,
"
"                   qi_plnt,
"
"                   qi_inst_id,
"
"                   qi_inst_serial_no,
"
"                   qi_inst_desc1,
"
"                   qi_inst_sub_group_id,
"
"                   qi_inst_group_id,
"
"                   qi_inst_make_id,
"
"                   qi_inst_model_id,
"
"                   qi_least_cnt,
"
"                   qi_least_cnt_uom,
"
"                   qc_loc_type,
"
"                   qi_loc_id,
"
"                   qi_range,
"
"                   qi_range_min,
"
"                   qi_range_max,
"
"                   qi_acpt_crit,
"
"                   qi_mthd_id,
"
"                               qi_freq_basis,
"
"                               qi_calib_flag,
"
"                               qi_fixed_date_basis,
"
"                               qi_var_per_basis,
"
"                               qi_var_period,
"
"                               qi_last_calib_date,
"
"                               qi_next_calib_date,
"
"                               qi_note_day_in_adv,
"
"                               qi_status,
"
"                               qi_rnr_flag,
"
"                               qi_rnr_freq,
"
"                               qi_lnr_flag,
"
"                               qi_lnr_freq,
"
"                               qi_bias_flag,
"
"                               qi_bias_freq,
"
"                               qi_stab_freq,
"
"                               qi_rnr_var_mthd,
"
"                               qi_rnr_attr_mthd,
"
"                               qi_calib_status,
"
"                               qi_lnr_status,
"
"                               qi_bias_status,
"
"                               qi_stab_status,
"
"                               qi_rnr_var_status,
"
"                               qi_rnr_attr_status,
"
"                               qi_rnr_attr_freq,
"
"                               qi_insp_freq,
"
"                   qi_func_date,
"
"                   qi_inst_loc,
"
"                   qi_cre_by,
"
"                   qi_cre_date
"
"                  )
"
"                       VALUES (p_bu,
"
"                               v_plnt,
"
"                               cr_st(indx).sm_inst_id,
"
"                               cr_st(indx).sm_serial_no,
"
"                               cr_st(indx).sm_inst_name,
"
"                               v_sub_grp,
"
"                               v_grp,
"
"                               v_make,
"
"                               v_model,
"
"                               cr_st(indx).sm_lst_cnt,
"
"                               cr_st(indx).sm_uom,
"
"                               cr_st(indx).sm_loc_type,
"
"                               v_loc_name,
"
"                               cr_st(indx).sm_range,
"
"                               cr_st(indx).sm_range_min,
"
"                               cr_st(indx).sm_range_max,
"
"                               cr_st(indx).sm_acpt_criteria,
"
"                               v_calib_met,
"
"                               NVL(cr_st(indx).sm_freq_basis,'F'),
"
"                               'N',
"
"                   'A',
"
"                   cr_st(indx).sm_var_basis,--'D',
"
"                   cr_st(indx).sm_period,
"
"                   cr_st(indx).sm_last_cab,
"
"                   cr_st(indx).sm_next_cab,
"
"                   cr_st(indx).sm_ad_not_day,
"
"                   'N',
"
"                   'N',
"
"                   'D',
"
"                   'N',
"
"                   'D',
"
"                   'N',
"
"                   'D',
"
"                   'D',
"
"                   'NA',
"
"                   'NA',
"
"                   'N',
"
"                   'N',
"
"                   'N',
"
"                   'N',
"
"                   'N',
"
"                   'N',
"
"                   'D',
"
"                               'D',
"
"                               TRUNC(SYSDATE),
"
"                   'I',
"
"                               p_user,
"
"                               SYSDATE
"
"                  );
"
"        -- raise_application_error(-20999,'HRM');
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_instr_mig;
"
"
"
"PROCEDURE proc_ins_ls_frm_grn(p_bu               business_units.bu_id%TYPE,
"
"                  p_plnt        pur_ord_receipt_hd.porh_plnt%TYPE,
"
"                  p_rcpt_pfx    pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                  p_rcpt_no        pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"                  p_file_name        VARCHAR2,
"
"                  p_sep        VARCHAR2,
"
"                  p_user             pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                 )
"
"AS
"
"
"
"  v_sql        VARCHAR2(4000);
"
"  v_fpath    VARCHAR2(200);
"
"  v_seq_no    NUMBER(5);
"
"
"
"  TYPE typ_rcpt_ls IS RECORD(rls_prod_id    VARCHAR2(100),
"
"                             rls_prod_rev    NUMBER(5),
"
"                             rls_lot_no        VARCHAR(50),
"
"                 rls_heat_no    VARCHAR2(50),
"
"                 rls_test_no    VARCHAR2(50),
"
"                             rls_ser_no        VARCHAR(50),
"
"                             rls_qty        NUMBER(12,3),
"
"                             rls_mfg_date    DATE,
"
"                 rls_expiry_date    DATE,
"
"                 rls_no_of_rolls    NUMBER(5)
"
"                            );
"
"
"
"TYPE typ_ls_dtls IS TABLE OF typ_rcpt_ls INDEX BY PLS_INTEGER;
"
"
"
"r_ls    typ_ls_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_ls    typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(rls_prod_id    VARCHAR2(100),
"
"                                       rls_prod_rev    NUMBER(5),
"
"                                       rls_lot_no    VARCHAR2(50),
"
"                       rls_heat_no    VARCHAR2(50),
"
"                       rls_test_no    VARCHAR2(50),
"
"                                       rls_ser_no    VARCHAR2(50),
"
"                                       rls_qty        NUMBER(12,3),
"
"                                       rls_mfg_date    DATE,
"
"                       rls_expiry_date    DATE,
"
"                       rls_no_of_rolls    NUMBER(5)
"
"                                      )
"
"                 ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                       SKIP 1
"
"                                       FIELDS TERMINATED BY '''||p_sep||'''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                       REJECT ROWS WITH ALL NULL FIELDS
"
"                                       (rls_prod_id    CHAR(255),
"
"                                        rls_prod_rev    CHAR(255),
"
"                                        rls_lot_no    CHAR(255),
"
"                    rls_heat_no    CHAR(255),
"
"                    rls_test_no    CHAR(255),
"
"                                        rls_ser_no    CHAR(255),
"
"                    rls_qty        CHAR(255),
"
"                                        rls_mfg_date    CHAR(255),
"
"                    rls_expiry_date    CHAR(255),
"
"                    rls_no_of_rolls    CHAR(255)
"
"                                       ))
"
"                                       LOCATION ('''||p_file_name||''')
"
"                                      )REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  OPEN c_ls FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_ls INTO r_ls(indx);
"
"    indx := indx + 1;
"
"    EXIT WHEN c_ls%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_ls;
"
"
"
"  DELETE FROM pur_receipt_lot
"
"   WHERE prlt_bu = p_bu
"
"     AND prlt_receipt_no = p_rcpt_no;
"
"
"
"  v_seq_no := 0;
"
"
"
"  FOR indx IN 1..r_ls.COUNT
"
"  LOOP
"
"    v_seq_no := v_seq_no+1;
"
"
"
"    IF r_ls(indx).rls_prod_id IS NULL THEN
"
"      Raise_Application_Error(-20999,'Item ID not found.');
"
"    END IF;
"
"
"
"    IF r_ls(indx).rls_prod_rev IS NULL THEN
"
"      Raise_Application_Error(-20999,'Item Rev. not found.');
"
"    END IF;
"
"
"
"    IF r_ls(indx).rls_qty IS NULL THEN
"
"      Raise_Application_Error(-20999,'Qty. not found.');
"
"    END IF;
"
"
"
"    INSERT INTO pur_receipt_lot(prlt_bu,
"
"                                prlt_receipt_no,
"
"                                prlt_seq_no,
"
"                                prlt_prod_id,
"
"                                prlt_prod_rev,
"
"                                prlt_lot_no,
"
"                prlt_heat_no,
"
"                prlt_test_no,
"
"                prlt_start_ser_no,
"
"                                prlt_lot_qty,
"
"                prlt_type,
"
"                prlt_mfg_date,
"
"                prlt_expiry_date,
"
"                                prlt_cre_by,
"
"                                prlt_cre_date,
"
"                prlt_no_of_bale
"
"                   )
"
"             VALUES(p_bu,
"
"                p_rcpt_no,
"
"                v_seq_no,
"
"                r_ls(indx).rls_prod_id,
"
"                r_ls(indx).rls_prod_rev,
"
"                r_ls(indx).rls_lot_no,
"
"                r_ls(indx).rls_heat_no,
"
"                r_ls(indx).rls_test_no,
"
"                r_ls(indx).rls_ser_no,
"
"                r_ls(indx).rls_qty,
"
"                'R',
"
"                r_ls(indx).rls_mfg_date,
"
"                r_ls(indx).rls_expiry_date,
"
"                p_user,
"
"                SYSDATE,
"
"                NVL(r_ls(indx).rls_no_of_rolls,1)
"
"                   );
"
"
"
"  END LOOP;
"
"  Commit;
"
"END proc_ins_ls_frm_grn;
"
"
"
"PROCEDURE proc_ins_ls_frm_grn1(p_bu               business_units.bu_id%TYPE,
"
"                   p_rcpt_pfx    pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                   p_rcpt_no    pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"                   p_file_name        VARCHAR2,
"
"                   p_sep        VARCHAR2,
"
"                   p_user             pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                  )
"
"AS
"
"
"
"  v_sql        VARCHAR2(4000);
"
"  v_fpath    VARCHAR2(200);
"
"  v_seq_no    NUMBER(5);
"
"
"
"  TYPE typ_rcpt_ls IS RECORD(rls_prod_id    VARCHAR2(100),
"
"                             rls_prod_rev    NUMBER(5),
"
"                 rls_prod_desc    VARCHAR2(150),
"
"                             rls_lot_no        VARCHAR(50),
"
"                 rls_heat_no    VARCHAR2(50),
"
"                             rls_qty        NUMBER(12,3),
"
"                             rls_mfg_date    DATE,
"
"                 rls_expiry_date    DATE
"
"                            );
"
"
"
"TYPE typ_ls_dtls IS TABLE OF typ_rcpt_ls INDEX BY PLS_INTEGER;
"
"
"
"r_ls    typ_ls_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_ls    typ_ref_cur;
"
"
"
"i     NUMBER := 1;
"
"
"
"v_bal_qty    NUMBER(12,3);
"
"v_upd_qty    NUMBER(12,3);
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(rls_prod_id    VARCHAR2(100),
"
"                                       rls_prod_rev    NUMBER(5),
"
"                       rls_prod_desc    VARCHAR2(150),
"
"                                       rls_lot_no    VARCHAR2(50),
"
"                       rls_heat_no    VARCHAR2(50),
"
"                                       rls_qty        NUMBER(12,3),
"
"                                       rls_mfg_date    DATE,
"
"                       rls_expiry_date    DATE
"
"                                      )
"
"                 ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                       SKIP 1
"
"                                       FIELDS TERMINATED BY '''||p_sep||'''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                       REJECT ROWS WITH ALL NULL FIELDS
"
"                                       (rls_prod_id    CHAR(255),
"
"                                        rls_prod_rev    CHAR(255),
"
"                    rls_prod_desc    CHAR(255),
"
"                                        rls_lot_no    CHAR(255),
"
"                    rls_heat_no    CHAR(255),
"
"                    rls_qty        CHAR(255),
"
"                                        rls_mfg_date    CHAR(255),
"
"                    rls_expiry_date    CHAR(255)
"
"                                       ))
"
"                                       LOCATION ('''||p_file_name||''')
"
"                                      )REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  OPEN c_ls FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_ls INTO r_ls(i);
"
"    i := i + 1;
"
"    EXIT WHEN c_ls%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_ls;
"
"
"
"  DELETE FROM pur_rcpt_lot_serial
"
"   WHERE prcls_bu = p_bu
"
"     AND prcls_doc_no = p_rcpt_no;
"
"
"
"  FOR i IN 1..r_ls.COUNT
"
"  LOOP
"
"
"
"    v_bal_qty := r_ls(i).rls_qty;
"
"
"
"    FOR r_prl IN (SELECT porl_seq_no,porl_status,porl_receipt_qty Rcpt_Qty,
"
"                         (SELECT SUM(prcls_lot_qty)
"
"                FROM pur_rcpt_lot_serial
"
"               WHERE prcls_bu = p_bu
"
"                 AND prcls_doc_no = p_rcpt_no
"
"                 AND porl_seq_no = porl_seq_no) Lot_Qty
"
"                    FROM pur_ord_receipt_ln
"
"           WHERE porl_bu = p_bu
"
"             AND porl_receipt_no = p_rcpt_no
"
"             AND porl_prod_id = r_ls(i).rls_prod_id
"
"             AND porl_prod_rev = r_ls(i).rls_prod_rev)
"
"    LOOP
"
"
"
"      IF v_bal_qty > (r_prl.Rcpt_Qty - NVL(r_prl.Lot_Qty,0)) THEN
"
"        v_upd_qty := (r_prl.Rcpt_Qty - NVL(r_prl.Lot_Qty,0));
"
"    v_bal_qty := v_bal_qty - v_upd_qty;
"
"      ELSE
"
"        v_upd_qty := v_bal_qty;
"
"    v_bal_qty := 0;
"
"      END IF;
"
"
"
"      IF v_upd_qty > 0 THEN
"
"
"
"    SELECT NVL(MAX(prcls_seq_no),0) + 1 INTO v_seq_no
"
"      FROM pur_rcpt_lot_serial
"
"     WHERE prcls_bu = p_bu
"
"       AND prcls_doc_no = p_rcpt_no
"
"       AND prcls_doc_seq_no = r_prl.porl_seq_no;
"
"
"
"        INSERT INTO pur_rcpt_lot_serial(prcls_bu,
"
"                                        prcls_doc_no,
"
"                        prcls_doc_seq_no,
"
"                                        prcls_seq_no,
"
"                                        prcls_lot_no,
"
"                        prcls_heat_no,
"
"                                        prcls_lot_qty,
"
"                    prcls_qty_accepted,
"
"                    prcls_stk_rcpt_qty,
"
"                    prcls_stk_acpt_qty,
"
"                        prcls_apply_type,
"
"                        prcls_mfg_date,
"
"                        prcls_expiry_date,
"
"                                        prcls_cre_by,
"
"                                        prcls_cre_date
"
"                           )
"
"                     VALUES(p_bu,
"
"                        p_rcpt_no,
"
"                    r_prl.porl_seq_no,
"
"                        v_seq_no,
"
"                        r_ls(i).rls_lot_no,
"
"                        r_ls(i).rls_heat_no,
"
"                        r_ls(i).rls_qty,
"
"                    CASE WHEN r_prl.porl_status = 'Q' THEN r_ls(i).rls_qty ELSE 0 END,
"
"                        r_ls(i).rls_qty,
"
"                    CASE WHEN r_prl.porl_status = 'Q' THEN r_ls(i).rls_qty ELSE 0 END,
"
"                        'R',
"
"                        r_ls(i).rls_mfg_date,
"
"                        r_ls(i).rls_expiry_date,
"
"                        p_user,
"
"                        SYSDATE
"
"                           );
"
"
"
"      END IF;
"
"
"
"    END LOOP;
"
"
"
"  END LOOP;
"
"  Commit;
"
"END proc_ins_ls_frm_grn1;
"
"
"
"/*PROCEDURE proc_ins_bale_frm_grn(p_bu               business_units.bu_id%TYPE,
"
"                    p_plnt        pur_ord_receipt_hd.porh_plnt%TYPE,
"
"                    p_rcpt_pfx    pur_ord_receipt_hd.porh_receipt_pfx%TYPE,
"
"                    p_rcpt_no    pur_ord_receipt_hd.porh_receipt_no%TYPE,
"
"                p_rcpt_seq_no    pur_ord_receipt_ln.porl_seq_no%TYPE,
"
"                p_ls_seq_no    pur_rcpt_lot_serial.prcls_seq_no%TYPE,
"
"                    p_fname        VARCHAR2,
"
"                    p_user        pur_ord_receipt_hd.porh_cre_by%TYPE
"
"                   )
"
"AS
"
"
"
"  v_sql        VARCHAR2(4000);
"
"  v_fpath    VARCHAR2(200);
"
"  v_emp_id    VARCHAR2(10);
"
"  v_ip_addr    VARCHAR2(20);
"
"  v_os_user    VARCHAR2(50);
"
"
"
"  TYPE typ_bale_dtl IS RECORD(tbd_bale_no    NUMBER(15),
"
"                              tbd_bale_gr_wgt    NUMBER(9,3),
"
"                  tbd_bale_tr_wgt    NUMBER(9,3),
"
"                  tbd_bale_nt_wgt    NUMBER(9,3)
"
"                 );
"
"
"
"  TYPE typ_bale IS TABLE OF typ_bale_dtl INDEX BY PLS_INTEGER;
"
"  r_bale    typ_bale;
"
"
"
"  TYPE typ_ref_cur IS REF CURSOR;
"
"  c_bale    typ_ref_cur;
"
"
"
"  indx    NUMBER := 1;
"
"
"
"BEGIN
"
"
"
"  v_emp_id := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr := Audit_Info.Get_IP_Address;
"
"  v_os_user := Audit_Info.Get_OS_User;
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(tbd_bale_no    NUMBER(15),
"
"                                       tbd_bale_gr_wgt    NUMBER(9,3),
"
"                           tbd_bale_tr_wgt    NUMBER(9,3),
"
"                           tbd_bale_nt_wgt    NUMBER(9,3)
"
"                                      )
"
"                 ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                       SKIP 1
"
"                                       FIELDS TERMINATED BY '',''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                       REJECT ROWS WITH ALL NULL FIELDS
"
"                                       (tbd_bale_no    CHAR(255),
"
"                                        tbd_bale_gr_wgt    CHAR(255),
"
"                                        tbd_bale_tr_wgt    CHAR(255),
"
"                                        tbd_bale_nt_wgt    CHAR(255)
"
"                                       ))
"
"                                       LOCATION ('''||p_fname||''')
"
"                                      )REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"--Raise_Application_Error(-20999,'HRM ');
"
"  OPEN c_bale FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_bale INTO r_bale(indx);
"
"    indx := indx + 1;
"
"    EXIT WHEN c_bale%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_bale;
"
"
"
"  DELETE FROM spn_grn_bale_dtls
"
"   WHERE sgbd_bu = p_bu
"
"     AND sgbd_rcpt_pfx = p_rcpt_pfx
"
"     AND sgbd_rcpt_no = p_rcpt_no
"
"     AND sgbd_ln_seq_no = p_rcpt_seq_no
"
"     AND sgbd_lot_seq_no = p_ls_seq_no;
"
"
"
"  FOR indx IN 1..r_bale.COUNT
"
"  LOOP
"
"
"
"    INSERT INTO spn_grn_bale_dtls(sgbd_bu,
"
"                                  sgbd_rcpt_pfx,
"
"                                  sgbd_rcpt_no,
"
"                                  sgbd_ln_seq_no,
"
"                                  sgbd_lot_seq_no,
"
"                                  sgbd_bale_no,
"
"                                  sgbd_bale_gr_wgT,
"
"                  sgbd_bale_tr_wgt,
"
"                                  sgbd_bale_nt_wgt,
"
"                                  sgbd_cre_by,
"
"                  sgbd_cre_emp_id,
"
"                  sgbd_cre_ip_addr,
"
"                  sgbd_cre_os_user,
"
"                                  sgbd_cre_date
"
"                     )
"
"               VALUES(p_bu,
"
"                      p_rcpt_pfx,
"
"                  p_rcpt_no,
"
"                  p_rcpt_seq_no,
"
"                  p_ls_seq_no,
"
"                  r_bale(indx).tbd_bale_no,
"
"                  r_bale(indx).tbd_bale_gr_wgt,
"
"                  r_bale(indx).tbd_bale_tr_wgt,
"
"                  r_bale(indx).tbd_bale_nt_wgt,
"
"                  p_user,
"
"                  v_emp_id,
"
"                  v_ip_addr,
"
"                  v_os_user,
"
"                  SYSDATE
"
"                     );
"
"
"
"  END LOOP;
"
"  Commit;
"
"END proc_ins_bale_frm_grn;*/
"
"
"
"/*PROCEDURE proc_ins_migr_item (p_bu               business_units.bu_id%TYPE,
"
"                                p_doc_no           prod_migr_hd.pmh_doc_no%TYPE,
"
"                              p_fname           VARCHAR2,
"
"                              p_user            prod_migr_hd.pmh_cre_by%TYPE
"
"                               )
"
"  AS
"
"
"
"    v_sql                       CLOB;
"
"    v_fpath                     VARCHAR2(200);
"
"    v_emp_id                   VARCHAR2(10);
"
"    v_ip_addr                     VARCHAR2(20);
"
"    v_os_user                  VARCHAR2(50);
"
"    v_sub_class_id             VARCHAR2(10);
"
"    v_class_id                  VARCHAR2(10);
"
"    v_seq_no                   NUMBER;
"
"    v_sub_seq_no                 NUMBER;
"
"    v_sub_seq_nos             NUMBER;
"
"    v_sal_price_class_id      VARCHAR2(10);
"
"    v_pur_price_class_id      VARCHAR2(10);
"
"    v_pmc_curcy_id              VARCHAR2(5);
"
"    v_pms_curcy_id              VARCHAR2(5);
"
"    v_prod_id                  VARCHAR2(25);
"
"
"
"                               TYPE typ_bale_dtl IS RECORD(pml_seq_no            NUMBER(5),
"
"                                                           --pml_prod_id    VARCHAR2(25),
"
"                              -- pml_prod_rev    NUMBER(5),
"
"                               pml_prod_desc    VARCHAR2(150),
"
"                               pml_uom            VARCHAR2(5),
"
"                               pml_cls_desc    VARCHAR2(100),
"
"                               pml_sub_cls_desc    VARCHAR2(100),
"
"                               pml_prod_mjr_cls             VARCHAR2(50),
"
"                               pml_hsn_code    VARCHAR2(25),
"
"                               pml_buyer_id     VARCHAR2(10),
"
"                               pml_buyer_desc    VARCHAR2(100),
"
"                               pml_store_id    VARCHAR2(10),
"
"                               pml_mpn_no            VARCHAR2(25),
"
"                               pml_mpn_desc    VARCHAR2(150),
"
"                               pml_std_sell_cost    NUMBER(17,5),
"
"                               pml_currency   VARCHAR2(5),
"
"                               pml_std_cost    NUMBER(17,5),
"
"                               pml_min_ord_qty    NUMBER(12,3),
"
"                               pml_std_pack_qty    NUMBER(12,3),
"
"                               pmc_sub_seq_no    NUMBER(5),
"
"                               pmc_cust_id    VARCHAR2(10),
"
"                               pmc_cust_name    VARCHAR2(100),
"
"                               pmc_sal_price_cls_desc    VARCHAR2(50),
"
"                               pmc_sell_cost    NUMBER(17,5),
"
"                               pmc_curcy_id        VARCHAR2(5),
"
"                               pms_sub_seq_no    NUMBER(5),
"
"                               pms_suplr_id    VARCHAR2(10),
"
"                               pms_suplr_name    VARCHAR2(50),
"
"                               pms_pur_price_cls_desc    VARCHAR2(50),
"
"                               pms_pur_cost    NUMBER(17,5),
"
"                               pms_curcy_id        VARCHAR2(5)
"
"                             );
"
"
"
"    TYPE typ_bale IS TABLE OF typ_bale_dtl INDEX BY PLS_INTEGER;
"
"    r_bale    typ_bale;
"
"
"
"    TYPE typ_ref_cur IS REF CURSOR;
"
"    c_bale    typ_ref_cur;
"
"
"
"    indx    NUMBER := 1;
"
"
"
"  BEGIN
"
"
"
"    v_emp_id := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr := Audit_Info.Get_IP_Address;
"
"    v_os_user := Audit_Info.Get_OS_User;
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
"    proc_chk_migrate_table('SCM_MIGRATION');
"
"   Raise_application_error(-20999,'HRM');
"
"   v_sql := 'CREATE TABLE SCM_MIGRATION(pml_seq_no                    NUMBER(5),
"
"                                        --pml_prod_id                   VARCHAR2(25),
"
"                    --pml_prod_rev                     NUMBER(5),
"
"                    pml_prod_desc                 VARCHAR2(150),
"
"                                        pml_uom                      VARCHAR2(5),
"
"                                        pml_cls_desc                    VARCHAR2(100),
"
"                                        pml_sub_cls_desc             VARCHAR2(100),
"
"                                        pml_prod_mjr_cls             VARCHAR2(50),
"
"                                        pml_hsn_code                    VARCHAR2(25),
"
"                                        pml_buyer_id                    VARCHAR2(10),
"
"                                        pml_buyer_desc                  VARCHAR2(100),
"
"                                        pml_store_id                   VARCHAR2(10),
"
"                                        pml_mpn_no                    VARCHAR2(25),
"
"                                        pml_mpn_desc                    VARCHAR2(150),
"
"                                        pml_std_sell_cost            NUMBER(17,5),
"
"                                        pml_currency             VARCHAR2(5),
"
"                                        pml_std_cost                 NUMBER(17,5),
"
"                                        pml_min_ord_qty              NUMBER(12,3),
"
"                                        pml_std_pack_qty             NUMBER(12,3),
"
"                                        pmc_sub_seq_no               NUMBER(5),
"
"                    pmc_cust_id                    VARCHAR2(10),
"
"                    pmc_cust_name                 VARCHAR2(100),
"
"                    pmc_sal_price_cls_desc       VARCHAR2(50),
"
"                    pmc_sell_cost                NUMBER(17,5),
"
"                    pmc_curcy_id                 VARCHAR2(5),
"
"                    pms_sub_seq_no                  NUMBER(5),
"
"                    pms_suplr_id                    VARCHAR2(10),
"
"                    pms_suplr_name                  VARCHAR2(50),
"
"                    pms_pur_price_cls_desc       VARCHAR2(50),
"
"                    pms_pur_cost                NUMBER(17,5),
"
"                    pms_curcy_id        VARCHAR2(5)
"
"                                       )
"
"                      ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                            DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                            ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                            SKIP 1
"
"                                            FIELDS TERMINATED BY '','' OPTIONALLY ENCLOSED BY ''""''
"
"                                            MISSING FIELD VALUES ARE NULL
"
"                                            REJECT ROWS WITH ALL NULL FIELDS
"
"                                            (pml_seq_no              CHAR(255),
"
"                                            -- pml_prod_id             CHAR(255),
"
"                                            -- pml_prod_rev            CHAR(255),
"
"                                             pml_prod_desc           CHAR(255),
"
"                                             pml_uom                 CHAR(255),
"
"                                             pml_cls_desc            CHAR(255),
"
"                                             pml_sub_cls_desc        CHAR(255),
"
"                                             pml_prod_mjr_cls        CHAR(255),
"
"                                             pml_hsn_code            CHAR(255),
"
"                                             pml_buyer_id            CHAR(255),
"
"                                             pml_buyer_desc          CHAR(255),
"
"                                             pml_store_id            CHAR(255),
"
"                                             pml_mpn_no              CHAR(255),
"
"                                             pml_mpn_desc            CHAR(255),
"
"                                             pml_std_sell_cost       CHAR(255),
"
"                                             pml_currency         CHAR(255),
"
"                                             pml_std_cost            CHAR(255),
"
"                                             pml_min_ord_qty         CHAR(255),
"
"                                             pml_std_pack_qty        CHAR(255),
"
"                                             pmc_sub_seq_no          CHAR(255),
"
"                         pmc_cust_id             CHAR(255),
"
"                         pmc_cust_name           CHAR(255),
"
"                             pmc_sal_price_cls_desc  CHAR(255),
"
"                                             pmc_sell_cost           CHAR(255),
"
"                             pmc_curcy_id             CHAR(255),
"
"                                             pms_sub_seq_no          CHAR(255),
"
"                         pms_suplr_id            CHAR(255),
"
"                         pms_suplr_name          CHAR(255),
"
"                         pms_pur_price_cls_desc  CHAR(255),
"
"                                             pms_pur_cost            CHAR(255),
"
"                         pms_curcy_id             CHAR(255)
"
"                                            ))
"
"                                            LOCATION ('''||p_fname||''')
"
"                                        )REJECT LIMIT UNLIMITED';
"
"       --Raise_application_error(-20999,'HRM');
"
"    EXECUTE IMMEDIATE v_sql;
"
"
"
"    OPEN c_bale FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"
"
"      FETCH c_bale INTO r_bale(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_bale%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_bale;
"
"
"
"    DELETE FROM prod_migr_ln
"
"     WHERE pml_bu = p_bu
"
"       AND pml_doc_no = p_doc_no;
"
"
"
"    DELETE FROM prod_migr_cust
"
"           WHERE pmc_bu = p_bu
"
"         AND pmc_doc_no  = p_doc_no;
"
"
"
"   DELETE FROM prod_migr_suplr
"
"             WHERE pms_bu = p_bu
"
"         AND pms_doc_no  = p_doc_no;
"
"
"
"
"
"   FOR indx IN 1..r_bale.COUNT
"
"    LOOP
"
"
"
"      IF r_bale(indx).pml_cls_desc IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"           SELECT class_id
"
"             INTO v_class_id
"
"             FROM classes
"
"            WHERE class_bu = p_bu
"
"              AND class_desc1 = r_bale(indx).pml_cls_desc;
"
"
"
"           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             v_class_id := NULL;
"
"        END;
"
"      END IF;
"
"
"
"      IF r_bale(indx).pml_sub_cls_desc IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"           SELECT subcls_parcls_id
"
"             INTO v_sub_class_id
"
"             FROM sub_classes
"
"            WHERE subcls_bu = p_bu
"
"            AND subcls_desc1 = r_bale(indx).pml_sub_cls_desc;
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             v_sub_class_id := NULL;
"
"        END;
"
"
"
"      END IF;
"
"
"
"
"
"
"
"
"
"        SELECT NVL(MAX(pml_seq_no),0) + 1
"
"          INTO v_seq_no
"
"          FROM prod_migr_ln
"
"         WHERE pml_bu = p_bu
"
"           AND pml_doc_no = p_doc_no;
"
"
"
"      INSERT INTO prod_migr_ln
"
"                                            (pml_bu,
"
"                             pml_doc_no,
"
"                             pml_seq_no,
"
"                             pml_prod_id,
"
"                             pml_prod_rev,
"
"                                             pml_prod_desc,
"
"                                             pml_mpn_no,
"
"                                             pml_mpn_desc,
"
"                                             pml_sub_cls_id,
"
"                             pml_sub_cls_desc,
"
"                                             pml_cls_id,
"
"                             pml_cls_desc,
"
"                             pml_uom,
"
"                              pml_hsn_code,
"
"                             pml_min_ord_qty,
"
"                             pml_std_pack_qty,
"
"                             pml_std_cost,
"
"                             pml_std_sell_cost,
"
"                             pml_buyer_id,
"
"                             pml_buyer_desc,
"
"                             pml_prod_mjr_cls,
"
"                             pml_store_id,
"
"                             pml_cre_by,
"
"                             pml_cre_emp_id,
"
"                             pml_cre_ip_addr,
"
"                             pml_cre_os_user,
"
"                             pml_cre_date,
"
"                             pml_sel_flag,
"
"                             pml_currency
"
"                            )
"
"                     VALUES(p_bu,
"
"                            p_doc_no,
"
"                            v_seq_no,
"
"                            --r_bale(indx).pml_prod_id,
"
"                            --r_bale(indx).pml_prod_rev,
"
"                            r_bale(indx).pml_prod_desc,
"
"                            r_bale(indx).pml_mpn_no,
"
"                            r_bale(indx).pml_mpn_desc,
"
"                            v_sub_class_id,
"
"                            r_bale(indx).pml_sub_cls_desc,
"
"                            v_class_id,
"
"                            r_bale(indx).pml_cls_desc,
"
"                            r_bale(indx).pml_uom,
"
"                            r_bale(indx).pml_hsn_code,
"
"                            NVL(r_bale(indx).pml_min_ord_qty,0),
"
"                            NVL(r_bale(indx).pml_std_pack_qty,0),
"
"                            NVL(r_bale(indx).pml_std_cost,0),
"
"                            NVL(r_bale(indx).pml_std_sell_cost,0),
"
"                            r_bale(indx).pml_buyer_id,
"
"                            r_bale(indx).pml_buyer_desc,
"
"                            r_bale(indx).pml_prod_mjr_cls,
"
"                            r_bale(indx).pml_store_id,
"
"                            p_user,
"
"                            v_emp_id,
"
"                            v_ip_addr,
"
"                                v_os_user,
"
"                                SYSDATE,
"
"                                Y,--CASE WHEN r_bale(indx).pml_prod_id IS NULL THEN 'Y' ELSE 'N' END,
"
"                                r_bale(indx).pml_currency
"
"                          );
"
"
"
"      IF r_bale(indx).pmc_sal_price_cls_desc IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"         SELECT tcf_id
"
"           INTO v_sal_price_class_id
"
"           FROM tax_classification
"
"          WHERE  tcf_bu = p_bu
"
"            AND tcf_desc = r_bale(indx).pmc_sal_price_cls_desc;
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"           v_sal_price_class_id := NULL;
"
"        END;
"
"
"
"      END IF;
"
"      IF r_bale(indx).pmc_curcy_id IS NOT NULL THEN
"
"
"
"       BEGIN
"
"
"
"         SELECT curcy_id
"
"           INTO v_pmc_curcy_id
"
"           FROM currencies,customers
"
"          WHERE cust_bu = p_bu
"
"            AND cust_cust_id =  r_bale(indx).pmc_cust_id
"
"            AND curcy_id = r_bale(indx).pmc_curcy_id ;
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"            Raise_Application_Error(-20104,'APM');
"
"       END;
"
"
"
"      END IF;
"
"      IF r_bale(indx).pmc_cust_id IS NOT NULL THEN
"
"
"
"        SELECT NVL(MAX(pmc_sub_seq_no),0) + 1
"
"          INTO v_sub_seq_nos
"
"          FROM prod_migr_cust
"
"         WHERE pmc_bu = p_bu
"
"           AND pmc_doc_no =  p_doc_no
"
"           AND pmc_seq_no = v_seq_no;
"
"
"
"         INSERT INTO prod_migr_cust(pmc_bu,
"
"                                    pmc_doc_no,
"
"                                    pmc_seq_no,
"
"                                    pmc_sub_seq_no,
"
"                                    pmc_cust_id,
"
"                                    pmc_cust_name,
"
"                                    pmc_sal_price_cls,
"
"                                    pmc_sal_price_cls_desc,
"
"                                    pmc_sell_cost,
"
"                                    pmc_cre_by,
"
"                                    pmc_cre_emp_id,
"
"                                    pmc_cre_ip_addr,
"
"                                    pmc_cre_os_user,
"
"                                    pmc_cre_date,
"
"                                    pmc_curcy_id
"
"                                   )
"
"                             VALUES(p_bu,
"
"                                    p_doc_no,
"
"                                    v_seq_no,
"
"                                    v_sub_seq_nos,
"
"                                    r_bale(indx).pmc_cust_id,
"
"                                    r_bale(indx).pmc_cust_name,
"
"                                    v_sal_price_class_id,
"
"                                    r_bale(indx).pmc_sal_price_cls_desc,
"
"                                    NVL(r_bale(indx).pmc_sell_cost,0),
"
"                                    p_user,
"
"                                    v_emp_id,
"
"                                    v_ip_addr,
"
"                                    v_os_user,
"
"                                    SYSDATE,
"
"                                    v_pmc_curcy_id
"
"                                    );
"
"      END IF;
"
"      IF r_bale(indx).pms_pur_price_cls_desc IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"         SELECT tcf_id
"
"           INTO v_pur_price_class_id
"
"           FROM tax_classification
"
"          WHERE  tcf_bu = p_bu
"
"          AND tcf_desc = r_bale(indx).pms_pur_price_cls_desc;
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"           v_pur_price_class_id := NULL;
"
"        END;
"
"
"
"      END IF;
"
"
"
"      IF r_bale(indx).pms_curcy_id IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"        SELECT curcy_id INTO v_pms_curcy_id
"
"          FROM currencies,suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_suplr_id =  r_bale(indx).pms_suplr_id
"
"           AND curcy_id =r_bale(indx).pms_curcy_id;
"
"
"
"
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"         Raise_Application_Error(-20104,'APM');
"
"        END;
"
"
"
"      END IF;
"
"      IF r_bale(indx).pms_suplr_id IS NOT NULL THEN
"
"
"
"       SELECT NVL(MAX(pms_sub_seq_no),0) + 1
"
"         INTO v_sub_seq_no
"
"         FROM prod_migr_suplr
"
"        WHERE pms_bu = p_bu
"
"          AND pms_doc_no =  p_doc_no
"
"          AND pms_seq_no = v_seq_no;
"
"
"
"
"
"
"
"            INSERT INTO prod_migr_suplr(pms_bu,
"
"                                        pms_doc_no,
"
"                                        pms_seq_no,
"
"                                        pms_sub_seq_no,
"
"                                        pms_suplr_id,
"
"                                        pms_suplr_name,
"
"                                        pms_pur_price_cls,
"
"                                        pms_pur_price_cls_desc,
"
"                                        pms_pur_cost,
"
"                                        pms_cre_by,
"
"                                        pms_cre_emp_id,
"
"                                        pms_cre_ip_addr,
"
"                                        pms_cre_os_user,
"
"                                        pms_cre_date,
"
"                                         pms_curcy_id
"
"                                        )
"
"                                 VALUES(p_bu,
"
"                                        p_doc_no,
"
"                                        v_seq_no,
"
"                                        v_sub_seq_no,
"
"                                        r_bale(indx).pms_suplr_id,
"
"                                        r_bale(indx).pms_suplr_name,
"
"                                        v_pur_price_class_id,
"
"                                        r_bale(indx).pms_pur_price_cls_desc,
"
"                                        NVL(r_bale(indx).pms_pur_cost,0),
"
"                                        p_user,
"
"                                        v_emp_id,
"
"                                        v_ip_addr,
"
"                                        v_os_user,
"
"                                        SYSDATE,
"
"                                        v_pms_curcy_id
"
"                                       );
"
"      END IF;
"
"
"
"    END LOOP;
"
"    Commit;
"
"END proc_ins_migr_item;*/
"
"/*PROCEDURE proc_ins_migr_item (p_bu               business_units.bu_id%TYPE,
"
"                                p_doc_no           prod_migr_hd.pmh_doc_no%TYPE,
"
"                              p_fname           VARCHAR2,
"
"                              p_user            prod_migr_hd.pmh_cre_by%TYPE
"
"                               )
"
"  AS
"
"
"
"    v_sql                       CLOB;
"
"    v_fpath                     VARCHAR2(200);
"
"    v_emp_id                   VARCHAR2(10);
"
"    v_ip_addr                     VARCHAR2(20);
"
"    v_os_user                  VARCHAR2(50);
"
"    v_sub_class_id             VARCHAR2(10);
"
"    v_class_id                  VARCHAR2(10);
"
"    v_seq_no                   NUMBER;
"
"   -- v_sub_seq_no                 NUMBER;
"
"   -- v_sub_seq_nos             NUMBER;
"
"    v_sal_price_class_id      VARCHAR2(10);
"
"    v_pur_price_class_id      VARCHAR2(10);
"
"   v_pmc_curcy_id              VARCHAR2(5);
"
"    v_pms_curcy_id              VARCHAR2(5);
"
"    v_prod_id                  VARCHAR2(25);
"
"
"
"                               TYPE typ_bale_dtl IS RECORD(pml_seq_no            NUMBER(5),
"
"                               pml_prod_desc    VARCHAR2(150),
"
"                               pml_uom            VARCHAR2(5),
"
"                               pml_cls_desc    VARCHAR2(100),
"
"                               pml_sub_cls_desc    VARCHAR2(100),
"
"                               pml_prod_mjr_cls             VARCHAR2(50),
"
"                               pml_hsn_code    VARCHAR2(25),
"
"                               pml_buyer_id     VARCHAR2(10),
"
"                               pml_buyer_desc    VARCHAR2(100),
"
"                               pml_store_id    VARCHAR2(10),
"
"                               pml_mpn_no            VARCHAR2(25),
"
"                               pml_mpn_desc    VARCHAR2(150),
"
"                               pml_std_sell_cost    NUMBER(17,5),
"
"                               pml_currency   VARCHAR2(5),
"
"                               pml_std_cost    NUMBER(17,5),
"
"                               pml_min_ord_qty    NUMBER(12,3),
"
"                               pml_std_pack_qty    NUMBER(12,3),
"
"                               pmc_cust_id    VARCHAR2(10),
"
"                               pmc_cust_name    VARCHAR2(100),
"
"                               pmc_sal_price_cls_desc    VARCHAR2(50),
"
"                               pmc_sell_cost    NUMBER(17,5),
"
"                               pmc_curcy_id        VARCHAR2(5),
"
"                               pms_suplr_id    VARCHAR2(10),
"
"                               pms_suplr_name    VARCHAR2(50),
"
"                               pms_pur_price_cls_desc    VARCHAR2(50),
"
"                               pms_pur_cost    NUMBER(17,5),
"
"                               pms_curcy_id        VARCHAR2(5)
"
"                             );
"
"
"
"    TYPE typ_bale IS TABLE OF typ_bale_dtl INDEX BY PLS_INTEGER;
"
"    r_bale    typ_bale;
"
"
"
"    TYPE typ_ref_cur IS REF CURSOR;
"
"    c_bale    typ_ref_cur;
"
"
"
"    indx    NUMBER := 1;
"
"
"
"  BEGIN
"
"
"
"    v_emp_id := func_find_emp_id(p_bu,p_user);
"
"    v_ip_addr := Audit_Info.Get_IP_Address;
"
"    v_os_user := Audit_Info.Get_OS_User;
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
"    proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"   v_sql := 'CREATE TABLE SCM_MIGRATION(pml_seq_no                    NUMBER(5),
"
"                                        pml_prod_desc                 VARCHAR2(150),
"
"                                        pml_uom                      VARCHAR2(5),
"
"                                        pml_cls_desc                    VARCHAR2(100),
"
"                                        pml_sub_cls_desc             VARCHAR2(100),
"
"                                        pml_prod_mjr_cls             VARCHAR2(50),
"
"                                        pml_hsn_code                    VARCHAR2(25),
"
"                                        pml_buyer_id                    VARCHAR2(10),
"
"                                        pml_buyer_desc                  VARCHAR2(100),
"
"                                        pml_store_id                   VARCHAR2(10),
"
"                                        pml_mpn_no                    VARCHAR2(25),
"
"                                        pml_mpn_desc                    VARCHAR2(150),
"
"                                        pml_std_sell_cost            NUMBER(17,5),
"
"                                        pml_currency             VARCHAR2(5),
"
"                                        pml_std_cost                 NUMBER(17,5),
"
"                                        pml_min_ord_qty              NUMBER(12,3),
"
"                                        pml_std_pack_qty             NUMBER(12,3),
"
"                                        pmc_cust_id                    VARCHAR2(10),
"
"                                        pmc_cust_name                 VARCHAR2(100),
"
"                                        pmc_sal_price_cls_desc       VARCHAR2(50),
"
"                                        pmc_sell_cost                NUMBER(17,5),
"
"                                        pmc_curcy_id                 VARCHAR2(5),
"
"                                        pms_suplr_id                    VARCHAR2(10),
"
"                                        pms_suplr_name                  VARCHAR2(50),
"
"                                        pms_pur_price_cls_desc       VARCHAR2(50),
"
"                                        pms_pur_cost                NUMBER(17,5),
"
"                                        pms_curcy_id        VARCHAR2(5)
"
"                                       )
"
"                      ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                            DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                            ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                            SKIP 1
"
"                                            FIELDS TERMINATED BY '','' OPTIONALLY ENCLOSED BY ''""''
"
"                                            MISSING FIELD VALUES ARE NULL
"
"                                            REJECT ROWS WITH ALL NULL FIELDS
"
"                                            (pml_seq_no              CHAR(255),
"
"                                             pml_prod_desc           CHAR(255),
"
"                                             pml_uom                 CHAR(255),
"
"                                             pml_cls_desc            CHAR(255),
"
"                                             pml_sub_cls_desc        CHAR(255),
"
"                                             pml_prod_mjr_cls        CHAR(255),
"
"                                             pml_hsn_code            CHAR(255),
"
"                                             pml_buyer_id            CHAR(255),
"
"                                             pml_buyer_desc          CHAR(255),
"
"                                             pml_store_id            CHAR(255),
"
"                                             pml_mpn_no              CHAR(255),
"
"                                             pml_mpn_desc            CHAR(255),
"
"                                             pml_std_sell_cost       CHAR(255),
"
"                                             pml_currency         CHAR(255),
"
"                                             pml_std_cost            CHAR(255),
"
"                                             pml_min_ord_qty         CHAR(255),
"
"                                             pml_std_pack_qty        CHAR(255),
"
"                                             pmc_cust_id             CHAR(255),
"
"                                             pmc_cust_name           CHAR(255),
"
"                                             pmc_sal_price_cls_desc  CHAR(255),
"
"                                             pmc_sell_cost           CHAR(255),
"
"                                             pmc_curcy_id             CHAR(255),
"
"                                             pms_suplr_id            CHAR(255),
"
"                                             pms_suplr_name          CHAR(255),
"
"                                             pms_pur_price_cls_desc  CHAR(255),
"
"                                             pms_pur_cost            CHAR(255),
"
"                                             pms_curcy_id             CHAR(255)
"
"                                            ))
"
"                                            LOCATION ('''||p_fname||''')
"
"                                        )REJECT LIMIT UNLIMITED';
"
"
"
"    EXECUTE IMMEDIATE v_sql;
"
"
"
"    OPEN c_bale FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"
"
"      FETCH c_bale INTO r_bale(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_bale%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE c_bale;
"
"
"
"      --Raise_application_error(-20999,'HRM');
"
"    DELETE FROM temp_item_migration
"
"     WHERE tim_bu = p_bu
"
"       AND tim_doc_no = p_doc_no;
"
"
"
"
"
"   FOR indx IN 1..r_bale.COUNT
"
"    LOOP
"
"
"
"      IF r_bale(indx).pml_cls_desc IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"           SELECT class_id
"
"             INTO v_class_id
"
"             FROM classes
"
"            WHERE class_bu = p_bu
"
"              AND class_desc1 = r_bale(indx).pml_cls_desc;
"
"
"
"           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             v_class_id := NULL;
"
"        END;
"
"      END IF;
"
"
"
"      IF r_bale(indx).pml_sub_cls_desc IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"           SELECT subcls_parcls_id
"
"             INTO v_sub_class_id
"
"             FROM sub_classes
"
"            WHERE subcls_bu = p_bu
"
"            AND subcls_desc1 = r_bale(indx).pml_sub_cls_desc;
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             v_sub_class_id := NULL;
"
"        END;
"
"
"
"      END IF;
"
"
"
"
"
"      IF r_bale(indx).pmc_sal_price_cls_desc IS NOT NULL THEN
"
"
"
"        BEGIN
"
"
"
"           SELECT tcf_id
"
"             INTO v_sal_price_class_id
"
"             FROM tax_classification
"
"            WHERE  tcf_bu = p_bu
"
"              AND tcf_desc = r_bale(indx).pmc_sal_price_cls_desc;
"
"
"
"             EXCEPTION WHEN NO_DATA_FOUND THEN
"
"               v_sal_price_class_id := NULL;
"
"        END;
"
"
"
"      END IF;
"
"      IF r_bale(indx).pmc_curcy_id IS NOT NULL THEN
"
"
"
"         BEGIN
"
"
"
"           SELECT curcy_id
"
"               INTO v_pmc_curcy_id
"
"             FROM currencies,customers
"
"             WHERE cust_bu = p_bu
"
"              AND cust_cust_id =  r_bale(indx).pmc_cust_id
"
"               AND curcy_id = r_bale(indx).pmc_curcy_id ;
"
"
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                  Raise_Application_Error(-20104,'APM');
"
"         END;
"
"
"
"      END IF;
"
"
"
"      IF r_bale(indx).pms_pur_price_cls_desc IS NOT NULL THEN
"
"
"
"         BEGIN
"
"
"
"             SELECT tcf_id
"
"               INTO v_pur_price_class_id
"
"               FROM tax_classification
"
"              WHERE  tcf_bu = p_bu
"
"                AND tcf_desc = r_bale(indx).pms_pur_price_cls_desc;
"
"
"
"              EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                 v_pur_price_class_id := NULL;
"
"           END;
"
"
"
"      END IF;
"
"
"
"      IF r_bale(indx).pms_curcy_id IS NOT NULL THEN
"
"
"
"         BEGIN
"
"
"
"           SELECT curcy_id INTO v_pms_curcy_id
"
"             FROM currencies,suppliers
"
"            WHERE suplr_bu = p_bu
"
"              AND suplr_suplr_id =  r_bale(indx).pms_suplr_id
"
"              AND curcy_id =r_bale(indx).pms_curcy_id;
"
"
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          Raise_Application_Error(-20104,'APM');
"
"         END;
"
"
"
"       END IF;
"
"
"
"        SELECT NVL(MAX(tim_seq_no),0) + 1
"
"          INTO v_seq_no
"
"          FROM temp_item_migration
"
"         WHERE tim_bu = p_bu
"
"           AND tim_doc_no = p_doc_no;
"
"  --  RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"      INSERT INTO TEMP_ITEM_MIGRATION
"
"                           (tim_bu,
"
"                            tim_doc_no,
"
"                            tim_seq_no,
"
"                            tim_prod_desc,
"
"                            tim_mpn_no,
"
"                            tim_mpn_desc,
"
"                            tim_sub_cls_id,
"
"                            tim_sub_cls_desc,
"
"                            tim_cls_id,
"
"                            tim_cls_desc,
"
"                            tim_uom,
"
"                            tim_hsn_code,
"
"                            tim_min_ord_qty,
"
"                            tim_std_pack_qty,
"
"                            tim_std_cost,
"
"                            tim_std_sell_cost,
"
"                            tim_buyer_id,
"
"                            tim_buyer_desc,
"
"                            tim_prod_mjr_cls,
"
"                            tim_store_id,
"
"                            tim_cre_by,
"
"                            tim_cre_emp_id,
"
"                            tim_cre_ip_addr,
"
"                            tim_cre_os_user,
"
"                            tim_cre_date,
"
"                            tim_sel_flag,
"
"                            tim_currency,
"
"                                tim_cust_id,
"
"                            tim_cust_name,
"
"                            tim_sal_price_cls,
"
"                            tim_sal_price_cls_desc,
"
"                            tim_sell_cost,
"
"                            tim_curcy_cust_id,
"
"                            tim_suplr_id,
"
"                            tim_suplr_name,
"
"                            tim_pur_price_cls,
"
"                            tim_pur_price_cls_desc,
"
"                            tim_pur_cost,
"
"                            tim_curcy_suplr_id,
"
"                            tim_select_flag,
"
"                            tim_select_user
"
"                                                        )
"
"                                                 VALUES(p_bu,
"
"                            p_doc_no,
"
"                            v_seq_no,
"
"                            r_bale(indx).pml_prod_desc,
"
"                            r_bale(indx).pml_mpn_no,
"
"                            r_bale(indx).pml_mpn_desc,
"
"                            v_sub_class_id,
"
"                            r_bale(indx).pml_sub_cls_desc,
"
"                            v_class_id,
"
"                            r_bale(indx).pml_cls_desc,
"
"                            r_bale(indx).pml_uom,
"
"                            r_bale(indx).pml_hsn_code,
"
"                            NVL(r_bale(indx).pml_min_ord_qty,0),
"
"                            NVL(r_bale(indx).pml_std_pack_qty,0),
"
"                            NVL(r_bale(indx).pml_std_cost,0),
"
"                            NVL(r_bale(indx).pml_std_sell_cost,0),
"
"                            r_bale(indx).pml_buyer_id,
"
"                            r_bale(indx).pml_buyer_desc,
"
"                            r_bale(indx).pml_prod_mjr_cls,
"
"                            r_bale(indx).pml_store_id,
"
"                            p_user,
"
"                            v_emp_id,
"
"                            v_ip_addr,
"
"                            v_os_user,
"
"                            SYSDATE,
"
"                            'Y',
"
"                            r_bale(indx).pml_currency,
"
"                            r_bale(indx).pmc_cust_id,
"
"                            r_bale(indx).pmc_cust_name,
"
"                            v_sal_price_class_id,
"
"                            r_bale(indx).pmc_sal_price_cls_desc,
"
"                            NVL(r_bale(indx).pmc_sell_cost,0),
"
"                            v_pmc_curcy_id,
"
"                            r_bale(indx).pms_suplr_id,
"
"                            r_bale(indx).pms_suplr_name,
"
"                            v_pur_price_class_id,
"
"                            r_bale(indx).pms_pur_price_cls_desc,
"
"                            NVL(r_bale(indx).pms_pur_cost,0),
"
"                            v_pms_curcy_id,
"
"                            'N',
"
"                            'NULL'
"
"                          );
"
"
"
"
"
"
"
"    END LOOP;
"
"    Commit;
"
"END proc_ins_migr_item;*/
"
"
"
"PROCEDURE proc_ins_attr (p_bu               business_units.bu_id%TYPE,
"
"             p_po_pfx        pur_order_hd.poh_order_pfx%TYPE,
"
"             p_po_no        pur_order_hd.poh_order_no%TYPE,
"
"               p_fname            VARCHAR2,
"
"               p_user            pur_order_hd.poh_cre_by%TYPE
"
"            )
"
"
"
"AS
"
"
"
"  v_sql        VARCHAR2(4000);
"
"  v_fpath    VARCHAR2(200);
"
"  v_emp_id    VARCHAR2(10);
"
"  v_ip_addr    VARCHAR2(20);
"
"  v_os_user    VARCHAR2(50);
"
"  v_attr_id     VARCHAR2(10);
"
"  v_seq_no    NUMBER;
"
"  v_sub_seq_no  NUMBER := 0;
"
"  v_attr_cnt    NUMBER(5);
"
"
"
"  TYPE typ_bale_dtl IS RECORD(attr_desc    VARCHAR2(50),
"
"                              ttav_attr_value    VARCHAR2(1000)
"
"                 );
"
"
"
"  TYPE typ_bale IS TABLE OF typ_bale_dtl INDEX BY PLS_INTEGER;
"
"  r_bale    typ_bale;
"
"
"
"  TYPE typ_ref_cur IS REF CURSOR;
"
"  c_bale    typ_ref_cur;
"
"
"
"  indx    NUMBER := 1;
"
"
"
"BEGIN
"
"
"
"  v_emp_id := func_find_emp_id(p_bu,p_user);
"
"  v_ip_addr := Audit_Info.Get_IP_Address;
"
"  v_os_user := Audit_Info.Get_OS_User;
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(attr_desc    VARCHAR2(50),
"
"                                       ttav_attr_value    VARCHAR2(1000)
"
"                                      )
"
"                 ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                       SKIP 1
"
"                                       FIELDS TERMINATED BY '',''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                       REJECT ROWS WITH ALL NULL FIELDS
"
"                                       (attr_desc    CHAR(255),
"
"                                        ttav_attr_value CHAR(255)
"
"                                       ))
"
"                                       LOCATION ('''||p_fname||''')
"
"                                      )REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"--Raise_Application_Error(-20999,'HRM ');
"
"  OPEN c_bale FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_bale INTO r_bale(indx);
"
"    indx := indx + 1;
"
"    EXIT WHEN c_bale%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_bale;
"
"
"
"  DELETE FROM po_hd_tnc_attr_val
"
"   WHERE phtav_bu = p_bu
"
"     AND phtav_po_no = p_po_no;
"
"
"
"  DELETE FROM po_hd_tnc_attr
"
"   WHERE phta_bu = p_bu
"
"     AND phta_po_no = p_po_no;
"
"
"
"  FOR indx IN 1..r_bale.COUNT
"
"  LOOP
"
"      --Raise_Application_Error(-20999,'HRM '||p_bu||'-'||p_po_pfx||'-'||p_po_no||v_attr_id);
"
"    IF r_bale(indx).attr_desc IS NOT NULL THEN
"
"
"
"                 BEGIN
"
"
"
"                    SELECT ta_attr_id
"
"                      INTO v_attr_id
"
"                      FROM tnc_attr
"
"                     WHERE ta_bu = p_bu
"
"                       AND ta_attr_desc = UPPER(r_bale(indx).attr_desc);
"
"
"
"                   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                      v_attr_id := NULL;
"
"                 END;
"
"
"
"    END IF;
"
"             BEGIN
"
"
"
"           SELECT COUNT(*)
"
"             INTO v_attr_cnt
"
"             FROM po_hd_tnc_attr
"
"            WHERE phta_bu = p_bu
"
"              AND phta_po_no = p_po_no
"
"              AND phta_attr_id = v_attr_id;
"
"
"
"           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             v_attr_cnt := 0;
"
"        END;
"
"-- Raise_Application_Error(-20999,'HRM '||p_bu||'-'||p_po_pfx||'-'||p_po_no||v_attr_id);
"
"    IF v_attr_cnt = 0 THEN
"
"
"
"      SELECT NVL(MAX(phta_seq_no),0)+1
"
"      INTO v_seq_no
"
"      FROM po_hd_tnc_attr
"
"     WHERE phta_bu = p_bu
"
"       AND phta_po_no = p_po_no;
"
"
"
"        INSERT INTO po_hd_tnc_attr(phta_bu,
"
"                   phta_po_no,
"
"                   phta_seq_no,
"
"                   phta_attr_id,
"
"                   phta_print_seq,
"
"                   phta_cre_by,
"
"                   phta_cre_emp_id,
"
"                       phta_cre_ip_addr,
"
"                       phta_cre_os_user,
"
"                   phta_cre_date
"
"                     )
"
"               VALUES( p_bu,
"
"                   p_po_no,
"
"                   v_seq_no,
"
"                   v_attr_id,
"
"                   v_seq_no,
"
"                   p_user,
"
"                   v_emp_id,
"
"                   v_ip_addr,
"
"                   v_os_user,
"
"                   SYSDATE
"
"                      );
"
"    ELSE
"
"   -- Raise_Application_Error(-20999,'HRM '||p_bu||'-'||p_po_pfx||'-'||p_po_no||v_attr_id);
"
"      SELECT phta_seq_no
"
"        INTO v_seq_no
"
"        FROM po_hd_tnc_attr
"
"       WHERE phta_bu = p_bu
"
"         AND phta_po_no = p_po_no
"
"         AND phta_attr_id = v_attr_id;
"
"
"
"    END IF;
"
"
"
"BEGIN
"
"SELECT NVL(MAX(phtav_sub_seq_no),0)+1
"
"  INTO v_sub_seq_no
"
"  FROM po_hd_tnc_attr_val
"
" WHERE phtav_bu = p_bu
"
"   AND phtav_po_no = p_po_no
"
"   AND phtav_seq_no = v_seq_no;
"
"
"
"   --v_sub_seq_no := v_sub_seq_no + 1;
"
"
"
"      INSERT INTO po_hd_tnc_attr_val(phtav_bu,
"
"                         phtav_po_no,
"
"                     phtav_seq_no ,
"
"                                     phtav_sub_seq_no,
"
"                     phtav_attr_val,
"
"                     phtav_cre_by,
"
"                     phtav_upd_emp_id,
"
"                     phtav_cre_ip_addr,
"
"                     phtav_cre_os_user,
"
"                         phtav_cre_date
"
"                      )
"
"                    VALUES( p_bu,
"
"                        p_po_no,
"
"                        v_seq_no,
"
"                        v_sub_seq_no,
"
"                        r_bale(indx).ttav_attr_value,
"
"                        p_user,
"
"                        v_emp_id,
"
"                        v_ip_addr,
"
"                        v_os_user,
"
"                        SYSDATE
"
"                         );
"
"   EXCEPTION WHEN OTHERS THEN
"
"     Raise_Application_Error(-20999,'HRM '||v_attr_id||'/'||v_seq_no||'/'||v_sub_seq_no||'/'||sqlerrm);
"
"   END;
"
"  END LOOP;
"
"  Commit;
"
"END proc_ins_attr;
"
"
"
"
"
"PROCEDURE proc_ins_ls_frm_mi(p_bu               business_units.bu_id%TYPE,
"
"                  p_doc_no        inv_stock_trans_hd.isthd_doc_no%TYPE,
"
"                  p_file_name        VARCHAR2,
"
"                  p_sep        VARCHAR2,
"
"                  p_user             inv_stock_trans_hd.isthd_cre_by%TYPE
"
"                 )
"
"AS
"
"
"
"  v_sql        VARCHAR2(4000);
"
"  v_fpath    VARCHAR2(200);
"
"  v_seq_no    NUMBER(5);
"
"  v_sys_ls_no   VARCHAR2(50);
"
"  v_sou_type    VARCHAR2(50);
"
"  v_sou_id      VARCHAR2(50);
"
"  v_batch_no    VARCHAR2(50);
"
"v_count        NUMBER(5);
"
"
"
"  TYPE typ_rcpt_ls IS RECORD(rls_seq_no        NUMBER(5),
"
"                             rls_lot_no        VARCHAR2(50),
"
"                             rls_ser_no        VARCHAR2(50),
"
"                             rls_qty        NUMBER(12,3),
"
"                             rls_mfg_date    DATE,
"
"                 rls_expiry_date    DATE
"
"                            );
"
"
"
"TYPE typ_ls_dtls IS TABLE OF typ_rcpt_ls INDEX BY PLS_INTEGER;
"
"
"
"r_ls    typ_ls_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_ls    typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(rls_seq_no    NUMBER(5),
"
"                                       rls_lot_no    VARCHAR2(50),
"
"                                       rls_ser_no    VARCHAR2(50),
"
"                                       rls_qty        NUMBER(12,3),
"
"                                       rls_mfg_date    DATE,
"
"                       rls_expiry_date    DATE
"
"                                      )
"
"                 ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                       SKIP 1
"
"                                       FIELDS TERMINATED BY '''||p_sep||'''
"
"                                       MISSING FIELD VALUES ARE NULL
"
"                                       REJECT ROWS WITH ALL NULL FIELDS
"
"                                       (rls_seq_no    CHAR(5),
"
"                                        rls_lot_no    CHAR(50),
"
"                                        rls_ser_no    CHAR(50),
"
"                    rls_qty        CHAR(12),
"
"                                        rls_mfg_date    CHAR(10) date_format DATE mask ""dd-mon-yyyy"",
"
"                    rls_expiry_date    CHAR(10) date_format DATE mask ""dd-mon-yyyy""
"
"                                       ))
"
"                                       LOCATION ('''||p_file_name||''')
"
"                                      )REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  OPEN c_ls FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_ls INTO r_ls(indx);
"
"    indx := indx + 1;
"
"    EXIT WHEN c_ls%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_ls;
"
"
"
"  DELETE FROM inv_stock_batch_details
"
"   WHERE isbd_bu = p_bu
"
"     AND isbd_issue_doc_no = p_doc_no;
"
"
"
"  DELETE FROM inv_stock_ls_upd_exp
"
"   WHERE islue_bu = p_bu
"
"     AND islue_doc_no = p_doc_no;
"
"
"
"  FOR indx IN 1..r_ls.COUNT
"
"  LOOP
"
"
"
"    BEGIN
"
"      SELECT lss_sys_ls_no,lss_source_type,lss_source_id,lss_batch_no
"
"        INTO v_sys_ls_no,v_sou_type,v_sou_id,v_batch_no
"
"        FROM lot_ser_stocks,inv_stock_trans_ln
"
"       WHERE lss_bu = istln_bu
"
"         AND lss_store_id = istln_store_id
"
"         AND lss_prod_id = istln_prod_id
"
"         AND lss_prod_rev = istln_prod_rev
"
"     AND lss_store_id = istln_store_id
"
"         AND lss_bu =  p_bu
"
"         AND istln_doc_no = p_doc_no
"
"         AND istln_seq_no = r_ls(indx).rls_seq_no
"
"         AND (lss_lot_no = r_ls(indx).rls_lot_no OR r_ls(indx).rls_lot_no IS NULL)
"
"     AND (lss_ser_no = r_ls(indx).rls_ser_no OR r_ls(indx).rls_ser_no IS NULL);
"
"    EXCEPTION WHEN OTHERS THEN
"
"    --Raise_application_error(-20251,'ICM'||r_ls(indx).rls_ser_no||' ' ||r_ls(indx).rls_lot_no);
"
"      INSERT INTO  inv_stock_ls_upd_exp (islue_bu,
"
"                      islue_doc_no,
"
"                      islue_ln_seq_no,
"
"                      islue_lot_no,
"
"                      islue_ser_no,
"
"                      islue_refer,
"
"                      islue_cre_by,
"
"                      islue_cre_date)
"
"                    VALUES
"
"                     (
"
"                      p_bu,
"
"                      p_doc_no,
"
"                      r_ls(indx).rls_seq_no,
"
"                      r_ls(indx).rls_lot_no,
"
"                      r_ls(indx).rls_ser_no,
"
"                                          'Lot\Serial details not Found',
"
"                                          p_user,
"
"                      SYSDATE
"
"                      );
"
"
"
"
"
"    END;
"
"
"
"
"
"    IF ((r_ls(indx).rls_qty < 0) OR r_ls(indx).rls_qty IS NULL)  THEN
"
"     -- Raise_application_error(-20045,'ICM');
"
"     INSERT INTO  inv_stock_ls_upd_exp (islue_bu,
"
"                          islue_doc_no,
"
"                          islue_ln_seq_no,
"
"                          islue_lot_no,
"
"                          islue_ser_no,
"
"                          islue_refer,
"
"                          islue_cre_by,
"
"                          islue_cre_date)
"
"                        VALUES
"
"                         (
"
"                          p_bu,
"
"                          p_doc_no,
"
"                          r_ls(indx).rls_seq_no,
"
"                          r_ls(indx).rls_lot_no,
"
"                          r_ls(indx).rls_ser_no,
"
"                          'Quantity should be greater than zero.',
"
"                          p_user,
"
"                          SYSDATE
"
"                          );
"
"
"
"
"
"    END IF;
"
"
"
"    IF ((r_ls(indx).rls_ser_no IS NOT NULL) AND r_ls(indx).rls_qty <> 1 )  THEN
"
"     -- Raise_application_error(-20035,'ICM');
"
"         INSERT INTO  inv_stock_ls_upd_exp (islue_bu,
"
"                          islue_doc_no,
"
"                          islue_ln_seq_no,
"
"                          islue_lot_no,
"
"                          islue_ser_no,
"
"                          islue_refer,
"
"                          islue_cre_by,
"
"                          islue_cre_date)
"
"                        VALUES
"
"                         (
"
"                          p_bu,
"
"                          p_doc_no,
"
"                          r_ls(indx).rls_seq_no,
"
"                          r_ls(indx).rls_lot_no,
"
"                          r_ls(indx).rls_ser_no,
"
"                          'Serial No. Quantity should be 1.',
"
"                          p_user,
"
"                          SYSDATE
"
"                          );
"
"    END IF;
"
"
"
"
"
"END LOOP;
"
"
"
"FOR indx IN 1..r_ls.COUNT
"
"  LOOP
"
"
"
"    SELECT COUNT(*)
"
"          INTO v_count
"
"          FROM inv_stock_ls_upd_exp
"
"         WHERE islue_bu = p_bu
"
"           AND islue_doc_no = p_doc_no;
"
"
"
"       IF v_count > 0 THEN
"
"         commit;
"
"         Raise_application_error(-20968,'ICM');
"
"       END IF;
"
"
"
"
"
"     BEGIN
"
"       SELECT NVL(MAX(isbd_sub_seq_no),0) + 1
"
"         INTO v_seq_no
"
"         FROM inv_stock_batch_details
"
"        WHERE isbd_bu = p_bu
"
"          AND isbd_issue_doc_no = p_doc_no
"
"          AND isbd_seq_no = r_ls(indx).rls_seq_no;
"
"     END;
"
"
"
"
"
"    INSERT INTO inv_stock_batch_details(isbd_bu,
"
"                    isbd_issue_doc_no,
"
"                    isbd_seq_no,
"
"                    isbd_sub_seq_no,
"
"                    isbd_trans_qty,
"
"                    isbd_lot_no,
"
"                    isbd_serial_no,
"
"                    isbd_source_id,
"
"                    isbd_source_type,
"
"                    isbd_expiry_date,
"
"                    isbd_ins_rec,
"
"                    isbd_trnf_acpt_qty,
"
"                    isbd_trnf_rtn_qty,
"
"                    isbd_trnf_tot_acpt_qty,
"
"                    isbd_trnf_tot_rtn_qty,
"
"                    isbd_upd_uc_ap_rq_flag,
"
"                    isbd_upd_uc_ap_cp_flag,
"
"                    isbd_rtn_proc_qty,
"
"                    isbd_rtn_inproc_qty,
"
"                    isbd_rtn_qty,
"
"                    isbd_excs_qty,
"
"                    isbd_excs_rtn_qty,
"
"                    isbd_excs_proc_qty,
"
"                    isbd_excs_inproc_qty,
"
"                    isbd_excs_sel_flag,
"
"                    isbd_excs_sel_user,
"
"                    isbd_sys_ls_no,
"
"                    isbd_scrap_qty,
"
"                    isbd_dis_ass_qty,
"
"                    isbd_rtn_temp_qty,
"
"                    isbd_finalize,
"
"                    isbd_hist_flag,
"
"                    isbd_tdc,
"
"                    isbd_uts,
"
"                    isbd_ys,
"
"                    isbd_hrb,
"
"                    isbd_elo,
"
"                    isbd_old_sys_ls_no,
"
"                    isbd_old_lot_no,
"
"                    isbd_old_ser_no,
"
"                    isbd_tip_color_id,
"
"                    isbd_oth_uom_qty,
"
"                    isbd_mfg_date,
"
"                    isbd_cre_by,
"
"                    isbd_cre_date,
"
"                    isbd_no_of_bale,
"
"                    isbd_batch_no,
"
"                    isbd_no_of_yarn,
"
"                    isbd_stk_trans_qty
"
"                       )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    r_ls(indx).rls_seq_no,
"
"                    v_seq_no,
"
"                    r_ls(indx).rls_qty,
"
"                    r_ls(indx).rls_lot_no,
"
"                    r_ls(indx).rls_ser_no,
"
"                    v_sou_id,
"
"                    v_sou_type,
"
"                    r_ls(indx).rls_expiry_date,--isbd_expiry_date,
"
"                    'Y',--isbd_ins_rec,
"
"                    0,--isbd_trnf_acpt_qty,
"
"                    0,--isbd_trnf_rtn_qty,
"
"                    0,--isbd_trnf_tot_acpt_qty,
"
"                    0,--isbd_trnf_tot_rtn_qty,
"
"                    'N',--isbd_upd_uc_ap_rq_flag,
"
"                    'N',--isbd_upd_uc_ap_cp_flag,
"
"                    0,--isbd_rtn_proc_qty,
"
"                    0,--isbd_rtn_inproc_qty,
"
"                    0,--isbd_rtn_qty,
"
"                    0,--isbd_excs_qty,
"
"                    0,--isbd_excs_rtn_qty,
"
"                    0,--isbd_excs_proc_qty,
"
"                    0,--isbd_excs_inproc_qty,
"
"                    'N',--isbd_excs_sel_flag,
"
"                    'N',--isbd_excs_sel_user,
"
"                    v_sys_ls_no,--isbd_sys_ls_no,
"
"                    0,--isbd_scrap_qty,
"
"                    0,--isbd_dis_ass_qty,
"
"                    0,--isbd_rtn_temp_qty,
"
"                    'Y',--isbd_finalize,
"
"                    'N',--isbd_hist_flag,
"
"                    NULL,--isbd_tdc,
"
"                    NULL,--isbd_uts,
"
"                    NULL,--isbd_ys,
"
"                    NULL,--isbd_hrb,
"
"                    NULL,--isbd_elo,
"
"                    NULL,--isbd_old_sys_ls_no,
"
"                    NULL,--isbd_old_lot_no,
"
"                    NULL,--isbd_old_ser_no,
"
"                    NULL,--isbd_tip_color_id,
"
"                    0,--isbd_oth_uom_qty,
"
"                    r_ls(indx).rls_mfg_date,
"
"                    p_user,
"
"                    SYSDATE,
"
"                    0,--isbd_no_of_bale,
"
"                    v_batch_no,--isbd_batch_no,
"
"                    0, --isbd_no_of_yarn,
"
"                    r_ls(indx).rls_qty
"
"                       );
"
"
"
"  END LOOP;
"
"  Commit;
"
"END proc_ins_ls_frm_mi;
"
"
"
"PROCEDURE proc_ins_addr_amc_warranty(p_bu               business_units.bu_id%TYPE,
"
"                     p_plnt               warr_amc_agrmnt_hd.waah_plnt%TYPE,
"
"                         p_doc_no        warr_amc_agrmnt_hd.waah_doc_no%TYPE,
"
"                         p_file_name        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                         p_user             warr_amc_agrmnt_hd.waah_cre_by%TYPE
"
"                         )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_city_id    VARCHAR2(10);
"
"v_state_id    VARCHAR2(10);
"
"v_cntry_id    VARCHAR2(10);
"
"v_seq_no    NUMBER;
"
"
"
"
"
"TYPE typ_ins_gpi IS RECORD (AM_TYPE        VARCHAR2(1),
"
"                            AM_MACHN        VARCHAR2(25),
"
"                            AM_MACHN_NAME    VARCHAR2(150),
"
"                AM_SER_NO        VARCHAR2(30),
"
"                AM_REF              VARCHAR2(500),
"
"                            AM_ADDR1         VARCHAR2(50),
"
"                            AM_ADDR2         VARCHAR2(50),
"
"                            AM_ADDR3         VARCHAR2(50),
"
"                            AM_POSTAL_CODE     VARCHAR2(25),
"
"                            AM_CITY         VARCHAR2(50),
"
"                            AM_STATE         VARCHAR2(50),
"
"                            AM_CNTRY         VARCHAR2(50),
"
"                            AM_TELE         VARCHAR2(30),
"
"                            AM_MOBILE         VARCHAR2(30),
"
"                            AM_EMAIL         VARCHAR2(30));
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"       v_sql := 'CREATE TABLE SCM_MIGRATION(AM_TYPE        VARCHAR2(1),
"
"                                        AM_MACHN        VARCHAR2(25),
"
"                                        AM_MACHN_NAME    VARCHAR2(150),
"
"                        AM_SER_NO        VARCHAR2(30),
"
"                        AM_REF              VARCHAR2(500),
"
"                        AM_ADDR1         VARCHAR2(50),
"
"                        AM_ADDR2         VARCHAR2(50),
"
"                        AM_ADDR3         VARCHAR2(50),
"
"                        AM_POSTAL_CODE     VARCHAR2(25),
"
"                        AM_CITY         VARCHAR2(50),
"
"                        AM_STATE         VARCHAR2(50),
"
"                        AM_CNTRY         VARCHAR2(50),
"
"                        AM_TELE         VARCHAR2(30),
"
"                        AM_MOBILE         VARCHAR2(30),
"
"                        AM_EMAIL         VARCHAR2(30))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(AM_TYPE        CHAR(255),
"
" AM_MACHN        CHAR(255),
"
" AM_MACHN_NAME        CHAR(255),
"
" AM_SER_NO        CHAR(255),
"
" AM_REF                 CHAR(500),
"
" AM_ADDR1         CHAR(255),
"
" AM_ADDR2         CHAR(255),
"
" AM_ADDR3         CHAR(255),
"
" AM_POSTAL_CODE     CHAR(255),
"
" AM_CITY         CHAR(255),
"
" AM_STATE         CHAR(255),
"
" AM_CNTRY         CHAR(255),
"
" AM_TELE         CHAR(255),
"
" AM_MOBILE         CHAR(255),
"
" AM_EMAIL         CHAR(255))
"
" )
"
"LOCATION ('''||p_file_name||''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
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
"  DELETE FROM warr_amc_agrmnt_mchn
"
"   WHERE waam_bu = p_bu
"
"     AND waam_plnt = p_plnt
"
"     AND waam_doc_no = p_doc_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"  BEGIN
"
"       SELECT city_id
"
"         INTO v_city_id
"
"            FROM cities
"
"           WHERE city_name1 = UPPER(TRIM(cr_st(indx).am_city));
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_city_id := NULL;
"
"
"
"  END;
"
"
"
"  BEGIN
"
"       SELECT state_id
"
"         INTO v_state_id
"
"            FROM states
"
"           WHERE state_name1 = UPPER(TRIM(cr_st(indx).am_state));
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_state_id := NULL;
"
"
"
"  END;
"
"
"
"  BEGIN
"
"       SELECT cntry_id
"
"         INTO v_cntry_id
"
"            FROM countries
"
"           WHERE cntry_name1 = UPPER(TRIM(cr_st(indx).am_cntry));
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_cntry_id := NULL;
"
"
"
"  END;
"
"
"
"  SELECT NVL(MAX(waam_seq_no),0) + 1
"
"    INTO v_seq_no
"
"    FROM warr_amc_agrmnt_mchn
"
"   WHERE waam_bu = p_bu
"
"     AND waam_plnt = p_plnt
"
"     AND waam_doc_no = p_doc_no;
"
"
"
"
"
"  INSERT INTO warr_amc_agrmnt_mchn(waam_bu,waam_plnt,waam_doc_no,waam_seq_no,waam_type,
"
"              waam_prod_id,waam_prod_rev,waam_prod_desc,waam_serial_no,waam_ref,
"
"                waam_addr1,waam_addr2,waam_addr3,waam_postal_code,
"
"                waam_city,waam_state,waam_cntry,
"
"                waam_tele,waam_email,waam_mobno,
"
"                waam_cre_by,waam_cre_date)
"
"       VALUES(p_bu,p_plnt,p_doc_no,v_seq_no,cr_st(indx).am_type,
"
"              cr_st(indx).am_machn,0,cr_st(indx).am_machn_name,cr_st(indx).am_ser_no,cr_st(indx).am_ref,
"
"              cr_st(indx).am_addr1,cr_st(indx).am_addr2,cr_st(indx).am_addr3,cr_st(indx).am_postal_code,
"
"              v_city_id,v_state_id,v_cntry_id,
"
"              cr_st(indx).am_tele,cr_st(indx).am_email,cr_st(indx).am_mobile,
"
"              p_user,SYSDATE);
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_addr_amc_warranty;
"
"
"
"/*PROCEDURE proc_ins_feed_price(p_bu     VARCHAR2,
"
"                              p_doc_no    VARCHAR2,
"
"                              p_doc_rev    NUMBER,
"
"                  p_fname    VARCHAR2,
"
"                  p_sep    VARCHAR2,
"
"                  p_user    VARCHAR2
"
"                  )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(FP_PROD_ID VARCHAR2(100),FP_STATE_CODE VARCHAR2(5),
"
"FP_EX_FACT NUMBER,FP_DELIVERY NUMBER,FP_DEPOT NUMBER)
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(FP_PROD_ID CHAR(255),FP_STATE_CODE CHAR(255),
"
"FP_EX_FACT CHAR(255),FP_DELIVERY CHAR(255),FP_DEPOT CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE afm_feed_price_ln
"
"   WHERE afpl_bu = p_bu
"
"     AND afpl_doc_no = p_doc_no
"
"     AND afpl_doc_rev = p_doc_rev;
"
"
"
"  v_sql := 'INSERT INTO afm_feed_price_ln(afpl_bu,afpl_doc_no,afpl_doc_rev,afpl_seq_no,
"
"            afpl_prod_id,afpl_prod_rev,afpl_state_code,afpl_tn_exf_price,afpl_tn_dlv_price,
"
"            afpl_tn_dpt_price,afpl_cre_by,afpl_cre_date)
"
"              SELECT '''||p_bu||''','''||p_doc_no||''','''||p_doc_rev||''',ROWNUM,
"
"              fp_prod_id,'''||0||''',fp_state_code,fp_ex_fact,fp_delivery,fp_depot,
"
"              '''||p_user||''',SYSDATE
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_feed_price;
"
"
"
"PROCEDURE proc_ins_feed_disc(p_bu     VARCHAR2,
"
"                 p_doc_no    VARCHAR2,
"
"                 p_doc_rev    NUMBER,
"
"                 p_fname    VARCHAR2,
"
"                 p_sep    VARCHAR2,
"
"                 p_user    VARCHAR2
"
"                 )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
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
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(FP_CUST_ID VARCHAR2(10),FP_BG_DISC NUMBER,
"
"FP_NON_BG NUMBER,FP_APPL_DISC NUMBER,FP_PART_INC NUMBER,FP_BAL_CNT NUMBER)
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(FP_CUST_ID CHAR(255),FP_BG_DISC CHAR(255),
"
"FP_NON_BG CHAR(255),FP_APPL_DISC CHAR(255),FP_PART_INC CHAR(255),FP_BAL_CNT CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE afm_feed_disc_ln
"
"   WHERE afdl_bu = p_bu
"
"     AND afdl_doc_no = p_doc_no
"
"     AND afdl_doc_rev = p_doc_rev;
"
"
"
"  v_sql := 'INSERT INTO afm_feed_disc_ln(afdl_bu,afdl_doc_no,afdl_doc_rev,afdl_seq_no,
"
"            afdl_cust_id,afdl_cash_carry_disc_bg,afdl_cash_carry_disc_nbg,afdl_appl_disc_amt,afdl_part_insc,
"
"            afdl_bal_cn,afdl_cre_by,afdl_cre_date)
"
"              SELECT '''||p_bu||''','''||p_doc_no||''','''||p_doc_rev||''',ROWNUM,
"
"              fp_cust_id,fp_bg_disc,fp_non_bg,fp_appl_disc,fp_part_inc,fp_bal_cnt,
"
"              '''||p_user||''',SYSDATE
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_feed_disc;*/
"
"
"
"/*PROCEDURE proc_ins_ord_review_mirg  (p_bu               business_units.bu_id%TYPE,
"
"                     p_plnt               sales_ord_check_list.socl_plnt_id%TYPE,
"
"                         p_doc_no        sales_ord_check_list.socl_doc_no%TYPE,
"
"                         p_file_name        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                         p_user             sales_ord_check_list.socl_cre_by%TYPE
"
"                         )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_mpn_no    VARCHAR2(10);
"
"v_mpn_id      VARCHAR2(10);
"
"v_seq_no    NUMBER;
"
"v_item_rev    NUMBER;
"
"
"
"TYPE typ_ins_gpi IS RECORD (AM_MFRT            VARCHAR2(30),
"
"                            AM_Qty        VARCHAR2(50),
"
"                            AM_Price        VARCHAR2(50),
"
"                            AM_ITEM        VARCHAR2(30),
"
"                AM_REV        NUMBER(5),
"
"                AM_UOM        VARCHAR2(30)
"
"                );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"       v_sql := 'CREATE TABLE SCM_MIGRATION(AM_MFRT            VARCHAR2(30),
"
"                        AM_Qty        NUMBER(20),
"
"                        AM_Price        NUMBER(20),
"
"                        AM_ITEM        VARCHAR2(30),
"
"                        AM_REV        NUMBER(5),
"
"                        AM_UOM        VARCHAR2(30)
"
"                        )
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(AM_MFRT    CHAR(255),
"
" AM_Qty        CHAR(255),
"
" AM_Price    CHAR(255),
"
" AM_ITEM    CHAR(255),
"
" AM_REV        CHAR(255),
"
" AM_UOM        CHAR(255))
"
" )
"
"LOCATION ('''||p_file_name||''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
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
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"  BEGIN
"
"    SELECT pm_mftr_id
"
"      INTO v_mpn_id
"
"      FROM prod_mftrs,
"
"           prod_mftr_asso
"
"     WHERE pm_bu = pma_bu
"
"       AND pm_mftr_id = pma_mftr_id
"
"       AND pm_bu = p_bu
"
"           AND pma_mftr_part_no = UPPER(TRIM(cr_st(indx).am_mfrt));
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_mpn_id := NULL;
"
"
"
"  END;
"
"
"
"
"
"  SELECT NVL(MAX(socln_seq_no),0) + 1
"
"    INTO v_seq_no
"
"    FROM sales_ord_check_list_ln
"
"   WHERE socln_bu = p_bu
"
"     AND socln_plnt = p_plnt
"
"     AND socln_doc_no = p_doc_no;
"
"
"
"  INSERT INTO sales_ord_check_list_ln(socln_bu,socln_plnt,socln_doc_no,socln_seq_no,
"
"              socln_prod_id,socln_prod_rev,socln_uom,socln_qty,
"
"                socln_prod_price,socln_mpn_no,socln_cre_by,socln_cre_date,socln_source_flag,socln_mftr_id)
"
"       VALUES(p_bu,p_plnt,p_doc_no,v_seq_no,
"
"              cr_st(indx).am_item,cr_st(indx).am_rev,cr_st(indx).am_uom,cr_st(indx).am_qty,
"
"              cr_st(indx).am_price,cr_st(indx).am_mfrt,p_user,SYSDATE,'M',v_mpn_id);
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_ord_review_mirg;*/
"
"--SO TARGET MIGRATION
"
"PROCEDURE proc_ins_so_target_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        SALE_VAL_CUST_PROD_TARGET.SVCT_CRE_BY%TYPE
"
"                     )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_exe_id    VARCHAR2(10);
"
"
"
"TYPE typ_ins_gpi IS RECORD (sm_year        NUMBER(6),
"
"                sm_period        NUMBER(2),
"
"                sm_plant        VARCHAR2(10),
"
"                sm_cust_id        VARCHAR2(10),
"
"                            sm_prod_id       VARCHAR2(100),
"
"                            sm_prod_rev         NUMBER(5),
"
"                            sm_tar_qty         NUMBER(12,3),
"
"                            sm_tar_val         NUMBER(12,3)
"
"                            );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"       v_sql := 'CREATE TABLE SCM_MIGRATION(sm_year        NUMBER(6),
"
"                                sm_period        NUMBER(2),
"
"                                sm_plant        VARCHAR2(10),
"
"                                sm_cust_id        VARCHAR2(10),
"
"                                            sm_prod_id       VARCHAR2(100),
"
"                                            sm_prod_rev         NUMBER(5),
"
"                                            sm_tar_qty         NUMBER(12,3),
"
"                                            sm_tar_val         NUMBER(12,3))
"
"              ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"              DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"              ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"              SKIP 1
"
"              FIELDS TERMINATED BY '''||p_sep||'''
"
"              MISSING FIELD VALUES ARE NULL
"
"              REJECT ROWS WITH ALL NULL FIELDS
"
"                        (sm_year            CHAR(255),
"
"                         sm_period            CHAR(255),
"
"                         sm_plant            CHAR(255),
"
"                         sm_cust_id            CHAR(255),
"
"                         sm_prod_id       CHAR(255),
"
"                         sm_prod_rev      CHAR(255),
"
"                         sm_tar_qty     CHAR(255),
"
"                         sm_tar_val     CHAR(255))
"
"                         )
"
"                           LOCATION ('''||p_fname||''')
"
"                                ) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
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
"  /*FOR DELETE TABLE */
"
"   /*DELETE sale_val_cust_prod_target
"
"    WHERE svct_bu = p_bu; */
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"  --Raise_Application_Error(-20999,'HRM'||'1/'||v_sql);
"
"  INSERT INTO sale_val_cust_prod_target(svct_bu,
"
"                                        svct_year,
"
"                                        svct_period,
"
"                                        svct_plnt,
"
"                                        svct_cust_id,
"
"                                        svct_prod_id,
"
"                                        svct_prod_rev,
"
"                                        svct_tar_qty,
"
"                                        svct_tar_val,
"
"                                        svct_cre_by,
"
"                                        svct_cre_date)
"
"                                  VALUES(p_bu,
"
"                                         cr_st(indx).sm_year,
"
"                                         cr_st(indx).sm_period,
"
"                                         cr_st(indx).sm_plant,
"
"                                         cr_st(indx).sm_cust_id,
"
"                                         cr_st(indx).sm_prod_id,
"
"                                         cr_st(indx).sm_prod_rev,--cr_st(indx).sm_cust_item ,
"
"                                         cr_st(indx).sm_tar_qty,
"
"                                         cr_st(indx).sm_tar_val,
"
"                                         p_user,
"
"                                         SYSDATE);
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_so_target_mig;
"
"
"
"/*Customer  Schedule  Migration*/
"
"
"
"
"
"PROCEDURE proc_ins_cust_schld_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_plnt     bus_unit_plants.bup_plant_id%TYPE,
"
"                     p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        cust_order_hd.cohd_cre_by%TYPE,
"
"                     p_res           OUT VARCHAR2
"
"                     )
"
"AS
"
"
"
"v_sql                VARCHAR2(4000);
"
"v_fpath                VARCHAR2(200);
"
"v_exe_id            VARCHAR2(10);
"
"v_doc_no             NUMBER(15);
"
"v_prod_price_basis      VARCHAR2(20);
"
"v_prod_cls            VARCHAR2(20);
"
"v_sales_cls             VARCHAR2(20);
"
"v_prod_sub_cls          VARCHAR2(20);
"
"v_prod_store_id         VARCHAR2(20);
"
"v_sal_area              VARCHAR2(20);
"
"v_sub_terr              VARCHAR2(20);
"
"v_sal_person            VARCHAR2(20);
"
"v_sal_terr_id           VARCHAR2(20);
"
"v_currency              VARCHAR2(20);
"
"v_prod_drw_no         VARCHAR2(25);
"
"v_prod_drw_rev         VARCHAR2(5);
"
"v_prod_uom         VARCHAR2(5);
"
"v_ref               VARCHAR2(4000);
"
"v_exp_seq_no        NUMBER;
"
"v_cnt            NUMBER;
"
"v_cnt1            NUMBER;
"
"v_cust_prod_id    VARCHAR2(100);
"
"v_cust_prod_desc    VARCHAR2(150);
"
"v_price_basis    cust_prod.custp_price_basis%TYPE;
"
"v_sales_area    suppliers.suplr_sales_area%TYPE;
"
"v_price        NUMBER;
"
"v_mprice    NUMBER;
"
"v_disc        NUMBER;
"
"v_cmn_price      NUMBER;
"
"v_cmn_disc      NUMBER;
"
"v_catalog_no    VARCHAR2(30);
"
"v_contr_no    VARCHAR2(30);
"
"v_amd_no    NUMBER;
"
"v_amd_date    DATE;
"
"v_sale_uom    VARCHAR2(5);
"
"v_po_no        VARCHAR2(30);
"
"v_po_date    DATE;
"
"v_po_ref    VARCHAR2(100);
"
"v_po_seq_no    NUMBER(5);
"
"v_tax_set_id    VARCHAR2(10);
"
"v_tcf_id    VARCHAR2(10);
"
"v_last_amd_no    NUMBER(5);
"
"v_seq_no    NUMBER(5) := 0;
"
"v_conv_factor    NUMBER(15,8);
"
"v_sub_seq_no    NUMBER;
"
"v_cm_seq_no    NUMBER;
"
"v_cls_id        VARCHAR2 (10);
"
"v_cust_item_req    VARCHAR2(1);
"
"v_sales_price_cls    VARCHAR2(10);
"
"v_loc_id1    VARCHAR2(10);
"
"v_gst_exempt_flag    VARCHAR2(1);
"
"v_gst_types_of_supply    VARCHAR2(1);
"
"v_hsn_code        VARCHAR2(25);
"
"v_man_hsn_code      VARCHAR2(25);
"
"v_shipto_loc_id        VARCHAR2(10);
"
"v_shipto_loc_name    VARCHAR2(100);
"
"v_shipto_addr1        VARCHAR2(100);
"
"v_shipto_addr2        VARCHAR2(100);
"
"v_shipto_addr3        VARCHAR2(100);
"
"v_shipto_addr4        VARCHAR2(100);
"
"v_shipto_addr5          VARCHAR2(100);
"
"v_shipto_bref_addr      VARCHAR2(500);
"
"v_shipto_postal_code    VARCHAR2(15);
"
"v_shipto_city        VARCHAR2(5);
"
"v_shipto_state         VARCHAR2(5);
"
"v_shipto_cntry         VARCHAR2(5);
"
"v_shipto_po_box     VARCHAR2(15);
"
"v_shipto_tele         VARCHAR2(30);
"
"v_shipto_mobile        VARCHAR2(30);
"
"v_shipto_fax         VARCHAR2(30);
"
"v_shipto_email         VARCHAR2(50);
"
"v_shipto_website     VARCHAR2(50);
"
"v_shipto_dist         NUMBER(30);
"
"v_shipto_gst_no     VARCHAR2(15);
"
"v_ref1          VARCHAR2(50);
"
"v_ref2             VARCHAR2(50);
"
"v_billto_loc_id     VARCHAR2(10);
"
"v_billto_loc_name     VARCHAR2(100);
"
"v_billto_addr1          VARCHAR2(100);
"
"v_billto_addr2         VARCHAR2(100);
"
"v_billto_addr3         VARCHAR2(100);
"
"v_billto_bref_addr      VARCHAR2(500);
"
"v_billto_postal_code    VARCHAR2(15);
"
"v_billto_city         VARCHAR2(5);
"
"v_billto_state      VARCHAR2(5);
"
"v_billto_cntry      VARCHAR2(5);
"
"v_billto_po_box      VARCHAR2(15);
"
"v_billto_tele         VARCHAR2(30);
"
"v_billto_mobile        VARCHAR2(30);
"
"v_billto_fax         VARCHAR2(30);
"
"v_billto_email      VARCHAR2(50);
"
"v_billto_website    VARCHAR2(50);
"
"v_billto_ref1       VARCHAR2(50);
"
"v_billto_ref2         VARCHAR2(50);
"
"v_billto_gst_no     VARCHAR2(15);
"
"v_ssl_type    VARCHAR2(15);
"
"v_ssl_gst_type    VARCHAR2(15);
"
"v_gst_cnt NUMBER;
"
"v_billto_ut_cnt NUMBER;
"
"v_gst_cust_type VARCHAR2(1);
"
"v_price_basis            cust_prod.custp_price_basis%TYPE;
"
"v_billfrm_plant_id    VARCHAR2(20);
"
"v_billfrm_name1        VARCHAR2(100);
"
"v_billfrm_addr1        VARCHAR2(100);
"
"v_billfrm_addr2        VARCHAR2(100);
"
"v_billfrm_addr3        VARCHAR2(100);
"
"v_billfrm_po_box    VARCHAR2(20);
"
"v_billfrm_city        VARCHAR2(20);
"
"v_billfrm_state        VARCHAR2(20);
"
"v_billfrm_country    VARCHAR2(20);
"
"v_billfrm_zip        VARCHAR2(20);
"
"v_billfrm_tele1        VARCHAR2(20);
"
"v_billfrm_fax1        VARCHAR2(50);
"
"v_billfrm_email1    VARCHAR2(50);
"
"v_billfrm_website1    VARCHAR2(50);
"
"v_billfrm_gst_no        VARCHAR2(50);
"
"v_billfrm_state_code    VARCHAR2(20);
"
"v_shipfrm_plant_id    VARCHAR2(20);
"
"v_shipfrm_name1        VARCHAR2(100);
"
"v_shipfrm_addr1        VARCHAR2(100);
"
"v_shipfrm_addr2        VARCHAR2(100);
"
"v_shipfrm_addr3        VARCHAR2(100);
"
"v_shipfrm_po_box    VARCHAR2(20);
"
"v_shipfrm_city        VARCHAR2(20);
"
"v_shipfrm_state        VARCHAR2(20);
"
"v_shipfrm_country    VARCHAR2(20);
"
"v_shipfrm_zip        VARCHAR2(20);
"
"v_shipfrm_tele1        VARCHAR2(20);
"
"v_shipfrm_fax1        VARCHAR2(50);
"
"v_shipfrm_email1    VARCHAR2(50);
"
"v_shipfrm_website1    VARCHAR2(50);
"
"v_shipfrm_gst_no        VARCHAR2(50);
"
"v_shipfrm_state_code    VARCHAR2(20);
"
"--v_hsn_code                VARCHAR2(20);
"
"v_order_date            DATE;
"
"v_plnt_loc_id        VARCHAR2(50);
"
"--v_gst_exempt_flag        VARCHAR2(1);
"
"--v_gst_types_of_supply    VARCHAR2(1);
"
"v_tax_pct                NUMBER(5,2);
"
"v_cgst_pct                NUMBER(5,2);
"
"v_sgst_pct                NUMBER(5,2);
"
"v_utgst_pct                NUMBER(5,2);
"
"v_cess_pct                NUMBER(5,2);
"
"v_igst_amt                NUMBER(15,2);
"
"v_cgst_amt                NUMBER(15,2);
"
"v_sgst_amt                NUMBER(15,2);
"
"v_utgst_amt                NUMBER(15,2);
"
"v_cess_amt                NUMBER(15,2);
"
"v_disc_amt                NUMBER(17,5);
"
"v_tot_disc_amt            NUMBER(17,5);
"
"v_type                    VARCHAR2(1);
"
"v_ship_store_id              VARCHAR2(10);
"
"v_tolr_pct                  NUMBER;
"
"v_tac_rqrd_flag              VARCHAR2(1);
"
"v_is_num_flag              VARCHAR2(1) := 'N';
"
"v_cess_rate                  NUMBER;
"
"
"
"
"
"TYPE typ_ins_gpi IS RECORD (sm_cust_id             VARCHAR2(100),
"
"                            sm_prod_id             VARCHAR2(100),
"
"                            sm_prod_rev            NUMBER(5),
"
"                            sm_prod_uom            VARCHAR2(15),
"
"                            sm_firm_qty            VARCHAR2(15),--NUMBER(12,3),
"
"                            sm_tend_qty            VARCHAR2(15),--NUMBER(12,3),
"
"                            sm_price               VARCHAR2(15),--NUMBER (15,5),
"
"                sm_disc_pct           VARCHAR2(15),
"
"                            sm_sch_frm_start_date  DATE,
"
"                            sm_sch_frm_end_date    DATE,
"
"                            sm_freq_type           VARCHAR2(1),
"
"                            sm_sch_tnt_start_date  DATE,
"
"                            sm_sch_tnt_end_date    DATE,
"
"                            sm_tnt_freq_type       VARCHAR2(1),
"
"                            sm_hsn_code            VARCHAR2(25),
"
"                sm_po_no           VARCHAR2(30),
"
"                sm_po_date           DATE
"
"                            );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"
"
"p_res := 'N';
"
"
"
"  DELETE cust_order_mah_mig_excep
"
"   WHERE comme_bu = p_bu
"
"     AND comme_plnt = p_plnt
"
"     AND comme_batch_no = p_batch_no;
"
"
"
"  DELETE
"
"    FROM cust_order_addr
"
"   WHERE coa_bu = p_bu
"
"     AND coa_plnt = p_plnt
"
"     AND coa_batch_no = p_batch_no;
"
"
"
"  DELETE
"
"    FROM cust_order_schd
"
"   WHERE cos_bu = p_bu
"
"     AND cos_plnt = p_plnt
"
"     AND cos_batch_no = p_batch_no;
"
"
"
"  DELETE cust_order_ln
"
"   WHERE coln_bu = p_bu
"
"     AND coln_plnt = p_plnt
"
"     AND coln_batch_no = p_batch_no;
"
"
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"        v_sql := 'CREATE TABLE SCM_MIGRATION(sm_cust_id             VARCHAR2(100),
"
"                                             sm_prod_id             VARCHAR2(100),
"
"                                             sm_prod_rev            NUMBER(5),
"
"                                             sm_prod_uom            VARCHAR2(15),
"
"                                             sm_firm_qty            VARCHAR2(15),--NUMBER(12,3),
"
"                                             sm_tend_qty            VARCHAR2(15),--NUMBER(12,3),
"
"                                             sm_price               VARCHAR2(15),--NUMBER (15,5),
"
"                                             sm_disc_pct            VARCHAR2(15),
"
"                                             sm_sch_frm_start_date  DATE,
"
"                                             sm_sch_frm_end_date    DATE,
"
"                                             sm_freq_type           VARCHAR2(1),
"
"                                             sm_sch_tnt_start_date  DATE,
"
"                                             sm_sch_tnt_end_date    DATE,
"
"                                             sm_tnt_freq_type       VARCHAR2(1),
"
"                                             sm_hsn_code            VARCHAR2(25),
"
"                         sm_po_no            VARCHAR2(30),
"
"                         sm_po_date            DATE
"
"                         )
"
"                       ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                       SKIP 1
"
"                       FIELDS TERMINATED BY '''||p_sep||'''
"
"                       MISSING FIELD VALUES ARE NULL
"
"                       REJECT ROWS WITH ALL NULL FIELDS(sm_cust_id         CHAR(255),
"
"                                                        sm_prod_id         CHAR(255),
"
"                                                        sm_prod_rev        CHAR(255),
"
"                                                        sm_prod_uom        CHAR(255),
"
"                                                        sm_firm_qty        CHAR(255),
"
"                                                        sm_tend_qty        CHAR(255),
"
"                                                        sm_price           CHAR(255),
"
"                                                        sm_disc_pct           CHAR(255),
"
"                                                        sm_sch_frm_start_date     CHAR(255),
"
"                                                        sm_sch_frm_end_date       CHAR(255),
"
"                                                        sm_freq_type              CHAR(255),
"
"                                                        sm_sch_tnt_start_date     CHAR(255),
"
"                                                        sm_sch_tnt_end_date       CHAR(255),
"
"                                                        sm_tnt_freq_type          CHAR(255),
"
"                                                        sm_hsn_code                  CHAR(255),
"
"                            sm_po_no          CHAR(255),
"
"                            sm_po_date              CHAR(255)
"
"                            )
"
"                                                       )LOCATION ('''||p_fname||''')
"
"                                                      ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"  BEGIN
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
"   DELETE cust_order_ln
"
"    WHERE coln_bu = p_bu
"
"      AND coln_plnt = p_plnt
"
"      AND coln_batch_no = p_batch_no;
"
"    --Raise_Application_Error(-20999,'HRM'||'~'||indx||'~'||p_bu||'~'||p_plnt||'~'||cr_st(indx).sm_prod_id||'~'||cr_st(indx).sm_cust_id||'-'||cr_st(indx).sm_tend_qty||'-'||cr_st(indx).sm_firm_qty);
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    v_ref := NULL;
"
"    BEGIN
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_firm_qty);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Firm Qty.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_tend_qty);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Tent. Qty.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_price);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Price.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_disc_pct);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Disc. %'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END;
"
"
"
"      IF LENGTH(cr_st(indx).sm_firm_qty) > 9 THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Firm Qty.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF LENGTH(cr_st(indx).sm_tend_qty) > 9 THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Tent. Qty.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF LENGTH(cr_st(indx).sm_price) > 10 THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Price.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF LENGTH(cr_st(indx).sm_disc_pct) > 3 THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Disc. %'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF cr_st(indx).sm_disc_pct > 99 THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Disc. %'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF cr_st(indx).sm_sch_tnt_start_date BETWEEN cr_st(indx).sm_sch_frm_start_date AND cr_st(indx).sm_sch_frm_end_date THEN
"
"        v_ref := v_ref|| ' , ' || 'Tentative start date should not in between firm date'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF cr_st(indx).sm_sch_tnt_start_date > cr_st(indx).sm_sch_tnt_end_date THEN
"
"        v_ref := v_ref|| ' , ' || 'Tentative start date should be less than To date'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF cr_st(indx).sm_freq_type IS NULL THEN
"
"        v_ref := v_ref|| ' , ' || 'Firm Type must be entered'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"
"
"      IF cr_st(indx).sm_freq_type IS NULL THEN
"
"        v_ref := v_ref|| ' , ' || 'Tentative type must be entered.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"
"
"      IF v_is_num_flag = 'N' THEN
"
"
"
"        IF (TO_NUMBER(cr_st(indx).sm_firm_qty) = 0 AND TO_NUMBER(cr_st(indx).sm_tend_qty) = 0) THEN
"
"          v_ref := v_ref|| ' , ' || 'Quantity should be greater than 0.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"        END IF;
"
"
"
"        IF  ((cr_st(indx).sm_firm_qty - FLOOR(cr_st(indx).sm_firm_qty))) <> TRUNC(((cr_st(indx).sm_firm_qty - FLOOR(cr_st(indx).sm_firm_qty))),2) THEN
"
"            v_ref := v_ref|| ' , ' || 'Invalid Firm Qty.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"        END IF;
"
"
"
"        IF  ((cr_st(indx).sm_tend_qty - FLOOR(cr_st(indx).sm_tend_qty))) <> TRUNC(((cr_st(indx).sm_tend_qty - FLOOR(cr_st(indx).sm_tend_qty))),2) THEN
"
"            v_ref := v_ref|| ' , ' || 'Invalid Tent. Qty.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"        END IF;
"
"
"
"        IF  ((cr_st(indx).sm_price - FLOOR(cr_st(indx).sm_price))) <> TRUNC(((cr_st(indx).sm_price - FLOOR(cr_st(indx).sm_price))),2) THEN
"
"            v_ref := v_ref|| ' , ' || 'Invalid Price.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"        END IF;
"
"
"
"        IF  ((cr_st(indx).sm_disc_pct - FLOOR(cr_st(indx).sm_disc_pct))) <> TRUNC(((cr_st(indx).sm_disc_pct - FLOOR(cr_st(indx).sm_disc_pct))),2) THEN
"
"            v_ref := v_ref|| ' , ' || 'Invalid Disc. %'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"        END IF;
"
"
"
"      END IF;
"
"
"
"      IF NVL(cr_st(indx).sm_firm_qty,0) > 0 AND (cr_st(indx).sm_sch_frm_start_date IS NULL OR cr_st(indx).sm_sch_frm_end_date IS NULL) THEN
"
"        v_ref := v_ref|| ' , ' || 'Firm Schedule Date should not be null.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      IF NVL(cr_st(indx).sm_tend_qty,0) > 0 AND (cr_st(indx).sm_sch_tnt_start_date IS NULL OR cr_st(indx).sm_sch_tnt_end_date IS NULL) THEN
"
"        v_ref := v_ref|| ' , ' || 'Tent. Schedule Date should not be null.'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev;
"
"      END IF;
"
"
"
"      SELECT NVL(MAX(TO_NUMBER(coln_doc_no)),0)+1 INTO v_doc_no
"
"        FROM cust_order_ln
"
"       WHERE coln_bu = p_bu
"
"         AND coln_plnt = p_plnt;
"
"
"
"        BEGIN
"
"         SELECT prodplnt_cls ,
"
"               prodplnt_sub_cls,
"
"               prodplnt_ship_store_id
"
"          INTO v_prod_cls ,
"
"               v_prod_sub_cls ,
"
"               v_prod_store_id
"
"          FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"           AND prodplnt_plnt = p_plnt
"
"           AND prodplnt_prod_id = cr_st(indx).sm_prod_id
"
"           AND prodplnt_prod_rev = cr_st(indx).sm_prod_rev
"
"           AND prodplnt_status ='A' ;
"
"        EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_ref := v_ref|| ' , ' || cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev || '- Item not defined in the unit.';
"
"          --Raise_Application_Error(-20267,'ICM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id);
"
"        END;
"
"
"
"      BEGIN
"
"      SELECT cohd_date,cohd_plnt_loc_id
"
"        INTO v_order_date,v_plnt_loc_id
"
"        FROM cust_order_hd
"
"       WHERE cohd_bu = p_bu
"
"         AND cohd_plnt = p_plnt
"
"         AND cohd_batch_no =  p_batch_no;
"
"      END;
"
"
"
"    BEGIN
"
"      SELECT custp_price_basis,
"
"             custp_hsn_code,
"
"             custp_cust_prod_id,
"
"             custp_cust_prod_desc
"
"            INTO v_prod_price_basis,
"
"                 v_hsn_code,
"
"                 v_cust_prod_id,
"
"                 v_cust_prod_desc
"
"      FROM (
"
"          SELECT suplr_sales_price_source  custp_price_basis,
"
"                 prod_hsn_code custp_hsn_code,
"
"                 NULL custp_cust_prod_id,
"
"                 NULL custp_cust_prod_desc
"
"            FROM products,
"
"                 prod_plants,
"
"                 suppliers
"
"           WHERE prod_bu = prodplnt_bu
"
"             AND prod_id = prodplnt_prod_id
"
"             AND prod_rev = prodplnt_prod_rev
"
"             AND prod_status = 'A'
"
"             AND prod_saleable = 'Y'
"
"             AND prodplnt_status = 'A'
"
"             AND prodplnt_cust_asso = 'N'
"
"             AND prod_bu = suplr_bu
"
"             AND prod_bu = p_bu
"
"             AND prodplnt_plnt = p_plnt
"
"             AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"             AND prod_id = cr_st(indx).sm_prod_id
"
"             AND suplr_status = 'A'
"
"          UNION ALL
"
"          SELECT custp_price_basis,
"
"                 custp_hsn_code,
"
"                 custp_cust_prod_id,
"
"                 custp_cust_prod_desc
"
"            FROM products,
"
"                 prod_plants,
"
"                 suppliers,
"
"                 cust_prod
"
"           WHERE prod_bu = prodplnt_bu
"
"             AND prod_id = prodplnt_prod_id
"
"             AND prod_rev = prodplnt_prod_rev
"
"             AND prod_status = 'A'
"
"             AND prod_saleable = 'Y'
"
"             AND prodplnt_status = 'A'
"
"             AND prodplnt_cust_asso = 'Y'
"
"             AND custp_type = 'S'
"
"             AND prod_bu = suplr_bu
"
"             AND custp_bu = prod_bu
"
"             AND custp_prod_id = prod_id
"
"             AND custp_prod_rev = prod_rev
"
"             AND custp_prod_flag = 'Y'
"
"             AND prod_bu = p_bu
"
"             AND prodplnt_plnt = p_plnt
"
"             AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"             AND custp_cust_id = cr_st(indx).sm_cust_id
"
"             AND prod_id = cr_st(indx).sm_prod_id
"
"             AND suplr_status = 'A');
"
"
"
"        EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_ref := v_ref|| ' , ' || cr_st(indx).sm_cust_id ||'~'||cr_st(indx).sm_prod_id || '- Item not found.';
"
"        END;
"
"
"
"
"
"        BEGIN
"
"           SELECT suplr_sales_area,
"
"                  suplr_sales_person,
"
"                  suplr_sales_terr,
"
"                  suplr_sub_terr_id,
"
"                  suplr_currency
"
"             INTO v_sal_area ,
"
"                  v_sal_person ,
"
"                  v_sal_terr_id ,
"
"                  v_sub_terr,
"
"                  v_currency
"
"             FROM suppliers
"
"            WHERE suplr_bu =p_bu
"
"              AND suplr_suplr_id =cr_st(indx).sm_cust_id
"
"              AND suplr_status ='A'
"
"              --AND suplr_party_type = 'C'
"
"              AND suplr_mode_sal = 'Y';
"
"         EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"           v_ref := v_ref|| ' , ' ||cr_st(indx).sm_cust_id || '- Customer details not found.';
"
"           --Raise_Application_Error(-20191,'ADM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_cust_id);
"
"         END;
"
"
"
"         IF cr_st(indx).sm_hsn_code IS NULL AND v_hsn_code IS NULL THEN
"
"           v_ref := v_ref|| ' , ' || '- HSN code must be entered.';
"
"         END IF;
"
"
"
"         IF cr_st(indx).sm_hsn_code IS NOT NULL THEN
"
"           BEGIN
"
"             SELECT DISTINCT hstr_hsnsac_code
"
"               INTO v_man_hsn_code
"
"               FROM gst_hsn_codes, hsn_sac_tax_rates
"
"              WHERE hstr_bu = p_bu
"
"                AND ghc_hsn_code = hstr_hsnsac_code
"
"                AND hstr_status = 'A'
"
"                AND hstr_hsnsac_code = cr_st(indx).sm_hsn_code;
"
"           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             v_ref := v_ref|| ' , ' || '- HSN code not found.'||'/'||cr_st(indx).sm_hsn_code;
"
"           END;
"
"         END IF;
"
"
"
"         BEGIN
"
"           SELECT tolr_pct
"
"             INTO v_tolr_pct
"
"             FROM (
"
"           SELECT coqt_tolr_pct tolr_pct
"
"             FROM cust_prod,
"
"                  cust_ord_qty_tolr,
"
"                     products,
"
"                     prod_plants
"
"            WHERE custp_bu = coqt_bu
"
"              AND custp_prod_id = coqt_prod_id
"
"              AND custp_prod_rev = coqt_prod_rev
"
"              AND custp_cust_id = coqt_cust_id
"
"              AND (NVL(cr_st(indx).sm_firm_qty,cr_st(indx).sm_tend_qty) BETWEEN coqt_qty_from AND coqt_qty_to)
"
"              AND prod_bu = p_bu
"
"              AND prod_id = cr_st(indx).sm_prod_id
"
"              AND prod_rev = cr_st(indx).sm_prod_rev
"
"              AND prod_bu = prodplnt_bu
"
"              AND prod_id = prodplnt_prod_id
"
"              AND prod_rev = prodplnt_prod_rev
"
"              AND prodplnt_plnt = p_plnt
"
"              AND prod_saleable = 'Y'
"
"              AND prod_status = 'A'
"
"              AND custp_bu = prod_bu
"
"              AND custp_prod_id = prod_id
"
"              AND custp_prod_rev = prod_rev
"
"              AND custp_cust_id = cr_st(indx).sm_cust_id
"
"              AND prodplnt_cust_asso = 'Y'
"
"            UNION ALL
"
"            SELECT prodplnt_tolr_pct tolr_pct
"
"             FROM products,
"
"                  prod_plants
"
"            WHERE prod_bu = prodplnt_bu
"
"              AND prod_id = prodplnt_prod_id
"
"              AND prod_rev = prodplnt_prod_rev
"
"              AND prod_status = 'A'
"
"              AND prod_saleable = 'Y'
"
"              AND prodplnt_status = 'A'
"
"              AND prodplnt_cust_asso = 'N'
"
"              AND prod_bu = p_bu
"
"              AND prodplnt_plnt = p_plnt
"
"              AND prod_id = cr_st(indx).sm_prod_id
"
"              AND prod_rev = cr_st(indx).sm_prod_rev);
"
"         EXCEPTION WHEN NO_DATA_FOUND THEN
"
"           v_tolr_pct := 0;
"
"         END;
"
"
"
"
"
"         BEGIN
"
"           SELECT NVL(prod_cust_drg_no,0),
"
"                  NVL(prod_cust_drg_rev,0),
"
"                  prod_uom
"
"             INTO v_prod_drw_no,
"
"                  v_prod_drw_rev,
"
"                  v_prod_uom
"
"             FROM products
"
"            WHERE prod_bu = p_bu
"
"              AND prod_id = cr_st(indx).sm_prod_id
"
"              AND prod_rev = NVL(cr_st(indx).sm_prod_rev,0)
"
"              AND prod_status = 'A';
"
"         EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"           v_ref := v_ref|| ' , ' ||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev|| '- Drawing details does not exists.';
"
"           --Raise_Application_Error(-20041,'PLN'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id||'~'||cr_st(indx).sm_prod_rev);
"
"         END;
"
"
"
"         IF v_prod_uom <> NVL(cr_st(indx).sm_prod_uom,v_prod_uom) THEN
"
"           BEGIN
"
"              SELECT uompcf_conv_factor
"
"                INTO v_conv_factor
"
"                 FROM uom_prod_conv_factors
"
"                WHERE uompcf_bu = p_bu
"
"                  AND uompcf_prod_id = cr_st(indx).sm_prod_id
"
"                  AND uompcf_prod_rev = NVL(cr_st(indx).sm_prod_rev,0)
"
"                  AND uompcf_prod_uom = v_prod_uom
"
"                  AND uompcf_uom_to = NVL(cr_st(indx).sm_prod_uom,v_prod_uom);
"
"           EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             v_ref := v_ref|| ' , ' ||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev|| '- UOM Conversion not defined.'||'~'||v_prod_uom||'~'||NVL(cr_st(indx).sm_prod_uom,v_prod_uom);
"
"           END;
"
"         END IF;
"
"
"
"         BEGIN
"
"           SELECT ppl_ship_store_id
"
"             INTO v_ship_store_id
"
"             FROM prod_plants_loc
"
"            WHERE ppl_bu = p_bu
"
"              AND ppl_plnt = p_plnt
"
"              AND ppl_plnt_loc_id = v_plnt_loc_id
"
"              AND ppl_prod_id = cr_st(indx).sm_prod_id
"
"              AND ppl_prod_rev = cr_st(indx).sm_prod_rev;
"
"         EXCEPTION WHEN NO_DATA_FOUND THEN
"
"           v_ref := v_ref||' , ' ||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev||    '-Default department for item does not exist.';
"
"         END;
"
"
"
"         BEGIN
"
"          SELECT spc_class_id
"
"            INTO v_sales_cls
"
"            FROM sales_price_classes
"
"           WHERE spc_bu = p_bu
"
"             AND spc_sel_flag = 'Y';
"
"         EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"           v_sales_cls := NULL;
"
"         END;
"
"
"
"     BEGIN
"
"         SELECT ssl_loc_name1,
"
"        ssl_addr1,
"
"        ssl_addr2,
"
"        ssl_addr3,
"
"        ssl_zip,
"
"        ssl_city,
"
"        ssl_state,
"
"        ssl_country,
"
"        ssl_po_box,
"
"        ssl_tele,
"
"        ssl_mob_no,
"
"        ssl_fax,
"
"        ssl_email,
"
"        ssl_website,
"
"        ssl_ref1,
"
"        ssl_ref2,
"
"        ssl_gst_no,
"
"    (CASE WHEN ssl_type = 'M' THEN 'E' ELSE ssl_type END) ssl_type,
"
"    ssl_gst_type
"
"           INTO  v_billto_loc_name,
"
"        v_billto_addr1,
"
"        v_billto_addr2,
"
"        v_billto_addr3,
"
"        v_billto_postal_code,
"
"        v_billto_city,
"
"        v_billto_state,
"
"        v_billto_cntry,
"
"        v_billto_po_box,
"
"        v_billto_tele,
"
"        v_billto_mobile,
"
"        v_billto_fax,
"
"        v_billto_email,
"
"        v_billto_website,
"
"        v_billto_ref1,
"
"        v_billto_ref2,
"
"        v_billto_gst_no,
"
"    v_ssl_type,
"
"    v_ssl_gst_type
"
"           FROM suplr_ship_loc
"
"          WHERE ssl_bu = p_bu
"
"            AND ssl_suplr_id = cr_st(indx).sm_cust_id
"
"            AND ssl_dflt_flg IN ('D','B');
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_billto_loc_id        := NULL;
"
"      v_billto_loc_name        := NULL;
"
"      v_billto_addr1         := NULL;
"
"      v_billto_addr2         := NULL;
"
"      v_billto_addr3         := NULL;
"
"      v_billto_postal_code        := NULL;
"
"      v_billto_city         := NULL;
"
"      v_billto_state         := NULL;
"
"      v_billto_cntry         := NULL;
"
"      v_billto_po_box         := NULL;
"
"      v_billto_tele          := NULL;
"
"      v_billto_mobile         := NULL;
"
"      v_billto_fax          := NULL;
"
"      v_billto_email         := NULL;
"
"      v_billto_website         := NULL;
"
"      v_billto_ref1          := NULL;
"
"      v_billto_ref2          := NULL;
"
"      v_billto_gst_no        := NULL;
"
"      END;
"
"
"
"     BEGIN
"
"         SELECT  ssl_loc_name1,
"
"        ssl_addr1,
"
"        ssl_addr2,
"
"        ssl_addr3,
"
"        ssl_zip,
"
"        ssl_city,
"
"        ssl_state,
"
"        ssl_country,
"
"        ssl_po_box,
"
"        ssl_tele,
"
"        ssl_mob_no,
"
"        ssl_fax,
"
"        ssl_email,
"
"        ssl_website,
"
"        ssl_gst_no,
"
"        ssl_ref1,
"
"        ssl_ref2,
"
"        ssl_type
"
"           INTO v_shipto_loc_name,
"
"        v_shipto_addr1,
"
"        v_shipto_addr2,
"
"        v_shipto_addr3,
"
"        v_shipto_postal_code,
"
"        v_shipto_city,
"
"        v_shipto_state,
"
"        v_shipto_cntry,
"
"        v_shipto_po_box,
"
"        v_shipto_tele,
"
"        v_shipto_mobile,
"
"        v_shipto_fax,
"
"        v_shipto_email,
"
"        v_shipto_website,
"
"        v_shipto_gst_no,
"
"        v_ref1,
"
"        v_ref2,
"
"        v_type
"
"           FROM suplr_ship_loc
"
"          WHERE ssl_bu = p_bu
"
"            AND ssl_suplr_id = cr_st(indx).sm_cust_id
"
"            AND ssl_dflt_flg IN ('D','S')
"
"            AND ROWNUM = 1;
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_shipto_loc_id        := NULL;
"
"     v_shipto_loc_name        := NULL;
"
"     v_shipto_addr1         := NULL;
"
"     v_shipto_addr2         := NULL;
"
"     v_shipto_addr3        := NULL;
"
"     v_shipto_addr4        := NULL;
"
"     v_shipto_addr5         := NULL;
"
"     v_shipto_bref_addr     := NULL;
"
"     v_shipto_postal_code    := NULL;
"
"     v_shipto_city        := NULL;
"
"     v_shipto_state        := NULL;
"
"     v_shipto_cntry        := NULL;
"
"     v_shipto_po_box         := NULL;
"
"     v_shipto_tele           := NULL;
"
"     v_shipto_mobile        := NULL;
"
"     v_shipto_fax           := NULL;
"
"     v_shipto_email         := NULL;
"
"     v_shipto_website        := NULL;
"
"     v_shipto_dist           := NULL;
"
"     v_shipto_gst_no         := NULL;
"
"     v_ref1                := NULL;
"
"     v_ref2            := NULL;
"
"     v_shipto_dist        := 0;
"
"  END;
"
"
"
"BEGIN
"
" SELECT bup_plant_id,
"
"    bup_name1,
"
"    bup_addr1,
"
"    bup_addr2,
"
"    bup_addr3,
"
"    bup_po_box,
"
"    bup_city,
"
"    bup_state,
"
"    bup_country,
"
"    bup_zip,
"
"    bup_tele1,
"
"    bup_fax1,
"
"    bup_email1,
"
"    bup_website1,
"
"    bup_gst_no,
"
"    state_code
"
"   INTO v_billfrm_plant_id,
"
"    v_billfrm_name1,
"
"    v_billfrm_addr1,
"
"    v_billfrm_addr2,
"
"    v_billfrm_addr3,
"
"    v_billfrm_po_box,
"
"    v_billfrm_city,
"
"    v_billfrm_state,
"
"    v_billfrm_country,
"
"    v_billfrm_zip,
"
"    v_billfrm_tele1,
"
"    v_billfrm_fax1,
"
"    v_billfrm_email1,
"
"    v_billfrm_website1,
"
"    v_billfrm_gst_no,
"
"    v_billfrm_state_code
"
"   FROM bus_unit_plants,states
"
"  WHERE bup_bu = p_bu
"
"    AND bup_bu = state_bu
"
"    AND bup_state = state_id
"
"    AND bup_plant_id = p_plnt;
"
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_billfrm_plant_id  := NULL;
"
"    v_billfrm_name1      := NULL;
"
"    v_billfrm_addr1      := NULL;
"
"    v_billfrm_addr2      := NULL;
"
"    v_billfrm_addr3      := NULL;
"
"    v_billfrm_po_box  := NULL;
"
"    v_billfrm_city  := NULL;
"
"    v_billfrm_state  := NULL;
"
"    v_billfrm_country  := NULL;
"
"    v_billfrm_zip      := NULL;
"
"    v_billfrm_tele1  := NULL;
"
"    v_billfrm_fax1      := NULL;
"
"    v_billfrm_email1  := NULL;
"
"    v_billfrm_website1  := NULL;
"
"    v_billfrm_gst_no  := NULL;
"
"    v_billfrm_state_code  := NULL;
"
"END;
"
"
"
"BEGIN
"
" SELECT bupld_loc_id,
"
"    bupld_loc_name,
"
"    bupld_addr1,
"
"    bupld_addr2,
"
"    bupld_addr3,
"
"    bupld_city,
"
"    bupld_state,
"
"    bupld_country,
"
"    bupld_gst_no,
"
"    bupld_po_box,
"
"    bupld_zip,
"
"    bupld_tele1,
"
"    NULL bup_fax1,
"
"    bupld_email1,
"
"    bupld_website1,
"
"    state_code
"
"   INTO v_shipfrm_plant_id,
"
"    v_shipfrm_name1,
"
"    v_shipfrm_addr1,
"
"    v_shipfrm_addr2    ,
"
"    v_shipfrm_addr3,
"
"    v_shipfrm_city,
"
"    v_shipfrm_state,
"
"    v_shipfrm_country,
"
"    v_shipfrm_gst_no,
"
"    v_shipfrm_po_box,
"
"    v_shipfrm_zip,
"
"    v_shipfrm_tele1,
"
"    v_shipfrm_fax1,
"
"    v_shipfrm_email1,
"
"    v_shipfrm_website1,
"
"    v_shipfrm_state_code
"
"   FROM bus_unit_plants_loc_dtls,states
"
"  WHERE bupld_bu  = p_bu
"
"    AND bupld_plnt = p_plnt
"
"    AND bupld_bu = state_bu
"
"    AND bupld_state = state_id
"
"    AND bupld_dflt_loc_flag = 'Y';
"
" EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_shipfrm_plant_id := NULL;
"
"    v_shipfrm_name1 := NULL;
"
"    v_shipfrm_addr1 := NULL;
"
"    v_shipfrm_addr2     := NULL;
"
"    v_shipfrm_addr3 := NULL;
"
"    v_shipfrm_city := NULL;
"
"    v_shipfrm_state := NULL;
"
"    v_shipfrm_country := NULL;
"
"    v_shipfrm_gst_no := NULL;
"
"    v_shipfrm_po_box := NULL;
"
"    v_shipfrm_zip := NULL;
"
"    v_shipfrm_tele1 := NULL;
"
"    v_shipfrm_fax1 := NULL;
"
"    v_shipfrm_email1 := NULL;
"
"    v_shipfrm_website1 := NULL;
"
"    v_shipfrm_state_code := NULL;
"
" END;
"
"
"
"          IF v_prod_price_basis <> 'U' THEN
"
"            proc_find_sales_price_mig1(p_bu,
"
"                                      p_plnt,
"
"                                      cr_st(indx).sm_cust_id,
"
"                                      v_sales_area,
"
"                                      v_sales_cls,
"
"                                      cr_st(indx).sm_prod_id,
"
"                                      cr_st(indx).sm_prod_rev,
"
"                                      cr_st(indx).sm_firm_qty,
"
"                                      TRUNC(SYSDATE),
"
"                                      v_prod_price_basis,
"
"                                      NVL(cr_st(indx).sm_prod_uom,v_prod_uom),
"
"                                      NULL,
"
"                                      v_ship_store_id,
"
"                                      'S',
"
"                                      v_price,
"
"                                      v_mprice,
"
"                                      v_disc,
"
"                                      v_catalog_no,
"
"                                      v_contr_no,
"
"                                      v_amd_no,
"
"                                      v_amd_date,
"
"                                      v_po_no,
"
"                                      v_po_date,
"
"                                      v_po_ref,
"
"                                      v_po_seq_no,
"
"                                      v_tax_set_id,
"
"                                      v_tcf_id,
"
"                                      v_last_amd_no,
"
"                                      p_currency => v_currency,
"
"                      p_plnt_loc_id => v_plnt_loc_id,
"
"                      p_res => v_ref
"
"                         );
"
"
"
"              IF v_price = 0  OR v_price IS NULL THEN
"
"                    v_ref := v_ref|| ' , ' ||cr_st(indx).sm_cust_id||'~'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev|| '- Price not defined.';
"
"              END IF;
"
"            ELSE
"
"              v_price := cr_st(indx).sm_price;
"
"              v_disc  := cr_st(indx).sm_disc_pct;
"
"      END IF;
"
"
"
"         /*v_cmn_price := CASE WHEN v_prod_price_basis = 'U'
"
"                                THEN cr_st(indx).sm_price
"
"                                ELSE v_price
"
"                                END;
"
"
"
"         v_cmn_disc := CASE WHEN v_prod_price_basis = 'U'
"
"                            THEN cr_st(indx).sm_disc_pct
"
"                            ELSE v_disc
"
"                             END;*/
"
"
"
"      IF cr_st(indx).sm_disc_pct IS NULL AND v_prod_price_basis = 'U' THEN
"
"        v_ref := v_ref|| ' , ' ||cr_st(indx).sm_cust_id||'~'||cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev|| '- Disc. % not defined.';
"
"      END IF;
"
"
"
"    IF v_ref IS NOT NULL THEN
"
"
"
"      SELECT NVL(MAX(comme_seq_no),0) + 1
"
"        INTO v_exp_seq_no
"
"        FROM cust_order_mah_mig_excep
"
"       WHERE comme_bu = p_bu
"
"         AND comme_plnt = p_plnt
"
"         AND comme_batch_no = p_batch_no;
"
"
"
"      INSERT INTO cust_order_mah_mig_excep(comme_bu,
"
"                                           comme_plnt,
"
"                                           comme_batch_no,
"
"                                           comme_seq_no,
"
"                                           comme_reference,
"
"                                           comme_cre_by,
"
"                                           comme_cre_date,
"
"                                           comme_cre_ip_addr,
"
"                                           comme_cre_os_user,
"
"                                           comme_cre_emp_id
"
"                                          )
"
"                                   VALUES(p_bu,
"
"                                          p_plnt,
"
"                                          p_batch_no,
"
"                                          v_exp_seq_no,
"
"                                          LTRIM(v_ref,','),
"
"                                          p_user,
"
"                                          SYSDATE,
"
"                                          Audit_Info.Get_IP_Address,
"
"                                          Audit_Info.Get_OS_User,
"
"                                          func_find_emp_id(p_bu,p_user)
"
"                                          );
"
"      /*INSERT INTO cust_order_ln_exception(cole_bu,
"
"                                          cole_plnt,
"
"                                          cole_doc_no,
"
"                                          cole_seq_no,
"
"                                          cole_exp_ref,
"
"                                          cole_cre_by,
"
"                                          cole_cre_date
"
"                                          )
"
"                                   VALUES(p_bu,
"
"                                          p_plnt,
"
"                                          p_batch_no,
"
"                                          v_exp_seq_no,
"
"                                          v_ref,
"
"                                          p_user,
"
"                                          SYSDATE
"
"                                          );*/
"
"      --v_ref := NULL;
"
"    END IF;
"
"
"
" --EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"   --Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id||'~'||cr_st(indx).sm_cust_id);
"
" END;
"
"
"
" BEGIN
"
" SELECT COUNT(wcln_date)
"
"  INTO v_cnt
"
"  FROM(SELECT wcln_date
"
"    FROM(SELECT wcln_date
"
"       FROM workday_calendar_hd,
"
"            workday_calendar_ln
"
"      WHERE wchd_bu = wcln_bu
"
"        AND wchd_plnt = wcln_plnt
"
"        AND wchd_clndr_no = wcln_clndr_no
"
"        AND wchd_bu = p_bu
"
"        AND wchd_plnt = p_plnt
"
"        AND wchd_status = 'A'
"
"        AND (wcln_date BETWEEN cr_st(indx).sm_sch_frm_start_date AND cr_st(indx).sm_sch_frm_end_date))
"
"                ORDER BY wcln_date)
"
"        WHERE TO_CHAR(wcln_date,'DY') NOT IN (SELECT sun_flag
"
"                           FROM(SELECT DECODE(SUPLR_SUN_FLAG,'Y','SUN') sun_flag
"
"                              FROM suppliers
"
"                             WHERE suplr_bu = p_bu
"
"                               AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                              AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                              SELECT DECODE(SUPLR_MON_FLAG,'Y','MON') mon_flag
"
"                                FROM suppliers
"
"                               WHERE suplr_bu = p_bu
"
"                             AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                            AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                              SELECT  DECODE(SUPLR_tue_flag,'Y','TUE') tue_flag
"
"                                FROM  suppliers
"
"                               WHERE  suplr_bu = p_bu
"
"                             AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                               SELECT  DECODE(SUPLR_wed_flag,'Y','WED') wed_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                               SELECT   DECODE(SUPLR_THU_FLAG,'Y','THU') thu_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                               SELECT   DECODE(SUPLR_FRI_FLAG,'Y','FRI') fri_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C'
"
"                               UNION ALL
"
"                               SELECT  DECODE(SUPLR_SAT_FLAG,'Y','SAT') sat_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C')
"
"        WHERE sun_flag IS NOT NULL);
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_cnt := 1;
"
"END;
"
"
"
"
"
"BEGIN
"
" SELECT COUNT(wcln_date)
"
"  INTO v_cnt1
"
"  FROM(SELECT wcln_date
"
"    FROM(SELECT wcln_date
"
"       FROM workday_calendar_hd,
"
"            workday_calendar_ln
"
"      WHERE wchd_bu = wcln_bu
"
"        AND wchd_plnt = wcln_plnt
"
"        AND wchd_clndr_no = wcln_clndr_no
"
"        AND wchd_bu = p_bu
"
"        AND wchd_plnt = p_plnt
"
"        AND wchd_status = 'A'
"
"        AND (wcln_date BETWEEN cr_st(indx).sm_sch_tnt_start_date AND cr_st(indx).sm_sch_tnt_end_date))
"
"        ORDER BY wcln_date)
"
"        WHERE TO_CHAR(wcln_date,'DY') NOT IN (SELECT sun_flag
"
"                           FROM(SELECT DECODE(SUPLR_SUN_FLAG,'Y','SUN') sun_flag
"
"                              FROM suppliers
"
"                             WHERE suplr_bu = p_bu
"
"                               AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                              AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                              SELECT DECODE(SUPLR_MON_FLAG,'Y','MON') mon_flag
"
"                                FROM suppliers
"
"                               WHERE suplr_bu = p_bu
"
"                             AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                            AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                              SELECT  DECODE(SUPLR_tue_flag,'Y','TUE') tue_flag
"
"                                FROM  suppliers
"
"                               WHERE  suplr_bu = p_bu
"
"                             AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                                                        AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                               SELECT  DECODE(SUPLR_wed_flag,'Y','WED') wed_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                                                         AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                               SELECT   DECODE(SUPLR_THU_FLAG,'Y','THU') thu_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C'
"
"                              UNION ALL
"
"                               SELECT   DECODE(SUPLR_FRI_FLAG,'Y','FRI') fri_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C'
"
"                               UNION ALL
"
"                               SELECT  DECODE(SUPLR_SAT_FLAG,'Y','SAT') sat_flag
"
"                             FROM suppliers
"
"                                WHERE suplr_bu = p_bu
"
"                              AND suplr_suplr_id = cr_st(indx).sm_cust_id
"
"                             AND suplr_party_type = 'C')
"
"        WHERE sun_flag IS NOT NULL);
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_cnt1 := 1;
"
"END;
"
"
"
"    IF v_ref IS NULL THEN
"
"
"
"      BEGIN
"
"      SELECT prod_gst_exempt_flag,prod_gst_types_of_supply
"
"        INTO v_gst_exempt_flag, v_gst_types_of_supply
"
"        FROM products
"
"       WHERE prod_bu = p_bu
"
"         AND prod_id = cr_st(indx).sm_prod_id
"
"         AND prod_rev = cr_st(indx).sm_prod_rev
"
"         AND prod_status = 'A';
"
"      END;
"
"
"
"      v_tot_disc_amt := NVL(((NVL(cr_st(indx).sm_firm_qty,0) * NVL(v_price,0)) * (NVL(v_disc,0)/100)),0);
"
"
"
"        IF v_billto_state = v_billfrm_state THEN
"
"         v_gst_cnt:=1;
"
"        ELSE
"
"         v_gst_cnt := 0;
"
"        END IF;
"
"        BEGIN
"
"        SELECT COUNT(*)
"
"        INTO v_billto_ut_cnt
"
"        FROM states
"
"        WHERE state_id = v_billfrm_state
"
"        AND state_bu = p_bu
"
"        AND state_type = 'Y';
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        v_billto_ut_cnt := 0;
"
"        END;
"
"        IF v_ssl_type IN ('E','B','S','X','D') THEN
"
"        v_gst_cust_type := v_ssl_type;
"
"        ELSE
"
"        IF v_gst_cnt = 1 THEN
"
"        IF v_billto_ut_cnt = 0 THEN
"
"        v_gst_cust_type := 'L';
"
"        ELSE
"
"         v_gst_cust_type := 'U';
"
"        END IF;
"
"        ELSE
"
"        v_gst_cust_type := 'I';
"
"        END IF;
"
"        END IF;
"
"
"
"      IF v_hsn_code IS NOT NULL OR cr_st(indx).sm_hsn_code IS NOT NULL THEN
"
"
"
"        proc_get_hsn_tax_pct(p_bu,
"
"                             NVL(cr_st(indx).sm_hsn_code,v_hsn_code),
"
"                             v_order_date,
"
"                             v_gst_cust_type,
"
"                             v_gst_types_of_supply,
"
"                             v_gst_exempt_flag,
"
"                             NVL(cr_st(indx).sm_firm_qty,0),
"
"                             ((NVL(cr_st(indx).sm_firm_qty,0) * NVL(v_price,0)) - v_tot_disc_amt),
"
"                             v_tax_pct,
"
"                             v_cgst_pct,
"
"                             v_sgst_pct,
"
"                             v_utgst_pct,
"
"                             v_cess_pct,
"
"                             v_cess_rate,
"
"                             v_igst_amt,
"
"                             v_cgst_amt,
"
"                             v_sgst_amt,
"
"                             v_utgst_amt,
"
"                             v_cess_amt
"
"                             );
"
"      END IF;
"
"
"
"
"
"    INSERT INTO cust_order_ln (coln_bu,
"
"                               coln_plnt,
"
"                               coln_ref_unit,
"
"                               coln_batch_no,
"
"                               coln_doc_no,
"
"                               coln_doc_rev,
"
"                               coln_cust_id,
"
"                               coln_firm_type,
"
"                               coln_prod_id,
"
"                               coln_prod_rev,
"
"                               coln_order_qty,
"
"                               coln_schd_start_date,
"
"                               coln_schd_end_date,
"
"                               coln_freq_type,
"
"                               coln_freq,
"
"                               coln_schd_frm_start_date,
"
"                               coln_schd_frm_end_date,
"
"                               coln_frm_freq_type,
"
"                               coln_frm_freq,
"
"                               coln_frm_qty,
"
"                               coln_price,
"
"                               coln_disc_pct,
"
"                               coln_prod_uom,
"
"                               coln_sale_uom,
"
"                               coln_conv_factor,
"
"                               coln_amend_flag,
"
"                               coln_price_basis,
"
"                               coln_class_id,
"
"                               coln_store_id,
"
"                               coln_status,
"
"                               coln_backlog_qty,
"
"                               coln_type,
"
"                               coln_sales_area,
"
"                               coln_sub_terr_id,
"
"                               coln_sales_person,
"
"                               coln_cre_by,
"
"                               coln_cre_date,
"
"                               coln_sal_teri_id,
"
"                               coln_mrp_price,
"
"                               coln_tolr_pct,
"
"                               coln_tcf_id,
"
"                               coln_last_amd_no,
"
"                               coln_hold_flag,
"
"                               coln_un_hold_flag,
"
"                               coln_so_sel_flag,
"
"                               coln_proc_qty,
"
"                               coln_so_qty,
"
"                               coln_currency,
"
"                               coln_exchange_rate,
"
"                               coln_act_frm_qty,
"
"                               coln_act_tent_qty,
"
"                               coln_tac_rqrd_flag,
"
"                               coln_drw_no,
"
"                               coln_drw_rev,
"
"                               coln_spl_disc_amt,
"
"                               coln_cash_disc_amt,
"
"                               coln_contract_no,
"
"                               coln_catalog_no,
"
"                               coln_tax_pct,
"
"                               coln_igst_amt,
"
"                               coln_sgst_amt,
"
"                               coln_cgst_amt,
"
"                               coln_utgst_amt,
"
"                               coln_cess_pct,
"
"                               coln_cess_amt,
"
"                               coln_cgst_pct,
"
"                               coln_sgst_pct,
"
"                               coln_utgst_pct,
"
"                               coln_hsn_code,
"
"                               coln_cust_prod_id,
"
"                               coln_cust_prod_desc,
"
"                   coln_disc_amt,
"
"                   coln_gst_cust_type,
"
"                   coln_gst_reg_type,
"
"                   coln_gst_input_type,
"
"                   coln_gst_exempt_flag,
"
"                   coln_po_no,
"
"                   coln_po_date
"
"                               )
"
"                       VALUES (p_bu,
"
"                               p_plnt,
"
"                               p_plnt,
"
"                               p_batch_no,
"
"                               v_doc_no,--max of doc no
"
"                               0,
"
"                               cr_st(indx).sm_cust_id,
"
"                               CASE WHEN (NVL(cr_st(indx).sm_firm_qty,0) > 0 AND NVL(cr_st(indx).sm_tend_qty,0) > 0) THEN 'FT'
"
"                        WHEN (NVL(cr_st(indx).sm_firm_qty,0) > 0 AND NVL(cr_st(indx).sm_tend_qty,0) = 0) THEN 'F'
"
"                    WHEN (NVL(cr_st(indx).sm_firm_qty,0) = 0 AND NVL(cr_st(indx).sm_tend_qty,0) > 0) THEN 'T'
"
"                    ELSE 'F'
"
"                   END,
"
"                               cr_st(indx).sm_prod_id,
"
"                               NVL(cr_st(indx).sm_prod_rev,0),
"
"                               NVL(cr_st(indx).sm_tend_qty,0),
"
"                               cr_st(indx).sm_sch_tnt_start_date,
"
"                               cr_st(indx).sm_sch_tnt_end_date,
"
"                               NVL(cr_st(indx).sm_tnt_freq_type,'M'),
"
"                               CASE WHEN cr_st(indx).sm_tnt_freq_type = 'D' THEN v_cnt1
"
"                    WHEN cr_st(indx).sm_tnt_freq_type = 'W' THEN CEIL(v_cnt1/7)
"
"                    WHEN cr_st(indx).sm_tnt_freq_type = 'F' THEN CEIL(v_cnt1/14)
"
"                    WHEN cr_st(indx).sm_tnt_freq_type = 'M' THEN CASE WHEN ROUND(MONTHS_BETWEEN(LAST_DAY(cr_st(indx).sm_sch_tnt_end_date),TRUNC(cr_st(indx).sm_sch_tnt_start_date,'MM'))) = 0 THEN 1
"
"                                                                                                  ELSE ROUND(MONTHS_BETWEEN(LAST_DAY(cr_st(indx).sm_sch_tnt_end_date),TRUNC(cr_st(indx).sm_sch_tnt_start_date,'MM')))
"
"                                                                                             END
"
"                               END,
"
"                               cr_st(indx).sm_sch_frm_start_date,
"
"                               cr_st(indx).sm_sch_frm_end_date,
"
"                               NVL(cr_st(indx).sm_freq_type,'M'),
"
"                               CASE WHEN cr_st(indx).sm_freq_type = 'D' THEN v_cnt
"
"                                    WHEN cr_st(indx).sm_freq_type = 'W' THEN CEIL(v_cnt/7)
"
"                                    WHEN cr_st(indx).sm_freq_type ='F' THEN CEIL(v_cnt/14)
"
"                                    WHEN cr_st(indx).sm_freq_type ='M' THEN CEIL(v_cnt/TO_NUMBER(TO_CHAR(LAST_DAY(cr_st(indx).sm_sch_frm_end_date),'DD')))
"
"                               END,
"
"                               NVL(cr_st(indx).sm_firm_qty,0),--firm_qty
"
"                               NVL(v_price,0),--price
"
"                               NVL(v_disc,0),
"
"                               v_prod_uom,
"
"                               NVL(cr_st(indx).sm_prod_uom,v_prod_uom),
"
"                               v_conv_factor,
"
"                               'N',
"
"                               v_prod_price_basis,
"
"                               v_sales_cls ,
"
"                               v_ship_store_id,
"
"                               'E',
"
"                               0,
"
"                               'SO',
"
"                               v_sal_area,
"
"                               v_sub_terr,
"
"                               v_sal_person ,
"
"                               p_user,
"
"                               SYSDATE,
"
"                               v_sal_terr_id ,
"
"                               NVL(v_price,0),
"
"                               v_tolr_pct,
"
"                               NULL,
"
"                               0,
"
"                               'N',
"
"                               'N',
"
"                               'N',
"
"                               0,
"
"                               0,
"
"                               v_currency,
"
"                               1,
"
"                               NVL(cr_st(indx).sm_firm_qty,0),
"
"                               NVL(cr_st(indx).sm_tend_qty,0),
"
"                               'N',
"
"                               v_prod_drw_no,
"
"                               v_prod_drw_rev,
"
"                               0,
"
"                               0,
"
"                               v_contr_no,
"
"                               NVL(v_contr_no,v_catalog_no),
"
"                               NVL(v_tax_pct,0),
"
"                               NVL(v_igst_amt,0),
"
"                               NVL(v_sgst_amt,0),
"
"                               NVL(v_cgst_amt,0),
"
"                               NVL(v_utgst_amt,0),
"
"                               NVL(v_cess_pct,0),
"
"                               NVL(v_cess_amt,0),
"
"                               NVL(v_cgst_pct,0),
"
"                               NVL(v_sgst_pct,0),
"
"                               NVL(v_utgst_pct,0),
"
"                               NVL(cr_st(indx).sm_hsn_code,v_hsn_code),
"
"                               v_cust_prod_id,
"
"                               v_cust_prod_desc,
"
"                               NVL(v_tot_disc_amt,0),
"
"                   v_gst_cust_type,
"
"                   v_ssl_gst_type,
"
"                   v_gst_types_of_supply,
"
"                   v_gst_exempt_flag,
"
"                   NVL(cr_st(indx).sm_po_no,v_po_no),
"
"                   NVL(cr_st(indx).sm_po_date,v_po_date)
"
"                               );
"
"
"
"
"
"    /*IF p_batch_no = 'CSI0/00084/25-26' THEN
"
"      IF cr_st(indx).sm_cust_id = '2003202501' AND cr_st(indx).sm_prod_id = 'FG-CS-40100' THEN
"
"        Raise_Application_Error(-20999,'TEST'||'/'||v_disc||'/'||cr_st(indx).sm_disc_pct||'/'||v_prod_price_basis);
"
"      END IF;
"
"    END IF;*/
"
"
"
"       /*DELETE cust_order_addr
"
"        WHERE coa_bu = p_bu
"
"          AND coa_plnt = p_plnt
"
"          AND coa_batch_no = p_batch_no
"
"          AND coa_doc_no = v_doc_no
"
"          AND coa_doc_rev = 0;*/
"
"
"
"            INSERT INTO cust_order_addr(coa_bu,
"
"                    coa_plnt,
"
"                    coa_batch_no,
"
"                    coa_doc_no,
"
"                    coa_doc_rev,
"
"                    --coa_shipto_loc_id,
"
"                    coa_shipto_loc_name,
"
"                    coa_shipto_addr1,
"
"                    coa_shipto_addr2,
"
"                    coa_shipto_addr3,
"
"                    coa_shipto_bref_addr,
"
"                    coa_shipto_postal_code,
"
"                    coa_shipto_city,
"
"                    coa_shipto_state,
"
"                    coa_shipto_cntry,
"
"                    coa_shipto_po_box,
"
"                    coa_shipto_tele,
"
"                    coa_shipto_mobile,
"
"                    coa_shipto_fax,
"
"                    coa_shipto_email,
"
"                    coa_shipto_website,
"
"                    coa_shipto_dist,
"
"                    coa_shipto_gst_no,
"
"                    --coa_billto_loc_id,
"
"                    coa_billto_loc_name,
"
"                    coa_billto_addr1,
"
"                    coa_billto_addr2,
"
"                    coa_billto_addr3,
"
"                    coa_billto_bref_addr,
"
"                    coa_billto_postal_code,
"
"                    coa_billto_city,
"
"                    coa_billto_state,
"
"                    coa_billto_cntry,
"
"                    coa_billto_po_box,
"
"                    coa_billto_tele,
"
"                    coa_billto_mobile,
"
"                    coa_billto_fax,
"
"                    coa_billto_email,
"
"                    coa_billto_website,
"
"                    coa_ref1,
"
"                    coa_ref2,
"
"                    coa_billto_gst_no,
"
"                    --coa_billfrm_loc_id,
"
"                    coa_billfrm_loc_name,
"
"                    coa_billfrm_addr1,
"
"                    coa_billfrm_addr2,
"
"                    coa_billfrm_addr3,
"
"                    coa_billfrm_city,
"
"                    coa_billfrm_state,
"
"                    coa_billfrm_cntry,
"
"                    coa_billfrm_postal_code,
"
"                    coa_billfrm_po_box,
"
"                    coa_billfrm_tele1,
"
"                    coa_billfrm_fax1,
"
"                    coa_billfrm_email1,
"
"                    coa_billfrm_website1,
"
"                    coa_billfrm_gst_no,
"
"                    coa_billfrm_state_code,
"
"                    --coa_shipfrm_loc_id,
"
"                    coa_shipfrm_loc_name,
"
"                    coa_shipfrm_addr1,
"
"                    coa_shipfrm_addr2,
"
"                    coa_shipfrm_addr3,
"
"                    coa_shipfrm_city,
"
"                    coa_shipfrm_state,
"
"                    coa_shipfrm_cntry,
"
"                    coa_shipfrm_postal_code,
"
"                    coa_shipfrm_po_box,
"
"                    coa_shipfrm_tele1,
"
"                    coa_shipfrm_fax1,
"
"                    coa_shipfrm_email1,
"
"                    coa_shipfrm_website1,
"
"                    coa_shipfrm_gst_no,
"
"                    coa_shipfrm_state_code,
"
"                    coa_cre_by,
"
"                    coa_cre_ip_addr,
"
"                    coa_cre_os_user,
"
"                    coa_cre_emp_id,
"
"                    coa_cre_date
"
"                    )
"
"                                     VALUES(p_bu,
"
"                                            p_plnt,
"
"                                            p_batch_no,
"
"                                            v_doc_no,
"
"                                            0,
"
"                        v_shipto_loc_name,
"
"                        v_shipto_addr1,
"
"                        v_shipto_addr2,
"
"                        v_shipto_addr3,
"
"                        v_shipto_bref_addr,
"
"                        v_shipto_postal_code,
"
"                        v_shipto_city,
"
"                        v_shipto_state,
"
"                        v_shipto_cntry,
"
"                        v_shipto_po_box,
"
"                        v_shipto_tele,
"
"                        v_shipto_mobile,
"
"                        v_shipto_fax,
"
"                        v_shipto_email,
"
"                        v_shipto_website,
"
"                        NVL(v_shipto_dist,0),
"
"                        v_shipto_gst_no,
"
"                        --v_billto_loc_id,
"
"                        v_billto_loc_name,
"
"                        v_billto_addr1,
"
"                        v_billto_addr2,
"
"                        v_billto_addr3,
"
"                        v_billto_bref_addr,
"
"                        v_billto_postal_code,
"
"                        v_billto_city,
"
"                        v_billto_state,
"
"                        v_billto_cntry,
"
"                        v_billto_po_box,
"
"                        v_billto_tele,
"
"                        v_billto_mobile,
"
"                        v_billto_fax,
"
"                        v_billto_email,
"
"                        v_billto_website,
"
"                        v_billto_ref1,
"
"                        v_billto_ref2,
"
"                        v_billto_gst_no,
"
"                    --v_billfrm_plant_id,
"
"                    v_billfrm_name1,
"
"                    v_billfrm_addr1,
"
"                    v_billfrm_addr2,
"
"                    v_billfrm_addr3,
"
"                    v_billfrm_city,
"
"                    v_billfrm_state,
"
"                    v_billfrm_country,
"
"                    v_billfrm_zip,
"
"                    v_billfrm_po_box,
"
"                    v_billfrm_tele1,
"
"                    v_billfrm_fax1,
"
"                    v_billfrm_email1,
"
"                    v_billfrm_website1,
"
"                    v_billfrm_gst_no,
"
"                    v_billfrm_state_code,
"
"                    --v_shipfrm_plant_id,
"
"                    v_shipfrm_name1,
"
"                    v_shipfrm_addr1,
"
"                    v_shipfrm_addr2,
"
"                    v_shipfrm_addr3,
"
"                    v_shipfrm_city,
"
"                    v_shipfrm_state,
"
"                    v_shipfrm_country,
"
"                    v_shipfrm_zip,
"
"                    v_shipfrm_po_box,
"
"                    v_shipfrm_tele1,
"
"                    v_shipfrm_fax1,
"
"                    v_shipfrm_email1,
"
"                    v_shipfrm_website1,
"
"                    v_shipfrm_gst_no,
"
"                    v_shipfrm_state_code,
"
"                        p_user,
"
"                        Audit_Info.Get_IP_Address,
"
"                        Audit_Info.Get_OS_User,
"
"                        func_find_emp_id(p_bu,p_user),
"
"                        SYSDATE
"
"                                        );
"
"
"
"     proc_upd_cust_schld_amt(p_bu,
"
"                                            p_plnt,
"
"                                            p_batch_no,
"
"                                            v_doc_no,
"
"                                            0);
"
"   END IF;
"
"
"
"
"
"   p_res := 'Y';
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"END proc_ins_cust_schld_mig;
"
"
"
"/* Customer Schedule Migration */
"
"
"
" PROCEDURE proc_ins_cust_schld_multi_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_plnt     bus_unit_plants.bup_plant_id%TYPE,
"
"                     p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                     p_cust_id     cust_order_hd.cohd_cust_id%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        cust_order_hd.cohd_cre_by%TYPE
"
"                     )
"
"AS
"
"
"
"CURSOR c_prod(c_prod        VARCHAR2,
"
"          c_prod_rev    NUMBER)
"
"    IS
"
"SELECT 1
"
"  FROM products
"
" WHERE prod_bu = p_bu
"
"   AND prod_id = c_prod
"
"   AND prod_rev = c_prod_rev
"
"   AND prod_status = 'A';
"
"
"
"CURSOR c_prod_uom(c_prod        VARCHAR2,
"
"              c_prod_rev        NUMBER,
"
"              c_uom            VARCHAR2)
"
"    IS
"
"SELECT 1
"
"  FROM products
"
" WHERE prod_bu = p_bu
"
"   AND prod_id = c_prod
"
"   AND prod_rev = c_prod_rev
"
"   AND prod_uom = c_uom
"
"   AND prod_status = 'A';
"
"
"
"CURSOR c_prod_plnt(c_prod_id        VARCHAR2,
"
"                   c_prod_rev        NUMBER
"
"                   )
"
"    IS
"
"SELECT *
"
"  FROM prod_plants
"
" WHERE prodplnt_bu = p_bu
"
"   AND prodplnt_plnt = p_plnt
"
"   AND prodplnt_prod_id = c_prod_id
"
"   AND prodplnt_prod_rev = c_prod_rev
"
"   AND prodplnt_status = 'A';
"
"
"
" CURSOR c_cust
"
"     IS
"
" SELECT *
"
"   FROM suppliers
"
"  WHERE suplr_bu = p_bu
"
"    AND suplr_suplr_id = p_cust_id
"
"    AND suplr_status ='A'
"
"    AND suplr_party_type = 'C';
"
"
"
" CURSOR c_bill(c_loc_name VARCHAR2)
"
"     IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = p_cust_id
"
"     AND ssl_loc_name1 = c_loc_name;
"
"
"
" CURSOR c_ship(c_loc_name VARCHAR2)
"
"     IS
"
"  SELECT *
"
"    FROM suplr_ship_loc
"
"   WHERE ssl_bu = p_bu
"
"     AND ssl_suplr_id = p_cust_id
"
"     AND ssl_loc_name1 = c_loc_name;
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_exe_id        VARCHAR2(10);
"
"v_doc_no         NUMBER(15);
"
"v_prod_price_basis     VARCHAR2(20);
"
"v_prod_cls        VARCHAR2(20);
"
"v_sales_cls         VARCHAR2(20);
"
"v_prod_sub_cls         VARCHAR2(20);
"
"v_prod_store_id        VARCHAR2(20);
"
"v_sal_area         VARCHAR2(20);
"
"v_sub_terr         VARCHAR2(20);
"
"v_sal_person        VARCHAR2(20);
"
"v_sal_terr_id         VARCHAR2(20);
"
"v_currency         VARCHAR2(20);
"
"v_plnt_loc_id        VARCHAR2(20);
"
"v_prod_drw_no         VARCHAR2(25);
"
"v_prod_drw_rev         VARCHAR2(5);
"
"v_prod_uom         VARCHAR2(5);
"
"v_prod_id        products.prod_id%TYPE;
"
"v_prod_rev        NUMBER(5);
"
"v_prod_desc        VARCHAR2(150);
"
"v_err_msg            VARCHAR2(4000);
"
"v_type            VARCHAR2(2);
"
"cr_prod            c_prod%ROWTYPE;
"
"cr_cust                c_cust%ROWTYPE;
"
"cr_prod_uom            c_prod_uom%ROWTYPE;
"
"cr_prod_plnt            c_prod_plnt%ROWTYPE;
"
"cr_bill                    c_bill%ROWTYPE;
"
"cr_ship                    c_ship%ROWTYPE;
"
"v_shipto_loc_name        VARCHAR2(50);
"
"v_shipto_addr1        VARCHAR2(100);
"
"v_shipto_addr2        VARCHAR2(50);
"
"v_shipto_addr3        VARCHAR2(50);
"
"v_shipto_addr4        VARCHAR2(50);
"
"v_shipto_addr5          VARCHAR2(50);
"
"v_shipto_bref_addr      VARCHAR2(500);
"
"v_shipto_postal_code    VARCHAR2(15);
"
"v_shipto_city        VARCHAR2(5);
"
"v_shipto_state         VARCHAR2(5);
"
"v_shipto_cntry         VARCHAR2(5);
"
"v_shipto_po_box     VARCHAR2(15);
"
"v_shipto_tele         VARCHAR2(30);
"
"v_shipto_mobile        VARCHAR2(30);
"
"v_shipto_fax         VARCHAR2(30);
"
"v_shipto_email         VARCHAR2(50);
"
"v_shipto_website     VARCHAR2(50);
"
"v_shipto_dist         NUMBER(30);
"
"v_shipto_gst_no     VARCHAR2(15);
"
"v_ref1          VARCHAR2(50);
"
"v_ref2             VARCHAR2(50);
"
"v_billto_loc_name    VARCHAR2(50);
"
"v_billto_addr1          VARCHAR2(50);
"
"v_billto_addr2         VARCHAR2(50);
"
"v_billto_addr3         VARCHAR2(50);
"
"v_billto_bref_addr      VARCHAR2(500);
"
"v_billto_postal_code    VARCHAR2(15);
"
"v_billto_city         VARCHAR2(5);
"
"v_billto_state      VARCHAR2(5);
"
"v_billto_cntry      VARCHAR2(5);
"
"v_billto_po_box      VARCHAR2(15);
"
"v_billto_tele         VARCHAR2(30);
"
"v_billto_mobile        VARCHAR2(30);
"
"v_billto_fax         VARCHAR2(30);
"
"v_billto_email      VARCHAR2(50);
"
"v_billto_website    VARCHAR2(50);
"
"v_billto_ref1       VARCHAR2(50);
"
"v_billto_ref2         VARCHAR2(50);
"
"v_billto_gst_no     VARCHAR2(15);
"
"v_cust_prod_id    cust_prod.custp_cust_prod_id%TYPE;
"
"v_price_basis    cust_prod.custp_price_basis%TYPE;
"
"v_sales_area    suppliers.suplr_sales_area%TYPE;
"
"v_price        NUMBER;
"
"v_mprice    NUMBER;
"
"v_disc        NUMBER;
"
"v_catalog_no    VARCHAR2(30);
"
"v_contr_no    VARCHAR2(30);
"
"v_amd_no    NUMBER;
"
"v_amd_date    DATE;
"
"v_sale_uom    VARCHAR2(5);
"
"v_po_no        VARCHAR2(30);
"
"v_po_date    DATE;
"
"v_po_ref    VARCHAR2(100);
"
"v_po_seq_no    NUMBER(5);
"
"v_tax_set_id    VARCHAR2(10);
"
"v_tcf_id    VARCHAR2(10);
"
"v_last_amd_no    NUMBER(5);
"
"v_seq_no    NUMBER(5) := 0;
"
"v_conv_factor    NUMBER(15,8);
"
"v_sub_seq_no    NUMBER;
"
"v_cm_seq_no    NUMBER;
"
"v_cls_id        VARCHAR2 (10);
"
"v_cust_item_req    VARCHAR2(1);
"
"v_sales_price_cls    VARCHAR2(10);
"
"v_loc_id1    VARCHAR2(10);
"
"v_gst_exempt_flag    VARCHAR2(1);
"
"v_gst_types_of_supply    VARCHAR2(1);
"
"v_hsn_code        VARCHAR2(25);
"
"
"
"TYPE typ_ins_gpi IS RECORD (sm_prod_id             VARCHAR2(100),
"
"                            sm_prod_rev            NUMBER(5),
"
"                            sm_prod_desc        VARCHAR2(150),
"
"                            sm_prod_uom            VARCHAR2(15),
"
"                            sm_firm_qty           NUMBER(12,3),
"
"                            sm_tend_qty         NUMBER(12,3),
"
"                            sm_price            NUMBER (15,5),
"
"                            sm_sch_frm_start_date     DATE,
"
"                            sm_sch_frm_end_date        DATE,
"
"                            sm_freq_type        VARCHAR2(1),
"
"                            sm_sch_ten_start_date     DATE,
"
"                            sm_sch_ten_end_date        DATE,
"
"                            sm_ten_freq_type        VARCHAR2(1),
"
"                            sm_cust_po_no        VARCHAR2(100),
"
"                            sm_cust_po_date        DATE,
"
"                            sm_schld_mode        VARCHAR2(2),
"
"                            sm_bill_loc_name        VARCHAR2(100),
"
"                            sm_ship_loc_name        VARCHAR2(100)
"
"                           );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"  --raise_application_error(-20999,'HRM'||'/'||p_sep);
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"        v_sql := 'CREATE TABLE SCM_MIGRATION(sm_prod_id         VARCHAR2(100),
"
"                                             sm_prod_rev        NUMBER(5),
"
"                                             sm_prod_desc        VARCHAR2(150),
"
"                                             sm_prod_uom        VARCHAR2(15),
"
"                                             sm_firm_qty           NUMBER(12,3),
"
"                                             sm_tend_qty         NUMBER(12,3),
"
"                                             sm_price            NUMBER (15,5),
"
"                                             sm_sch_frm_start_date     DATE,
"
"                                             sm_sch_frm_end_date    DATE,
"
"                                             sm_freq_type        VARCHAR2(1),
"
"                                             sm_sch_ten_start_date     DATE,
"
"                                             sm_sch_ten_end_date        DATE,
"
"                                             sm_ten_freq_type        VARCHAR2(1),
"
"                                             sm_cust_po_no        VARCHAR2(100),
"
"                                             sm_cust_po_date        DATE,
"
"                                             sm_schld_mode        VARCHAR2(2),
"
"                                             sm_bill_loc_name        VARCHAR2(100),
"
"                                             sm_ship_loc_name        VARCHAR2(100)
"
"                                            )
"
"       ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"       SKIP 1
"
"       FIELDS TERMINATED BY '''||p_sep||'''
"
"       MISSING FIELD VALUES ARE NULL
"
"       REJECT ROWS WITH ALL NULL FIELDS(sm_prod_id         CHAR(255),
"
"                                        sm_prod_rev        CHAR(255),
"
"                                        sm_prod_desc        CHAR(255),
"
"                                        sm_prod_uom         CHAR(255),
"
"                                        sm_firm_qty           CHAR(255),
"
"                                        sm_tend_qty         CHAR(255),
"
"                                        sm_price        CHAR(255),
"
"                                        sm_sch_frm_start_date     CHAR(255),
"
"                                        sm_sch_frm_end_date    CHAR(255),
"
"                                        sm_freq_type        CHAR(255),
"
"                                        sm_sch_ten_start_date     CHAR(255),
"
"                                        sm_sch_ten_end_date        CHAR(255),
"
"                                        sm_ten_freq_type        CHAR(255),
"
"                                        sm_cust_po_no        CHAR(255),
"
"                                        sm_cust_po_date        CHAR(255),
"
"                                        sm_schld_mode        CHAR(255),
"
"                                        sm_bill_loc_name    CHAR(255),
"
"                                        sm_ship_loc_name    CHAR(255)
"
"                                        )
"
"        )
"
"       LOCATION ('''||p_fname||''')
"
"       ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"  commit;
"
"  --raise_application_error(-20999,'HRM'||'/'||p_sep);
"
"  BEGIN
"
"
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration WHERE sm_firm_qty > 0';
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
"   DELETE cust_order_ln
"
"    WHERE coln_bu = p_bu
"
"      AND coln_plnt = p_plnt
"
"      AND coln_batch_no = p_batch_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"    --raise_application_error(-20999,'HRM'||'/'||p_sep);
"
"   BEGIN
"
"   SELECT NVL(MAX(TO_NUMBER(coln_doc_no)),0) + 1 INTO v_doc_no
"
"     FROM cust_order_ln
"
"    WHERE coln_bu = p_bu
"
"      AND coln_plnt = p_plnt;
"
"
"
"      /*IF cr_st(indx).sm_sch_frm_start_date IS NULL OR cr_st(indx).sm_sch_frm_end_date IS NULL THEN
"
"         Raise_Application_Error(-20539,'PLN');
"
"      END IF;*/
"
"
"
"          BEGIN
"
"            SELECT prodplnt_cls ,
"
"                   prodplnt_sub_cls,
"
"                   prodplnt_ship_store_id
"
"              INTO v_prod_cls ,
"
"                  v_prod_sub_cls ,
"
"                   v_prod_store_id
"
"              FROM prod_plants
"
"             WHERE prodplnt_bu = p_bu
"
"               AND prodplnt_plnt = p_plnt
"
"               AND prodplnt_prod_id = cr_st(indx).sm_prod_id
"
"               AND prodplnt_status ='A';
"
"
"
"    EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_prod_price_basis := 'U';
"
"          v_prod_cls := NULL;
"
"          v_prod_sub_cls := NULL;
"
"          v_prod_store_id := NULL;
"
"        END;
"
"
"
"         BEGIN
"
"            SELECT suplr_sales_area,
"
"           suplr_sales_person,
"
"           suplr_sales_terr,
"
"           suplr_sub_terr_id,
"
"           suplr_currency
"
"              INTO v_sal_area,
"
"                  v_sal_person,
"
"           v_sal_terr_id,
"
"           v_sub_terr,
"
"           v_currency
"
"          FROM suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_suplr_id = p_cust_id
"
"           AND suplr_status = 'A';
"
"
"
"       EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"        v_sal_area := NULL;
"
"        v_sal_person := NULL;
"
"        v_sal_terr_id := NULL;
"
"        v_sub_terr := NULL;
"
"        v_currency := NULL;
"
"       END;
"
"
"
"   BEGIN
"
"     SELECT NVL(prod_cust_drg_no,0),
"
"            NVL(prod_cust_drg_rev,0),
"
"            prod_uom,
"
"        prod_gst_exempt_flag,
"
"        prod_gst_types_of_supply,
"
"        prod_hsn_code
"
"       INTO v_prod_drw_no,
"
"            v_prod_drw_rev,
"
"            v_prod_uom,
"
"            v_gst_exempt_flag,
"
"        v_gst_types_of_supply,
"
"        v_hsn_code
"
"       FROM products
"
"      where prod_bu = p_bu
"
"        AND prod_id = cr_st(indx).sm_prod_id
"
"        AND prod_rev = NVL(cr_st(indx).sm_prod_rev,0)
"
"        AND prod_status = 'A';
"
"
"
"    EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"    v_prod_drw_no := NULL;
"
"    v_prod_drw_rev := NULL;
"
"    v_prod_uom := NULL;
"
"    END;
"
"
"
"   BEGIN
"
"   SELECT spc_class_id
"
"     INTO v_sales_cls
"
"     FROM sales_price_classes
"
"    WHERE spc_bu = p_bu
"
"      AND spc_sel_flag = 'Y';
"
"
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_sales_cls := NULL;
"
"   END;
"
"
"
" --EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"   --Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id||'~'||cr_st(indx).sm_cust_id);
"
" END;
"
"   --Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id);
"
"
"
"     BEGIN
"
"         SELECT ssl_loc_name1,
"
"            ssl_addr1,
"
"        ssl_addr2,
"
"        ssl_addr3,
"
"        ssl_zip,
"
"        ssl_city,
"
"        ssl_state,
"
"        ssl_country,
"
"        ssl_po_box,
"
"        ssl_tele,
"
"        ssl_mob_no,
"
"        ssl_fax,
"
"        ssl_email,
"
"        ssl_website,
"
"        ssl_ref1,
"
"        ssl_ref2,
"
"        ssl_gst_no
"
"           INTO v_billto_loc_name,
"
"        v_billto_addr1,
"
"        v_billto_addr2,
"
"        v_billto_addr3,
"
"        v_billto_postal_code,
"
"        v_billto_city,
"
"        v_billto_state,
"
"        v_billto_cntry,
"
"        v_billto_po_box,
"
"        v_billto_tele,
"
"        v_billto_mobile,
"
"        v_billto_fax,
"
"        v_billto_email,
"
"        v_billto_website,
"
"        v_billto_ref1,
"
"        v_billto_ref2,
"
"        v_billto_gst_no
"
"           FROM suplr_ship_loc
"
"          WHERE ssl_bu = p_bu
"
"            AND ssl_suplr_id = p_cust_id
"
"            AND ssl_loc_name1 = cr_st(indx).sm_bill_loc_name;
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_billto_loc_name        := NULL;
"
"      v_billto_addr1         := NULL;
"
"      v_billto_addr2         := NULL;
"
"      v_billto_addr3         := NULL;
"
"      v_billto_postal_code        := NULL;
"
"      v_billto_city         := NULL;
"
"      v_billto_state         := NULL;
"
"      v_billto_cntry         := NULL;
"
"      v_billto_po_box         := NULL;
"
"      v_billto_tele          := NULL;
"
"      v_billto_mobile         := NULL;
"
"      v_billto_fax          := NULL;
"
"      v_billto_email         := NULL;
"
"      v_billto_website         := NULL;
"
"      v_billto_ref1          := NULL;
"
"      v_billto_ref2          := NULL;
"
"      v_billto_gst_no        := NULL;
"
"      END;
"
"
"
"     BEGIN
"
"         SELECT ssl_loc_name1,
"
"        ssl_addr1,
"
"        ssl_addr2,
"
"        ssl_addr3,
"
"        ssl_zip,
"
"        ssl_city,
"
"        ssl_state,
"
"        ssl_country,
"
"        ssl_po_box,
"
"        ssl_tele,
"
"        ssl_mob_no,
"
"        ssl_fax,
"
"        ssl_email,
"
"        ssl_website,
"
"        ssl_gst_no,
"
"        ssl_ref1,
"
"        ssl_ref2
"
"           INTO v_shipto_loc_name,
"
"        v_shipto_addr1,
"
"        v_shipto_addr2,
"
"        v_shipto_addr3,
"
"        v_shipto_postal_code,
"
"        v_shipto_city,
"
"        v_shipto_state,
"
"        v_shipto_cntry,
"
"        v_shipto_po_box,
"
"        v_shipto_tele,
"
"        v_shipto_mobile,
"
"        v_shipto_fax,
"
"        v_shipto_email,
"
"        v_shipto_website,
"
"        v_shipto_gst_no,
"
"        v_ref1,
"
"        v_ref2
"
"           FROM suplr_ship_loc
"
"          WHERE ssl_bu = p_bu
"
"            AND ssl_suplr_id = p_cust_id
"
"            AND ssl_loc_name1 = cr_st(indx).sm_ship_loc_name;
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_shipto_loc_name        := NULL;
"
"     v_shipto_addr1         := NULL;
"
"     v_shipto_addr2         := NULL;
"
"     v_shipto_addr3        := NULL;
"
"     v_shipto_postal_code    := NULL;
"
"     v_shipto_city        := NULL;
"
"     v_shipto_state        := NULL;
"
"     v_shipto_cntry        := NULL;
"
"     v_shipto_po_box         := NULL;
"
"     v_shipto_tele           := NULL;
"
"     v_shipto_mobile        := NULL;
"
"     v_shipto_fax           := NULL;
"
"     v_shipto_email         := NULL;
"
"     v_shipto_website        := NULL;
"
"     v_shipto_gst_no         := NULL;
"
"     v_ref1                := NULL;
"
"     v_ref2            := NULL;
"
"  END;
"
"
"
"  SELECT NVL(suplr_sales_item_source,'I')
"
"            INTO v_cust_item_req
"
"            FROM suppliers
"
"           WHERE suplr_bu = p_bu
"
"             AND suplr_suplr_id = p_cust_id
"
"             AND suplr_status = 'A'
"
"         AND suplr_party_type = 'C';
"
"
"
"              BEGIN
"
"               SELECT suplr_sales_area
"
"                     INTO v_sales_area
"
"                     FROM suppliers
"
"                    WHERE suplr_bu = p_bu
"
"                  AND suplr_suplr_id = p_cust_id
"
"             AND suplr_party_type = 'C';
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                  v_sales_area := NULL;
"
"               END;
"
"
"
"               BEGIN
"
"               SELECT spc_class_id
"
"                 INTO v_sales_price_cls
"
"                 FROM sales_price_classes
"
"                WHERE spc_bu = p_bu
"
"                  AND spc_sel_flag = 'Y';
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                 v_sales_price_cls := NULL;
"
"              END;
"
"
"
"             v_prod_price_basis := func_find_cust_so_price_basis(p_bu,
"
"                                                              p_plnt,
"
"                                                              p_cust_id,
"
"                                      cr_st(indx).sm_prod_id,
"
"                                      cr_st(indx).sm_prod_rev,
"
"                                      v_cust_prod_id
"
"                                      );
"
"
"
"  v_tcf_id := null; /*func_find_dflt_tax_cls(p_bu,
"
"                          p_plnt,
"
"                          p_cust_id,
"
"                          cr_st(indx).sm_prod_id,
"
"                          cr_st(indx).sm_prod_rev,
"
"                          v_hsn_code,
"
"                          v_shipto_loc_id,
"
"                          TRUNC(SYSDATE)
"
"                                  );*/
"
"
"
"      v_tax_set_id := null;/*func_find_dflt_tax_set(p_bu,
"
"                                             p_plnt,
"
"                                     'C',
"
"                                     p_cust_id,
"
"                                     v_shipto_loc_id,
"
"                                     NULL,
"
"                                     v_gst_exempt_flag,
"
"                                     v_gst_types_of_supply
"
"                                     );*/
"
"      BEGIN
"
"      SELECT cohd_plnt_loc_id
"
"        INTO v_plnt_loc_id
"
"        FROM cust_order_hd
"
"       WHERE cohd_bu = p_bu
"
"         AND cohd_plnt = p_plnt
"
"         AND cohd_batch_no =  p_batch_no;
"
"      END;
"
"
"
"          IF v_prod_price_basis <> 'U' THEN
"
"            proc_find_sales_price(p_bu,
"
"                                      p_plnt,
"
"                                      p_cust_id,
"
"                                      v_sales_area,
"
"                                      v_sales_price_cls,
"
"                                      cr_st(indx).sm_prod_id,
"
"                                      cr_st(indx).sm_prod_rev,
"
"                                      cr_st(indx).sm_firm_qty,
"
"                                      TRUNC(SYSDATE),
"
"                                      v_prod_price_basis,
"
"                                      v_prod_uom,
"
"                                      NULL,
"
"                                      v_prod_store_id,
"
"                                      'S',
"
"                                      v_price,
"
"                                      v_mprice,
"
"                                      v_disc,
"
"                                      v_catalog_no,
"
"                                      v_contr_no,
"
"                                      v_amd_no,
"
"                                      v_amd_date,
"
"                                      cr_st(indx).sm_cust_po_no,--v_po_no,
"
"                                      cr_st(indx).sm_cust_po_date,--v_po_date,
"
"                                      v_po_ref,
"
"                                      v_po_seq_no,
"
"                                      v_tax_set_id,
"
"                                      v_tcf_id,
"
"                                      v_last_amd_no,
"
"                                        NULL,
"
"                                        'SO',
"
"                                      v_currency,
"
"                    v_plnt_loc_id
"
"                         );
"
"
"
"            ELSE
"
"              v_price := cr_st(indx).sm_price;
"
"      END IF;
"
"
"
"   DELETE cust_order_batch_addr
"
"    WHERE coba_bu = p_bu
"
"      AND coba_plnt = p_plnt
"
"      AND coba_batch_no = p_batch_no;
"
"
"
"      INSERT INTO cust_order_batch_addr(coba_bu,
"
"                    coba_plnt,
"
"                    coba_batch_no,
"
"                    coba_shipto_loc_name,
"
"                    coba_shipto_addr1,
"
"                    coba_shipto_addr2,
"
"                    coba_shipto_addr3,
"
"                    coba_shipto_postal_code,
"
"                    coba_shipto_city,
"
"                    coba_shipto_state,
"
"                    coba_shipto_cntry,
"
"                    coba_shipto_po_box,
"
"                    coba_shipto_tele,
"
"                    coba_shipto_mobile,
"
"                    coba_shipto_fax,
"
"                    coba_shipto_email,
"
"                    coba_shipto_website,
"
"                    coba_shipto_dist,
"
"                    coba_shipto_gst_no,
"
"                    coba_ref1,
"
"                    coba_ref2,
"
"                    coba_billto_loc_name,
"
"                    coba_billto_addr1,
"
"                    coba_billto_addr2,
"
"                    coba_billto_addr3,
"
"                    coba_billto_bref_addr,
"
"                    coba_billto_postal_code,
"
"                    coba_billto_city,
"
"                    coba_billto_state,
"
"                    coba_billto_cntry,
"
"                    coba_billto_po_box,
"
"                    coba_billto_tele,
"
"                    coba_billto_mobile,
"
"                    coba_billto_fax,
"
"                    coba_billto_email,
"
"                    coba_billto_website,
"
"                    coba_billto_ref1,
"
"                    coba_billto_ref2,
"
"                    coba_billto_gst_no,
"
"                    coba_cre_by,
"
"                    coba_cre_ip_addr,
"
"                    coba_cre_os_user,
"
"                    coba_cre_emp_id,
"
"                    coba_cre_date
"
"                                        )
"
"                                 VALUES(p_bu,
"
"                                        p_plnt,
"
"                                        p_batch_no,
"
"                    cr_st(indx).sm_ship_loc_name,
"
"                    v_shipto_addr1,
"
"                    v_shipto_addr2,
"
"                    v_shipto_addr3,
"
"                    v_shipto_postal_code,
"
"                    v_shipto_city,
"
"                    v_shipto_state,
"
"                    v_shipto_cntry,
"
"                    v_shipto_po_box,
"
"                    v_shipto_tele,
"
"                    v_shipto_mobile,
"
"                    v_shipto_fax,
"
"                    v_shipto_email,
"
"                    v_shipto_website,
"
"                    NVL(v_shipto_dist,0),
"
"                    v_shipto_gst_no,
"
"                    v_ref1,
"
"                    v_ref2,
"
"                    cr_st(indx).sm_bill_loc_name,
"
"                    v_billto_addr1,
"
"                    v_billto_addr2,
"
"                    v_billto_addr3,
"
"                    v_billto_bref_addr,
"
"                    v_billto_postal_code,
"
"                    v_billto_city,
"
"                    v_billto_state,
"
"                    v_billto_cntry,
"
"                    v_billto_po_box,
"
"                    v_billto_tele,
"
"                    v_billto_mobile,
"
"                    v_billto_fax,
"
"                    v_billto_email,
"
"                    v_billto_website,
"
"                    v_billto_ref1,
"
"                    v_billto_ref2,
"
"                    v_billto_gst_no,
"
"                    p_user,
"
"                    Audit_Info.Get_IP_Address,
"
"                    Audit_Info.Get_OS_User,
"
"                    func_find_emp_id(p_bu,p_user),
"
"                    SYSDATE
"
"                                        );
"
"    INSERT INTO cust_order_ln (coln_bu,
"
"                               coln_plnt,
"
"                               coln_ref_unit,
"
"                               coln_batch_no,
"
"                               coln_doc_no,
"
"                               coln_doc_rev,
"
"                               coln_cust_id,
"
"                               coln_firm_type,
"
"                               coln_prod_id,
"
"                               coln_prod_rev,
"
"                               coln_prod_desc,
"
"                               coln_order_qty,
"
"                               coln_schd_start_date,
"
"                               coln_schd_end_date,
"
"                               coln_freq_type,
"
"                               coln_freq,
"
"                               coln_schd_frm_start_date,
"
"                               coln_schd_frm_end_date,
"
"                               coln_frm_freq_type,
"
"                               coln_frm_freq,
"
"                               coln_frm_qty,
"
"                               coln_price,
"
"                               coln_disc_pct,
"
"                               coln_prod_uom,
"
"                               coln_sale_uom,
"
"                               coln_conv_factor,
"
"                               coln_amend_flag,
"
"                               coln_price_basis,
"
"                               coln_class_id,
"
"                               coln_store_id,
"
"                               coln_status,
"
"                               coln_backlog_qty,
"
"                               coln_type,
"
"                               coln_sales_area,
"
"                               coln_sub_terr_id,
"
"                               coln_sales_person,
"
"                               coln_cre_by,
"
"                               coln_cre_date,
"
"                               coln_sal_teri_id,
"
"                               coln_mrp_price,
"
"                               coln_tolr_pct,
"
"                               coln_tcf_id,
"
"                               coln_last_amd_no,
"
"                               coln_hold_flag,
"
"                               coln_un_hold_flag,
"
"                               coln_so_sel_flag,
"
"                               coln_proc_qty,
"
"                               coln_so_qty,
"
"                               coln_currency,
"
"                               coln_exchange_rate,
"
"                               coln_act_frm_qty,
"
"                               coln_act_tent_qty,
"
"                               coln_tac_rqrd_flag,
"
"                               coln_drw_no,
"
"                               coln_drw_rev,
"
"                               coln_spl_disc_amt,
"
"                               coln_cash_disc_amt,
"
"                               coln_cust_po_no,
"
"                               coln_cust_po_date,
"
"                               coln_tax_set_id,
"
"                               coln_hsn_code
"
"                               )
"
"                       VALUES (p_bu,
"
"                       p_plnt,
"
"                       p_plnt,
"
"                       p_batch_no,
"
"                       v_doc_no,--max of doc no
"
"                       0,
"
"                       p_cust_id,
"
"                       CASE WHEN (NVL(cr_st(indx).sm_firm_qty,0) > 0 AND NVL(cr_st(indx).sm_firm_qty,0) > 0) THEN 'FT'
"
"                            WHEN (NVL(cr_st(indx).sm_firm_qty,0) > 0 AND NVL(cr_st(indx).sm_firm_qty,0) = 0) THEN 'F'
"
"                            WHEN (NVL(cr_st(indx).sm_firm_qty,0) = 0 AND NVL(cr_st(indx).sm_firm_qty,0) > 0) THEN 'T' END,
"
"                       cr_st(indx).sm_prod_id,
"
"                       NVL(cr_st(indx).sm_prod_rev,0),
"
"                       func_find_prod_qry_desc(p_bu,cr_st(indx).sm_prod_id,cr_st(indx).sm_prod_rev,1),
"
"                       NVL(cr_st(indx).sm_tend_qty,0),
"
"                       cr_st(indx).sm_sch_ten_start_date,
"
"                       cr_st(indx).sm_sch_ten_end_date,
"
"                       NVL(cr_st(indx).sm_ten_freq_type,'M'),
"
"                       1,
"
"                       cr_st(indx).sm_sch_frm_start_date,
"
"                       cr_st(indx).sm_sch_frm_end_date,
"
"                       NVL(cr_st(indx).sm_freq_type,'M'),
"
"                       1,
"
"                       NVL(cr_st(indx).sm_firm_qty,0),--firm_qty
"
"                       NVL(v_price,cr_st(indx).sm_price),--price
"
"                       NVL(v_disc,0),
"
"                       NVL(cr_st(indx).sm_prod_uom,v_prod_uom),
"
"                       NVL(cr_st(indx).sm_prod_uom,v_prod_uom),
"
"                       1,
"
"                       'N',
"
"                       v_prod_price_basis,
"
"                       v_sales_cls ,
"
"                       v_prod_store_id,
"
"                       'E',
"
"                       0,
"
"                       cr_st(indx).sm_schld_mode,
"
"                       v_sal_area,
"
"                       v_sub_terr,
"
"                       v_sal_person ,
"
"                       'SAGUERPADMIN',
"
"                       TRUNC(SYSDATE),
"
"                       v_sal_terr_id ,
"
"                       0,
"
"                       0,
"
"                       v_tcf_id,
"
"                       0,
"
"                       'N',
"
"                       'N',
"
"                       'N',
"
"                       0,
"
"                       0,
"
"                       v_currency,
"
"                       1,
"
"                       NVL(cr_st(indx).sm_firm_qty,0),
"
"                       NVL(cr_st(indx).sm_tend_qty,0),
"
"                       'N',
"
"                       v_prod_drw_no,
"
"                       v_prod_drw_rev,
"
"                       0,
"
"                               0,
"
"                               cr_st(indx).sm_cust_po_no,
"
"                               cr_st(indx).sm_cust_po_date,
"
"                               v_tax_set_id,
"
"                               v_hsn_code
"
"                               );
"
"
"
"        -- Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id||'~'||cr_st(indx).sm_cust_id);
"
"    UPDATE cust_order_ln
"
"       SET coln_exp_ref = NULL
"
"     WHERE coln_bu = p_bu
"
"       AND coln_plnt = p_plnt
"
"       AND coln_batch_no = p_batch_no
"
"       AND coln_exp_ref IS NOT NULL;
"
"
"
"  FOR cr1 IN (SELECT *
"
"                FROM cust_order_ln
"
"               WHERE coln_bu = p_bu
"
"                 AND coln_plnt = p_plnt
"
"                 AND coln_batch_no = p_batch_no)
"
"  LOOP
"
"    v_err_msg := NULL;
"
"
"
"    OPEN c_prod(cr1.coln_prod_id,cr1.coln_prod_rev);
"
"    FETCH c_prod INTO cr_prod;
"
"      IF c_prod%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.coln_prod_id||' - '||cr1.coln_prod_rev||' - Item not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_prod;
"
"
"
"    OPEN c_prod_uom(cr1.coln_prod_id,cr1.coln_prod_rev,cr1.coln_prod_uom);
"
"    FETCH c_prod_uom INTO cr_prod_uom;
"
"      IF c_prod_uom%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.coln_prod_id||' - '||cr1.coln_prod_rev||' - '||cr1.coln_prod_uom||' - UOM not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_prod_uom;
"
"
"
"    OPEN c_prod_plnt(cr1.coln_prod_id,cr1.coln_prod_rev);
"
"    FETCH c_prod_plnt INTO cr_prod_plnt;
"
"      IF c_prod_plnt%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.coln_prod_id||' - '||cr1.coln_prod_rev||' - '||p_plnt||' - Item not associated with the unit.'||chr(10);
"
"      END IF;
"
"    CLOSE c_prod_plnt;
"
"
"
"    OPEN c_cust;
"
"    FETCH c_cust INTO cr_cust;
"
"      IF c_cust%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||p_cust_id||' - Customer details not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_cust;
"
"
"
"    OPEN c_bill(cr_st(indx).sm_bill_loc_name);
"
"    FETCH c_bill INTO cr_bill;
"
"      IF c_bill%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr_st(indx).sm_bill_loc_name||' - Bill Location not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_bill;
"
"
"
"    OPEN c_ship(cr_st(indx).sm_ship_loc_name);
"
"    FETCH c_ship INTO cr_ship;
"
"      IF c_ship%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr_st(indx).sm_ship_loc_name||' - Ship Location not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_ship;
"
"
"
"    IF cr1.coln_order_qty < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.coln_order_qty||'Quantity should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"
"
"   IF cr1.coln_frm_qty <= 0 THEN
"
"      v_err_msg := v_err_msg||cr1.coln_frm_qty||'Firm Quantity should be greater than Zero.'||chr(10);
"
"    END IF;
"
"
"
"    IF cr1.coln_price < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.coln_price||'Price should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"
"
"   IF cr1.coln_schd_start_date > cr1.coln_schd_end_date THEN
"
"        v_err_msg := v_err_msg||'From date - '||cr1.coln_schd_start_date||'To date - '||cr1.coln_schd_end_date||'To date should be greater than From date.'||chr(10);
"
"    END IF;
"
"
"
"     IF cr_st(indx).sm_sch_frm_start_date IS NULL THEN
"
"        v_err_msg := v_err_msg||'Start date must be entered.'||chr(10);
"
"     END IF;
"
"
"
"     IF cr_st(indx).sm_sch_frm_end_date IS NULL THEN
"
"        v_err_msg := v_err_msg||'End date must be entered.'||chr(10);
"
"     END IF;
"
"
"
"    UPDATE cust_order_ln
"
"       SET coln_exp_ref = v_err_msg
"
"     WHERE coln_bu = p_bu
"
"       AND coln_plnt = p_plnt
"
"       AND coln_batch_no = p_batch_no
"
"       AND coln_doc_no = cr1.coln_doc_no
"
"       AND coln_doc_rev = cr1.coln_doc_rev;
"
"
"
"     v_err_msg := NULL;
"
"
"
"      END LOOP c1;
"
"   END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"END proc_ins_cust_schld_multi_mig;
"
"
"
"--Sales Inv. Packing Migration
"
"PROCEDURE proc_ins_si_pack_mig(p_bu        VARCHAR2,
"
"                               p_plnt     VARCHAR2,
"
"                               p_doc_no    VARCHAR2,
"
"                               p_fname    VARCHAR2,
"
"                               p_sep        VARCHAR2,
"
"                               p_user        VARCHAR2,
"
"                               p_res           OUT VARCHAR2
"
"                               )
"
"AS
"
"
"
"v_sql               VARCHAR2(4000);
"
"v_fpath             VARCHAR2(200);
"
"v_exe_id            VARCHAR2(10);
"
"v_ref               VARCHAR2(4000);
"
"v_exp_seq_no        NUMBER;
"
"v_is_num_flag    VARCHAR2(1);
"
"v_cnt                  NUMBER;
"
"v_cnt1         NUMBER;
"
"TYPE typ_ins_gpi IS RECORD (sm_container    VARCHAR2(100),
"
"                            sm_prod_id        VARCHAR2(100),
"
"                            sm_prod_rev        NUMBER,
"
"                            sm_qty        VARCHAR2(15),
"
"                            sm_item_unit_wgt    VARCHAR2(15),
"
"                            sm_item_net_wgt    VARCHAR2(15),
"
"                            sm_item_gross_wgt    VARCHAR2(15),
"
"                            sm_case_mark    VARCHAR2(15),
"
"                            sm_no_of_cont    VARCHAR2(15),
"
"                            sm_length           VARCHAR2(15),
"
"                            sm_width        VARCHAR2(15),
"
"                            sm_height           VARCHAR2(15),
"
"                            sm_cont_wgt        VARCHAR2(15),
"
"                            sm_cont_net_wgt    VARCHAR2(15),
"
"                            sm_cont_gross_wgt    VARCHAR2(15)
"
"                            );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"v_cnt3    number;
"
"
"
"BEGIN
"
"
"
"p_res := 'N';
"
"
"
"  DELETE sales_inv_pack_mig_excep
"
"   WHERE sipme_bu = p_bu
"
"     AND sipme_plnt = p_plnt
"
"     AND sipme_doc_no = p_doc_no;
"
"
"
"  DELETE sales_inv_pack_mig_dtls
"
"   WHERE sipmd_bu = p_bu
"
"     AND sipmd_plnt = p_plnt
"
"     AND sipmd_doc_no = p_doc_no;
"
"
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"        v_sql := 'CREATE TABLE SCM_MIGRATION(sm_container    VARCHAR2(100),
"
"                            sm_prod_id        VARCHAR2(100),
"
"                            sm_prod_rev        NUMBER,
"
"                            sm_qty        VARCHAR2(15),
"
"                            sm_item_unit_wgt    VARCHAR2(15),
"
"                            sm_item_net_wgt    VARCHAR2(15),
"
"                            sm_item_gross_wgt    VARCHAR2(15),
"
"                            sm_case_mark    VARCHAR2(15),
"
"                            sm_no_of_cont    VARCHAR2(15),
"
"                            sm_length           VARCHAR2(15),
"
"                            sm_width        VARCHAR2(15),
"
"                            sm_height           VARCHAR2(15),
"
"                            sm_cont_wgt        VARCHAR2(15),
"
"                            sm_cont_net_wgt    VARCHAR2(15),
"
"                            sm_cont_gross_wgt    VARCHAR2(15))
"
"                       ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                       SKIP 1
"
"                       FIELDS TERMINATED BY '''||p_sep||'''
"
"                       MISSING FIELD VALUES ARE NULL
"
"                       REJECT ROWS WITH ALL NULL FIELDS(sm_container    CHAR(255),
"
"                            sm_prod_id        CHAR(255),
"
"                            sm_prod_rev        CHAR(255),
"
"                            sm_qty        CHAR(255),
"
"                            sm_item_unit_wgt    CHAR(255),
"
"                            sm_item_net_wgt    CHAR(255),
"
"                            sm_item_gross_wgt    CHAR(255),
"
"                            sm_case_mark    CHAR(255),
"
"                            sm_no_of_cont    CHAR(255),
"
"                            sm_length           CHAR(255),
"
"                            sm_width        CHAR(255),
"
"                            sm_height           CHAR(255),
"
"                            sm_cont_wgt        CHAR(255),
"
"                            sm_cont_net_wgt    CHAR(255),
"
"                            sm_cont_gross_wgt    CHAR(255))
"
"                                                       )LOCATION ('''||p_fname||''')
"
"                                                      ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"  BEGIN
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
"    v_ref := NULL;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_qty);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Qty.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_item_unit_wgt);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Item Unit Wgt.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_item_net_wgt);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_ref := v_ref|| ' , ' || 'Invalid Item Net Wgt.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_item_gross_wgt);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Item Gross Wgt.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_case_mark);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Case Mark'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_no_of_cont);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid No. of Container.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_length);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Length'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_width);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Width'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_height);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Height'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_cont_wgt);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Container Wgt.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_cont_net_wgt);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Container Net Wgt.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"      BEGIN
"
"        proc_isalphanumeric(cr_st(indx).sm_cont_gross_wgt);
"
"      EXCEPTION WHEN OTHERS THEN
"
"        v_is_num_flag    := 'Y';
"
"        v_ref := v_ref|| ' , ' || 'Invalid Container Gross Wgt.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"      END;
"
"
"
"
"
"      IF v_is_num_flag = 'N' THEN
"
"
"
"        IF TO_NUMBER(cr_st(indx).sm_qty) <= 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Quantity should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_item_unit_wgt) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Item Unit Wgt. should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_item_net_wgt) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Item Net Wgt. should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_item_gross_wgt) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Item Gross Wgt.  should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_case_mark) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Case Mark should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_no_of_cont) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'No. of Container should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_length) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Length should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_width) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Width should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_height) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Height should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_cont_wgt) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Container Weight should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_cont_net_wgt) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Container Net Wgt. should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"        IF TO_NUMBER(cr_st(indx).sm_cont_gross_wgt) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'Container Gross Wgt.  should be greater than 0.'||cr_st(indx).sm_container||'~'||cr_st(indx).sm_prod_id;
"
"        END IF;
"
"      END IF;
"
"
"
"        BEGIN
"
"         SELECT COUNT(*)
"
"          INTO v_cnt
"
"          FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"           AND prodplnt_plnt = p_plnt
"
"           AND prodplnt_prod_id = cr_st(indx).sm_prod_id
"
"           AND prodplnt_prod_rev = cr_st(indx).sm_prod_rev
"
"           AND prodplnt_status = 'A' ;
"
"        EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_ref := v_ref|| ' , ' || cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev || '- Item not defined in the unit.';
"
"        END;
"
"    IF v_cnt = 0 THEN
"
"      v_ref := v_ref|| ' , ' || cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev || '- Item not defined in the unit.';
"
"    END IF;
"
"
"
"    BEGIN
"
"    SELECT COUNT(*)
"
"          INTO v_cnt1
"
"          FROM sales_invoices_ln
"
"     WHERE siln_bu = p_bu
"
"       AND siln_plnt = p_plnt
"
"       AND siln_doc_no = p_doc_no
"
"       AND siln_prod_id = cr_st(indx).sm_prod_id
"
"       AND siln_prod_rev = cr_st(indx).sm_prod_rev;
"
"    EXCEPTION WHEN OTHERS THEN
"
"          v_ref := v_ref|| ' , ' || cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev || '- Item not found in linewise.';
"
"        END;
"
"    IF v_cnt1 = 0 THEN
"
"      v_ref := v_ref|| ' , ' || cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev || '- Item not found in linewise.';
"
"    END IF;
"
"
"
"    BEGIN
"
"         SELECT COUNT(*)
"
"          INTO v_cnt3
"
"          FROM prod_plants
"
"         WHERE prodplnt_bu = p_bu
"
"           AND prodplnt_plnt = p_plnt
"
"           AND prodplnt_prod_id = cr_st(indx).sm_container
"
"           AND prodplnt_prod_rev = 0
"
"           AND prodplnt_status ='A' ;
"
"
"
"        EXCEPTION WHEN NO_DATA_FOUND  THEN
"
"          v_ref := v_ref|| ' , ' || cr_st(indx).sm_container || '- Container not found.';
"
"        END;
"
"    IF  v_cnt3 = 0 THEN
"
"       v_ref := v_ref|| ' , ' || cr_st(indx).sm_container  || '- Container not found.';
"
"    END IF;
"
"
"
"    IF v_ref IS NOT NULL THEN
"
"
"
"      SELECT NVL(MAX(sipme_seq_no),0) + 1
"
"        INTO v_exp_seq_no
"
"        FROM sales_inv_pack_mig_excep
"
"       WHERE sipme_bu = p_bu
"
"         AND sipme_plnt = p_plnt
"
"         AND sipme_doc_no = p_doc_no;
"
"
"
"      INSERT INTO sales_inv_pack_mig_excep(sipme_bu,
"
"                                           sipme_plnt,
"
"                                           sipme_doc_no,
"
"                                           sipme_seq_no,
"
"                                           sipme_reference,
"
"                                           sipme_cre_by,
"
"                                           sipme_cre_date,
"
"                                           sipme_cre_ip_addr,
"
"                                           sipme_cre_os_user,
"
"                                           sipme_cre_emp_id
"
"                                          )
"
"                                   VALUES(p_bu,
"
"                                          p_plnt,
"
"                                          p_doc_no,
"
"                                          v_exp_seq_no,
"
"                                          LTRIM(v_ref,','),
"
"                                          p_user,
"
"                                          SYSDATE,
"
"                                          Audit_Info.Get_IP_Address,
"
"                                          Audit_Info.Get_OS_User,
"
"                                          func_find_emp_id(p_bu,p_user)
"
"                                          );
"
"    END IF;
"
"----------------------------------------------------------
"
"
"
"    IF v_ref IS NULL THEN
"
"
"
"        INSERT INTO sales_inv_pack_mig_dtls(sipmd_bu,
"
"                        sipmd_plnt,
"
"                        sipmd_doc_no,
"
"                        sipmd_container,
"
"                                        sipmd_prod_id,
"
"                                        sipmd_prod_rev,
"
"                                        sipmd_qty,
"
"                                        sipmd_item_unit_wgt,
"
"                                        sipmd_item_net_wgt,
"
"                                        sipmd_item_gross_wgt,
"
"                                        sipmd_case_mark,
"
"                                        sipmd_no_of_cont,
"
"                                        sipmd_length,
"
"                                        sipmd_width,
"
"                                        sipmd_height,
"
"                                        sipmd_cont_wgt,
"
"                                        sipmd_cont_net_wgt,
"
"                                        sipmd_cont_gross_wgt
"
"                       )
"
"                     VALUES(p_bu,
"
"                        p_plnt,
"
"                        p_doc_no,
"
"                        cr_st(indx).sm_container,
"
"                                        cr_st(indx).sm_prod_id,
"
"                                        cr_st(indx).sm_prod_rev,
"
"                                        cr_st(indx).sm_qty,
"
"                                        cr_st(indx).sm_item_unit_wgt,
"
"                                        cr_st(indx).sm_item_net_wgt,
"
"                                        cr_st(indx).sm_item_gross_wgt,
"
"                                        cr_st(indx).sm_case_mark,
"
"                                        cr_st(indx).sm_no_of_cont,
"
"                                        cr_st(indx).sm_length,
"
"                                        cr_st(indx).sm_width,
"
"                                        cr_st(indx).sm_height,
"
"                                        cr_st(indx).sm_cont_wgt,
"
"                                        cr_st(indx).sm_cont_net_wgt,
"
"                                        cr_st(indx).sm_cont_gross_wgt
"
"                      );
"
"   END IF;
"
"   p_res := 'Y';
"
"  END LOOP;
"
"  END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"END proc_ins_si_pack_mig;
"
"
"
"
"
"PROCEDURE proc_ins_so_amd_upld(p_bu         VARCHAR2,
"
"                               p_plnt       VARCHAR2,
"
"                               p_doc_no     VARCHAR2,
"
"                               p_fname      VARCHAR2,
"
"                               p_sep        VARCHAR2,
"
"                               p_user       VARCHAR2,
"
"                               p_res    OUT VARCHAR2
"
"                               )
"
"AS
"
"
"
"v_sql               VARCHAR2(4000);
"
"v_fpath             VARCHAR2(200);
"
"v_exe_id            VARCHAR2(10);
"
"v_ref               VARCHAR2(4000);
"
"v_exp_seq_no        NUMBER;
"
"v_is_num_flag       VARCHAR2(1);
"
"v_cnt               NUMBER;
"
"v_cnt1             NUMBER;
"
"v_cnt2             NUMBER;
"
"TYPE typ_ins_gpi IS RECORD (sm_type      VARCHAR2(1),
"
"                sm_sou_ord_seq_no    VARCHAR2(1),
"
"                sm_prod_id        VARCHAR2(100),
"
"                sm_prod_rev        VARCHAR2(5),
"
"                sm_prod_desc1    VARCHAR2(200),
"
"                sm_old_so_qty        NUMBER(15,8),
"
"                sm_pend_qty        NUMBER(15,8),
"
"                sm_new_so_qty        NUMBER(15,8),
"
"                sm_old_price    NUMBER(15,8),
"
"                sm_new_price    NUMBER(15,8),
"
"                sm_old_hsn_code    VARCHAR2(50),
"
"                sm_hsn_code        VARCHAR2(50),
"
"                sm_old_disc_pct    VARCHAR2(1),
"
"                sm_new_disc_pct    VARCHAR2(1),
"
"                sm_old_spl_disc_pct    NUMBER(15,8),
"
"                sm_new_spl_disc_pct    NUMBER(15,8),
"
"                sm_old_cash_disc_pct    NUMBER(15,8),
"
"                sm_new_cash_disc_pct    NUMBER(15,8),
"
"                sm_old_shipfrm_loc_id    VARCHAR2(50),
"
"                sm_shipfrm_loc_id    VARCHAR2(50)
"
"                            );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"
"
"p_res := 'N';
"
"
"
"  DELETE so_amd_ln_upld_temp
"
"   WHERE salut_bu = p_bu
"
"     AND salut_plnt = p_plnt
"
"     AND salut_doc_no = p_doc_no;
"
"
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"        v_sql := 'CREATE TABLE SCM_MIGRATION(sm_type      VARCHAR2(1),
"
"                sm_sou_ord_seq_no    VARCHAR2(1),
"
"                sm_prod_id        VARCHAR2(100),
"
"                sm_prod_rev        VARCHAR2(5),
"
"                sm_prod_desc1    VARCHAR2(200),
"
"                sm_old_so_qty        NUMBER(15,8),
"
"                sm_pend_qty        NUMBER(15,8),
"
"                sm_new_so_qty        NUMBER(15,8),
"
"                sm_old_price    NUMBER(15,8),
"
"                sm_new_price    NUMBER(15,8),
"
"                sm_old_hsn_code    VARCHAR2(50),
"
"                sm_hsn_code        VARCHAR2(50),
"
"                sm_old_disc_pct    VARCHAR2(1),
"
"                sm_new_disc_pct    VARCHAR2(1),
"
"                sm_old_spl_disc_pct    NUMBER(15,8),
"
"                sm_new_spl_disc_pct    NUMBER(15,8),
"
"                sm_old_cash_disc_pct    NUMBER(15,8),
"
"                sm_new_cash_disc_pct    NUMBER(15,8),
"
"                sm_old_shipfrm_loc_id    VARCHAR2(50),
"
"                sm_shipfrm_loc_id    VARCHAR2(50))
"
"                       ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                       SKIP 1
"
"                       FIELDS TERMINATED BY '''||p_sep||'''
"
"                       MISSING FIELD VALUES ARE NULL
"
"                       REJECT ROWS WITH ALL NULL FIELDS(sm_type              CHAR(255),
"
"                            sm_sou_ord_seq_no    CHAR(255),
"
"                            sm_prod_id        CHAR(255),
"
"                            sm_prod_rev        CHAR(255),
"
"                            sm_prod_desc1        CHAR(255),
"
"                            sm_old_so_qty        CHAR(255),
"
"                            sm_pend_qty        CHAR(255),
"
"                            sm_new_so_qty        CHAR(255),
"
"                            sm_old_price        CHAR(255),
"
"                            sm_new_price        CHAR(255),
"
"                            sm_old_hsn_code        CHAR(255),
"
"                            sm_hsn_code        CHAR(255),
"
"                            sm_old_disc_pct        CHAR(255),
"
"                            sm_new_disc_pct        CHAR(255),
"
"                            sm_old_spl_disc_pct    CHAR(255),
"
"                            sm_new_spl_disc_pct    CHAR(255),
"
"                            sm_old_cash_disc_pct    CHAR(255),
"
"                            sm_new_cash_disc_pct    CHAR(255),
"
"                            sm_old_shipfrm_loc_id    CHAR(255),
"
"                            sm_shipfrm_loc_id    CHAR(255))
"
"                                                       )LOCATION ('''||p_fname||''')
"
"                                                      ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"  BEGIN
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
"    v_ref := NULL;
"
"
"
"      IF cr_st(indx).sm_type IS NULL OR cr_st(indx).sm_type NOT IN ('A','M','C') THEN
"
"        v_ref := v_ref|| ' , ' || 'Amd. Type must be valid for '||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_new_so_qty) <= 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'New SO Qty. should be greater than 0.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_new_price) <= 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'New Price should be greater than 0.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_new_disc_pct) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'New Disc.% should be greater than 0.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_new_spl_disc_pct) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'New Spl. Disc.% should be greater than 0.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_new_cash_disc_pct) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'New Cash Disc.% should be greater than 0.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_hsn_code) IS NULL THEN
"
"          v_ref := v_ref|| ' , ' || 'New HSN Code must be entered.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_prod_id) IS NULL THEN
"
"          v_ref := v_ref|| ' , ' || 'Item must be entered.'||cr_st(indx).sm_sou_ord_seq_no;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_prod_rev) IS NULL THEN
"
"          v_ref := v_ref|| ' , ' || 'Item Rev. must be entered.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_prod_desc1) IS NULL THEN
"
"          v_ref := v_ref|| ' , ' || 'Item Desc. must be entered.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"      IF TO_NUMBER(cr_st(indx).sm_shipfrm_loc_id) < 0  THEN
"
"          v_ref := v_ref|| ' , ' || 'New Shipfrom Loc. should be greater than 0.'||cr_st(indx).sm_prod_id;
"
"      END IF;
"
"
"
"    /*  IF cr_st(indx).sm_type <> 'A' THEN
"
"      BEGIN
"
"    SELECT COUNT(*)
"
"          INTO v_cnt1
"
"          FROM sales_order_qtys
"
"     WHERE soq_bu = p_bu
"
"       AND soq_order_no = p_so_no
"
"       AND soq_prod_id = cr_st(indx).sm_prod_id
"
"       AND soq_prod_rev = cr_st(indx).sm_prod_rev
"
"       AND soq_status = 'A';
"
"    EXCEPTION WHEN OTHERS THEN
"
"          v_ref := v_ref|| ' , ' || cr_st(indx).sm_prod_id ||'~'||cr_st(indx).sm_prod_rev || '- Item not found in SO';
"
"      END;
"
"      END IF;*/
"
"
"
"        BEGIN
"
"         SELECT COUNT(*)
"
"          INTO v_cnt2
"
"          FROM products
"
"         WHERE prod_bu = p_bu
"
"           AND prod_id = cr_st(indx).sm_prod_id
"
"           AND prod_rev = cr_st(indx).sm_prod_rev
"
"           AND prod_status = 'A' ;
"
"
"
"        EXCEPTION WHEN NO_DATA_FOUND  THEN
"
"          v_ref := v_ref|| ' , ' || cr_st(indx).sm_sou_ord_seq_no || '- Item not found.';
"
"        END;
"
"    IF  v_cnt2 = 0 THEN
"
"       v_ref := v_ref|| ' , ' || cr_st(indx).sm_sou_ord_seq_no  || '- Item not found.';
"
"    END IF;
"
"
"
"    IF v_ref IS NOT NULL THEN
"
"
"
"      SELECT NVL(MAX(salme_seq_no),0) + 1
"
"        INTO v_exp_seq_no
"
"        FROM so_amd_ln_mig_excep
"
"       WHERE salme_bu = p_bu
"
"         AND salme_plnt = p_plnt
"
"         AND salme_doc_no = p_doc_no;
"
"
"
"      INSERT INTO so_amd_ln_mig_excep(salme_bu,
"
"                                      salme_plnt,
"
"                                      salme_doc_no,
"
"                                      salme_seq_no,
"
"                                      salme_reference,
"
"                                      salme_cre_by,
"
"                                      salme_cre_date,
"
"                                      salme_cre_ip_addr,
"
"                                      salme_cre_os_user,
"
"                                      salme_cre_emp_id
"
"                                          )
"
"                                   VALUES(p_bu,
"
"                                          p_plnt,
"
"                                          p_doc_no,
"
"                                          v_exp_seq_no,
"
"                                          LTRIM(v_ref,','),
"
"                                          p_user,
"
"                                          SYSDATE,
"
"                                          Audit_Info.Get_IP_Address,
"
"                                          Audit_Info.Get_OS_User,
"
"                                          func_find_emp_id(p_bu,p_user)
"
"                                          );
"
"    END IF;
"
"
"
"    IF v_ref IS NULL THEN
"
"
"
"        INSERT INTO so_amd_ln_upld_temp(salut_bu,
"
"                    salut_plnt,
"
"                    salut_doc_no,
"
"                    salut_type,
"
"                    salut_sou_ord_seq_no,
"
"                    salut_prod_id,
"
"                    salut_prod_rev,
"
"                    salut_prod_desc1,
"
"                    salut_old_so_qty,
"
"                    salut_pend_qty,
"
"                    salut_new_so_qty,
"
"                    salut_old_price,
"
"                    salut_new_price,
"
"                    salut_old_hsn_code,
"
"                    salut_hsn_code,
"
"                    salut_old_disc_pct,
"
"                    salut_new_disc_pct,
"
"                    salut_old_spl_disc_pct,
"
"                    salut_new_spl_disc_pct,
"
"                    salut_old_cash_disc_pct,
"
"                    salut_new_cash_disc_pct,
"
"                    salut_old_shipfrm_loc_id,
"
"                    salut_shipfrm_loc_id
"
"                    )
"
"                 VALUES(p_bu,
"
"                    p_plnt,
"
"                    p_doc_no,
"
"                                        cr_st(indx).sm_type,
"
"                    cr_st(indx).sm_sou_ord_seq_no,
"
"                    cr_st(indx).sm_prod_id,
"
"                    cr_st(indx).sm_prod_rev,
"
"                    cr_st(indx).sm_prod_desc1,
"
"                    cr_st(indx).sm_old_so_qty,
"
"                    cr_st(indx).sm_pend_qty,
"
"                    cr_st(indx).sm_new_so_qty,
"
"                    cr_st(indx).sm_old_price,
"
"                    cr_st(indx).sm_new_price,
"
"                    cr_st(indx).sm_old_hsn_code,
"
"                    cr_st(indx).sm_hsn_code,
"
"                    cr_st(indx).sm_old_disc_pct,
"
"                    cr_st(indx).sm_new_disc_pct,
"
"                    cr_st(indx).sm_old_spl_disc_pct,
"
"                    cr_st(indx).sm_new_spl_disc_pct,
"
"                    cr_st(indx).sm_old_cash_disc_pct,
"
"                    cr_st(indx).sm_new_cash_disc_pct,
"
"                    cr_st(indx).sm_old_shipfrm_loc_id,
"
"                    cr_st(indx).sm_shipfrm_loc_id
"
"                    );
"
"   END IF;
"
"   p_res := 'Y';
"
"  END LOOP;
"
"  END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"END proc_ins_so_amd_upld;
"
"
"
"/* Customer Schedule Tata Migration */
"
"
"
" PROCEDURE proc_ins_cust_schld_tata_mig(p_bu        business_units.bu_id%TYPE,
"
"                    p_plnt         bus_unit_plants.bup_plant_id%TYPE,
"
"                    p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                    p_cust_id     cust_order_hd.cohd_cust_id%TYPE,
"
"                    p_fname        VARCHAR2,
"
"                    p_sep        VARCHAR2,
"
"                    p_user        cust_order_hd.cohd_cre_by%TYPE,
"
"                    p_res    OUT    VARCHAR2
"
"                    )
"
"AS
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_exe_id        VARCHAR2(10);
"
"v_doc_no         NUMBER(15);
"
"v_prod_price_basis     VARCHAR2(20);
"
"v_prod_cls        VARCHAR2(20);
"
"v_sales_cls         VARCHAR2(20);
"
"v_prod_sub_cls         VARCHAR2(20);
"
"v_prod_store_id        VARCHAR2(20);
"
"v_sal_area         VARCHAR2(20);
"
"v_sub_terr         VARCHAR2(20);
"
"v_sal_person        VARCHAR2(20);
"
"v_sal_terr_id         VARCHAR2(20);
"
"v_currency         VARCHAR2(20);
"
"v_prod_drw_no         VARCHAR2(25);
"
"v_prod_drw_rev         VARCHAR2(5);
"
"v_prod_uom         VARCHAR2(5);
"
"v_prod_id        products.prod_id%TYPE;
"
"v_prod_rev        NUMBER(5);
"
"v_prod_desc        VARCHAR2(150);
"
"v_err_msg            VARCHAR2(4000);
"
"v_type            VARCHAR2(2);
"
"v_shipto_loc_id        VARCHAR2(10);
"
"v_shipto_loc_name    VARCHAR2(50);
"
"v_shipto_addr1        VARCHAR2(100);
"
"v_shipto_addr2        VARCHAR2(50);
"
"v_shipto_addr3        VARCHAR2(50);
"
"v_shipto_addr4        VARCHAR2(50);
"
"v_shipto_addr5          VARCHAR2(50);
"
"v_shipto_bref_addr      VARCHAR2(500);
"
"v_shipto_postal_code    VARCHAR2(15);
"
"v_shipto_city        VARCHAR2(5);
"
"v_shipto_state         VARCHAR2(5);
"
"v_shipto_cntry         VARCHAR2(5);
"
"v_shipto_po_box     VARCHAR2(15);
"
"v_shipto_tele         VARCHAR2(30);
"
"v_shipto_mobile        VARCHAR2(30);
"
"v_shipto_fax         VARCHAR2(30);
"
"v_shipto_email         VARCHAR2(50);
"
"v_shipto_website     VARCHAR2(50);
"
"v_shipto_dist         NUMBER(30);
"
"v_shipto_gst_no     VARCHAR2(15);
"
"v_ref1          VARCHAR2(50);
"
"v_ref2             VARCHAR2(50);
"
"v_billto_loc_id     VARCHAR2(10);
"
"v_billto_loc_name       VARCHAR2(50);
"
"v_billto_addr1          VARCHAR2(50);
"
"v_billto_addr2         VARCHAR2(50);
"
"v_billto_addr3         VARCHAR2(50);
"
"v_billto_bref_addr      VARCHAR2(500);
"
"v_billto_postal_code    VARCHAR2(15);
"
"v_billto_city         VARCHAR2(5);
"
"v_billto_state      VARCHAR2(5);
"
"v_billto_cntry      VARCHAR2(5);
"
"v_billto_po_box      VARCHAR2(15);
"
"v_billto_tele         VARCHAR2(30);
"
"v_billto_mobile        VARCHAR2(30);
"
"v_billto_fax         VARCHAR2(30);
"
"v_billto_email      VARCHAR2(50);
"
"v_billto_website    VARCHAR2(50);
"
"v_billto_ref1       VARCHAR2(50);
"
"v_billto_ref2         VARCHAR2(50);
"
"v_billto_gst_no     VARCHAR2(15);
"
"v_cust_prod_id    cust_prod.custp_cust_prod_id%TYPE;
"
"v_price_basis    cust_prod.custp_price_basis%TYPE;
"
"v_sales_area    suppliers.suplr_sales_area%TYPE;
"
"v_price        NUMBER;
"
"v_mprice    NUMBER;
"
"v_disc        NUMBER;
"
"v_catalog_no    VARCHAR2(30);
"
"v_contr_no    VARCHAR2(30);
"
"v_amd_no    NUMBER;
"
"v_amd_date    DATE;
"
"v_sale_uom    VARCHAR2(5);
"
"v_po_no        VARCHAR2(30);
"
"v_po_date    DATE;
"
"v_po_ref    VARCHAR2(100);
"
"v_po_seq_no    NUMBER(5);
"
"v_tax_set_id    VARCHAR2(10);
"
"v_tcf_id    VARCHAR2(10);
"
"v_last_amd_no    NUMBER(5);
"
"v_seq_no    NUMBER(5) := 0;
"
"v_conv_factor    NUMBER(15,8);
"
"v_sub_seq_no    NUMBER;
"
"v_cm_seq_no    NUMBER;
"
"v_cls_id        VARCHAR2 (10);
"
"v_cust_item_req    VARCHAR2(1);
"
"v_sales_price_cls    VARCHAR2(10);
"
"v_loc_id1    VARCHAR2(10);
"
"v_gst_exempt_flag    VARCHAR2(1);
"
"v_gst_types_of_supply    VARCHAR2(1);
"
"v_hsn_code        VARCHAR2(25);
"
"v_plnt_loc_id        VARCHAR2(25);
"
"
"
"TYPE typ_ins_gpi IS RECORD (sm_part_no             VARCHAR2(25),
"
"                sm_part_desc        VARCHAR2(150),
"
"                sm_firm_qty                 NUMBER(12,3),
"
"                            sm_ten_qty           NUMBER(12,3)
"
"                            );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"  p_res := 'N';
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"        v_sql := 'CREATE TABLE SCM_MIGRATION(sm_part_no         VARCHAR2(25),
"
"                         sm_part_desc        VARCHAR2(150),
"
"                         sm_firm_qty                 NUMBER(12,3),
"
"                         sm_ten_qty           NUMBER(12,3)
"
"                                 )
"
"       ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"       SKIP 1
"
"       FIELDS TERMINATED BY '''||p_sep||'''
"
"       MISSING FIELD VALUES ARE NULL
"
"       REJECT ROWS WITH ALL NULL FIELDS(sm_part_no         CHAR(255),
"
"                            sm_part_desc        CHAR(255),
"
"                            sm_firm_qty        CHAR(255),
"
"                    sm_ten_qty         CHAR(255)
"
"                            )
"
"        )
"
"       LOCATION ('''||p_fname||''')
"
"       ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"  commit;
"
"  --raise_application_error(-20999,'HRM'||'/'||p_sep);
"
"  BEGIN
"
"
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration where sm_firm_qty > 0 OR sm_ten_qty > 0 ';
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
"   DELETE cust_order_ln
"
"    WHERE coln_bu = p_bu
"
"      AND coln_plnt = p_plnt
"
"      AND coln_batch_no = p_batch_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"    --raise_application_error(-20999,'HRM'||'/'||p_sep);
"
"   BEGIN
"
"
"
"   SELECT NVL(MAX(TO_NUMBER(coln_doc_no)),0)+1
"
"     INTO v_doc_no
"
"     FROM cust_order_ln
"
"    WHERE coln_bu = p_bu
"
"      AND coln_plnt = p_plnt;
"
"
"
"          BEGIN
"
"            SELECT custp_prod_id,
"
"                   custp_prod_rev,
"
"                   custp_uom,
"
"                   custp_cust_prod_id
"
"              INTO v_prod_id,
"
"                  v_prod_rev,
"
"                   v_prod_uom,
"
"                   v_cust_prod_id
"
"              FROM cust_prod
"
"             WHERE custp_bu = p_bu
"
"               AND custp_cust_id = p_cust_id
"
"               AND custp_cust_prod_id = cr_st(indx).sm_part_no
"
"               AND custp_prod_flag = 'Y';
"
"               --AND custp_cust_prod_desc = cr_st(indx).sm_part_desc;
"
"
"
"    EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_prod_id := NULL;
"
"          v_prod_rev := 0;
"
"          v_prod_uom := NULL;
"
"        END;
"
"
"
"    IF v_prod_id IS NOT NULL THEN
"
"          BEGIN
"
"            SELECT prodplnt_cls ,
"
"                   prodplnt_sub_cls,
"
"                   prodplnt_ship_store_id
"
"              INTO v_prod_cls ,
"
"                  v_prod_sub_cls ,
"
"                   v_prod_store_id
"
"              FROM prod_plants
"
"             WHERE prodplnt_bu = p_bu
"
"               AND prodplnt_plnt = p_plnt
"
"               AND prodplnt_prod_id = v_prod_id
"
"               AND prodplnt_prod_rev = v_prod_rev
"
"               AND prodplnt_status ='A';
"
"
"
"    EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_prod_price_basis := 'U';
"
"          v_prod_cls := NULL;
"
"          v_prod_sub_cls := NULL;
"
"          v_prod_store_id := NULL;
"
"        END;
"
"     END IF;
"
"
"
"         BEGIN
"
"            SELECT suplr_sales_area,
"
"           suplr_sales_person,
"
"           suplr_sales_terr,
"
"           suplr_sub_terr_id,
"
"           suplr_currency
"
"              INTO v_sal_area,
"
"                  v_sal_person,
"
"           v_sal_terr_id,
"
"           v_sub_terr,
"
"           v_currency
"
"          FROM suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_suplr_id = p_cust_id
"
"           AND suplr_status = 'A'
"
"           AND suplr_party_type = 'C';
"
"
"
"       EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"        v_sal_area := NULL;
"
"        v_sal_person := NULL;
"
"        v_sal_terr_id := NULL;
"
"        v_sub_terr := NULL;
"
"        v_currency := NULL;
"
"       END;
"
" IF v_prod_id IS NOT NULL THEN
"
"   BEGIN
"
"     SELECT NVL(prod_cust_drg_no,0),
"
"            NVL(prod_cust_drg_rev,0),
"
"        prod_gst_exempt_flag,
"
"        prod_gst_types_of_supply,
"
"        prod_hsn_code
"
"       INTO v_prod_drw_no,
"
"            v_prod_drw_rev,
"
"            v_gst_exempt_flag,
"
"        v_gst_types_of_supply,
"
"        v_hsn_code
"
"       FROM products
"
"      where prod_bu = p_bu
"
"        AND prod_id = v_prod_id
"
"        AND prod_rev = NVL(v_prod_rev,0)
"
"        AND prod_status = 'A';
"
"
"
"    EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"    v_prod_drw_no := NULL;
"
"    v_prod_drw_rev := NULL;
"
"    END;
"
"END IF;
"
"   BEGIN
"
"   SELECT spc_class_id
"
"     INTO v_sales_cls
"
"     FROM sales_price_classes
"
"    WHERE spc_bu = p_bu
"
"      AND spc_sel_flag = 'Y';
"
"
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_sales_cls := NULL;
"
"   END;
"
"
"
" --EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"   --Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id||'~'||cr_st(indx).sm_cust_id);
"
" END;
"
"   --Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id);
"
"
"
"     BEGIN
"
"         SELECT ssl_loc_name1,
"
"        ssl_addr1,
"
"        ssl_addr2,
"
"        ssl_addr3,
"
"        ssl_zip,
"
"        ssl_city,
"
"        ssl_state,
"
"        ssl_country,
"
"        ssl_po_box,
"
"        ssl_tele,
"
"        ssl_mob_no,
"
"        ssl_fax,
"
"        ssl_email,
"
"        ssl_website,
"
"        ssl_ref1,
"
"        ssl_ref2,
"
"        ssl_gst_no
"
"           INTO v_billto_loc_name,
"
"        v_billto_addr1,
"
"        v_billto_addr2,
"
"        v_billto_addr3,
"
"        v_billto_postal_code,
"
"        v_billto_city,
"
"        v_billto_state,
"
"        v_billto_cntry,
"
"        v_billto_po_box,
"
"        v_billto_tele,
"
"        v_billto_mobile,
"
"        v_billto_fax,
"
"        v_billto_email,
"
"        v_billto_website,
"
"        v_billto_ref1,
"
"        v_billto_ref2,
"
"        v_billto_gst_no
"
"           FROM suplr_ship_loc
"
"          WHERE ssl_bu = p_bu
"
"            AND ssl_suplr_id = p_cust_id
"
"            AND ssl_dflt_flg IN ('D','B');
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_billto_loc_name        := NULL;
"
"      v_billto_addr1         := NULL;
"
"      v_billto_addr2         := NULL;
"
"      v_billto_addr3         := NULL;
"
"      v_billto_bref_addr        := NULL;
"
"      v_billto_postal_code        := NULL;
"
"      v_billto_city         := NULL;
"
"      v_billto_state         := NULL;
"
"      v_billto_cntry         := NULL;
"
"      v_billto_po_box         := NULL;
"
"      v_billto_tele          := NULL;
"
"      v_billto_mobile         := NULL;
"
"      v_billto_fax          := NULL;
"
"      v_billto_email         := NULL;
"
"      v_billto_website         := NULL;
"
"      v_billto_ref1          := NULL;
"
"      v_billto_ref2          := NULL;
"
"      v_billto_gst_no        := NULL;
"
"      END;
"
"
"
"     BEGIN
"
"         SELECT ssl_loc_name1,
"
"        ssl_addr1,
"
"        ssl_addr2,
"
"        ssl_addr3,
"
"        ssl_zip,
"
"        ssl_city,
"
"        ssl_state,
"
"        ssl_country,
"
"        ssl_po_box,
"
"        ssl_tele,
"
"        ssl_mob_no,
"
"        ssl_fax,
"
"        ssl_email,
"
"        ssl_website,
"
"        ssl_gst_no,
"
"        ssl_ref1,
"
"        ssl_ref2
"
"           INTO v_shipto_loc_name,
"
"        v_shipto_addr1,
"
"        v_shipto_addr2,
"
"        v_shipto_addr3,
"
"        v_shipto_postal_code,
"
"        v_shipto_city,
"
"        v_shipto_state,
"
"        v_shipto_cntry,
"
"        v_shipto_po_box,
"
"        v_shipto_tele,
"
"        v_shipto_mobile,
"
"        v_shipto_fax,
"
"        v_shipto_email,
"
"        v_shipto_website,
"
"        v_shipto_gst_no,
"
"        v_ref1,
"
"        v_ref2
"
"           FROM suplr_ship_loc
"
"          WHERE ssl_bu = p_bu
"
"            AND ssl_suplr_id = p_cust_id
"
"            AND ssl_dflt_flg IN ('D','S');
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_shipto_loc_name        := NULL;
"
"     v_shipto_addr1         := NULL;
"
"     v_shipto_addr2         := NULL;
"
"     v_shipto_addr3        := NULL;
"
"     v_shipto_addr4        := NULL;
"
"     v_shipto_addr5         := NULL;
"
"     v_shipto_postal_code    := NULL;
"
"     v_shipto_city        := NULL;
"
"     v_shipto_state        := NULL;
"
"     v_shipto_cntry        := NULL;
"
"     v_shipto_po_box         := NULL;
"
"     v_shipto_tele           := NULL;
"
"     v_shipto_mobile        := NULL;
"
"     v_shipto_fax           := NULL;
"
"     v_shipto_email         := NULL;
"
"     v_shipto_website        := NULL;
"
"     v_shipto_dist           := NULL;
"
"     v_shipto_gst_no         := NULL;
"
"     v_ref1                := NULL;
"
"     v_ref2            := NULL;
"
"     v_shipto_dist        := 0;
"
"  END;
"
"
"
"  SELECT NVL(suplr_sales_item_source,'I')
"
"            INTO v_cust_item_req
"
"            FROM suppliers
"
"           WHERE suplr_bu = p_bu
"
"             AND suplr_suplr_id = p_cust_id
"
"             AND suplr_status = 'A'
"
"         AND suplr_party_type = 'C';
"
"
"
"              BEGIN
"
"               SELECT suplr_sales_area
"
"                  INTO v_sales_area
"
"                  FROM suppliers
"
"                 WHERE suplr_bu = p_bu
"
"                  AND suplr_suplr_id = p_cust_id
"
"             AND suplr_party_type = 'C';
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                  v_sales_area := NULL;
"
"               END;
"
"
"
"               BEGIN
"
"               SELECT spc_class_id
"
"                 INTO v_sales_price_cls
"
"                 FROM sales_price_classes
"
"                WHERE spc_bu = p_bu
"
"                  AND spc_sel_flag = 'Y';
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                 v_sales_price_cls := NULL;
"
"        END;
"
"
"
"          IF v_prod_id IS NOT NULL THEN
"
"
"
"             v_prod_price_basis := func_find_cust_so_price_basis(p_bu,
"
"                                                              p_plnt,
"
"                                                              p_cust_id,
"
"                                      v_prod_id,
"
"                                      v_prod_rev,
"
"                                      cr_st(indx).sm_part_no
"
"                                      );
"
"
"
"         v_tcf_id := null;/*func_find_dflt_tax_cls(p_bu,
"
"                          p_plnt,
"
"                          p_cust_id,
"
"                          v_prod_id,
"
"                          v_prod_rev,
"
"                          v_hsn_code,
"
"                          v_shipto_loc_id,
"
"                          TRUNC(SYSDATE)
"
"                                  );*/
"
"
"
"      v_tax_set_id := null;/*func_find_dflt_tax_set(p_bu,
"
"                                             p_plnt,
"
"                                     'C',
"
"                                     p_cust_id,
"
"                                     v_shipto_loc_id,
"
"                                     NULL,
"
"                                     v_gst_exempt_flag,
"
"                                     v_gst_types_of_supply
"
"                                     );*/
"
"         BEGIN
"
"      SELECT cohd_plnt_loc_id
"
"        INTO v_plnt_loc_id
"
"        FROM cust_order_hd
"
"       WHERE cohd_bu = p_bu
"
"         AND cohd_plnt = p_plnt
"
"         AND cohd_batch_no =  p_batch_no;
"
"      END;
"
"
"
"          IF v_prod_price_basis <> 'U' THEN
"
"
"
"            proc_find_sales_price(p_bu,
"
"                                      p_plnt,
"
"                                      p_cust_id,
"
"                                      v_sales_area,
"
"                                      v_sales_price_cls,
"
"                                      v_prod_id,
"
"                                      v_prod_rev,
"
"                                      cr_st(indx).sm_firm_qty,
"
"                                      TRUNC(SYSDATE),
"
"                                      v_prod_price_basis,
"
"                                      v_prod_uom,
"
"                                      NULL,
"
"                                      v_prod_store_id,
"
"                                      'S',
"
"                                      v_price,
"
"                                      v_mprice,
"
"                                      v_disc,
"
"                                      v_catalog_no,
"
"                                      v_contr_no,
"
"                                      v_amd_no,
"
"                                      v_amd_date,
"
"                                      v_po_no,
"
"                                      v_po_date,
"
"                                      v_po_ref,
"
"                                      v_po_seq_no,
"
"                                      v_tax_set_id,
"
"                                      v_tcf_id,
"
"                                      v_last_amd_no,
"
"                                        NULL,
"
"                                        --v_shipto_loc_id,
"
"                                        'SO',
"
"                                      v_currency,
"
"                    v_plnt_loc_id
"
"                         );
"
"
"
"            ELSE
"
"              v_price := 0;
"
"      END IF;
"
"    END IF;
"
"   DELETE cust_order_batch_addr
"
"    WHERE coba_bu = p_bu
"
"      AND coba_plnt = p_plnt
"
"      AND coba_batch_no = p_batch_no;
"
"
"
"      INSERT INTO cust_order_batch_addr(coba_bu,
"
"                    coba_plnt,
"
"                    coba_batch_no,
"
"                    coba_shipto_loc_name,
"
"                    coba_shipto_addr1,
"
"                    coba_shipto_addr2,
"
"                    coba_shipto_addr3,
"
"                    coba_shipto_addr4,
"
"                    coba_shipto_addr5,
"
"                    coba_shipto_postal_code,
"
"                    coba_shipto_city,
"
"                    coba_shipto_state,
"
"                    coba_shipto_cntry,
"
"                    coba_shipto_po_box,
"
"                    coba_shipto_tele,
"
"                    coba_shipto_mobile,
"
"                    coba_shipto_fax,
"
"                    coba_shipto_email,
"
"                    coba_shipto_website,
"
"                    coba_shipto_dist,
"
"                    coba_shipto_gst_no,
"
"                    coba_ref1,
"
"                    coba_ref2,
"
"                    coba_billto_loc_id,
"
"                    coba_billto_loc_name,
"
"                    coba_billto_addr1,
"
"                    coba_billto_addr2,
"
"                    coba_billto_addr3,
"
"                    coba_billto_postal_code,
"
"                    coba_billto_city,
"
"                    coba_billto_state,
"
"                    coba_billto_cntry,
"
"                    coba_billto_po_box,
"
"                    coba_billto_tele,
"
"                    coba_billto_mobile,
"
"                    coba_billto_fax,
"
"                    coba_billto_email,
"
"                    coba_billto_website,
"
"                    coba_billto_ref1,
"
"                    coba_billto_ref2,
"
"                    coba_billto_gst_no,
"
"                    coba_cre_by,
"
"                    coba_cre_ip_addr,
"
"                    coba_cre_os_user,
"
"                    coba_cre_emp_id,
"
"                    coba_cre_date
"
"                                        )
"
"                                 VALUES(p_bu,
"
"                                        p_plnt,
"
"                                        p_batch_no,
"
"                    v_shipto_loc_name,
"
"                    v_shipto_addr1,
"
"                    v_shipto_addr2,
"
"                    v_shipto_addr3,
"
"                    v_shipto_addr4,
"
"                    v_shipto_addr5,
"
"                    v_shipto_postal_code,
"
"                    v_shipto_city,
"
"                    v_shipto_state,
"
"                    v_shipto_cntry,
"
"                    v_shipto_po_box,
"
"                    v_shipto_tele,
"
"                    v_shipto_mobile,
"
"                    v_shipto_fax,
"
"                    v_shipto_email,
"
"                    v_shipto_website,
"
"                    NVL(v_shipto_dist,0),
"
"                    v_shipto_gst_no,
"
"                    v_ref1,
"
"                    v_ref2,
"
"                    v_billto_loc_id,
"
"                    v_billto_loc_name,
"
"                    v_billto_addr1,
"
"                    v_billto_addr2,
"
"                    v_billto_addr3,
"
"                    v_billto_postal_code,
"
"                    v_billto_city,
"
"                    v_billto_state,
"
"                    v_billto_cntry,
"
"                    v_billto_po_box,
"
"                    v_billto_tele,
"
"                    v_billto_mobile,
"
"                    v_billto_fax,
"
"                    v_billto_email,
"
"                    v_billto_website,
"
"                    v_billto_ref1,
"
"                    v_billto_ref2,
"
"                    v_billto_gst_no,
"
"                    p_user,
"
"                    Audit_Info.Get_IP_Address,
"
"                    Audit_Info.Get_OS_User,
"
"                    func_find_emp_id(p_bu,p_user),
"
"                    SYSDATE
"
"                                        );
"
"  IF v_prod_id IS NOT NULL THEN
"
"
"
"    INSERT INTO cust_order_ln (coln_bu,
"
"                               coln_plnt,
"
"                               coln_ref_unit,
"
"                               coln_batch_no,
"
"                               coln_doc_no,
"
"                               coln_doc_rev,
"
"                               coln_cust_id,
"
"                               coln_firm_type,
"
"                               coln_prod_id,
"
"                               coln_prod_rev,
"
"                               coln_prod_desc,
"
"                               coln_order_qty,
"
"                               coln_schd_start_date,
"
"                               coln_schd_end_date,
"
"                               coln_freq_type,
"
"                               coln_freq,
"
"                               coln_schd_frm_start_date,
"
"                               coln_schd_frm_end_date,
"
"                               coln_frm_freq_type,
"
"                               coln_frm_freq,
"
"                               coln_frm_qty,
"
"                               coln_price,
"
"                               coln_disc_pct,
"
"                               coln_prod_uom,
"
"                               coln_sale_uom,
"
"                               coln_conv_factor,
"
"                               coln_amend_flag,
"
"                               coln_price_basis,
"
"                               coln_class_id,
"
"                               coln_store_id,
"
"                               coln_status,
"
"                               coln_backlog_qty,
"
"                               coln_type,
"
"                               coln_sales_area,
"
"                               coln_sub_terr_id,
"
"                               coln_sales_person,
"
"                               coln_cre_by,
"
"                               coln_cre_date,
"
"                               coln_sal_teri_id,
"
"                               coln_mrp_price,
"
"                               coln_tolr_pct,
"
"                               coln_tcf_id,
"
"                               coln_last_amd_no,
"
"                               coln_hold_flag,
"
"                               coln_un_hold_flag,
"
"                               coln_so_sel_flag,
"
"                               coln_proc_qty,
"
"                               coln_so_qty,
"
"                               coln_currency,
"
"                               coln_exchange_rate,
"
"                               coln_act_frm_qty,
"
"                               coln_act_tent_qty,
"
"                               coln_tac_rqrd_flag,
"
"                               coln_drw_no,
"
"                               coln_drw_rev,
"
"                               coln_spl_disc_amt,
"
"                               coln_cash_disc_amt,
"
"                               coln_cust_po_no,
"
"                               coln_cust_po_date,
"
"                               coln_tax_set_id,
"
"                               coln_hsn_code,
"
"                               coln_cust_prod_id,
"
"                               coln_po_no,
"
"                               coln_po_date
"
"                               )
"
"                       VALUES (p_bu,
"
"                       p_plnt,
"
"                       p_plnt,
"
"                       p_batch_no,
"
"                       v_doc_no,--max of doc no
"
"                       0,
"
"                       p_cust_id,
"
"                       CASE WHEN cr_st(indx).sm_firm_qty > 0 AND cr_st(indx).sm_ten_qty > 0 THEN 'FT'
"
"                            WHEN cr_st(indx).sm_firm_qty > 0 AND cr_st(indx).sm_ten_qty = 0 THEN 'F'
"
"                            WHEN cr_st(indx).sm_firm_qty = 0 AND cr_st(indx).sm_ten_qty > 0 THEN 'T'
"
"                            ELSE 'F'
"
"                       END,
"
"                       v_prod_id,
"
"                       NVL(v_prod_rev,0),
"
"                       func_find_prod_qry_desc(p_bu,v_prod_id,v_prod_rev,1),
"
"                       NVL(cr_st(indx).sm_ten_qty,0),
"
"                       ADD_MONTHS(ROUND((ADD_MONTHS(SYSDATE,1)),'MM'),-1),
"
"                       LAST_DAY(ADD_MONTHS(ROUND((ADD_MONTHS(SYSDATE,1)),'MM'),-1)),
"
"                       'M',
"
"                       1,
"
"                       TRUNC(SYSDATE),
"
"                       LAST_DAY(TRUNC(SYSDATE)),
"
"                       'M',
"
"                       1,
"
"                       NVL(cr_st(indx).sm_firm_qty,0),--firm_qty
"
"                       NVL(v_price,0),--price
"
"                       0,
"
"                       v_prod_uom,
"
"                       v_prod_uom,
"
"                       1,
"
"                       'N',
"
"                       v_prod_price_basis,
"
"                       v_sales_cls ,
"
"                       v_prod_store_id,
"
"                       'E',
"
"                       0,
"
"                       'SO',
"
"                       v_sal_area,
"
"                       v_sub_terr,
"
"                       v_sal_person ,
"
"                       'ADMIN',
"
"                       TRUNC(SYSDATE),
"
"                       v_sal_terr_id ,
"
"                       0,
"
"                       0,
"
"                       v_tcf_id,
"
"                       0,
"
"                       'N',
"
"                       'N',
"
"                       'N',
"
"                       0,
"
"                       0,
"
"                       v_currency,
"
"                       1,
"
"                       NVL(cr_st(indx).sm_firm_qty,0),
"
"                       NVL(cr_st(indx).sm_ten_qty,0),
"
"                       'N',
"
"                       v_prod_drw_no,
"
"                       v_prod_drw_rev,
"
"                       0,
"
"                               0,
"
"                               v_po_no,
"
"                               v_po_date,
"
"                               v_tax_set_id,
"
"                               v_hsn_code,
"
"                               v_cust_prod_id,
"
"                               v_po_no,
"
"                               v_po_date
"
"                               );
"
"    END IF;
"
"    p_res := 'Y';
"
"   END LOOP;
"
"  END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"END proc_ins_cust_schld_tata_mig;
"
"
"
"/* Customer Schedule Mahindra Migration */
"
"
"
" PROCEDURE proc_ins_cust_schld_mah_mig(p_bu        business_units.bu_id%TYPE,
"
"                       p_plnt         bus_unit_plants.bup_plant_id%TYPE,
"
"                       p_batch_no     cust_order_hd.cohd_batch_no%TYPE,
"
"                       p_fname        VARCHAR2,
"
"                       p_sep        VARCHAR2,
"
"                       p_user        cust_order_hd.cohd_cre_by%TYPE,
"
"                       p_res    OUT    VARCHAR2
"
"                       )
"
"AS
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_exe_id        VARCHAR2(10);
"
"v_doc_no         NUMBER(15);
"
"v_prod_price_basis     VARCHAR2(20);
"
"v_prod_cls        VARCHAR2(20);
"
"v_sales_cls         VARCHAR2(20);
"
"v_prod_sub_cls         VARCHAR2(20);
"
"v_prod_store_id        VARCHAR2(20);
"
"v_sal_area         VARCHAR2(20);
"
"v_sub_terr         VARCHAR2(20);
"
"v_sal_person        VARCHAR2(20);
"
"v_sal_terr_id         VARCHAR2(20);
"
"v_currency         VARCHAR2(20);
"
"v_prod_drw_no         VARCHAR2(25);
"
"v_prod_drw_rev         VARCHAR2(5);
"
"v_prod_uom         VARCHAR2(5);
"
"v_prod_id        products.prod_id%TYPE;
"
"v_prod_rev        NUMBER(5);
"
"v_prod_desc        VARCHAR2(150);
"
"v_err_msg            VARCHAR2(4000);
"
"v_type            VARCHAR2(2);
"
"v_shipto_loc_id        VARCHAR2(10);
"
"v_shipto_loc_name    VARCHAR2(50);
"
"v_shipto_addr1        VARCHAR2(100);
"
"v_shipto_addr2        VARCHAR2(50);
"
"v_shipto_addr3        VARCHAR2(50);
"
"v_shipto_addr4        VARCHAR2(50);
"
"v_shipto_addr5          VARCHAR2(50);
"
"v_shipto_bref_addr      VARCHAR2(500);
"
"v_shipto_postal_code    VARCHAR2(15);
"
"v_shipto_city        VARCHAR2(5);
"
"v_shipto_state         VARCHAR2(5);
"
"v_shipto_cntry         VARCHAR2(5);
"
"v_shipto_po_box     VARCHAR2(15);
"
"v_shipto_tele         VARCHAR2(30);
"
"v_shipto_mobile        VARCHAR2(30);
"
"v_shipto_fax         VARCHAR2(30);
"
"v_shipto_email         VARCHAR2(50);
"
"v_shipto_website     VARCHAR2(50);
"
"v_shipto_dist         NUMBER(30);
"
"v_shipto_gst_no     VARCHAR2(15);
"
"v_ref1          VARCHAR2(50);
"
"v_ref2             VARCHAR2(50);
"
"v_billto_loc_id     VARCHAR2(10);
"
"v_billto_loc_name       VARCHAR2(50);
"
"v_billto_addr1          VARCHAR2(50);
"
"v_billto_addr2         VARCHAR2(50);
"
"v_billto_addr3         VARCHAR2(50);
"
"v_billto_bref_addr      VARCHAR2(500);
"
"v_billto_postal_code    VARCHAR2(15);
"
"v_billto_city         VARCHAR2(5);
"
"v_billto_state      VARCHAR2(5);
"
"v_billto_cntry      VARCHAR2(5);
"
"v_billto_po_box      VARCHAR2(15);
"
"v_billto_tele         VARCHAR2(30);
"
"v_billto_mobile        VARCHAR2(30);
"
"v_billto_fax         VARCHAR2(30);
"
"v_billto_email      VARCHAR2(50);
"
"v_billto_website    VARCHAR2(50);
"
"v_billto_ref1       VARCHAR2(50);
"
"v_billto_ref2         VARCHAR2(50);
"
"v_billto_gst_no     VARCHAR2(15);
"
"v_cust_prod_id        cust_prod.custp_cust_prod_id%TYPE;
"
"v_price_basis        cust_prod.custp_price_basis%TYPE;
"
"v_sales_area        suppliers.suplr_sales_area%TYPE;
"
"v_price            NUMBER;
"
"v_mprice        NUMBER;
"
"v_disc            NUMBER;
"
"v_catalog_no        VARCHAR2(30);
"
"v_contr_no        VARCHAR2(30);
"
"v_amd_no        NUMBER;
"
"v_amd_date        DATE;
"
"v_sale_uom        VARCHAR2(5);
"
"v_po_no            VARCHAR2(30);
"
"v_po_date        DATE;
"
"v_po_ref        VARCHAR2(100);
"
"v_po_seq_no        NUMBER(5);
"
"v_tax_set_id        VARCHAR2(10);
"
"v_tcf_id        VARCHAR2(10);
"
"v_last_amd_no        NUMBER(5);
"
"v_seq_no        NUMBER(5) := 0;
"
"v_conv_factor        NUMBER(15,8);
"
"v_sub_seq_no        NUMBER;
"
"v_cm_seq_no        NUMBER;
"
"v_cls_id            VARCHAR2 (10);
"
"v_cust_item_req        VARCHAR2(1);
"
"v_sales_price_cls    VARCHAR2(10);
"
"v_loc_id1        VARCHAR2(10);
"
"v_gst_exempt_flag    VARCHAR2(1);
"
"v_gst_types_of_supply    VARCHAR2(1);
"
"v_hsn_code        VARCHAR2(25);
"
"v_plant            VARCHAR2(10);
"
"v_cust_prod_id        products.prod_id%TYPE;
"
"
"
"TYPE typ_ins_gpi IS RECORD (sm_plnt            VARCHAR2(10),
"
"                            sm_plnt_desc        VARCHAR2(50),
"
"                            sm_part_no             VARCHAR2(25),
"
"                sm_part_desc        VARCHAR2(150),
"
"                sm_vendor            VARCHAR2(10),
"
"                sm_vendor_desc        VARCHAR2(100),
"
"                sm_aug_qty                 NUMBER(12,3),
"
"                            sm_sep_qty           NUMBER(12,3),
"
"                            sm_oct_qty           NUMBER(12,3)
"
"                            );
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"  p_res := 'N';
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"        v_sql := 'CREATE TABLE SCM_MIGRATION(sm_plnt            VARCHAR2(10),
"
"                         sm_plnt_desc        VARCHAR2(50),
"
"                         sm_part_no         VARCHAR2(25),
"
"                         sm_part_desc        VARCHAR2(150),
"
"                         sm_vendor            VARCHAR2(10),
"
"                         sm_vendor_desc        VARCHAR2(100),
"
"                         sm_aug_qty                 NUMBER(12,3),
"
"                         sm_sep_qty           NUMBER(12,3),
"
"                         sm_oct_qty           NUMBER(12,3)
"
"                                 )
"
"       ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"       DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"       ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"       SKIP 1
"
"       FIELDS TERMINATED BY '''||p_sep||'''
"
"       MISSING FIELD VALUES ARE NULL
"
"       REJECT ROWS WITH ALL NULL FIELDS(sm_plnt         CHAR(255),
"
"                            sm_plnt_desc        CHAR(255),
"
"                            sm_part_no        CHAR(255),
"
"                    sm_part_desc         CHAR(255),
"
"                                        sm_vendor        CHAR(255),
"
"                    sm_vendor_desc        CHAR(255),
"
"                    sm_aug_qty                 CHAR(255),
"
"                    sm_sep_qty           CHAR(255),
"
"                    sm_oct_qty           CHAR(255)
"
"                            )
"
"        )
"
"       LOCATION ('''||p_fname||''')
"
"       ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"  commit;
"
"  --raise_application_error(-20999,'HRM'||'/'||p_sep);
"
"  BEGIN
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
"   DELETE cust_order_ln_temp
"
"    WHERE colnt_bu = p_bu
"
"      AND colnt_plnt = p_plnt
"
"      AND colnt_batch_no = p_batch_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"    --raise_application_error(-20999,'HRM'||'/'||p_sep);
"
"   /*BEGIN
"
"
"
"   SELECT NVL(MAX(TO_NUMBER(coln_doc_no)),0)+1
"
"     INTO v_doc_no
"
"     FROM cust_order_ln
"
"    WHERE coln_bu = p_bu
"
"      AND coln_plnt = p_plnt;
"
"
"
"       BEGIN
"
"    SELECT fnpch_cust_id
"
"      INTO v_cust_id
"
"      FROM fsnr_mm_cs_dtls
"
"     WHERE fnpch_bu = p_bu
"
"       AND fnpch_mm_plnt_id    = p_plnt;
"
"
"
"    EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_cust_id := NULL;
"
"    END;
"
"
"
"          BEGIN
"
"            SELECT custp_prod_id ,
"
"                   custp_prod_rev,
"
"                   custp_uom,
"
"                   custp_cust_prod_id
"
"              INTO v_prod_id,
"
"                  v_prod_rev,
"
"                   v_prod_uom,
"
"                   v_cust_prod_id
"
"              FROM cust_prod
"
"             WHERE custp_bu = p_bu
"
"               AND custp_cust_id = p_cust_id
"
"               AND custp_cust_prod_id = cr_st(indx).sm_part_no;;
"
"
"
"    EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_prod_id := NULL;
"
"          v_prod_rev := 0;
"
"          v_prod_uom := NULL;
"
"        END;
"
"
"
"    IF v_prod_id IS NOT NULL THEN
"
"          BEGIN
"
"            SELECT prodplnt_cls ,
"
"                   prodplnt_sub_cls,
"
"                   prodplnt_deflt_store_id
"
"              INTO v_prod_cls ,
"
"                  v_prod_sub_cls ,
"
"                   v_prod_store_id
"
"              FROM prod_plants
"
"             WHERE prodplnt_bu = p_bu
"
"               AND prodplnt_plnt = p_plnt
"
"               AND prodplnt_prod_id = v_prod_id
"
"               AND prodplnt_prod_rev = v_prod_rev
"
"               AND prodplnt_status ='A';
"
"
"
"    EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"          v_prod_price_basis := 'U';
"
"          v_prod_cls := NULL;
"
"          v_prod_sub_cls := NULL;
"
"          v_prod_store_id := NULL;
"
"        END;
"
"     END IF;
"
"
"
"         BEGIN
"
"            SELECT cust_sales_area,
"
"           cust_sales_person,
"
"           cust_sales_terr,
"
"           cust_sub_terr_id,
"
"           cust_currency
"
"              INTO v_sal_area,
"
"                  v_sal_person,
"
"           v_sal_terr_id,
"
"           v_sub_terr,
"
"           v_currency
"
"          FROM customers
"
"         WHERE cust_bu = p_bu
"
"           AND cust_cust_id = p_cust_id
"
"           AND cust_status = 'A';
"
"
"
"       EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"        v_sal_area := NULL;
"
"        v_sal_person := NULL;
"
"        v_sal_terr_id := NULL;
"
"        v_sub_terr := NULL;
"
"        v_currency := NULL;
"
"       END;
"
"
"
"     IF v_prod_id IS NOT NULL THEN
"
"       BEGIN
"
"         SELECT NVL(prod_cust_drg_no,0),
"
"            NVL(prod_cust_drg_rev,0),
"
"            prod_gst_exempt_flag,
"
"            prod_gst_types_of_supply,
"
"            prod_hsn_code
"
"           INTO v_prod_drw_no,
"
"            v_prod_drw_rev,
"
"            v_gst_exempt_flag,
"
"            v_gst_types_of_supply,
"
"            v_hsn_code
"
"           FROM products
"
"          where prod_bu = p_bu
"
"        AND prod_id = v_prod_id
"
"        AND prod_rev = NVL(v_prod_rev,0)
"
"        AND prod_status = 'A';
"
"
"
"        EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"        v_prod_drw_no := NULL;
"
"        v_prod_drw_rev := NULL;
"
"        END;
"
"    END IF;
"
"
"
"       BEGIN
"
"       SELECT spc_class_id
"
"         INTO v_sales_cls
"
"         FROM sales_price_classes
"
"        WHERE spc_bu = p_bu
"
"          AND spc_sel_flag = 'Y';
"
"
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN
"
"         v_sales_cls := NULL;
"
"       END;
"
"
"
" --EXCEPTION  WHEN NO_DATA_FOUND THEN
"
"   --Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id||'~'||cr_st(indx).sm_cust_id);
"
" END;
"
"   --Raise_Application_Error(-20999,'HRM'||P_BU||'~'||P_PLNT||'~'||cr_st(indx).sm_prod_id);
"
"
"
"     BEGIN
"
"         SELECT csl_loc_id,
"
"                csl_loc_name1,
"
"        csl_addr1,
"
"        csl_addr2,
"
"        csl_addr3,
"
"        csl_addr4,
"
"        csl_addr5,
"
"        csl_bref_addr,
"
"        csl_zip,
"
"        csl_city,
"
"        csl_state,
"
"        csl_country,
"
"        csl_po_box,
"
"        csl_tele1,
"
"        csl_mbl_no,
"
"        csl_fax1,
"
"        csl_email1,
"
"        csl_website1,
"
"        csl_ref1,
"
"        csl_ref2,
"
"        csl_gst_no
"
"           INTO v_billto_loc_id,
"
"                v_billto_loc_name,
"
"        v_billto_addr1,
"
"        v_billto_addr2,
"
"        v_billto_addr3,
"
"        v_billto_addr4,
"
"        v_billto_addr5,
"
"        v_billto_bref_addr,
"
"        v_billto_postal_code,
"
"        v_billto_city,
"
"        v_billto_state,
"
"        v_billto_cntry,
"
"        v_billto_po_box,
"
"        v_billto_tele,
"
"        v_billto_mobile,
"
"        v_billto_fax,
"
"        v_billto_email,
"
"        v_billto_website,
"
"        v_billto_ref1,
"
"        v_billto_ref2,
"
"        v_billto_gst_no
"
"           FROM cust_ship_loc
"
"          WHERE csl_bu = p_bu
"
"            AND csl_cust_id = p_cust_id
"
"            AND csl_dflt_flg IN ('D','B');
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"      v_billto_loc_id        := NULL;
"
"      v_billto_loc_name        := NULL;
"
"      v_billto_addr1         := NULL;
"
"      v_billto_addr2         := NULL;
"
"      v_billto_addr3         := NULL;
"
"      v_billto_addr4        := NULL;
"
"      v_billto_addr5         := NULL;
"
"      v_billto_bref_addr        := NULL;
"
"      v_billto_postal_code        := NULL;
"
"      v_billto_city         := NULL;
"
"      v_billto_state         := NULL;
"
"      v_billto_cntry         := NULL;
"
"      v_billto_po_box         := NULL;
"
"      v_billto_tele          := NULL;
"
"      v_billto_mobile         := NULL;
"
"      v_billto_fax          := NULL;
"
"      v_billto_email         := NULL;
"
"      v_billto_website         := NULL;
"
"      v_billto_ref1          := NULL;
"
"      v_billto_ref2          := NULL;
"
"      v_billto_gst_no        := NULL;
"
"      END;
"
"
"
"     BEGIN
"
"         SELECT csl_loc_id,
"
"                csl_loc_name1,
"
"        csl_addr1,
"
"        csl_addr2,
"
"        csl_addr3,
"
"        csl_addr4,
"
"        csl_addr5,
"
"        csl_bref_addr,
"
"        csl_zip,
"
"        csl_city,
"
"        csl_state,
"
"        csl_country,
"
"        csl_po_box,
"
"        csl_tele1,
"
"        csl_mbl_no,
"
"        csl_fax1,
"
"        csl_email1,
"
"        csl_website1,
"
"        csl_gst_no,
"
"        csl_ref1,
"
"        csl_ref2,
"
"        csl_ship_dist
"
"           INTO v_shipto_loc_id,
"
"                v_shipto_loc_name,
"
"        v_shipto_addr1,
"
"        v_shipto_addr2,
"
"        v_shipto_addr3,
"
"        v_shipto_addr4,
"
"        v_shipto_addr5,
"
"        v_shipto_bref_addr,
"
"        v_shipto_postal_code,
"
"        v_shipto_city,
"
"        v_shipto_state,
"
"        v_shipto_cntry,
"
"        v_shipto_po_box,
"
"        v_shipto_tele,
"
"        v_shipto_mobile,
"
"        v_shipto_fax,
"
"        v_shipto_email,
"
"        v_shipto_website,
"
"        v_shipto_gst_no,
"
"        v_ref1,
"
"        v_ref2,
"
"        v_shipto_dist
"
"           FROM cust_ship_loc
"
"          WHERE csl_bu = p_bu
"
"            AND csl_cust_id = p_cust_id
"
"            AND csl_dflt_flg IN ('D','S');
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_shipto_loc_id        := NULL;
"
"     v_shipto_loc_name        := NULL;
"
"     v_shipto_addr1         := NULL;
"
"     v_shipto_addr2         := NULL;
"
"     v_shipto_addr3        := NULL;
"
"     v_shipto_addr4        := NULL;
"
"     v_shipto_addr5         := NULL;
"
"     v_shipto_bref_addr     := NULL;
"
"     v_shipto_postal_code    := NULL;
"
"     v_shipto_city        := NULL;
"
"     v_shipto_state        := NULL;
"
"     v_shipto_cntry        := NULL;
"
"     v_shipto_po_box         := NULL;
"
"     v_shipto_tele           := NULL;
"
"     v_shipto_mobile        := NULL;
"
"     v_shipto_fax           := NULL;
"
"     v_shipto_email         := NULL;
"
"     v_shipto_website        := NULL;
"
"     v_shipto_dist           := NULL;
"
"     v_shipto_gst_no         := NULL;
"
"     v_ref1                := NULL;
"
"     v_ref2            := NULL;
"
"     v_shipto_dist        := 0;
"
"  END;
"
"
"
"  SELECT NVL(cust_sales_item_source,'I')
"
"            INTO v_cust_item_req
"
"            FROM customers
"
"           WHERE cust_bu = p_bu
"
"             AND cust_cust_id = p_cust_id
"
"             AND cust_status = 'A';
"
"
"
"              BEGIN
"
"               SELECT cust_sales_area
"
"                  INTO v_sales_area
"
"                  FROM customers
"
"                 WHERE cust_bu = p_bu
"
"                  AND cust_cust_id = p_cust_id;
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                  v_sales_area := NULL;
"
"               END;
"
"
"
"               BEGIN
"
"               SELECT spc_class_id
"
"                 INTO v_sales_price_cls
"
"                 FROM sales_price_classes
"
"                WHERE spc_bu = p_bu
"
"                  AND spc_sel_flag = 'Y';
"
"               EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                 v_sales_price_cls := NULL;
"
"        END;
"
"
"
"          IF v_prod_id IS NOT NULL THEN
"
"
"
"             v_prod_price_basis := func_find_cust_so_price_basis(p_bu,
"
"                                                              p_plnt,
"
"                                                              p_cust_id,
"
"                                      v_prod_id,
"
"                                      v_prod_rev,
"
"                                      cr_st(indx).sm_part_no
"
"                                      );
"
"
"
"         v_tcf_id := func_find_dflt_tax_cls(p_bu,
"
"                          p_plnt,
"
"                          p_cust_id,
"
"                          v_prod_id,
"
"                          v_prod_rev,
"
"                          v_hsn_code,
"
"                          v_shipto_loc_id,
"
"                          TRUNC(SYSDATE)
"
"                                  );
"
"
"
"      v_tax_set_id := func_find_dflt_tax_set(p_bu,
"
"                                             p_plnt,
"
"                                     'C',
"
"                                     p_cust_id,
"
"                                     v_shipto_loc_id,
"
"                                     NULL,
"
"                                     v_gst_exempt_flag,
"
"                                     v_gst_types_of_supply
"
"                                     );
"
"
"
"          IF v_prod_price_basis <> 'U' THEN
"
"
"
"            proc_find_sales_price(p_bu,
"
"                                      p_plnt,
"
"                                      p_cust_id,
"
"                                      v_sales_area,
"
"                                      v_sales_price_cls,
"
"                                      v_prod_id,
"
"                                      v_prod_rev,
"
"                                      cr_st(indx).sm_aug_qty,
"
"                                      TRUNC(SYSDATE),
"
"                                      v_prod_price_basis,
"
"                                      v_prod_uom,
"
"                                      NULL,
"
"                                      v_prod_store_id,
"
"                                      'S',
"
"                                      v_price,
"
"                                      v_mprice,
"
"                                      v_disc,
"
"                                      v_catalog_no,
"
"                                      v_contr_no,
"
"                                      v_amd_no,
"
"                                      v_amd_date,
"
"                                      v_po_no,
"
"                                      v_po_date,
"
"                                      v_po_ref,
"
"                                      v_po_seq_no,
"
"                                      v_tax_set_id,
"
"                                      v_tcf_id,
"
"                                      v_last_amd_no,
"
"                                        NULL,
"
"                                        v_shipto_loc_id,
"
"                                        'SO',
"
"                                      v_currency
"
"                         );
"
"
"
"            ELSE
"
"              v_price := 0;
"
"      END IF;
"
"    END IF;
"
"
"
"   DELETE cust_order_batch_addr
"
"    WHERE coba_bu = p_bu
"
"      AND coba_plnt = p_plnt
"
"      AND coba_batch_no = p_batch_no;
"
"
"
"      INSERT INTO cust_order_batch_addr(coba_bu,
"
"                    coba_plnt,
"
"                    coba_batch_no,
"
"                    coba_shipto_loc_id,
"
"                    coba_shipto_loc_name,
"
"                    coba_shipto_addr1,
"
"                    coba_shipto_addr2,
"
"                    coba_shipto_addr3,
"
"                    coba_shipto_addr4,
"
"                    coba_shipto_addr5,
"
"                    coba_shipto_bref_addr,
"
"                    coba_shipto_postal_code,
"
"                    coba_shipto_city,
"
"                    coba_shipto_state,
"
"                    coba_shipto_cntry,
"
"                    coba_shipto_po_box,
"
"                    coba_shipto_tele,
"
"                    coba_shipto_mobile,
"
"                    coba_shipto_fax,
"
"                    coba_shipto_email,
"
"                    coba_shipto_website,
"
"                    coba_shipto_dist,
"
"                    coba_shipto_gst_no,
"
"                    coba_ref1,
"
"                    coba_ref2,
"
"                    coba_billto_loc_id,
"
"                    coba_billto_loc_name,
"
"                    coba_billto_addr1,
"
"                    coba_billto_addr2,
"
"                    coba_billto_addr3,
"
"                    coba_billto_addr4,
"
"                    coba_billto_addr5,
"
"                    coba_billto_bref_addr,
"
"                    coba_billto_postal_code,
"
"                    coba_billto_city,
"
"                    coba_billto_state,
"
"                    coba_billto_cntry,
"
"                    coba_billto_po_box,
"
"                    coba_billto_tele,
"
"                    coba_billto_mobile,
"
"                    coba_billto_fax,
"
"                    coba_billto_email,
"
"                    coba_billto_website,
"
"                    coba_billto_ref1,
"
"                    coba_billto_ref2,
"
"                    coba_billto_gst_no,
"
"                    coba_cre_by,
"
"                    coba_cre_ip_addr,
"
"                    coba_cre_os_user,
"
"                    coba_cre_emp_id,
"
"                    coba_cre_date
"
"                                        )
"
"                                 VALUES(p_bu,
"
"                                        p_plnt,
"
"                                        p_batch_no,
"
"                    v_shipto_loc_id,
"
"                    v_shipto_loc_name,
"
"                    v_shipto_addr1,
"
"                    v_shipto_addr2,
"
"                    v_shipto_addr3,
"
"                    v_shipto_addr4,
"
"                    v_shipto_addr5,
"
"                    v_shipto_bref_addr,
"
"                    v_shipto_postal_code,
"
"                    v_shipto_city,
"
"                    v_shipto_state,
"
"                    v_shipto_cntry,
"
"                    v_shipto_po_box,
"
"                    v_shipto_tele,
"
"                    v_shipto_mobile,
"
"                    v_shipto_fax,
"
"                    v_shipto_email,
"
"                    v_shipto_website,
"
"                    NVL(v_shipto_dist,0),
"
"                    v_shipto_gst_no,
"
"                    v_ref1,
"
"                    v_ref2,
"
"                    v_billto_loc_id,
"
"                    v_billto_loc_name,
"
"                    v_billto_addr1,
"
"                    v_billto_addr2,
"
"                    v_billto_addr3,
"
"                    v_billto_addr4,
"
"                    v_billto_addr5,
"
"                    v_billto_bref_addr,
"
"                    v_billto_postal_code,
"
"                    v_billto_city,
"
"                    v_billto_state,
"
"                    v_billto_cntry,
"
"                    v_billto_po_box,
"
"                    v_billto_tele,
"
"                    v_billto_mobile,
"
"                    v_billto_fax,
"
"                    v_billto_email,
"
"                    v_billto_website,
"
"                    v_billto_ref1,
"
"                    v_billto_ref2,
"
"                    v_billto_gst_no,
"
"                    p_user,
"
"                    Audit_Info.Get_IP_Address,
"
"                    Audit_Info.Get_OS_User,
"
"                    func_find_emp_id(p_bu,p_user),
"
"                    SYSDATE
"
"                                        );
"
"
"
"    INSERT INTO cust_order_ln (coln_bu,
"
"                               coln_plnt,
"
"                               coln_ref_unit,
"
"                               coln_batch_no,
"
"                               coln_doc_no,
"
"                               coln_doc_rev,
"
"                               coln_cust_id,
"
"                               coln_firm_type,
"
"                               coln_prod_id,
"
"                               coln_prod_rev,
"
"                               coln_prod_desc,
"
"                               coln_order_qty,
"
"                               coln_schd_start_date,
"
"                               coln_schd_end_date,
"
"                               coln_freq_type,
"
"                               coln_freq,
"
"                               coln_schd_frm_start_date,
"
"                               coln_schd_frm_end_date,
"
"                               coln_frm_freq_type,
"
"                               coln_frm_freq,
"
"                               coln_frm_qty,
"
"                               coln_price,
"
"                               coln_disc_pct,
"
"                               coln_prod_uom,
"
"                               coln_sale_uom,
"
"                               coln_conv_factor,
"
"                               coln_amend_flag,
"
"                               coln_price_basis,
"
"                               coln_class_id,
"
"                               coln_store_id,
"
"                               coln_status,
"
"                               coln_backlog_qty,
"
"                               coln_type,
"
"                               coln_sales_area,
"
"                               coln_sub_terr_id,
"
"                               coln_sales_person,
"
"                               coln_cre_by,
"
"                               coln_cre_date,
"
"                               coln_sal_teri_id,
"
"                               coln_mrp_price,
"
"                               coln_tolr_pct,
"
"                               coln_tcf_id,
"
"                               coln_last_amd_no,
"
"                               coln_hold_flag,
"
"                               coln_un_hold_flag,
"
"                               coln_so_sel_flag,
"
"                               coln_proc_qty,
"
"                               coln_so_qty,
"
"                               coln_currency,
"
"                               coln_exchange_rate,
"
"                               coln_act_frm_qty,
"
"                               coln_act_tent_qty,
"
"                               coln_tac_rqrd_flag,
"
"                               coln_drw_no,
"
"                               coln_drw_rev,
"
"                               coln_spl_disc_amt,
"
"                               coln_cash_disc_amt,
"
"                               coln_cust_po_no,
"
"                               coln_cust_po_date,
"
"                               coln_tax_set_id,
"
"                               coln_hsn_code,
"
"                               coln_cust_plnt_id,
"
"                   coln_cust_plnt_name,
"
"                   coln_vendor_id,
"
"                               coln_vendor_name
"
"                               )
"
"                       VALUES (p_bu,
"
"                       p_plnt,
"
"                       p_plnt,
"
"                       p_batch_no,
"
"                       v_doc_no,--max of doc no
"
"                       0,
"
"                       p_cust_id,
"
"                       CASE WHEN cr_st(indx).sm_aug_qty > 0 AND cr_st(indx).sm_sep_qty > 0 OR cr_st(indx).sm_oct_qty > 0 THEN 'FT'
"
"                            WHEN cr_st(indx).sm_aug_qty > 0 AND cr_st(indx).sm_sep_qty = 0 OR cr_st(indx).sm_oct_qty = 0 THEN 'F'
"
"                            WHEN cr_st(indx).sm_aug_qty = 0 AND cr_st(indx).sm_sep_qty > 0 OR cr_st(indx).sm_oct_qty > 0 THEN 'T'
"
"                            ELSE 'F'
"
"                       END,
"
"                       v_prod_id,
"
"                       NVL(v_prod_rev,0),
"
"                       func_find_prod_qry_desc(p_bu,v_prod_id,v_prod_rev,1),
"
"                       NVL(cr_st(indx).sm_sep_qty,cr_st(indx).sm_oct_qty),
"
"                       NULL,
"
"                       NULL,
"
"                       'M',
"
"                       1,
"
"                       NULL,
"
"                       NULL,
"
"                       'M',
"
"                       1,
"
"                       NVL(cr_st(indx).sm_aug_qty,0),--firm_qty
"
"                       NVL(v_price,0),--price
"
"                       0,
"
"                       v_prod_uom,
"
"                       v_prod_uom,
"
"                       1,
"
"                       'N',
"
"                       v_prod_price_basis,
"
"                       v_sales_cls ,
"
"                       v_prod_store_id,
"
"                       'E',
"
"                       0,
"
"                       'SO',
"
"                       v_sal_area,
"
"                       v_sub_terr,
"
"                       v_sal_person ,
"
"                       'ADMIN',
"
"                       TRUNC(SYSDATE),
"
"                       v_sal_terr_id ,
"
"                       0,
"
"                       0,
"
"                       v_tcf_id,
"
"                       0,
"
"                       'N',
"
"                       'N',
"
"                       'N',
"
"                       0,
"
"                       0,
"
"                       v_currency,
"
"                       1,
"
"                       NVL(cr_st(indx).sm_aug_qty,0),
"
"                       NVL(cr_st(indx).sm_sep_qty,cr_st(indx).sm_oct_qty),
"
"                       'N',
"
"                       v_prod_drw_no,
"
"                       v_prod_drw_rev,
"
"                       0,
"
"                               0,
"
"                               NULL,
"
"                               NULL,
"
"                               v_tax_set_id,
"
"                               v_hsn_code,
"
"                               cr_st(indx).sm_plnt,
"
"                               cr_st(indx).sm_plnt_desc,
"
"                               cr_st(indx).sm_vendor,
"
"                               cr_st(indx).sm_vendor_desc
"
"                               );  */
"
"
"
"  FOR cr1 IN (SELECT *
"
"        FROM fsnr_mm_bu_unit_dtls
"
"           WHERE fmbud_bu = p_bu
"
"             AND fmbud_user_id = p_user
"
"             AND fmbud_mm_plnt_id = p_plnt
"
"             AND fmbud_cust_id = cr_st(indx).sm_vendor)
"
"  LOOP
"
"
"
"  SELECT NVL(MAX(TO_NUMBER(colnt_seq_no)),0)+1
"
"    INTO v_seq_no
"
"    FROM cust_order_ln_temp
"
"   WHERE colnt_bu = p_bu
"
"     AND colnt_plnt = p_plnt
"
"     AND colnt_batch_no = p_batch_no;
"
"
"
"         INSERT INTO cust_order_ln_temp(colnt_bu,
"
"                        colnt_plnt,
"
"                        colnt_batch_no,
"
"                        colnt_seq_no,
"
"                    colnt_cust_plnt_id,
"
"                    colnt_cust_plnt_name,
"
"                    colnt_cust_prod_id,
"
"                    colnt_cust_prod_desc,
"
"                    colnt_vendor_id,
"
"                    colnt_vendor_name,
"
"                    colnt_firm_qty,
"
"                    colnt_ten_qty,
"
"                    colnt_ten_qty1,
"
"                    colnt_reference,
"
"                    colnt_sel_flag,
"
"                    colnt_sel_user,
"
"                    colnt_cre_by,
"
"                    colnt_cre_ip_addr,
"
"                    colnt_cre_os_user,
"
"                    colnt_cre_emp_id,
"
"                    colnt_cre_date
"
"                                    )
"
"                             VALUES(p_bu,
"
"                                    p_plnt,
"
"                                    p_batch_no,
"
"                                    v_seq_no,
"
"                                    cr_st(indx).sm_plnt,
"
"                                    cr_st(indx).sm_plnt_desc,
"
"                                    cr_st(indx).sm_part_no,
"
"                                    cr_st(indx).sm_part_desc,
"
"                                    cr_st(indx).sm_vendor,
"
"                                    cr_st(indx).sm_vendor_desc,
"
"                                    cr_st(indx).sm_aug_qty,
"
"                                    cr_st(indx).sm_sep_qty,
"
"                                    cr_st(indx).sm_oct_qty,
"
"                                    NULL,
"
"                    'N',
"
"                                        NULL,
"
"                                    p_user,
"
"                                    Audit_Info.Get_IP_Address,
"
"                                    Audit_Info.Get_OS_User,
"
"                                    func_find_emp_id(p_bu,p_user),
"
"                                    SYSDATE
"
"                                   );
"
"     p_res := 'Y';
"
"    END LOOP c1;
"
"   END LOOP;
"
"  END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"END proc_ins_cust_schld_mah_mig;
"
"
"
"PROCEDURE proc_ins_po_mig(p_bu        business_units.bu_id%TYPE,
"
"                          p_plnt     bus_unit_plants.bup_plant_id%TYPE,
"
"                          p_ord_pfx    pur_order_hd.poh_order_pfx%TYPE,
"
"              p_ord_no    pur_order_hd.poh_order_no%TYPE,
"
"              p_fname    VARCHAR2,
"
"              p_sep        VARCHAR2,
"
"              p_type     VARCHAR2,
"
"              p_user    pur_order_hd.poh_cre_by%TYPE
"
"              )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"IF  p_type = 'PO' THEN /*Purchaes Order*/
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(sm_prod_id     VARCHAR2(100),
"
"                       sm_prod_rev     NUMBER(5),
"
"                       sm_prod_desc11   VARCHAR2(150),
"
"                       sm_disc_pct      NUMBER (10,8),
"
"                       sm_hsn        VARCHAR2 (25),
"
"                       sm_tax_set       VARCHAR2(100),
"
"                       sm_uom         VARCHAR2(5),
"
"                       sm_size        VARCHAR(10),
"
"                       sm_mat_spec      VARCHAR2(500),
"
"                       sm_qty        NUMBER(12,3),
"
"                       sm_unit_cost    NUMBER(12,3),
"
"                       sm_so_pfx     VARCHAR2(5),
"
"                                       sm_so_no     VARCHAR2(10),
"
"                       sm_net_weight    NUMBER(12,3),
"
"                       sm_weight_uom     VARCHAR2(5),
"
"                       sm_thickness    NUMBER (5,2),
"
"                                       sm_prod_width    NUMBER (5,2),
"
"                                       sm_prod_length    NUMBER (5,2))
"
"                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep||'''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                       (sm_prod_id     CHAR(255),
"
"                        sm_prod_rev     CHAR(255),
"
"                        sm_prod_desc11     CHAR(255),
"
"                        sm_disc_pct     CHAR(255),
"
"                    sm_hsn        CHAR(255),
"
"                        sm_tax_set      CHAR(255),
"
"                        sm_uom         CHAR(255),
"
"                        sm_size        CHAR(255),
"
"                        sm_mat_spec      CHAR(255),
"
"                        sm_qty        CHAR(255),
"
"                        sm_unit_cost    CHAR(255),
"
"                        sm_so_pfx     CHAR(255),
"
"                                        sm_so_no     CHAR(255),
"
"                        sm_net_weight    CHAR(255),
"
"                        sm_weight_uom     CHAR(255),
"
"                        sm_thickness    CHAR(255),
"
"                                        sm_prod_width    CHAR(255),
"
"                                        sm_prod_length    CHAR(255)))
"
"                             LOCATION ('''||p_fname||''')) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE prj_pur_ord_mig_ln
"
"   WHERE ppoml_bu = p_bu
"
"     AND ppoml_plnt = p_plnt
"
"     AND ppoml_ord_pfx = p_ord_pfx
"
"     AND ppoml_ord_no = p_ord_no;
"
"
"
"
"
"  v_sql := 'INSERT INTO prj_pur_ord_mig_ln(ppoml_bu,
"
"                       ppoml_plnt,
"
"                       ppoml_ord_pfx,
"
"                       ppoml_ord_no,
"
"                       ppoml_seq_no,
"
"                       ppoml_prod_id,
"
"                       ppoml_prod_rev,
"
"                       ppoml_prod_desc11,
"
"                       ppoml_uom,
"
"                       ppoml_size,
"
"                       ppoml_mat_spec,
"
"                       ppoml_qty,
"
"                       ppoml_unit_price,
"
"                       ppoml_so_pfx,
"
"                       ppoml_so_no,
"
"                       ppoml_prod_net_weight,
"
"                       ppoml_prod_weight_uom,
"
"                       ppoml_prod_thickness,
"
"                       ppoml_prod_width,
"
"                       ppoml_prod_length,
"
"                       ppoml_cre_by,
"
"                       ppoml_cre_date,
"
"                       ppoml_disc_pct,
"
"                       ppoml_hsn_code,
"
"                       ppoml_tax_set_desc,
"
"                       ppoml_tax_set_id
"
"                       )
"
"                                  SELECT '''||p_bu||''',
"
"                       '''||p_plnt||''',
"
"                       '''||p_ord_pfx||''',
"
"                       '''||p_ord_no||''',
"
"                       ROWNUM,
"
"                                         sm_prod_id,
"
"                       sm_prod_rev,
"
"                           (SELECT prod_desc11
"
"                          FROM products
"
"                         WHERE prod_bu = '''||p_bu||'''
"
"                           AND prod_id = sm_prod_id
"
"                           AND prod_rev = sm_prod_rev),
"
"                           sm_uom,
"
"                           sm_size,
"
"                           sm_mat_spec,
"
"                           NVL(sm_qty,0),
"
"                           sm_unit_cost,
"
"                           sm_so_pfx,
"
"                                           sm_so_no,
"
"                           NVL(sm_net_weight,0),
"
"                           sm_weight_uom,
"
"                           NVL(sm_thickness,0),
"
"                                           NVL(sm_prod_width,0),
"
"                                           NVL(sm_prod_length,0),
"
"                       '''||p_user||''',
"
"                       SYSDATE,
"
"                       nvl(sm_disc_pct,0),
"
"                       sm_hsn,
"
"                       sm_tax_set,
"
"                       (  SELECT TCSET_SET_ID
"
"                         FROM tax_charges_sets
"
"                            WHERE TCSET_BU = '''||p_bu||'''
"
"                          AND  TCSET_DESC1 = sm_tax_set)
"
"                                    FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"ELSIF  p_type = 'SO' THEN /*Service Purchase Order*/
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(sm_seq_no     NUMBER(5),
"
"                                       sm_sub_seq_no     NUMBER(5),
"
"                       sm_prod_desc11     VARCHAR2(650),
"
"                       sm_uom         VARCHAR2(5),
"
"                       sm_qty        NUMBER(12,3),
"
"                       sm_unit_cost    NUMBER(12,3),
"
"                       sm_so_pfx     VARCHAR2(5),
"
"                                       sm_so_no     VARCHAR2(10))
"
"                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep||'''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                       (sm_seq_no     CHAR(255),
"
"                        sm_sub_seq_no     CHAR(255),
"
"                        sm_prod_desc11     CHAR(255),
"
"                        sm_uom         CHAR(255),
"
"                        sm_qty        CHAR(255),
"
"                        sm_unit_cost    CHAR(255),
"
"                        sm_so_pfx     CHAR(255),
"
"                                        sm_so_no     CHAR(255)))
"
"                             LOCATION ('''||p_fname||''')) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE prj_serv_pur_ord_mig_ln
"
"   WHERE pspoml_bu = p_bu
"
"     AND pspoml_plnt = p_plnt
"
"     AND pspoml_ord_pfx = p_ord_pfx
"
"     AND pspoml_ord_no = p_ord_no;
"
"
"
"
"
"  v_sql := 'INSERT INTO prj_serv_pur_ord_mig_ln(pspoml_bu,
"
"                            pspoml_plnt,
"
"                            pspoml_ord_pfx,
"
"                            pspoml_ord_no,
"
"                            pspoml_seq_no,
"
"                        pspoml_sub_seq_no,
"
"                            pspoml_prod_desc11,
"
"                            pspoml_uom,
"
"                            pspoml_qty,
"
"                            pspoml_unit_price,
"
"                            pspoml_so_pfx,
"
"                            pspoml_so_no,
"
"                            pspoml_cre_by,
"
"                            pspoml_cre_date)
"
"                                       SELECT '''||p_bu||''',
"
"                            '''||p_plnt||''',
"
"                            '''||p_ord_pfx||''',
"
"                            '''||p_ord_no||''',
"
"                            sm_seq_no,
"
"                        sm_sub_seq_no,
"
"                                sm_prod_desc11,
"
"                                sm_uom,
"
"                                sm_qty,
"
"                                sm_unit_cost,
"
"                                sm_so_pfx,
"
"                                                sm_so_no,
"
"                            '''||p_user||''',
"
"                            SYSDATE
"
"                                         FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"END IF;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  COMMIT;
"
"
"
"END proc_ins_po_mig;
"
"
"
"PROCEDURE proc_ins_svo_mig(p_bu        business_units.bu_id%TYPE,
"
"               p_fname    VARCHAR2,
"
"               p_sep    VARCHAR2,
"
"               p_user    service_order_hd.svohd_cre_by%TYPE
"
"               )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_order_no    VARCHAR2(50);
"
"
"
"TYPE typ_ins IS RECORD (SM_PLANT              VARCHAR2(10),
"
"                        SM_CUST_ID            VARCHAR2(10),
"
"                        SM_YEAR            NUMBER(6),
"
"                        SM_PERIOD        NUMBER(2),
"
"                        SM_CURCY        VARCHAR(5),
"
"                        SM_PROD_ID            VARCHAR2(100),
"
"                        SM_PROD_DESC          VARCHAR2(150),
"
"                        SM_SERIAL_NO        VARCHAR2(50),
"
"                        SM_AMC_PERCALL_REASON   VARCHAR2(100),
"
"                        SM_ASSGN_REP_ID     VARCHAR2(10),
"
"                        SM_ASSGN_BY         VARCHAR2(10)
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PLANT VARCHAR2(10),SM_CUST_ID VARCHAR2(10),SM_YEAR    NUMBER(6),SM_PERIOD NUMBER(2),SM_CURCY    VARCHAR(5),SM_PROD_ID VARCHAR2(100),SM_PROD_DESC VARCHAR2(150),SM_SERIAL_NO VARCHAR2(50),SM_AMC_PERCALL_REASON   VARCHAR2(100),SM_ASSGN_REP_ID VARCHAR2(10),SM_ASSGN_BY  VARCHAR2(10))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SM_PLANT  CHAR(255),SM_CUST_ID CHAR(255),SM_YEAR CHAR(255),SM_PERIOD CHAR(255),SM_CURCY CHAR(255),SM_PROD_ID CHAR(255),SM_PROD_DESC  CHAR(255),SM_SERIAL_NO  CHAR(255),SM_AMC_PERCALL_REASON  CHAR(255),SM_ASSGN_REP_ID  CHAR(255),SM_ASSGN_BY  CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
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
"     v_order_no := func_find_crm_next_id(p_bu,cr_st(indx).sm_plant,'SORD',cr_st(indx).sm_year,p_user);
"
"   -- Raise_Application_Error(-20999,'HRM'||'/'||p_bu||'-'||p_ord_no||'-'||p_rev_no);
"
"
"
"    INSERT INTO service_order_hd(svohd_bu,
"
"                 svohd_order_no,
"
"                 svohd_rev_no,
"
"                 svohd_ord_type,
"
"                 svohd_date,
"
"                 svohd_plant,
"
"                 svohd_cust_id,
"
"                 svohd_year,
"
"                 svohd_period,
"
"                 svohd_curcy,
"
"                 svohd_ex_rate,
"
"                 svohd_prod_id,
"
"                 svohd_prod_desc,
"
"                 svohd_serial_no,
"
"                 svohd_amc_percall_reason,
"
"                 svohd_assgn_rep_id,
"
"                 svohd_assgn_by,
"
"                 svohd_cr_limit_hold,
"
"                 svohd_so_tax_flag,
"
"                 svohd_inv_flag,
"
"                 svohd_pord_load_flag,
"
"                 svohd_amc_flag,
"
"                 svohd_status,
"
"                 svohd_priority,
"
"                 svohd_rqst_mode,
"
"                 svohd_incentive_flag,
"
"                 svohd_sel_flag,
"
"                 svohd_bill_amt,
"
"                 svohd_vou_type,
"
"                 svohd_pa_rqrd_flag,
"
"                 svohd_ca_rqrd_flag,
"
"                 svohd_cls_type,
"
"                 svohd_cre_by,
"
"                 svohd_cre_date)
"
"             VALUES(p_bu,
"
"                v_order_no,
"
"                0,
"
"                'CS',
"
"                TRUNC(SYSDATE),
"
"                cr_st(indx).sm_plant,
"
"                cr_st(indx).sm_cust_id,
"
"                cr_st(indx).sm_year,
"
"                cr_st(indx).sm_period,
"
"                cr_st(indx).sm_curcy,
"
"                1,
"
"                cr_st(indx).sm_prod_id,
"
"                cr_st(indx).sm_prod_desc,
"
"                cr_st(indx).sm_serial_no,
"
"                cr_st(indx).sm_amc_percall_reason,
"
"                cr_st(indx).sm_assgn_rep_id,
"
"                cr_st(indx).sm_assgn_by,
"
"                'N',
"
"                'N',
"
"                'N',
"
"                'N',
"
"                'N',
"
"                'E',
"
"                'H',
"
"                'N',
"
"                'N',
"
"                'N',
"
"                0,
"
"                'N',
"
"                'N',
"
"                'N',
"
"                'S',
"
"                p_user,
"
"                SYSDATE
"
"                );
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_svo_mig;
"
"
"
"
"
"PROCEDURE proc_cre_sal_rtn_crd_note(p_bu    business_units.bu_id%TYPE,
"
"                                    p_plnt     bus_unit_plants.bup_plant_id%TYPE,
"
"                                    p_ord_pfx    pur_order_hd.poh_order_pfx%TYPE,
"
"                        p_ord_no    pur_order_hd.poh_order_no%TYPE,
"
"                        p_fname    VARCHAR2,
"
"                        p_sep    VARCHAR2,
"
"                        p_type     VARCHAR2,
"
"                        p_user    pur_order_hd.poh_cre_by%TYPE
"
"              )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"IF  p_type = 'PO' THEN /*Purchaes Order*/
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(sm_prod_id     VARCHAR2(100),
"
"                       sm_prod_rev     NUMBER(5),
"
"                       sm_prod_desc11     VARCHAR2(150),
"
"                       sm_uom         VARCHAR2(5),
"
"                       sm_size        VARCHAR(10),
"
"                       sm_mat_spec      VARCHAR2(500),
"
"                       sm_qty        NUMBER(12,3),
"
"                       sm_unit_cost    NUMBER(12,3),
"
"                       sm_so_pfx     VARCHAR2(5),
"
"                                       sm_so_no     VARCHAR2(10),
"
"                       sm_net_weight    NUMBER(12,3),
"
"                       sm_weight_uom     VARCHAR2(5),
"
"                       sm_thickness    NUMBER (5,2),
"
"                                       sm_prod_width    NUMBER (5,2),
"
"                                       sm_prod_length    NUMBER (5,2))
"
"                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep||'''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                       (sm_prod_id     CHAR(255),
"
"                        sm_prod_rev     CHAR(255),
"
"                        sm_prod_desc11     CHAR(255),
"
"                        sm_uom         CHAR(255),
"
"                        sm_size        CHAR(255),
"
"                        sm_mat_spec      CHAR(255),
"
"                        sm_qty        CHAR(255),
"
"                        sm_unit_cost    CHAR(255),
"
"                        sm_so_pfx     CHAR(255),
"
"                                        sm_so_no     CHAR(255),
"
"                        sm_net_weight    CHAR(255),
"
"                        sm_weight_uom     CHAR(255),
"
"                        sm_thickness    CHAR(255),
"
"                                        sm_prod_width    CHAR(255),
"
"                                        sm_prod_length    CHAR(255)))
"
"                             LOCATION ('''||p_fname||''')) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE prj_pur_ord_mig_ln
"
"   WHERE ppoml_bu = p_bu
"
"     AND ppoml_plnt = p_plnt
"
"     AND ppoml_ord_pfx = p_ord_pfx
"
"     AND ppoml_ord_no = p_ord_no;
"
"
"
"
"
"  v_sql := 'INSERT INTO prj_pur_ord_mig_ln(ppoml_bu,
"
"                       ppoml_plnt,
"
"                       ppoml_ord_pfx,
"
"                       ppoml_ord_no,
"
"                       ppoml_seq_no,
"
"                       ppoml_prod_id,
"
"                       ppoml_prod_rev,
"
"                       ppoml_prod_desc11,
"
"                       ppoml_uom,
"
"                       ppoml_size,
"
"                       ppoml_mat_spec,
"
"                       ppoml_qty,
"
"                       ppoml_unit_price,
"
"                       ppoml_so_pfx,
"
"                       ppoml_so_no,
"
"                       ppoml_prod_net_weight,
"
"                       ppoml_prod_weight_uom,
"
"                       ppoml_prod_thickness,
"
"                       ppoml_prod_width,
"
"                       ppoml_prod_length,
"
"                       ppoml_cre_by,
"
"                       ppoml_cre_date)
"
"                                  SELECT '''||p_bu||''',
"
"                       '''||p_plnt||''',
"
"                       '''||p_ord_pfx||''',
"
"                       '''||p_ord_no||''',
"
"                       ROWNUM,
"
"                                         sm_prod_id,
"
"                       sm_prod_rev,
"
"                           sm_prod_desc11,
"
"                           sm_uom,
"
"                           sm_size,
"
"                           sm_mat_spec,
"
"                           NVL(sm_qty,0),
"
"                           sm_unit_cost,
"
"                           sm_so_pfx,
"
"                                           sm_so_no,
"
"                           NVL(sm_net_weight,0),
"
"                           sm_weight_uom,
"
"                           NVL(sm_thickness,0),
"
"                                           NVL(sm_prod_width,0),
"
"                                           NVL(sm_prod_length,0),
"
"                       '''||p_user||''',
"
"                       SYSDATE
"
"                                    FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"ELSIF  p_type = 'SO' THEN /*Service Purchase Order*/
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(sm_seq_no     NUMBER(5),
"
"                                       sm_sub_seq_no     NUMBER(5),
"
"                       sm_prod_desc11     VARCHAR2(650),
"
"                       sm_uom         VARCHAR2(5),
"
"                       sm_qty        NUMBER(12,3),
"
"                       sm_unit_cost    NUMBER(12,3),
"
"                       sm_so_pfx     VARCHAR2(5),
"
"                                       sm_so_no     VARCHAR2(10))
"
"                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep||'''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                       (sm_seq_no     CHAR(255),
"
"                        sm_sub_seq_no     CHAR(255),
"
"                        sm_prod_desc11     CHAR(255),
"
"                        sm_uom         CHAR(255),
"
"                        sm_qty        CHAR(255),
"
"                        sm_unit_cost    CHAR(255),
"
"                        sm_so_pfx     CHAR(255),
"
"                                        sm_so_no     CHAR(255)))
"
"                             LOCATION ('''||p_fname||''')) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE prj_serv_pur_ord_mig_ln
"
"   WHERE pspoml_bu = p_bu
"
"     AND pspoml_plnt = p_plnt
"
"     AND pspoml_ord_pfx = p_ord_pfx
"
"     AND pspoml_ord_no = p_ord_no;
"
"
"
"
"
"  v_sql := 'INSERT INTO prj_serv_pur_ord_mig_ln(pspoml_bu,
"
"                            pspoml_plnt,
"
"                            pspoml_ord_pfx,
"
"                            pspoml_ord_no,
"
"                            pspoml_seq_no,
"
"                        pspoml_sub_seq_no,
"
"                            pspoml_prod_desc11,
"
"                            pspoml_uom,
"
"                            pspoml_qty,
"
"                            pspoml_unit_price,
"
"                            pspoml_so_pfx,
"
"                            pspoml_so_no,
"
"                            pspoml_cre_by,
"
"                            pspoml_cre_date)
"
"                                       SELECT '''||p_bu||''',
"
"                            '''||p_plnt||''',
"
"                            '''||p_ord_pfx||''',
"
"                            '''||p_ord_no||''',
"
"                            sm_seq_no,
"
"                        sm_sub_seq_no,
"
"                                sm_prod_desc11,
"
"                                sm_uom,
"
"                                sm_qty,
"
"                                sm_unit_cost,
"
"                                sm_so_pfx,
"
"                                                sm_so_no,
"
"                            '''||p_user||''',
"
"                            SYSDATE
"
"                                         FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"END IF;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  COMMIT;
"
"
"
"END proc_cre_sal_rtn_crd_note;
"
"
"
"/*PROCEDURE proc_ins_srcm_mig(p_bu    business_units.bu_id%TYPE,
"
"                p_fname    VARCHAR2,
"
"                p_sep    VARCHAR2,
"
"                p_user    sales_invoices_hd.sihd_cre_by%TYPE
"
"               )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_city_id    VARCHAR2(10);
"
"v_state_id    VARCHAR2(10);
"
"v_cntry_id    VARCHAR2(10);
"
"v_seq_no    NUMBER;
"
"v_doc_no    NUMBER;
"
"
"
"
"
"TYPE typ_ins_gpi IS RECORD (SCM_UNIT        VARCHAR2(10),
"
"                            SCM_DOC_DATE    DATE,
"
"                            SCM_INV_PFX        VARCHAR2(5),
"
"                SCM_INV_DATE    DATE,
"
"                            SCM_CUST_ID     VARCHAR2(25),
"
"                            SCM_AR_CLASS     VARCHAR2(10),
"
"                            SCM_CUST_ITEM     VARCHAR2(50),
"
"                            SCM_CUST_REV     VARCHAR2(1),
"
"                            SCM_CUST_ITEM_QTY     NUMBER(15,7),
"
"                            SCM_CUST_ITEM_PRICE NUMBER(17,7),
"
"                            SCM_CUST_DISC_AMT     NUMBER(17,7),
"
"                            SCM_SHIP_FROM_WH     VARCHAR2(30));
"
"
"
"TYPE typ_ins_gpi_det IS TABLE OF typ_ins_gpi INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_ins_gpi_det;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"BEGIN
"
"
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
"EXCEPTION WHEN NO_DATA_FOUND THEN
"
"Raise_Application_Error(-20014,'WFM');
"
"END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"       v_sql := 'CREATE TABLE SCM_MIGRATION((SCM_UNIT        VARCHAR2(10),
"
"                                             SCM_DOC_DATE    DATE,
"
"                                             SCM_INV_PFX        VARCHAR2(5),
"
"                                 SCM_INV_DATE    DATE,
"
"                                             SCM_CUST_ID     VARCHAR2(25),
"
"                                             SCM_AR_CLASS     VARCHAR2(10),
"
"                                             SCM_CUST_ITEM     VARCHAR2(50),
"
"                                             SCM_CUST_REV     VARCHAR2(1),
"
"                                             SCM_CUST_ITEM_QTY     NUMBER(15,7),
"
"                                             SCM_CUST_ITEM_PRICE NUMBER(17,7),
"
"                                             SCM_CUST_DISC_AMT     NUMBER(17,7),
"
"                                             SCM_SHIP_FROM_WH     VARCHAR2(30))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SCM_UNIT        CHAR(255),
"
" SCM_DOC_DATE        CHAR(255),
"
" SCM_INV_PFX        CHAR(255),
"
" SCM_INV_DATE        CHAR(255),
"
" SCM_CUST_ID         CHAR(255),
"
" SCM_AR_CLASS         CHAR(255),
"
" SCM_CUST_ITEM         CHAR(255),
"
" SCM_CUST_REV        CHAR(255),
"
" SCM_CUST_ITEM_QTY     CHAR(255),
"
" SCM_CUST_ITEM_PRICE     CHAR(255),
"
" SCM_CUST_DISC_AMT     CHAR(255),
"
" SCM_SHIP_FROM_WH     CHAR(255))
"
" )
"
"LOCATION ('''||p_file_name||''')
"
") REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
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
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"  BEGIN
"
"       SELECT city_id
"
"         INTO v_city_id
"
"            FROM cities
"
"           WHERE city_name1 = UPPER(TRIM(cr_st(indx).am_city));
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_city_id := NULL;
"
"
"
"  END;
"
"
"
"  BEGIN
"
"       SELECT state_id
"
"         INTO v_state_id
"
"            FROM states
"
"           WHERE state_name1 = UPPER(TRIM(cr_st(indx).am_state));
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_state_id := NULL;
"
"
"
"  END;
"
"
"
"  BEGIN
"
"       SELECT cntry_id
"
"         INTO v_cntry_id
"
"            FROM countries
"
"           WHERE cntry_name1 = UPPER(TRIM(cr_st(indx).am_cntry));
"
"
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_cntry_id := NULL;
"
"
"
"  END;
"
"
"
"SELECT NVL(MAX(TO_NUMBER(sihd_doc_no)),0)+1
"
"  INTO v_doc_no
"
"  FROM sales_invoices_hd
"
" WHERE sihd_bu    = p_bu;
"
"
"
"  SELECT NVL(MAX(waam_seq_no),0) + 1
"
"    INTO v_seq_no
"
"    FROM warr_amc_agrmnt_mchn
"
"   WHERE waam_bu = p_bu
"
"     AND waam_doc_no = v_doc_no;
"
"
"
"  INSERT INTO S(waam_bu,waam_plnt,waam_doc_no,waam_seq_no,waam_type,
"
"              waam_prod_id,waam_prod_rev,waam_prod_desc,waam_serial_no,
"
"                waam_addr1,waam_addr2,waam_addr3,waam_postal_code,
"
"                waam_city,waam_state,waam_cntry,
"
"                waam_tele,waam_email,waam_mobno,
"
"                waam_cre_by,waam_cre_date)
"
"       VALUES(p_bu,p_plnt,p_doc_no,v_seq_no,cr_st(indx).am_type,
"
"              cr_st(indx).am_machn,0,cr_st(indx).am_machn_name,cr_st(indx).am_ser_no,
"
"              cr_st(indx).am_addr1,cr_st(indx).am_addr2,cr_st(indx).am_addr3,cr_st(indx).am_postal_code,
"
"              v_city_id,v_state_id,v_cntry_id,
"
"              cr_st(indx).am_tele,cr_st(indx).am_email,cr_st(indx).am_mobile,
"
"              p_user,SYSDATE);
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_srcm_mig;*/
"
"
"
"PROCEDURE proc_ins_std_price_mig(p_bu         VARCHAR2,
"
"                                 p_doc_no    VARCHAR2,
"
"                           p_fname    VARCHAR2,
"
"                           p_sep        VARCHAR2,
"
"                           p_user        VARCHAR2
"
"                           )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"v_seq     NUMBER;
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SP_UNIT VARCHAR2(10),SP_EFF_FROM DATE,SP_EFF_TO DATE,SP_PROD_ID VARCHAR2(100),SP_PROD_REV NUMBER,
"
"SP_PROD_UOM    VARCHAR2(5),SP_MAP_PRICE NUMBER,SP_LAND_COST NUMBER,SP_UNIT_PRICE NUMBER,SP_FLT_EX_RATE NUMBER,SP_DISC_PCT NUMBER,SP_MAX_DISC NUMBER)
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SP_UNIT CHAR(255),SP_EFF_FROM CHAR(255),SP_EFF_TO CHAR(255),SP_PROD_ID CHAR(255),SP_PROD_REV CHAR(255),
"
"SP_PROD_UOM CHAR(255),SP_MAP_PRICE CHAR(255),SP_LAND_COST CHAR(255),SP_UNIT_PRICE CHAR(255),SP_FLT_EX_RATE CHAR(255),SP_DISC_PCT CHAR(255),SP_MAX_DISC CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE sales_std_price_mig_ln
"
"   WHERE sspml_bu = p_bu
"
"     AND sspml_doc_no = p_doc_no;
"
"
"
"  v_sql := 'INSERT INTO sales_std_price_mig_ln(sspml_bu,sspml_plnt,sspml_doc_no,sspml_seq_no,
"
"            sspml_prod_id,sspml_prod_rev,sspml_uom,sspml_std_price,sspml_eff_from  ,
"
"        sspml_eff_to,sspml_map_price,sspml_land_cost,sspml_flt_ex_rate,sspml_disc_pct ,
"
"               sspml_max_disc,sspml_cre_by,sspml_cre_date,sspml_pur_price,sspml_pur_disc_pct)
"
"              SELECT '''||p_bu||''',sp_unit,'''||p_doc_no||''',ROWNUM,
"
"              sp_prod_id,sp_prod_rev,sp_prod_uom,NVL(sp_unit_price,0),sp_eff_from,
"
"              sp_eff_to,NVL(sp_map_price,0),NVL(sp_land_cost,0),NVL(sp_flt_ex_rate,0),NVL(sp_disc_pct,0),NVL(sp_max_disc,0),
"
"              '''||p_user||''',SYSDATE,0,0
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"   BEGIN
"
"           SELECT jva_exl_seq.NEXTVAL INTO v_seq FROM DUAL;
"
"
"
"         INSERT INTO EXCEL_GENERATE_QUERY (EGQ_NO,
"
"                                           EGQ_QUERY,
"
"                                           EGQ_CRE_BY,
"
"                                           EGQ_CRE_DATE,
"
"                                           EGQ_BUS_FUN)
"
"              VALUES (v_seq,
"
"                      v_sql,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      'SOM1215');
"
"   END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_std_price_mig;
"
"
"
"
"
"PROCEDURE proc_ins_std_price_mig_tra(p_bu         VARCHAR2,
"
"                                 p_doc_no    VARCHAR2,
"
"                           p_fname    VARCHAR2,
"
"                           p_sep        VARCHAR2,
"
"                           p_user        VARCHAR2
"
"                           )
"
"AS
"
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(200);
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SP_UNIT VARCHAR2(10),SP_EFF_FROM DATE,SP_EFF_TO DATE,SP_SUPLR_ID VARCHAR2(10),SP_CURR_ID VARCHAR2(10),SP_PROD_ID VARCHAR2(100),SP_PROD_REV NUMBER,
"
"SP_PROD_UOM    VARCHAR2(5),SP_MAP_PRICE NUMBER,SP_LAND_COST NUMBER,SP_UNIT_PRICE NUMBER,SP_FLT_EX_RATE NUMBER,SP_DISC_PCT NUMBER,SP_MAX_DISC NUMBER,SP_PUR_PRICE NUMBER,SP_PUR_PRICE_DISC NUMBER,SP_PUR_CURR_ID VARCHAR2(10))
"
"ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"SKIP 1
"
"FIELDS TERMINATED BY '''||p_sep||'''
"
"MISSING FIELD VALUES ARE NULL
"
"REJECT ROWS WITH ALL NULL FIELDS
"
"(SP_UNIT CHAR(255),SP_EFF_FROM CHAR(255),SP_EFF_TO CHAR(255),SP_SUPLR_ID CHAR(255),SP_CURR_ID CHAR(255),SP_PROD_ID CHAR(255),SP_PROD_REV CHAR(255),
"
"SP_PROD_UOM CHAR(255),SP_MAP_PRICE CHAR(255),SP_LAND_COST CHAR(255),SP_UNIT_PRICE CHAR(255),SP_FLT_EX_RATE CHAR(255),SP_DISC_PCT CHAR(255),SP_MAX_DISC CHAR(255),SP_PUR_PRICE CHAR(255),SP_PUR_PRICE_DISC CHAR(255),SP_PUR_CURR_ID  CHAR(255))
"
")
"
"LOCATION ('''||p_fname||''')
"
") REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE sales_std_price_mig_ln
"
"   WHERE sspml_bu = p_bu
"
"     AND sspml_doc_no = p_doc_no;
"
"
"
"  v_sql := 'INSERT INTO sales_std_price_mig_ln(sspml_bu,sspml_plnt,sspml_doc_no,sspml_seq_no,
"
"            sspml_suplr_id,sspml_curry_id,sspml_prod_id,sspml_prod_rev,sspml_uom,sspml_std_price,sspml_eff_from  ,
"
"        sspml_eff_to,sspml_map_price,sspml_land_cost,sspml_flt_ex_rate,sspml_disc_pct ,
"
"               sspml_max_disc,sspml_pur_price,sspml_pur_disc_pct,sspml_pur_curry_id,sspml_cre_by,sspml_cre_date)
"
"              SELECT '''||p_bu||''',sp_unit,'''||p_doc_no||''',ROWNUM,
"
"              sp_suplr_id,sp_curr_id,sp_prod_id,sp_prod_rev,sp_prod_uom,NVL(sp_unit_price,0),sp_eff_from,
"
"              sp_eff_to,NVL(sp_map_price,0),NVL(sp_land_cost,0),NVL(sp_flt_ex_rate,0),NVL(sp_disc_pct,0),NVL(sp_max_disc,0),NVL(sp_pur_price,0),NVL(sp_pur_price_disc,0),sp_pur_curr_id,
"
"              '''||p_user||''',SYSDATE
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_std_price_mig_tra;
"
"
"
"PROCEDURE proc_ins_std_price_mig_exp(p_bu         VARCHAR2,
"
"                                     p_doc_no        VARCHAR2,
"
"                               p_user        VARCHAR2
"
"                              )
"
"AS
"
"
"
"    CURSOR c_plnt(c_plnt    VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM bus_unit_plants
"
"     WHERE bup_bu = p_bu
"
"       AND bup_plant_id = c_plnt;
"
"
"
"    CURSOR c_prod(c_prod    VARCHAR2,
"
"                  c_prod_rev    NUMBER)
"
"        IS
"
"    SELECT 1
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = c_prod
"
"       AND prod_rev = c_prod_rev;
"
"
"
"    CURSOR c_prod_uom(c_prod        VARCHAR2,
"
"                      c_prod_rev    NUMBER,
"
"                      c_uom        VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = c_prod
"
"       AND prod_rev = c_prod_rev
"
"       AND prod_sale_uom = c_uom;
"
"
"
"    CURSOR c_suplr(c_suplr    VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = c_suplr;
"
"
"
"
"
"  v_err_msg    VARCHAR2(4000);
"
"
"
"  cr_plnt    c_plnt%ROWTYPE;
"
"  cr_prod    c_prod%ROWTYPE;
"
"  cr_suplr    c_suplr%ROWTYPE;
"
"  cr_prod_uom    c_prod_uom%ROWTYPE;
"
"BEGIN
"
"  UPDATE sales_std_price_mig_ln
"
"     SET sspml_ref = NULL
"
"   WHERE sspml_bu = p_bu
"
"     AND sspml_doc_no = p_doc_no
"
"     /*AND sspml_ref IS NOT NULL*/;
"
"
"
"  FOR cr1 IN (SELECT *
"
"                FROM sales_std_price_mig_ln
"
"               WHERE sspml_bu = p_bu
"
"                 AND sspml_doc_no = p_doc_no)
"
"  LOOP
"
"    v_err_msg := NULL;
"
"    OPEN c_plnt(cr1.sspml_plnt);
"
"    FETCH c_plnt INTO cr_plnt;
"
"      IF c_plnt%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_plnt||' - Unit not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_plnt;
"
"    IF cr1.sspml_eff_from > cr1.sspml_eff_to THEN
"
"         v_err_msg := v_err_msg||'From date - '||cr1.sspml_eff_from||'To date - '||cr1.sspml_eff_to||'To date should be greater than From date.'||chr(10);
"
"    END IF;
"
"    OPEN c_prod(cr1.sspml_prod_id,cr1.sspml_prod_rev);
"
"    FETCH c_prod INTO cr_prod;
"
"      IF c_prod%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_prod_id||' - '||cr1.sspml_prod_rev||' - Item not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_prod;
"
"    OPEN c_prod_uom(cr1.sspml_prod_id,cr1.sspml_prod_rev,cr1.sspml_uom);
"
"    FETCH c_prod_uom INTO cr_prod_uom;
"
"      IF c_prod_uom%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_prod_id||' - '||cr1.sspml_prod_rev||' - '||cr1.sspml_uom||' - Item not Associated with current UOM.'||chr(10);
"
"      END IF;
"
"    CLOSE c_prod_uom;
"
"
"
"    IF cr1.sspml_map_price < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_map_price||'MAP Price should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_land_cost < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_land_cost||'Landed cost should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_std_price <= 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_std_price||'Standard price should be greater than Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_flt_ex_rate < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_flt_ex_rate||'Flat exchange rate should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_disc_pct < 0  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_disc_pct||'Discount % should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_disc_pct > 100  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_disc_pct||'Discount % should not be greater than 100.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_max_disc < 0  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_max_disc||'Maximum Discount % should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_max_disc > 100  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_max_disc||'Maximum Discount % should not be greater than 100.'||chr(10);
"
"    END IF;
"
"    UPDATE sales_std_price_mig_ln
"
"       SET sspml_ref = v_err_msg
"
"     WHERE sspml_bu = p_bu
"
"       AND sspml_doc_no = p_doc_no
"
"       AND sspml_seq_no = cr1.sspml_seq_no;
"
"
"
"     v_err_msg := NULL;
"
"  END LOOP;
"
"
"
"END proc_ins_std_price_mig_exp;
"
"
"
"
"
"PROCEDURE proc_ins_std_price_mig_exp_tra(p_bu         VARCHAR2,
"
"                                     p_doc_no        VARCHAR2,
"
"                               p_user        VARCHAR2
"
"                              )
"
"AS
"
"
"
"    CURSOR c_plnt(c_plnt    VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM bus_unit_plants
"
"     WHERE bup_bu = p_bu
"
"       AND bup_plant_id = c_plnt;
"
"
"
"    CURSOR c_prod(c_prod    VARCHAR2,
"
"                  c_prod_rev    NUMBER)
"
"        IS
"
"    SELECT 1
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = c_prod
"
"       AND prod_rev = c_prod_rev;
"
"
"
"    CURSOR c_prod_uom(c_prod        VARCHAR2,
"
"                      c_prod_rev    NUMBER,
"
"                      c_uom        VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = c_prod
"
"       AND prod_rev = c_prod_rev
"
"       AND prod_uom = c_uom;
"
"
"
"    CURSOR c_suplr(c_suplr    VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = c_suplr;
"
"
"
"    CURSOR c_curry(c_curry    VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM currencies
"
"     WHERE curcy_id = c_curry;
"
"
"
"
"
"  v_err_msg    VARCHAR2(4000);
"
"
"
"  cr_plnt    c_plnt%ROWTYPE;
"
"  cr_prod    c_prod%ROWTYPE;
"
"  cr_suplr    c_suplr%ROWTYPE;
"
"  cr_curry    c_curry%ROWTYPE;
"
"  cr_prod_uom    c_prod_uom%ROWTYPE;
"
"BEGIN
"
"  UPDATE sales_std_price_mig_ln
"
"     SET sspml_ref = NULL
"
"   WHERE sspml_bu = p_bu
"
"     AND sspml_doc_no = p_doc_no
"
"     AND sspml_ref IS NOT NULL;
"
"  FOR cr1 IN (SELECT *
"
"                FROM sales_std_price_mig_ln
"
"               WHERE sspml_bu = p_bu
"
"                 AND sspml_doc_no = p_doc_no)
"
"  LOOP
"
"    v_err_msg := NULL;
"
"    OPEN c_plnt(cr1.sspml_plnt);
"
"    FETCH c_plnt INTO cr_plnt;
"
"      IF c_plnt%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_plnt||' - Unit not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_plnt;
"
"    IF cr1.sspml_eff_from > cr1.sspml_eff_to THEN
"
"         v_err_msg := v_err_msg||'From date - '||cr1.sspml_eff_from||'To date - '||cr1.sspml_eff_to||'To date should be greater than From date.'||chr(10);
"
"    END IF;
"
"    OPEN c_prod(cr1.sspml_prod_id,cr1.sspml_prod_rev);
"
"    FETCH c_prod INTO cr_prod;
"
"      IF c_prod%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_prod_id||' - '||cr1.sspml_prod_rev||' - Item not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_prod;
"
"    IF cr1.sspml_suplr_id IS NOT NULL THEN
"
"       OPEN c_suplr(cr1.sspml_suplr_id);
"
"       FETCH c_suplr INTO cr_suplr;
"
"          IF c_suplr%NOTFOUND THEN
"
"             v_err_msg := v_err_msg||cr1.sspml_suplr_id||' - Supplier not found.'||chr(10);
"
"          END IF;
"
"       CLOSE c_suplr;
"
"    END IF;
"
"    IF cr1.sspml_suplr_id IS NOT NULL AND cr1.sspml_curry_id IS NULL  THEN
"
"       v_err_msg := v_err_msg||cr1.sspml_curry_id||' -Selling Currency must be entered.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_suplr_id IS NOT NULL AND cr1.sspml_pur_curry_id IS NULL  AND cr1.sspml_pur_price > 0 THEN
"
"       v_err_msg := v_err_msg||cr1.sspml_curry_id||' - Purchase Currency must be entered.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_curry_id IS NOT NULL THEN
"
"       OPEN c_curry(cr1.sspml_curry_id);
"
"       FETCH c_curry INTO cr_curry;
"
"          IF c_curry%NOTFOUND THEN
"
"             v_err_msg := v_err_msg||cr1.sspml_curry_id||' - Currency not found.'||chr(10);
"
"          END IF;
"
"       CLOSE c_curry;
"
"    END IF;
"
"    IF cr1.sspml_pur_curry_id IS NOT NULL THEN
"
"       OPEN c_curry(cr1.sspml_pur_curry_id);
"
"       FETCH c_curry INTO cr_curry;
"
"          IF c_curry%NOTFOUND THEN
"
"             v_err_msg := v_err_msg||cr1.sspml_pur_curry_id||' - Purchase Currency not found.'||chr(10);
"
"          END IF;
"
"       CLOSE c_curry;
"
"    END IF;
"
"    OPEN c_prod_uom(cr1.sspml_prod_id,cr1.sspml_prod_rev,cr1.sspml_uom);
"
"    FETCH c_prod_uom INTO cr_prod_uom;
"
"      IF c_prod_uom%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_prod_id||' - '||cr1.sspml_prod_rev||' - '||cr1.sspml_uom||' - Item not Associated with current UOM.'||chr(10);
"
"      END IF;
"
"    CLOSE c_prod_uom;
"
"
"
"    IF cr1.sspml_map_price < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_map_price||'MAP Price should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_land_cost < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_land_cost||'Landed cost should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_std_price <= 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_std_price||'Standard price should be greater than Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_flt_ex_rate < 0 THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_flt_ex_rate||'Flat exchange rate should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_disc_pct < 0  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_disc_pct||'Discount % should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_disc_pct > 100  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_disc_pct||'Discount % should not be greater than 100.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_max_disc < 0  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_max_disc||'Maximum Discount % should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_max_disc > 100  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_max_disc||'Maximum Discount % should not be greater than 100.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_pur_price < 0  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_pur_price||'Purchase Price should be greater than or equal to Zero.'||chr(10);
"
"    END IF;
"
"    IF cr1.sspml_pur_disc_pct > 100  THEN
"
"         v_err_msg := v_err_msg||cr1.sspml_pur_disc_pct||'Purchase Price Discount % should not be greater than 100.'||chr(10);
"
"    END IF;
"
"    UPDATE sales_std_price_mig_ln
"
"       SET sspml_ref = v_err_msg
"
"     WHERE sspml_bu = p_bu
"
"       AND sspml_doc_no = p_doc_no
"
"       AND sspml_seq_no = cr1.sspml_seq_no;
"
"
"
"     v_err_msg := NULL;
"
"  END LOOP;
"
"
"
"END proc_ins_std_price_mig_exp_tra;
"
"
"
"/*PROCEDURE proc_ins_hci_price_mig(p_bu         VARCHAR2,
"
"                           p_fname    VARCHAR2,
"
"                           p_sep        VARCHAR2,
"
"                           p_user        VARCHAR2
"
"                           )
"
"AS
"
"
"
"v_grp_id        VARCHAR2(10);
"
"v_size_id         VARCHAR2(10);
"
"v_color_id        VARCHAR2(10);
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_doc_no        NUMBER(15);
"
"v_prod_id    products.prod_id%TYPE;
"
"v_prod_rev    NUMBER(5);
"
"v_prod_desc1    VARCHAR2(150);
"
"
"
"
"
"
"
" TYPE typ_ins IS RECORD (SM_PRICE_GRP_NAME     VARCHAR2(30),
"
"             SM_CAT_ID        VARCHAR2(10),
"
"             SM_CAT_NAME         VARCHAR2(50),
"
"             SM_SIZE_NAME        VARCHAR2(30),
"
"             SM_COLOR_NAME         VARCHAR2(50),
"
"             SM_CURRENCY        VARCHAR2(5),
"
"             SM_UNIT_PRICE        NUMBER(9,3),
"
"             SM_MRP                 NUMBER(9,3),
"
"             SM_DATE_FROM           DATE,
"
"             SM_DATE_TO             DATE
"
"             );
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PRICE_GRP_NAME     VARCHAR2(30),
"
"                                         SM_CAT_ID        VARCHAR2(10),
"
"                          SM_CAT_NAME         VARCHAR2(50),
"
"                               SM_SIZE_NAME        VARCHAR2(30),
"
"                               SM_COLOR_NAME         VARCHAR2(50),
"
"                               SM_CURRENCY        VARCHAR2(5),
"
"                               SM_UNIT_PRICE        NUMBER(9,3),
"
"                               SM_MRP                 NUMBER(9,3),
"
"                               SM_DATE_FROM           DATE,
"
"                               SM_DATE_TO            DATE
"
"                               )
"
"                    ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                    ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                    SKIP 1
"
"                    FIELDS TERMINATED BY '''||p_sep||'''
"
"                    MISSING FIELD VALUES ARE NULL
"
"                    REJECT ROWS WITH ALL NULL FIELDS
"
"                    (SM_PRICE_GRP_NAME  CHAR(255),
"
"                                         SM_CAT_ID        CHAR(255),
"
"                     SM_CAT_NAME         CHAR(255),
"
"                                         SM_SIZE_NAME       CHAR(255),
"
"                                         SM_COLOR_NAME      CHAR(255),
"
"                                         SM_CURRENCY        CHAR(255),
"
"                                         SM_UNIT_PRICE        CHAR(255),
"
"                                         SM_MRP                CHAR(255),
"
"                                         SM_DATE_FROM        CHAR(255),
"
"                                         SM_DATE_TO        CHAR(255)
"
"                                         ))
"
"                                       LOCATION ('''||p_fname||''')
"
"                                       ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
" BEGIN
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
"    IF UPPER(cr_st(indx).sm_price_grp_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT cpg_grp_id
"
"          INTO v_grp_id
"
"          FROM cust_price_groups
"
"         WHERE cpg_bu = p_bu
"
"           AND cpg_grp_desc = UPPER(cr_st(indx).sm_price_grp_name);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20228,'FAM');
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_size_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT gsize_id
"
"          INTO v_size_id
"
"          FROM gar_sizes
"
"         WHERE gsize_bu = p_bu
"
"           AND gsize_name = UPPER(cr_st(indx).sm_size_name);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20742,'CRM');
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_color_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT gcolor_id
"
"          INTO v_color_id
"
"          FROM gar_colors
"
"         WHERE gcolor_bu = p_bu
"
"           AND gcolor_name = UPPER(cr_st(indx).sm_color_name);
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          Raise_application_error(-20741,'CRM');
"
"      END;
"
"
"
"    END IF;
"
"
"
"      BEGIN
"
"        SELECT prod_id,
"
"           prod_rev,
"
"           prod_desc11
"
"          INTO v_prod_id,
"
"               v_prod_rev,
"
"               v_prod_desc1
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_status = 'A'
"
"       AND prod_gar_category = cr_st(indx).sm_cat_id;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          v_prod_id := NULL;
"
"          v_prod_rev := 0;
"
"          v_prod_desc1 := NULL;
"
"      END;
"
"
"
"     --Raise_application_error(-20999,'HRM');
"
"  proc_ins_hci_price_hist(p_bu,
"
"                          v_grp_id,
"
"                          cr_st(indx).sm_cat_id,
"
"                          v_size_id,
"
"                          v_color_id,
"
"                          cr_st(indx).sm_currency,
"
"                          cr_st(indx).sm_date_from,
"
"                          cr_st(indx).sm_date_to,
"
"                          p_user);
"
"
"
"   SELECT NVL(MAX(TO_NUMBER(hpl_doc_no)),0)+1
"
"     INTO v_doc_no
"
"     FROM hci_price_list
"
"    WHERE hpl_bu = p_bu;
"
"
"
"         INSERT INTO hci_price_list(hpl_bu,
"
"                    hpl_doc_no,
"
"                    hpl_price_grp_name,
"
"                    hpl_cat_id,
"
"                    hpl_cat_name,
"
"                    hpl_size_name,
"
"                    hpl_color_name,
"
"                    hpl_currency,
"
"                    hpl_unit_price,
"
"                    hpl_mrp,
"
"                    hpl_date_from,
"
"                    hpl_date_to,
"
"                    hpl_status,
"
"                    hpl_price_grp_id,
"
"                    hpl_size_id,
"
"                    hpl_color_id,
"
"                    hpl_prod_id,
"
"                    hpl_prod_rev,
"
"                    hpl_prod_desc1,
"
"                    hpl_cre_by,
"
"                    hpl_cre_date
"
"                       )
"
"                VALUES(p_bu,
"
"                       v_doc_no,
"
"                       cr_st(indx).sm_price_grp_name,
"
"                       cr_st(indx).sm_cat_id,
"
"                       cr_st(indx).sm_cat_name,
"
"                       cr_st(indx).sm_size_name,
"
"                       cr_st(indx).sm_color_name,
"
"                       cr_st(indx).sm_currency,
"
"                       cr_st(indx).sm_unit_price,
"
"                       cr_st(indx).sm_mrp,
"
"                       cr_st(indx).sm_date_from,
"
"                       cr_st(indx).sm_date_to,
"
"                       'P',
"
"                       v_grp_id,
"
"                       v_size_id,
"
"                       v_color_id,
"
"                       v_prod_id,
"
"                       v_prod_rev,
"
"                       v_prod_desc1,
"
"                       p_user,
"
"                                SYSDATE);
"
"
"
"    END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_hci_price_mig;*/
"
"
"
"PROCEDURE proc_ins_po_price_list_mig(p_bu        business_units.bu_id%TYPE,
"
"                         p_fname        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                     p_res     OUT     VARCHAR2,
"
"                         p_user        pur_sc_price_list.pspl_cre_by%TYPE
"
"                 )
"
"AS
"
"
"
"CURSOR c1(c_plnt        VARCHAR2,
"
"          c_suplr_id    VARCHAR2,
"
"          c_prod_id        VARCHAR2,
"
"          c_prod_rev    NUMBER,
"
"          c_prod_uom    VARCHAR2,
"
"          c_eff_fr_dt    DATE,
"
"          c_eff_to_dt    DATE) IS
"
"  SELECT *
"
"    FROM pur_sc_price_list
"
"   WHERE pspl_bu = p_bu
"
"     AND pspl_plnt =  c_plnt
"
"     AND pspl_type = 'SC'
"
"     AND pspl_suplr_id = c_suplr_id
"
"     AND pspl_prod_id = c_prod_id
"
"     AND pspl_prod_rev = c_prod_rev
"
"     AND pspl_uom = c_prod_uom
"
"     AND pspl_eff_date_from = c_eff_fr_dt
"
"     AND pspl_eff_date_to = c_eff_to_dt;
"
"
"
"  cr1            c1%ROWTYPE;
"
"
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_doc_no        VARCHAR2(30);
"
"v_ip_addr    VARCHAR2(20) := audit_info.get_ip_address;
"
"v_os_user    VARCHAR2(50) := audit_info.get_os_user;
"
"v_emp_id    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"V_PROC_SEQ_NO     NUMBER(5);
"
"v_loc_id         pur_sc_price_list.pspl_plnt_loc_id%TYPE;
"
"v_doc_pfx        pur_sc_price_list.pspl_doc_pfx%TYPE;
"
"
"
"TYPE typ_ins IS RECORD (SM_UNIT          VARCHAR2(10),
"
"            SM_UNIT_LOC             VARCHAR2(100),
"
"              SM_SUPLR_ID        VARCHAR2(25),
"
"            SM_SUPLR_NAME        VARCHAR2(150),
"
"            SM_PROD_ID        VARCHAR2(100),
"
"              SM_PROD_REV        NUMBER,
"
"              SM_PROD_DESC        VARCHAR2(150),
"
"              SM_PROD_UOM        VARCHAR2(5),
"
"            SM_CURCY        VARCHAR2(5),
"
"            SM_PRICE        NUMBER(17,5),
"
"            SM_DISC_PCT        NUMBER,
"
"            SM_EFF_FROM        DATE,
"
"            SM_EFF_TO        DATE
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
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_UNIT          VARCHAR2(10),
"
"                     SM_UNIT_LOC            VARCHAR2(100),
"
"                               SM_SUPLR_ID        VARCHAR2(25),
"
"                             SM_SUPLR_NAME        VARCHAR2(150),
"
"                             SM_PROD_ID        VARCHAR2(100),
"
"                               SM_PROD_REV        NUMBER,
"
"                               SM_PROD_DESC        VARCHAR2(150),
"
"                               SM_PROD_UOM        VARCHAR2(5),
"
"                             SM_CURCY        VARCHAR2(5),
"
"                             SM_PRICE        NUMBER(17,5),
"
"                             SM_DISC_PCT        NUMBER,
"
"                             SM_EFF_FROM        DATE,
"
"                             SM_EFF_TO        DATE
"
"                     )
"
"                                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(
"
"                     RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '''||','||'''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (
"
"                                         SM_UNIT          CHAR(255),
"
"                     SM_UNIT_LOC            CHAR(255),
"
"                           SM_SUPLR_ID        CHAR(255),
"
"                         SM_SUPLR_NAME        CHAR(255),
"
"                         SM_PROD_ID        CHAR(255),
"
"                           SM_PROD_REV        CHAR(255),
"
"                           SM_PROD_DESC        CHAR(255),
"
"                           SM_PROD_UOM        CHAR(255),
"
"                         SM_CURCY        CHAR(255),
"
"                         SM_PRICE        CHAR(255),
"
"                         SM_DISC_PCT        CHAR(255),
"
"                         SM_EFF_FROM        CHAR(255),
"
"                         SM_EFF_TO        CHAR(255)
"
"                     )
"
"                                        )
"
"                                        LOCATION ('''||p_fname||''')
"
"                                        ) REJECT LIMIT UNLIMITED';
"
"                                          EXECUTE IMMEDIATE v_sql;
"
"                                  --      COMMIT;
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"  BEGIN
"
"p_res := 'N';
"
"    OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"    LOOP
"
"
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"        --raise_application_error(-20999,'HRM');
"
"      /*IF c_st%NOTFOUND THEN
"
"       raise_application_error(-20999,'HRM');
"
"      END IF ;
"
"
"
"      EXIT WHEN c_st%NOTFOUND;*/
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
"    OPEN c1(cr_st(indx).sm_unit,cr_st(indx).sm_suplr_id,cr_st(indx).sm_prod_id,cr_st(indx).sm_prod_rev,cr_st(indx).sm_prod_uom,
"
"            NVL(cr_st(indx).sm_eff_from,TRUNC(SYSDATE)),NVL(cr_st(indx).sm_eff_to,TO_DATE('30-APR-2099')));
"
"    FETCH c1 INTO cr1;
"
"      IF c1%NOTFOUND THEN
"
"
"
"        /*SELECT NVL(MAX(TO_NUMBER(pspl_doc_no)),0)+ 1
"
"          INTO v_doc_no
"
"          FROM pur_sc_price_list
"
"         WHERE pspl_bu = p_bu
"
"           AND pspl_plnt = cr_st(indx).sm_unit;*/
"
"BEGIN
"
"SELECT bupld_loc_id
"
"   INTO v_loc_id
"
"   FROM bus_unit_plants_loc_dtls,
"
"        bus_unit_plants
"
"  WHERE bup_bu = bupld_bu
"
"    AND bup_plant_id = bupld_plnt
"
"    AND bupld_bu = p_bu
"
"    AND bupld_loc_name = TRIM(cr_st(indx).sm_unit_loc)
"
"    AND bupld_actv_loc_flag = 'Y';
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       Raise_Application_Error(-20999,'HRM');
"
"END;
"
"
"
"    /*BEGIN
"
"     SELECT apsta_pfx
"
"           INTO v_doc_pfx
"
"           FROM appl_pfx_sub_types_asso
"
"          WHERE apsta_bu = p_bu
"
"            AND apsta_vou_type = 'PLP'
"
"            AND apsta_sub_type = 'PLP'
"
"            AND apsta_plnt = cr_st(indx).sm_unit;
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       Raise_Application_Error(-20999,'HRM'||TRIM(cr_st(indx).sm_unit_loc)|| cr_st(indx).sm_unit);
"
"     END;*/
"
"
"
"       v_doc_pfx := func_find_vou_dflt_pfx(p_bu,cr_st(indx).sm_unit,v_loc_id,'PLP','PLP');
"
"
"
"           v_doc_no := func_find_pfx_nextno(p_bu,TRUNC(SYSDATE),v_doc_pfx,p_user);
"
"
"
"        INSERT INTO pur_sc_price_list(pspl_bu,
"
"                                      pspl_plnt,
"
"                      pspl_doc_pfx,
"
"                                      pspl_doc_no,
"
"                                      pspl_doc_date,
"
"                                      pspl_suplr_id,
"
"                                      pspl_prod_id,
"
"                                      pspl_prod_rev,
"
"                                      pspl_pg_type,
"
"                                      pspl_pg_id,
"
"                                      pspl_suplr_curcy,
"
"                                      pspl_unit_cost,
"
"                                      pspl_eff_date_from,
"
"                                      pspl_eff_date_to,
"
"                                      pspl_cre_by,
"
"                                      pspl_cre_date,
"
"                                      pspl_uom,
"
"                                      pspl_disc_pct,
"
"                                      pspl_ref_plnt,
"
"                                      pspl_status,
"
"                                      pspl_tax_set_id,
"
"                                      pspl_type,
"
"                      pspl_plnt_loc_name,
"
"                      pspl_plnt_loc_id
"
"                                     )
"
"                               VALUES(p_bu,
"
"                          cr_st(indx).sm_unit,
"
"                      v_doc_pfx,
"
"                                      v_doc_no,
"
"                                      TRUNC(SYSDATE),
"
"                                      cr_st(indx).sm_suplr_id,
"
"                                      cr_st(indx).sm_prod_id,
"
"                                      cr_st(indx).sm_prod_rev,
"
"                       'P',
"
"                                      NULL,
"
"                                      func_valid_party_curry(p_bu,cr_st(indx).sm_suplr_id,1),
"
"                                      cr_st(indx).sm_price,
"
"                                      NVL(cr_st(indx).sm_eff_from,TRUNC(SYSDATE)),
"
"                                      NVL(cr_st(indx).sm_eff_to,TO_DATE('30-APR-2099')),
"
"                                      p_user,
"
"                                      SYSDATE,
"
"                                      cr_st(indx).sm_prod_uom,
"
"                                      cr_st(indx).sm_disc_pct,
"
"                                      cr_st(indx).sm_unit,
"
"                                      'N',
"
"                                      NULL,
"
"                                      'PR',
"
"                      TRIM (cr_st(indx).sm_unit_loc),
"
"                      v_loc_id
"
"                                     );
"
"
"
"     /* IF cr_st(indx).sm_type = 'SC' AND cr_st(indx).sm_process IS NOT NULL THEN
"
"
"
"          INSERT INTO pur_sc_proc_price(pspp_bu,
"
"                                        pspp_plnt,
"
"                                        pspp_doc_no,
"
"                                        pspp_seq_no,
"
"                                        pspp_proc_id,
"
"                                        pspp_proc_cost,
"
"                                        pspp_cre_by,
"
"                                        pspp_cre_emp_id,
"
"                                        pspp_cre_ip_addr,
"
"                                        pspp_cre_os_user,
"
"                                        pspp_cre_date
"
"                                       )
"
"                                 VALUES(p_bu,
"
"                                        cr_st(indx).sm_unit,
"
"                                        v_doc_no,
"
"                                        1,
"
"                                        cr_st(indx).sm_process,
"
"                                        cr_st(indx).sm_price,
"
"                                        p_user,
"
"                                        v_emp_id  ,
"
"                                        v_ip_addr   ,
"
"                                        v_os_user ,
"
"                                        SYSDATE
"
"                                       );
"
"        END IF;
"
"
"
"      ELSE
"
"
"
"        IF cr_st(indx).sm_type = 'SC' AND cr_st(indx).sm_process IS NOT NULL THEN
"
"
"
"          SELECT NVL(MAX(pspp_seq_no),0)+1
"
"            INTO v_proc_seq_no
"
"            FROM pur_sc_proc_price
"
"           WHERE pspp_bu = p_bu
"
"             AND pspp_plnt = cr_st(indx).sm_unit
"
"             AND pspp_doc_no = cr1.pspl_doc_no;
"
"
"
"          INSERT INTO pur_sc_proc_price(pspp_bu,
"
"                                        pspp_plnt,
"
"                                        pspp_doc_no,
"
"                                        pspp_seq_no,
"
"                                        pspp_proc_id,
"
"                                        pspp_proc_cost,
"
"                                        pspp_cre_by,
"
"                                        pspp_cre_emp_id,
"
"                                        pspp_cre_ip_addr,
"
"                                        pspp_cre_os_user,
"
"                                        pspp_cre_date
"
"                                       )
"
"                                 VALUES(p_bu,
"
"                                        cr_st(indx).sm_unit,
"
"                                        cr1.pspl_doc_no,
"
"                                        v_proc_seq_no,
"
"                                        cr_st(indx).sm_process,
"
"                                        cr_st(indx).sm_price,
"
"                                        p_user,
"
"                                        v_emp_id  ,
"
"                                        v_ip_addr ,
"
"                                        v_os_user ,
"
"                                        SYSDATE
"
"                                       );
"
"
"
"          UPDATE pur_sc_price_list
"
"             SET pspl_unit_cost = (SELECT SUM(pspp_proc_cost)
"
"                                     FROM pur_sc_proc_price
"
"                                    WHERE pspp_bu = pspl_bu
"
"                                      AND pspp_plnt = pspl_plnt
"
"                                      AND pspp_doc_no = pspl_doc_no)
"
"           WHERE pspl_bu = p_bu
"
"             AND pspl_plnt = cr_st(indx).sm_unit
"
"             AND pspl_doc_no = cr1.pspl_doc_no;
"
"        END IF;*/
"
" p_res := 'Y';
"
"      END IF;
"
"    CLOSE c1;
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"END proc_ins_po_price_list_mig;
"
"
"
"/*---------------------------------------------------------------Inception Plan------------------------------------------------------------*/
"
"/*
"
"PROCEDURE proc_ins_inc_plan_mig(p_bu              business_units.bu_id%TYPE,
"
"                    p_plnt              tqm_ins_plan_hd.tiphd_plnt%TYPE,
"
"                    p_plan_no    tqm_ins_plan_hd.tiphd_ins_plan_no%TYPE,
"
"                    p_plan_rev        tqm_ins_plan_hd.tiphd_ins_plan_rev%TYPE,
"
"                    p_file_name       VARCHAR2,
"
"                    p_sep             VARCHAR2,
"
"                    p_user            tqm_ins_plan_hd.tiphd_cre_by%TYPE
"
"                    )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_sql_lot    VARCHAR2(4000);
"
"v_sql_so    VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"v_seq_no    NUMBER(5);
"
"v_sub_seq_no    NUMBER;
"
"v_so_seq_no     NUMBER;
"
"v_satln_uom    VARCHAR2(5);
"
"v_conv_factor    NUMBER(15,8);
"
"
"
"TYPE typ_inc_plan IS RECORD(tip_proc_id        VARCHAR2(10),
"
"                            tip_param_id        VARCHAR2(25),
"
"                            tip_std_value        NUMBER(14,5),
"
"                            tip_std_value_uom        VARCHAR2(8),
"
"                            tip_tolr_from         NUMBER(14,5),
"
"                            tip_tolr_to               NUMBER(14,5)    DEFAULT 0,
"
"                tip_spec_id               VARCHAR2(10),
"
"                tip_inst_grp_id           VARCHAR2(25),
"
"                tip_test_id               VARCHAR2(10),
"
"                tip_upd_by                VARCHAR2(15),
"
"                tip_upd_date              DATE,
"
"                tip_ins_plan_rev          NUMBER(5),
"
"                tip_instr_grp_id          VARCHAR2(15),
"
"                tip_last_verify_date      DATE,
"
"                tip_next_verify_date      DATE,
"
"                tip_insp_id               VARCHAR2(5),
"
"                tip_attr_insp_id          VARCHAR2(5),
"
"                tip_std_val_text          VARCHAR2(50),
"
"                tip_drawing_no            VARCHAR2(20),
"
"                tip_drawing_rev           VARCHAR2(5),
"
"                tip_std_val_text2         VARCHAR2(1000),
"
"                tip_print_seq_no          NUMBER(5),
"
"                tip_cre_by                VARCHAR2(15)    NOT NULL,
"
"                tip_cre_date              DATE            NOT NULL
"
"                           );
"
"
"
"TYPE typ_inc_plan_dtls IS TABLE OF typ_inc_plan INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_inc_plan_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"v_adj_pfx    stock_adjust_prefixes.sap_prefix%TYPE;
"
"v_count        NUMBER(5);
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE SCM_MIGRATION(tip_proc_id           VARCHAR2(10),
"
"                     tip_param_id           VARCHAR2(25),
"
"                     tip_std_value           NUMBER(14,5),
"
"                     tip_std_value_uom       VARCHAR2(8),
"
"                     tip_tolr_from            NUMBER(14,5),
"
"                     tip_tolr_to               NUMBER(14,5),
"
"                     tip_spec_id                  VARCHAR2(10),
"
"                     tip_inst_grp_id              VARCHAR2(25),
"
"                     tip_test_id                  VARCHAR2(10),
"
"                     tip_upd_by                VARCHAR2(15),
"
"                     tip_upd_date              DATE,
"
"                     tip_ins_plan_rev          NUMBER(5),
"
"                     tip_instr_grp_id          VARCHAR2(15),
"
"                     tip_last_verify_date      DATE,
"
"                     tip_next_verify_date      DATE,
"
"                     tip_insp_id               VARCHAR2(5),
"
"                     tip_attr_insp_id          VARCHAR2(5),
"
"                     tip_std_val_text          VARCHAR2(50),
"
"                     tip_drawing_no            VARCHAR2(20),
"
"                     tip_drawing_rev           VARCHAR2(5),
"
"                     tip_std_val_text2         VARCHAR2(1000)
"
"                                        )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '''||p_sep||'''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (tip_proc_id           CHAR(255),
"
"                     tip_param_id           CHAR(255),
"
"                     tip_std_value           CHAR(255),
"
"                     tip_std_value_uom       CHAR(255),
"
"                     tip_tolr_from            CHAR(255),
"
"                     tip_tolr_to               CHAR(255),
"
"                     tip_spec_id                  CHAR(255),
"
"                     tip_inst_grp_id              CHAR(255),
"
"                     tip_test_id                  CHAR(255),
"
"                     tip_upd_by                CHAR(255),
"
"                     tip_upd_date              CHAR(255),
"
"                     tip_ins_plan_rev          CHAR(255),
"
"                     tip_instr_grp_id          CHAR(255),
"
"                     tip_last_verify_date      CHAR(255),
"
"                     tip_next_verify_date      CHAR(255),
"
"                     tip_insp_id               CHAR(255),
"
"                     tip_attr_insp_id          CHAR(255),
"
"                     tip_std_val_text          CHAR(255),
"
"                     tip_drawing_no            CHAR(255),
"
"                     tip_drawing_rev           CHAR(255),
"
"                     tip_std_val_text2         CHAR(255)
"
"                                        ))
"
"                                        LOCATION ('''||p_file_name||''')
"
"                                        )REJECT LIMIT UNLIMITED';
"
"
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_st;
"
"
"
"  DELETE FROM stock_adj_trans_bin
"
"   WHERE satb_bu = p_bu
"
"     AND satb_ord_no = p_ord_no;
"
"
"
"  DELETE FROM stock_adj_trans_ln
"
"   WHERE satln_bu = p_bu
"
"     AND satln_ord_no = p_ord_no;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    BEGIN
"
"      SELECT sap_prefix
"
"        INTO v_adj_pfx
"
"        FROM stock_adjust_prefixes
"
"       WHERE sap_bu = p_bu
"
"         AND sap_oper = TRIM(cr_st(indx).sat_id_typ);
"
"    EXCEPTION
"
"      WHEN OTHERS THEN v_adj_pfx := NULL;
"
"    END;
"
"
"
"    v_satln_uom   := func_find_product_uom(p_bu,cr_st(indx).sat_prod_id,NVL(cr_st(indx).sat_prod_rev,0));
"
"    v_conv_factor := func_find_uom_conversion (p_bu,
"
"                           cr_st(indx).sat_prod_id,
"
"                           NVL(cr_st(indx).sat_prod_rev,0),
"
"                           v_satln_uom,
"
"                           v_satln_uom
"
"                               );
"
"
"
"    UPDATE stock_adj_trans_ln
"
"       SET satln_trans_qty = satln_trans_qty + cr_st(indx).sat_stk_qty
"
"     WHERE satln_bu = p_bu
"
"       AND satln_ord_no = p_ord_no
"
"       AND satln_adj_prefix = v_adj_pfx
"
"       AND satln_prod_id = cr_st(indx).sat_prod_id
"
"       AND satln_prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"       AND (satln_po_ord_no  = cr_st(indx).sat_prod_ord_no OR (satln_po_ord_no IS NULL AND cr_st(indx).sat_prod_ord_no IS NULL))
"
"       AND (satln_sf_code = cr_st(indx).sat_sf_code OR (satln_sf_code IS NULL AND cr_st(indx).sat_sf_code IS NULL))
"
"     RETURNING satln_seq_no INTO v_seq_no;
"
"
"
"    IF SQL%NOTFOUND THEN
"
"      BEGIN
"
"        SELECT COUNT(*)
"
"      INTO v_count
"
"      FROM products
"
"     WHERE prod_bu = p_bu
"
"       AND prod_id = cr_st(indx).sat_prod_id
"
"       AND prod_rev = NVL(cr_st(indx).sat_prod_rev,0)
"
"       AND prod_status = 'A';
"
"         IF v_count = 0 THEN
"
"       RAISE_APPLICATION_ERROR(-20260,'ICM');
"
"     END IF;
"
"      END;
"
"
"
"
"
"      SELECT NVL(MAX(satln_seq_no),0) + 1
"
"        INTO v_seq_no
"
"        FROM stock_adj_trans_ln
"
"       WHERE satln_bu = p_bu
"
"         AND satln_ord_no = p_ord_no;
"
"
"
"
"
"      INSERT INTO stock_adj_trans_ln(satln_bu,
"
"                     satln_ord_no,
"
"                     satln_seq_no,
"
"                     satln_adj_prefix,
"
"                     satln_prod_id,
"
"                     satln_prod_rev,
"
"                     satln_uom,
"
"                     satln_prod_uom,
"
"                     satln_conv_factor,
"
"                     satln_class_id,
"
"                     satln_trans_qty,
"
"                     satln_unit_cost,
"
"                     satln_status,
"
"                     satln_prodn_ord_flag,
"
"                     satln_mat_type,
"
"                     satln_dc_cre_flag,
"
"                     satln_upd_prodn_queue,
"
"                     satln_qty_in_nos,
"
"                     satln_sc_rqrd_flag,
"
"                     satln_po_ord_no,
"
"                     satln_sf_code,
"
"                     satln_cre_by,
"
"                     satln_cre_date,
"
"                     satln_so_type,
"
"                     satln_so_pfx,
"
"                     satln_so_no,
"
"                     satln_so_seq_no,
"
"                     satln_so_sub_seq_no
"
"                    )
"
"                  VALUES(p_bu,
"
"                         p_ord_no,
"
"                         v_seq_no,
"
"                         v_adj_pfx,
"
"                         cr_st(indx).sat_prod_id,
"
"                         NVL(cr_st(indx).sat_prod_rev,0),
"
"                         v_satln_uom,
"
"                         v_satln_uom,
"
"                         v_conv_factor,
"
"                         func_find_product_class(p_bu,p_plnt,cr_st(indx).sat_prod_id,NVL(cr_st(indx).sat_prod_rev,0)),
"
"                         cr_st(indx).sat_stk_qty,
"
"                         cr_st(indx).sat_unit_cost,
"
"                         'E',
"
"                         NVL(cr_st(indx).sat_upd_po,'N'),
"
"                         CASE WHEN cr_st(indx).sat_sf_code IS NULL THEN 'S' ELSE 'F' END,
"
"                         NVL(cr_st(indx).sat_upd_dc,'N'),
"
"                         NVL(cr_st(indx).sat_upd_pq,'N'),
"
"                         NVL(cr_st(indx).sat_qty_in_nos,0),
"
"                         NVL(cr_st(indx).sat_sc_rqrd_flag,'N'),
"
"                         cr_st(indx).sat_prod_ord_no,
"
"                         cr_st(indx).sat_sf_code,
"
"                         p_user,
"
"                         SYSDATE,
"
"                     CASE WHEN cr_st(indx).sat_so_pfx IS NULL THEN 'NA' ELSE 'SO' END,
"
"                     cr_st(indx).sat_so_pfx,
"
"                     cr_st(indx).sat_so_no,
"
"                     cr_st(indx).sat_so_seq_no,
"
"                     cr_st(indx).sat_so_schld_no
"
"                        );
"
"    END IF;
"
"
"
"    IF cr_st(indx).sat_lot_no IS NOT NULL OR cr_st(indx).sat_serial_no IS NOT NULL THEN
"
"
"
"      UPDATE stock_adj_trans_bin
"
"         SET satb_trans_qty  = satb_trans_qty + cr_st(indx).sat_stk_qty
"
"       WHERE satb_bu = p_bu
"
"         AND satb_ord_no = p_ord_no
"
"         AND satb_seq_no = v_seq_no
"
"         AND (satb_lot_no = cr_st(indx).sat_lot_no OR cr_st(indx).sat_lot_no IS NULL)
"
"         AND (satb_ser_no = cr_st(indx).sat_serial_no OR cr_st(indx).sat_serial_no IS NULL)
"
"     AND (satb_length = cr_st(indx).sat_length OR cr_st(indx).sat_length IS NULL)
"
"       RETURNING satb_sub_seq_no INTO v_sub_seq_no;
"
"
"
"--Raise_application_error(-20999,'HRM'||'/'||cr_st(indx).sat_lot_no||'/'||cr_st(indx).sat_serial_no||'/'||cr_st(indx).sat_stk_qty);
"
"
"
"     IF SQL%NOTFOUND THEN
"
"
"
"        SELECT NVL(MAX(satb_sub_seq_no),0) + 1
"
"          INTO v_sub_seq_no
"
"          FROM stock_adj_trans_bin
"
"         WHERE satb_bu = p_bu
"
"           AND satb_ord_no = p_ord_no
"
"           AND satb_seq_no = v_seq_no;
"
"
"
"        INSERT INTO stock_adj_trans_bin(satb_bu,
"
"                        satb_ord_no,
"
"                        satb_seq_no,
"
"                        satb_sub_seq_no,
"
"                        satb_trans_qty,
"
"                        satb_lot_no,
"
"                        satb_ser_no,
"
"                        satb_gross_weight,
"
"                        satb_tar_weight,
"
"                        satb_lot_wgt,
"
"                        satb_cre_by,
"
"                        satb_cre_date,
"
"                    satb_source_id,
"
"                    satb_source_type,
"
"                    satb_mfg_date,
"
"                    satb_thickness,
"
"                    satb_width,
"
"                    satb_length,
"
"                    satb_no_of_pcs
"
"                       )
"
"                     VALUES(p_bu,
"
"                        p_ord_no,
"
"                        v_seq_no,
"
"                        v_sub_seq_no,
"
"                        cr_st(indx).sat_stk_qty,
"
"                        cr_st(indx).sat_lot_no,
"
"                        cr_st(indx).sat_serial_no,
"
"                        0,
"
"                        0,
"
"                        0,
"
"                        p_user,
"
"                        SYSDATE,
"
"                    p_store_id,
"
"                    'O',
"
"                    NVL(cr_st(indx).sat_mfg_date,TRUNC(SYSDATE)),
"
"                    cr_st(indx).sat_thickness,
"
"                    cr_st(indx).sat_width,
"
"                    cr_st(indx).sat_length,
"
"                    cr_st(indx).sat_no_of_pcs
"
"                       );
"
"      END IF;
"
"
"
"    END IF;
"
"
"
"  END LOOP;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_inc_plan_mig;*/
"
"
"
"PROCEDURE proc_ins_corp_sr_temp  (p_bu         VARCHAR2,
"
"                         p_doc_no    VARCHAR2,
"
"                         p_fname    VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                         p_user        VARCHAR2
"
"                         )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"var_sel_flag    VARCHAR2(1);
"
"
"
" BEGIN
"
"
"
"  --rAISE_APPLICATION_ERROR(-20999,'HRM');
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE scm_migration(SM_PLNT        VARCHAR2(10),
"
"                         SM_PROD_ID    VARCHAR2(100),
"
"                         SM_PROD_REV    NUMBER,
"
"                         SM_PROD_DESC    VARCHAR2(150),
"
"                       SM_CHELLAN_QTY    NUMBER,
"
"                       SM_RECEIVE_QTY    NUMBER,
"
"                       SM_UNIT_COST    NUMBER,
"
"                       SM_MRP_PRICE    NUMBER,
"
"                       SM_MFG_DATE    DATE,
"
"                       SM_DISC_PCT    NUMBER,
"
"                       SM_HSN_CODE    VARCHAR2(25),
"
"                       SM_TAX_SET    VARCHAR2(100)
"
"                      )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                  DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                  ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                            SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep||'''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_PLNT        CHAR(255),
"
"                                SM_PROD_ID        CHAR(255),
"
"                                SM_PROD_REV        CHAR(255),
"
"                                SM_PROD_DESC    CHAR(255),
"
"                                SM_CHELLAN_QTY    CHAR(255),
"
"                                SM_RECEIVE_QTY    CHAR(255),
"
"                                SM_UNIT_COST    CHAR(255),
"
"                                SM_MRP_PRICE    CHAR(255),
"
"                                SM_MFG_DATE        CHAR(255),
"
"                                SM_DISC_PCT        CHAR(255),
"
"                                      SM_HSN_CODE            CHAR(255),
"
"                                    SM_TAX_SET        CHAR(255)
"
"                                )
"
"                                                 )
"
"                               LOCATION ('''||p_fname||''')
"
"                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  DELETE cust_sales_ret_ln_temp
"
"   WHERE csrlnt_bu = p_bu
"
"     AND csrlnt_doc_no = p_doc_no;
"
"
"
"  var_sel_flag := 'Y';
"
"
"
"  v_sql := 'INSERT INTO cust_sales_ret_ln_temp(csrlnt_bu ,
"
"                        csrlnt_doc_no ,
"
"                        csrlnt_seq_no ,
"
"                        csrlnt_prod_id ,
"
"                        csrlnt_prod_rev,
"
"                        csrlnt_prod_desc,
"
"                        csrlnt_tc_set_id ,
"
"                        csrlnt_schd_qty,
"
"                        csrlnt_unit_price,
"
"                        csrlnt_mrp_price,
"
"                        csrlnt_mfg_date,
"
"                        csrlnt_disc_pct,
"
"                        csrlnt_shipfm_plnt,
"
"                        csrlnt_hsn_code,
"
"                        csrlnt_recv_qty ,
"
"                        csrlnt_sel_user
"
")
"
"              SELECT '''||p_bu||''','''||p_doc_no||''',ROWNUM,
"
"TRIM(sm_prod_id),NVL(sm_prod_rev,0),sm_prod_desc,TRIM(sm_tax_set),NVL(sm_chellan_qty,0),NVL(sm_unit_cost,0),NVL(sm_mrp_price,0),sm_mfg_date,NVL(sm_disc_pct,0),sm_plnt,TRIM(sm_hsn_code),NVL(sm_receive_qty,0),'''||p_user||'''
"
"              FROM scm_migration';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_corp_sr_temp;
"
"/*--cre. by Prabhakar PK  cre date 11-OCT-2019*/
"
"PROCEDURE proc_ins_po_price_bulk_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_fname            VARCHAR2,
"
"                     p_doc_no            VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                         )
"
"AS
"
"
"
"v_sql            VARCHAR2(32767);
"
"v_fpath            VARCHAR2(200);
"
"
"
"TYPE typ_ins IS RECORD (SM_PROD_ID        VARCHAR2(100),
"
"              SM_PROD_REV        NUMBER(5),
"
"              SM_PROD_DESC        VARCHAR2(150),
"
"            SM_UNIT_COST        NUMBER(17,5),
"
"            SM_DISC_PCT        NUMBER(5,2)
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_PROD_ID        VARCHAR2(100),
"
"                               SM_PROD_REV        NUMBER(5),
"
"                               SM_PROD_DESC        VARCHAR2(150),
"
"                             SM_UNIT_COST        NUMBER(17,5),
"
"                             SM_DISC_PCT        NUMBER(5,2)
"
"                    )
"
"                                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(
"
"                     RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '','' OPTIONALLY ENCLOSED BY ''""''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (
"
"                     SM_PROD_ID        CHAR(255),
"
"                           SM_PROD_REV        CHAR(255),
"
"                           SM_PROD_DESC        CHAR(255),
"
"                         SM_UNIT_COST        CHAR(255),
"
"                         SM_DISC_PCT        CHAR(255)
"
"                                        ))
"
"                                        LOCATION ('''||p_fname||''')
"
"                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"                                          EXECUTE IMMEDIATE v_sql;
"
"
"
"    -- EXECUTE IMMEDIATE 'SELECT sm_prod_id,sm_prod_rev,sm_prod_desc,sm_unit_cost,sm_disc_pct FROM scm_migration'
"
"
"
"   -- BULK COLLECT INTO cr_st;
"
"  --Raise_Application_Error(-20260 , 'ICM '||'-'||cr_st.COUNT);
"
"
"
" BEGIN
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
"      --Raise_Application_Error(-20260 , 'ICM '||'-'||cr_st.COUNT);
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    UPDATE suplr_price_list_ln
"
"       SET spll_unit_cost = cr_st(indx).sm_unit_cost,
"
"           spll_disc_pct = cr_st(indx).sm_disc_pct
"
"     WHERE spll_bu = p_bu
"
"       AND spll_doc_no = p_doc_no
"
"       AND spll_prod_id= cr_st(indx).sm_prod_id
"
"       AND spll_prod_rev = cr_st(indx).sm_prod_rev;
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_po_price_bulk_mig;
"
"
"
"PROCEDURE proc_drop_exist_table(p_table_name VARCHAR2)
"
"IS
"
"CURSOR c1
"
"IS
"
"SELECT table_name
"
"FROM user_tables
"
"WHERE table_name = p_table_name;
"
"
"
"cr1   c1%ROWTYPE;
"
"
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
"       EXECUTE IMMEDIATE 'DROP TABLE '||p_table_name;
"
"    END IF;
"
"  CLOSE c1;
"
"
"
"END proc_drop_exist_table;
"
"
"
"PROCEDURE proc_ins_pur_buyer(p_bu        business_units.bu_id%TYPE,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_res    OUT     VARCHAR2,
"
"                 p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                )
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
"v_seq_no    NUMBER;
"
"
"
"TYPE typ_ins IS RECORD (SM_BUYER  VARCHAR2(10),
"
"                        SM_EMP   VARCHAR2(150),
"
"            SM_EFF_FROM DATE,
"
"            SM_EFF_TO DATE);
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
"     v_sql := 'CREATE TABLE scm_migration(SM_BUYER     VARCHAR2(10),
"
"                                          SM_EMP     VARCHAR2(150),
"
"                      SM_EFF_FROM    DATE,
"
"                      SM_EFF_TO    DATE
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
"                                           FIELDS TERMINATED BY '''||p_sep|| ''' OPTIONALLY ENCLOSED BY ''""''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_BUYER  CHAR(255),
"
"                        SM_EMP  CHAR(255),
"
"                        SM_EFF_FROM       CHAR(255) date_format DATE mask ""dd-mm-yyyy"",
"
"                        SM_EFF_TO       CHAR(255) date_format DATE mask ""dd-mm-yyyy""
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
"    p_res := 'N';
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
"
"
"          INSERT INTO buyers(buyer_bu ,
"
"                 buyer_id,
"
"                 buyer_emp_id,
"
"                 buyer_eff_from,
"
"                 buyer_eff_to,
"
"                 buyer_cre_by,
"
"                 buyer_cre_date
"
"                )
"
"              VALUES
"
"                        (p_bu,
"
"                 UPPER(cr_st(indx).sm_buyer),
"
"                 UPPER(cr_st(indx).sm_emp),
"
"                     TRUNC(cr_st(indx).sm_eff_from),
"
"                 TRUNC(cr_st(indx).sm_eff_to),
"
"                 p_user,
"
"                 SYSDATE
"
"                 );
"
"         p_res := 'Y';
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
"  END proc_ins_pur_buyer;
"
"/*--cre. by Prabhakar PK  cre date 11-OCT-2019*/
"
"PROCEDURE proc_ins_pur_attribute(p_bu        business_units.bu_id%TYPE,
"
"                     p_fname        VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                 p_res     OUT     VARCHAR2,
"
"                     p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                    )
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
"v_seq_no    NUMBER;
"
"
"
"TYPE typ_ins IS RECORD (SM_QUA_NAME  VARCHAR2(150));
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
"     v_sql := 'CREATE TABLE scm_migration(SM_QUA_NAME     VARCHAR2(150)
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
"                                           (SM_QUA_NAME  CHAR(255)
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
"  p_res := 'N';
"
"    OPEN c_st FOR 'SELECT *  FROM scm_migration';
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
"       SELECT MAX(TO_NUMBER(qattr_attr_id))
"
"        INTO v_type
"
"        FROM quotation_attr
"
"       WHERE qattr_bu = p_bu;
"
"
"
"       v_type_id := func_get_next_id(v_type);
"
"
"
"
"
"      INSERT INTO quotation_attr(qattr_bu ,
"
"                 qattr_attr_id,
"
"                 qattr_attr_name1,
"
"                 qattr_cre_by,
"
"                 qattr_cre_date,
"
"                 qattr_pom,
"
"                 qattr_som
"
"                )
"
"              VALUES
"
"                        (p_bu,
"
"                 v_type_id,
"
"                 UPPER(cr_st(indx).sm_qua_name),
"
"                 p_user,
"
"                 SYSDATE,
"
"                                 'Y',
"
"                                 'N'
"
"                );
"
"p_res := 'Y';
"
"
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
"  END proc_ins_pur_attribute;
"
"/*--cre. by Prabhakar PK  cre date 11-OCT-2019*/
"
"PROCEDURE proc_ins_pur_amd_reason(p_bu        business_units.bu_id%TYPE,
"
"                      p_fname        VARCHAR2,
"
"                      p_sep                VARCHAR2,
"
"                  p_res     OUT     VARCHAR2,
"
"                      p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                    )
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
"v_seq_no    NUMBER;
"
"
"
"TYPE typ_ins IS RECORD (SM_AMD_REASON  VARCHAR2(150),
"
"                        SM_TYPE        VARCHAR2(2),
"
"            SM_PUR_FLAG    VARCHAR2(1),
"
"            SM_SAL_FLAG    VARCHAR2(1),
"
"            SM_GE_FLAG    VARCHAR2(1),
"
"            SM_INV_FLAG    VARCHAR2(1)
"
"                        );
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
"     v_sql := 'CREATE TABLE scm_migration(SM_AMD_REASON     VARCHAR2(150),
"
"                                          SM_TYPE        VARCHAR2(2),
"
"                      SM_PUR_FLAG    VARCHAR2(1),
"
"                              SM_SAL_FLAG    VARCHAR2(1),
"
"                              SM_GE_FLAG    VARCHAR2(1),
"
"                              SM_INV_FLAG    VARCHAR2(1)
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
"                                           (SM_AMD_REASON  CHAR(255),
"
"                        SM_TYPE         CHAR(255),
"
"                        SM_PUR_FLAG    CHAR(255),
"
"                                SM_SAL_FLAG   CHAR(255),
"
"                                SM_GE_FLAG    CHAR(255),
"
"                                SM_INV_FLAG    CHAR(255)
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
"  p_res := 'N';
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
"       SELECT MAX(TO_NUMBER(amr_id))
"
"        INTO v_type
"
"        FROM amend_reason
"
"       WHERE amr_bu = p_bu;
"
"
"
"       v_type_id := func_get_next_id(v_type);
"
" IF UPPER(cr_st(indx).sm_amd_reason) IS NULL THEN
"
" RAISE_APPLICATION_ERROR(-20999,'Reason must be entered.');
"
" END IF;
"
" IF UPPER(cr_st(indx).sm_type) IS NULL THEN
"
"  RAISE_APPLICATION_ERROR(-20999,'Type must be entered.');
"
"END IF;
"
"
"
"        INSERT INTO amend_reason(amr_bu ,
"
"                 amr_id,
"
"                 amr_desc,
"
"                     amr_type,
"
"                 amr_cre_by,
"
"                 amr_cre_date,
"
"                 amr_pur_flag,
"
"                                 amr_sal_flag,
"
"                                 amr_ge_flag,
"
"                                 amr_inv_flag
"
"                )
"
"              VALUES
"
"                        (p_bu,
"
"                 v_type_id,
"
"                 UPPER(cr_st(indx).sm_amd_reason),
"
"                 UPPER(cr_st(indx).sm_type),
"
"                 p_user,
"
"                 SYSDATE,
"
"                 NVL(cr_st(indx).sm_pur_flag,'N'),
"
"                 NVL(cr_st(indx).sm_sal_flag,'N'),
"
"                 NVL(cr_st(indx).sm_ge_flag,'N'),
"
"                 NVL(cr_st(indx).sm_inv_flag,'N')
"
"                 );
"
"
"
"p_res := 'Y';
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
"  END proc_ins_pur_amd_reason;
"
"
"
"PROCEDURE proc_ins_tqm_observ_mig(p_bu               business_units.bu_id%TYPE,
"
"                      p_qc_no        tqm_qc_hd.tqhd_qc_no%TYPE,
"
"                      p_file_name        VARCHAR2,
"
"                      p_sep            VARCHAR2,
"
"                  p_res        OUT     VARCHAR2,
"
"                      p_user             tqm_qc_hd.tqhd_cre_by%TYPE
"
"                  )
"
"AS
"
"
"
"  CURSOR c_ctrl IS
"
"    SELECT bqac_allow_upd_obs_rej_flag
"
"      FROM be_qcm_appl_ctrl
"
"     WHERE bqac_bu = p_bu;
"
"
"
"  CURSOR c_qa (c_seq_no        NUMBER) IS
"
"    SELECT *
"
"      FROM tqm_qc_observ,tqm_param
"
"     WHERE tqob_bu = tqmp_bu
"
"       AND tqob_param_id = tqmp_param_id
"
"       AND tqob_bu = p_bu
"
"       AND tqob_qc_no = p_qc_no
"
"       AND tqob_qc_doc_seq_no = c_seq_no
"
"       AND tqob_qc_attained = 'N'
"
"       --AND tqmp_param_type IN ('V','T')
"
"     ORDER BY tqob_pln_seq_no;
"
"
"
"v_sql    CLOB;
"
"v_fpath    VARCHAR2(200);
"
"
"
"TYPE typ_tqm_observ IS RECORD (TQM_OBSERV_QC_NO         VARCHAR2(30),
"
"                               TQM_OBSERV_QC_SEQ_NO         NUMBER(5),
"
"                               TQM_OBSERV_SAMPLE_NO         NUMBER(5),
"
"                   TQM_OBSERV_OBSERV_NO         NUMBER(5),
"
"                   TQM_OBSERV_PARAM_DESC         VARCHAR2(100),
"
"                               TQM_OBSERV_PARAM_ID         VARCHAR2(10),
"
"                               TQM_OBSERV_PARAM_TYPE         VARCHAR2(1),
"
"                   TQM_OBSERV_TOLR_FROM        NUMBER(14,5),
"
"                   TQM_OBSERV_TOLR_TO        NUMBER(14,5),
"
"                               TQM_OBSERV_VALUE         NUMBER(14,5),
"
"                   TQM_OBSERV_STD_SPEC_DESC        VARCHAR2(100),
"
"                   TQM_OBSERV_STD_SPEC_ID        VARCHAR2(10),
"
"                   TQM_OBSERV_SPEC_DESC        VARCHAR2(100),
"
"                   TQM_OBSERV_SPEC_ID        VARCHAR2(10),
"
"                               TQM_OBSERV_TEXT_VALUE         VARCHAR2(50),
"
"                   TQM_OBSERV_AC_ATTAINED        VARCHAR2(1),
"
"                               TQM_OBSERV_REF             VARCHAR2(200)
"
"                               );
"
"
"
"TYPE typ_tqm_observ_dtls IS TABLE OF typ_tqm_observ INDEX BY PLS_INTEGER;
"
"r_observ    typ_tqm_observ_dtls;
"
"
"
"indx         NUMBER := 1;
"
"v_ac_attained    VARCHAR2(1);
"
"r_ctrl        c_ctrl%ROWTYPE;
"
"r_qa        c_qa%ROWTYPE;
"
"
"
"BEGIN
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
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    Raise_Application_Error(-20999,'HRM '||'/'||p_qc_no);
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE SCM_MIGRATION(TQM_OBSERV_QC_SEQ_NO     NUMBER(5),
"
"                                      TQM_OBSERV_PROD_ID     VARCHAR2(100),
"
"                      TQM_OBSERV_PROD_REV     NUMBER(5),
"
"                      TQM_OBSERV_PROD_DESC    VARCHAR2(150),
"
"                                      TQM_OBSERV_SAMPLE_NO     NUMBER(5),
"
"                      TQM_OBSERV_OBSERV_NO    NUMBER(5),
"
"                      TQM_OBSERV_PARAM_DESC     VARCHAR2(100),
"
"                                      TQM_OBSERV_PARAM_TYPE     VARCHAR2(1),
"
"                      TQM_OBSERV_STD_VALUE    NUMBER(14,5),
"
"                      TQM_OBSERV_STD_VALUE_UOM    VARCHAR2(5),
"
"                      TQM_OBSERV_TOLR_FROM     NUMBER(14,5),
"
"                      TQM_OBSERV_TOLR_TO    NUMBER(14,5),
"
"                                      TQM_OBSERV_VALUE         NUMBER(14,5),
"
"                      TQM_OBSERV_STD_SPEC_DESC     VARCHAR2(100),
"
"                                      TQM_OBSERV_SPEC_DESC     VARCHAR2(100),
"
"                                      TQM_OBSERV_TEXT_VALUE     VARCHAR2(50),
"
"                                      TQM_OBSERV_REF         VARCHAR2(200),
"
"                                      TQM_OBSERV_QC_NO         VARCHAR2(30))
"
"                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep||''' OPTIONALLY ENCLOSED BY ''""''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                        (TQM_OBSERV_QC_SEQ_NO         CHAR(255),
"
"             TQM_OBSERV_PROD_ID        CHAR(255),
"
"             TQM_OBSERV_PROD_REV        CHAR(255),
"
"             TQM_OBSERV_PROD_DESC        CHAR(255),
"
"                         TQM_OBSERV_SAMPLE_NO         CHAR(255),
"
"             TQM_OBSERV_OBSERV_NO        CHAR(255),
"
"             TQM_OBSERV_PARAM_DESC         CHAR(255),
"
"                         TQM_OBSERV_PARAM_TYPE         CHAR(255),
"
"             TQM_OBSERV_STD_VALUE        CHAR(255),
"
"             TQM_OBSERV_STD_VALUE_UOM    CHAR(255),
"
"             TQM_OBSERV_TOLR_FROM        CHAR(255),
"
"             TQM_OBSERV_TOLR_TO        CHAR(255),
"
"                         TQM_OBSERV_VALUE         CHAR(255),
"
"             TQM_OBSERV_STD_SPEC_DESC    CHAR(255),
"
"                         TQM_OBSERV_SPEC_DESC         CHAR(255),
"
"                         TQM_OBSERV_TEXT_VALUE         CHAR(255),
"
"                         TQM_OBSERV_REF         CHAR(255),
"
"                         TQM_OBSERV_QC_NO         CHAR(255)))
"
"                         LOCATION ('''||p_file_name||''')
"
"                         )REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  EXECUTE IMMEDIATE 'SELECT tqm_observ_qc_no,
"
"                            tqm_observ_qc_seq_no,
"
"                tqm_observ_sample_no,
"
"                            tqm_observ_observ_no,
"
"                            tqm_observ_param_desc,
"
"                            (SELECT tqmp_param_id
"
"                   FROM tqm_param
"
"                  WHERE tqmp_bu = '''||p_bu||'''
"
"                    AND tqmp_desc1 = tqm_observ_param_desc)    tqm_observ_param_id,
"
"                tqm_observ_param_type,
"
"                            tqm_observ_tolr_from,
"
"                tqm_observ_tolr_to,
"
"                tqm_observ_value,
"
"                            tqm_observ_std_spec_desc,
"
"                            (SELECT tqmspec_spec_id
"
"                   FROM tqm_specs
"
"                  WHERE tqmspec_bu = '''||p_bu||'''
"
"                    AND tqmspec_desc1 = tqm_observ_std_spec_desc)tqm_observ_std_spec_id,
"
"                            tqm_observ_spec_desc,
"
"                            (SELECT tqmspec_spec_id
"
"                   FROM tqm_specs
"
"                  WHERE tqmspec_bu = '''||p_bu||'''
"
"                    AND tqmspec_desc1 = tqm_observ_spec_desc)tqm_observ_spec_id,
"
"                tqm_observ_text_value,
"
"                            CASE WHEN (tqm_observ_value BETWEEN tqm_observ_tolr_from AND tqm_observ_tolr_to) THEN
"
"                              ''A''
"
"                            ELSE
"
"                  ''N''
"
"                            END tqm_observ_ac_attained,
"
"                tqm_observ_ref
"
"               FROM scm_migration'
"
"    BULK COLLECT INTO r_observ;
"
"  p_res := 'N';
"
"  FOR indx IN 1..r_observ.COUNT
"
"  LOOP
"
"  --RAISE_APPLICATION_ERROR(-20999,'HRM Test');
"
"  p_res := 'Y';
"
"    IF r_observ(indx).tqm_observ_param_type = 'V' THEN
"
"
"
"      IF r_observ(indx).tqm_observ_value >= 0 AND
"
"        (r_observ(indx).tqm_observ_value BETWEEN r_observ(indx).tqm_observ_tolr_from AND r_observ(indx).tqm_observ_tolr_to)  THEN
"
"        v_ac_attained := 'A';
"
"      ELSE
"
"        v_ac_attained := 'N';
"
"      END IF;
"
"
"
"      UPDATE tqm_qc_observ
"
"         SET tqob_value = r_observ(indx).tqm_observ_value,
"
"         tqob_qc_attained = v_ac_attained,
"
"         tqob_ref = r_observ(indx).tqm_observ_ref
"
"       WHERE tqob_bu = p_bu
"
"         AND tqob_qc_no = p_qc_no
"
"         AND tqob_qc_doc_seq_no = r_observ(indx).tqm_observ_qc_seq_no
"
"         AND tqob_sample_no = r_observ(indx).tqm_observ_sample_no
"
"         AND tqob_observ_no = r_observ(indx).tqm_observ_observ_no
"
"         AND tqob_param_id = r_observ(indx).tqm_observ_param_id;
"
"
"
"    ELSIF r_observ(indx).tqm_observ_param_type = 'T' THEN
"
"
"
"      UPDATE tqm_qc_observ
"
"         SET tqob_text_value = r_observ(indx).tqm_observ_text_value,
"
"         tqob_qc_attained = 'A',
"
"         tqob_ref = r_observ(indx).tqm_observ_ref
"
"       WHERE tqob_bu = p_bu
"
"         AND tqob_qc_no = p_qc_no
"
"         AND tqob_qc_doc_seq_no = r_observ(indx).tqm_observ_qc_seq_no
"
"         AND tqob_sample_no = r_observ(indx).tqm_observ_sample_no
"
"         AND tqob_observ_no = r_observ(indx).tqm_observ_observ_no
"
"         AND tqob_param_id = r_observ(indx).tqm_observ_param_id;
"
"
"
"    ELSE
"
"
"
"      IF r_observ(indx).tqm_observ_std_spec_id <> r_observ(indx).tqm_observ_spec_id THEN
"
"        v_ac_attained := 'N';
"
"      ELSE
"
"        v_ac_attained := 'A';
"
"      END IF;
"
"
"
"      UPDATE tqm_qc_observ
"
"         SET tqob_spec_id = r_observ(indx).tqm_observ_spec_id,
"
"         tqob_qc_attained = v_ac_attained,
"
"         tqob_ref = r_observ(indx).tqm_observ_ref
"
"       WHERE tqob_bu = p_bu
"
"         AND tqob_qc_no = p_qc_no
"
"         AND tqob_qc_doc_seq_no = r_observ(indx).tqm_observ_qc_seq_no
"
"         AND tqob_sample_no = r_observ(indx).tqm_observ_sample_no
"
"         AND tqob_observ_no = r_observ(indx).tqm_observ_observ_no
"
"         AND tqob_param_id = r_observ(indx).tqm_observ_param_id;
"
"
"
"    END IF;
"
"
"
"    OPEN c_ctrl;
"
"    FETCH c_ctrl INTO r_ctrl;
"
"    IF c_ctrl%FOUND THEN
"
"      IF r_ctrl.bqac_allow_upd_obs_rej_flag = 'Y' THEN
"
"
"
"        OPEN c_qa(r_observ(indx).tqm_observ_qc_seq_no);
"
"    FETCH c_qa INTO r_qa;
"
"      IF c_qa%FOUND THEN
"
"
"
"        UPDATE tqm_qc_ln
"
"               SET tqln_reject_qty = tqln_receipt_qty,
"
"                   tqln_prim_rej_qty = tqln_receipt_qty,
"
"                   tqln_accept_qty = 0,
"
"                   tqln_aod_qty = 0,
"
"                   tqln_stk_reject_qty = tqln_stk_receipt_qty,
"
"                   tqln_stk_prim_rej_qty = tqln_stk_receipt_qty,
"
"                   tqln_stk_accept_qty = 0,
"
"                   tqln_stk_aod_qty = 0
"
"           WHERE tqln_bu = p_bu
"
"             AND tqln_qc_no = p_qc_no
"
"             AND tqln_seq_no = r_observ(indx).tqm_observ_qc_seq_no;
"
"
"
"        FOR r_ls IN (SELECT *
"
"                           FROM tqm_lot_serial_nos
"
"                          WHERE tqmls_bu = p_bu
"
"                            AND tqmls_qc_no = p_qc_no
"
"                            AND tqmls_qc_doc_seq_no = r_observ(indx).tqm_observ_qc_seq_no)
"
"        LOOP
"
"          UPDATE tqm_lot_serial_nos
"
"             SET tqmls_accepted_qty = 0,
"
"                 tqmls_aod_qty = 0,
"
"                 tqmls_rejected_qty = tqmls_receipt_qty,
"
"                 tqmls_prim_rej_qty = tqmls_receipt_qty,
"
"                 tqmls_rej_flag = 'N'
"
"           WHERE tqmls_bu = p_bu
"
"                 AND tqmls_qc_no = p_qc_no
"
"                 AND tqmls_qc_doc_seq_no = r_observ(indx).tqm_observ_qc_seq_no
"
"                 AND tqmls_pln_seq_no = r_ls.tqmls_pln_seq_no;
"
"        END LOOP;
"
"
"
"      ELSE
"
"
"
"        UPDATE tqm_qc_ln
"
"               SET tqln_accept_qty = tqln_receipt_qty,
"
"                   tqln_prim_rej_qty = 0,
"
"                   tqln_reject_qty = 0,
"
"                   tqln_aod_qty = 0,
"
"                   tqln_stk_reject_qty = 0,
"
"                   tqln_stk_prim_rej_qty = 0,
"
"                   tqln_stk_accept_qty = tqln_stk_receipt_qty,
"
"                   tqln_stk_aod_qty = 0
"
"             WHERE tqln_bu = p_bu
"
"               AND tqln_qc_no = p_qc_no
"
"               AND tqln_seq_no = r_observ(indx).tqm_observ_qc_seq_no;
"
"
"
"        FOR r_ls IN (SELECT *
"
"                           FROM tqm_lot_serial_nos
"
"                          WHERE tqmls_bu = p_bu
"
"                            AND tqmls_qc_no = p_qc_no
"
"                            AND tqmls_qc_doc_seq_no = r_observ(indx).tqm_observ_qc_seq_no)
"
"        LOOP
"
"          UPDATE tqm_lot_serial_nos
"
"             SET tqmls_accepted_qty = tqmls_receipt_qty,
"
"                 tqmls_aod_qty = 0,
"
"                 tqmls_rejected_qty = 0,
"
"                 tqmls_prim_rej_qty = 0,
"
"                 tqmls_rej_flag = 'Y'
"
"           WHERE tqmls_bu = p_bu
"
"                 AND tqmls_qc_no = p_qc_no
"
"                 AND tqmls_qc_doc_seq_no = r_observ(indx).tqm_observ_qc_seq_no
"
"                 AND tqmls_pln_seq_no = r_ls.tqmls_pln_seq_no;
"
"        END LOOP;
"
"
"
"      END IF;
"
"        CLOSE c_qa;
"
"      END IF;
"
"    ELSE
"
"      Raise_Application_Error(-20408,'TQM ');
"
"    END IF;
"
"    CLOSE c_ctrl;
"
"  END LOOP;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  COMMIT;
"
"
"
"END proc_ins_tqm_observ_mig;
"
"
"
"PROCEDURE proc_ins_tqm_elemt_obs_mig(p_bu               business_units.bu_id%TYPE,
"
"                                     p_qc_pfx         tqm_qc_hd.tqhd_qc_pfx%TYPE,
"
"                         p_qc_no        tqm_qc_hd.tqhd_qc_no%TYPE,
"
"                     p_qc_rev        tqm_qc_hd.tqhd_qc_rev%TYPE,
"
"                         p_file_name        VARCHAR2,
"
"                         p_sep        VARCHAR2,
"
"                         p_user             tqm_qc_hd.tqhd_cre_by%TYPE
"
"                    )
"
"AS
"
"
"
"v_sql    CLOB;
"
"v_fpath    VARCHAR2(200);
"
"
"
"TYPE typ_observ IS RECORD(elemt_desc    VARCHAR2(50),
"
"                          c_pct        VARCHAR2(10),
"
"                          s_pct        VARCHAR2(10),
"
"                          p_pct        VARCHAR2(10),
"
"                          mn_pct    VARCHAR2(10),
"
"                          si_pct    VARCHAR2(10),
"
"                          cr_pct    VARCHAR2(10),
"
"                          mo_pct    VARCHAR2(10),
"
"                          ni_pct    VARCHAR2(10),
"
"                          b_pct        VARCHAR2(10),
"
"                          v_pct        VARCHAR2(10),
"
"                          as_pct    VARCHAR2(10),
"
"                          cu_pct    VARCHAR2(10),
"
"                          al_pct    VARCHAR2(10),
"
"                          co_pct    VARCHAR2(10),
"
"                          ti_pct    VARCHAR2(10),
"
"                          w_pct        VARCHAR2(10),
"
"                          nb_pct    VARCHAR2(10),
"
"                          pb_pct    VARCHAR2(10),
"
"                          sn_pct    VARCHAR2(10),
"
"                          fe_pct    VARCHAR2(10)
"
"                         );
"
"
"
"TYPE typ_obs IS TABLE OF typ_observ INDEX BY PLS_INTEGER;
"
"r_obs    typ_obs;
"
"
"
"indx         NUMBER := 1;
"
"
"
"BEGIN
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
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    Raise_Application_Error(-20999,'HRM '||'/'||p_qc_pfx||'/'||p_qc_no||'/'||p_qc_rev);
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE scm_migration(obs_elemt_desc    VARCHAR2(50),
"
"                                       obs_c_pct    VARCHAR2(10),
"
"                       obs_s_pct    VARCHAR2(10),
"
"                       obs_p_pct    VARCHAR2(10),
"
"                       obs_mn_pct    VARCHAR2(10),
"
"                       obs_si_pct    VARCHAR2(10),
"
"                       obs_cr_pct    VARCHAR2(10),
"
"                       obs_mo_pct    VARCHAR2(10),
"
"                       obs_ni_pct    VARCHAR2(10),
"
"                       obs_b_pct    VARCHAR2(10),
"
"                       obs_v_pct    VARCHAR2(10),
"
"                       obs_as_pct    VARCHAR2(10),
"
"                       obs_cu_pct    VARCHAR2(10),
"
"                       obs_ai_pct    VARCHAR2(10),
"
"                       obs_co_pct    VARCHAR2(10),
"
"                       obs_ti_pct    VARCHAR2(10),
"
"                       obs_w_pct    VARCHAR2(10),
"
"                       obs_nb_pct    VARCHAR2(10),
"
"                       obs_pb_pct    VARCHAR2(10),
"
"                       obs_sn_pct    VARCHAR2(10),
"
"                       obs_fe_pct    VARCHAR2(10)
"
"                      )
"
"                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                         SKIP 1
"
"                         FIELDS TERMINATED BY '''||p_sep||''' OPTIONALLY ENCLOSED BY ''""''
"
"                         MISSING FIELD VALUES ARE NULL
"
"                         REJECT ROWS WITH ALL NULL FIELDS
"
"                        (obs_elemt_desc    CHAR(255),
"
"                         obs_c_pct    CHAR(255),
"
"             obs_s_pct    CHAR(255),
"
"             obs_p_pct    CHAR(255),
"
"             obs_mn_pct    CHAR(255),
"
"             obs_si_pct    CHAR(255),
"
"             obs_cr_pct    CHAR(255),
"
"             obs_mo_pct    CHAR(255),
"
"             obs_ni_pct    CHAR(255),
"
"             obs_b_pct    CHAR(255),
"
"             obs_v_pct    CHAR(255),
"
"             obs_as_pct    CHAR(255),
"
"             obs_cu_pct    CHAR(255),
"
"             obs_ai_pct    CHAR(255),
"
"             obs_co_pct    CHAR(255),
"
"             obs_ti_pct    CHAR(255),
"
"             obs_w_pct    CHAR(255),
"
"             obs_nb_pct    CHAR(255),
"
"             obs_pb_pct    CHAR(255),
"
"             obs_sn_pct    CHAR(255),
"
"             obs_fe_pct    CHAR(255)
"
"            ))
"
"                         LOCATION ('''||p_file_name||''')
"
"                         )REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  EXECUTE IMMEDIATE 'SELECT * FROM scm_migration' BULK COLLECT INTO r_obs;
"
"
"
"  FORALL indx IN 1..r_obs.COUNT
"
"    INSERT INTO tqm_qc_elemt_obs_val(tqeov_bu,
"
"                                     tqeov_qc_no,
"
"                                     tqeov_elemt_desc,
"
"                                     tqeov_c_pct,
"
"                                     tqeov_s_pct,
"
"                                     tqeov_p_pct,
"
"                                     tqeov_mn_pct,
"
"                                     tqeov_si_pct,
"
"                                     tqeov_cr_pct,
"
"                                     tqeov_mo_pct,
"
"                                     tqeov_ni_pct,
"
"                                     tqeov_b_pct,
"
"                                     tqeov_v_pct,
"
"                                     tqeov_as_pct,
"
"                                     tqeov_cu_pct,
"
"                                     tqeov_al_pct,
"
"                                     tqeov_co_pct,
"
"                                     tqeov_ti_pct,
"
"                                     tqeov_w_pct,
"
"                                     tqeov_nb_pct,
"
"                                     tqeov_pb_pct,
"
"                                     tqeov_sn_pct,
"
"                                     tqeov_fe_pct,
"
"                                     tqeov_cre_by,
"
"                                     tqeov_cre_emp_id,
"
"                                     tqeov_cre_ip_addr,
"
"                                     tqeov_cre_os_user,
"
"                                     tqeov_cre_date
"
"                    )
"
"                              VALUES(p_bu,
"
"                     p_qc_no,
"
"                                     r_obs(indx).elemt_desc,
"
"                                     r_obs(indx).c_pct,
"
"                                     r_obs(indx).s_pct,
"
"                                     r_obs(indx).p_pct,
"
"                                     r_obs(indx).mn_pct,
"
"                                     r_obs(indx).si_pct,
"
"                                     r_obs(indx).cr_pct,
"
"                                     r_obs(indx).mo_pct,
"
"                                     r_obs(indx).ni_pct,
"
"                                     r_obs(indx).b_pct,
"
"                                     r_obs(indx).v_pct,
"
"                                     r_obs(indx).as_pct,
"
"                                     r_obs(indx).cu_pct,
"
"                                     r_obs(indx).al_pct,
"
"                                     r_obs(indx).co_pct,
"
"                                     r_obs(indx).ti_pct,
"
"                                     r_obs(indx).w_pct,
"
"                                     r_obs(indx).nb_pct,
"
"                                     r_obs(indx).pb_pct,
"
"                                     r_obs(indx).sn_pct,
"
"                                     r_obs(indx).fe_pct,
"
"                     p_user,
"
"                     func_find_emp_id(p_bu,p_user),
"
"                     Audit_Info.Get_IP_Address,
"
"                     Audit_Info.Get_OS_User,
"
"                     SYSDATE
"
"                    );
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  COMMIT;
"
"
"
"END proc_ins_tqm_elemt_obs_mig;
"
"
"
"PROCEDURE proc_ins_sub_class_mig(p_bu        business_units.bu_id%TYPE,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        suplr_price_list_ln.spll_cre_by%TYPE
"
"                    )
"
"AS
"
"
"
"v_sql            VARCHAR2(32767);
"
"v_fpath            VARCHAR2(200);
"
"v_class_id        VARCHAR2(150);
"
"v_code            NUMBER(10);
"
"v_code_id            NUMBER(10);
"
"v_res                VARCHAR2(1):='Y';
"
"v_cnt               NUMBER;
"
"
"
"TYPE typ_ins IS RECORD (SM_SUB_CLS_DESC        VARCHAR2(150),
"
"              SM_PAR_CLS_DESC        VARCHAR2(150)
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_SUB_CLS_DESC        VARCHAR2(150),
"
"                               SM_PAR_CLS_DESC    VARCHAR2(150)
"
"                    )
"
"                                         ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(
"
"                     RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '''||p_sep|| '''  OPTIONALLY ENCLOSED BY ''""''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (
"
"                    SM_SUB_CLS_DESC        CHAR(255),
"
"                          SM_PAR_CLS_DESC        CHAR(255)
"
"                                        ))
"
"                                        LOCATION ('''||p_fname||''')
"
"                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"                                          EXECUTE IMMEDIATE v_sql;
"
"
"
"    -- EXECUTE IMMEDIATE 'SELECT sm_prod_id,sm_prod_rev,sm_prod_desc,sm_unit_cost,sm_disc_pct FROM scm_migration'
"
"
"
"   -- BULK COLLECT INTO cr_st;
"
"
"
" BEGIN
"
" DELETE
"
"     FROM scm_mig_excep
"
"    WHERE sme_bu =p_bu;
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
"    FOR indx IN 1..cr_st.COUNT
"
"    LOOP
"
"      IF cr_st(indx).sm_sub_cls_desc IS NULL THEN
"
"        proc_ins_scm_mig_exp(p_bu,
"
"                          'CFG0190',
"
"                          'SUB CLASS',
"
"                          NULL,
"
"                          'Sub Class must be entered.',
"
"                          p_user);
"
"
"
"    v_res :='N';
"
"    END IF;
"
"    IF cr_st(indx).sm_par_cls_desc IS NULL THEN
"
"        proc_ins_scm_mig_exp(p_bu,
"
"                          'CFG0190',
"
"                          'SUB CLASS',
"
"                          NULL,
"
"                          'Class must be entered.',
"
"                          p_user);
"
"
"
"         v_res :='N';
"
"     ELSE
"
"      SELECT COUNT(*) INTO v_cnt
"
"        FROM classes
"
"        WHERE class_bu = p_bu
"
"        AND class_active_flag = 'Y'
"
"        AND class_desc1 =cr_st(indx).sm_par_cls_desc;
"
"      IF v_cnt = 0 THEN
"
"        proc_ins_scm_mig_exp(p_bu,
"
"                          'CFG0190',
"
"                          'SUB CLASS',
"
"                          cr_st(indx).sm_par_cls_desc,
"
"                          'Class not found.',
"
"                          p_user);
"
"
"
"         v_res :='N';
"
"    END IF;
"
"    END IF;
"
"    COMMIT;
"
"    END LOOP;
"
"
"
"     IF cr_st.COUNT = 0 THEN
"
"      Raise_Application_Error(-20999,'Sub Class must be enter');
"
"   END IF;
"
"
"
"     IF v_res ='N' THEN
"
"        RAISE_APPLICATION_ERROR(-20478,'ICM');
"
"     END IF;
"
"      --Raise_Application_Error(-20260 , 'ICM '||'-'||cr_st.COUNT);
"
"    IF v_res ='Y' THEN
"
"    FOR indx IN 1..cr_st.COUNT
"
"    LOOP
"
"    SELECT MAX(TO_NUMBER(subcls_id))
"
"      INTO v_code
"
"      FROM sub_classes
"
"     WHERE subcls_bu = p_bu;
"
"
"
"       v_code_id := func_get_next_id(v_code);
"
"
"
"       BEGIN
"
"         SELECT class_id
"
"           INTO v_class_id
"
"           FROM classes
"
"          WHERE class_bu = p_bu
"
"            AND class_desc1 = cr_st(indx).sm_par_cls_desc;
"
"    EXCEPTION WHEN no_data_found THEN
"
"      Raise_Application_Error(-20253,'ICM '||'/'||cr_st(indx).sm_par_cls_desc);
"
"    END;
"
"
"
"        INSERT INTO sub_classes(subcls_bu,
"
"                subcls_id,
"
"                subcls_parcls_id,
"
"                subcls_desc1,
"
"                subcls_desc2,
"
"                subcls_print_cls,
"
"                subcls_tin_sht_clasification,
"
"                subcls_prod_code,
"
"                subcls_steel_type,
"
"                subcls_dim_type,
"
"                subcls_cre_by,
"
"                subcls_cre_date,
"
"                subcls_upd_by,
"
"                subcls_upd_date
"
"                )
"
"              VALUES
"
"                        (p_bu,
"
"                v_code_id,
"
"                v_class_id,
"
"                cr_st(indx).sm_sub_cls_desc,
"
"                NULL,
"
"                NULL,
"
"                'NA',
"
"                NULL,
"
"                'COIL',
"
"                'N',
"
"                p_user,
"
"                SYSDATE,
"
"                NULL,
"
"                NULL
"
"                 );
"
"
"
"   END LOOP;
"
"   END IF;
"
"   END;
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"END proc_ins_sub_class_mig;
"
"
"
"PROCEDURE proc_ins_insp_plan_mig(p_bu            business_units.bu_id%TYPE,
"
"                 p_doc_no        VARCHAR2,
"
"                 p_fname        VARCHAR2,
"
"                 p_sep            VARCHAR2,
"
"                 p_user            VARCHAR2,
"
"                 p_res        OUT    VARCHAR2,
"
"                 p_dir            VARCHAR2
"
"                 )
"
"AS
"
"    TYPE ins_pln IS RECORD(IP_PLNT        VARCHAR2(10),
"
"               IP_DATE         DATE,
"
"                           IP_PLAN_NAME     VARCHAR2(50),
"
"                           IP_DATE_FROM     DATE,
"
"                           IP_DATE_TO         DATE,
"
"                           IP_TYPE         VARCHAR2(1),
"
"                           IP_PROD_ID        VARCHAR2(100),
"
"                           IP_PROD_REV        NUMBER,
"
"                           IP_PROD_DESC     VARCHAR2(150),
"
"               IP_CHAR         VARCHAR2(100),
"
"                           IP_UOM         VARCHAR2(5),
"
"                           IP_STD_VAL_TEXT     VARCHAR2(500),
"
"                           IP_STD_VAL         NUMBER(12,3),
"
"                           IP_TOL_FROM         NUMBER(12,3),
"
"                           IP_TOL_TO         NUMBER(12,3),
"
"                           IP_TEST         VARCHAR2(10),
"
"               IP_PROCESS        VARCHAR2(150));
"
"
"
"      TYPE t_pln IS TABLE OF ins_pln INDEX BY PLS_INTEGER;
"
"
"
"      TYPE t_exc IS TABLE OF insp_pln_mig_ln%ROWTYPE INDEX BY PLS_INTEGER;
"
"
"
"      TYPE typ_ref_cur IS REF CURSOR;
"
"        c_ip      typ_ref_cur;
"
"        r_ip    t_pln;
"
"
"
"  r_pln            t_pln;
"
"  r_exc            t_exc;
"
"  indx     NUMBER := 1;
"
"  v_seq_no  NUMBER;
"
"  V_TYPE  VARCHAR2(2);
"
"  BEGIN
"
"      p_res := 'N';
"
"      DELETE insp_pln_mig_ln
"
"       WHERE ipml_bu = p_bu
"
"         AND ipml_doc_no = p_doc_no;
"
"
"
"      proc_drop_exist_table('EXCEL_MIGRATION');
"
"      EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION (IP_PLNT    VARCHAR2(10),
"
"                                                       IP_DATE         DATE,
"
"                                    IP_PLAN_NAME     VARCHAR2(50),
"
"                                    IP_DATE_FROM     DATE,
"
"                                    IP_DATE_TO         DATE,
"
"                                    IP_TYPE         VARCHAR2(1),
"
"                                    IP_PROD_ID        VARCHAR2(100),
"
"                                    IP_PROD_REV        NUMBER,
"
"                                    IP_PROD_DESC     VARCHAR2(150),
"
"                                    IP_CHAR         VARCHAR2(100),
"
"                                    IP_UOM         VARCHAR2(5),
"
"                                    IP_STD_VAL_TEXT     VARCHAR2(500),
"
"                                    IP_STD_VAL         NUMBER(12,3),
"
"                                    IP_TOL_FROM         NUMBER(12,3),
"
"                                    IP_TOL_TO         NUMBER(12,3),
"
"                                    IP_TEST         VARCHAR2(10),
"
"                                   IP_PROCESS        VARCHAR2(150))
"
"                                              ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                              DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                              ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                              SKIP 1
"
"                                              FIELDS TERMINATED BY '''||p_sep||''' OPTIONALLY ENCLOSED BY ''""''
"
"                                              MISSING FIELD VALUES ARE NULL
"
"                                              REJECT ROWS WITH ALL NULL FIELDS
"
"                                              (IP_PLNT            CHAR(255),
"
"                                               IP_DATE         CHAR(255),
"
"                                    IP_PLAN_NAME     CHAR(255),
"
"                                    IP_DATE_FROM     CHAR(255),
"
"                                    IP_DATE_TO         CHAR(255),
"
"                                    IP_TYPE         CHAR(255),
"
"                                    IP_PROD_ID        CHAR(255),
"
"                                    IP_PROD_REV        CHAR(255),
"
"                                    IP_PROD_DESC     CHAR(255),
"
"                                    IP_CHAR         CHAR(255),
"
"                                    IP_UOM         CHAR(255),
"
"                                    IP_STD_VAL_TEXT     CHAR(255),
"
"                                    IP_STD_VAL         CHAR(255),
"
"                                    IP_TOL_FROM         CHAR(255),
"
"                                    IP_TOL_TO         CHAR(255),
"
"                                    IP_TEST         CHAR(255),
"
"                                   IP_PROCESS         CHAR(255))
"
"                                   )
"
"                              LOCATION ('''||p_fname||''')
"
"                               ) REJECT LIMIT UNLIMITED';
"
"
"
"            /*EXECUTE IMMEDIATE 'SELECT '''||p_bu||''' ,
"
"                          '''||p_doc_no||''' ,
"
"                          ROWNUM,
"
"                          UPPER(TRIM(IP_TYPE)),
"
"                          UPPER(TRIM(IP_PLNT)),
"
"                          IP_DATE,
"
"                          UPPER(TRIM(IP_PLAN_NAME)),
"
"                          IP_DATE_FROM,
"
"                          IP_DATE_TO,
"
"                          IP_PROD_ID,
"
"                          IP_PROD_REV,
"
"                          UPPER(TRIM(IP_PROD_DESC)),
"
"                          UPPER(TRIM(IP_CHAR)),
"
"                          UPPER(TRIM(IP_UOM)),
"
"                          UPPER(TRIM(IP_STD_VAL_TEXT)),
"
"                          IP_STD_VAL,
"
"                          IP_TOL_FROM,
"
"                          IP_TOL_TO,
"
"                          UPPER(TRIM(IP_TEST)),
"
"                          ''N'',
"
"                          '''||p_user||''',
"
"                          SYSDATE,
"
"                          NULL,
"
"                          NULL,
"
"                          NVL((SELECT mfgop_oprn_id
"
"                             FROM mfg_oprns,mfg_oprns_plnt
"
"                            WHERE mfgo_bu = mfgop_bu
"
"                              AND mfgo_oprn_id = mfgop_oprn_id
"
"                              AND mfgop_bu =  '''||p_bu||'''
"
"                              AND mfgop_plnt =  UPPER(TRIM(IP_PLNT))
"
"                              AND mfgo_desc1 = UPPER(TRIM(IP_PROCESS))),NULL)
"
"                         FROM excel_migration' BULK COLLECT INTO r_exc;
"
"
"
"        FORALL indx IN 1..r_exc.COUNT()
"
"
"
"            INSERT INTO insp_pln_mig_ln VALUES r_exc(indx);    */
"
"
"
"v_seq_no :=0;
"
"  --  RAISE_APPLICATION_ERROR(-20999,'HRM'||'1');
"
"
"
"
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM '||r_ip.count);
"
"
"
"OPEN c_ip FOR 'SELECT * FROM excel_migration ';
"
"LOOP
"
"   --RAISE_APPLICATION_ERROR(-20999,'HRM'||'1');
"
"  FETCH c_ip into r_ip(indx);
"
"  EXIT WHEN c_ip%NOTFOUND;
"
"
"
"    v_seq_no := v_seq_no+1;
"
"
"
"  IF UPPER(TRIM(r_ip(indx).ip_type)) = 'INCOMING' THEN
"
"    V_TYPE :='S';
"
"  ELSIF UPPER(TRIM(r_ip(indx).ip_type)) = 'INPROGRESS' THEN
"
"    V_TYPE :='P';
"
"  ELSIF UPPER(TRIM(r_ip(indx).ip_type)) = 'Pre Dispatch' THEN
"
"  V_TYPE :='D';
"
"   ELSIF UPPER(TRIM(r_ip(indx).ip_type)) = 'Customer' THEN
"
"  V_TYPE :='C';
"
"    ELSIF UPPER(TRIM(r_ip(indx).ip_type)) = 'NDP' THEN
"
"    V_TYPE :='N';
"
"  ELSIF UPPER(TRIM(r_ip(indx).ip_type)) = 'Final Inspection' THEN
"
"  V_TYPE :='F';
"
"  END IF;
"
"    INSERT INTO insp_pln_mig_ln (ipml_bu,
"
"                ipml_doc_no,
"
"                ipml_seq_no,
"
"                ipml_type,
"
"                ipml_unit,
"
"                ipml_plan_date,
"
"                ipml_plan_name,
"
"                ipml_from_date,
"
"                ipml_to_date,
"
"                ipml_prod_id,
"
"                ipml_prod_rev,
"
"                ipml_prod_desc,
"
"                ipml_char,
"
"                ipml_uom,
"
"                ipml_std_val_txt,
"
"                ipml_std_val,
"
"                ipml_tol_from,
"
"                ipml_tol_to,
"
"                ipml_test,
"
"                ipml_status,
"
"                ipml_cre_by,
"
"                ipml_cre_ip_addr,
"
"                ipml_cre_os_user,
"
"                ipml_cre_date,
"
"                ipml_cre_emp_id,
"
"                ipml_proc_id
"
"                   )
"
"                         VALUES(p_bu,
"
"                    p_doc_no,
"
"                v_seq_no,
"
"                V_TYPE,
"
"                UPPER(TRIM(r_ip(indx).IP_PLNT)),
"
"                r_ip(indx).IP_DATE,
"
"                UPPER(TRIM(r_ip(indx).IP_PLAN_NAME)),
"
"                r_ip(indx).IP_DATE_FROM,
"
"                r_ip(indx).IP_DATE_TO,
"
"                r_ip(indx).IP_PROD_ID,
"
"                r_ip(indx).IP_PROD_REV,
"
"                UPPER(TRIM(r_ip(indx).IP_PROD_DESC)),
"
"                UPPER(TRIM(r_ip(indx).IP_CHAR)),
"
"                UPPER(TRIM(r_ip(indx).IP_UOM)),
"
"                UPPER(TRIM(r_ip(indx).IP_STD_VAL_TEXT)),
"
"                r_ip(indx).IP_STD_VAL,
"
"                r_ip(indx).IP_TOL_FROM,
"
"                r_ip(indx).IP_TOL_TO,
"
"                UPPER(TRIM(r_ip(indx).IP_TEST)),
"
"                'N',
"
"                p_user,
"
"                NULL,
"
"                NULL,
"
"                SYSDATE,
"
"                NULL,
"
"                NULL
"
"                               );
"
"
"
"
"
"indx := indx + 1;
"
"END LOOP;
"
"CLOSE c_ip;
"
"
"
"        p_res := 'Y';
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"   Commit;
"
"   END proc_ins_insp_plan_mig;
"
"
"
"PROCEDURE proc_ins_insp_plan_mig_exp
"
"            (p_bu            business_units.bu_id%TYPE,
"
"             p_doc_no        VARCHAR2,
"
"             p_user            VARCHAR2,
"
"             p_res        OUT    VARCHAR2
"
")
"
"AS
"
"CURSOR c_exc
"
"      IS
"
"    SELECT *
"
"      FROM insp_pln_mig_ln
"
"     WHERE ipml_bu = p_bu
"
"       AND ipml_doc_no = p_doc_no
"
"    ORDER BY ipml_seq_no;
"
"
"
"CURSOR c_char(c_char    VARCHAR2)
"
"    IS
"
"SELECT *
"
"  FROM tqm_param
"
" WHERE tqmp_bu = p_bu
"
"   AND tqmp_desc1 = c_char;
"
"
"
"CURSOR c_unit
"
"  IS
"
"SELECT *
"
"  FROM insp_pln_mig_ln
"
" WHERE ipml_bu = p_bu
"
"   AND ipml_doc_no = p_doc_no
"
"   AND NOT EXISTS (SELECT 1
"
"             FROM bus_unit_plants
"
"            WHERE bup_bu = ipml_bu
"
"              AND bup_plant_id = ipml_unit)
"
" ORDER BY ipml_seq_no;
"
"
"
"CURSOR c_prod
"
"  IS
"
"SELECT *
"
"  FROM insp_pln_mig_ln
"
" WHERE ipml_bu = p_bu
"
"   AND ipml_doc_no = p_doc_no
"
"   AND NOT EXISTS (SELECT 1
"
"             FROM products
"
"            WHERE prod_bu = ipml_bu
"
"              AND prod_id = ipml_prod_id
"
"              AND prod_rev = ipml_prod_rev
"
"              AND prod_status = 'A')
"
" ORDER BY ipml_seq_no;
"
"
"
"CURSOR c_uom
"
"  IS
"
"SELECT *
"
"  FROM insp_pln_mig_ln
"
" WHERE ipml_bu = p_bu
"
"   AND ipml_doc_no = p_doc_no
"
"   AND NOT EXISTS (SELECT 1
"
"             FROM unit_of_measures
"
"            WHERE uom_bu = ipml_bu
"
"              AND uom_uom = ipml_uom)
"
" ORDER BY ipml_seq_no;
"
"
"
"CURSOR c_param
"
"  IS
"
"SELECT *
"
"  FROM insp_pln_mig_ln
"
" WHERE ipml_bu = p_bu
"
"   AND ipml_doc_no = p_doc_no
"
"   AND NOT EXISTS (SELECT 1
"
"             FROM tqm_param
"
"            WHERE tqmp_bu = ipml_bu
"
"              AND tqmp_desc1 = ipml_char)
"
" ORDER BY ipml_seq_no;
"
"
"
"
"
"v_err_msg    VARCHAR2(4000);
"
"v_flag        VARCHAR2(1);
"
"v_exe_cnt    NUMBER(5);
"
"v_seq_no    NUMBER(5);
"
"cr_char        c_char%ROWTYPE;
"
"
"
"BEGIN
"
"  v_flag := 'N';
"
"  p_res := 'N';
"
"  DELETE
"
"    FROM insp_pln_mig_ln_exp
"
"   WHERE ipmle_bu = p_bu
"
"     AND ipmle_doc_no = p_doc_no;
"
"  FOR r_exc IN c_exc
"
"  LOOP
"
"    IF r_exc.ipml_unit IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'Unit must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    IF r_exc.ipml_plan_name IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'Plan Name must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    IF r_exc.ipml_from_date IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'From Date must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    IF r_exc.ipml_to_date IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'To Date must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    IF r_exc.ipml_prod_id IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'Item must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    IF r_exc.ipml_prod_rev IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'Item Rev. must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    IF r_exc.ipml_char IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'Characteristics must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"
"
"    OPEN c_char(r_exc.ipml_char);
"
"    FETCH c_char INTO cr_char;
"
"      IF c_char%FOUND THEN
"
"     IF cr_char.tqmp_param_type = 'V' THEN
"
"        IF r_exc.ipml_std_val IS NULL THEN
"
"           SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"         INTO v_seq_no
"
"         FROM insp_pln_mig_ln_exp
"
"        WHERE ipmle_bu = p_bu
"
"          AND ipmle_doc_no = p_doc_no;
"
"           INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                           ipmle_doc_no,
"
"                           ipmle_seq_no,
"
"                           ipmle_exp_ref,
"
"                           ipmle_cre_by,
"
"                           ipmle_cre_date
"
"                          )
"
"                    VALUES(p_bu,
"
"                           p_doc_no,
"
"                           v_seq_no,
"
"                           r_exc.ipml_seq_no||'STD Value must be entered.',
"
"                           p_user,
"
"                           SYSDATE
"
"                          );
"
"        END IF;
"
"        IF r_exc.ipml_tol_from IS NULL THEN
"
"           SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"         INTO v_seq_no
"
"         FROM insp_pln_mig_ln_exp
"
"        WHERE ipmle_bu = p_bu
"
"          AND ipmle_doc_no = p_doc_no;
"
"           INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                           ipmle_doc_no,
"
"                           ipmle_seq_no,
"
"                           ipmle_exp_ref,
"
"                           ipmle_cre_by,
"
"                           ipmle_cre_date
"
"                          )
"
"                    VALUES(p_bu,
"
"                           p_doc_no,
"
"                           v_seq_no,
"
"                           r_exc.ipml_seq_no||'Tolerance From Value must be entered.',
"
"                           p_user,
"
"                           SYSDATE
"
"                          );
"
"        END IF;
"
"        IF r_exc.ipml_tol_to IS NULL THEN
"
"           SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"         INTO v_seq_no
"
"         FROM insp_pln_mig_ln_exp
"
"        WHERE ipmle_bu = p_bu
"
"          AND ipmle_doc_no = p_doc_no;
"
"           INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                           ipmle_doc_no,
"
"                           ipmle_seq_no,
"
"                           ipmle_exp_ref,
"
"                           ipmle_cre_by,
"
"                           ipmle_cre_date
"
"                          )
"
"                    VALUES(p_bu,
"
"                           p_doc_no,
"
"                           v_seq_no,
"
"                           r_exc.ipml_seq_no||'Tolerance To Value must be entered.',
"
"                           p_user,
"
"                           SYSDATE
"
"                          );
"
"        END IF;
"
"     END IF;
"
"      END IF;
"
"    CLOSE c_char;
"
"
"
"    IF r_exc.ipml_uom IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'UOM must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"    IF r_exc.ipml_std_val_txt IS NULL THEN
"
"       SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"     INTO v_seq_no
"
"     FROM insp_pln_mig_ln_exp
"
"    WHERE ipmle_bu = p_bu
"
"      AND ipmle_doc_no = p_doc_no;
"
"       INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                       ipmle_doc_no,
"
"                       ipmle_seq_no,
"
"                       ipmle_exp_ref,
"
"                       ipmle_cre_by,
"
"                       ipmle_cre_date
"
"                      )
"
"                VALUES(p_bu,
"
"                       p_doc_no,
"
"                       v_seq_no,
"
"                       r_exc.ipml_seq_no||'Std. value text must be entered.',
"
"                       p_user,
"
"                       SYSDATE
"
"                      );
"
"    END IF;
"
"  END LOOP;
"
"  FOR r_unit IN c_unit
"
"  LOOP
"
"    SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"      INTO v_seq_no
"
"      FROM insp_pln_mig_ln_exp
"
"     WHERE ipmle_bu = p_bu
"
"       AND ipmle_doc_no = p_doc_no;
"
"    INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                    ipmle_doc_no,
"
"                    ipmle_seq_no,
"
"                    ipmle_exp_ref,
"
"                    ipmle_cre_by,
"
"                    ipmle_cre_date
"
"                   )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    v_seq_no,
"
"                    r_unit.ipml_unit||' - Unit not found.',
"
"                    p_user,
"
"                    SYSDATE
"
"                   );
"
"  END LOOP c_unit;
"
"  FOR r_prod IN c_prod
"
"  LOOP
"
"    SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"      INTO v_seq_no
"
"      FROM insp_pln_mig_ln_exp
"
"     WHERE ipmle_bu = p_bu
"
"       AND ipmle_doc_no = p_doc_no;
"
"    INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                    ipmle_doc_no,
"
"                    ipmle_seq_no,
"
"                    ipmle_exp_ref,
"
"                    ipmle_cre_by,
"
"                    ipmle_cre_date
"
"                   )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    v_seq_no,
"
"                    r_prod.ipml_prod_id||' - Item not found.',
"
"                    p_user,
"
"                    SYSDATE
"
"                   );
"
"  END LOOP c_prod;
"
"  FOR r_uom IN c_uom
"
"  LOOP
"
"    SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"      INTO v_seq_no
"
"      FROM insp_pln_mig_ln_exp
"
"     WHERE ipmle_bu = p_bu
"
"       AND ipmle_doc_no = p_doc_no;
"
"    INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                    ipmle_doc_no,
"
"                    ipmle_seq_no,
"
"                    ipmle_exp_ref,
"
"                    ipmle_cre_by,
"
"                    ipmle_cre_date
"
"                   )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    v_seq_no,
"
"                    r_uom.ipml_uom||' - UOM not found.',
"
"                    p_user,
"
"                    SYSDATE
"
"                   );
"
"  END LOOP c_uom;
"
"  FOR r_param IN c_param
"
"  LOOP
"
"    SELECT NVL(MAX(ipmle_seq_no),0)+1
"
"      INTO v_seq_no
"
"      FROM insp_pln_mig_ln_exp
"
"     WHERE ipmle_bu = p_bu
"
"       AND ipmle_doc_no = p_doc_no;
"
"    INSERT INTO insp_pln_mig_ln_exp(ipmle_bu,
"
"                    ipmle_doc_no,
"
"                    ipmle_seq_no,
"
"                    ipmle_exp_ref,
"
"                    ipmle_cre_by,
"
"                    ipmle_cre_date
"
"                   )
"
"                 VALUES(p_bu,
"
"                    p_doc_no,
"
"                    v_seq_no,
"
"                    r_param.ipml_char||' - Characteristics not found.',
"
"                    p_user,
"
"                    SYSDATE
"
"                   );
"
"
"
"  END LOOP c_param;
"
"  BEGIN
"
"    SELECT COUNT(*)
"
"      INTO v_exe_cnt
"
"      FROM insp_pln_mig_ln_exp
"
"     WHERE ipmle_bu = p_bu
"
"       AND ipmle_doc_no = p_doc_no;
"
"   EXCEPTION WHEN NO_DATA_FOUND THEN
"
"     v_exe_cnt := 0;
"
"   END;
"
"  IF v_exe_cnt > 0 THEN
"
"     p_res := 'Y';
"
"  END IF;
"
"END proc_ins_insp_plan_mig_exp;
"
"PROCEDURE proc_ins_insp_plan_mig_dtls(p_bu            business_units.bu_id%TYPE,
"
"                          p_doc_no            VARCHAR2,
"
"                      p_user            VARCHAR2,
"
"                      p_res        OUT    VARCHAR2
"
"                     )
"
"IS
"
"CURSOR c_hd
"
"    IS
"
"SELECT ipml_type,
"
"       ipml_unit,
"
"       ipml_plan_date,
"
"       ipml_plan_name,
"
"       ipml_from_date,
"
"       ipml_to_date,
"
"       ipml_prod_id,
"
"       ipml_prod_rev,
"
"       ipmh_ref
"
"  FROM insp_pln_mig_hd,
"
"       insp_pln_mig_ln
"
" WHERE ipmh_bu = ipml_bu
"
"   AND ipmh_doc_no = ipml_doc_no
"
"   AND ipml_bu = p_bu
"
"   AND ipml_doc_no = p_doc_no
"
" GROUP BY ipml_type,
"
"          ipml_unit,
"
"          ipml_plan_date,
"
"          ipml_plan_name,
"
"          ipml_from_date,
"
"          ipml_to_date,
"
"          ipml_prod_id,
"
"          ipml_prod_rev,
"
"          ipmh_ref;
"
"
"
"CURSOR c_ln(c_type        VARCHAR2,
"
"            c_unit        VARCHAR2,
"
"            c_date        DATE,
"
"            c_name        VARCHAR2,
"
"            c_prod_id        VARCHAR2,
"
"            c_prod_rev        NUMBER)
"
"    IS
"
"SELECT *
"
"  FROM insp_pln_mig_hd,
"
"       insp_pln_mig_ln
"
" WHERE ipmh_bu = ipml_bu
"
"   AND ipmh_doc_no = ipml_doc_no
"
"   AND ipml_bu = p_bu
"
"   AND ipml_doc_no = p_doc_no
"
"   AND ipml_type = c_type
"
"   AND ipml_unit = c_unit
"
"   AND ipml_plan_date = c_date
"
"   AND ipml_plan_name = c_name
"
"   AND ipml_prod_id = c_prod_id
"
"   AND ipml_prod_rev = c_prod_rev
"
"ORDER BY ipml_seq_no;
"
"
"
"CURSOR c_dtls(c_char    VARCHAR2)
"
"    IS
"
"SELECT tqmp_param_id,
"
"       tqmp_desc1,
"
"       tqmp_test_id,
"
"       tqmp_param_type,
"
"       tqmp_instr_grp_id
"
"      FROM tqm_param
"
"     WHERE tqmp_bu = p_bu
"
"       AND tqmp_desc1 = c_char;
"
"
"
"cr_dtls        c_dtls%ROWTYPE;
"
"v_seq_no    NUMBER(5);
"
"v_plan_no    TQM_INS_PLAN_HD.tiphd_ins_plan_no%TYPE;
"
"var_rcpt_no    VARCHAR2(2000);
"
"
"
"
"
"BEGIN
"
"  p_res := 'N';
"
"  FOR cr_hd IN c_hd
"
"  LOOP
"
"    SELECT NVL(MAX(TO_NUMBER(tiphd_ins_plan_no)),0)+1
"
"      INTO v_plan_no
"
"      FROM TQM_INS_PLAN_HD
"
"     WHERE TIPHD_bu = p_bu
"
"       AND tiphd_plnt = cr_hd.ipml_unit;
"
"    var_rcpt_no := var_rcpt_no||v_plan_no||' ';
"
"    INSERT INTO tqm_ins_plan_hd (tiphd_bu,
"
"                                 tiphd_plnt,
"
"                                 tiphd_date,
"
"                                 tiphd_ins_plan_no,
"
"                                 tiphd_type,
"
"                                 tiphd_item_id,
"
"                                 tiphd_item_rev,
"
"                                 tiphd_dt_from,
"
"                                 tiphd_dt_to,
"
"                                 tiphd_status,
"
"                                 tiphd_ref,
"
"                                 tiphd_cust_id,
"
"                                 tiphd_ins_plan_name,
"
"                                 tiphd_cre_by,
"
"                                 tiphd_cre_date,
"
"                                 tiphd_ins_plan_rev,
"
"                                 tiphd_suplr_id,
"
"                                 tiphd_ass_type
"
"                                 )
"
"                          VALUES(p_bu,
"
"                             TRIM(cr_hd.ipml_unit),
"
"                         NVL(TRUNC(cr_hd.ipml_plan_date),TRUNC(SYSDATE)),
"
"                         v_plan_no,
"
"                         TRIM(cr_hd.ipml_type),
"
"                         TRIM(cr_hd.ipml_prod_id),
"
"                         TRIM(cr_hd.ipml_prod_rev),
"
"                         TRUNC(cr_hd.ipml_from_date),
"
"                         TRUNC(cr_hd.ipml_to_date),
"
"                         'N',
"
"                         TRIM(cr_hd.ipmh_ref),
"
"                         NULL,
"
"                         TRIM(cr_hd.ipml_plan_name),
"
"                         p_user,
"
"                         SYSDATE,
"
"                         0,
"
"                         NULL,
"
"                         'S'
"
"                    );
"
"    FOR cr_ln IN c_ln(cr_hd.ipml_type,
"
"                      cr_hd.ipml_unit,
"
"                      cr_hd.ipml_plan_date,
"
"                      cr_hd.ipml_plan_name,
"
"                      cr_hd.ipml_prod_id,
"
"                      cr_hd.ipml_prod_rev)
"
"    LOOP
"
"      OPEN c_dtls(cr_ln.ipml_char);
"
"      FETCH c_dtls INTO cr_dtls;
"
"        IF c_dtls%NOTFOUND THEN
"
"           Raise_Application_Error(-20999,'HRM');
"
"        ELSE
"
"          SELECT NVL(MAX(tipln_seq_no),0)+1
"
"        INTO v_seq_no
"
"        FROM tqm_ins_plan_ln
"
"       WHERE tipln_bu = p_bu
"
"         AND tipln_plnt = TRIM(cr_hd.ipml_unit)
"
"             AND tipln_ins_plan_no = v_plan_no;
"
"
"
"          INSERT INTO tqm_ins_plan_ln (tipln_bu,
"
"                                        tipln_plnt,
"
"                                       tipln_ins_plan_no,
"
"                       tipln_seq_no,
"
"                       tipln_proc_id,
"
"                       tipln_param_id,
"
"                       tipln_std_value,
"
"                       tipln_std_value_uom,
"
"                       tipln_tolr_from,
"
"                       tipln_tolr_to,
"
"                       tipln_spec_id,
"
"                       tipln_inst_grp_id,
"
"                       tipln_critic_flag,
"
"                       tipln_deciding_flag,
"
"                       tipln_sel_flag,
"
"                       tipln_cost_factor,
"
"                       tipln_test_id,
"
"                       tipln_cre_by,
"
"                       tipln_cre_date,
"
"                       tipln_ins_plan_rev,
"
"                       tipln_instr_grp_id,
"
"                       tipln_check_dur_in_days,
"
"                       tipln_std_val_text,
"
"                       tipln_std_operator,
"
"                       tipln_print_seq_no,
"
"                       tipln_tc_mant_flag,
"
"                       tipln_obsrv_rqrd_flag,
"
"                       tipln_inc_cost,
"
"                       tipln_param_basis,
"
"                       tipln_excd_pct_flag,
"
"                       tipln_rebate_oprn,
"
"                       tqpln_rebate_method,
"
"                       tipln_tool_param,
"
"                       tipln_std_val_text2
"
"                      )
"
"                    VALUES(p_bu,
"
"                       TRIM(cr_hd.ipml_unit),
"
"                       v_plan_no,
"
"                       v_seq_no,
"
"                       NULL,
"
"                       cr_dtls.tqmp_param_id,
"
"                       TRIM(cr_ln.ipml_std_val),
"
"                       TRIM(cr_ln.ipml_uom),
"
"                       TRIM(cr_ln.ipml_tol_from),
"
"                       TRIM(cr_ln.ipml_tol_to),
"
"                       NULL,
"
"                       NULL,
"
"                       'N',
"
"                       'N',
"
"                       'N',
"
"                       'N',
"
"                       cr_dtls.tqmp_test_id,
"
"                       p_user,
"
"                       SYSDATE,
"
"                       0,
"
"                       cr_dtls.tqmp_instr_grp_id,
"
"                       0,
"
"                       SUBSTR(TRIM(cr_ln.ipml_std_val_txt),1,50),
"
"                       'B',
"
"                       v_seq_no,
"
"                       'N',
"
"                       'Y',
"
"                       'N',
"
"                       'P',
"
"                       'N',
"
"                       'F',
"
"                       'S',
"
"                       'N',
"
"                       TRIM(cr_ln.ipml_std_val_txt)
"
"                      );
"
"
"
"        END IF;
"
"      CLOSE c_dtls;
"
"    END LOOP;
"
"      IF var_rcpt_no IS NOT NULL THEN
"
"        p_res := func_find_order_no_substr(var_rcpt_no);
"
"  END IF;
"
"  END LOOP;
"
"END proc_ins_insp_plan_mig_dtls;
"
"
"
"PROCEDURE proc_ins_camp_lead_mig(p_bu         VARCHAR2,
"
"                                 p_camp_id    VARCHAR2,
"
"                           p_fname    VARCHAR2,
"
"                           p_sep        VARCHAR2,
"
"                           p_user        VARCHAR2
"
"                           )
"
"AS
"
"
"
"v_city_id           VARCHAR2(10);
"
"v_sp_id             VARCHAR2(10);
"
"v_attd_id            VARCHAR2(10);
"
"v_sql            VARCHAR2(4000);
"
"v_fpath            VARCHAR2(200);
"
"v_sub_terr_id        VARCHAR2(10);
"
"v_terr_id        VARCHAR2(10);
"
"v_sales_area_id        VARCHAR2(10);
"
"
"
"
"
"
"
" TYPE typ_ins IS RECORD (SM_CP_NAME         VARCHAR2(50),
"
"                         SM_POSITION_NAME      VARCHAR2(50),
"
"                         SM_COMP_NAME        VARCHAR2(50),
"
"             SM_ADDR1        VARCHAR2(50),
"
"             SM_ADDR2         VARCHAR2(50),
"
"             SM_ADDR3         VARCHAR2(50),
"
"             SM_CITY_NAME         VARCHAR2(30),
"
"             SM_MOBILE        VARCHAR2(30),
"
"             SM_EMAIL         VARCHAR2(50),
"
"             SM_SP_NAME             VARCHAR2(50),
"
"             SM_CAMP_ATND        VARCHAR2(1),
"
"             SM_CAMP_ATND_NAME    VARCHAR2(100),
"
"             SM_RQRMT        VARCHAR2(200),
"
"             SM_ACTION_PROD        VARCHAR2(200),
"
"             SM_PRIORITY        VARCHAR2(1),
"
"             SM_SUB_TERR_NAME    VARCHAR2(30)
"
"             );
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
"v_seq_no    NUMBER;
"
"
"
"BEGIN
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE scm_migration(SM_CP_NAME         VARCHAR2(50),
"
"                     SM_POSITION_NAME      VARCHAR2(50),
"
"                     SM_COMP_NAME          VARCHAR2(50),
"
"                     SM_ADDR1        VARCHAR2(50),
"
"                     SM_ADDR2         VARCHAR2(50),
"
"                     SM_ADDR3         VARCHAR2(50),
"
"                     SM_CITY_NAME         VARCHAR2(30),
"
"                     SM_MOBILE        VARCHAR2(30),
"
"                     SM_EMAIL         VARCHAR2(50),
"
"                     SM_SP_NAME             VARCHAR2(50),
"
"                     SM_CAMP_ATND           VARCHAR2(1),
"
"                     SM_CAMP_ATND_NAME      VARCHAR2(100),
"
"                     SM_RQRMT               VARCHAR2(200),
"
"                     SM_ACTION_PROD        VARCHAR2(200),
"
"                     SM_PRIORITY            VARCHAR2(1),
"
"                     SM_SUB_TERR_NAME    VARCHAR2(30)
"
"                     )
"
"                    ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                    ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                    SKIP 1
"
"                    FIELDS TERMINATED BY '''||p_sep||'''
"
"                    MISSING FIELD VALUES ARE NULL
"
"                    REJECT ROWS WITH ALL NULL FIELDS
"
"                    (SM_CP_NAME          CHAR(255),
"
"                                         SM_POSITION_NAME   CHAR(255),
"
"                                         SM_COMP_NAME        CHAR(255),
"
"                     SM_ADDR1         CHAR(255),
"
"                                         SM_ADDR2           CHAR(255),
"
"                                         SM_ADDR3           CHAR(255),
"
"                                         SM_CITY_NAME        CHAR(255),
"
"                                         SM_MOBILE        CHAR(255),
"
"                                         SM_EMAIL        CHAR(255),
"
"                                         SM_SP_NAME        CHAR(255),
"
"                                         SM_CAMP_ATND        CHAR(255),
"
"                                         SM_CAMP_ATND_NAME  CHAR(255),
"
"                                         SM_RQRMT        CHAR(255),
"
"                                         SM_ACTION_PROD        CHAR(255),
"
"                                         SM_PRIORITY        CHAR(255),
"
"                                         SM_SUB_TERR_NAME   CHAR(255)
"
"                                         ))
"
"                                       LOCATION ('''||p_fname||''')
"
"                                       ) REJECT LIMIT UNLIMITED';
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
" BEGIN
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
"      SELECT NVL(MAX(cca_seq_no),0)+1
"
"    INTO v_seq_no
"
"    FROM crm_campgn_attendees
"
"       WHERE cca_bu = p_bu
"
"     AND cca_campaign_id = p_camp_id;
"
"
"
"    IF UPPER(cr_st(indx).sm_city_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT city_id
"
"          INTO v_city_id
"
"          FROM cities
"
"         WHERE city_name1 = TRIM(UPPER(cr_st(indx).sm_city_name));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          --Raise_application_error(-20005,'ADM'||'/'||(cr_st(indx).sm_city_name));
"
"          v_city_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"    IF UPPER(cr_st(indx).sm_sp_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT sp_person
"
"          INTO v_sp_id
"
"      FROM sales_persons
"
"         WHERE sp_bu = p_bu
"
"           AND sp_person_name1 = TRIM(UPPER(cr_st(indx).sm_sp_name));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          --Raise_application_error(-20421,'CRM'||'/'||TRIM(UPPER(cr_st(indx).sm_sp_name)));
"
"          v_sp_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"   IF  cr_st(indx).sm_camp_atnd = 'L' THEN
"
"
"
"    IF UPPER(cr_st(indx).sm_camp_atnd_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT ml_lead_no
"
"          INTO v_attd_id
"
"      FROM mktg_leads
"
"         WHERE ml_bu = p_bu
"
"           AND ml_cp_name = TRIM(UPPER(cr_st(indx).sm_camp_atnd_name));
"
"           --AND ROWNUM = 1;
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"         -- Raise_application_error(-20982,'CRM'||'/'||TRIM(UPPER(cr_st(indx).sm_camp_atnd_name)));
"
"         v_attd_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"   ELSIF  cr_st(indx).sm_camp_atnd = 'P' THEN
"
"
"
"    IF UPPER(cr_st(indx).sm_camp_atnd_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT prosp_prosp_id
"
"          INTO v_attd_id
"
"      FROM prospects
"
"         WHERE prosp_bu = p_bu
"
"           AND prosp_name1 = TRIM(UPPER(cr_st(indx).sm_camp_atnd_name));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          --Raise_application_error(-20704,'CRM'||'/'||TRIM(UPPER(cr_st(indx).sm_camp_atnd_name)));
"
"          v_attd_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"   ELSIF  cr_st(indx).sm_camp_atnd = 'C' THEN
"
"
"
"    IF UPPER(cr_st(indx).sm_camp_atnd_name) IS NOT NULL THEN
"
"
"
"      BEGIN
"
"        SELECT suplr_suplr_id
"
"          INTO v_attd_id
"
"      FROM suppliers
"
"         WHERE suplr_bu = p_bu
"
"           AND suplr_name1 = TRIM(UPPER(cr_st(indx).sm_camp_atnd_name));
"
"
"
"      EXCEPTION
"
"        WHEN NO_DATA_FOUND THEN
"
"          --Raise_application_error(-20152,'ARM'||'/'||TRIM(UPPER(cr_st(indx).sm_camp_atnd_name)));
"
"          v_attd_id := NULL;
"
"      END;
"
"
"
"    END IF;
"
"
"
"   END IF;
"
"
"
"         IF UPPER((cr_st(indx).sm_sub_terr_name)) IS NOT NULL THEN
"
"
"
"         BEGIN
"
"           SELECT sst_sub_terr_id
"
"             INTO v_sub_terr_id
"
"             FROM sales_sub_terr,sales_area_terr
"
"            WHERE sst_bu = sat_bu
"
"              AND sst_terr_id = sat_terr_id
"
"              AND sst_bu = p_bu
"
"              AND sst_desc1 = TRIM(UPPER(cr_st(indx).sm_sub_terr_name));
"
"
"
"         EXCEPTION
"
"           WHEN NO_DATA_FOUND THEN
"
"             v_sub_terr_id := NULL;
"
"         END;
"
"
"
"       END IF;
"
"
"
"         IF UPPER((cr_st(indx).sm_sub_terr_name)) IS NOT NULL THEN
"
"
"
"         BEGIN
"
"           SELECT sst_terr_id
"
"             INTO v_terr_id
"
"             FROM sales_sub_terr
"
"            WHERE sst_bu = p_bu
"
"              AND sst_sub_terr_id = v_sub_terr_id;
"
"
"
"         EXCEPTION
"
"           WHEN NO_DATA_FOUND THEN
"
"             v_terr_id := NULL;
"
"         END;
"
"
"
"       END IF;
"
"
"
"         IF UPPER((cr_st(indx).sm_sub_terr_name)) IS NOT NULL THEN
"
"
"
"         BEGIN
"
"           SELECT sat_sarea_id
"
"             INTO v_sales_area_id
"
"             FROM sales_area_terr
"
"            WHERE sat_bu= p_bu
"
"              AND sat_terr_id = v_terr_id;
"
"
"
"         EXCEPTION
"
"           WHEN NO_DATA_FOUND THEN
"
"             v_sales_area_id := NULL;
"
"         END;
"
"
"
"       END IF;
"
"
"
"           INSERT INTO crm_campgn_attendees(cca_bu,
"
"                                            cca_campaign_id,
"
"                                            cca_seq_no,
"
"                        cca_cp_name,
"
"                        cca_position_name,
"
"                        cca_comp_name,
"
"                        cca_addr1,
"
"                        cca_addr2,
"
"                        cca_addr3,
"
"                        cca_city,
"
"                        cca_mail,
"
"                        cca_mobile,
"
"                        cca_sp_id,
"
"                        cca_camp_atnd,
"
"                        cca_camp_atnd_id,
"
"                        cca_rqrmt,
"
"                        cca_action_prod,
"
"                        cca_priority,
"
"                        cca_terr_id,
"
"                        cca_sub_terr_id,
"
"                        cca_sales_area_id,
"
"                        cca_cre_by,
"
"                        cca_cre_ip_addr,
"
"                        cca_cre_os_user,
"
"                        cca_cre_date
"
"                                )
"
"                     VALUES(p_bu,
"
"                            p_camp_id,
"
"                            v_seq_no,
"
"                            UPPER(cr_st(indx).sm_cp_name),
"
"                            UPPER(cr_st(indx).sm_position_name),
"
"                            UPPER(cr_st(indx).sm_comp_name),
"
"                            UPPER(cr_st(indx).sm_addr1),
"
"                            UPPER(cr_st(indx).sm_addr2),
"
"                            UPPER(cr_st(indx).sm_addr3),
"
"                            v_city_id,
"
"                            cr_st(indx).sm_email,
"
"                            cr_st(indx).sm_mobile,
"
"                            v_sp_id,
"
"                            UPPER(cr_st(indx).sm_camp_atnd),
"
"                            CASE WHEN cr_st(indx).sm_camp_atnd_name IS NOT NULL THEN v_attd_id ELSE NULL END,
"
"                            UPPER(cr_st(indx).sm_rqrmt),
"
"                            UPPER(cr_st(indx).sm_action_prod),
"
"                            cr_st(indx).sm_priority,
"
"                            v_terr_id,
"
"                            v_sub_terr_id,
"
"                            v_sales_area_id,
"
"                            p_user,
"
"                            Audit_Info.Get_IP_Address,
"
"                            Audit_Info.Get_OS_User,
"
"                            SYSDATE
"
"                            );
"
"
"
"    END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_camp_lead_mig;
"
"
"
"PROCEDURE proc_ins_camp_lead_mig_exp(p_bu         VARCHAR2,
"
"                                     p_camp_id        VARCHAR2,
"
"                               p_user        VARCHAR2
"
"                              )
"
"AS
"
"
"
"    CURSOR c_city(c_city    VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM cities
"
"     WHERE city_id = c_city;
"
"
"
"    CURSOR c_sp(c_sp_id        VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM sales_persons
"
"     WHERE sp_bu = p_bu
"
"       AND sp_person = c_sp_id;
"
"
"
"    CURSOR c_attd(c_attd_id    VARCHAR2,
"
"                  c_attd_type   VARCHAR2)
"
"        IS
"
"    SELECT 1
"
"      FROM mktg_leads
"
"     WHERE ml_bu = p_bu
"
"       AND ml_lead_no = c_attd_id
"
"       AND c_attd_type = 'L'
"
"     UNION ALL
"
"    SELECT 1
"
"      FROM prospects
"
"     WHERE prosp_bu = p_bu
"
"       AND prosp_prosp_id = c_attd_id
"
"       AND c_attd_type = 'P'
"
"     UNION ALL
"
"    SELECT 1
"
"      FROM suppliers
"
"     WHERE suplr_bu = p_bu
"
"       AND suplr_suplr_id = c_attd_id
"
"       AND suplr_party_type = 'C'
"
"       AND c_attd_type = 'C';
"
"
"
"   CURSOR c_trr(c_trr_id    VARCHAR2)
"
"       IS
"
"   SELECT 1
"
"     FROM sales_sub_terr,sales_area_terr
"
"    WHERE sst_bu = sat_bu
"
"      AND sst_terr_id = sat_terr_id
"
"      AND sst_bu = p_bu
"
"      AND sst_sub_terr_id = c_trr_id;
"
"
"
"
"
"  v_err_msg    VARCHAR2(4000);
"
"
"
"  cr_city    c_city%ROWTYPE;
"
"  cr_sp            c_sp%ROWTYPE;
"
"  cr_attd    c_attd%ROWTYPE;
"
"  cr_trr    c_trr%ROWTYPE;
"
"
"
"BEGIN
"
"
"
"  UPDATE crm_campgn_attendees
"
"     SET cca_expctn_ref = NULL
"
"   WHERE cca_bu = p_bu
"
"     AND cca_campaign_id = p_camp_id
"
"     AND cca_expctn_ref IS NOT NULL;
"
"
"
"  FOR cr1 IN (SELECT *
"
"                FROM crm_campgn_attendees
"
"               WHERE cca_bu = p_bu
"
"                 AND cca_campaign_id = p_camp_id)
"
"  LOOP
"
"
"
"    v_err_msg := NULL;
"
"
"
"    OPEN c_city(cr1.cca_city);
"
"    FETCH c_city INTO cr_city;
"
"      IF c_city%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.cca_city||' - City not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_city;
"
"
"
"    OPEN c_sp(cr1.cca_sp_id);
"
"    FETCH c_sp INTO cr_sp;
"
"      IF c_sp%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.cca_sp_id||' - Sales person not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_sp;
"
"
"
"    OPEN c_attd(cr1.cca_camp_atnd_id,cr1.cca_camp_atnd);
"
"    FETCH c_attd INTO cr_attd;
"
"      /*IF cr1.cca_camp_atnd = 'L' AND c_attd%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.cca_camp_atnd_id||' - Lead not found.'||chr(10);
"
"      ELS*/IF cr1.cca_camp_atnd = 'P' AND c_attd%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.cca_camp_atnd_id||' - Prospect not found.'||chr(10);
"
"      ELSIF cr1.cca_camp_atnd = 'C' AND c_attd%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.cca_camp_atnd_id||' - Customer not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_attd;
"
"
"
"    OPEN c_trr(cr1.cca_sub_terr_id);
"
"    FETCH c_trr INTO cr_trr;
"
"      IF c_trr%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||cr1.cca_sub_terr_id||' - Sub Territory not found.'||chr(10);
"
"      END IF;
"
"    CLOSE c_trr;
"
"
"
"    UPDATE crm_campgn_attendees
"
"       SET cca_expctn_ref = v_err_msg
"
"     WHERE cca_bu = p_bu
"
"       AND cca_campaign_id = p_camp_id
"
"       AND cca_seq_no = cr1.cca_seq_no;
"
"
"
"     v_err_msg := NULL;
"
"
"
"  END LOOP;
"
"
"
"END proc_ins_camp_lead_mig_exp;
"
"
"
"PROCEDURE proc_ins_si_serial_mig(p_bu         VARCHAR2,
"
"                                 p_plnt        VARCHAR2,
"
"                 p_doc_no    VARCHAR2,
"
"                 p_seq_no    NUMBER,
"
"                 p_store_id     VARCHAR2,
"
"                 p_prod_id    VARCHAR2,
"
"                 p_prod_rev    NUMBER,
"
"                 p_fname    VARCHAR2,
"
"                 p_sep        VARCHAR2,
"
"                 p_user        VARCHAR2
"
"                 )
"
"AS
"
"
"
"v_sql        VARCHAR2(4000);
"
"v_fpath        VARCHAR2(200);
"
"
"
" TYPE typ_ins IS RECORD (SM_SERIAL         VARCHAR2(50));
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
"v_sub_seq_no    NUMBER;
"
"v_sys_ls_no    NUMBER;
"
"v_to_ser_no    VARCHAR2(50);
"
"v_to_sys_ls_no    NUMBER;
"
"
"
" BEGIN
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"  v_sql := 'CREATE TABLE scm_migration(SM_SERIAL    VARCHAR2(50)
"
"                      )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                  DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                  ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                            SKIP 1
"
"                                           FIELDS TERMINATED BY '''||p_sep||'''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (SM_SERIAL        CHAR(255)
"
"                                )
"
"                                                 )
"
"                               LOCATION ('''||p_fname||''')
"
"                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
" BEGIN
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
"  DELETE sales_inv_serial_cre_opt
"
"   WHERE sisco_bu = p_bu
"
"     AND sisco_plnt = p_plnt
"
"     AND sisco_doc_no = p_doc_no
"
"     AND sisco_seq_no = p_seq_no;
"
"
"
" FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"SELECT NVL(MAX(sisco_sub_seq_no),0) + 1
"
"  INTO v_sub_seq_no
"
"  FROM sales_inv_serial_cre_opt
"
" WHERE sisco_bu = p_bu
"
"   AND sisco_plnt = p_plnt
"
"   AND sisco_doc_no = p_doc_no
"
"   AND sisco_seq_no = p_seq_no;
"
"
"
"       BEGIN
"
"       SELECT lss_sys_ls_no
"
"         INTO v_sys_ls_no
"
"         FROM lot_ser_stocks
"
"       WHERE lss_bu = p_bu
"
"         AND lss_store_id = p_store_id
"
"         AND lss_prod_id = p_prod_id
"
"         AND lss_prod_rev = p_prod_rev
"
"         AND lss_ser_no = cr_st(indx).sm_serial
"
"         AND (lss_qty_hand - lss_qty_allocated) > 0
"
"         AND lss_prod_type = 'S'
"
"         AND (lss_ser_no,lss_sys_ls_no) NOT IN (SELECT sisln_serial_no,sisln_sys_ls_no
"
"                              FROM sales_invoice_lot_cons_vw
"
"                             WHERE sihd_bu = p_bu
"
"                               AND siln_store_id = p_store_id
"
"                               AND siln_prod_id = p_prod_id
"
"                               AND siln_prod_rev = p_prod_rev)
"
"           AND ROWNUM = 1;
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          v_sys_ls_no := 0;
"
"     END;
"
"
"
"        BEGIN
"
"        SELECT lss_ser_no, lss_sys_ls_no
"
"          INTO v_to_ser_no,v_to_sys_ls_no
"
"          FROM lot_ser_stocks
"
"         WHERE lss_bu = p_bu
"
"               AND lss_store_id = p_store_id
"
"               AND lss_prod_id = p_prod_id
"
"               AND lss_prod_rev = p_prod_rev
"
"               AND lss_sys_ls_no >= v_sys_ls_no
"
"               AND (lss_qty_hand - lss_qty_allocated) > 0
"
"               AND (lss_ser_no, lss_sys_ls_no) NOT IN
"
"                      (SELECT sisln_serial_no, sisln_sys_ls_no
"
"                         FROM sales_invoice_lot_cons_vw
"
"                        WHERE     sihd_bu = p_bu
"
"                              AND siln_store_id = p_store_id
"
"                              AND siln_prod_id = p_prod_id
"
"                              AND siln_prod_rev = p_prod_rev
"
"                              AND sihd_doc_no <> p_doc_no)
"
"               AND ROWNUM = 1;
"
"        EXCEPTION WHEN NO_DATA_FOUND THEN
"
"          v_to_ser_no := NULL;
"
"          v_to_sys_ls_no := 0;
"
"     END;
"
"
"
"            INSERT INTO sales_inv_serial_cre_opt(sisco_bu,
"
"                         sisco_plnt,
"
"                         sisco_doc_no,
"
"                         sisco_seq_no,
"
"                         sisco_sub_seq_no,
"
"                         sisco_lot_no_frm,
"
"                         sisco_ser_no_frm,
"
"                         sisco_sys_ls_no_frm,
"
"                         sisco_lot_no_to,
"
"                         sisco_ser_no_to,
"
"                         sisco_sys_ls_no_to,
"
"                         sisco_qty,
"
"                         sisco_cre_by,
"
"                         sisco_cre_date
"
"                         )
"
"                      VALUES(p_bu,
"
"                             p_plnt,
"
"                             p_doc_no,
"
"                             p_seq_no,
"
"                             v_sub_seq_no,
"
"                             NULL,
"
"                             UPPER(cr_st(indx).sm_serial),
"
"                             v_sys_ls_no,
"
"                             NULL,
"
"                             v_to_ser_no,
"
"                             v_to_sys_ls_no,
"
"                             1,
"
"                                                 p_user,
"
"                             SYSDATE
"
"                             );
"
"
"
"
"
"        FOR cr4 IN (SELECT sisco_ser_no_frm,sisco_sys_ls_no_frm
"
"                  FROM sales_inv_serial_cre_opt
"
"                 WHERE sisco_bu = p_bu
"
"               AND sisco_plnt = p_plnt
"
"               AND sisco_doc_no = p_doc_no
"
"               AND sisco_seq_no = p_seq_no
"
"               AND (sisco_ser_no_frm,sisco_sys_ls_no_frm) NOT IN (SELECT lss_ser_no,lss_sys_ls_no
"
"                                        FROM lot_ser_stocks
"
"                                       WHERE lss_bu = p_bu
"
"                                         AND lss_store_id = p_store_id
"
"                                         AND lss_prod_id = p_prod_id
"
"                                         AND lss_prod_rev = p_prod_rev
"
"                                         AND (lss_qty_hand - lss_qty_allocated) > 0))
"
"      LOOP
"
"         UPDATE sales_inv_serial_cre_opt
"
"            SET sisco_exp_ref = 'Serial number not found. or already allocated'||'-'||cr_st(indx).sm_serial
"
"      WHERE sisco_bu = p_bu
"
"        AND sisco_plnt = p_plnt
"
"        AND sisco_doc_no = p_doc_no
"
"        AND sisco_seq_no = p_seq_no
"
"        AND sisco_sub_seq_no = v_sub_seq_no;
"
"      END LOOP c4;
"
"
"
"  END LOOP;
"
"  END;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_ins_si_serial_mig;
"
"
"
"
"
"PROCEDURE proc_load_godown_stk_mig(p_bu               business_units.bu_id%TYPE,
"
"                       p_plnt        fsnr_go_down_stock_hd.fgdsh_plnt%TYPE,
"
"                       p_doc_no        fsnr_go_down_stock_hd.fgdsh_doc_no%TYPE,
"
"                       p_file_name        VARCHAR2,
"
"                       p_user             fsnr_go_down_stock_hd.fgdsh_cre_by%TYPE
"
"                      )
"
"AS
"
"
"
"v_sql            CLOB;
"
"v_fpath            VARCHAR2(200);
"
"v_seq_no        NUMBER(5);
"
"
"
"TYPE typ_stk IS RECORD (fgdsl_part_no      VARCHAR2(50),
"
"                        fgdsl_inv_no       VARCHAR2(25),
"
"                        fgdsl_inv_date     DATE,
"
"                        fgdsl_inv_qty      NUMBER(12,3),
"
"                        fgdsl_asn_no       VARCHAR2(50),
"
"                        fgdsl_lr_no        VARCHAR2(15),
"
"                        fgdsl_lr_date      DATE,
"
"            fgdsl_arr_date     DATE,
"
"            fgdsl_po_no        VARCHAR2(50),
"
"            fgdsl_no_of_pkt    NUMBER(5)
"
"                       );
"
"
"
"TYPE typ_stk_dtls IS TABLE OF typ_stk INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_stk_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"v_emp_id    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE SCM_MIGRATION(fgdsl_part_no      VARCHAR2(50),
"
"                                         fgdsl_inv_no       VARCHAR2(25),
"
"                                         fgdsl_inv_date     DATE,
"
"                                         fgdsl_inv_qty      NUMBER(12,3),
"
"                                         fgdsl_asn_no       VARCHAR2(50),
"
"                                         fgdsl_lr_no        VARCHAR2(15),
"
"                                         fgdsl_lr_date      DATE,
"
"                             fgdsl_arr_date     DATE,
"
"                             fgdsl_po_no        VARCHAR2(50),
"
"                             fgdsl_no_of_pkt    NUMBER(5)
"
"                                        )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '','' OPTIONALLY ENCLOSED BY ''""''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (fgdsl_part_no      CHAR(255),
"
"                                         fgdsl_inv_no       CHAR(255),
"
"                                         fgdsl_inv_date     CHAR(255),
"
"                                         fgdsl_inv_qty      CHAR(255),
"
"                                         fgdsl_asn_no         CHAR(255),
"
"                                         fgdsl_lr_no        CHAR(255),
"
"                                         fgdsl_lr_date      CHAR(255),
"
"                     fgdsl_arr_date     CHAR(255),
"
"                     fgdsl_po_no        CHAR(255),
"
"                                         fgdsl_no_of_pkt    CHAR(255)
"
"                                        ))
"
"                                        LOCATION ('''||p_file_name||''')
"
"                                        )REJECT LIMIT UNLIMITED';
"
"
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_st;
"
"
"
"  DELETE FROM fsnr_go_down_stock_ln
"
"   WHERE fgdsl_bu = p_bu
"
"     AND fgdsl_plnt = p_plnt
"
"     AND fgdsl_doc_no = p_doc_no;
"
"
"
"  v_seq_no := 0;
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    v_seq_no := v_seq_no + 1;
"
"
"
"    INSERT INTO fsnr_go_down_stock_ln(fgdsl_bu,
"
"                                      fgdsl_plnt,
"
"                                      fgdsl_doc_no,
"
"                                      fgdsl_seq_no,
"
"                                      fgdsl_part_no,
"
"                                      fgdsl_inv_no,
"
"                                      fgdsl_inv_date,
"
"                                      fgdsl_inv_qty,
"
"                                      fgdsl_asn_no,
"
"                                      fgdsl_lr_no,
"
"                                      fgdsl_lr_date,
"
"                                      fgdsl_arr_date,
"
"                                      fgdsl_no_of_pkt,
"
"                                      fgdsl_po_no,
"
"                                      fgdsl_cre_by,
"
"                                      fgdsl_cre_emp_id,
"
"                                      fgdsl_cre_ip_addr,
"
"                                      fgdsl_cre_os_user,
"
"                                      fgdsl_cre_date
"
"                                     )
"
"                               VALUES(p_bu,
"
"                                      p_plnt,
"
"                                      p_doc_no,
"
"                                      v_seq_no,
"
"                                      cr_st(indx).fgdsl_part_no,
"
"                                      cr_st(indx).fgdsl_inv_no,
"
"                                      cr_st(indx).fgdsl_inv_date,
"
"                                      cr_st(indx).fgdsl_inv_qty,
"
"                                      cr_st(indx).fgdsl_asn_no,
"
"                      cr_st(indx).fgdsl_lr_no,
"
"                      cr_st(indx).fgdsl_lr_date,
"
"                      cr_st(indx).fgdsl_arr_date,
"
"                      cr_st(indx).fgdsl_no_of_pkt,
"
"                      cr_st(indx).fgdsl_po_no,
"
"                      p_user,
"
"                      v_emp_id,
"
"                                      v_ip_addr,
"
"                                      v_os_user,
"
"                                      SYSDATE
"
"                                     );
"
"  END LOOP;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_load_godown_stk_mig;
"
"
"
"PROCEDURE proc_load_slab_qty_mig(p_bu               business_units.bu_id%TYPE,
"
"                     p_file_name        VARCHAR2,
"
"                     p_user             prod_mfg_slab_master.pmsm_cre_by%TYPE
"
"                    )
"
"AS
"
"
"
"v_sql            CLOB;
"
"v_fpath            VARCHAR2(200);
"
"v_seq_no        NUMBER(5);
"
"
"
"TYPE typ_stk IS RECORD (pmsm_plnt          VARCHAR2(10),
"
"                        pmsm_prod_id       VARCHAR2(100),
"
"                        pmsm_prod_rev      NUMBER(5),
"
"                        pmsm_slab_pct      NUMBER(5,2),
"
"                        pmsm_inv_pct       NUMBER(5,2)
"
"                       );
"
"
"
"TYPE typ_stk_dtls IS TABLE OF typ_stk INDEX BY PLS_INTEGER;
"
"
"
"cr_st    typ_stk_dtls;
"
"
"
"TYPE typ_ref_cur IS REF CURSOR;
"
"c_st      typ_ref_cur;
"
"
"
"indx     NUMBER := 1;
"
"
"
"v_emp_id    VARCHAR2(10) := func_find_emp_id(p_bu,p_user);
"
"v_ip_addr    VARCHAR2(20) := Audit_Info.Get_Ip_Address;
"
"v_os_user    VARCHAR2(50) := Audit_Info.Get_Os_User;
"
"
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
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"
"
"    v_sql := 'CREATE TABLE SCM_MIGRATION(pmsm_plnt          VARCHAR2(10),
"
"                                 pmsm_prod_id       VARCHAR2(100),
"
"                                 pmsm_prod_rev      NUMBER(5),
"
"                                 pmsm_prod_desc     VARCHAR2(150),
"
"                                    pmsm_slab_pct      NUMBER(5,2),
"
"                                    pmsm_inv_pct       NUMBER(5,2)
"
"                                        )
"
"                   ORGANIZATION EXTERNAL(TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                         ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY '','' OPTIONALLY ENCLOSED BY ''""''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                        (pmsm_plnt              CHAR(255),
"
"                                         pmsm_prod_id       CHAR(255),
"
"                                         pmsm_prod_rev         CHAR(255),
"
"                                         pmsm_prod_desc         CHAR(255),
"
"                                         pmsm_slab_pct      CHAR(255),
"
"                                         pmsm_inv_pct         CHAR(255)
"
"                                        ))
"
"                                        LOCATION ('''||p_file_name||''')
"
"                                        )REJECT LIMIT UNLIMITED';
"
"
"
"
"
"  EXECUTE IMMEDIATE v_sql;
"
"
"
"  OPEN c_st FOR 'SELECT * FROM scm_migration';
"
"  LOOP
"
"    FETCH c_st INTO cr_st(indx);
"
"      indx := indx + 1;
"
"      EXIT WHEN c_st%NOTFOUND;
"
"  END LOOP;
"
"  CLOSE c_st;
"
"
"
" /* DELETE FROM prod_mfg_slab_master
"
"   WHERE pmsm_bu = p_bu
"
"     AND pmsm_plnt = p_plnt; */
"
"
"
"  FOR indx IN 1..cr_st.COUNT
"
"  LOOP
"
"
"
"    SELECT NVL(MAX(pmsm_seq_no),0)+1
"
"      INTO v_seq_no
"
"      FROM prod_mfg_slab_master
"
"     WHERE pmsm_bu = p_bu
"
"       AND pmsm_plnt = cr_st(indx).pmsm_plnt;
"
"
"
"    INSERT INTO prod_mfg_slab_master(pmsm_bu,
"
"                     pmsm_plnt,
"
"                     pmsm_seq_no,
"
"                     pmsm_prod_id,
"
"                     pmsm_prod_rev,
"
"                     pmsm_slab_pct,
"
"                     pmsm_inv_pct,
"
"                     pmsm_cre_by,
"
"                     pmsm_cre_emp_id,
"
"                     pmsm_cre_ip_addr,
"
"                     pmsm_cre_os_user,
"
"                     pmsm_cre_date
"
"                                     )
"
"                               VALUES(p_bu,
"
"                                      cr_st(indx).pmsm_plnt,
"
"                                      v_seq_no,
"
"                                      cr_st(indx).pmsm_prod_id,
"
"                                      cr_st(indx).pmsm_prod_rev,
"
"                                      cr_st(indx).pmsm_slab_pct,
"
"                                      cr_st(indx).pmsm_inv_pct,
"
"                      p_user,
"
"                      v_emp_id,
"
"                                      v_ip_addr,
"
"                                      v_os_user,
"
"                                      SYSDATE
"
"                                     );
"
"  END LOOP;
"
"
"
"  proc_chk_migrate_table('SCM_MIGRATION');
"
"  Commit;
"
"
"
"END proc_load_slab_qty_mig;
"
"
"
"PROCEDURE proc_ins_tc_group(p_bu        business_units.bu_id%TYPE,
"
"                      p_fname        VARCHAR2,
"
"                      p_sep          VARCHAR2,
"
"              p_res     OUT  VARCHAR2,
"
"                      p_user        tnc_attr_groups.tag_cre_by%TYPE
"
"                    )
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
"v_seq_no    NUMBER;
"
"
"
"TYPE typ_ins IS RECORD (tag_grp_desc                    VARCHAR2(50),
"
"                        tag_print_seq_no                NUMBER(5)
"
"                        );
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
"     v_sql := 'CREATE TABLE scm_migration(tag_grp_desc            VARCHAR2(50),
"
"                                          tag_print_seq_no        NUMBER(5)
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
"                                           (tag_grp_desc                  CHAR(255),
"
"                                            tag_print_seq_no            CHAR(255)
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
"  p_res := 'N';
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
"       SELECT MAX(TO_NUMBER(tag_grp_id))
"
"        INTO v_type
"
"        FROM tnc_attr_groups
"
"       WHERE tag_bu = p_bu;
"
"
"
"       v_type_id := func_get_next_id(v_type);
"
"       IF UPPER(cr_st(indx).tag_grp_desc) IS NULL THEN
"
"      Raise_Application_Error(-20999,'HRM '||'Group must be entered.');
"
"      END IF;
"
"       IF UPPER(cr_st(indx).tag_print_seq_no)< 0 THEN
"
"         Raise_Application_Error(-20999,'HRM '||'Print Seq. should be greater than zero.');
"
"     END IF;
"
"
"
"
"
"        INSERT INTO tnc_attr_groups(tag_bu ,
"
"                                    tag_grp_id,
"
"                                    tag_grp_desc,
"
"                                    tag_print_seq,
"
"                                    tag_cre_by,
"
"                                    tag_cre_date
"
"                                    )
"
"              VALUES
"
"                        (p_bu,
"
"                         v_type_id,
"
"                         UPPER(cr_st(indx).tag_grp_desc),
"
"                         UPPER(cr_st(indx).tag_print_seq_no),
"
"                         p_user,
"
"                         SYSDATE
"
"                         );
"
"
"
"p_res := 'Y';
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
"END proc_ins_tc_group;
"
"
"
"END pkg_migration;"
/
