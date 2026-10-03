prompt --application/shared_components/user_interface/lovs/lov_parameter_sys0015
begin
--   Manifest
--     LOV(PARAMETER)SYS0015
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.0'
,p_default_workspace_id=>70183973784188715
,p_default_application_id=>9100
,p_default_id_offset=>70189399542726671
,p_default_owner=>'RMQC27_AI'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(7973570063684452787)
,p_lov_name=>'LOV(PARAMETER)SYS0015'
,p_static_id=>'lov-parameter-sys'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  SAP_PARAM_ID,SAP_PARAM_DESC',
' FROM STD_API_PARAMS'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SAP_PARAM_ID'
,p_display_column_name=>'SAP_PARAM_DESC'
,p_default_sort_column_name=>'SAP_PARAM_DESC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7973570829388452796)
,p_query_column_name=>'SAP_PARAM_DESC'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7973570338488452792)
,p_query_column_name=>'SAP_PARAM_ID'
,p_heading=>'Parameter'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
