prompt --application/shared_components/logic/application_computations/global_login_page
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_LOGIN_PAGE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(6302787065962035779)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_LOGIN_PAGE'
,p_static_id=>'global-login-page'
,p_computation_point=>'BEFORE_FOOTER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' ',
' DECLARE',
'    CURSOR c1(v_bu VARCHAR2)',
'            IS',
'    SELECT *',
'       FROM USER_WEB_DASHBOARD_MASTER',
'     WHERE UWDM_BU  = v_bu',
'          AND UWDM_USER_ID = v (''app_user'');',
'          ',
'          cr1           c1%ROWTYPE; ',
'    ',
'    CURSOR c2(c_type        VARCHAR2)',
'            IS',
'    SELECT *',
'      FROM  USER_DASH_NOTIFY_MASTER         ',
'    WHERE  UDNM_BU     = ''RM''',
'         AND UDNM_TYPE = c_type;',
'         ',
'         cr2                c2%ROWTYPE;',
'         v_bu             VARCHAR2(5);',
'BEGIN',
'    BEGIN',
'    SELECT DISTINCT appluser_bu',
'      INTO v_bu',
'      FROM appl_users',
'     WHERE appluser_id = v (''app_user'')',
'       AND appluser_status = ''A'';',
'    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;   ',
'	END;',
'	',
'    OPEN c1(v_bu);',
'    FETCH c1 INTO cr1;',
'        IF c1%FOUND THEN',
'            ',
'            OPEN c2(cr1.uwdm_type);',
'            FETCH c2 INTO cr2;',
'                IF c2%FOUND THEN',
'                    RETURN cr2.udnm_page_no;',
'                ELSE',
'                    RETURN 165;',
'                END IF;',
'            CLOSE c2;',
'        ELSE',
'            RETURN 165;',
'        END IF;',
'    CLOSE c1;',
'END;    '))
,p_compute_when_type=>'NEVER'
,p_version_scn=>'26773968679'
);
wwv_flow_imp.component_end;
end;
/
