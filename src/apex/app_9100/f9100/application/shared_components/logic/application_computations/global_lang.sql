prompt --application/shared_components/logic/application_computations/global_lang
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_LANG
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
 p_id=>wwv_flow_imp.id(5944806549844420915)
,p_computation_sequence=>10
,p_computation_item=>'GLOBAL_LANG'
,p_static_id=>'global-lang'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>'1'
,p_version_scn=>'18192957217'
);
wwv_flow_imp.component_end;
end;
/
