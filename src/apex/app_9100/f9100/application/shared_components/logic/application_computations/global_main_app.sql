prompt --application/shared_components/logic/application_computations/global_main_app
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_MAIN_APP
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
 p_id=>wwv_flow_imp.id(6945208183428948518)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_MAIN_APP'
,p_static_id=>'global-main-app'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    wbf_appl_no',
'FROM',
'    wapl_bus_fun',
'WHERE',
'        wbf_bus_fun_id = ''LOGIN''',
'    AND wbf_visible = ''N''',
'    AND wbf_active_flag = ''N'''))
,p_version_scn=>'23552896723'
);
wwv_flow_imp.component_end;
end;
/
