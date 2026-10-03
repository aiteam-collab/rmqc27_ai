prompt --application/shared_components/logic/application_computations/jasper_server_pwd
begin
--   Manifest
--     APPLICATION COMPUTATION: JASPER_SERVER_PWD
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
 p_id=>wwv_flow_imp.id(6226034108764634784)
,p_computation_sequence=>10
,p_computation_item=>'JASPER_SERVER_PWD'
,p_static_id=>'jasper-server-pwd'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT JRC_PASSWORD',
'FROM JASPER_REPORT_CONFIG',
'WHERE JRC_BU = :global_bu'))
,p_version_scn=>'23552569463'
);
wwv_flow_imp.component_end;
end;
/
