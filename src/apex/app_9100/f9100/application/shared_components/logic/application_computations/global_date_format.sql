prompt --application/shared_components/logic/application_computations/global_date_format
begin
--   Manifest
--     APPLICATION COMPUTATION: GLOBAL_DATE_FORMAT
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
 p_id=>wwv_flow_imp.id(11779480723228107321)
,p_computation_sequence=>777
,p_computation_item=>'GLOBAL_DATE_FORMAT'
,p_static_id=>'global-date-format'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT applctrl_df ',
'  FROM appl_control ',
' WHERE applctrl_bu=:global_bu'))
,p_version_scn=>'1'
);
wwv_flow_imp.component_end;
end;
/
