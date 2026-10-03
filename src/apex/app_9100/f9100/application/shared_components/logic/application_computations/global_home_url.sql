prompt --application/shared_components/logic/application_computations/global_home_url
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_HOME_URL
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
 p_id=>wwv_flow_imp.id(5972730060505207824)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_HOME_URL'
,p_static_id=>'global-home-url'
,p_computation_point=>'AFTER_LOGIN'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'f?p=&GLOBAL_MAIN_APP.:165:&APP_SESSION.'
,p_version_scn=>'23552421951'
);
wwv_flow_imp.component_end;
end;
/
