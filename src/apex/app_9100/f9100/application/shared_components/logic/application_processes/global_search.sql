prompt --application/shared_components/logic/application_processes/global_search
begin
--   Manifest
--     APPLICATION PROCESS: GLOBAL_SEARCH
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(5817720484492057384)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'GLOBAL_SEARCH'
,p_static_id=>'global-search'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_wspace      VARCHAR2(2000);',
'   v_link        VARCHAR2(2000);',
'   v_app_no      NUMBER(5);',
'   v_page_alias  VARCHAR2 (2000);',
'   v_app_alias   VARCHAR2(2000);',
'   v_schema      VARCHAR2(2000);',
'BEGIN',
'   IF :GLOBAL_SEARCH IS NOT NULL THEN ',
'        SELECT user_id ',
'          INTO v_schema',
'          FROM schema_det;',
'		  ',
'        SELECT wbf_appl_no,LOWER(page_alias),workspace',
'          INTO v_app_no,v_page_alias,v_wspace',
'          FROM wapl_bus_fun,apex_application_pages,wapl_user_bus_fun_accs',
'         WHERE UPPER(WBF_BUS_FUN_NAME)= UPPER(:GLOBAL_SEARCH)',
'           AND wbf_visible= ''Y''',
'           AND wbf_active_flag = ''Y''',
'           AND wbf_page_no = page_id ',
'           AND wubfa_bus_fun_id = wbf_bus_fun_id',
'           AND wubfa_user_id = :global_user',
'           AND wubfa_bu = :global_bu',
'           AND application_id = wbf_appl_no;',
'',
'        SELECT LOWER(ALIAS)page_alias',
'          INTO v_app_alias ',
'          FROM apex_applications WHERE application_id = v_app_no AND workspace = v_wspace;   ',
'        ',
'        v_link :=owa_util.get_cgi_env(''REQUEST_PROTOCOL'')||''://''||owa_util.get_cgi_env(''HTTP_HOST'')||''/ords/r/''||LOWER(v_schema);',
'',
'        IF v_app_no IS NOT NULL THEN ',
'           HTP.P(v_link||''/''||v_app_alias||''/''||v_page_alias||''?session=''||:app_session);',
'        END IF;',
'        ',
'   END IF;',
'   EXCEPTION WHEN NO_DATA_FOUND THEN',
'        Raise_Application_Error(-20999,''Application not defined for the Page.''||:GLOBAL_SEARCH);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'24690310990'
);
wwv_flow_imp.component_end;
end;
/
