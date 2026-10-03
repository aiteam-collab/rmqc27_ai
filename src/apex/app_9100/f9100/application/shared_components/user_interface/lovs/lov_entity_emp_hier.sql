prompt --application/shared_components/user_interface/lovs/lov_entity_emp_hier
begin
--   Manifest
--     LOV_ENTITY_EMP_HIER
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
 p_id=>wwv_flow_imp.id(6527157771328868656)
,p_lov_name=>'LOV_ENTITY_EMP_HIER'
,p_static_id=>'lov-entity-emp-hier'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bu_id, bu_name1',
'  FROM business_units',
' GROUP BY bu_id, bu_name1',
' ORDER BY bu_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BU_ID'
,p_display_column_name=>'BU_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6527160328942875457)
,p_query_column_name=>'BU_ID'
,p_heading=>'Entity'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6527159861097875457)
,p_query_column_name=>'BU_NAME1'
,p_heading=>'Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
