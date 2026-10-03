CREATE OR REPLACE
"PACKAGE BODY pkg_migration_planning_new
"
"IS
"
"
"
"    PROCEDURE proc_drop_exist_table(p_table_name VARCHAR2)
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = p_table_name;
"
"
"
"    cr1   c1%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"          IF c1%FOUND THEN
"
"             EXECUTE IMMEDIATE 'DROP TABLE '||p_table_name;
"
"          END IF;
"
"        CLOSE c1;
"
"
"
"    END proc_drop_exist_table;
"
"
"
"PROCEDURE proc_ins_bom_migrate_ln_new(
"
"                                          p_bu           VARCHAR2,
"
"                                          p_plnt         VARCHAR2,
"
"                                          p_doc_no       VARCHAR2,
"
"                                          p_file_name    VARCHAR2,
"
"                                          p_user         VARCHAR2,
"
"                                          p_res     OUT   VARCHAR2
"
"                                          )
"
"        IS
"
"
"
"        TYPE r_ins_bom IS RECORD(
"
"                                 rib_par_bom_name     VARCHAR2(100),
"
"                                 rib_par_bom_rev      VARCHAR2(10),
"
"                                 rib_eff_from         DATE ,
"
"                                 rib_eff_to           DATE ,
"
"                                 rib_par_prod_id      VARCHAR2(25),
"
"                                 rib_par_prod_rev     NUMBER(5),
"
"                                 rib_par_thickness      NUMBER(10,3),
"
"                                 rib_par_width          NUMBER(10,3),
"
"                                 rib_par_length            NUMBER(10,3),
"
"                                 rib_no_of_ups          NUMBER(5),
"
"                                 rib_fdng_size          VARCHAR2(15),
"
"                                 rib_batch_qty         NUMBER(10,3),
"
"                                 rib_oprn_ln_seq      VARCHAR2(20),
"
"                                 rib_oprn_id          VARCHAR2(50),
"
"                                 rib_item_seq_no      NUMBER(5),
"
"                                 rib_prod_id          VARCHAR2(25),
"
"                                 rib_prod_rev         NUMBER(5),
"
"                                 rib_thickness            NUMBER(10,3),
"
"                                 rib_width                NUMBER(10,3),
"
"                                 rib_length                 NUMBER(10,3),
"
"                                 rib_pm_type          VARCHAR2(1),
"
"                                 rib_req_uom          VARCHAR2(5),
"
"                                 rib_rqrd_qty         NUMBER(15,8),
"
"                                 rib_mftr_part_no     VARCHAR2(50),
"
"                                 rib_location         VARCHAR2(1000),
"
"								 rib_tar_cost		  NUMBER(17,5)
"
"                                 );
"
"
"
"    TYPE r_ins_bom_scb IS RECORD(ribs_par_bom_name     VARCHAR2(100),
"
"                     ribs_par_bom_rev          VARCHAR2(10),
"
"                     ribs_par_prod_id          VARCHAR2(25),
"
"                     ribs_par_prod_rev         NUMBER(5),
"
"                     ribs_oprn_ln_seq          VARCHAR2(20),
"
"                     ribs_oprn_id              VARCHAR2(50),
"
"                     ribs_scb_prod_id              VARCHAR2(25),
"
"                     ribs_scb_prod_rev             NUMBER(5),
"
"                     ribs_store                VARCHAR2(50),
"
"                     ribs_rct_qty              NUMBER(15,8) ,
"
"                     ribs_sou_prod_id          VARCHAR2(25),
"
"                     ribs_sou_prod_rev         NUMBER(5),
"
"                     ribs_prod_type            VARCHAR2(2)
"
"                     );
"
"
"
"    TYPE r_ins_bom_res IS RECORD(ribr_par_bom_name     VARCHAR2(100),
"
"                     ribr_par_bom_rev          VARCHAR2(10),
"
"                     ribr_par_prod_id          VARCHAR2(25),
"
"                     ribr_par_prod_rev         NUMBER(5),
"
"                     ribr_oprn_ln_seq          VARCHAR2(20),
"
"                     ribr_oprn_id              VARCHAR2(50),
"
"                     ribr_res_type             VARCHAR2(1) ,
"
"                     ribr_res_grp              VARCHAR2(100),
"
"                     ribr_uom                  VARCHAR2(5),
"
"                     ribr_units_per_hour       NUMBER(12,3) ,
"
"                     ribr_hrs_per_unit         NUMBER(4),
"
"                     ribr_mins_per_unit        NUMBER(2),
"
"                     ribr_secs_per_unit        NUMBER(3),
"
"                     ribr_lag_hrs              NUMBER(4),
"
"                     ribr_setup_hrs            NUMBER(7,3),
"
"                     ribr_setup_mins           NUMBER(2),
"
"                     ribr_priority             NUMBER(5),
"
"                     ribr_no_of_units          NUMBER(4)
"
"                     );
"
"
"
"    TYPE r_ins_prod_ln IS RECORD(ripl_prod_id			VARCHAR2(25),
"
"								 ripl_prod_rev			NUMBER(5),
"
"								 ripl_prod_desc11		VARCHAR2(150),
"
"								 ripl_prod_ext_desc		VARCHAR2(150),
"
"								 ripl_prod_uom			VARCHAR2(5),
"
"								 ripl_prod_sub_cls		VARCHAR2(10),
"
"								 ripl_prod_cls			VARCHAR2(10),
"
"								 ripl_mjr_cls			VARCHAR2(10)
"
"								);
"
"
"
"        TYPE t_ins_bom IS TABLE OF r_ins_bom INDEX BY PLS_INTEGER;
"
"        v_ins_bom t_ins_bom;
"
"
"
"        TYPE t_ins_bom_scb IS TABLE OF r_ins_bom_scb INDEX BY PLS_INTEGER;
"
"        v_ins_bom_scb t_ins_bom_scb;
"
"
"
"        TYPE t_ins_bom_res IS TABLE OF r_ins_bom_res INDEX BY PLS_INTEGER;
"
"        v_ins_bom_res t_ins_bom_res;
"
"
"
"		TYPE t_ins_prod_ln IS TABLE OF r_ins_prod_ln INDEX BY PLS_INTEGER;
"
"        v_ins_prod_ln t_ins_prod_ln;
"
"
"
"        v_create_table    VARCHAR2(4000);
"
"        v_insert_table    VARCHAR2(4000);
"
"
"
"        v_res           VARCHAR2(1);
"
"		v_doc_no		VARCHAR2(15);
"
"        v_seq_no        NUMBER := 1;
"
"        v_res_seq_no    NUMBER := 1;
"
"        v_scb_seq_no    NUMBER := 1;
"
"	    v_item_seq_no   NUMBER := 1;
"
"		v_type          VARCHAR(2);
"
"
"
"        BEGIN
"
"
"
"            DELETE migr_bom_rou_res
"
"             WHERE mbrr_bu         = p_bu
"
"               AND mbrr_plnt     = p_plnt
"
"               AND mbrr_doc_no     = p_doc_no;
"
"
"
"            DELETE migr_bom_rou_scrap
"
"             WHERE mbrs_bu         = p_bu
"
"               AND mbrs_plnt     = p_plnt
"
"               AND mbrs_doc_no     = p_doc_no;
"
"
"
"            DELETE migr_bom_ln
"
"             WHERE mbl_bu         = p_bu
"
"               AND mbl_plnt     = p_plnt
"
"               AND mbl_doc_no     = p_doc_no;
"
"
"
"
"
"            v_res := 'N';
"
"
"
"          --  RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_create_table);
"
"
"
"            proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"             EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION (em_par_bom_name     VARCHAR2(100),
"
"                                                             em_par_bom_rev      VARCHAR2(10),
"
"                                                             em_eff_from         DATE ,
"
"                                                             em_eff_to           DATE ,
"
"                                                             em_par_prod_id      VARCHAR2(25),
"
"                                                             em_par_prod_rev     NUMBER(5),
"
"															 em_par_prod_desc    VARCHAR2(150),
"
"															 em_par_prod_uom	VARCHAR2(5),
"
"															 em_par_sub_cls		VARCHAR2(10),
"
"															 em_par_cls			VARCHAR2(10),
"
"															 em_par_mjr_cls		VARCHAR2(10),
"
"                                                             em_par_thickness     NUMBER(10,3),
"
"                                                             em_par_width         NUMBER(10,3),
"
"                                                             em_par_length           NUMBER(10,3),
"
"                                                             em_no_of_ups          NUMBER(5),
"
"                                                             em_fdng_size          VARCHAR2(15),
"
"                                                             em_batch_qty         NUMBER(10,3),
"
"                                                             em_oprn_ln_seq         VARCHAR2(20),
"
"                                                             em_oprn_id          VARCHAR2(50),
"
"                                                             em_item_seq_no      NUMBER(5),
"
"                                                             em_prod_id          VARCHAR2(25),
"
"                                                             em_prod_rev         NUMBER(5),
"
"															 em_prod_desc    		VARCHAR2(150),
"
"															 em_prod_uom			VARCHAR2(5),
"
"															 em_sub_cls				VARCHAR2(10),
"
"															 em_cls					VARCHAR2(10),
"
"															 em_mjr_cls				VARCHAR2(10),
"
"															 em_tar_cost			NUMBER(12,3),
"
"                                                             em_thickness          	NUMBER(10,3),
"
"                                                             em_width              	NUMBER(10,3),
"
"                                                             em_length              NUMBER(10,3),
"
"                                                             em_pm_type          VARCHAR2(1),
"
"                                                             em_req_uom          VARCHAR2(5),
"
"                                                             em_rqrd_qty         NUMBER(15,8),
"
"                                                             em_mftr_part_no     VARCHAR2(50),
"
"                                                             em_location         VARCHAR2(1000),
"
"                                                             em_res_type         VARCHAR2(1) ,
"
"                                                             em_res_grp          VARCHAR2(100),
"
"                                                             em_uom              VARCHAR2(5),
"
"                                                             em_units_per_hour   NUMBER(12,3) ,
"
"                                                             em_hrs_per_unit     NUMBER(4),
"
"                                                             em_mins_per_unit    NUMBER(2),
"
"                                                             em_secs_per_unit    NUMBER(3),
"
"                                                             em_lag_hrs          NUMBER(4),
"
"                                                             em_setup_hrs        NUMBER(7,3),
"
"                                                             em_setup_mins       NUMBER(2),
"
"                                                             em_priority         NUMBER(5),
"
"                                                             em_no_of_units       NUMBER(5),
"
"                                                             em_scb_prod_id          VARCHAR2(25),
"
"                                                             em_scb_prod_rev         NUMBER(5),
"
"                                                             em_store            VARCHAR2(50),
"
"                                                             em_rct_qty          NUMBER(15,8) ,
"
"                                                             em_sou_prod_id      VARCHAR2(25),
"
"                                                             em_sou_prod_rev     NUMBER(5),
"
"                                                             em_prod_type          VARCHAR2(2)
"
"                                                             )
"
"                                  ORGANIZATION EXTERNAL(
"
"                                            TYPE ORACLE_LOADER
"
"                                                DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                ACCESS PARAMETERS(
"
"                                                          RECORDS DELIMITED BY NEWLINE
"
"                                                          SKIP 1
"
"                                                          FIELDS TERMINATED BY '',''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (em_par_bom_name          CHAR(255),
"
"                                                           em_par_bom_rev           CHAR(255),
"
"                                                           em_eff_from              CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                           em_eff_to                CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                           em_par_prod_id           CHAR(255),
"
"                                                           em_par_prod_rev          CHAR(255),
"
"														   em_par_prod_desc			CHAR(255),
"
"														   em_par_prod_uom			CHAR(255),
"
"														   em_par_sub_cls			CHAR(255),
"
"														   em_par_cls				CHAR(255),
"
"														   em_par_mjr_cls			CHAR(255),
"
"                                                           em_par_thickness        CHAR(255),
"
"                                                           em_par_width            CHAR(255),
"
"                                                           em_par_length        CHAR(255),
"
"                                                           em_no_of_ups         CHAR(255),
"
"                                                           em_fdng_size         CHAR(255),
"
"                                                           em_batch_qty            CHAR(255),
"
"                                                           em_oprn_ln_seq             CHAR(255),
"
"                                                           em_oprn_id               CHAR(255),
"
"                                                           em_item_seq_no           CHAR(255),
"
"                                                           em_prod_id               CHAR(255),
"
"                                                           em_prod_rev              CHAR(255),
"
"														   em_prod_desc				CHAR(255),
"
"														   em_prod_uom				CHAR(255),
"
"														   em_sub_cls				CHAR(255),
"
"														   em_cls					CHAR(255),
"
"														   em_mjr_cls				CHAR(255),
"
"														   em_tar_cost				CHAR(255),
"
"                                                           em_thickness                CHAR(255),
"
"                                                           em_width                    CHAR(255),
"
"                                                           em_length                CHAR(255),
"
"                                                           em_pm_type               CHAR(255),
"
"                                                           em_req_uom               CHAR(255),
"
"                                                           em_rqrd_qty              CHAR(255),
"
"                                                           em_mftr_part_no          CHAR(255),
"
"                                                           em_location              CHAR(255),
"
"                                                           em_res_type              CHAR(255),
"
"                                                           em_res_grp               CHAR(255),
"
"                                                           em_uom                   CHAR(255),
"
"                                                           em_units_per_hour        CHAR(255),
"
"                                                           em_hrs_per_unit          CHAR(255),
"
"                                                           em_mins_per_unit         CHAR(255),
"
"                                                           em_secs_per_unit         CHAR(255),
"
"                                                           em_lag_hrs               CHAR(255),
"
"                                                           em_setup_hrs             CHAR(255),
"
"                                                           em_setup_mins            CHAR(255),
"
"                                                           em_priority              CHAR(255),
"
"                                                           em_no_of_units       	CHAR(255),
"
"                                                           em_scb_prod_id                  CHAR(255),
"
"                                                           em_scb_prod_rev              CHAR(255),
"
"                                                           em_store                CHAR(255),
"
"                                                           em_rct_qty               CHAR(255),
"
"                                                           em_sou_prod_id           CHAR(255),
"
"                                                           em_sou_prod_rev          CHAR(255),
"
"                                                           em_prod_type         CHAR(255)
"
"                                                           )
"
"                                                  )
"
"                                  LOCATION ('''||p_file_name||
"
"                                            ''')
"
"                                  ) REJECT LIMIT UNLIMITED';
"
"
"
"
"
"    --raise_application_error(-20999,'HRM'||p_file_name);
"
"
"
"
"
"
"
"            EXECUTE IMMEDIATE 'SELECT em_par_bom_name ,
"
"                                      em_par_bom_rev  ,
"
"                                      em_eff_from     ,
"
"                                      em_eff_to       ,
"
"                                      em_par_prod_id  ,
"
"                                      em_par_prod_rev ,
"
"                          em_par_thickness,
"
"                          em_par_width      ,
"
"                          em_par_length      ,
"
"                          em_no_of_ups,
"
"                          em_fdng_size,
"
"                          em_batch_qty,
"
"                          em_oprn_ln_seq  ,
"
"                                      em_oprn_id      ,
"
"                                      em_item_seq_no  ,
"
"                                      em_prod_id      ,
"
"                                      em_prod_rev     ,
"
"                          em_thickness      ,
"
"                          em_width            ,
"
"                          em_length            ,
"
"                                      em_pm_type      ,
"
"                                      em_req_uom      ,
"
"                                      em_rqrd_qty     ,
"
"                                      em_mftr_part_no ,
"
"                                      em_location,
"
"									  em_tar_cost
"
"                                 FROM excel_migration
"
"				GROUP BY em_par_bom_name ,
"
"                                      em_par_bom_rev  ,
"
"                                      em_eff_from     ,
"
"                                      em_eff_to       ,
"
"                                      em_par_prod_id  ,
"
"                                      em_par_prod_rev ,
"
"                          em_par_thickness,
"
"                          em_par_width      ,
"
"                          em_par_length      ,
"
"                          em_no_of_ups,
"
"                          em_fdng_size,
"
"                          em_batch_qty,
"
"                          em_oprn_ln_seq  ,
"
"                                      em_oprn_id      ,
"
"                                      em_item_seq_no  ,
"
"                                      em_prod_id      ,
"
"                                      em_prod_rev     ,
"
"                          em_thickness      ,
"
"                          em_width            ,
"
"                          em_length            ,
"
"                                      em_pm_type      ,
"
"                                      em_req_uom      ,
"
"                                      em_rqrd_qty     ,
"
"                                      em_mftr_part_no ,
"
"                                      em_location,
"
"									  em_tar_cost
"
"                    ORDER BY em_oprn_ln_seq,em_item_seq_no' BULK COLLECT INTO v_ins_bom;
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
"
"
"                    EXECUTE IMMEDIATE 'SELECT em_par_bom_name ,
"
"                                      em_par_bom_rev  ,
"
"                                      em_par_prod_id  ,
"
"                                      em_par_prod_rev ,
"
"                                              em_oprn_ln_seq  ,
"
"                                      em_oprn_id      ,
"
"                                      em_scb_prod_id      ,
"
"                                      em_scb_prod_rev     ,
"
"                                      em_store     ,
"
"                          em_rct_qty      ,
"
"                          em_sou_prod_id  ,
"
"                          em_sou_prod_rev ,
"
"                                      em_prod_type
"
"                                 FROM excel_migration
"
"                                 WHERE em_scb_prod_id IS NOT NULL
"
"                                 GROUP BY em_par_bom_name ,
"
"                                          em_par_bom_rev  ,
"
"                                          em_par_prod_id  ,
"
"                                          em_par_prod_rev ,
"
"                                                  em_oprn_ln_seq  ,
"
"                                          em_oprn_id      ,
"
"                                          em_scb_prod_id      ,
"
"                                          em_scb_prod_rev     ,
"
"                                          em_store     ,
"
"                              em_rct_qty      ,
"
"                              em_sou_prod_id  ,
"
"                              em_sou_prod_rev ,
"
"                                          em_prod_type
"
"                    ORDER BY em_oprn_ln_seq' BULK COLLECT INTO v_ins_bom_scb;
"
"
"
"                    EXECUTE IMMEDIATE 'SELECT em_par_bom_name ,
"
"                                      em_par_bom_rev  ,
"
"                                      em_par_prod_id  ,
"
"                                      em_par_prod_rev ,
"
"                                              em_oprn_ln_seq  ,
"
"                                      em_oprn_id      ,
"
"                          em_res_type      ,
"
"                              em_res_grp    ,
"
"                              em_uom           ,
"
"                             em_units_per_hour,
"
"                             em_hrs_per_unit  ,
"
"                             em_mins_per_unit ,
"
"                             em_secs_per_unit ,
"
"                             em_lag_hrs       ,
"
"                               em_setup_hrs     ,
"
"                             em_setup_mins    ,
"
"                             em_priority,em_no_of_units
"
"                                 FROM excel_migration
"
"                                 WHERE em_res_grp IS NOT NULL
"
"                                 GROUP BY em_par_bom_name ,
"
"                                          em_par_bom_rev  ,
"
"                                          em_par_prod_id  ,
"
"                                          em_par_prod_rev ,
"
"                                                  em_oprn_ln_seq  ,
"
"                                          em_oprn_id      ,
"
"                              em_res_type      ,
"
"                                  em_res_grp    ,
"
"                                  em_uom           ,
"
"                                 em_units_per_hour,
"
"                                 em_hrs_per_unit  ,
"
"                                 em_mins_per_unit ,
"
"                                 em_secs_per_unit ,
"
"                                 em_lag_hrs       ,
"
"                                   em_setup_hrs     ,
"
"                                 em_setup_mins    ,
"
"                                 em_priority,
"
"                                 em_no_of_units
"
"                    ORDER BY em_oprn_ln_seq' BULK COLLECT INTO v_ins_bom_res;
"
"
"
"
"
"			EXECUTE IMMEDIATE 'SELECT em_par_prod_id,
"
"									  em_par_prod_rev,
"
"									  em_par_prod_desc,
"
"									  em_par_prod_uom,
"
"									  em_par_sub_cls,
"
"									  em_par_cls,
"
"									  em_par_mjr_cls
"
"								 FROM excel_migration
"
"								UNION ALL
"
"							   SELECT em_prod_id,
"
"									  em_prod_rev,
"
"									  em_prod_desc,
"
"									  em_prod_uom,
"
"									  em_sub_cls,
"
"									  em_cls,
"
"									  em_mjr_cls
"
"								 FROM excel_migration' BULK COLLECT INTO v_ins_prod_ln;
"
"
"
"
"
"				SELECT NVL(MAX(TO_NUMBER(pmmh_doc_no)), 1000000000) + 1
"
"				  INTO v_doc_no
"
"				  FROM prod_multi_migrate_hd
"
"				 WHERE pmmh_bu = p_bu;
"
"
"
"				INSERT INTO prod_multi_migrate_hd(pmmh_bu,
"
"												 pmmh_doc_no,
"
"												 pmmh_file_name,
"
"												 pmmh_ref,
"
"												 pmmh_status,
"
"												 pmmh_cre_by,
"
"												 pmmh_cre_ip_addr,
"
"												 pmmh_cre_os_user,
"
"												 pmmh_cre_date,
"
"												 pmmh_cre_emp_id
"
"												)
"
"										  VALUES(p_bu,
"
"												 v_doc_no,
"
"												 NULL,
"
"												 'ITEM MIGRATION CREATED FROM BOM : '||p_doc_no,
"
"												 'N',
"
"												 p_user,
"
"												 audit_info.get_ip_address,
"
"												 audit_info.get_os_user,
"
"												 SYSDATE,
"
"												 func_find_emp_id(p_bu, p_user)
"
"												);
"
"
"
"				UPDATE migr_bom_hd
"
"				   SET mbh_prod_doc_no = v_doc_no
"
"				 WHERE mbh_bu = p_bu
"
"				   AND mbh_plnt = p_plnt
"
"				   AND mbh_doc_no = p_doc_no;
"
"
"
"				FOR i IN 1..v_ins_prod_ln.COUNT
"
"				LOOP
"
"
"
"					INSERT INTO prod_multi_migrate_ln(pmml_bu,
"
"													  pmml_doc_no,
"
"													  pmml_seq_no,
"
"													  pmml_prod_id,
"
"													  pmml_prod_rev,
"
"  													  pmml_prod_desc11,
"
"													  pmml_prod_ext_desc,
"
"													  pmml_prod_uom,
"
"													  pmml_prod_sub_cls,
"
"													  pmml_cre_by,
"
"													  pmml_cre_ip_addr,
"
"													  pmml_cre_os_user,
"
"													  pmml_cre_date,
"
"													  pmml_cre_emp_id
"
"													 )
"
"											   VALUES(p_bu,
"
"													  v_doc_no,
"
"													  v_item_seq_no,
"
"													  v_ins_prod_ln(i).ripl_prod_id,
"
"													  v_ins_prod_ln(i).ripl_prod_rev,
"
"													  v_ins_prod_ln(i).ripl_prod_desc11,
"
"													  NULL,
"
"													  v_ins_prod_ln(i).ripl_prod_uom,
"
"													  v_ins_prod_ln(i).ripl_prod_sub_cls,
"
"													  p_user,
"
"													  audit_info.get_ip_address,
"
"													  audit_info.get_os_user,
"
"													  SYSDATE,
"
"													  func_find_emp_id(p_bu, p_user)
"
"													 );
"
"
"
"					v_item_seq_no := v_item_seq_no + 1;
"
"
"
"				END LOOP;
"
"
"
"
"
"             -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no);
"
"
"
"
"
"            FOR i IN 1..v_ins_bom.COUNT
"
"            LOOP
"
"
"
"            /*if v_ins_bom(i).rib_oprn_id = 'NOTCHING' THEN
"
"               RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_ins_bom(i).rib_oprn_id);
"
"            end if;*/
"
"
"
"			SELECT prodplnt_type
"
"			  INTO v_type
"
"			  FROM prod_plants
"
"			 WHERE prodplnt_bu    	  = p_bu
"
"    		           AND prodplnt_plnt   	  = p_plnt
"
"			   AND prodplnt_prod_id   = v_ins_bom(i).rib_prod_id
"
"			   AND prodplnt_prod_rev  = v_ins_bom(i).rib_prod_rev;
"
"
"
"	    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_ins_bom(i).rib_oprn_id);
"
"
"
"            INSERT INTO migr_bom_ln(mbl_bu            ,
"
"                                        mbl_plnt          ,
"
"                                        mbl_doc_no        ,
"
"                                        mbl_seq_no        ,
"
"                                        mbl_par_prod_id   ,
"
"                                        mbl_par_prod_rev  ,
"
"                                        mbl_oprn_ln_seq      ,
"
"                                        mbl_oprn_id       ,
"
"                                        mbl_item_seq_no   ,
"
"                                        mbl_prod_id       ,
"
"                                        mbl_prod_rev      ,
"
"                                        mbl_req_uom       ,
"
"                                        mbl_rqrd_qty      ,
"
"                                        mbl_bom_no        ,
"
"                                        mbl_pm_type       ,
"
"                                        mbl_exception2    ,
"
"                                        mbl_cnr_flag      ,
"
"                                        mbl_prod_sgrp_id  ,
"
"                                        mbl_prod_grp_id   ,
"
"                                        mbl_prod_scls_id  ,
"
"                                        mbl_prod_cls_id   ,
"
"                                        mbl_primary_part  ,
"
"                                        mbl_make_suplr    ,
"
"                                        mbl_req_size      ,
"
"                                        mbl_loc           ,
"
"                                        mbl_rev_no        ,
"
"                                        mbl_add_type      ,
"
"                                        mbl_mftr_part_no  ,
"
"                                        mbl_ecn_ref       ,
"
"                                        mbl_item_remarks  ,
"
"                                        mbl_par_bom_name  ,
"
"                                        mbl_par_bom_rev   ,
"
"                                        mbl_eff_from      ,
"
"                                        mbl_eff_to        ,
"
"                                        mbl_par_thickness ,
"
"                                        mbl_par_width     ,
"
"                                        mbl_par_length    ,
"
"                                        mbl_thickness     ,
"
"                                        mbl_width         ,
"
"                                        mbl_length        ,
"
"                                        mbl_no_of_ups      ,
"
"                                        mbl_fdng_size      ,
"
"                                        mbl_batch_qty     ,
"
"                                        mbl_cre_by        ,
"
"                                        mbl_cre_ip_addr   ,
"
"                                        mbl_cre_os_user   ,
"
"                                        mbl_cre_date,
"
"										mbl_target_cost
"
"                                        )
"
"                                        VALUES(
"
"                                               p_bu,--mbl_bu            ,
"
"                                               p_plnt,--mbl_plnt          ,
"
"                                               p_doc_no,--mbl_doc_no        ,
"
"                                               v_seq_no,--mbl_seq_no        ,
"
"                                               v_ins_bom(i).rib_par_prod_id,--mbl_par_prod_id   ,
"
"                                               v_ins_bom(i).rib_par_prod_rev,--mbl_par_prod_rev  ,
"
"                                               v_ins_bom(i).rib_oprn_ln_seq,--mbl_oprn_ln_seq      ,
"
"                                               (select mfgo_oprn_id FROM mfg_oprns WHERE mfgo_bu = p_bu AND mfgo_desc1 = v_ins_bom(i).rib_oprn_id),--v_ins_bom(i).rib_oprn_id,--mbl_oprn_id       ,
"
"                                               v_ins_bom(i).rib_item_seq_no,--mbl_item_seq_no   ,
"
"                                               v_ins_bom(i).rib_prod_id,--mbl_prod_id       ,
"
"                                               v_ins_bom(i).rib_prod_rev,--mbl_prod_rev      ,
"
"                                               v_ins_bom(i).rib_req_uom,--mbl_req_uom       ,
"
"                                               NVL(v_ins_bom(i).rib_rqrd_qty,0),--mbl_rqrd_qty      ,
"
"                                               NULL,--mbl_bom_no        ,
"
"                                               CASE WHEN v_type = 'SU' THEN 'P' ELSE v_type END,--mbl_pm_type       ,
"
"                                               NULL,--mbl_exception2    ,
"
"                                               'N',--mbl_cnr_flag      ,
"
"                                               NULL,--mbl_prod_sgrp_id  ,
"
"                                               NULL,--mbl_prod_grp_id   ,
"
"                                               NULL,--mbl_prod_scls_id  ,
"
"                                               NULL,--mbl_prod_cls_id   ,
"
"                                               NULL,--mbl_primary_part  ,
"
"                                               NULL,--mbl_make_suplr    ,
"
"                                               NULL,--mbl_req_size      ,
"
"                                               NULL,--mbl_loc           ,--
"
"                                               NULL,--mbl_rev_no        ,
"
"                                               'A',--mbl_add_type      ,
"
"                                               v_ins_bom(i).rib_mftr_part_no,--mbl_mftr_part_no  ,
"
"                                               v_ins_bom(i).rib_location,--mbl_ecn_ref       ,
"
"                                               NULL,--mbl_item_remarks  ,
"
"                                               v_ins_bom(i).rib_par_bom_name,--mbl_par_bom_name  ,
"
"                                               v_ins_bom(i).rib_par_bom_rev,--mbl_par_bom_rev   ,
"
"                                               v_ins_bom(i).rib_eff_from,--mbl_eff_from      ,
"
"                                               v_ins_bom(i).rib_eff_to,--mbl_eff_to        , ,
"
"                                               NVL(v_ins_bom(i).rib_par_thickness,0),--mbl_par_thickness ,
"
"                                               NVL(v_ins_bom(i).rib_par_width,0),--mbl_par_width     ,
"
"                                               NVL(v_ins_bom(i).rib_par_length,0),--mbl_par_length    ,
"
"                                               NVL(v_ins_bom(i).rib_thickness,0),--mbl_thickness     ,
"
"                                               NVL(v_ins_bom(i).rib_width,0),--mbl_width         ,
"
"                                               NVL(v_ins_bom(i).rib_length,0),--mbl_length        ,
"
"                                               v_ins_bom(i).rib_no_of_ups, --mbl_no_of_ups      ,
"
"                                               v_ins_bom(i).rib_fdng_size,--mbl_fdng_size      ,
"
"                                               v_ins_bom(i).rib_batch_qty,--mbl_batch_qty     ,
"
"                                               p_user,--mbl_cre_by        ,
"
"                                               audit_info.get_ip_address,--mbl_cre_ip_addr   ,
"
"                                               audit_info.get_os_user,--mbl_cre_os_user   ,
"
"                                               SYSDATE,--mbl_cre_date
"
"											   v_ins_bom(i).rib_tar_cost
"
"                                               );
"
"
"
"                v_seq_no := v_seq_no + 1;
"
"
"
"            END LOOP i;
"
"
"
"        FOR j IN 1..v_ins_bom_scb.COUNT
"
"        LOOP
"
"
"
"	   -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no);
"
"
"
"            FOR r_bom_ln IN (SELECT *
"
"                               FROM migr_bom_ln
"
"                              WHERE mbl_bu             = p_bu
"
"                                AND mbl_plnt        = p_plnt
"
"                                AND mbl_doc_no        = p_doc_no
"
"                                AND mbl_par_prod_id        = v_ins_bom_scb(j).ribs_par_prod_id
"
"                                AND mbl_par_prod_rev     = v_ins_bom_scb(j).ribs_par_prod_rev
"
"                                AND mbl_oprn_ln_seq        = v_ins_bom_scb(j).ribs_oprn_ln_seq
"
"                                AND mbl_oprn_id        = (select mfgo_oprn_id FROM mfg_oprns WHERE mfgo_bu = p_bu AND mfgo_desc1 = v_ins_bom_scb(j).ribs_oprn_id) --v_ins_bom_scb(j).ribs_oprn_id
"
"                                AND mbl_par_bom_name    = v_ins_bom_scb(j).ribs_par_bom_name
"
"                                AND mbl_par_bom_rev        = v_ins_bom_scb(j).ribs_par_bom_rev
"
"                             )
"
"            LOOP
"
"
"
"	    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_ins_bom_scb(j).ribs_scb_prod_id);
"
"
"
"                 INSERT INTO migr_bom_rou_scrap(mbrs_bu             ,
"
"                                mbrs_plnt           ,
"
"                                mbrs_doc_no         ,
"
"                                mbrs_seq_no         ,
"
"                                mbrs_sub_seq_no     ,
"
"                                mbrs_oprn_id        ,
"
"                                mbrs_oprn_ln_seq    ,
"
"                                mbrs_prod_id        ,
"
"                                mbrs_prod_rev       ,
"
"                                mbrs_store          ,
"
"                                mbrs_rct_qty        ,
"
"                                mbrs_sou_prod_id    ,
"
"                                mbrs_sou_prod_rev   ,
"
"                                mbrs_prod_type      ,
"
"                                mbrs_cre_by         ,
"
"                                mbrs_cre_ip_addr    ,
"
"                                mbrs_cre_os_user    ,
"
"                                mbrs_cre_date
"
"                                   )
"
"                                VALUES(
"
"                                   p_bu,                                   --mbrs_bu             ,
"
"                                   p_plnt,                                 --mbrs_plnt           ,
"
"                                   p_doc_no,                               --mbrs_doc_no         ,
"
"                                   r_bom_ln.mbl_seq_no,                    --mbrs_seq_no            ,
"
"                                   v_scb_seq_no ,                          --mbrs_sub_seq_no     ,
"
"                                   (select mfgo_oprn_id FROM mfg_oprns WHERE mfgo_bu = p_bu AND mfgo_desc1 = v_ins_bom_scb(j).ribs_oprn_id),    --v_ins_bom_scb(j).ribs_oprn_id,          --mbrs_oprn_id          ,
"
"                                   v_ins_bom_scb(j).ribs_oprn_ln_seq,              --mbrs_oprn_ln_seq    ,
"
"                                   v_ins_bom_scb(j).ribs_scb_prod_id,            --mbrs_prod_id        ,
"
"                                   v_ins_bom_scb(j).ribs_scb_prod_rev,            --mbrs_prod_rev       ,
"
"                                   v_ins_bom_scb(j).ribs_store ,            --mbrs_store_id       ,
"
"                                   v_ins_bom_scb(j).ribs_rct_qty,            --mbrs_rct_qty        ,
"
"                                   v_ins_bom_scb(j).ribs_sou_prod_id,            --mbrs_sou_prod_id    ,
"
"                                   v_ins_bom_scb(j).ribs_sou_prod_rev,            --mbrs_sou_prod_rev   ,
"
"                                   v_ins_bom_scb(j).ribs_prod_type,            --mbrs_prod_type      ,
"
"                                   p_user,                        --mbrs_cre_by         ,
"
"                                   audit_info.get_ip_address,                   --mbrs_cre_ip_addr    ,
"
"                                   audit_info.get_os_user,                   --mbrs_cre_os_user    ,
"
"                                   SYSDATE                           --mbrs_cre_date
"
"                                );
"
"
"
"                v_scb_seq_no := v_scb_seq_no + 1;
"
"
"
"            END LOOP r_bom_ln;
"
"
"
"        END LOOP j;
"
"
"
"
"
"        FOR k IN 1..v_ins_bom_res.COUNT
"
"        LOOP
"
"
"
"        --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_create_table);
"
"
"
"            FOR r_bom_ln IN (SELECT *
"
"                               FROM migr_bom_ln
"
"                              WHERE mbl_bu             = p_bu
"
"                                AND mbl_plnt        = p_plnt
"
"                                AND mbl_doc_no        = p_doc_no
"
"                                AND mbl_par_prod_id        = v_ins_bom_res(k).ribr_par_prod_id
"
"                                AND mbl_par_prod_rev     = v_ins_bom_res(k).ribr_par_prod_rev
"
"                                AND mbl_oprn_ln_seq        = v_ins_bom_res(k).ribr_oprn_ln_seq
"
"                                AND mbl_oprn_id        = (select mfgo_oprn_id FROM mfg_oprns WHERE mfgo_bu = p_bu AND mfgo_desc1 = v_ins_bom_res(k).ribr_oprn_id) --v_ins_bom_res(k).ribr_oprn_id
"
"                                AND mbl_par_bom_name    = v_ins_bom_res(k).ribr_par_bom_name
"
"                                AND mbl_par_bom_rev        = v_ins_bom_res(k).ribr_par_bom_rev
"
"                             )
"
"            LOOP
"
"
"
"	        SELECT NVL(MAX(mbrr_sub_seq_no),0) + 1
"
"		  INTO v_res_seq_no
"
"		  FROM migr_bom_rou_res
"
"		 WHERE mbrr_bu		= p_bu
"
"		   AND mbrr_plnt	= p_plnt
"
"		   AND mbrr_doc_no	= p_doc_no
"
"		   AND mbrr_seq_no	= r_bom_ln.mbl_seq_no;
"
"
"
"
"
"                   INSERT INTO migr_bom_rou_res(mbrr_bu              ,
"
"                                mbrr_plnt            ,
"
"                                mbrr_doc_no          ,
"
"                                mbrr_seq_no          ,
"
"                                mbrr_sub_seq_no      ,
"
"                                mbrr_oprn_id           ,
"
"                                mbrr_oprn_ln_seq     ,
"
"                                mbrr_res_type        ,
"
"                                mbrr_res_grp         ,
"
"                                mbrr_uom             ,
"
"                                mbrr_units_per_hour  ,
"
"                                mbrr_hrs_per_unit    ,
"
"                                mbrr_mins_per_unit   ,
"
"                                mbrr_secs_per_unit   ,
"
"                                mbrr_lag_hrs         ,
"
"                                mbrr_setup_hrs       ,
"
"                                mbrr_setup_mins      ,
"
"                                mbrr_priority        ,
"
"                                mbrr_cre_by          ,
"
"                                mbrr_cre_ip_addr     ,
"
"                                mbrr_cre_os_user     ,
"
"                                mbrr_cre_date ,
"
"                                mbrr_no_of_units
"
"                                   )
"
"                                VALUES(
"
"                                   p_bu,                                            --mbrr_bu              ,
"
"                                   p_plnt,                                 --mbrr_plnt            ,
"
"                                   p_doc_no,                                 --mbrr_doc_no          ,
"
"                                   r_bom_ln.mbl_seq_no,                                  --mbrr_seq_no          ,
"
"                                   v_res_seq_no ,                           --mbrr_sub_seq_no      ,
"
"                                   (select mfgo_oprn_id FROM mfg_oprns WHERE mfgo_bu = p_bu AND mfgo_desc1 = v_ins_bom_res(k).ribr_oprn_id),    --v_ins_bom_res(k).ribr_oprn_id,                    --mbrr_oprn_id         ,
"
"                                   v_ins_bom_res(k).ribr_oprn_ln_seq,              --mbrr_oprn_ln_seq     ,
"
"                                   v_ins_bom_res(k).ribr_res_type ,            --mbrr_res_type        ,
"
"                                      v_ins_bom_res(k).ribr_res_grp,            --mbrr_res_grp_id      ,
"
"                                   v_ins_bom_res(k).ribr_uom,                --mbrr_uom             ,
"
"                                   NVL(v_ins_bom_res(k).ribr_units_per_hour,0),        --mbrr_units_per_hour  ,
"
"                                   v_ins_bom_res(k).ribr_hrs_per_unit,            --mbrr_hrs_per_unit    ,
"
"                                   v_ins_bom_res(k).ribr_mins_per_unit,            --mbrr_mins_per_unit   ,
"
"                                   v_ins_bom_res(k).ribr_secs_per_unit,            --mbrr_secs_per_unit   ,
"
"                                   v_ins_bom_res(k).ribr_lag_hrs,            --mbrr_lag_hrs         ,
"
"                                   NVL(v_ins_bom_res(k).ribr_setup_hrs,0),            --mbrr_setup_hrs       ,
"
"                                   NVL(v_ins_bom_res(k).ribr_setup_mins,0),            --mbrr_setup_mins      ,
"
"                                   v_ins_bom_res(k).ribr_priority,            --mbrr_priority        ,
"
"                                   p_user,                        --mbrr_cre_by          ,
"
"                                   audit_info.get_ip_address,                --mbrr_cre_ip_addr     ,
"
"                                   audit_info.get_os_user,                --mbrr_cre_os_user     ,
"
"                                   SYSDATE ,                       --mbrr_cre_date    ,
"
"                                   NVL(v_ins_bom_res(k).ribr_no_of_units,0)          --mbrr_no_of_units
"
"                                );
"
"
"
"             --   v_res_seq_no := v_res_seq_no + 1;
"
"
"
"            END LOOP r_bom_ln;
"
"
"
"        END LOOP k;
"
"
"
"
"
"
"
"            v_res := 'Y';
"
"
"
"	--    RAISE_APPLICATION_ERROR(-20999,'HRM'||v_res);
"
"
"
"            proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"            p_res := v_res;
"
"
"
"    END proc_ins_bom_migrate_ln_new;
"
"
"
"END pkg_migration_planning_new;"
/
