prompt --application/shared_components/security/authentications/application_express_authentication
begin
--   Manifest
--     AUTHENTICATION: Application Express Authentication
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(10650463415975505293)
,p_name=>'Application Express Authentication'
,p_static_id=>'application-express-authentication'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'authentication_function', 'func_auth_login',
  'enable_legacy_attributes', 'N')).to_clob
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION func_auth_login (p_username IN VARCHAR2, p_password IN VARCHAR2)',
'   RETURN BOOLEAN',
'AS',
'   CURSOR c1',
'   IS',
'      SELECT ''x''',
'        FROM appl_users, employees',
'       WHERE     appluser_bu = emp_bu',
'             AND appluser_emp_id = emp_emp_id',
'             AND UPPER (appluser_id) = UPPER (:P9999_USERNAME)',
'             AND (appluser_allow_cc_user = ''N''',
'                  OR (appluser_allow_cc_user = ''Y''',
'                      AND appluser_emp_id = :P9999_CC_EMP_ID))',
'             AND (appluser_user_type <> ''O''',
'                  OR (appluser_user_type = ''O''',
'                      AND appluser_emp_id = :P9999_CC_EMP_ID))',
'             AND appluser_password =',
'                    func_get_hash (:P9999_USERNAME, :P9999_PASSWORD)',
'             AND TRUNC (SYSDATE) BETWEEN TRUNC (appluser_eff_from)',
'                                     AND TRUNC (appluser_eff_to)',
'             AND appluser_status = ''A''',
'             AND emp_status IN (''A'', ''N'')',
'      UNION ALL',
'      SELECT ''x''',
'        FROM appl_users',
'       WHERE UPPER (appluser_id) = UPPER (:P9999_USERNAME)',
'             AND appluser_password =',
'                    func_get_hash (:P9999_USERNAME, :P9999_PASSWORD)',
'             AND (appluser_user_type <> ''O''',
'                  OR (appluser_user_type = ''O''',
'                      AND appluser_emp_id = :P9999_CC_EMP_ID))',
'             AND TRUNC (SYSDATE) BETWEEN TRUNC (appluser_eff_from)',
'                                     AND TRUNC (appluser_eff_to)',
'             AND appluser_status = ''A'';',
'',
'   cr1           c1%ROWTYPE;',
'',
'   attempts      VARCHAR2 (10);',
'   tot_attempt   NUMBER;',
'BEGIN',
'   SELECT PDA_LOGIN_ATTEMPT',
'     INTO tot_attempt',
'     FROM POLICY_DATA',
'    WHERE PDA_BU = (SELECT APPLUSER_BU',
'                      FROM APPL_USERS',
'                     WHERE APPLUSER_ID = :P9999_USERNAME ',
'                       AND (appluser_user_type <> ''O''',
'                          OR (appluser_user_type = ''O''',
'                      AND appluser_emp_id = :P9999_CC_EMP_ID)));',
'',
'   OPEN c1;',
'',
'   FETCH c1 INTO cr1;',
'',
'   IF c1%FOUND',
'   THEN',
'      APEX_UTIL.set_authentication_result (0);',
'      :LOGIN_ATTEMPTS := 0;',
'',
'      UPDATE appl_users',
'         SET appluser_login_atm = 0',
'       WHERE UPPER (appluser_id) = UPPER (:p9999_username)',
'             AND appluser_emp_id = :P9999_CC_EMP_ID;',
'',
'      RETURN TRUE;',
'   ELSE',
'      :LOGIN_ATTEMPTS := NVL (:LOGIN_ATTEMPTS, 0) + 1;',
'      attempts := tot_attempt - :LOGIN_ATTEMPTS;',
'      APEX_UTIL.set_authentication_result (4);',
'      apex_error.add_error (',
'         p_message            =>   ''Invalid Login Credentials. You are left with ''',
'                                || attempts',
'                                || '' more attempts.'',',
'         p_display_location   => apex_error.c_inline_in_notification);',
'',
'      IF attempts = 1',
'      THEN',
'         UPDATE appl_users',
'            SET appluser_login_atm = 2',
'          WHERE UPPER (appluser_id) = UPPER (:p9999_username)',
'                AND appluser_emp_id = :p9999_cc_emp_id;',
'      ELSIF attempts = 2',
'      THEN',
'         UPDATE appl_users',
'            SET appluser_login_atm = 1',
'          WHERE UPPER (appluser_id) = UPPER (:p9999_username)',
'                AND appluser_emp_id = :p9999_cc_emp_id;',
'      ELSIF attempts = 0',
'      THEN',
'         UPDATE appl_users',
'            SET appluser_login_atm = 3',
'          WHERE UPPER (appluser_id) = UPPER (:p9999_username)',
'                AND appluser_emp_id = :p9999_cc_emp_id;',
'      END IF;',
'',
'      IF :LOGIN_ATTEMPTS = tot_attempt',
'      THEN',
'         UPDATE appl_users',
'            SET appluser_lock_chk = ''Y''',
'          WHERE UPPER (appluser_id) = UPPER (:p9999_username)',
'                AND appluser_emp_id = :p9999_cc_emp_id;',
'      END IF;',
'',
'      RETURN FALSE;',
'   END IF;',
'',
'   CLOSE c1;',
'END;'))
,p_invalid_session_type=>'LOGIN'
,p_cookie_name=>'&WORKSPACE_COOKIE.'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'18285634483'
);
wwv_flow_imp.component_end;
end;
/
