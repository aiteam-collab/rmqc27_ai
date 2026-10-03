prompt --application/shared_components/logic/application_computations/global_jas_rpt1
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_JAS_RPT1
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
 p_id=>wwv_flow_imp.id(5530395585241164932)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_JAS_RPT1'
,p_static_id=>'global-jas-rpt'
,p_computation_point=>'ON_NEW_INSTANCE'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT juc_ssl_url_bwr||''&ParentFolderUri=%2Freports%2F''||SYS_CONTEXT (''USERENV'', ''CURRENT_SCHEMA'')',
'  FROM jasper_url_config'))
,p_version_scn=>'17791642409'
);
wwv_flow_imp.component_end;
end;
/
