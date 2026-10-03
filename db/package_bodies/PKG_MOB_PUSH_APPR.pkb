CREATE OR REPLACE
"PACKAGE BODY pkg_mob_push_appr AS
"
"
"
"    PROCEDURE proc_register_user_token (
"
"        p_bu     VARCHAR2,
"
"        p_plnt   VARCHAR2,
"
"        p_user   VARCHAR2,
"
"        p_emp_id VARCHAR2,
"
"        p_token  VARCHAR2
"
"    ) IS
"
"
"
"        CURSOR c1 IS
"
"        SELECT
"
"            1
"
"        FROM
"
"            mob_user_tokens
"
"        WHERE
"
"                mut_bu = p_bu
"
"            AND mut_emp_id = p_emp_id;
"
"
"
"        cr1   c1%rowtype;
"
"        v_seq NUMBER(10);
"
"    BEGIN
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"        IF c1%found THEN
"
"            UPDATE mob_user_tokens
"
"            SET
"
"                mut_token = p_token,
"
"                mut_upd_by = p_user,
"
"                mut_upd_date = sysdate
"
"            WHERE mut_bu = p_bu
"
"            AND mut_emp_id = p_emp_id;
"
"        ELSE
"
"            SELECT
"
"                nvl(MAX(mut_seq), 0) + 1
"
"            INTO v_seq
"
"            FROM
"
"                mob_user_tokens
"
"            WHERE
"
"                mut_bu = p_bu;
"
"
"
"            INSERT INTO mob_user_tokens (
"
"                mut_bu,
"
"                mut_seq,
"
"                mut_token,
"
"                mut_emp_id,
"
"                mut_plnt,
"
"                mut_cre_by,
"
"                mut_cre_date
"
"            ) VALUES (
"
"                p_bu,
"
"                v_seq,
"
"                p_token,
"
"                p_emp_id,
"
"                p_plnt,
"
"                p_user,
"
"                sysdate
"
"            );
"
"
"
"        END IF;
"
"
"
"        CLOSE c1;
"
"        COMMIT;
"
"    EXCEPTION
"
"        WHEN OTHERS THEN
"
"            raise_application_error(-20999, 'Error on proc_register_user_token: ' || sqlerrm);
"
"    END;
"
"
"
"    PROCEDURE proc_send_notification (
"
"        p_bu     VARCHAR2,
"
"        p_emp_id VARCHAR2,
"
"        p_title  VARCHAR2,
"
"        p_msg    VARCHAR2,
"
"        p_source VARCHAR2 DEFAULT 'MOBILE',
"
"		p_app_id VARCHAR2,
"
"		p_file_path  VARCHAR2
"
"    ) IS
"
"
"
"        CURSOR c1 IS
"
"        SELECT mut_token FROM mob_user_tokens
"
"        WHERE mut_bu = p_bu AND mut_emp_id = p_emp_id
"
"        AND mut_token is not null;
"
"
"
"        cr1     c1%rowtype;
"
"        v_res   VARCHAR2(4000);
"
"        v_seq   NUMBER(10);
"
"        v_token VARCHAR2(500);
"
"        v_error VARCHAR2(500);
"
"    BEGIN
"
"        OPEN c1;
"
"        FETCH c1 INTO cr1;
"
"        IF c1%found THEN
"
"            proc_send_push_notif_v6(p_bu,p_title, p_msg, cr1.mut_token, p_emp_id, p_app_id, p_file_path, v_res);
"
"            v_token := cr1.mut_token;
"
"        END IF;
"
"        CLOSE c1;
"
"    EXCEPTION
"
"        WHEN OTHERS THEN
"
"            v_error := sqlerrm;
"
"            raise_application_error(-20999, 'Error on proc_send_notification: ' || sqlerrm);
"
"    END;
"
"END;"
/
