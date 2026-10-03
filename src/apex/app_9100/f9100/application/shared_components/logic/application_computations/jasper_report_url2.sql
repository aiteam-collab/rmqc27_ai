prompt --application/shared_components/logic/application_computations/jasper_report_url2
begin
--   Manifest
--     APPLICATION COMPUTATION: JASPER_REPORT_URL2
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
 p_id=>wwv_flow_imp.id(6226045478739690429)
,p_computation_sequence=>10
,p_computation_item=>'JASPER_REPORT_URL2'
,p_static_id=>'jasper-report-url-2'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT JRC_RPT_URL||UPPER(SYS_CONTEXT (''USERENV'', ''CURRENT_SCHEMA''))',
'FROM JASPER_REPORT_CONFIG',
'where JRC_BU=:global_bu'))
,p_version_scn=>'23552568233'
);
wwv_flow_imp.component_end;
end;
/
