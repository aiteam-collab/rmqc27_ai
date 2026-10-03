prompt --application/shared_components/user_interface/lovs/lov_wfm0010_class
begin
--   Manifest
--     LOV_WFM0010_CLASS
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
 p_id=>wwv_flow_imp.id(6620307740819257070)
,p_lov_name=>'LOV_WFM0010_CLASS'
,p_static_id=>'lov-wfm0010-class'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT class_desc1,',
'       class_id       ',
'  FROM classes',
' WHERE class_bu  = :GLOBAL_bu'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'CLASS_ID'
,p_display_column_name=>'CLASS_DESC1'
,p_default_sort_column_name=>'CLASS_DESC1'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6620313214169260557)
,p_query_column_name=>'CLASS_DESC1'
,p_heading=>'Description'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(6620312810609260557)
,p_query_column_name=>'CLASS_ID'
,p_heading=>'Class ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
