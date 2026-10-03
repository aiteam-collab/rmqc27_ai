prompt --application/shared_components/user_interface/lovs/lov_header_sys0015_1
begin
--   Manifest
--     LOV_HEADER(SYS0015)1
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
 p_id=>wwv_flow_imp.id(7117304905598688757)
,p_lov_name=>'LOV_HEADER(SYS0015)1'
,p_static_id=>'lov-header-sys-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  SAHC_BASE_ID,SAHC_HEADER_ID,SAHC_HEADER_NAME ',
'FROM  SMS_API_HEADER_CONFIG'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SAHC_HEADER_ID'
,p_display_column_name=>'SAHC_HEADER_NAME'
,p_default_sort_column_name=>'SAHC_HEADER_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'1'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7117305722698688763)
,p_query_column_name=>'SAHC_BASE_ID'
,p_heading=>'Sahc Base Id'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7117306078604688763)
,p_query_column_name=>'SAHC_HEADER_ID'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(7117305321116688762)
,p_query_column_name=>'SAHC_HEADER_NAME'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
