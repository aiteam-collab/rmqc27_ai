CREATE OR REPLACE
"PACKAGE BODY pkg_config_migration
"
"IS
"
"PROCEDURE proc_drop_exist_table(p_table_name VARCHAR2)
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
"    PROCEDURE proc_ins_upl_cls_rej_reasons
"
"    (
"
"    p_bu      VARCHAR2,
"
"    p_user     VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu         = p_bu
"
"       AND mppe_doc_type   = 'R'
"
"       AND mppe_status     = 'N'
"
"       AND mppe_sel_user   = p_user;
"
"
"
"     --  v_code         npd_rej_cls_reason.nrcr_code%TYPE;
"
"       v_code_id     npd_rej_cls_reason.nrcr_code%TYPE;
"
"
"
"    BEGIN
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"                SELECT MAX(nrcr_code)
"
"                  INTO v_code
"
"                  FROM npd_rej_cls_reason
"
"                 WHERE nrcr_bu = p_bu;
"
"
"
"                v_code_id := func_get_next_id(v_code);
"
"
"
"                     INSERT INTO npd_rej_cls_reason(
"
"                            nrcr_bu ,
"
"                            nrcr_code  ,
"
"                            nrcr_desc1 ,
"
"                            nrcr_desc2 ,
"
"                            nrcr_cre_by ,
"
"                            nrcr_cre_date,
"
"                            nrcr_upd_by,
"
"                            nrcr_upd_date
"
"                                              )
"
"                                        VALUES(p_bu ,
"
"                                               v_code_id    ,
"
"                                               cr1.mppe_param_desc  ,
"
"                                               null ,
"
"                                               p_user,
"
"                                               SYSDATE,
"
"                                               p_user,
"
"                                               null
"
"                                              );
"
"
"
"
"
"        DELETE mchn_proc_param_exception
"
"         WHERE mppe_bu         = p_bu
"
"           AND mppe_doc_type   = 'R'
"
"           AND mppe_status     = 'N'
"
"               AND mppe_sel_user   = p_user;
"
"
"
"            END LOOP;
"
"    END proc_ins_upl_cls_rej_reasons;
"
"
"
"    PROCEDURE proc_upload_rej_cls_reason
"
"    (
"
"     p_bu                VARCHAR2,
"
"     p_dir                VARCHAR2,
"
"     p_file_name        VARCHAR2,
"
"     p_user                VARCHAR2,
"
"     p_res            OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'REJ_CLS_REASON_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'R';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE REJ_CLS_REASON_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'R';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE REJ_CLS_REASON_TEMP(
"
"                                          RCRT_PARAM_DESC                           VARCHAR2(55)
"
"                                            )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                                RCRT_PARAM_DESC                  CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                                   NULL,
"
"                                                                   NULL,
"
"                                                                   NULL ,
"
"                                                                   NULL ,
"
"                                                                   NULL ,
"
"                                                                   RCRT_PARAM_DESC ,
"
"                                                                   NULL ,
"
"                                                                   '||CHR(39) || p_user || CHR(39)||','||'
"
"                                                                   SYSDATE,
"
"                                                                    NULL ,
"
"                                                                    NULL ,'
"
"                                                                   ||CHR(39) || 'R' || CHR(39)||','
"
"                                                                   ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                                   NULL ,'
"
"                                                                   ||CHR(39) || p_user   || CHR(39)||','||'
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
"                                                                  FROM REJ_CLS_REASON_TEMP
"
"                                                                       )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE REJ_CLS_REASON_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_rej_cls_reason;
"
"
"
"    PROCEDURE proc_chk_cls_rej_reasons
"
"    (
"
"     p_bu         VARCHAR2,
"
"     p_user       VARCHAR2,
"
"     p_res   OUT  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'R'
"
"       AND mppe_status   = 'N';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'R'
"
"    GROUP BY mppe_bu,mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c3(c_param VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM npd_rej_cls_reason
"
"     WHERE nrcr_bu    = p_bu
"
"       AND nrcr_desc1 = c_param;
"
"
"
"    cr3 c3%ROWTYPE;
"
"
"
"     BEGIN
"
"
"
"                   p_res:='Y';
"
"
"
"            UPDATE mchn_proc_param_exception
"
"               SET mppe_status   = 'N',
"
"                   mppe_upd_by   = p_user,
"
"                   mppe_upd_date = SYSDATE
"
"             WHERE mppe_bu       = p_bu
"
"               AND mppe_sel_user = p_user
"
"               AND mppe_doc_type = 'R';
"
"
"
"                    FOR cr2 IN c2
"
"                    LOOP
"
"
"
"                    UPDATE mchn_proc_param_exception
"
"                       SET mppe_status       = 'E',
"
"                           mppe_ref          = 'Duplicate Record',
"
"                           mppe_upd_by       = p_user,
"
"                           mppe_upd_date     = SYSDATE
"
"                     WHERE mppe_bu           = p_bu
"
"                       AND mppe_param_desc   = cr2.mppe_param_desc
"
"                       AND mppe_sel_user     = p_user
"
"                       AND mppe_doc_type     = 'R';
"
"
"
"                        p_res := 'N';
"
"
"
"                    END LOOP;
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"              OPEN c3(cr1.mppe_param_desc);
"
"
"
"                        FETCH c3 INTO cr3;
"
"
"
"                        IF c3%FOUND THEN
"
"
"
"                      UPDATE mchn_proc_param_exception
"
"                         SET mppe_status     = 'E',
"
"                             mppe_ref        = 'Reason Code already exists.',
"
"                             mppe_upd_by     = p_user,
"
"                             mppe_upd_date   = SYSDATE
"
"                       WHERE mppe_bu         = p_bu
"
"                         AND mppe_param_desc = cr1.mppe_param_desc
"
"                         AND mppe_sel_user   = p_user
"
"                         AND mppe_doc_type   = 'R';
"
"
"
"                            p_res := 'N';
"
"
"
"                        END IF;
"
"                    CLOSE c3;
"
"
"
"                IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"              UPDATE mchn_proc_param_exception
"
"                 SET mppe_status         = 'E',
"
"                     mppe_ref            = 'Reason Code must be enter.',
"
"                     mppe_upd_by         = p_user,
"
"                     mppe_upd_date       = SYSDATE
"
"                   WHERE mppe_bu         = p_bu
"
"                     AND mppe_param_desc = cr1.mppe_param_desc
"
"                     AND mppe_sel_user   = p_user
"
"                     AND mppe_doc_type   = 'R';
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
"      END LOOP ;
"
"
"
"    END proc_chk_cls_rej_reasons;
"
"
"
"    PROCEDURE proc_upload_aoc_char_mig(p_bu            VARCHAR2,
"
"                        p_dir            VARCHAR2,
"
"                        p_file_name            VARCHAR2,
"
"                        p_user            VARCHAR2,
"
"                        p_res         OUT    VARCHAR2)
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'temp_config_aoc_mig_excep_dtls';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM pcb_squeezes_excep_dtls
"
"     WHERE psed_bu   = p_bu ;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       v_exp_flag        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"             EXECUTE IMMEDIATE 'DROP TABLE TEMP_CONFIG_AOC_MIG_EXCEP_DTLS';
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"       DELETE
"
"         FROM pcb_squeezes_excep_dtls
"
"        WHERE psed_bu   = p_bu ;
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE temp_config_aoc_mig_excep_dtls(tcamed_sqz_desc    VARCHAR2(500),
"
"                                          tcamed_length    VARCHAR2(50))
"
"                      ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                      ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                 SKIP 1
"
"                                 FIELDS TERMINATED BY ''|''
"
"                                 MISSING FIELD VALUES ARE NULL
"
"                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                (tcamed_sqz_desc    CHAR(255),
"
"                                 tcamed_length    CHAR(255)))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"       EXECUTE IMMEDIATE 'INSERT INTO pcb_squeezes_excep_dtls (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                           ROWNUM,
"
"                                           tcamed_sqz_desc,
"
"                                           tcamed_length ,
"
"                                           NULL,'
"
"                                           || CHR(39) || v_exp_flag || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||',
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL
"
"                                              FROM temp_config_aoc_mig_excep_dtls)';
"
"
"
"       EXECUTE IMMEDIATE 'DROP TABLE temp_config_aoc_mig_excep_dtls';
"
"
"
"       UPDATE pcb_squeezes_excep_dtls
"
"          SET psed_sqz_desc = TRIM(psed_sqz_desc),
"
"              psed_length = TRIM(psed_length)
"
"        WHERE psed_bu   = p_bu ;
"
"
"
"       UPDATE pcb_squeezes_excep_dtls
"
"          SET psed_sqz_desc = UPPER(psed_sqz_desc),
"
"              psed_length = UPPER(psed_length)
"
"        WHERE psed_bu   = p_bu ;
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_aoc_char_mig;
"
"
"
"    PROCEDURE proc_ins_aoc_mig(p_bu            VARCHAR2,
"
"                             p_user            VARCHAR2,
"
"                             p_res         OUT    VARCHAR2)
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM pcb_squeezes_excep_dtls
"
"     WHERE psed_bu   = p_bu
"
"       AND psed_exp_flag = 'N';
"
"
"
"    CURSOR c2(c_sqz_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM pcb_squeezes
"
"     WHERE ps_bu  = p_bu
"
"       AND ps_sqz_desc = c_sqz_desc ;
"
"
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_sqz_id        VARCHAR2(10);
"
"       v_res        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       v_res := 'N';
"
"
"
"       FOR cr1 IN c1
"
"       LOOP
"
"         SELECT MAX(ps_sqz_id)
"
"           INTO v_sqz_id
"
"           FROM pcb_squeezes
"
"          WHERE ps_bu = p_bu;
"
"
"
"          v_sqz_id := func_get_next_id (v_sqz_id);
"
"
"
"           INSERT INTO pcb_squeezes(ps_bu       ,
"
"                    ps_sqz_id   ,
"
"                    ps_sqz_desc  ,
"
"                    ps_width  ,
"
"                    ps_cre_by  ,
"
"                    ps_cre_date
"
"                    )
"
"                VALUES(p_bu,
"
"                       v_sqz_id,
"
"                       cr1.psed_sqz_desc,
"
"                       cr1.psed_length  ,
"
"                       p_user,
"
"                       sysdate
"
"                    );
"
"
"
"          v_res := 'Y';
"
"       END LOOP;
"
"
"
"       DELETE
"
"         FROM pcb_squeezes_excep_dtls
"
"        WHERE psed_bu       = p_bu
"
"          AND psed_exp_flag = 'N';
"
"
"
"       p_res := v_res;
"
"
"
"    END;
"
"
"
"    PROCEDURE proc_upload_temp_parameter
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name        VARCHAR2,
"
"     p_user                    VARCHAR2,
"
"     p_res               OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'NPD_PARAMETERS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'P';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'P';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE NPD_PARAMETERS_TEMP (
"
"                                NPDPT_PARAM_NAME VARCHAR2(100)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             NPDPT_PARAM_NAME                       CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL          ,
"
"                                           NULL       ,
"
"                                           NULL         ,
"
"                                           NULL          ,
"
"                                           NULL     ,
"
"                                           NPDPT_PARAM_NAME ,
"
"                                           NULL,'
"
"                                                                       ||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,'
"
"                                           ||CHR(39) || 'P' || CHR(39)||','
"
"                                            ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user   || CHR(39)||',
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL
"
"                                          FROM NPD_PARAMETERS_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_temp_parameter;
"
"
"
"    PROCEDURE proc_chk_param
"
"    (
"
"    p_bu     varchar2,
"
"    p_user  VARCHAR2,
"
"    p_res    OUT VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT  *
"
"    FROM     mchn_proc_param_exception
"
"    WHERE   mppe_bu = p_bu
"
"    AND     mppe_doc_type = 'P'
"
"    AND     mppe_status = 'N';
"
"
"
"
"
"    CURSOR c2(c_param VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  npd_parameters
"
"    WHERE npdp_bu = p_bu
"
"    AND   npdp_param_name = c_param ;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'P'
"
"    GROUP BY mppe_bu,mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CR1 c1%rowtype;
"
"
"
"    CR2 c2%rowtype;
"
"
"
"
"
"    BEGIN
"
"
"
"            p_res := 'Y';
"
"
"
"        UPDATE mchn_proc_param_exception
"
"        SET    mppe_status = 'N',
"
"               mppe_ref = NULL,
"
"               mppe_upd_by = p_user,
"
"               mppe_upd_date = SYSDATE
"
"        WHERE  mppe_bu = p_bu
"
"         AND   mppe_sel_user = p_user
"
"         AND   mppe_doc_type = 'P';
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET mppe_status   = 'E',
"
"                mppe_ref      = 'Duplicate Record',
"
"                mppe_upd_by   = p_user,
"
"                mppe_upd_date = SYSDATE
"
"          WHERE mppe_bu       = p_bu
"
"            AND mppe_param_desc   = cr3.mppe_param_desc
"
"            AND mppe_sel_user = p_user
"
"            AND mppe_doc_type = 'P';
"
"
"
"        p_res := 'N';
"
"
"
"        END LOOP;
"
"
"
"
"
"    FOR cr1    IN c1
"
"    LOOP
"
"
"
"           IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"            UPDATE mchn_proc_param_exception
"
"            SET     mppe_status = 'E',
"
"                 mppe_ref = 'Parameter must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"           WHERE mppe_bu = p_bu
"
"            AND     mppe_param_desc IS NULL
"
"            AND  mppe_doc_type = 'P'
"
"            AND  mppe_status ='N'
"
"            AND  mppe_sel_user = p_user;
"
"
"
"            p_res  := 'N';
"
"
"
"           END IF;
"
"
"
"     OPEN c2(cr1.mppe_param_desc);
"
"        FETCH c2 INTO cr2;
"
"        IF c2%FOUND THEN
"
"
"
"         UPDATE mchn_proc_param_exception
"
"         SET    mppe_status = 'E',
"
"                mppe_ref = 'Parameter already exists',
"
"                mppe_upd_by = p_user,
"
"                mppe_upd_date = SYSDATE
"
"        WHERE   mppe_bu = p_bu
"
"         AND    mppe_doc_type = 'P'
"
"         AND    mppe_sel_user = p_user
"
"         AND    mppe_param_desc = cr1.mppe_param_desc;
"
"
"
"         p_res  := 'N';
"
"       END IF;
"
"    CLOSE c2;
"
"
"
"    END LOOP;
"
"
"
"    END proc_chk_param;
"
"
"
"    PROCEDURE proc_ins_con_param
"
"    (
"
"     p_bu    VARCHAR2,
"
"     p_user  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_status   = 'N'
"
"       AND mppe_doc_type = 'P';
"
"
"
"       v_param       npd_parameters.npdp_param_id%TYPE;
"
"       v_param_id npd_parameters.npdp_param_id%TYPE;
"
"
"
"    BEGIN
"
"
"
"       FOR cr1 IN c1
"
"       LOOP
"
"
"
"           SELECT MAX(npdp_param_id)
"
"             INTO v_param
"
"             FROM npd_parameters
"
"            WHERE npdp_bu = p_bu;
"
"
"
"            v_param_id := func_get_next_id(v_param);
"
"
"
"              INSERT INTO  npd_parameters(
"
"                              npdp_bu              ,
"
"                          npdp_param_id        ,
"
"                          npdp_param_name        ,
"
"                          npdp_cre_by                ,
"
"                          npdp_cre_date              ,
"
"                          npdp_upd_by                ,
"
"                          npdp_upd_date
"
"                              )
"
"                        VALUES(
"
"                               p_bu            ,
"
"                               v_param_id    ,
"
"                               cr1.mppe_param_desc    ,
"
"                               p_user            ,
"
"                               SYSDATE            ,
"
"                               NULL            ,
"
"                               NULL
"
"                               );
"
"
"
"       END LOOP;
"
"
"
"              DELETE mchn_proc_param_exception
"
"               WHERE mppe_bu       = p_bu
"
"                 AND mppe_sel_user = p_user
"
"                 AND mppe_status   = 'N'
"
"                 AND mppe_doc_type = 'P';
"
"
"
"    END proc_ins_con_param;
"
"
"
"    PROCEDURE proc_upload_temp_fault
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name        VARCHAR2,
"
"     p_user                    VARCHAR2,
"
"     p_res               OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'NPD_PARAMETERS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'F';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'F';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE NPD_PARAMETERS_TEMP (
"
"                                NPDPT_FAULT_NAME VARCHAR2(100)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             NPDPT_FAULT_NAME                       CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL          ,
"
"                                           NULL       ,
"
"                                           NULL         ,
"
"                                           NULL          ,
"
"                                           NULL     ,
"
"                                           NPDPT_FAULT_NAME ,
"
"                                           NULL,'
"
"                                                                       ||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,'
"
"                                           ||CHR(39) || 'F' || CHR(39)||','
"
"                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user   || CHR(39)||',
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL
"
"                                          FROM NPD_PARAMETERS_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_temp_fault;
"
"
"
"    PROCEDURE proc_chk_fault
"
"    (
"
"    p_bu     varchar2,
"
"    p_user  VARCHAR2,
"
"    p_res    OUT VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT  *
"
"    FROM     mchn_proc_param_exception
"
"    WHERE   mppe_bu = p_bu
"
"    AND     mppe_doc_type = 'F'
"
"    AND     mppe_status = 'N';
"
"
"
"
"
"    CURSOR c2(c_fault VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  spn_faults
"
"    WHERE sf_bu = p_bu
"
"      AND sf_faults_name = c_fault ;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'F'
"
"    GROUP BY mppe_bu,mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CR1 c1%rowtype;
"
"
"
"    CR2 c2%rowtype;
"
"
"
"
"
"    BEGIN
"
"
"
"            p_res := 'Y';
"
"
"
"        UPDATE mchn_proc_param_exception
"
"        SET    mppe_status = 'N',
"
"               mppe_ref = NULL,
"
"               mppe_upd_by = p_user,
"
"               mppe_upd_date = SYSDATE
"
"        WHERE  mppe_bu = p_bu
"
"         AND   mppe_sel_user = p_user
"
"         AND   mppe_doc_type = 'F';
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET mppe_status   = 'E',
"
"                mppe_ref      = 'Duplicate Record',
"
"                mppe_upd_by   = p_user,
"
"                mppe_upd_date = SYSDATE
"
"          WHERE mppe_bu       = p_bu
"
"            AND mppe_param_desc   = cr3.mppe_param_desc
"
"            AND mppe_sel_user = p_user
"
"            AND mppe_doc_type = 'F';
"
"
"
"        p_res := 'N';
"
"
"
"        END LOOP;
"
"
"
"
"
"    FOR cr1    IN c1
"
"    LOOP
"
"
"
"           IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"            UPDATE mchn_proc_param_exception
"
"            SET     mppe_status = 'E',
"
"                 mppe_ref = 'Fault must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"           WHERE mppe_bu = p_bu
"
"            AND     mppe_param_desc IS NULL
"
"            AND  mppe_doc_type = 'F'
"
"            AND  mppe_status ='N'
"
"            AND  mppe_sel_user = p_user;
"
"
"
"            p_res  := 'N';
"
"
"
"           END IF;
"
"
"
"     OPEN c2(cr1.mppe_param_desc);
"
"        FETCH c2 INTO cr2;
"
"        IF c2%FOUND THEN
"
"
"
"         UPDATE mchn_proc_param_exception
"
"         SET    mppe_status = 'E',
"
"                mppe_ref = 'Fault already exists',
"
"                mppe_upd_by = p_user,
"
"                mppe_upd_date = SYSDATE
"
"        WHERE   mppe_bu = p_bu
"
"         AND    mppe_doc_type = 'F'
"
"         AND    mppe_sel_user = p_user
"
"         AND    mppe_param_desc = cr1.mppe_param_desc;
"
"
"
"         p_res  := 'N';
"
"
"
"       END IF;
"
"    CLOSE c2;
"
"
"
"    END LOOP;
"
"
"
"    END proc_chk_fault;
"
"
"
"    PROCEDURE proc_ins_config_fault
"
"    (
"
"     p_bu    VARCHAR2,
"
"     p_user  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_status   = 'N'
"
"       AND mppe_doc_type = 'F';
"
"
"
"       v_fault       spn_faults.sf_faults_id%TYPE;
"
"       v_fault_id spn_faults.sf_faults_id%TYPE;
"
"
"
"    BEGIN
"
"
"
"       FOR cr1 IN c1
"
"       LOOP
"
"
"
"           SELECT MAX(sf_faults_id)
"
"             INTO v_fault
"
"             FROM spn_faults
"
"            WHERE sf_bu = p_bu;
"
"
"
"            v_fault_id := func_get_next_id(v_fault);
"
"
"
"              INSERT INTO  spn_faults(
"
"                                sf_bu          ,
"
"                                sf_faults_id   ,
"
"                                sf_faults_name ,
"
"                                sf_cre_by      ,
"
"                                sf_cre_date
"
"                              )
"
"                        VALUES(
"
"                               p_bu            ,
"
"                               v_fault_id    ,
"
"                               cr1.mppe_param_desc    ,
"
"                               p_user            ,
"
"                               SYSDATE
"
"                               );
"
"
"
"       END LOOP;
"
"
"
"              DELETE mchn_proc_param_exception
"
"               WHERE mppe_bu       = p_bu
"
"                 AND mppe_sel_user = p_user
"
"                 AND mppe_status   = 'N'
"
"                 AND mppe_doc_type = 'F';
"
"
"
"    END proc_ins_config_fault;
"
"
"
"    PROCEDURE proc_upload_temp_stng
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name        VARCHAR2,
"
"     p_user                    VARCHAR2,
"
"     p_res               OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'NPD_PARAMETERS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'S';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'S';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE NPD_PARAMETERS_TEMP (
"
"                                NPDPT_STNG_NAME VARCHAR2(100)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             NPDPT_STNG_NAME                       CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL          ,
"
"                                           NULL       ,
"
"                                           NULL         ,
"
"                                           NULL          ,
"
"                                           NULL     ,
"
"                                           NPDPT_STNG_NAME ,
"
"                                           NULL,'
"
"                                                                       ||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,'
"
"                                           ||CHR(39) || 'S' || CHR(39)||','
"
"                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user   || CHR(39)||',
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL
"
"                                          FROM NPD_PARAMETERS_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_temp_stng;
"
"
"
"    PROCEDURE proc_chk_stng
"
"    (
"
"    p_bu     varchar2,
"
"    p_user  VARCHAR2,
"
"    p_res    OUT VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT  *
"
"    FROM     mchn_proc_param_exception
"
"    WHERE   mppe_bu = p_bu
"
"    AND     mppe_doc_type = 'S'
"
"    AND     mppe_status = 'N';
"
"
"
"
"
"    CURSOR c2(c_stng VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  spn_machine_stng
"
"    WHERE sms_bu = p_bu
"
"      AND sms_stng_name = c_stng ;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'S'
"
"    GROUP BY mppe_bu,mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CR1 c1%rowtype;
"
"
"
"    CR2 c2%rowtype;
"
"
"
"
"
"    BEGIN
"
"
"
"            p_res := 'Y';
"
"
"
"        UPDATE mchn_proc_param_exception
"
"        SET    mppe_status = 'N',
"
"               mppe_ref = NULL,
"
"               mppe_upd_by = p_user,
"
"               mppe_upd_date = SYSDATE
"
"        WHERE  mppe_bu = p_bu
"
"         AND   mppe_sel_user = p_user
"
"         AND   mppe_doc_type = 'S';
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET mppe_status   = 'E',
"
"                mppe_ref      = 'Duplicate Record',
"
"                mppe_upd_by   = p_user,
"
"                mppe_upd_date = SYSDATE
"
"          WHERE mppe_bu       = p_bu
"
"            AND mppe_param_desc   = cr3.mppe_param_desc
"
"            AND mppe_sel_user = p_user
"
"            AND mppe_doc_type = 'S';
"
"
"
"        p_res := 'N';
"
"
"
"        END LOOP;
"
"
"
"
"
"    FOR cr1    IN c1
"
"    LOOP
"
"
"
"           IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"            UPDATE mchn_proc_param_exception
"
"            SET     mppe_status = 'E',
"
"                 mppe_ref = 'Setting must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"           WHERE mppe_bu = p_bu
"
"            AND     mppe_param_desc IS NULL
"
"            AND  mppe_doc_type = 'S'
"
"            AND  mppe_status ='N'
"
"            AND  mppe_sel_user = p_user;
"
"
"
"            p_res  := 'N';
"
"
"
"           END IF;
"
"
"
"     OPEN c2(cr1.mppe_param_desc);
"
"        FETCH c2 INTO cr2;
"
"        IF c2%FOUND THEN
"
"
"
"         UPDATE mchn_proc_param_exception
"
"         SET    mppe_status = 'E',
"
"                mppe_ref = 'Setting already exists',
"
"                mppe_upd_by = p_user,
"
"                mppe_upd_date = SYSDATE
"
"        WHERE   mppe_bu = p_bu
"
"         AND    mppe_doc_type = 'S'
"
"         AND    mppe_sel_user = p_user
"
"         AND    mppe_param_desc = cr1.mppe_param_desc;
"
"
"
"         p_res  := 'N';
"
"
"
"       END IF;
"
"    CLOSE c2;
"
"
"
"    END LOOP;
"
"
"
"    END proc_chk_stng;
"
"
"
"    PROCEDURE proc_ins_config_stng
"
"    (
"
"     p_bu    VARCHAR2,
"
"     p_user  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_status   = 'N'
"
"       AND mppe_doc_type = 'S';
"
"
"
"       v_stng       spn_machine_stng.sms_stng_id%TYPE;
"
"       v_stng_id  spn_machine_stng.sms_stng_id%TYPE;
"
"
"
"    BEGIN
"
"
"
"       FOR cr1 IN c1
"
"       LOOP
"
"
"
"           SELECT MAX(sms_stng_id)
"
"             INTO v_stng
"
"             FROM spn_machine_stng
"
"            WHERE sms_bu = p_bu;
"
"
"
"            v_stng_id := func_get_next_id(v_stng);
"
"
"
"              INSERT INTO spn_machine_stng(
"
"                                            sms_bu         ,
"
"                                            sms_stng_id    ,
"
"                                            sms_stng_name  ,
"
"                                            sms_cre_by     ,
"
"                                            sms_cre_date
"
"                                          )
"
"                                    VALUES(
"
"                                           p_bu            ,
"
"                                           v_stng_id    ,
"
"                                           cr1.mppe_param_desc    ,
"
"                                           p_user            ,
"
"                                           SYSDATE
"
"                                           );
"
"
"
"       END LOOP;
"
"
"
"              DELETE mchn_proc_param_exception
"
"               WHERE mppe_bu       = p_bu
"
"                 AND mppe_sel_user = p_user
"
"                 AND mppe_status   = 'N'
"
"                 AND mppe_doc_type = 'S';
"
"
"
"    END proc_ins_config_stng;
"
"
"
"    PROCEDURE proc_upload_temp_count
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name    VARCHAR2,
"
"     p_user            VARCHAR2,
"
"     p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'NPD_PARAMETERS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'C';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'C';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE NPD_PARAMETERS_TEMP (
"
"                                NPDPT_COUNT_NAME VARCHAR2(100),
"
"                                NPDPT_COUNT_TYPE VARCHAR2(2)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             NPDPT_COUNT_NAME                       CHAR(255),
"
"                                             NPDPT_COUNT_TYPE                        CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL          ,
"
"                                           NULL       ,
"
"                                           NULL         ,
"
"                                           NULL          ,
"
"                                           NULL     ,
"
"                                           npdpt_count_name ,
"
"                                           npdpt_count_type,
"
"                                           '||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,'
"
"                                           ||CHR(39) || 'C' || CHR(39)||','
"
"                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user   || CHR(39)||',
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL
"
"                                          FROM NPD_PARAMETERS_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_temp_count;
"
"
"
"    PROCEDURE proc_chk_count
"
"    (
"
"    p_bu     varchar2,
"
"    p_user  VARCHAR2,
"
"    p_res    OUT VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT  *
"
"    FROM     mchn_proc_param_exception
"
"    WHERE   mppe_bu = p_bu
"
"    AND     mppe_doc_type = 'C'
"
"    AND     mppe_status = 'N';
"
"
"
"
"
"    CURSOR c2(c_count VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  spn_oth_mill_count
"
"    WHERE somc_bu = p_bu
"
"      AND somc_cnt_desc = c_count ;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'C'
"
"    GROUP BY mppe_bu,mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CR1 c1%rowtype;
"
"
"
"    CR2 c2%rowtype;
"
"
"
"
"
"    BEGIN
"
"
"
"            p_res := 'Y';
"
"
"
"        UPDATE mchn_proc_param_exception
"
"        SET    mppe_status = 'N',
"
"               mppe_ref = NULL,
"
"               mppe_upd_by = p_user,
"
"               mppe_upd_date = SYSDATE
"
"        WHERE  mppe_bu = p_bu
"
"         AND   mppe_sel_user = p_user
"
"         AND   mppe_doc_type = 'C';
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET mppe_status   = 'E',
"
"                mppe_ref      = 'Duplicate Record',
"
"                mppe_upd_by   = p_user,
"
"                mppe_upd_date = SYSDATE
"
"          WHERE mppe_bu       = p_bu
"
"            AND mppe_param_desc   = cr3.mppe_param_desc
"
"            AND mppe_sel_user = p_user
"
"            AND mppe_doc_type = 'C';
"
"
"
"        p_res := 'N';
"
"
"
"        END LOOP;
"
"
"
"
"
"    FOR cr1    IN c1
"
"    LOOP
"
"
"
"           IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"            UPDATE mchn_proc_param_exception
"
"            SET     mppe_status = 'E',
"
"                 mppe_ref = 'Count must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"           WHERE mppe_bu = p_bu
"
"            AND     mppe_param_desc IS NULL
"
"            AND  mppe_doc_type = 'C'
"
"            AND  mppe_status ='N'
"
"            AND  mppe_sel_user = p_user;
"
"
"
"            p_res  := 'N';
"
"
"
"           END IF;
"
"
"
"     OPEN c2(cr1.mppe_param_desc);
"
"        FETCH c2 INTO cr2;
"
"        IF c2%FOUND THEN
"
"
"
"         UPDATE mchn_proc_param_exception
"
"         SET    mppe_status = 'E',
"
"                mppe_ref = 'Count already exists',
"
"                mppe_upd_by = p_user,
"
"                mppe_upd_date = SYSDATE
"
"        WHERE   mppe_bu = p_bu
"
"         AND    mppe_doc_type = 'C'
"
"         AND    mppe_sel_user = p_user
"
"         AND    mppe_param_desc = cr1.mppe_param_desc;
"
"
"
"         p_res  := 'N';
"
"
"
"       END IF;
"
"    CLOSE c2;
"
"
"
"    END LOOP;
"
"
"
"    END proc_chk_count;
"
"
"
"    PROCEDURE proc_ins_config_count
"
"    (
"
"     p_bu    VARCHAR2,
"
"     p_user  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_status   = 'N'
"
"       AND mppe_doc_type = 'C';
"
"
"
"       v_count       spn_oth_mill_count.somc_cnd_id%TYPE;
"
"       v_count_id  spn_oth_mill_count.somc_cnd_id%TYPE;
"
"
"
"    BEGIN
"
"
"
"       FOR cr1 IN c1
"
"       LOOP
"
"
"
"           SELECT MAX(somc_cnd_id)
"
"             INTO v_count
"
"             FROM spn_oth_mill_count
"
"            WHERE somc_bu = p_bu;
"
"
"
"            v_count_id := func_get_next_id(v_count);
"
"
"
"              INSERT INTO spn_oth_mill_count(
"
"                                            somc_bu         ,
"
"                                            somc_cnd_id    ,
"
"                                            somc_cnt_desc  ,
"
"                                            somc_cnt_type    ,
"
"                                            somc_cre_by     ,
"
"                                            somc_cre_date ,
"
"                                            somc_status
"
"                                          )
"
"                                    VALUES(
"
"                                           p_bu            ,
"
"                                           v_count_id    ,
"
"                                           cr1.mppe_param_desc    ,
"
"                                           cr1.mppe_param_type ,
"
"                                           p_user            ,
"
"                                           SYSDATE    ,
"
"                                           'N'
"
"                                           );
"
"
"
"       END LOOP;
"
"
"
"              DELETE mchn_proc_param_exception
"
"               WHERE mppe_bu       = p_bu
"
"                 AND mppe_sel_user = p_user
"
"                 AND mppe_status   = 'N'
"
"                 AND mppe_doc_type = 'C';
"
"
"
"    END proc_ins_config_count;
"
"
"
"    PROCEDURE proc_upload_temp_dev
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name    VARCHAR2,
"
"     p_user            VARCHAR2,
"
"     p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'NPD_PARAMETERS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'D';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'D';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE NPD_PARAMETERS_TEMP (
"
"                                NPDPT_DIVISION_NAME VARCHAR2(100)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             NPDPT_DIVISION_NAME                       CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL          ,
"
"                                           NULL       ,
"
"                                           NULL         ,
"
"                                           NULL          ,
"
"                                           NULL     ,
"
"                                           npdpt_division_name ,
"
"                                           NULL,
"
"                                           '||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,'
"
"                                           ||CHR(39) || 'D' || CHR(39)||','
"
"                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user   || CHR(39)||',
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL
"
"                                          FROM NPD_PARAMETERS_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_temp_dev;
"
"
"
"    PROCEDURE proc_chk_dev
"
"    (
"
"    p_bu     varchar2,
"
"    p_user  VARCHAR2,
"
"    p_res    OUT VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT  *
"
"    FROM     mchn_proc_param_exception
"
"    WHERE   mppe_bu = p_bu
"
"    AND     mppe_doc_type = 'D'
"
"    AND     mppe_status = 'N';
"
"
"
"
"
"    CURSOR c2(c_division VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  spn_devision
"
"    WHERE sd_bu = p_bu
"
"      AND sd_dev_name = c_division ;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'D'
"
"    GROUP BY mppe_bu,mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CR1 c1%rowtype;
"
"
"
"    CR2 c2%rowtype;
"
"
"
"
"
"    BEGIN
"
"
"
"            p_res := 'Y';
"
"
"
"        UPDATE mchn_proc_param_exception
"
"        SET    mppe_status = 'N',
"
"               mppe_ref = NULL,
"
"               mppe_upd_by = p_user,
"
"               mppe_upd_date = SYSDATE
"
"        WHERE  mppe_bu = p_bu
"
"         AND   mppe_sel_user = p_user
"
"         AND   mppe_doc_type = 'D';
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET mppe_status   = 'E',
"
"                mppe_ref      = 'Duplicate Record',
"
"                mppe_upd_by   = p_user,
"
"                mppe_upd_date = SYSDATE
"
"          WHERE mppe_bu       = p_bu
"
"            AND mppe_param_desc   = cr3.mppe_param_desc
"
"            AND mppe_sel_user = p_user
"
"            AND mppe_doc_type = 'D';
"
"
"
"        p_res := 'N';
"
"
"
"        END LOOP;
"
"
"
"
"
"    FOR cr1    IN c1
"
"    LOOP
"
"
"
"           IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"            UPDATE mchn_proc_param_exception
"
"            SET     mppe_status = 'E',
"
"                 mppe_ref = 'Division must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"           WHERE mppe_bu = p_bu
"
"            AND     mppe_param_desc IS NULL
"
"            AND  mppe_doc_type = 'D'
"
"            AND  mppe_status ='N'
"
"            AND  mppe_sel_user = p_user;
"
"
"
"            p_res  := 'N';
"
"
"
"           END IF;
"
"
"
"     OPEN c2(cr1.mppe_param_desc);
"
"        FETCH c2 INTO cr2;
"
"        IF c2%FOUND THEN
"
"
"
"         UPDATE mchn_proc_param_exception
"
"         SET    mppe_status = 'E',
"
"                mppe_ref = 'Division already exists',
"
"                mppe_upd_by = p_user,
"
"                mppe_upd_date = SYSDATE
"
"        WHERE   mppe_bu = p_bu
"
"         AND    mppe_doc_type = 'D'
"
"         AND    mppe_sel_user = p_user
"
"         AND    mppe_param_desc = cr1.mppe_param_desc;
"
"
"
"         p_res  := 'N';
"
"
"
"       END IF;
"
"    CLOSE c2;
"
"
"
"    END LOOP;
"
"
"
"    END proc_chk_dev;
"
"
"
"    PROCEDURE proc_ins_config_dev
"
"    (
"
"     p_bu    VARCHAR2,
"
"     p_user  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_status   = 'N'
"
"       AND mppe_doc_type = 'D';
"
"
"
"       v_division       spn_devision.sd_dev_id%TYPE;
"
"       v_division_id  spn_devision.sd_dev_id%TYPE;
"
"
"
"    BEGIN
"
"
"
"       FOR cr1 IN c1
"
"       LOOP
"
"
"
"           SELECT MAX(sd_dev_id)
"
"             INTO v_division
"
"             FROM spn_devision
"
"            WHERE sd_bu = p_bu;
"
"
"
"            v_division_id := func_get_next_id(v_division);
"
"
"
"              INSERT INTO spn_devision(
"
"                                            sd_bu         ,
"
"                                            sd_dev_id    ,
"
"                                            sd_dev_name  ,
"
"                                            sd_cre_by     ,
"
"                                            sd_cre_date
"
"                                          )
"
"                                    VALUES(
"
"                                           p_bu            ,
"
"                                           v_division_id    ,
"
"                                           cr1.mppe_param_desc    ,
"
"                                           p_user            ,
"
"                                           SYSDATE
"
"                                           );
"
"
"
"       END LOOP;
"
"
"
"              DELETE mchn_proc_param_exception
"
"               WHERE mppe_bu       = p_bu
"
"                 AND mppe_sel_user = p_user
"
"                 AND mppe_status   = 'N'
"
"                 AND mppe_doc_type = 'D';
"
"
"
"    END proc_ins_config_dev;
"
"
"
"    PROCEDURE proc_upload_temp_dp
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name    VARCHAR2,
"
"     p_user            VARCHAR2,
"
"     p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'NPD_PARAMETERS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'M';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'M';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE NPD_PARAMETERS_TEMP (
"
"                                NPDPT_DIVISION_NAME VARCHAR2(100),
"
"                                NPDPT_PARAM_NAME     VARCHAR2(100)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             NPDPT_DIVISION_NAME                       CHAR(255),
"
"                                             NPDPT_PARAM_NAME                             CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL          ,
"
"                                           NULL       ,
"
"                                           NULL         ,
"
"                                           NULL          ,
"
"                                           NULL     ,
"
"                                           npdpt_param_name ,
"
"                                           NULL,
"
"                                           '||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,'
"
"                                           ||CHR(39) || 'M' || CHR(39)||','
"
"                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user   || CHR(39)||',
"
"                                           NULL,
"
"                                           npdpt_division_name,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL
"
"                                          FROM NPD_PARAMETERS_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE NPD_PARAMETERS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_temp_dp;
"
"
"
"    PROCEDURE proc_chk_dp
"
"    (
"
"    p_bu     varchar2,
"
"    p_user  VARCHAR2,
"
"    p_res    OUT VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"    IS
"
"    SELECT  *
"
"    FROM     mchn_proc_param_exception
"
"    WHERE   mppe_bu = p_bu
"
"    AND     mppe_doc_type = 'M'
"
"    AND     mppe_status = 'N';
"
"
"
"    CURSOR c_dev
"
"    IS
"
"    SELECT  mppe_param_action_desc
"
"    FROM     mchn_proc_param_exception
"
"    WHERE   mppe_bu = p_bu
"
"    AND     mppe_doc_type = 'M'
"
"    AND     mppe_status = 'N'
"
"    GROUP BY mppe_param_action_desc;
"
"
"
"    CURSOR c2(c_param VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  spn_dev_param
"
"    WHERE sdp_bu = p_bu
"
"      AND sdp_param_name = c_param ;
"
"
"
"    CURSOR c4(c_division VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  spn_devision
"
"    WHERE sd_bu = p_bu
"
"      AND sd_dev_name = c_division ;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'D'
"
"    GROUP BY mppe_bu,mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    cr1 c1%ROWTYPE;
"
"    cr2 c2%ROWTYPE;
"
"    cr4 c4%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"            p_res := 'Y';
"
"
"
"        UPDATE mchn_proc_param_exception
"
"        SET    mppe_status = 'N',
"
"               mppe_ref = NULL,
"
"               mppe_upd_by = p_user,
"
"               mppe_upd_date = SYSDATE
"
"        WHERE  mppe_bu = p_bu
"
"         AND   mppe_sel_user = p_user
"
"         AND   mppe_doc_type = 'M';
"
"
"
"        FOR cr3 IN c3
"
"        LOOP
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET mppe_status   = 'E',
"
"                mppe_ref      = 'Duplicate Record',
"
"                mppe_upd_by   = p_user,
"
"                mppe_upd_date = SYSDATE
"
"          WHERE mppe_bu       = p_bu
"
"            AND mppe_param_desc   = cr3.mppe_param_desc
"
"            AND mppe_sel_user = p_user
"
"            AND mppe_doc_type = 'M';
"
"
"
"        p_res := 'N';
"
"
"
"        END LOOP c3;
"
"
"
"    FOR cr_dev IN c_dev
"
"    LOOP
"
"
"
"        OPEN c4(cr_dev.mppe_param_action_desc);
"
"        FETCH c4 INTO cr4;
"
"        IF c4%NOTFOUND THEN
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET mppe_status   = 'E',
"
"                mppe_ref      = 'Division not found.',
"
"                mppe_upd_by   = p_user,
"
"                mppe_upd_date = SYSDATE
"
"          WHERE mppe_bu       = p_bu
"
"            AND mppe_param_action_desc   = cr_dev.mppe_param_action_desc
"
"            AND mppe_sel_user = p_user
"
"            AND mppe_doc_type = 'M';
"
"
"
"            p_res := 'N';
"
"
"
"        END IF;
"
"
"
"        CLOSE c4;
"
"
"
"    END LOOP c_dev;
"
"
"
"
"
"    FOR cr1    IN c1
"
"    LOOP
"
"
"
"           IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"            UPDATE mchn_proc_param_exception
"
"            SET     mppe_status = 'E',
"
"                 mppe_ref = 'Parameter must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"           WHERE mppe_bu = p_bu
"
"            AND     mppe_param_desc IS NULL
"
"            AND  mppe_doc_type = 'M'
"
"            AND  mppe_status ='N'
"
"            AND  mppe_sel_user = p_user;
"
"
"
"            p_res  := 'N';
"
"
"
"           END IF;
"
"
"
"           IF cr1.mppe_param_action_desc IS NULL THEN
"
"
"
"            UPDATE mchn_proc_param_exception
"
"            SET     mppe_status = 'E',
"
"                 mppe_ref = 'Division must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"           WHERE mppe_bu = p_bu
"
"            AND     mppe_param_action_desc IS NULL
"
"            AND  mppe_doc_type = 'M'
"
"            AND  mppe_status ='N'
"
"            AND  mppe_sel_user = p_user;
"
"
"
"            p_res  := 'N';
"
"
"
"           END IF;
"
"
"
"     OPEN c2(cr1.mppe_param_desc);
"
"        FETCH c2 INTO cr2;
"
"        IF c2%FOUND THEN
"
"
"
"         UPDATE mchn_proc_param_exception
"
"         SET    mppe_status = 'E',
"
"                mppe_ref = 'Parameter already exists',
"
"                mppe_upd_by = p_user,
"
"                mppe_upd_date = SYSDATE
"
"        WHERE   mppe_bu = p_bu
"
"         AND    mppe_doc_type = 'M'
"
"         AND    mppe_sel_user = p_user
"
"         AND    mppe_param_desc = cr1.mppe_param_desc;
"
"
"
"         p_res  := 'N';
"
"
"
"       END IF;
"
"    CLOSE c2;
"
"
"
"    END LOOP;
"
"
"
"    END proc_chk_dp;
"
"
"
"    PROCEDURE proc_ins_config_dp
"
"    (
"
"     p_bu    VARCHAR2,
"
"     p_user  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_status   = 'N'
"
"       AND mppe_doc_type = 'M';
"
"
"
"    CURSOR c_dev(c_division VARCHAR2)
"
"    IS
"
"    SELECT *
"
"    FROM  spn_devision
"
"    WHERE sd_bu = p_bu
"
"      AND sd_dev_name = c_division ;
"
"
"
"       v_param        spn_dev_param.sdp_param_id%TYPE;
"
"       v_param_id  spn_dev_param.sdp_param_id%TYPE;
"
"
"
"    cr_dev    c_dev%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"       FOR cr1 IN c1
"
"       LOOP
"
"
"
"           OPEN c_dev(cr1.mppe_param_action_desc);
"
"           FETCH c_dev INTO cr_dev;
"
"           CLOSE c_dev;
"
"
"
"           SELECT MAX(sdp_param_id)
"
"             INTO v_param
"
"             FROM spn_dev_param
"
"            WHERE sdp_bu = p_bu;
"
"
"
"            v_param_id := func_get_next_id(v_param);
"
"
"
"              INSERT INTO spn_dev_param(
"
"                                            sdp_bu         ,
"
"                                            sdp_dev_id    ,
"
"                                            sdp_param_id    ,
"
"                                            sdp_param_name  ,
"
"                                            sdp_cre_by     ,
"
"                                            sdp_cre_date
"
"                                          )
"
"                                    VALUES(
"
"                                           p_bu            ,
"
"                                           cr_dev.sd_dev_id ,
"
"                                           v_param_id    ,
"
"                                           cr1.mppe_param_desc    ,
"
"                                           p_user            ,
"
"                                           SYSDATE
"
"                                           );
"
"
"
"       END LOOP;
"
"
"
"              DELETE mchn_proc_param_exception
"
"               WHERE mppe_bu       = p_bu
"
"                 AND mppe_sel_user = p_user
"
"                 AND mppe_status   = 'N'
"
"                 AND mppe_doc_type = 'M';
"
"
"
"    END proc_ins_config_dp;
"
"
"
"    PROCEDURE proc_chk_excep_gpi_cfg_mig(p_bu                 VARCHAR2,
"
"                                   p_type               VARCHAR2,
"
"                                   p_user               VARCHAR2,
"
"                                   p_res         OUT    VARCHAR2)
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM gpi_config_mig_excep_dtls
"
"     WHERE gcmed_bu   = p_bu
"
"       AND gcmed_type = p_type;
"
"
"
"    CURSOR c2(c_gls_fmly        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_gls_fmly
"
"     WHERE ggf_bu = p_bu
"
"       AND ggf_fmly_name = c_gls_fmly;
"
"
"
"    CURSOR c3(c_data        VARCHAR2)
"
"        IS
"
"    SELECT gcmed_data1
"
"      FROM gpi_config_mig_excep_dtls
"
"     WHERE gcmed_bu    = p_bu
"
"       AND gcmed_type  = p_type
"
"       AND gcmed_data1 = c_data
"
"     GROUP BY gcmed_data1
"
"     HAVING COUNT(*) > 1;
"
"
"
"    CURSOR c4(c_shape        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM prod_shapes
"
"     WHERE ps_bu         = p_bu
"
"       AND ps_shape_desc = c_shape;
"
"
"
"    CURSOR c5(c_make_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM product_make
"
"     WHERE pm_bu        = p_bu
"
"       AND pm_mak_desc1 = c_make_desc;
"
"
"
"    CURSOR c6(c_content_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_cavty_cont
"
"     WHERE gcc_bu        = p_bu
"
"       AND gcc_cont_desc = c_content_desc;
"
"
"
"    CURSOR c7(c_coat_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_coating
"
"     WHERE gc_bu        = p_bu
"
"       AND gc_coat_desc = c_coat_desc;
"
"
"
"    CURSOR c8(c_color_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gar_colors
"
"     WHERE gcolor_bu   = p_bu
"
"       AND gcolor_name = c_color_desc;
"
"
"
"    CURSOR c9(c_lyr_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_pvt_lyr_type
"
"     WHERE gplt_bu       = p_bu
"
"       AND gplt_lyr_desc = c_lyr_desc;
"
"
"
"    CURSOR c10(c_reason_desc      VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gls_pi_cncl_reasons
"
"     WHERE gpcr_bu          = p_bu
"
"       AND gpcr_reason_desc = c_reason_desc;
"
"
"
"    CURSOR c11(c_edge_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gls_ew_types
"
"     WHERE get_bu           = p_bu
"
"       AND get_ew_type_desc = c_edge_desc;
"
"
"
"    CURSOR c12(c_gls_desc VARCHAR2)
"
"        IS
"
"    SELECT *
"
"       FROM gpi_glass
"
"      WHERE gg_bu        = p_bu
"
"        AND gg_glass_desc    = c_gls_desc;
"
"
"
"    CURSOR c13(c_pvb_thickness VARCHAR2)
"
"        IS
"
"    SELECT *
"
"       FROM gpi_pvb_thkness
"
"      WHERE gpt_bu        = p_bu
"
"        AND gpt_thkness    = c_pvb_thickness;
"
"
"
"    CURSOR c14(c_cavity_thickness VARCHAR2)
"
"        IS
"
"    SELECT *
"
"       FROM gpi_dg_cvty_thkness
"
"      WHERE gdct_bu        = p_bu
"
"        AND gdct_thkness    = c_cavity_thickness;
"
"
"
"     CURSOR c15(c_chrg_all        VARCHAR2)
"
"         IS
"
"     SELECT *
"
"        FROM gpi_chrg_allow
"
"       WHERE gca_bu        = p_bu
"
"         AND gca_thkness    = c_chrg_all;
"
"
"
"     CURSOR c16(c_cut_all         VARCHAR2)
"
"         IS
"
"     SELECT *
"
"        FROM gpi_gls_cut_allow
"
"       WHERE ggca_bu    = p_bu
"
"         AND ggca_thkness   = c_cut_all;
"
"
"
"     CURSOR c17(c_proc_type       VARCHAR2)
"
"         IS
"
"     SELECT *
"
"        FROM gpi_glass_proc_types
"
"       WHERE ggpt_bu    = p_bu
"
"         AND ggpt_type_desc = c_proc_type;
"
"
"
"     CURSOR c18(c_size_frm    NUMBER)
"
"         IS
"
"     SELECT *
"
"        FROM gls_rndoff_calc_ln
"
"       WHERE grcl_bu    = p_bu
"
"         AND grcl_size_fm   = c_size_frm;
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"       cr4            c4%ROWTYPE;
"
"       cr5            c5%ROWTYPE;
"
"       cr6            c6%ROWTYPE;
"
"       cr7            c7%ROWTYPE;
"
"       cr8            c8%ROWTYPE;
"
"       cr9            c9%ROWTYPE;
"
"       cr10           c10%ROWTYPE;
"
"       cr11           c11%ROWTYPE;
"
"       cr12          c12%ROWTYPE;
"
"       cr13          c13%ROWTYPE;
"
"       cr14          c14%ROWTYPE;
"
"       cr15          c15%ROWTYPE;
"
"       cr16          c16%ROWTYPE;
"
"       cr17          c17%ROWTYPE;
"
"       cr18          c18%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1)    := 'M';
"
"       v_exp             VARCHAR2(4000);
"
"       v_result          VARCHAR2(1)    := 'N';
"
"       v_spec_char       VARCHAR2(1)    := 'N';
"
"
"
"    BEGIN
"
"
"
"       UPDATE gpi_config_mig_excep_dtls
"
"          SET gcmed_ref        = NULL,
"
"              gcmed_exp_flag   = 'N'
"
"        WHERE gcmed_bu         = p_bu
"
"          AND gcmed_type       = p_type;
"
"
"
"       /****** Glass Family ******/
"
"
"
"       IF p_type = 'GF' THEN
"
"
"
"          v_result    := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c2(cr1.gcmed_data1);
"
"             FETCH c2 INTO cr2;
"
"
"
"                IF c2%FOUND THEN
"
"                   v_exp := v_exp ||' Glass Family. Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Glass Family exists Desc.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||' Glass Family should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                            v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                   v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"       p_res := v_result;
"
"
"
"       /*****Shape*****/
"
"
"
"     IF p_type = 'SP' THEN
"
"
"
"          v_result := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c4(cr1.gcmed_data1);
"
"             FETCH c4 INTO cr4;
"
"
"
"                IF c4%FOUND THEN
"
"                   v_exp := v_exp ||' Shape Desc. Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c4;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Shape Desc. exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||' Shape Desc. should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                            v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"    p_res := v_result;
"
"
"
"    /*****Product*****/
"
"
"
"    IF p_type = 'MK' THEN
"
"
"
"          v_result := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c5(cr1.gcmed_data1);
"
"             FETCH c5 INTO cr5;
"
"
"
"                IF c5%FOUND THEN
"
"                   v_exp := v_exp ||' Make Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c5;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Make Desc. exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||'Make Desc. should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                            v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"            --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_exp);
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"       p_res := v_result;
"
"
"
"    /*****Cavity Content*****/
"
"
"
"    IF p_type = 'CC' THEN
"
"
"
"          v_result := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c6(cr1.gcmed_data1);
"
"             FETCH c6 INTO cr6;
"
"
"
"                IF c6%FOUND THEN
"
"                   v_exp := v_exp ||' Cavity Content Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c6;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Cavity Content Desc. exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||'Cavity Content Desc. should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                   v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"        --  RAISE_APPLICATION_ERROR(-20999,'HRM'||v_result);
"
"
"
"       END IF;
"
"
"
"        p_res := v_result;
"
"
"
"     /****** COATING ******/
"
"
"
"       IF p_type = 'CT' THEN
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c7(cr1.gcmed_data1);
"
"             FETCH c7 INTO cr7;
"
"
"
"                IF c7%FOUND THEN
"
"                   v_exp := v_exp ||'Coating Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c7;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Coating exists Desc.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"            v_exp := v_exp||' Coating should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                   v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref       = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag  = 'Y'
"
"                 WHERE gcmed_bu        = p_bu
"
"                   AND gcmed_type      = p_type
"
"                   AND gcmed_seq_no    = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"       p_res := v_result;
"
"
"
"
"
"       /****** COLOR ******/
"
"
"
"       IF p_type = 'CL' THEN
"
"
"
"          v_result    := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c8(cr1.gcmed_data1);
"
"             FETCH c8 INTO cr8;
"
"
"
"                IF c8%FOUND THEN
"
"                   v_exp := v_exp ||' Color Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c8;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Color exists Desc.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||' Color should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                            v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"       p_res := v_result;
"
"
"
"
"
"       /****** Layer Type ******/
"
"
"
"       IF p_type = 'LT' THEN
"
"
"
"          v_result    := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c9(cr1.gcmed_data1);
"
"             FETCH c9 INTO cr9;
"
"
"
"                IF c9%FOUND THEN
"
"                   v_exp := v_exp ||' Layer Type Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c9;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Layer Type exists Desc.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||'Layer Type should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                            v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"       p_res := v_result;
"
"
"
"      /****** Reason******/
"
"
"
"       IF p_type = 'RS' THEN
"
"
"
"          v_result    := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c10(cr1.gcmed_data1);
"
"             FETCH c10 INTO cr10;
"
"
"
"                IF c10%FOUND THEN
"
"                   v_exp := v_exp ||' Reason Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c10;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Reason exists Desc.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||' Reason should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                            v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                  SET  gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"       p_res := v_result;
"
"
"
"      /****** Edging ******/
"
"
"
"       IF p_type = 'ED' THEN
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c11(cr1.gcmed_data1);
"
"             FETCH c11 INTO cr11;
"
"
"
"                IF c11%FOUND THEN
"
"                   v_exp := v_exp ||' Edging Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c11;
"
"
"
"             OPEN c3(cr1.gcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Edging exists Desc.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.gcmed_data1 IS NULL THEN
"
"                v_exp := v_exp||' Edging should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                            v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE gpi_config_mig_excep_dtls
"
"                   SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                       gcmed_exp_flag = 'Y'
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                   AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       END IF;
"
"
"
"       p_res := v_result;
"
"
"
"      /****** Glass ******/
"
"
"
"        IF p_type = 'GL' THEN
"
"
"
"           v_result := 'N';
"
"
"
"           FOR cr1 IN c1
"
"           LOOP
"
"             v_exp := NULL;
"
"
"
"              OPEN c12(cr1.gcmed_data1);
"
"              FETCH c12 INTO cr12;
"
"
"
"                 IF c12%FOUND THEN
"
"                    v_exp := v_exp ||' Glass Desc. Already exists.';
"
"                 END IF;
"
"
"
"              CLOSE c12;
"
"
"
"              OPEN c3(cr1.gcmed_data1);
"
"              FETCH c3 INTO cr3;
"
"
"
"                 IF c3%FOUND THEN
"
"                    v_exp := v_exp||' Duplicate Glass Desc. exists.';
"
"                 END IF;
"
"
"
"              CLOSE c3;
"
"
"
"              IF cr1.gcmed_data1 IS NULL THEN
"
"            v_exp := v_exp||' Glass Desc. should not be null.';
"
"              END IF;
"
"
"
"              IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                 proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                    v_spec_char);
"
"
"
"                 IF v_spec_char = 'Y' THEN
"
"                    NULL;
"
"                    --v_exp := v_exp||' Special Characters not allowed.';
"
"                 END IF;
"
"
"
"              END IF;
"
"
"
"              IF cr1.gcmed_data2 IS NULL THEN
"
"                 v_exp := v_exp||' Glass Family Desc. should not be null.';
"
"              END IF;
"
"
"
"              IF cr1.gcmed_data2 IS NOT NULL THEN
"
"
"
"                 OPEN c2(cr1.gcmed_data2);
"
"                 FETCH c2 INTO cr2;
"
"
"
"                    IF c2%NOTFOUND THEN
"
"                       v_exp := v_exp ||'Glass Family Desc. not found.';
"
"                    END IF;
"
"
"
"                 CLOSE c2;
"
"
"
"              END IF;
"
"
"
"              IF v_exp IS NOT NULL THEN
"
"
"
"                 UPDATE gpi_config_mig_excep_dtls
"
"               SET gcmed_ref = LTRIM(v_exp,' '),
"
"                   gcmed_exp_flag = 'Y'
"
"             WHERE gcmed_bu     = p_bu
"
"                    AND gcmed_type   = p_type
"
"                    AND gcmed_seq_no = cr1.gcmed_seq_no;
"
"
"
"                 v_result := 'Y';
"
"
"
"              END IF;
"
"           END LOOP c1;
"
"       END IF;
"
"        p_res := v_result;
"
"
"
"      /****** PVB Thickness ******/
"
"
"
"        IF p_type = 'PT' THEN
"
"
"
"           v_result    := 'N';
"
"           v_spec_char := 'N';
"
"
"
"           FOR cr1 IN c1
"
"           LOOP
"
"
"
"              v_exp := NULL;
"
"
"
"              OPEN c13(cr1.gcmed_data1);
"
"              FETCH c13 INTO cr13;
"
"
"
"                 IF c13%FOUND THEN
"
"                    v_exp := v_exp ||' PVB Thickness Already exists.';
"
"                 END IF;
"
"
"
"              CLOSE c13;
"
"
"
"              OPEN c3(cr1.gcmed_data1);
"
"              FETCH c3 INTO cr3;
"
"
"
"                 IF c3%FOUND THEN
"
"                    v_exp := v_exp||' Duplicate PVB Thickness exists.';
"
"                 END IF;
"
"
"
"              CLOSE c3;
"
"
"
"              IF cr1.gcmed_data1 IS NULL THEN
"
"                 v_exp := v_exp||' PVB Thickness should not be null.';
"
"              END IF;
"
"
"
"              IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                 proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                             v_spec_char);
"
"
"
"                 IF v_spec_char = 'Y' THEN
"
"                    NULL;
"
"                    --v_exp := v_exp||' Special Characters not allowed.';
"
"                 END IF;
"
"
"
"              END IF;
"
"
"
"              IF v_exp IS NOT NULL THEN
"
"
"
"                 UPDATE gpi_config_mig_excep_dtls
"
"                    SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                        gcmed_exp_flag = 'Y'
"
"                  WHERE gcmed_bu       = p_bu
"
"                    AND gcmed_type     = p_type
"
"                    AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                 v_result := 'Y';
"
"
"
"              END IF;
"
"
"
"           END LOOP c1;
"
"
"
"        END IF;
"
"
"
"       p_res := v_result;
"
"
"
"      /****** Cavity Thickness ******/
"
"
"
"         IF p_type = 'CV' THEN
"
"
"
"            v_result    := 'N';
"
"            v_spec_char := 'N';
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               v_exp := NULL;
"
"
"
"               OPEN c14(cr1.gcmed_data1);
"
"               FETCH c14 INTO cr14;
"
"
"
"                  IF c14%FOUND THEN
"
"                     v_exp := v_exp ||' Cavity Thickness Already exists.';
"
"                  END IF;
"
"
"
"               CLOSE c14;
"
"
"
"               OPEN c3(cr1.gcmed_data1);
"
"               FETCH c3 INTO cr3;
"
"
"
"                  IF c3%FOUND THEN
"
"                     v_exp := v_exp||' Duplicate Cavity Thickness exists.';
"
"                  END IF;
"
"
"
"               CLOSE c3;
"
"
"
"               IF cr1.gcmed_data1 IS NULL THEN
"
"                  v_exp := v_exp||' Cavity Thickness should not be null.';
"
"               END IF;
"
"
"
"               IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                  proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                              v_spec_char);
"
"
"
"                  IF v_spec_char = 'Y' THEN
"
"                     NULL;
"
"                     --v_exp := v_exp||' Special Characters not allowed.';
"
"                  END IF;
"
"
"
"               END IF;
"
"
"
"               IF v_exp IS NOT NULL THEN
"
"
"
"                  UPDATE gpi_config_mig_excep_dtls
"
"                     SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                         gcmed_exp_flag = 'Y'
"
"                   WHERE gcmed_bu       = p_bu
"
"                     AND gcmed_type     = p_type
"
"                     AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                  v_result := 'Y';
"
"
"
"               END IF;
"
"
"
"            END LOOP c1;
"
"
"
"         END IF;
"
"
"
"       p_res := v_result;
"
"
"
"      /****** Charge Allowance ******/
"
"
"
"          IF p_type = 'CA' THEN
"
"
"
"             v_result    := 'N';
"
"             v_spec_char := 'N';
"
"
"
"             FOR cr1 IN c1
"
"             LOOP
"
"
"
"                v_exp := NULL;
"
"
"
"                OPEN c15(cr1.gcmed_data1);
"
"                FETCH c15 INTO cr15;
"
"
"
"                   IF c15%FOUND THEN
"
"                      v_exp := v_exp ||' Thickness Already exists.';
"
"                   END IF;
"
"
"
"                CLOSE c15;
"
"
"
"                OPEN c3(cr1.gcmed_data1);
"
"                FETCH c3 INTO cr3;
"
"
"
"                   IF c3%FOUND THEN
"
"                      v_exp := v_exp||' Duplicate Thickness exists.';
"
"                   END IF;
"
"
"
"                CLOSE c3;
"
"
"
"                IF cr1.gcmed_data1 IS NULL THEN
"
"                   v_exp := v_exp||' Thickness should not be null.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data1 <0 THEN
"
"               v_exp := v_exp||' Thickness should not be negative.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data2 IS NULL THEN
"
"                   v_exp := v_exp||' Width should not be null.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data2 <0 THEN
"
"               v_exp := v_exp||' Width should not be negative.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data3 IS NULL THEN
"
"                   v_exp := v_exp||' Height should not be null.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data3 <0 THEN
"
"               v_exp := v_exp||' Height should not be negative.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                   proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                               v_spec_char);
"
"
"
"                   IF v_spec_char = 'Y' THEN
"
"                      NULL;
"
"                      --v_exp := v_exp||' Special Characters not allowed.';
"
"                   END IF;
"
"
"
"                END IF;
"
"
"
"                IF v_exp IS NOT NULL THEN
"
"
"
"                   UPDATE gpi_config_mig_excep_dtls
"
"                      SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                          gcmed_exp_flag = 'Y'
"
"                    WHERE gcmed_bu       = p_bu
"
"                      AND gcmed_type     = p_type
"
"                      AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                   v_result := 'Y';
"
"
"
"                END IF;
"
"
"
"             END LOOP c1;
"
"
"
"          END IF;
"
"
"
"       p_res := v_result;
"
"
"
"       /****** Cutting Allowance ******/
"
"
"
"          IF p_type = 'CUA' THEN
"
"
"
"             v_result := 'N';
"
"
"
"             FOR cr1 IN c1
"
"             LOOP
"
"               v_exp := NULL;
"
"
"
"                OPEN c16(cr1.gcmed_data1);
"
"                FETCH c16 INTO cr16;
"
"
"
"                   IF c16%FOUND THEN
"
"                      v_exp := v_exp ||' Thickness Already exists.';
"
"                   END IF;
"
"
"
"                CLOSE c16;
"
"
"
"                OPEN c3(cr1.gcmed_data1);
"
"                FETCH c3 INTO cr3;
"
"
"
"                   IF c3%FOUND THEN
"
"                      v_exp := v_exp||' Duplicate Thickness exists.';
"
"                   END IF;
"
"
"
"                CLOSE c3;
"
"
"
"                IF cr1.gcmed_data1 IS NULL THEN
"
"            v_exp := v_exp||' Thickness should not be null.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data1 <0 THEN
"
"                    v_exp := v_exp||' Thickness should not be negative.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                   proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                    v_spec_char);
"
"
"
"                   IF v_spec_char = 'Y' THEN
"
"                      NULL;
"
"                      --v_exp := v_exp||' Special Characters not allowed.';
"
"                   END IF;
"
"
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data2 IS NULL THEN
"
"                   v_exp := v_exp||' Glass Type should not be null.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data3 IS NULL THEN
"
"                   v_exp := v_exp||' Cutting allowance should not be null.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data3 <0 THEN
"
"               v_exp := v_exp||' Cutting allowance should not be negative.';
"
"                END IF;
"
"
"
"                IF cr1.gcmed_data2 IS NOT NULL THEN
"
"
"
"                   OPEN c17(cr1.gcmed_data2);
"
"                   FETCH c17 INTO cr17;
"
"
"
"                      IF c17%NOTFOUND THEN
"
"                         v_exp := v_exp ||'Glass Type not found.';
"
"                      END IF;
"
"
"
"                   CLOSE c17;
"
"
"
"                END IF;
"
"
"
"                IF v_exp IS NOT NULL THEN
"
"
"
"                   UPDATE gpi_config_mig_excep_dtls
"
"               SET gcmed_ref = LTRIM(v_exp,' '),
"
"                   gcmed_exp_flag = 'Y'
"
"             WHERE gcmed_bu     = p_bu
"
"                      AND gcmed_type   = p_type
"
"                      AND gcmed_seq_no = cr1.gcmed_seq_no;
"
"
"
"                   v_result := 'Y';
"
"
"
"                END IF;
"
"             END LOOP c1;
"
"         END IF;
"
"        p_res := v_result;
"
"
"
"
"
"      /****** Round off ******/
"
"
"
"           IF p_type = 'RO' THEN
"
"
"
"              v_result    := 'N';
"
"              v_spec_char := 'N';
"
"
"
"              FOR cr1 IN c1
"
"              LOOP
"
"
"
"                 v_exp := NULL;
"
"
"
"                 OPEN c18(cr1.gcmed_data1);
"
"                 FETCH c18 INTO cr18;
"
"
"
"                    IF c18%FOUND THEN
"
"                       v_exp := v_exp ||' From size Already exists.';
"
"                    END IF;
"
"
"
"                 CLOSE c18;
"
"
"
"                 OPEN c3(cr1.gcmed_data1);
"
"                 FETCH c3 INTO cr3;
"
"
"
"                    IF c3%FOUND THEN
"
"                       v_exp := v_exp||' Duplicate From size exists.';
"
"                    END IF;
"
"
"
"                 CLOSE c3;
"
"
"
"                 IF cr1.gcmed_data1 IS NULL THEN
"
"                    v_exp := v_exp||' From size should not be null.';
"
"                 END IF;
"
"
"
"                 IF cr1.gcmed_data1 <0 THEN
"
"               v_exp := v_exp||' From size should not be negative.';
"
"                 END IF;
"
"
"
"                 /*IF cr1.gcmed_data1 BETWEEN cr1.gcmed_data1 AND cr1.gcmed_data2 THEN
"
"                   v_exp := v_exp||' From size should be greater than previous to size.';
"
"                 END IF;*/
"
"
"
"                 IF cr1.gcmed_data2 IS NULL THEN
"
"                    v_exp := v_exp||' To size should not be null.';
"
"                 END IF;
"
"
"
"                 IF cr1.gcmed_data2 <0 THEN
"
"               v_exp := v_exp||' To size should not be negative.';
"
"                 END IF;
"
"
"
"                 IF cr1.gcmed_data3 IS NULL THEN
"
"                    v_exp := v_exp||' Round off. should not be null.';
"
"                 END IF;
"
"
"
"                 IF cr1.gcmed_data3 <0 THEN
"
"               v_exp := v_exp||' Round off. should not be negative.';
"
"                 END IF;
"
"
"
"                 IF cr1.gcmed_data1 IS NOT NULL THEN
"
"
"
"                    proc_chk_excep_special_char(cr1.gcmed_data1,
"
"                                                v_spec_char);
"
"
"
"                    IF v_spec_char = 'Y' THEN
"
"                       NULL;
"
"                       --v_exp := v_exp||' Special Characters not allowed.';
"
"                    END IF;
"
"
"
"                 END IF;
"
"
"
"                 IF v_exp IS NOT NULL THEN
"
"
"
"                    UPDATE gpi_config_mig_excep_dtls
"
"                       SET gcmed_ref      = LTRIM(v_exp,' '),
"
"                           gcmed_exp_flag = 'Y'
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_seq_no   = cr1.gcmed_seq_no;
"
"
"
"                    v_result := 'Y';
"
"
"
"                 END IF;
"
"
"
"              END LOOP c1;
"
"
"
"           END IF;
"
"
"
"       p_res := v_result;
"
"     END proc_chk_excep_gpi_cfg_mig;
"
"
"
"    PROCEDURE proc_upload_gpi_cfg_mig(p_bu            VARCHAR2,
"
"                                      p_type        VARCHAR2,
"
"                                      p_dir            VARCHAR2,
"
"                                      p_file_name    VARCHAR2,
"
"                                      p_user        VARCHAR2,
"
"                                      p_res        OUT    VARCHAR2
"
"                                      )
"
"
"
"     IS
"
"     CURSOR c1
"
"         IS
"
"     SELECT table_name
"
"       FROM user_tables
"
"      WHERE table_name = 'TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"
"
"     CURSOR c2
"
"         IS
"
"     SELECT COUNT(*) v_cnt
"
"       FROM gpi_config_mig_excep_dtls
"
"      WHERE gcmed_bu   = p_bu
"
"        AND gcmed_type = p_type;
"
"
"
"        cr1            c1%ROWTYPE;
"
"        cr2            c2%ROWTYPE;
"
"        v_result        VARCHAR2(1) := 'N';
"
"        v_exp_flag        VARCHAR2(1) := 'N';
"
"
"
"     BEGIN
"
"
"
"        DELETE gpi_config_mig_excep_dtls
"
"         WHERE gcmed_bu   = p_bu
"
"           AND gcmed_type = p_type;
"
"
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"
"
"           IF c1%FOUND THEN
"
"              EXECUTE IMMEDIATE 'DROP TABLE TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"           END IF;
"
"
"
"        CLOSE c1;
"
"
"
"
"
"        EXECUTE IMMEDIATE 'CREATE TABLE temp_config_mig_excep_dtls(tcmed_data1    VARCHAR2(500),
"
"                                      tcmed_data2    VARCHAR2(500),
"
"                                      tcmed_data3    VARCHAR2(500),
"
"                                      tcmed_data4    VARCHAR2(500),
"
"                                      tcmed_data5    VARCHAR2(500),
"
"                                      tcmed_data6    VARCHAR2(500),
"
"                                      tcmed_date7    VARCHAR2(500),
"
"                                      tcmed_data8    VARCHAR2(500),
"
"                                      tcmed_data9    VARCHAR2(500))
"
"                  ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                      ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                 SKIP 1
"
"                                 FIELDS TERMINATED BY ''|''
"
"                                 MISSING FIELD VALUES ARE NULL
"
"                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                (tcmed_data1    CHAR(255),
"
"                             tcmed_data2    CHAR(255),
"
"                             tcmed_data3    CHAR(255),
"
"                             tcmed_data4    CHAR(255),
"
"                             tcmed_data5     CHAR(255),
"
"                             tcmed_data6     CHAR(255),
"
"                             tcmed_date7     CHAR(255),
"
"                             tcmed_data8     CHAR(255),
"
"                             tcmed_data9     CHAR(255)
"
"                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"        EXECUTE IMMEDIATE 'INSERT INTO gpi_config_mig_excep_dtls (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                           ROWNUM,
"
"                                           tcmed_data1,
"
"                                           tcmed_data2 ,
"
"                                           tcmed_data3 ,
"
"                                           tcmed_data4 ,
"
"                                           tcmed_data5 ,
"
"                                           tcmed_data6 ,
"
"                                           tcmed_date7 ,
"
"                                           tcmed_data8 ,
"
"                                           tcmed_data9 ,
"
"                                           NULL,'
"
"                                           || CHR(39) || p_type || CHR(39) ||','
"
"                                           || CHR(39) || v_exp_flag || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||',
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL
"
"                                              FROM temp_config_mig_excep_dtls)';
"
"
"
"        EXECUTE IMMEDIATE 'DROP TABLE temp_config_mig_excep_dtls';
"
"
"
"        UPDATE gpi_config_mig_excep_dtls
"
"           SET gcmed_data1 = TRIM(gcmed_data1),
"
"              gcmed_data2 = TRIM(gcmed_data2),
"
"              gcmed_data3 = TRIM(gcmed_data3),
"
"              gcmed_data4 = TRIM(gcmed_data4),
"
"              gcmed_data5 = TRIM(gcmed_data5),
"
"              gcmed_data6 = TRIM(gcmed_data6),
"
"              gcmed_date7 = TRIM(gcmed_date7),
"
"              gcmed_data8 = TRIM(gcmed_data8),
"
"              gcmed_data9 = TRIM(gcmed_data9)
"
"         WHERE gcmed_bu   = p_bu
"
"           AND gcmed_type = p_type;
"
"
"
"        UPDATE gpi_config_mig_excep_dtls
"
"           SET gcmed_data1 = UPPER(gcmed_data1),
"
"              gcmed_data2 = UPPER(gcmed_data2),
"
"              gcmed_data3 = UPPER(gcmed_data3),
"
"              gcmed_data4 = UPPER(gcmed_data4),
"
"              gcmed_data5 = UPPER(gcmed_data5),
"
"              gcmed_data6 = UPPER(gcmed_data6),
"
"              gcmed_date7 = UPPER(gcmed_date7),
"
"              gcmed_data8 = UPPER(gcmed_data8),
"
"              gcmed_data9 = UPPER(gcmed_data9)
"
"         WHERE gcmed_bu   = p_bu
"
"           AND gcmed_type = p_type;
"
"
"
"        UPDATE gpi_config_mig_excep_dtls
"
"           SET gcmed_data2 = CASE WHEN p_type IN ('SP', 'CC', 'MK', 'CT', 'CL','LT','RS','ED') THEN NULL ELSE gcmed_data2 END,
"
"               gcmed_data3 = CASE WHEN p_type IN ('GF', 'SP', 'CC', 'MK', 'CT','CL','LT','RS','ED','GL','PT') THEN NULL ELSE gcmed_data3 END,
"
"              gcmed_data4 = CASE WHEN p_type IN ('GF', 'SP', 'MK', 'CT', 'CL','LT','RS','ED','GL','PT') THEN NULL ELSE gcmed_data4 END,
"
"              gcmed_data5 = CASE WHEN p_type IN ('GF', 'SP', 'CC', 'MK', 'CT','CL','LT','RS','ED','GL','PT') THEN NULL ELSE gcmed_data5 END,
"
"              gcmed_data6 = CASE WHEN p_type IN ('GF', 'SP', 'CC', 'MK', 'CT','CL','LT','RS','ED','GL','PT') THEN NULL ELSE gcmed_data6 END,
"
"              gcmed_date7 = CASE WHEN p_type IN ('GF', 'SP', 'CC', 'MK', 'CT','CL','LT','RS','ED','GL','PT') THEN NULL ELSE gcmed_date7 END,
"
"              gcmed_data8 = CASE WHEN p_type IN ('GF', 'SP', 'CC', 'MK', 'CT','CL','LT','RS','ED','GL','PT') THEN NULL ELSE gcmed_data8 END,
"
"              gcmed_data9 = CASE WHEN p_type IN ('GF', 'SP', 'CC', 'MK', 'CT','CL','LT','RS','ED','GL','PT') THEN NULL ELSE gcmed_data9 END
"
"         WHERE gcmed_bu   = p_bu
"
"           AND gcmed_type = p_type;
"
"
"
"        OPEN c2;
"
"        FETCH c2 INTO cr2;
"
"
"
"           IF cr2.v_cnt = 0 THEN
"
"              v_result := 'N';
"
"           ELSE
"
"              v_result := 'Y';
"
"           END IF;
"
"
"
"        CLOSE c2;
"
"
"
"        p_res := v_result;
"
"
"
"    END proc_upload_gpi_cfg_mig;
"
"
"
"    PROCEDURE proc_ins_gpi_cfg_mig(p_bu           VARCHAR2,
"
"                             p_type         VARCHAR2,
"
"                             p_user         VARCHAR2,
"
"                             p_res      OUT VARCHAR2)
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM gpi_config_mig_excep_dtls
"
"     WHERE gcmed_bu       = p_bu
"
"       AND gcmed_type     = p_type
"
"       AND gcmed_exp_flag = 'N';
"
"
"
"    CURSOR c2(c_gls_fmly  VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_gls_fmly
"
"     WHERE ggf_bu        = p_bu
"
"       AND ggf_fmly_name = c_gls_fmly;
"
"
"
"       cr2   c2%ROWTYPE;
"
"
"
"    CURSOR c3(c_shape  VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM prod_shapes
"
"     WHERE ps_bu         = p_bu
"
"       AND ps_shape_desc = c_shape;
"
"
"
"       cr3   c3%ROWTYPE;
"
"
"
"    CURSOR c4(c_make_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM product_make
"
"     WHERE pm_bu        = p_bu
"
"       AND pm_mak_desc1 = c_make_desc;
"
"
"
"       cr4   c4%ROWTYPE;
"
"
"
"    CURSOR c5(c_content_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_cavty_cont
"
"     WHERE gcc_bu        = p_bu
"
"       AND gcc_cont_desc = c_content_desc;
"
"
"
"       cr5   c5%ROWTYPE;
"
"
"
"    CURSOR c6(c_coat_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_coating
"
"     WHERE gc_bu        = p_bu
"
"       AND gc_coat_desc = c_coat_desc;
"
"
"
"       cr6   c6%ROWTYPE;
"
"
"
"    CURSOR c7(c_color_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gar_colors
"
"     WHERE gcolor_bu   = p_bu
"
"       AND gcolor_name = c_color_desc;
"
"
"
"       cr7    c7%ROWTYPE;
"
"
"
"    CURSOR c8(c_lyr_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gpi_pvt_lyr_type
"
"     WHERE gplt_bu       = p_bu
"
"       AND gplt_lyr_desc = c_lyr_desc;
"
"
"
"       cr8    c8%ROWTYPE;
"
"
"
"    CURSOR c9(c_reason_desc      VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gls_pi_cncl_reasons
"
"     WHERE gpcr_bu          = p_bu
"
"       AND gpcr_reason_desc = c_reason_desc;
"
"
"
"       cr9    c9%ROWTYPE;
"
"
"
"    CURSOR c10(c_edge_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM gls_ew_types
"
"     WHERE get_bu           = p_bu
"
"       AND get_ew_type_desc = c_edge_desc;
"
"
"
"      cr10    c10%ROWTYPE;
"
"
"
"    CURSOR c11(c_glass_desc       VARCHAR2)
"
"        IS
"
"    SELECT *
"
"       FROM gpi_glass
"
"      WHERE gg_bu        = p_bu
"
"        AND gg_glass_desc    = c_glass_desc;
"
"
"
"       cr11 c11%ROWTYPE;
"
"
"
"     CURSOR c12(c_pvb_thickness   VARCHAR2)
"
"        IS
"
"     SELECT *
"
"        FROM gpi_pvb_thkness
"
"       WHERE gpt_bu        = p_bu
"
"         AND gpt_thkness    = c_pvb_thickness;
"
"
"
"         cr12 c12%ROWTYPE;
"
"
"
"      CURSOR c13(c_cav_thkness    VARCHAR2)
"
"         IS
"
"      SELECT *
"
"         FROM gpi_dg_cvty_thkness
"
"        WHERE gdct_bu    = p_bu
"
"          AND gdct_thkness    = c_cav_thkness;
"
"
"
"          cr13 c13%ROWTYPE;
"
"
"
"      CURSOR c14(c_chrg_all       VARCHAR2)
"
"         IS
"
"      SELECT *
"
"         FROM gpi_chrg_allow
"
"        WHERE gca_bu    = p_bu
"
"          AND gca_thkness    = c_chrg_all;
"
"
"
"          cr14 c14%ROWTYPE;
"
"
"
"      CURSOR c15(c_proc_type           VARCHAR2)
"
"         IS
"
"       SELECT *
"
"             FROM gpi_glass_proc_types
"
"            WHERE ggpt_bu        = p_bu
"
"           AND ggpt_type_desc   = c_proc_type;
"
"
"
"          cr15 c15%ROWTYPE;
"
"
"
"       CURSOR c16(c_cut_all     VARCHAR2)
"
"          IS
"
"        SELECT *
"
"            FROM gpi_gls_cut_allow
"
"           WHERE ggca_bu    = p_bu
"
"          AND ggca_thkness    = c_cut_all;
"
"
"
"           cr16 c16%ROWTYPE;
"
"
"
"       CURSOR c_round
"
"          IS
"
"       SELECT *
"
"         FROM gls_rndoff_calc_hd
"
"        WHERE grch_bu = p_bu
"
"          AND (TRUNC(SYSDATE) BETWEEN grch_eff_from AND grch_eff_to)
"
"          AND grch_status = 'N';
"
"
"
"          cr_round c_round%ROWTYPE;
"
"
"
"       v_cre_type     VARCHAR2(1) := 'M';
"
"       v_fmly_id      VARCHAR2(10);
"
"       v_shape_id     VARCHAR2(10);
"
"       v_make_id      VARCHAR2(10);
"
"       v_content_id   VARCHAR2(10);
"
"       v_coat_id      VARCHAR2(10);
"
"       v_color_id     VARCHAR2(10);
"
"       v_layer_id     VARCHAR2(10);
"
"       v_reason_id    VARCHAR2(10);
"
"       v_edge_id      VARCHAR2(10);
"
"       v_gls_id      VARCHAR2(10);
"
"       v_pvb_thk      VARCHAR2(10);
"
"       v_cav_thk      VARCHAR2(10);
"
"       v_chrg_all      VARCHAR2(10);
"
"       v_cut_all      VARCHAR2(10);
"
"       v_proc_type      VARCHAR2(10);
"
"       v_size_frm      NUMBER;
"
"
"
"       v_res  VARCHAR2(1) := 'N';
"
"
"
"        /*Round Off*/
"
"
"
"        PROCEDURE proc_ins_round_off
"
"        (
"
"        p_bu        VARCHAR2,
"
"        p_doc_no    VARCHAR2,
"
"        p_type        VARCHAR2 DEFAULT 'RO',
"
"        p_user         VARCHAR2,
"
"        p_res   OUT VARCHAR2
"
"        )
"
"        IS
"
"        CURSOR c_temp
"
"           IS
"
"        SELECT *
"
"          FROM gpi_config_mig_excep_dtls
"
"         WHERE gcmed_bu       = p_bu
"
"           AND gcmed_type     = p_type
"
"           AND gcmed_exp_flag = 'N';
"
"
"
"        CURSOR c_rnd_off(c_size_frm NUMBER)
"
"           IS
"
"        SELECT *
"
"          FROM gls_rndoff_calc_ln
"
"         WHERE grcl_bu    = p_bu
"
"           AND grcl_size_fm    = c_size_frm;
"
"
"
"           cr_rnd_off c_rnd_off%ROWTYPE;
"
"
"
"           v_seq_no NUMBER := 0;
"
"           v_result    VARCHAR2(1) := 'N';
"
"
"
"        BEGIN
"
"
"
"            DELETE gls_rndoff_calc_ln
"
"             WHERE grcl_bu = p_bu
"
"               AND grcl_doc_no = p_doc_no;
"
"
"
"            FOR cr_temp IN c_temp
"
"            LOOP
"
"
"
"                v_seq_no := v_seq_no + 1;
"
"
"
"                --RAISE_APPLICATION_ERROR(-20999,'HRM'||'~'||v_seq_no);
"
"
"
"                INSERT INTO gls_rndoff_calc_ln(
"
"                                grcl_bu         ,
"
"                                grcl_doc_no     ,
"
"                                grcl_seq_no     ,
"
"                                grcl_size_fm    ,
"
"                                grcl_size_to    ,
"
"                                grcl_rndoff_size,
"
"                                grcl_cre_by     ,
"
"                                grcl_cre_date
"
"                                )
"
"                             VALUES(
"
"                                p_bu         ,
"
"                                p_doc_no     ,
"
"                                v_seq_no     ,
"
"                                cr_temp.gcmed_data1    ,
"
"                                cr_temp.gcmed_data2    ,
"
"                                cr_temp.gcmed_data3,
"
"                                p_user     ,
"
"                                SYSDATE
"
"                                );
"
"
"
"
"
"            END LOOP c_temp;
"
"
"
"            v_result := 'Y';
"
"
"
"           DELETE gpi_config_mig_excep_dtls
"
"            WHERE gcmed_bu       = p_bu
"
"              AND gcmed_type     = p_type
"
"              AND gcmed_exp_flag = 'N';
"
"
"
"        END proc_ins_round_off;
"
"
"
"
"
"    BEGIN
"
"
"
"       /*****Glass Family*****/
"
"
"
"       IF p_type = 'GF' THEN
"
"
"
"          v_res := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             SELECT MAX(ggf_fmly_id)
"
"               INTO v_fmly_id
"
"               FROM gpi_gls_fmly
"
"              WHERE ggf_bu = p_bu;
"
"
"
"             v_fmly_id := func_get_next_id(v_fmly_id);
"
"
"
"             INSERT INTO gpi_gls_fmly (ggf_bu         ,
"
"                       ggf_fmly_id    ,
"
"                       ggf_fmly_name  ,
"
"                       ggf_cre_by     ,
"
"                       ggf_cre_date   ,
"
"                       ggf_upd_by     ,
"
"                       ggf_upd_date)
"
"                 VALUES      (
"
"                       p_bu          ,
"
"                       v_fmly_id        ,
"
"                       cr1.gcmed_data1,
"
"                       p_user         ,
"
"                       SYSDATE          ,
"
"                       NULL        ,
"
"                       NULL
"
"                       );
"
"
"
"             v_res := 'Y';
"
"
"
"          END LOOP c1;
"
"
"
"            DELETE  FROM gpi_config_mig_excep_dtls
"
"                WHERE gcmed_bu       = p_bu
"
"                  AND gcmed_type     = p_type
"
"                  AND gcmed_exp_flag = 'N';
"
"
"
"       END IF;
"
"
"
"       /*****Shape*****/
"
"
"
"       IF p_type = 'SP' THEN
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               SELECT MAX(ps_shape_id)
"
"                 INTO v_shape_id
"
"                 FROM prod_shapes
"
"                WHERE ps_bu = p_bu;
"
"
"
"               v_shape_id := func_get_next_id(v_shape_id);
"
"
"
"               INSERT INTO prod_shapes (    ps_bu         ,
"
"                        ps_shape_id    ,
"
"                        ps_shape_desc  ,
"
"                        ps_cre_by     ,
"
"                        ps_cre_date   ,
"
"                        ps_upd_by     ,
"
"                        ps_upd_date
"
"                        )
"
"                    VALUES( p_bu       ,
"
"                        v_shape_id  ,
"
"                        cr1.gcmed_data1,
"
"                        p_user       ,
"
"                        SYSDATE    ,
"
"                        NULL  ,
"
"                        NULL
"
"                        );
"
"               v_res := 'Y';
"
"            END LOOP c1;
"
"            DELETE  FROM gpi_config_mig_excep_dtls
"
"                 WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"
"
"
"
"
"
"       p_res := v_res;
"
"
"
"     /*****Product Make *****/
"
"
"
"       IF p_type = 'MK' THEN
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               SELECT MAX(pm_mak_id)
"
"                 INTO v_make_id
"
"                 FROM product_make
"
"                WHERE pm_bu = p_bu;
"
"
"
"               v_make_id := func_get_next_id(v_make_id);
"
"
"
"               INSERT INTO   product_make ( pm_bu         ,
"
"                        pm_mak_id    ,
"
"                        pm_mak_desc1  ,
"
"                        pm_mak_desc2     ,
"
"                        pm_cre_by,
"
"                        pm_cre_date   ,
"
"                        pm_upd_by     ,
"
"                        pm_upd_date
"
"                        )
"
"                    VALUES( p_bu       ,
"
"                        v_make_id  ,
"
"                        cr1.gcmed_data1,
"
"                        NULL,
"
"                        p_user       ,
"
"                        SYSDATE    ,
"
"                        NULL  ,
"
"                        NULL
"
"                        );
"
"               v_res := 'Y';
"
"            END LOOP c1;
"
"            DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"       p_res := v_res;
"
"
"
"    /*****Cavity Content *****/
"
"
"
"       IF p_type = 'CC' THEN
"
"
"
"            v_res := 'N';
"
"    --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_res||'/'||p_type);
"
"            FOR cr1 IN c1
"
"            LOOP
"
"        --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_res||'/'||p_type);
"
"               SELECT MAX(gcc_cont_id)
"
"                 INTO v_content_id
"
"                 FROM gpi_cavty_cont
"
"                WHERE gcc_bu = p_bu;
"
"
"
"               v_content_id := func_get_next_id(v_content_id);
"
"
"
"               INSERT INTO gpi_cavty_cont ( gcc_bu         ,
"
"                        gcc_cont_id    ,
"
"                        gcc_cont_desc  ,
"
"                        gcc_cre_by     ,
"
"                        gcc_cre_date   ,
"
"                        gcc_upd_by     ,
"
"                        gcc_upd_date
"
"                        )
"
"                    VALUES( p_bu       ,
"
"                        v_content_id  ,
"
"                        cr1.gcmed_data1,
"
"                        p_user       ,
"
"                        SYSDATE    ,
"
"                        NULL  ,
"
"                        NULL
"
"                        );
"
"               v_res := 'Y';
"
"            END LOOP c1;
"
"            DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"       p_res := v_res;
"
"
"
"       /*****Coating*****/
"
"
"
"       IF p_type = 'CT' THEN
"
"
"
"          v_res := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             SELECT MAX(gc_coat_id)
"
"               INTO v_coat_id
"
"               FROM gpi_coating
"
"              WHERE gc_bu = p_bu;
"
"
"
"             v_coat_id := func_get_next_id(v_coat_id);
"
"
"
"             INSERT INTO gpi_coating (gc_bu         ,
"
"                      gc_coat_id    ,
"
"                      gc_coat_desc  ,
"
"                      gc_deflt_flag,
"
"                      gc_cre_by     ,
"
"                      gc_cre_date   ,
"
"                      gc_upd_by     ,
"
"                      gc_upd_date
"
"                      )
"
"                VALUES( p_bu       ,
"
"                    v_coat_id  ,
"
"                    cr1.gcmed_data1,
"
"                    'N',
"
"                    p_user       ,
"
"                    SYSDATE    ,
"
"                    NULL  ,
"
"                    NULL
"
"                    );
"
"             v_res := 'Y';
"
"          END LOOP c1;
"
"           DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"
"
"     /*****COLOR*****/
"
"
"
"       IF p_type = 'CL' THEN
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               SELECT MAX(gcolor_id)
"
"                 INTO v_color_id
"
"                 FROM gar_colors
"
"                WHERE gcolor_bu = p_bu;
"
"
"
"               v_color_id := func_get_next_id(v_color_id);
"
"
"
"               INSERT INTO gar_colors     (
"
"                            gcolor_bu,
"
"                        gcolor_id,
"
"                        gcolor_name,
"
"                        gcolor_color_flag,
"
"                        gcolor_name2,
"
"                        gcolor_cre_by,
"
"                        gcolor_cre_date,
"
"                        gcolor_upd_by,
"
"                        gcolor_upd_date,
"
"                        gcolor_add_hgt_mm,
"
"                        gcolor_add_wid_mm
"
"                                )
"
"                    VALUES( p_bu       ,
"
"                        v_color_id  ,
"
"                        cr1.gcmed_data1,
"
"                        'N',
"
"                        NULL,
"
"                        p_user       ,
"
"                        SYSDATE    ,
"
"                        NULL  ,
"
"                        NULL,
"
"                        0,
"
"                        0
"
"                        );
"
"        v_res := 'Y';
"
"            END LOOP c1;
"
"             DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"       p_res := v_res;
"
"
"
"    /*****LAYER TYPE*****/
"
"
"
"       IF p_type = 'LT' THEN
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               SELECT MAX(gplt_lyr_id)
"
"                 INTO v_layer_id
"
"                 FROM gpi_pvt_lyr_type
"
"                WHERE gplt_bu = p_bu;
"
"
"
"               v_layer_id := func_get_next_id(v_layer_id);
"
"
"
"               INSERT INTO gpi_pvt_lyr_type (gplt_bu,
"
"                         gplt_lyr_id,
"
"                         gplt_lyr_desc,
"
"                         gplt_cre_by,
"
"                         gplt_cre_date,
"
"                         gplt_upd_by,
"
"                         gplt_upd_date
"
"                         )
"
"                            VALUES    (p_bu       ,
"
"                        v_layer_id  ,
"
"                        cr1.gcmed_data1,
"
"                        p_user       ,
"
"                        SYSDATE    ,
"
"                        NULL  ,
"
"                        NULL
"
"                        );
"
"               v_res := 'Y';
"
"            END LOOP c1;
"
"             DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"       p_res := v_res;
"
"
"
"    /*****Reason*****/
"
"
"
"       IF p_type = 'RS' THEN
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               SELECT MAX(gplt_lyr_id)
"
"                 INTO v_layer_id
"
"                 FROM gpi_pvt_lyr_type
"
"                WHERE gplt_bu = p_bu;
"
"
"
"               v_layer_id := func_get_next_id(v_layer_id);
"
"
"
"               INSERT INTO gls_pi_cncl_reasons (    gpcr_bu,
"
"                            gpcr_reason_id,
"
"                            gpcr_reason_desc,
"
"                            gpcr_cre_by,
"
"                            gpcr_cre_date,
"
"                            gpcr_upd_by,
"
"                            gpcr_upd_date
"
"                            )
"
"                        VALUES( p_bu       ,
"
"                            v_reason_id  ,
"
"                            cr1.gcmed_data1,
"
"                            p_user       ,
"
"                            SYSDATE    ,
"
"                            NULL  ,
"
"                            NULL
"
"                            );
"
"               v_res := 'Y';
"
"            END LOOP c1;
"
"             DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"       p_res := v_res;
"
"
"
"    /************Edging**************/
"
"
"
"       IF p_type = 'ED' THEN
"
"
"
"            v_res := 'N';
"
"
"
"            FOR cr1 IN c1
"
"            LOOP
"
"
"
"               SELECT MAX(get_ew_type_id)
"
"                 INTO v_edge_id
"
"                 FROM gls_ew_types
"
"                WHERE get_bu = p_bu;
"
"
"
"               v_edge_id := func_get_next_id(v_edge_id);
"
"
"
"               INSERT INTO gls_ew_types (    get_bu,
"
"                        get_ew_type_id,
"
"                        get_ew_type_desc,
"
"                        get_cre_by,
"
"                        get_cre_date,
"
"                        get_upd_by,
"
"                        get_upd_date
"
"                        )
"
"                    VALUES( p_bu       ,
"
"                        v_edge_id  ,
"
"                        cr1.gcmed_data1,
"
"                        p_user       ,
"
"                        SYSDATE    ,
"
"                        NULL  ,
"
"                        NULL
"
"                        );
"
"               v_res := 'Y';
"
"            END LOOP c1;
"
"             DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"       p_res := v_res;
"
"
"
"     /*****Glass*****/
"
"
"
"       IF p_type = 'GL' THEN
"
"
"
"          v_res := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"         v_gls_id := NULL;
"
"
"
"             SELECT MAX(gg_glass_id)
"
"               INTO v_gls_id
"
"               FROM gpi_glass
"
"              WHERE gg_bu = p_bu;
"
"
"
"             v_gls_id := func_get_next_id(v_gls_id);
"
"
"
"             OPEN c2(cr1.gcmed_data2);
"
"         FETCH c2 INTO cr2;
"
"
"
"            IF c2%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20999, 'HRM'||cr1.gcmed_data2);
"
"            ELSE
"
"               v_fmly_id := cr2.ggf_fmly_id;
"
"            END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             INSERT INTO gpi_glass(
"
"                    gg_bu          ,
"
"                    gg_glass_id    ,
"
"                    gg_glass_desc  ,
"
"                    gg_cre_by      ,
"
"                    gg_cre_date    ,
"
"                    gg_upd_by      ,
"
"                    gg_upd_date    ,
"
"                    gg_deflt_flag  ,
"
"                    gg_fmly_id
"
"                    )
"
"                     VALUES(p_bu           ,
"
"                            v_gls_id       ,
"
"                            cr1.gcmed_data1,
"
"                            p_user           ,
"
"                            SYSDATE           ,
"
"                            NULL           ,
"
"                            NULL           ,
"
"                            'N'           ,
"
"                            v_fmly_id
"
"                            );
"
"
"
"             v_res := 'Y';
"
"
"
"          END LOOP c1;
"
"          DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"       END IF;
"
"      p_res := v_res;
"
"      /************PVB THICKESS**************/
"
"
"
"         IF p_type = 'PT' THEN
"
"
"
"              v_res := 'N';
"
"
"
"              FOR cr1 IN c1
"
"              LOOP
"
"
"
"                 INSERT INTO gpi_pvb_thkness (
"
"                        gpt_bu         ,
"
"                        gpt_thkness    ,
"
"                        gpt_cre_by     ,
"
"                        gpt_cre_date   ,
"
"                        gpt_upd_by     ,
"
"                        gpt_upd_date
"
"                        )
"
"                    VALUES( p_bu       ,
"
"                        cr1.gcmed_data1,
"
"                        p_user       ,
"
"                        SYSDATE    ,
"
"                        NULL  ,
"
"                        NULL
"
"                        );
"
"                 v_res := 'Y';
"
"              END LOOP c1;
"
"               DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                           AND gcmed_exp_flag = 'N';
"
"         END IF;
"
"       p_res := v_res;
"
"
"
"     /************Cavity THICKESS**************/
"
"
"
"          IF p_type = 'CV' THEN
"
"
"
"               v_res := 'N';
"
"
"
"               FOR cr1 IN c1
"
"               LOOP
"
"
"
"                  INSERT INTO gpi_dg_cvty_thkness  (
"
"                            gdct_bu        ,
"
"                            gdct_thkness   ,
"
"                            gdct_cre_by    ,
"
"                            gdct_cre_date,
"
"                            gdct_upd_by    ,
"
"                            gdct_upd_date
"
"                            )
"
"                        VALUES  (
"
"                            p_bu       ,
"
"                            cr1.gcmed_data1,
"
"                            p_user       ,
"
"                            SYSDATE    ,
"
"                            NULL  ,
"
"                            NULL
"
"                            );
"
"                  v_res := 'Y';
"
"               END LOOP c1;
"
"                DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                           AND gcmed_exp_flag = 'N';
"
"          END IF;
"
"       p_res := v_res;
"
"
"
"     /************Charge Allowance**************/
"
"
"
"          IF p_type = 'CA' THEN
"
"
"
"               v_res := 'N';
"
"
"
"               FOR cr1 IN c1
"
"               LOOP
"
"
"
"                       INSERT INTO gpi_chrg_allow  (
"
"                            gca_bu         ,
"
"                            gca_thkness    ,
"
"                            gca_add_wid    ,
"
"                            gca_add_hgt    ,
"
"                            gca_cre_by     ,
"
"                            gca_cre_date   ,
"
"                            gca_upd_by     ,
"
"                            gca_upd_date
"
"                            )
"
"                        VALUES  (
"
"                            p_bu           ,
"
"                            cr1.gcmed_data1,
"
"                            cr1.gcmed_data2,
"
"                            cr1.gcmed_data3,
"
"                            p_user         ,
"
"                            SYSDATE        ,
"
"                            NULL           ,
"
"                            NULL
"
"                            );
"
"                  v_res := 'Y';
"
"               END LOOP c1;
"
"                DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                       AND gcmed_type     = p_type
"
"                           AND gcmed_exp_flag = 'N';
"
"          END IF;
"
"       p_res := v_res;
"
"
"
"      /*****Cutting Allowance *****/
"
"
"
"        IF p_type = 'CUA' THEN
"
"
"
"           v_res := 'N';
"
"
"
"           FOR cr1 IN c1
"
"           LOOP
"
"
"
"         v_cut_all := NULL;
"
"
"
"              SELECT MAX(ggca_gls_proc_type)
"
"                INTO v_cut_all
"
"                FROM gpi_gls_cut_allow
"
"               WHERE ggca_bu = p_bu;
"
"
"
"              v_cut_all := func_get_next_id(v_cut_all);
"
"
"
"              OPEN c15(cr1.gcmed_data2);
"
"         FETCH c15 INTO cr15;
"
"
"
"            IF c15%NOTFOUND THEN
"
"               RAISE_APPLICATION_ERROR(-20999, 'HRM'||cr1.gcmed_data2);
"
"            ELSE
"
"               v_proc_type := cr15.ggpt_type_id;
"
"            END IF;
"
"
"
"              CLOSE c15;
"
"
"
"              INSERT INTO GPI_GLS_CUT_ALLOW(
"
"                        ggca_bu             ,
"
"                        ggca_thkness        ,
"
"                        ggca_gls_proc_type  ,
"
"                        ggca_cut_allw       ,
"
"                        ggca_cre_by         ,
"
"                        ggca_cre_date       ,
"
"                        ggca_upd_by         ,
"
"                        ggca_upd_date
"
"                        )
"
"                     VALUES(p_bu                   ,
"
"                        cr1.gcmed_data1        ,
"
"                        v_proc_type         ,
"
"                        cr1.gcmed_data3     ,
"
"                        p_user                ,
"
"                        SYSDATE                ,
"
"                        NULL                ,
"
"                        NULL
"
"                        );
"
"
"
"              v_res := 'Y';
"
"
"
"           END LOOP c1;
"
"           DELETE  FROM gpi_config_mig_excep_dtls
"
"                     WHERE gcmed_bu       = p_bu
"
"                   AND gcmed_type     = p_type
"
"                       AND gcmed_exp_flag = 'N';
"
"        END IF;
"
"      p_res := v_res;
"
"
"
"        OPEN c_round;
"
"        FETCH c_round INTO cr_round;
"
"
"
"        IF c_round%FOUND THEN
"
"
"
"            proc_ins_round_off
"
"            (
"
"            p_bu,
"
"            cr_round.grch_doc_no,
"
"            'RO',
"
"            p_user ,
"
"            v_res
"
"            );
"
"
"
"        END IF;
"
"
"
"        CLOSE c_round;
"
"
"
"       p_res := v_res;
"
"
"
"    END proc_ins_gpi_cfg_mig;
"
"
"
"    PROCEDURE proc_upload_speci
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name    VARCHAR2,
"
"     p_user            VARCHAR2,
"
"     p_spec        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'NAD_DATA_SPEC_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'V';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE NAD_DATA_SPEC_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'V';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE NAD_DATA_SPEC_TEMP (
"
"                                        NDS_DATA_SPEC_DESC    VARCHAR2(100)
"
"                                       )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             NDS_DATA_SPEC_DESC                  CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO mchn_proc_param_exception (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL       ,
"
"                                           NULL       ,
"
"                                           NULL         ,
"
"                                           NULL          ,
"
"                                           NULL     ,
"
"                                           nds_data_spec_desc ,
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL,'
"
"                                           ||CHR(39) || 'V' || CHR(39)||','
"
"                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL,'
"
"                                           ||CHR(39) || p_user || CHR(39)||','||'
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL,
"
"                                           NULL
"
"                                          FROM NAD_DATA_SPEC_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE NAD_DATA_SPEC_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"    p_spec := v_result;
"
"
"
"    END proc_upload_speci;
"
"
"
"    PROCEDURE proc_chk_speci
"
"    (
"
"     p_bu    VARCHAR2,
"
"     p_user  VARCHAR2,
"
"     p_spec   OUT VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"       IS
"
"    SELECT *
"
"    FROM mchn_proc_param_exception
"
"    WHERE mppe_bu = p_bu
"
"    AND   mppe_sel_user = p_user
"
"    AND   mppe_doc_type = 'V'
"
"    AND   mppe_status = 'N';
"
"
"
"    CURSOR c3
"
"       IS
"
"    SELECT mppe_bu,
"
"           mppe_param_desc,
"
"           COUNT(*)
"
"    FROM mchn_proc_param_exception
"
"    WHERE mppe_bu = p_bu
"
"    AND   mppe_sel_user = p_user
"
"    AND   mppe_doc_type = 'V'
"
"    AND   mppe_status = 'N'
"
"    GROUP BY mppe_bu,
"
"           mppe_param_desc
"
"    HAVING COUNT(*) > 1;
"
"
"
"    CURSOR c4 (c_desc VARCHAR2)
"
"    IS
"
"    SELECT *
"
"      FROM nad_data_spec
"
"     WHERE nds_bu                = p_bu
"
"       AND nds_data_spec_desc    =  c_desc;
"
"
"
"    cr4    c4%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"        p_spec := 'Y';
"
"
"
"         UPDATE mchn_proc_param_exception
"
"            SET   mppe_status = 'N',
"
"                  mppe_ref = NULL,
"
"                  mppe_upd_by = p_user,
"
"                  mppe_upd_date = SYSDATE
"
"           WHERE  mppe_bu = p_bu
"
"            AND   mppe_sel_user = p_user
"
"            AND   mppe_doc_type = 'V';
"
"
"
"       FOR cr3 IN c3
"
"            LOOP
"
"
"
"                 UPDATE mchn_proc_param_exception
"
"                    SET mppe_status = 'E',
"
"                        mppe_ref = 'Duplicate Record',
"
"                        mppe_upd_by = p_user,
"
"                        mppe_upd_date = SYSDATE
"
"                  WHERE mppe_bu = p_bu
"
"                    AND mppe_param_desc = cr3.mppe_param_desc
"
"                    AND mppe_sel_user = p_user
"
"                    AND mppe_doc_type = 'V';
"
"
"
"                  p_spec := 'N';
"
"
"
"             END LOOP;
"
"
"
"       FOR cr1 in c1
"
"          LOOP
"
"
"
"            OPEN c4(cr1.mppe_param_desc);
"
"             FETCH c4 INTO cr4;
"
"               IF c4%FOUND THEN
"
"
"
"               UPDATE mchn_proc_param_exception
"
"                SET mppe_status = 'E',
"
"                    mppe_ref = 'Specification Already Exists.',
"
"                    mppe_upd_by = p_user,
"
"                    mppe_upd_date = SYSDATE
"
"                WHERE mppe_bu = p_bu
"
"                 AND  mppe_param_desc = cr4.nds_data_spec_desc
"
"                 AND  mppe_sel_user = p_user
"
"                 AND  mppe_doc_type = 'V';
"
"
"
"                  p_spec :='N';
"
"
"
"               END IF;
"
"            CLOSE C4;
"
"
"
"            IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"              UPDATE mchn_proc_param_exception
"
"                SET  mppe_status = 'E',
"
"                     mppe_ref = 'Specification must be entered',
"
"                     mppe_upd_by = p_user,
"
"                     mppe_upd_date = SYSDATE
"
"               WHERE mppe_bu = p_bu
"
"                 AND mppe_param_desc = cr1.mppe_param_desc
"
"                 AND  mppe_doc_type = 'V'
"
"                 AND  mppe_sel_user = p_user;
"
"
"
"                  p_spec :='N';
"
"
"
"            END IF;
"
"
"
"        END LOOP;
"
"        p_spec := p_spec;
"
"     END proc_chk_speci;
"
"
"
"    PROCEDURE proc_ins_speci
"
"    (
"
"    p_bu    VARCHAR2,
"
"    p_user  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"       IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_status = 'N';
"
"
"
"    v_data_spec        nad_data_spec.nds_data_spec_id%TYPE;
"
"    v_data_spec_id    nad_data_spec.nds_data_spec_id%TYPE;
"
"
"
"    BEGIN
"
"
"
"         FOR cr1 in c1
"
"         LOOP
"
"
"
"            SELECT MAX(nds_data_spec_id)
"
"               INTO v_data_spec
"
"              FROM nad_data_spec
"
"             WHERE nds_bu = p_bu;
"
"
"
"            v_data_spec_id := func_get_next_id(v_data_spec);
"
"
"
"            INSERT INTO nad_data_spec(nds_bu               ,
"
"                                      nds_data_spec_id     ,
"
"                                      nds_data_spec_desc   ,
"
"                                      nds_cre_by           ,
"
"                                      nds_cre_date
"
"                                      )
"
"                                       VALUES (p_bu      ,
"
"                                               v_data_spec_id   ,
"
"                                               cr1.mppe_param_desc   ,
"
"                                               p_user             ,
"
"                                               SYSDATE
"
"                                               );
"
"
"
"        END LOOP;
"
"
"
"        DELETE mchn_proc_param_exception
"
"         WHERE mppe_bu       = p_bu
"
"           AND mppe_sel_user = p_user
"
"           AND mppe_status   = 'N';
"
"
"
"    END proc_ins_speci;
"
"
"
"    PROCEDURE proc_upload_dwgt_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res       OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM dwgt_config_mig_excep_dtls
"
"     WHERE dcmed_bu   = p_bu;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       v_exp_flag        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"             EXECUTE IMMEDIATE 'DROP TABLE TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"       DELETE rdrp_config_mig_excep_dtls
"
"        WHERE rcmed_bu   = p_bu;
"
"
"
"       EXECUTE IMMEDIATE 'CREATE TABLE temp_config_mig_excep_dtls(tcmed_data1    VARCHAR2(500),
"
"                                                                  tcmed_data2    VARCHAR2(500))
"
"                  ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                      ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                 SKIP 1
"
"                                 FIELDS TERMINATED BY ''|''
"
"                                 MISSING FIELD VALUES ARE NULL
"
"                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                (tcmed_data1     CHAR(255),
"
"                             tcmed_data2     CHAR(255)))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"       EXECUTE IMMEDIATE 'INSERT INTO dwgt_config_mig_excep_dtls (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                           ROWNUM,
"
"                                           tcmed_data1,
"
"                                           tcmed_data2,
"
"                                           NULL,'
"
"                                           || CHR(39) || v_exp_flag || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||',
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL
"
"                                           FROM temp_config_mig_excep_dtls)';
"
"
"
"       EXECUTE IMMEDIATE 'DROP TABLE temp_config_mig_excep_dtls';
"
"
"
"       UPDATE dwgt_config_mig_excep_dtls
"
"          SET dcmed_data1 = TRIM(dcmed_data1),
"
"              dcmed_data2 = TRIM(dcmed_data2)
"
"        WHERE dcmed_bu   = p_bu;
"
"
"
"       UPDATE dwgt_config_mig_excep_dtls
"
"          SET dcmed_data1 = UPPER(dcmed_data1),
"
"              dcmed_data2 = UPPER(dcmed_data2)
"
"        WHERE dcmed_bu   = p_bu;
"
"
"
"
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_dwgt_cfg_mig;
"
"
"
"    PROCEDURE proc_chk_excep_dwgt_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM dwgt_config_mig_excep_dtls
"
"     WHERE dcmed_bu   = p_bu;
"
"
"
"
"
"    CURSOR c2(c_char        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM drawing_types
"
"     WHERE dwgt_bu = p_bu
"
"       AND dwgt_desc = c_char;
"
"
"
"
"
"    CURSOR c3(c_data        VARCHAR2)
"
"        IS
"
"    SELECT dcmed_data1
"
"      FROM dwgt_config_mig_excep_dtls
"
"     WHERE dcmed_bu    = p_bu
"
"       AND dcmed_data1 = c_data
"
"     GROUP BY dcmed_data1
"
"     HAVING COUNT(*) > 1;
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       UPDATE  dwgt_config_mig_excep_dtls
"
"          SET dcmed_ref      = NULL,
"
"          dcmed_exp_flag = 'N'
"
"        WHERE dcmed_bu     = p_bu;
"
"
"
"
"
"       /****** Drawing Type ******/
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c2(cr1.dcmed_data1);
"
"             FETCH c2 INTO cr2;
"
"
"
"                IF c2%FOUND THEN
"
"                   v_exp := v_exp ||' Drawing Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             OPEN c3(cr1.dcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Drawing exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.dcmed_data1 IS NULL THEN
"
"            v_exp := v_exp||' Drawing should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.dcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.dcmed_data1,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF cr1.dcmed_data2 IS NULL THEN
"
"                v_exp := v_exp||' Type should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.dcmed_data2 IS NOT NULL THEN
"
"
"
"             IF cr1.dcmed_data2 NOT IN ('M','S','O') THEN
"
"                v_exp := v_exp ||'Type not found.';
"
"             END IF;
"
"
"
"              END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE dwgt_config_mig_excep_dtls
"
"               SET dcmed_ref = LTRIM(v_exp,' '),
"
"                   dcmed_exp_flag = 'Y'
"
"             WHERE dcmed_bu     = p_bu
"
"                   AND dcmed_seq_no = cr1.dcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_excep_dwgt_cfg_mig;
"
"
"
"    PROCEDURE proc_ins_dwgt_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM dwgt_config_mig_excep_dtls
"
"     WHERE dcmed_bu       = p_bu
"
"       AND dcmed_exp_flag = 'N';
"
"
"
"    CURSOR c2(c_char        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM drawing_types
"
"     WHERE dwgt_bu = p_bu
"
"       AND dwgt_desc = c_char;
"
"
"
"       cr2            c2%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_drwg_id        VARCHAR2(10);
"
"       v_seq_no         NUMBER;
"
"       v_res            VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       /***** Drawing Type *****/
"
"
"
"          v_res := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             SELECT MAX(dwgt_type_id)
"
"               INTO v_drwg_id
"
"               FROM drawing_types
"
"              WHERE dwgt_bu = p_bu;
"
"
"
"             v_drwg_id := func_get_next_id(v_drwg_id);
"
"
"
"             INSERT INTO drawing_types (
"
"                        dwgt_bu    ,
"
"                     dwgt_type_id  ,
"
"                     dwgt_desc     ,
"
"                     dwgt_drwg_type,
"
"                     dwgt_cre_by   ,
"
"                     dwgt_cre_date ,
"
"                     dwgt_upd_by   ,
"
"                     dwgt_upd_date
"
"                    )
"
"                     VALUES(p_bu          ,
"
"                            v_drwg_id  ,
"
"                            cr1.dcmed_data1,
"
"                            cr1.dcmed_data2,
"
"                            p_user          ,
"
"                            SYSDATE       ,
"
"                            NULL        ,
"
"                            NULL
"
"                            );
"
"
"
"             v_res := 'Y';
"
"
"
"          END LOOP c1;
"
"
"
"
"
"       DELETE dwgt_config_mig_excep_dtls
"
"        WHERE dcmed_bu       = p_bu
"
"          AND dcmed_exp_flag = 'N';
"
"
"
"       p_res := v_res;
"
"
"
"    END proc_ins_dwgt_cfg_mig;
"
"
"
"    PROCEDURE proc_upload_rdrp_cfg_mig
"
"    (
"
"     p_bu            VARCHAR2,
"
"     p_dir            VARCHAR2,
"
"     p_file_name    VARCHAR2,
"
"     p_user            VARCHAR2,
"
"     p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM rdrp_config_mig_excep_dtls
"
"     WHERE rcmed_bu   = p_bu;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       v_exp_flag    VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"             EXECUTE IMMEDIATE 'DROP TABLE TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"       DELETE
"
"         FROM rdrp_config_mig_excep_dtls
"
"        WHERE rcmed_bu   = p_bu;
"
"
"
"       EXECUTE IMMEDIATE 'CREATE TABLE temp_config_mig_excep_dtls(tcmed_data1    VARCHAR2(500),
"
"                                                                  tcmed_data2    VARCHAR2(500))
"
"                  ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                      ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                 SKIP 1
"
"                                 FIELDS TERMINATED BY ''|''
"
"                                 MISSING FIELD VALUES ARE NULL
"
"                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                (tcmed_data1     CHAR(255),
"
"                                 tcmed_data2     CHAR(255)))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"       EXECUTE IMMEDIATE 'INSERT INTO rdrp_config_mig_excep_dtls (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                           ROWNUM,
"
"                                           tcmed_data1,
"
"                                           tcmed_data2,
"
"                                           NULL,'
"
"                                           || CHR(39) || v_exp_flag || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||',
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL
"
"                                              FROM temp_config_mig_excep_dtls)';
"
"
"
"       EXECUTE IMMEDIATE 'DROP TABLE temp_config_mig_excep_dtls';
"
"
"
"       UPDATE rdrp_config_mig_excep_dtls
"
"          SET rcmed_data1 = TRIM(rcmed_data1),
"
"              rcmed_data2 = TRIM(rcmed_data2)
"
"        WHERE rcmed_bu   = p_bu;
"
"
"
"       UPDATE rdrp_config_mig_excep_dtls
"
"          SET rcmed_data1 = UPPER(rcmed_data1),
"
"              rcmed_data2 = UPPER(rcmed_data2)
"
"        WHERE rcmed_bu   = p_bu;
"
"
"
"
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_rdrp_cfg_mig;
"
"
"
"    PROCEDURE proc_chk_excep_rdrp_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res       OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM rdrp_config_mig_excep_dtls
"
"     WHERE rcmed_bu   = p_bu;
"
"
"
"
"
"    CURSOR c2(c_char        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_dsgn_rvw_param
"
"     WHERE rdrp_bu = p_bu
"
"       AND rdrp_param_desc = c_char;
"
"
"
"
"
"    CURSOR c3(c_data        VARCHAR2)
"
"        IS
"
"    SELECT rcmed_data1
"
"      FROM rdrp_config_mig_excep_dtls
"
"     WHERE rcmed_bu    = p_bu
"
"       AND rcmed_data1 = c_data
"
"     GROUP BY rcmed_data1
"
"     HAVING COUNT(*) > 1;
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp        VARCHAR2(4000);
"
"       v_result        VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       UPDATE  rdrp_config_mig_excep_dtls
"
"          SET rcmed_ref      = NULL,
"
"          rcmed_exp_flag = 'N'
"
"        WHERE rcmed_bu     = p_bu;
"
"
"
"
"
"       /****** Parameters ******/
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c2(cr1.rcmed_data1);
"
"             FETCH c2 INTO cr2;
"
"
"
"                IF c2%FOUND THEN
"
"                   v_exp := v_exp ||' Parameter Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             OPEN c3(cr1.rcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Parameter exists Desc.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.rcmed_data1 IS NULL THEN
"
"            v_exp := v_exp||' Parameter should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.rcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.rcmed_data1,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF cr1.rcmed_data2 IS NULL THEN
"
"                v_exp := v_exp||' Parent Parameter should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.rcmed_data2 IS NOT NULL THEN
"
"
"
"                      OPEN c2(cr1.rcmed_data2);
"
"                      FETCH c2 INTO cr2;
"
"
"
"                         IF c2%NOTFOUND THEN
"
"                            v_exp := v_exp ||'Parent Parameter not found.';
"
"                         END IF;
"
"
"
"                      CLOSE c2;
"
"
"
"              END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE rdrp_config_mig_excep_dtls
"
"               SET rcmed_ref = LTRIM(v_exp,' '),
"
"                   rcmed_exp_flag = 'Y'
"
"             WHERE rcmed_bu     = p_bu
"
"                   AND rcmed_seq_no = cr1.rcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_excep_rdrp_cfg_mig;
"
"
"
"    PROCEDURE proc_ins_rdrp_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM rdrp_config_mig_excep_dtls
"
"     WHERE rcmed_bu       = p_bu
"
"       AND rcmed_exp_flag = 'N';
"
"
"
"    CURSOR c2(c_char        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_dsgn_rvw_param
"
"     WHERE rdrp_bu = p_bu
"
"       AND rdrp_param_desc = c_char;
"
"
"
"       cr2            c2%ROWTYPE;
"
"
"
"
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_para_id        VARCHAR2(10);
"
"       v_seq_no             NUMBER;
"
"       v_res        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       /***** Parameters *****/
"
"
"
"          v_res := 'N';
"
"
"
"           SELECT MAX(rdrp_print_seq)
"
"               INTO v_seq_no
"
"               FROM rnd_dsgn_rvw_param
"
"              WHERE rdrp_bu = p_bu;
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"
"
"             SELECT MAX(rdrp_param_id)
"
"               INTO v_para_id
"
"               FROM rnd_dsgn_rvw_param
"
"              WHERE rdrp_bu = p_bu;
"
"
"
"             v_para_id := func_get_next_id(v_para_id);
"
"
"
"              v_seq_no := v_seq_no + 1;
"
"
"
"             OPEN c2(cr1.rcmed_data2);
"
"             FETCH c2 INTO cr2;
"
"
"
"             INSERT INTO rnd_dsgn_rvw_param (
"
"                       rdrp_bu         ,
"
"                       rdrp_param_id    ,
"
"                       rdrp_param_desc  ,
"
"                       rdrp_par_pram_id,
"
"                                       rdrp_print_seq  ,
"
"                       rdrp_cre_by     ,
"
"                       rdrp_cre_date   ,
"
"                       rdrp_upd_by     ,
"
"                       rdrp_upd_date
"
"                    )
"
"                     VALUES(p_bu          ,
"
"                            v_para_id  ,
"
"                            cr1.rcmed_data1,
"
"                            cr2.rdrp_param_id,
"
"                            v_seq_no,
"
"                            p_user          ,
"
"                            SYSDATE       ,
"
"                            NULL        ,
"
"                            NULL
"
"                            );
"
"
"
"             v_res := 'Y';
"
"
"
"          END LOOP c1;
"
"
"
"
"
"       DELETE rdrp_config_mig_excep_dtls
"
"        WHERE rcmed_bu       = p_bu
"
"          AND rcmed_exp_flag = 'N';
"
"
"
"       p_res := v_res;
"
"
"
"    END proc_ins_rdrp_cfg_mig;
"
"
"
"    PROCEDURE proc_upload_rdip_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res         OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM rdip_config_mig_excep_dtls
"
"     WHERE rcmed_bu   = p_bu;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       v_exp_flag        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"             EXECUTE IMMEDIATE 'DROP TABLE TEMP_CONFIG_MIG_EXCEP_DTLS';
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"       DELETE rdip_config_mig_excep_dtls
"
"        WHERE rcmed_bu   = p_bu;
"
"
"
"       EXECUTE IMMEDIATE 'CREATE TABLE temp_config_mig_excep_dtls(tcmed_data1    VARCHAR2(500),
"
"                                                                  tcmed_data2    VARCHAR2(500))
"
"                  ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                 DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                      ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                 SKIP 1
"
"                                 FIELDS TERMINATED BY ''|''
"
"                                 MISSING FIELD VALUES ARE NULL
"
"                                 REJECT ROWS WITH ALL NULL FIELDS
"
"                                (tcmed_data1     CHAR(255),
"
"                             tcmed_data2     CHAR(255)))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"       EXECUTE IMMEDIATE 'INSERT INTO rdip_config_mig_excep_dtls (SELECT '|| CHR(39) || p_bu     || CHR(39) ||',
"
"                                           ROWNUM,
"
"                                           tcmed_data1,
"
"                                           tcmed_data2,
"
"                                           NULL,'
"
"                                           || CHR(39) || v_exp_flag || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||','
"
"                                           || CHR(39) || p_user || CHR(39) ||',
"
"                                           SYSDATE,
"
"                                           NULL,
"
"                                           NULL
"
"                                              FROM temp_config_mig_excep_dtls)';
"
"
"
"       EXECUTE IMMEDIATE 'DROP TABLE temp_config_mig_excep_dtls';
"
"
"
"       UPDATE rdip_config_mig_excep_dtls
"
"          SET rcmed_data1 = TRIM(rcmed_data1),
"
"              rcmed_data2 = TRIM(rcmed_data2)
"
"        WHERE rcmed_bu   = p_bu;
"
"
"
"       UPDATE rdip_config_mig_excep_dtls
"
"          SET rcmed_data1 = UPPER(rcmed_data1),
"
"              rcmed_data2 = UPPER(rcmed_data2)
"
"        WHERE rcmed_bu   = p_bu;
"
"
"
"
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_rdip_cfg_mig;
"
"
"
"    PROCEDURE proc_chk_excep_rdip_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM rdip_config_mig_excep_dtls
"
"     WHERE rcmed_bu   = p_bu;
"
"
"
"
"
"    CURSOR c2(c_char        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_dsgn_ip_param
"
"     WHERE rdip_bu = p_bu
"
"       AND rdip_param_desc = c_char;
"
"
"
"
"
"    CURSOR c3(c_data        VARCHAR2)
"
"        IS
"
"    SELECT rcmed_data1
"
"      FROM rdip_config_mig_excep_dtls
"
"     WHERE rcmed_bu    = p_bu
"
"       AND rcmed_data1 = c_data
"
"     GROUP BY rcmed_data1
"
"     HAVING COUNT(*) > 1;
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       UPDATE  rdip_config_mig_excep_dtls
"
"          SET rcmed_ref      = NULL,
"
"          rcmed_exp_flag = 'N'
"
"        WHERE rcmed_bu     = p_bu;
"
"
"
"
"
"       /****** Parameters ******/
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c2(cr1.rcmed_data1);
"
"             FETCH c2 INTO cr2;
"
"
"
"                IF c2%FOUND THEN
"
"                   v_exp := v_exp ||' Parameter Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             OPEN c3(cr1.rcmed_data1);
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Parameter exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.rcmed_data1 IS NULL THEN
"
"            v_exp := v_exp||' Parameter should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.rcmed_data1 IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.rcmed_data1,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF cr1.rcmed_data2 IS NULL THEN
"
"                v_exp := v_exp||' Parent Parameter should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.rcmed_data2 IS NOT NULL THEN
"
"
"
"                      OPEN c2(cr1.rcmed_data2);
"
"                      FETCH c2 INTO cr2;
"
"
"
"                         IF c2%NOTFOUND THEN
"
"                            v_exp := v_exp ||'Parent Parameter not found.';
"
"                         END IF;
"
"
"
"                      CLOSE c2;
"
"
"
"              END IF;
"
"
"
"             IF v_exp IS NOT NULL THEN
"
"
"
"                UPDATE rdip_config_mig_excep_dtls
"
"               SET rcmed_ref = LTRIM(v_exp,' '),
"
"                   rcmed_exp_flag = 'Y'
"
"             WHERE rcmed_bu     = p_bu
"
"                   AND rcmed_seq_no = cr1.rcmed_seq_no;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_excep_rdip_cfg_mig;
"
"
"
"    PROCEDURE proc_ins_rdip_cfg_mig
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM rdip_config_mig_excep_dtls
"
"     WHERE rcmed_bu       = p_bu
"
"       AND rcmed_exp_flag = 'N';
"
"
"
"    CURSOR c2(c_char        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_dsgn_ip_param
"
"     WHERE rdip_bu = p_bu
"
"       AND rdip_param_desc = c_char;
"
"
"
"       cr2            c2%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_para_id        VARCHAR2(10);
"
"       v_seq_no         NUMBER;
"
"       v_res            VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       /***** Parameters *****/
"
"
"
"          v_res := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             SELECT MAX(rdip_print_seq)
"
"           INTO v_seq_no
"
"           FROM rnd_dsgn_ip_param
"
"              WHERE rdip_bu = p_bu;
"
"
"
"             SELECT MAX(rdip_param_id)
"
"               INTO v_para_id
"
"               FROM rnd_dsgn_ip_param
"
"              WHERE rdip_bu = p_bu;
"
"
"
"             v_para_id := func_get_next_id(v_para_id);
"
"
"
"             OPEN c2(cr1.rcmed_data2);
"
"             FETCH c2 INTO cr2;
"
"             CLOSE c2;
"
"
"
"             INSERT INTO rnd_dsgn_ip_param (
"
"                       rdip_bu         ,
"
"                       rdip_param_id    ,
"
"                       rdip_param_desc  ,
"
"                       rdip_par_pram_id,
"
"                       rdip_print_seq  ,
"
"                       rdip_cre_by     ,
"
"                       rdip_cre_date   ,
"
"                       rdip_upd_by     ,
"
"                       rdip_upd_date
"
"                    )
"
"                     VALUES(p_bu          ,
"
"                            v_para_id  ,
"
"                            cr1.rcmed_data1,
"
"                            cr2.rdip_param_id,
"
"                            v_seq_no,
"
"                            p_user          ,
"
"                            SYSDATE       ,
"
"                            NULL        ,
"
"                            NULL
"
"                            );
"
"
"
"             v_res := 'Y';
"
"
"
"          END LOOP c1;
"
"
"
"       DELETE rdip_config_mig_excep_dtls
"
"        WHERE rcmed_bu       = p_bu
"
"          AND rcmed_exp_flag = 'N';
"
"
"
"       p_res := v_res;
"
"
"
"    END proc_ins_rdip_cfg_mig;
"
"
"
"    PROCEDURE proc_upload_proj_exp_group
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res     OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'PROJ_EXP_GROUP_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'G';
"
"
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE PROJ_EXP_GROUP_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'G';
"
"
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE PROJ_EXP_GROUP_TEMP(
"
"                                            PRO_EXP_GROUP_DESC        VARCHAR2(55)
"
"                                            )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             PRO_EXP_GROUP_DESC   CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO MCHN_PROC_PARAM_EXCEPTION (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                           NULL ,
"
"                                           NULL ,
"
"                                           NULL ,
"
"                                           NULL ,
"
"                                           NULL ,
"
"                                           pro_exp_group_desc ,
"
"                                           NULL ,
"
"                                           '||CHR(39) || p_user || CHR(39)||','||'
"
"                                           SYSDATE,
"
"                                           NULL ,
"
"                                           NULL ,'
"
"                                           ||CHR(39) || 'G' || CHR(39)||','
"
"                                           ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                           NULL ,'
"
"                                           ||CHR(39) || p_user   || CHR(39)||','||'
"
"                                          NULL,
"
"                                          NULL,
"
"                                          NULL,
"
"                                          NULL,
"
"                                          NULL
"
"                                          FROM PROJ_EXP_GROUP_TEMP
"
"                                               )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE PROJ_EXP_GROUP_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_proj_exp_group;
"
"
"
"    PROCEDURE proc_chk_prjo_exp_group
"
"    (
"
"    p_bu         VARCHAR2,
"
"    p_user       VARCHAR2,
"
"    p_res   OUT  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'G'
"
"       AND mppe_status   = 'N';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'G'
"
"    GROUP BY mppe_bu, mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c3 (c_param_desc VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_proj_exp_groups
"
"     WHERE prjeg_bu        = p_bu
"
"       AND prjeg_desc1     = c_param_desc;
"
"
"
"    cr3 c3%ROWTYPE;
"
"
"
"     BEGIN
"
"
"
"            p_res:='Y';
"
"
"
"            UPDATE mchn_proc_param_exception
"
"               SET mppe_status   = 'N',
"
"                   mppe_ref = NULL,
"
"                   mppe_upd_by   = p_user,
"
"                   mppe_upd_date = SYSDATE
"
"             WHERE mppe_bu       = p_bu
"
"               AND mppe_sel_user = p_user
"
"               AND mppe_doc_type = 'G';
"
"
"
"                    FOR cr2 IN c2
"
"                    LOOP
"
"
"
"                    UPDATE mchn_proc_param_exception
"
"                       SET mppe_status       = 'E',
"
"                           mppe_ref          = 'Duplicate Record',
"
"                           mppe_upd_by       = p_user,
"
"                           mppe_upd_date     = SYSDATE
"
"                     WHERE mppe_bu           = p_bu
"
"                       AND mppe_param_desc   = cr2.mppe_param_desc
"
"                       AND mppe_sel_user     = p_user
"
"                       AND mppe_doc_type     = 'G';
"
"
"
"                    p_res := 'N';
"
"
"
"                    END LOOP;
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"              OPEN c3(cr1.mppe_param_id);
"
"
"
"                        FETCH c3 INTO cr3;
"
"
"
"                        IF c3%FOUND THEN
"
"
"
"                      UPDATE mchn_proc_param_exception
"
"                         SET mppe_status       = 'E',
"
"                             mppe_ref          = 'Group already exists.',
"
"                             mppe_upd_by       = p_user,
"
"                             mppe_upd_date     = SYSDATE
"
"                       WHERE mppe_bu           = p_bu
"
"                         AND mppe_param_desc   = cr1.mppe_param_desc
"
"                         AND mppe_sel_user     = p_user
"
"                         AND mppe_doc_type     = 'G';
"
"
"
"                        p_res := 'N';
"
"
"
"                        END IF;
"
"                    CLOSE c3;
"
"
"
"                IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"                    UPDATE mchn_proc_param_exception
"
"                       SET mppe_status   = 'E',
"
"                           mppe_ref      = 'Group must be entered.',
"
"                           mppe_upd_by   = p_user,
"
"                           mppe_upd_date = SYSDATE
"
"                       WHERE mppe_bu       = p_bu
"
"                         AND mppe_param_desc   = cr1.mppe_param_desc
"
"                         AND mppe_param_desc IS NULL
"
"                         AND mppe_sel_user = p_user
"
"                         AND mppe_doc_type = 'G';
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
"      END LOOP c1;
"
"
"
"     END proc_chk_prjo_exp_group;
"
"
"
"    PROCEDURE proc_ins_proj_exp_groups
"
"    (
"
"    p_bu      VARCHAR2,
"
"    p_user     VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu         = p_bu
"
"       AND mppe_doc_type   = 'G'
"
"       AND mppe_status     = 'N'
"
"       AND mppe_sel_user   = p_user;
"
"
"
"       v_grp_id rnd_proj_exp_groups.prjeg_grp_id%TYPE;
"
"
"
"    BEGIN
"
"        FOR cr1 IN c1
"
"        LOOP
"
"
"
"            SELECT MAX(prjeg_grp_id)
"
"               INTO v_grp_id
"
"               FROM rnd_proj_exp_groups
"
"              WHERE prjeg_bu = p_bu;
"
"
"
"             v_grp_id := func_get_next_id(v_grp_id);
"
"
"
"                 INSERT INTO rnd_proj_exp_groups(
"
"                                            prjeg_bu ,
"
"                                            prjeg_grp_id ,
"
"                                            prjeg_desc1 ,
"
"                                            prjeg_desc2  ,
"
"                                            prjeg_cre_by ,
"
"                                            prjeg_cre_date
"
"                                            )
"
"                                    VALUES(p_bu ,
"
"                                           v_grp_id    ,
"
"                                           cr1.mppe_param_desc ,
"
"                                           NULL,
"
"                                           p_user,
"
"                                           SYSDATE
"
"                                          );
"
"
"
"
"
"        DELETE mchn_proc_param_exception
"
"         WHERE mppe_bu         = p_bu
"
"           AND mppe_doc_type   = 'G'
"
"           AND mppe_status     = 'N'
"
"           AND mppe_sel_user   = p_user;
"
"
"
"        END LOOP c1;
"
"
"
"    END proc_ins_proj_exp_groups;
"
"
"
"    PROCEDURE proc_upload_proj_exp_prex
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'RND_PROJ_EXPENS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'E';
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE RND_PROJ_EXPENS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'E';
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE RND_PROJ_EXPENS_TEMP(
"
"                                            RPET_EXP_DESC         VARCHAR2(55),
"
"                                            RPET_EXP_UOM          VARCHAR2(10),
"
"                                            RPET_EXP_GROUP        VARCHAR2(55)
"
"                                            )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             RPET_EXP_DESC    CHAR(255),
"
"                                             RPET_EXP_UOM     CHAR(255),
"
"                                             RPET_EXP_GROUP   CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO MCHN_PROC_PARAM_EXCEPTION (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                               NULL ,
"
"                                                               NULL ,
"
"                                                               RPET_EXP_UOM,
"
"                                                               NULL,
"
"                                                               NULL ,
"
"                                                               RPET_EXP_DESC ,
"
"                                                               NULL ,
"
"                                                               '||CHR(39) || p_user || CHR(39)||','||'
"
"                                                               SYSDATE,
"
"                                                               NULL ,
"
"                                                               NULL ,'
"
"                                                               ||CHR(39) || 'E' || CHR(39)||','
"
"                                                               ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                               NULL ,'
"
"                                                               ||CHR(39) || p_user   || CHR(39)||','||'
"
"                                                               NULL,
"
"                                                               RPET_EXP_GROUP,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL
"
"                                                              FROM RND_PROJ_EXPENS_TEMP
"
"                                                                   )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE RND_PROJ_EXPENS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upload_proj_exp_prex;
"
"
"
"    PROCEDURE proc_chk_proj_expn_pfex
"
"    (
"
"    p_bu         VARCHAR2,
"
"    p_user       VARCHAR2,
"
"    p_res   OUT  VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'E'
"
"       AND mppe_status   = 'N';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_cause_id,
"
"           mppe_param_desc,
"
"           mppe_param_action_desc ,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'E'
"
"    GROUP BY mppe_bu, mppe_cause_id,mppe_param_desc,mppe_param_action_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c3 (c_expnse_desc VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_proj_expenses
"
"     WHERE prje_bu     = p_bu
"
"       AND prje_desc1  = c_expnse_desc;
"
"
"
"    CURSOR c4 (c_group_desc VARCHAR2)
"
"    IS
"
"    SELECT prjeg_grp_id
"
"     FROM rnd_proj_exp_groups
"
"    WHERE prjeg_bu = p_bu
"
"      AND prjeg_desc1 = c_group_desc;
"
"
"
"    CURSOR c_check_uom(c_uom VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM unit_of_measures
"
"     WHERE uom_bu = p_bu
"
"       AND uom_uom = c_uom
"
"       AND uom_type IN ('T', 'O');
"
"
"
"
"
"    cr3             c3%ROWTYPE;
"
"    cr4             c4%ROWTYPE;
"
"    cr_check_uom    c_check_uom%ROWTYPE;
"
"
"
"     BEGIN
"
"
"
"            p_res:='Y';
"
"
"
"            UPDATE mchn_proc_param_exception
"
"               SET mppe_status   = 'N',
"
"                   mppe_ref      = NULL,
"
"                   mppe_upd_by   = p_user,
"
"                   mppe_upd_date = SYSDATE
"
"             WHERE mppe_bu       = p_bu
"
"               AND mppe_sel_user = p_user
"
"               AND mppe_doc_type = 'E';
"
"
"
"                    FOR cr2 IN c2
"
"                    LOOP
"
"
"
"                        UPDATE mchn_proc_param_exception
"
"                           SET mppe_status   = 'E',
"
"                               mppe_ref      = 'Duplicate Record',
"
"                               mppe_upd_by   = p_user,
"
"                               mppe_upd_date = SYSDATE
"
"                         WHERE mppe_bu       = p_bu
"
"                           AND mppe_param_desc   = cr2.mppe_param_desc
"
"                           AND mppe_sel_user = p_user
"
"                           AND mppe_doc_type = 'E';
"
"
"
"                            p_res := 'N';
"
"
"
"                    END LOOP c2;
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"            OPEN c3(cr1.mppe_param_desc);
"
"            FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"
"
"                    UPDATE mchn_proc_param_exception
"
"                       SET mppe_status     = 'E',
"
"                           mppe_ref        = 'Expense already exists.',
"
"                           mppe_upd_by     = p_user,
"
"                           mppe_upd_date   = SYSDATE
"
"                     WHERE mppe_bu         = p_bu
"
"                       AND mppe_param_desc = cr1.mppe_param_desc
"
"                       AND mppe_sel_user   = p_user
"
"                       AND mppe_doc_type   = 'E';
"
"
"
"                p_res := 'N';
"
"
"
"                END IF;
"
"
"
"            CLOSE c3;
"
"
"
"            IF cr1.mppe_param_desc IS NULL THEN
"
"
"
"                UPDATE mchn_proc_param_exception
"
"                   SET mppe_status            = 'E',
"
"                       mppe_ref               = 'Expense must be entered.',
"
"                       mppe_upd_by            = p_user,
"
"                       mppe_upd_date          = SYSDATE
"
"                 WHERE mppe_bu                = p_bu
"
"                   AND mppe_param_desc        = cr1.mppe_param_desc
"
"                   AND mppe_param_desc IS NULL
"
"                   AND mppe_cause_id          = cr1.mppe_cause_id
"
"                   AND mppe_param_action_desc = cr1.mppe_param_action_desc
"
"                   AND mppe_sel_user          = p_user
"
"                   AND mppe_doc_type          = 'E';
"
"
"
"                       p_res := 'N';
"
"
"
"            END IF;
"
"
"
"            IF cr1.mppe_cause_id IS NULL THEN
"
"
"
"                UPDATE mchn_proc_param_exception
"
"                   SET mppe_status              = 'E',
"
"                       mppe_ref                 = 'UOM Must be enter',
"
"                       mppe_upd_by              = p_user,
"
"                       mppe_upd_date            = SYSDATE
"
"                 WHERE mppe_bu                  = p_bu
"
"                   AND mppe_param_desc          = cr1.mppe_param_desc
"
"                   AND mppe_param_action_desc   = cr1.mppe_param_action_desc
"
"                   AND mppe_cause_id IS NULL
"
"                   AND mppe_sel_user            = p_user
"
"                   AND mppe_doc_type            = 'E';
"
"
"
"                p_res := 'N';
"
"
"
"            END IF;
"
"
"
"            IF cr1.mppe_param_action_desc IS NULL THEN
"
"
"
"                UPDATE mchn_proc_param_exception
"
"                   SET mppe_status   = 'E',
"
"                       mppe_ref1      = ' Group must be entered',
"
"                       mppe_upd_by   = p_user,
"
"                       mppe_upd_date = SYSDATE
"
"                 WHERE mppe_bu       = p_bu
"
"                   AND mppe_param_desc = cr1.mppe_param_desc
"
"                   AND mppe_param_action_desc IS NULL
"
"                   AND mppe_sel_user = p_user
"
"                   AND mppe_doc_type = 'E';
"
"
"
"                p_res := 'N';
"
"
"
"            END IF;
"
"
"
"            OPEN c4(cr1.mppe_param_action_desc);
"
"            FETCH c4 INTO cr4;
"
"                 IF c4%notfound THEN
"
"
"
"                   UPDATE mchn_proc_param_exception
"
"                      SET mppe_status   = 'E',
"
"                          mppe_ref1      = ' Group not found',
"
"                          mppe_upd_by   = p_user,
"
"                          mppe_upd_date  = SYSDATE
"
"                    WHERE mppe_bu       = p_bu
"
"                      AND mppe_param_desc = cr1.mppe_param_desc
"
"                      AND mppe_param_action_desc = cr1.mppe_param_action_desc
"
"                      AND mppe_sel_user   = p_user
"
"                      AND mppe_doc_type   = 'E';
"
"
"
"                    p_res := 'N';
"
"
"
"                 END IF;
"
"
"
"            CLOSE c4;
"
"
"
"            OPEN c_check_uom(cr1.mppe_cause_id);
"
"            FETCH c_check_uom INTO cr_check_uom;
"
"               IF c_check_uom%NOTFOUND THEN
"
"
"
"                   UPDATE mchn_proc_param_exception
"
"                      SET mppe_status   = 'E',
"
"                          mppe_ref      = ' UOM not found',
"
"                          mppe_upd_by   = p_user,
"
"                          mppe_upd_date  = SYSDATE
"
"                    WHERE mppe_bu       = p_bu
"
"                      AND mppe_param_desc = cr1.mppe_param_desc
"
"                      AND mppe_cause_id = cr1.mppe_cause_id
"
"                      AND mppe_sel_user   = p_user
"
"                      AND mppe_doc_type   = 'E';
"
"
"
"               END IF;
"
"            CLOSE c_check_uom;
"
"
"
"      END LOOP c1;
"
"
"
"     END proc_chk_proj_expn_pfex;
"
"
"
"    PROCEDURE proc_ins_proj_expn_pref
"
"    (
"
"    p_bu  VARCHAR2,
"
"    p_user VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu         = p_bu
"
"       AND mppe_doc_type   = 'E'
"
"       AND mppe_status     = 'N'
"
"       AND mppe_sel_user   = p_user;
"
"
"
"    CURSOR c_grp (c_group_desc VARCHAR2)
"
"       IS
"
"    SELECT prjeg_grp_id
"
"      FROM rnd_proj_exp_groups
"
"     WHERE prjeg_bu = p_bu
"
"       AND prjeg_desc1 = c_group_desc;
"
"
"
"       v_expnse_id    rnd_proj_expenses.prje_xpns_id%TYPE;
"
"       cr_grp c_grp%ROWTYPE;
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
"                SELECT MAX(prje_xpns_id)
"
"                  INTO v_expnse_id
"
"                  FROM rnd_proj_expenses
"
"                 WHERE prje_bu = p_bu;
"
"
"
"                    v_expnse_id := func_get_next_id(v_expnse_id);
"
"
"
"            OPEN c_grp(cr1.mppe_param_action_desc);
"
"            FETCH c_grp INTO cr_grp;
"
"            CLOSE c_grp;
"
"
"
"                 INSERT INTO rnd_proj_expenses(
"
"                                            prje_bu  ,
"
"                                            prje_xpns_id  ,
"
"                                            prje_desc1 ,
"
"                                            prje_desc2 ,
"
"                                            prje_uom ,
"
"                                            prje_grp_id ,
"
"                                            prje_cre_by ,
"
"                                            prje_cre_date ,
"
"                                            prje_upd_by ,
"
"                                            prje_upd_date
"
"                                          )
"
"                                    VALUES(p_bu ,
"
"                                           v_expnse_id ,
"
"                                           cr1.mppe_param_desc,
"
"                                           NULL,
"
"                                           cr1.mppe_cause_id,
"
"                                           cr_grp.prjeg_grp_id,
"
"                                           p_user,
"
"                                           SYSDATE,
"
"                                           p_user,
"
"                                           null
"
"                                          );
"
"
"
"
"
"        DELETE mchn_proc_param_exception
"
"         WHERE mppe_bu         = p_bu
"
"           AND mppe_doc_type   = 'E'
"
"           AND mppe_status     = 'N'
"
"           AND mppe_sel_user   = p_user;
"
"
"
"        END LOOP c1;
"
"
"
"    END proc_ins_proj_expn_pref;
"
"
"
"    PROCEDURE proc_upld_eng_res_grp
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'RND_PROJ_EXPENS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'RG';
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE RND_PROJ_EXPENS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'RG';
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE RND_PROJ_EXPENS_TEMP(
"
"                                            RPET_RES_GRP        VARCHAR2(30),
"
"                                            RPET_RES_TYPE          VARCHAR2(1)
"
"                                            )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             RPET_RES_GRP    CHAR(255),
"
"                                             RPET_RES_TYPE     CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO MCHN_PROC_PARAM_EXCEPTION (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                               NULL ,
"
"                                                               NULL ,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL ,
"
"                                                               rpet_res_grp ,
"
"                                                               rpet_res_type ,
"
"                                                               '||CHR(39) || p_user || CHR(39)||','||'
"
"                                                               SYSDATE,
"
"                                                               NULL ,
"
"                                                               NULL ,'
"
"                                                               ||CHR(39) || 'RG' || CHR(39)||','
"
"                                                               ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                               NULL ,'
"
"                                                               ||CHR(39) || p_user   || CHR(39)||','||'
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
"                                                              FROM RND_PROJ_EXPENS_TEMP
"
"                                                                   )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE RND_PROJ_EXPENS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upld_eng_res_grp;
"
"
"
"    PROCEDURE proc_chk_eng_res_grp
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'E'
"
"       AND mppe_status   = 'N';
"
"
"
"    CURSOR c2(c_res_grp_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_proj_res_groups
"
"     WHERE prjrg_bu = p_bu
"
"       AND prjrg_desc1 = c_res_grp_desc;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           mppe_param_type,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'E'
"
"    GROUP BY mppe_bu, mppe_param_desc,mppe_param_type
"
"    HAVING COUNT (*) > 1;
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_exp1            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"        UPDATE mchn_proc_param_exception
"
"           SET mppe_status   = 'N',
"
"               mppe_ref      = NULL,
"
"               mppe_ref1     = NULL,
"
"               mppe_upd_by   = p_user,
"
"               mppe_upd_date = SYSDATE
"
"         WHERE mppe_bu       = p_bu
"
"           AND mppe_sel_user = p_user
"
"           AND mppe_doc_type = 'RG';
"
"
"
"
"
"       /****** Resource Groups ******/
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c2(cr1.mppe_param_desc);
"
"             FETCH c2 INTO cr2;
"
"
"
"                IF c2%FOUND THEN
"
"                   v_exp := v_exp ||' Resource Group Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             OPEN c3;
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Resource Group exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.mppe_param_desc IS NULL THEN
"
"            v_exp := v_exp||' Resource Group should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.mppe_param_desc IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.mppe_param_desc,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF cr1.mppe_param_type IS NULL THEN
"
"                v_exp1 := v_exp1||' Resource Type should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.mppe_param_type NOT IN ('M','P') THEN
"
"                v_exp1 := v_exp1||' Resource Type not found.';
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL OR v_exp1 IS NOT NULL THEN
"
"
"
"                UPDATE mchn_proc_param_exception
"
"                   SET mppe_status   = 'E',
"
"                       mppe_ref      = LTRIM(v_exp,' '),
"
"                       mppe_ref1     = LTRIM(v_exp1,' '),
"
"                       mppe_upd_by   = p_user,
"
"                       mppe_upd_date = SYSDATE
"
"                 WHERE mppe_bu       = p_bu
"
"                   AND mppe_sel_user = p_user
"
"                   AND mppe_doc_type = 'RG';
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_eng_res_grp;
"
"
"
"    PROCEDURE proc_ins_eng_res_grp
"
"    (
"
"    p_bu  VARCHAR2,
"
"    p_user VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu         = p_bu
"
"       AND mppe_doc_type   = 'RG'
"
"       AND mppe_status     = 'N'
"
"       AND mppe_sel_user   = p_user;
"
"
"
"       v_res_grp_id    rnd_proj_res_groups.prjrg_grp_id%TYPE;
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
"                SELECT MAX(prjrg_grp_id)
"
"                  INTO v_res_grp_id
"
"                  FROM rnd_proj_res_groups
"
"                 WHERE prjrg_bu = p_bu;
"
"
"
"                    v_res_grp_id := func_get_next_id(v_res_grp_id);
"
"
"
"                 INSERT INTO rnd_proj_res_groups(
"
"                                                prjrg_bu        ,
"
"                                                prjrg_grp_id    ,
"
"                                                prjrg_desc1     ,
"
"                                                prjrg_desc2     ,
"
"                                                prjrg_res_type  ,
"
"                                                prjrg_hrly_rate ,
"
"                                                prjrg_cre_by    ,
"
"                                                prjrg_cre_date
"
"                                          )
"
"                                    VALUES(p_bu ,
"
"                                           v_res_grp_id ,
"
"                                           cr1.mppe_param_desc,
"
"                                           NULL,
"
"                                           cr1.mppe_param_type,
"
"                                           0,
"
"                                           p_user,
"
"                                           SYSDATE
"
"                                          );
"
"
"
"
"
"        DELETE mchn_proc_param_exception
"
"         WHERE mppe_bu         = p_bu
"
"           AND mppe_doc_type   = 'RG'
"
"           AND mppe_status     = 'N'
"
"           AND mppe_sel_user   = p_user;
"
"
"
"        END LOOP c1;
"
"
"
"    END proc_ins_eng_res_grp;
"
"
"
"    PROCEDURE proc_upld_eng_res
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'RND_PROJ_EXPENS_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'RS';
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE RND_PROJ_EXPENS_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE mchn_proc_param_exception
"
"      WHERE mppe_bu       = p_bu
"
"        AND mppe_sel_user = p_user
"
"        AND mppe_doc_type = 'RS';
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE RND_PROJ_EXPENS_TEMP(
"
"                                            RPET_RES_GRP        VARCHAR2(30),
"
"                                            RPET_EFF_FROM        DATE,
"
"                                            RPET_EFF_TO            DATE,
"
"                                            RPET_EMP_NAME        VARCHAR2(60),
"
"                                            RPET_AVL_HRS        NUMBER(7),
"
"                                            RPET_MCHN_DESC        VARCHAR2(100),
"
"                                            RPET_HRLY_COST        NUMBER(17,5)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             RPET_RES_GRP    CHAR(255),
"
"                                             RPET_EFF_FROM   CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'' ,
"
"                                             RPET_EFF_TO     CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'' ,
"
"                                             RPET_EMP_NAME     CHAR(255),
"
"                                             RPET_AVL_HRS     CHAR(255),
"
"                                             RPET_MCHN_DESC     CHAR(255),
"
"                                             RPET_HRLY_COST     CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO MCHN_PROC_PARAM_EXCEPTION (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                               NULL ,
"
"                                                               NULL ,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               NULL ,
"
"                                                               rpet_res_grp ,
"
"                                                               NULL ,
"
"                                                               '||CHR(39) || p_user || CHR(39)||','||'
"
"                                                               SYSDATE,
"
"                                                               NULL ,
"
"                                                               NULL ,'
"
"                                                               ||CHR(39) || 'RS' || CHR(39)||','
"
"                                                               ||CHR(39) || 'N' || CHR(39)||','||'
"
"                                                               NULL ,'
"
"                                                               ||CHR(39) || p_user   || CHR(39)||','||'
"
"                                                               NULL,
"
"                                                               rpet_emp_name,
"
"                                                               rpet_mchn_desc ,
"
"                                                               NULL,
"
"                                                               NULL,
"
"                                                               rpet_avl_hrs,
"
"                                                               NULL,
"
"                                                               rpet_hrly_cost,
"
"                                                               rpet_eff_from,
"
"                                                               rpet_eff_to
"
"                                                              FROM RND_PROJ_EXPENS_TEMP
"
"                                                                   )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE RND_PROJ_EXPENS_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upld_eng_res;
"
"
"
"    PROCEDURE proc_chk_eng_res
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'RS'
"
"       AND mppe_status   = 'N';
"
"
"
"    CURSOR c2(c_res_grp_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_proj_res_groups
"
"     WHERE prjrg_bu = p_bu
"
"       AND prjrg_desc1 = c_res_grp_desc;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT mppe_bu ,
"
"           mppe_param_desc,
"
"           COUNT (*)
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu       = p_bu
"
"       AND mppe_sel_user = p_user
"
"       AND mppe_doc_type = 'E'
"
"    GROUP BY mppe_bu, mppe_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c_mchn(c_mchn_desc VARCHAR2)
"
"       IS
"
"    SELECT *
"
"       FROM rnd_proj_machines
"
"     WHERE prjm_bu = p_bu
"
"       AND prjm_name1 = c_mchn_desc;
"
"
"
"    CURSOR c_emp(c_emp_name VARCHAR2)
"
"       IS
"
"    SELECT *
"
"      FROM employees
"
"     WHERE emp_bu = p_bu
"
"       AND emp_first_name1 = c_emp_name;
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"       cr_mchn        c_mchn%ROWTYPE;
"
"       cr_emp        c_emp%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_exp1            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"        UPDATE mchn_proc_param_exception
"
"           SET mppe_status   = 'N',
"
"               mppe_ref      = NULL,
"
"               mppe_ref1     = NULL,
"
"               mppe_upd_by   = p_user,
"
"               mppe_upd_date = SYSDATE
"
"         WHERE mppe_bu       = p_bu
"
"           AND mppe_sel_user = p_user
"
"           AND mppe_doc_type = 'RS';
"
"
"
"
"
"       /****** Resource ******/
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c2(cr1.mppe_param_desc);
"
"             FETCH c2 INTO cr2;
"
"
"
"                IF c2%FOUND THEN
"
"                   v_exp := v_exp ||' Resource Group Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             OPEN c3;
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Resource Group exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             IF cr1.mppe_param_desc IS NULL THEN
"
"                v_exp := v_exp||' Resource Group should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.mppe_param_desc IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.mppe_param_desc,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF cr1.mppe_from_date IS NULL THEN
"
"                v_exp1 := v_exp1||' Effective From should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.mppe_to_date IS NULL THEN
"
"                v_exp1 := v_exp1||' Effective To should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.mppe_hrs IS NULL THEN
"
"                v_exp := v_exp||' Avail. hrs. should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.mppe_cost IS NULL THEN
"
"                v_exp := v_exp||' Hourly cost should not be null.';
"
"             END IF;
"
"
"
"            IF cr1.mppe_param_cause_desc IS NOT NULL THEN
"
"
"
"             OPEN c_mchn(cr1.mppe_param_cause_desc);
"
"             FETCH c_mchn INTO cr_mchn;
"
"             IF c_mchn%NOTFOUND THEN
"
"                v_exp1 := v_exp1||' Machine/Manpower not found.';
"
"             END IF;
"
"             CLOSE c_mchn;
"
"
"
"            END IF;
"
"
"
"            IF cr1.mppe_param_action_desc IS NOT NULL THEN
"
"
"
"             OPEN c_emp(cr1.mppe_param_action_desc);
"
"             FETCH c_emp INTO cr_emp;
"
"             IF c_emp%NOTFOUND THEN
"
"                v_exp1 := v_exp1||' Employee not found.';
"
"             END IF;
"
"             CLOSE c_emp;
"
"
"
"            END IF;
"
"
"
"             IF v_exp IS NOT NULL OR v_exp1 IS NOT NULL THEN
"
"
"
"                UPDATE mchn_proc_param_exception
"
"                   SET mppe_status   = 'E',
"
"                       mppe_ref      = LTRIM(v_exp,' '),
"
"                       mppe_ref1     = LTRIM(v_exp1,' '),
"
"                       mppe_upd_by   = p_user,
"
"                       mppe_upd_date = SYSDATE
"
"                 WHERE mppe_bu       = p_bu
"
"                   AND mppe_sel_user = p_user
"
"                   AND mppe_doc_type = 'RS';
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_eng_res;
"
"
"
"    PROCEDURE proc_ins_eng_res
"
"    (
"
"    p_bu  VARCHAR2,
"
"    p_user VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM mchn_proc_param_exception
"
"     WHERE mppe_bu         = p_bu
"
"       AND mppe_doc_type   = 'RS'
"
"       AND mppe_status     = 'N'
"
"       AND mppe_sel_user   = p_user;
"
"
"
"    CURSOR c_res_grp(c_res_grp_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM rnd_proj_res_groups
"
"     WHERE prjrg_bu = p_bu
"
"       AND prjrg_desc1 = c_res_grp_desc;
"
"
"
"    CURSOR c_mchn(c_mchn_desc VARCHAR2)
"
"       IS
"
"    SELECT *
"
"       FROM rnd_proj_machines
"
"     WHERE prjm_bu = p_bu
"
"       AND prjm_name1 = c_mchn_desc;
"
"
"
"    CURSOR c_emp(c_emp_name VARCHAR2)
"
"       IS
"
"    SELECT *
"
"      FROM employees
"
"     WHERE emp_bu = p_bu
"
"       AND emp_first_name1 = c_emp_name;
"
"
"
"    cr_res_grp     c_res_grp%ROWTYPE;
"
"    cr_mchn     c_mchn%ROWTYPE;
"
"    cr_emp         c_emp%ROWTYPE;
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
"            OPEN c_res_grp(cr1.mppe_param_desc);
"
"            FETCH c_res_grp INTO cr_res_grp;
"
"            CLOSE c_res_grp;
"
"
"
"            OPEN c_mchn(cr1.mppe_param_action_desc);
"
"            FETCH c_mchn INTO cr_mchn;
"
"            CLOSE c_mchn;
"
"
"
"            OPEN c_emp(cr1.mppe_param_cause_desc);
"
"            FETCH c_emp INTO cr_emp;
"
"            CLOSE c_emp;
"
"
"
"                 INSERT INTO rnd_proj_resources(
"
"                                                prjr_bu             ,
"
"                                                prjr_hrly_rate      ,
"
"                                                prjr_group_id       ,
"
"                                                prjr_eff_from       ,
"
"                                                prjr_eff_to         ,
"
"                                                prjr_avbl_hrs_day   ,
"
"                                                prjr_emp_id         ,
"
"                                                prjr_mchn_id        ,
"
"                                                prjr_avbl_mins_day  ,
"
"                                                prjr_cre_by         ,
"
"                                                prjr_cre_date
"
"                                          )
"
"                                        VALUES(p_bu             ,
"
"                                            cr1.mppe_cost      ,
"
"                                            cr_res_grp.prjrg_grp_id       ,
"
"                                            cr1.mppe_from_date       ,
"
"                                            cr1.mppe_to_date         ,
"
"                                            cr1.mppe_hrs   ,
"
"                                            cr_emp.emp_emp_id         ,
"
"                                            cr_mchn.prjm_mchn_id       ,
"
"                                            0  ,
"
"                                            p_user         ,
"
"                                            SYSDATE
"
"                                          );
"
"
"
"
"
"        DELETE mchn_proc_param_exception
"
"         WHERE mppe_bu         = p_bu
"
"           AND mppe_doc_type   = 'RS'
"
"           AND mppe_status     = 'N'
"
"           AND mppe_sel_user   = p_user;
"
"
"
"        END LOOP c1;
"
"
"
"    END proc_ins_eng_res;
"
"
"
"    PROCEDURE proc_upld_kpi_doc
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'KPI_EXCEP_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM kpi_excep_upload
"
"     WHERE keu_bu       = p_bu;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE KPI_EXCEP_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE kpi_excep_upload
"
"      WHERE keu_bu       = p_bu;
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE KPI_EXCEP_TEMP(
"
"                                            KET_KPI_DESC        VARCHAR2(50),
"
"                                            KET_KPI_SHRT_DESC   VARCHAR2(500),
"
"                                            KET_KRA_DESC        VARCHAR2(50),
"
"                                            KET_OBJ_NAME        VARCHAR2(50),
"
"                                            KET_FORMULA            VARCHAR2(500),
"
"                                            KET_UOM                VARCHAR2(5),
"
"                                            KET_MEAS_FREQ        VARCHAR2(1)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                             KET_KPI_DESC        CHAR(255),
"
"                                             KET_KPI_SHRT_DESC      CHAR(255),
"
"                                             KET_KRA_DESC         CHAR(255),
"
"                                             KET_OBJ_NAME         CHAR(255),
"
"                                             KET_FORMULA         CHAR(255),
"
"                                             KET_UOM             CHAR(255),
"
"                                             KET_MEAS_FREQ         CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO KPI_EXCEP_UPLOAD (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                              ket_kpi_desc      ,
"
"                                                              ket_kpi_shrt_desc ,
"
"                                                              ket_kra_desc        ,
"
"                                                              ket_obj_name        ,
"
"                                                              ket_formula        ,
"
"                                                              ket_uom            ,
"
"                                                              ket_meas_freq        ,
"
"                                                              NULL,
"
"                                                              NULL,
"
"                                                              NULL,
"
"                                                              NULL,
"
"                                                              NULL
"
"                                                              FROM KPI_EXCEP_TEMP
"
"                                                                   )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE KPI_EXCEP_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upld_kpi_doc;
"
"
"
"    PROCEDURE proc_chk_kpi_excep
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM kpi_excep_upload
"
"     WHERE keu_bu       = p_bu;
"
"
"
"    CURSOR c2(c_kpi_desc        VARCHAR2)
"
"        IS
"
"    SELECT *
"
"      FROM key_perf_indicators
"
"     WHERE kpi_bu = p_bu
"
"       AND kpi_desc = c_kpi_desc;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT keu_bu ,
"
"           keu_kpi_desc,
"
"           COUNT (*)
"
"      FROM kpi_excep_upload
"
"     WHERE keu_bu       = p_bu
"
"    GROUP BY keu_bu, keu_kpi_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c_kra(c_kra_desc VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM key_result_areas
"
"     WHERE kra_bu = p_bu
"
"       AND kra_desc = c_kra_desc;
"
"
"
"    CURSOR c_uom(c_uom1 VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM unit_of_measures
"
"     WHERE uom_bu = p_bu
"
"       AND uom_uom = c_uom1;
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"       cr_kra        c_kra%ROWTYPE;
"
"       cr_uom        c_uom%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_exp1            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"        UPDATE kpi_excep_upload
"
"           SET keu_ref      = NULL,
"
"               keu_upd_by   = p_user,
"
"               keu_upd_date = SYSDATE
"
"         WHERE keu_bu       = p_bu;
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c2(cr1.keu_kpi_desc);
"
"             FETCH c2 INTO cr2;
"
"
"
"                IF c2%FOUND THEN
"
"                   v_exp := v_exp ||' Key Performance Indicator Already exists.';
"
"                END IF;
"
"
"
"             CLOSE c2;
"
"
"
"             OPEN c3;
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Key Performance Indicator exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             OPEN c_kra(cr1.keu_kra_desc);
"
"             FETCH c_kra INTO cr_kra;
"
"             IF c_kra%NOTFOUND THEN
"
"                v_exp := v_exp||' Key Result Area not found.';
"
"             END IF;
"
"             CLOSE c_kra;
"
"
"
"             OPEN c_uom(cr1.keu_uom);
"
"             FETCH c_uom INTO cr_uom;
"
"             IF c_uom%NOTFOUND THEN
"
"                v_exp := v_exp||' UOM not found.';
"
"             END IF;
"
"             CLOSE c_uom;
"
"
"
"             IF cr1.keu_kpi_desc IS NULL THEN
"
"            v_exp := v_exp||' Key Performance Indicator should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.keu_kpi_desc IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.keu_kpi_desc,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"             IF cr1.keu_meas_freq IS NULL THEN
"
"                v_exp1 := v_exp1||' Meas freq. should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.keu_meas_freq NOT IN ('P','Y') THEN
"
"                v_exp1 := v_exp1||' Meas freq. not found.';
"
"             END IF;
"
"
"
"             IF v_exp IS NOT NULL OR v_exp1 IS NOT NULL THEN
"
"
"
"                UPDATE kpi_excep_upload
"
"                   SET keu_ref      = LTRIM(v_exp,' '),
"
"                       keu_upd_by   = p_user,
"
"                       keu_upd_date = SYSDATE
"
"                 WHERE keu_bu       = p_bu;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_kpi_excep;
"
"
"
"    PROCEDURE proc_ins_kpi_doc
"
"    (
"
"    p_bu  VARCHAR2,
"
"    p_user VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM kpi_excep_upload
"
"     WHERE keu_bu         = p_bu;
"
"
"
"    CURSOR c_kra(c_kra_desc VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM key_result_areas
"
"     WHERE kra_bu = p_bu
"
"       AND kra_desc = c_kra_desc;
"
"
"
"    cr_kra        c_kra%ROWTYPE;
"
"
"
"    v_kpi_id    VARCHAR2(10);
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
"            OPEN c_kra(cr1.keu_kra_desc);
"
"            FETCH c_kra INTO cr_kra;
"
"            CLOSE c_kra;
"
"
"
"            SELECT MAX(kpi_id)
"
"              INTO v_kpi_id
"
"              FROM key_perf_indicators
"
"             WHERE kpi_bu = p_bu;
"
"
"
"                v_kpi_id := func_get_next_id(v_kpi_id);
"
"
"
"                 INSERT INTO key_perf_indicators(
"
"                                                kpi_bu             ,
"
"                                                kpi_id             ,
"
"                                                kpi_desc           ,
"
"                                                kpi_shrt_desc      ,
"
"                                                kpi_kra_id         ,
"
"                                                kpi_obj_name       ,
"
"                                                kpi_formula        ,
"
"                                                kpi_uom            ,
"
"                                                kpi_meas_freq      ,
"
"                                                kpi_cre_by         ,
"
"                                                kpi_cre_date
"
"                                                )
"
"                                        VALUES(
"
"                                               p_bu             ,
"
"                                               v_kpi_id             ,
"
"                                               cr1.keu_kpi_desc           ,
"
"                                               cr1.keu_kpi_shrt_desc      ,
"
"                                               cr_kra.kra_kra_id         ,
"
"                                               cr1.keu_obj_name       ,
"
"                                               cr1.keu_formula        ,
"
"                                               cr1.keu_uom            ,
"
"                                               cr1.keu_meas_freq      ,
"
"                                               p_user         ,
"
"                                               SYSDATE
"
"                                               );
"
"
"
"
"
"        DELETE kpi_excep_upload
"
"         WHERE keu_bu         = p_bu;
"
"
"
"        END LOOP c1;
"
"
"
"    END proc_ins_kpi_doc;
"
"
"
"/*  kpi target */
"
"PROCEDURE proc_upld_kpi_target_doc
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'KPI_TARGET_EXCEP_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM kpi_target_excep_upload
"
"     WHERE kteu_bu       = p_bu;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE KPI_TARGET_EXCEP_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE kpi_target_excep_upload
"
"      WHERE kteu_bu       = p_bu;
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE KPI_TARGET_EXCEP_TEMP(
"
"                                       KTET_TYPE_MEASURE       VARCHAR2(1),
"
"                                                                KTET_MEASURNIG          VARCHAR2(200),
"
"                                    KTET_KPI_DESC           VARCHAR2(50),
"
"                                    KTET_TARGET_RANGE       VARCHAR2(50),
"
"                                    KTET_TARGET            NUMBER(12,3),
"
"                                    KTET_DATE_FROM        DATE,
"
"                                    KTET_DATE_TO        DATE
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                                KTET_TYPE_MEASURE    CHAR(255),
"
"                                                KTET_MEASURNIG       CHAR(255),
"
"                                                KTET_KPI_DESC        CHAR(255),
"
"                                                KTET_TARGET_RANGE    CHAR(255),
"
"                                                KTET_TARGET         CHAR(255),
"
"                                                KTET_DATE_FROM        CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                                KTET_DATE_TO        CHAR(255) DATE_FORMAT DATE MASK ''DD-MON-YY''
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO KPI_TARGET_EXCEP_UPLOAD (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                     ktet_type_measure,
"
"                                     ktet_measurnig,
"
"                                     ktet_kpi_desc ,
"
"                                     ktet_target_range,
"
"                                     ktet_target    ,
"
"                                     ktet_date_from,
"
"                                     ktet_date_to    ,
"
"                                     NULL,
"
"                                      NULL,
"
"                                      NULL,
"
"                                      NULL,
"
"                                      NULL
"
"                                      FROM KPI_TARGET_EXCEP_TEMP
"
"                                           )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE KPI_TARGET_EXCEP_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upld_kpi_target_doc;
"
"
"
"
"
"
"
"    PROCEDURE proc_chk_kpi_target_excep
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM kpi_target_excep_upload
"
"     WHERE kteu_bu       = p_bu;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT kteu_bu ,
"
"           kteu_kpi_desc,
"
"           COUNT (*)
"
"      FROM kpi_target_excep_upload
"
"     WHERE kteu_bu       = p_bu
"
"    GROUP BY kteu_bu, kteu_kpi_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c_kpi(c_kpi_desc VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM key_perf_indicators
"
"     WHERE kpi_bu = p_bu
"
"       AND kpi_desc = c_kpi_desc;
"
"
"
"       cr3            c3%ROWTYPE;
"
"       cr_kpi        c_kpi%ROWTYPE;
"
"
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_exp1            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"        UPDATE kpi_target_excep_upload
"
"           SET kteu_ref      = NULL,
"
"               kteu_upd_by   = p_user,
"
"               kteu_upd_date = SYSDATE
"
"         WHERE kteu_bu       = p_bu;
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c3;
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Key Performance Target Indicator exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             OPEN c_kpi(cr1.kteu_kpi_desc);
"
"             FETCH c_kpi INTO cr_kpi;
"
"             IF c_kpi%NOTFOUND THEN
"
"                v_exp := v_exp||' Key Performance Indicator not found.';
"
"             END IF;
"
"             CLOSE c_kpi;
"
"
"
"             IF cr1.kteu_type_measure IS NULL THEN
"
"              v_exp := v_exp||' Measuring Type should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.kteu_measurnig IS NULL THEN
"
"              v_exp := v_exp||' Measuring should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.kteu_target_range IS NULL THEN
"
"              v_exp := v_exp||' Target Range should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.kteu_kpi_desc IS NULL THEN
"
"            v_exp := v_exp||' Key Performance Indicator should not be null.';
"
"             END IF;
"
"
"
"             IF cr1.kteu_kpi_desc IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.kteu_kpi_desc,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"
"
"
"
"             IF v_exp IS NOT NULL OR v_exp1 IS NOT NULL THEN
"
"
"
"                UPDATE kpi_target_excep_upload
"
"                   SET kteu_ref      = LTRIM(v_exp,' '),
"
"                       kteu_upd_by   = p_user,
"
"                       kteu_upd_date = SYSDATE
"
"                 WHERE kteu_bu       = p_bu;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_kpi_target_excep;
"
"
"
"    PROCEDURE proc_ins_kpi_target_doc
"
"    (
"
"    p_bu  VARCHAR2,
"
"    p_user VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"       IS
"
"    SELECT *
"
"      FROM kpi_target_excep_upload
"
"     WHERE kteu_bu         = p_bu;
"
"
"
"    CURSOR c_kpi(c_kpi_desc VARCHAR2)
"
"      IS
"
"    SELECT *
"
"      FROM key_perf_indicators
"
"     WHERE kpi_bu = p_bu
"
"       AND kpi_desc = c_kpi_desc;
"
"
"
"    cr_kpi        c_kpi%ROWTYPE;
"
"
"
"    v_kpi_doc_no    VARCHAR2(10);
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
"            OPEN c_kpi(cr1.kteu_kpi_desc);
"
"            FETCH c_kpi INTO cr_kpi;
"
"            CLOSE c_kpi;
"
"
"
"            SELECT nvl(MAX(kt_doc_no),1000000000)+1
"
"              INTO v_kpi_doc_no
"
"              FROM kpi_targets
"
"             WHERE kt_bu = p_bu;
"
"
"
"
"
"
"
"                 INSERT INTO kpi_targets(    kt_bu          ,
"
"                                 kt_doc_no  ,
"
"                                 kt_rev_no  ,
"
"                                 kt_kpi_id  ,
"
"                                 kt_target  ,
"
"                                 kt_type_measure,
"
"                                 kt_measurnig   ,
"
"                                                                 kt_target_range,
"
"                                 kt_date_from ,
"
"                                 kt_date_to   ,
"
"                                 kt_status    ,
"
"                                 kt_cre_by    ,
"
"                                 kt_cre_date
"
"                                                )
"
"                                        VALUES(
"
"                                               p_bu             ,
"
"                                               v_kpi_doc_no          ,
"
"                                               0,
"
"                                               cr_kpi.kpi_id    ,
"
"                                               cr1.kteu_target          ,
"
"                                               cr1.kteu_type_measure,
"
"                                               cr1.kteu_measurnig,
"
"                                               cr1.kteu_target_range,
"
"                                               cr1.kteu_date_from     ,
"
"                                               cr1.kteu_date_to       ,
"
"                                               'N'     ,
"
"                                               p_user         ,
"
"                                               SYSDATE
"
"                                               );
"
"
"
"
"
"
"
"        DELETE kpi_target_excep_upload
"
"         WHERE kteu_bu         = p_bu;
"
"
"
"        END LOOP c1;
"
"
"
"    END proc_ins_kpi_target_doc;
"
"
"
"/* steel conversion cost heads */
"
"PROCEDURE proc_upld_cost_head
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'COST_HEAD_EXCEP_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM cost_head_excep_upload
"
"     WHERE cheu_bu       = p_bu;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"       OPEN c1;
"
"       FETCH c1 INTO cr1;
"
"
"
"          IF c1%FOUND THEN
"
"
"
"             EXECUTE IMMEDIATE 'DROP TABLE COST_HEAD_EXCEP_TEMP';
"
"
"
"          END IF;
"
"
"
"       CLOSE c1;
"
"
"
"     DELETE cost_head_excep_upload
"
"      WHERE cheu_bu       = p_bu;
"
"
"
"           EXECUTE IMMEDIATE 'CREATE TABLE COST_HEAD_EXCEP_TEMP(
"
"                                                                CHET_COST_HEAD           VARCHAR2(50)
"
"                                        )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                              ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                     FIELDS TERMINATED BY ''|''
"
"                                     MISSING FIELD VALUES ARE NULL
"
"                                     REJECT ROWS WITH ALL NULL FIELDS
"
"                                                (
"
"                                                CHET_COST_HEAD    CHAR(255)
"
"                                             ))
"
"                       LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"     EXECUTE IMMEDIATE 'INSERT INTO COST_HEAD_EXCEP_UPLOAD (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                             CHET_COST_HEAD,
"
"                                                             NULL,
"
"                                                              NULL,
"
"                                                              NULL,
"
"                                                              NULL,
"
"                                                              NULL
"
"                                                              FROM COST_HEAD_EXCEP_TEMP
"
"                                                                   )';
"
"
"
"      EXECUTE IMMEDIATE 'DROP TABLE COST_HEAD_EXCEP_TEMP';
"
"
"
"       OPEN c2;
"
"       FETCH c2 INTO cr2;
"
"
"
"          IF cr2.v_cnt = 0 THEN
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
"       CLOSE c2;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_upld_cost_head;
"
"
"
"
"
"
"
"    PROCEDURE proc_chk_cost_head_excep
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM cost_head_excep_upload
"
"     WHERE cheu_bu       = p_bu;
"
"
"
"    CURSOR c3
"
"        IS
"
"    SELECT cheu_bu ,
"
"           cheu_cost_head,
"
"           COUNT (*)
"
"      FROM cost_head_excep_upload
"
"     WHERE cheu_bu       = p_bu
"
"    GROUP BY cheu_bu, cheu_cost_head
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c2(c_desc varchar2)
"
"            IS
"
"     select *
"
"       from stlcast_conv_cost_heads
"
"      where scch_bu = p_bu
"
"        and scch_head_desc = c_desc;
"
"
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_exp1            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"        UPDATE cost_head_excep_upload
"
"           SET cheu_ref      = NULL,
"
"               cheu_upd_by   = p_user,
"
"               cheu_upd_date = SYSDATE
"
"         WHERE cheu_bu       = p_bu;
"
"
"
"          v_result := 'N';
"
"          v_spec_char := 'N';
"
"
"
"          FOR cr1 IN c1
"
"          LOOP
"
"
"
"             v_exp := NULL;
"
"
"
"             OPEN c3;
"
"             FETCH c3 INTO cr3;
"
"
"
"                IF c3%FOUND THEN
"
"                   v_exp := v_exp||' Duplicate Cost Head exists.';
"
"                END IF;
"
"
"
"             CLOSE c3;
"
"
"
"             open c2(cr1.cheu_cost_head);
"
"             fetch c2 into cr2;
"
"                     IF c2%FOUND THEN
"
"                   v_exp := v_exp||' Cost Head already exists.';
"
"                END IF;
"
"               close c2;
"
"
"
"             IF cr1.cheu_cost_head IS NULL THEN
"
"              v_exp := v_exp||' Cost Head should not be null.';
"
"             END IF;
"
"
"
"
"
"
"
"             IF cr1.cheu_cost_head IS NOT NULL THEN
"
"
"
"                proc_chk_excep_special_char(cr1.cheu_cost_head,
"
"                                v_spec_char);
"
"
"
"                IF v_spec_char = 'Y' THEN
"
"                   NULL;
"
"                   --v_exp := v_exp||' Special Characters not allowed.';
"
"                END IF;
"
"
"
"             END IF;
"
"
"
"
"
"
"
"             IF v_exp IS NOT NULL OR v_exp1 IS NOT NULL THEN
"
"
"
"                UPDATE cost_head_excep_upload
"
"                   SET cheu_ref      = LTRIM(v_exp,' '),
"
"                       cheu_upd_by   = p_user,
"
"                       cheu_upd_date = SYSDATE
"
"                 WHERE cheu_bu       = p_bu;
"
"
"
"                v_result := 'Y';
"
"
"
"             END IF;
"
"
"
"          END LOOP c1;
"
"
"
"       p_res := v_result;
"
"
"
"    END proc_chk_cost_head_excep;
"
"
"
"    PROCEDURE proc_ins_cost_head
"
"    (
"
"    p_bu  VARCHAR2,
"
"    p_user VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"       IS
"
"    SELECT *
"
"      FROM cost_head_excep_upload
"
"     WHERE cheu_bu         = p_bu;
"
"
"
"
"
"    v_ch_id      VARCHAR2(10);
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
"            SELECT nvl(MAX(TO_NUMBER(scch_head_id)),0)+1
"
"              INTO v_ch_id
"
"              FROM stlcast_conv_cost_heads
"
"             WHERE scch_bu = p_bu;
"
"
"
"                v_ch_id := func_get_next_id(v_ch_id);
"
"
"
"                 INSERT INTO stlcast_conv_cost_heads(    scch_bu     ,
"
"                                scch_head_id ,
"
"                                scch_head_desc ,
"
"                                scch_cre_by    ,
"
"                                scch_cre_date
"
"                                                )
"
"                                        VALUES(
"
"                                               p_bu             ,
"
"                                               v_ch_id          ,
"
"                                               cr1.cheu_cost_head,
"
"                                               p_user         ,
"
"                                               SYSDATE
"
"                                               );
"
"
"
"
"
"
"
"        DELETE cost_head_excep_upload
"
"         WHERE cheu_bu         = p_bu;
"
"
"
"        END LOOP c1;
"
"
"
"    END proc_ins_cost_head;
"
"
"
"    PROCEDURE proc_upload_qc_oth_rates (p_bu              VARCHAR2,
"
"                                                    p_group_id        VARCHAR2,
"
"                                                    p_file_name       VARCHAR2,
"
"                                                    p_user            VARCHAR2,
"
"                                                    p_variant     OUT VARCHAR2
"
"                                                    )
"
"    IS
"
"       CURSOR c1
"
"       IS
"
"          SELECT table_name
"
"            FROM user_tables
"
"           WHERE table_name = 'STLCAST_QC_OTH_RATES_TEMP';
"
"
"
"       CURSOR c2
"
"       IS
"
"          SELECT COUNT (*) v_cnt
"
"            FROM stlcast_qc_oth_rates_excep
"
"           WHERE sqor_bu = p_bu;
"
"
"
"
"
"
"
"       v_create_table     VARCHAR2 (4000);
"
"       v_insert_table     VARCHAR2 (4000);
"
"
"
"       TYPE ei_group_name IS RECORD (sqor_proc_id    VARCHAR2 (200),
"
"                     sqor_unit_rate  VARCHAR2 (200),
"
"                     sqor_eff_from   DATE,
"
"                     sqor_eff_to     DATE
"
"                     );
"
"
"
"       TYPE ei_group_name_t IS TABLE OF ei_group_name INDEX BY PLS_INTEGER;
"
"
"
"       r_group_name_t     ei_group_name_t;
"
"
"
"       TYPE ei_group_name_ref IS REF CURSOR;
"
"
"
"       r_group_name_ref   ei_group_name_ref;
"
"       i                  NUMBER := 1;
"
"       v_next_id          VARCHAR2 (10);
"
"       v_res_id           VARCHAR2 (10);
"
"       v_result           VARCHAR2 (1) := 'N';
"
"       p_status           VARCHAR2 (1) := 'N';
"
"
"
"       cr1                c1%ROWTYPE;
"
"       cr2                c2%ROWTYPE;
"
"    BEGIN
"
"       OPEN c1;
"
"
"
"       FETCH c1 INTO cr1;
"
"
"
"       IF c1%FOUND
"
"       THEN
"
"          EXECUTE IMMEDIATE 'DROP TABLE STLCAST_QC_OTH_RATES_TEMP';
"
"       END IF;
"
"
"
"       CLOSE c1;
"
"
"
"         DELETE stlcast_qc_oth_rates_excep
"
"          WHERE sqor_bu = p_bu;
"
"
"
"       v_create_table :=
"
"          'CREATE TABLE STLCAST_QC_OTH_RATES_TEMP  (   sqor_proc_id    VARCHAR2(150 BYTE),
"
"                                sqor_unit_rate  VARCHAR2(150 BYTE),
"
"                                sqor_eff_from   DATE,
"
"                                sqor_eff_to     DATE
"
"                                            )
"
"                                ORGANIZATION EXTERNAL(
"
"                                TYPE ORACLE_LOADER
"
"                                DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                ACCESS PARAMETERS(
"
"                                          RECORDS DELIMITED BY NEWLINE
"
"                                          SKIP 1
"
"                                          FIELDS TERMINATED BY '',''
"
"                                          MISSING FIELD VALUES ARE NULL
"
"                                          REJECT ROWS WITH ALL NULL FIELDS
"
"                                          (sqor_proc_id                  CHAR(255),
"
"                                          sqor_unit_rate                 CHAR(255),
"
"                                          sqor_eff_from                  CHAR(255)  DATE_FORMAT DATE MASK ''DD-MON-YY'',
"
"                                          sqor_eff_to                    CHAR(255)  DATE_FORMAT DATE MASK ''DD-MON-YY''
"
"                                          )
"
"                                )
"
"                                LOCATION ('''
"
"                                || p_file_name
"
"                                || ''')
"
"                                ) REJECT LIMIT UNLIMITED';
"
"
"
"       EXECUTE IMMEDIATE v_create_table;
"
"
"
"       OPEN r_group_name_ref FOR 'SELECT sqor_proc_id,
"
"                                         sqor_unit_rate,
"
"                                         sqor_eff_from,
"
"                                         sqor_eff_to
"
"                                    FROM stlcast_qc_oth_rates_temp ';
"
"
"
"       LOOP
"
"          FETCH r_group_name_ref INTO r_group_name_t(i);
"
"          i := i + 1;
"
"          EXIT WHEN r_group_name_ref%NOTFOUND;
"
"       END LOOP;
"
"
"
"       FOR i IN 1 .. r_group_name_t.COUNT
"
"       LOOP
"
"     --  raise_application_error(-20999,r_group_name_t (i).sqor_unit_rate);
"
"          INSERT INTO stlcast_qc_oth_rates_excep (sqor_bu,
"
"                             sqor_proc_desc,
"
"                             sqor_unit_rate,
"
"                             sqor_eff_from,
"
"                             sqor_eff_to,
"
"                             sqor_cre_by,
"
"                             sqor_cre_date,
"
"                             sqor_status)
"
"                                  VALUES (p_bu,
"
"                                  r_group_name_t (i).sqor_proc_id,
"
"                                  r_group_name_t (i).sqor_unit_rate,
"
"                                  r_group_name_t (i).sqor_eff_from,
"
"                                  r_group_name_t (i).sqor_eff_to,
"
"                                  p_bu,
"
"                                  SYSDATE,
"
"                                  'N');
"
"       END LOOP;
"
"
"
"       EXECUTE IMMEDIATE 'DROP TABLE STLCAST_QC_OTH_RATES_TEMP';
"
"
"
"       OPEN c2;
"
"
"
"       FETCH c2 INTO cr2;
"
"
"
"
"
"       IF cr2.v_cnt = 0
"
"       THEN
"
"          v_result := 'N';
"
"       ELSE
"
"          v_result := 'Y';
"
"       END IF;
"
"
"
"       CLOSE c2;
"
"
"
"
"
"       p_variant := v_result;
"
"
"
"    END proc_upload_qc_oth_rates;
"
"
"
"    PROCEDURE proc_chk_qc_oth_rates(p_bu         VARCHAR2,
"
"                                                      p_user       VARCHAR2,
"
"                                                      p_fail   OUT VARCHAR2)
"
"    IS
"
"
"
"      CURSOR C1
"
"          IS
"
"      SELECT *
"
"        FROM stlcast_qc_oth_rates_excep,
"
"             mfg_oprns
"
"       WHERE sqor_bu = mfgo_bu(+)
"
"         AND sqor_proc_desc  = mfgo_desc1(+)
"
"         AND sqor_bu = p_bu
"
"         AND 'NT' = mfgo_oprn_type(+);
"
"
"
"      CURSOR C2(p_proc_id     VARCHAR2,
"
"                p_from_date DATE,
"
"                p_to_date     DATE)
"
"          IS
"
"      SELECT *
"
"        FROM stlcast_qc_oth_rates
"
"       WHERE sqor_bu = p_bu
"
"         AND sqor_proc_id = p_proc_id
"
"         AND ((p_from_date BETWEEN sqor_eff_from AND sqor_eff_to)
"
"           OR (p_to_date   BETWEEN sqor_eff_from AND sqor_eff_to))
"
"         AND sqor_status NOT IN ('C');
"
"
"
"      CURSOR C3(p_proc_desc VARCHAR2,
"
"                p_from_date DATE,
"
"                p_to_date   DATE)
"
"          IS
"
"      SELECT COUNT(*) CNT
"
"        FROM stlcast_qc_oth_rates_excep
"
"       WHERE sqor_bu = p_bu
"
"         AND sqor_proc_desc = p_proc_desc
"
"         AND ((p_from_date    BETWEEN sqor_eff_from AND sqor_eff_to) OR
"
"              (p_to_date   BETWEEN sqor_eff_from AND sqor_eff_to));
"
"
"
"    CR2 C2%ROWTYPE;
"
"    CR3 C3%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"       p_fail := 'N';
"
"
"
"       FOR CR1 IN C1 LOOP
"
"
"
"          OPEN C2(CR1.mfgo_oprn_id,
"
"                  CR1.sqor_eff_from,
"
"                  CR1.sqor_eff_to);
"
"          FETCH C2 INTO CR2;
"
"
"
"          OPEN C3(CR1.sqor_proc_desc,
"
"                  CR1.sqor_eff_from,
"
"                  CR1.sqor_eff_to);
"
"           FETCH C3 INTO CR3;
"
"
"
"         IF CR1.mfgo_oprn_id IS NULL THEN
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = 'Process not found.'
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = CR1.sqor_proc_desc
"
"               AND sqor_unit_rate = CR1.sqor_unit_rate
"
"               AND sqor_eff_from = CR1.sqor_eff_from
"
"               AND sqor_eff_to = CR1.sqor_eff_to;
"
"
"
"               p_fail := 'N';
"
"               EXIT;
"
"
"
"        ELSIF CR3.CNT > 1 THEN
"
"
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = 'Duplicate Record Exists'
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = CR1.sqor_proc_desc
"
"               AND sqor_unit_rate = CR1.sqor_unit_rate
"
"               AND sqor_eff_from = CR1.sqor_eff_from
"
"               AND sqor_eff_to = CR1.sqor_eff_to;
"
"
"
"               p_fail := 'N';
"
"               EXIT;
"
"
"
"          ELSIF CR1.sqor_unit_rate IS NULL OR CR1.sqor_unit_rate <= 0 THEN
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = 'Unit rate should be greater than zero.'
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = CR1.sqor_proc_desc
"
"               AND sqor_unit_rate = CR1.sqor_unit_rate
"
"               AND sqor_eff_from = CR1.sqor_eff_from
"
"               AND sqor_eff_to = CR1.sqor_eff_to;
"
"
"
"               p_fail := 'N';
"
"                EXIT;
"
"
"
"          ELSIF CR1.sqor_eff_from IS NULL THEN
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = 'From date must be entered'
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = cr1.sqor_proc_desc
"
"               AND sqor_unit_rate = cr1.sqor_unit_rate
"
"               AND sqor_eff_from = cr1.sqor_eff_from
"
"               AND sqor_eff_to = cr1.sqor_eff_to;
"
"
"
"               p_fail := 'N';
"
"               EXIT;
"
"
"
"          ELSIF CR1.sqor_eff_to IS NULL THEN
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = 'To date must be entered'
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = CR1.sqor_proc_desc
"
"               AND sqor_unit_rate = CR1.sqor_unit_rate
"
"               AND sqor_eff_from = CR1.sqor_eff_from
"
"               AND sqor_eff_to = CR1.sqor_eff_to;
"
"
"
"               p_fail := 'N';
"
"                EXIT;
"
"
"
"          ELSIF CR1.sqor_eff_from > CR1.sqor_eff_to THEN
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = 'From date should not be greater than to date'
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = CR1.sqor_proc_desc
"
"               AND sqor_unit_rate = CR1.sqor_unit_rate
"
"               AND sqor_eff_from = CR1.sqor_eff_from
"
"               AND sqor_eff_to = CR1.sqor_eff_to;
"
"
"
"                p_fail := 'N';
"
"                 EXIT;
"
"
"
"          ELSIF C2%FOUND THEN
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = 'Date Range Intersects for this Process.'
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = cr1.sqor_proc_desc
"
"               AND sqor_unit_rate = cr1.sqor_unit_rate
"
"               AND sqor_eff_from = cr1.sqor_eff_from
"
"               AND sqor_eff_to = cr1.sqor_eff_to;
"
"
"
"               p_fail := 'N';
"
"                EXIT;
"
"
"
"          ELSE
"
"
"
"            UPDATE stlcast_qc_oth_rates_excep
"
"               SET sqor_ref = ''
"
"             WHERE sqor_bu = p_bu
"
"               AND sqor_proc_desc = cr1.sqor_proc_desc
"
"               AND sqor_unit_rate = cr1.sqor_unit_rate
"
"               AND sqor_eff_from = cr1.sqor_eff_from
"
"               AND sqor_eff_to = cr1.sqor_eff_to;
"
"
"
"              p_fail := 'Y';
"
"
"
"            END IF;
"
"            CLOSE C2;
"
"            CLOSE C3;
"
"          END LOOP;
"
"
"
"    END proc_chk_qc_oth_rates;
"
"
"
"    PROCEDURE proc_ins_qc_oth_rates(p_bu  VARCHAR2,
"
"                                    p_user VARCHAR2
"
"                                    )
"
"    IS
"
"      CURSOR C1
"
"          IS
"
"      SELECT *
"
"         FROM stlcast_qc_oth_rates_excep,
"
"          mfg_oprns
"
"       WHERE sqor_bu = mfgo_bu
"
"         AND sqor_proc_desc  = mfgo_desc1
"
"         AND sqor_bu = p_bu;
"
"
"
"    BEGIN
"
"      FOR CR1 IN C1 LOOP
"
"
"
"         INSERT INTO stlcast_qc_oth_rates(sqor_bu,
"
"                          sqor_proc_id,
"
"                          sqor_unit_rate,
"
"                          sqor_eff_from,
"
"                          sqor_eff_to,
"
"                          sqor_cre_by,
"
"                          sqor_cre_date,
"
"                          sqor_upd_by,
"
"                          sqor_upd_date,
"
"                          sqor_status
"
"                          )
"
"                    values(p_bu,
"
"                           CR1.mfgo_oprn_id,
"
"                           CR1.sqor_unit_rate,
"
"                           CR1.sqor_eff_from,
"
"                           CR1.sqor_eff_to,
"
"                           p_user,
"
"                           SYSDATE,
"
"                           NULL,
"
"                           NULL,
"
"                           'N');
"
"    END LOOP;
"
"    DELETE stlcast_qc_oth_rates_excep
"
"    WHERE sqor_bu = p_bu;
"
"    END proc_ins_qc_oth_rates;
"
"
"
"/* APQP phase and APQP parameter */
"
"
"
"PROCEDURE proc_upload_apqp_phase_param
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_type                  VARCHAR2,
"
"    p_dir            VARCHAR2,
"
"    p_file_name        VARCHAR2,
"
"    p_user                    VARCHAR2,
"
"    p_res               OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT table_name
"
"      FROM user_tables
"
"     WHERE table_name = 'PHASE_PARAM_EXCEP_TEMP';
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT COUNT(*) v_cnt
"
"      FROM phase_param_excep_upload
"
"     WHERE ppeu_bu       = p_bu
"
"       AND ppeu_type     = p_type;
"
"
"
"       cr1            c1%ROWTYPE;
"
"       cr2            c2%ROWTYPE;
"
"       v_result        VARCHAR2(1) := 'N';
"
"       p_status        VARCHAR2(1) := 'N';
"
"
"
"    BEGIN
"
"
"
"      IF p_type = 'P' THEN
"
"
"
"               OPEN c1;
"
"               FETCH c1 INTO cr1;
"
"
"
"                  IF c1%FOUND THEN
"
"                     EXECUTE IMMEDIATE 'DROP TABLE PHASE_PARAM_EXCEP_TEMP';
"
"                  END IF;
"
"
"
"               CLOSE c1;
"
"
"
"                 DELETE phase_param_excep_upload
"
"                  WHERE ppeu_bu       = p_bu
"
"                    AND ppeu_type = p_type;
"
"
"
"                   EXECUTE IMMEDIATE 'CREATE TABLE PHASE_PARAM_EXCEP_TEMP(PPET_UNIT           VARCHAR2(50),
"
"                                                                          PPET_PHASE          VARCHAR2(50)
"
"                                              )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                  ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY ''|''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                            (PPET_UNIT           CHAR(255),
"
"                                                                         PPET_PHASE          CHAR(255)
"
"                                                                          ))
"
"                                  LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"                  EXECUTE IMMEDIATE 'INSERT INTO PHASE_PARAM_EXCEP_UPLOAD (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                                                           NULL,
"
"                                               PPET_UNIT,
"
"                                               NULL,
"
"                                               PPET_PHASE,
"
"                                               NULL,
"
"                                               NULL,
"
"                                               NULL,
"
"                                               '|| CHR(39) || p_user || CHR(39) ||','||'
"
"                                               SYSDATE,
"
"                                               NULL,
"
"                                               NULL
"
"                                              FROM PHASE_PARAM_EXCEP_TEMP
"
"                                                   )';
"
"
"
"              EXECUTE IMMEDIATE 'DROP TABLE PHASE_PARAM_EXCEP_TEMP';
"
"
"
"               OPEN c2;
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF cr2.v_cnt = 0 THEN
"
"
"
"                     v_result := 'N';
"
"                  ELSE
"
"                     v_result := 'Y';
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"               p_res := v_result;
"
"
"
"      ELSIF p_type = 'R' THEN
"
"
"
"               OPEN c1;
"
"               FETCH c1 INTO cr1;
"
"
"
"                  IF c1%FOUND THEN
"
"                     EXECUTE IMMEDIATE 'DROP TABLE PHASE_PARAM_EXCEP_TEMP';
"
"                  END IF;
"
"
"
"               CLOSE c1;
"
"
"
"                 DELETE phase_param_excep_upload
"
"                  WHERE ppeu_bu       = p_bu
"
"                    AND ppeu_type = p_type;
"
"
"
"                   EXECUTE IMMEDIATE 'CREATE TABLE PHASE_PARAM_EXCEP_TEMP(PPET_UNIT           VARCHAR2(50),
"
"                                                                          PPET_PHASE           VARCHAR2(100),
"
"                                                                          PPET_PARAM           VARCHAR2(100)
"
"                                              )
"
"                              ORGANIZATION EXTERNAL (TYPE ORACLE_LOADER
"
"                                         DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                                  ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
"
"                                         SKIP 1
"
"                                         FIELDS TERMINATED BY ''|''
"
"                                         MISSING FIELD VALUES ARE NULL
"
"                                         REJECT ROWS WITH ALL NULL FIELDS
"
"                                            (PPET_UNIT           CHAR(255),
"
"                                                                         PPET_PHASE          CHAR(255),
"
"                                                                         PPET_PARAM          CHAR(255)
"
"                                             ))
"
"                                  LOCATION ('||p_dir||':'|| CHR (39) || p_file_name|| CHR (39) || ')) REJECT LIMIT UNLIMITED';
"
"
"
"                  EXECUTE IMMEDIATE 'INSERT INTO PHASE_PARAM_EXCEP_UPLOAD (SELECT '|| CHR(39) || p_bu || CHR(39) ||','||'
"
"                                               NULL,
"
"                                               PPET_UNIT,
"
"                                               NULL,
"
"                                               PPET_PHASE,
"
"                                               NULL,
"
"                                               PPET_PARAM,
"
"                                               NULL,
"
"                                               '''||p_type||''',
"
"                                               '|| CHR(39) || p_user || CHR(39) ||','||'
"
"                                               NULL,
"
"                                               NULL,
"
"                                               SYSDATE,
"
"                                               NULL,
"
"                                               NULL,
"
"                                               NULL,
"
"                                               NULL
"
"                                              FROM PHASE_PARAM_EXCEP_TEMP
"
"                                                   )';
"
"
"
"              EXECUTE IMMEDIATE 'DROP TABLE PHASE_PARAM_EXCEP_TEMP';
"
"
"
"               OPEN c2;
"
"               FETCH c2 INTO cr2;
"
"
"
"                  IF cr2.v_cnt = 0 THEN
"
"                     v_result := 'N';
"
"                  ELSE
"
"                     v_result := 'Y';
"
"                  END IF;
"
"
"
"               CLOSE c2;
"
"
"
"               p_res := v_result;
"
"        END IF;
"
"
"
"    END proc_upload_apqp_phase_param;
"
"
"
"
"
"
"
"    PROCEDURE proc_chk_apqp_phase_param
"
"    (
"
"    p_bu            VARCHAR2,
"
"    p_type                  VARCHAR2,
"
"    p_user            VARCHAR2,
"
"    p_res        OUT    VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"        IS
"
"    SELECT *
"
"      FROM phase_param_excep_upload
"
"     WHERE ppeu_bu       = p_bu
"
"       AND ppeu_type     = p_type ;
"
"
"
"
"
"
"
"    CURSOR c2
"
"        IS
"
"    SELECT ppeu_bu ,
"
"           ppeu_unit,
"
"           ppeu_phase_desc,
"
"           COUNT (*)
"
"      FROM phase_param_excep_upload
"
"     WHERE ppeu_bu       = p_bu
"
"       AND ppeu_type     = p_type
"
"    GROUP BY ppeu_bu ,
"
"           ppeu_unit,
"
"           ppeu_phase_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c3(c_unit VARCHAR2,c_desc varchar2)
"
"            IS
"
"     SELECT *
"
"       FROM apqp_phases
"
"      WHERE ap_bu = p_bu
"
"        AND ap_plnt = c_unit
"
"        AND ap_phase_desc = c_desc;
"
"
"
"    CURSOR c4
"
"        IS
"
"    SELECT ppeu_bu ,
"
"           ppeu_unit,
"
"           ppeu_phase_desc,
"
"           ppeu_param_desc,
"
"           COUNT (*)
"
"      FROM phase_param_excep_upload
"
"     WHERE ppeu_bu       = p_bu
"
"       AND ppeu_type     = p_type
"
"    GROUP BY ppeu_bu ,
"
"           ppeu_unit,
"
"           ppeu_phase_desc,
"
"           ppeu_param_desc
"
"    HAVING COUNT (*) > 1;
"
"
"
"    CURSOR c5(c_unit VARCHAR2,c_desc varchar2,c_param VARCHAR2)
"
"        IS
"
"     select *
"
"       from apqp_proc_param
"
"      where app_bu = p_bu
"
"        and app_plnt = c_unit
"
"            and app_phase_id = c_desc
"
"            and app_param_desc = c_param;
"
"
"
"    CURSOR c6(c_plnt VARCHAR2)
"
"        IS
"
"        SELECT *
"
"          FROM bus_unit_plants
"
"         WHERE bup_bu = p_bu
"
"           AND bup_name1 = c_plnt;
"
"
"
"    CURSOR c7(c_unit VARCHAR2,c_phase VARCHAR2)
"
"        IS
"
"     SELECT *
"
"       FROM apqp_phases
"
"      WHERE ap_bu = p_bu
"
"        AND ap_plnt = c_unit
"
"        AND ap_phase_desc = c_phase;
"
"
"
"
"
"       cr2            c2%ROWTYPE;
"
"       cr3            c3%ROWTYPE;
"
"       cr4            c4%ROWTYPE;
"
"       cr5            c5%ROWTYPE;
"
"       cr6            c6%ROWTYPE;
"
"       cr7            c7%ROWTYPE;
"
"
"
"       v_cre_type        VARCHAR2(1) := 'M';
"
"       v_exp            VARCHAR2(4000);
"
"       v_exp1            VARCHAR2(4000);
"
"       v_result            VARCHAR2(1) := 'N';
"
"       v_spec_char        VARCHAR2(1) := 'N';
"
"       v_phase_id        VARCHAR2(100);
"
"       v_param_id        VARCHAR2(100);
"
"       v_unit        VARCHAR2(100);
"
"    BEGIN
"
"
"
"       IF p_type = 'P' THEN
"
"
"
"            UPDATE phase_param_excep_upload
"
"               SET ppeu_ref      = NULL,
"
"                   ppeu_upd_by   = p_user,
"
"                   ppeu_upd_date = SYSDATE
"
"             WHERE ppeu_bu       = p_bu
"
"               AND ppeu_type = p_type;
"
"
"
"              v_result := 'N';
"
"              v_spec_char := 'N';
"
"
"
"              FOR cr1 IN c1
"
"              LOOP
"
"
"
"                 v_exp := NULL;
"
"
"
"                 OPEN c2;
"
"                 FETCH c2 INTO cr2;
"
"
"
"                    IF c2%FOUND THEN
"
"                       v_exp := v_exp||' Duplicate Record exists.';
"
"
"
"                    END IF;
"
"
"
"                 CLOSE c2;
"
"
"
"                 open c3(cr1.ppeu_unit,cr1.ppeu_phase_desc);
"
"                 fetch c3 into cr3;
"
"                     IF c3%FOUND THEN
"
"                       v_exp := v_exp||' Phase already exists.';
"
"                    END IF;
"
"                 close c3;
"
"
"
"                OPEN c6(cr1.ppeu_unit);
"
"                FETCH c6 INTO cr6;
"
"                   IF c6%NOTFOUND THEN
"
"                      v_exp := v_exp||' Unit not found.';
"
"                   END IF;
"
"
"
"                CLOSE c2;
"
"
"
"                 IF cr1.ppeu_unit IS NULL THEN
"
"                  v_exp := v_exp||' Unit should not be null.';
"
"                 END IF;
"
"
"
"                 IF cr1.ppeu_phase_desc IS NULL THEN
"
"                  v_exp := v_exp||' Phase should not be null.';
"
"                 END IF;
"
"
"
"                 IF cr1.ppeu_param_desc IS NULL THEN
"
"                  v_exp := v_exp||' Parameter should not be null.';
"
"                 END IF;
"
"
"
"
"
"                 IF cr1.ppeu_phase_desc IS NOT NULL THEN
"
"
"
"                    proc_chk_excep_special_char(cr1.ppeu_phase_desc,
"
"                                    v_spec_char);
"
"
"
"                    IF v_spec_char = 'Y' THEN
"
"                       NULL;
"
"                       --v_exp := v_exp||' Special Characters not allowed.';
"
"                    END IF;
"
"
"
"                 END IF;
"
"
"
"
"
"
"
"                 IF v_exp IS NOT NULL OR v_exp1 IS NOT NULL THEN
"
"
"
"                    UPDATE phase_param_excep_upload
"
"                       SET ppeu_ref      = LTRIM(v_exp,' '),
"
"                           ppeu_upd_by   = p_user,
"
"                           ppeu_upd_date = SYSDATE
"
"                     WHERE ppeu_bu       = p_bu
"
"                       AND ppeu_type = p_type
"
"                       AND ppeu_unit = cr1.ppeu_unit
"
"                       AND ppeu_phase_desc = cr1.ppeu_phase_desc;
"
"
"
"                    v_result := 'Y';
"
"
"
"                 END IF;
"
"
"
"              END LOOP c1;
"
"
"
"           p_res := v_result;
"
"
"
"       ELSIF p_type = 'R' THEN
"
"
"
"            UPDATE phase_param_excep_upload
"
"               SET ppeu_ref      = NULL,
"
"                   ppeu_upd_by   = p_user,
"
"                   ppeu_upd_date = SYSDATE
"
"             WHERE ppeu_bu       = p_bu
"
"               AND ppeu_type = p_type;
"
"
"
"              v_result := 'N';
"
"              v_spec_char := 'N';
"
"
"
"              FOR cr1 IN c1
"
"              LOOP
"
"
"
"                 v_exp := NULL;
"
"
"
"                 OPEN c4;
"
"                 FETCH c4 INTO cr4;
"
"
"
"                    IF c4%FOUND THEN
"
"                       v_exp := v_exp||' Duplicate Record exists.';
"
"                    END IF;
"
"
"
"                 CLOSE c4;
"
"
"
"                OPEN c6(cr1.ppeu_unit_name);
"
"                FETCH c6 INTO cr6;
"
"                   IF c6%NOTFOUND THEN
"
"                      v_exp := v_exp||' Unit not found.';
"
"                   ELSE
"
"                                      v_unit := cr6.bup_plant_id;
"
"                   END IF;
"
"
"
"                CLOSE c6;
"
"
"
"                OPEN c7(v_unit,cr1.ppeu_phase_desc);
"
"                FETCH c7 INTO cr7;
"
"                   IF c7%NOTFOUND THEN
"
"                      v_exp := v_exp||' Phase not found.';
"
"                   ELSE
"
"                     v_phase_id := cr7.ap_phase_id;
"
"                   END IF;
"
"                CLOSE c7;
"
"
"
"                 open c5(cr1.ppeu_unit,cr1.ppeu_phase_desc,cr1.ppeu_param_desc);
"
"                 fetch c5 into cr5;
"
"                     IF c5%FOUND THEN
"
"                       v_exp := v_exp||' Parameter already exists.';
"
"
"
"                    END IF;
"
"                 close c5;
"
"
"
"                 IF cr1.ppeu_unit_name IS NULL THEN
"
"                  v_exp := v_exp||' Unit should not be null.';
"
"                 END IF;
"
"
"
"                 IF cr1.ppeu_phase_desc IS NULL THEN
"
"                  v_exp := v_exp||' Phase should not be null.';
"
"                 END IF;
"
"
"
"                 IF cr1.ppeu_param_desc IS NULL THEN
"
"                  v_exp := v_exp||' Parameter should not be null.';
"
"                 END IF;
"
"
"
"
"
"
"
"                 IF cr1.ppeu_param_desc IS NOT NULL THEN
"
"
"
"                    proc_chk_excep_special_char(cr1.ppeu_phase_desc,
"
"                                    v_spec_char);
"
"
"
"                    IF v_spec_char = 'Y' THEN
"
"                       NULL;
"
"                       --v_exp := v_exp||' Special Characters not allowed.';
"
"                    END IF;
"
"
"
"                 END IF;
"
"
"
"                                --IF v_unit IS NOT NULL AND v_phase_id IS NOT NULL AND v_param_id IS NOT NULL THEN
"
"
"
"                  SELECT MAX(app_param_id)
"
"                                    INTO v_param_id
"
"                                    FROM apqp_proc_param
"
"                                   WHERE app_bu    =  p_bu
"
"                                     AND app_plnt  =  cr1.ppeu_unit;
"
"
"
"                   UPDATE phase_param_excep_upload
"
"                       SET ppeu_unit      = v_unit,
"
"                           ppeu_phase_id   = v_phase_id,
"
"                           ppeu_param_id = v_param_id
"
"                     WHERE ppeu_bu       = p_bu
"
"                       AND ppeu_type = p_type
"
"                       AND ppeu_unit_name = cr1.ppeu_unit_name
"
"                       AND ppeu_phase_desc = cr1.ppeu_phase_desc
"
"                       AND ppeu_param_desc = cr1.ppeu_param_desc;
"
"                     --END IF;
"
"
"
"                 IF v_exp IS NOT NULL OR v_exp1 IS NOT NULL THEN
"
"
"
"                    UPDATE phase_param_excep_upload
"
"                       SET ppeu_ref      = LTRIM(v_exp,' '),
"
"                           ppeu_upd_by   = p_user,
"
"                           ppeu_upd_date = SYSDATE
"
"                     WHERE ppeu_bu       = p_bu
"
"                       AND ppeu_type = p_type
"
"                       AND ppeu_unit_name = cr1.ppeu_unit_name
"
"                       AND ppeu_phase_desc = cr1.ppeu_phase_desc
"
"                       AND ppeu_param_desc = cr1.ppeu_param_desc;
"
"
"
"                    v_result := 'Y';
"
"
"
"                 END IF;
"
"
"
"              END LOOP c1;
"
"
"
"           p_res := v_result;
"
"
"
"       END IF;
"
"
"
"    END proc_chk_apqp_phase_param;
"
"
"
"    PROCEDURE proc_ins_apqp_phase_param
"
"    (
"
"    p_bu  VARCHAR2,
"
"    p_type VARCHAR2,
"
"    p_user VARCHAR2
"
"    )
"
"    IS
"
"    CURSOR c1
"
"       IS
"
"    SELECT *
"
"      FROM phase_param_excep_upload
"
"     WHERE ppeu_bu         = p_bu
"
"       AND ppeu_type = p_type;
"
"
"
"        CURSOR c2(c_plnt  VARCHAR2,c_phase  VARCHAR2)
"
"       IS
"
"    SELECT *
"
"      FROM apqp_phases
"
"     WHERE ap_bu         = p_bu
"
"       AND ap_plnt   = c_plnt
"
"       AND ap_phase_id = c_phase;
"
"
"
"    v_phase_id      VARCHAR2(10);
"
"    v_param_id      VARCHAR2(10);
"
"
"
"    cr2  c2%ROWTYPE;
"
"
"
"    BEGIN
"
"
"
"             IF p_type = 'P' THEN
"
"
"
"        FOR cr1 IN c1
"
"        LOOP
"
"
"
"            SELECT nvl(MAX(ap_phase_id),0)
"
"              INTO v_phase_id
"
"              FROM apqp_phases
"
"             WHERE ap_bu = p_bu
"
"               AND ap_plnt = cr1.ppeu_unit;
"
"
"
"                v_phase_id := func_get_next_id(v_phase_id);
"
"
"
"                 INSERT INTO apqp_phases(ap_bu         ,
"
"                        ap_plnt        ,
"
"                        ap_phase_id    ,
"
"                        ap_phase_desc  ,
"
"                        ap_cre_by      ,
"
"                        ap_cre_date
"
"                            )
"
"                         VALUES(p_bu         ,
"
"                        cr1.ppeu_unit       ,
"
"                        v_phase_id    ,
"
"                        cr1.ppeu_phase_desc  ,
"
"                        p_user      ,
"
"                        SYSDATE
"
"                               );
"
"
"
"                    DELETE phase_param_excep_upload
"
"             WHERE ppeu_bu         = p_bu
"
"               AND ppeu_type  = p_type
"
"               AND ppeu_unit  = cr1.ppeu_unit
"
"               AND ppeu_phase_desc = cr1.ppeu_phase_desc;
"
"
"
"        END LOOP c1;
"
"
"
"
"
"
"
"         ELSIF p_type = 'R' THEN
"
"
"
"                     FOR cr1 IN c1
"
"                 LOOP
"
"
"
"                     SELECT nvl(MAX(app_param_id),0)
"
"                       INTO v_param_id
"
"                       FROM apqp_proc_param
"
"                      WHERE app_bu = p_bu
"
"                        AND app_plnt = cr1.ppeu_unit;
"
"
"
"                         v_param_id := func_get_next_id(v_param_id);
"
"
"
"
"
"                         OPEN c2(cr1.ppeu_unit,cr1.ppeu_phase_desc);
"
"                         FETCH c2 INTO cr2;
"
"                         CLOSE c2;
"
"
"
"
"
"                     INSERT INTO apqp_proc_param(app_bu         ,
"
"                                 app_plnt        ,
"
"                                 app_phase_id    ,
"
"                                 app_param_id    ,
"
"                                 app_param_desc  ,
"
"                                 app_cre_by      ,
"
"                                 app_cre_date
"
"                                     )
"
"                                  VALUES(p_bu         ,
"
"                                 cr1.ppeu_unit       ,
"
"                                 cr1.ppeu_phase_id     ,
"
"                                 v_param_id    ,
"
"                                 cr1.ppeu_param_desc  ,
"
"                                 p_user      ,
"
"                                 SYSDATE
"
"                                        );
"
"
"
"                             DELETE phase_param_excep_upload
"
"                      WHERE ppeu_bu         = p_bu
"
"                        AND ppeu_type  = p_type
"
"                        AND ppeu_unit  = cr1.ppeu_unit
"
"                        AND ppeu_phase_desc = cr1.ppeu_phase_desc
"
"                        AND ppeu_param_desc = cr1.ppeu_param_desc;
"
"
"
"                        END LOOP c1;
"
"
"
"         END IF;
"
"    END proc_ins_apqp_phase_param;
"
"/*
"
"PROCEDURE proc_mig_cs_locality (p_bu        VARCHAR2,
"
"                     p_fname    VARCHAR2,
"
"                     p_sep        VARCHAR2,
"
"                     p_user        VARCHAR2,
"
"                 p_res    OUT    VARCHAR2
"
"                            )
"
"    IS
"
"    TYPE ins_boq IS RECORD(SM_LOCLTY_NAME    VARCHAR2 (50),
"
"                               SM_CITY_NAME    VARCHAR2 (30),
"
"                               SM_POSTAL_CODE    VARCHAR2 (15)
"
"                   );
"
"
"
"    TYPE t_boq IS TABLE OF ins_boq INDEX BY PLS_INTEGER;
"
"
"
"    TYPE t_exc IS TABLE OF cs_loc_mig%ROWTYPE INDEX BY PLS_INTEGER;
"
"
"
"    r_boq    t_boq;
"
"    r_exc    t_exc;
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
"        EXECUTE IMMEDIATE 'CREATE TABLE EXCEL_MIGRATION  (SM_LOCLTY_NAME    VARCHAR2 (50),
"
"                                                              SM_CITY_NAME    VARCHAR2 (30),
"
"                                                              SM_POSTAL_CODE    VARCHAR2 (15)
"
"                                              )
"
"            ORGANIZATION EXTERNAL(
"
"                    TYPE ORACLE_LOADER
"
"                    DEFAULT DIRECTORY FILE_ATTACH_DIR
"
"                    ACCESS PARAMETERS(
"
"                              RECORDS DELIMITED BY NEWLINE
"
"                                                                SKIP 1
"
"                                                                FIELDS TERMINATED BY ''|''
"
"                                                                MISSING FIELD VALUES ARE NULL
"
"                                                                REJECT ROWS WITH ALL NULL FIELDS
"
"                                                                (SM_LOCLTY_NAME    CHAR(255),
"
"                                     SM_CITY_NAME    CHAR(255),
"
"                                     SM_POSTAL_CODE    CHAR(255)
"
"                                                                )
"
"                                                                          )
"
"                                                      LOCATION ('''||p_fname||''')
"
"                                                            ) REJECT LIMIT UNLIMITED';
"
"
"
"            EXECUTE IMMEDIATE 'SELECT '''||p_bu||''' ,
"
"                          TRIM(SM_LOCLTY_NAME),
"
"                          TRIM(SM_CITY_NAME),
"
"                          TRIM(SM_POSTAL_CODE),
"
"                          ''E'',
"
"                          '''||NULL||''',
"
"                          '''|P_USER||''',
"
"                          '''||SYSDATE||''',
"
"                          '''||NULL||''',
"
"                          '''||NULL||'''
"
"                         FROM excel_migration' BULK COLLECT INTO r_exc;
"
"
"
"        FORALL indx IN 1..r_exc.COUNT()
"
"
"
"            INSERT INTO CS_LOC_MIG VALUES r_exc(indx);
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
"END proc_mig_cs_locality;
"
"
"
"PROCEDURE proc_mig_cs_locality_exp(p_bu        VARCHAR2,
"
"                       p_fname    VARCHAR2,
"
"                       p_sep        VARCHAR2,
"
"                       p_user        VARCHAR2,
"
"                   p_res    OUT    VARCHAR2
"
"                               )
"
"IS
"
"CURSOR c_exc
"
"  IS
"
"SELECT *
"
"  FROM cs_loc_mig
"
" WHERE clm_bu = p_bu;
"
"
"
"CURSOR c_param(c1_param VARCHAR2)
"
"  IS
"
"SELECT *
"
"  FROM cities
"
" WHERE city_name1 = c1_param;
"
"
"
"v_err_msg    VARCHAR2(4000);
"
"v_flag        VARCHAR2(1);
"
"
"
"BEGIN
"
"  v_flag := 'N';
"
"  p_res := 'N';
"
"
"
"  FOR r_exc IN c_exc
"
"  LOOP
"
"    OPEN c_value(r_exc.clm_city_name);
"
"    FETCH c_value INTO cr_value;
"
"      IF c_value%NOTFOUND THEN
"
"         v_err_msg := v_err_msg||'City not found.';
"
"      END IF;
"
"    CLOSE c_value;
"
"
"
"  IF v_err_msg IS NOT NULL THEN
"
"  --raise_application_error(-20999,'HRM'||trim(v_err_msg)||chr(10)||p_enqry_no||'~'||r_exc.eobe_seq_no);
"
"  UPDATE cs_loc_mig
"
"     SET clm_exc_status = 'N',
"
"         clm_exc_ref       = TRIM(v_err_msg),
"
"         clm_upd_by     = p_user,
"
"         clm_upd_date    = SYSDATE
"
"   WHERE clm_bu = p_bu
"
"     AND clm_loclty_name = r_exc.clm_loclty_name;
"
"
"
"  p_res := 'Y';
"
"  v_err_msg := NULL;
"
"
"
"  END IF;
"
"  BEGIN
"
"    SELECT COUNT(*)
"
"      INTO v_exe_cnt
"
"      FROM cs_loc_mig
"
"     WHERE clm_bu = p_bu
"
"       AND clm_exc_status = 'N';
"
"  EXCEPTION WHEN NO_DATA_FOUND THEN
"
"    v_exe_cnt := 0;
"
"  END;
"
"  IF v_exe_cnt > 0 THEN
"
"     p_res := 'Y';
"
"  END IF;
"
"  END LOOP c_exc;
"
"END proc_mig_cs_locality_exp;
"
"
"
"
"
"PROCEDURE proc_ins_cs_locality(p_bu        VARCHAR2,
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
"TYPE typ_mirg IS RECORD (SM_LOCLTY_NAME    VARCHAR2 (50),
"
"                         SM_CITY_NAME    VARCHAR2 (30),
"
"                         SM_POSTAL_CODE    VARCHAR2 (15)
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
"
"
"v_sql    VARCHAR2(4000);
"
"v_fpath    VARCHAR2(1000);
"
"v_loclty_id    VARCHAR2(250);
"
"v_city        VARCHAR2(250);
"
"
"
"BEGIN
"
"
"
" -- RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'/'||p_fname||'/'||p_sep||'/'||p_user);
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
"  EXECUTE IMMEDIATE 'DROP TABLE scm_migration';
"
"
"
"  v_sql := 'CREATE TABLE scm_migration(SM_LOCLTY_NAME    VARCHAR2 (50),
"
"                                       SM_CITY_NAME    VARCHAR2 (30),
"
"                                       SM_POSTAL_CODE    VARCHAR2 (15)
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
"                                           (SM_LOCLTY_NAME    CHAR(255),
"
"                                SM_CITY_NAME    CHAR(255),
"
"                                SM_POSTAL_CODE    CHAR(255)
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
"  --RAISE_APPLICATION_ERROR(-20999,'HRM'||v_sql);
"
"  FOR indx IN 1..r_mirg_dtls.COUNT
"
"    LOOP
"
"
"
"    RAISE_APPLICATION_ERROR(-20999,'HRM'||p_bu||'/'||p_fname||'/'||p_sep||'/'||p_user);
"
"
"
"      SELECT FUNC_FIND_NEXT_ID(NVL(MAX(accl_loclty_id),'0000'))
"
"        INTO v_loclty_id
"
"        FROM air_clr_cs_locality
"
"       WHERE accl_bu = p_bu;
"
"      BEGIN
"
"      SELECT city_id
"
"        INTO v_city
"
"        FROM cities
"
"       WHERE UPPER(city_name1) = UPPER(r_mirg_dtls(indx).sm_city_name);
"
"
"
"      EXCEPTION WHEN NO_DATA_FOUND THEN
"
"        RAISE_APPLICATION_ERROR(-20005,'ADM');
"
"      END;
"
"
"
"      INSERT INTO air_clr_cs_locality(accl_bu,
"
"                                      accl_loclty_id,
"
"                                      accl_loclty_name,
"
"                                      accl_city_id,
"
"                                      accl_city_name,
"
"                                      accl_cre_by,
"
"                                      accl_cre_date,
"
"                      accl_postal_code
"
"                          )
"
"                   VALUES(p_bu,
"
"                      v_loclty_id,
"
"                          r_mirg_dtls(indx).sm_loclty_name,
"
"                      v_city,
"
"                      r_mirg_dtls(indx).sm_city_name,
"
"                      p_user,
"
"                      SYSDATE,
"
"                      r_mirg_dtls(indx).sm_postal_code
"
"                      );
"
"
"
"    END LOOP ;
"
"
"
"END proc_ins_cs_locality;*/
"
"
"
"END pkg_config_migration;"
/
