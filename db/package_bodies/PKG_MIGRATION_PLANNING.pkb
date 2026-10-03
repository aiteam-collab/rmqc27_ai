CREATE OR REPLACE
"PACKAGE BODY pkg_migration_planning
"
"IS
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
"    PROCEDURE proc_migr_mrp_frm_plan(p_bu            VARCHAR2,
"
"                                     p_plnt            VARCHAR2,
"
"                                     p_doc_no        VARCHAR2,
"
"                                     p_doc_rev        NUMBER,
"
"                                     p_from_date    DATE,
"
"                                     p_file_name    VARCHAR2,
"
"                                     p_user            VARCHAR2,
"
"                                     p_res        OUT    VARCHAR2
"
"                                     )
"
"    IS
"
"
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"    v_sub_seq_no    NUMBER ;
"
"    v_count            NUMBER ;
"
"
"
"    BEGIN
"
"
"
"        p_res := 'N';
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        v_create_table := 'CREATE TABLE EXCEL_MIGRATION(em_prod_id                 VARCHAR2(25),
"
"                                                        em_prod_rev                NUMBER(5),
"
"                                                        em_uom                   VARCHAR2(5),
"
"                                                        em_plan_qty                NUMBER(12,3)
"
"                                                        )
"
"                                  ORGANIZATION EXTERNAL(
"
"                                            TYPE ORACLE_LOADER
"
"                                                DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                ACCESS PARAMETERS
"
"                                                        (
"
"                                                         RECORDS DELIMITED BY NEWLINE
"
"                                                         SKIP 1
"
"                                                         FIELDS TERMINATED BY ''|''
"
"                                                         MISSING FIELD VALUES ARE NULL
"
"                                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                                        (
"
"                                                         em_prod_id              CHAR(255),
"
"                                                         em_prod_rev             CHAR(255),
"
"                                                         em_uom                  CHAR(255),
"
"                                                         em_plan_qty             CHAR(255)
"
"                                                        ))
"
"                                          LOCATION ('''||p_file_name||''')
"
"                                          ) REJECT LIMIT UNLIMITED';
"
"
"
"            EXECUTE IMMEDIATE v_create_table;
"
"
"
"            DELETE
"
"              FROM prod_plan_mon_ln
"
"             WHERE ppml_bu = p_bu
"
"               AND ppml_plnt = p_plnt
"
"               AND ppml_doc_no = p_doc_no
"
"               AND ppml_doc_rev = p_doc_rev;
"
"
"
"            DELETE prod_plan_sou_dtls
"
"             WHERE ppsd_bu         = p_bu
"
"               AND ppsd_plnt     = p_plnt
"
"               AND ppsd_doc_no    = p_doc_no
"
"               AND ppsd_doc_rev = p_doc_rev;
"
"
"
"            EXECUTE IMMEDIATE 'INSERT INTO prod_plan_mon_ln (SELECT '''||p_bu||''',
"
"                                                                    '''||p_plnt||''',
"
"                                                                    '''||p_doc_no||''',
"
"                                                                    '''||p_doc_rev||''',
"
"                                                                    ROWNUM,
"
"                                                                    em_prod_id,
"
"                                                                    em_prod_rev,
"
"                                                                    em_uom,
"
"                                                                    em_plan_qty,
"
"                                                                    '''||p_user||''',
"
"                                                                    SYSDATE,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    '''||0||''',
"
"                                                                    '''||'S'||''',
"
"                                                                    '''||'N'||''',
"
"                                                                    '''||'N'||''',
"
"                                                                    NULL,
"
"                                                                    '''||'N'||''',
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    em_plan_qty,
"
"                                                                    NULL,
"
"                                                                    '''||'N'||''',
"
"                                                                    NULL ,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    NULL
"
"                                                               FROM EXCEL_MIGRATION
"
"                                                            )';
"
"
"
"
"
"                --EXECUTE IMMEDIATE v_insert_table;
"
"
"
"                proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"                FOR cr_sou_dtls IN (SELECT *
"
"                                      FROM prod_plan_mon_ln
"
"                                     WHERE ppml_bu = p_bu
"
"                                       AND ppml_plnt = p_plnt
"
"                                       AND ppml_doc_no = p_doc_no
"
"                                       AND ppml_doc_Rev = p_doc_rev
"
"                                       )
"
"                LOOP
"
"
"
"                      SELECT NVL(MAX(ppsd_seq_no),0) + 1
"
"                        INTO v_sub_seq_no
"
"                        FROM prod_plan_sou_dtls
"
"                       WHERE ppsd_bu            = p_bu
"
"                         AND ppsd_plnt            = p_plnt
"
"                         AND ppsd_doc_no        = p_doc_no
"
"                         AND ppsd_doc_rev        = p_doc_rev
"
"                         AND ppsd_plan_seq_no    = cr_sou_dtls.ppml_seq_no;
"
"
"
"                        INSERT INTO prod_plan_sou_dtls
"
"                                                    (
"
"                                                     ppsd_bu,
"
"                                                     ppsd_plnt,
"
"                                                     ppsd_doc_no,
"
"                                                     ppsd_doc_rev,
"
"                                                     ppsd_plan_seq_no,
"
"                                                     ppsd_seq_no,
"
"                                                     ppsd_sou_type,
"
"                                                     ppsd_so_pfx,
"
"                                                     ppsd_so_no,
"
"                                                     ppsd_so_line_no,
"
"                                                     ppsd_so_sch_no,
"
"                                                     ppsd_so_comt_no,
"
"                                                     ppsd_rqrd_date,
"
"                                                     ppsd_disp_date,
"
"                                                     ppsd_rqrd_qty,
"
"                                                     ppsd_cre_by,
"
"                                                     ppsd_cre_date,
"
"                                                     ppsd_so_schld_desc
"
"                                                    )
"
"                                                VALUES
"
"                                                    (
"
"                                                     p_bu,
"
"                                                     p_plnt,
"
"                                                     p_doc_no,
"
"                                                     p_doc_rev,
"
"                                                     cr_sou_dtls.ppml_seq_no,
"
"                                                     v_sub_seq_no,
"
"                                                     'MN',
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     p_from_date,
"
"                                                     NULL,
"
"                                                     cr_sou_dtls.ppml_plan_qty,
"
"                                                     p_user,
"
"                                                     SYSDATE,
"
"                                                     p_doc_no
"
"                                                    );
"
"
"
"
"
"                END LOOP cr_sou_dtls;
"
"
"
"            p_res := 'Y';
"
"
"
"    END    proc_migr_mrp_frm_plan;
"
"
"
"    PROCEDURE    proc_load_mrp_frm_plan(p_bu                VARCHAR2,
"
"                                       p_plnt            VARCHAR2,
"
"                                       p_doc_no            VARCHAR2,
"
"                                       p_doc_rev        VARCHAR2,
"
"                                       p_mrp_no            VARCHAR2,
"
"                                       p_date_from        DATE,
"
"                                       P_date_to        DATE,
"
"                                       p_user            VARCHAR2
"
"                                       )
"
"    IS
"
"    CURSOR c_mrp
"
"    IS
"
"    SELECT mrppor_seq_no,
"
"           mrppor_prod_id,
"
"           mrppor_prod_rev,
"
"           prod_desc11,
"
"           mrppor_rqrd_date,
"
"           prod_uom,
"
"           plnd_rel
"
"      FROM(
"
"    SELECT mrppor_seq_no,
"
"           mrppor_prod_id,
"
"           mrppor_prod_rev,
"
"           prod_desc11,
"
"           mrppor_rqrd_date,
"
"           prod_uom prod_uom,
"
"           SUM(mrppor_qty - mrppor_rel_qty) plnd_rel
"
"      FROM mrp_hd,
"
"           mrp_plnd_order_rel,
"
"           products
"
"     WHERE mrphd_bu  = mrppor_bu
"
"       AND mrphd_mrp_no = mrppor_mrp_no
"
"       AND mrppor_ord_type = 'M'
"
"       AND mrppor_bu = prod_bu
"
"       AND mrppor_prod_id = prod_id
"
"       AND mrppor_prod_rev = prod_rev
"
"       AND mrppor_bu = p_bu
"
"       AND mrppor_plnt = p_plnt
"
"       AND mrppor_mrp_no = p_mrp_no
"
"       AND mrphd_date BETWEEN p_date_from AND p_date_to
"
"       AND mrphd_status NOT IN ('N','E')
"
"       AND (mrppor_qty - mrppor_rel_qty) > 0
"
"     GROUP BY mrppor_seq_no,
"
"              mrppor_prod_id,
"
"              mrppor_prod_rev,
"
"              prod_desc11,
"
"              mrppor_rqrd_date,
"
"              prod_uom
"
"           )
"
"        ORDER BY 2;
"
"
"
"    v_seq_no        NUMBER := 0;
"
"    v_sub_seq_no    NUMBER;
"
"
"
"    BEGIN
"
"
"
"            DELETE
"
"              FROM prod_plan_mon_ln
"
"             WHERE ppml_bu = p_bu
"
"               AND ppml_plnt = p_plnt
"
"               AND ppml_doc_no = p_doc_no
"
"               AND ppml_doc_rev = p_doc_rev;
"
"
"
"            DELETE prod_plan_sou_dtls
"
"             WHERE ppsd_bu         = p_bu
"
"               AND ppsd_plnt     = p_plnt
"
"               AND ppsd_doc_no    = p_doc_no
"
"               AND ppsd_doc_rev = p_doc_rev;
"
"
"
"                FOR cr_mrp IN c_mrp
"
"                LOOP
"
"
"
"                        v_seq_no := v_seq_no + 1;
"
"
"
"                        INSERT INTO prod_plan_mon_ln
"
"                                                    (
"
"                                                     ppml_bu,
"
"                                                     ppml_plnt,
"
"                                                     ppml_doc_no,
"
"                                                     ppml_doc_rev,
"
"                                                     ppml_seq_no,
"
"                                                     ppml_prod_id,
"
"                                                     ppml_prod_rev,
"
"                                                     ppml_uom,
"
"                                                     ppml_plan_qty,
"
"                                                     ppml_demand_qty,
"
"                                                     ppml_cre_by,
"
"                                                     ppml_cre_date
"
"                                                    )
"
"                                             VALUES
"
"                                                    (
"
"                                                     p_bu,
"
"                                                     p_plnt,
"
"                                                     p_doc_no,
"
"                                                     p_doc_rev,
"
"                                                     v_seq_no,
"
"                                                     cr_mrp.mrppor_prod_id,
"
"                                                     cr_mrp.mrppor_prod_rev,
"
"                                                     cr_mrp.prod_uom,
"
"                                                     cr_mrp.plnd_rel,
"
"                                                     cr_mrp.plnd_rel,
"
"                                                     p_user,
"
"                                                     SYSDATE
"
"                                                     );
"
"
"
"                  SELECT NVL(MAX(ppsd_seq_no),0) + 1
"
"                    INTO v_sub_seq_no
"
"                    FROM prod_plan_sou_dtls
"
"                   WHERE ppsd_bu            = p_bu
"
"                     AND ppsd_plnt            = p_plnt
"
"                     AND ppsd_doc_no        = p_doc_no
"
"                     AND ppsd_doc_rev        = p_doc_rev
"
"                     AND ppsd_plan_seq_no    = v_seq_no;
"
"
"
"                        INSERT INTO prod_plan_sou_dtls
"
"                                                    (
"
"                                                     ppsd_bu,
"
"                                                     ppsd_plnt,
"
"                                                     ppsd_doc_no,
"
"                                                     ppsd_doc_rev,
"
"                                                     ppsd_plan_seq_no,
"
"                                                     ppsd_seq_no,
"
"                                                     ppsd_sou_type,
"
"                                                     ppsd_so_pfx,
"
"                                                     ppsd_so_no,
"
"                                                     ppsd_so_line_no,
"
"                                                     ppsd_so_sch_no,
"
"                                                     ppsd_so_comt_no,
"
"                                                     ppsd_rqrd_date,
"
"                                                     ppsd_disp_date,
"
"                                                     ppsd_rqrd_qty,
"
"                                                     ppsd_cre_by,
"
"                                                     ppsd_cre_date,
"
"                                                     ppsd_so_schld_desc
"
"                                                    )
"
"                                                VALUES
"
"                                                    (
"
"                                                     p_bu,
"
"                                                     p_plnt,
"
"                                                     p_doc_no,
"
"                                                     p_doc_rev,
"
"                                                     v_seq_no,
"
"                                                     v_sub_seq_no,
"
"                                                     'MR',
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     NULL,
"
"                                                     cr_mrp.mrppor_rqrd_date,
"
"                                                     NULL,
"
"                                                     cr_mrp.plnd_rel,
"
"                                                     p_user,
"
"                                                     SYSDATE,
"
"                                                     p_mrp_no
"
"                                                    );
"
"                END LOOP c_mrp;
"
"
"
"    END proc_load_mrp_frm_plan;
"
"
"
"  PROCEDURE    proc_load_mrp_frm_mon_plan(p_bu                VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_doc_no            VARCHAR2,
"
"                                        p_doc_rev        VARCHAR2,
"
"                                        p_mrp_no            VARCHAR2,
"
"                                        p_date_from        DATE,
"
"                                        P_date_to        DATE,
"
"                                        p_user            VARCHAR2
"
"                                        )
"
"     IS
"
"     CURSOR c_mrp
"
"     IS
"
"     SELECT mrppor_seq_no,
"
"            mrppor_prod_id,
"
"            mrppor_prod_rev,
"
"            prod_desc11,
"
"            mrppor_rqrd_date,
"
"            prod_uom,
"
"            plnd_rel
"
"       FROM(
"
"     SELECT mrppor_seq_no,
"
"            mrppor_prod_id,
"
"            mrppor_prod_rev,
"
"            prod_desc11,
"
"            mrppor_rqrd_date,
"
"            prod_uom prod_uom,
"
"            SUM(mrppor_qty - mrppor_rel_qty) plnd_rel
"
"       FROM mrp_hd,
"
"            mrp_plnd_order_rel,
"
"            products
"
"      WHERE mrphd_bu  = mrppor_bu
"
"        AND mrphd_mrp_no = mrppor_mrp_no
"
"        AND mrppor_ord_type = 'M'
"
"        AND mrppor_bu = prod_bu
"
"        AND mrppor_prod_id = prod_id
"
"        AND mrppor_prod_rev = prod_rev
"
"        AND mrppor_bu = p_bu
"
"        AND mrppor_plnt = p_plnt
"
"        AND mrppor_mrp_no = p_mrp_no
"
"        AND mrphd_date BETWEEN p_date_from AND p_date_to
"
"        AND mrphd_status NOT IN ('N','E')
"
"        AND (mrppor_qty - mrppor_rel_qty) > 0
"
"      GROUP BY mrppor_seq_no,
"
"               mrppor_prod_id,
"
"               mrppor_prod_rev,
"
"               prod_desc11,
"
"               mrppor_rqrd_date,
"
"               prod_uom
"
"            )
"
"         ORDER BY 2;
"
"
"
"     v_seq_no        NUMBER := 0;
"
"     v_sub_seq_no    NUMBER;
"
"
"
"     BEGIN
"
"
"
"             DELETE
"
"               FROM prod_plan_mon_ln
"
"              WHERE ppml_bu = p_bu
"
"                AND ppml_plnt = p_plnt
"
"                AND ppml_doc_no = p_doc_no
"
"                AND ppml_doc_rev = p_doc_rev;
"
"
"
"             DELETE prod_plan_sou_dtls
"
"              WHERE ppsd_bu         = p_bu
"
"                AND ppsd_plnt     = p_plnt
"
"                AND ppsd_doc_no    = p_doc_no
"
"                AND ppsd_doc_rev = p_doc_rev;
"
"
"
"                 FOR cr_mrp IN c_mrp
"
"                 LOOP
"
"
"
"                         v_seq_no := v_seq_no + 1;
"
"
"
"
"
"                         INSERT INTO std_prod_plan_mon_ln(sppml_bu               ,
"
"                              sppml_plnt             ,
"
"                              sppml_doc_no           ,
"
"                              sppml_doc_rev          ,
"
"                              sppml_seq_no           ,
"
"                              sppml_prod_id          ,
"
"                              sppml_prod_rev         ,
"
"                              sppml_uom              ,
"
"                              sppml_plan_qty         ,
"
"                              sppml_demand_qty       ,
"
"                              sppml_rqrd_date        ,
"
"                              sppml_disp_date        ,
"
"                              sppml_rqrd_qty         ,
"
"                              sppml_disp_qty         ,
"
"                              sppml_so_schld_desc    ,
"
"                                  sppml_cre_by           ,
"
"                              sppml_cre_date         ,
"
"                              sppml_upd_by           ,
"
"                              sppml_upd_date         )
"
"                               VALUES(p_bu               ,
"
"                              p_plnt             ,
"
"                              p_doc_no           ,
"
"                              p_doc_rev          ,
"
"                              v_seq_no           ,
"
"                              cr_mrp.mrppor_prod_id          ,
"
"                              cr_mrp.mrppor_prod_rev         ,
"
"                              cr_mrp.prod_uom,
"
"                                                          cr_mrp.plnd_rel,
"
"                                                          cr_mrp.plnd_rel,
"
"                              cr_mrp.mrppor_rqrd_date,
"
"                              NULL,
"
"                                                          cr_mrp.plnd_rel,
"
"                              0         ,
"
"                              p_mrp_no,
"
"                                  p_user           ,
"
"                              SYSDATE         ,
"
"                              NULL           ,
"
"                              NULL         );
"
"
"
"
"
"                 END LOOP c_mrp;
"
"
"
"    END proc_load_mrp_frm_mon_plan;
"
"
"
"    PROCEDURE  proc_ins_migr_routing_ln (p_bu           VARCHAR2,
"
"                                         p_plnt         VARCHAR2,
"
"                                         p_doc_no       VARCHAR2,
"
"                                         p_file_name    VARCHAR2,
"
"                                         p_user         VARCHAR2
"
"                                         )
"
"    IS
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"    BEGIN
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        v_create_table := 'CREATE TABLE EXCEL_MIGRATION
"
"                                                      ( EM_PAR_PROD_ID                                VARCHAR2(25),
"
"                                                        EM_PAR_PROD_REV                               NUMBER(5),
"
"                                                        EM_BOM_UOM                                    VARCHAR2(5),
"
"                                                        EM_PROC_SEQ_NO                                NUMBER(5),
"
"                                                        EM_OPRN_ID                                    VARCHAR2(50),
"
"                                                        EM_PROC_ID                                    VARCHAR2(50),
"
"                                                        EM_OPRN_TYPE                                  VARCHAR2(1),
"
"                                                        EM_IR_FLAG                                    VARCHAR2(1),
"
"                                                        EM_CONS_STORE                                 VARCHAR2(50),
"
"                                                        EM_RCP_STORE                                  VARCHAR2(50),
"
"                                                        EM_PP_PLNR_ID                                  VARCHAR2(10),
"
"                                                        EM_SFC_PLNR_ID                                  VARCHAR2(10)
"
"                                                        )
"
"                                      ORGANIZATION EXTERNAL(
"
"                                                TYPE ORACLE_LOADER
"
"                                                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                    ACCESS PARAMETERS(
"
"                                                              RECORDS DELIMITED BY NEWLINE
"
"                                                              SKIP 1
"
"                                                              FIELDS TERMINATED BY ''|''
"
"                                                              MISSING FIELD VALUES ARE NULL
"
"                                                              REJECT ROWS WITH ALL NULL FIELDS
"
"                                                              (
"
"                                                               EM_PAR_PROD_ID                   CHAR(255),
"
"                                                               EM_PAR_PROD_REV                  CHAR(255),
"
"                                                               EM_BOM_UOM                       CHAR(255),
"
"                                                               EM_PROC_SEQ_NO                   CHAR(255),
"
"                                                               EM_OPRN_ID                       CHAR(255),
"
"                                                               EM_PROC_ID                       CHAR(255),
"
"                                                               EM_OPRN_TYPE                     CHAR(255),
"
"                                                               EM_IR_FLAG                       CHAR(255),
"
"                                                               EM_CONS_STORE                    CHAR(255),
"
"                                                               EM_RCP_STORE                     CHAR(255),
"
"                                                               EM_PP_PLNR_ID                    CHAR(255),
"
"                                                               EM_SFC_PLNR_ID                    CHAR(255)
"
"                                                              )
"
"                                                )
"
"                                      LOCATION ('''||p_file_name||''')
"
"                                      ) REJECT LIMIT UNLIMITED';
"
"
"
"                EXECUTE IMMEDIATE v_create_table;
"
"
"
"                DELETE
"
"                  FROM migr_routing_ln
"
"                 WHERE mrl_bu     = p_bu
"
"                   AND mrl_plnt   = p_plnt
"
"                   AND mrl_doc_no = p_doc_no;
"
"
"
"                v_insert_table := 'INSERT INTO migr_routing_ln (SELECT  '|| CHR (39)|| p_bu     || CHR (39) || ',
"
"                                                                        '|| CHR (39)|| p_plnt   || CHR (39) || ',
"
"                                                                        '|| CHR (39)|| p_doc_no || CHR (39) || ',
"
"                                                                        ROWNUM,
"
"                                                                        em_par_prod_id ,
"
"                                                                        em_par_prod_rev,
"
"                                                                        em_bom_uom     ,
"
"                                                                        em_proc_seq_no ,
"
"                                                                        em_oprn_id     ,
"
"                                                                        em_proc_id     ,
"
"                                                                        em_oprn_type   ,
"
"                                                                        em_ir_flag     ,
"
"                                                                        em_cons_store  ,
"
"                                                                        em_rcp_store   ,
"
"                                                                        '|| CHR (39)|| p_user || CHR (39) || ',
"
"                                                                        SYSDATE           ,
"
"                                                                        NULL,
"
"                                                                        NULL,
"
"                                                                        NULL,
"
"                                                                        em_pp_plnr_id,
"
"                                                                        em_sfc_plnr_id
"
"                                                                   FROM excel_migration
"
"                                                                        )';
"
"                EXECUTE IMMEDIATE v_insert_table;
"
"
"
"                proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"
"
"    END    proc_ins_migr_routing_ln;
"
"
"
"    PROCEDURE proc_ins_migr_bom_ln(p_bu           VARCHAR2,
"
"                                   p_plnt         VARCHAR2,
"
"                                   p_doc_no       VARCHAR2,
"
"                                   p_file_name    VARCHAR2,
"
"                                   p_user         VARCHAR2
"
"                                   )
"
"    IS
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"    BEGIN
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        v_create_table := 'CREATE TABLE EXCEL_MIGRATION
"
"                                                       (EM_PAR_PROD_ID                        VARCHAR2(25),
"
"                                                        EM_PAR_PROD_REV                       NUMBER(5),
"
"                                                        EM_OPRN_ID                            VARCHAR2(50),
"
"                                                        EM_ITEM_SEQ_NO                        NUMBER(5),
"
"                                                        EM_PROD_ID                            VARCHAR2(25),
"
"                                                        EM_PROD_REV                           NUMBER(5),
"
"                                                        EM_REQ_UOM                            VARCHAR2(5),
"
"                                                        EM_RQRD_QTY                           NUMBER(12,5),
"
"                                                        EM_CNR_FLAG                           VARCHAR2(1),
"
"                                                        EM_PROD_SGRP_ID                       VARCHAR2(50),
"
"                                                        EM_PROD_GRP_ID                        VARCHAR2(50),
"
"                                                        EM_PROD_SCLS_ID                       VARCHAR2(50),
"
"                                                        EM_PROD_CLS_ID                        VARCHAR2(50),
"
"                                                        EM_PRIMARY_PART                       VARCHAR2(50),
"
"                                                        EM_MAKE_SUPLR                         VARCHAR2(50),
"
"                                                        EM_REQ_SIZE                           VARCHAR2(100),
"
"                                                        EM_LOC                                VARCHAR2(200)
"
"                                                       )
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
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                            EM_PAR_PROD_ID              CHAR(255),
"
"                                                            EM_PAR_PROD_REV             CHAR(255),
"
"                                                            EM_OPRN_ID                  CHAR(255),
"
"                                                            EM_ITEM_SEQ_NO              CHAR(255),
"
"                                                            EM_PROD_ID                  CHAR(255),
"
"                                                            EM_PROD_REV                 CHAR(255),
"
"                                                            EM_REQ_UOM                  CHAR(255),
"
"                                                            EM_RQRD_QTY                 CHAR(255),
"
"                                                            EM_CNR_FLAG                 CHAR(255),
"
"                                                            EM_PROD_SGRP_ID             CHAR(255),
"
"                                                            EM_PROD_GRP_ID               CHAR(255),
"
"                                                            EM_PROD_SCLS_ID              CHAR(255),
"
"                                                            EM_PROD_CLS_ID               CHAR(255),
"
"                                                            EM_PRIMARY_PART              CHAR(255),
"
"                                                            EM_MAKE_SUPLR                CHAR(255),
"
"                                                            EM_REQ_SIZE                    CHAR(255),
"
"                                                            EM_LOC                         CHAR(255)
"
"                                                          )
"
"                                            )
"
"                                  LOCATION ('''||p_file_name||''')
"
"                                  ) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE v_create_table;
"
"
"
"--RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_create_table);
"
"
"
"        DELETE
"
"          FROM migr_bom_ln
"
"         WHERE mbl_bu     = p_bu
"
"           AND mbl_plnt   = p_plnt
"
"           AND mbl_doc_no = p_doc_no;
"
"
"
"        v_insert_table :=  'INSERT INTO migr_bom_ln (SELECT ' || CHR (39)|| p_bu     || CHR (39) || ',
"
"                                                            ' || CHR (39)|| p_plnt   || CHR (39) || ',
"
"                                                             '|| CHR (39)|| p_doc_no || CHR (39) || ',
"
"                                                             ROWNUM,
"
"                                                            em_par_prod_id  ,
"
"                                                            em_par_prod_rev ,
"
"                                                            em_oprn_id      ,
"
"                                                            em_item_seq_no  ,
"
"                                                            em_prod_id      ,
"
"                                                            em_prod_rev     ,
"
"                                                            em_req_uom      ,
"
"                                                            NVL(em_rqrd_qty,0) ,
"
"                                                            NULL,
"
"                                                             '|| CHR (39)|| p_user || CHR (39) || ',
"
"                                                            SYSDATE           ,
"
"                                                            NULL,
"
"                                                            NULL,
"
"                                                            NULL,
"
"                                                            NULL,
"
"                                                            em_cnr_flag,
"
"                                                            em_prod_sgrp_id,
"
"                                                            em_prod_grp_id ,
"
"                                                            em_prod_scls_id,
"
"                                                            em_prod_cls_id ,
"
"                                                            em_primary_part,
"
"                                                            em_make_suplr  ,
"
"                                                            em_req_size    ,
"
"                                                            em_loc         ,
"
"                                                            NULL,
"
"                                                             '|| CHR (39)|| 'A' || CHR (39) || ',
"
"                                                            NULL,
"
"                                                            NULL
"
"                                                       FROM EXCEL_MIGRATION
"
"                                                        )';
"
"
"
"        EXECUTE IMMEDIATE v_insert_table;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"    END proc_ins_migr_bom_ln;
"
"
"
"    PROCEDURE proc_ins_migr_bor_ln (p_bu           VARCHAR2,
"
"                                    p_plnt         VARCHAR2,
"
"                                    p_doc_no       VARCHAR2,
"
"                                    p_file_name    VARCHAR2,
"
"                                    p_user         VARCHAR2
"
"                                    )
"
"    IS
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"    BEGIN
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        v_create_table := 'CREATE TABLE EXCEL_MIGRATION
"
"                                                      ( EM_SEQ_NO                                       NUMBER(5),
"
"                                                        EM_PAR_PROD_ID                                 VARCHAR2(25),
"
"                                                        EM_PAR_PROD_REV                                NUMBER(5),
"
"                                                        EM_PROC_ID                                     VARCHAR2(10),
"
"                                                        EM_RES_GRP_ID                                  VARCHAR2(10),
"
"                                                        EM_UNITS_PER_HOUR                                NUMBER(12,3),
"
"                                                        EM_HRS_PER_UNIT                                NUMBER(4),
"
"                                                        EM_MINS_PER_UNIT                               NUMBER(2),
"
"                                                        EM_UOM                                         VARCHAR2(5),
"
"                                                        EM_SECS_PER_UNIT                               NUMBER(3),
"
"                                                        EM_LAG_HRS                                     NUMBER(4),
"
"                                                        EM_NO_OF_UNITS                                 NUMBER(4)
"
"                                                       )
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
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                            EM_SEQ_NO                                        CHAR(255),
"
"                                                            EM_PAR_PROD_ID                                 CHAR(255),
"
"                                                            EM_PAR_PROD_REV                                CHAR(255),
"
"                                                            EM_PROC_ID                                     CHAR(255),
"
"                                                            EM_RES_GRP_ID                                  CHAR(255),
"
"                                                            EM_UNITS_PER_HOUR                                   CHAR(255),
"
"                                                            EM_HRS_PER_UNIT                                CHAR(255),
"
"                                                            EM_MINS_PER_UNIT                               CHAR(255),
"
"                                                            EM_UOM                                         CHAR(255),
"
"                                                            EM_SECS_PER_UNIT                               CHAR(255),
"
"                                                            EM_LAG_HRS                                     CHAR(255),
"
"                                                            EM_NO_OF_UNITS                                 CHAR(255)
"
"                                                          )
"
"                                            )
"
"                                  LOCATION ('''||p_file_name||''')
"
"                                  ) REJECT LIMIT UNLIMITED';
"
"
"
"            EXECUTE IMMEDIATE v_create_table;
"
"
"
"                  v_insert_table :=  'INSERT INTO migr_bor_ln    (SELECT  ' || CHR (39)|| p_bu     || CHR (39) || ',
"
"                                                                          ' || CHR (39)|| p_plnt   || CHR (39) || ',
"
"                                                                           '|| CHR (39)|| p_doc_no || CHR (39) || ',
"
"                                                                           ''R'',
"
"                                                                           em_seq_no,
"
"                                                                           em_par_prod_id    ,
"
"                                                                           em_par_prod_rev   ,
"
"                                                                           em_proc_id        ,
"
"                                                                           em_res_grp_id     ,
"
"                                                                           em_units_per_hour ,
"
"                                                                           em_hrs_per_unit   ,
"
"                                                                           em_mins_per_unit  ,
"
"                                                                           em_uom            ,
"
"                                                                           em_secs_per_unit  ,
"
"                                                                           em_lag_hrs        ,
"
"                                                                           ''I'',
"
"                                                                           1,
"
"                                                                           0,
"
"                                                                           0,
"
"                                                                           '|| CHR (39)|| p_user || CHR (39) || ',
"
"                                                                           SYSDATE           ,
"
"                                                                           NULL              ,
"
"                                                                           NULL,
"
"                                                                           em_no_of_units
"
"                                                                      FROM EXCEL_MIGRATION
"
"                                                                    )';
"
"            EXECUTE IMMEDIATE v_insert_table;
"
"
"
"            proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_ins_migr_bor_ln;
"
"
"
"    PROCEDURE proc_ins_migr_bor_details (
"
"                                          p_bu           VARCHAR2,
"
"                                          p_plnt         VARCHAR2,
"
"                                          p_doc_no       VARCHAR2,
"
"                                          p_file_name    VARCHAR2,
"
"                                          p_user         VARCHAR2
"
"                                          )
"
"    IS
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"    BEGIN
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        v_create_table := 'CREATE TABLE EXCEL_MIGRATION          ( EM_SEQ_NO                                        NUMBER(5) ,
"
"                                                                EM_PAR_PROD_ID                                VARCHAR2(25),
"
"                                                                EM_PAR_PROD_REV                               NUMBER(5),
"
"                                                                EM_RES_GRP_ID                                 VARCHAR2(10),
"
"                                                                EM_RES_ID                                     VARCHAR2(10),
"
"                                                                EM_PRIORITY                                   NUMBER(5)
"
"                                                               )
"
"                                          ORGANIZATION EXTERNAL(
"
"                                                    TYPE ORACLE_LOADER
"
"                                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                        ACCESS PARAMETERS(
"
"                                                                  RECORDS DELIMITED BY NEWLINE
"
"                                                                  SKIP 1
"
"                                                                  FIELDS TERMINATED BY ''|''
"
"                                                                  MISSING FIELD VALUES ARE NULL
"
"                                                                  REJECT ROWS WITH ALL NULL FIELDS
"
"                                                                  (
"
"                                                                    EM_SEQ_NO                                           CHAR(255),
"
"                                                                    EM_PAR_PROD_ID                                CHAR(255),
"
"                                                                    EM_PAR_PROD_REV                               CHAR(255),
"
"                                                                    EM_RES_GRP_ID                                 CHAR(255),
"
"                                                                    EM_RES_ID                                     CHAR(255),
"
"                                                                    EM_PRIORITY                                   CHAR(255)
"
"                                                                  )
"
"                                                    )
"
"                                          LOCATION ('''||p_file_name||''')
"
"                                          ) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE     v_create_table;
"
"
"
"        v_insert_table := 'INSERT INTO migr_bor_details  (SELECT  ' || CHR (39)|| p_bu     || CHR (39) || ',
"
"                                                                  ' || CHR (39)|| p_plnt   || CHR (39) || ',
"
"                                                                  ' || CHR (39)|| p_doc_no || CHR (39) || ',
"
"                                                                   em_seq_no,
"
"                                                                   em_par_prod_id      ,
"
"                                                                   em_par_prod_rev     ,
"
"                                                                   em_res_grp_id       ,
"
"                                                                   em_res_id           ,
"
"                                                                   em_priority         ,
"
"                                                                   '|| CHR (39)|| p_user || CHR (39) || ',
"
"                                                                   SYSDATE           ,
"
"                                                                   NULL,
"
"                                                                   NULL
"
"                                                              FROM EXCEL_MIGRATION
"
"                                                                    )';
"
"        EXECUTE IMMEDIATE     v_insert_table;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END    proc_ins_migr_bor_details;
"
"
"
"    PROCEDURE proc_migr_mrp_demand (
"
"                                    p_bu           VARCHAR2,
"
"                                    p_plnt         VARCHAR2,
"
"                                    p_doc_no       VARCHAR2,
"
"                                    p_file_name    VARCHAR2,
"
"                                    p_user         VARCHAR2,
"
"                                    p_res     OUT   VARCHAR2
"
"                                    )
"
"    IS
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"    BEGIN
"
"
"
"        DELETE MRP_DEMAND
"
"        WHERE MRPD_BU = P_BU
"
"        AND MRPD_MRP_NO = P_DOC_NO;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        v_create_table := 'CREATE TABLE EXCEL_MIGRATION
"
"                                                       (
"
"                                                       em_plnt            VARCHAR2(10),
"
"                                                       em_prod_id          VARCHAR2(25),
"
"                                                       em_prod_rev         NUMBER(5),
"
"                                                       em_rqrd_date       DATE,
"
"                                                       em_rqrd_qty        NUMBER(12,3),
"
"                                                       em_type              VARCHAR2(10)
"
"                                                       )
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
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                          em_plnt              CHAR(255),
"
"                                                          em_prod_id             CHAR(255),
"
"                                                          em_prod_rev            CHAR(255),
"
"                                                          em_rqrd_date           CHAR(255)   DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                          em_rqrd_qty            CHAR(255),
"
"                                                          em_type                 CHAR(255)
"
"                                                          )
"
"                                            )
"
"                                  LOCATION ('''||p_file_name||''')
"
"                                  ) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE v_create_table;
"
"
"
"                           --RAISE_APPLICATION_ERROR(-20999,'HRM');
"
"
"
"        v_insert_table := 'INSERT INTO mrp_demand (SELECT '|| CHR (39)|| p_bu     || CHR (39) ||',
"
"                                                          em_plnt,
"
"                                                          '|| CHR (39)|| p_doc_no || CHR (39) ||',
"
"                                                           NULL,
"
"                                                           em_prod_id ,
"
"                                                           em_prod_rev,
"
"                                                           em_rqrd_date,
"
"                                                           em_rqrd_qty ,
"
"                                                           0,
"
"                                                           em_rqrd_qty,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           em_type,
"
"                                                           ''N'',
"
"                                                           ''N'',
"
"                                                           SYSDATE           ,
"
"                                                           '|| CHR (39)|| p_user || CHR (39) ||',
"
"                                                           NULL           ,
"
"                                                           NULL,
"
"                                                           SYSDATE,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           em_rqrd_qty             ,
"
"                                                             0   ,
"
"                                                           NULL,
"
"                                                           NULL
"
"                                                      FROM EXCEL_MIGRATION
"
"                                                      )';
"
"        EXECUTE IMMEDIATE v_insert_table;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        P_RES := 'Y';
"
"
"
"    END proc_migr_mrp_demand;
"
"
"
"    PROCEDURE proc_ins_bom_migrate_ln(
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
"                                          p_res     OUT   VARCHAR2,
"
"                      p_sep          VARCHAR2  DEFAULT '|'
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
"                                 rib_par_prod_id      VARCHAR2(100),
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
"                                 rib_oprn_ln_seq      VARCHAR2(110),
"
"                                 rib_oprn_seq_no      NUMBER(5),
"
"                                 rib_oprn_id          VARCHAR2(50),
"
"                                 rib_oprn_std_cost    NUMBER(17,5),
"
"                                 rib_item_seq_no      NUMBER(5),
"
"                                 rib_prod_id          VARCHAR2(100),
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
"                                 rib_location         VARCHAR2(1000)
"
"                                 );
"
"
"
"    TYPE r_ins_bom_scb IS RECORD(ribs_par_bom_name     VARCHAR2(100),
"
"                     ribs_par_bom_rev          VARCHAR2(10),
"
"                     ribs_par_prod_id          VARCHAR2(100),
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
"                     ribr_par_prod_id          VARCHAR2(100),
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
"        v_create_table    VARCHAR2(4000);
"
"        v_insert_table    VARCHAR2(4000);
"
"
"
"        v_res           VARCHAR2(1);
"
"        v_seq_no        NUMBER := 1;
"
"        v_res_seq_no    NUMBER := 1;
"
"        v_scb_seq_no    NUMBER := 1;
"
"    v_type          VARCHAR(2);
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
"            v_res := 'N';
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_create_table);
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
"                                                             em_oprn_ln_seq         VARCHAR2(110),
"
"                                                             em_oprn_seq_no             VARCHAR2(110),
"
"                                                             em_oprn_id          VARCHAR2(50),
"
"                                                             em_std_unit_cost    NUMBER(5),
"
"                                                             em_item_seq_no      NUMBER(5),
"
"                                                             em_prod_id          VARCHAR2(25),
"
"                                                             em_prod_rev         NUMBER(5),
"
"                                                             em_thickness          NUMBER(10,3),
"
"                                                             em_width              NUMBER(10,3),
"
"                                                             em_length                NUMBER(10,3),
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
"                                                             em_scb_prod_id          VARCHAR2(100),
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
"                                                          FIELDS TERMINATED BY '''||p_sep||'''
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
"                                                           em_oprn_seq_no             CHAR(255),
"
"                                                           em_oprn_id               CHAR(255),
"
"                                                           em_std_unit_cost            CHAR(255),
"
"                                                           em_item_seq_no           CHAR(255),
"
"                                                           em_prod_id               CHAR(255),
"
"                                                           em_prod_rev              CHAR(255),
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
"                                                           em_no_of_units           CHAR(255),
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
"   --raise_application_error(-20999,'HRM'||p_file_name);
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
"                          em_oprn_seq_no ,
"
"                                      em_oprn_id      ,
"
"                                      em_std_unit_cost,
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
"                                      em_location
"
"                                 FROM excel_migration
"
"                GROUP BY em_par_bom_name ,
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
"                          em_oprn_seq_no,
"
"                                      em_oprn_id      ,
"
"                                      em_std_unit_cost,
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
"                                      em_location
"
"                    ORDER BY em_oprn_ln_seq,em_item_seq_no' BULK COLLECT INTO v_ins_bom;
"
"
"
"
"
"
"
"  --raise_application_error(-20999,'HRM'||p_file_name);
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
"              --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no);
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
"            if v_ins_bom(i).rib_oprn_id = 'NOTCHING' THEN
"
"               RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_ins_bom(i).rib_oprn_id);
"
"            end if;
"
"
"
"           -- IF v_ins_bom(i).rib_prod_id IS NOT NULL THEN
"
"            BEGIN
"
"
"
"            SELECT prodplnt_type
"
"              INTO v_type
"
"              FROM prod_plants
"
"             WHERE prodplnt_bu          = p_bu
"
"                       AND prodplnt_plnt         = p_plnt
"
"               AND prodplnt_prod_id   = TRIM(v_ins_bom(i).rib_prod_id)
"
"               AND prodplnt_prod_rev  = TRIM(v_ins_bom(i).rib_prod_rev);
"
"
"
"               EXCEPTION WHEN OTHERS THEN
"
"               RAISE_APPLICATION_ERROR(-20267,'ICM'||'/'||v_ins_bom(i).rib_prod_id);
"
"             END;
"
"           --END IF;
"
"       --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_ins_bom(i).rib_oprn_id);
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
"                                        mbl_oprn_seq_no,
"
"                                        mbl_oprn_id       ,
"
"                                        mbl_oprn_std_cost,
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
"                    mbl_child_ls_flag
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
"                                               v_ins_bom(i).rib_oprn_seq_no,
"
"                                               (select mfgo_oprn_id FROM mfg_oprns WHERE mfgo_bu = p_bu AND mfgo_desc1 = v_ins_bom(i).rib_oprn_id),--v_ins_bom(i).rib_oprn_id,--mbl_oprn_id       ,
"
"                                               v_ins_bom(i).rib_oprn_std_cost,
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
"                           CASE WHEN v_ins_bom(i).rib_prod_id IS NOT NULL THEN
"
"                                     CASE WHEN func_find_prod_ser_no_opt(p_bu,v_ins_bom(i).rib_par_prod_id,v_ins_bom(i).rib_par_bom_rev) = 'T' THEN 'Y'
"
"                                  ELSE 'N'
"
"                              END
"
"                            ELSE 'N'
"
"                        END
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
"       -- RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no);
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
"        --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_ins_bom_scb(j).ribs_scb_prod_id);
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
"            SELECT NVL(MAX(mbrr_sub_seq_no),0) + 1
"
"          INTO v_res_seq_no
"
"          FROM migr_bom_rou_res
"
"         WHERE mbrr_bu        = p_bu
"
"           AND mbrr_plnt    = p_plnt
"
"           AND mbrr_doc_no    = p_doc_no
"
"           AND mbrr_seq_no    = r_bom_ln.mbl_seq_no;
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
"    --    RAISE_APPLICATION_ERROR(-20999,'HRM'||v_res);
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
"    END proc_ins_bom_migrate_ln;
"
"
"
"    PROCEDURE proc_ins_bom_migrate_ln_prd(
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
"                                          p_res     OUT  VARCHAR2
"
"                                          )
"
"        IS
"
"
"
"        v_create_table    VARCHAR2(4000);
"
"        v_insert_table    VARCHAR2(4000);
"
"
"
"        v_res  VARCHAR2(1);
"
"
"
"        BEGIN
"
"
"
"            DELETE migr_bom_ln_prd
"
"             WHERE mblp_bu         = p_bu
"
"               AND mblp_plnt     = p_plnt
"
"               AND mblp_doc_no     = p_doc_no;
"
"
"
"            v_res := 'N';
"
"
"
"                proc_drop_exist_table('EXCEL_MIGRATION_PRD');
"
"
"
"                    EXECUTE IMMEDIATE 'CREATE TABLE excel_migration_prd  (em_par_prod_id      VARCHAR2(25),
"
"                                                                         em_par_prod_rev     NUMBER(5),
"
"                                                                         em_prod_id          VARCHAR2(25),
"
"                                                                          em_prod_rev         NUMBER(5),
"
"                                                                          em_prod_desc          VARCHAR2(200),
"
"                                                                          em_uom          VARCHAR2(5),
"
"                                                                          em_sub_class          VARCHAR2(200),
"
"                                                                          em_bom_req          VARCHAR2(1),
"
"                                                                          em_abc_type          VARCHAR2(1),
"
"                                                                          em_item_type          VARCHAR2(1),
"
"                                                                          em_saleable          VARCHAR2(1),
"
"                                                                          em_lot_ser          VARCHAR2(1),
"
"                                                                          em_prod_type        VARCHAR2(25),
"
"                                                                          em_sco_type          VARCHAR2(25),
"
"                                                                          em_store_id          VARCHAR2(20),
"
"                                                                          em_req_qty          NUMBER(15,8)
"
"                                                                          )
"
"                                          ORGANIZATION EXTERNAL(
"
"                                                    TYPE ORACLE_LOADER
"
"                                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                        ACCESS PARAMETERS(
"
"                                                                  RECORDS DELIMITED BY NEWLINE
"
"                                                                  SKIP 1
"
"                                                                  FIELDS TERMINATED BY ''|''
"
"                                                                  MISSING FIELD VALUES ARE NULL
"
"                                                                  REJECT ROWS WITH ALL NULL FIELDS
"
"                                                                 (em_par_prod_id       CHAR(255),
"
"                                                                  em_par_prod_rev      CHAR(255),
"
"                                                                  em_prod_id           CHAR(255),
"
"                                                                  em_prod_rev          CHAR(255),
"
"                                                                  em_prod_desc           CHAR(255),
"
"                                                                  em_uom           CHAR(255),
"
"                                                                  em_sub_class           CHAR(255),
"
"                                                                  em_bom_req           CHAR(255),
"
"                                                                  em_abc_type           CHAR(255),
"
"                                                                  em_item_type           CHAR(255),
"
"                                                                  em_saleable           CHAR(255),
"
"                                                                  em_lot_ser           CHAR(255),
"
"                                                                  em_prod_type           CHAR(255),
"
"                                                                  em_sco_type           CHAR(255),
"
"                                                                  em_store_id           CHAR(255),
"
"                                                                  em_req_qty           CHAR(255)
"
"                                                                  )
"
"                                                          )
"
"                                          LOCATION ('''||p_file_name||''')
"
"                                          ) REJECT LIMIT UNLIMITED';
"
"
"
"              EXECUTE IMMEDIATE 'INSERT INTO migr_bom_ln_prd (SELECT ' || CHR (39)|| p_bu     || CHR (39) || ',
"
"                                                                       ' || CHR (39)|| p_plnt   || CHR (39) || ',
"
"                                                                       ' || CHR (39)|| p_doc_no || CHR (39) || ',
"
"                                                                        ROWNUM,
"
"                                                                        em_par_prod_id    ,
"
"                                                                        em_par_prod_rev,
"
"                                                                        em_prod_desc,
"
"                                                                        ' || CHR (39)|| '0001' || CHR (39) || ',
"
"                                                                        NULL,
"
"                                        NULL,
"
"                                        em_bom_req,
"
"                                                                        em_abc_type,
"
"                                                                        em_saleable,
"
"                                                                        em_lot_ser,
"
"                                                                        em_prod_type,
"
"                                                                        em_sco_type,
"
"                                                                        ROWNUM,
"
"                                                                        em_prod_id,
"
"                                                                        em_prod_rev,
"
"                                                                        em_uom,
"
"                                                                        em_store_id,
"
"                                                                        em_req_qty,
"
"                                                                        NULL,
"
"                                                                        '|| CHR (39)|| p_user || CHR (39) || ',
"
"                                                                        SYSDATE           ,
"
"                                                                        NULL,
"
"                                                                        NULL ,
"
"                                                                        em_item_type,
"
"                                                                        NULL,
"
"                                                                        '|| CHR (39)|| 'N' || CHR (39) || ',
"
"                                                                         NULL ,
"
"                                                                         NULL       ,
"
"                                                                         NULL,
"
"                                                                         NULL ,
"
"                                                                         NULL,
"
"                                                                         NULL         ,
"
"                                                                         NULL          ,
"
"                                                                         NULL            ,
"
"                                                                         NULL            ,
"
"                                                                         '|| CHR (39)|| 'A' || CHR (39) || '  ,
"
"                                                                         NULL,
"
"                                                                         NULL ,
"
"                                                                         NULL,
"
"                                              0,
"
"                                              0,
"
"                                              0,
"
"                                              em_sub_class,
"
"                                              NULL
"
"                                                                    FROM excel_migration_prd
"
"                                                                     )';
"
"
"
"                v_res := 'Y';
"
"
"
"                proc_drop_exist_table('EXCEL_MIGRATION_PRD');
"
"
"
"                p_res := v_res;
"
"
"
"    END proc_ins_bom_migrate_ln_prd;
"
"
"
"
"
"    PROCEDURE proc_ins_eqpmt_mig_det(
"
"                                     p_bu           VARCHAR2,
"
"                                     p_plnt         VARCHAR2,
"
"                                     p_doc_no       VARCHAR2,
"
"                                     p_file_name    VARCHAR2,
"
"                                     p_user         VARCHAR2
"
"                                    )
"
"    IS
"
"
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"
"
"    BEGIN
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        v_create_table := 'CREATE TABLE EXCEL_MIGRATION( em_eqpmt_id             VARCHAR2(25),
"
"                                                         em_eqpmt_desc1          VARCHAR2(50),
"
"                                                         em_eqpmt_desc2          VARCHAR2(50),
"
"                                                         em_sub_cat_id           VARCHAR2(50),
"
"                                                         em_cat_id               VARCHAR2(50),
"
"                                                         em_dept_id              VARCHAR2(50),
"
"                                                         em_sub_loc_id           VARCHAR2(50),
"
"                                                         em_loc_id               VARCHAR2(50),
"
"                                                         em_plnr_pos_id          VARCHAR2(15),
"
"                                                         em_ef_type              VARCHAR2(2),
"
"                                                         em_group_id             VARCHAR2(50),
"
"                                                         em_purchase_date        DATE,
"
"                                                         em_func_date            DATE
"
"                                                        )
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
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                           em_eqpmt_id            CHAR(255),
"
"                                                           em_eqpmt_desc1        CHAR(255),
"
"                                                           em_eqpmt_desc2        CHAR(255),
"
"                                                           em_sub_cat_id        CHAR(255),
"
"                                                           em_cat_id            CHAR(255),
"
"                                                           em_dept_id            CHAR(255),
"
"                                                           em_sub_loc_id        CHAR(255),
"
"                                                           em_loc_id            CHAR(255),
"
"                                                           em_plnr_pos_id        CHAR(255),
"
"                                                           em_ef_type            CHAR(255),
"
"                                                           em_group_id            CHAR(255),
"
"                                                           em_purchase_date        CHAR(255)     DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                           em_func_date            CHAR(255)    DATE_FORMAT DATE MASK ''DD-MON-YY''
"
"                                                          )
"
"                                            )
"
"                                  LOCATION ('''||p_file_name||''')
"
"                                  ) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE v_create_table;
"
"
"
" --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_create_table);
"
"
"
"        v_insert_table    := 'INSERT INTO eqpmt_mig_det(SELECT  '|| CHR (39)|| p_bu     || CHR (39) ||',
"
"                                                              '|| CHR (39)|| p_plnt   || CHR (39) ||',
"
"                                                              '|| CHR (39)|| p_doc_no || CHR (39) ||',
"
"                                                              ROWNUM,
"
"                                                              em_eqpmt_id,
"
"                                                              em_eqpmt_desc1,
"
"                                                              em_eqpmt_desc2,
"
"                                                              em_sub_cat_id,
"
"                                                              em_cat_id,
"
"                                                              em_dept_id,
"
"                                                              em_sub_loc_id,
"
"                                                              em_loc_id,
"
"                                                              em_plnr_pos_id,
"
"                                                              em_ef_type,
"
"                                                              em_group_id,
"
"                                                              em_purchase_date,
"
"                                                              em_func_date,
"
"                                                              '|| CHR (39)|| p_user || CHR (39) || ',
"
"                                                              SYSDATE,
"
"                                                              NULL,
"
"                                                              NULL
"
"                                                         FROM EXCEL_MIGRATION
"
"                                                          )';
"
"       --     RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||p_bu||'-'||p_plnt||'-'||p_doc_no||'-'||v_insert_table);
"
"
"
"        EXECUTE IMMEDIATE v_insert_table;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"    END proc_ins_eqpmt_mig_det;
"
"
"
"    PROCEDURE proc_ins_migr_fcast_det(
"
"                                     p_bu               VARCHAR2,
"
"                                     p_plnt             VARCHAR2,
"
"                                     p_fcast_no         VARCHAR2,
"
"                                     p_fcast_rev        NUMBER,
"
"                                     p_firm_st_date        DATE,
"
"                                     p_firm_ed_date        DATE,
"
"                                     p_tent_st_date        DATE,
"
"                                     p_tent_ed_date        DATE,
"
"                                     p_file_name        VARCHAR2,
"
"                                     p_user             VARCHAR2,
"
"                                     p_res    OUT       VARCHAR2
"
"                                     )
"
"    IS
"
"
"
"    TYPE r_fcast IS RECORD (
"
"                            em_prod_id          VARCHAR2(25),
"
"                            em_prod_rev         NUMBER(5),
"
"                            em_cust_id          VARCHAR2(10),
"
"                            em_cust_name          VARCHAR2(100),
"
"                            em_fcast_qty         NUMBER(12,3),
"
"                            em_tent_qty          NUMBER(12,3),
"
"                            em_bucket            VARCHAR2(1),
"
"                            em_fcast_grp_desc     VARCHAR2(150)
"
"                            );
"
"
"
"    TYPE t_fcast IS TABLE OF r_fcast INDEX BY PLS_INTEGER;
"
"
"
"    tr_fcast             t_fcast;
"
"
"
"    v_create_table        VARCHAR2(4000);
"
"    v_insert_table        VARCHAR2(4000);
"
"    v_check             VARCHAR2(4000);
"
"    v_seq_no              mfg_sales_forecast_ln.msfln_seq_no%TYPE;
"
"    v_fcast_grp              VARCHAR2(10);
"
"    v_cnt                    NUMBER;
"
"    v_res                VARCHAR2(1) := 'N';
"
"    v_excep                VARCHAR2(4000);
"
"
"
"    BEGIN
"
"
"
"        DELETE mfg_sales_forecast_ln
"
"         WHERE msfln_bu          = p_bu
"
"           AND msfln_plnt       = p_plnt
"
"           AND msfln_fcast_no     = p_fcast_no
"
"           AND msfln_fcast_rev     = p_fcast_rev;
"
"
"
"        DELETE mfg_sales_forecast_excep
"
"         WHERE msfe_bu          = p_bu
"
"           AND msfe_plnt           = p_plnt
"
"           AND msfe_fcast_no     = p_fcast_no
"
"           AND msfe_fcast_rev     = p_fcast_rev;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION(em_prod_id          VARCHAR2(25),
"
"                                                        em_prod_rev         NUMBER(5),
"
"                                                        em_cust_id          VARCHAR2(10),
"
"                                                        em_cust_name          VARCHAR2(100),
"
"                                                        em_fcast_qty         NUMBER(12,3),
"
"                                                        em_tent_qty          NUMBER(12,3),
"
"                                                        em_bucket            VARCHAR2(1),
"
"                                                        em_fcast_grp_desc     VARCHAR2(150)
"
"                                                        )
"
"                                    ORGANIZATION EXTERNAL(
"
"                                    TYPE ORACLE_LOADER
"
"                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                        ACCESS PARAMETERS(
"
"                                                          RECORDS DELIMITED BY NEWLINE
"
"                                                          SKIP 1
"
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                           em_prod_id                CHAR(255),
"
"                                                           em_prod_rev               CHAR(255),
"
"                                                           em_cust_id                CHAR(255),
"
"                                                           em_cust_name                CHAR(255),
"
"                                                           em_fcast_qty              CHAR(255),
"
"                                                           em_tent_qty                CHAR(255),
"
"                                                           em_bucket                CHAR(255),
"
"                                                           em_fcast_grp_desc        CHAR(255)
"
"                                                          )
"
"                                                        )
"
"                                              LOCATION ('''||p_file_name||''')
"
"                                              ) REJECT LIMIT UNLIMITED';
"
"
"
"
"
"        EXECUTE IMMEDIATE 'SELECT *
"
"                             FROM excel_migration
"
"                            ORDER BY em_prod_id' BULK COLLECT INTO tr_fcast;
"
"
"
"        FOR i IN 1..tr_fcast.COUNT()
"
"        LOOP
"
"
"
"            SELECT NVL(MAX(msfe_seq_no),0) + 1
"
"              INTO v_seq_no
"
"              FROM mfg_sales_forecast_excep
"
"             WHERE msfe_bu             = p_bu
"
"               AND msfe_plnt         = p_plnt
"
"               AND msfe_fcast_no     = p_fcast_no
"
"               AND msfe_fcast_rev     = p_fcast_rev;
"
"
"
"            IF tr_fcast(i).em_fcast_grp_desc IS NOT NULL THEN
"
"
"
"
"
"                IF v_cnt = 0 THEN
"
"                    v_excep := 'FORECAST GROUP NOT FOUND.';
"
"                END IF;
"
"
"
"
"
"
"
"            END IF;
"
"
"
"            IF tr_fcast(i).em_cust_id IS NOT NULL THEN
"
"
"
"                SELECT COUNT(*)
"
"                  INTO v_cnt
"
"                  FROM SUPPLIERS
"
"                 WHERE SUPLR_BU         = p_bu
"
"                   AND SUPLR_SUPLR_ID     = tr_fcast(i).em_cust_id
"
"                   AND SUPLR_STATUS     = 'A';
"
"
"
"                IF v_cnt = 0 THEN
"
"                    v_excep := v_excep||' / '||'CUSTOMER NOT FOUND.';
"
"                END IF;
"
"
"
"            END IF;
"
"
"
"            IF tr_fcast(i).em_bucket NOT IN ('D','W','M') THEN
"
"                v_excep := v_excep||' / '||'BUCKET TYPE NOT FOUND.';
"
"            END IF;
"
"
"
"            IF tr_fcast(i).em_fcast_qty IS NULL THEN
"
"                v_excep := v_excep||' / '||'FIRM QUANTITY SHOULD NOT BE NULL.';
"
"            END IF;
"
"
"
"            IF tr_fcast(i).em_tent_qty IS NULL THEN
"
"                v_excep := v_excep||' / '||'TENTATIVE QUANTITY SHOULD NOT BE NULL.';
"
"            END IF;
"
"
"
"            IF p_firm_st_date IS NOT NULL AND p_firm_ed_date IS NOT NULL THEN
"
"                IF tr_fcast(i).em_fcast_qty = 0 THEN
"
"                    v_excep := v_excep||' / '||'FIRM QUANTITY SHOULD BE GREATER THAN ZERO.';
"
"                END IF;
"
"            END IF;
"
"
"
"            IF p_tent_st_date IS NOT NULL AND p_tent_ed_date IS NOT NULL THEN
"
"                IF tr_fcast(i).em_tent_qty = 0 THEN
"
"                    v_excep := v_excep||' / '||'TENTATIVE QUANTITY SHOULD BE GREATER THAN ZERO.';
"
"                END IF;
"
"            END IF;
"
"
"
"            IF tr_fcast(i).em_prod_id IS NOT NULL THEN
"
"
"
"                SELECT COUNT(*)
"
"                  INTO v_cnt
"
"                  FROM products
"
"                 WHERE prod_bu         = p_bu
"
"                   AND prod_id         = tr_fcast(i).em_prod_id
"
"                   AND prod_rev     = tr_fcast(i).em_prod_rev
"
"                   AND prod_status     = 'A';
"
"
"
"                IF v_cnt = 0 THEN
"
"                       v_excep := v_excep||' / '||'ITEM NOT FOUND.';
"
"                END IF;
"
"
"
"            ELSE
"
"                v_excep := v_excep||' / '||'ITEM SHOULD NOT BE NULL.';
"
"            END IF;
"
"
"
"            IF v_excep IS NOT NULL THEN
"
"
"
"                INSERT INTO mfg_sales_forecast_excep(
"
"                                                     msfe_bu                ,
"
"                                                     msfe_plnt              ,
"
"                                                     msfe_fcast_no          ,
"
"                                                     msfe_fcast_rev         ,
"
"                                                     msfe_seq_no            ,
"
"                                                     msfe_prod_id           ,
"
"                                                     msfe_prod_rev          ,
"
"                                                     msfe_prod_desc         ,
"
"                                                     msfe_bucket            ,
"
"                                                     msfe_cust_id           ,
"
"                                                     msfe_cust_name         ,
"
"                                                     msfe_fcast_qty         ,
"
"                                                     msfe_tent_qty          ,
"
"                                                     msfe_fcast_grp           ,
"
"                                                     msfe_fcast_grp_desc    ,
"
"                                                     msfe_ref                ,
"
"                                                     msfe_cre_by            ,
"
"                                                     msfe_cre_ip_addr       ,
"
"                                                     msfe_cre_os_user       ,
"
"                                                     msfe_cre_emp_id        ,
"
"                                                     msfe_cre_date
"
"                                                     )
"
"                                                  VALUES(
"
"                                                         p_bu,--msfe_bu                ,
"
"                                                         p_plnt,--msfe_plnt              ,
"
"                                                         p_fcast_no,--msfe_fcast_no          ,
"
"                                                         p_fcast_rev,--msfe_fcast_rev         ,
"
"                                                         v_seq_no,--msfe_seq_no            ,
"
"                                                         tr_fcast(i).em_prod_id,--msfe_prod_id           ,
"
"                                                         tr_fcast(i).em_prod_rev,--msfe_prod_rev          ,
"
"                                                         func_find_prod_qry_desc(p_bu,tr_fcast(i).em_prod_id,tr_fcast(i).em_prod_rev,1),--msfe_prod_desc         ,
"
"                                                         tr_fcast(i).em_bucket,--msfe_bucket            ,
"
"                                                         tr_fcast(i).em_cust_id,--msfe_cust_id           ,
"
"                                                         tr_fcast(i).em_cust_name,--msfe_cust_name         ,
"
"                                                         NVL(tr_fcast(i).em_fcast_qty,0),--msfe_fcast_qty         ,
"
"                                                         NVL(tr_fcast(i).em_tent_qty,0),--msfe_tent_qty          ,
"
"                                                         v_fcast_grp,--msfe_fcast_grp           ,
"
"                                                         TRIM(tr_fcast(i).em_fcast_grp_desc),--msfe_fcast_grp_desc    ,
"
"                                                         TRIM(LTRIM(TRIM(v_excep),'/')),--msfe_ref                ,
"
"                                                         p_user,--msfe_cre_by            ,
"
"                                                         audit_info.get_ip_address,--msfe_cre_ip_addr       ,
"
"                                                         audit_info.get_os_user,--msfe_cre_os_user       ,
"
"                                                         func_find_emp_id(p_bu,p_user),--msfe_cre_emp_id        ,
"
"                                                         SYSDATE--msfe_cre_date
"
"                                                         );
"
"
"
"            END IF;
"
"
"
"        END LOOP i;
"
"
"
"        SELECT COUNT(*)
"
"          INTO v_cnt
"
"          FROM mfg_sales_forecast_excep
"
"         WHERE msfe_bu          = p_bu
"
"           AND msfe_plnt           = p_plnt
"
"           AND msfe_fcast_no     = p_fcast_no
"
"           AND msfe_fcast_rev     = p_fcast_rev;
"
"
"
"        IF v_cnt > 0 THEN
"
"            v_res := 'N';
"
"        ELSE
"
"            v_res := 'Y';
"
"        END IF;
"
"
"
"        IF v_res = 'Y' THEN
"
"
"
"            FOR i IN 1..tr_fcast.COUNT()
"
"            LOOP
"
"
"
"                SELECT NVL(MAX(msfln_seq_no),0) + 1
"
"                  INTO v_seq_no
"
"                  FROM mfg_sales_forecast_ln
"
"                 WHERE msfln_bu         = p_bu
"
"                   AND msfln_plnt         = p_plnt
"
"                   AND msfln_fcast_no     = p_fcast_no
"
"                   AND msfln_fcast_rev     = p_fcast_rev;
"
"
"
"                INSERT INTO mfg_sales_forecast_ln(
"
"                                                  msfln_bu             ,
"
"                                                  msfln_plnt           ,
"
"                                                  msfln_fcast_no       ,
"
"                                                  msfln_seq_no         ,
"
"                                                  msfln_prod_id        ,
"
"                                                  msfln_prod_rev       ,
"
"                                                  msfln_sales_area     ,
"
"                                                  msfln_terr_id        ,
"
"                                                  msfln_sub_terr_id    ,
"
"                                                  msfln_sales_person   ,
"
"                                                  msfln_bucket         ,
"
"                                                  msfln_fcast_qty      ,
"
"                                                  msfln_cust_id        ,
"
"                                                  msfln_cre_by         ,
"
"                                                  msfln_cre_date       ,
"
"                                                  msfln_fcast_rev      ,
"
"                                                  msfln_tent_qty       ,
"
"                                                  msfln_fcast_level    ,
"
"                                                  msfln_fcast_group    ,
"
"                                                  msfln_cat_id
"
"                                                  )
"
"                                                  VALUES(
"
"                                                          p_bu             ,
"
"                                                          p_plnt           ,
"
"                                                          p_fcast_no       ,
"
"                                                          v_seq_no         ,
"
"                                                          tr_fcast(i).em_prod_id       ,
"
"                                                          tr_fcast(i).em_prod_rev       ,
"
"                                                          NULL     ,
"
"                                                          NULL        ,
"
"                                                          NULL    ,
"
"                                                          NULL   ,
"
"                                                          tr_fcast(i).em_bucket         ,
"
"                                                          NVL(tr_fcast(i).em_fcast_qty,0)      ,
"
"                                                          tr_fcast(i).em_cust_id        ,
"
"                                                          p_user         ,
"
"                                                          SYSDATE       ,
"
"                                                          p_fcast_rev      ,
"
"                                                          NVL(tr_fcast(i).em_tent_qty,0)       ,
"
"                                                          'I' ,
"
"                                                          v_fcast_grp    ,
"
"                                                          NULL
"
"                                                         );
"
"
"
"                v_res := 'Y';
"
"
"
"            END LOOP i;
"
"
"
"        END IF;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        p_res := v_res;
"
"
"
"    END proc_ins_migr_fcast_det;
"
"
"
"    PROCEDURE proc_ins_migr_fcast_plan_det(
"
"                                           p_bu               VARCHAR2,
"
"                                           p_doc_no           VARCHAR2,
"
"                                           p_doc_rev        NUMBER,
"
"                                           p_doc_date        DATE,
"
"                                           p_file_name        VARCHAR2,
"
"                                           p_user             VARCHAR2,
"
"                                           p_res        OUT    VARCHAR2
"
"                                           )
"
"    IS
"
"
"
"
"
"
"
"    v_create_table        VARCHAR2(4000);
"
"    v_insert_table        VARCHAR2(4000);
"
"    v_excep                VARCHAR2(4000);
"
"    v_res                VARCHAR2(1) := 'N';
"
"    v_cnt                NUMBER;
"
"
"
"    BEGIN
"
"
"
"      /*  DELETE fcast_plan_ln
"
"         WHERE fpl_bu         = p_bu
"
"           AND fpl_doc_no     = p_doc_no
"
"           AND fpl_doc_rev     = p_doc_rev;
"
"
"
"        DELETE fcast_plan_excep
"
"         WHERE fpe_bu         = p_bu
"
"           AND fpe_doc_no     = p_doc_no
"
"           AND fpe_doc_rev     = p_doc_rev;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION(em_fin_year         NUMBER(6),
"
"                                                        em_fin_period        NUMBER(2),
"
"                                                        em_prod_id          VARCHAR2(25),
"
"                                                        em_prod_rev         VARCHAR2(5),
"
"                                                        em_act_dem_qty      NUMBER(12,3)
"
"                                                        )
"
"                                    ORGANIZATION EXTERNAL(
"
"                                    TYPE ORACLE_LOADER
"
"                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                        ACCESS PARAMETERS(
"
"                                                          RECORDS DELIMITED BY NEWLINE
"
"                                                          SKIP 1
"
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                           em_fin_year             CHAR(255),
"
"                                                           em_fin_period         CHAR(255),
"
"                                                           em_prod_id              CHAR(255),
"
"                                                           em_prod_rev             CHAR(255),
"
"                                                           em_act_dem_qty          CHAR(255)
"
"                                                          )
"
"                                                        )
"
"                                              LOCATION ('''||p_file_name||''')
"
"                                              ) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE 'SELECT '''||p_bu||''',
"
"                                  '''||p_doc_no||''',
"
"                                  '''||p_doc_rev||''',
"
"                                  em_fin_year,
"
"                                  em_fin_period,
"
"                                  NULL,
"
"                                  em_prod_id,
"
"                                  em_prod_rev,
"
"                                  em_act_dem_qty,
"
"                                  ROWNUM,
"
"                                  '''||p_user||''',
"
"                                  '''||audit_info.get_ip_address||''',
"
"                                  '''||audit_info.get_os_user||''',
"
"                                  SYSDATE,
"
"                                  NULL,
"
"                                  NULL,
"
"                                  NULL,
"
"                                  NULL,
"
"                                  '''||func_find_emp_id(p_bu,p_user)||''',
"
"                                  NULL
"
"                             FROM excel_migration' BULK COLLECT INTO r_fcast;
"
"
"
"        FOR i IN 1..r_fcast.COUNT()
"
"        LOOP
"
"
"
"            IF r_fcast(i).fpl_fin_year IS NULL THEN
"
"                v_excep := 'FINANCIAL YEAR SHOULD NOT BE NULL.';
"
"            ELSE
"
"
"
"                SELECT COUNT(*)
"
"                  INTO v_cnt
"
"                  FROM fin_years
"
"                 WHERE fy_bu        = p_bu
"
"                   AND fy_year        = TRIM(r_fcast(i).fpl_fin_year)
"
"                   AND (TRUNC(p_doc_date) BETWEEN TRUNC(fy_start_date) AND TRUNC(fy_end_date))
"
"                   AND fy_status     = 'U';
"
"
"
"                IF v_cnt = 0 THEN
"
"                    v_excep := 'FINANCIAL YEAR NOT FOUND.';
"
"                END IF;
"
"
"
"            END IF;
"
"
"
"            IF r_fcast(i).fpl_fin_period IS NULL THEN
"
"                v_excep := v_excep||' / '||'FINANCIAL PERIOD SHOULD NOT BE NULL.';
"
"            ELSIF r_fcast(i).fpl_fin_period NOT IN (1,2,3,4,5,6,7,8,9,10,11,12) THEN
"
"                v_excep := v_excep||' / '||'FINANCIAL PERIOD NOT FOUND.';
"
"            END IF;
"
"
"
"            IF r_fcast(i).fpl_prod_id IS NULL THEN
"
"                v_excep := v_excep||' / '||'ITEM SHOULD NOT BE NULL.';
"
"            ELSE
"
"
"
"                SELECT COUNT(*)
"
"                  INTO v_cnt
"
"                  FROM products
"
"                 WHERE prod_bu        = p_bu
"
"                   AND prod_id        = r_fcast(i).fpl_prod_id
"
"                   AND prod_rev        = r_fcast(i).fpl_prod_rev
"
"                   AND prod_status    = 'A';
"
"
"
"                IF v_cnt = 0 THEN
"
"                    v_excep := v_excep||' / '||'ITEM NOT FOUND.';
"
"                END IF;
"
"
"
"            END IF;
"
"
"
"            IF r_fcast(i).fpl_act_dem_qty IS NULL THEN
"
"                v_excep := v_excep||' / '||'ACTUAL DEMAND QUANTITY SHOULD NOT BE NULL.';
"
"            ELSIF r_fcast(i).fpl_act_dem_qty = 0 THEN
"
"                v_excep := v_excep||' / '||'ACTUAL DEMAND QUANTITY SHOULD BE GREATER THAN ZERO.';
"
"            END IF;
"
"
"
"            IF v_excep IS NOT NULL THEN
"
"
"
"                INSERT INTO fcast_plan_excep(
"
"                                             fpe_bu           ,
"
"                                             fpe_doc_no       ,
"
"                                             fpe_doc_rev      ,
"
"                                             fpe_seq_no       ,
"
"                                             fpe_fin_year     ,
"
"                                             fpe_fin_period   ,
"
"                                             fpe_prod_id      ,
"
"                                             fpe_prod_rev     ,
"
"                                             fpe_prod_desc    ,
"
"                                             fpe_act_dem_qty  ,
"
"                                             fpe_ref          ,
"
"                                             fpe_cre_by       ,
"
"                                             fpe_cre_ip_addr  ,
"
"                                             fpe_cre_os_user  ,
"
"                                             fpe_cre_emp_id   ,
"
"                                             fpe_cre_date
"
"                                             )
"
"                                             VALUES(
"
"                                                    p_bu,--fpe_bu           ,
"
"                                                    p_doc_no,--fpe_doc_no       ,
"
"                                                    p_doc_rev,--fpe_doc_rev      ,
"
"                                                    r_fcast(i).fpl_seq_no,--fpe_seq_no      ,
"
"                                                    r_fcast(i).fpl_fin_year,--fpe_fin_year     ,
"
"                                                    r_fcast(i).fpl_fin_period,--fpe_fin_period   ,
"
"                                                    r_fcast(i).fpl_prod_id,--fpe_prod_id     ,
"
"                                                    r_fcast(i).fpl_prod_rev,--fpe_prod_rev    ,
"
"                                                    func_find_prod_qry_desc(p_bu,r_fcast(i).fpl_prod_id,r_fcast(i).fpl_prod_rev,1),--fpe_prod_desc,
"
"                                                    NVL(r_fcast(i).fpl_act_dem_qty,0),--fpe_act_dem_qty  ,
"
"                                                    TRIM(LTRIM(TRIM(v_excep),'/')),--fpe_ref,
"
"                                                    p_user,--fpe_cre_by       ,
"
"                                                    audit_info.get_ip_address,--fpe_cre_ip_addr  ,
"
"                                                    audit_info.get_os_user,--fpe_cre_os_user  ,
"
"                                                    func_find_emp_id(p_bu,p_user),--fpe_cre_emp_id   ,
"
"                                                    SYSDATE--fpe_cre_date
"
"                                                    );
"
"
"
"            END IF;
"
"
"
"        END LOOP i;
"
"
"
"        SELECT COUNT(*)
"
"          INTO v_cnt
"
"          FROM fcast_plan_excep
"
"         WHERE fpe_bu        = p_bu
"
"           AND fpe_doc_no    = p_doc_no
"
"           AND fpe_doc_rev    = p_doc_rev;
"
"
"
"        IF v_cnt > 0 THEN
"
"            v_res := 'N';
"
"        ELSE
"
"            v_res := 'Y';
"
"        END IF;
"
"
"
"        IF v_res = 'Y' THEN
"
"
"
"            FOR i IN 1..r_fcast.COUNT()
"
"            LOOP
"
"
"
"                INSERT INTO fcast_plan_ln(
"
"                                          fpl_bu           ,
"
"                                          fpl_doc_no       ,
"
"                                          fpl_doc_rev      ,
"
"                                          fpl_fin_year     ,
"
"                                          fpl_fin_period   ,
"
"                                          fpl_date         ,
"
"                                          fpl_prod_id      ,
"
"                                          fpl_prod_rev     ,
"
"                                          fpl_act_dem_qty  ,
"
"                                          fpl_seq_no       ,
"
"                                          fpl_cre_by       ,
"
"                                          fpl_cre_ip_addr  ,
"
"                                          fpl_cre_os_user  ,
"
"                                          fpl_cre_emp_id   ,
"
"                                          fpl_cre_date
"
"                                          )
"
"                                          VALUES(
"
"                                                 p_bu,--fpl_bu           ,
"
"                                                 p_doc_no,--fpl_doc_no       ,
"
"                                                 p_doc_rev,--fpl_doc_rev      ,
"
"                                                 r_fcast(i).fpl_fin_year,--fpl_fin_year     ,
"
"                                                 r_fcast(i).fpl_fin_period,--fpl_fin_period   ,
"
"                                                 NULL,--fpl_date         ,
"
"                                                 r_fcast(i).fpl_prod_id,--fpl_prod_id     ,
"
"                                                 r_fcast(i).fpl_prod_rev,--fpl_prod_rev    ,
"
"                                                 r_fcast(i).fpl_act_dem_qty,--fpl_act_dem_qty  ,
"
"                                                 r_fcast(i).fpl_seq_no,--fpl_seq_no      ,
"
"                                                 p_user,--fpl_cre_by       ,
"
"                                                 audit_info.get_ip_address,--fpl_cre_ip_addr  ,
"
"                                                 audit_info.get_os_user,--fpl_cre_os_user  ,
"
"                                                 func_find_emp_id(p_bu,p_user),--fpl_cre_emp_id   ,
"
"                                                 SYSDATE--fpl_cre_date
"
"                                                 );
"
"
"
"                v_res := 'Y';
"
"
"
"            END LOOP i;
"
"
"
"        END IF;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        p_res := v_res;*/
"
"        NULL;
"
"
"
"    END proc_ins_migr_fcast_plan_det;
"
"
"
"    PROCEDURE proc_upload_mfg_res_groups(p_bu                VARCHAR2,
"
"                                         p_dir                VARCHAR2,
"
"                                         p_file_name        VARCHAR2,
"
"                                         p_user                VARCHAR2,
"
"                                         p_res            OUT    VARCHAR2
"
"                                         )
"
"    IS
"
"    CURSOR c_exe
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mfg_res_groups_exception
"
"     WHERE mfgrge_bu       = p_bu
"
"       AND mfgrge_sel_user = p_user;
"
"
"
"   cr_exe            c_exe%ROWTYPE;
"
"
"
"   v_create_table    VARCHAR2(4000);
"
"   v_insert_table    VARCHAR2(4000);
"
"   v_result            VARCHAR2(1) := 'N';
"
"   p_status            VARCHAR2(1) := 'N';
"
"   v_res_id            VARCHAR2(10);
"
"
"
"BEGIN
"
"
"
"   proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"   DELETE
"
"     FROM mfg_res_groups_exception
"
"    WHERE mfgrge_bu       = p_bu
"
"      AND mfgrge_sel_user = p_user;
"
"
"
"
"
"        v_create_table := 'CREATE TABLE MFG_RES_GROUP_TEMP(em_plnt           VARCHAR2(10),
"
"                                                           em_desc1          VARCHAR2(30),
"
"                                                           em_res_type       VARCHAR2(1),
"
"                                                           em_charge_type    VARCHAR2(1),
"
"                                                           em_sub_elmnt      VARCHAR2(50),
"
"                                                           em_unit_rate      NUMBER(15,3),
"
"                                                           em_uom            VARCHAR2(5),
"
"                                                           em_no_of_units    NUMBER(5),
"
"                                                           em_utilization    NUMBER(5,3),
"
"                                                           em_efficiency     NUMBER(5,3),
"
"                                                           em_track_pvty     VARCHAR2(1),
"
"                                                           em_next_id_source VARCHAR2(1),
"
"                                                           em_next_id        VARCHAR2(10),
"
"                                                           em_acct_plnt      VARCHAR2(10),
"
"                                                           em_lvl1           VARCHAR2(4),
"
"                                                           em_lvl2           VARCHAR2(4),
"
"                                                           em_lvl3           VARCHAR2(4),
"
"                                                           em_lvl4           VARCHAR2(4),
"
"                                                           em_currnt_acct    VARCHAR2(20)
"
"                                                           )
"
"                                          ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                                         SKIP 1
"
"                                                         FIELDS TERMINATED BY ''|''
"
"                                                         MISSING FIELD VALUES ARE NULL
"
"                                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                                        (em_plnt           CHAR(255),
"
"                                                         em_desc1          CHAR(255),
"
"                                                         em_res_type       CHAR(255),
"
"                                                         em_charge_type    CHAR(255),
"
"                                                         em_sub_elmnt      CHAR(255),
"
"                                                         em_unit_rate      CHAR(255),
"
"                                                         em_uom            CHAR(255),
"
"                                                         em_no_of_units    CHAR(255),
"
"                                                         em_utilization    CHAR(255),
"
"                                                         em_efficiency     CHAR(255),
"
"                                                         em_track_pvty     CHAR(255),
"
"                                                         em_next_id_source CHAR(255),
"
"                                                         em_next_id        CHAR(255),
"
"                                                         em_acct_plnt      CHAR(255),
"
"                                                         em_lvl1           CHAR(255),
"
"                                                         em_lvl2           CHAR(255),
"
"                                                         em_lvl3           CHAR(255),
"
"                                                         em_lvl4           CHAR(255),
"
"                                                         em_currnt_acct    CHAR(255)
"
"                                                          ))
"
"                     LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE v_create_table;
"
"
"
"        v_insert_table := 'INSERT INTO mfg_res_groups_exception (SELECT '|| CHR(39) || p_bu     || CHR(39) ||','||'
"
"                                                                    em_plnt          ,
"
"                                                                    NULL       ,
"
"                                                                    em_desc1         ,
"
"                                                                    em_desc1         ,
"
"                                                                    em_res_type      ,'
"
"                                                                    ||CHR(39) || 'OH' || CHR(39)||','||'
"
"                                                                    em_unit_rate     ,
"
"                                                                    em_lvl1          ,
"
"                                                                    em_lvl2          ,
"
"                                                                    em_lvl3          ,
"
"                                                                    em_lvl4          ,
"
"                                                                    em_currnt_acct   ,
"
"                                                                    em_uom           ,
"
"                                                                    em_track_pvty    ,
"
"                                                                    em_sub_elmnt     ,'
"
"                                                                    ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                                    em_charge_type   ,'
"
"                                                                    ||CHR(39) || p_user   || CHR(39)||','||'
"
"                                                                    SYSDATE,
"
"                                                                    NULL,
"
"                                                                    NULL,
"
"                                                                    em_no_of_units,'
"
"                                                                    ||CHR(39) || 'AC' || CHR(39)||','||'
"
"                                                                    em_efficiency,
"
"                                                                    em_utilization,
"
"                                                                    em_acct_plnt,
"
"                                                                    em_next_id  ,
"
"                                                                    em_next_id_source,'
"
"                                                                    ||CHR(39) || p_status || CHR(39)||','||'
"
"                                                                    NULL,'
"
"                                                                    ||CHR(39) || p_user   || CHR(39)||',
"
"                                                                    NULL
"
"                                                               FROM excel_migration)';
"
"
"
"    EXECUTE IMMEDIATE v_insert_table;
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    OPEN c_exe;
"
"    FETCH c_exe INTO cr_exe;
"
"
"
"      IF cr_exe.v_cnt = 0 THEN
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
"    CLOSE c_exe;
"
"
"
"    p_res := v_result;
"
"
"
"    END    proc_upload_mfg_res_groups;
"
"
"
"    PROCEDURE proc_chk_res_group
"
"                                (p_bu    VARCHAR2,
"
"                                 p_user  VARCHAR2,
"
"                                 p_res   OUT VARCHAR2
"
"                                )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mfg_res_groups_exception
"
"     WHERE mfgrge_bu       = p_bu
"
"       AND mfgrge_sel_user = p_user
"
"       AND mfgrge_status   = 'N';
"
"
"
"    CURSOR c2(c_plnt VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM bus_unit_plants
"
"     WHERE bup_bu       = p_bu
"
"       AND bup_plant_id = c_plnt;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mfgrge_bu,
"
"           mfgrge_plnt,
"
"           mfgrge_desc1,
"
"           COUNT (*)
"
"      FROM mfg_res_groups_exception
"
"     WHERE mfgrge_bu       = p_bu
"
"       AND mfgrge_sel_user = p_user
"
"    GROUP BY mfgrge_bu, mfgrge_plnt, mfgrge_desc1
"
"    HAVING COUNT (*) > 1;
"
"
"
"
"
"    CURSOR c4(c_plnt VARCHAR2,c_grp_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM mfg_res_groups
"
"     WHERE mfgrg_bu     = p_bu
"
"       AND mfgrg_plnt   = c_plnt
"
"       AND mfgrg_desc1 = c_grp_id;
"
"
"
"    CURSOR c5(c_sub_elmnt_id VARCHAR2)
"
"        IS
"
"    SELECT cse_elmnt_desc1, cse_sub_elmnt_id
"
"      FROM cost_sub_elements
"
"     WHERE cse_bu           = p_bu
"
"       AND cse_sub_elmnt_id = c_sub_elmnt_id
"
"       AND cse_elmnt_id NOT IN
"
"                       (SELECT ce_elmnt_id
"
"                          FROM cost_elements
"
"                         WHERE ce_elmnt_type IN ('IM', 'DM')
"
"                           AND ce_bu = p_bu);
"
"
"
"    CURSOR c6(c_uom VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM unit_of_measures
"
"     WHERE uom_bu  = p_bu
"
"       AND uom_uom = c_uom
"
"       AND uom_type IN ('T', 'O');
"
"
"
"
"
"    /*CURSOR c7(c_lvl1 VARCHAR2,c_lvl2 VARCHAR2,c_lvl3 VARCHAR2,c_lvl4 VARCHAR2,c_acct VARCHAR2,c_acct_plnt VARCHAR2)
"
"        IS
"
"    SELECT glal_lvl1,
"
"           glal_lvl2,
"
"           glal_lvl3,
"
"           glal_lvl4,
"
"           glal_acct,
"
"           glal_plant
"
"      FROM gl_lvl_accounts
"
"     WHERE glal_bu       = p_bu
"
"       AND func_find_acct_valid (glal_bu, glal_acct) = 'Y'
"
"       AND glal_opt_type = 'S'
"
"       AND glal_status   = 'A'
"
"       AND glal_lvl1     = c_lvl1
"
"       AND glal_lvl2     = c_lvl2
"
"       AND glal_lvl3     = c_lvl3
"
"       AND glal_lvl4     = c_lvl4
"
"       AND glal_acct     = c_acct
"
"       AND glal_plant    = c_acct_plnt
"
"       AND c_lvl1 IS NOT NULL
"
"       AND c_lvl2 IS NOT NULL
"
"       AND c_lvl3 IS NOT NULL
"
"       AND c_lvl4 IS NOT NULL
"
"       AND c_acct IS NOT NULL
"
"       AND c_acct_plnt IS NOT NULL;
"
"       */
"
"
"
"
"
"    cr2 c2%ROWTYPE;
"
"    cr4 c4%ROWTYPE;
"
"    cr5 c5%ROWTYPE;
"
"    cr6 c6%ROWTYPE;
"
"    --cr7 c7%ROWTYPE;
"
"
"
"     BEGIN
"
"             p_res:='Y';
"
"
"
"               UPDATE mfg_res_groups_exception
"
"                  SET mfgrge_status   = 'N',
"
"                      mfgrge_upd_by   = p_user,
"
"                      mfgrge_upd_date = SYSDATE
"
"                WHERE mfgrge_bu       = p_bu
"
"                   AND mfgrge_sel_user = p_user;
"
"
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"        UPDATE mfg_res_groups_exception
"
"           SET mfgrge_status   = 'E',
"
"               mfgrge_ref      = 'Duplicate Record',
"
"               mfgrge_upd_by   = p_user,
"
"               mfgrge_upd_date = SYSDATE
"
"         WHERE mfgrge_bu       = p_bu
"
"           AND mfgrge_plnt     = cr3.mfgrge_plnt
"
"           AND mfgrge_desc1   = cr3.mfgrge_desc1
"
"           AND mfgrge_sel_user = p_user;
"
"
"
"                   p_res := 'N';
"
"
"
"        END LOOP; --c3
"
"
"
"        FOR cr1 IN c1
"
"        LOOP
"
"
"
"            OPEN c2(cr1.mfgrge_plnt);
"
"                FETCH c2 INTO cr2;
"
"                IF c2%NOTFOUND THEN
"
"
"
"                   UPDATE mfg_res_groups_exception
"
"                      SET mfgrge_status   = 'E',
"
"                          mfgrge_ref      = 'Unit not found.',
"
"                          mfgrge_upd_by   = p_user,
"
"                          mfgrge_upd_date = SYSDATE
"
"                    WHERE mfgrge_bu       = p_bu
"
"                      AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"                      AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"                      AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                      AND mfgrge_sel_user = p_user;
"
"
"
"                      p_res := 'N';
"
"
"
"                END IF;
"
"            CLOSE c2;
"
"
"
"
"
"            OPEN c4(cr1.mfgrge_plnt,cr1.mfgrge_grp_id);
"
"
"
"                FETCH c4 INTO cr4;
"
"
"
"                IF c4%FOUND THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Resource already exists.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                    p_res := 'N';
"
"
"
"                END IF;
"
"
"
"            CLOSE c4; -- c4
"
"
"
"
"
"            IF cr1.mfgrge_desc1 IS NULL THEN
"
"
"
"                      UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Description must be enter.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                       p_res := 'N';
"
"            END IF;
"
"
"
"            IF cr1.mfgrge_res_type NOT IN ('M','P','O','T','F','S','C','G') THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Invalid Resource type',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"
"
"            END IF;
"
"
"
"            IF cr1.mfgrge_charge_type NOT IN ('A','S') OR cr1.mfgrge_charge_type IS NULL THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Invalid Charge Basis',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"            END IF;
"
"
"
"            OPEN c5(cr1.mfgrge_sub_element);
"
"
"
"                FETCH c5 INTO cr5;
"
"
"
"                IF c5%NOTFOUND THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Sub Element not found.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"                END IF;
"
"
"
"            CLOSE c5;
"
"
"
"            IF cr1.mfgrge_hrly_rate <= 0 THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Unit Rate should be greater than zero.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"            END IF;
"
"
"
"
"
"            OPEN c6(cr1.mfgrge_uom);
"
"
"
"                FETCH c6 INTO cr6;
"
"
"
"                IF c6%NOTFOUND THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'UOM not found.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"                END IF;
"
"
"
"           CLOSE c6;
"
"
"
"           IF cr1.mfgrge_no_of_units < 0 THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'No. of Unit should be greater than zero.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"           END IF;
"
"
"
"
"
"           IF cr1.mfgrge_utilization <= 0 OR cr1.mfgrge_utilization > 100 THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Utilization percentage between 1 to 100',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"           END IF;
"
"
"
"           IF cr1.mfgrge_efficiency <= 0 OR cr1.mfgrge_efficiency > 100 THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Efficiency percentage between 1 to 100',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"           END IF;
"
"
"
"
"
"           IF cr1.mfgrge_track_pvty NOT IN ('Y','N') OR cr1.mfgrge_track_pvty IS NULL THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Track productivity value either Y or N',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                         p_res := 'N';
"
"
"
"           END IF;
"
"
"
"
"
"           IF cr1.mfgrge_next_id_source NOT IN  ('S','M') THEN
"
"
"
"                     UPDATE mfg_res_groups_exception
"
"                    SET mfgrge_status   = 'E',
"
"                        mfgrge_ref      = 'Invalid Resource Mode',
"
"                        mfgrge_upd_by   = p_user,
"
"                        mfgrge_upd_date = SYSDATE
"
"                      WHERE mfgrge_bu       = p_bu
"
"                    AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"                    AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"                    AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                             AND mfgrge_sel_user = p_user;
"
"
"
"                             p_res := 'N';
"
"
"
"           END IF;
"
"
"
"           IF cr1.mfgrge_next_id_source = 'S' AND cr1.mfgrge_res_next_id IS NULL THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Resource Next Id must be enter.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"                         AND mfgrge_sel_user = p_user;
"
"
"
"                        p_res := 'N';
"
"
"
"           END IF;
"
"
"
"
"
"           IF cr1.mfgrge_next_id_source = 'M' AND cr1.mfgrge_res_next_id IS NOT NULL THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Resource Next Id should be Null.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"             AND mfgrge_sel_user = p_user;
"
"
"
"             p_res := 'N';
"
"
"
"          END IF;
"
"
"
"          --account chk
"
"         /* IF cr1.mfgrge_ac_lvl1 IS NOT NULL
"
"             AND cr1.mfgrge_ac_lvl2 IS NOT NULL
"
"             AND cr1.mfgrge_ac_lvl3 IS NOT NULL
"
"             AND cr1.mfgrge_ac_lvl4 IS NOT NULL
"
"             AND cr1.mfgrge_current_acct IS NOT NULL
"
"             AND cr1.mfgrge_acct_plnt IS NOT NULL THEN
"
"
"
"          OPEN c7(cr1.mfgrge_ac_lvl1,cr1.mfgrge_ac_lvl2,cr1.mfgrge_ac_lvl3,cr1.mfgrge_ac_lvl4,cr1.mfgrge_current_acct,cr1.mfgrge_acct_plnt);
"
"
"
"              FETCH c7 INTO cr7;
"
"
"
"              IF c7%NOTFOUND THEN
"
"
"
"              UPDATE mfg_res_groups_exception
"
"             SET mfgrge_status   = 'E',
"
"                 mfgrge_ref      = 'Account not found.',
"
"                 mfgrge_upd_by   = p_user,
"
"                 mfgrge_upd_date = SYSDATE
"
"               WHERE mfgrge_bu       = p_bu
"
"             AND mfgrge_plnt     = cr1.mfgrge_plnt
"
"             AND mfgrge_grp_id   = cr1.mfgrge_grp_id
"
"             AND mfgrge_res_type = cr1.mfgrge_res_type
"
"             AND mfgrge_sel_user = p_user;
"
"
"
"                      p_res := 'N';
"
"
"
"              END IF;
"
"
"
"          CLOSE c7;
"
"         END IF;  --account chk  */
"
"
"
"        END LOOP; --c1
"
"
"
"    END    proc_chk_res_group;
"
"
"
"    PROCEDURE proc_ins_mfg_res_groups
"
"                                    (p_bu    VARCHAR2,
"
"                                     p_user  VARCHAR2
"
"                                    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mfg_res_groups_exception
"
"     WHERE mfgrge_bu       = p_bu
"
"       AND mfgrge_sel_user = p_user
"
"       AND mfgrge_status   = 'N';
"
"
"
"    v_next_id    VARCHAR2(10);
"
"    v_res_id    VARCHAR2(10);
"
"
"
"    BEGIN
"
"
"
"        FOR cr1 IN c1
"
"        LOOP
"
"
"
"
"
"
"
"             SELECT MAX(mfgrg_grp_id)
"
"               INTO v_next_id
"
"               FROM mfg_res_groups
"
"              WHERE mfgrg_bu = p_bu
"
"                AND mfgrg_plnt = cr1.mfgrge_plnt;
"
"
"
"                v_res_id := func_get_next_id(v_next_id);
"
"
"
"             INSERT INTO mfg_res_groups(mfgrg_bu          ,
"
"                                        mfgrg_plnt        ,
"
"                                        mfgrg_grp_id      ,
"
"                                        mfgrg_desc1       ,
"
"                                        mfgrg_desc2       ,
"
"                                        mfgrg_res_type    ,
"
"                                        mfgrg_cost_type   ,
"
"                                        mfgrg_hrly_rate   ,
"
"                                        mfgrg_ac_lvl1     ,
"
"                                        mfgrg_ac_lvl2     ,
"
"                                        mfgrg_ac_lvl3     ,
"
"                                        mfgrg_ac_lvl4     ,
"
"                                        mfgrg_current_acct ,
"
"                                        mfgrg_uom          ,
"
"                                        mfgrg_track_pvty   ,
"
"                                        mfgrg_sub_element  ,
"
"                                        mfgrg_charge_flag  ,
"
"                                        mfgrg_charge_type  ,
"
"                                        mfgrg_cre_by       ,
"
"                                        mfgrg_cre_date     ,
"
"                                        mfgrg_upd_by       ,
"
"                                        mfgrg_upd_date    ,
"
"                                        mfgrg_no_of_units ,
"
"                                        mfgrg_res_grp_type,
"
"                                        mfgrg_efficiency  ,
"
"                                        mfgrg_utilization ,
"
"                                        mfgrg_acct_plnt   ,
"
"                                        mfgrg_res_next_id ,
"
"                                        mfgrg_next_id_source
"
"                                           )
"
"                                 VALUES(p_bu                  ,
"
"                                        cr1.mfgrge_plnt       ,
"
"                                        v_res_id    ,
"
"                                        cr1.mfgrge_desc1      ,
"
"                                        cr1.mfgrge_desc2      ,
"
"                                        cr1.mfgrge_res_type   ,
"
"                                        cr1.mfgrge_cost_type  ,
"
"                                        cr1.mfgrge_hrly_rate  ,
"
"                                        cr1.mfgrge_ac_lvl1    ,
"
"                                        cr1.mfgrge_ac_lvl2    ,
"
"                                        cr1.mfgrge_ac_lvl3    ,
"
"                                        cr1.mfgrge_ac_lvl4    ,
"
"                                        cr1.mfgrge_current_acct,
"
"                                        cr1.mfgrge_uom         ,
"
"                                        cr1.mfgrge_track_pvty  ,
"
"                                        cr1.mfgrge_sub_element ,
"
"                                        cr1.mfgrge_charge_flag ,
"
"                                        cr1.mfgrge_charge_type ,
"
"                                        p_user,
"
"                                        SYSDATE,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        cr1.mfgrge_no_of_units ,
"
"                                        cr1.mfgrge_res_grp_type,
"
"                                        cr1.mfgrge_efficiency  ,
"
"                                        cr1.mfgrge_utilization ,
"
"                                        cr1.mfgrge_acct_plnt   ,
"
"                                        cr1.mfgrge_res_next_id ,
"
"                                        cr1.mfgrge_next_id_source
"
"                                           );
"
"
"
"
"
"        END LOOP;
"
"
"
"        DELETE mfg_res_groups_exception
"
"         WHERE mfgrge_bu       = p_bu
"
"           AND mfgrge_sel_user = p_user
"
"           AND mfgrge_status   = 'N';
"
"
"
"    END proc_ins_mfg_res_groups;
"
"
"
"    PROCEDURE proc_upload_mfg_resources_man
"
"                                            (p_bu            VARCHAR2,
"
"                                             p_dir            VARCHAR2,
"
"                                             p_file_name    VARCHAR2,
"
"                                             p_user            VARCHAR2,
"
"                                             p_res        OUT    VARCHAR2
"
"                                            )
"
"    IS
"
"    CURSOR c_exe
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mfg_resources_exception
"
"     WHERE mfgre_bu       = p_bu
"
"       AND mfgre_sel_user = p_user
"
"       AND mfgre_doc_type = 'P';
"
"
"
"
"
"       cr_exe            c_exe%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"       v_create_table    VARCHAR2(4000);
"
"       v_insert_table    VARCHAR2(4000);
"
"
"
"    BEGIN
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"     DELETE mfg_resources_exception
"
"      WHERE mfgre_bu       = p_bu
"
"        AND mfgre_sel_user = p_user
"
"        AND mfgre_doc_type = 'P';
"
"
"
"
"
"        v_create_table := 'CREATE TABLE excel_migration(em_plnt                                   VARCHAR2(10)  ,
"
"                                                        em_name1                                  VARCHAR2(30)  ,
"
"                                                        em_group_id                               VARCHAR2(50)  ,
"
"                                                        em_uom                                    VARCHAR2(5)   ,
"
"                                                        em_eff_from                               DATE        ,
"
"                                                        em_eff_to                                 DATE        ,
"
"                                                        em_own_flag                               VARCHAR2(1)   ,
"
"                                                        em_emp_id                                 VARCHAR2(10)  ,
"
"                                                        em_cust_id                                VARCHAR2(10)  ,
"
"                                                        em_effciency                              NUMBER(5,2)   ,
"
"                                                        em_cost_basis                             VARCHAR2(1)   ,
"
"                                                        em_hrly_rate                              NUMBER(12,3)  ,
"
"                                                        em_daily_rates                            NUMBER(15,3)  ,
"
"                                                        em_no_of_hrs                              NUMBER(5)
"
"                                                        )
"
"                                          ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                                         SKIP 1
"
"                                                         FIELDS TERMINATED BY ''|''
"
"                                                         MISSING FIELD VALUES ARE NULL
"
"                                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                                        ( em_plnt           CHAR(255),
"
"                                                          em_name1          CHAR(255),
"
"                                                          em_group_id       CHAR(255),
"
"                                                          em_uom            CHAR(255),
"
"                                                          em_eff_from       CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                          em_eff_to         CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                          em_own_flag       CHAR(255),
"
"                                                          em_emp_id         CHAR(255),
"
"                                                          em_cust_id        CHAR(255),
"
"                                                          em_effciency      CHAR(255),
"
"                                                          em_cost_basis     CHAR(255),
"
"                                                          em_hrly_rate      CHAR(255),
"
"                                                          em_daily_rates CHAR(255),
"
"                                                          em_no_of_hrs   CHAR(255)
"
"                                                      ))
"
"                     LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE v_create_table;
"
"
"
"    v_insert_table := 'INSERT INTO mfg_resources_exception (SELECT '|| CHR(39) || p_bu     || CHR(39) ||','||'
"
"                                                           em_plnt          ,
"
"                                                           NULL       ,
"
"                                                           em_name1         ,
"
"                                                           em_group_id          ,
"
"                                                           em_uom     ,
"
"                                                           em_eff_from,
"
"                                                           em_eff_to ,
"
"                                                           em_own_flag,
"
"                                                           em_emp_id,
"
"                                                           em_cust_id,
"
"                                                           em_effciency,
"
"                                                           em_cost_basis,
"
"                                                           em_hrly_rate,
"
"                                                           em_daily_rates,
"
"                                                           em_no_of_hrs,'
"
"                                                           ||CHR(39) || 'FS' || CHR(39)||','
"
"                                                           ||CHR(39) || '1' || CHR(39)||','
"
"                                                           ||CHR(39) || 'W' || CHR(39)||','||'
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           NULL,
"
"                                                           NULL,'
"
"                                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                           NULL,
"
"                                                           NULL,'
"
"                                                           ||CHR(39) || '0' || CHR(39)||','
"
"                                                           ||CHR(39) || 'I' || CHR(39)||','
"
"                                                                                       ||CHR(39) || p_user   || CHR(39)||','||'
"
"                                                           SYSDATE,
"
"                                                           NULL,
"
"                                                           NULL,'
"
"                                                           ||CHR(39) || 'P' || CHR(39)||','
"
"                                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                           NULL,'
"
"                                                           ||CHR(39) || p_user   || CHR(39)||'
"
"                                                      FROM excel_migration)';
"
"
"
"       EXECUTE IMMEDIATE v_insert_table;
"
"
"
"       proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"       OPEN c_exe;
"
"       FETCH c_exe INTO cr_exe;
"
"
"
"          IF cr_exe.v_cnt = 0 THEN
"
"             v_result := 'N';
"
"          ELSE
"
"             v_result := 'Y';
"
"          END IF;
"
"
"
"       CLOSE c_exe;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_mfg_resources_man;
"
"
"
"    PROCEDURE proc_chk_mfg_resources_man
"
"                                        (p_bu       VARCHAR2,
"
"                                         p_user     VARCHAR2,
"
"                                         p_res  OUT VARCHAR2
"
"                                        )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mfg_resources_exception
"
"     WHERE mfgre_bu       = p_bu
"
"       AND mfgre_sel_user = p_user
"
"       AND mfgre_doc_type = 'P';
"
"
"
"    CURSOR c2(c_plant_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM bus_unit_plants
"
"     WHERE bup_bu       = p_bu
"
"       AND bup_plant_id = c_plant_id;
"
"
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mfgre_bu,
"
"           mfgre_plnt,
"
"           mfgre_name1,
"
"           COUNT (*)
"
"      FROM mfg_resources_exception
"
"     WHERE mfgre_bu       = p_bu
"
"       AND mfgre_sel_user = p_user
"
"       AND mfgre_doc_type = 'P'
"
"    GROUP BY mfgre_bu, mfgre_plnt, mfgre_name1
"
"    HAVING COUNT (*) > 1;
"
"
"
"
"
"    CURSOR c4(c_plnt VARCHAR2,c_grp_id VARCHAR2,c_uom VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM mfg_res_groups
"
"     WHERE mfgrg_bu     = p_bu
"
"       AND mfgrg_plnt   = c_plnt
"
"       AND mfgrg_desc1 = c_grp_id
"
"       AND mfgrg_uom    = c_uom
"
"       AND mfgrg_res_type IN ('P', 'S');
"
"
"
"
"
"    CURSOR c5(c_emp_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM employees
"
"     WHERE emp_bu     = p_bu
"
"       AND emp_emp_id = c_emp_id
"
"       AND emp_status = 'A';
"
"
"
"    CURSOR c6(c_suplr_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM suppliers
"
"     WHERE suplr_bu       = p_bu
"
"       AND suplr_suplr_id = c_suplr_id
"
"       AND suplr_status   = 'A';
"
"
"
"    CURSOR c7(c_plnt VARCHAR2,c_res_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu     = p_bu
"
"       AND mfgr_plnt   = c_plnt
"
"       AND mfgr_name1 = c_res_id;
"
"
"
"
"
"    cr2 c2%ROWTYPE;
"
"    cr4 c4%ROWTYPE;
"
"    cr5 c5%ROWTYPE;
"
"    cr6 c6%ROWTYPE;
"
"    cr7 c7%ROWTYPE;
"
"
"
"    BEGIN
"
"                p_res := 'Y';
"
"
"
"          UPDATE mfg_resources_exception
"
"             SET mfgre_doc_status = 'N',
"
"             mfgre_ref        = '',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"             AND mfgre_doc_type   = 'P'
"
"             AND mfgre_sel_user   = p_user;
"
"
"
"      --Duplicate record chk--
"
"      FOR cr3 IN c3
"
"      LOOP
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Duplicate Resource.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr3.mfgre_plnt
"
"         AND mfgre_name1     = cr3.mfgre_name1
"
"         AND mfgre_doc_type   = 'P'
"
"         AND mfgre_doc_status = 'N'
"
"                 AND mfgre_sel_user   = p_user;
"
"
"
"      END LOOP; --c3
"
"
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"           OPEN c2(cr1.mfgre_plnt);
"
"
"
"               FETCH c2 INTO cr2;
"
"
"
"               IF c2%NOTFOUND THEN
"
"
"
"                  UPDATE mfg_resources_exception
"
"                     SET mfgre_doc_status = 'E',
"
"                         mfgre_ref        = 'Unit not found.',
"
"                         mfgre_upd_by     = p_user,
"
"                         mfgre_upd_date   = SYSDATE
"
"                   WHERE mfgre_bu         = p_bu
"
"                     AND mfgre_plnt       = cr1.mfgre_plnt
"
"                     AND mfgre_res_id     = cr1.mfgre_res_id
"
"                     AND mfgre_group_id   = cr1.mfgre_group_id
"
"                     AND mfgre_doc_type   = 'P'
"
"                     AND mfgre_doc_status = 'N'
"
"                     AND mfgre_sel_user   = p_user;
"
"
"
"                     p_res := 'N';
"
"
"
"               END IF;
"
"
"
"           CLOSE c2;
"
"
"
"           IF cr1.mfgre_res_id  IS NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Resource must be enter.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"                     p_res := 'N';
"
"
"
"           END IF;
"
"
"
"           IF cr1.mfgre_name1 IS NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Resource description must be enter.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"           END IF;
"
"
"
"
"
"         --Resource Group---
"
"         OPEN c4(cr1.mfgre_plnt,cr1.mfgre_group_id,cr1.mfgre_uom);
"
"
"
"             FETCH c4 INTO cr4;
"
"
"
"               IF c4%NOTFOUND THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Resource Group not found.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"               END IF;
"
"
"
"         CLOSE c4;
"
"
"
"         IF cr1.mfgre_eff_from IS NULL OR cr1.mfgre_eff_to IS NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Effective From/To date must be enter.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"         ELSIF TO_DATE(cr1.mfgre_eff_from) > TO_DATE(cr1.mfgre_eff_to)  THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Effective From date should be less than to Date.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"         END IF;
"
"
"
"         IF cr1.mfgre_own_flag NOT IN ('S','R','T') OR cr1.mfgre_own_flag IS NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Invalid value for employee type.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"
"
"         END IF;
"
"
"
"
"
"         OPEN c5(cr1.mfgre_emp_id);
"
"
"
"             FETCH c5 INTO cr5;
"
"
"
"             IF c5%NOTFOUND AND cr1.mfgre_emp_id IS NOT NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Employee not found.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"            END IF;
"
"
"
"         CLOSE c5;
"
"
"
"        OPEN c6(cr1.mfgre_cust_id);
"
"
"
"            FETCH c6 INTO cr6;
"
"
"
"            IF c6%NOTFOUND  AND cr1.mfgre_cust_id IS NOT NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Supplier not found.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"            END IF;
"
"
"
"        CLOSE c6;
"
"
"
"
"
"       IF cr1.mfgre_effciency < 0 OR cr1.mfgre_effciency > 100 OR cr1.mfgre_effciency IS NULL THEN
"
"
"
"
"
"                    UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Efficiency percentage between 1 to 100.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_group_id   = cr1.mfgre_group_id
"
"                   AND mfgre_doc_type   = 'P'
"
"                   AND mfgre_doc_status = 'N'
"
"                   AND mfgre_sel_user   = p_user;
"
"
"
"            p_res := 'N';
"
"
"
"       END IF;
"
"
"
"
"
"       IF cr1.mfgre_cost_basis NOT IN ('H','P','D') OR cr1.mfgre_cost_basis IS NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Invalid value for cost basis.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"             p_res := 'N';
"
"
"
"       END IF;
"
"
"
"       IF cr1.mfgre_hrly_rate <= 0 OR cr1.mfgre_hrly_rate IS NULL THEN
"
"
"
"                UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Unit rate should be greater than zero.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_group_id   = cr1.mfgre_group_id
"
"                   AND mfgre_doc_type   = 'P'
"
"                   AND mfgre_doc_status = 'N'
"
"                   AND mfgre_sel_user   = p_user;
"
"
"
"             p_res := 'N';
"
"
"
"       END IF;
"
"
"
"       IF cr1.mfgre_daily_rates < 0 OR cr1.mfgre_daily_rates IS NULL THEN
"
"
"
"             UPDATE mfg_resources_exception
"
"            SET mfgre_doc_status = 'E',
"
"                mfgre_ref        = 'Daily rate should be greater than zero.',
"
"                mfgre_upd_by     = p_user,
"
"                mfgre_upd_date   = SYSDATE
"
"              WHERE mfgre_bu         = p_bu
"
"            AND mfgre_plnt       = cr1.mfgre_plnt
"
"            AND mfgre_res_id     = cr1.mfgre_res_id
"
"            AND mfgre_group_id   = cr1.mfgre_group_id
"
"            AND mfgre_doc_type   = 'P'
"
"            AND mfgre_doc_status = 'N'
"
"            AND mfgre_sel_user   = p_user;
"
"
"
"             p_res := 'N';
"
"
"
"       END IF;
"
"
"
"
"
"       IF cr1.mfgre_no_of_hrs < 0 THEN
"
"
"
"                    UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'No. of Hrs. should be greater than zero.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_group_id   = cr1.mfgre_group_id
"
"                   AND mfgre_doc_type   = 'P'
"
"                   AND mfgre_doc_status = 'N'
"
"                   AND mfgre_sel_user   = p_user;
"
"
"
"             p_res := 'N';
"
"
"
"       END IF;
"
"
"
"
"
"      OPEN c7(cr1.mfgre_plnt,cr1.mfgre_res_id);
"
"
"
"          FETCH c7 INTO cr7;
"
"
"
"          IF c7%FOUND THEN
"
"
"
"                    UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Resource already exists.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_group_id   = cr1.mfgre_group_id
"
"                   AND mfgre_doc_type   = 'P'
"
"                   AND mfgre_doc_status = 'N'
"
"                   AND mfgre_sel_user   = p_user;
"
"
"
"             p_res := 'N';
"
"
"
"          END IF;
"
"
"
"      CLOSE c7;
"
"
"
"      END LOOP; --c1
"
"
"
"    END    proc_chk_mfg_resources_man;
"
"
"
"    PROCEDURE proc_ins_mfg_resources_man
"
"                                        (p_bu  VARCHAR2,
"
"                                         p_user VARCHAR2
"
"                                        )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mfg_resources_exception
"
"     WHERE mfgre_bu         = p_bu
"
"       AND mfgre_doc_type   = 'P'
"
"       AND mfgre_doc_status = 'N'
"
"       AND mfgre_sel_user   = p_user;
"
"
"
"    v_next_id    VARCHAR2(10);
"
"    v_res_id    VARCHAR2(10);
"
"
"
"    BEGIN
"
"
"
"        FOR cr1 IN c1
"
"        LOOP
"
"
"
"                 SELECT MAX(mfgr_res_id)
"
"                   INTO v_next_id
"
"                   FROM mfg_resources
"
"                  WHERE mfgr_bu = p_bu
"
"                    AND mfgr_plnt = cr1.mfgre_plnt;
"
"
"
"                v_res_id := func_get_next_id(v_next_id);
"
"
"
"                 INSERT INTO mfg_resources(
"
"                                           mfgr_bu      ,
"
"                                           mfgr_plnt    ,
"
"                                           mfgr_res_id  ,
"
"                                           mfgr_name1   ,
"
"                                           mfgr_hrly_rate,
"
"                                           mfgr_group_id ,
"
"                                           mfgr_eff_from ,
"
"                                           mfgr_eff_to   ,
"
"                                           mfgr_avbl_hrs_day,
"
"                                           mfgr_emp_id      ,
"
"                                           mfgr_uom         ,
"
"                                           mfgr_effciency   ,
"
"                                           mfgr_unit_cost   ,
"
"                                           mfgr_res_type    ,
"
"                                           mfgr_cre_by      ,
"
"                                           mfgr_cre_date    ,
"
"                                           mfgr_upd_by      ,
"
"                                           mfgr_upd_date    ,
"
"                                           mfgr_loc_type    ,
"
"                                           mfgr_share_flag  ,
"
"                                           mfgr_loc_id      ,
"
"                                           mfgr_status      ,
"
"                                           mfgr_own_flag    ,
"
"                                           mfgr_cust_id     ,
"
"                                           mfgr_no_cavity   ,
"
"                                           mfgr_emp_req     ,
"
"                                           mfgr_iact_sel_flag ,
"
"                                           mfgr_utilized      ,
"
"                                           mfgr_fur_type      ,
"
"                                           mfgr_fur_capacity  ,
"
"                                           mfgr_amort_rqrd_flag,
"
"                                           mfgr_cost_basis     ,
"
"                                           mfgr_mach_cost      ,
"
"                                           mfgr_maint_cost     ,
"
"                                           mfgr_elect_cost     ,
"
"                                           mfgr_labour_cost    ,
"
"                                           mfgr_no_of_heats    ,
"
"                                           mfgr_lld_heats      ,
"
"                                           mfgr_no_of_trolly   ,
"
"                                           mfgr_no_of_rods     ,
"
"                                           mfgr_run_hrs        ,
"
"                                           mfgr_elasped_hrs    ,
"
"                                           mfgr_fmcg_status    ,
"
"                                           mfgr_sel_flag       ,
"
"                                           mfgr_contr_status   ,
"
"                                           mfgr_daily_rates    ,
"
"                                           mfgr_no_of_hrs      ,
"
"                                           mfgr_power_multi_fact_mach,
"
"                                           mfgr_power_multi_fact_furnace,
"
"                                           mfgr_child_tool_req_flag     ,
"
"                                           mfgr_mach_type
"
"                                         )
"
"                                    VALUES(p_bu                ,
"
"                                           cr1.mfgre_plnt      ,
"
"                                           v_res_id   ,
"
"                                           cr1.mfgre_name1     ,
"
"                                           cr1.mfgre_hrly_rate ,
"
"                                           cr1.mfgre_group_id  ,
"
"                                           cr1.mfgre_eff_from  ,
"
"                                           cr1.mfgre_eff_to    ,
"
"                                           0,
"
"                                           cr1.mfgre_emp_id,
"
"                                           cr1.mfgre_uom   ,
"
"                                           cr1.mfgre_effciency,
"
"                                           0,
"
"                                           'P',
"
"                                           p_user,
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           'W',
"
"                                           'N',
"
"                                           NULL,
"
"                                           'C',
"
"                                           cr1.mfgre_own_flag,
"
"                                           cr1.mfgre_cust_id,
"
"                                           0,
"
"                                           'N',
"
"                                           'N',
"
"                                           0,
"
"                                           'H',
"
"                                           0,
"
"                                           'N',
"
"                                           cr1.mfgre_cost_basis,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           'R',
"
"                                           'N',
"
"                                           'I',
"
"                                           cr1.mfgre_daily_rates,
"
"                                           cr1.mfgre_no_of_hrs,
"
"                                           1,
"
"                                           1,
"
"                                           'N',
"
"                                           cr1.mfgre_mach_type
"
"                                          );
"
"
"
"
"
"        DELETE mfg_resources_exception
"
"         WHERE mfgre_bu         = p_bu
"
"           AND mfgre_doc_type   = 'P'
"
"           AND mfgre_doc_status = 'N'
"
"           AND mfgre_sel_user   = p_user;
"
"
"
"
"
"
"
"        END LOOP;
"
"
"
"    END proc_ins_mfg_resources_man;
"
"
"
"    PROCEDURE proc_upload_mfg_resources_mach
"
"                                            (p_bu            VARCHAR2,
"
"                                             p_dir            VARCHAR2,
"
"                                             p_file_name        VARCHAR2,
"
"                                             p_user                    VARCHAR2,
"
"                                             p_res               OUT    VARCHAR2
"
"                                            )
"
"    IS
"
"    CURSOR c_exe
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mfg_resources_exception
"
"     WHERE mfgre_bu       = p_bu
"
"       AND mfgre_sel_user = p_user
"
"       AND mfgre_doc_type = 'M';
"
"
"
"
"
"       cr_exe            c_exe%ROWTYPE;
"
"       v_create_table    VARCHAR2(4000);
"
"       v_insert_table    VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       p_status            VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"     DELETE mfg_resources_exception
"
"      WHERE mfgre_bu       = p_bu
"
"        AND mfgre_sel_user = p_user
"
"        AND mfgre_doc_type = 'M';
"
"
"
"
"
"       v_create_table := 'CREATE TABLE EXCEL_MIGRATION(em_plnt                                   VARCHAR2(10)  ,
"
"                                                       em_name1                                  VARCHAR2(30)  ,
"
"                                                       em_type                                   VARCHAR2(2)   ,
"
"                                                       em_group_id                               VARCHAR2(50)  ,
"
"                                                       em_uom                                    VARCHAR2(5)   ,
"
"                                                       em_eff_from                               DATE        ,
"
"                                                       em_eff_to                                 DATE        ,
"
"                                                       em_mult_factor                              NUMBER(7)     ,
"
"                                                       em_loc_type                               VARCHAR2(1)   ,
"
"                                                       em_cost_basis                             VARCHAR2(1)   ,
"
"                                                       em_hrly_rate                              NUMBER(12,3)  ,
"
"                                                       em_loc_id                                 VARCHAR2(50)  ,
"
"                                                       em_fixed_asset                            VARCHAR2(20)  ,
"
"                                                       em_effciency                              NUMBER(5,2)   ,
"
"                                                       em_own_flag                               VARCHAR2(1)   ,
"
"                                                       em_cust_id                                VARCHAR2(10)  ,
"
"                                                       em_eqpmnt_id                              VARCHAR2(50)  ,
"
"                                                       em_make_id                                VARCHAR2(50)  ,
"
"                                                       em_model_id                               VARCHAR2(50)  ,
"
"                                                       em_spec_id                                VARCHAR2(50)  ,
"
"                                                       em_reference                              VARCHAR2(50)  ,
"
"                                                       em_share_flag                             VARCHAR2(1)
"
"                                                        )
"
"                                          ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                                         SKIP 1
"
"                                                         FIELDS TERMINATED BY ''|''
"
"                                                         MISSING FIELD VALUES ARE NULL
"
"                                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                                        (    em_plnt                                   CHAR(255)  ,
"
"                                                             em_res_id                                 CHAR(255)  ,
"
"                                                             em_name1                                  CHAR(255)  ,
"
"                                                             em_type                                   CHAR(255),
"
"                                                             em_group_id                               CHAR(255),
"
"                                                             em_uom                                    CHAR(255),
"
"                                                             em_eff_from                               CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                             em_eff_to                                 CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                             em_mult_factor                                CHAR(255),
"
"                                                             em_loc_type                               CHAR(255),
"
"                                                             em_cost_basis                             CHAR(255),
"
"                                                             em_hrly_rate                              CHAR(255),
"
"                                                             em_loc_id                                 CHAR(255),
"
"                                                             em_fixed_asset                            CHAR(255),
"
"                                                             em_effciency                              CHAR(255),
"
"                                                             em_own_flag                               CHAR(255),
"
"                                                             em_cust_id                                CHAR(255),
"
"                                                             em_eqpmnt_id                              CHAR(255),
"
"                                                             em_make_id                                CHAR(255),
"
"                                                             em_model_id                               CHAR(255),
"
"                                                             em_spec_id                                CHAR(255),
"
"                                                             em_reference                              CHAR(255),
"
"                                                             em_share_flag                             CHAR(255)
"
"                                                              ))
"
"                                                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"       EXECUTE IMMEDIATE v_create_table;
"
"
"
"       v_insert_table := 'INSERT INTO mfg_resources_exception (SELECT '|| CHR(39) || p_bu     || CHR(39) ||','||'
"
"                                                               em_plnt          ,
"
"                                                               em_res_id       ,
"
"                                                               em_name1         ,
"
"                                                               em_group_id          ,
"
"                                                               em_uom     ,
"
"                                                               em_eff_from,
"
"                                                               em_eff_to ,
"
"                                                               em_own_flag,
"
"                                                               NULL,
"
"                                                               em_cust_id,
"
"                                                               em_effciency,
"
"                                                               em_cost_basis,
"
"                                                               em_hrly_rate,
"
"                                                               0,
"
"                                                               0,
"
"                                                               em_type,
"
"                                                               em_mult_factor,
"
"                                                               em_loc_type,
"
"                                                               em_loc_id ,
"
"                                                               em_fixed_asset,
"
"                                                               em_eqpmnt_id,
"
"                                                               em_make_id,
"
"                                                               em_model_id,
"
"                                                               em_spec_id ,
"
"                                                               em_reference,
"
"                                                               em_share_flag,
"
"                                                               NULL,
"
"                                                               NULL,'
"
"                                                               ||CHR(39) || '0' || CHR(39)||','
"
"                                                               ||CHR(39) || 'I' || CHR(39)||','
"
"                                                               ||CHR(39) || p_user   || CHR(39)||','||'
"
"                                                               SYSDATE,
"
"                                                               NULL,
"
"                                                               NULL,'
"
"                                                               ||CHR(39) || 'M' || CHR(39)||','
"
"                                                               ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                               NULL,'
"
"                                                               ||CHR(39) || p_user   || CHR(39)||'
"
"                                                          FROM excel_migration)';
"
"
"
"    EXECUTE IMMEDIATE v_insert_table;
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"       OPEN c_exe;
"
"       FETCH c_exe INTO cr_exe;
"
"
"
"          IF cr_exe.v_cnt = 0 THEN
"
"             v_result := 'N';
"
"          ELSE
"
"             v_result := 'Y';
"
"          END IF;
"
"
"
"       CLOSE c_exe;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_mfg_resources_mach;
"
"
"
"    PROCEDURE proc_chk_mfg_resources_mach
"
"                                        (p_bu         VARCHAR2,
"
"                                         p_user       VARCHAR2,
"
"                                         p_res   OUT  VARCHAR2
"
"                                        )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mfg_resources_exception
"
"     WHERE mfgre_bu         = p_bu
"
"       AND mfgre_sel_user   = p_user
"
"       AND mfgre_doc_type   = 'M'
"
"       AND mfgre_doc_status = 'N';
"
"
"
"    CURSOR c2(c_plant_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM bus_unit_plants
"
"     WHERE bup_bu       = p_bu
"
"       AND bup_plant_id = c_plant_id;
"
"
"
"    CURSOR c3
"
"    IS
"
"      SELECT mfgre_bu,
"
"             mfgre_plnt,
"
"             mfgre_name1,
"
"             COUNT (*)
"
"        FROM mfg_resources_exception
"
"       WHERE mfgre_bu          = p_bu
"
"         AND mfgre_sel_user    = p_user
"
"         AND mfgre_doc_type    = 'M'
"
"         AND mfgre_doc_status  = 'N'
"
"    GROUP BY mfgre_bu, mfgre_plnt, mfgre_name1
"
"    HAVING COUNT (*) > 1 ;
"
"
"
"
"
"    CURSOR c4(c_plnt VARCHAR2,c_res_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM mfg_resources
"
"     WHERE mfgr_bu      = p_bu
"
"       AND mfgr_plnt    = c_plnt
"
"       AND mfgr_name1  = c_res_id;
"
"
"
"
"
"    CURSOR c5(c_plnt VARCHAR2,c_grp_id VARCHAR2,c_uom VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM mfg_res_groups
"
"     WHERE mfgrg_bu      = p_bu
"
"       AND mfgrg_plnt    = c_plnt
"
"       AND mfgrg_desc1  = c_grp_id
"
"       AND mfgrg_uom     = c_uom
"
"       AND mfgrg_res_type IN ('M', 'S');
"
"
"
"
"
"    CURSOR c6(c_loc_id VARCHAR2,c_loc_type VARCHAR2,c_plnt VARCHAR2)
"
"        IS
"
"    SELECT suplr_name1, suplr_suplr_id
"
"      FROM suppliers
"
"     WHERE suplr_bu       = p_bu
"
"       AND suplr_suplr_id = c_loc_id
"
"       AND c_loc_type     = 'S'
"
"    UNION
"
"    SELECT process_name1, process_id
"
"      FROM processes
"
"     WHERE process_bu   = p_bu
"
"       AND process_plnt = c_plnt
"
"       AND process_id   = c_loc_id
"
"       AND c_loc_type   = 'W'
"
"    UNION
"
"    SELECT mfgl_line_desc1, mfgl_line_id
"
"      FROM mfg_lines
"
"     WHERE mfgl_bu      = p_bu
"
"       AND mfgl_plnt    = c_plnt
"
"       AND mfgl_line_desc1 = c_loc_id
"
"       AND c_loc_type   = 'L'
"
"    UNION
"
"    SELECT dept_name1, dept_id
"
"      FROM departments
"
"     WHERE dept_bu      = p_bu
"
"       AND dept_plnt    = c_plnt
"
"       AND dept_name1      = c_loc_id
"
"       AND c_loc_type   = 'D';
"
"
"
"
"
"    CURSOR c7(c_plnt VARCHAR2,c_asset VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM fixed_assets
"
"     WHERE fa_bu          = p_bu
"
"       AND fa_plnt        = c_plnt
"
"       AND fa_asset_id    = c_asset;
"
"
"
"
"
"    CURSOR c8(c_cust_id VARCHAR2,c_type VARCHAR2)
"
"        IS
"
"    SELECT suplr_suplr_id  cust_id,
"
"           suplr_name1 cust_name1
"
"      FROM suppliers
"
"     WHERE suplr_bu       = p_bu
"
"       AND suplr_suplr_id  = c_cust_id
"
"       AND suplr_status   = 'A'
"
"       AND c_type        = 'C'
"
"    UNION ALL
"
"    SELECT suplr_suplr_id cust_id,
"
"           suplr_name1    cust_name1
"
"      FROM suppliers
"
"     WHERE suplr_bu         = p_bu
"
"       AND suplr_suplr_id   = c_cust_id
"
"       AND suplr_status     = 'A'
"
"       AND c_type           = 'R'
"
"    UNION ALL
"
"    SELECT emp_emp_id      cust_id,
"
"           emp_first_name1 cust_name1
"
"      FROM employees
"
"     WHERE emp_bu        = p_bu
"
"       AND emp_emp_id    = c_cust_id
"
"       AND emp_status    = 'A'
"
"       AND c_type        = 'S';
"
"
"
"    CURSOR c9(c_plnt VARCHAR2,c_eqpmt_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM equipments
"
"     WHERE eqpmt_bu       = p_bu
"
"       AND eqpmt_plant_id = c_plnt
"
"       AND eqpmt_eqpmt_id = c_eqpmt_id
"
"       AND eqpmt_status   = 'A';
"
"
"
"    CURSOR c10(c_make_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM product_make
"
"     WHERE pm_bu     = p_bu
"
"       AND pm_mak_desc1 = c_make_id;
"
"
"
"    CURSOR c11(c_model VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM product_models
"
"     WHERE pmds_bu       = p_bu
"
"       AND pmds_model_desc = c_model;
"
"
"
"    CURSOR c12(c_spec_id VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM material_spec
"
"     WHERE mat_bu      = p_bu
"
"       AND mat_spec_desc = c_spec_id;
"
"
"
"
"
"   cr2   c2%ROWTYPE;
"
"   cr4   c4%ROWTYPE;
"
"   cr5   c5%ROWTYPE;
"
"   cr6   c6%ROWTYPE;
"
"   cr7   c7%ROWTYPE;
"
"   cr8   c8%ROWTYPE;
"
"   cr9   c9%ROWTYPE;
"
"   cr10 c10%ROWTYPE;
"
"   cr11 c11%ROWTYPE;
"
"   cr12 c12%ROWTYPE;
"
"
"
"BEGIN
"
"
"
"           UPDATE mfg_resources_exception
"
"              SET mfgre_doc_status = 'N',
"
"              mfgre_upd_by     = p_user,
"
"              mfgre_upd_date   = SYSDATE
"
"            WHERE mfgre_bu         = p_bu
"
"              AND mfgre_doc_type   = 'M'
"
"              AND mfgre_sel_user   = p_user;
"
"
"
"              p_res := 'Y';
"
"
"
"
"
"
"
"            FOR cr3 IN c3
"
"            LOOP
"
"                 UPDATE mfg_resources_exception
"
"                SET mfgre_doc_status = 'E',
"
"                    mfgre_ref        = 'Duplicate Resource.',
"
"                    mfgre_upd_by     = p_user,
"
"                    mfgre_upd_date   = SYSDATE
"
"                  WHERE mfgre_bu         = p_bu
"
"                AND mfgre_plnt       = cr3.mfgre_plnt
"
"                AND mfgre_name1     = cr3.mfgre_name1
"
"                AND mfgre_doc_type   = 'M'
"
"                AND mfgre_sel_user   = p_user
"
"                AND mfgre_doc_status = 'N';
"
"
"
"                    p_res := 'N';
"
"
"
"            END LOOP;
"
"
"
"
"
"
"
"      FOR cr1 IN c1
"
"      LOOP
"
"
"
"            IF cr1.mfgre_res_id IS NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"              SET mfgre_doc_status = 'E',
"
"              mfgre_ref        = 'Resource must be enter.',
"
"              mfgre_upd_by     = p_user,
"
"              mfgre_upd_date   = SYSDATE
"
"            WHERE mfgre_bu         = p_bu
"
"              AND mfgre_plnt       = cr1.mfgre_plnt
"
"              AND mfgre_res_id     = cr1.mfgre_res_id
"
"              AND mfgre_doc_type   = 'M'
"
"              AND mfgre_sel_user   = p_user
"
"              AND mfgre_doc_status = 'N';
"
"
"
"                           p_res := 'N';
"
"
"
"            END IF;
"
"
"
"            IF cr1.mfgre_name1    IS NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"              SET mfgre_doc_status = 'E',
"
"              mfgre_ref        = 'Description must be enter.',
"
"              mfgre_upd_by     = p_user,
"
"              mfgre_upd_date   = SYSDATE
"
"            WHERE mfgre_bu         = p_bu
"
"              AND mfgre_plnt       = cr1.mfgre_plnt
"
"              AND mfgre_res_id     = cr1.mfgre_res_id
"
"              AND mfgre_doc_type   = 'M'
"
"              AND mfgre_sel_user   = p_user
"
"              AND mfgre_doc_status = 'N';
"
"
"
"                           p_res := 'N';
"
"            END IF;
"
"
"
"            OPEN c2(cr1.mfgre_plnt);
"
"
"
"                FETCH c2 INTO cr2;
"
"
"
"                IF c2%NOTFOUND THEN
"
"
"
"                    UPDATE mfg_resources_exception
"
"                       SET mfgre_doc_status = 'E',
"
"                           mfgre_ref        = 'Unit not found.',
"
"                           mfgre_upd_by     = p_user,
"
"                           mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                       AND mfgre_plnt       = cr1.mfgre_plnt
"
"                       AND mfgre_res_id     = cr1.mfgre_res_id
"
"                       AND mfgre_doc_type   = 'M'
"
"                       AND mfgre_sel_user   = p_user
"
"                       AND mfgre_doc_status = 'N';
"
"
"
"                           p_res := 'N';
"
"
"
"                END IF;
"
"
"
"            CLOSE c2;
"
"
"
"      OPEN c4(cr1.mfgre_plnt,cr1.mfgre_res_id);
"
"
"
"          FETCH c4 INTO cr4;
"
"
"
"          IF c4%FOUND THEN
"
"
"
"              UPDATE mfg_resources_exception
"
"             SET mfgre_doc_status = 'E',
"
"                 mfgre_ref        = 'Resource already exists.',
"
"                 mfgre_upd_by     = p_user,
"
"                 mfgre_upd_date   = SYSDATE
"
"               WHERE mfgre_bu         = p_bu
"
"             AND mfgre_plnt       = cr1.mfgre_plnt
"
"             AND mfgre_res_id     = cr1.mfgre_res_id
"
"             AND mfgre_doc_type   = 'M'
"
"             AND mfgre_sel_user   = p_user
"
"             AND mfgre_doc_status = 'N';
"
"
"
"                           p_res := 'N';
"
"          END IF;
"
"
"
"      CLOSE c4;
"
"
"
"
"
"      IF cr1.mfgre_mach_type NOT IN ('FR','FS','PS','CM','SM','AC','BR','CR','HW','CW','DB','DB','DF','SX','SP') OR cr1.mfgre_mach_type IS NULL THEN
"
"
"
"                    UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Invalid value for resource type.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_doc_type   = 'M'
"
"                   AND mfgre_sel_user   = p_user
"
"                   AND mfgre_doc_status = 'N';
"
"
"
"                           p_res := 'N';
"
"      END IF;
"
"
"
"
"
"      OPEN c5(cr1.mfgre_plnt,cr1.mfgre_group_id,cr1.mfgre_uom);
"
"
"
"          FETCH c5 INTO cr5;
"
"
"
"          IF c5%NOTFOUND THEN
"
"
"
"                      UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Resource Group not found.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_doc_type   = 'M'
"
"                   AND mfgre_sel_user   = p_user
"
"                   AND mfgre_doc_status = 'N';
"
"
"
"                           p_res := 'N';
"
"
"
"          END IF;
"
"
"
"      CLOSE c5;
"
"
"
"      IF cr1.mfgre_eff_from > cr1.mfgre_eff_to THEN
"
"
"
"            UPDATE mfg_resources_exception
"
"             SET mfgre_doc_status = 'E',
"
"                 mfgre_ref        = 'Effective from date should be less than to date.',
"
"                 mfgre_upd_by     = p_user,
"
"                 mfgre_upd_date   = SYSDATE
"
"               WHERE mfgre_bu         = p_bu
"
"             AND mfgre_plnt       = cr1.mfgre_plnt
"
"             AND mfgre_res_id     = cr1.mfgre_res_id
"
"             AND mfgre_doc_type   = 'M'
"
"             AND mfgre_sel_user   = p_user
"
"             AND mfgre_doc_status = 'N';
"
"
"
"                           p_res := 'N';
"
"      END IF;
"
"
"
"      IF cr1.mfgre_eff_from IS NULL  THEN
"
"
"
"                  UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Effective from date must be enter.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_doc_type   = 'M'
"
"                   AND mfgre_sel_user   = p_user
"
"                   AND mfgre_doc_status = 'N';
"
"
"
"                                 p_res := 'N';
"
"      END IF;
"
"
"
"      IF cr1.mfgre_eff_to IS NULL  THEN
"
"
"
"            UPDATE mfg_resources_exception
"
"             SET mfgre_doc_status = 'E',
"
"                 mfgre_ref        = 'Effective to date must be enter.',
"
"                 mfgre_upd_by     = p_user,
"
"                 mfgre_upd_date   = SYSDATE
"
"               WHERE mfgre_bu         = p_bu
"
"             AND mfgre_plnt       = cr1.mfgre_plnt
"
"             AND mfgre_res_id     = cr1.mfgre_res_id
"
"             AND mfgre_doc_type   = 'M'
"
"             AND mfgre_sel_user   = p_user
"
"             AND mfgre_doc_status = 'N';
"
"
"
"                             p_res := 'N';
"
"      END IF;
"
"
"
"
"
"      IF cr1.mfgre_power_multi_fact_mach <= 0 THEN
"
"
"
"                  UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Multiplication factor should be greater than zero.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_doc_type   = 'M'
"
"                   AND mfgre_sel_user   = p_user
"
"                   AND mfgre_doc_status = 'N';
"
"
"
"                             p_res := 'N';
"
"
"
"      END IF;
"
"
"
"      IF cr1.mfgre_power_multi_fact_mach IS NULL THEN
"
"
"
"              UPDATE mfg_resources_exception
"
"             SET mfgre_doc_status = 'E',
"
"                 mfgre_ref        = 'Multiplication factor should be greater than zero.',
"
"                 mfgre_upd_by     = p_user,
"
"                 mfgre_upd_date   = SYSDATE
"
"               WHERE mfgre_bu         = p_bu
"
"             AND mfgre_plnt       = cr1.mfgre_plnt
"
"             AND mfgre_res_id     = cr1.mfgre_res_id
"
"             AND mfgre_doc_type   = 'M'
"
"             AND mfgre_sel_user   = p_user
"
"             AND mfgre_doc_status = 'N';
"
"
"
"               p_res := 'N';
"
"
"
"      END IF;
"
"
"
"      IF cr1.mfgre_loc_type NOT IN ('D','L','S','T','W') OR cr1.mfgre_loc_type IS NULL THEN
"
"
"
"                    UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Invalid value for location type.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_doc_type   = 'M'
"
"                   AND mfgre_sel_user   = p_user
"
"                   AND mfgre_doc_status = 'N';
"
"
"
"               p_res := 'N';
"
"
"
"      END IF;
"
"
"
"
"
"      IF cr1.mfgre_cost_basis NOT IN ('H','P') OR cr1.mfgre_cost_basis IS NULL THEN
"
"
"
"              UPDATE mfg_resources_exception
"
"             SET mfgre_doc_status = 'E',
"
"                 mfgre_ref        = 'Invalid value for Cost Basis.',
"
"                 mfgre_upd_by     = p_user,
"
"                 mfgre_upd_date   = SYSDATE
"
"               WHERE mfgre_bu         = p_bu
"
"             AND mfgre_plnt       = cr1.mfgre_plnt
"
"             AND mfgre_res_id     = cr1.mfgre_res_id
"
"             AND mfgre_doc_type   = 'M'
"
"             AND mfgre_sel_user   = p_user
"
"             AND mfgre_doc_status = 'N';
"
"
"
"                 p_res := 'N';
"
"
"
"      END IF;
"
"
"
"      IF cr1.mfgre_hrly_rate <= 0 OR cr1.mfgre_hrly_rate IS NULL THEN
"
"
"
"                    UPDATE mfg_resources_exception
"
"                   SET mfgre_doc_status = 'E',
"
"                       mfgre_ref        = 'Unit Rate should be greater than zero.',
"
"                       mfgre_upd_by     = p_user,
"
"                       mfgre_upd_date   = SYSDATE
"
"                     WHERE mfgre_bu         = p_bu
"
"                   AND mfgre_plnt       = cr1.mfgre_plnt
"
"                   AND mfgre_res_id     = cr1.mfgre_res_id
"
"                   AND mfgre_doc_type   = 'M'
"
"                   AND mfgre_sel_user   = p_user
"
"                   AND mfgre_doc_status = 'N';
"
"
"
"                 p_res := 'N';
"
"
"
"      END IF;
"
"
"
"
"
"      OPEN c6(cr1.mfgre_loc_id,cr1.mfgre_loc_type,cr1.mfgre_plnt);
"
"
"
"          FETCH c6 INTO cr6;
"
"
"
"          IF c6%NOTFOUND THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Location not found.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr1.mfgre_plnt
"
"         AND mfgre_res_id     = cr1.mfgre_res_id
"
"         AND mfgre_doc_type   = 'M'
"
"         AND mfgre_sel_user   = p_user
"
"         AND mfgre_doc_status = 'N';
"
"
"
"              p_res := 'N';
"
"
"
"          END IF;
"
"
"
"      CLOSE c6;
"
"
"
"
"
"      OPEN c7(cr1.mfgre_plnt,cr1.mfgre_fix_asset_id);
"
"
"
"          FETCH c7 INTO cr7;
"
"
"
"          IF c7%NOTFOUND AND cr1.mfgre_fix_asset_id IS NOT NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Fixed Asset not found.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr1.mfgre_plnt
"
"         AND mfgre_res_id     = cr1.mfgre_res_id
"
"         AND mfgre_doc_type   = 'M'
"
"         AND mfgre_sel_user   = p_user
"
"         AND mfgre_doc_status = 'N';
"
"
"
"             p_res := 'N';
"
"
"
"          END IF;
"
"
"
"      CLOSE c7;
"
"
"
"      IF cr1.mfgre_effciency < 0 OR cr1.mfgre_effciency IS NULL THEN
"
"
"
"                UPDATE mfg_resources_exception
"
"               SET mfgre_doc_status = 'E',
"
"                   mfgre_ref        = 'Efficiency should be greater than zero.',
"
"                   mfgre_upd_by     = p_user,
"
"                   mfgre_upd_date   = SYSDATE
"
"                 WHERE mfgre_bu         = p_bu
"
"               AND mfgre_plnt       = cr1.mfgre_plnt
"
"               AND mfgre_res_id     = cr1.mfgre_res_id
"
"               AND mfgre_doc_type   = 'M'
"
"               AND mfgre_sel_user   = p_user
"
"               AND mfgre_doc_status = 'N';
"
"
"
"             p_res := 'N';
"
"
"
"      END IF;
"
"
"
"      IF cr1.mfgre_own_flag NOT IN ('S','C','R') OR  cr1.mfgre_own_flag IS NULL THEN
"
"
"
"                         UPDATE mfg_resources_exception
"
"                    SET mfgre_doc_status = 'E',
"
"                        mfgre_ref        = 'Invalid value for ownership.',
"
"                        mfgre_upd_by     = p_user,
"
"                        mfgre_upd_date   = SYSDATE
"
"                      WHERE mfgre_bu         = p_bu
"
"                    AND mfgre_plnt       = cr1.mfgre_plnt
"
"                    AND mfgre_res_id     = cr1.mfgre_res_id
"
"                    AND mfgre_doc_type   = 'M'
"
"                    AND mfgre_sel_user   = p_user
"
"                    AND mfgre_doc_status = 'N';
"
"
"
"             p_res := 'N';
"
"
"
"      END IF;
"
"
"
"
"
"      OPEN c8(cr1.mfgre_cust_id,cr1.mfgre_own_flag);
"
"
"
"          FETCH c8 INTO cr8;
"
"
"
"          IF c8%NOTFOUND AND cr1.mfgre_cust_id IS NOT NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Owner not found.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr1.mfgre_plnt
"
"         AND mfgre_res_id     = cr1.mfgre_res_id
"
"         AND mfgre_doc_type   = 'M'
"
"         AND mfgre_sel_user   = p_user
"
"         AND mfgre_doc_status = 'N';
"
"
"
"             p_res := 'N';
"
"          END IF;
"
"
"
"      CLOSE c8;
"
"
"
"      OPEN c9(cr1.mfgre_plnt,cr1.mfgre_eqpmnt_id);
"
"
"
"          FETCH c9 INTO cr9;
"
"
"
"          IF c9%NOTFOUND AND cr1.mfgre_eqpmnt_id IS NOT NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Equipment not found.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr1.mfgre_plnt
"
"         AND mfgre_res_id     = cr1.mfgre_res_id
"
"         AND mfgre_doc_type   = 'M'
"
"         AND mfgre_sel_user   = p_user
"
"         AND mfgre_doc_status = 'N';
"
"
"
"                  p_res := 'N';
"
"
"
"          END IF;
"
"
"
"      CLOSE c9;
"
"
"
"      OPEN c10(cr1.mfgre_make_id);
"
"
"
"          FETCH c10 INTO cr10;
"
"
"
"          IF c10%NOTFOUND AND cr1.mfgre_make_id IS NOT NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Make not found.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr1.mfgre_plnt
"
"         AND mfgre_res_id     = cr1.mfgre_res_id
"
"         AND mfgre_doc_type   = 'M'
"
"         AND mfgre_sel_user   = p_user
"
"         AND mfgre_doc_status = 'N';
"
"
"
"          p_res := 'N';
"
"
"
"          END IF;
"
"
"
"      CLOSE c10;
"
"
"
"
"
"      OPEN c11(cr1.mfgre_model_id);
"
"
"
"          FETCH c11 INTO cr11;
"
"
"
"          IF c11%NOTFOUND AND cr1.mfgre_model_id IS NOT NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Model not found.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr1.mfgre_plnt
"
"         AND mfgre_res_id     = cr1.mfgre_res_id
"
"         AND mfgre_doc_type   = 'M'
"
"         AND mfgre_sel_user   = p_user
"
"         AND mfgre_doc_status = 'N';
"
"
"
"          p_res := 'N';
"
"
"
"
"
"          END IF;
"
"
"
"      CLOSE c11;
"
"
"
"      OPEN c12(cr1.mfgre_spec_id);
"
"
"
"          FETCH c12 INTO cr12;
"
"
"
"          IF c12%NOTFOUND AND cr1.mfgre_spec_id IS NOT NULL THEN
"
"
"
"          UPDATE mfg_resources_exception
"
"         SET mfgre_doc_status = 'E',
"
"             mfgre_ref        = 'Material Specification not found.',
"
"             mfgre_upd_by     = p_user,
"
"             mfgre_upd_date   = SYSDATE
"
"           WHERE mfgre_bu         = p_bu
"
"         AND mfgre_plnt       = cr1.mfgre_plnt
"
"         AND mfgre_res_id     = cr1.mfgre_res_id
"
"         AND mfgre_doc_type   = 'M'
"
"         AND mfgre_sel_user   = p_user
"
"         AND mfgre_doc_status = 'N';
"
"
"
"                 p_res := 'N';
"
"
"
"          END IF;
"
"
"
"      CLOSE c12;
"
"
"
"      END LOOP; --c1
"
"
"
"    END proc_chk_mfg_resources_mach;
"
"
"
"    PROCEDURE proc_upload_migr_tool (p_bu                VARCHAR2,
"
"                                     p_plnt                 VARCHAR2,
"
"                                     p_doc_no            VARCHAR2,
"
"                                     p_dir                VARCHAR2,
"
"                                     p_file_name        VARCHAR2,
"
"                                     p_user             VARCHAR2,
"
"                                     p_res        OUT     VARCHAR2
"
"
"
"                                    )
"
"    IS
"
"
"
"       v_create_table        VARCHAR2(4000);
"
"       v_insert_table        VARCHAR2(4000);
"
"       v_res_id                VARCHAR2(30);
"
"
"
"    BEGIN
"
"    p_res := 'N';
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"     DELETE mfg_resources_exception
"
"      WHERE mfgre_bu       = p_bu
"
"        AND mfgre_sel_user = p_user
"
"        AND mfgre_doc_type = 'T';
"
"
"
"
"
"       v_create_table := 'CREATE TABLE EXCEL_MIGRATION( em_unit                                VARCHAR2(25),
"
"                                                        em_tool_desc                           VARCHAR2(50),
"
"                                                        em_tool_grp_desc                       VARCHAR2(50),
"
"                                                        em_location                            VARCHAR2(50),
"
"                                                        em_loc_type                            VARCHAR2(1),
"
"                                                        em_est_life                            NUMBER(12,3),
"
"                                                        em_utilized                            NUMBER(12,3),
"
"                                                        em_dimension                           VARCHAR2(50)
"
"                                                        )
"
"                                          ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                                         SKIP 1
"
"                                                         FIELDS TERMINATED BY ''|''
"
"                                                         MISSING FIELD VALUES ARE NULL
"
"                                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                                        (      em_unit                          CHAR(255),
"
"                                                               em_tool_desc                     CHAR(255),
"
"                                                               em_tool_grp_desc                 CHAR(255),
"
"                                                               em_location                      CHAR(255),
"
"                                                               em_loc_type                      CHAR(255),
"
"                                                               em_est_life                      CHAR(255),
"
"                                                               em_utilized                      CHAR(255),
"
"                                                               em_dimension                     CHAR(255)
"
"                                                              ))
"
"                                                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"
"
"
"
"/*CREATE TABLE mfg_resources_exception(MFGRE_BU                                  NOT NULL VARCHAR2(5)
"
"MFGRE_PLNT                                         VARCHAR2(10)
"
"MFGRE_RES_ID                                       VARCHAR2(10)
"
"MFGRE_NAME1                                        VARCHAR2(100)
"
"MFGRE_GROUP_ID                                     VARCHAR2(10)
"
"MFGRE_UOM                                          VARCHAR2(5)
"
"MFGRE_EFF_FROM                                     DATE
"
"MFGRE_EFF_TO                                       DATE
"
"MFGRE_OWN_FLAG                                     VARCHAR2(1)
"
"MFGRE_EMP_ID                                       VARCHAR2(10)
"
"MFGRE_CUST_ID                                      VARCHAR2(10)
"
"MFGRE_EFFCIENCY                                    NUMBER(5,2)
"
"MFGRE_COST_BASIS                                   VARCHAR2(1)
"
"MFGRE_HRLY_RATE                                    NUMBER(12,3)
"
"MFGRE_DAILY_RATES                                  NUMBER(15,3)
"
"MFGRE_NO_OF_HRS                                    NUMBER(5)
"
"MFGRE_MACH_TYPE                                    VARCHAR2(2)
"
"MFGRE_POWER_MULTI_FACT_MACH                        NUMBER(7)
"
"MFGRE_LOC_TYPE                                     VARCHAR2(1)
"
"MFGRE_LOC_ID                                       VARCHAR2(15)
"
"MFGRE_FIX_ASSET_ID                                 VARCHAR2(20)
"
"MFGRE_EQPMNT_ID                                    VARCHAR2(25)
"
"MFGRE_MAKE_ID                                      VARCHAR2(10)
"
"MFGRE_MODEL_ID                                     VARCHAR2(10)
"
"MFGRE_SPEC_ID                                      VARCHAR2(10)
"
"MFGRE_REFERENCE                                    VARCHAR2(50)
"
"MFGRE_SHARE_FLAG                                   VARCHAR2(1)
"
"MFGRE_PROD_ID                                      VARCHAR2(25)
"
"MFGRE_PROD_REV                                     NUMBER(5)
"
"MFGRE_FUR_CAPACITY                                 NUMBER(5)
"
"MFGRE_CONTR_STATUS                                 VARCHAR2(1)
"
"MFGRE_DOC_TYPE                            NOT NULL VARCHAR2(1)
"
"MFGRE_DOC_STATUS                          NOT NULL VARCHAR2(1)
"
"MFGRE_REF                                          VARCHAR2(50)
"
"MFGRE_SEL_USER                                     VARCHAR2(15)
"
"MFGRE_EST_LIFE                                     NUMBER(12,3)
"
"MFGRE_UTILIZED                            NOT NULL NUMBER(12,3)
"
"MFGRE_DIMENSION                                    VARCHAR2(50)
"
"MFGRE_GRP_DESC                                     VARCHAR2(100)
"
"MFGRE_CUST_DESC                                    VARCHAR2(100)
"
"MFGRE_CRE_BY                              NOT NULL VARCHAR2(15)
"
"MFGRE_CRE_IP_ADDR                                  VARCHAR2(20)
"
"MFGRE_CRE_OS_USER                                  VARCHAR2(50)
"
"MFGRE_CRE_DATE                            NOT NULL DATE
"
"MFGRE_UPD_BY                                       VARCHAR2(15)
"
"MFGRE_UPD_IP_ADDR                                  VARCHAR2(20)
"
"MFGRE_UPD_OS_USER                                  VARCHAR2(50)
"
"MFGRE_UPD_DATE                                     DATE
"
"MFGRE_CRE_EMP_ID                                   VARCHAR2(10)
"
"MFGRE_UPD_EMP_ID                                   VARCHAR2(10)        */
"
"
"
"       EXECUTE IMMEDIATE v_create_table;
"
"
"
"       v_insert_table := 'INSERT INTO mfg_resources_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                               '|| CHR(39) || p_plnt || CHR(39) ||','||'
"
"                                                               NULL       ,
"
"                                                               em_tool_desc     ,
"
"                                                               NULL,
"
"                                                               NULL     ,
"
"                                                               NULL,
"
"                                                               NULL ,
"
"                                                               '|| CHR(39) || 'N' || CHR(39) ||','||'
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               0,
"
"                                                               '|| CHR(39) || 'H' || CHR(39) ||','||'
"
"                                                               0,
"
"                                                               0,
"
"                                                               0,
"
"                                                               '|| CHR(39) || 'N' || CHR(39) ||','||'
"
"                                                               0,
"
"                                                               em_loc_type,
"
"                                                               NULL ,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL ,
"
"                                                               NULL,
"
"                                                               '|| CHR(39) || 'N' || CHR(39) ||','||'
"
"                                                               NULL,
"
"                                                               NULL,'
"
"                                                               ||CHR(39) || '0' || CHR(39)||','
"
"                                                               ||CHR(39) || 'I' || CHR(39)||','
"
"                                                               ||CHR(39) || 'T' || CHR(39)||','
"
"                                                               ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                               NULL,'
"
"                                                               ||CHR(39) || p_user || CHR(39)||','||'
"
"                                                               em_est_life,
"
"                                                               em_utilized,
"
"                                                               em_dimension,
"
"                                                               em_tool_grp_desc,
"
"                                                               em_location,
"
"                                                               '||CHR(39) || p_user   || CHR(39)||','||'
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               SYSDATE,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL
"
"                                                        FROM excel_migration)';
"
"
"
"    EXECUTE IMMEDIATE v_insert_table;
"
"    p_res := 'Y';
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_upload_migr_tool;
"
"
"
"    PROCEDURE proc_ins_migr_tool
"
"                            (p_bu       VARCHAR2,
"
"                             p_plnt        VARCHAR2,
"
"                             p_user     VARCHAR2,
"
"                             p_res OUT     VARCHAR2
"
"                            )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mfg_resources_exception
"
"     WHERE mfgre_bu         = p_bu
"
"       AND mfgre_plnt         = p_plnt
"
"       AND mfgre_doc_type   = 'T'
"
"       AND mfgre_doc_status = 'N'
"
"       AND mfgre_sel_user   = p_user;
"
"
"
"    CURSOR c2(c_grp_desc VARCHAR2)
"
"        IS
"
"    SELECT mfgrg_grp_id
"
"      FROM mfg_res_groups
"
"     WHERE mfgrg_bu = p_bu
"
"       AND mfgrg_plnt = p_plnt
"
"       AND TRIM(mfgrg_desc1) = TRIM(c_grp_desc);
"
"
"
"    CURSOR c3(c_proc_desc VARCHAR2)
"
"        IS
"
"    SELECT process_id
"
"      FROM processes
"
"     WHERE process_bu = p_bu
"
"       AND process_plnt = p_plnt
"
"       AND TRIM(process_name1) = TRIM(c_proc_desc);
"
"
"
"    v_next_id    VARCHAR2(10);
"
"    v_res_id    VARCHAR2(10);
"
"    v_grp_id     VARCHAR2(4000);
"
"    v_proc_id     VARCHAR2(4000);
"
"
"
"    cr2        c2%ROWTYPE;
"
"    cr3        c3%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"        FOR cr1 IN c1
"
"        LOOP
"
"
"
"                OPEN c2(cr1.mfgre_grp_desc);
"
"                    FETCH c2 INTO cr2;
"
"                    IF c2%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20400,'ICM');
"
"                    END IF;
"
"                CLOSE c2;
"
"
"
"                IF cr1.mfgre_loc_type = 'W' THEN
"
"                OPEN c3(cr1.mfgre_cust_desc);
"
"                    FETCH c3 INTO cr3;
"
"                    IF c3%NOTFOUND THEN
"
"                        RAISE_APPLICATION_ERROR(-20569,'PLN');
"
"                    END IF;
"
"                CLOSE c3;
"
"                END IF;
"
"
"
"                 SELECT MAX(mfgr_res_id)
"
"                   INTO v_next_id
"
"                   FROM mfg_resources
"
"                  WHERE mfgr_bu = p_bu
"
"                    AND mfgr_plnt = cr1.mfgre_plnt;
"
"
"
"                /*SELECT mfgrg_grp_id
"
"                   INTO v_grp_id
"
"                  FROM mfg_res_groups
"
"                 WHERE mfgrg_bu = p_bu
"
"                   AND mfgrg_plnt = p_plnt
"
"                   AND TRIM(mfgrg_desc1) = TRIM(cr1.mfgre_grp_desc);
"
"
"
"                SELECT process_id
"
"                  INTO v_proc_id
"
"                  FROM processes
"
"                 WHERE process_bu = p_bu
"
"                   AND process_plnt = p_plnt
"
"                   AND TRIM(process_name1) = TRIM(cr1.mfgre_cust_desc);
"
"
"
"                 IF v_proc_id IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM');
"
"                 END IF;
"
"
"
"                 IF v_grp_id IS NULL THEN
"
"                    RAISE_APPLICATION_ERROR(-20400,'ICM');
"
"                 END IF;*/
"
"
"
"
"
"                v_res_id := func_find_next_id(v_next_id);
"
"
"
"                 INSERT INTO mfg_resources(
"
"                                           mfgr_bu      ,
"
"                                           mfgr_plnt    ,
"
"                                           mfgr_res_id  ,
"
"                                           mfgr_name1   ,
"
"                                           mfgr_hrly_rate,
"
"                                           mfgr_group_id ,
"
"                                           mfgr_eff_from ,
"
"                                           mfgr_eff_to   ,
"
"                                           mfgr_avbl_hrs_day,
"
"                                           mfgr_emp_id      ,
"
"                                           mfgr_uom         ,
"
"                                           mfgr_effciency   ,
"
"                                           mfgr_unit_cost   ,
"
"                                           mfgr_res_type    ,
"
"                                           mfgr_cre_by      ,
"
"                                           mfgr_cre_date    ,
"
"                                           mfgr_upd_by      ,
"
"                                           mfgr_upd_date    ,
"
"                                           mfgr_loc_type    ,
"
"                                           mfgr_share_flag  ,
"
"                                           mfgr_loc_id      ,
"
"                                           mfgr_status      ,
"
"                                           mfgr_own_flag    ,
"
"                                           mfgr_cust_id     ,
"
"                                           mfgr_no_cavity   ,
"
"                                           mfgr_emp_req     ,
"
"                                           mfgr_iact_sel_flag ,
"
"                                           mfgr_utilized      ,
"
"                                           mfgr_fur_type      ,
"
"                                           mfgr_fur_capacity  ,
"
"                                           mfgr_amort_rqrd_flag,
"
"                                           mfgr_cost_basis     ,
"
"                                           mfgr_mach_cost      ,
"
"                                           mfgr_maint_cost     ,
"
"                                           mfgr_elect_cost     ,
"
"                                           mfgr_labour_cost    ,
"
"                                           mfgr_no_of_heats    ,
"
"                                           mfgr_lld_heats      ,
"
"                                           mfgr_no_of_trolly   ,
"
"                                           mfgr_no_of_rods     ,
"
"                                           mfgr_run_hrs        ,
"
"                                           mfgr_elasped_hrs    ,
"
"                                           mfgr_fmcg_status    ,
"
"                                           mfgr_sel_flag       ,
"
"                                           mfgr_contr_status   ,
"
"                                           mfgr_daily_rates    ,
"
"                                           mfgr_no_of_hrs      ,
"
"                                           mfgr_power_multi_fact_mach,
"
"                                           mfgr_power_multi_fact_furnace,
"
"                                           mfgr_child_tool_req_flag     ,
"
"                                           mfgr_mach_type ,
"
"                                           mfgr_dimension,
"
"                                           mfgr_life
"
"                                         )
"
"                                    VALUES(p_bu                ,
"
"                                           cr1.mfgre_plnt      ,
"
"                                           v_res_id   ,
"
"                                           cr1.mfgre_name1     ,
"
"                                           cr1.mfgre_hrly_rate ,
"
"                                           cr2.mfgrg_grp_id,
"
"                                           SYSDATE  ,
"
"                                           '31-Dec-2999'    ,
"
"                                           0,
"
"                                           cr1.mfgre_emp_id,
"
"                                           cr1.mfgre_uom   ,
"
"                                           cr1.mfgre_effciency,
"
"                                           0,
"
"                                           'T',
"
"                                           p_user,
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           cr1.mfgre_loc_type,--'W',
"
"                                           'N',
"
"                                           cr3.process_id,
"
"                                           'C',
"
"                                           'S',
"
"                                           NULL,
"
"                                           0,
"
"                                           'N',
"
"                                           'N',
"
"                                           cr1.mfgre_utilized,
"
"                                           'H',
"
"                                           0,
"
"                                           'N',
"
"                                           cr1.mfgre_cost_basis,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           0,
"
"                                           'R',
"
"                                           'N',
"
"                                           'I',
"
"                                           cr1.mfgre_daily_rates,
"
"                                           cr1.mfgre_no_of_hrs,
"
"                                           1,
"
"                                           1,
"
"                                           'N',
"
"                                           cr1.mfgre_mach_type,
"
"                                           cr1.mfgre_dimension,
"
"                                           cr1.mfgre_est_life
"
"                                          );
"
"
"
"                            p_res := v_res_id;
"
"
"
"        DELETE mfg_resources_exception
"
"         WHERE mfgre_bu         = p_bu
"
"           AND mfgre_plnt = p_plnt
"
"           AND mfgre_doc_type   = 'T'
"
"           AND mfgre_doc_status = 'N'
"
"           AND mfgre_sel_user   = p_user;
"
"
"
"        END LOOP;
"
"
"
"    END proc_ins_migr_tool;
"
"
"
"  PROCEDURE   proc_inc_ei_assy_dtls  (p_bu            VARCHAR2,
"
"                                      p_file_name    VARCHAR2,
"
"                                      p_user        VARCHAR2,
"
"                                      p_res      OUT    VARCHAR2
"
"                                      )
"
"  IS
"
"
"
"    v_seq_no          VARCHAR2(5);
"
"    v_assy                VARCHAR2(10);
"
"    v_assy_id         VARCHAR2(10);
"
"    v_exc_assy_id     VARCHAR2(10);
"
"    v_create_table    VARCHAR2(4000);
"
"    v_count_exp          NUMBER;
"
"
"
"
"
"
"
"  i    NUMBER := 1;
"
"  v_result  VARCHAR2(1) := 'N';
"
"  v_res     VARCHAR2(4000);
"
"
"
"BEGIN
"
"
"
"   /* DELETE ei_assy_exception
"
"      WHERE eae_bu = p_bu;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"                v_create_table := 'CREATE TABLE EXCEL_MIGRATION  ( EMS_ASSY_DESC                 VARCHAR2(100)
"
"                                                                      )
"
"                                                ORGANIZATION EXTERNAL(
"
"                                                        TYPE ORACLE_LOADER
"
"                                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                        ACCESS PARAMETERS(
"
"                                                                  RECORDS DELIMITED BY NEWLINE
"
"                                                                  SKIP 1
"
"                                                                  FIELDS TERMINATED BY ''|''
"
"                                                                  MISSING FIELD VALUES ARE NULL
"
"                                                                  REJECT ROWS WITH ALL NULL FIELDS
"
"                                                                  (EMS_ASSY_DESC                   CHAR(255)
"
"                                                                  )
"
"                                                                )
"
"                                  LOCATION ('''||p_file_name||''')
"
"                                  ) REJECT LIMIT UNLIMITED';
"
"
"
"                EXECUTE IMMEDIATE v_create_table;
"
"
"
"      OPEN r_assy FOR 'SELECT * FROM EXCEL_MIGRATION';
"
"      LOOP
"
"      FETCH r_assy INTO r_assy_dtls(i);
"
"       i := i+1;
"
"      EXIT WHEN r_assy%NOTFOUND;
"
"      END LOOP;
"
"
"
"       FOR i IN 1..r_assy_dtls.COUNT
"
"       LOOP
"
"
"
"            proc_chk_excep_assy
"
"                               (
"
"                               p_bu,
"
"                               p_user,
"
"                               r_assy_dtls(i).ems_assy_desc ,
"
"                               v_res
"
"                               );
"
"
"
"        OPEN c_exists(r_assy_dtls(i).ems_assy_desc);
"
"        FETCH c_exists INTO cr_exists;
"
"           IF c_exists%NOTFOUND THEN
"
"
"
"            SELECT MAX(ea_assy_id)
"
"              INTO v_assy
"
"              FROM ei_assy
"
"             WHERE ea_bu = p_bu;
"
"
"
"
"
"                        v_assy_id     := func_get_next_id(v_assy);
"
"
"
"               SELECT NVL(MAX(ea_print_seq_no),0)+ 1
"
"                  INTO v_seq_no
"
"                  FROM ei_assy
"
"                WHERE ea_bu = p_bu;
"
"
"
"                    INSERT INTO ei_assy(ea_bu        ,
"
"                            ea_assy_id    ,
"
"                            ea_assy_desc  ,
"
"                            ea_cre_by     ,
"
"                            ea_cre_date   ,
"
"                            ea_upd_by    ,
"
"                            ea_upd_date  ,
"
"                            ea_print_seq_no
"
"                                )
"
"                          VALUES
"
"                               (p_bu            ,
"
"                                v_assy_id        ,
"
"                                r_assy_dtls(i).ems_assy_desc  ,
"
"                                p_user ,
"
"                                SYSDATE,
"
"                                NULL  ,
"
"                                NULL,
"
"                                v_seq_no
"
"                               );
"
"           END IF;
"
"        CLOSE c_exists;
"
"
"
"        END LOOP;
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        OPEN c_check_exp;
"
"        FETCH c_check_exp INTO cr_check_exp;
"
"           IF cr_check_exp.v_count = 0 THEN
"
"              v_result    := 'N';
"
"           ELSE
"
"              v_result    := 'Y';
"
"           END IF;
"
"        CLOSE c_check_exp;
"
"
"
"        p_res := v_result;*/
"
"        null;
"
"
"
"
"
"END proc_inc_ei_assy_dtls;
"
"
"
"  PROCEDURE proc_inc_ei_assy_proc_dtls (p_bu        VARCHAR2,
"
"                                        p_assy_id    VARCHAR2,
"
"                                        p_file_name    VARCHAR2,
"
"                                        p_user        VARCHAR2,
"
"                                        p_res     OUT    VARCHAR2
"
"                                        )
"
"  IS
"
"
"
"    v_oprn_id         VARCHAR2(10);
"
"    v_assy_id          VARCHAR2(10);
"
"    v_proc_seq          NUMBER(5);
"
"    v_create_table    VARCHAR2(4000);
"
"    v_insert_table    VARCHAR2(4000);
"
"    v_assy_desc         varchar2(2000);
"
"    v_count_exp          NUMBER;
"
"    v_result          VARCHAR2(1) := 'N';
"
"
"
"   CURSOR c_proc(c_proc_desc VARCHAR2)
"
"     IS
"
"   SELECT *
"
"     FROM mfg_oprns
"
"    WHERE mfgo_bu = p_bu
"
"      AND mfgo_desc1 = c_proc_desc;
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
"   i         NUMBER := 1;
"
"   cr_proc     c_proc%ROWTYPE;
"
"
"
"   PRAGMA AUTONOMOUS_TRANSACTION;
"
"
"
"BEGIN
"
"
"
"  /*DELETE ei_assy_proc_exp
"
"   WHERE eape_bu = p_bu;
"
"
"
"   v_result := 'N';
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"                EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION
"
"                                                             (
"
"                                                            ema_assy_desc        VARCHAR2(100),
"
"                                                            ema_proc_desc        VARCHAR2(30)
"
"                                                             )
"
"                                                ORGANIZATION EXTERNAL(
"
"                                                  TYPE ORACLE_LOADER
"
"                                                      DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                      ACCESS PARAMETERS(
"
"                                                            RECORDS DELIMITED BY NEWLINE
"
"                                                            SKIP 1
"
"                                                            FIELDS TERMINATED BY ''|''
"
"                                                            MISSING FIELD VALUES ARE NULL
"
"                                                            REJECT ROWS WITH ALL NULL FIELDS
"
"                                                            (
"
"                                                           ema_assy_desc        CHAR(255),
"
"                                                           ema_proc_desc        CHAR(255)
"
"                                                             )
"
"                                                                         )
"
"                                                          LOCATION ('''||p_file_name||''')
"
"                                                          ) REJECT LIMIT UNLIMITED';
"
"
"
"                --EXECUTE IMMEDIATE v_create_table;
"
"
"
"                OPEN r_assy_proc FOR 'SELECT ema_assy_desc,
"
"                                             ema_proc_desc
"
"                                        FROM excel_migration
"
"                                      GROUP BY ema_assy_desc,
"
"                                               ema_proc_desc';
"
"                LOOP
"
"                FETCH r_assy_proc INTO r_assy_proc_dtls(i);
"
"                 i := i+1;
"
"                 EXIT WHEN r_assy_proc%NOTFOUND;
"
"                END LOOP;
"
"
"
"                 FOR i IN 1.. r_assy_proc_dtls.COUNT
"
"                 LOOP
"
"
"
"                    OPEN c_proc(r_assy_proc_dtls(i).ema_proc_desc);
"
"                    FETCH c_proc INTO cr_proc;
"
"
"
"                    IF c_proc%NOTFOUND THEN
"
"
"
"                        INSERT INTO ei_assy_proc_exp(
"
"                                                     eape_bu        ,
"
"                                                     eape_assy_desc ,
"
"                                                     eape_proc_desc ,
"
"                                                     eape_exp_ref   ,
"
"                                                     eape_cre_by    ,
"
"                                                     eape_cre_date
"
"                                                     )
"
"                                                     VALUES(
"
"                                                            p_bu        ,
"
"                                                            r_assy_proc_dtls(i).ema_assy_desc ,
"
"                                                            r_assy_proc_dtls(i).ema_proc_desc ,
"
"                                                            'Process not found.'   ,
"
"                                                            p_user    ,
"
"                                                            SYSDATE
"
"                                                            );
"
"
"
"                    --IF SQL%FOUND THEN
"
"                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_assy_desc||'~'||r_assy_proc_dtls(i).ema_proc_desc);
"
"                    --END IF;
"
"
"
"                    COMMIT;
"
"                    ELSE
"
"                       v_oprn_id := cr_proc.mfgo_oprn_id;
"
"                    END IF;
"
"                    CLOSE c_proc;
"
"
"
"                    OPEN c_assy(r_assy_proc_dtls(i).ema_assy_desc);
"
"                    FETCH c_assy INTO cr_assy;
"
"
"
"                    IF c_assy%NOTFOUND THEN
"
"
"
"                        INSERT INTO ei_assy_proc_exp(
"
"                                                     eape_bu        ,
"
"                                                     eape_assy_desc ,
"
"                                                     eape_proc_desc ,
"
"                                                     eape_exp_ref   ,
"
"                                                     eape_cre_by    ,
"
"                                                     eape_cre_date
"
"                                                     )
"
"                                                     VALUES(
"
"                                                            p_bu        ,
"
"                                                            r_assy_proc_dtls(i).ema_assy_desc ,
"
"                                                            NULL ,
"
"                                                            'Assembly not found.'   ,
"
"                                                            p_user    ,
"
"                                                            SYSDATE
"
"                                                            );
"
"
"
"                    --IF SQL%FOUND THEN
"
"                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_assy_desc||'~'||r_assy_proc_dtls(i).ema_proc_desc);
"
"                    --END IF;
"
"
"
"                    COMMIT;
"
"                    ELSE
"
"                       v_assy_id := cr_assy.ea_assy_id;
"
"                    END IF;
"
"                    CLOSE c_assy;
"
"
"
"                    SELECT COUNT(*)
"
"                      INTO v_count_exp
"
"                      FROM ei_assy_proc_exp
"
"                     WHERE eape_bu = p_bu
"
"                       AND eape_assy_desc = r_assy_proc_dtls(i).ema_assy_desc;
"
"
"
"                    IF v_count_exp > 0 THEN
"
"                        RAISE_APPLICATION_ERROR(-20474,'SFM');
"
"                    END IF;
"
"
"
"                       SELECT NVL(MAX(eap_proc_seq),0) + 1
"
"                         INTO v_proc_seq
"
"                         FROM ei_assy_proc
"
"                        WHERE eap_bu    = p_bu
"
"                          AND eap_assy_id  = v_assy_id;
"
"
"
"                      INSERT INTO ei_assy_proc(eap_bu       ,
"
"                                               eap_assy_id   ,
"
"                                               eap_proc_id   ,
"
"                                               eap_proc_seq  ,
"
"                                               eap_cre_by    ,
"
"                                               eap_cre_date ,
"
"                                               eap_upd_by   ,
"
"                                               eap_upd_date
"
"                                               )
"
"                                             VALUES
"
"                                              (
"
"                                               p_bu       ,
"
"                                               v_assy_id   ,
"
"                                               v_oprn_id   ,
"
"                                               v_proc_seq  ,
"
"                                               p_user    ,
"
"                                               SYSDATE ,
"
"                                               NULL   ,
"
"                                               NULL
"
"                                              );
"
"
"
"                            v_result := 'Y';
"
"
"
"                         END LOOP;
"
"
"
"                 p_res := v_result;
"
"
"
"                proc_drop_exist_table('EXCEL_MIGRATION');*/
"
"                null;
"
"
"
"    END proc_inc_ei_assy_proc_dtls;
"
"
"
"     PROCEDURE  proc_ins_ei_prj_plan_ln
"
"                      (
"
"                    p_bu           VARCHAR2,
"
"                    p_plnt         VARCHAR2,
"
"                    p_doc_no       VARCHAR2,
"
"                    p_doc_rev      NUMBER,
"
"                    p_file_name    VARCHAR2,
"
"                    p_user         VARCHAR2
"
"                      )
"
"     IS
"
"     v_seq_no NUMBER(5);
"
"
"
"     v_assy_id         VARCHAR2(25);
"
"     v_par_assy_id     VARCHAR2(25);
"
"     v_create_table    VARCHAR2(4000);
"
"     v_insert_table    VARCHAR2(4000);
"
"
"
"     TYPE ei_prj_plan_dtls IS RECORD (em_assy_desc                     VARCHAR2(100),
"
"                      em_par_assy_desc            VARCHAR2(100),
"
"                      em_plan_start_date          DATE,
"
"                      em_plan_end_date            DATE,
"
"                      em_assy_qty                     NUMBER(5)
"
"                      );
"
"
"
"     TYPE ei_prj_plan IS TABLE OF ei_prj_plan_dtls INDEX BY PLS_INTEGER;
"
"
"
"     r_prj_plan    ei_prj_plan;
"
"
"
"     TYPE t_prj IS REF CURSOR;
"
"
"
"     r_prj    t_prj;
"
"
"
"     i        NUMBER := 1;
"
"
"
"     v_start_date   DATE;
"
"     v_end_date     DATE;
"
"     BEGIN
"
"
"
"     proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"/*    DELETE ei_prj_plan_mat_rqrmnt
"
"    WHERE eppmr_bu = p_bu
"
"      AND eppmr_plnt = p_plnt
"
"      AND eppmr_doc_no = p_doc_no
"
"      AND eppmr_doc_rev = p_doc_rev;
"
"
"
"       DELETE ei_prj_plan_proc
"
"     WHERE eppp_bu = p_bu
"
"       AND eppp_plnt = p_plnt
"
"       AND eppp_doc_no = p_doc_no
"
"       AND eppp_doc_rev = p_doc_rev;
"
"
"
"
"
"         DELETE ei_prj_plan_ln
"
"          WHERE eppl_bu = p_bu
"
"            AND eppl_plnt = p_plnt
"
"            AND eppl_doc_no = p_doc_no
"
"            AND eppl_doc_rev = p_doc_rev;
"
"
"
"                         v_create_table := 'CREATE TABLE EXCEL_MIGRATION
"
"                                   (
"
"                                     em_assy_desc                   VARCHAR2(100),
"
"                                     em_par_assy_desc            VARCHAR2(100),
"
"                                     em_plan_start_date          DATE,
"
"                                     em_plan_end_date            DATE,
"
"                                     em_assy_qty                       NUMBER(5)
"
"                                     )
"
"                         ORGANIZATION EXTERNAL(
"
"                             TYPE ORACLE_LOADER
"
"                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                 ACCESS PARAMETERS(
"
"                                           RECORDS DELIMITED BY NEWLINE
"
"                                           SKIP 1
"
"                                           FIELDS TERMINATED BY ''|''
"
"                                           MISSING FIELD VALUES ARE NULL
"
"                                           REJECT ROWS WITH ALL NULL FIELDS
"
"                                           (
"
"                                            em_assy_desc          CHAR(255),
"
"                                            em_par_assy_desc           CHAR(255),
"
"                                            em_plan_start_date         CHAR(255)    DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                            em_plan_end_date           CHAR(255)    DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                            em_assy_qty              CHAR(255)
"
"                                     )
"
"                             )
"
"                         LOCATION ('''||p_file_name||''')
"
"                         ) REJECT LIMIT UNLIMITED';
"
"
"
"             EXECUTE IMMEDIATE v_create_table;
"
"
"
"             OPEN r_prj FOR 'SELECT * FROM EXCEL_MIGRATION';
"
"             LOOP
"
"             FETCH r_prj INTO r_prj_plan(i);
"
"             i := i + 1;
"
"             EXIT WHEN r_prj%NOTFOUND;
"
"             END LOOP;
"
"             CLOSE r_prj;
"
"
"
"             FOR i IN 1..r_prj_plan.COUNT
"
"             LOOP
"
"
"
"                 BEGIN
"
"                     SELECT ea_assy_id
"
"                       INTO v_assy_id
"
"                       FROM ei_assy
"
"                      WHERE ea_bu       = p_bu
"
"                       AND ea_assy_desc = r_prj_plan(i).em_assy_desc;
"
"                 EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20474,'PLN');
"
"                 END;
"
"
"
"                 BEGIN
"
"                       SELECT ea_assy_id
"
"                         INTO v_par_assy_id
"
"                         FROM ei_assy
"
"                        WHERE ea_bu        = p_bu
"
"                          AND ea_assy_desc = r_prj_plan(i).em_par_assy_desc;
"
"
"
"                 EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20474,'PLN'||'/'||r_prj_plan(i).em_par_assy_desc);
"
"                 END;
"
"
"
"                 SELECT epph_start_date ,
"
"                               epph_end_date
"
"                          INTO v_start_date,
"
"                               v_end_date
"
"                          FROM ei_prj_plan_hd
"
"                         WHERE epph_bu   = p_bu
"
"                           AND epph_plnt = p_plnt
"
"                           AND epph_doc_no = p_doc_no
"
"                           AND epph_doc_rev = p_doc_rev;
"
"
"
"                        IF v_start_date > r_prj_plan(i).em_plan_start_date OR v_end_date < r_prj_plan(i).em_plan_end_date  OR v_start_date > v_end_date THEN
"
"                           raise_application_error(-20495,'HRM');
"
"                           END IF;
"
"
"
"
"
"                 SELECT NVL(MAX(eppl_seq_no),0) + 1
"
"                   INTO v_seq_no
"
"                   FROM ei_prj_plan_ln
"
"                  WHERE eppl_bu = p_bu
"
"                    AND eppl_plnt  = p_plnt
"
"                    AND eppl_doc_no = p_doc_no
"
"                    AND eppl_doc_rev  = p_doc_rev;
"
"
"
"                             INSERT INTO ei_prj_plan_ln(
"
"                                         eppl_bu                ,
"
"                                         eppl_plnt              ,
"
"                                         eppl_doc_no            ,
"
"                                         eppl_doc_rev           ,
"
"                                         eppl_seq_no            ,
"
"                                         eppl_assy_id           ,
"
"                                         eppl_par_assy_id       ,
"
"                                         eppl_plan_start_date,
"
"                                         eppl_plan_end_date   ,
"
"                                         eppl_act_start_date   ,
"
"                                         eppl_act_end_date      ,
"
"                                         eppl_cre_by            ,
"
"                                         eppl_cre_date          ,
"
"                                         eppl_upd_by            ,
"
"                                         eppl_upd_date          ,
"
"                                         eppl_assy_qty          ,
"
"                                         eppl_status
"
"                                         )
"
"                                     VALUES(
"
"                                        p_bu,
"
"                                        p_plnt,
"
"                                        p_doc_no,
"
"                                        p_doc_rev,
"
"                                        v_seq_no,
"
"                                        v_assy_id,
"
"                                        v_par_assy_id,
"
"                                        r_prj_plan(i).em_plan_start_date,
"
"                                        r_prj_plan(i).em_plan_end_date,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        p_user,
"
"                                        SYSDATE,
"
"                                        NULL,
"
"                                        NULL,
"
"                                        r_prj_plan(i).em_assy_qty,
"
"                                        'N'
"
"                                        );
"
"
"
"             END LOOP;
"
"
"
"          proc_drop_exist_table('EXCEL_MIGRATION');*/
"
"          null;
"
"
"
"  END proc_ins_ei_prj_plan_ln;
"
"
"
"  PROCEDURE proc_ins_ei_prj_plan_proc
"
"                   (
"
"                   p_bu           VARCHAR2,
"
"                   p_plnt         VARCHAR2,
"
"                   p_doc_no       VARCHAR2,
"
"                   p_doc_rev      NUMBER,
"
"                   p_file_name    VARCHAR2,
"
"                   p_user         VARCHAR2
"
"                   )
"
"  IS
"
"
"
"  v_seq_no         NUMBER(5) := 0;
"
"  v_sub_seq_no     NUMBER(5) := 0;
"
"
"
"  v_proc_id         VARCHAR2(10);
"
"
"
"  v_create_table    VARCHAR2(4000);
"
"
"
"
"
"
"
"
"
"  v_cnt        NUMBER;
"
"  v_assy_id    VARCHAR2(10);
"
"  v_rpt_id     VARCHAR2(10);
"
"  v_count        NUMBER;
"
"
"
"  BEGIN
"
"
"
"  proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"
"
"      EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION
"
"                                 (
"
"                                em_assy_desc                       VARCHAR2(100),
"
"                                em_proc_desc                    VARCHAR2(300),
"
"                                em_plan_start_date           DATE,
"
"                                em_plan_end_date            DATE,
"
"                                em_ir_flag                  VARCHAR2(1),
"
"                                em_vsl_rpt_desc             VARCHAR2(50),
"
"                                em_markup_no                   VARCHAR2(50),
"
"                                em_prod_id                      VARCHAR2(25),
"
"                                em_prod_rev                      NUMBER(5),
"
"                                em_uom                        VARCHAR2(10),
"
"                                em_rqrd_qty                         NUMBER(15,3)
"
"                                 )
"
"                    ORGANIZATION EXTERNAL(
"
"                      TYPE ORACLE_LOADER
"
"                          DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                          ACCESS PARAMETERS(
"
"                                RECORDS DELIMITED BY NEWLINE
"
"                                SKIP 1
"
"                                FIELDS TERMINATED BY ''|''
"
"                                MISSING FIELD VALUES ARE NULL
"
"                                REJECT ROWS WITH ALL NULL FIELDS
"
"                                (
"
"                               em_assy_desc              CHAR(255),
"
"                                 em_proc_desc                 CHAR(255),
"
"                                 em_plan_start_date     CHAR(255)    DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                 em_plan_end_date       CHAR(255)    DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                 em_ir_flag             CHAR(255),
"
"                                 em_vsl_rpt_desc        CHAR(255),
"
"                                 em_markup_no              CHAR(255),
"
"                                 em_prod_id              CHAR(255),
"
"                                 em_prod_rev              CHAR(255),
"
"                                 em_uom                  CHAR(255),
"
"                                 em_rqrd_qty                 CHAR(255)
"
"                                 )
"
"                                             )
"
"                              LOCATION ('''||p_file_name||''')
"
"                              ) REJECT LIMIT UNLIMITED';
"
"
"
"      --EXECUTE IMMEDIATE v_create_table;
"
"
"
"      /*PLAN PROCESS*/
"
"
"
"      /*SELECT COUNT(*)
"
"       INTO v_count
"
"      FROM excel_migration;
"
"
"
"      RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_count);*/
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
"          /*PLAN MATERIAL REQUIREMENT*/
"
"
"
"
"
"
"
"
"
"          /*END PLAN MATERIAL REQUIREMENT*/
"
"
"
"            proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"END proc_ins_ei_prj_plan_proc;
"
"
"
"PROCEDURE proc_upd_cut_end_bits_dtls(p_bu        VARCHAR2,
"
"                     p_plnt        VARCHAR2,
"
"                     p_doc_no        VARCHAR2,
"
"                     p_thickness      VARCHAR2,
"
"                     p_lot_no        VARCHAR2,
"
"                     p_file_name    VARCHAR2,
"
"                     p_user        VARCHAR2
"
"                     )
"
"    IS
"
"
"
"--cr1            c1%ROWTYPE;
"
"v_cnt          NUMBER;
"
"v_seq_no      NUMBER(5);
"
"v_store_id      VARCHAR2(10);
"
"v_so_pfx      VARCHAR2(5);
"
"v_so_no          VARCHAR2(15);
"
"v_so_seq_no      NUMBER(5);
"
"v_so_sub_seq_no      NUMBER(5);
"
"v_create_table    VARCHAR2(4000);
"
"
"
"
"
"    TYPE  sht_cut_end_bits   IS RECORD (ems_width        NUMBER(10,3),
"
"                    ems_length            NUMBER(10,3),
"
"                    ems_prod_id           VARCHAR2(25),
"
"                    ems_prod_rev        NUMBER(5),
"
"                    ems_store_desc        VARCHAR2(30),
"
"                    ems_so_schld_desc    VARCHAR2(200),
"
"                    ems_no_of_slits        NUMBER(12,3),
"
"                    ems_prod_qty        NUMBER(12,3)
"
"                       );
"
"
"
"TYPE  sht_cut_end_bits_dtls IS TABLE OF sht_cut_end_bits INDEX BY PLS_INTEGER;
"
"
"
"r_cut_bit_dtls        sht_cut_end_bits_dtls;
"
"
"
"TYPE type_ref_cur    IS REF CURSOR;
"
"
"
"r_ref_cur    type_ref_cur;
"
"
"
"start_time    NUMBER;
"
"
"
"BEGIN
"
"
"
"proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"    --RAISE_APPLICATION_ERROR(-20999,'HRM'||' ' ||DBMS_UTILITY.GET_TIME);
"
"
"
"       v_create_table := 'CREATE TABLE EXCEL_MIGRATION(ems_width            NUMBER(10,3),
"
"                                  ems_length            NUMBER(10,3),
"
"                                  ems_prod_id           VARCHAR2(25),
"
"                                  ems_prod_rev            NUMBER(5),
"
"                                  ems_store_desc        VARCHAR2(30),
"
"                                  ems_so_schld_desc        VARCHAR2(200),
"
"                                  ems_no_of_slits        NUMBER(12,3),
"
"                                  ems_prod_qty            NUMBER(12,3)
"
"                                  )
"
"                          ORGANIZATION EXTERNAL(
"
"                             TYPE ORACLE_LOADER
"
"                              DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS(
"
"                                    RECORDS DELIMITED BY NEWLINE
"
"                                    SKIP 1
"
"                                    FIELDS TERMINATED BY ''|''
"
"                                    MISSING FIELD VALUES ARE NULL
"
"                                    REJECT ROWS WITH ALL NULL FIELDS
"
"                                    (
"
"                                     ems_width                 CHAR(255),
"
"                                     ems_length              CHAR(255),
"
"                                     ems_prod_id                  CHAR(255),
"
"                                     ems_prod_rev              CHAR(255),
"
"                                     ems_store_desc          CHAR(255),
"
"                                     ems_so_schld_desc          CHAR(255),
"
"                                     ems_no_of_slits                CHAR(255),
"
"                                     ems_prod_qty              CHAR(255)
"
"                                     )
"
"                                                 )
"
"                                  LOCATION ('''||p_file_name||''')
"
"                                  ) REJECT LIMIT UNLIMITED';
"
"                EXECUTE IMMEDIATE v_create_table;
"
"
"
"             start_time := dbms_utility.get_time;
"
"
"
"              OPEN r_ref_cur FOR 'SELECT ems_width,
"
"                         ems_length,
"
"                         ems_prod_id,
"
"                         ems_prod_rev ,
"
"                         ems_store_desc,
"
"                         ems_so_schld_desc,
"
"                         ems_no_of_slits,
"
"                         ems_prod_qty
"
"                        FROM EXCEL_MIGRATION
"
"                        GROUP BY ems_width,
"
"                         ems_length,
"
"                         ems_prod_id,
"
"                         ems_prod_rev ,
"
"                         ems_store_desc,
"
"                         ems_so_schld_desc,
"
"                         ems_no_of_slits,
"
"                             ems_prod_qty';
"
"            FETCH r_ref_cur    BULK COLLECT INTO r_cut_bit_dtls;
"
"            CLOSE r_ref_cur;
"
"
"
"
"
"   proc_drop_exist_table('EXCEL_MIGRATION');
"
"   END proc_upd_cut_end_bits_dtls;
"
"
"
"  PROCEDURE proc_ins_mfg_item (p_bu        VARCHAR2,
"
"                     p_file_name    VARCHAR2,
"
"                     p_sep            VARCHAR2,
"
"                     p_user        VARCHAR2,
"
"                     p_result  OUT    VARCHAR2
"
"                     )
"
"
"
"     IS
"
" CURSOR c_exe
"
"     IS
"
" SELECT COUNT(*) v_cnt
"
"   FROM mfg_res_groups_exception
"
"  WHERE mfgrge_bu       = p_bu
"
"    AND mfgrge_sel_user = p_user;
"
"
"
"   cr_exe               c_exe%ROWTYPE;
"
"   v_mftr_id        VARCHAR2(10);
"
"   v_create_table       VARCHAR2(4000);
"
"   v_cnt        NUMBER;
"
"
"
"   TYPE    prod_mfg_asso IS RECORD (pma_mftr_desc        VARCHAR2(50),
"
"                    pma_prod_id        VARCHAR2(25),
"
"                    pma_prod_rev        NUMBER(5),
"
"                    pma_mftr_part_no    VARCHAR2(50)
"
"                    );
"
"
"
"   TYPE p_mfg_asso IS TABLE OF prod_mfg_asso INDEX BY PLS_INTEGER;
"
"
"
"  r_mfg_asso        p_mfg_asso;
"
"
"
"
"
"   BEGIN
"
"
"
"     proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    p_result := 'N';
"
"                        v_create_table := 'CREATE TABLE EXCEL_MIGRATION
"
"                                                 ( pma_mftr_desc        VARCHAR2(50),
"
"                                                   pma_prod_id        VARCHAR2(25) ,
"
"                                                pma_prod_rev       NUMBER(5),
"
"                                                pma_mftr_part_no    VARCHAR2(50)
"
"                                                 )
"
"                                    ORGANIZATION EXTERNAL(
"
"                                      TYPE ORACLE_LOADER
"
"                                          DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                          ACCESS PARAMETERS(
"
"                                                RECORDS DELIMITED BY NEWLINE
"
"                                                SKIP 1
"
"                                                FIELDS TERMINATED BY '''||p_sep||'''
"
"                                                MISSING FIELD VALUES ARE NULL
"
"                                                REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                                 pma_mftr_desc          CHAR(255),
"
"                                                 pma_prod_id              CHAR(255),
"
"                                                 pma_prod_rev          CHAR(255),
"
"                                                 pma_mftr_part_no             CHAR(255)
"
"                                                 )
"
"                                                             )
"
"                                              LOCATION ('''||p_file_name||''')
"
"                                              ) REJECT LIMIT UNLIMITED';
"
"
"
"                              EXECUTE IMMEDIATE v_create_table;
"
"
"
"
"
"             EXECUTE IMMEDIATE 'SELECT pma_mftr_desc,
"
"                                pma_prod_id,
"
"                           pma_prod_rev,
"
"                           pma_mftr_part_no
"
"                      FROM EXCEL_MIGRATION
"
"                     GROUP BY pma_mftr_desc,
"
"                           pma_prod_id,
"
"                           pma_prod_rev,
"
"                           pma_mftr_part_no
"
"                      ORDER BY 1' BULK COLLECT INTO r_mfg_asso;
"
"
"
"         /*  FOR j IN r_mfg_asso.FIRST .. r_mfg_asso.LAST
"
"           LOOP
"
"                 BEGIN
"
"                       SELECT pm_mftr_id
"
"                     INTO v_mftr_id
"
"                     FROM prod_mftrs
"
"                    WHERE pm_bu    = p_bu
"
"                      AND pm_mftr_name = r_mfg_asso(j).pma_mftr_desc;
"
"
"
"                  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20696,'SFC'||'  '||r_mfg_asso(j).pma_mftr_desc);
"
"                  END ;
"
"
"
"             DELETE prod_mftr_asso
"
"              WHERE pma_bu   = p_bu
"
"            AND pma_mftr_id = v_mftr_id;
"
"
"
"           END LOOP;*/
"
"
"
"
"
"         proc_drop_exist_table('EXCEL_MIGRATION');
"
"             p_result := 'Y';
"
"    END proc_ins_mfg_item;
"
"
"
"    PROCEDURE proc_mig_shift_wise_comp(
"
"                           p_bu        VARCHAR2,
"
"                              p_plnt        VARCHAR2,
"
"                           p_doc_no        VARCHAR2,
"
"                           p_doc_date      DATE,
"
"                           p_shift_id    VARCHAR2,
"
"                           p_user        VARCHAR2,
"
"                           p_file_name    VARCHAR2,
"
"                           p_lang        NUMBER,
"
"                           p_mr_res    OUT    VARCHAR2
"
"                        )
"
"    IS
"
"    CURSOR c_fetch(c_ord_no VARCHAR2,c_prod_id VARCHAR2,c_prod_rev NUMBER,c_oprn_id VARCHAR2)
"
"        IS
"
"    SELECT potr_trans_no,
"
"           potr_ord_no,
"
"           potr_plnt,
"
"           potr_oprn_id,
"
"           prohd_date,
"
"           (SELECT mfgo_oprn_type
"
"              FROM mfg_oprns
"
"             WHERE mfgo_bu = potr_bu
"
"               AND mfgo_oprn_id = potr_oprn_id)
"
"           oprn_type,
"
"           potr_seq_no,
"
"           potr_oprn_seq_no,
"
"           potr_next_oprn,
"
"           potr_next_proc,
"
"           potr_sf_code,
"
"           potr_dept,
"
"           potr_item_id,
"
"           potr_rev,
"
"           potr_tranfer_type,
"
"           potr_sys_ls_no,
"
"           potr_lot_no,
"
"           potr_ser_no,
"
"           prohd_ord_so_type,
"
"           prohd_so_pfx,
"
"           prohd_so_no,
"
"           prohd_so_seq_no,
"
"           prohd_so_sub_seq_no,
"
"           prohd_so_print_seq_no,
"
"           prohd_so_schld_desc,
"
"           prohd_cust_id,
"
"           prohd_cust_po_no,
"
"           prohd_cust_po_seq_no,
"
"           prohd_cust_po_date,
"
"           prohd_so_desp_date,
"
"           prohd_sou_bu,
"
"           prohd_sou_plnt,
"
"           prohd_sou_ord_pfx,
"
"           prohd_sou_ord_no,
"
"           prohd_sou_seq_no,
"
"           prohd_sou_sub_seq_no,
"
"           porlr_lot_no child_lot_no,
"
"           porlr_ser_no child_ser_no,
"
"           porlr_sys_ls_no child_sys_ls_no,
"
"           porlr_enter_qty,
"
"           potr_queue_qty queue_qty,
"
"           prohd_type,
"
"           prohd_proj_id,
"
"           prohd_task_id,
"
"           prohd_lot_size,
"
"           prohd_tolr_pct,
"
"           prohd_tolr_qty,
"
"           prohd_order_qty,
"
"           potr_route_card_no,
"
"           potr_oprn_no
"
"      FROM prod_ord_trans_record,
"
"           prod_ord_rm_lot_record,
"
"           prod_order_hd
"
"     WHERE prohd_bu              = potr_bu
"
"       AND prohd_plnt         = potr_plnt
"
"       AND prohd_ord_no       = potr_ord_no
"
"       AND porlr_bu(+)        = potr_bu
"
"       AND porlr_plnt(+)    = potr_plnt
"
"       AND porlr_ord_no(+)    = potr_ord_no
"
"       AND porlr_seq_no(+)    = potr_seq_no
"
"       AND (porlr_sel_flag    = 'Y' OR porlr_sel_flag IS NULL)
"
"       AND potr_bu            = p_bu
"
"       AND potr_plnt          = p_plnt
"
"       AND potr_ord_no        = c_ord_no
"
"       AND potr_item_id         = c_prod_id
"
"       AND potr_rev        = c_prod_rev
"
"       AND potr_oprn_id        = c_oprn_id
"
"       --AND potr_enter_qty     > 0
"
"       AND potr_type          = 'PR'
"
"       AND (potr_queue_qty + potr_run_qty) > potr_st_qty
"
"       AND potr_queue_qty > 0;
"
"
"
"    CURSOR c_oprn(c_ord_no VARCHAR2,c_seq_no NUMBER)
"
"      IS
"
"      (sELECT MIN(start_oprn) start_oprn,
"
"              MIN(end_oprn) end_oprn
"
"               FROM (
"
"                 (SELECT *
"
"                   FROM (SELECT pror_seq_no prosd_oprn_seq_no,
"
"                                prosd_oprn_id start_oprn,
"
"                                NULL end_oprn
"
"              FROM prod_ord_oper_status_det,
"
"                   prod_order_routing
"
"             WHERE     prosd_bu     = p_bu
"
"                   AND prosd_plnt     = p_plnt
"
"                   AND prosd_ord_no     = c_ord_no
"
"                   AND prosd_seq_no     = c_seq_no
"
"                   AND pror_bu         = prosd_bu
"
"                   AND pror_plnt     = prosd_plnt
"
"                   AND pror_ord_no     = prosd_ord_no
"
"                   AND pror_oprn_id     = prosd_oprn_id
"
"                   AND prosd_sel_flag    = 'Y'
"
"                 ORDER BY prosd_oprn_seq_no)
"
"                    WHERE ROWNUM = 1 )
"
"                    UNION ALL
"
"                 (SELECT *
"
"                   FROM (SELECT pror_seq_no prosd_oprn_seq_no,
"
"                                NULL start_oprn,
"
"                                prosd_oprn_id end_oprn
"
"              FROM prod_ord_oper_status_det,
"
"                   prod_order_routing
"
"             WHERE     prosd_bu     = p_bu
"
"                   AND prosd_plnt     = p_plnt
"
"                   AND prosd_ord_no     = c_ord_no
"
"                   AND prosd_seq_no     = c_seq_no
"
"                   AND pror_bu         = prosd_bu
"
"                   AND pror_plnt     = prosd_plnt
"
"                   AND pror_ord_no     = prosd_ord_no
"
"                   AND pror_oprn_id     = prosd_oprn_id
"
"                   AND prosd_sel_flag    = 'Y'
"
"            ORDER BY prosd_oprn_seq_no DESC)
"
"                    WHERE ROWNUM = 1 )
"
"               ));
"
"
"
"    CURSOR c_rcpt(c_ord_no VARCHAR2, c_sf_code VARCHAR2)
"
"        IS
"
"    SELECT pror_rcp_store
"
"      FROM prod_order_routing
"
"     WHERE pror_bu = p_bu
"
"       AND pror_plnt = p_plnt
"
"       AND pror_ord_no = c_ord_no
"
"       AND pror_seq_no = INSTR(TRIM(c_sf_code),'1',-1);
"
"
"
"    CURSOR c_store(c_ord_no VARCHAR2, c_seq_no NUMBER)
"
"        IS
"
"    SELECT pror_rcp_store
"
"      FROM prod_order_routing
"
"     WHERE pror_bu     = p_bu
"
"       AND pror_plnt   = p_plnt
"
"       AND pror_ord_no = c_ord_no
"
"       AND pror_seq_no = c_seq_no;
"
"
"
"    CURSOR c_ord (c_ord_no VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM prod_order_hd
"
"     WHERE prohd_bu = p_bu
"
"       AND prohd_plnt = p_plnt
"
"       AND prohd_ord_no = c_ord_no;
"
"
"
"    CURSOR c_bom (c_prod_id         VARCHAR2,
"
"                  c_prod_rev        NUMBER,
"
"                  c_bom_type        VARCHAR2,
"
"                  c_bom_no        VARCHAR2
"
"                  )
"
"        IS
"
"    SELECT bomhd_uom,
"
"           bomhd_prod_uom,
"
"           DECODE (bomhd_conv_factor, 0, 1, bomhd_conv_factor) bomhd_conv_factor
"
"      FROM bom_hd
"
"     WHERE bomhd_bu         = p_bu
"
"       AND bomhd_plnt         = p_plnt
"
"       AND bomhd_prod_id     = c_prod_id
"
"       AND bomhd_prod_rev     = c_prod_rev
"
"       AND (TRUNC(p_doc_date) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"       AND bomhd_bom_no        = c_bom_no
"
"       AND c_bom_type        = 'M'
"
"    ;
"
"
"
"    CURSOR c_ins_req (c_ord_no           VARCHAR2,
"
"                      c_seq_no           NUMBER
"
"                      )
"
"        IS
"
"    SELECT DISTINCT pror_seq_no prosd_oprn_seq_no,
"
"                    prosd_oprn_id,
"
"                pror_proc_id,
"
"                pror_ins_req,
"
"                pror_comp_pct
"
"      FROM prod_ord_oper_status_det,
"
"           prod_order_routing
"
"     WHERE prosd_bu     = p_bu
"
"       AND prosd_plnt     = p_plnt
"
"       AND prosd_ord_no = c_ord_no
"
"       AND prosd_seq_no = c_seq_no
"
"       AND pror_bu     = prosd_bu
"
"       AND pror_plnt     = prosd_plnt
"
"       AND pror_ord_no     = prosd_ord_no
"
"       AND pror_oprn_id = prosd_oprn_id
"
"       AND prosd_sel_flag = 'Y'
"
"     ORDER BY prosd_oprn_seq_no;
"
"
"
"    CURSOR c_start
"
"      IS
"
"    SELECT CASE WHEN (TRUNC(p_doc_date) + ((shifthd_end_time/3600)/24)) < (TRUNC(p_doc_date) +  ((shifthd_start_time/3600)/24)) THEN
"
"                     (TRUNC(p_doc_date) + ((shifthd_end_time/3600)/24)) + 1
"
"                ELSE (TRUNC(p_doc_date) + ((shifthd_end_time/3600)/24))
"
"           END shifthd_end_time,
"
"           (TRUNC(p_doc_date) +  ((shifthd_start_time/3600)/24)) shifthd_start_time
"
"     FROM shifts_hd
"
"    WHERE shifthd_bu = p_bu
"
"      AND shifthd_plnt = p_plnt
"
"      AND shifthd_shift_id = p_shift_id
"
"      AND shifthd_status = 'A';
"
"
"
"    CURSOR c_child_lot
"
"        IS
"
"    SELECT porlr_prod_id,
"
"           porlr_prod_rev
"
"      FROM prod_ord_trans_record,
"
"           prod_ord_rm_lot_record,
"
"           prod_order_hd
"
"     WHERE prohd_bu              = potr_bu
"
"       AND prohd_plnt         = potr_plnt
"
"       AND prohd_ord_no       = potr_ord_no
"
"       AND porlr_bu(+)        = potr_bu
"
"       AND porlr_plnt(+)    = potr_plnt
"
"       AND porlr_ord_no(+)    = potr_ord_no
"
"       AND porlr_seq_no(+)    = potr_seq_no
"
"       AND (porlr_sel_flag    = 'Y' OR porlr_sel_flag IS NULL)
"
"       AND potr_bu            = p_bu
"
"       AND potr_plnt          = p_plnt
"
"       --AND potr_sel_flag      = 'Y'
"
"       --AND potr_enter_qty     > 0
"
"       AND potr_type          = 'PR'
"
"       AND potr_queue_qty > 0
"
"       AND porlr_prod_id IS NOT NULL
"
"     GROUP BY porlr_prod_id,
"
"          porlr_prod_rev;
"
"
"
"    CURSOR c_lot_ser(c_oprn_id    VARCHAR2)
"
"      IS
"
"    SELECT mfgo_lot_rule prod_ser_lot_rule
"
"      FROM mfg_oprns
"
"     WHERE mfgo_bu = p_bu
"
"       AND mfgo_oprn_id = c_oprn_id;
"
"
"
"    CURSOR c_lot_serial(c_prod_id VARCHAR2,c_prod_rev NUMBER,c_sys_ls_no NUMBER)
"
"      IS
"
"    SELECT plsn_test_no
"
"      FROM products,
"
"           prod_lot_Ser_nos
"
"     WHERE plsn_bu         = prod_bu
"
"       AND plsn_prod_id     = prod_id
"
"       AND plsn_prod_rev    = prod_rev
"
"       AND plsn_sys_ls_no     = c_sys_ls_no
"
"       AND prod_bu        = p_bu
"
"       AND prod_id        = c_prod_id
"
"       AND prod_rev        = c_prod_rev
"
"       AND prod_status       = 'A'
"
"       AND prod_test_rule IN ('RULE36');
"
"
"
"    CURSOR c_mfg_rule(c_oprn_id VARCHAR2)
"
"      IS
"
"    SELECT mfgo_lot_next_no,
"
"       mfgo_oprn_id,
"
"       mfgo_lot_rule
"
"      FROM mfg_oprns
"
"     WHERE mfgo_bu = p_bu
"
"       AND mfgo_oprn_id = c_oprn_id
"
"       AND mfgo_lot_rule IN ('RULE37','RULE38');
"
"
"
"    CURSOR c_mfg_next(c_oprn_id    VARCHAR2)
"
"      IS
"
"    SELECT mfgo_lot_rule
"
"      FROM mfg_oprns
"
"     WHERE mfgo_bu = p_bu
"
"       AND mfgo_oprn_id = c_oprn_id;
"
"
"
"    CURSOR c_card(c_prod_id VARCHAR2,c_prod_rev NUMBER)
"
"      IS
"
"    SELECT prod_route_card_req_flag
"
"      FROM products
"
"     WHERE prod_bu     = p_bu
"
"       AND prod_id     = c_prod_id
"
"       AND prod_rev    = c_prod_rev
"
"       AND prod_status = 'A';
"
"
"
"    CURSOR c_ls_cre(c_ord_no VARCHAR2,c_seq_no NUMBER)
"
"        IS
"
"    SELECT pror_seq_no,
"
"           prosd_oprn_seq_no,
"
"           pror_oprn_no,
"
"           prosd_oprn_id,
"
"           pror_proc_id,
"
"           pror_ins_req,
"
"           pror_comp_pct,
"
"           pror_cons_store,
"
"           pror_rcp_store,
"
"           pror_ls_flag
"
"      FROM prod_ord_oper_status_det,
"
"           prod_order_routing
"
"     WHERE prosd_bu         = p_bu
"
"       AND prosd_plnt         = p_plnt
"
"       AND prosd_ord_no     = c_ord_no
"
"       AND prosd_seq_no     = c_seq_no
"
"       AND pror_bu             = prosd_bu
"
"       AND pror_plnt         = prosd_plnt
"
"       AND pror_ord_no         = prosd_ord_no
"
"       AND pror_oprn_id     = prosd_oprn_id
"
"       AND prosd_sel_flag    = 'Y'
"
"     ORDER BY pror_seq_no;
"
"
"
"    TYPE shift_wise_comp IS RECORD (
"
"                                    emig_ord_no            VARCHAR2(15),
"
"                                    emig_prod_id           VARCHAR2(25),
"
"                                    emig_prod_rev        NUMBER(5),
"
"                                    emig_qty            NUMBER(12,3),
"
"                                    emig_process        VARCHAR2(30),
"
"                                    emig_mchn            VARCHAR2(100),
"
"                                    emig_opt1            VARCHAR2(10),
"
"                                    emig_opt2            VARCHAR2(10)
"
"                                    );
"
"
"
"    TYPE t_shift IS TABLE OF shift_wise_comp INDEX BY PLS_INTEGER;
"
"
"
"    r_shift t_shift;
"
"
"
"    TYPE type_shift_ref_cur    IS REF CURSOR;
"
"
"
"    r_shift_ref_cur    type_shift_ref_cur;
"
"
"
"    v_create_table       VARCHAR2(4000);
"
"    v_mchn_id             mfg_mach_operator.mmo_mach_id%TYPE;
"
"    v_opr_id             prod_transfer.pt_opt_id%TYPE;
"
"    v_opr_id2             prod_transfer.pt_opt_id2%TYPE;
"
"    v_trans_no             prod_transfer.pt_trans_no%TYPE;
"
"    v_year             prod_transfer.pt_year%TYPE;
"
"    v_period             prod_transfer.pt_period%TYPE;
"
"    v_acp_qty                prod_transfer.pt_comp_qty%TYPE;
"
"    v_acp_stk_qty            prod_transfer.pt_comp_qty%TYPE;
"
"    v_pg_type             VARCHAR2(5);
"
"    v_pg_id                  VARCHAR2(15);
"
"    v_sou_type             VARCHAR2(1);
"
"    v_sou_id             VARCHAR2(10);
"
"    v_old_sf_code         VARCHAR2(50);
"
"    v_new_sf_code         VARCHAR2(50);
"
"    v_store_id             VARCHAR2(15);
"
"    v_start_oprn_id         VARCHAR2(10);
"
"    v_end_oprn_id         VARCHAR2(10);
"
"    v_so_print_seq_no    NUMBER(5);
"
"    v_rcp_store             VARCHAR2(15);
"
"    v_ins_req             VARCHAR2(1);
"
"    v_oprn_id             VARCHAR2(10);
"
"    v_conv_factor         NUMBER;
"
"    v_proc_cnt             NUMBER := 0;
"
"    v_qc_cnt             NUMBER(5) := 0;
"
"    v_cnt                  NUMBER := 0;
"
"    v_oprn_type             VARCHAR2(1);
"
"    var_mr_result        VARCHAR2(4000);
"
"    v_ls_cre             VARCHAR2(1)    := 'N';
"
"    v_qty                  NUMBER;
"
"    v_rem_qty             NUMBER;
"
"    var_msg                  VARCHAR2(100);
"
"    v_child_lot_no         prod_transfer.pt_lot_no%TYPE;
"
"    v_lot_no             prod_transfer.pt_lot_no%TYPE;
"
"    v_rc_no                  NUMBER;
"
"    v_rule_id             VARCHAR2(4000);
"
"    v_char                  VARCHAR2(4000);
"
"    v_ls_cnt             NUMBER;
"
"    i                    NUMBER := 0;
"
"
"
"    cr_child_lot c_child_lot%ROWTYPE;
"
"    cr_mfg_next c_mfg_next%ROWTYPE;
"
"    cr_lot_ser  c_lot_ser%ROWTYPE;
"
"    cr_start     c_start%ROWTYPE;
"
"    cr_card     c_card%ROWTYPE;
"
"    cr_ord         c_ord%ROWTYPE;
"
"    cr_bom         c_bom%ROWTYPE;
"
"    cr_oprn     c_oprn%ROWTYPE;
"
"    cr_rcpt     c_rcpt%ROWTYPE;
"
"    cr_store     c_store%ROWTYPE;
"
"    cr_ls_cre     c_ls_cre%ROWTYPE;
"
"    cr_ins_req     c_ins_req%ROWTYPE;
"
"    cr_mfg_rule c_mfg_rule%ROWTYPE;
"
"    cr_lot_serial c_lot_serial%ROWTYPE;
"
"    cr_fetch     c_fetch%ROWTYPE;
"
"    v_loc_id        VARCHAR2(10);
"
"
"
"    BEGIN
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"          DELETE prod_transfer
"
"           WHERE pt_bu = p_bu
"
"             AND pt_plnt = p_plnt
"
"             AND pt_doc_no = p_doc_no;
"
"
"
"          v_create_table := 'CREATE TABLE EXCEL_MIGRATION(emig_ord_no            VARCHAR2(15),
"
"                              emig_prod_id           VARCHAR2(25),
"
"                              emig_prod_rev            NUMBER(5),
"
"                              emig_qty            NUMBER(12,3),
"
"                              emig_process            VARCHAR2(30),
"
"                              emig_mchn            VARCHAR2(100),
"
"                              emig_opt1            VARCHAR2(10),
"
"                              emig_opt2            VARCHAR2(10)
"
"                              )
"
"                    ORGANIZATION EXTERNAL(
"
"                       TYPE ORACLE_LOADER
"
"                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                        ACCESS PARAMETERS(
"
"                              RECORDS DELIMITED BY NEWLINE
"
"                              SKIP 1
"
"                              FIELDS TERMINATED BY ''|''
"
"                              MISSING FIELD VALUES ARE NULL
"
"                              REJECT ROWS WITH ALL NULL FIELDS
"
"                              (
"
"                               emig_ord_no          CHAR(255),
"
"                               emig_prod_id         CHAR(255),
"
"                               emig_prod_rev      CHAR(255),
"
"                               emig_qty          CHAR(255),
"
"                               emig_process          CHAR(255),
"
"                               emig_mchn          CHAR(255),
"
"                               emig_opt1              CHAR(255),
"
"                               emig_opt2          CHAR(255)
"
"                               )
"
"                                           )
"
"                            LOCATION ('''||p_file_name||''')
"
"                            ) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_create_table;
"
"
"
"        OPEN r_shift_ref_cur FOR 'SELECT *
"
"                                FROM excel_migration';
"
"        LOOP
"
"        i := i + 1;
"
"        FETCH r_shift_ref_cur INTO r_shift(i);
"
"        EXIT WHEN r_shift_ref_cur%NOTFOUND;
"
"        END LOOP;
"
"        CLOSE r_shift_ref_cur;
"
"
"
"        FOR i IN 1..r_shift.COUNT()     --r_shift.FIRST..r_shift.LAST
"
"        LOOP
"
"
"
"            DBMS_OUTPUT.PUT_LINE('BEFORE'||' ' ||r_shift.COUNT());
"
"          BEGIN
"
"
"
"            SELECT pchd_loc_id
"
"              INTO  v_loc_id
"
"              FROM prod_comp_hd
"
"             WHERE  pchd_bu=p_bu
"
"               AND pchd_plnt =p_plnt
"
"               AND pchd_doc_no =p_doc_no;
"
"
"
"             EXCEPTION WHEN NO_DATA_FOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20474,'SFM'||'  '||v_loc_id);
"
"
"
"          END;
"
"            v_store_id := func_find_deflt_storeid(p_bu, p_plnt,v_loc_id, r_shift(i).emig_prod_id, r_shift(i).emig_prod_rev, 'N');
"
"
"
"            BEGIN
"
"
"
"            SELECT mfgo_oprn_id,
"
"                   mfgo_oprn_type
"
"              INTO v_oprn_id,
"
"                   v_oprn_type
"
"              FROM mfg_oprns
"
"             WHERE mfgo_bu = p_bu
"
"               AND mfgo_desc1 = r_shift(i).emig_process;
"
"
"
"
"
"
"
"            EXCEPTION WHEN NO_DATA_FOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20474,'SFM'||'  '||r_shift(i).emig_process);
"
"            END;
"
"
"
"             BEGIN
"
"            IF r_shift(i).emig_mchn IS NULL THEN
"
"                --RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||'1');
"
"            SELECT mmo_mach_id,
"
"                   mmo_opr_id
"
"              INTO v_mchn_id,
"
"                   v_opr_id
"
"              FROM mfg_mach_operator
"
"             WHERE mmo_bu = p_bu
"
"               AND mmo_plnt = p_plnt
"
"               AND mmo_shift_id = p_shift_id
"
"               AND ROWNUM = 1;
"
"             ELSE
"
"                --RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||'2');
"
"                 SELECT mfgr_res_id
"
"                   INTO v_mchn_id
"
"                   FROM mfg_resources,
"
"                    mfg_res_groups
"
"                  WHERE mfgr_bu = mfgrg_bu
"
"                AND mfgr_plnt = mfgrg_plnt
"
"                AND mfgr_group_id = mfgrg_grp_id
"
"                AND mfgr_bu     = p_bu
"
"                AND mfgr_plnt   = p_plnt
"
"                AND mfgr_name1 = r_shift(i).emig_mchn;
"
"             END IF;
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20654,'PRJ'||'/'||p_shift_id||'/'||r_shift(i).emig_mchn);
"
"          END;
"
"
"
"            BEGIN
"
"
"
"            IF r_shift(i).emig_opt1 IS NULL THEN
"
"
"
"                        SELECT emp_emp_id
"
"                          INTO v_opr_id
"
"                          FROM employees
"
"                         WHERE emp_bu = p_bu
"
"                           AND emp_status = 'A'
"
"                           AND ROWNUM = 1
"
"                      ORDER BY  emp_emp_id;
"
"            ELSE
"
"                SELECT mfgr_emp_id
"
"                 INTO v_opr_id
"
"                FROM (SELECT (emp_first_name1 || ' ' || emp_middle_name1 || ' ' || emp_last_name1)
"
"                         emp_name,
"
"                         emp_emp_id mfgr_emp_id
"
"                       FROM employees
"
"                      WHERE emp_bu = p_bu
"
"                        AND emp_emp_id IN(SELECT empai_emp_id
"
"                                FROM emp_active_infos
"
"                                   WHERE empai_bu = p_bu
"
"                                  )
"
"                            AND emp_emp_id = r_shift(i).emig_opt1
"
"                          UNION ALL
"
"                         SELECT mfgr_name1 emp_name,
"
"                            mfgr_res_id mfgr_emp_id
"
"                           FROM mfg_resources
"
"                          WHERE mfgr_bu              = p_bu
"
"                            AND mfgr_plnt          = p_plnt
"
"                            AND mfgr_res_type IN ('P')
"
"                            AND mfgr_own_flag = 'R'
"
"                            AND mfgr_res_id  = r_shift(i).emig_opt1)
"
"                      GROUP BY emp_name,
"
"                     mfgr_emp_id     ;
"
"                     END IF;
"
"             EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                RAISE_APPLICATION_ERROR(-20821,'PLN');
"
"             END;
"
"
"
"            BEGIN
"
"
"
"                IF r_shift(i).emig_opt2 IS NULL THEN
"
"
"
"                            SELECT emp_emp_id
"
"                              INTO v_opr_id2
"
"                              FROM employees
"
"                             WHERE emp_bu = p_bu
"
"                               AND emp_status = 'A'
"
"                               AND ROWNUM = 1
"
"                          ORDER BY  emp_emp_id;
"
"                ELSE
"
"                    SELECT mfgr_emp_id
"
"                     INTO v_opr_id2
"
"                    FROM (SELECT (emp_first_name1 || ' ' || emp_middle_name1 || ' ' || emp_last_name1)
"
"                             emp_name,
"
"                             emp_emp_id mfgr_emp_id
"
"                           FROM employees
"
"                          WHERE emp_bu = p_bu
"
"                            AND emp_emp_id IN(SELECT empai_emp_id
"
"                                    FROM emp_active_infos
"
"                                       WHERE empai_bu = p_bu
"
"                                      )
"
"                                AND emp_emp_id = r_shift(i).emig_opt2
"
"                              UNION ALL
"
"                             SELECT mfgr_name1 emp_name,
"
"                                mfgr_res_id mfgr_emp_id
"
"                               FROM mfg_resources
"
"                              WHERE mfgr_bu              = p_bu
"
"                                AND mfgr_plnt          = p_plnt
"
"                                AND mfgr_res_type IN ('P')
"
"                                AND mfgr_own_flag = 'R'
"
"                                AND mfgr_res_id  = r_shift(i).emig_opt2)
"
"                          GROUP BY emp_name,
"
"                         mfgr_emp_id     ;
"
"                         END IF;
"
"                 EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20821,'PLN');
"
"                  END;
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||r_shift(i).emig_ord_no||'~'||r_shift(i).emig_prod_id||'~'||r_shift(i).emig_prod_rev||'~'||v_oprn_id);
"
"
"
"            OPEN c_fetch(r_shift(i).emig_ord_no,r_shift(i).emig_prod_id,r_shift(i).emig_prod_rev,v_oprn_id);
"
"            FETCH c_fetch INTO cr_fetch;
"
"            IF c_fetch%NOTFOUND THEN
"
"                RAISE_APPLICATION_ERROR(-20155,'SFM');
"
"            END IF;
"
"            CLOSE c_fetch;
"
"
"
"            FOR cr_fetch IN c_fetch(r_shift(i).emig_ord_no,r_shift(i).emig_prod_id,r_shift(i).emig_prod_rev,v_oprn_id)
"
"            LOOP
"
"
"
"                /*IF cr_fetch.potr_ord_no <> r_shift(i).emig_ord_no THEN
"
"                RAISE_APPLICATION_ERROR(-20155,'SFM');
"
"                END IF;*/
"
"                --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||func_find_prod_ser_lot_type(p_bu, cr_fetch.potr_item_id, cr_fetch.potr_rev));
"
"
"
"                 v_ls_cre    := 'N';
"
"
"
"                proc_cre_mr_from_prodn(p_bu,
"
"                                       p_plnt ,
"
"                                       v_loc_id,
"
"                                       cr_fetch.potr_ord_no,
"
"                                       cr_fetch.potr_seq_no,
"
"                                       TRUNC(p_doc_date),
"
"                                       p_user,
"
"                                       var_mr_result
"
"                                       );
"
"
"
"                p_mr_res := p_mr_res ||' '||var_mr_result;
"
"
"
"                IF r_shift(i).emig_qty IS NULL OR r_shift(i).emig_qty = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20596,'PLN');
"
"                END IF;
"
"
"
"                OPEN c_start;
"
"                FETCH c_start INTO cr_start;
"
"                CLOSE c_start;
"
"
"
"                FOR cr_ls_cre IN c_ls_cre(cr_fetch.potr_ord_no, cr_fetch.potr_seq_no)
"
"                LOOP
"
"
"
"                    IF func_find_ls_cre_option(p_bu, cr_fetch.potr_item_id, cr_fetch.potr_rev) NOT IN ('L') AND cr_ls_cre.pror_ls_flag = 'Y' THEN
"
"                       v_ls_cre    := 'Y';
"
"                       EXIT;
"
"                    END IF;
"
"
"
"                END LOOP c_ls_cre;
"
"
"
"                 --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||func_find_prod_ser_lot_type(p_bu, cr_fetch.potr_item_id, cr_fetch.potr_rev));
"
"
"
"                IF func_find_prod_ser_lot_type(p_bu, cr_fetch.potr_item_id, cr_fetch.potr_rev) IN ('S','O') THEN
"
"                    v_ls_cnt := r_shift(i).emig_qty;
"
"                    v_qty    := 1;
"
"                    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_ls_cnt);
"
"
"
"                /*ELSIF v_ls_cre = 'Y' THEN
"
"
"
"                    IF func_find_prod_ser_lot_type(p_bu, cr_fetch.potr_item_id, cr_fetch.potr_rev) NOT IN ('S','O') THEN
"
"                      IF r_shift(i).emig_qty < cr_fetch.prohd_lot_size OR cr_fetch.prohd_lot_size = 0 OR cr_fetch.prohd_lot_size IS NULL THEN
"
"                        v_ls_cnt  := 1;
"
"                        v_qty        := r_shift(i).emig_qty;
"
"                        v_rem_qty := 0;
"
"                      ELSE
"
"                        v_ls_cnt  := CEIL(r_shift(i).emig_qty/cr_fetch.prohd_lot_size);
"
"                        v_qty        := cr_fetch.prohd_lot_size;
"
"                        v_rem_qty := r_shift(i).emig_qty - (v_qty * (v_ls_cnt - 1));
"
"                      END IF;
"
"                    END IF;*/
"
"
"
"                ELSE
"
"                    v_ls_cnt := 1;
"
"                    v_qty    := r_shift(i).emig_qty;
"
"                END IF;
"
"
"
"            --DBMS_OUTPUT.PUT_LINE('Check 1-> '||v_ls_cnt ||' '||v_qty);
"
"
"
"            FOR i IN 1..v_ls_cnt
"
"            LOOP
"
"
"
"                IF v_rem_qty > 0 AND i = v_ls_cnt THEN
"
"                   v_qty := v_rem_qty;
"
"                END IF;
"
"
"
"                 v_trans_no := func_find_pfx_nextno(p_bu,
"
"                                         p_doc_date,
"
"                                         func_find_get_mfg_pfx(p_bu,
"
"                                         v_loc_id,
"
"                                         p_plnt,
"
"                                         'PRC'),
"
"                         p_user);
"
"
"
"            --DBMS_OUTPUT.PUT_LINE('Check 2-> '||v_trans_no||' ' ||i||' ' ||v_ls_cnt ||' '||v_qty);
"
"
"
"            v_year := func_find_year(p_bu, p_doc_date);
"
"
"
"             v_period := func_find_period(p_bu, p_doc_date);
"
"
"
"             OPEN c_ord (cr_fetch.potr_ord_no);
"
"             FETCH c_ord INTO cr_ord;
"
"             CLOSE c_ord;
"
"
"
"                   v_proc_cnt := 0;
"
"
"
"             IF cr_ord.prohd_type IN ('S', 'O') THEN
"
"
"
"                OPEN c_bom (cr_fetch.potr_item_id, cr_fetch.potr_rev,cr_ord.prohd_bom_type,cr_ord.prohd_bom_no);
"
"                FETCH c_bom INTO cr_bom;
"
"
"
"                   IF c_bom%FOUND THEN
"
"                  v_conv_factor := cr_bom.bomhd_conv_factor;
"
"                   ELSE
"
"                  v_conv_factor := 1;
"
"                   END IF;
"
"
"
"                   CLOSE c_bom;
"
"
"
"             ELSE
"
"
"
"                v_conv_factor := 1;
"
"
"
"             END IF;
"
"
"
"                v_old_sf_code := cr_fetch.potr_sf_code;
"
"                    v_new_sf_code := TRANSLATE (cr_fetch.potr_sf_code, '0', '1');
"
"                v_ins_req      := 'N';
"
"
"
"             FOR cr_ins_req IN c_ins_req(cr_fetch.potr_ord_no,cr_fetch.potr_seq_no)
"
"             LOOP
"
"
"
"                IF cr_ins_req.pror_ins_req = 'Y' THEN
"
"                   v_qc_cnt := v_qc_cnt + 1;
"
"                END IF;
"
"
"
"             END LOOP;
"
"
"
"                IF v_qc_cnt >= 1 THEN
"
"                   v_ins_req    := 'Y';
"
"                ELSE
"
"                   v_ins_req    := 'N';
"
"                END IF;
"
"
"
"            /*IF v_ins_req    = 'N' THEN
"
"                v_acp_qty     := r_shift(i).emig_qty;
"
"                v_acp_stk_qty := r_shift(i).emig_qty / v_conv_factor;
"
"            ELSE
"
"                v_acp_qty     := 0;
"
"                v_acp_stk_qty := 0;
"
"            END IF;*/
"
"
"
"                OPEN c_oprn (cr_fetch.potr_ord_no,cr_fetch.potr_seq_no);
"
"                FETCH c_oprn INTO cr_oprn;
"
"
"
"                IF c_oprn%NOTFOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20476,'SFM');
"
"                ELSE
"
"                    v_start_oprn_id    := cr_oprn.start_oprn;
"
"                    v_end_oprn_id    := cr_oprn.end_oprn;
"
"                END IF;
"
"
"
"            CLOSE c_oprn;
"
"
"
"            v_cnt := 0;
"
"
"
"             FOR cr_ins_req IN c_ins_req (cr_fetch.potr_ord_no,cr_fetch.potr_seq_no)
"
"             LOOP
"
"
"
"                FOR cr_oprn_det IN (SELECT pror_seq_no,
"
"                                           pror_oprn_id
"
"                                      FROM prod_order_routing
"
"                                     WHERE pror_bu = p_bu
"
"                                       AND pror_plnt = p_plnt
"
"                                       AND pror_ord_no = cr_fetch.potr_ord_no
"
"                                       AND pror_oprn_id = cr_ins_req.prosd_oprn_id
"
"                                    )
"
"                LOOP
"
"
"
"                   v_old_sf_code := func_find_upd_prod_sfg_code (v_old_sf_code, cr_oprn_det.pror_seq_no);
"
"
"
"                END LOOP;
"
"
"
"                v_cnt := v_cnt + 1;
"
"
"
"            END LOOP;
"
"
"
"             IF cr_fetch.potr_tranfer_type = 'I' THEN
"
"                 v_pg_type := 'I';
"
"                 v_pg_id   := NULL;
"
"             ELSIF cr_fetch.potr_tranfer_type = 'T' THEN
"
"                 IF v_cnt = 1 THEN
"
"                v_pg_type := 'P';
"
"                v_pg_id   := cr_fetch.potr_oprn_id;
"
"                 ELSE
"
"                v_pg_type := 'M';
"
"                v_pg_id   := NULL;
"
"                 END IF;
"
"             ELSIF cr_fetch.potr_tranfer_type = 'O' THEN
"
"                 v_pg_type := 'P';
"
"                 v_pg_id   := cr_fetch.potr_oprn_id;
"
"             END IF;
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_store_id);
"
"
"
"            /*Start of Child lot*/
"
"
"
"            OPEN c_child_lot;
"
"            FETCH c_child_lot INTO cr_child_lot;
"
"            CLOSE c_child_lot;
"
"
"
"
"
"
"
"            v_child_lot_no := cr_fetch.child_lot_no;
"
"
"
"            OPEN c_lot_serial(cr_child_lot.porlr_prod_id,cr_child_lot.porlr_prod_rev,cr_fetch.child_sys_ls_no);
"
"            FETCH c_lot_serial INTO cr_lot_serial;
"
"                IF c_lot_serial%FOUND THEN
"
"                    v_child_lot_no := cr_lot_serial.plsn_test_no;
"
"                END IF;
"
"            CLOSE c_lot_serial;
"
"
"
"            OPEN c_lot_ser(v_start_oprn_id);
"
"            FETCH c_lot_ser INTO cr_lot_ser;
"
"                IF cr_lot_ser.prod_ser_lot_rule IN ('RULE37','RULE38') THEN
"
"
"
"                    OPEN c_mfg_rule(v_start_oprn_id);
"
"                    FETCH c_mfg_rule INTO cr_mfg_rule;
"
"
"
"                        IF cr_mfg_rule.mfgo_lot_rule = 'RULE37' THEN
"
"                            v_rule_id := 'FUNC_FIND_LOT_NO_RULE37';
"
"                            v_char := 'BEGIN :v_res :=  '||v_rule_id||'('||chr(39)||p_bu||chr(39)||','||chr(39)||TRUNC(p_doc_date)||chr(39)||','||chr(39)||cr_child_lot.porlr_prod_id||chr(39)||','||chr(39)||cr_child_lot.porlr_prod_rev||chr(39)||','||chr(39)||v_start_oprn_id||chr(39)||','||chr(39)||cr_fetch.child_sys_ls_no||chr(39)||'); END;';
"
"                        ELSIF cr_mfg_rule.mfgo_lot_rule = 'RULE38' THEN
"
"                            v_rule_id := 'FUNC_FIND_LOT_NO_RULE38';
"
"                            v_char := 'BEGIN :v_res :=  '||v_rule_id||'('||chr(39)||p_bu||chr(39)||','||chr(39)||TRUNC(p_doc_date)||chr(39)||','||chr(39)||cr_child_lot.porlr_prod_id||chr(39)||','||chr(39)||cr_child_lot.porlr_prod_rev||chr(39)||','||chr(39)||cr_fetch.child_sys_ls_no||chr(39)||','||chr(39)||v_start_oprn_id||chr(39)||'); END;';
"
"                        END IF;
"
"
"
"                        IF c_mfg_rule%FOUND THEN
"
"                             EXECUTE IMMEDIATE v_char USING OUT v_child_lot_no;
"
"                        END IF;
"
"
"
"                    CLOSE c_mfg_rule;
"
"
"
"                END IF;
"
"            CLOSE c_lot_ser;
"
"
"
"            /*End of Child lot*/
"
"
"
"                OPEN c_rcpt(cr_fetch.potr_ord_no, v_old_sf_code);
"
"                FETCH c_rcpt INTO cr_rcpt;
"
"              IF c_rcpt%FOUND THEN
"
"                 v_rcp_store := cr_rcpt.pror_rcp_store;
"
"              END IF;
"
"                CLOSE c_rcpt;
"
"
"
"                IF v_rcp_store IS NULL THEN
"
"
"
"              OPEN c_store(cr_fetch.potr_ord_no, cr_fetch.potr_oprn_no);
"
"              FETCH c_store INTO cr_store;
"
"
"
"                 IF c_store%FOUND THEN
"
"                   v_rcp_store := cr_store.pror_rcp_store;
"
"                 ELSE
"
"                   RAISE_APPLICATION_ERROR(-20450,'SFM' ||' '||'Receipt warehouse not defined.'||p_plnt||' '|| cr_fetch.potr_ord_no||' '|| cr_fetch.potr_oprn_no);
"
"                 END IF;
"
"
"
"              CLOSE c_store;
"
"
"
"                       END IF;
"
"
"
"                IF cr_fetch.prohd_so_pfx IS NOT NULL AND cr_fetch.prohd_so_no IS NOT NULL THEN
"
"
"
"                  IF cr_fetch.prohd_so_print_seq_no IS NULL THEN
"
"                     proc_find_sales_dtls(p_bu,
"
"                                          cr_fetch.prohd_so_pfx,
"
"                                          cr_fetch.prohd_so_no,
"
"                                          cr_fetch.prohd_so_seq_no,
"
"                                          cr_fetch.prohd_cust_id,
"
"                                          v_so_print_seq_no
"
"                                          );
"
"                  ELSE
"
"                     v_so_print_seq_no := cr_fetch.prohd_so_print_seq_no;
"
"                  END IF;
"
"
"
"                END IF;
"
"
"
"
"
"                OPEN c_card(cr_fetch.potr_item_id, cr_fetch.potr_rev);
"
"                FETCH c_card INTO cr_card;
"
"
"
"              IF c_card%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20260,'ICM'||cr_fetch.potr_item_id||'~'||cr_fetch.potr_rev);
"
"              ELSE
"
"
"
"                   IF cr_card.prod_route_card_req_flag = 'N' THEN
"
"                    v_rc_no := NULL;
"
"                   ELSE
"
"
"
"                  IF INSTR(cr_fetch.potr_sf_code,'1') = 0 THEN
"
"
"
"                     SELECT NVL(MAX(rc_no),0) + 1
"
"                       INTO v_rc_no
"
"                       FROM (SELECT MAX(pth_route_card_no) rc_no
"
"                           FROM prod_transfer_hist
"
"                          WHERE pth_bu        = p_bu
"
"                        AND pth_plnt        = p_plnt
"
"                        AND pth_prod_ord_no = cr_fetch.potr_ord_no
"
"                          UNION ALL
"
"                         SELECT MAX(pt_route_card_no) rc_no
"
"                           FROM prod_transfer
"
"                          WHERE pt_bu       = p_bu
"
"                        AND pt_plnt       = p_plnt
"
"                        AND pt_prod_ord_no = cr_fetch.potr_ord_no
"
"                        );
"
"                  ELSE
"
"                     v_rc_no := cr_fetch.potr_route_card_no;
"
"                  END IF;
"
"
"
"                   END IF;
"
"
"
"              END IF;
"
"
"
"                   CLOSE c_card;
"
"
"
"                v_sou_type  := CASE WHEN cr_fetch.prohd_type IN ('I','U') THEN 'C' ELSE 'P' END;
"
"                v_sou_id    := CASE WHEN cr_fetch.prohd_type IN ('I','U') THEN cr_fetch.prohd_cust_id
"
"                                    ELSE func_find_deflt_storeid(p_bu,p_plnt,v_loc_id,cr_fetch.potr_item_id,cr_fetch.potr_rev,'N') END;
"
"
"
"             IF cr_fetch.potr_sf_code = v_old_sf_code AND cr_fetch.prohd_type NOT IN ('I','U') THEN
"
"            RAISE_APPLICATION_ERROR(-20001,'ICM'||'~ SF Code '||cr_fetch.potr_sf_code ||' / Comp SF Code. '||v_old_sf_code);
"
"               END IF;
"
"
"
"            OPEN c_mfg_next(cr_fetch.potr_oprn_id);
"
"            FETCH c_mfg_next INTO cr_mfg_next;
"
"                IF c_mfg_next%FOUND AND cr_mfg_next.mfgo_lot_rule IS NOT NULL THEN
"
"                  v_lot_no := func_find_mfg_lot_next_no(p_bu,p_plnt,cr_fetch.prohd_date,cr_fetch.potr_oprn_id,cr_fetch.potr_item_id,cr_fetch.potr_rev,p_shift_id);
"
"                END IF;
"
"            CLOSE c_mfg_next;
"
"
"
"             INSERT INTO prod_transfer ( pt_bu,
"
"                                        pt_plnt,
"
"                                        pt_trans_no,
"
"                                        pt_doc_no,
"
"                                        pt_prod_ord_no,
"
"                                        pt_date,
"
"                                        pt_year,
"
"                                        pt_period,
"
"                                        pt_status,
"
"                                        pt_prod_id,
"
"                                        pt_prod_rev,
"
"                                        pt_from_bucket,
"
"                                        pt_to_bucket,
"
"                                        pt_trans_qty,
"
"                                        pt_comp_qty,
"
"                                        pt_cre_by,
"
"                                        pt_cre_date,
"
"                                        pt_accept_qty,
"
"                                        pt_acpt_stk_qty,
"
"                                        pt_reject_qty,
"
"                                        pt_scrap_qty,
"
"                                        pt_qc_qty,
"
"                                        pt_dm_cost,
"
"                                        pt_dl_cost,
"
"                                        pt_oh_cost,
"
"                                        pt_unit_cost,
"
"                                        pt_sys_ls_no,
"
"                                        pt_lot_no,
"
"                                        pt_ser_no,
"
"                                        pt_cons_type,
"
"                                        pt_ot_cost,
"
"                                        pt_gen_cons,
"
"                                        pt_conv_factor,
"
"                                        pt_start_date,
"
"                                        pt_end_date,
"
"                                        pt_prodn_hour,
"
"                                        pt_shift_id,
"
"                                        pt_pg_id,
"
"                                        pt_pg_type,
"
"                                        pt_store_id,
"
"                                        pt_sf_code,
"
"                                        pt_comp_sf_code,
"
"                                        pt_source_flag,
"
"                                        pt_entry_type,
"
"                                        pt_from_oprn_id,
"
"                                        pt_to_oprn_id,
"
"                                        pt_qc_req_flag,
"
"                                        pt_ord_so_type,
"
"                                        pt_so_pfx,
"
"                                        pt_so_no,
"
"                                        pt_so_seq_no,
"
"                                        pt_so_sub_seq_no,
"
"                                        pt_so_print_seq_no,
"
"                                        pt_so_schld_desc,
"
"                                        pt_cust_id,
"
"                                        pt_cust_po_no,
"
"                                        pt_cust_po_seq_no,
"
"                                        pt_cust_po_date,
"
"                                        pt_so_desp_date,
"
"                                        pt_rcpt_store_id,
"
"                                        pt_proj_id,
"
"                                        pt_task_id,
"
"                                        pt_potv_seq_no,
"
"                                        pt_temp_sys_ls_no,
"
"                                        pt_temp_lot_no,
"
"                                        pt_temp_ser_no,
"
"                                        pt_casting_flag,
"
"                                        pt_sel_flag,
"
"                                        pt_route_card_no,
"
"                                        pt_source_type,
"
"                                        pt_source_id,
"
"                                        pt_prod_type,
"
"                                        pt_pend_trans_no,
"
"                                        pt_sou_bu,
"
"                                        pt_sou_plnt      ,
"
"                                        pt_sou_ord_pfx   ,
"
"                                        pt_sou_ord_no    ,
"
"                                        pt_sou_seq_no    ,
"
"                                        pt_sou_sub_seq_no,
"
"                                        pt_mach_id,
"
"                                        pt_opt_id,
"
"                                        pt_opt_id2,
"
"                                        pt_child_lot_no,
"
"                                        pt_child_sys_ls_no,
"
"                                        pt_oprn_ln_seq
"
"                                        )
"
"                                        VALUES (p_bu,
"
"                                                p_plnt,
"
"                                                v_trans_no,
"
"                                                p_doc_no,
"
"                                                cr_fetch.potr_ord_no,
"
"                                                p_doc_date,
"
"                                                v_year,
"
"                                                v_period,
"
"                                                'N',
"
"                                                cr_fetch.potr_item_id,
"
"                                                cr_fetch.potr_rev,
"
"                                                'R',
"
"                                                'C',
"
"                                                v_qty,--r_shift(i).emig_qty,
"
"                                                v_qty,--r_shift(i).emig_qty,
"
"                                                p_user,
"
"                                                SYSDATE,
"
"                                                v_qty,--v_acp_qty,
"
"                                                v_qty,--v_acp_stk_qty,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                cr_fetch.potr_sys_ls_no,
"
"                                                NVL(v_lot_no,cr_fetch.potr_lot_no),
"
"                                                cr_fetch.potr_ser_no,
"
"                                                cr_fetch.potr_tranfer_type,
"
"                                                0,
"
"                                                'N',
"
"                                                v_conv_factor,
"
"                                                cr_start.shifthd_start_time,
"
"                                                cr_start.shifthd_end_time,
"
"                                                SUBSTR(func_find_tot_hrs_frm_min((((cr_start.shifthd_end_time - cr_start.shifthd_start_time) * 24) * 60) *60),1,2),
"
"                                                p_shift_id,
"
"                                                v_pg_id,
"
"                                                v_pg_type,
"
"                                                v_store_id,
"
"                                                cr_fetch.potr_sf_code,
"
"                                                v_old_sf_code,
"
"                                                'S',
"
"                                                'S',
"
"                                                v_start_oprn_id,
"
"                                                v_end_oprn_id,
"
"                                                v_ins_req,
"
"                                                cr_fetch.prohd_ord_so_type,
"
"                                                cr_fetch.prohd_so_pfx,
"
"                                                cr_fetch.prohd_so_no,
"
"                                                cr_fetch.prohd_so_seq_no,
"
"                                                cr_fetch.prohd_so_sub_seq_no,
"
"                                                v_so_print_seq_no,
"
"                                                cr_fetch. prohd_so_schld_desc,
"
"                                                cr_fetch.prohd_cust_id,
"
"                                                cr_fetch.prohd_cust_po_no,
"
"                                                cr_fetch.prohd_cust_po_seq_no,
"
"                                                cr_fetch.prohd_cust_po_date,
"
"                                                cr_fetch.prohd_so_desp_date,
"
"                                                v_rcp_store,
"
"                                                cr_fetch.prohd_proj_id,
"
"                                                cr_fetch.prohd_task_id,
"
"                                                cr_fetch.potr_oprn_seq_no,
"
"                                                cr_fetch.potr_sys_ls_no,
"
"                                                cr_fetch.potr_lot_no,
"
"                                                cr_fetch.potr_ser_no,
"
"                                                'N',
"
"                                                'Y',
"
"                                                v_rc_no,
"
"                                                'P',
"
"                                                v_sou_id,
"
"                                                'SWCL',
"
"                                                cr_fetch.potr_trans_no,
"
"                                                cr_fetch.prohd_sou_bu,
"
"                                                cr_fetch.prohd_sou_plnt      ,
"
"                                                cr_fetch.prohd_sou_ord_pfx   ,
"
"                                                cr_fetch.prohd_sou_ord_no    ,
"
"                                                cr_fetch.prohd_sou_seq_no    ,
"
"                                                cr_fetch.prohd_sou_sub_seq_no,
"
"                                                v_mchn_id,
"
"                                                v_opr_id,
"
"                                                v_opr_id2,
"
"                                                v_child_lot_no,
"
"                                                cr_fetch.child_sys_ls_no,
"
"                                                cr_fetch.potr_oprn_seq_no
"
"                                                );
"
"
"
"
"
"             v_qc_cnt := 0;
"
"
"
"            DBMS_OUTPUT.PUT_LINE('Check ->'||'~'||i);
"
"            EXIT WHEN i = v_ls_cnt;
"
"
"
"            END LOOP; --i End Loop
"
"
"
"            END LOOP c_fetch;
"
"
"
"        END LOOP r_shift;
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_mig_shift_wise_comp;
"
"
"
"    PROCEDURE proc_mig_cust_schld_weeks
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_plnt            VARCHAR2,
"
"    p_doc_no        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_file_name     VARCHAR2,
"
"    p_lang            NUMBER,
"
"    p_sep            VARCHAR2
"
"    )
"
"    IS
"
"    TYPE re_mig_week IS RECORD(
"
"                               rmw_cust_id             suppliers.suplr_suplr_id%TYPE,
"
"                               rmw_cust_name1         suppliers.suplr_name1%TYPE,
"
"                               rmw_cust_prod_id        products.prod_id%TYPE,
"
"                               rmw_prod_id            products.prod_id%TYPE,
"
"                               rmw_prod_rev            products.prod_rev%TYPE,
"
"                               rmw_week1_qty       number(12,3),
"
"                               rmw_week2_qty         number(12,3),
"
"                               rmw_week3_qty         number(12,3),
"
"                               rmw_week4_qty        number(12,3)
"
"                               );
"
"
"
"    TYPE t_mig_week IS TABLE OF re_mig_week INDEX BY PLS_INTEGER;
"
"
"
"    r_mig_week    t_mig_week;
"
"
"
"    TYPE ref_mig_week IS REF CURSOR;
"
"
"
"    r_ref_mig_week    ref_mig_week;
"
"
"
"    v_create_table VARCHAR2(4000);
"
"    v_cust_id        suppliers.suplr_suplr_id%TYPE;
"
"    v_cust_name1    suppliers.suplr_name1%TYPE;
"
"    v_prod_id        products.prod_id%TYPE;
"
"    v_cust_prod_id    cust_prod.custp_cust_prod_id%TYPE;
"
"    v_seq_no        number;
"
"    i                 NUMBER := 0;
"
"
"
"    BEGIN
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"
"
"            v_create_table := 'CREATE TABLE EXCEL_MIGRATION(emig_cust_id        VARCHAR2(15),
"
"                                                            emig_cust_name       VARCHAR2(100),
"
"                                                            emig_cust_prod_id   VARCHAR2(25),
"
"                                                            emig_prod_id        VARCHAR2(25),
"
"                                                            emig_prod_rev        NUMBER(5),
"
"                                                            emig_week1_qty        NUMBER(12,3),
"
"                                                            emig_week2_qty        NUMBER(12,3),
"
"                                                            emig_week3_qty        NUMBER(12,3),
"
"                                                            emig_week4_qty        NUMBER(12,3)
"
"                                                            )
"
"                                                ORGANIZATION EXTERNAL(
"
"                                                   TYPE ORACLE_LOADER
"
"                                                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                    ACCESS PARAMETERS(
"
"                                                          RECORDS DELIMITED BY NEWLINE
"
"                                                          SKIP 1
"
"                                                          FIELDS TERMINATED BY '''||p_sep||'''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                           emig_cust_id              CHAR(255),
"
"                                                           emig_cust_name        CHAR(255),
"
"                                                           emig_cust_prod_id       CHAR(255),
"
"                                                           emig_prod_id            CHAR(255),
"
"                                                           emig_prod_rev          CHAR(255),
"
"                                                           emig_week1_qty        CHAR(255),
"
"                                                           emig_week2_qty        CHAR(255),
"
"                                                           emig_week3_qty        CHAR(255),
"
"                                                           emig_week4_qty       CHAR(255)
"
"                                                           )
"
"                                                                       )
"
"                                                        LOCATION ('''||p_file_name||''')
"
"                                                                       ) REJECT LIMIT UNLIMITED';
"
"
"
"    EXECUTE IMMEDIATE v_create_table;
"
"
"
"      /*EXECUTE IMMEDIATE 'SELECT emig_cust_id        ,
"
"                                emig_cust_name       ,
"
"                                emig_cust_prod_id   ,
"
"                                emig_prod_id        ,
"
"                                emig_prod_rev        ,
"
"                                emig_week1_qty        ,
"
"                                emig_week2_qty        ,
"
"                                emig_week3_qty        ,
"
"                                emig_week4_qty
"
"                           FROM excel_migration
"
"                          ORDER BY emig_cust_id'
"
"                           BULK COLLECT INTO r_mig_week;*/
"
"
"
"    OPEN r_ref_mig_week FOR 'SELECT *
"
"                            FROM excel_migration';
"
"    LOOP
"
"    i := i + 1;
"
"    FETCH r_ref_mig_week INTO r_mig_week(i);
"
"    EXIT WHEN r_ref_mig_week%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE r_ref_mig_week;
"
"
"
"    FOR i IN r_mig_week.FIRST..r_mig_week.LAST
"
"    LOOP
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(suplr_suplr_id),
"
"                   suplr_name1
"
"              INTO v_cust_id,
"
"                   v_cust_name1
"
"              FROM suppliers
"
"             WHERE suplr_bu = p_bu
"
"               AND suplr_suplr_id = r_mig_week(i).rmw_cust_id
"
"               AND suplr_status = 'A'
"
"              GROUP BY suplr_name1;
"
"
"
"            IF v_cust_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20152,'ARM'||'Customer'||'~'||r_mig_week(i).rmw_cust_id);
"
"            END IF;
"
"
"
"        END;
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(prod_id)
"
"              INTO v_prod_id
"
"              FROM products,
"
"                   prod_plants
"
"             WHERE prod_bu = prodplnt_bu
"
"               AND prod_id = prodplnt_prod_id
"
"               AND prod_rev = prodplnt_prod_rev
"
"               AND prod_status = 'A'
"
"               AND prodplnt_status = 'A'
"
"               AND prod_bu = p_bu
"
"               AND prodplnt_plnt = p_plnt
"
"               AND prod_id = r_mig_week(i).rmw_prod_id
"
"               AND prod_rev = r_mig_week(i).rmw_prod_rev;
"
"
"
"            IF v_prod_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20260,'ICM'||'Item'||'~'||r_mig_week(i).rmw_prod_id);
"
"            END IF;
"
"
"
"        END;
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(custp_prod_id)
"
"              INTO v_cust_prod_id
"
"              FROM suppliers,
"
"                   cust_prod
"
"             WHERE suplr_bu = custp_bu
"
"               AND suplr_suplr_id = custp_cust_id
"
"               AND suplr_status = 'A'
"
"               AND suplr_bu = p_bu
"
"               AND suplr_suplr_id    = r_mig_week(i).rmw_cust_id
"
"               AND custp_prod_id = r_mig_week(i).rmw_cust_prod_id;
"
"
"
"            IF v_cust_prod_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20747,'SOM'||'Cust. Item'||'~'||r_mig_week(i).rmw_cust_prod_id||'Customer'||'~'||r_mig_week(i).rmw_cust_id);
"
"            END IF;
"
"
"
"        END;
"
"
"
"
"
"
"
"    END LOOP; --End i Loop
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_mig_cust_schld_weeks;
"
"
"
"    PROCEDURE proc_mig_cust_schld_days
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_plnt            VARCHAR2,
"
"    p_doc_no        VARCHAR2,
"
"    p_from_date        DATE,
"
"    p_to_date        DATE,
"
"    p_user            VARCHAR2,
"
"    p_file_name     VARCHAR2,
"
"    p_lang            NUMBER    ,
"
"    p_sep            VARCHAR2,
"
"    p_out    OUT        VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c_split(c_day NUMBER,c_qty NUMBER)
"
"      IS
"
"    SELECT CASE WHEN c_day = 1 THEN c_qty
"
"                WHEN c_day = 2 THEN c_qty
"
"                WHEN c_day = 3 THEN c_qty
"
"                WHEN c_day = 4 THEN c_qty
"
"                WHEN c_day = 5 THEN c_qty
"
"                WHEN c_day = 6 THEN c_qty
"
"                WHEN c_day = 7 THEN c_qty
"
"                WHEN c_day = 8 THEN c_qty
"
"                WHEN c_day = 9 THEN c_qty
"
"                WHEN c_day = 10 THEN c_qty
"
"                WHEN c_day = 11 THEN c_qty
"
"                WHEN c_day = 12 THEN c_qty
"
"                WHEN c_day = 13 THEN c_qty
"
"                WHEN c_day = 14 THEN c_qty
"
"                WHEN c_day = 15 THEN c_qty
"
"                WHEN c_day = 16 THEN c_qty
"
"                WHEN c_day = 17 THEN c_qty
"
"                WHEN c_day = 18 THEN c_qty
"
"                WHEN c_day = 19 THEN c_qty
"
"                WHEN c_day = 20 THEN c_qty
"
"                WHEN c_day = 21 THEN c_qty
"
"                WHEN c_day = 22 THEN c_qty
"
"                WHEN c_day = 23 THEN c_qty
"
"                WHEN c_day = 24 THEN c_qty
"
"                WHEN c_day = 25 THEN c_qty
"
"                WHEN c_day = 26 THEN c_qty
"
"                WHEN c_day = 27 THEN c_qty
"
"                WHEN c_day = 28 THEN c_qty
"
"                WHEN c_day = 29 THEN c_qty
"
"                WHEN c_day = 30 THEN c_qty
"
"                WHEN c_day = 31 THEN c_qty END day_qty
"
"      FROM dual;
"
"
"
"    TYPE re_mig_day IS RECORD(
"
"                               rmd_cust_id             suppliers.suplr_suplr_id%TYPE,
"
"                               rmd_cust_name1         suppliers.suplr_name1%TYPE,
"
"                               rmd_cust_prod_id        cust_prod.custp_cust_prod_id%TYPE,
"
"                               rmd_prod_id            products.prod_id%TYPE,
"
"                               rmd_prod_rev            products.prod_rev%TYPE,
"
"                               rmd_day_qty1            number(12,3),
"
"                               rmd_day_qty2            number(12,3),
"
"                               rmd_day_qty3            number(12,3),
"
"                               rmd_day_qty4            number(12,3),
"
"                               rmd_day_qty5            number(12,3),
"
"                               rmd_day_qty6            number(12,3),
"
"                               rmd_day_qty7            number(12,3),
"
"                               rmd_day_qty8            number(12,3),
"
"                               rmd_day_qty9            number(12,3),
"
"                               rmd_day_qty10        number(12,3),
"
"                               rmd_day_qty11        number(12,3),
"
"                               rmd_day_qty12        number(12,3),
"
"                               rmd_day_qty13        number(12,3),
"
"                               rmd_day_qty14        number(12,3),
"
"                               rmd_day_qty15        number(12,3),
"
"                               rmd_day_qty16        number(12,3),
"
"                               rmd_day_qty17        number(12,3),
"
"                               rmd_day_qty18        number(12,3),
"
"                               rmd_day_qty19        number(12,3),
"
"                               rmd_day_qty20        number(12,3),
"
"                               rmd_day_qty21        number(12,3),
"
"                               rmd_day_qty22        number(12,3),
"
"                               rmd_day_qty23        number(12,3),
"
"                               rmd_day_qty24        number(12,3),
"
"                               rmd_day_qty25        number(12,3),
"
"                               rmd_day_qty26        number(12,3),
"
"                               rmd_day_qty27        number(12,3),
"
"                               rmd_day_qty28        number(12,3),
"
"                               rmd_day_qty29        number(12,3),
"
"                               rmd_day_qty30        number(12,3),
"
"                               rmd_day_qty31        number(12,3)
"
"                               );
"
"
"
"    TYPE t_mig_day IS TABLE OF re_mig_day INDEX BY PLS_INTEGER;
"
"
"
"    r_mig_day    t_mig_day;
"
"
"
"    TYPE ref_mig_day IS REF CURSOR;
"
"
"
"    r_ref_mig_day    ref_mig_day;
"
"
"
"    cr_split        c_split%ROWTYPE;
"
"    v_diff_date        NUMBER;
"
"    v_split_qty        NUMBER;
"
"    v_create_table             CLOB;
"
"    v_cust_id        NUMBER; --customers.cust_cust_id%TYPE;
"
"    v_cust_name1    suppliers.suplr_name1%TYPE;
"
"    v_prod_id        NUMBER; --products.prod_id%TYPE;
"
"    v_cust_prod_id    NUMBER; --products.prod_id%TYPE;
"
"    v_seq_no        number;
"
"    /*v_day_qty1    cust_schld_ln_day.csld_day1_qty%TYPE;
"
"    v_day_qty2        cust_schld_ln_day.csld_day2_qty%TYPE;
"
"    v_day_qty3        cust_schld_ln_day.csld_day3_qty%TYPE;
"
"    v_day_qty4        cust_schld_ln_day.csld_day4_qty%TYPE;
"
"    v_day_qty5        cust_schld_ln_day.csld_day5_qty%TYPE;
"
"    v_day_qty6        cust_schld_ln_day.csld_day6_qty%TYPE;
"
"    v_day_qty7        cust_schld_ln_day.csld_day7_qty%TYPE;
"
"    v_day_qty8        cust_schld_ln_day.csld_day8_qty%TYPE;
"
"    v_day_qty9        cust_schld_ln_day.csld_day9_qty%TYPE;
"
"    v_day_qty10        cust_schld_ln_day.csld_day10_qty%TYPE;
"
"    v_day_qty11        cust_schld_ln_day.csld_day11_qty%TYPE;
"
"    v_day_qty12     cust_schld_ln_day.csld_day12_qty%TYPE;
"
"    v_day_qty13        cust_schld_ln_day.csld_day13_qty%TYPE;
"
"    v_day_qty14        cust_schld_ln_day.csld_day14_qty%TYPE;
"
"    v_day_qty15        cust_schld_ln_day.csld_day15_qty%TYPE;
"
"    v_day_qty16        cust_schld_ln_day.csld_day16_qty%TYPE;
"
"    v_day_qty17        cust_schld_ln_day.csld_day17_qty%TYPE;
"
"    v_day_qty18        cust_schld_ln_day.csld_day18_qty%TYPE;
"
"    v_day_qty19        cust_schld_ln_day.csld_day19_qty%TYPE;
"
"    v_day_qty20        cust_schld_ln_day.csld_day20_qty%TYPE;
"
"    v_day_qty21        cust_schld_ln_day.csld_day21_qty%TYPE;
"
"    v_day_qty22        cust_schld_ln_day.csld_day22_qty%TYPE;
"
"    v_day_qty23        cust_schld_ln_day.csld_day23_qty%TYPE;
"
"    v_day_qty24        cust_schld_ln_day.csld_day24_qty%TYPE;
"
"    v_day_qty25        cust_schld_ln_day.csld_day25_qty%TYPE;
"
"    v_day_qty26        cust_schld_ln_day.csld_day26_qty%TYPE;
"
"    v_day_qty27        cust_schld_ln_day.csld_day27_qty%TYPE;
"
"    v_day_qty28        cust_schld_ln_day.csld_day28_qty%TYPE;
"
"    v_day_qty29        cust_schld_ln_day.csld_day29_qty%TYPE;
"
"    v_day_qty30        cust_schld_ln_day.csld_day30_qty%TYPE;
"
"    v_day_qty31        cust_schld_ln_day.csld_day31_qty%TYPE;
"
"    v_day_tot_qty    cust_schld_ln_day.csld_day1_qty%TYPE;
"
"    v_day_diff_qty    cust_schld_ln_day.csld_day1_qty%TYPE;
"
"    v_upd_seq_no    NUMBER;*/
"
"    v_msg                VARCHAR2(4000);
"
"    v_exp                NUMBER(5);
"
"    i                NUMBER := 0;
"
"    BEGIN
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"
"
"            v_create_table := 'CREATE TABLE EXCEL_MIGRATION(emig_cust_id        VARCHAR2(15),
"
"                                    emig_cust_name       VARCHAR2(100),
"
"                                                                    emig_cust_prod_id   VARCHAR2(25),
"
"                                                                    emig_prod_id        VARCHAR2(25),
"
"                                                                    emig_prod_rev        NUMBER,
"
"                                                                    emig_day_qty1        NUMBER,
"
"                                                                    emig_day_qty2        NUMBER,
"
"                                                                    emig_day_qty3        NUMBER,
"
"                                                                    emig_day_qty4        NUMBER,
"
"                                                                    emig_day_qty5        NUMBER,
"
"                                                                    emig_day_qty6        NUMBER,
"
"                                                                    emig_day_qty7        NUMBER,
"
"                                                                    emig_day_qty8        NUMBER,
"
"                                                                    emig_day_qty9        NUMBER,
"
"                                                                    emig_day_qty10        NUMBER,
"
"                                                                    emig_day_qty11        NUMBER,
"
"                                                                    emig_day_qty12      NUMBER,
"
"                                                                    emig_day_qty13        NUMBER,
"
"                                                                    emig_day_qty14        NUMBER,
"
"                                                                    emig_day_qty15        NUMBER,
"
"                                                                    emig_day_qty16        NUMBER,
"
"                                                                    emig_day_qty17        NUMBER,
"
"                                                                    emig_day_qty18        NUMBER,
"
"                                                                    emig_day_qty19        NUMBER,
"
"                                                                    emig_day_qty20        NUMBER,
"
"                                                                    emig_day_qty21        NUMBER,
"
"                                                                    emig_day_qty22        NUMBER,
"
"                                                                    emig_day_qty23        NUMBER,
"
"                                                                    emig_day_qty24        NUMBER,
"
"                                                                    emig_day_qty25        NUMBER,
"
"                                                                    emig_day_qty26        NUMBER,
"
"                                                                    emig_day_qty27        NUMBER,
"
"                                                                    emig_day_qty28        NUMBER,
"
"                                                                    emig_day_qty29        NUMBER,
"
"                                                                    emig_day_qty30        NUMBER,
"
"                                                                    emig_day_qty31      NUMBER
"
"                                                                    )
"
"                                                        ORGANIZATION EXTERNAL
"
"                                                                                   (TYPE ORACLE_LOADER
"
"                                                                                          DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                                                          ACCESS PARAMETERS(RECORDS DELIMITED BY NEWLINE
"
"                                                                                                    SKIP 1
"
"                                                                                                   FIELDS TERMINATED BY '''||p_sep||'''
"
"                                                                                                   MISSING FIELD VALUES ARE NULL
"
"                                                   REJECT ROWS WITH ALL NULL FIELDS
"
"                                                                  (
"
"                                                                   emig_cust_id              CHAR(255),
"
"                                                                   emig_cust_name        CHAR(255),
"
"                                                                  emig_cust_prod_id       CHAR(255),
"
"                                                                  emig_prod_id            CHAR(255),
"
"                                                                  emig_prod_rev          CHAR(255),
"
"                                                                   emig_day_qty1        CHAR(255),
"
"                                                                   emig_day_qty2        CHAR(255),
"
"                                                                   emig_day_qty3        CHAR(255),
"
"                                                                   emig_day_qty4        CHAR(255),
"
"                                                                   emig_day_qty5        CHAR(255),
"
"                                                                   emig_day_qty6        CHAR(255),
"
"                                                                   emig_day_qty7        CHAR(255),
"
"                                                                   emig_day_qty8        CHAR(255),
"
"                                                                   emig_day_qty9        CHAR(255),
"
"                                                                   emig_day_qty10        CHAR(255),
"
"                                                                   emig_day_qty11        CHAR(255),
"
"                                                                   emig_day_qty12       CHAR(255),
"
"                                                                   emig_day_qty13        CHAR(255),
"
"                                                                   emig_day_qty14        CHAR(255),
"
"                                                                   emig_day_qty15        CHAR(255),
"
"                                                                   emig_day_qty16        CHAR(255),
"
"                                                                   emig_day_qty17        CHAR(255),
"
"                                                                   emig_day_qty18        CHAR(255),
"
"                                                                   emig_day_qty19        CHAR(255),
"
"                                                                   emig_day_qty20        CHAR(255),
"
"                                                                   emig_day_qty21        CHAR(255),
"
"                                                                   emig_day_qty22        CHAR(255),
"
"                                                                   emig_day_qty23        CHAR(255),
"
"                                                                   emig_day_qty24        CHAR(255),
"
"                                                                   emig_day_qty25        CHAR(255),
"
"                                                                   emig_day_qty26        CHAR(255),
"
"                                                                   emig_day_qty27        CHAR(255),
"
"                                                                   emig_day_qty28        CHAR(255),
"
"                                                                   emig_day_qty29        CHAR(255),
"
"                                                                   emig_day_qty30        CHAR(255),
"
"                                                                   emig_day_qty31       CHAR(255)
"
"                                                                   )
"
"                                                                               )
"
"                                                                LOCATION ('''||p_file_name||''')
"
"                                                                ) REJECT LIMIT UNLIMITED';
"
"
"
"    --raise_application_error(-20999,'HRM');
"
"    EXECUTE IMMEDIATE v_create_table;
"
"       --raise_application_error(-20999,'HRM');
"
"      /*EXECUTE IMMEDIATE 'SELECT emig_cust_id        ,
"
"                                emig_cust_name       ,
"
"                                emig_cust_prod_id   ,
"
"                                emig_prod_id        ,
"
"                                emig_prod_rev        ,
"
"                                emig_week1_qty        ,
"
"                                emig_week2_qty        ,
"
"                                emig_week3_qty        ,
"
"                                emig_week4_qty
"
"                           FROM excel_migration
"
"                          ORDER BY emig_cust_id'
"
"                           BULK COLLECT INTO r_mig_day;*/
"
"
"
"    OPEN r_ref_mig_day FOR 'SELECT *
"
"                            FROM excel_migration';
"
"    LOOP
"
"
"
"    i := i + 1;
"
"    FETCH r_ref_mig_day INTO r_mig_day(i);
"
"    EXIT WHEN r_ref_mig_day%NOTFOUND;
"
"
"
"    BEGIN
"
"          SELECT COUNT(suplr_suplr_id)
"
"        INTO v_cust_id
"
"        FROM suppliers
"
"       WHERE suplr_bu = p_bu
"
"         AND suplr_suplr_id = r_mig_day(i).rmd_cust_id
"
"         AND suplr_status = 'A'
"
"       GROUP BY suplr_name1;
"
"     EXCEPTION WHEN NO_DATA_FOUND THEN
"
"       v_cust_id := 0;
"
"    END;
"
"
"
"        BEGIN
"
"      SELECT COUNT(prod_id)
"
"        INTO v_prod_id
"
"        FROM products,
"
"             prod_plants
"
"       WHERE prod_bu = prodplnt_bu
"
"         AND prod_id = prodplnt_prod_id
"
"         AND prod_rev = prodplnt_prod_rev
"
"         AND prod_status = 'A'
"
"         AND prodplnt_status = 'A'
"
"         AND prod_bu = p_bu
"
"         AND prodplnt_plnt = p_plnt
"
"         AND prod_id = r_mig_day(i).rmd_prod_id
"
"         AND prod_rev = r_mig_day(i).rmd_prod_rev;
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN
"
"              v_prod_id := 0;
"
"    END;
"
"
"
"    BEGIN
"
"      SELECT COUNT(custp_prod_id)
"
"        INTO v_cust_prod_id
"
"        FROM suppliers,
"
"             cust_prod
"
"       WHERE suplr_bu = custp_bu
"
"        AND suplr_suplr_id = custp_cust_id
"
"         AND suplr_status = 'A'
"
"         AND suplr_bu = p_bu
"
"         AND suplr_suplr_id    = r_mig_day(i).rmd_cust_id
"
"         AND custp_prod_id = r_mig_day(i).rmd_cust_prod_id;
"
"
"
"       EXCEPTION WHEN NO_DATA_FOUND THEN
"
"              v_cust_prod_id := 0;
"
"    END;
"
"
"
"      IF v_cust_id = 0 THEN
"
"         v_msg := r_mig_day(i).rmd_cust_id||' - Customer not found. ';
"
"      END IF;
"
"      IF v_prod_id = 0 THEN
"
"         v_msg := r_mig_day(i).rmd_prod_id||' - Item not found.';
"
"      END IF;
"
"      IF v_cust_prod_id = 0 THEN
"
"         v_msg := r_mig_day(i).rmd_cust_id||' - '||r_mig_day(i).rmd_cust_prod_id||' - Customer Item not found.';
"
"      END IF;
"
"      IF v_msg IS NOT NULL THEn
"
"         v_msg := NULL;
"
"      END IF;
"
"    END LOOP;
"
"
"
"    CLOSE r_ref_mig_day;
"
"
"
"    --v_diff_date    := (TO_NUMBER(TO_CHAR(p_to_date,'DD')) - TO_NUMBER(TO_CHAR(p_from_date,'DD'))) + 1;
"
"
"
"    --v_diff_date    := TRUNC(p_to_date) - TRUNC(p_from_date) + 1;
"
"
"
"    --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_diff_date);
"
"
"
"    FOR i IN r_mig_day.FIRST..r_mig_day.LAST
"
"    LOOP
"
"
"
"        --v_split_qty := r_mig_day(i).rmd_month_qty / v_diff_date;
"
"
"
"        /*FOR j IN 1..v_diff_date
"
"        LOOP
"
"        OPEN c_split(j,ROUND(v_split_qty));
"
"        FETCH c_split INTO cr_split;
"
"        IF c_split%FOUND THEN
"
"
"
"            v_day_tot_qty := (ROUND(v_split_qty) * v_diff_date);
"
"
"
"            IF r_mig_day(i).rmd_month_qty < v_day_tot_qty THEN
"
"
"
"                v_day_diff_qty := v_day_tot_qty - r_mig_day(i).rmd_month_qty;
"
"
"
"            ELSIF r_mig_day(i).rmd_month_qty > v_day_tot_qty THEN
"
"
"
"                v_day_diff_qty := r_mig_day(i).rmd_month_qty - v_day_tot_qty;
"
"
"
"                --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_day_tot_qty||'~'||r_mig_day(i).rmd_month_qty||'~'||v_day_diff_qty);
"
"
"
"            ELSIF r_mig_day(i).rmd_month_qty = v_day_tot_qty THEN
"
"
"
"                v_day_diff_qty := 0;
"
"
"
"            END IF;
"
"
"
"            IF j = 1 THEN
"
"                v_day_qty1 := cr_split.day_qty;
"
"            ELSIF j = 2 THEN
"
"                v_day_qty2 := cr_split.day_qty;
"
"            ELSIF j = 3 THEN
"
"                v_day_qty3 := cr_split.day_qty;
"
"            ELSIF j = 4 THEN
"
"                v_day_qty4 := cr_split.day_qty;
"
"            ELSIF j = 5 THEN
"
"                v_day_qty5 := cr_split.day_qty;
"
"            ELSIF j = 6 THEN
"
"                v_day_qty6 := cr_split.day_qty;
"
"            ELSIF j = 7 THEN
"
"                v_day_qty7 := cr_split.day_qty;
"
"            ELSIF j = 8 THEN
"
"                v_day_qty8 := cr_split.day_qty;
"
"            ELSIF j = 9 THEN
"
"                v_day_qty9 := cr_split.day_qty;
"
"            ELSIF j = 10 THEN
"
"                v_day_qty10 := cr_split.day_qty;
"
"            ELSIF j = 11 THEN
"
"                v_day_qty11 := cr_split.day_qty;
"
"            ELSIF j = 12 THEN
"
"                v_day_qty12 := cr_split.day_qty;
"
"            ELSIF j = 13 THEN
"
"                v_day_qty13 := cr_split.day_qty;
"
"            ELSIF j = 14 THEN
"
"                v_day_qty14 := cr_split.day_qty;
"
"            ELSIF j = 15 THEN
"
"                v_day_qty15 := cr_split.day_qty;
"
"            ELSIF j = 16 THEN
"
"                v_day_qty16 := cr_split.day_qty;
"
"            ELSIF j = 17 THEN
"
"                v_day_qty17 := cr_split.day_qty;
"
"            ELSIF j = 18 THEN
"
"                v_day_qty18 := cr_split.day_qty;
"
"            ELSIF j = 19 THEN
"
"                v_day_qty19 := cr_split.day_qty;
"
"            ELSIF j = 20 THEN
"
"                v_day_qty20 := cr_split.day_qty;
"
"            ELSIF j = 21 THEN
"
"                v_day_qty21 := cr_split.day_qty;
"
"            ELSIF j = 22 THEN
"
"                v_day_qty22 := cr_split.day_qty;
"
"            ELSIF j = 23 THEN
"
"                v_day_qty23 := cr_split.day_qty;
"
"            ELSIF j = 24 THEN
"
"                v_day_qty24 := cr_split.day_qty;
"
"            ELSIF j = 25 THEN
"
"                v_day_qty25 := cr_split.day_qty;
"
"            ELSIF j = 26 THEN
"
"                v_day_qty26 := cr_split.day_qty;
"
"            ELSIF j = 27 THEN
"
"                v_day_qty27 := cr_split.day_qty;
"
"            ELSIF j = 28 THEN
"
"                v_day_qty28 := cr_split.day_qty;
"
"            ELSIF j = 29 THEN
"
"                v_day_qty29 := cr_split.day_qty;
"
"            ELSIF j = 30 THEN
"
"                v_day_qty30 := cr_split.day_qty;
"
"            ELSIF j = 31 THEN
"
"                v_day_qty31 := cr_split.day_qty;
"
"            END IF;
"
"
"
"        END IF;
"
"        CLOSE c_split;
"
"
"
"        END LOOP; --End j Loop*/
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(suplr_suplr_id),
"
"                   suplr_name1
"
"              INTO v_cust_id,
"
"                   v_cust_name1
"
"              FROM suppliers
"
"             WHERE suplr_bu = p_bu
"
"               AND suplr_suplr_id = r_mig_day(i).rmd_cust_id
"
"               AND suplr_status = 'A'
"
"             GROUP BY suplr_name1;
"
"
"
"            /*IF v_cust_id = 0 THEN
"
"               RAISE_APPLICATION_ERROR(-20152,'ARM'||'Customer'||'~'||r_mig_day(i).rmd_cust_id);
"
"            END IF;*/
"
"
"
"        END;
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(prod_id)
"
"              INTO v_prod_id
"
"              FROM products,
"
"                   prod_plants
"
"             WHERE prod_bu = prodplnt_bu
"
"               AND prod_id = prodplnt_prod_id
"
"               AND prod_rev = prodplnt_prod_rev
"
"               AND prod_status = 'A'
"
"               AND prodplnt_status = 'A'
"
"               AND prod_bu = p_bu
"
"               AND prodplnt_plnt = p_plnt
"
"               AND prod_id = r_mig_day(i).rmd_prod_id
"
"               AND prod_rev = r_mig_day(i).rmd_prod_rev;
"
"
"
"            /*IF v_prod_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20260,'ICM'||'Item'||'~'||r_mig_day(i).rmd_prod_id);
"
"            END IF;*/
"
"
"
"        END;
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(custp_prod_id)
"
"              INTO v_cust_prod_id
"
"              FROM suppliers,
"
"                   cust_prod
"
"             WHERE suplr_bu = custp_bu
"
"               AND suplr_suplr_id = custp_cust_id
"
"               AND suplr_status = 'A'
"
"               AND suplr_bu = p_bu
"
"               AND suplr_suplr_id    = r_mig_day(i).rmd_cust_id
"
"               AND custp_prod_id = r_mig_day(i).rmd_cust_prod_id;
"
"
"
"            /*IF v_cust_prod_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20747,'SOM'||'Cust. Item'||'~'||r_mig_day(i).rmd_cust_prod_id||'Customer'||'~'||r_mig_day(i).rmd_cust_id);
"
"            END IF;    */
"
"
"
"        END;
"
"
"
"
"
"
"
"    END LOOP; --End i Loop
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_mig_cust_schld_days;
"
"
"
"    PROCEDURE proc_mig_cust_schld_months(
"
"                                        p_bu            VARCHAR2,
"
"                                        p_plnt            VARCHAR2,
"
"                                        p_doc_no        VARCHAR2,
"
"                                        p_user            VARCHAR2,
"
"                                        p_file_name     VARCHAR2,
"
"                                        p_lang            NUMBER,
"
"                                        p_sep            VARCHAR2
"
"                                        )
"
"    IS
"
"    TYPE re_mig_month IS RECORD(
"
"                               rmm_cust_id             suppliers.suplr_suplr_id%TYPE,
"
"                               rmm_cust_name1         suppliers.suplr_name1%TYPE,
"
"                               rmm_cust_prod_id        products.prod_id%TYPE,
"
"                               rmm_prod_id            products.prod_id%TYPE,
"
"                               rmm_prod_rev            products.prod_rev%TYPE,
"
"                               rmm_firm_qty            NUMBER(12,3),
"
"                               rmm_ten1_qty            NUMBER(12,3),
"
"                               rmm_ten2_qty            NUMBER(12,3),
"
"                               rmm_ten3_qty            NUMBER(12,3),
"
"                               rmm_ten4_qty            NUMBER(12,3),
"
"                               rmm_ten5_qty           NUMBER(12,3)
"
"                               );
"
"
"
"    TYPE t_mig_month IS TABLE OF re_mig_month INDEX BY PLS_INTEGER;
"
"
"
"    r_mig_month    t_mig_month;
"
"
"
"    TYPE ref_mig_month IS REF CURSOR;
"
"
"
"    r_ref_mig_month    ref_mig_month;
"
"
"
"    v_create_table VARCHAR2(4000);
"
"    v_cust_id        suppliers.suplr_suplr_id%TYPE;
"
"    v_cust_name1    suppliers.suplr_name1%TYPE;
"
"    v_prod_id        products.prod_id%TYPE;
"
"    v_cust_prod_id    products.prod_id%TYPE;
"
"    v_seq_no        NUMBER;
"
"    i                 NUMBER := 0;
"
"
"
"    BEGIN
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"
"
"            v_create_table := 'CREATE TABLE EXCEL_MIGRATION(emig_cust_id        VARCHAR2(15),
"
"                                                            emig_cust_name       VARCHAR2(100),
"
"                                                            emig_cust_prod_id   VARCHAR2(25),
"
"                                                            emig_prod_id        VARCHAR2(25),
"
"                                                            emig_prod_rev        NUMBER(5),
"
"                                                            emig_firm_qty        NUMBER(12,3),
"
"                                                            emig_ten1_qty        NUMBER(12,3),
"
"                                                            emig_ten2_qty        NUMBER(12,3),
"
"                                                            emig_ten3_qty        NUMBER(12,3),
"
"                                                            emig_ten4_qty        NUMBER(12,3),
"
"                                                            emig_ten5_qty        NUMBER(12,3)
"
"                                                            )
"
"                                                ORGANIZATION EXTERNAL(
"
"                                                   TYPE ORACLE_LOADER
"
"                                                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                    ACCESS PARAMETERS(
"
"                                                          RECORDS DELIMITED BY NEWLINE
"
"                                                          SKIP 1
"
"                                                          FIELDS TERMINATED BY '''||p_sep||'''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                           emig_cust_id              CHAR(255),
"
"                                                           emig_cust_name        CHAR(255),
"
"                                                           emig_cust_prod_id       CHAR(255),
"
"                                                           emig_prod_id            CHAR(255),
"
"                                                           emig_prod_rev          CHAR(255),
"
"                                                           emig_firm_qty        CHAR(255),
"
"                                                           emig_ten1_qty        CHAR(255),
"
"                                                           emig_ten2_qty        CHAR(255),
"
"                                                           emig_ten3_qty        CHAR(255),
"
"                                                           emig_ten4_qty        CHAR(255),
"
"                                                           emig_ten5_qty        CHAR(255)
"
"                                                           )
"
"                                                                       )
"
"                                                        LOCATION ('''||p_file_name||''')
"
"                                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"    EXECUTE IMMEDIATE v_create_table;
"
"
"
"    OPEN r_ref_mig_month FOR 'SELECT *
"
"                            FROM excel_migration';
"
"    LOOP
"
"    i := i + 1;
"
"    FETCH r_ref_mig_month INTO r_mig_month(i);
"
"    EXIT WHEN r_ref_mig_month%NOTFOUND;
"
"    END LOOP;
"
"    CLOSE r_ref_mig_month;
"
"
"
"    FOR i IN r_mig_month.FIRST..r_mig_month.LAST
"
"    LOOP
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(suplr_suplr_id),
"
"                   suplr_name1
"
"              INTO v_cust_id,
"
"                   v_cust_name1
"
"              FROM suppliers
"
"             WHERE suplr_bu = p_bu
"
"               AND suplr_suplr_id = r_mig_month(i).rmm_cust_id
"
"               AND suplr_status = 'A'
"
"              GROUP BY suplr_name1;
"
"
"
"            IF v_cust_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20152,'ARM'||'Customer'||'~'||r_mig_month(i).rmm_cust_id);
"
"            END IF;
"
"
"
"        END;
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(prod_id)
"
"              INTO v_prod_id
"
"              FROM products,
"
"                   prod_plants
"
"             WHERE prod_bu = prodplnt_bu
"
"               AND prod_id = prodplnt_prod_id
"
"               AND prod_rev = prodplnt_prod_rev
"
"               AND prod_status = 'A'
"
"               AND prodplnt_status = 'A'
"
"               AND prod_bu = p_bu
"
"               AND prodplnt_plnt = p_plnt
"
"               AND prod_id = r_mig_month(i).rmm_prod_id
"
"               AND prod_rev = r_mig_month(i).rmm_prod_rev;
"
"
"
"            IF v_prod_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20260,'ICM'||'Item'||'~'||r_mig_month(i).rmm_prod_id);
"
"            END IF;
"
"
"
"        END;
"
"
"
"        BEGIN
"
"
"
"            SELECT COUNT(custp_prod_id)
"
"              INTO v_cust_prod_id
"
"              FROM suppliers,
"
"                   cust_prod
"
"             WHERE suplr_bu = custp_bu
"
"               AND suplr_suplr_id = custp_cust_id
"
"               AND suplr_status = 'A'
"
"               AND suplr_bu = p_bu
"
"               AND suplr_suplr_id    = r_mig_month(i).rmm_cust_id
"
"               AND custp_prod_id = r_mig_month(i).rmm_cust_prod_id;
"
"
"
"            IF v_cust_prod_id = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20747,'SOM'||'Cust. Item'||'~'||r_mig_month(i).rmm_cust_prod_id||'Customer'||'~'||r_mig_month(i).rmm_cust_id);
"
"            END IF;
"
"
"
"        END;
"
"
"
"
"
"
"
"    END LOOP; --End i Loop
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_mig_cust_schld_months;
"
"
"
"    PROCEDURE proc_mig_sw_wo_prod_comp
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_plnt            VARCHAR2,
"
"    p_doc_no        VARCHAR2,
"
"    p_doc_date      DATE,
"
"    p_shift_id        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_lang            NUMBER,
"
"    p_mr_res OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c_check_bom(c_prod_id VARCHAR2,c_prod_rev NUMBER)
"
"       IS
"
"    SELECT *
"
"      FROM bom_hd,
"
"           routing_ln,
"
"           bom_ln
"
"     WHERE bomhd_bu = rouln_bu
"
"       AND bomhd_plnt = rouln_plnt
"
"       AND bomhd_bom_no = rouln_bom_no
"
"       AND rouln_bu = bomln_bu
"
"       AND rouln_plnt = bomln_plnt
"
"       AND rouln_bom_no = bomln_bom_no
"
"       AND bomhd_status = 'A'
"
"       AND bomhd_primary = 'Y'
"
"       AND bomhd_bu = p_bu
"
"       AND bomhd_plnt = p_plnt
"
"       AND bomhd_prod_id = c_prod_id
"
"       AND bomhd_prod_rev = c_prod_rev;
"
"
"
"    CURSOR c_sf_code(c_bom_no VARCHAR2)
"
"       IS
"
"    SELECT COUNT(*) v_count
"
"      FROM routing_ln
"
"     WHERE rouln_bu = p_bu
"
"       AND rouln_plnt = p_plnt
"
"       AND rouln_bom_no = c_bom_no;
"
"
"
"    CURSOR c_oprn(c_bom_no VARCHAR2,c_oprn_id VARCHAR2)
"
"       IS
"
"    SELECT rouln_oprn_id,
"
"           rouln_rcp_store,
"
"           ROULN_OPRN_SEQ_NO
"
"      FROM routing_ln
"
"     WHERE rouln_bu = p_bu
"
"       AND rouln_plnt = p_plnt
"
"       AND rouln_bom_no = c_bom_no
"
"       AND rouln_oprn_id = c_oprn_id;
"
"
"
"    CURSOR c_bom_conv (c_prod_id         VARCHAR2,
"
"                  c_prod_rev        NUMBER,
"
"                  c_bom_type        VARCHAR2,
"
"                  c_bom_no        VARCHAR2
"
"                  )
"
"        IS
"
"    SELECT bomhd_uom,
"
"           bomhd_prod_uom,
"
"           DECODE (bomhd_conv_factor, 0, 1, bomhd_conv_factor) bomhd_conv_factor
"
"      FROM bom_hd
"
"     WHERE bomhd_bu         = p_bu
"
"       AND bomhd_plnt         = p_plnt
"
"       AND bomhd_prod_id     = c_prod_id
"
"       AND bomhd_prod_rev     = c_prod_rev
"
"       AND (TRUNC(p_doc_date) BETWEEN bomhd_eff_from AND bomhd_eff_to)
"
"       AND bomhd_bom_no        = c_bom_no
"
"       AND c_bom_type        = 'M'
"
"     ;
"
"
"
"    CURSOR c_start
"
"      IS
"
"    SELECT CASE WHEN (TRUNC(p_doc_date) + ((shifthd_end_time/3600)/24)) < (TRUNC(p_doc_date) +  ((shifthd_start_time/3600)/24)) THEN
"
"                     (TRUNC(p_doc_date) + ((shifthd_end_time/3600)/24)) + 1
"
"                ELSE (TRUNC(p_doc_date) + ((shifthd_end_time/3600)/24))
"
"           END shifthd_end_time,
"
"           (TRUNC(p_doc_date) +  ((shifthd_start_time/3600)/24)) shifthd_start_time
"
"     FROM shifts_hd
"
"    WHERE shifthd_bu = p_bu
"
"      AND shifthd_plnt = p_plnt
"
"      AND shifthd_shift_id = p_shift_id
"
"      AND shifthd_status = 'A';
"
"
"
"    TYPE shift_wise_comp IS RECORD (
"
"                                    emig_prod_id           VARCHAR2(25),
"
"                                    emig_prod_rev        NUMBER(5),
"
"                                    emig_qty        NUMBER(12,3),
"
"                                    emig_process        VARCHAR2(30),
"
"                                    emig_mchn        VARCHAR2(100),
"
"                                    emig_opt1        VARCHAR2(10),
"
"                                    emig_opt2        VARCHAR2(10)
"
"                                    );
"
"
"
"    TYPE t_shift IS TABLE OF shift_wise_comp INDEX BY PLS_INTEGER;
"
"
"
"    r_shift t_shift;
"
"
"
"    TYPE type_shift_ref_cur    IS REF CURSOR;
"
"
"
"    r_shift_ref_cur    type_shift_ref_cur;
"
"
"
"    v_create_table       VARCHAR2(4000);
"
"    v_mchn_id             mfg_mach_operator.mmo_mach_id%TYPE;
"
"    v_opr_id             prod_transfer.pt_opt_id%TYPE;
"
"    v_opr_id2             prod_transfer.pt_opt_id2%TYPE;
"
"    v_trans_no             prod_transfer.pt_trans_no%TYPE;
"
"    v_year             prod_transfer.pt_year%TYPE;
"
"    v_period             prod_transfer.pt_period%TYPE;
"
"    v_sou_type             VARCHAR2(1);
"
"    v_sou_id             VARCHAR2(10);
"
"    v_store_id             VARCHAR2(15);
"
"    v_start_oprn_id         VARCHAR2(10);
"
"    v_end_oprn_id         VARCHAR2(10);
"
"    v_rcp_store             VARCHAR2(15);
"
"    v_oprn_id             VARCHAR2(10);
"
"    v_conv_factor         NUMBER;
"
"    v_oprn_type             VARCHAR2(1);
"
"    var_mr_result        VARCHAR2(4000);
"
"    v_qty                  NUMBER;
"
"    v_rem_qty             NUMBER;
"
"    var_msg                  VARCHAR2(100);
"
"    v_child_lot_no         prod_transfer.pt_lot_no%TYPE;
"
"    v_lot_no             prod_transfer.pt_lot_no%TYPE;
"
"    v_rc_no                  NUMBER;
"
"    v_rule_id             VARCHAR2(4000);
"
"    v_char                  VARCHAR2(4000);
"
"    i                    NUMBER := 0;
"
"    v_sf_code VARCHAR2(50);
"
"    v_sf_code1 VARCHAR2(50) := 0;
"
"    v_tar_sf_code    VARCHAR2(50);
"
"
"
"    cr_start     c_start%ROWTYPE;
"
"    cr_bom_conv c_bom_conv%ROWTYPE;
"
"    cr_check_bom c_check_bom%ROWTYPE;
"
"    cr_oprn         c_oprn%ROWTYPE;
"
"    v_loc_id        VARCHAR2(10);
"
"
"
"    BEGIN
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"          DELETE prod_transfer
"
"           WHERE pt_bu = p_bu
"
"             AND pt_plnt = p_plnt
"
"             AND pt_doc_no = p_doc_no;
"
"
"
"          v_create_table := 'CREATE TABLE EXCEL_MIGRATION(emig_prod_id           VARCHAR2(25),
"
"                                                          emig_prod_rev            NUMBER(5),
"
"                                                          emig_qty            NUMBER(12,3),
"
"                                                          emig_process            VARCHAR2(30),
"
"                                                          emig_mchn            VARCHAR2(100),
"
"                                                          emig_opt1            VARCHAR2(10),
"
"                                                          emig_opt2            VARCHAR2(10)
"
"                                                          )
"
"                                                ORGANIZATION EXTERNAL(
"
"                                                   TYPE ORACLE_LOADER
"
"                                                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                                    ACCESS PARAMETERS(
"
"                                                          RECORDS DELIMITED BY NEWLINE
"
"                                                          SKIP 1
"
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                           emig_prod_id         CHAR(255),
"
"                                                           emig_prod_rev      CHAR(255),
"
"                                                           emig_qty          CHAR(255),
"
"                                                           emig_process          CHAR(255),
"
"                                                           emig_mchn          CHAR(255),
"
"                                                           emig_opt1              CHAR(255),
"
"                                                           emig_opt2          CHAR(255)
"
"                                                           )
"
"                                                                       )
"
"                                                        LOCATION ('''||p_file_name||''')
"
"                                                        ) REJECT LIMIT UNLIMITED';
"
"
"
"      EXECUTE IMMEDIATE v_create_table;
"
"
"
"        OPEN r_shift_ref_cur FOR 'SELECT *
"
"                                    FROM excel_migration';
"
"        LOOP
"
"        i := i + 1;
"
"        FETCH r_shift_ref_cur INTO r_shift(i);
"
"        EXIT WHEN r_shift_ref_cur%NOTFOUND;
"
"        END LOOP;
"
"        CLOSE r_shift_ref_cur;
"
"
"
"        FOR i IN 1..r_shift.COUNT()
"
"        LOOP
"
"
"
"            DBMS_OUTPUT.PUT_LINE('BEFORE'||' ' ||r_shift.COUNT());
"
"
"
"            v_store_id := func_find_deflt_storeid(p_bu, p_plnt, NULL, r_shift(i).emig_prod_id, r_shift(i).emig_prod_rev, 'N');
"
"
"
"            v_qty := r_shift(i).emig_qty;
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'|| v_qty);
"
"
"
"            OPEN c_check_bom(r_shift(i).emig_prod_id, r_shift(i).emig_prod_rev);
"
"            FETCH c_check_bom INTO cr_check_bom;
"
"               IF c_check_bom%NOTFOUND THEN
"
"                 RAISE_APPLICATION_ERROR(-20595,'PLN'||'~'||p_plnt||'~'||r_shift(i).emig_prod_id||'~'||r_shift(i).emig_prod_rev);
"
"               END IF;
"
"            CLOSE c_check_bom;
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_qty||'~'||cr_check_bom.bomhd_bom_no);
"
"
"
"            FOR cr_sf_code IN c_sf_code(cr_check_bom.bomhd_bom_no)
"
"            LOOP
"
"                FOR i IN 1..cr_sf_code.v_count
"
"                LOOP
"
"
"
"                   IF v_sf_code IS NULL THEN
"
"                      v_sf_code := v_sf_code||0;
"
"                   ELSE
"
"                      v_sf_code := v_sf_code||v_sf_code1;
"
"                   END IF;
"
"
"
"                END LOOP; --i loop
"
"            END LOOP c_sf_code;
"
"
"
"            v_sf_code := v_sf_code;
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_qty||'~'||v_sf_code||'~'||v_tar_sf_code);
"
"            v_tar_sf_code := func_find_tarsf_code(v_sf_code);
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_qty||'~'||v_sf_code||'~'||v_tar_sf_code);
"
"
"
"            IF r_shift(i).emig_qty IS NULL OR r_shift(i).emig_qty = 0 THEN
"
"            RAISE_APPLICATION_ERROR(-20596,'PLN');
"
"            END IF;
"
"
"
"            BEGIN
"
"
"
"            SELECT mfgo_oprn_id,
"
"                   mfgo_oprn_type
"
"              INTO v_oprn_id,
"
"                   v_oprn_type
"
"              FROM mfg_oprns
"
"             WHERE mfgo_bu = p_bu
"
"               AND mfgo_desc1 = r_shift(i).emig_process;
"
"
"
"            EXCEPTION WHEN NO_DATA_FOUND THEN
"
"            RAISE_APPLICATION_ERROR(-20474,'SFM'||'  '||r_shift(i).emig_process);
"
"            END;
"
"
"
"            OPEN c_oprn(cr_check_bom.bomhd_bom_no,v_oprn_id);
"
"            FETCH c_oprn INTO cr_oprn;
"
"               IF c_oprn%NOTFOUND THEN
"
"                  RAISE_APPLICATION_ERROR(-20474,'SFM'||'  '||r_shift(i).emig_process);
"
"               END IF;
"
"            CLOSE c_oprn;
"
"
"
"            BEGIN
"
"                IF r_shift(i).emig_mchn IS NULL THEN
"
"
"
"            SELECT mmo_mach_id,
"
"                   mmo_opr_id
"
"              INTO v_mchn_id,
"
"                   v_opr_id
"
"              FROM mfg_mach_operator
"
"             WHERE mmo_bu = p_bu
"
"               AND mmo_plnt = p_plnt
"
"               AND mmo_shift_id = p_shift_id
"
"               AND ROWNUM = 1;
"
"             ELSE
"
"                      SELECT mfgr_res_id
"
"                        INTO v_mchn_id
"
"                   FROM mfg_resources,
"
"                     mfg_res_groups
"
"                  WHERE mfgr_bu = mfgrg_bu
"
"                    AND mfgr_plnt = mfgrg_plnt
"
"                    AND mfgr_group_id = mfgrg_grp_id
"
"                    AND mfgr_bu     = p_bu
"
"                 AND mfgr_plnt   = p_plnt
"
"                        AND mfgr_name1 = r_shift(i).emig_mchn;
"
"             END IF;
"
"
"
"          EXCEPTION WHEN NO_DATA_FOUND THEN
"
"             RAISE_APPLICATION_ERROR(-20654,'PRJ');
"
"          END;
"
"
"
"            BEGIN
"
"
"
"            IF r_shift(i).emig_opt1 IS NULL THEN
"
"
"
"                        SELECT emp_emp_id
"
"                          INTO v_opr_id
"
"                          FROM employees
"
"                         WHERE emp_bu = p_bu
"
"                           AND emp_status = 'A'
"
"                           AND ROWNUM = 1
"
"                         ORDER BY  emp_emp_id;
"
"            ELSE
"
"                SELECT mfgr_emp_id
"
"                     INTO v_opr_id
"
"                    FROM (SELECT (emp_first_name1 || ' ' || emp_middle_name1 || ' ' || emp_last_name1)
"
"                         emp_name,
"
"                         emp_emp_id mfgr_emp_id
"
"                       FROM employees
"
"                      WHERE emp_bu = p_bu
"
"                        AND emp_emp_id IN(SELECT empai_emp_id
"
"                                FROM emp_active_infos
"
"                                   WHERE empai_bu = p_bu
"
"                                  )
"
"                            AND emp_emp_id = r_shift(i).emig_opt1
"
"                          UNION ALL
"
"                         SELECT mfgr_name1 emp_name,
"
"                            mfgr_res_id mfgr_emp_id
"
"                           FROM mfg_resources
"
"                          WHERE mfgr_bu              = p_bu
"
"                            AND mfgr_plnt          = p_plnt
"
"                            AND mfgr_res_type IN ('P')
"
"                            AND mfgr_own_flag = 'R'
"
"                            AND mfgr_res_id  = r_shift(i).emig_opt1)
"
"                      GROUP BY emp_name,
"
"                     mfgr_emp_id     ;
"
"                     END IF;
"
"             EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                RAISE_APPLICATION_ERROR(-20821,'PLN');
"
"             END;
"
"
"
"            BEGIN
"
"
"
"                 IF r_shift(i).emig_opt2 IS NULL THEN
"
"
"
"                             SELECT emp_emp_id
"
"                               INTO v_opr_id2
"
"                               FROM employees
"
"                              WHERE emp_bu = p_bu
"
"                                AND emp_status = 'A'
"
"                                AND ROWNUM = 1
"
"                              ORDER BY  emp_emp_id;
"
"                 ELSE
"
"                     SELECT mfgr_emp_id
"
"                          INTO v_opr_id2
"
"                         FROM (SELECT (emp_first_name1 || ' ' || emp_middle_name1 || ' ' || emp_last_name1)
"
"                              emp_name,
"
"                              emp_emp_id mfgr_emp_id
"
"                            FROM employees
"
"                           WHERE emp_bu = p_bu
"
"                             AND emp_emp_id IN(SELECT empai_emp_id
"
"                                     FROM emp_active_infos
"
"                                        WHERE empai_bu = p_bu
"
"                                       )
"
"                                 AND emp_emp_id = r_shift(i).emig_opt2
"
"                               UNION ALL
"
"                              SELECT mfgr_name1 emp_name,
"
"                                 mfgr_res_id mfgr_emp_id
"
"                                FROM mfg_resources
"
"                               WHERE mfgr_bu              = p_bu
"
"                                 AND mfgr_plnt          = p_plnt
"
"                                 AND mfgr_res_type IN ('P')
"
"                                 AND mfgr_own_flag = 'R'
"
"                                 AND mfgr_res_id  = r_shift(i).emig_opt2)
"
"                           GROUP BY emp_name,
"
"                          mfgr_emp_id     ;
"
"                          END IF;
"
"                  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                     RAISE_APPLICATION_ERROR(-20821,'PLN');
"
"                 END;
"
"
"
"
"
"                /*proc_cre_mr_from_prodn(p_bu,
"
"                                       p_plnt ,
"
"                                       NULL,
"
"                                       NULL,
"
"                                       TRUNC(p_doc_date),
"
"                                       p_user,
"
"                                       var_mr_result
"
"                                       );
"
"
"
"                p_mr_res := p_mr_res ||' '||var_mr_result;*/
"
"
"
"                OPEN c_start;
"
"                FETCH c_start INTO cr_start;
"
"                CLOSE c_start;
"
"
"
"                 v_trans_no := func_find_pfx_nextno(p_bu,
"
"                                         p_doc_date,
"
"                                         func_find_get_mfg_pfx(p_bu,
"
"                                         v_loc_id,
"
"                                         p_plnt,
"
"                                         'PRC'),
"
"                         p_user);
"
"
"
"            v_year := func_find_year(p_bu, p_doc_date);
"
"
"
"             v_period := func_find_period(p_bu, p_doc_date);
"
"
"
"
"
"                OPEN c_bom_conv (cr_check_bom.bomhd_prod_id, cr_check_bom.bomhd_prod_rev,'M',cr_check_bom.bomhd_bom_no);
"
"                FETCH c_bom_conv INTO cr_bom_conv;
"
"
"
"                   IF c_bom_conv%FOUND THEN
"
"                   v_conv_factor := cr_bom_conv.bomhd_conv_factor;
"
"                   ELSE
"
"                   v_conv_factor := 1;
"
"                   END IF;
"
"
"
"                CLOSE c_bom_conv;
"
"
"
"                v_sou_type  := 'P';
"
"                v_sou_id    := func_find_deflt_storeid(p_bu,p_plnt,NULL, cr_check_bom.bomhd_prod_id,cr_check_bom.bomhd_prod_rev,'N');
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||cr_check_bom.bomhd_prod_id||'~'||v_sf_code||'~'||v_tar_sf_code||'~'||v_trans_no);
"
"             INSERT INTO prod_transfer ( pt_bu,
"
"                                        pt_plnt,
"
"                                        pt_trans_no,
"
"                                        pt_doc_no,
"
"                                        pt_prod_ord_no,
"
"                                        pt_date,
"
"                                        pt_year,
"
"                                        pt_period,
"
"                                        pt_status,
"
"                                        pt_prod_id,
"
"                                        pt_prod_rev,
"
"                                        pt_from_bucket,
"
"                                        pt_to_bucket,
"
"                                        pt_trans_qty,
"
"                                        pt_comp_qty,
"
"                                        pt_cre_by,
"
"                                        pt_cre_date,
"
"                                        pt_accept_qty,
"
"                                        pt_acpt_stk_qty,
"
"                                        pt_reject_qty,
"
"                                        pt_scrap_qty,
"
"                                        pt_qc_qty,
"
"                                        pt_dm_cost,
"
"                                        pt_dl_cost,
"
"                                        pt_oh_cost,
"
"                                        pt_unit_cost,
"
"                                        pt_sys_ls_no,
"
"                                        pt_lot_no,
"
"                                        pt_ser_no,
"
"                                        pt_cons_type,
"
"                                        pt_ot_cost,
"
"                                        pt_gen_cons,
"
"                                        pt_conv_factor,
"
"                                        pt_start_date,
"
"                                        pt_end_date,
"
"                                        pt_prodn_hour,
"
"                                        pt_shift_id,
"
"                                        pt_pg_id,
"
"                                        pt_pg_type,
"
"                                        pt_store_id,
"
"                                        pt_sf_code,
"
"                                        pt_comp_sf_code,
"
"                                        pt_source_flag,
"
"                                        pt_entry_type,
"
"                                        pt_from_oprn_id,
"
"                                        pt_to_oprn_id,
"
"                                        pt_qc_req_flag,
"
"                                        pt_ord_so_type,
"
"                                        pt_so_pfx,
"
"                                        pt_so_no,
"
"                                        pt_so_seq_no,
"
"                                        pt_so_sub_seq_no,
"
"                                        pt_so_print_seq_no,
"
"                                        pt_so_schld_desc,
"
"                                        pt_cust_id,
"
"                                        pt_cust_po_no,
"
"                                        pt_cust_po_seq_no,
"
"                                        pt_cust_po_date,
"
"                                        pt_so_desp_date,
"
"                                        pt_rcpt_store_id,
"
"                                        pt_proj_id,
"
"                                        pt_task_id,
"
"                                        pt_potv_seq_no,
"
"                                        pt_temp_sys_ls_no,
"
"                                        pt_temp_lot_no,
"
"                                        pt_temp_ser_no,
"
"                                        pt_casting_flag,
"
"                                        pt_sel_flag,
"
"                                        pt_route_card_no,
"
"                                        pt_source_type,
"
"                                        pt_source_id,
"
"                                        pt_prod_type,
"
"                                        pt_pend_trans_no,
"
"                                        pt_sou_bu,
"
"                                        pt_sou_plnt      ,
"
"                                        pt_sou_ord_pfx   ,
"
"                                        pt_sou_ord_no    ,
"
"                                        pt_sou_seq_no    ,
"
"                                        pt_sou_sub_seq_no,
"
"                                        pt_mach_id,
"
"                                        pt_opt_id,
"
"                                        pt_opt_id2,
"
"                                        pt_child_lot_no,
"
"                                        pt_child_sys_ls_no,
"
"                                        pt_oprn_ln_seq
"
"                                        )
"
"                                        VALUES (p_bu,
"
"                                                p_plnt,
"
"                                                v_trans_no,
"
"                                                p_doc_no,
"
"                                                NULL,
"
"                                                p_doc_date,
"
"                                                v_year,
"
"                                                v_period,
"
"                                                'N',
"
"                                                cr_check_bom.bomhd_prod_id,
"
"                                                cr_check_bom.bomhd_prod_rev,
"
"                                                'R',
"
"                                                'C',
"
"                                                v_qty,--pt_trans_qty
"
"                                                v_qty,--pt_comp_qty,
"
"                                                p_user,
"
"                                                SYSDATE,
"
"                                                v_qty,--pt_accept_qty,
"
"                                                v_qty,--pt_acpt_stk_qty,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                0,
"
"                                                NULL,--pt_sys_ls_no,
"
"                                                NULL,--pt_lot_no,
"
"                                                NULL,--pt_ser_no,
"
"                                                'T',--pt_tranfer_type,
"
"                                                0,
"
"                                                'N',
"
"                                                v_conv_factor,
"
"                                                cr_start.shifthd_start_time,
"
"                                                cr_start.shifthd_end_time,
"
"                                                SUBSTR(func_find_tot_hrs_frm_min((((cr_start.shifthd_end_time - cr_start.shifthd_start_time) * 24) * 60) *60),1,2),
"
"                                                p_shift_id,
"
"                                                cr_oprn.rouln_oprn_id,--pt_pg_id,
"
"                                                'P',--pt_pg_type,
"
"                                                v_store_id,
"
"                                                v_sf_code,
"
"                                                v_tar_sf_code,
"
"                                                'S',
"
"                                                'S',
"
"                                                cr_oprn.rouln_oprn_id,--pt_from_oprn_id,
"
"                                                cr_oprn.rouln_oprn_id,--pt_to_oprn_id,
"
"                                                'N',--pt_qc_req_flag,
"
"                                                'NA',--pt_ord_so_type,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                cr_oprn.rouln_rcp_store,--pt_rcpt_store_id
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL,--pt_potv_seq_no,
"
"                                                NULL,--pt_temp_sys_ls_no,
"
"                                                NULL,--pt_temp_lot_no,
"
"                                                NULL,--pt_temp_ser_no,
"
"                                                'N',
"
"                                                'Y',
"
"                                                v_rc_no,
"
"                                                'P',
"
"                                                v_sou_id,
"
"                                                'SWCL',
"
"                                                NULL,
"
"                                                NULL,
"
"                                                NULL      ,
"
"                                                NULL   ,
"
"                                                NULL    ,
"
"                                                NULL   ,
"
"                                                NULL,
"
"                                                v_mchn_id,
"
"                                                v_opr_id,
"
"                                                v_opr_id2,
"
"                                                NULL,
"
"                                                NULL,
"
"                                                cr_oprn.ROULN_OPRN_SEQ_NO --pt_oprn_ln_seq
"
"                                                );
"
"
"
"        END LOOP r_shift;
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_mig_sw_wo_prod_comp;
"
"
"
"      PROCEDURE proc_mig_fcast_cat_det
"
"      (
"
"      p_bu             VARCHAR2,
"
"      p_plnt           VARCHAR2,
"
"      p_fcast_no       VARCHAR2,
"
"      p_fcast_rev      NUMBER,
"
"      p_file_name      VARCHAR2,
"
"      p_user           VARCHAR2
"
"      )
"
"      IS
"
"
"
"      v_seq_no         NUMBER(5) := 0;
"
"      v_sub_seq_no     NUMBER(5) := 0;
"
"
"
"      v_create_table    VARCHAR2(4000);
"
"
"
"      TYPE r_fcast_cat IS RECORD (em_cat_desc                 VARCHAR2(200),
"
"                                  em_cat_firm_qty            NUMBER(12,3),
"
"                                  em_cat_tent_qty           NUMBER(12,3)
"
"                                  );
"
"
"
"      TYPE r_fcast_ln IS RECORD (em_cat_desc              VARCHAR2(200),
"
"                                 em_prod_id              mfg_sales_forecast_ln.msfln_prod_id%TYPE,
"
"                                 em_prod_rev             mfg_sales_forecast_ln.msfln_prod_rev%TYPE,
"
"                                 em_firm_qty             mfg_sales_forecast_ln.msfln_fcast_qty%TYPE,
"
"                                 em_tent_qty            mfg_sales_forecast_ln.msfln_tent_qty%TYPE,
"
"                                 em_bucket                mfg_sales_forecast_ln.msfln_bucket%TYPE,
"
"                                 em_forecast_grp_desc    VARCHAR2(200),
"
"                                 em_cust_id                VARCHAR2(10)
"
"                                 );
"
"
"
"      TYPE t_fcast_cat IS TABLE OF r_fcast_cat INDEX BY PLS_INTEGER;
"
"      TYPE t_fcast_ln IS TABLE OF r_fcast_ln INDEX BY PLS_INTEGER;
"
"
"
"      tr_fcast_cat        t_fcast_cat;
"
"      tr_fcast_ln        t_fcast_ln;
"
"
"
"      v_cnt            NUMBER;
"
"      v_cat_id        VARCHAR2(10);
"
"      v_fcast_grp    VARCHAR2(10);
"
"
"
"      BEGIN
"
"
"
"      proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"
"
"        DELETE mfg_sales_forecast_ln
"
"         WHERE msfln_bu = p_bu
"
"           AND msfln_plnt = p_plnt
"
"           AND msfln_fcast_no = p_fcast_no
"
"           AND msfln_fcast_rev  = p_fcast_rev;
"
"
"
"        DELETE mfg_sales_forecast_det
"
"         WHERE msfd_bu = p_bu
"
"           AND msfd_plnt = p_plnt
"
"           AND msfd_fcast_no = p_fcast_no
"
"           AND msfd_fcast_rev  = p_fcast_rev;
"
"
"
"        EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION
"
"                                   (
"
"                                    em_cat_desc                       VARCHAR2(50),
"
"                                    em_cat_firm_qty                    NUMBER(12,3),
"
"                                    em_cat_tent_qty                NUMBER(12,3),
"
"                                    em_prod_id                    VARCHAR2(25),
"
"                                    em_prod_rev                 NUMBER(5),
"
"                                    em_firm_qty                 NUMBER(12,3),
"
"                                    em_tent_qty                   NUMBER(12,3),
"
"                                    em_bucket                      VARCHAR2(1),
"
"                                    em_forecast_grp_desc        VARCHAR2(150),
"
"                                    em_cust_id                    VARCHAR2(10)
"
"                                   )
"
"                      ORGANIZATION EXTERNAL(
"
"                        TYPE ORACLE_LOADER
"
"                            DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                            ACCESS PARAMETERS(
"
"                                  RECORDS DELIMITED BY NEWLINE
"
"                                  SKIP 1
"
"                                  FIELDS TERMINATED BY ''|''
"
"                                  MISSING FIELD VALUES ARE NULL
"
"                                  REJECT ROWS WITH ALL NULL FIELDS
"
"                                  (
"
"                                   em_cat_desc                  CHAR(255),
"
"                                   em_cat_firm_qty               CHAR(255),
"
"                                   em_cat_tent_qty             CHAR(255),
"
"                                   em_prod_id                  CHAR(255),
"
"                                   em_prod_rev                  CHAR(255),
"
"                                   em_firm_qty                CHAR(255),
"
"                                   em_tent_qty                     CHAR(255),
"
"                                   em_bucket                     CHAR(255),
"
"                                   em_forecast_grp_desc        CHAR(255),
"
"                                   em_cust_id                     CHAR(255)
"
"                                   )
"
"                                               )
"
"                                LOCATION ('''||p_file_name||''')
"
"                                ) REJECT LIMIT UNLIMITED';
"
"
"
"
"
"        /*FORECAST CATEGORY MIGRATION*/
"
"
"
"        EXECUTE IMMEDIATE 'SELECT em_cat_desc ,
"
"                                  em_cat_firm_qty ,
"
"                                  em_cat_tent_qty
"
"                             FROM EXCEL_MIGRATION
"
"                            GROUP BY em_cat_desc      ,
"
"                                     em_cat_firm_qty ,
"
"                                     em_cat_tent_qty
"
"                            ORDER BY 1' BULK COLLECT INTO tr_fcast_cat;
"
"
"
"
"
"        EXECUTE IMMEDIATE 'SELECT em_cat_desc,
"
"                                  em_prod_id  ,
"
"                                  em_prod_rev ,
"
"                                  em_firm_qty ,
"
"                                  em_tent_qty,
"
"                                  em_bucket,
"
"                                  em_forecast_grp_desc,
"
"                                  em_cust_id
"
"                             FROM EXCEL_MIGRATION
"
"                             GROUP BY em_cat_desc,
"
"                                      em_prod_id  ,
"
"                                      em_prod_rev ,
"
"                                      em_firm_qty ,
"
"                                      em_tent_qty,
"
"                                      em_bucket,
"
"                                      em_forecast_grp_desc,
"
"                                      em_cust_id
"
"                             ORDER BY 1' BULK COLLECT INTO tr_fcast_ln;
"
"
"
"
"
"
"
"            /*FORECAST CATEGORY MIGRATION END*/
"
"
"
"            /*FORECAST LINE DETAILS MIGRATION*/
"
"
"
"            FOR j IN 1..tr_fcast_ln.COUNT
"
"            LOOP
"
"
"
"                    SELECT COUNT(prod_id)
"
"                      INTO v_cnt
"
"                      FROM products
"
"                     WHERE prod_bu = p_bu
"
"                       AND prod_id = tr_fcast_ln(j).em_prod_id
"
"                       AND prod_rev = tr_fcast_ln(j).em_prod_rev;
"
"
"
"                    IF  v_cnt = 0 THEN
"
"                        RAISE_APPLICATION_ERROR(-20260,'ICM'||'  '||tr_fcast_ln(j).em_prod_id);
"
"                    END IF;
"
"
"
"
"
"
"
"                    IF tr_fcast_ln(j).em_forecast_grp_desc IS NOT NULL THEN
"
"
"
"
"
"
"
"                    IF v_cnt = 0 THEN
"
"                       RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||tr_fcast_ln(j).em_forecast_grp_desc);
"
"                    END IF;
"
"
"
"
"
"                    END IF;
"
"
"
"                    IF tr_fcast_ln(j).em_cust_id IS NOT NULL THEN
"
"
"
"                      SELECT COUNT(suplr_suplr_id)
"
"                        INTO v_cnt
"
"                        FROM suppliers
"
"                       WHERE suplr_bu = p_bu
"
"                         AND suplr_suplr_id = tr_fcast_ln(j).em_cust_id
"
"                         AND suplr_status = 'A';
"
"
"
"                    IF v_cnt = 0 THEN
"
"                       RAISE_APPLICATION_ERROR(-20152,'ARM'||'~'||tr_fcast_ln(j).em_cust_id);
"
"                    END IF;
"
"
"
"                    END IF;
"
"
"
"                        SELECT COUNT(prod_gar_category)
"
"                          INTO v_cnt
"
"                          FROM products,
"
"                               prod_plants
"
"                         WHERE prod_bu = prodplnt_bu
"
"                           AND prod_id = prodplnt_prod_id
"
"                           AND prod_rev = prodplnt_prod_rev
"
"                           AND prod_status = 'A'
"
"                           AND prodplnt_status = 'A'
"
"                           AND prod_bu = p_bu
"
"                           AND prodplnt_plnt = p_plnt
"
"                           AND prod_id = tr_fcast_ln(j).em_prod_id
"
"                           AND prod_rev = tr_fcast_ln(j).em_prod_rev
"
"                           AND prod_gar_category = v_cat_id;
"
"
"
"                        IF  v_cnt = 0 THEN
"
"                            RAISE_APPLICATION_ERROR(-20260,'ICM'||'~'||'ITEM NOT DEFINED FOR THIS CATEGORY : '||tr_fcast_ln(j).em_cat_desc);
"
"                        END IF;
"
"
"
"
"
"
"
"            END LOOP; --j Loop
"
"
"
"            /*FORECAST LINE DETAILS MIGRATION END*/
"
"
"
"              proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    END proc_mig_fcast_cat_det;
"
"
"
"    PROCEDURE proc_ins_furnance_spec (p_bu        VARCHAR2,
"
"                      p_plnt     VARCHAR2,
"
"                      p_doc_no    VARCHAR2,
"
"                      p_file_name    VARCHAR2,
"
"                      p_user    VARCHAR2
"
"                      )
"
"    IS
"
"
"
"    TYPE pour_param_dtls IS RECORD(em_char_desc     VARCHAR2(100),
"
"                       em_spec_value     NUMBER(12,3));
"
"
"
"    TYPE c_pour_param_dtls  IS TABLE OF pour_param_dtls INDEX BY PLS_INTEGER;
"
"
"
"    cr_pour_param_dtls    c_pour_param_dtls;
"
"
"
"    TYPE t_pour IS REF CURSOR;
"
"
"
"    ct_pour    t_pour;
"
"    i        NUMBER := 1;
"
"    v_seq_no    NUMBER(5);
"
"    v_param_id    VARCHAR2(10);
"
"    v_create_table    VARCHAR2(4000);
"
"    BEGIN
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"	DELETE shell_cast_pour_param_dtls
"
"	  WHERE scppd_bu   = p_bu
"
"		AND scppd_plnt = p_plnt
"
"		AND scppd_doc_no = p_doc_no;
"
"
"
"            v_create_table := 'CREATE TABLE EXCEL_MIGRATION (
"
"                                em_char_desc               VARCHAR2(100),
"
"                                em_spec_value            NUMBER(12,3)
"
"                                )
"
"                                ORGANIZATION EXTERNAL(
"
"                                    TYPE ORACLE_LOADER
"
"                                        DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                        ACCESS PARAMETERS(
"
"                                                  RECORDS DELIMITED BY NEWLINE
"
"                                                  SKIP 1
"
"                                                  FIELDS TERMINATED BY '',''
"
"                                                  MISSING FIELD VALUES ARE NULL
"
"                                                  REJECT ROWS WITH ALL NULL FIELDS
"
"                                                  (
"
"                                                   em_char_desc          CHAR(255),
"
"                                                   em_spec_value      CHAR(255)
"
"                                            )
"
"                                    )
"
"                                LOCATION ('''||p_file_name||''')
"
"                                ) REJECT LIMIT UNLIMITED';
"
"
"
"                EXECUTE IMMEDIATE v_create_table;
"
"
"
"
"
"            OPEN ct_pour FOR 'SELECT * FROM EXCEL_MIGRATION';
"
"            LOOP
"
"            FETCH ct_pour INTO cr_pour_param_dtls(i);
"
"            i := i + 1;
"
"            EXIT WHEN ct_pour%NOTFOUND;
"
"            END LOOP;
"
"            CLOSE ct_pour;
"
"
"
"                FOR i in 1..cr_pour_param_dtls.COUNT
"
"                LOOP
"
"
"
"                    BEGIN
"
"                    SELECT tqmp_param_id
"
"                      INTO v_param_id
"
"                    FROM tqm_param_group, tqm_param
"
"                   WHERE tpg_bu = tqmp_bu
"
"                     AND tpg_group_id = tqmp_group_id
"
"                     AND tqmp_bu = p_bu
"
"                     AND tpg_grp_type = 'C'
"
"                     AND tqmp_desc1 = cr_pour_param_dtls(i).em_char_desc ;
"
"
"
"                     EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                      RAISE_APPLICATION_ERROR(-20271,'PLN'|| ' ' ||cr_pour_param_dtls(i).em_char_desc);
"
"                    END;
"
"
"
"                   SELECT NVL(MAX(scppd_seq_no),0)+1
"
"					  INTO v_seq_no
"
"					  FROM shell_cast_pour_param_dtls
"
"					 WHERE scppd_bu = p_bu
"
"					   AND scppd_plnt  = p_plnt
"
"					   AND scppd_doc_no = p_doc_no;
"
"
"
"					INSERT INTO shell_cast_pour_param_dtls (scppd_bu   ,
"
"									scppd_plnt   ,
"
"									scppd_doc_no  ,
"
"									scppd_seq_no  ,
"
"									scppd_param_id ,
"
"									scppd_param_val,
"
"									scppd_cre_by ,
"
"									scppd_cre_date
"
"									)
"
"										VALUES
"
"									(p_bu,
"
"									 p_plnt,
"
"									 p_doc_no,
"
"									 v_seq_no,
"
"									 v_param_id,
"
"									 NVL(cr_pour_param_dtls(i).em_spec_value,0),
"
"									 p_user,
"
"									 sysdate
"
"									 );
"
"
"
"
"
"                END LOOP;
"
"
"
"    END proc_ins_furnance_spec;
"
"
"
"    PROCEDURE proc_mig_bom_det(
"
"                               p_bu           VARCHAR2,
"
"                               p_plnt         VARCHAR2,
"
"                               p_doc_no       VARCHAR2,
"
"                               p_file_name    VARCHAR2,
"
"                               p_user         VARCHAR2,
"
"                               p_res     OUT   VARCHAR2
"
"                               )
"
"    IS
"
"
"
"    TYPE r_bom_det IS RECORD(
"
"                             rbd_par_prod_id              VARCHAR2(25),
"
"                             rbd_par_prod_rev             NUMBER(5),
"
"                             rbd_oprn_desc                VARCHAR2(30),
"
"                             rbd_item_seq_no              NUMBER(5),
"
"                             rbd_prod_id                  VARCHAR2(25),
"
"                             rbd_prod_rev                 NUMBER(5),
"
"                             rbd_drwg_no                  VARCHAR2(50),
"
"                             rbd_drwg_rev                  VARCHAR2(5),
"
"                             rbd_pm_type                  VARCHAR2(1),
"
"                             rbd_req_uom                  VARCHAR2(5),
"
"                             rbd_rqrd_qty                 NUMBER(15,8),
"
"                             rbd_thickness                  NUMBER(10,3),
"
"                             rbd_width                      NUMBER(10,3),
"
"                             rbd_length                      NUMBER(10,3),
"
"                             rbd_comp_qty                  NUMBER(12,3),
"
"                             rbd_bal_qty                   NUMBER(12,3),
"
"                             rbd_qc_sign                   VARCHAR2(10),
"
"                             rbd_wgt_set                   NUMBER(10,3),
"
"                             rbd_sqft_set                   NUMBER(10,3),
"
"                             rbd_shearing                   VARCHAR2(1),
"
"                             rbd_laser_cutting          VARCHAR2(1),
"
"                             rbd_oxy_cutting            VARCHAR2(1),
"
"                             rbd_punching               VARCHAR2(1),
"
"                             rbd_bending                VARCHAR2(1),
"
"                             rbd_rolling                VARCHAR2(1),
"
"                             rbd_blanking               VARCHAR2(1),
"
"                             rbd_piearcing              VARCHAR2(1),
"
"                             rbd_froming_or_embosing    VARCHAR2(1),
"
"                             rbd_notching               VARCHAR2(1),
"
"                             rbd_band_shaw_cutting      VARCHAR2(1),
"
"                             rbd_deburring              VARCHAR2(1),
"
"                             rbd_straighting            VARCHAR2(1),
"
"                             rbd_chamfering             VARCHAR2(1),
"
"                             rbd_drilling               VARCHAR2(1),
"
"                             rbd_tapping                VARCHAR2(1),
"
"                             rbd_csk                    VARCHAR2(1),
"
"                             rbd_riviting               VARCHAR2(1),
"
"                             rbd_machining              VARCHAR2(1),
"
"                             rbd_fabrication            VARCHAR2(1),
"
"                             rbd_primer                 VARCHAR2(1),
"
"                             rbd_painting               VARCHAR2(1),
"
"                             rbd_powder_coating         VARCHAR2(1),
"
"                             rbd_plating                VARCHAR2(1),
"
"                             rbd_galvanizing             VARCHAR2(1)
"
"                             );
"
"
"
"    TYPE t_bom_det IS TABLE OF r_bom_det INDEX BY PLS_INTEGER;
"
"    v_bom_det t_bom_det;
"
"
"
"    v_seq_no        NUMBER(5);
"
"    v_oprn_id        VARCHAR2(10);
"
"    v_res              VARCHAR2(1);
"
"    v_item_seq_no    NUMBER;
"
"
"
"    BEGIN
"
"
"
"        DELETE migr_bom_ln
"
"         WHERE mbl_bu         = p_bu
"
"           AND mbl_plnt     = p_plnt
"
"           AND mbl_doc_no     = p_doc_no;
"
"
"
"        DELETE migr_routing_line
"
"         WHERE mrl_bu = p_bu
"
"           AND mrl_plnt = p_plnt
"
"           AND mrl_doc_no = p_doc_no;
"
"
"
"        DELETE migr_proc_grp_detail
"
"         WHERE mpgd_bu         = p_bu
"
"           AND mpgd_plnt    = p_plnt
"
"           AND mpgd_doc_no  = p_doc_no;
"
"
"
"        DELETE migr_rm_detail
"
"         WHERE mrd_bu         = p_bu
"
"           AND mrd_plnt    = p_plnt
"
"           AND mrd_doc_no  = p_doc_no;
"
"
"
"        v_res := 'N';
"
"
"
"            proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"            EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION (
"
"                                                           em_par_prod_id              VARCHAR2(25),
"
"                                                           em_par_prod_rev             NUMBER(5),
"
"                                                           em_oprn_desc                VARCHAR2(30),
"
"                                                           em_item_seq_no              NUMBER(5),
"
"                                                           em_prod_id                  VARCHAR2(25),
"
"                                                           em_prod_rev                 NUMBER(5),
"
"                                                           em_drwg_no                   VARCHAR2(50),
"
"                                                           em_drwg_rev                   VARCHAR2(5),
"
"                                                           em_pm_type                  VARCHAR2(1),
"
"                                                           em_req_uom                  VARCHAR2(5),
"
"                                                           em_rqrd_qty                 NUMBER(15,8),
"
"                                                           em_thickness                   NUMBER(10,3),
"
"                                                           em_width                       NUMBER(10,3),
"
"                                                           em_length                   NUMBER(10,3),
"
"                                                           em_comp_qty                   NUMBER(12,3),
"
"                                                           em_bal_qty                   NUMBER(12,3),
"
"                                                           em_qc_sign                   VARCHAR2(10),
"
"                                                           em_wgt_set                   NUMBER(10,3),
"
"                                                           em_sqft_set                   NUMBER(10,3),
"
"                                                           em_shearing                   VARCHAR2(1),
"
"                                                           em_laser_cutting            VARCHAR2(1),
"
"                                                           em_oxy_cutting              VARCHAR2(1),
"
"                                                           em_punching                 VARCHAR2(1),
"
"                                                           em_bending                  VARCHAR2(1),
"
"                                                           em_rolling                  VARCHAR2(1),
"
"                                                           em_blanking                 VARCHAR2(1),
"
"                                                           em_piearcing                VARCHAR2(1),
"
"                                                           em_froming_or_embosing      VARCHAR2(1),
"
"                                                           em_notching                 VARCHAR2(1),
"
"                                                           em_band_shaw_cutting        VARCHAR2(1),
"
"                                                           em_deburring                VARCHAR2(1),
"
"                                                           em_straighting              VARCHAR2(1),
"
"                                                           em_chamfering               VARCHAR2(1),
"
"                                                           em_drilling                 VARCHAR2(1),
"
"                                                           em_tapping                  VARCHAR2(1),
"
"                                                           em_csk                      VARCHAR2(1),
"
"                                                           em_riviting                 VARCHAR2(1),
"
"                                                           em_machining                VARCHAR2(1),
"
"                                                           em_fabrication              VARCHAR2(1),
"
"                                                           em_primer                   VARCHAR2(1),
"
"                                                           em_painting                 VARCHAR2(1),
"
"                                                           em_powder_coating           VARCHAR2(1),
"
"                                                           em_plating                  VARCHAR2(1),
"
"                                                           em_galvanizing              VARCHAR2(1)
"
"                                                           )
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
"                                                          FIELDS TERMINATED BY ''|''
"
"                                                          MISSING FIELD VALUES ARE NULL
"
"                                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                                          (
"
"                                                          em_par_prod_id            CHAR(255),
"
"                                                          em_par_prod_rev           CHAR(255),
"
"                                                          em_oprn_desc              CHAR(255),
"
"                                                          em_item_seq_no            CHAR(255),
"
"                                                          em_prod_id                CHAR(255),
"
"                                                          em_prod_rev               CHAR(255),
"
"                                                          em_drwg_no                CHAR(255),
"
"                                                          em_drwg_rev                CHAR(255),
"
"                                                          em_pm_type                CHAR(255),
"
"                                                          em_req_uom                CHAR(255),
"
"                                                          em_rqrd_qty               CHAR(255),
"
"                                                          em_thickness                CHAR(255),
"
"                                                          em_width                    CHAR(255),
"
"                                                          em_length                       CHAR(255),
"
"                                                          em_comp_qty                CHAR(255),
"
"                                                          em_bal_qty                   CHAR(255),
"
"                                                          em_qc_sign                   CHAR(255),
"
"                                                          em_wgt_set                   CHAR(255),
"
"                                                          em_sqft_set                   CHAR(255),
"
"                                                          em_shearing                   CHAR(255),
"
"                                                          em_laser_cutting          CHAR(255),
"
"                                                          em_oxy_cutting            CHAR(255),
"
"                                                          em_punching               CHAR(255),
"
"                                                          em_bending                CHAR(255),
"
"                                                          em_rolling                CHAR(255),
"
"                                                          em_blanking               CHAR(255),
"
"                                                          em_piearcing              CHAR(255),
"
"                                                          em_froming_or_embosing    CHAR(255),
"
"                                                          em_notching               CHAR(255),
"
"                                                          em_band_shaw_cutting      CHAR(255),
"
"                                                          em_deburring              CHAR(255),
"
"                                                          em_straighting            CHAR(255),
"
"                                                          em_chamfering             CHAR(255),
"
"                                                          em_drilling               CHAR(255),
"
"                                                          em_tapping                CHAR(255),
"
"                                                          em_csk                    CHAR(255),
"
"                                                          em_riviting               CHAR(255),
"
"                                                          em_machining              CHAR(255),
"
"                                                          em_fabrication            CHAR(255),
"
"                                                          em_primer                 CHAR(255),
"
"                                                          em_painting               CHAR(255),
"
"                                                          em_powder_coating         CHAR(255),
"
"                                                          em_plating                CHAR(255),
"
"                                                          em_galvanizing            CHAR(255)
"
"                                                          )
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
"            EXECUTE IMMEDIATE 'SELECT em_par_prod_id               ,
"
"                                      em_par_prod_rev              ,
"
"                                      em_oprn_desc                 ,
"
"                                      em_item_seq_no               ,
"
"                                      em_prod_id                   ,
"
"                                      em_prod_rev                  ,
"
"                                      em_drwg_no                   ,
"
"                                      em_drwg_rev                  ,
"
"                                      em_pm_type                   ,
"
"                                      em_req_uom                   ,
"
"                                      em_rqrd_qty                  ,
"
"                                      em_thickness                   ,
"
"                                      em_width                       ,
"
"                                      em_length                       ,
"
"                                      em_comp_qty                ,
"
"                                      em_bal_qty                   ,
"
"                                      em_qc_sign                   ,
"
"                                      em_wgt_set                   ,
"
"                                      em_sqft_set                   ,
"
"                                      em_shearing                   ,
"
"                                      em_laser_cutting          ,
"
"                                      em_oxy_cutting            ,
"
"                                      em_punching               ,
"
"                                      em_bending                ,
"
"                                      em_rolling                ,
"
"                                      em_blanking               ,
"
"                                      em_piearcing              ,
"
"                                      em_froming_or_embosing    ,
"
"                                      em_notching               ,
"
"                                      em_band_shaw_cutting      ,
"
"                                      em_deburring              ,
"
"                                      em_straighting            ,
"
"                                      em_chamfering             ,
"
"                                      em_drilling               ,
"
"                                      em_tapping                ,
"
"                                      em_csk                    ,
"
"                                      em_riviting               ,
"
"                                      em_machining              ,
"
"                                      em_fabrication            ,
"
"                                      em_primer                 ,
"
"                                      em_painting               ,
"
"                                      em_powder_coating         ,
"
"                                      em_plating                ,
"
"                                      em_galvanizing
"
"                                 FROM excel_migration' BULK COLLECT INTO v_bom_det;
"
"
"
"            FOR i IN 1..v_bom_det.COUNT
"
"            LOOP
"
"
"
"                IF v_bom_det(i).rbd_shearing = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'SHEARING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Shearing Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_laser_cutting = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND (mfgo_desc1 LIKE 'LASER%' OR mfgo_desc1 LIKE 'LAZER%');
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Laser Cutting Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                /*IF v_bom_det(i).rbd_prod_id = 'RM149' THEN
"
"                RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_oprn_id);
"
"                END IF;*/
"
"
"
"                IF v_bom_det(i).rbd_oxy_cutting = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'OXY%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'OXY Cutting Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_punching = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'PUNCHING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Punching Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_bending = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'BENDING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Bending Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_rolling = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'ROLLING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Rolling Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_blanking = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'BLANKING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Blanking Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_piearcing = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'PIEARCING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Piearcing Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_froming_or_embosing = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'FROMING OR EMBOSING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Froming or Embosing Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_notching = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'NOTCHING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Notching Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_band_shaw_cutting = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'BAND SHAW CUTTING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Band Shaw Cutting Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_deburring = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'DEBURRING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Deburring Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_straighting = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'STRAIGHTING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Straighting Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_chamfering = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'CHAMFERING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Chamfering Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_drilling = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'DRILLING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Drilling Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_tapping = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'TAPPING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Tapping Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_csk = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'CSK%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'CSK Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_riviting = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'RIVITING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Riviting Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_machining = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'MACHINING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Machining Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_fabrication = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'FABRICATION%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Fabrication Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_primer = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'PRIMER%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Primer Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_painting = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'PAINTING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Painting Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_powder_coating = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'POWDER COATING%'
"
"                       AND ROWNUM = 1;
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Powder Coating Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_plating = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'PLATING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Plating Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type             ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness           ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"
"
"                END IF;
"
"
"
"                IF v_bom_det(i).rbd_galvanizing = 'Y' THEN
"
"                BEGIN
"
"                    SELECT mfgo_oprn_id
"
"                      INTO v_oprn_id
"
"                      FROM mfg_oprns
"
"                     WHERE mfgo_bu = p_bu
"
"                       AND mfgo_desc1 LIKE 'GALVANIZING%';
"
"                EXCEPTION WHEN NO_DATA_FOUND THEN
"
"                    RAISE_APPLICATION_ERROR(-20474,'SFM'||'~'||'Galvanizing Process not found.');
"
"                END;
"
"
"
"                    SELECT NVL(MAX(mbl_seq_no),0) + 1
"
"                      INTO v_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    SELECT NVL(MAX(mbl_item_seq_no),0) + 1
"
"                      INTO v_item_seq_no
"
"                      FROM migr_bom_ln
"
"                     WHERE mbl_bu         = p_bu
"
"                       AND mbl_plnt     = p_plnt
"
"                       AND mbl_doc_no     = p_doc_no;
"
"
"
"                    INSERT INTO migr_bom_ln(
"
"                                            mbl_bu              ,
"
"                                            mbl_plnt            ,
"
"                                            mbl_doc_no          ,
"
"                                            mbl_seq_no          ,
"
"                                            mbl_par_prod_id     ,
"
"                                            mbl_par_prod_rev    ,
"
"                                            mbl_oprn_id         ,
"
"                                            mbl_item_seq_no     ,
"
"                                            mbl_prod_id         ,
"
"                                            mbl_prod_rev        ,
"
"                                            mbl_req_uom         ,
"
"                                            mbl_rqrd_qty        ,
"
"                                            mbl_bom_no          ,
"
"                                            mbl_cre_by          ,
"
"                                            mbl_cre_date        ,
"
"                                            mbl_pm_type         ,
"
"                                            mbl_exception2      ,
"
"                                            mbl_cnr_flag        ,
"
"                                            mbl_prod_sgrp_id    ,
"
"                                            mbl_prod_grp_id     ,
"
"                                            mbl_prod_scls_id    ,
"
"                                            mbl_prod_cls_id     ,
"
"                                            mbl_primary_part    ,
"
"                                            mbl_make_suplr      ,
"
"                                            mbl_req_size        ,
"
"                                            mbl_loc             ,
"
"                                            mbl_rev_no          ,
"
"                                            mbl_add_type        ,
"
"                                            mbl_mftr_part_no    ,
"
"                                            mbl_ecn_ref         ,
"
"                                            mbl_item_remarks    ,
"
"                                            mbl_thickness       ,
"
"                                            mbl_width           ,
"
"                                            mbl_length
"
"                                            )
"
"                                            VALUES(
"
"                                                   p_bu                              ,
"
"                                                   p_plnt                            ,
"
"                                                   p_doc_no                          ,
"
"                                                   v_seq_no                          ,
"
"                                                   v_bom_det(i).rbd_par_prod_id         ,
"
"                                                   v_bom_det(i).rbd_par_prod_rev        ,
"
"                                                   v_oprn_id                         ,
"
"                                                   v_item_seq_no,--v_bom_det(i).rbd_item_seq_no         ,
"
"                                                   v_bom_det(i).rbd_prod_id             ,
"
"                                                   v_bom_det(i).rbd_prod_rev            ,
"
"                                                   v_bom_det(i).rbd_req_uom             ,
"
"                                                   v_bom_det(i).rbd_rqrd_qty            ,
"
"                                                   NULL                                ,
"
"                                                   p_user                              ,
"
"                                                   SYSDATE                            ,
"
"                                                   v_bom_det(i).rbd_pm_type         ,
"
"                                                   NULL                              ,
"
"                                                   'N'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   NULL                              ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                              ,
"
"                                                   'A'                                ,
"
"                                                   NULL                                ,
"
"                                                   NULL                             ,
"
"                                                   NULL                                ,
"
"                                                   v_bom_det(i).rbd_thickness       ,
"
"                                                   v_bom_det(i).rbd_width            ,
"
"                                                   v_bom_det(i).rbd_length
"
"                                                   );
"
"
"
"                END IF;
"
"
"
"                v_res := 'Y';
"
"
"
"            END LOOP i;
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
"    END proc_mig_bom_det;
"
"
"
"    PROCEDURE proc_ins_cost_est_prod_mig(
"
"                         p_bu           VARCHAR2,
"
"                         p_plnt         VARCHAR2,
"
"                         p_doc_no       VARCHAR2,
"
"                         p_file_name    VARCHAR2,
"
"                         p_user         VARCHAR2,
"
"                         p_res     OUT   VARCHAR2
"
"                         )
"
"    IS
"
"
"
"    TYPE r_ins_prod IS RECORD(
"
"                  rip_prod_id     VARCHAR2(25),
"
"                  rip_prod_rev    NUMBER(5),
"
"                  rip_prod_desc    VARCHAR2(150),
"
"                  rip_cost_qty    NUMBER(12,3),
"
"                  rip_cost_type VARCHAR2(1),
"
"                  rip_unit_cost    NUMBER(17,5),
"
"                  rip_mrgn_pct    NUMBER(5,2)
"
"                  );
"
"
"
"    TYPE t_ins_prod IS TABLE OF r_ins_prod INDEX BY PLS_INTEGER;
"
"    v_ins_prod t_ins_prod;
"
"
"
"        v_res              VARCHAR2(1);
"
"    v_seq_no        NUMBER := 1;
"
"    v_aftr_unit_cost    NUMBER(17,5) := 0;
"
"
"
"    BEGIN
"
"
"
"    DELETE opport_mat_cost_est
"
"     WHERE omce_bu         = p_bu
"
"       AND omce_plnt     = p_plnt
"
"       AND omce_doc_no     = p_doc_no;
"
"
"
"    v_res := 'N';
"
"
"
"    proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"    EXECUTE IMMEDIATE 'CREATE TABLE excel_migration (em_prod_id          VARCHAR2(25),
"
"                             em_prod_rev         NUMBER(5),
"
"                             em_prod_desc         VARCHAR2(150),
"
"                             em_cost_qty         NUMBER(12,3),
"
"                             em_cost_type        VARCHAR2(1),
"
"                             em_unit_cost        NUMBER(17,5),
"
"                             em_mrgn_pct         NUMBER(5,3)
"
"                             )
"
"                  ORGANIZATION EXTERNAL(
"
"                            TYPE ORACLE_LOADER
"
"                                DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                ACCESS PARAMETERS(
"
"                                          RECORDS DELIMITED BY NEWLINE
"
"                                          SKIP 1
"
"                                          FIELDS TERMINATED BY ''|''
"
"                                          MISSING FIELD VALUES ARE NULL
"
"                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                          (em_prod_id               CHAR(255),
"
"                                           em_prod_rev              CHAR(255),
"
"                                           em_prod_desc             CHAR(255),
"
"                                           em_cost_qty              CHAR(255),
"
"                                           em_cost_type             CHAR(255),
"
"                                           em_unit_cost             CHAR(255),
"
"                                           em_mrgn_pct              CHAR(255)
"
"                                           )
"
"                                  )
"
"                  LOCATION ('''||p_file_name||''')
"
"                  ) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE 'SELECT em_prod_id,
"
"                      em_prod_rev,
"
"                      em_prod_desc,
"
"                      em_cost_qty,
"
"                      em_cost_type,
"
"                      em_unit_cost,
"
"                      em_mrgn_pct
"
"                             FROM excel_migration' BULK COLLECT INTO v_ins_prod;
"
"
"
"        FOR i IN 1..v_ins_prod.COUNT
"
"        LOOP
"
"
"
"            IF v_ins_prod(i).rip_cost_qty IS NULL OR v_ins_prod(i).rip_cost_qty = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20045,'ICM'||'/'||v_ins_prod(i).rip_prod_id||'/'||v_ins_prod(i).rip_prod_rev);
"
"            END IF;
"
"
"
"            IF v_ins_prod(i).rip_prod_id IS NULL AND v_ins_prod(i).rip_prod_desc IS NULL THEN
"
"                RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||'ITEM CODE OR DESCRIPTION MUST BE ENTER.');
"
"            END IF;
"
"
"
"            IF v_ins_prod(i).rip_unit_cost IS NULL OR v_ins_prod(i).rip_unit_cost = 0 THEN
"
"                RAISE_APPLICATION_ERROR(-20005,'ICM'||'/'||v_ins_prod(i).rip_prod_id||'/'||v_ins_prod(i).rip_prod_rev);
"
"            END IF;
"
"
"
"            IF v_ins_prod(i).rip_cost_type NOT IN ('L','C','S') THEN
"
"                RAISE_APPLICATION_ERROR(-20712,'ICM'||'/'||v_ins_prod(i).rip_prod_id||'/'||v_ins_prod(i).rip_prod_rev);
"
"            END IF;
"
"
"
"            IF v_ins_prod(i).rip_mrgn_pct IS NULL THEN
"
"                RAISE_APPLICATION_ERROR(-20999,'HRM'||'/'||'MARGIN % SHOULD NOT BE NULL'||'/'||v_ins_prod(i).rip_prod_id||'/'||v_ins_prod(i).rip_prod_rev);
"
"            END IF;
"
"
"
"            IF v_ins_prod(i).rip_mrgn_pct > 0 THEN
"
"                v_aftr_unit_cost := ((v_ins_prod(i).rip_unit_cost * v_ins_prod(i).rip_mrgn_pct) / 100) + v_ins_prod(i).rip_unit_cost;
"
"            ELSE
"
"                v_aftr_unit_cost := v_ins_prod(i).rip_unit_cost;
"
"            END IF;
"
"
"
"            INSERT INTO opport_mat_cost_est(omce_bu                ,
"
"                            omce_plnt              ,
"
"                            omce_doc_no            ,
"
"                            omce_seq_no            ,
"
"                            omce_prod_id           ,
"
"                            omce_prod_rev          ,
"
"                            omce_prod_desc1           ,
"
"                            omce_req_qty           ,
"
"                            omce_unit_cost         ,
"
"                            omce_margin_amt        ,
"
"                            omce_margin_flag       ,
"
"                            omce_suplr_id          ,
"
"                            omce_type              ,
"
"                            omce_last_pur_price    ,
"
"                            omce_mvg_avg_cost      ,
"
"                            omce_margin_pct        ,
"
"                            omce_aftr_unit_cost    ,
"
"                            omce_unit_cost_type    ,
"
"                            omce_len1              ,
"
"                            omce_dia1              ,
"
"                            omce_len2              ,
"
"                            omce_dia2              ,
"
"                            omce_fun               ,
"
"                            omce_cre_by            ,
"
"                            omce_cre_emp_id        ,
"
"                            omce_cre_ip_addr       ,
"
"                            omce_cre_os_user       ,
"
"                            omce_cre_date
"
"                            )
"
"                            VALUES(
"
"                                p_bu,--omce_bu                ,
"
"                                p_plnt,--ce_plnt              ,
"
"                                p_doc_no,--omce_doc_no            ,
"
"                                v_seq_no,--omce_seq_no            ,
"
"                                v_ins_prod(i).rip_prod_id,--omce_prod_id           ,
"
"                                v_ins_prod(i).rip_prod_rev,--omce_prod_rev          ,
"
"                                v_ins_prod(i).rip_prod_desc,--omce_prod_desc1          ,
"
"                                v_ins_prod(i).rip_cost_qty,--omce_req_qty           ,
"
"                                v_ins_prod(i).rip_unit_cost,--omce_unit_cost         ,
"
"                                0,--omce_margin_amt        ,
"
"                                NULL,--omce_margin_flag       ,
"
"                                NULL,--omce_suplr_id          ,
"
"                                NULL,--omce_type              ,
"
"                                0,--omce_last_pur_price    ,
"
"                                0,--omce_mvg_avg_cost      ,
"
"                                v_ins_prod(i).rip_mrgn_pct,--omce_margin_pct        ,
"
"                                v_aftr_unit_cost,--omce_aftr_unit_cost    ,
"
"                                v_ins_prod(i).rip_cost_type,--omce_unit_cost_type    ,
"
"                                0,--omce_len1              ,
"
"                                0,--omce_dia1              ,
"
"                                0,--omce_len2              ,
"
"                                0,--omce_dia2              ,
"
"                                '-',--omce_fun               ,
"
"                                p_user,--omce_cre_by            ,
"
"                                func_find_emp_id(p_bu,p_user),--omce_cre_emp_id        ,
"
"                                audit_info.get_ip_address,--omce_cre_ip_addr       ,
"
"                                audit_info.get_os_user,--omce_cre_os_user       ,
"
"                                SYSDATE--omce_cre_date
"
"                                );
"
"
"
"            v_seq_no := v_seq_no + 1;
"
"
"
"        END LOOP i;
"
"
"
"        v_res := 'Y';
"
"
"
"        proc_drop_exist_table('EXCEL_MIGRATION');
"
"
"
"        p_res := v_res;
"
"
"
"    END proc_ins_cost_est_prod_mig;
"
"
"
"END pkg_migration_planning;"
/
