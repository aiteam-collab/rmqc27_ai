prompt --application/shared_components/logic/application_processes/ref_fav
begin
--   Manifest
--     APPLICATION PROCESS: REF_FAV
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
 p_id=>wwv_flow_imp.id(7619579434762481635)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_name=>'REF_FAV'
,p_static_id=>'ref-fav'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  v_fav VARCHAR2(10);',
'BEGIN',
'   SELECT wubfa_user_fav',
'     INTO v_fav',
'     FROM wapl_bus_fun,wapl_user_bus_fun_accs',
'    WHERE wubfa_bus_fun_id = wbf_bus_fun_id',
'      AND wubfa_fav_bu = :Global_bu',
'      AND wubfa_user_id = :GLOBAL_USER',
'      AND wbf_appl_no = :APP_ID',
'      AND wbf_visible =''Y''',
'      AND wbf_page_no = :APP_PAGE_ID;',
'     htp.p (v_fav); ',
'   EXCEPTION WHEN NO_DATA_FOUND THEN',
'     htp.p (''N'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>'18195109551'
);
wwv_flow_imp.component_end;
end;
/
