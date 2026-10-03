prompt --application/shared_components/user_interface/lovs/lov_wfm0010_subclass
begin
--   Manifest
--     LOV_WFM0010_SUBCLASS
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
 p_id=>wwv_flow_imp.id(6620340583746274088)
,p_lov_name=>'LOV_WFM0010_SUBCLASS'
,p_static_id=>'lov-wfm0010-subclass'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT subcls_desc1,',
'       subcls_id       ',
'  FROM sub_classes',
' WHERE subcls_bu = :GLOBAL_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SUBCLS_ID'
,p_display_column_name=>'SUBCLS_DESC1'
,p_default_sort_column_name=>'SUBCLS_DESC1'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6620348956116277920)
,p_query_column_name=>'SUBCLS_DESC1'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6620348545380277920)
,p_query_column_name=>'SUBCLS_ID'
,p_heading=>'Subclass ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
