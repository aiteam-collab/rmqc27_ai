prompt --application/shared_components/logic/application_computations/global_jas_rpt3
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_JAS_RPT3
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
 p_id=>wwv_flow_imp.id(5530439037905195393)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_JAS_RPT3'
,p_static_id=>'global-jas-rpt-3'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''&output=pdf&j_username=''',
'        ||juc_username',
'        || ''&j_password=''',
'        || juc_password',
'  FROM jasper_url_config'))
,p_version_scn=>'17791673955'
);
wwv_flow_imp.component_end;
end;
/
