prompt --application/shared_components/user_interface/lovs/lov_wf_entity
begin
--   Manifest
--     LOV_WF_ENTITY
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
 p_id=>wwv_flow_imp.id(6581793269360069601)
,p_lov_name=>'LOV_WF_ENTITY'
,p_static_id=>'lov-wf-entity'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT bu_id, BU_NAME1',
'  FROM business_units',
' ORDER BY bu_id'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'BU_ID'
,p_display_column_name=>'BU_ID'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6581793723170069601)
,p_query_column_name=>'BU_ID'
,p_heading=>'Entity'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6581794124454069603)
,p_query_column_name=>'BU_NAME1'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
